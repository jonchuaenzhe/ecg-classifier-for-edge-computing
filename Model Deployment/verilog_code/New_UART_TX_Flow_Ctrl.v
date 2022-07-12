`timescale 1ns / 1ps

module UART_TX_Flow_ctrl (
    input Clk,
    input [15:0] data_to_be_sent,
    input i_Tx_start,
    output o_Tx_Serial,
    output TX_IDLE,
    output reg TX_Done
    );

    // declaring out message
    (* ROM_STYLE="BLOCK"*) reg [7:0] message [0:8];
    initial begin
        message[0] = 65; // A
        message[1] = 110; // n
        message[2] = 115; // s
        message[3] = 119; // w
        message[4] = 101; // e
        message[5] = 114; // r
        message[6] = 32; // space
        message[7] = 61; // =
        message[8] = 13; // /r
    end

    // BCD related
    // wire [20 : 0] BCD_result;
    // wire [2**Bit_width_counter - 1 : 0] correct_data;
    // assign correct_data = (data_to_be_sent[15] == 1) ? (~data_to_be_sent + 1) : data_to_be_sent; // if it is a negative number, mark it
    // reg [15:0] BCD_in;

    // TX state related
    localparam IDLE = 4'b0001;
    localparam Msg = 4'b0010;
    localparam Class = 4'b0100;
    localparam Return = 4'b1000;

    reg [3:0] TX_state = IDLE;
    reg [2:0] counter = 0;

    // TX related others
    wire TX_ready, TX_Active;
    reg TX_Start;
    assign TX_ready = (TX_Active == 0) && (TX_Start == 0);
    reg [7:0] TX_data_out;
    // reg Has_previous_non_zero_byte;

    assign TX_IDLE = (TX_state == IDLE);

    always @ (posedge Clk) begin
        case (TX_state)
            IDLE:
                begin
                    if (i_Tx_start) begin
                        TX_state <= Msg;
                    end else begin
                        TX_state <= IDLE;
                    end
                    TX_Done <= 0;
                    TX_Start <= 0;
                end
            Msg:
                begin
                    TX_Done <= 0;
                    if (TX_ready) begin
                        TX_data_out <= message[counter];
                        counter <= counter + 1;
                        TX_Start <= 1;

                        if (counter == 7) begin
                            TX_state <= Class;
                        end else begin
                            TX_state <= Msg;
                        end
                    end else begin
                        TX_Start <= 0;
                    end
                end
            Class:
                begin
                    TX_Done <= 0;
                    if (TX_ready) begin
                        TX_data_out <= (data_to_be_sent != 0) + 48; // if it is 0 it means class 0, else it is clas 1
                        TX_Start <= 1;
                        TX_state <= Return;
                    end else begin
                        TX_Start <= 0;
                        TX_state <= Class;
                    end
                end
            Return:
                begin
                    TX_Done <= 0;
                    if (TX_ready) begin
                        TX_data_out <= message[8];
                        TX_state <= 0; // go into default
                        TX_Start <= 1;
                    end else begin
                        TX_Start <= 0;
                    end
                end

            default:
                begin
                    if (TX_ready) begin
                        TX_state <= IDLE;
                        TX_Done <= 1;
                    end else begin
                        TX_state <= 0;
                        TX_Done <= 0;
                    end

                    TX_Start <= 0;
                end
        endcase
    end

    /********* Declaring Submodules ***************/
    UART_TX UART_TX (
        .sysclk(Clk),
        .i_Tx_Byte(TX_data_out),
        .o_Tx_Serial(o_Tx_Serial),
        .o_Tx_Active(TX_Active),
        .o_Tx_Done(),
        .i_Tx_start(TX_Start)
    );

endmodule
