/*
 * An example of converting an ASCII string into binary using lookup tables.
 *
 * Copyright (C) 2012 Vlad Lazarenko <vlad@lazarenko.me>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

// synopsys translate_off
`timescale 1 ns / 1 ps
// synopsys translate_on

/*
 * Using carefully chosen minimal size for registers effectively increases fMAX.
 * However, synthesis tool complain about result being truncated. It is possible
 * to use full 32-bit registers and provide false paths, but easier to just
 * disable the warning.
 */
// altera message_off 10230

/*
 * Convert unsigned 32-bit ASCII number representation into binary.
 *
 * Data bus width is 80 bit for value (up to 10 characters).
 * Empty flag is 4 bit wide.
 * Output latency is 4 cycles.
 * fMAX on Arria II device is a little above 300 MHz.
 * @ 300 MHz, the throughput is ~22.32 Gbps (or ~2.79 GBps).
 */
module ascii_to_binary(clk, reset_n, data, mod, result);

   input clk;
   input reset_n;

   input [79:0] data;
   input [3:0]  mod;

   output reg [31:0] result;

   // Convert a single ASCII digit into a corresponding
   // 4-bit binary number by subtracting 48.
   function [3:0] c2i;
      input [7:0] c;
      reg [7:0]   i;
      begin
         i = (c - 6'd48);
         c2i = i[3:0];
      end
   endfunction

   // Convert a single ASCII digit into a corresponding
   // 4-bit binary number by subtracting 48 and multiply
   // the result. Multiplication is used to normalize
   // a single digit number depending on its position
   // in the input data sequence. For example, this function
   // can be used to transform a sequence of ASCII digits
   // like this: '1', '2', '3' into a digits like 100, 20, 3.
   // This function can potentially use multipliers instead of
   // lookup table. However, using multipliers can reduce fMAX.
   function [31:0] c2d;
      input [7:0]    c;
      input integer  m;
      reg [31:0]     d;
      begin
         case (c2i(c))
           4'd0:  d = 0;     // "0" is always 0
           4'd1:  d = m;     // Multiplying 1 by "m" always yields "m"
           4'd2:  d = m * 2;
           4'd3:  d = m * 3;
           4'd4:  d = m * 4;
           4'd5:  d = m * 5;
           4'd6:  d = m * 6;
           4'd7:  d = m * 7;
           4'd8:  d = m * 8;
           4'd9:  d = m * 9;
           4'd10: d = 0;     // Don't care (false path)
           4'd11: d = 0;     // Don't care (false path)
           4'd12: d = 0;     // Don't care (false path)
           4'd13: d = 0;     // Don't care (false path)
           4'd14: d = 0;     // Don't care (false path)
           4'd15: d = 0;     // Don't care (false path)
         endcase
         c2d = d[31:0];
      end
   endfunction

   // Stage 1 registers. Each word holds a single converted
   // and adjusted/normalized digit.
   reg [31:0] m9;
   reg [31:0] m8;
   reg [26:0] m7;
   reg [23:0] m6;
   reg [19:0] m5;
   reg [16:0] m4;
   reg [13:0] m3;
   reg [9:0]  m2;
   reg [6:0]  m1;
   reg [3:0]  m0;

   // Stage 2 sum registers.
   reg [31:0] s0;
   reg [31:0] s1;
   reg [31:0] s2;
   reg [31:0] s3;

   // Stage 3 sum registers.
   reg [31:0] s4;
   reg [31:0] s5;

   always @ (posedge clk or negedge reset_n) begin
      if (!reset_n) begin
         m0 <= 0;
         m1 <= 0;
         m2 <= 0;
         m3 <= 0;
         m4 <= 0;
         m5 <= 0;
         m6 <= 0;
         m7 <= 0;
         m8 <= 0;
         m9 <= 0;
         s0 <= 0;
         s1 <= 0;
         s2 <= 0;
         s3 <= 0;
         s4 <= 0;
         s5 <= 0;
         result <= 0;
      end else begin
         /*
          * Pipeline stage #1: Convert every ASCII character into a binary
          * number, normalize every number depending on the word position
          * and valid input data length. For example:
          *    - '1', '2' turns into 10 and 2.
          *    - '1', '2', '3' turns into 100, 20 and 3.
          *    - '1', '2', '3', '4' turns into 1000, 200, 30 and 4
          */

         /*
          * Empty signal is 4 bit wide, but its valid range is from 0 to 9.
          * When MSB in empty signal is low, only 3 bits are compared using
          * a full case. Otherwise, LSB is checked to differentiate between
          * 8 and 9 (4'b1000 and 4'b0001).
          */
         if (mod[3:3] == 1'b0) begin
            case (mod[2:0])
              3'd0: begin
                 m9 <= c2d(data[79:72], 1000000000);
                 m8 <= c2d(data[71:64], 100000000);
                 m7 <= c2d(data[63:56], 10000000);
                 m6 <= c2d(data[55:48], 1000000);
                 m5 <= c2d(data[47:40], 100000);
                 m4 <= c2d(data[39:32], 10000);
                 m3 <= c2d(data[31:24], 1000);
                 m2 <= c2d(data[23:16], 100);
                 m1 <= c2d(data[15:8],  10);
                 m0 <= c2i(data[7:0]);
              end
              3'd1: begin
                 m9 <= c2d(data[79:72], 100000000);
                 m8 <= c2d(data[71:64], 10000000);
                 m7 <= c2d(data[63:56], 1000000);
                 m6 <= c2d(data[55:48], 100000);
                 m5 <= c2d(data[47:40], 10000);
                 m4 <= c2d(data[39:32], 1000);
                 m3 <= c2d(data[31:24], 100);
                 m2 <= c2d(data[23:16], 10);
                 m1 <= c2i(data[15:8]);
                 m0 <= 0;
              end
              3'd2: begin
                 m9 <= c2d(data[79:72], 10000000);
                 m8 <= c2d(data[71:64], 1000000);
                 m7 <= c2d(data[63:56], 100000);
                 m6 <= c2d(data[55:48], 10000);
                 m5 <= c2d(data[47:40], 1000);
                 m4 <= c2d(data[39:32], 100);
                 m3 <= c2d(data[31:24], 10);
                 m2 <= c2i(data[23:16]);
                 m1 <= 0;
                 m0 <= 0;
              end
              3'd3: begin
                 m9 <= c2d(data[79:72], 1000000);
                 m8 <= c2d(data[71:64], 100000);
                 m7 <= c2d(data[63:56], 10000);
                 m6 <= c2d(data[55:48], 1000);
                 m5 <= c2d(data[47:40], 100);
                 m4 <= c2d(data[39:32], 10);
                 m3 <= c2i(data[31:24]);
                 m2 <= 0;
                 m1 <= 0;
                 m0 <= 0;
              end
              3'd4: begin
                 m9 <= c2d(data[79:72], 100000);
                 m8 <= c2d(data[71:64], 10000);
                 m7 <= c2d(data[63:56], 1000);
                 m6 <= c2d(data[55:48], 100);
                 m5 <= c2d(data[47:40], 10);
                 m4 <= c2i(data[39:32]);
                 m3 <= 0;
                 m2 <= 0;
                 m1 <= 0;
                 m0 <= 0;
              end
              3'd5: begin
                 m9 <= c2d(data[79:72], 10000);
                 m8 <= c2d(data[71:64], 1000);
                 m7 <= c2d(data[63:56], 100);
                 m6 <= c2d(data[55:48], 10);
                 m5 <= c2i(data[47:40]);
                 m4 <= 0;
                 m3 <= 0;
                 m2 <= 0;
                 m1 <= 0;
                 m0 <= 0;
              end
              3'd6: begin
                 m9 <= c2d(data[79:72], 1000);
                 m8 <= c2d(data[71:64], 100);
                 m7 <= c2d(data[63:56], 10);
                 m6 <= c2i(data[55:48]);
                 m5 <= 0;
                 m4 <= 0;
                 m3 <= 0;
                 m2 <= 0;
                 m1 <= 0;
                 m0 <= 0;
              end
              3'd7: begin
                 m9 <= c2d(data[79:72], 100);
                 m8 <= c2d(data[71:64], 10);
                 m7 <= c2i(data[63:56]);
                 m6 <= 0;
                 m5 <= 0;
                 m4 <= 0;
                 m3 <= 0;
                 m2 <= 0;
                 m1 <= 0;
                 m0 <= 0;
              end
            endcase
         end else begin
            case (mod[0:0])
              1'b0: begin
                 m9 <= c2d(data[79:72], 10);
                 m8 <= c2i(data[71:64]);
              end
              1'b1: begin
                 m9 <= c2i(data[79:72]);
                 m8 <= 0;
              end
            endcase
            m7 <= 0;
            m6 <= 0;
            m5 <= 0;
            m4 <= 0;
            m3 <= 0;
            m2 <= 0;
            m1 <= 0;
            m0 <= 0;
         end

         // Pipeline stage #2: Sum up numbers from the previous step.
         s0 <= m9 + m0;
         s1 <= m8 + m1;
         s2 <= m7 + (m2 + m3);
         s3 <= m6 + (m4 + m5);

         // Pipeline stage #3: Sum previous partial sums.
         s4 <= (s0 + s1);
         s5 <= (s2 + s3);

         // Last pipeline stage #3: Sum previous partial sums.
         // This yields a 32-bit result.
         result <= (s4 + s5);
      end
   end

endmodule