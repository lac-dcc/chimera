// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
==============================================================================
lisa_qspi_controller.v:  Little ISA (LISA) QSPI arbiter.

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

==============================================================================
*/

module lisa_qspi_controller
#(
   parameter CHIP_SELECTS = 2
 )
(
   input wire     clk,
   input wire     rst_n,

   // Interface for debug
   input  wire [23:0]   debug_addr,          // 8Mx32
   output wire [15:0]   debug_rdata,         // Read data
   input  wire [15:0]   debug_wdata,         // Data to write
   input  wire [1:0]    debug_wstrb,         // Which bytes in the 32-bits to write
   output wire          debug_ready,         // Next 32-bit value is ready
   input  wire          debug_ready_ack,     // Next 32-bit value is ready
   input  wire          debug_valid,         // Indicates a valid request 
   input  wire [3:0]    debug_xfer_len,      // Number of 16-bit words to transfer
   input  wire [CHIP_SELECTS -1:0]  debug_ce_ctrl,
   input  wire          debug_custom_spi_cmd,
   input  wire [7:0]    debug_cmd_quad_write,

   // Interface for PRISM
   input  wire [23:0]   lisa1_addr,          // 8Mx32
   output wire [15:0]   lisa1_rdata,         // Read data
   input  wire [15:0]   lisa1_wdata,         // Data to write
   input  wire [1:0]    lisa1_wstrb,         // Which bytes in the 32-bits to write
   output wire          lisa1_ready,         // Next 32-bit value is ready
   input  wire          lisa1_ready_ack,     // Next 32-bit value is ready
   output wire          lisa1_xfer_done,     // Total xfer_len transfer is done
   input  wire          lisa1_valid,         // Indicates a valid request 
   input  wire [3:0]    lisa1_xfer_len,      // Number of 32-bit words to transfer
   input  wire [CHIP_SELECTS -1:0]  lisa1_ce_ctrl,
   input  wire [23:0]   lisa2_addr,          // 8Mx32
   output wire [15:0]   lisa2_rdata,         // Read data
   input  wire [15:0]   lisa2_wdata,         // Data to write
   input  wire [1:0]    lisa2_wstrb,         // Which bytes in the 32-bits to write
   output wire          lisa2_ready,         // Next 32-bit value is ready
   input  wire          lisa2_ready_ack,     // Next 32-bit value is ready
   output wire          lisa2_xfer_done,     // Total xfer_len transfer is done
   input  wire          lisa2_valid,         // Indicates a valid request 
   input  wire [3:0]    lisa2_xfer_len,      // Number of 16-bit words to transfer
   input  wire [CHIP_SELECTS -1:0]  lisa2_ce_ctrl,

   // Interface to the qqspi controller
   output wire [23:0]   addr,                // 8Mx32
   input  wire [15:0]   rdata,               // Read data
   output wire [15:0]   wdata,               // Data to write
   output wire [1:0]    wstrb,               // Which bytes in the 32-bits to write
   input  wire          ready,               // Next 32-bit value is ready
   output wire          ready_ack,           // Next 32-bit value is ready
   input  wire          xfer_done,           // Total xfer_len transfer is done
   output wire          valid,               // Indicates a valid request 
   output wire [3:0]    xfer_len,            // Number of 16-bit words to transfer
   output wire [CHIP_SELECTS -1:0]  ce_ctrl,
   output wire          custom_spi_cmd,
   output wire [7:0]    cmd_quad_write
);

   localparam  N_CLIENTS = 3;
   localparam  N_BITS = $clog2(N_CLIENTS);

   reg   [1:0]             arb, arb_next;
   reg   [1:0]             arb_sel, arb_sel_next;
   wire  [N_CLIENTS-1:0]   c_active;
   wire  [1:0]             arb_other1;
   reg                     active, active_next;
   reg                     valid_gate, valid_gate_next;

   wire [23:0]             c_addr[N_CLIENTS-1:0];        // 8Mx32
   wire [15:0]             c_rdata[N_CLIENTS-1:0];       // Read data
   wire [15:0]             c_wdata[N_CLIENTS-1:0];       // Data to write
   wire [1:0]              c_wstrb[N_CLIENTS-1:0];       // Which bytes in the 32-bits to write
   wire                    c_ready[N_CLIENTS-1:0];       // Next 32-bit value is ready
   wire                    c_xfer_done[N_CLIENTS-1:0];   // Total xfer_len transfer is done
   wire [N_CLIENTS-1:0]    c_valid;                      // Indicates a valid request 
   wire [N_CLIENTS-1:0]    c_ready_ack;                  // Indicates a valid request 
   wire [3:0]              c_xfer_len[N_CLIENTS-1:0];    // Number of 16-bit words to transfer
   wire [CHIP_SELECTS-1:0] c_ce_ctrl[N_CLIENTS-1:0];

   /* 
   =================================================================================
   Assign client array signals
   =================================================================================
   */
   assign c_addr[0]           = debug_addr;
   assign c_wdata[0]          = debug_wdata;
   assign c_wstrb[0]          = debug_wstrb;
   assign c_valid[0]          = debug_valid;
   assign c_ready_ack[0]      = debug_ready_ack;
   assign c_xfer_len[0]       = debug_xfer_len;
   assign c_ce_ctrl[0]        = debug_ce_ctrl;
   assign debug_rdata         = c_rdata[0];
   assign debug_ready         = c_ready[0];
   assign custom_spi_cmd      = c_active[0] ? debug_custom_spi_cmd : 1'b0;
   assign cmd_quad_write      = debug_cmd_quad_write;

   assign c_addr[1]           = lisa1_addr;
   assign c_wdata[1]          = lisa1_wdata;
   assign c_wstrb[1]          = lisa1_wstrb;
   assign c_valid[1]          = lisa1_valid;
   assign c_ready_ack[1]      = lisa1_ready_ack;
   assign c_xfer_len[1]       = lisa1_xfer_len;
   assign c_ce_ctrl[1]        = lisa1_ce_ctrl;
   assign lisa1_rdata         = c_rdata[1];
   assign lisa1_ready         = c_ready[1];
   assign lisa1_xfer_done     = c_xfer_done[1];

   assign c_addr[2]           = lisa2_addr;
   assign c_wdata[2]          = lisa2_wdata;
   assign c_wstrb[2]          = lisa2_wstrb;
   assign c_valid[2]          = lisa2_valid;
   assign c_ready_ack[2]      = lisa2_ready_ack;
   assign c_xfer_len[2]       = lisa2_xfer_len;
   assign c_ce_ctrl[2]        = lisa2_ce_ctrl;
   assign lisa2_rdata         = c_rdata[2];
   assign lisa2_ready         = c_ready[2];
   assign lisa2_xfer_done     = c_xfer_done[2];

   assign arb_other1 = arb == 2'h1 ? 2'h2 : 2'h1;

   /* 
   =================================================================================
   Assign the outputs to the qspi controller
   =================================================================================
   */
   assign addr       = c_addr[arb_sel];
   assign wdata      = c_wdata[arb_sel];
   assign wstrb      = c_wstrb[arb_sel];
   assign valid      = c_valid[arb_sel] & valid_gate;
   assign xfer_len   = c_xfer_len[arb_sel];
   assign ce_ctrl    = c_ce_ctrl[arb_sel];
   assign ready_ack  = c_ready_ack[arb_sel];

   /* 
   =================================================================================
   Route the inputs from the qqspi controller
   =================================================================================
   */
   generate
      for (genvar c = 0; c < N_CLIENTS; c = c + 1)
      begin : GEN_QQSPI_INPUTS
         assign c_active[c]    = active && (arb_sel == c);
         assign c_rdata[c]     = c_active[c] ? rdata : 16'h0;
         assign c_ready[c]     = c_active[c] ? ready : 1'b0;
         assign c_xfer_done[c] = c_active[c] ? xfer_done : 1'b0;
      end
   endgenerate

   /* 
   =================================================================================
   Generate the flops
   =================================================================================
   */
   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         arb        <= 2'h1;
         arb_sel    <= {N_BITS{1'b0}};
         active     <= 1'b0;
         valid_gate <= 1'b0;
      end
      else
      begin
         arb        <= arb_next;
         arb_sel    <= arb_sel_next;
         active     <= active_next;
         valid_gate <= valid_gate_next;
      end
   end

   /* 
   =================================================================================
   The state machine logic
   =================================================================================
   */
   always @*
   begin
      arb_next        = arb;
      active_next     = active;
      arb_sel_next    = arb_sel;
      valid_gate_next = valid_gate;

      // If there is an active transfer, then we must wait for it to complete
      if (active)
      begin
         // Wait for xfer_done before dropping active
         if (xfer_done)
         begin
            // Indicate we are not active
            active_next = 1'b0;
         end

         // Drop valid_gate after first ready signal
         if (ready)
            valid_gate_next = 1'b0;
      end
      else
      begin
         // There is no active transfer.  Test for start of new transfer
         if (|c_valid)
         begin
            // Mark as active
            active_next     = 1'b1;
            valid_gate_next = 1'b1;

            // Give debugger first priority
            if (c_valid[0])
               arb_sel_next = 2'h0;
            else
            begin
               // Grant access to arb first
               if (c_valid[arb])
               begin
                  // Grant access to arb
                  arb_sel_next = arb;
                  arb_next = arb == 2'h2 ? 2'h1 : 2'h2;
               end
               else
               begin
                  // Grant access to arb_other
                  arb_sel_next = arb_other1;
               end
            end
         end
         else
         begin
            // Simply toggle arb
            arb_next = arb == 2'h2 ? 2'h1 : 2'h2;
         end
      end
   end

/*
   ila_3 i_ila_3
   (
       .clk     ( clk ),
       .probe0  ( debug_valid ),             // 1
       .probe1  ( debug_ready ),             // 1
       .probe2  ( active ),                  // 1
       .probe3  ( valid_gate ),              // 1
       .probe4  ( debug_ce_ctrl ),           // 3
       .probe5  ( arb ),                     // 2
       .probe6  ( arb_sel ),                 // 2
       .probe7  ( c_valid ),                 // 3
       .probe8  ( arb_sel_next )             // 2
   );
*/

endmodule

