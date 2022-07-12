`timescale 1ns / 1ps

module CONV1D_1st_Data_RAM
    #(
        parameter Bit_width = 16,
        parameter RAM_Depth = 512
    )
    (
        // Input
        input CLK,

        // Write
        input Write_Enable,
        input [8:0] Write_Width,
        input [Bit_width - 1 : 0] data_in,

        // Read
        input Read_Enable,
        input [8:0] Read_Width,

        // Output
        output reg signed [Bit_width - 1 : 0] data_out_0,
        output reg signed [Bit_width - 1 : 0] data_out_1,
        output reg signed [Bit_width - 1 : 0] data_out_2,
        output reg signed [Bit_width - 1 : 0] data_out_3,
        output reg signed [Bit_width - 1 : 0] data_out_4
    );

    // RAM reg creation 512 * 16 bit
    (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_0 [0 : RAM_Depth - 1];
    (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_1 [0 : RAM_Depth - 1];
    (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_2 [0 : RAM_Depth - 1];
    (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_3 [0 : RAM_Depth - 1];
    (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_4 [0 : RAM_Depth - 1];

    // for testing purposes
//    initial begin
//        $readmemh("Initial_Data_1.mem", RAM_0);
//        $readmemh("Initial_Data_1.mem", RAM_1);
//        $readmemh("Initial_Data_1.mem", RAM_2);
//        $readmemh("Initial_Data_1.mem", RAM_3);
//        $readmemh("Initial_Data_1.mem", RAM_4);
//    end

    always @ (negedge CLK) begin
        // Write
        if (Write_Enable) begin
            RAM_0[Write_Width] <= data_in;
            RAM_1[Write_Width] <= data_in;
            RAM_2[Write_Width] <= data_in;
            RAM_3[Write_Width] <= data_in;
            RAM_4[Write_Width] <= data_in;
        end else if (Read_Enable) begin
            data_out_0 <= (Read_Width < 2) ? 0 : RAM_0[Read_Width - 2];
            data_out_1 <= (Read_Width < 1) ? 0 : RAM_1[Read_Width - 1];
            data_out_2 <= RAM_2[Read_Width];
            data_out_3 <= (Read_Width >= 512 - 1) ? 0 : RAM_3[Read_Width + 1];
            data_out_4 <= (Read_Width >= 512 - 2) ? 0 : RAM_4[Read_Width + 2];
        end
    end

endmodule