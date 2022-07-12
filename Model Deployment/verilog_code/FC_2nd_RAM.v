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

module FC_2nd_RAM
    #(
        Bit_width = 16,
        RAM_Depth = 10
    )
    (
        // Input
        input CLK,
        input Enable,
        input [3:0] Width,

        // Output
        output reg [Bit_width - 1 : 0] data_out_0,
        output reg [Bit_width - 1 : 0] data_out_1,
        output reg [Bit_width - 1 : 0] data_out_2,
        output reg [Bit_width - 1 : 0] data_out_3,
        output reg [Bit_width - 1 : 0] data_out_4,
        output reg [Bit_width - 1 : 0] data_out_5
    );

    // RAM reg creation
    (* ROM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_0;
    (* ROM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_1 [0 : RAM_Depth - 1];
    (* ROM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_2 [0 : RAM_Depth - 1];
    (* ROM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_3 [0 : RAM_Depth - 1];
    (* ROM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_4 [0 : RAM_Depth - 1];
    (* ROM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_5 [0 : RAM_Depth - 1];

    always @ (negedge CLK) begin // all zero at the moment
        if (Enable) begin
            data_out_0 = RAM_0; // bias
            data_out_1 = RAM_1[Width];
            data_out_2 = RAM_2[Width];
            data_out_3 = RAM_3[Width];
            data_out_4 = RAM_4[Width];
            data_out_5 = RAM_5[Width];
        end else begin
            data_out_0 <= 0;
            data_out_1 <= 0;
            data_out_2 <= 0;
            data_out_3 <= 0;
            data_out_4 <= 0;
            data_out_5 <= 0;
        end
    end

    // initialise the RAM
    initial begin
        RAM_0 = 16'd29;
        RAM_1[0] = -16'd316;
        RAM_2[0] = 16'd267;
        RAM_3[0] = 16'd259;
        RAM_4[0] = 16'd176;
        RAM_5[0] = -16'd372;
        RAM_1[1] = 16'd267;
        RAM_2[1] = -16'd380;
        RAM_3[1] = -16'd364;
        RAM_4[1] = 16'd190;
        RAM_5[1] = -16'd396;
        RAM_1[2] = -16'd359;
        RAM_2[2] = 16'd217;
        RAM_3[2] = 16'd195;
        RAM_4[2] = 16'd266;
        RAM_5[2] = -16'd351;
        RAM_1[3] = -16'd297;
        RAM_2[3] = 16'd0;
        RAM_3[3] = 16'd0;
        RAM_4[3] = 16'd0;
        RAM_5[3] = 16'd0;
    end

endmodule