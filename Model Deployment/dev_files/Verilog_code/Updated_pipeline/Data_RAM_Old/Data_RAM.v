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


module Data_RAM
    #(
        parameter Bit_width = 16,
        parameter RAM_Depth = 256
    )

    (
        // Input
        input Clk,
        input [23:0] Data_Read_uCode,
        input [23:0] Data_Write_uCode,
        input [Bit_width-1:0] Data_in,
        input [3:0] Global_MaxPool_State_Machine,

        // Output
        output reg [Bit_width-1:0] Read_data_out_0,
        output reg [Bit_width-1:0] Read_data_out_1,
        output reg [Bit_width-1:0] Read_data_out_2,
        output reg [Bit_width-1:0] Read_data_out_3,
        output reg [Bit_width-1:0] Read_data_out_4
    );

    // RAM reg creation 48 x 256
    reg [Bit_width - 1 : 0] RAM_0 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_1 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_2 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_3 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_4 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_5 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_6 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_7 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_8 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_9 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_10 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_11 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_12 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_13 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_14 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_15 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_16 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_17 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_18 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_19 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_20 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_21 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_22 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_23 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_24 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_25 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_26 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_27 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_28 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_29 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_30 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_31 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_32 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_33 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_34 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_35 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_36 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_37 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_38 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_39 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_40 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_41 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_42 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_43 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_44 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_45 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_46 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_47 [0 : RAM_Depth - 1];

    // Major Control Signal Mapping
    /*
        Data Read & Write uCode

        Bit 23: Width[8]
        Bit 22: Width[7]
        Bit 21: Width[6]
        Bit 20: Width[5]
        Bit 19: Width[4]
        Bit 18: Width[3]
        Bit 17: Width[2]
        Bit 16: Width[1]
        Bit 15: Width[0]
        Bit 14: Depth[4]
        Bit 13: Depth[3]
        Bit 12: Depth[2]
        Bit 11: Depth[1]
        Bit 10: Depth[0]
        Bit 9 : Mode[8]
        Bit 8 : Mode[7]
        Bit 7 : Mode[6]
        Bit 6 : Mode[5]
        Bit 5 : Mode[4]
        Bit 4 : Mode[3]
        Bit 3 : Mode[2]
        Bit 2 : Mode[1]
        Bit 1 : Mode[0]
        Bit 0 : Enable
    */
    wire Read_Enable;
    wire [8:0] Read_Mode;
    wire [4:0] Read_Depth;
    wire [8:0] Read_Width;
    assign Read_Enable = Data_Read_uCode[0];
    assign Read_Mode = Data_Read_uCode[9:1];
    assign Read_Depth = Data_Read_uCode[14:10];
    assign Read_Width = Data_Read_uCode[23:15];

    wire Write_Enable;
    wire [8:0] Write_Mode;
    wire [4:0] Write_Depth;
    wire [8:0] Write_Width;
    assign Write_Enable = Data_Write_uCode[0];
    assign Write_Mode = Data_Write_uCode[9:1];
    assign Write_Depth = Data_Write_uCode[14:10];
    assign Write_Width = Data_Write_uCode[23:15];

    // Mode Param declaration
    localparam Receiver = 9'b1000_0000_0;
    localparam Transmitter = 9'b0100_0000_0;
    localparam CONV1D_1st = 9'b0010_0000_0;
    localparam MaxPool = 9'b0001_0000_0; 
    localparam CONV1D_2nd = 9'b0000_1000_0; 
    localparam CONV1D_3rd = 9'b0000_0100_0; 
    localparam Global_MaxPool = 9'b0000_0010_0; 
    localparam FC_1st = 9'b0000_0001_0; 
    localparam FC_2nd = 9'b0000_0000_1; 

    // Retrive and write to RAM
    always @ (negedge Clk) begin
        // Read
        if (Read_Enable) begin
            case (Read_Mode) // no Receiver mode
                Transmitter:
                    begin
                        Read_data_out_0 <= RAM_0[0]; // real data
                        Read_data_out_1 <= 0;
                        Read_data_out_2 <= 0;
                        Read_data_out_3 <= 0;
                        Read_data_out_4 <= 0;
                    end
                CONV1D_1st: 
                    begin
                        Read_data_out_0 <= (Read_Width < 2) ? 0 : (Read_Width < 256 + 2) ? RAM_46[Read_Width - 2] : RAM_47[Read_Width - 2 - 256];
                        Read_data_out_1 <= (Read_Width < 1) ? 0 : (Read_Width < 256 + 1) ? RAM_46[Read_Width - 1] : RAM_47[Read_Width - 1 - 256];
                        Read_data_out_2 <= (Read_Width < 256) ? RAM_46[Read_Width] : RAM_47[Read_Width - 256];
                        Read_data_out_3 <= (Read_Width >= 512 - 1) ? 0 : (Read_Width < 256 - 1) ? RAM_46[Read_Width + 1] : RAM_47[Read_Width + 1 - 256];
                        Read_data_out_4 <= (Read_Width >= 512 - 2) ? 0 : (Read_Width < 256 - 2) ? RAM_46[Read_Width + 2] : RAM_47[Read_Width + 2 - 256];
                    end
                MaxPool:
                    begin
                        case (Read_Depth)
                            0:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 9 : (Read_Width < 256 + 1) ? RAM_0[Read_Width - 1] : RAM_1[Read_Width - 1];
                                    Read_data_out_1 <= (Read_Width < 256) ? RAM_0[Read_Width] : RAM_1[Read_Width - 256];
                                    Read_data_out_2 <= (Read_Width >= 512 - 1) ? 0 : (Read_Width < 256 - 1) ? RAM_0[Read_Width + 1] : RAM_1[Read_Width + 1 - 256];
                                    Read_data_out_3 <= (Read_Width >= 512 - 2) ? 0 : (Read_Width < 256 - 2) ? RAM_0[Read_Width + 2] : RAM_1[Read_Width + 2 - 256];
                                    Read_data_out_4 <= (Read_Width >= 512 - 3) ? 0 : (Read_Width < 256 - 3) ? RAM_0[Read_Width + 3] : RAM_1[Read_Width + 3 - 256];
                                end
                            1:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 9 : (Read_Width < 256 + 1) ? RAM_2[Read_Width - 1] : RAM_3[Read_Width - 1];
                                    Read_data_out_1 <= (Read_Width < 256) ? RAM_2[Read_Width] : RAM_3[Read_Width - 256];
                                    Read_data_out_2 <= (Read_Width >= 512 - 1) ? 0 : (Read_Width < 256 - 1) ? RAM_2[Read_Width + 1] : RAM_3[Read_Width + 1 - 256];
                                    Read_data_out_3 <= (Read_Width >= 512 - 2) ? 0 : (Read_Width < 256 - 2) ? RAM_2[Read_Width + 2] : RAM_3[Read_Width + 2 - 256];
                                    Read_data_out_4 <= (Read_Width >= 512 - 3) ? 0 : (Read_Width < 256 - 3) ? RAM_2[Read_Width + 3] : RAM_3[Read_Width + 3 - 256];
                                end
                            2:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 9 : (Read_Width < 256 + 1) ? RAM_4[Read_Width - 1] : RAM_5[Read_Width - 1];
                                    Read_data_out_1 <= (Read_Width < 256) ? RAM_4[Read_Width] : RAM_5[Read_Width - 256];
                                    Read_data_out_2 <= (Read_Width >= 512 - 1) ? 0 : (Read_Width < 256 - 1) ? RAM_4[Read_Width + 1] : RAM_5[Read_Width + 1 - 256];
                                    Read_data_out_3 <= (Read_Width >= 512 - 2) ? 0 : (Read_Width < 256 - 2) ? RAM_4[Read_Width + 2] : RAM_5[Read_Width + 2 - 256];
                                    Read_data_out_4 <= (Read_Width >= 512 - 3) ? 0 : (Read_Width < 256 - 3) ? RAM_4[Read_Width + 3] : RAM_5[Read_Width + 3 - 256];
                                end
                            3:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 9 : (Read_Width < 256 + 1) ? RAM_6[Read_Width - 1] : RAM_7[Read_Width - 1];
                                    Read_data_out_1 <= (Read_Width < 256) ? RAM_6[Read_Width] : RAM_7[Read_Width - 256];
                                    Read_data_out_2 <= (Read_Width >= 512 - 1) ? 0 : (Read_Width < 256 - 1) ? RAM_6[Read_Width + 1] : RAM_7[Read_Width + 1 - 256];
                                    Read_data_out_3 <= (Read_Width >= 512 - 2) ? 0 : (Read_Width < 256 - 2) ? RAM_6[Read_Width + 2] : RAM_7[Read_Width + 2 - 256];
                                    Read_data_out_4 <= (Read_Width >= 512 - 3) ? 0 : (Read_Width < 256 - 3) ? RAM_6[Read_Width + 3] : RAM_7[Read_Width + 3 - 256];
                                end
                            4:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 9 : (Read_Width < 256 + 1) ? RAM_8[Read_Width - 1] : RAM_9[Read_Width - 1];
                                    Read_data_out_1 <= (Read_Width < 256) ? RAM_8[Read_Width] : RAM_9[Read_Width - 256];
                                    Read_data_out_2 <= (Read_Width >= 512 - 1) ? 0 : (Read_Width < 256 - 1) ? RAM_8[Read_Width + 1] : RAM_9[Read_Width + 1 - 256];
                                    Read_data_out_3 <= (Read_Width >= 512 - 2) ? 0 : (Read_Width < 256 - 2) ? RAM_8[Read_Width + 2] : RAM_9[Read_Width + 2 - 256];
                                    Read_data_out_4 <= (Read_Width >= 512 - 3) ? 0 : (Read_Width < 256 - 3) ? RAM_8[Read_Width + 3] : RAM_9[Read_Width + 3 - 256];
                                end
                            5:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 9 : (Read_Width < 256 + 1) ? RAM_10[Read_Width - 1] : RAM_11[Read_Width - 1];
                                    Read_data_out_1 <= (Read_Width < 256) ? RAM_10[Read_Width] : RAM_11[Read_Width - 256];
                                    Read_data_out_2 <= (Read_Width >= 512 - 1) ? 0 : (Read_Width < 256 - 1) ? RAM_10[Read_Width + 1] : RAM_11[Read_Width + 1 - 256];
                                    Read_data_out_3 <= (Read_Width >= 512 - 2) ? 0 : (Read_Width < 256 - 2) ? RAM_10[Read_Width + 2] : RAM_11[Read_Width + 2 - 256];
                                    Read_data_out_4 <= (Read_Width >= 512 - 3) ? 0 : (Read_Width < 256 - 3) ? RAM_10[Read_Width + 3] : RAM_11[Read_Width + 3 - 256];
                                end
                            6:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 9 : (Read_Width < 256 + 1) ? RAM_12[Read_Width - 1] : RAM_13[Read_Width - 1];
                                    Read_data_out_1 <= (Read_Width < 256) ? RAM_12[Read_Width] : RAM_13[Read_Width - 256];
                                    Read_data_out_2 <= (Read_Width >= 512 - 1) ? 0 : (Read_Width < 256 - 1) ? RAM_12[Read_Width + 1] : RAM_13[Read_Width + 1 - 256];
                                    Read_data_out_3 <= (Read_Width >= 512 - 2) ? 0 : (Read_Width < 256 - 2) ? RAM_12[Read_Width + 2] : RAM_13[Read_Width + 2 - 256];
                                    Read_data_out_4 <= (Read_Width >= 512 - 3) ? 0 : (Read_Width < 256 - 3) ? RAM_12[Read_Width + 3] : RAM_13[Read_Width + 3 - 256];
                                end
                            7:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 9 : (Read_Width < 256 + 1) ? RAM_14[Read_Width - 1] : RAM_15[Read_Width - 1];
                                    Read_data_out_1 <= (Read_Width < 256) ? RAM_14[Read_Width] : RAM_15[Read_Width - 256];
                                    Read_data_out_2 <= (Read_Width >= 512 - 1) ? 0 : (Read_Width < 256 - 1) ? RAM_14[Read_Width + 1] : RAM_15[Read_Width + 1 - 256];
                                    Read_data_out_3 <= (Read_Width >= 512 - 2) ? 0 : (Read_Width < 256 - 2) ? RAM_14[Read_Width + 2] : RAM_15[Read_Width + 2 - 256];
                                    Read_data_out_4 <= (Read_Width >= 512 - 3) ? 0 : (Read_Width < 256 - 3) ? RAM_14[Read_Width + 3] : RAM_15[Read_Width + 3 - 256];
                                end
                            default:
                                begin
                                    Read_data_out_0 <= 0;
                                    Read_data_out_1 <= 0;
                                    Read_data_out_2 <= 0;
                                    Read_data_out_3 <= 0;
                                    Read_data_out_4 <= 0;
                                end
                        endcase
                    end
                CONV1D_2nd:
                    begin
                        // only 3 data
                        Read_data_out_3 <= 0;
                        Read_data_out_4 <= 0;

                        case (Read_Depth)
                            0:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_16[Read_Width - 1];
                                    Read_data_out_1 <= RAM_16[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_16[Read_Width + 1];
                                end
                            1:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_17[Read_Width - 1];
                                    Read_data_out_1 <= RAM_17[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_17[Read_Width + 1];
                                end
                            2:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_18[Read_Width - 1];
                                    Read_data_out_1 <= RAM_18[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_18[Read_Width + 1];
                                end
                            3:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_19[Read_Width - 1];
                                    Read_data_out_1 <= RAM_19[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_19[Read_Width + 1];
                                end
                            4:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_20[Read_Width - 1];
                                    Read_data_out_1 <= RAM_20[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_20[Read_Width + 1];
                                end
                            5:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_21[Read_Width - 1];
                                    Read_data_out_1 <= RAM_21[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_21[Read_Width + 1];
                                end
                            6:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_22[Read_Width - 1];
                                    Read_data_out_1 <= RAM_22[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_22[Read_Width + 1];
                                end
                            7:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_23[Read_Width - 1];
                                    Read_data_out_1 <= RAM_23[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_23[Read_Width + 1];
                                end
                            default:
                                begin
                                    Read_data_out_0 <= 0;
                                    Read_data_out_1 <= 0;
                                    Read_data_out_2 <= 0;
                                end
                        endcase
                    end
                CONV1D_3rd:
                    begin
                        // only 3 data
                        Read_data_out_3 <= 0;
                        Read_data_out_4 <= 0;

                        case (Read_Depth) 
                            0:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_32[Read_Width - 1];
                                    Read_data_out_1 <= RAM_32[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_32[Read_Width + 1];
                                end
                            1:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_33[Read_Width - 1];
                                    Read_data_out_1 <= RAM_33[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_33[Read_Width + 1];
                                end
                            2:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_34[Read_Width - 1];
                                    Read_data_out_1 <= RAM_34[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_34[Read_Width + 1];
                                end
                            3:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_35[Read_Width - 1];
                                    Read_data_out_1 <= RAM_35[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_35[Read_Width + 1];
                                end
                            4:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_36[Read_Width - 1];
                                    Read_data_out_1 <= RAM_36[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_36[Read_Width + 1];
                                end
                            5:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_37[Read_Width - 1];
                                    Read_data_out_1 <= RAM_37[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_37[Read_Width + 1];
                                end
                            6:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_38[Read_Width - 1];
                                    Read_data_out_1 <= RAM_38[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_38[Read_Width + 1];
                                end
                            7:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_39[Read_Width - 1];
                                    Read_data_out_1 <= RAM_39[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_39[Read_Width + 1];
                                end
                            8:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_40[Read_Width - 1];
                                    Read_data_out_1 <= RAM_40[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_40[Read_Width + 1];
                                end
                            9:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_41[Read_Width - 1];
                                    Read_data_out_1 <= RAM_41[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_41[Read_Width + 1];
                                end
                            10:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_42[Read_Width - 1];
                                    Read_data_out_1 <= RAM_42[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_42[Read_Width + 1];
                                end
                            11:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_43[Read_Width - 1];
                                    Read_data_out_1 <= RAM_43[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_43[Read_Width + 1];
                                end
                            12:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_44[Read_Width - 1];
                                    Read_data_out_1 <= RAM_44[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_44[Read_Width + 1];
                                end
                            13:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_45[Read_Width - 1];
                                    Read_data_out_1 <= RAM_45[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_45[Read_Width + 1];
                                end
                            14:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_46[Read_Width - 1];
                                    Read_data_out_1 <= RAM_46[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_46[Read_Width + 1];
                                end
                            15:
                                begin
                                    Read_data_out_0 <= (Read_Width < 1) ? 0 : RAM_47[Read_Width - 1];
                                    Read_data_out_1 <= RAM_47[Read_Width];
                                    Read_data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_47[Read_Width + 1];
                                end
                            default:
                                begin
                                    Read_data_out_0 <= 0;
                                    Read_data_out_1 <= 0;
                                    Read_data_out_2 <= 0;
                                end
                        endcase
                    end
                Global_MaxPool:
                    begin
                        case (Read_Depth)
                            0:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_0[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_0[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_0[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_0[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_0[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_0[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_0[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_0[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_0[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_0[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_0[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_0[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_0[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_0[1];
                                                Read_data_out_2 <= RAM_0[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            1:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_1[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_1[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_1[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_1[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_1[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_1[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_1[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_1[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_1[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_1[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_1[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_1[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_1[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_1[1];
                                                Read_data_out_2 <= RAM_1[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            2:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_2[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_2[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_2[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_2[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_2[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_2[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_2[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_2[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_2[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_2[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_2[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_2[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_2[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_2[1];
                                                Read_data_out_2 <= RAM_2[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            3:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_3[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_3[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_3[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_3[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_3[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_3[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_3[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_3[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_3[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_3[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_3[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_3[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_3[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_3[1];
                                                Read_data_out_2 <= RAM_3[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            4:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_4[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_4[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_4[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_4[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_4[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_4[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_4[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_4[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_4[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_4[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_4[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_4[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_4[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_4[1];
                                                Read_data_out_2 <= RAM_4[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            5:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_5[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_5[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_5[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_5[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_5[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_5[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_5[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_5[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_5[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_5[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_5[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_5[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_5[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_5[1];
                                                Read_data_out_2 <= RAM_5[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            6:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_6[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_6[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_6[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_6[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_6[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_6[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_6[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_6[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_6[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_6[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_6[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_6[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_6[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_6[1];
                                                Read_data_out_2 <= RAM_6[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            7:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_7[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_7[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_7[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_7[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_7[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_7[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_7[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_7[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_7[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_7[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_7[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_7[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_7[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_7[1];
                                                Read_data_out_2 <= RAM_7[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            8:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_8[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_8[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_8[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_8[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_8[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_8[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_8[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_8[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_8[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_8[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_8[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_8[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_8[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_8[1];
                                                Read_data_out_2 <= RAM_8[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            9:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_9[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_9[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_9[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_9[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_9[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_9[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_9[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_9[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_9[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_9[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_9[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_9[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_9[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_9[1];
                                                Read_data_out_2 <= RAM_9[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            10:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_10[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_10[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_10[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_10[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_10[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_10[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_10[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_10[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_10[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_10[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_10[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_10[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_10[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_10[1];
                                                Read_data_out_2 <= RAM_10[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            11:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_11[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_11[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_11[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_11[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_11[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_11[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_11[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_11[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_11[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_11[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_11[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_11[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_11[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_11[1];
                                                Read_data_out_2 <= RAM_11[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            12:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_12[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_12[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_12[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_12[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_12[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_12[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_12[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_12[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_12[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_12[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_12[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_12[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_12[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_12[1];
                                                Read_data_out_2 <= RAM_12[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            13:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_13[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_13[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_13[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_13[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_13[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_13[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_13[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_13[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_13[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_13[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_13[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_13[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_13[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_13[1];
                                                Read_data_out_2 <= RAM_13[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            14:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_14[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_14[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_14[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_14[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_14[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_14[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_14[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_14[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_14[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_14[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_14[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_14[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_14[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_14[1];
                                                Read_data_out_2 <= RAM_14[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            15:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_15[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_15[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_15[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_15[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_15[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_15[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_15[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_15[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_15[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_15[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_15[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_15[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_15[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_15[1];
                                                Read_data_out_2 <= RAM_15[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            16:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_16[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_16[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_16[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_16[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_16[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_16[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_16[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_16[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_16[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_16[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_16[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_16[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_16[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_16[1];
                                                Read_data_out_2 <= RAM_16[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            17:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_17[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_17[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_17[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_17[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_17[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_17[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_17[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_17[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_17[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_17[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_17[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_17[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_17[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_17[1];
                                                Read_data_out_2 <= RAM_17[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            18:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_18[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_18[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_18[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_18[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_18[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_18[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_18[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_18[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_18[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_18[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_18[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_18[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_18[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_18[1];
                                                Read_data_out_2 <= RAM_18[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            19:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_19[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_19[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_19[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_19[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_19[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_19[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_19[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_19[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_19[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_19[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_19[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_19[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_19[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_19[1];
                                                Read_data_out_2 <= RAM_19[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            20:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_20[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_20[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_20[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_20[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_20[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_20[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_20[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_20[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_20[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_20[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_20[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_20[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_20[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_20[1];
                                                Read_data_out_2 <= RAM_20[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            21:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_21[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_21[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_21[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_21[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_21[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_21[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_21[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_21[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_21[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_21[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_21[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_21[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_21[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_21[1];
                                                Read_data_out_2 <= RAM_21[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            22:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_22[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_22[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_22[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_22[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_22[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_22[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_22[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_22[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_22[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_22[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_22[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_22[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_22[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_22[1];
                                                Read_data_out_2 <= RAM_22[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            23:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_23[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_23[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_23[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_23[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_23[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_23[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_23[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_23[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_23[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_23[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_23[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_23[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_23[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_23[1];
                                                Read_data_out_2 <= RAM_23[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            24:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_24[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_24[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_24[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_24[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_24[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_24[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_24[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_24[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_24[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_24[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_24[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_24[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_24[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_24[1];
                                                Read_data_out_2 <= RAM_24[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            25:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_25[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_25[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_25[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_25[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_25[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_25[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_25[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_25[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_25[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_25[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_25[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_25[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_25[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_25[1];
                                                Read_data_out_2 <= RAM_25[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            26:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_26[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_26[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_26[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_26[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_26[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_26[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_26[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_26[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_26[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_26[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_26[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_26[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_26[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_26[1];
                                                Read_data_out_2 <= RAM_26[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            27:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_27[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_27[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_27[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_27[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_27[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_27[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_27[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_27[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_27[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_27[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_27[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_27[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_27[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_27[1];
                                                Read_data_out_2 <= RAM_27[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            28:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_28[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_28[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_28[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_28[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_28[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_28[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_28[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_28[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_28[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_28[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_28[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_28[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_28[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_28[1];
                                                Read_data_out_2 <= RAM_28[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            29:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_29[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_29[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_29[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_29[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_29[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_29[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_29[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_29[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_29[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_29[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_29[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_29[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_29[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_29[1];
                                                Read_data_out_2 <= RAM_29[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            30:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_30[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_30[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_30[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_30[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_30[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_30[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_30[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_30[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_30[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_30[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_30[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_30[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_30[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_30[1];
                                                Read_data_out_2 <= RAM_30[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end
                            31:
                                begin
                                    // The first data is always valid
                                    Read_data_out_0 <= RAM_31[Read_Width];

                                    case(Global_MaxPool_State_Machine)
                                        4'b0001:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 256 - 1) ? RAM_31[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 256 - 1) ? RAM_31[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 256 - 1) ? RAM_31[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 256 - 1) ? RAM_31[Read_Width + 1] : 0;
                                            end
                                        4'b0010:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 52 - 1) ? RAM_31[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 52 - 1) ? RAM_31[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 52 - 1) ? RAM_31[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 52 - 1) ? RAM_31[Read_Width + 1] : 0;
                                            end
                                        4'b0100:
                                            begin
                                                Read_data_out_1 <= (Read_Width < 11 - 1) ? RAM_31[Read_Width + 1] : 0;
                                                Read_data_out_2 <= (Read_Width < 11 - 1) ? RAM_31[Read_Width + 1] : 0;
                                                Read_data_out_3 <= (Read_Width < 11 - 1) ? RAM_31[Read_Width + 1] : 0;
                                                Read_data_out_4 <= (Read_Width < 11 - 1) ? RAM_31[Read_Width + 1] : 0;
                                            end
                                        4'b1000:
                                            begin
                                                Read_data_out_1 <= RAM_31[1];
                                                Read_data_out_2 <= RAM_31[2];
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                        default:
                                            begin
                                                Read_data_out_1 <= 0;
                                                Read_data_out_2 <= 0;
                                                Read_data_out_3 <= 0;
                                                Read_data_out_4 <= 0;
                                            end
                                    endcase
                                end


                            default:
                                begin
                                    Read_data_out_0 <= 0;
                                    Read_data_out_1 <= 0;
                                    Read_data_out_2 <= 0;
                                    Read_data_out_3 <= 0;
                                    Read_data_out_4 <= 0;
                                end

                        endcase
                    end
                FC_1st:
                    begin
                        Read_data_out_0 <= RAM_0[Read_Width];
                        Read_data_out_1 <= (Read_Width < 32 - 1) ? RAM_0[Read_Width + 1] : 0;
                        Read_data_out_2 <= (Read_Width < 32 - 2) ? RAM_0[Read_Width + 2] : 0;
                        Read_data_out_3 <= (Read_Width < 32 - 3) ? RAM_0[Read_Width + 3] : 0;
                        Read_data_out_4 <= (Read_Width < 32 - 4) ? RAM_0[Read_Width + 4] : 0;
                    end
                FC_2nd:
                    begin
                        Read_data_out_0 <= RAM_0[Read_Width];
                        Read_data_out_1 <= (Read_Width < 16 - 1) ? RAM_0[Read_Width + 1] : 0;
                        Read_data_out_2 <= (Read_Width < 16 - 2) ? RAM_0[Read_Width + 2] : 0;
                        Read_data_out_3 <= (Read_Width < 16 - 3) ? RAM_0[Read_Width + 3] : 0;
                        Read_data_out_4 <= (Read_Width < 16 - 4) ? RAM_0[Read_Width + 4] : 0;
                    end
                default:
                    begin
                        Read_data_out_0 <= 0;
                        Read_data_out_1 <= 0;
                        Read_data_out_2 <= 0;
                        Read_data_out_3 <= 0;
                        Read_data_out_4 <= 0;
                    end
            endcase
        end else begin
            Read_data_out_0 <= 0;
            Read_data_out_1 <= 0;
            Read_data_out_2 <= 0;
            Read_data_out_3 <= 0;
            Read_data_out_4 <= 0;
        end
    end

    always @ (negedge Clk) begin
        // Write
        if (Write_Enable) begin
            case (Write_Mode)
                Receiver:
                    begin
                        if(Write_Width < 256)
                            RAM_46[Write_Width] <= Data_in;
                        else
                            RAM_47[Write_Width - 256] <= Data_in;
                    end
                CONV1D_1st:
                    begin
                        case(Write_Depth)
                            0:
                                begin
                                    if(Write_Width < 256)
                                        RAM_0[Write_Width] <= Data_in;
                                    else
                                        RAM_1[Write_Width - 256] <= Data_in;
                                end
                            1:
                                begin
                                    if(Write_Width < 256)
                                        RAM_2[Write_Width] <= Data_in;
                                    else
                                        RAM_3[Write_Width - 256] <= Data_in;
                                end
                            2:
                                begin
                                    if(Write_Width < 256)
                                        RAM_4[Write_Width] <= Data_in;
                                    else
                                        RAM_5[Write_Width - 256] <= Data_in;
                                end
                            3:
                                begin
                                    if(Write_Width < 256)
                                        RAM_6[Write_Width] <= Data_in;
                                    else
                                        RAM_7[Write_Width - 256] <= Data_in;
                                end
                            4:
                                begin
                                    if(Write_Width < 256)
                                        RAM_8[Write_Width] <= Data_in;
                                    else
                                        RAM_9[Write_Width - 256] <= Data_in;
                                end
                            5:
                                begin
                                    if(Write_Width < 256)
                                        RAM_10[Write_Width] <= Data_in;
                                    else
                                        RAM_11[Write_Width - 256] <= Data_in;
                                end
                            6:
                                begin
                                    if(Write_Width < 256)
                                        RAM_12[Write_Width] <= Data_in;
                                    else
                                        RAM_13[Write_Width - 256] <= Data_in;
                                end
                            7:
                                begin
                                    if(Write_Width < 256)
                                        RAM_14[Write_Width] <= Data_in;
                                    else
                                        RAM_15[Write_Width - 256] <= Data_in;
                                end
                            default:
                                begin
                                    // Do nothing
                                end
                        endcase
                    end
                MaxPool:
                    begin
                        case(Write_Depth)
                            0: RAM_16[Write_Width] <= Data_in;
                            1: RAM_17[Write_Width] <= Data_in;
                            2: RAM_18[Write_Width] <= Data_in;
                            3: RAM_19[Write_Width] <= Data_in;
                            4: RAM_20[Write_Width] <= Data_in;
                            5: RAM_21[Write_Width] <= Data_in;
                            6: RAM_22[Write_Width] <= Data_in;
                            7: RAM_23[Write_Width] <= Data_in;
                            default:
                                begin   
                                    // do nothing
                                end
                        endcase
                    end
                CONV1D_2nd:
                    begin
                        case (Write_Depth)
                            0 : RAM_32[Write_Width] <= Data_in;
                            1 : RAM_33[Write_Width] <= Data_in;
                            2 : RAM_34[Write_Width] <= Data_in;
                            3 : RAM_35[Write_Width] <= Data_in;
                            4 : RAM_36[Write_Width] <= Data_in;
                            5 : RAM_37[Write_Width] <= Data_in;
                            6 : RAM_38[Write_Width] <= Data_in;
                            7 : RAM_39[Write_Width] <= Data_in;
                            8 : RAM_40[Write_Width] <= Data_in;
                            9 : RAM_41[Write_Width] <= Data_in;
                            10: RAM_42[Write_Width] <= Data_in;
                            11: RAM_43[Write_Width] <= Data_in;
                            12: RAM_44[Write_Width] <= Data_in;
                            13: RAM_45[Write_Width] <= Data_in;
                            14: RAM_46[Write_Width] <= Data_in;
                            15: RAM_47[Write_Width] <= Data_in;
                            default:
                                begin   
                                    // do nothign
                                end
                        endcase
                    end
                CONV1D_3rd:
                    begin
                        case (Write_Depth)
                            0 : RAM_0[Write_Width] <= Data_in;
                            1 : RAM_1[Write_Width] <= Data_in;
                            2 : RAM_2[Write_Width] <= Data_in;
                            3 : RAM_3[Write_Width] <= Data_in;
                            4 : RAM_4[Write_Width] <= Data_in;
                            5 : RAM_5[Write_Width] <= Data_in;
                            6 : RAM_6[Write_Width] <= Data_in;
                            7 : RAM_7[Write_Width] <= Data_in;
                            8 : RAM_8[Write_Width] <= Data_in;
                            9 : RAM_9[Write_Width] <= Data_in;
                            10: RAM_10[Write_Width] <= Data_in;
                            11: RAM_11[Write_Width] <= Data_in;
                            12: RAM_12[Write_Width] <= Data_in;
                            13: RAM_13[Write_Width] <= Data_in;
                            14: RAM_14[Write_Width] <= Data_in;
                            15: RAM_15[Write_Width] <= Data_in;
                            16: RAM_16[Write_Width] <= Data_in;
                            17: RAM_17[Write_Width] <= Data_in;
                            18: RAM_18[Write_Width] <= Data_in;
                            19: RAM_19[Write_Width] <= Data_in;
                            20: RAM_20[Write_Width] <= Data_in;
                            21: RAM_21[Write_Width] <= Data_in;
                            22: RAM_22[Write_Width] <= Data_in;
                            23: RAM_23[Write_Width] <= Data_in;
                            24: RAM_24[Write_Width] <= Data_in;
                            25: RAM_25[Write_Width] <= Data_in;
                            26: RAM_26[Write_Width] <= Data_in;
                            27: RAM_27[Write_Width] <= Data_in;
                            28: RAM_28[Write_Width] <= Data_in;
                            29: RAM_29[Write_Width] <= Data_in;
                            30: RAM_30[Write_Width] <= Data_in;
                            31: RAM_31[Write_Width] <= Data_in;
                            default: 
                                begin
                                    // do nothing
                                end
                        endcase
                    end
                Global_MaxPool:
                    begin
                        RAM_0[Write_Width] <= Data_in;
                    end
                FC_1st:
                    begin
                        RAM_1[Write_Width] <= Data_in;
                    end
                FC_2nd:
                    begin
                        RAM_0[0] <= Data_in;
                    end
                default:
                    begin
                        // Do nothing
                    end
            endcase
        end
    end
endmodule
