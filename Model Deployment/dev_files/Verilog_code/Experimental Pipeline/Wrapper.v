`timescale 1ns / 1ps

module Wrapper(
    input sysclk,
    input uart_txd_in,
    output uart_rxd_out
    );

    localparam Bit_width = 16;

    /************* Wire declaration ***************/
    // Data RAM related
    wire [23:0] Data_Read_uCode;    
    reg [23:0] Data_Read_uCode_TX = 0;
    wire [23:0] Data_Read_uCode_Compute;

    wire [23:0] Data_Write_uCode_Compute;
    reg [23:0] Data_Write_uCode_RX_TX;
    wire [23:0] Data_Write_uCode;
    // wire [3:0] Global_MaxPool_State_Machine;
    
    wire [Bit_width - 1 : 0] Data_input_to_RAM;
    wire [Bit_width - 1 : 0] Data_input_to_RAM_RX;
    wire [Bit_width - 1 : 0] Data_input_to_RAM_Compute;
    wire [Bit_width - 1 : 0] Data_read_out_0;
    wire [Bit_width - 1 : 0] Data_read_out_1;
    wire [Bit_width - 1 : 0] Data_read_out_2;
    wire [Bit_width - 1 : 0] Data_read_out_3;
    wire [Bit_width - 1 : 0] Data_read_out_4;

    // Compute Process related
    reg Compute_Enable;
    wire Compute_Done;

    // Counter related
    localparam Total_number_of_input_words = 512;
    localparam Total_number_of_output_words = 1;
    reg [8:0] nr_of_reads = Total_number_of_input_words - 1;  
    reg [1:0] nr_of_writes;

    // UART related
    // TX
    // wire [15:0] TX_data_out;
    wire TX_IDLE;
    reg TX_Start;
    // RX
    wire [15:0] RX_received_data;
    wire RX_Done;
    wire TX_Done;


    // State machine declaration
    localparam RX = 3'b001;
    localparam Compute = 3'b010;
    localparam TX = 3'b100;
    reg [2:0] state_machine = Compute;

    reg [18:0] time_out_counter = 0;
    localparam timeout = 250000;
    reg delay_by_1_cycle = 0;

    // Assignments
    // assign TX_data_out = Data_input_to_RAM;
    assign Data_Write_uCode = (state_machine[0]) ? Data_Write_uCode_RX_TX : Data_Write_uCode_Compute;
    assign Data_input_to_RAM = (state_machine[0]) ? Data_input_to_RAM_RX : Data_input_to_RAM_Compute;

    assign Data_Read_uCode = (state_machine[2]) ? Data_Read_uCode_TX : Data_Read_uCode_Compute;

    /*********************** Wire Declaration End ******************/

    /***************** State Machine *************************/

    always @ (posedge sysclk) begin
        case (state_machine)
            RX:
                begin
                    if (RX_Done) begin
                        // Data Write uCode related
                        Data_Write_uCode_RX_TX[23:15] <= (delay_by_1_cycle) ? Data_Write_uCode_RX_TX[23:15] + 1 : 0; // Increment by 1
                        delay_by_1_cycle <= 1;
                        Data_Write_uCode_RX_TX[14:10] <= 0;
                        Data_Write_uCode_RX_TX[9:1] <= 9'b1000_0000_0;
                        Data_Write_uCode_RX_TX[0] <= 1;

                        // Number of reads keep decreasing
                        nr_of_reads <= (delay_by_1_cycle) ? nr_of_reads - 1 : nr_of_reads;
                        time_out_counter <= 0;
                    end else if (nr_of_reads == 0) begin
                        state_machine <= Compute;
                        Data_Write_uCode_RX_TX <= 0;
                    end else if (time_out_counter == timeout) begin
                        Data_Write_uCode_RX_TX <= 0; // reset
                        time_out_counter <= 0;
                    end else begin
                        Data_Write_uCode_RX_TX <= {Data_Write_uCode_RX_TX[23:1] , {1'b0}}; // Disable write
                        time_out_counter <= time_out_counter + 1;
                    end
                end

            Compute:
                begin
                    // When done, change state to write_output
                    if (Compute_Done) begin
                        state_machine <= TX;
                        nr_of_writes <= Total_number_of_output_words;
                        Compute_Enable <= 0;
                    end else begin
                        // Enable Compute
                        Compute_Enable <= 1;
                    end
                end

            TX:
                begin
                    if (nr_of_writes == 0 && TX_Done) begin
                        state_machine <= RX;
                        TX_Start <= 0;
                        nr_of_reads <= Total_number_of_input_words - 1;
                    end else if (TX_IDLE && TX_Start == 0) begin
                        // Send out data
                        TX_Start <= 1;
                        nr_of_writes <= 0;
                    end else begin
                        // nr_of_writes <= nr_of_writes - 1;
                        TX_Start <= 0;
                    end

                    // if (TX_IDLE && TX_Start == 0) begin
                    //     // send out data
                    //     TX_Start <= 1;
                    //     nr_of_writes <= 0;
                    // end else if (nr_of_writes == 0 && TX_IDLE) begin
                    //     state_machine <= RX;
                    //     TX_Start <= 0;
                    //     nr_of_reads <= Total_number_of_input_words - 1;
                    // end else begin
                    //     // nr_of_writes <= nr_of_writes - 1;
                    //     TX_Start <= 0;
                    // end
                end

        endcase
    end

    /************** Module instantiation *******************/

    Compute_Processor Compute_Processor (
        // Input
        .Clk(sysclk),
        .Enable(Compute_Enable),

        // Data Input
        .Data_read_out_0(Data_read_out_0),
        .Data_read_out_1(Data_read_out_1),
        .Data_read_out_2(Data_read_out_2),
        .Data_read_out_3(Data_read_out_3),
        .Data_read_out_4(Data_read_out_4),

        // Output
        .Data_Read_Control(Data_Read_uCode_Compute),
        .Data_Write_Control(Data_Write_uCode_Compute),
        .Data_Write(Data_input_to_RAM_Compute),
        .Compute_Done(Compute_Done)
        // .Height(Global_MaxPool_State_Machine)
    );

    Data_RAM Data_RAM (
        // Input
        .Clk(sysclk),
        .Data_Read_uCode(Data_Read_uCode),
        .Data_Write_uCode(Data_Write_uCode),
        .Data_in(Data_input_to_RAM),
        // .Global_MaxPool_State_Machine(Global_MaxPool_State_Machine),

        // Output
        .Read_data_out_0(Data_read_out_0),
        .Read_data_out_1(Data_read_out_1),
        .Read_data_out_2(Data_read_out_2),
        .Read_data_out_3(Data_read_out_3),
        .Read_data_out_4(Data_read_out_4)
    );

    UART_TX_Flow_ctrl UART_TX_Controller(
        .Clk(sysclk),
        .data_to_be_sent(Data_read_out_0),
        .i_Tx_start(TX_Start),
        .o_Tx_Serial(uart_rxd_out),
        .TX_IDLE(TX_IDLE),
        .TX_Done(TX_Done)
    );

    UART_RX_Flow_ctrl UART_RX_Controller (
        .Clk(sysclk),
        .i_Rx_Serial(uart_txd_in),
        .Valid_num(RX_Done),
        .Data_out(Data_input_to_RAM_RX)
    );
endmodule
