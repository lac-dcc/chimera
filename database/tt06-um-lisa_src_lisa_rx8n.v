// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
================================================================================
lisa_rx8n:  Lisa Peripheral Design for RX 8bit No parity

Copyright 1998-2015 Ken Pettit

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

Written April 8, 1998
Kenneth D. Pettit
================================================================================
*/

module lisa_rx8n
  (
   // Timing and reset inputs
   input  wire                clk,              // System clock 
   input  wire                rst_n,            // Active low reset

   input  wire                baud_ref,         // Baud Rate reference
   input  wire                rxd,              // RX data
   input  wire                rd,               // Read signal

   output wire [7:0]          d,                // Output parallel data
   output wire                data_avail        // '1' when data available
   );

   // ================================================
   // Internal signals
   // ================================================
   reg  [7:0]        bit_count;                 // Count 0 to 160
   reg  [7:0]        shift;                     // Shift register
   reg  [7:0]        dbuf;                      // Data buffer
   reg               buffer_full;               // True when data in buffer

   reg               s_last_rd;                 // Previous read signal
   reg               s_rxd;                     // 

   reg               s_rd_idx;
   reg               s_wr_idx;
   reg               s_baud_edge;


   assign d = dbuf;
   assign data_avail = buffer_full & (s_rd_idx ^ s_wr_idx);

   // ================================================
   // Detect a read data condition
   // ================================================
   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         s_last_rd <= 1'b0;
         s_rd_idx <= 1'b0;
      end
      else
      begin
         // Detect rd on rising edge of read clock
         if (rd & ~s_last_rd && buffer_full)
            s_rd_idx <= ~s_rd_idx;

         s_last_rd <= rd;
      end
   end

   // ================================================
   // RX data state machine
   // ================================================
   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         buffer_full <= 1'b0;
         s_wr_idx <= 1'b0;
         bit_count <= 8'd160;
         shift <= 8'h0;
         dbuf <= 8'h0;
         s_rxd <= 1'b1;
         s_baud_edge <= 1'b0;
      end
      else
      begin
         // Create baud_ref edge detect
         s_baud_edge <= baud_ref;

         // If we have data in the FIFO and none in the output buffer,
         // then copy FIFO to output buffer.
         if (s_rd_idx == s_wr_idx)
         begin
            buffer_full <= 1'b0;
         end

         // Detect rising edge of baud_ref
         if (baud_ref & !s_baud_edge)
         begin
            // Save the RX sample
            s_rxd <= rxd;

            // Check if there is a receive active
            if (bit_count > 151)
            begin
               // --------------------------------------------
               // No receive active.  Check for start bit
               // --------------------------------------------
               if (s_rxd == 1'b0)
                  bit_count <= 1;               // Start bit found
            end
            else
            begin
               // --------------------------------------------
               // Receive Active.  Increment bit/clock counter
               // --------------------------------------------
               bit_count <= bit_count + 1;

               // Check if in middle of a bit time
               if (bit_count[3:0] == 4'h7)
               begin
                  // Shift the register bits
                  shift[6:0] <= shift[7:1];

                  // Check if in middle of last bit.  Latch data to output
                  // buffer and reset the counter.
                  if (bit_count[7:4] == 4'h9)
                  begin
                     buffer_full <= 1'b1;       // Indicate data available
                     dbuf <= shift;             // Save Data
                     if (!buffer_full || (buffer_full && rd))
                        s_wr_idx <= ~s_wr_idx;     // Update write index
                     bit_count <= 160;
                  end
                  else
                     shift[7] <= s_rxd;
               end
            end
         end
      end
   end

endmodule

