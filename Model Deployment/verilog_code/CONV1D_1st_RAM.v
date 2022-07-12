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

module CONV1D_1st_RAM
    #(
        Bit_width = 16,
        RAM_Depth = 8
    )
    (
        // Input
        input CLK,
        input Enable,
        input [4:0] Depth,

        // Output
        output reg signed [Bit_width - 1 : 0] data_out_0,
        output reg signed [Bit_width - 1 : 0] data_out_1,
        output reg signed [Bit_width - 1 : 0] data_out_2,
        output reg signed [Bit_width - 1 : 0] data_out_3,
        output reg signed [Bit_width - 1 : 0] data_out_4,
        output reg signed [Bit_width - 1 : 0] data_out_5
    );

    // RAM reg creation
    (* ROM_STYLE="BLOCK"*) reg signed [Bit_width - 1 : 0] RAM_0 [0 : RAM_Depth - 1];
    (* ROM_STYLE="BLOCK"*) reg signed [Bit_width - 1 : 0] RAM_1 [0 : RAM_Depth - 1];
    (* ROM_STYLE="BLOCK"*) reg signed [Bit_width - 1 : 0] RAM_2 [0 : RAM_Depth - 1];
    (* ROM_STYLE="BLOCK"*) reg signed [Bit_width - 1 : 0] RAM_3 [0 : RAM_Depth - 1];
    (* ROM_STYLE="BLOCK"*) reg signed [Bit_width - 1 : 0] RAM_4 [0 : RAM_Depth - 1];
    (* ROM_STYLE="BLOCK"*) reg signed [Bit_width - 1 : 0] RAM_5 [0 : RAM_Depth - 1];

    always @ (negedge CLK) begin
        if (Enable) begin
            data_out_0 <= RAM_0[Depth];
            data_out_1 <= RAM_1[Depth];
            data_out_2 <= RAM_2[Depth];
            data_out_3 <= RAM_3[Depth];
            data_out_4 <= RAM_4[Depth];
            data_out_5 <= RAM_5[Depth];
        end else begin
            data_out_0 <= 0;
            data_out_1 <= 0;
            data_out_2 <= 0;
            data_out_3 <= 0;
            data_out_4 <= 0;
            data_out_5 <= 0;
        end
    end

    // Initialise the RAM
    initial begin
        RAM_0[0] = 16'd22;
        RAM_1[0] = -16'd31;
        RAM_2[0] = -16'd1;
        RAM_3[0] = 16'd36;
        RAM_4[0] = 16'd62;
        RAM_5[0] = 16'd47;
        RAM_0[1] = 16'd20;
        RAM_1[1] = 16'd20;
        RAM_2[1] = -16'd10;
        RAM_3[1] = 16'd13;
        RAM_4[1] = -16'd72;
        RAM_5[1] = 16'd70;
        RAM_0[2] = 16'd80;
        RAM_1[2] = 16'd79;
        RAM_2[2] = 16'd43;
        RAM_3[2] = 16'd38;
        RAM_4[2] = 16'd41;
        RAM_5[2] = -16'd63;
        RAM_0[3] = 16'd45;
        RAM_1[3] = 16'd12;
        RAM_2[3] = -16'd21;
        RAM_3[3] = -16'd31;
        RAM_4[3] = 16'd40;
        RAM_5[3] = 16'd82;
        RAM_0[4] = 16'd22;
        RAM_1[4] = -16'd5;
        RAM_2[4] = -16'd40;
        RAM_3[4] = -16'd16;
        RAM_4[4] = -16'd15;
        RAM_5[4] = 16'd97;
        RAM_0[5] = 16'd13;
        RAM_1[5] = -16'd82;
        RAM_2[5] = 16'd89;
        RAM_3[5] = -16'd2;
        RAM_4[5] = -16'd15;
        RAM_5[5] = 16'd14;
        RAM_0[6] = -16'd14;
        RAM_1[6] = 16'd114;
        RAM_2[6] = 16'd65;
        RAM_3[6] = -16'd17;
        RAM_4[6] = -16'd86;
        RAM_5[6] = -16'd74;
        RAM_0[7] = 16'd6;
        RAM_1[7] = -16'd72;
        RAM_2[7] = -16'd44;
        RAM_3[7] = 16'd2;
        RAM_4[7] = 16'd27;
        RAM_5[7] = 16'd32;

    end

endmodule