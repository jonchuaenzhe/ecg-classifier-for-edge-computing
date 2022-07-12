`timescale 1ns / 1ps

module CONV1D_2nd_Data_RAM
    #(
        parameter Bit_width = 16,
        parameter RAM_Depth = 256
    )
    (
        // Input
        input CLK,

        // Write
        input Write_Enable,
        input [2:0] Write_Depth,
        input [7:0] Write_Width,
        input [Bit_width - 1 : 0] data_in,

        // Read
        input Read_Enable,
        input [2:0] Read_Depth,
        input [7:0] Read_Width,

        // Output
        output reg signed [Bit_width - 1 : 0] data_out_0,
        output reg signed [Bit_width - 1 : 0] data_out_1,
        output reg signed [Bit_width - 1 : 0] data_out_2
    );

    // RAM reg creation 8 * 256 * 16 bit
    reg [Bit_width - 1 : 0] RAM_0_A [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_1_A [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_2_A [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_3_A [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_4_A [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_5_A [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_6_A [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_7_A [0 : RAM_Depth - 1];

    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_0_B [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_1_B [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_2_B [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_3_B [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_4_B [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_5_B [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_6_B [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_7_B [0 : RAM_Depth - 1];

    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_0_C [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_1_C [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_2_C [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_3_C [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_4_C [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_5_C [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_6_C [0 : RAM_Depth - 1];
    // (* RAM_STYLE="BLOCK"*) reg [Bit_width - 1 : 0] RAM_7_C [0 : RAM_Depth - 1];

    // reg declaration
    // reg [Bit_width - 1 : 0] RAM_0_A_out;
    // reg [Bit_width - 1 : 0] RAM_1_A_out; 
    // reg [Bit_width - 1 : 0] RAM_2_A_out;
    // reg [Bit_width - 1 : 0] RAM_3_A_out;
    // reg [Bit_width - 1 : 0] RAM_4_A_out;
    // reg [Bit_width - 1 : 0] RAM_5_A_out;
    // reg [Bit_width - 1 : 0] RAM_6_A_out;
    // reg [Bit_width - 1 : 0] RAM_7_A_out;

    // reg [Bit_width - 1 : 0] RAM_0_B_out;
    // reg [Bit_width - 1 : 0] RAM_1_B_out; 
    // reg [Bit_width - 1 : 0] RAM_2_B_out;
    // reg [Bit_width - 1 : 0] RAM_3_B_out;
    // reg [Bit_width - 1 : 0] RAM_4_B_out;
    // reg [Bit_width - 1 : 0] RAM_5_B_out;
    // reg [Bit_width - 1 : 0] RAM_6_B_out;
    // reg [Bit_width - 1 : 0] RAM_7_B_out;

    // reg [Bit_width - 1 : 0] RAM_0_C_out;
    // reg [Bit_width - 1 : 0] RAM_1_C_out; 
    // reg [Bit_width - 1 : 0] RAM_2_C_out;
    // reg [Bit_width - 1 : 0] RAM_3_C_out;
    // reg [Bit_width - 1 : 0] RAM_4_C_out;
    // reg [Bit_width - 1 : 0] RAM_5_C_out;
    // reg [Bit_width - 1 : 0] RAM_6_C_out;
    // reg [Bit_width - 1 : 0] RAM_7_C_out;

    // always @ (*) begin
    //     if (Write_Enable) begin
    //         case (Write_Depth) 
    //             0:
    //                 begin
    //                     data_out_0 <= RAM_0_A_out;
    //                     data_out_1 <= RAM_0_B_out;
    //                     data_out_2 <= RAM_0_C_out;
    //                 end
    //             1:
    //                 begin
    //                     data_out_0 <= RAM_1_A_out;
    //                     data_out_1 <= RAM_1_B_out;
    //                     data_out_2 <= RAM_1_C_out;
    //                 end
    //             2:
    //                 begin
    //                     data_out_0 <= RAM_2_A_out;
    //                     data_out_1 <= RAM_2_B_out;
    //                     data_out_2 <= RAM_2_C_out;
    //                 end
    //             3:
    //                 begin
    //                     data_out_0 <= RAM_3_A_out;
    //                     data_out_1 <= RAM_3_B_out;
    //                     data_out_2 <= RAM_3_C_out;
    //                 end
    //             4:
    //                 begin
    //                     data_out_0 <= RAM_4_A_out;
    //                     data_out_1 <= RAM_4_B_out;
    //                     data_out_2 <= RAM_4_C_out;
    //                 end
    //             5:
    //                 begin
    //                     data_out_0 <= RAM_5_A_out;
    //                     data_out_1 <= RAM_5_B_out;
    //                     data_out_2 <= RAM_5_C_out;
    //                 end
    //             6:
    //                 begin
    //                     data_out_0 <= RAM_6_A_out;
    //                     data_out_1 <= RAM_6_B_out;
    //                     data_out_2 <= RAM_6_C_out;
    //                 end
    //             7:
    //                 begin
    //                     data_out_0 <= RAM_7_A_out;
    //                     data_out_1 <= RAM_7_B_out;
    //                     data_out_2 <= RAM_7_C_out;
    //                 end
    //             default:
    //                 begin
    //                     data_out_0 <= 0;
    //                     data_out_1 <= 0;
    //                     data_out_2 <= 0;
    //                 end
    //         endcase
    //     end else begin
    //         data_out_0 <= 0;
    //         data_out_1 <= 0;
    //         data_out_2 <= 0;
    //     end
    // end

    // always @ (negedge CLK) begin
    //     if (Write_Enable) begin
    //         if (Write_Depth == 0) begin
    //             RAM_0_A[Write_Width] <= data_in;
    //             RAM_0_B[Write_Width] <= data_in;
    //             RAM_0_C[Write_Width] <= data_in;
    //         end
    //     end else if (Read_Enable) begin
    //         if (Read_Depth == 0) begin
    //             RAM_0_A_out <= (Read_Width < 1) ? 0 : RAM_0_A[Read_Width - 1];
    //             RAM_0_B_out <= RAM_0_B[Read_Width];
    //             RAM_0_C_out <= (Read_Width >= 512 - 1) ? 0 : RAM_0_C[Read_Width + 1];
    //         end 
    //     end

    //     if (Write_Enable) begin
    //         if (Write_Depth == 1) begin
    //             RAM_1_A[Write_Width] <= data_in;
    //             RAM_1_B[Write_Width] <= data_in;
    //             RAM_1_C[Write_Width] <= data_in;
    //         end
    //     end else if (Read_Enable) begin
    //         if (Read_Depth == 1) begin
    //             RAM_1_A_out <= (Read_Width < 1) ? 0 : RAM_1_A[Read_Width - 1];
    //             RAM_1_B_out <= RAM_1_B[Read_Width];
    //             RAM_1_C_out <= (Read_Width >= 512 - 1) ? 0 : RAM_1_C[Read_Width + 1];
    //         end 
    //     end

    //     if (Write_Enable) begin
    //         if (Write_Depth == 2) begin
    //             RAM_2_A[Write_Width] <= data_in;
    //             RAM_2_B[Write_Width] <= data_in;
    //             RAM_2_C[Write_Width] <= data_in;
    //         end
    //     end else if (Read_Enable) begin
    //         if (Read_Depth == 2) begin
    //             RAM_2_A_out <= (Read_Width < 1) ? 0 : RAM_2_A[Read_Width - 1];
    //             RAM_2_B_out <= RAM_2_B[Read_Width];
    //             RAM_2_C_out <= (Read_Width >= 512 - 1) ? 0 : RAM_2_C[Read_Width + 1];
    //         end 
    //     end

    //     if (Write_Enable) begin
    //         if (Write_Depth == 3) begin
    //             RAM_3_A[Write_Width] <= data_in;
    //             RAM_3_B[Write_Width] <= data_in;
    //             RAM_3_C[Write_Width] <= data_in;
    //         end
    //     end else if (Read_Enable) begin
    //         if (Read_Depth == 3) begin
    //             RAM_3_A_out <= (Read_Width < 1) ? 0 : RAM_3_A[Read_Width - 1];
    //             RAM_3_B_out <= RAM_3_B[Read_Width];
    //             RAM_3_C_out <= (Read_Width >= 512 - 1) ? 0 : RAM_3_C[Read_Width + 1];
    //         end 
    //     end

    //     if (Write_Enable) begin
    //         if (Write_Depth == 4) begin
    //             RAM_4_A[Write_Width] <= data_in;
    //             RAM_4_B[Write_Width] <= data_in;
    //             RAM_4_C[Write_Width] <= data_in;
    //         end
    //     end else if (Read_Enable) begin
    //         if (Read_Depth == 4) begin
    //             RAM_4_A_out <= (Read_Width < 1) ? 0 : RAM_4_A[Read_Width - 1];
    //             RAM_4_B_out <= RAM_4_B[Read_Width];
    //             RAM_4_C_out <= (Read_Width >= 512 - 1) ? 0 : RAM_4_C[Read_Width + 1];
    //         end 
    //     end

    //     if (Write_Enable) begin
    //         if (Write_Depth == 5) begin
    //             RAM_5_A[Write_Width] <= data_in;
    //             RAM_5_B[Write_Width] <= data_in;
    //             RAM_5_C[Write_Width] <= data_in;
    //         end
    //     end else if (Read_Enable) begin
    //         if (Read_Depth == 5) begin
    //             RAM_5_A_out <= (Read_Width < 1) ? 0 : RAM_5_A[Read_Width - 1];
    //             RAM_5_B_out <= RAM_5_B[Read_Width];
    //             RAM_5_C_out <= (Read_Width >= 512 - 1) ? 0 : RAM_5_C[Read_Width + 1];
    //         end 
    //     end

    //     if (Write_Enable) begin
    //         if (Write_Depth == 6) begin
    //             RAM_6_A[Write_Width] <= data_in;
    //             RAM_6_B[Write_Width] <= data_in;
    //             RAM_6_C[Write_Width] <= data_in;
    //         end
    //     end else if (Read_Enable) begin
    //         if (Read_Depth == 6) begin
    //             RAM_6_A_out <= (Read_Width < 1) ? 0 : RAM_6_A[Read_Width - 1];
    //             RAM_6_B_out <= RAM_6_B[Read_Width];
    //             RAM_6_C_out <= (Read_Width >= 512 - 1) ? 0 : RAM_6_C[Read_Width + 1];
    //         end 
    //     end

    //     if (Write_Enable) begin
    //         if (Write_Depth == 7) begin
    //             RAM_7_A[Write_Width] <= data_in;
    //             RAM_7_B[Write_Width] <= data_in;
    //             RAM_7_C[Write_Width] <= data_in;
    //         end
    //     end else if (Read_Enable) begin
    //         if (Read_Depth == 7) begin
    //             RAM_7_A_out <= (Read_Width < 1) ? 0 : RAM_7_A[Read_Width - 1];
    //             RAM_7_B_out <= RAM_7_B[Read_Width];
    //             RAM_7_C_out <= (Read_Width >= 512 - 1) ? 0 : RAM_7_C[Read_Width + 1];
    //         end 
    //     end
    // end

    always @ (negedge CLK) begin
        // Write
        if (Write_Enable) begin
            case (Write_Depth)
                0 : 
                    begin
                        RAM_0_A[Write_Width] <= data_in;
                        // RAM_0_B[Write_Width] <= data_in;
                        // RAM_0_C[Write_Width] <= data_in;
                    end
                1 : 
                    begin
                        RAM_1_A[Write_Width] <= data_in;
                        // RAM_1_B[Write_Width] <= data_in;
                        // RAM_1_C[Write_Width] <= data_in;
                    end
                2 : 
                    begin
                        RAM_2_A[Write_Width] <= data_in;
                        // RAM_2_B[Write_Width] <= data_in;
                        // RAM_2_C[Write_Width] <= data_in;
                    end
                3 : 
                    begin
                        RAM_3_A[Write_Width] <= data_in;
                        // RAM_3_B[Write_Width] <= data_in;
                        // RAM_3_C[Write_Width] <= data_in;
                    end
                4 : 
                    begin
                        RAM_4_A[Write_Width] <= data_in;
                        // RAM_4_B[Write_Width] <= data_in;
                        // RAM_4_C[Write_Width] <= data_in;
                    end
                5 : 
                    begin
                        RAM_5_A[Write_Width] <= data_in;
                        // RAM_5_B[Write_Width] <= data_in;
                        // RAM_5_C[Write_Width] <= data_in;
                    end
                6 : 
                    begin
                        RAM_6_A[Write_Width] <= data_in;
                        // RAM_6_B[Write_Width] <= data_in;
                        // RAM_6_C[Write_Width] <= data_in;
                    end
                7 : 
                    begin
                        RAM_7_A[Write_Width] <= data_in;
                        // RAM_7_B[Write_Width] <= data_in;
                        // RAM_7_C[Write_Width] <= data_in;
                    end
            endcase
        end else if (Read_Enable) begin
            case (Read_Depth)
                0:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_0_A[Read_Width - 1];
                        data_out_1 <= RAM_0_A[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_0_A[Read_Width + 1];
                    end
                1:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_1_A[Read_Width - 1];
                        data_out_1 <= RAM_1_A[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_1_A[Read_Width + 1];
                    end
                2:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_2_A[Read_Width - 1];
                        data_out_1 <= RAM_2_A[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_2_A[Read_Width + 1];
                    end
                3:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_3_A[Read_Width - 1];
                        data_out_1 <= RAM_3_A[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_3_A[Read_Width + 1];
                    end
                4:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_4_A[Read_Width - 1];
                        data_out_1 <= RAM_4_A[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_4_A[Read_Width + 1];
                    end
                5:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_5_A[Read_Width - 1];
                        data_out_1 <= RAM_5_A[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_5_A[Read_Width + 1];
                    end
                6:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_6_A[Read_Width - 1];
                        data_out_1 <= RAM_6_A[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_6_A[Read_Width + 1];
                    end
                7:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_7_A[Read_Width - 1];
                        data_out_1 <= RAM_7_A[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_7_A[Read_Width + 1];
                    end                
                default:
                    begin
                        data_out_0 <= 0;
                        data_out_1 <= 0;
                        data_out_2 <= 0;
                    end
            endcase
        end
    end

endmodule