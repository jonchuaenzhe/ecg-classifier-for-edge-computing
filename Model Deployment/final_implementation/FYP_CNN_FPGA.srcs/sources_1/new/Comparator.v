`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/26 22:01:30
// Design Name: 
// Module Name: Comparator
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

module Comparator
    #(
        parameter Bit_width = 32
    )
    (
        // Input
        input signed [Bit_width - 1 : 0] Input_0,
        input signed [Bit_width - 1 : 0] Input_1,
        input signed [Bit_width - 1 : 0] Input_2,
        input signed [Bit_width - 1 : 0] Input_3,
        input signed [Bit_width - 1 : 0] Input_4,
        
        // Output
        output reg signed [Bit_width - 1 : 0] Out_data
    );

    reg signed [Bit_width - 1 : 0] temp_0;
    reg signed [Bit_width - 1 : 0] temp_1;
    reg signed [Bit_width - 1 : 0] temp_2;

    always @ (*) begin
        temp_0 = (Input_0 > Input_1) ? Input_0 : Input_1;
        temp_1 = (Input_2 > Input_3) ? Input_2 : Input_3;
        temp_2 = (temp_0 > temp_1) ? temp_0 : temp_1;
        Out_data = (temp_2 > Input_4) ? temp_2 : Input_4;
    end

endmodule