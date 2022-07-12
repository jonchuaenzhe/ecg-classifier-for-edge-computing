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
    parameter Bit_width = 16 //the number of bits for each number
  ) 
  (
        // Input
        input [1:0] Enable,

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
      if (Enable > 0) begin
        mul_result_0 <= { {8{weight_0[15]}}, weight_0, 8'h00}; // sign extend
        mul_result_1 <= data_0 * weight_1;
        mul_result_2 <= data_1 * weight_2;
        mul_result_3 <= data_2 * weight_3;
        mul_result_4 <= data_3 * weight_4;
        mul_result_5 <= data_4 * weight_5;


        // mul_result_1 <= (enable < 2'b00)?0:(data_1 * weight_1);
        // mul_result_2 <= (enable < 2'b01)?0:(data_2 * weight_2);
        // mul_result_3 <= (enable < 2'b10)?0:(data_3 * weight_3);
        // mul_result_4 <= (enable < 2'b11)?0:(data_4 * weight_4);
        // mul_result_5 <= (enable < 2'b01)?0:(data_5 * weight_5);
      end else begin
        mul_result_0 <= 0;
        mul_result_1 <= 0;
        mul_result_2 <= 0;
        mul_result_3 <= 0;
        mul_result_4 <= 0;
        mul_result_5 <= 0;
      end
    end
    
endmodule