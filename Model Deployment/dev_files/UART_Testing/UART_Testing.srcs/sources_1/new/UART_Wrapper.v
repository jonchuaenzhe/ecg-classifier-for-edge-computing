`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2022 13:53:32
// Design Name: 
// Module Name: UART_Wrapper
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


module UART_Wrapper(
    input sysclk,
    input uart_txd_in,
    output uart_rxd_out
    );

    reg [4:0] RAM_sent_address = 0;
    reg [5:0] RAM_received_address = 0;

    // TX related
    reg [15:0] TX_data_out;
    wire TX_IDLE;
    reg TX_Start;

    // RX related
    wire [15:0] RX_received_data;
    wire RX_Done;

    // RAM declaration
    reg [15:0] RAM [0:9];
    
    initial begin
        RAM[16] = 13; // /r
    end

    // State machine declaration
    localparam RX_Mode = 0;
    localparam TX_Mode = 1;
    reg state = 0;

    // Actual working stuff
    always @ (posedge sysclk) begin

        case (state)
            RX_Mode:
                begin
                    if (RX_Done && RAM_received_address <= 9) begin

                        RAM[RAM_received_address] <= RX_received_data;
                        RAM_received_address <= RAM_received_address + RX_Done;
                    end else if (RAM_received_address == 9) begin
                        RAM_received_address <= 0;
                        state <= TX_Mode;
                    end
                end

            TX_Mode:
                begin
                    if (TX_IDLE && RAM_sent_address < 9 && TX_Start == 0) begin
                        TX_data_out <= RAM[RAM_sent_address];
                        RAM_sent_address <= RAM_sent_address + TX_IDLE;
                        TX_Start <= 1;
                    end else if (RAM_sent_address == 9) begin
                        RAM_sent_address <= 0;
                        state <= RX_Mode;
                        TX_Start <= 0;
                    end else begin
                        TX_Start <= 0;
                    end

                end
        endcase
    end


    /********** Declaring Submodules ************/

    UART_TX_Flow_ctrl UART_TX_Controller(
        .Clk(sysclk),
        .data_to_be_sent(TX_data_out),
        .i_Tx_start(TX_Start),
        .o_Tx_Serial(uart_rxd_out),
        .TX_IDLE(TX_IDLE)
    );

    UART_RX_Flow_ctrl UART_RX_Controller (
        .Clk(sysclk),
        .i_Rx_Serial(uart_txd_in),
        .Valid_num(RX_Done),
        .Data_out(RX_received_data)
    );

endmodule
