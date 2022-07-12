`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.08.2021 17:05:11
// Design Name: 
// Module Name: RX_Demodulator
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


module UART_RX(
    input i_Clock,
    input i_Rx_Serial,
    output o_Rx_DV, // when Rx_DV = 1, it means we have received a valid byte of data and it can be read without problem
    output [7:0] o_Rx_Byte 
    );
    
    parameter s_IDLE = 3'b000;
    parameter s_RX_START_BIT = 3'b001;
    parameter s_RX_DATA_BITS = 3'b010;
    parameter s_RX_STOP_BIT = 3'b011;
    parameter s_CLEANUP = 3'b100;
    
    reg r_Rx_Data_R = 1'b1;
    reg r_Rx_Data = 1'b1;
    
    reg [10:0] r_Clock_Count = 0;
    reg [10:0] CLKS_PER_BIT = 1250; // 12Mhz / 9600 = 1250
    reg [2:0] r_Bit_Index = 0; // 8 bits total
    reg [7:0] r_Rx_Byte = 0;
    reg r_Rx_DV = 0;
    reg [2:0] r_SM_Main = 0;
    
    assign o_Rx_DV = r_Rx_DV;
    assign o_Rx_Byte = r_Rx_Byte;
    
    // purpose: Double-register the incoming data
    // This allows it to be used in the uART RX Clock Domain
    // (It removes problems caused by metastability) (link for more explanation: https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/wp/wp-01082-quartus-ii-metastability.pdf)
    always @ (posedge i_Clock) begin
        r_Rx_Data_R <= i_Rx_Serial;
        r_Rx_Data <= r_Rx_Data_R;
    end
    
    // Purpose: Control RX state machine
    always @ (posedge i_Clock) begin
        case (r_SM_Main)
            s_IDLE:
                begin
                    r_Rx_DV <= 1'b0;
                    r_Clock_Count <= 0;
                    r_Bit_Index <= 0;
                    
                    // Start bit detected
                    if (r_Rx_Data == 1'b0)
                        r_SM_Main <= s_RX_START_BIT;
                    else 
                        r_SM_Main <= s_IDLE;
                end
            
            // Check middle of start bit to make sure it's still low
            s_RX_START_BIT:
                begin
                    if (r_Clock_Count >= (CLKS_PER_BIT/2)) begin
                        if (r_Rx_Data == 1'b0) begin
                            r_Clock_Count <= 0; // reset counter, as we have found the middle of the bit
                            r_SM_Main <= s_RX_DATA_BITS;
                        end else begin
                            r_SM_Main <= s_IDLE;
                        end
                    end else begin
                        r_Clock_Count <= r_Clock_Count + 1;
                        r_SM_Main <= s_RX_START_BIT;
                    end
                end
            
            // Wait CLKS_PER_BIT - 1 clock cycles to sample serial data
            s_RX_DATA_BITS:
                begin
                    if (r_Clock_Count < CLKS_PER_BIT - 1) begin
                        r_Clock_Count <= r_Clock_Count + 1;
                        r_SM_Main <= s_RX_DATA_BITS;
                    end else begin
                        r_Clock_Count <= 0;
                        r_Rx_Byte[r_Bit_Index] <= r_Rx_Data;
                        
                        // Check if we have received all bits
                        if (r_Bit_Index < 7) begin
                            r_Bit_Index <= r_Bit_Index + 1;
                            r_SM_Main <= s_RX_DATA_BITS;
                        end else begin
                            r_Bit_Index <= 0;
                            r_SM_Main <= s_RX_STOP_BIT;
                        end
                    end
                end
            
            // Receive Stop bit. Stop bit = 1;
            s_RX_STOP_BIT:
                begin
                    if (r_Clock_Count < CLKS_PER_BIT - 1) begin
                        r_Clock_Count <= r_Clock_Count + 1;
                        r_SM_Main <= s_RX_STOP_BIT;
                    end else begin
                        r_Rx_DV <= 1'b1;
                        r_Clock_Count <= 0;
                        r_SM_Main <= s_CLEANUP;
                    end
                end
            
            // Stay here for 1 clock for good measure
            s_CLEANUP:
                begin
                    r_SM_Main <= s_IDLE;
                    r_Rx_DV <= 1'b0;
                end
            
            default:
                r_SM_Main <= s_IDLE;
        endcase
    end
    
endmodule
