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


module RES_RAM
    #(
        parameter Bit_width = 8, // the number of bits for each number
        parameter Nr_depth = 8, // the number of filters
        parameter Depth_counter_bits = 3, // 2 ** this value equals to Nr_depth
        parameter data_set_count = 512, // the number of dataset
        parameter Feature_counter_bits = 9 // 2 ** this value equals to Nr_feature
    )

    (
        // Input
        input Clk,
        input Write_en,
        input Read_en,
        input [Depth_counter_bits - 1 : 0] Address_depth_read,
        input [Feature_counter_bits - 1 : 0] Address_width_read,
        input [Depth_counter_bits - 1 : 0] Address_depth_write,
        input [Feature_counter_bits - 1 : 0] Address_width_write,
        input [Bit_width - 1 : 0] Write_data_in,

        // Output
        output reg [Bit_width - 1 : 0] Read_data_out_0
    );

    // RAM reg creation // 8 filters, so 8 RAMs
    reg [Bit_width - 1 : 0] RAM_0 [0 : data_set_count - 1];
    reg [Bit_width - 1 : 0] RAM_1 [0 : data_set_count - 1];
    reg [Bit_width - 1 : 0] RAM_2 [0 : data_set_count - 1];
    reg [Bit_width - 1 : 0] RAM_3 [0 : data_set_count - 1];
    reg [Bit_width - 1 : 0] RAM_4 [0 : data_set_count - 1];
    reg [Bit_width - 1 : 0] RAM_5 [0 : data_set_count - 1];
    reg [Bit_width - 1 : 0] RAM_6 [0 : data_set_count - 1];
    reg [Bit_width - 1 : 0] RAM_7 [0 : data_set_count - 1];

    // Retrive and write to RAM
    always @ (negedge Clk) begin
        if (Write_en) begin
            case (Address_depth_write)
                3'b000: RAM_0[Address_width_write] <= Write_data_in;
                3'b001: RAM_1[Address_width_write] <= Write_data_in;
                3'b010: RAM_2[Address_width_write] <= Write_data_in;
                3'b011: RAM_3[Address_width_write] <= Write_data_in;
                3'b100: RAM_4[Address_width_write] <= Write_data_in;
                3'b101: RAM_5[Address_width_write] <= Write_data_in;
                3'b110: RAM_6[Address_width_write] <= Write_data_in;
                3'b111: RAM_7[Address_width_write] <= Write_data_in;
            endcase
        end

        if (Read_en) begin
            case (Address_depth_read)
                3'b000: Read_data_out_0 <= RAM_0[Address_width_read];
                3'b001: Read_data_out_0 <= RAM_1[Address_width_read];
                3'b010: Read_data_out_0 <= RAM_2[Address_width_read];
                3'b011: Read_data_out_0 <= RAM_3[Address_width_read];
                3'b100: Read_data_out_0 <= RAM_4[Address_width_read];
                3'b101: Read_data_out_0 <= RAM_5[Address_width_read];
                3'b110: Read_data_out_0 <= RAM_6[Address_width_read];
                3'b111: Read_data_out_0 <= RAM_7[Address_width_read];
            endcase
        end
    end
endmodule
