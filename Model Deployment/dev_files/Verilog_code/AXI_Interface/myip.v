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
    ACLK,
    ARESETN,
    S_AXIS_TREADY,
    S_AXIS_TDATA,
    S_AXIS_TLAST,
    S_AXIS_TVALID,
    M_AXIS_TVALID,
    M_AXIS_TDATA,
    M_AXIS_TLAST,
    M_AXIS_TREADY
    );

    /******************* Module IO ********************************/
    input                          ACLK;    // Synchronous clock
    input                          ARESETN; // System reset, active low
    // slave in interface
    output                         S_AXIS_TREADY;  // Ready to accept data in
    input      [15 : 0]            S_AXIS_TDATA;   // Data in
    input                          S_AXIS_TLAST;   // Optional data in qualifier
    input                          S_AXIS_TVALID;  // Data in is valid
    // master out interface
    output                         M_AXIS_TVALID;  // Data out is valid
    // output     [31 : 0]            M_AXIS_TDATA;   // Data Out
    output     [15 : 0]            M_AXIS_TDATA;   // Data Out
    output                         M_AXIS_TLAST;   // Optional data out qualifier
    input                          M_AXIS_TREADY;  // Connected slave device is ready to accept data out

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
    localparam Idle  = 4'b1000;
    localparam Read_Inputs = 4'b0100;
    localparam Compute = 4'b0010;		// currently unused, but needed for assignment 1
    localparam Write_Outputs  = 4'b0001;

    // Register declaration
    reg [3:0] state = 4'b1000; // initialise as 0

    // Counter to store the number of inputs read & outputs written
    reg [Data_depth_bits + 1:0] nr_of_reads;  
    reg [12:0] nr_of_writes;

    /******************* Wire Declaration ***********************/
    // Data RAM Related
    reg Data_write_en;
    wire Data_read_en;
    wire [Dataset_depth_counter_bits - 1 : 0] Data_read_address_depth; 
    reg [Dataset_depth_counter_bits - 1 : 0] Data_write_address_depth; 
    reg [Number_of_bits - 1 : 0] Data_write_data_in;

    wire [Number_of_bits - 1 : 0] Data_read_out_0;
    wire [Number_of_bits - 1 : 0] Data_read_out_1;
    wire [Number_of_bits - 1 : 0] Data_read_out_2;
    wire [Number_of_bits - 1 : 0] Data_read_out_3;
    wire [Number_of_bits - 1 : 0] Data_read_out_4;

    // Weight RAM Related
    // reg Weight_write_en;
    wire Weight_read_en;
    wire [Feature_counter_bits - 1 : 0] Weight_read_address_depth; 
    // reg [Feature_counter_bits - 1 : 0] Weight_write_address_depth;
    // reg [Feature_counter_bits - 1 : 0] Weight_write_address_width; 
    // reg [Number_of_bits - 1 : 0] Weight_write_data_in;
    
    wire [Number_of_bits - 1 : 0] Weight_read_out_0;
    wire [Number_of_bits - 1 : 0] Weight_read_out_1;
    wire [Number_of_bits - 1 : 0] Weight_read_out_2;
    wire [Number_of_bits - 1 : 0] Weight_read_out_3;
    wire [Number_of_bits - 1 : 0] Weight_read_out_4;
    wire [Number_of_bits - 1 : 0] Weight_read_out_5;

    // Result RAM Related
    wire RES_write_en;
    reg RES_read_en; 
    reg [Filter_counter_bits - 1 : 0] RES_read_address_depth; // need mux if we want to read in the Compute Processor module
    reg [Dataset_depth_counter_bits - 1 : 0] RES_read_address_width; 
    wire [Filter_counter_bits - 1 : 0] RES_write_address_depth;
    wire [Dataset_depth_counter_bits - 1 : 0] RES_write_address_width; 
    wire [Number_of_bits - 1 : 0] RES_write_data_in;

    wire [Number_of_bits - 1 : 0] RES_data_out_0;

    // Compute Process Related
    reg Compute_enable;
    wire Compute_Done;

    /*********************** Wire Declaration End ******************/

    /*********************** General Assignment Declaration ************/
    assign M_AXIS_TDATA = RES_data_out_0;

    assign S_AXIS_TREADY = (state == Read_Inputs);
    assign M_AXIS_TVALID = (state == Write_Outputs);
    assign M_AXIS_TLAST = (state == Write_Outputs) & (nr_of_writes == 0);

    /****************** State Machine *******************/

    always @ (posedge ACLK) begin
        
        /*************** Synchronous Reset (Active Low) ***************/
        if (!ARESETN) begin
            state <= Idle;
            nr_of_reads <= 0;
            nr_of_writes <= 0;
            RES_read_en <= 0;
            RES_read_address_depth <= 0;
            RES_read_address_width <= 0;

            Compute_enable <= 0;
        end else begin
            /*************** Actual State Machine *************/
            case (state)
                Idle:
                    begin
                        if (S_AXIS_TVALID == 1) begin // if input data is valid

                            state <= Read_Inputs;
                            nr_of_reads <= Total_number_of_input_words - 1;

                        end else begin
                             /************** General Reset ************/
                            // IO counter related
                            nr_of_writes <= 0;
                            nr_of_reads <= 0;
                        end

                        /************** General Reset *************/
                        // RES_RAM related
                        RES_read_en <= 0;
                        RES_read_address_depth <= 0;
                        RES_read_address_width <= 0;

                        // Data_RAM related
                        Data_write_address_depth <= 0;
                        Data_write_en <= 0;

                        // Weights_RAM related
                        // Weight_write_address_width <= 0;
                        // Weight_write_address_depth <= 0;
                        // Weight_write_en <= 0;

                        // Others
                        Compute_enable <= 0;
                    end     

                Read_Inputs:
                    begin
                        if (S_AXIS_TVALID == 1) begin // if the input data is valid
                            if (nr_of_reads == 0) begin
                                state <= Compute;
                                nr_of_writes <= Total_number_of_output_words - 1;
                            end else begin
                                nr_of_reads <= nr_of_reads - 1;
                            end     

                            Data_write_en <= 1;
                            Data_write_data_in <= S_AXIS_TDATA;

                            // Address increment for data
                            Data_write_address_depth <= Data_write_address_depth + Data_write_en;

                            // if (nr_of_reads >= Total_number_of_weights) begin // if we are reading data
                            //     Data_write_en <= 1;
                            //     Data_write_data_in <= S_AXIS_TDATA;

                            //     // Address increment for data
                            //     Data_write_address_depth <= Data_write_address_depth + Data_write_en;
                            // end else begin
                            //     Data_write_en <= 0;
                            // end

                            // if (nr_of_reads <= Total_number_of_weights - 1) begin // if we are reading weights
                            //     Weight_write_en <= 1;
                            //     Weight_write_data_in <= S_AXIS_TDATA;

                            //     // Address Increment for weights
                            //     if (Weight_write_address_width < 5) begin // Total 6 items in a single row
                            //         Weight_write_address_width <= Weight_write_address_width + Weight_write_en;
                            //     end else begin
                            //         Weight_write_address_width <= 0;
                            //     end

                            //     if (Weight_write_address_width == 5) begin
                            //         Weight_write_address_depth <= Weight_write_address_depth + Weight_write_en;
                            //     end
                            // end
                        end
                    end     
                Compute:
                    begin
                        // Reset previous control
                        // Weight_write_en = 0;
                        Data_write_en = 0;

                        // When done, change state to write_output
                        if (Compute_Done) begin
                            Compute_enable <= 0;
                            state <= Write_Outputs;

                            // Enable reading output
                            RES_read_en <= 1;
                        end else begin
                            // Enable Compute
                            Compute_enable <= 1;
                        end
                    end
                Write_Outputs:
                    begin
                        if (M_AXIS_TREADY) begin
                            nr_of_writes <= nr_of_writes - 1;

                            // Address increment
                            if (RES_read_address_width < 511) begin
                                RES_read_address_width <= RES_read_address_width + 1;
                            end else begin
                                RES_read_address_width <= 0;
                            end

                            if (RES_read_address_width == 511) begin
                                RES_read_address_depth <= RES_read_address_depth + 1;
                            end
                        end
                    end

            endcase
        end
    end

    /************** Module instantiation *******************/
    // Shape : Number of Dataset x 16 bits
    Data_RAM #(
            .Bit_width(Number_of_bits), 
            .Nr_depth(Number_of_dataset), 
            .Depth_counter_bits(Dataset_depth_counter_bits)
    ) Data_RAM (
            // Input
            .Clk(ACLK),
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
        .Clk(ACLK),
        // .Write_en(Weight_write_en),
        .Read_en(Weight_read_en),
        .Address_depth_read(Weight_read_address_depth),
        // .Address_depth_write(Weight_write_address_depth),
        // .Address_width_write(Weight_write_address_width),
        // .Write_data_in(Weight_write_data_in),

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
        .Clk(ACLK),
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
        .Clk(ACLK),
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

endmodule
