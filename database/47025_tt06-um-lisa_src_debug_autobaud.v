// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
================================================================================
debug_autobaud:   Debug Auto Baud Rate Detector

Copyright 2024 by Ken Pettit <pettitkd@gmail.com>

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

================================================================================
*/

module debug_autobaud
(
   // Timing and reset inputs
   input  wire                clk,              // System clock 
   input  wire                rst_n,            // Active low reset

   input  wire                disabled,         // Input bit to disable
   input  wire                rx1,              // RX input 1
   input  wire                rx2,              // RX input 2
   input  wire                rx3,              // RX input 3
   output reg                 wr,               // Write the baud rate
   output wire [7:0]          div,              // The divisor
   output reg  [1:0]          rx_sel            // Selected RX input
);

   reg               s_div_found;               // Indicates if division found
   reg [13:0]        s_pulse_width;             // Pulse width in clks
   reg [7:0]         s_bit_div1;
   reg [7:0]         s_bit_div2;
   reg [7:0]         s_bit_div3;
   reg               s_last_rx1;                // Last registered value of rx
   reg               s_last_rx2;                // Last registered value of rx
   reg               s_last_rx3;                // Last registered value of rx
   reg [1:0]         s_rx_sel;                  // Last registered value of rx
   reg               s_done;
   wire              s_sel_rx;

   assign div = s_bit_div1;                     // Use any of the calculated divs
   assign s_sel_rx = s_rx_sel == 2'h1 ? rx1 : s_rx_sel == 2'h2 ? rx2 : s_rx_sel == 2'h3 ? rx3 : 1'b0;

   always @(posedge clk or negedge rst_n)
   begin
      if (~rst_n)
      begin
         s_div_found    <= 1'b0;                // Baud rate not found
         wr             <= 1'b0;
         s_bit_div1     <= 8'h0;
         s_bit_div2     <= 8'h0;
         s_bit_div3     <= 8'h0;
         s_pulse_width  <= 14'h0;
         s_last_rx1     <= 1'b0;
         s_last_rx2     <= 1'b0;
         s_last_rx3     <= 1'b0;
         rx_sel         <= 2'h0;
         s_rx_sel       <= 2'h0;
         s_done         <= 1'b0;
      end
      else
      begin
         if (s_div_found == 1'b0)
         begin
            // Create an edge detector for rx
            s_last_rx1 <= rx1;
            s_last_rx2 <= rx2;
            s_last_rx3 <= rx3;

            // Test for change on any of the potential RX inputs
            if ((rx1 != s_last_rx1) || (rx2 != s_last_rx2) || (rx3 != s_last_rx3))
            begin
               // Choose the rx_sel
               if (rx1 != s_last_rx1)
                  s_rx_sel <= 2'h1;
               else if (rx2 != s_last_rx2)
                  s_rx_sel <= 2'h2;
               else if (rx3 != s_last_rx3)
                  s_rx_sel <= 2'h3;

               // Test if auto-baud detector is disabled
               if (disabled)
                  s_div_found <= 1'b1;

               // Reset the pulse width counter
               s_pulse_width <= 14'h0;
               
               // If this is a valid pulse, then save the last 3 pulses
               if (s_pulse_width != 14'h3FFF)
               begin
                  // Save the new pulse divider and shift the others
                  s_bit_div1 <= s_pulse_width[12 -: 8];
                  s_bit_div2 <= s_bit_div1;
                  s_bit_div3 <= s_bit_div2;
               end
            end
            else
            begin
               // Create a pulse width counter
               if (s_pulse_width != 14'h3FFF)
                  s_pulse_width <= s_pulse_width + 1;

               // Test for 3 equivalent divisors
               if (s_bit_div1 == s_bit_div2 && s_bit_div1 == s_bit_div3 &&
                   s_bit_div1 != 8'h0)
               begin
                  // We found the divisor
                  s_div_found <= 1'b1;

                  // Write the divisor to the baud rate generator
                  wr <= 1'b1;
               end
            end
         end
         else if (!s_done)
         begin
            // We found the pulse.  Now wait for the end of the data byte
            // before updating rx_sel 
            wr <= 1'b0;

            // If pulse width not max, then track RX changes
            if (s_pulse_width != 14'h3FFF)
            begin
               s_last_rx1 <= rx1;
               s_last_rx2 <= rx2;
               s_last_rx3 <= rx3;
            end

            if ((rx1 != s_last_rx1) || (rx2 != s_last_rx2) || (rx3 != s_last_rx3))
            begin
               // Reset the pulse width counter
               if (!s_done)
                  s_pulse_width <= 14'h0;
            end
            else
            begin
               // Create a pulse width counter
               if (s_pulse_width != 14'h3FFF)
                  s_pulse_width <= s_pulse_width + 1;

               // When pulse_width is max, update rx_sel
               if (disabled || (s_pulse_width == 14'h3FFF && s_sel_rx == 1'b1))
               begin
                  rx_sel <= s_rx_sel;
                  s_done   <= 1'b1;
               end
            end
         end
      end
   end

endmodule

