// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
================================================================================
debug_brg:   Debug Baud Rate Generator

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

module debug_brg
  (
   // Timing and reset inputs
   input  wire                clk,              // System clock 
   input  wire                rst_n,            // Active low reset

   input  wire                wr,               // Data write strobe
   input  wire [7:0]          d,                // Data input

   input  wire                baud_set,
   input  wire [6:0]          baud_div,
   output wire                baud_ref
   );

   // ================================================
   // Internal signals
   // ================================================
   reg   [7:0]       s_baud_cnt;                // Baud rate counter
   reg   [7:0]       s_baud_preload;            // Baud counter preload val
   reg               s_baud_ref;                // Baud ref signal
   reg               s_wr_edge;                 // Write signal edge detect

   assign baud_ref = s_baud_ref;

   // ================================================
   // Clocked block to capture write data from CPU
   // ================================================
   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         // Default to all input
         s_baud_preload <= 8'h0C;
         s_wr_edge <= 1'b0;
      end
      else
      begin
         // Latch data on faling wr edge
         if (wr & ~s_wr_edge)
            s_baud_preload <= d;
         else if (baud_set)
            s_baud_preload <= {1'b0, baud_div};

         // Create edge detector
         s_wr_edge <= wr;
      end
   end

   // ================================================
   // Generate 16x baud counter
   // ================================================
   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         // Default to all input
         s_baud_cnt <= 8'h0;
         s_baud_ref <= 1'b0;
      end
      else
      begin
         // Latch data on faling wr edge
         if (s_baud_cnt == 8'h0)
         begin
            s_baud_cnt <= s_baud_preload;
            s_baud_ref <= ~s_baud_ref;
         end
         else
            s_baud_cnt <= s_baud_cnt -1;
      end
   end

endmodule

