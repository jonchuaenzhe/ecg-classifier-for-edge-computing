`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2022 17:50:18
// Design Name: 
// Module Name: Data_RAM
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


module Data_RAM
    #(
        parameter Bit_width = 8, // the number of bits for each number
        parameter Nr_depth = 512, // the number of datasets
        parameter Depth_counter_bits = 9 // 2 ** this value equals to Nr_depth
    )

    (
        // Input 
        input Clk,
        input Write_en,
        input Read_en,
        input [Depth_counter_bits - 1 : 0] Address_depth_read,
        input [Depth_counter_bits - 1 : 0] Address_depth_write,
        input [Bit_width - 1 : 0] Write_data_in,

        // Output
        output reg [Bit_width - 1 : 0] Read_data_out_0,
        output reg [Bit_width - 1 : 0] Read_data_out_1,
        output reg [Bit_width - 1 : 0] Read_data_out_2,
        output reg [Bit_width - 1 : 0] Read_data_out_3,
        output reg [Bit_width - 1 : 0] Read_data_out_4
    );

    // RAM reg creation
    reg [Bit_width - 1 : 0] RAM [0 : Nr_depth - 1];

    // Retrive and write to RAM
    always @ (negedge Clk) begin
        if (Write_en) begin
            RAM[Address_depth_write] <= Write_data_in;
        end

        if (Read_en) begin
            Read_data_out_0 <= (Address_depth_read < 2) ? 0 : RAM[Address_depth_read - 2];
            Read_data_out_1 <= (Address_depth_read < 1) ? 0 : RAM[Address_depth_read - 1];
            Read_data_out_2 <= RAM[Address_depth_read];
            Read_data_out_3 <= (Address_depth_read == 511) ? 0 : RAM[Address_depth_read + 1];
            Read_data_out_4 <= (Address_depth_read >= 510) ? 0 : RAM[Address_depth_read + 2];
        end
    end
endmodule
