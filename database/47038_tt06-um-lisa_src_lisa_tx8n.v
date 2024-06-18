// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
================================================================================
lisa_tx8n:  Lisa Peripheral Design for TX 8bit No parity

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

Change Log:
================================================================================
*/

module lisa_tx8n
  (
   // Timing and reset inputs
   input  wire                clk,              // System clock 
   input  wire                rst_n,            // Active low reset

   input  wire                baud_ref,         // Baud Rate reference
   input  wire                wr,               // Write signal
   input  wire [7:0]          d,                // Input data

   output reg                 txd,              // Output serial data
   output wire                buf_empty
   );

   // ================================================
   // Internal signals
   // ================================================
   localparam [1:0] IDLE = 2'h0;
   localparam [1:0] SEND_START = 2'h1;
   localparam [1:0] SEND_BITS = 2'h2;
   localparam [1:0] SEND_STOP = 2'h3;
   
   reg  [1:0]        mode;                      // Current mode
   reg  [2:0]        bit_count;                 // Bits transmitted
   reg  [3:0]        clock_count;               // Clock counter
   reg               zero_clock;
   reg  [7:0]        shift;                     // Data shift register
   reg  [7:0]        dbuf;                      // Data buffer
   reg               s_buf_wr;                  // Buffer write signal
   reg               s_wr_edge;                 // Write edge detect
   reg               s_buf_sent;                // Sent signal
   reg               s_latch_be;                // Signal to latch buf empty
   reg               s_baud_edge;               // Baud_ref edge detect

   assign buf_empty = ~(s_buf_wr ^ s_buf_sent);

   // ================================================
   // Clocked block to generate clock count
   // ================================================
   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         // Default to all input
         clock_count <= 4'h0;
         s_baud_edge <= 1'b0;
      end
      else
      begin
         // Create baud_ref edge etector
         s_baud_edge <= baud_ref;

         // Detect edge of baud_ref
         if (baud_ref & !s_baud_edge)
         begin
            if (zero_clock || (clock_count == 15))
               clock_count <= 0;
            else
               clock_count <= clock_count + 1;
         end
      end
   end

   // ================================================
   // Generate TX buffer logic
   // ================================================
   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         dbuf <= 8'h0;
         s_buf_wr <= 1'b0;
         s_wr_edge <= 1'b0;
      end
      else
      begin
         // Latch data on rising wr signal
         if (wr & ~s_wr_edge)
         begin
            dbuf <= d;                          // Latch data
            s_buf_wr <= ~s_buf_wr;              // Recore latch condition
         end

         // Create edge detector
         s_wr_edge <= wr;
      end
   end

   // ================================================
   // Decode the registers
   // ================================================
   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         mode <= IDLE;
         bit_count <= 3'h0;
         zero_clock <= 1'b0;
         shift <= 8'h0;
         txd <= 1'b1;
         s_buf_sent <= 1'b0;
         s_latch_be <= 1'b1;
      end
      else
      begin
         // Detect edge of baud_ref
         if (baud_ref & ~s_baud_edge)
         begin
            s_latch_be <= buf_empty;

            case (mode)
            // Wait for TX data to be available
            IDLE:
               begin
                  zero_clock <= 1'b1;
                  bit_count <= 3'h0;

                  // Wait for data in the data buffer
                  if (s_latch_be == 0)
                  begin
                     mode <= SEND_START;
                     shift <= dbuf;
                     s_buf_sent <= s_buf_wr;
                  end
               end

            SEND_START:
               begin
                  zero_clock <= 1'b0;           // Don't zero the clock
                  txd <= 1'b0;                  // Start bit
                  if (clock_count == 15)
                     mode <= SEND_BITS;
               end

            SEND_BITS:
               begin
                  txd <= shift[0];              // Send LSB of data
                  if (clock_count == 15)
                  begin
                     // Shift the data
                     shift[6:0] <= shift[7:1];

                     // Increment the bit counter
                     if (bit_count == 7)
                        mode <= SEND_STOP;
                     else
                        bit_count <= bit_count + 1;
                  end
               end

            SEND_STOP:
               begin
                  txd <= 1'b1;                  // STOP bit
                  if (clock_count == 15)
                     mode <= IDLE;
               end

            endcase
         end
      end
   end

endmodule

