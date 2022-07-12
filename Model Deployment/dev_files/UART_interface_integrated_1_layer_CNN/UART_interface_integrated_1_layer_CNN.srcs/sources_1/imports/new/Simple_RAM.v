`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2022 16:56:58
// Design Name: 
// Module Name: Simple_RAM
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


module Simple_RAM#(
    parameter Bit_width = 8,
    parameter Instr_bit_width = 10
)(
    input CLK,
    input [Bit_width - 1: 0] Address,
    output reg [Instr_bit_width - 1 : 0] Data_out
    );

    reg [Instr_bit_width - 1 : 0] RAM [0 : 9];

    initial begin
        RAM[0] = 9'b011100011;
        RAM[1] = 9'b011100111;
        RAM[2] = 9'b011101011;
        RAM[3] = 9'b011101111;
        RAM[4] = 9'b011110011;
        RAM[5] = 9'b011110111;
        RAM[6] = 9'b011111011;
        RAM[7] = 9'b011111111;
        RAM[8] = 9'b111111111;
        RAM[9] = 9'b000000000;
    end


    always @ (posedge CLK) begin
        if (Address < 512 - 1) begin
            Data_out <= RAM[0];
        end else if (Address < 1024 - 1) begin
            Data_out <= RAM[1];
        end else if (Address < 1536 - 1) begin
            Data_out <= RAM[2];
        end else if (Address < 2048 - 1) begin
            Data_out <= RAM[3];
        end else if (Address < 2560 - 1) begin
            Data_out <= RAM[4];
        end else if (Address < 3072 - 1) begin
            Data_out <= RAM[5];
        end else if (Address < 3584 - 1) begin
            Data_out <= RAM[6];
        end else if (Address < 4095 - 1) begin
            Data_out <= RAM[7];
        end else if (Address == 4095 - 1) begin
            Data_out <= RAM[8];
        end else begin
            Data_out <= RAM[9];
        end
    end

endmodule