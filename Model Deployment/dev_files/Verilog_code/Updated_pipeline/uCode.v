`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/26 22:01:30
// Design Name: 
// Module Name: Comparator
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

module uCode
    (
        // Input
        input Clk,
        input [8:0] Compute_stage,
        input [3:0] Height, 
        input [4:0] Depth,
        input [8:0] Width,

        // Output
        output reg [12:0] pipeline_uCode,
        output reg [23:0] Data_Read_uCode,
        output reg [23:0] Data_Write_uCode,
        output reg [14:0] Weight_Read_uCode
    );

    // localparam declaration
    localparam CONV1D_1st = 9'b0010_0000_0;
    localparam MaxPool = 9'b0001_0000_0; 
    localparam CONV1D_2nd = 9'b0000_1000_0; 
    localparam CONV1D_3rd = 9'b0000_0100_0; 
    localparam Global_MaxPool = 9'b0000_0010_0; 
    localparam FC_1st = 9'b0000_0001_0; 
    localparam FC_2nd = 9'b0000_0000_1; 
    /*
        Pipeline uCode:

        Bit 12: Adder_Input_Reg
        Bit 11: Adder_Ctrl_Reg[1]
        Bit 10: Adder_Ctrl_Reg[0]
        Bit 9 : Mul_Path_Enable_Reg[5]
        Bit 8 : Mul_Path_Enable_Reg[4]
        Bit 7 : Mul_Path_Enable_Reg[3] 
        Bit 6 : Mul_Path_Enable_Reg[2]
        Bit 5 : Mul_Path_Enable_Reg[1]
        Bit 4 : Mul_Path_Enable_Reg[0]
        Bit 3 : Mul_Mux_Control_reg
        Bit 2 : Mul_Mux_Sel_Reg
        Bit 1 : ALU_Mux_Reg
        Bit 0 : Compute_Done_Reg
    */

    /*
        Weight Read uCode
        
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
    */

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

    always @ (posedge Clk) begin

        // Data Read related constant
        Data_Read_uCode[9:1] <= Compute_stage;

        // Data Write related constant
        Data_Write_uCode[9:1] <= Compute_stage;

        case (Compute_stage)
            CONV1D_1st:
                begin
                    // Pipeline uCode related
                    pipeline_uCode[12] <= 0;
                    pipeline_uCode[11:10] <= 2'b11;
                    pipeline_uCode[9:4] <= 6'b111111;
                    pipeline_uCode[3] <= 0;
                    pipeline_uCode[2] <= 0;
                    pipeline_uCode[1] <= 0;
                    pipeline_uCode[0] <= 0;

                    // Weight Read uCode related
                    Weight_Read_uCode[14:11] <= 0;
                    Weight_Read_uCode[10:6] <= Depth;
                    Weight_Read_uCode[5:1] <= 5'b10000;
                    Weight_Read_uCode[0] <= 1;

                    // Data Read uCode related
                    Data_Read_uCode[23:15] <= Width;
                    Data_Read_uCode[14:10] <= 0;
                    Data_Read_uCode[0] <= 1;

                    // Data Write uCode related
                    Data_Write_uCode[23:15] <= Width;
                    Data_Write_uCode[14:10] <= Depth;
                    Data_Write_uCode[0] <= 1;
                end
            MaxPool:
                begin
                    // Pipelining uCode related
                    pipeline_uCode[12] <= 0;
                    pipeline_uCode[11:10] <= 2'b0;
                    pipeline_uCode[9:4] <= 6'b0;
                    pipeline_uCode[3] <= 1;
                    pipeline_uCode[2] <= 1;
                    pipeline_uCode[1] <= 1;
                    pipeline_uCode[0] <= 0;

                    // Weight Read uCode related
                    Weight_Read_uCode <= 0;

                    // Data Read uCode related
                    Data_Read_uCode[23:15] <= Width << 1; // basically width * 2 because we are doing stride = 2
                    Data_Read_uCode[14:10] <= Depth;
                    Data_Read_uCode[0] <= 1;

                    // Data Write uCode related
                    Data_Write_uCode[23:15] <= Width;
                    Data_Write_uCode[14:10] <= Depth;
                    Data_Write_uCode[0] <= 1;
                end
            CONV1D_2nd:
                begin
                    // Pipelining uCode related
                    pipeline_uCode[12] <= (Height == 0) ? 0 : 1;
                    pipeline_uCode[11:10] <= (Height == 7) ? 2'b11: 2'b0;
                    pipeline_uCode[9:4] <= (Height == 0) ? 6'b111100 : 6'b011100;
                    pipeline_uCode[3] <= 0;
                    pipeline_uCode[2] <= 0;
                    pipeline_uCode[1] <= 0;
                    pipeline_uCode[0] <= 0;

                    // Weight Read uCode related
                    Weight_Read_uCode[14:11] <= Height;
                    Weight_Read_uCode[10:6] <= Depth;
                    Weight_Read_uCode[5:1] <= 5'b01000;
                    Weight_Read_uCode[0] <= 1;

                    // Data Read uCode related
                    Data_Read_uCode[23:15] <= Width;
                    Data_Read_uCode[14:10] <= {{1'b0}, Height}; // extend Height to 5 bit
                    Data_Read_uCode[0] <= 1;

                    // Data Write uCode related
                    Data_Write_uCode[23:15] <= Width;
                    Data_Write_uCode[14:10] <= Depth;
                    Data_Write_uCode[0] <= 1;
                end
            CONV1D_3rd:
                begin
                    // Pipelining uCode related
                    pipeline_uCode[12] <= (Height == 0) ? 0 : 1;
                    pipeline_uCode[11:10] <= (Height == 15) ? 2'b11: 2'b0;
                    pipeline_uCode[9:4] <= (Height == 0) ? 6'b111100 : 6'b011100;
                    pipeline_uCode[3] <= 0;
                    pipeline_uCode[2] <= 0;
                    pipeline_uCode[1] <= 0;
                    pipeline_uCode[0] <= 0;

                    // Weight Read uCode related
                    Weight_Read_uCode[14:11] <= Height;
                    Weight_Read_uCode[10:6] <= Depth;
                    Weight_Read_uCode[5:1] <= 5'b00100;
                    Weight_Read_uCode[0] <= 1;

                    // Data Read uCode related
                    Data_Read_uCode[23:15] <= Width;
                    Data_Read_uCode[14:10] <= {{1'b0}, Height}; // extend Height to 5 bit
                    Data_Read_uCode[0] <= 1;

                    // Data Write uCode related
                    Data_Write_uCode[23:15] <= Width;
                    Data_Write_uCode[14:10] <= Depth;
                    Data_Write_uCode[0] <= 1;
                end
            Global_MaxPool:
                begin
                    // Pipelining uCode related
                    pipeline_uCode[12] <= 0;
                    pipeline_uCode[11:10] <= 2'b0;
                    pipeline_uCode[9:4] <= 6'b0;
                    pipeline_uCode[3] <= 1;
                    pipeline_uCode[2] <= 1;
                    pipeline_uCode[1] <= 1;
                    pipeline_uCode[0] <= 0;

                    // Weight Read uCode related
                    Weight_Read_uCode <= 0;

                    // Data Read uCode related
                    Data_Read_uCode[23:15] <= Width;
                    Data_Read_uCode[14:10] <= Depth;
                    Data_Read_uCode[0] <= 1;

                    // Data Write uCode related
                    Data_Write_uCode[23:15] <= { {4'b0}, Depth};
                    Data_Write_uCode[14:10] <= 0;
                    Data_Write_uCode[0] <= 1;
                end
            FC_1st:
                begin
                    // Pipelining uCode related
                    // Pipelining uCode related
                    pipeline_uCode[12] <= (Width == 0);
                    pipeline_uCode[11:10] <= (Width == 6) ? 2'b11 : 2'b00; // 5 * 7 = 35 and we have a total of 32 calcualtions
                    pipeline_uCode[9:4] <= (Width == 0) ? 6'b111111 : 6'b011111;
                    pipeline_uCode[3] <= 0;
                    pipeline_uCode[2] <= 0;
                    pipeline_uCode[1] <= 0;
                    pipeline_uCode[0] <= 0;

                    // Weight Read uCode related
                    Weight_Read_uCode[14:11] <= Width[3:0];
                    Weight_Read_uCode[10:6] <= Depth;
                    Weight_Read_uCode[5:1] <= 5'b00010;
                    Weight_Read_uCode[0] <= 1;

                    // Data Read uCode related
                    Data_Read_uCode[23:15] <= Width * 5;
                    Data_Read_uCode[14:10] <= 0;
                    Data_Read_uCode[0] <= 1;

                    // Data Write uCode related
                    Data_Write_uCode[23:15] <= { {4'b0}, Depth};
                    Data_Write_uCode[14:10] <= 0;
                    Data_Write_uCode[0] <= 1;
                end
            FC_2nd:
                begin
                    // Pipelining uCode related
                    pipeline_uCode[12] <= (Width == 0);
                    pipeline_uCode[11:10] <= (Width == 4) ? 2'b11 : 2'b00; // 5 * 4 = 20 and we have a total of 16 calculations
                    pipeline_uCode[9:4] <= (Width == 0) ? 6'b111111 : 6'b011111;
                    pipeline_uCode[3] <= 0;
                    pipeline_uCode[2] <= 0;
                    pipeline_uCode[1] <= 0;
                    pipeline_uCode[0] <= (Width == 4) ? 1 : 0; // last cycle will be 1

                    // Weight Read uCode related
                    Weight_Read_uCode[14:11] <= Width[3:0];
                    Weight_Read_uCode[10:6] <= 0;
                    Weight_Read_uCode[5:1] <= 5'b00001;
                    Weight_Read_uCode[0] <= 1;

                    // Data Read uCode related
                    Data_Read_uCode[23:15] <= 0;
                    Data_Read_uCode[14:10] <= 0;
                    Data_Read_uCode[0] <= 1;
                end
            default: // all zeros
                begin
                    pipeline_uCode <= 0;
                    Data_Read_uCode <= 0;
                    Data_Write_uCode <= 0;
                    Weight_Read_uCode <= 0;
                end
        endcase
    end

endmodule