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


module UART_RX_Flow_ctrl #(
    parameter Bit_width_counter = 4 // 2 ** this number = number of bits needed for the output
)(
    input Clk,
    input i_Rx_Serial,
    output reg Valid_num, 
    output [2 ** Bit_width_counter - 1 : 0] Data_out 
    );

    // UART module related signals
    wire RX_Done;
    wire [7:0] RX_received_data; // UART can only do 8 bit

    // Combinational logics to check if the received value is indeed a number or a negative number
    wire RX_received_data_is_number;
    assign RX_received_data_is_number = (RX_received_data[7:4] == 4'b0011 && RX_received_data[3:0] <= 4'b1001) ? 1 : 0; // 0 ~ 9 in ascii table is 48 ~ 57 and it can be represented slightly differently
    wire negative_sign;
    assign negative_sign = (RX_received_data == 8'h2D); // "-" is 0x2D in ASCII encoding
    reg received_negative_num = 0;

    // Output data logic (catered primarily for negative number)
    reg [2 ** Bit_width_counter - 1 : 0] Received_data;
    assign Data_out = received_negative_num ? (~Received_data + 1) : Received_data;

    // State assignment -- One hot encoding
    localparam special_state = 5'b00000;
    localparam Byte_0 = 5'b00001;
    localparam Byte_1 = 5'b00010;
    localparam Byte_2 = 5'b00100;
    localparam Byte_3 = 5'b01000;
    localparam Byte_4 = 5'b10000;
    reg [4:0] state = Byte_0; // initialise into MSB first

    reg [15:0] Received_0;
    reg [15:0] Received_1;
    reg [15:0] Received_2;
    reg [15:0] Received_3;
    reg [15:0] Received_4;

    /********* Actual Flow Control Logic *********/
    always @ (posedge Clk) begin
        case (state) 
            Byte_0:
                begin
                    // always reset valid num here
                    Valid_num <= 0;

                    if (RX_Done) begin
                        if (RX_received_data_is_number) begin
                            // if the received data is a number, save it into received byte_0 with the correct format
                            Received_0 <= {12'd0, RX_received_data[3:0]}; // essentially the last 4 bit represents the number
                            state <= Byte_1;
                        end else if (negative_sign) begin
                            received_negative_num <= 1;
                            state <= Byte_0;
                        end else begin 
                            // if the received data is not a real number, next state is still Byte_0
                            state <= Byte_0;
                            received_negative_num <= 0; // it has to be a negative sign followed by a valid number, otherwise it is not a valid input
                        end
                    end
                end

            Byte_1:
                begin
                    if (RX_Done) begin
                        if (RX_received_data_is_number) begin
                            Received_0 <= Received_0 * 10;

                            Received_1 <= {12'd0, RX_received_data[3:0]}; 
                            state <= Byte_2;
                        end else begin
                            state <= Byte_0;
                            Valid_num <= 1;
                            Received_data <= Received_0;
                        end
                    end
                end
            
            Byte_2:
                begin
                    if (RX_Done) begin
                        if (RX_received_data_is_number) begin
                            Received_0 <= Received_0 * 10;
                            Received_1 <= Received_1 * 10;

                            Received_2 <= {12'd0, RX_received_data[3:0]}; 

                            state <= Byte_3;
                        end else begin
                            state <= Byte_0;
                            Valid_num <= 1;
                            Received_data <= Received_0 + Received_1;
                        end
                    end
                end
            
            Byte_3:
                begin
                    if (RX_Done) begin
                        if (RX_received_data_is_number) begin
                            Received_0 <= Received_0 * 10;
                            Received_1 <= Received_1 * 10;
                            Received_2 <= Received_2 * 10;

                            Received_3 <= {12'd0, RX_received_data[3:0]}; 

                            state <= Byte_4;
                        end else begin
                            state <= Byte_0;
                            Valid_num <= 1;
                            Received_data <= Received_0 + Received_1 + Received_2;
                        end
                    end
                end

            Byte_4:
                begin
                    if (RX_Done) begin
                        if (RX_received_data_is_number) begin
                            // Worst case scenario
                            Received_0 <= Received_0 * 10;
                            Received_1 <= Received_1 * 10;
                            Received_2 <= Received_2 * 10;
                            Received_3 <= Received_3 * 10;

                            Received_4 <= {12'd0, RX_received_data[3:0]};
                            
                            state <= special_state;
                        end else begin
                            Received_data <= Received_0 + Received_1 + Received_2 + Received_3;
                            state <= Byte_0;
                            Valid_num <= 1;
                        end
                    end
                end
            
            special_state:
                begin
                    state <= Byte_0;
                    Valid_num <= 1;
                    Received_data <= Received_0 + Received_1 + Received_2 + Received_3 + Received_4;
                end
        endcase
    end

    /********* Declaring Submodules ***************/
    UART_RX UART_RX (
        .i_Clock(Clk),
        .i_Rx_Serial(i_Rx_Serial),
        .o_Rx_DV(RX_Done),
        .o_Rx_Byte(RX_received_data)
    );
endmodule
