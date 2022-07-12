`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2022 15:28:31
// Design Name: 
// Module Name: Adder
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


module Adder
    #(
        parameter Bit_width = 32 // the number of bits for each number

    )(
        input [1:0] Adder_Ctrl,
        input signed [Bit_width-1:0] Mul_result_0,
        input signed [Bit_width-1:0] Mul_result_1,
        input signed [Bit_width-1:0] Mul_result_2,
        input signed [Bit_width-1:0] Mul_result_3,
        input signed [Bit_width-1:0] Mul_result_4,
        input signed [Bit_width-1:0] Mul_result_5,
        input signed [Bit_width-1:0] Additional_input,
        output reg [Bit_width-1:0] Out_sum
    );

    reg [Bit_width-1:0] Sum;
    reg [Bit_width-1:0] Div_sum;
    always @ (*) begin
        Sum = Mul_result_0 + Mul_result_1 + Mul_result_2 + Mul_result_3 + Mul_result_4 + Mul_result_5 + Additional_input;

        // Divide by 256 then sign extend back to 32 bit
        Div_sum = (Adder_Ctrl[1]) ? {{8{Sum[31]}}, Sum[31:8]} : Sum;

        // because we are using 2's complement, so if the first bit is 1, it means a negative number
        Out_sum = (Adder_Ctrl[0]) ? (Div_sum[Bit_width-1]) ? 0 : Div_sum : Div_sum; 

    end 
endmodule
