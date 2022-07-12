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
    reg [Bit_width - 1 : 0] RAM_0 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_1 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_2 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_3 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_4 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_5 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_6 [0 : RAM_Depth - 1];
    reg [Bit_width - 1 : 0] RAM_7 [0 : RAM_Depth - 1];

    always @ (negedge CLK) begin
        // Write
        if (Write_Enable) begin
            case (Write_Depth)
                0 : RAM_0[Write_Width] <= data_in;
                1 : RAM_1[Write_Width] <= data_in;
                2 : RAM_2[Write_Width] <= data_in;
                3 : RAM_3[Write_Width] <= data_in;
                4 : RAM_4[Write_Width] <= data_in;
                5 : RAM_5[Write_Width] <= data_in;
                6 : RAM_6[Write_Width] <= data_in;
                7 : RAM_7[Write_Width] <= data_in;
            endcase
        end 
        
        if (Read_Enable) begin
            case (Read_Depth)
                0:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_0[Read_Width - 1];
                        data_out_1 <= RAM_0[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_0[Read_Width + 1];
                    end
                1:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_1[Read_Width - 1];
                        data_out_1 <= RAM_1[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_1[Read_Width + 1];
                    end
                2:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_2[Read_Width - 1];
                        data_out_1 <= RAM_2[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_2[Read_Width + 1];
                    end
                3:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_3[Read_Width - 1];
                        data_out_1 <= RAM_3[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_3[Read_Width + 1];
                    end
                4:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_4[Read_Width - 1];
                        data_out_1 <= RAM_4[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_4[Read_Width + 1];
                    end
                5:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_5[Read_Width - 1];
                        data_out_1 <= RAM_5[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_5[Read_Width + 1];
                    end
                6:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_6[Read_Width - 1];
                        data_out_1 <= RAM_6[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_6[Read_Width + 1];
                    end
                7:
                    begin
                        data_out_0 <= (Read_Width < 1) ? 0 : RAM_7[Read_Width - 1];
                        data_out_1 <= RAM_7[Read_Width];
                        data_out_2 <= (Read_Width >= 256 - 1) ? 0 : RAM_7[Read_Width + 1];
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