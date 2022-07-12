`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2022 14:46:20
// Design Name: 
// Module Name: UART_RX_Flow_ctrl
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


module UART_TX_Flow_ctrl #(
    parameter Bit_width_counter = 4 // 2 ** this number = number of bits needed for the output
)(
    input Clk,
    input [15:0] data_to_be_sent,
    input i_Tx_start,
    output o_Tx_Serial,
    output reg TX_IDLE
    );

    // BCD related
    wire [20 : 0] BCD_result;
    wire [2**Bit_width_counter - 1 : 0] correct_data;
    assign correct_data = (data_to_be_sent[15] == 1) ? (~data_to_be_sent + 1) : data_to_be_sent; // if it is a negative number, mark it
    reg [15:0] BCD_in;

    // TX state related
    localparam IDLE = 3'd0;
    localparam Sign = 3'd1;
    localparam Byte_0 = 3'd2;
    localparam Byte_1 = 3'd3;
    localparam Byte_2 = 3'd4;
    localparam Byte_3 = 3'd5;
    localparam Byte_4 = 3'd6;
    localparam Return = 3'd7;
    reg [2:0] TX_state = 0;

    // TX related others
    wire TX_ready, TX_Active;
    reg TX_Start;
    assign TX_ready = (TX_Active == 0) && (TX_Start == 0);
    reg [7:0] TX_data_out;
    reg Has_previous_non_zero_byte;


    // Actual TX flow control
    always @ (posedge Clk) begin
        case (TX_state)
            IDLE:
                begin
                    if (i_Tx_start) begin
                        BCD_in <= correct_data;
                        TX_state <= Sign;
                        TX_IDLE <= 0;
                    end else begin
                        TX_state <= IDLE;
                        TX_IDLE <= 1;
                    end

                    TX_Start <= 0;
                    Has_previous_non_zero_byte <= 0;
                end

            Sign:
                begin
                    if (TX_ready) begin
                        if (data_to_be_sent[15] == 1) begin
                            TX_data_out <= 8'h2D; //"-"
                            TX_Start <= 1;
                        end
                        TX_state <= Byte_0;
                    end else begin
                        TX_Start <= 0;
                    end
                end

            Byte_0:
                begin
                    if (TX_ready) begin
                        if (BCD_result[20:16] != 4'd0) begin // we do not send 0 here
                           TX_data_out <=  BCD_result[20:16] + 8'd48; // add 48 to ASCII encode the data
                           TX_Start <= 1;
                           Has_previous_non_zero_byte <= 1;
                        end

                        TX_state <= Byte_1;
                    end else begin
                        TX_Start <= 0;
                    end
                end
            
            Byte_1:
                begin
                    if (TX_ready) begin
                        if (BCD_result[15:12] != 4'd0) begin // we do not send 0 here
                            TX_data_out <=  BCD_result[15:12] + 8'd48; // add 48 to ASCII encode the data
                            TX_Start <= 1;
                            Has_previous_non_zero_byte <= 1;
                        end else if (Has_previous_non_zero_byte) begin
                            TX_data_out <=  BCD_result[15:12] + 8'd48; // add 48 to ASCII encode the data
                            TX_Start <= 1;
                        end

                        TX_state <= Byte_2;
                    end else begin
                        TX_Start <= 0;
                    end
                end

            Byte_2:
                begin
                    if (TX_ready) begin
                        if (BCD_result[11:8] != 4'd0) begin // we do not send 0 here
                            TX_data_out <=  BCD_result[11:8] + 8'd48; // add 48 to ASCII encode the data
                            TX_Start <= 1;
                            Has_previous_non_zero_byte <= 1;
                        end else if (Has_previous_non_zero_byte) begin
                            TX_data_out <=  BCD_result[11:8] + 8'd48; // add 48 to ASCII encode the data
                            TX_Start <= 1;
                        end

                        TX_state <= Byte_3;
                    end else begin
                        TX_Start <= 0;
                    end
                end
            
            Byte_3:
                begin
                    if (TX_ready) begin
                        if (BCD_result[7:4] != 4'd0) begin // we do not send 0 here
                            TX_data_out <=  BCD_result[7:4] + 8'd48; // add 48 to ASCII encode the data
                            TX_Start <= 1;
                            Has_previous_non_zero_byte <= 1;
                        end else if (Has_previous_non_zero_byte) begin
                            TX_data_out <=  BCD_result[7:4] + 8'd48; // add 48 to ASCII encode the data
                            TX_Start <= 1;
                        end

                        TX_state <= Byte_4;
                    end else begin
                        TX_Start <= 0;
                    end
                end

            Byte_4:
                begin
                    if (TX_ready) begin
                        if (BCD_result[3:0] != 4'd0) begin // we do not send 0 here
                            TX_data_out <=  BCD_result[3:0] + 8'd48; // add 48 to ASCII encode the data
                            TX_Start <= 1;
                            Has_previous_non_zero_byte <= 1;
                        end else if (Has_previous_non_zero_byte) begin
                            TX_data_out <=  BCD_result[3:0] + 8'd48; // add 48 to ASCII encode the data
                            TX_Start <= 1;
                        end

                        TX_state <= Return;
                    end else begin
                        TX_Start <= 0;
                    end
                end
            
            Return:
                begin
                    if (TX_ready) begin
                        TX_data_out <= 8'h0D;
                        TX_Start <= 1;
                        TX_state <= IDLE;
                    end else begin
                        TX_Start <= 0;
                    end
                end

        endcase
    end

    /********* Declaring Submodules ***************/
    UART_TX UART_TX (
        .sysclk(Clk),
        .i_Tx_Byte(TX_data_out),
        .o_Tx_Serial(o_Tx_Serial),
        .o_Tx_Active(TX_Active),
        .o_Tx_Done(TX_Done),
        .i_Tx_start(TX_Start)
    );

    bin2bcd #(
        .W(16)
    ) BCD (
        .bin(BCD_in),
        .bcd(BCD_result)
    );

endmodule
