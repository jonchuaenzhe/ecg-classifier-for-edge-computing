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


module Weights_RAM
    #(Bit_width = 16)
    (
        // Input
        input Clk,
        input [14:0] uCode,

        // Output
        output reg [Bit_width - 1 : 0] Read_data_out_0,
        output reg [Bit_width - 1 : 0] Read_data_out_1,
        output reg [Bit_width - 1 : 0] Read_data_out_2,
        output reg [Bit_width - 1 : 0] Read_data_out_3,
        output reg [Bit_width - 1 : 0] Read_data_out_4,
        output reg [Bit_width - 1 : 0] Read_data_out_5
    );

    /***
        Bit Mapping:
        
        Bit 14: Width[3]
        Bit 13: Width[2]
        Bit 12: Width[1]
        Bit 11: Width[0]
        Bit 10: Depth[4]
        Bit 9 : Depth[3]
        Bit 8 : Depth[2]
        Bit 7 : Depth[1]
        Bit 6 : Depth[0]
        Bit 5 : Mode[4]
        Bit 4 : Mode[3]
        Bit 3 : Mode[2]
        Bit 2 : Mode[1]
        Bit 1 : Mode[0]
        Bit 0 : Enable
    ***/
    // Major Control Signal declaration
    wire Enable;
    wire [4:0] Mode;
    wire [4:0] Depth;
    wire [3:0] Width; // Width and Height are used interchangebly. 

    // Major Control Signal mapping
    assign Width = uCode[14:11];
    assign Depth = uCode[10:6];
    assign Mode = uCode[5:1];
    assign Enable = uCode[0];

    // Mode param declaration
    localparam CONV1D_1st = 5'b1_0000;
    localparam CONV1D_2nd = 5'b0_1000;
    localparam CONV1D_3rd = 5'b0_0100;
    localparam FC_1st = 5'b0_0010;
    localparam FC_2nd = 5'b0_0001;

    // Wires from all of the output
    // Conv 1D 1st
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_1st_0;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_1st_1;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_1st_2;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_1st_3;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_1st_4;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_1st_5;

    // Conv 1D 2nd // only 4 output (1 bias + three weights)
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_2nd_0;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_2nd_1;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_2nd_2;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_2nd_3;

    // Conv 1D 3rd // only 4 output (1 bias + three weights)
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_3rd_0;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_3rd_1;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_3rd_2;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_3rd_3;

    // FC 1st
    wire [Bit_width - 1 : 0] Data_out_FC_1st_0;
    wire [Bit_width - 1 : 0] Data_out_FC_1st_1;
    wire [Bit_width - 1 : 0] Data_out_FC_1st_2;
    wire [Bit_width - 1 : 0] Data_out_FC_1st_3;
    wire [Bit_width - 1 : 0] Data_out_FC_1st_4;
    wire [Bit_width - 1 : 0] Data_out_FC_1st_5;

    // FC 2nd
    wire [Bit_width - 1 : 0] Data_out_FC_2nd_0;
    wire [Bit_width - 1 : 0] Data_out_FC_2nd_1;
    wire [Bit_width - 1 : 0] Data_out_FC_2nd_2;
    wire [Bit_width - 1 : 0] Data_out_FC_2nd_3;
    wire [Bit_width - 1 : 0] Data_out_FC_2nd_4;
    wire [Bit_width - 1 : 0] Data_out_FC_2nd_5;

    // Pure combinational logic
    always @ (*) begin
        if (Enable) begin

            case (Mode)
                CONV1D_1st:
                    begin
                        Read_data_out_0 = Data_out_CONV_1D_1st_0;
                        Read_data_out_1 = Data_out_CONV_1D_1st_1;
                        Read_data_out_2 = Data_out_CONV_1D_1st_2;
                        Read_data_out_3 = Data_out_CONV_1D_1st_3;
                        Read_data_out_4 = Data_out_CONV_1D_1st_4;
                        Read_data_out_5 = Data_out_CONV_1D_1st_5;
                    end
                CONV1D_2nd:
                    begin
                        Read_data_out_0 = Data_out_CONV_1D_2nd_0;
                        Read_data_out_1 = Data_out_CONV_1D_2nd_1;
                        Read_data_out_2 = Data_out_CONV_1D_2nd_2;
                        Read_data_out_3 = Data_out_CONV_1D_2nd_3;
                        Read_data_out_4 = 0;
                        Read_data_out_5 = 0;
                    end
                CONV1D_3rd:
                    begin
                        Read_data_out_0 = Data_out_CONV_1D_3rd_0;
                        Read_data_out_1 = Data_out_CONV_1D_3rd_1;
                        Read_data_out_2 = Data_out_CONV_1D_3rd_2;
                        Read_data_out_3 = Data_out_CONV_1D_3rd_3;
                        Read_data_out_4 = 0;
                        Read_data_out_5 = 0;
                    end
                FC_1st:
                    begin
                        Read_data_out_0 = Data_out_FC_1st_0;
                        Read_data_out_1 = Data_out_FC_1st_1;
                        Read_data_out_2 = Data_out_FC_1st_2;
                        Read_data_out_3 = Data_out_FC_1st_3;
                        Read_data_out_4 = Data_out_FC_1st_4;
                        Read_data_out_5 = Data_out_FC_1st_5;
                    end
                FC_2nd:
                    begin
                        Read_data_out_0 = Data_out_FC_2nd_0;
                        Read_data_out_1 = Data_out_FC_2nd_1;
                        Read_data_out_2 = Data_out_FC_2nd_2;
                        Read_data_out_3 = Data_out_FC_2nd_3;
                        Read_data_out_4 = Data_out_FC_2nd_4;
                        Read_data_out_5 = Data_out_FC_2nd_5;
                    end
                default:
                    begin
                        Read_data_out_0 = 0;
                        Read_data_out_1 = 0;
                        Read_data_out_2 = 0;
                        Read_data_out_3 = 0;
                        Read_data_out_4 = 0;
                        Read_data_out_5 = 0;
                    end
            endcase
        end else begin
            Read_data_out_0 = 0;
            Read_data_out_1 = 0;
            Read_data_out_2 = 0;
            Read_data_out_3 = 0;
            Read_data_out_4 = 0;
            Read_data_out_5 = 0;
        end
    end

    // Submodule RAM declaration
    CONV1D_1st_RAM CONV1D_1st_RAM (
        .CLK(Clk),
        .Enable(Mode[4]),
        .Depth(Depth),

        // output
        .data_out_0(Data_out_CONV_1D_1st_0),
        .data_out_1(Data_out_CONV_1D_1st_1),
        .data_out_2(Data_out_CONV_1D_1st_2),
        .data_out_3(Data_out_CONV_1D_1st_3),
        .data_out_4(Data_out_CONV_1D_1st_4),
        .data_out_5(Data_out_CONV_1D_1st_5)
    );

    CONV1D_2nd_RAM CONV1D_2nd_RAM (
        .CLK(Clk),
        .Enable(Mode[3]),
        .Depth(Depth),
        .Width(Width),

        // output
        .data_out_0(Data_out_CONV_1D_2nd_0),
        .data_out_1(Data_out_CONV_1D_2nd_1),
        .data_out_2(Data_out_CONV_1D_2nd_2),
        .data_out_3(Data_out_CONV_1D_2nd_3)
    );

    CONV1D_3rd_RAM CONV1D_3rd_RAM (
        .CLK(Clk),
        .Enable(Mode[2]),
        .Depth(Depth),
        .Width(Width),

        // output
        .data_out_0(Data_out_CONV_1D_3rd_0),
        .data_out_1(Data_out_CONV_1D_3rd_1),
        .data_out_2(Data_out_CONV_1D_3rd_2),
        .data_out_3(Data_out_CONV_1D_3rd_3)
    );

    FC_1st_RAM FC_1st_RAM (
        .CLK(Clk),
        .Enable(Mode[1]),
        .Depth(Depth),
        .Width(Width),

        // output
        .data_out_0(Data_out_FC_1st_0),
        .data_out_1(Data_out_FC_1st_1),
        .data_out_2(Data_out_FC_1st_2),
        .data_out_3(Data_out_FC_1st_3),
        .data_out_4(Data_out_FC_1st_4),
        .data_out_5(Data_out_FC_1st_5)
    );

    FC_2nd_RAM FC_2nd_RAM (
        .CLK(Clk),
        .Enable(Mode[0]),
        .Width(Width),

        // output
        .data_out_0(Data_out_FC_2nd_0),
        .data_out_1(Data_out_FC_2nd_1),
        .data_out_2(Data_out_FC_2nd_2),
        .data_out_3(Data_out_FC_2nd_3),
        .data_out_4(Data_out_FC_2nd_4),
        .data_out_5(Data_out_FC_2nd_5)
    );

endmodule
