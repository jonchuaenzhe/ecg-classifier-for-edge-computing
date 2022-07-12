`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2022 14:30:44
// Design Name: 
// Module Name: UART_TB
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


module Testbench(

    );

    // Clock generation
    reg CLK = 0; // synchronous clk 

    // RAM declaration
    localparam width = 8;
    localparam Num_input_words = 3072;
    localparam Num_output_words = 32;
    reg [width - 1 : 0] input_mem [0 : 3071];
    reg [width - 1 : 0] output_mem [0 : Num_output_words - 1];

    // Memory Counter related
    integer word_cnt, packet_bit_counter;
    integer bit_ptr;

    // IO related
    wire uart_data_in;
    reg uart_data_out;

    myip wrapper(
        .sysclk(CLK),
        .uart_txd_in(uart_data_out),
        .uart_rxd_out(uart_data_in)
    );

    always
        #1 CLK = ~CLK;
        
        initial begin
            $display("Loading Memory");
            $readmemh("Input_mem.mem", input_mem);

            #80 // wait for 1 period so that it is easier to read on the waveform

            // Transmit data via uart one by one
            word_cnt = 0;  
            uart_data_out = 1; // hold the line high

            while (word_cnt < Num_input_words) begin
                packet_bit_counter = 0;

                // send start bit
                uart_data_out = 0;

                // wait for one cycle
                #2500;

                // iteratively send data bit by bit
                while (packet_bit_counter < 8) begin
                    uart_data_out = input_mem[word_cnt][packet_bit_counter];
                    packet_bit_counter = packet_bit_counter + 1;
                    #2500;
                end

                // send stop bit
                uart_data_out = 1;
                #2500;

                word_cnt = word_cnt + 1;
            end

            #40; // wait for half a cycle

            word_cnt = 0;
            // while (word_cnt < Num_output_words) begin
                

            //     output_mem[word_cnt] <= uart_data_out;
            // end
        end



endmodule
