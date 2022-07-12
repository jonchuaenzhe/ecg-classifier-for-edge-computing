`timescale 1ns / 1ps

module FC_2nd_Data_RAM
    #(
        parameter Bit_width = 16,
        parameter RAM_Depth = 16
    )
    (
        // Input
        input CLK,

        // Write
        input Write_Enable,
        input [3:0] Write_Width,
        input [Bit_width - 1 : 0] data_in,

        // Read
        input Read_Enable,
        input [3:0] Read_Width,

        // Output
        output reg signed [Bit_width - 1 : 0] data_out_0,
        output reg signed [Bit_width - 1 : 0] data_out_1,
        output reg signed [Bit_width - 1 : 0] data_out_2,
        output reg signed [Bit_width - 1 : 0] data_out_3,
        output reg signed [Bit_width - 1 : 0] data_out_4
    );

    // RAM reg creation 16 * 16 bit
    reg [Bit_width - 1 : 0] RAM [0 : RAM_Depth - 1];

    // Address width pointer
    wire [3:0] Data_1_Width;
    wire [3:0] Data_2_Width;
    wire [3:0] Data_3_Width;
    wire [3:0] Data_4_Width;

    assign Data_1_Width = Read_Width + 1;
    assign Data_2_Width = Read_Width + 2;
    assign Data_3_Width = Read_Width + 3;
    assign Data_4_Width = Read_Width + 4;

    always @ (negedge CLK) begin
        // Write
        if (Write_Enable) begin
            RAM[Write_Width] <= data_in;
        end
        
        if (Read_Enable) begin
            data_out_0 <= RAM[Read_Width];
            data_out_1 <= Read_Width < 16 - 1 ? RAM[Data_1_Width] : 0;
            data_out_2 <= Read_Width < 16 - 2 ? RAM[Data_2_Width] : 0;
            data_out_3 <= Read_Width < 16 - 3 ? RAM[Data_3_Width] : 0;
            data_out_4 <= Read_Width < 16 - 4 ? RAM[Data_4_Width] : 0;
        end
    end

endmodule