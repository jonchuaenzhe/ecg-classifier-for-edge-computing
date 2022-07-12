`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/22 22:01:30
// Design Name: 
// Module Name: Multiply
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


module Multiply
  #(
    parameter Bit_width = 16 //the number of bits for each input number
  ) 
  (
        // Input  
        input [5:0] Enable, // one-hot encoding 6 bit enable signal

        // Data
        input signed [Bit_width-1:0] data_0,
        input signed [Bit_width-1:0] data_1,
        input signed [Bit_width-1:0] data_2,
        input signed [Bit_width-1:0] data_3,
        input signed [Bit_width-1:0] data_4,

        // Weights
        input signed [Bit_width-1:0] weight_0,
        input signed [Bit_width-1:0] weight_1,
        input signed [Bit_width-1:0] weight_2,
        input signed [Bit_width-1:0] weight_3,
        input signed [Bit_width-1:0] weight_4,
        input signed [Bit_width-1:0] weight_5,

        // Output
        output reg signed [Bit_width*2-1:0] mul_result_0,
        output reg signed [Bit_width*2-1:0] mul_result_1,
        output reg signed [Bit_width*2-1:0] mul_result_2,
        output reg signed [Bit_width*2-1:0] mul_result_3,
        output reg signed [Bit_width*2-1:0] mul_result_4,
        output reg signed [Bit_width*2-1:0] mul_result_5
  );
    always @ (*) begin
        mul_result_0 = Enable[5] ? { {8{weight_0[15]}}, weight_0, 8'h0} : 0; // sign extend
        mul_result_1 = Enable[4] ? data_0 * weight_1 : 0;
        mul_result_2 = Enable[3] ? data_1 * weight_2 : 0;
        mul_result_3 = Enable[2] ? data_2 * weight_3 : 0;
        mul_result_4 = Enable[1] ? data_3 * weight_4 : 0;
        mul_result_5 = Enable[0] ? data_4 * weight_5 : 0;
    end
    
endmodule