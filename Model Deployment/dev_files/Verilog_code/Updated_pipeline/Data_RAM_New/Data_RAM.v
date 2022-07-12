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
        // input [3:0] Global_MaxPool_State_Machine,

        // Output
        output reg [Bit_width-1:0] Read_data_out_0,
        output reg [Bit_width-1:0] Read_data_out_1,
        output reg [Bit_width-1:0] Read_data_out_2,
        output reg [Bit_width-1:0] Read_data_out_3,
        output reg [Bit_width-1:0] Read_data_out_4
    );

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

    // Read wires from all of the outputs
    // Conv 1D 1st
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_1st_0;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_1st_1;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_1st_2;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_1st_3;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_1st_4;

    // MaxPool
    wire [Bit_width - 1 : 0] Data_out_MaxPool_0;
    wire [Bit_width - 1 : 0] Data_out_MaxPool_1;
    wire [Bit_width - 1 : 0] Data_out_MaxPool_2;
    wire [Bit_width - 1 : 0] Data_out_MaxPool_3;
    wire [Bit_width - 1 : 0] Data_out_MaxPool_4;

    // Conv 1D 2nd // only 4 output (1 bias + three weights)
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_2nd_0;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_2nd_1;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_2nd_2;

    // Conv 1D 3rd // only 4 output (1 bias + three weights)
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_3rd_0;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_3rd_1;
    wire [Bit_width - 1 : 0] Data_out_CONV_1D_3rd_2;

    // Global MaxPool
    wire [Bit_width - 1 : 0] Data_out_Global_MaxPool_0;
    wire [Bit_width - 1 : 0] Data_out_Global_MaxPool_1;
    wire [Bit_width - 1 : 0] Data_out_Global_MaxPool_2;
    wire [Bit_width - 1 : 0] Data_out_Global_MaxPool_3;
    wire [Bit_width - 1 : 0] Data_out_Global_MaxPool_4;

    // FC 1st
    wire [Bit_width - 1 : 0] Data_out_FC_1st_0;
    wire [Bit_width - 1 : 0] Data_out_FC_1st_1;
    wire [Bit_width - 1 : 0] Data_out_FC_1st_2;
    wire [Bit_width - 1 : 0] Data_out_FC_1st_3;
    wire [Bit_width - 1 : 0] Data_out_FC_1st_4;

    // FC 2nd
    wire [Bit_width - 1 : 0] Data_out_FC_2nd_0;
    wire [Bit_width - 1 : 0] Data_out_FC_2nd_1;
    wire [Bit_width - 1 : 0] Data_out_FC_2nd_2;
    wire [Bit_width - 1 : 0] Data_out_FC_2nd_3;
    wire [Bit_width - 1 : 0] Data_out_FC_2nd_4;

    /**************** Write wires ****************/
    // RX
    wire RX_Write_Enable;
    assign RX_Write_Enable = Write_Enable & Write_Mode[8];

    // TX
    // wire TX_Write_Enable;
    // assign TX_Write_Enable = Write_Enable & Write_Mode[7];

    // Conv 1D 1st
    wire CONV1D_1st_Write_Enable;
    assign CONV1D_1st_Write_Enable = Write_Enable & Write_Mode[6];

    // MaxPool
    wire MaxPool_Write_Enable;
    assign MaxPool_Write_Enable = Write_Enable & Write_Mode[5];

    // CONV 1D 2nd
    wire CONV1D_2nd_Write_Enable;
    assign CONV1D_2nd_Write_Enable = Write_Enable & Write_Mode[4];

    // CONV 1D 3rd
    wire CONV1D_3rd_Write_Enable;
    assign CONV1D_3rd_Write_Enable = Write_Enable & Write_Mode[3];

    // Global MaxPool
    wire Global_MaxPool_Write_Enable;
    assign Global_MaxPool_Write_Enable = Write_Enable & Write_Mode[2];

    // FC 1st
    wire FC_1st_Write_Enable;
    assign FC_1st_Write_Enable = Write_Enable & Write_Mode[1];

    // FC 2nd
    wire FC_2nd_Write_Enable;
    assign FC_2nd_Write_Enable = Write_Enable & Write_Mode[0];

    /**************** Read wires ****************/
    // Conv 1D 1st
    wire CONV1D_1st_Read_Enable;
    assign CONV1D_1st_Read_Enable = Read_Enable & Read_Mode[6];

    // MaxPool
    wire MaxPool_Read_Enable;
    assign MaxPool_Read_Enable = Read_Enable & Read_Mode[5];

    // CONV 1D 2nd
    wire CONV1D_2nd_Read_Enable;
    assign CONV1D_2nd_Read_Enable = Read_Enable & Read_Mode[4];

    // CONV 1D 3rd
    wire CONV1D_3rd_Read_Enable;
    assign CONV1D_3rd_Read_Enable = Read_Enable & Read_Mode[3];

    // Global MaxPool
    wire Global_MaxPool_Read_Enable;
    assign Global_MaxPool_Read_Enable = Read_Enable & Read_Mode[2];

    // FC 1st
    wire FC_1st_Read_Enable;
    assign FC_1st_Read_Enable = Read_Enable & Read_Mode[1];

    // FC 2nd
    wire FC_2nd_Read_Enable;
    assign FC_2nd_Read_Enable = Read_Enable & Read_Mode[0];

    /**************** Wire Declaration End ************/

    // Result register
    reg [Bit_width - 1 : 0] Result = 0;
    always @ (posedge Clk) begin
        Result <= FC_2nd_Write_Enable ? Data_in : 0;
    end

    // Pure Combinational Logic
    always @ (*) begin
        // Read
        if (Read_Enable) begin
            case (Read_Mode)
                CONV1D_1st:
                    begin
                        Read_data_out_0 = Data_out_CONV_1D_1st_0;
                        Read_data_out_1 = Data_out_CONV_1D_1st_1;
                        Read_data_out_2 = Data_out_CONV_1D_1st_2;
                        Read_data_out_3 = Data_out_CONV_1D_1st_3;
                        Read_data_out_4 = Data_out_CONV_1D_1st_4;
                    end
                MaxPool:
                    begin
                        Read_data_out_0 = Data_out_MaxPool_0;
                        Read_data_out_1 = Data_out_MaxPool_1;
                        Read_data_out_2 = Data_out_MaxPool_2;
                        Read_data_out_3 = Data_out_MaxPool_3;
                        Read_data_out_4 = Data_out_MaxPool_4;
                    end
                CONV1D_2nd:
                    begin
                        Read_data_out_0 = Data_out_CONV_1D_2nd_0;
                        Read_data_out_1 = Data_out_CONV_1D_2nd_1;
                        Read_data_out_2 = Data_out_CONV_1D_2nd_2;
                        Read_data_out_3 = 0;
                        Read_data_out_4 = 0;
                    end
                CONV1D_3rd:
                    begin
                        Read_data_out_0 = Data_out_CONV_1D_3rd_0;
                        Read_data_out_1 = Data_out_CONV_1D_3rd_1;
                        Read_data_out_2 = Data_out_CONV_1D_3rd_2;
                        Read_data_out_3 = 0;
                        Read_data_out_4 = 0;
                    end
                Global_MaxPool:
                    begin
                        Read_data_out_0 = Data_out_Global_MaxPool_0;
                        Read_data_out_1 = Data_out_Global_MaxPool_1;
                        Read_data_out_2 = Data_out_Global_MaxPool_2;
                        Read_data_out_3 = Data_out_Global_MaxPool_3;
                        Read_data_out_4 = Data_out_Global_MaxPool_4;
                    end
                FC_1st:
                    begin
                        Read_data_out_0 = Data_out_FC_1st_0;
                        Read_data_out_1 = Data_out_FC_1st_1;
                        Read_data_out_2 = Data_out_FC_1st_2;
                        Read_data_out_3 = Data_out_FC_1st_3;
                        Read_data_out_4 = Data_out_FC_1st_4;
                    end
                FC_2nd:
                    begin
                        Read_data_out_0 = Data_out_FC_2nd_0;
                        Read_data_out_1 = Data_out_FC_2nd_1;
                        Read_data_out_2 = Data_out_FC_2nd_2;
                        Read_data_out_3 = Data_out_FC_2nd_3;
                        Read_data_out_4 = Data_out_FC_2nd_4;
                    end
                default:
                    begin
                        Read_data_out_0 = Result;
                        Read_data_out_1 = 0;
                        Read_data_out_2 = 0;
                        Read_data_out_3 = 0;
                        Read_data_out_4 = 0;
                    end
            endcase
        end else begin
            Read_data_out_0 = Result;
            Read_data_out_1 = 0;
            Read_data_out_2 = 0;
            Read_data_out_3 = 0;
            Read_data_out_4 = 0;
        end
    end

    // Submodule RAM declaration
    CONV1D_1st_Data_RAM CONV1D_1st_Data_RAM( // A
        .CLK(Clk),
        
        // Input (Write)
        .Write_Enable(RX_Write_Enable),
        .Write_Width(Write_Width),
        .data_in(Data_in),

        // Input (Read)
        .Read_Enable(CONV1D_1st_Read_Enable),
        .Read_Width(Read_Width),
        
        // Output
        .data_out_0(Data_out_CONV_1D_1st_0),
        .data_out_1(Data_out_CONV_1D_1st_1),
        .data_out_2(Data_out_CONV_1D_1st_2),
        .data_out_3(Data_out_CONV_1D_1st_3),
        .data_out_4(Data_out_CONV_1D_1st_4)
    );

    MaxPool_Data_RAM MaxPool_Data_RAM( // B
        .CLK(Clk),
        
        // Input (Write)
        .Write_Enable(CONV1D_1st_Write_Enable),
        .Write_Depth(Write_Depth[2:0]),
        .Write_Width(Write_Width),
        .data_in(Data_in),

        // Input (Read)
        .Read_Enable(MaxPool_Read_Enable),
        .Read_Depth(Read_Depth[2:0]),
        .Read_Width(Read_Width),
        
        // Output
        .data_out_0(Data_out_MaxPool_0),
        .data_out_1(Data_out_MaxPool_1),
        .data_out_2(Data_out_MaxPool_2),
        .data_out_3(Data_out_MaxPool_3),
        .data_out_4(Data_out_MaxPool_4)
    );

    CONV1D_2nd_Data_RAM CONV1D_2nd_Data_RAM( // C
        .CLK(Clk),
        
        // Input (Write)
        .Write_Enable(MaxPool_Write_Enable),
        .Write_Depth(Write_Depth[2:0]),
        .Write_Width(Write_Width[7:0]),
        .data_in(Data_in),

        // Input (Read)
        .Read_Enable(CONV1D_2nd_Read_Enable),
        .Read_Depth(Read_Depth[2:0]),
        .Read_Width(Read_Width[7:0]),
        
        // Output
        .data_out_0(Data_out_CONV_1D_2nd_0),
        .data_out_1(Data_out_CONV_1D_2nd_1),
        .data_out_2(Data_out_CONV_1D_2nd_2)
    );

    CONV1D_3rd_Data_RAM CONV1D_3rd_Data_RAM( // D
        .CLK(Clk),
        
        // Input (Write)
        .Write_Enable(CONV1D_2nd_Write_Enable),
        .Write_Depth(Write_Depth[3:0]),
        .Write_Width(Write_Width[7:0]),
        .data_in(Data_in),

        // Input (Read)
        .Read_Enable(CONV1D_3rd_Read_Enable),
        .Read_Depth(Read_Depth[3:0]),
        .Read_Width(Read_Width[7:0]),
        
        // Output
        .data_out_0(Data_out_CONV_1D_3rd_0),
        .data_out_1(Data_out_CONV_1D_3rd_1),
        .data_out_2(Data_out_CONV_1D_3rd_2)
    );

    Global_MaxPool_Data_RAM Global_MaxPool_Data_RAM( // E
        .CLK(Clk),
        
        // Input (Write)
        .Write_Enable(CONV1D_3rd_Write_Enable),
        .Write_Depth(Write_Depth),
        .Write_Width(Write_Width[7:0]),
        .data_in(Data_in),

        // Input (Read)
        .Read_Enable(Global_MaxPool_Read_Enable),
        .Read_Depth(Read_Depth),
        .Read_Width(Read_Width[7:0]),
        
        // Output
        .data_out_0(Data_out_Global_MaxPool_0),
        .data_out_1(Data_out_Global_MaxPool_1),
        .data_out_2(Data_out_Global_MaxPool_2),
        .data_out_3(Data_out_Global_MaxPool_3),
        .data_out_4(Data_out_Global_MaxPool_4)
    );

    FC_1st_Data_RAM FC_1st_Data_RAM( // F
        .CLK(Clk),
        
        // Input (Write)
        .Write_Enable(Global_MaxPool_Write_Enable),
        .Write_Width(Write_Width[4:0]),
        .data_in(Data_in),

        // Input (Read)
        .Read_Enable(FC_1st_Read_Enable),
        .Read_Width(Read_Width[4:0]),
        
        // Output
        .data_out_0(Data_out_FC_1st_0),
        .data_out_1(Data_out_FC_1st_1),
        .data_out_2(Data_out_FC_1st_2),
        .data_out_3(Data_out_FC_1st_3),
        .data_out_4(Data_out_FC_1st_4)
    );

    FC_2nd_Data_RAM FC_2nd_Data_RAM( // G
        .CLK(Clk),
        
        // Input (Write)
        .Write_Enable(FC_1st_Write_Enable),
        .Write_Width(Write_Width[3:0]),
        .data_in(Data_in),

        // Input (Read)
        .Read_Enable(FC_2nd_Read_Enable),
        .Read_Width(Read_Width[3:0]),
        
        // Output
        .data_out_0(Data_out_FC_2nd_0),
        .data_out_1(Data_out_FC_2nd_1),
        .data_out_2(Data_out_FC_2nd_2),
        .data_out_3(Data_out_FC_2nd_3),
        .data_out_4(Data_out_FC_2nd_4)
    );

endmodule
