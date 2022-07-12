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
        parameter Bit_width = 16,
        parameter Dataset_depth_counter_bits = 9,
        parameter Filter_counter_bits = 3
    )
    (
    input Clk,
    input Enable,

    // Data
    input [Bit_width - 1 : 0] Data_read_out_0,
    input [Bit_width - 1 : 0] Data_read_out_1,
    input [Bit_width - 1 : 0] Data_read_out_2,
    input [Bit_width - 1 : 0] Data_read_out_3,
    input [Bit_width - 1 : 0] Data_read_out_4,

    // Weights
    input [Bit_width - 1 : 0] Weight_read_out_0,
    input [Bit_width - 1 : 0] Weight_read_out_1,
    input [Bit_width - 1 : 0] Weight_read_out_2,
    input [Bit_width - 1 : 0] Weight_read_out_3,
    input [Bit_width - 1 : 0] Weight_read_out_4,
    input [Bit_width - 1 : 0] Weight_read_out_5,

    // Address & RAM Enables for Data
    output reg [Dataset_depth_counter_bits - 1 : 0] Data_RAM_address = 0,
    output reg Data_RAM_Read_Enable_Reg,

    // Address & RAM Enables for Weights
    output reg [Filter_counter_bits - 1 : 0] Weights_RAM_address_depth, // 8 is max
    output reg Weights_RAM_Read_Enable_Reg,

    // Address & RAM Enables for Result
    output reg [Filter_counter_bits - 1 : 0] Result_RAM_write_address_depth, // 8 is max
    output reg [Dataset_depth_counter_bits - 1 : 0] Result_RAM_write_address_width, // 512 is max
    output reg Result_RAM_write_M,
    output reg [Bit_width - 1 : 0] Result_RAM_write_data,

    // Others
    output reg Done_M
    );

    // Parameter declaration
    /*
        Bit 0 : Data_RAM_Read_Enable_Reg
        Bit 1 : Weights_RAM_Read_Enable_Reg
        Bit 2 : Weights_RAM_Address_Depth [0]
        Bit 3 : Weights_RAM_Address_Depth [1]
        Bit 4 : Weights_RAM_Address_Depth [2]
        Bit 5 : MUL_Enable_Reg [0]
        Bit 6 : MUL_Enable_Reg [1]
        Bit 7 : Add_Enable_Reg
        Bit 8 : Done_Reg
    */
    localparam Instr_bit_width = 9;

    // Instruction address related declaration & Assignment
    reg [13 : 0] Instr_ptr;
    wire [13 : 0] Instr_ptr_plus_1;
    wire [Instr_bit_width - 1 : 0] Instr;
    assign Instr_ptr_plus_1 = Instr_ptr + 1;

    // Decode stage related declaration & Assignment & Multiplexing
    reg ADD_Enable_Reg;
    reg [1:0] MUL_Enable_Reg;
    reg Done_Reg;

    reg [Dataset_depth_counter_bits - 1 : 0] Data_RAM_Address_next = 0;

    // Multiplication stage related declaration & Assignment
    reg ADD_Enable_MUL;
    reg [1:0] MUL_Enable_MUL;
    reg Done_MUL;
    reg [2 : 0] Result_RAM_write_address_depth_MUL;

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

    // Addition stage related declaration & Assignment
    reg ADD_Enable_ADD;
    reg Done_ADD;
    reg [2 : 0] Result_RAM_write_address_depth_ADD;

    reg [2 * Bit_width - 1 : 0] Mul_output_add_data_0;
    reg [2 * Bit_width - 1 : 0] Mul_output_add_data_1;
    reg [2 * Bit_width - 1 : 0] Mul_output_add_data_2;
    reg [2 * Bit_width - 1 : 0] Mul_output_add_data_3;
    reg [2 * Bit_width - 1 : 0] Mul_output_add_data_4;
    reg [2 * Bit_width - 1 : 0] Mul_output_add_data_5;

    wire [Bit_width - 1 : 0] Add_output_add_data;

    // RAM write stage related declaration & assignment
    wire [Dataset_depth_counter_bits - 1 : 0] Result_RAM_write_address_width_next;
    assign Result_RAM_write_address_width_next = Result_RAM_write_M ? Result_RAM_write_address_width + 1 : 0;
    

    /**************** Actual pipelining *******************/
    always @ (posedge Clk) begin
        // Instruction related address increment
        if (Enable) begin
            if (Instr_ptr <= 4096) begin
                Instr_ptr <= Instr_ptr_plus_1;
            end else begin
                Instr_ptr <= 5000; // force it into all 0 state
            end
        end else begin
            Instr_ptr <= 0; // it is not enabled, reset the instruction
        end

        // Decode stage related
        if (Enable) begin
            Data_RAM_Read_Enable_Reg <= Instr[0];
            Weights_RAM_Read_Enable_Reg <= Instr[1];
            Weights_RAM_address_depth <= Instr[4:2];
            MUL_Enable_Reg <= Instr[6:5];
            ADD_Enable_Reg <= Instr[7];
            Done_Reg <= Instr[8];

            Data_RAM_Address_next <= Data_RAM_Address_next + Enable;
            Data_RAM_address <= Data_RAM_Address_next;
        end else begin
            Data_RAM_Read_Enable_Reg <= 0;
            Weights_RAM_Read_Enable_Reg <= 0;
            Weights_RAM_address_depth <= 0;
            MUL_Enable_Reg <= 0;
            ADD_Enable_Reg <= 0;
            Done_Reg <= 0;
            Data_RAM_address <= 0;
            Data_RAM_Address_next <= 0;
        end

        // Multiply stage related
        if (Enable) begin
            ADD_Enable_MUL <= ADD_Enable_Reg;
            MUL_Enable_MUL <= MUL_Enable_Reg;
            Done_MUL <= Done_Reg;
            Result_RAM_write_address_depth_MUL <= Weights_RAM_address_depth;

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

        end

        // Add stage related
        if (Enable) begin
            ADD_Enable_ADD <= ADD_Enable_MUL;
            Done_ADD <= Done_MUL;
            Result_RAM_write_address_depth_ADD <= Result_RAM_write_address_depth_MUL;

            Mul_output_add_data_0 <= Mul_output_mul_data_0;
            Mul_output_add_data_1 <= Mul_output_mul_data_1;
            Mul_output_add_data_2 <= Mul_output_mul_data_2;
            Mul_output_add_data_3 <= Mul_output_mul_data_3;
            Mul_output_add_data_4 <= Mul_output_mul_data_4;
            Mul_output_add_data_5 <= Mul_output_mul_data_5;
        end

        // Result RAM write stage related
        if (Enable) begin
            Result_RAM_write_M <= ADD_Enable_ADD;
            Result_RAM_write_data <= Add_output_add_data;
            Result_RAM_write_address_depth <= Result_RAM_write_address_depth_ADD;
            Result_RAM_write_address_width <= Result_RAM_write_address_width_next;
            Done_M <= Done_ADD;
        end
    end


    /*************** Module Instantiation *************************/
    Simple_RAM # (.Bit_width(13 + 1), // edit whenever needed, this is the max number of instr_ptr
            .Instr_bit_width(Instr_bit_width)) Instr_RAM (
                .CLK(Clk),
                .Address(Instr_ptr),
                .Data_out(Instr)
            );

    Multiply #(.Bit_width(Bit_width)) Multiply_unit_parallel(
        .Enable(MUL_Enable_MUL),
        
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

    Adder #(.Bit_width(Bit_width)) Adder_unit(
        .Enable(ADD_Enable_ADD),

        // Data in 
        .Mul_result_0(Mul_output_add_data_0),
        .Mul_result_1(Mul_output_add_data_1),
        .Mul_result_2(Mul_output_add_data_2),
        .Mul_result_3(Mul_output_add_data_3),
        .Mul_result_4(Mul_output_add_data_4),
        .Mul_result_5(Mul_output_add_data_5),

        // Data out
        .Digital_sum(Add_output_add_data)
    );

endmodule
