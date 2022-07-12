`timescale 1ns / 1ps

module FC_1st_Data_RAM
    #(
        parameter Bit_width = 16,
        parameter RAM_Depth = 32
    )
    (
        // Input
        input CLK,

        // Write
        input Write_Enable,
        input [4:0] Write_Width,
        input [Bit_width - 1 : 0] data_in,

        // Read
        input Read_Enable,
        input [4:0] Read_Width,

        // Output
        output reg signed [Bit_width - 1 : 0] data_out_0,
        output reg signed [Bit_width - 1 : 0] data_out_1,
        output reg signed [Bit_width - 1 : 0] data_out_2,
        output reg signed [Bit_width - 1 : 0] data_out_3,
        output reg signed [Bit_width - 1 : 0] data_out_4
    );

    // RAM reg creation 32 * 16 bit
    reg [Bit_width - 1 : 0] RAM [0 : RAM_Depth - 1];

    always @ (negedge CLK) begin
        // Write
        if (Write_Enable) begin
            RAM[Write_Width] <= data_in;
        end else if (Read_Enable) begin
            data_out_0 <= RAM[Read_Width];
            data_out_1 <= Read_Width < 32 - 1 ? RAM[Read_Width + 1] : 0;
            data_out_2 <= Read_Width < 32 - 2 ? RAM[Read_Width + 2] : 0;
            data_out_3 <= Read_Width < 32 - 3 ? RAM[Read_Width + 3] : 0;
            data_out_4 <= Read_Width < 32 - 4 ? RAM[Read_Width + 4] : 0;
        end
    end

endmodule