`timescale 1ns / 1ps

module CONV1D_3rd_Data_RAM
    #(
        parameter Bit_width = 16,
        parameter RAM_Depth = 256
    )
    (
        // Input
        input CLK,

        // Write
        input Write_Enable,
        input [3:0] Write_Depth,
        input [7:0] Write_Width,
        input [Bit_width - 1 : 0] data_in,

        // Read
        input Read_Enable,
        input [3:0] Read_Depth,
        input [7:0] Read_Width,

        // Output
        output reg signed [Bit_width - 1 : 0] data_out_0,
        output reg signed [Bit_width - 1 : 0] data_out_1,
        output reg signed [Bit_width - 1 : 0] data_out_2
    );

    // Wire declaration
    // RAM 0
    wire RAM_0_Read_Enable;
    assign RAM_0_Read_Enable = Read_Enable && Read_Depth < 8;
    wire RAM_0_Write_Enable;
    assign RAM_0_Write_Enable = Write_Enable && Write_Depth < 8;
    wire [Bit_width - 1 : 0] data_out_RAM_0_0;
    wire [Bit_width - 1 : 0] data_out_RAM_0_1;
    wire [Bit_width - 1 : 0] data_out_RAM_0_2;

    // RAM 1
    wire RAM_1_Read_Enable;
    assign RAM_1_Read_Enable = Read_Enable && Read_Depth >= 8;
    wire RAM_1_Write_Enable;
    assign RAM_1_Write_Enable = Write_Enable && Write_Depth >= 8;
    wire [2:0] RAM_1_Write_Depth;
    assign RAM_1_Write_Depth = Write_Depth - 8;
    wire [2:0] RAM_1_Read_Depth;
    assign RAM_1_Read_Depth = Read_Depth - 8;

    wire [Bit_width - 1 : 0] data_out_RAM_1_0;
    wire [Bit_width - 1 : 0] data_out_RAM_1_1;
    wire [Bit_width - 1 : 0] data_out_RAM_1_2;

    // Combinational circuit declaration
    always @ (*) begin
        data_out_0 = (Read_Depth < 8) ? data_out_RAM_0_0 : data_out_RAM_1_0;
        data_out_1 = (Read_Depth < 8) ? data_out_RAM_0_1 : data_out_RAM_1_1;
        data_out_2 = (Read_Depth < 8) ? data_out_RAM_0_2 : data_out_RAM_1_2;
    end

    // Submodule declaration
    CONV1D_2nd_Data_RAM RAM_0(
        .CLK(CLK),
        
        // Input (Write)
        .Write_Enable(RAM_0_Write_Enable),
        .Write_Depth(Write_Depth[2:0]),
        .Write_Width(Write_Width),
        .data_in(data_in),

        // Input (Read)
        .Read_Enable(RAM_0_Read_Enable),
        .Read_Depth(Read_Depth[2:0]),
        .Read_Width(Read_Width),
        
        // Output
        .data_out_0(data_out_RAM_0_0),
        .data_out_1(data_out_RAM_0_1),
        .data_out_2(data_out_RAM_0_2)
    );

    CONV1D_2nd_Data_RAM RAM_1(
        .CLK(CLK),
        
        // Input (Write)
        .Write_Enable(RAM_1_Write_Enable),
        .Write_Depth(RAM_1_Write_Depth),
        .Write_Width(Write_Width),
        .data_in(data_in),

        // Input (Read)
        .Read_Enable(RAM_1_Read_Enable),
        .Read_Depth(RAM_1_Read_Depth),
        .Read_Width(Read_Width),
        
        // Output
        .data_out_0(data_out_RAM_1_0),
        .data_out_1(data_out_RAM_1_1),
        .data_out_2(data_out_RAM_1_2)
    );

endmodule