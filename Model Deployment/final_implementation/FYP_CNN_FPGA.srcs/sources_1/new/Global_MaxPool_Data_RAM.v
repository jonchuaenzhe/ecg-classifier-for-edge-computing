`timescale 1ns / 1ps

module Global_MaxPool_Data_RAM
    #(
        parameter Bit_width = 16,
        parameter RAM_Depth = 256
    )
    (
        // Input
        input CLK,

        // Write
        input Write_Enable,
        input [4:0] Write_Depth,
        input [7:0] Write_Width,
        input [Bit_width - 1 : 0] data_in,

        // Read
        input Read_Enable,
        input [4:0] Read_Depth,
        input [7:0] Read_Width,

        // Output
        output reg signed [Bit_width - 1 : 0] data_out_0,
        output reg signed [Bit_width - 1 : 0] data_out_1,
        output reg signed [Bit_width - 1 : 0] data_out_2,
        output reg signed [Bit_width - 1 : 0] data_out_3,
        output reg signed [Bit_width - 1 : 0] data_out_4
    );

    // RAM reg creation 32 * 256 * 16 bit
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
                8 : RAM_8[Write_Width] <= data_in;
                9 : RAM_9[Write_Width] <= data_in;
                10 : RAM_10[Write_Width] <= data_in;
                11 : RAM_11[Write_Width] <= data_in;
                12 : RAM_12[Write_Width] <= data_in;
                13 : RAM_13[Write_Width] <= data_in;
                14 : RAM_14[Write_Width] <= data_in;
                15 : RAM_15[Write_Width] <= data_in;
                16 : RAM_16[Write_Width] <= data_in;
                17 : RAM_17[Write_Width] <= data_in;
                18 : RAM_18[Write_Width] <= data_in;
                19 : RAM_19[Write_Width] <= data_in;
                20 : RAM_20[Write_Width] <= data_in;
                21 : RAM_21[Write_Width] <= data_in;
                22 : RAM_22[Write_Width] <= data_in;
                23 : RAM_23[Write_Width] <= data_in;
                24 : RAM_24[Write_Width] <= data_in;
                25 : RAM_25[Write_Width] <= data_in;
                26 : RAM_26[Write_Width] <= data_in;
                27 : RAM_27[Write_Width] <= data_in;
                28 : RAM_28[Write_Width] <= data_in;
                29 : RAM_29[Write_Width] <= data_in;
                30 : RAM_30[Write_Width] <= data_in;
                31 : RAM_31[Write_Width] <= data_in;
            endcase
        end else if (Read_Enable) begin
            case (Read_Depth)
                0:
                    begin
                        data_out_0 <= RAM_0[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_0[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_0[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_0[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_0[Read_Width + 4] : 0;
                    end
                1:
                    begin
                        data_out_0 <= RAM_1[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_1[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_1[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_1[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_1[Read_Width + 4] : 0;
                    end
                2:
                    begin
                        data_out_0 <= RAM_2[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_2[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_2[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_2[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_2[Read_Width + 4] : 0;
                    end
                3:
                    begin
                        data_out_0 <= RAM_3[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_3[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_3[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_3[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_3[Read_Width + 4] : 0;
                    end
                4:
                    begin
                        data_out_0 <= RAM_4[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_4[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_4[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_4[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_4[Read_Width + 4] : 0;
                    end
                5:
                    begin
                        data_out_0 <= RAM_5[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_5[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_5[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_5[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_5[Read_Width + 4] : 0;
                    end
                6:
                    begin
                        data_out_0 <= RAM_6[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_6[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_6[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_6[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_6[Read_Width + 4] : 0;
                    end
                7:
                    begin
                        data_out_0 <= RAM_7[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_7[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_7[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_7[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_7[Read_Width + 4] : 0;
                    end
                8:
                    begin
                        data_out_0 <= RAM_8[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_8[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_8[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_8[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_8[Read_Width + 4] : 0;
                    end
                9:
                    begin
                        data_out_0 <= RAM_9[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_9[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_9[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_9[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_9[Read_Width + 4] : 0;
                    end
                10:
                    begin
                        data_out_0 <= RAM_10[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_10[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_10[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_10[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_10[Read_Width + 4] : 0;
                    end
                11:
                    begin
                        data_out_0 <= RAM_11[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_11[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_11[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_11[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_11[Read_Width + 4] : 0;
                    end
                12:
                    begin
                        data_out_0 <= RAM_12[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_12[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_12[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_12[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_12[Read_Width + 4] : 0;
                    end
                13:
                    begin
                        data_out_0 <= RAM_13[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_13[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_13[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_13[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_13[Read_Width + 4] : 0;
                    end
                14:
                    begin
                        data_out_0 <= RAM_14[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_14[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_14[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_14[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_14[Read_Width + 4] : 0;
                    end
                15:
                    begin
                        data_out_0 <= RAM_15[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_15[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_15[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_15[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_15[Read_Width + 4] : 0;
                    end
                16:
                    begin
                        data_out_0 <= RAM_16[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_16[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_16[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_16[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_16[Read_Width + 4] : 0;
                    end
                17:
                    begin
                        data_out_0 <= RAM_17[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_17[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_17[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_17[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_17[Read_Width + 4] : 0;
                    end
                18:
                    begin
                        data_out_0 <= RAM_18[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_18[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_18[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_18[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_18[Read_Width + 4] : 0;
                    end
                19:
                    begin
                        data_out_0 <= RAM_19[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_19[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_19[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_19[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_19[Read_Width + 4] : 0;
                    end
                20:
                    begin
                        data_out_0 <= RAM_20[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_20[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_20[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_20[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_20[Read_Width + 4] : 0;
                    end
                21:
                    begin
                        data_out_0 <= RAM_21[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_21[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_21[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_21[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_21[Read_Width + 4] : 0;
                    end
                22:
                    begin
                        data_out_0 <= RAM_22[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_22[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_22[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_22[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_22[Read_Width + 4] : 0;
                    end
                23:
                    begin
                        data_out_0 <= RAM_23[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_23[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_23[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_23[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_23[Read_Width + 4] : 0;
                    end
                24:
                    begin
                        data_out_0 <= RAM_24[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_24[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_24[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_24[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_24[Read_Width + 4] : 0;
                    end
                25:
                    begin
                        data_out_0 <= RAM_25[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_25[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_25[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_25[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_25[Read_Width + 4] : 0;
                    end
                26:
                    begin
                        data_out_0 <= RAM_26[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_26[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_26[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_26[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_26[Read_Width + 4] : 0;
                    end
                27:
                    begin
                        data_out_0 <= RAM_27[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_27[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_27[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_27[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_27[Read_Width + 4] : 0;
                    end
                28:
                    begin
                        data_out_0 <= RAM_28[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_28[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_28[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_28[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_28[Read_Width + 4] : 0;
                    end
                29:
                    begin
                        data_out_0 <= RAM_29[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_29[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_29[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_29[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_29[Read_Width + 4] : 0;
                    end
                30:
                    begin
                        data_out_0 <= RAM_30[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_30[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_30[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_30[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_30[Read_Width + 4] : 0;
                    end
                31:
                    begin
                        data_out_0 <= RAM_31[Read_Width];
                        data_out_1 <= (Read_Width < 256 - 1) ? RAM_31[Read_Width + 1] : 0;
                        data_out_2 <= (Read_Width < 256 - 2) ? RAM_31[Read_Width + 2] : 0;
                        data_out_3 <= (Read_Width < 256 - 3) ? RAM_31[Read_Width + 3] : 0;
                        data_out_4 <= (Read_Width < 256 - 4) ? RAM_31[Read_Width + 4] : 0;
                    end

                default:
                    begin
                        data_out_0 <= 0;
                        data_out_1 <= 0;
                        data_out_2 <= 0;
                        data_out_3 <= 0;
                        data_out_4 <= 0;
                    end
            endcase
        end
    end

endmodule