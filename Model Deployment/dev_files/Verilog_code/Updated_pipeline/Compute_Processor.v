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


module Compute_Processor
    #(
        parameter Bit_width = 16
    )
    (
    // input
    input Clk,
    input Enable,

    // Data
    input [Bit_width - 1 : 0] Data_read_out_0,
    input [Bit_width - 1 : 0] Data_read_out_1,
    input [Bit_width - 1 : 0] Data_read_out_2,
    input [Bit_width - 1 : 0] Data_read_out_3,
    input [Bit_width - 1 : 0] Data_read_out_4,

    // Address & RAM Enables for Data
    output reg [23:0] Data_Read_Control, // 24 bit (refer to google doc for detailed mapping)
    output reg [23:0] Data_Write_Control, // 24 bit (refer to google doc for detailed mapping)
    output reg [Bit_width - 1 : 0] Data_Write, // Write data 

    // Others
    output reg Compute_Done
    // output reg [3:0] Height
    );

    // Parameter declaration
    /*
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
    localparam Pipelining_Control_uCode_bit_width = 13;

    localparam CONV1D_1st = 9'b0010_0000_0; localparam CONV1D_1st_depth_num = 5'd7; localparam CONV1D_1st_width_num = 9'd511;
    localparam MaxPool = 9'b0001_0000_0; localparam MaxPool_depth_num = 5'd7; localparam MaxPool_width_num = 9'd255;
    localparam CONV1D_2nd = 9'b0000_1000_0; localparam CONV1D_2nd_height_num = 4'd7; localparam CONV1D_2nd_depth_num = 5'd15; localparam CONV1D_2nd_width_num = 9'd255;
    localparam CONV1D_3rd = 9'b0000_0100_0; localparam CONV1D_3rd_height_num = 4'd15; localparam CONV1D_3rd_depth_num = 5'd31; localparam CONV1D_3rd_width_num = 9'd255;
    localparam Global_MaxPool = 9'b0000_0010_0; localparam Global_MaxPool_depth_num = 5'd31; localparam Global_MaxPool_width_num_0 = 9'd51; localparam Global_MaxPool_width_num_1 = 9'd10; localparam Global_MaxPool_width_num_2 = 9'd2; 
    localparam FC_1st = 9'b0000_0001_0; localparam FC_1st_depth_num = 5'd15; localparam FC_1st_width_num = 9'd6;
    localparam FC_2nd = 9'b0000_0000_1; localparam FC_2nd_width_num = 9'd3; 

    // Instruction related declaration & Assignment
    reg [8:0] Compute_stage = CONV1D_1st;
    reg [3:0] Height = 0; // moved to output
    reg [4:0] Depth = 0;
    reg [8:0] Width = 0;
    reg delay_by_1_cycle = 0;

    // Code Gen iteration --> Pretty complicated because we have to cater for the whole pipeline but it is essentially a giant state machine that only outputs height, depth and width based on Compute_stage
    always @ (posedge Clk) begin
        if (Enable) begin
            case (Compute_stage)
                CONV1D_1st:
                    begin
                        if (delay_by_1_cycle) begin
                            if (Depth == CONV1D_1st_depth_num && Width == CONV1D_1st_width_num) begin // State transtion trigger
                                Compute_stage <= MaxPool;
                                Depth <= 0; Width <= 0; Height <= 0;
                                delay_by_1_cycle <= 0;
                            end else begin // else keep incrementing address
                                Width <= Width + 1; // Cos 9 bit max is basically 512 and thus we don't need to active reset it
                                Depth <= (Width == CONV1D_1st_width_num) ? Depth + 1 : Depth;
                            end
                        end else begin
                            // reset
                            Compute_stage <= CONV1D_1st;
                            Depth <= 0; Width <= 0; Height <= 0;
                            delay_by_1_cycle <= 1; // Delay the whole thing by cycle
                        end
                    end
                MaxPool:
                    begin
                        if (delay_by_1_cycle) begin
                            if (Depth == MaxPool_depth_num && Width == MaxPool_width_num) begin // State transtion trigger
                                Compute_stage <= CONV1D_2nd;
                                Depth <= 0; Width <= 0; Height <= 0;
                                delay_by_1_cycle <= 0;
                            end else begin // else keep incrementing address
                                Width <= (Width == MaxPool_width_num) ? 0 : Width + 1;
                                Depth <= (Width == MaxPool_width_num) ? Depth + 1 : Depth;
                            end
                        end else begin
                            // reset
                            Compute_stage <= MaxPool;
                            Depth <= 0; Width <= 0; Height <= 0;
                            delay_by_1_cycle <= 1; // Delay the whole thing by cycle
                        end
                    end
                CONV1D_2nd:
                    begin
                        if (delay_by_1_cycle) begin
                            if (Depth == CONV1D_2nd_depth_num && Width == CONV1D_2nd_width_num && Height == CONV1D_2nd_height_num) begin // State transtion trigger
                                Compute_stage <= CONV1D_3rd;
                                Depth <= 0; Width <= 0; Height <= 0;
                                delay_by_1_cycle <= 0;
                            end else begin // else keep incrementing address
                                Height <= (Height == CONV1D_2nd_height_num) ? 0 : Height + 1;
                                Width <= (Height == CONV1D_2nd_height_num) ? (Width == CONV1D_2nd_width_num) ? 0 : Width + 1 : Width;
                                Depth <= (Height == CONV1D_2nd_height_num && Width == CONV1D_2nd_width_num) ? Depth + 1 : Depth;
                            end
                        end else begin
                            // reset
                            Compute_stage <= CONV1D_2nd;
                            Depth <= 0; Width <= 0; Height <= 0;
                            delay_by_1_cycle <= 1; // Delay the whole thing by cycle
                        end
                    end
                CONV1D_3rd:
                    begin
                        if (delay_by_1_cycle) begin
                            if (Depth == CONV1D_3rd_depth_num && Width == CONV1D_3rd_width_num && Height == CONV1D_3rd_height_num) begin // State transtion trigger
                                Compute_stage <= Global_MaxPool;
                                Depth <= 0; Width <= 0; Height <= 0;
                                delay_by_1_cycle <= 0;
                            end else begin // else keep incrementing address
                                Height <= (Height == CONV1D_3rd_height_num) ? 0 : Height + 1;
                                Width <= (Height == CONV1D_3rd_height_num) ? (Width == CONV1D_3rd_width_num) ? 0 : Width + 1 : Width;
                                Depth <= (Height == CONV1D_3rd_height_num && Width == CONV1D_3rd_width_num) ? Depth + 1 : Depth;
                            end
                        end else begin
                            // reset
                            Compute_stage <= CONV1D_3rd;
                            Depth <= 0; Width <= 0; Height <= 0;
                            delay_by_1_cycle <= 1; // Delay the whole thing by cycle
                        end
                    end
                Global_MaxPool:
                    begin
                        if (delay_by_1_cycle) begin
                            case (Height) // we reuse height here as an one-hot encoding state machine
                                4'b0001:
                                    begin
                                        if (Width == Global_MaxPool_width_num_0) begin // transition
                                            Height <= 4'b0010;
                                            Width <= 0; // reset width
                                        end else begin
                                            Width <= Width + 1; // else keep iterating
                                        end
                                    end
                                4'b0010:
                                    begin
                                        if (Width == Global_MaxPool_width_num_1) begin // transition
                                            Height <= 4'b0100;
                                            Width <= 0; // reset width
                                        end else begin
                                            Width <= Width + 1; // else keep iterating
                                        end
                                    end
                                4'b0100:
                                    begin
                                        if (Width == Global_MaxPool_width_num_2) begin // transition
                                            Height <= 4'b1000;
                                            Width <= 0; // reset width
                                        end else begin
                                            Width <= Width + 1; // else keep iterating
                                        end
                                    end
                                4'b1000:
                                    begin
                                        if (Depth == Global_MaxPool_depth_num) begin // transition out
                                            Compute_stage <= FC_1st;
                                            Depth <= 0; Width <= 0; Height <= 0;
                                            delay_by_1_cycle <= 0;
                                        end else begin
                                            Compute_stage <= Global_MaxPool;
                                            Depth <= Depth + 1;
                                            Width <= 0; Height <= 4'b0001;
                                        end
                                    end

                                default:
                                    begin
                                        // Reset into the correct state
                                        Compute_stage <= Global_MaxPool;
                                        Depth <= 0; Width <= 0; Height <= 4'b0001;
                                    end
                            endcase

                        end else begin
                            // reset
                            Compute_stage <= Global_MaxPool;
                            Depth <= 0; Width <= 0; Height <= 0;
                            delay_by_1_cycle <= 1; // Delay the whole thing by cycle
                        end
                    end
                FC_1st:
                    begin
                        if (delay_by_1_cycle) begin
                            if (Depth == FC_1st_depth_num && Width == FC_1st_width_num) begin // State transtion trigger
                                Compute_stage <= FC_2nd;
                                Depth <= 0; Width <= 0; Height <= 0;
                                delay_by_1_cycle <= 0;
                            end else begin // else keep incrementing address
                                Width <= (Width == FC_1st_width_num) ? 0 : Width + 1;
                                Depth <= (Width == FC_1st_width_num) ? Depth + 1 : Depth;
                            end
                        end else begin
                            // reset
                            Compute_stage <= FC_1st;
                            Depth <= 0; Width <= 0; Height <= 0;
                            delay_by_1_cycle <= 1; // Delay the whole thing by cycle
                        end
                    end
                FC_2nd:
                    begin                        
                        if (delay_by_1_cycle) begin
                            if (Width == FC_2nd_width_num) begin // State transtion trigger
                                Compute_stage <= CONV1D_1st;
                                Depth <= 0; Width <= 0; Height <= 0;
                                delay_by_1_cycle <= 0;
                            end else begin // else keep incrementing address
                                Width <= Width + 1;
                            end
                        end else begin
                            // reset
                            Compute_stage <= FC_2nd;
                            Depth <= 0; Width <= 0; Height <= 0;
                            delay_by_1_cycle <= 1; // Delay the whole thing by cycle
                        end
                    end

                default:
                    begin
                        // go to CONV1D_1st if it is in default
                        Compute_stage <= CONV1D_1st;

                        // reset height, depth, width
                        Height <= 0; Depth <= 0; Width <= 0;
                        delay_by_1_cycle <= 0;
                    end
            endcase
        end else begin
            // go to CONV1D_1st if it is in default
            Compute_stage <= CONV1D_1st;

            // reset height, depth, width
            Height <= 0; Depth <= 0; Width <= 0;
            delay_by_1_cycle <= 0;
        end
    end

    // Instruction register related
    wire [Pipelining_Control_uCode_bit_width - 1 : 0] uCode;
    wire [23 : 0] Data_Read_Addr_Ctrl;
    wire [23 : 0] Data_Write_Addr_Ctrl;
    wire [14 : 0] Weight_Read_Addr_Ctrl;

    // Decode Stage related
    reg [23 : 0] Data_Write_Control_Reg;
    reg Adder_Input_Reg;
    reg [1:0] Adder_Ctrl_Reg;
    reg [5:0] Mul_Path_Enable_Reg;
    reg Compute_Done_Reg;
    reg Mul_Mux_Control_reg;
    reg Mul_Mux_Sel_Reg;
    reg ALU_Mux_Reg;

    // Address & RAM Enables for Weights
    reg [14:0] Weight_Read_Control; // 15 bits (refer to google doc for detailed mapping)

    // Weights
    wire [Bit_width - 1 : 0] Weight_read_out_0;
    wire [Bit_width - 1 : 0] Weight_read_out_1;
    wire [Bit_width - 1 : 0] Weight_read_out_2;
    wire [Bit_width - 1 : 0] Weight_read_out_3;
    wire [Bit_width - 1 : 0] Weight_read_out_4;
    wire [Bit_width - 1 : 0] Weight_read_out_5;

    // Multiplying stage
    reg Adder_Input_MUL;
    reg [1:0] Adder_Ctrl_MUL;
    reg Compute_Done_MUL;
    reg MUL_Mux_Control;
    reg [23:0] Data_Write_Control_MUL;
    reg MUL_Mux_Sel;
    reg ALU_Mux_MUL;
    reg [5:0] Mul_Path_Enable;
    wire Final_Mul_Mux_Control; // the actual control signal for the Mux
    wire [23:0] Data_Write_Control_MUL_Muxed;

    reg [Bit_width - 1 : 0] Mul_input_data_0;
    reg [Bit_width - 1 : 0] Mul_input_data_1;
    reg [Bit_width - 1 : 0] Mul_input_data_2;
    reg [Bit_width - 1 : 0] Mul_input_data_3;
    reg [Bit_width - 1 : 0] Mul_input_data_4;

    reg [Bit_width - 1 : 0] Mul_input_weight_0; // bias
    reg [Bit_width - 1 : 0] Mul_input_weight_1;
    reg [Bit_width - 1 : 0] Mul_input_weight_2;
    reg [Bit_width - 1 : 0] Mul_input_weight_3;
    reg [Bit_width - 1 : 0] Mul_input_weight_4;
    reg [Bit_width - 1 : 0] Mul_input_weight_5;

    wire [2 * Bit_width - 1 : 0] Mul_output_mul_data_0;
    wire [2 * Bit_width - 1 : 0] Mul_output_mul_data_1;
    wire [2 * Bit_width - 1 : 0] Mul_output_mul_data_2;
    wire [2 * Bit_width - 1 : 0] Mul_output_mul_data_3;
    wire [2 * Bit_width - 1 : 0] Mul_output_mul_data_4;
    wire [2 * Bit_width - 1 : 0] Mul_output_mul_data_5;

    wire [2 * Bit_width - 1 : 0] Mul_Mux_data_out_0;
    wire [2 * Bit_width - 1 : 0] Mul_Mux_data_out_1;
    wire [2 * Bit_width - 1 : 0] Mul_Mux_data_out_2;
    wire [2 * Bit_width - 1 : 0] Mul_Mux_data_out_3;
    wire [2 * Bit_width - 1 : 0] Mul_Mux_data_out_4;
    wire [2 * Bit_width - 1 : 0] Mul_Mux_data_out_5;

    assign Final_Mul_Mux_Control = MUL_Mux_Sel ? Mul_Mux_Control_reg : MUL_Mux_Control; // skip one whole stage

    // sign extend the read in data if needed
    assign Mul_Mux_data_out_0 = Final_Mul_Mux_Control ? { {16{Data_read_out_0[Bit_width-1]}}, Data_read_out_0} : Mul_output_mul_data_0;
    assign Mul_Mux_data_out_1 = Final_Mul_Mux_Control ? { {16{Data_read_out_1[Bit_width-1]}}, Data_read_out_1} : Mul_output_mul_data_1;
    assign Mul_Mux_data_out_2 = Final_Mul_Mux_Control ? { {16{Data_read_out_2[Bit_width-1]}}, Data_read_out_2} : Mul_output_mul_data_2;
    assign Mul_Mux_data_out_3 = Final_Mul_Mux_Control ? { {16{Data_read_out_3[Bit_width-1]}}, Data_read_out_3} : Mul_output_mul_data_3;
    assign Mul_Mux_data_out_4 = Final_Mul_Mux_Control ? { {16{Data_read_out_4[Bit_width-1]}}, Data_read_out_4} : Mul_output_mul_data_4;
    assign Mul_Mux_data_out_5 = Final_Mul_Mux_Control ? 0 : Mul_output_mul_data_5;

    // ALU Stage
    reg Adder_Input_Mux;
    reg Compute_Done_ALU;
    reg [1:0] Adder_Ctrl;
    reg ALU_Mux_Ctrl;
    reg [23:0] Data_Write_Control_ALU;
    wire [2 * Bit_width - 1 : 0] Additional_input;

    reg [2 * Bit_width - 1 : 0] Mul_output_mul_data_ALU_0;
    reg [2 * Bit_width - 1 : 0] Mul_output_mul_data_ALU_1;
    reg [2 * Bit_width - 1 : 0] Mul_output_mul_data_ALU_2;
    reg [2 * Bit_width - 1 : 0] Mul_output_mul_data_ALU_3;
    reg [2 * Bit_width - 1 : 0] Mul_output_mul_data_ALU_4;
    reg [2 * Bit_width - 1 : 0] Mul_output_mul_data_ALU_5;

    wire [2 * Bit_width - 1 : 0] Adder_output;
    wire [2 * Bit_width - 1 : 0] Comparator_output;
    wire [2 * Bit_width - 1 : 0] ALU_output;
    assign ALU_output = (ALU_Mux_Ctrl) ? Comparator_output : Adder_output;

    // Mem write stage
    reg [2 * Bit_width - 1 : 0] Data_Write_32_bit;    

    // Other assignments
    assign Additional_input = (Adder_Input_Mux) ? Data_Write_32_bit : 0;
    assign Data_Write_Control_MUL_Muxed = (MUL_Mux_Sel) ? Data_Write_Control_Reg : Data_Write_Control_MUL;

    /**************** Actual pipelining *******************/
    always @ (posedge Clk) begin

        // Decode Stage related
        if (Enable) begin
            Adder_Input_Reg <= uCode[12];
            Adder_Ctrl_Reg <= uCode[11:10];
            Mul_Path_Enable_Reg <= uCode[9:4];
            Mul_Mux_Control_reg <= uCode[3];
            Mul_Mux_Sel_Reg <= uCode[2];
            ALU_Mux_Reg <= uCode[1];
            Compute_Done_Reg <= uCode[0];

            Data_Write_Control_Reg <= Data_Write_Addr_Ctrl;
            Data_Read_Control <= Data_Read_Addr_Ctrl;
            Weight_Read_Control <= Weight_Read_Addr_Ctrl;
        end else begin
            Adder_Input_Reg <= 0;
            Adder_Ctrl_Reg <= 0;
            Mul_Path_Enable_Reg <= 0;
            Mul_Mux_Control_reg <= 0;
            Mul_Mux_Sel_Reg <= 0;
            ALU_Mux_Reg <= 0;
            Compute_Done_Reg <= 0;
        end

        // Multiply Stage related --> We don't need enable cos the previous stage will flush everything without Enable anyway
        Adder_Input_MUL <= Adder_Input_Reg;
        Adder_Ctrl_MUL <= Adder_Ctrl_Reg;
        Mul_Path_Enable <= Mul_Path_Enable_Reg;
        MUL_Mux_Control <= Mul_Mux_Control_reg;
        MUL_Mux_Sel <= Mul_Mux_Sel_Reg;
        ALU_Mux_MUL <= ALU_Mux_Reg;
        Compute_Done_MUL <= Compute_Done_Reg;
        
        Data_Write_Control_MUL <= Data_Write_Control_Reg;

        Mul_input_data_0 <= Data_read_out_0;
        Mul_input_data_1 <= Data_read_out_1;
        Mul_input_data_2 <= Data_read_out_2;
        Mul_input_data_3 <= Data_read_out_3;
        Mul_input_data_4 <= Data_read_out_4;

        Mul_input_weight_0 <= Weight_read_out_0;
        Mul_input_weight_1 <= Weight_read_out_1;
        Mul_input_weight_2 <= Weight_read_out_2;
        Mul_input_weight_3 <= Weight_read_out_3;
        Mul_input_weight_4 <= Weight_read_out_4;
        Mul_input_weight_5 <= Weight_read_out_5;

        // ALU Stage related
        Adder_Input_Mux <= Adder_Input_MUL;
        Adder_Ctrl <= Adder_Ctrl_MUL;
        ALU_Mux_Ctrl <= ALU_Mux_MUL;
        Compute_Done_ALU <= Compute_Done_MUL;
        
        Data_Write_Control_ALU <= Data_Write_Control_MUL_Muxed;

        Mul_output_mul_data_ALU_0 <= Mul_Mux_data_out_0;
        Mul_output_mul_data_ALU_1 <= Mul_Mux_data_out_1;
        Mul_output_mul_data_ALU_2 <= Mul_Mux_data_out_2;
        Mul_output_mul_data_ALU_3 <= Mul_Mux_data_out_3;
        Mul_output_mul_data_ALU_4 <= Mul_Mux_data_out_4;
        Mul_output_mul_data_ALU_5 <= Mul_Mux_data_out_5;

        // Memory Write Stage
        Compute_Done <= Compute_Done_ALU;
        Data_Write_Control <= Data_Write_Control_ALU;
        Data_Write <= ALU_output[15:0]; // we only want 16 bit of this, so we will just cut it out
        Data_Write_32_bit <= ALU_output; // This will be used to loop back to the adder
    end


    /*************** Module Instantiation *************************/
    uCode uCode_gen (
        // Input
        .Clk(Clk),
        .Compute_stage(Compute_stage),
        .Height(Height),
        .Depth(Depth),
        .Width(Width),

        // Output
        .pipeline_uCode(uCode),
        .Data_Read_uCode(Data_Read_Addr_Ctrl),
        .Data_Write_uCode(Data_Write_Addr_Ctrl),
        .Weight_Read_uCode(Weight_Read_Addr_Ctrl)
    );

    Weights_RAM Weights_RAM (
        .Clk(Clk),
        .uCode(Weight_Read_Control),
        .Read_data_out_0(Weight_read_out_0),
        .Read_data_out_1(Weight_read_out_1),
        .Read_data_out_2(Weight_read_out_2),
        .Read_data_out_3(Weight_read_out_3),
        .Read_data_out_4(Weight_read_out_4),
        .Read_data_out_5(Weight_read_out_5)
    );

    Multiply Multiply_unit_parallel(
        .Enable(Mul_Path_Enable),
        
        // Data in
        .data_0(Mul_input_data_0),
        .data_1(Mul_input_data_1),
        .data_2(Mul_input_data_2),
        .data_3(Mul_input_data_3),
        .data_4(Mul_input_data_4),

        // Weights
        .weight_0(Mul_input_weight_0),
        .weight_1(Mul_input_weight_1),
        .weight_2(Mul_input_weight_2),
        .weight_3(Mul_input_weight_3),
        .weight_4(Mul_input_weight_4),
        .weight_5(Mul_input_weight_5),

        // output
        .mul_result_0(Mul_output_mul_data_0),
        .mul_result_1(Mul_output_mul_data_1),
        .mul_result_2(Mul_output_mul_data_2),
        .mul_result_3(Mul_output_mul_data_3),
        .mul_result_4(Mul_output_mul_data_4),
        .mul_result_5(Mul_output_mul_data_5)
    );

    Adder Adder_unit(
        .Adder_Ctrl(Adder_Ctrl),

        // Data in 
        .Mul_result_0(Mul_output_mul_data_ALU_0),
        .Mul_result_1(Mul_output_mul_data_ALU_1),
        .Mul_result_2(Mul_output_mul_data_ALU_2),
        .Mul_result_3(Mul_output_mul_data_ALU_3),
        .Mul_result_4(Mul_output_mul_data_ALU_4),
        .Mul_result_5(Mul_output_mul_data_ALU_5),
        .Additional_input(Additional_input),

        // Data out
        .Out_sum(Adder_output)
    );

    Comparator Comparator(
        // Data in
        .Input_0(Mul_output_mul_data_ALU_0),
        .Input_1(Mul_output_mul_data_ALU_1),
        .Input_2(Mul_output_mul_data_ALU_2),
        .Input_3(Mul_output_mul_data_ALU_3),
        .Input_4(Mul_output_mul_data_ALU_4),

        // Output
        .Out_data(Comparator_output)
    );

endmodule
