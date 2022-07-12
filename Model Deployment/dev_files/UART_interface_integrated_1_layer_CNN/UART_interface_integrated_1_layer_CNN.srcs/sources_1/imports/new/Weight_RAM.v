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


module Weight_RAM
    #(
        parameter Bit_width = 8, // the number of bits for each number
        parameter Nr_depth = 8, // the number of filters
        parameter Depth_counter_bits = 3, // 2 ** this value equals to Nr_depth
        parameter Nr_feature = 6, // Number of weights + bias inside each filter
        parameter Feature_counter_bits = 3 // 2 ** this value >= Nr_feature
    )

    (
        // Input
        input Clk,
        // input Write_en,
        input Read_en,
        input [Depth_counter_bits - 1 : 0] Address_depth_read,
        // input [Feature_counter_bits - 1 : 0] Address_depth_write,
        // input [Feature_counter_bits - 1 : 0] Address_width_write,
        // input [Bit_width - 1 : 0] Write_data_in,

        // Output
        output reg [Bit_width - 1 : 0] Read_data_out_0,
        output reg [Bit_width - 1 : 0] Read_data_out_1,
        output reg [Bit_width - 1 : 0] Read_data_out_2,
        output reg [Bit_width - 1 : 0] Read_data_out_3,
        output reg [Bit_width - 1 : 0] Read_data_out_4,
        output reg [Bit_width - 1 : 0] Read_data_out_5
    );

    // RAM reg creation
    reg [Bit_width - 1 : 0] RAM_0 [0 : Nr_depth - 1];
    reg [Bit_width - 1 : 0] RAM_1 [0 : Nr_depth - 1];
    reg [Bit_width - 1 : 0] RAM_2 [0 : Nr_depth - 1];
    reg [Bit_width - 1 : 0] RAM_3 [0 : Nr_depth - 1];
    reg [Bit_width - 1 : 0] RAM_4 [0 : Nr_depth - 1];
    reg [Bit_width - 1 : 0] RAM_5 [0 : Nr_depth - 1];


    initial begin
        // RAM 0
        RAM_0[0] = 16'd10;
        RAM_0[1] = 16'd49;
        RAM_0[2] = 16'd51;
        RAM_0[3] = 16'd53;
        RAM_0[4] = 16'd62;
        RAM_0[5] = -16'd1;
        RAM_0[6] = 16'd35;
        RAM_0[7] = -16'd77;

        // RAM 1
        RAM_1[0] = -16'd87;
        RAM_1[1] = -16'd44;
        RAM_1[2] = 16'd28;
        RAM_1[3] = 16'd170;
        RAM_1[4] = -16'd16;
        RAM_1[5] = -16'd77;
        RAM_1[6] = 16'd49;
        RAM_1[7] = -16'd57;

        // RAM 2
        RAM_2[0] = 16'd16;
        RAM_2[1] = -16'd52;
        RAM_2[2] = 16'd22;
        RAM_2[3] = 16'd118;
        RAM_2[4] = -16'd6;
        RAM_2[5] = -16'd39;
        RAM_2[6] = 16'd3;
        RAM_2[7] = -16'd56;

        // RAM 3
        RAM_3[0] = -16'd40;
        RAM_3[1] = -16'd63;
        RAM_3[2] = -16'd12;
        RAM_3[3] = 16'd11;
        RAM_3[4] = 16'd17;
        RAM_3[5] = 16'd3;
        RAM_3[6] = -16'd15;
        RAM_3[7] = -16'd45;

        // RAM 4
        RAM_4[0] = 16'd104;
        RAM_4[1] = -16'd53;
        RAM_4[2] = -16'd45;
        RAM_4[3] = -16'd91;
        RAM_4[4] = 16'd54;
        RAM_4[5] = 16'd15;
        RAM_4[6] = 16'd45;
        RAM_4[7] = 16'd36;

        // RAM 5
        RAM_5[0] = -16'd78;
        RAM_5[1] = -16'd53;
        RAM_5[2] = -16'd75;
        RAM_5[3] = -16'd87;
        RAM_5[4] = 16'd78;
        RAM_5[5] = 16'd57;
        RAM_5[6] = -16'd45;
        RAM_5[7] = 16'd116;
    end

    // Retrive and write to RAM
    always @ (negedge Clk) begin
        // if (Write_en) begin
        //     case(Address_width_write)
        //         3'b000: RAM_0[Address_depth_write] <= Write_data_in;
        //         3'b001: RAM_1[Address_depth_write] <= Write_data_in;
        //         3'b010: RAM_2[Address_depth_write] <= Write_data_in;
        //         3'b011: RAM_3[Address_depth_write] <= Write_data_in;
        //         3'b100: RAM_4[Address_depth_write] <= Write_data_in;
        //         3'b101: RAM_5[Address_depth_write] <= Write_data_in;

        //         default: // do nothing which is all value equal back itself
        //             begin
        //                 RAM_0[Address_depth_write] <= RAM_0[Address_depth_write];
        //                 RAM_1[Address_depth_write] <= RAM_1[Address_depth_write];
        //                 RAM_2[Address_depth_write] <= RAM_2[Address_depth_write];
        //                 RAM_3[Address_depth_write] <= RAM_3[Address_depth_write];
        //                 RAM_4[Address_depth_write] <= RAM_4[Address_depth_write];
        //                 RAM_5[Address_depth_write] <= RAM_5[Address_depth_write];
        //             end
        //     endcase 
        // end

        if (Read_en) begin
            Read_data_out_0 <= RAM_0[Address_depth_read];
            Read_data_out_1 <= RAM_1[Address_depth_read];
            Read_data_out_2 <= RAM_2[Address_depth_read];
            Read_data_out_3 <= RAM_3[Address_depth_read];
            Read_data_out_4 <= RAM_4[Address_depth_read];
            Read_data_out_5 <= RAM_5[Address_depth_read];
        end
    end
endmodule
