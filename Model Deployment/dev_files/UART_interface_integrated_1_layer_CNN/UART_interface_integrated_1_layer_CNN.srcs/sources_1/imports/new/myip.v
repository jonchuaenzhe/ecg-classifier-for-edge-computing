`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2022 15:34:38
// Design Name: 
// Module Name: myip
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module myip(
    // ACLK,
    // ARESETN, // tie to a button

    // S_AXIS_TREADY,
    // S_AXIS_TDATA,
    // S_AXIS_TLAST,
    // S_AXIS_TVALID,
    // M_AXIS_TVALID,
    // M_AXIS_TDATA,
    // M_AXIS_TLAST,
    // M_AXIS_TREADY

    input sysclk,
    input uart_txd_in,
    output uart_rxd_out
    );

    /******************* Module IO ********************************/
    // input                          ACLK;    // Synchronous clock
    // input                          ARESETN; // System reset, active low
    // slave in interface
    // output                         S_AXIS_TREADY;  // Ready to accept data in
    // input      [15 : 0]            S_AXIS_TDATA;   // Data in
    // input                          S_AXIS_TLAST;   // Optional data in qualifier
    // input                          S_AXIS_TVALID;  // Data in is valid
    // // master out interface
    // output                         M_AXIS_TVALID;  // Data out is valid
    // // output     [31 : 0]            M_AXIS_TDATA;   // Data Out
    // output     [15 : 0]            M_AXIS_TDATA;   // Data Out
    // output                         M_AXIS_TLAST;   // Optional data out qualifier
    // input                          M_AXIS_TREADY;  // Connected slave device is ready to accept data out

    /******************** Actual Code ***************************/
    
    // RAM parameters
    localparam Number_of_dataset = 512; // Number of datasets that we have
    localparam Dataset_depth_counter_bits = 9; // 2 ** this number >= Number of dataset
    localparam Number_of_bits = 16; // Number of bits per data
    
    localparam Number_of_features = 6; // Number of weights + bias per filter (bias is also bit_0)
    localparam Feature_counter_bits = 3; // 2 ** this number >= Number of features

    localparam Number_of_filters = 8; // Number of filters that we have for the weights
    localparam Filter_counter_bits = 3; // 2 ** this number >= Number_of_filters 

    localparam Data_depth_bits = 9; // Used for counters --> 9 because we have 512 data points and 2**9 = 512
    localparam weights_depth_bits = 5; // used for counters --> 5 becuase we have 19 data points and 2 ** 5 = 32 which is > 19
    localparam Number_of_weights_depth = 3;

    // Overall IO parameters
    localparam Total_number_of_input_words = 512; // need adjustment whenever neceessary
    localparam Total_number_of_weights = 48;
    localparam Total_number_of_output_words = 4096;

    // Define the states of state machine (one hot encoding)
    // localparam Idle  = 4'b1000;
    // localparam Read_Inputs = 4'b0100;
    // localparam Compute = 4'b0010;		// currently unused, but needed for assignment 1
    // localparam Write_Outputs  = 4'b0001;

    // Register declaration
    // reg [3:0] state = 4'b1000; // initialise as 0

    // Counter to store the number of inputs read & outputs written
    reg [Data_depth_bits + 1:0] nr_of_reads = Total_number_of_input_words;  
    reg [12:0] nr_of_writes;

    /******************* Wire Declaration ***********************/
    // Data RAM Related
    reg Data_write_en = 0;
    wire Data_read_en;
    wire [Dataset_depth_counter_bits - 1 : 0] Data_read_address_depth; 
    reg [Dataset_depth_counter_bits - 1 : 0] Data_write_address_depth = 0; 
    reg [Dataset_depth_counter_bits - 1: 0] Data_write_address_counter = 0;
    reg [Number_of_bits - 1 : 0] Data_write_data_in;

    wire [Number_of_bits - 1 : 0] Data_read_out_0;
    wire [Number_of_bits - 1 : 0] Data_read_out_1;
    wire [Number_of_bits - 1 : 0] Data_read_out_2;
    wire [Number_of_bits - 1 : 0] Data_read_out_3;
    wire [Number_of_bits - 1 : 0] Data_read_out_4;

    // Weight RAM Related
    wire Weight_read_en;
    wire [Feature_counter_bits - 1 : 0] Weight_read_address_depth; 
    
    wire [Number_of_bits - 1 : 0] Weight_read_out_0;
    wire [Number_of_bits - 1 : 0] Weight_read_out_1;
    wire [Number_of_bits - 1 : 0] Weight_read_out_2;
    wire [Number_of_bits - 1 : 0] Weight_read_out_3;
    wire [Number_of_bits - 1 : 0] Weight_read_out_4;
    wire [Number_of_bits - 1 : 0] Weight_read_out_5;

    // Result RAM Related
    wire RES_write_en;
    reg RES_read_en = 0; 
    reg [Filter_counter_bits - 1 : 0] RES_read_address_depth = 0; // need mux if we want to read in the Compute Processor module
    reg [Dataset_depth_counter_bits - 1 : 0] RES_read_address_width = 0; 
    reg [Dataset_depth_counter_bits - 1 : 0] RES_read_address_width_next = 0;
    wire [Filter_counter_bits - 1 : 0] RES_write_address_depth;
    wire [Dataset_depth_counter_bits - 1 : 0] RES_write_address_width; 
    wire [Number_of_bits - 1 : 0] RES_write_data_in;

    wire [Number_of_bits - 1 : 0] RES_data_out_0;

    // Compute Process Related
    reg Compute_enable;
    wire Compute_Done;

    // UART related
    // TX
    wire [15:0] TX_data_out;
    wire TX_IDLE;
    reg TX_Start;
    // RX
    wire [15:0] RX_received_data;
    wire RX_Done;

    assign TX_data_out = RES_data_out_0;

    /*********************** Wire Declaration End ******************/

    /*********************** General Assignment Declaration ************/
    // assign M_AXIS_TDATA = RES_data_out_0;

    // assign S_AXIS_TREADY = (state == Read_Inputs);
    // assign M_AXIS_TVALID = (state == Write_Outputs);
    // assign M_AXIS_TLAST = (state == Write_Outputs) & (nr_of_writes == 0);

    /***************** State Machine *************************/

    localparam RX = 3'b001;
    localparam Compute = 3'b010;
    localparam TX = 3'b100;
    reg [2:0] state_machine = 3'b001;

    reg [13:0] time_out_counter = 0;
    localparam timeout = 12500;

    always @ (posedge sysclk) begin
        case (state_machine)
            RX:
                begin
                    if (RX_Done && Data_write_address_depth <= Total_number_of_input_words - 1) begin
                        Data_write_en <= 1;
                        Data_write_data_in <= RX_received_data;
                        Data_write_address_counter <= Data_write_address_counter + 1;
                        time_out_counter <= 0; // reset the timeout counter when we receive something
                        nr_of_reads <= nr_of_reads - 1;
                    end else if (nr_of_reads == 0) begin
                        state_machine <= Compute;
                        Data_write_en <= 0;
                    end else if (time_out_counter == timeout) begin
                        Data_write_address_depth <= 0;
                        time_out_counter <= 0;
                    end else begin
                        Data_write_en = 0;
                        time_out_counter <= time_out_counter + 1;
                        Data_write_address_depth <= Data_write_address_counter;
                    end

                    // time_out_counter <= time_out_counter + 1;
                end

            Compute:
                begin
                    // When done, change state to write_output
                    if (Compute_Done) begin
                        Compute_enable <= 0;
                        state_machine <= TX;
                        nr_of_writes <= Total_number_of_output_words;
                        RES_read_address_width <= 0;
                        RES_read_address_depth <= 0;
                        RES_read_address_width_next <= 0;
                        // TX_Start <= 1;
                        // RES_read_en <= 1;
                    end else begin
                        // Enable Compute
                        Compute_enable <= 1;
                    end
                end

            TX:
                begin
                    // Enable reading output
                    RES_read_en <= 1;

                    if (TX_IDLE && nr_of_writes > 0 && TX_Start == 0) begin
                        nr_of_writes <= nr_of_writes - 1;

                        // send out data
                        // TX_data_out <= RES_data_out_0;
                        TX_Start <= 1;


                        // Address increment
                        // if (RES_read_address_width < 511) begin
                            RES_read_address_width_next <= RES_read_address_width_next + 1;
                            RES_read_address_width <= RES_read_address_width_next;
                        // end else begin
                        //     RES_read_address_width <= 0;
                        //     RES_read_address_width_next <= 0;
                        // end

                        if (RES_read_address_width == 511) begin
                            RES_read_address_depth <= RES_read_address_depth + 1;
                        end
                    end else if (nr_of_writes == 0) begin
                        state_machine <= RX;
                        TX_Start <= 0;
                        nr_of_reads <= Total_number_of_input_words;
                    end else begin
                        TX_Start <= 0;
                    end
                end

        endcase
    end

    /************** Module instantiation *******************/
    // Shape : Number of Dataset x 16 bits
    Data_RAM #(
            .Bit_width(Number_of_bits), 
            .Nr_depth(Number_of_dataset), 
            .Depth_counter_bits(Dataset_depth_counter_bits)
    ) Data_RAM (
            // Input
            .Clk(sysclk),
            .Write_en(Data_write_en),
            .Read_en(Data_read_en),
            .Address_depth_read(Data_read_address_depth),
            .Address_depth_write(Data_write_address_depth),
            .Write_data_in(Data_write_data_in),

            // Output
            .Read_data_out_0(Data_read_out_0),
            .Read_data_out_1(Data_read_out_1),
            .Read_data_out_2(Data_read_out_2),
            .Read_data_out_3(Data_read_out_3),
            .Read_data_out_4(Data_read_out_4)
        );
    
    // Shape : Number of filter x Number of Weights + bias x 16 bitss
    Weight_RAM #(
        .Bit_width(Number_of_bits),
        .Nr_depth(Number_of_filters),
        .Depth_counter_bits(Filter_counter_bits),
        .Nr_feature(Number_of_features),
        .Feature_counter_bits(Feature_counter_bits)
    ) Weight_RAM (
        // Input 
        .Clk(sysclk),
        .Read_en(Weight_read_en),
        .Address_depth_read(Weight_read_address_depth),

        // Output
        .Read_data_out_0(Weight_read_out_0),
        .Read_data_out_1(Weight_read_out_1),
        .Read_data_out_2(Weight_read_out_2),
        .Read_data_out_3(Weight_read_out_3),
        .Read_data_out_4(Weight_read_out_4),
        .Read_data_out_5(Weight_read_out_5)
    );

    // Shape : Number of filter x Number of Dataset x 16 bits
    RES_RAM #(
        .Bit_width(Number_of_bits),
        .Nr_depth(Number_of_filters),
        .Depth_counter_bits(Filter_counter_bits),
        .data_set_count(Number_of_dataset),
        .Feature_counter_bits(Dataset_depth_counter_bits)
    ) RES_RAM (
        // Input
        .Clk(sysclk),
        .Write_en(RES_write_en),
        .Read_en(RES_read_en),
        .Address_depth_read(RES_read_address_depth),
        .Address_width_read(RES_read_address_width),
        .Address_depth_write(RES_write_address_depth),
        .Address_width_write(RES_write_address_width),
        .Write_data_in(RES_write_data_in),

        // Output
        .Read_data_out_0(RES_data_out_0)
    );

    Compute_Processor #(
        .Bit_width(Number_of_bits), 
        .Dataset_depth_counter_bits(Dataset_depth_counter_bits), 
        .Filter_counter_bits(Filter_counter_bits)
    ) Compute_Processor (
        // Input
        .Clk(sysclk),
        .Enable(Compute_enable),
        
        // Data
        .Data_read_out_0(Data_read_out_0),
        .Data_read_out_1(Data_read_out_1),
        .Data_read_out_2(Data_read_out_2),
        .Data_read_out_3(Data_read_out_3),
        .Data_read_out_4(Data_read_out_4),

        // Weights
        .Weight_read_out_0(Weight_read_out_0),
        .Weight_read_out_1(Weight_read_out_1),
        .Weight_read_out_2(Weight_read_out_2),
        .Weight_read_out_3(Weight_read_out_3),
        .Weight_read_out_4(Weight_read_out_4),
        .Weight_read_out_5(Weight_read_out_5),

        // Address & RAM Enable for Data
        .Data_RAM_address(Data_read_address_depth),
        .Data_RAM_Read_Enable_Reg(Data_read_en),

        // Address & RAM Enable for Weights
        .Weights_RAM_address_depth(Weight_read_address_depth),
        .Weights_RAM_Read_Enable_Reg(Weight_read_en),

        // Address & RAM Enable for Result
        .Result_RAM_write_address_depth(RES_write_address_depth),
        .Result_RAM_write_address_width(RES_write_address_width),
        .Result_RAM_write_M(RES_write_en),
        .Result_RAM_write_data(RES_write_data_in),

        // Others
        .Done_M(Compute_Done)
    );

    UART_TX_Flow_ctrl UART_TX_Controller(
        .Clk(sysclk),
        .data_to_be_sent(TX_data_out),
        .i_Tx_start(TX_Start),
        .o_Tx_Serial(uart_rxd_out),
        .TX_IDLE(TX_IDLE)
    );

    UART_RX_Flow_ctrl UART_RX_Controller (
        .Clk(sysclk),
        .i_Rx_Serial(uart_txd_in),
        .Valid_num(RX_Done),
        .Data_out(RX_received_data)
    );

endmodule
