`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2021 17:10:29
// Design Name: 
// Module Name: UART_TX
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


module UART_TX(
    input sysclk,
    input [7:0] i_Tx_Byte,
    input i_Tx_start,
    output reg o_Tx_Serial,
    output o_Tx_Active,
    output o_Tx_Done
    );

 // States that this controller can be in
   parameter s_IDLE          = 3'b000;
   parameter s_TX_START_BIT  = 3'b001;
   parameter s_TX_DATA_BITS  = 3'b010;
   parameter s_TX_STOP_BIT   = 3'b011;
   parameter s_CLEANUP       = 3'b100;
   
   // 12Mhz / 9600 = 1250
   parameter CLKS_PER_BIT   = 1250;
   
   // Registers for iterating between different states through the message byte
   reg [2:0]        r_SM_Main = 0;
   reg [10:0]    r_Clock_Count = 0;
   reg [2:0]      r_Bit_Index = 0;
   reg [7:0]        r_Tx_Data = 0;
   reg              r_Tx_Done = 0;
   reg            r_Tx_Active = 0;
   
   // Assigning registers to output
   assign o_Tx_Active = r_Tx_Active;
   assign o_Tx_Done = r_Tx_Done;
   
   always @ (posedge sysclk) begin
       case (r_SM_Main)
           // State Idle
           s_IDLE:
               begin
                   // Drive Line high for Idle
                   o_Tx_Serial <= 1'b1;
                   
                   // Resett all other parameters
                   r_Tx_Done <= 1'b0;
                   r_Clock_Count <= 0;
                   r_Bit_Index <= 0;
                   
                   // Check for start sending condition
                   if (i_Tx_start == 1'b1) begin
                       r_Tx_Active <= 1'b1;
                       r_Tx_Data <= i_Tx_Byte;
                       r_SM_Main <= s_TX_START_BIT;
                       r_Tx_Done <= 0;
                   end else
                       r_SM_Main <= s_IDLE;
               end
           
           // State Start bit
           s_TX_START_BIT:
               begin
                   // Drive line low to signal start
                   o_Tx_Serial <= 1'b0;
                   
                   // Ensure we waited for long enough so that that we can move on to the next bit
                   if (r_Clock_Count < CLKS_PER_BIT - 1) begin
                       r_Clock_Count <= r_Clock_Count + 1;
                       r_SM_Main <= s_TX_START_BIT;
                   end else begin
                       r_Clock_Count <= 0;
                       r_SM_Main     <= s_TX_DATA_BITS;
                   end
               end
           
           // State send data byte
           s_TX_DATA_BITS:
               begin
                   o_Tx_Serial <= r_Tx_Data[r_Bit_Index];
                   
                   // Send each bit out as per baud rate
                   if (r_Clock_Count < CLKS_PER_BIT - 1) begin
                       r_Clock_Count <= r_Clock_Count + 1;
                       r_SM_Main <= s_TX_DATA_BITS;
                   end else begin
                       r_Clock_Count <= 0;
                       
                       // Iterate through the different bits
                       if (r_Bit_Index < 7) begin
                           r_Bit_Index <= r_Bit_Index + 1;
                           r_SM_Main <= s_TX_DATA_BITS;
                       end else begin
                           r_Bit_Index <= 0;
                           r_SM_Main <= s_TX_STOP_BIT;
                       end
                   end
               end
           
           // State ending bit
           s_TX_STOP_BIT:
               begin
                   o_Tx_Serial <= 1'b1;
                   
                   // Wait for next bit
                   if (r_Clock_Count < CLKS_PER_BIT - 1) begin
                       r_Clock_Count <= r_Clock_Count + 1;
                       r_SM_Main <= s_TX_STOP_BIT;
                   end else begin
                       r_Tx_Done <= 1'b1;
                       r_Clock_Count <= 0;
                       r_SM_Main <= s_CLEANUP;
                       r_Tx_Active <= 1'b0;
                   end
               end
           
           // Clean up for 1 clock for good measure
           s_CLEANUP:
               begin
                   r_Tx_Done <= 1'b1;
                   r_SM_Main <= s_IDLE;
               end
           
           // Default
           default: r_SM_Main <= s_IDLE;
       endcase    
   end
endmodule
