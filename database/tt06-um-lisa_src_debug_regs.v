// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
================================================================================
debug_regs:   Debug registers

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

module debug_regs
#(
   parameter CHIP_SELECTS = 2
 )
(
   // Timing and reset inputs
   input  wire                clk,              // System clock 
   input  wire                rst_n,            // Active low reset

   // The Debug ctrl interface
   input  wire [7:0]          dbg_a,
   input  wire [15:0]         dbg_di,
   output reg  [15:0]         dbg_do,
   input  wire                dbg_we,
   input  wire                dbg_rd,
   output wire                dbg_ready,

   // The Debug ctrl interface
   output reg  [23:0]         debug_addr,          // 8Mx32
   input  wire [15:0]         debug_rdata,         // Read data
   output wire [15:0]         debug_wdata,         // Data to write
   output wire [1:0]          debug_wstrb,         // Which bytes in the 32-bits to write
   input  wire                debug_ready,         // Next 32-bit value is ready
   output wire                debug_valid,         // Indicates a valid request 
   output wire [3:0]          debug_xfer_len,      // Number of 16-bit words to transfer
   output reg  [CHIP_SELECTS -1:0]  debug_ce_ctrl,

   output reg  [CHIP_SELECTS -1:0]  lisa1_ce_ctrl,
   output reg  [15:0]         lisa1_base_addr,

   output reg  [CHIP_SELECTS -1:0]  lisa2_ce_ctrl,
   output reg  [15:0]         lisa2_base_addr,

   output reg  [CHIP_SELECTS-1:0] addr_16b,
   output reg  [CHIP_SELECTS-1:0] is_flash,
   output reg  [CHIP_SELECTS-1:0] quad_mode,
   output reg  [CHIP_SELECTS*4-1:0] dummy_read_cycles,
   output wire                custom_spi_cmd,
   output wire [7:0]          cmd_quad_write,
   output reg  [3:0]          plus_guard_time,
   output reg  [3:0]          spi_clk_div,
   output reg  [6:0]          spi_ce_delay,
   output reg  [1:0]          spi_mode,

   output reg  [15:0]         output_mux_bits,
   output reg  [7:0]          io_mux_bits,

   output reg                 cache_disabled,
   output reg  [1:0]          cache_map_sel,
   output reg                 data_cache_flush,
   input  wire                data_cache_flush_ack,
   output reg                 data_cache_invalidate,
   input  wire                data_cache_invalidate_ack,
   output reg                 inst_cache_invalidate,
   input  wire                inst_cache_invalidate_ack
);

   wire        debug_qspi_write;
   wire        debug_qspi_read;
   reg  [7:0]  cmd_quad_write_r;

   // We transfer a single 16-bit value on the debug interface
   assign debug_qspi_write = (dbg_a == 8'h20 || dbg_a == 8'h21) && dbg_we;
   assign debug_qspi_read  = (dbg_a == 8'h20 || dbg_a == 8'h21 || dbg_a == 8'h22) && dbg_rd;
   assign custom_spi_cmd   = dbg_a == 8'h21 || dbg_a == 8'h22;
   assign cmd_quad_write   = dbg_a == 8'h22 ? 8'h05 : cmd_quad_write_r;
   assign debug_xfer_len = 4'h0;    // Zero means 1 16-bit transfer
   assign dbg_ready      = debug_ready || (dbg_a[7:4] != 4'h2 && dbg_a[7:4] != 4'h0 &&
                              (dbg_rd | dbg_we));
   assign debug_valid    = (debug_qspi_write | debug_qspi_read) && !debug_ready;
   assign debug_wdata    = debug_qspi_write ? dbg_di : 16'h0;
   assign debug_wstrb    = {debug_qspi_write, debug_qspi_write};

   // ===================================================================
   // The Debug QSPI address register
   // ===================================================================
   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         debug_addr        <= 24'h0;
         lisa1_base_addr   <= 16'h0;
         lisa2_base_addr   <= 16'h0;
         lisa1_ce_ctrl     <= {{(CHIP_SELECTS-1){1'b0}}, 1'b1};
         lisa2_ce_ctrl     <= {{(CHIP_SELECTS-1){1'b0}}, 1'b1};
         debug_ce_ctrl     <= {{(CHIP_SELECTS-1){1'b0}}, 1'b1};
         quad_mode         <= {{(CHIP_SELECTS-1){1'b0}}, 1'b1};
         addr_16b          <= {CHIP_SELECTS{1'b0}};
         is_flash          <= {{(CHIP_SELECTS-1){1'b0}}, 1'b1};
         dummy_read_cycles <= {{((CHIP_SELECTS-1)*4){1'b0}}, 4'ha};
         cmd_quad_write_r  <= 8'h38;
         plus_guard_time   <= 4'h1;
         output_mux_bits   <= 16'h0;
         io_mux_bits       <= 8'h0;
         cache_disabled    <= 1'b0;
         cache_map_sel     <= 2'h3;
         spi_clk_div       <= 4'h0;
         spi_ce_delay      <= 7'h0;
         spi_mode          <= 2'h0;
         data_cache_flush  <= 1'b0;
         data_cache_invalidate <=1'b0;
         inst_cache_invalidate <= 1'b0;
      end
      else
      begin
         if (dbg_a[7:4] == 4'h1 && dbg_we)
         begin
            case (dbg_a[3:0])    
               4'h0: debug_addr[15:0] <= dbg_di;
               4'h1: debug_addr[23:16] <= dbg_di[7:0];
               4'h2: lisa1_base_addr <= dbg_di;
               4'h3: lisa2_base_addr <= dbg_di;
               4'h4: lisa1_ce_ctrl <= dbg_di[CHIP_SELECTS -1:0];
               4'h5: lisa2_ce_ctrl <= dbg_di[CHIP_SELECTS -1:0];
               4'h6: debug_ce_ctrl <= dbg_di[CHIP_SELECTS -1:0];
               4'h7: {addr_16b, is_flash, quad_mode} <= dbg_di[CHIP_SELECTS*3-1:0];
               4'h8: dummy_read_cycles <= dbg_di[CHIP_SELECTS*4-1:0];
               4'h9: cmd_quad_write_r <= dbg_di[7:0];
               4'ha: plus_guard_time <= dbg_di[3:0];
               4'hb: output_mux_bits <= dbg_di;
               4'hc: io_mux_bits <= dbg_di[7:0];
               4'hd: {inst_cache_invalidate, data_cache_invalidate, data_cache_flush,
                        cache_disabled, cache_map_sel} <= dbg_di[5:0];
   
               4'he: {spi_mode, spi_ce_delay, spi_clk_div} <= dbg_di[12:0];
               default: begin end
            endcase
         end
         else if (dbg_a == 8'h20 && (dbg_we || dbg_rd) && debug_ready)
            debug_addr <= debug_addr + 24'h2;
         else
         begin
            if (data_cache_flush_ack)
               data_cache_flush <= 1'b0;
            if (data_cache_invalidate_ack)
               data_cache_invalidate <= 1'b0;
            if (inst_cache_invalidate_ack)
               inst_cache_invalidate <= 1'b0;
         end
      end
   end

   // ===================================================================
   // The Debug readback logic
   // ===================================================================
   always @*
   begin
      dbg_do = 16'h0;
      if (dbg_a[7:4] == 4'h1 && dbg_rd == 1'b1)
      begin
         case (dbg_a[3:0])
         4'h0: dbg_do = debug_addr[15:0];
         4'h1: dbg_do = {8'h0, debug_addr[23:16]};
         4'h2: dbg_do = lisa1_base_addr;
         4'h3: dbg_do = lisa2_base_addr;
         4'h4: dbg_do = {{(16-CHIP_SELECTS){1'b0}}, lisa1_ce_ctrl};
         4'h5: dbg_do = {{(16-CHIP_SELECTS){1'b0}}, lisa2_ce_ctrl};
         4'h6: dbg_do = {{(16-CHIP_SELECTS){1'b0}}, debug_ce_ctrl};
         4'h7: dbg_do = {{(16-CHIP_SELECTS*3){1'b0}}, addr_16b, is_flash, quad_mode};
         4'h8: dbg_do = {{(16-CHIP_SELECTS*4){1'b0}}, dummy_read_cycles};
         4'h9: dbg_do = {8'h0, cmd_quad_write_r};
         4'ha: dbg_do = {12'h0, plus_guard_time};
         4'hb: dbg_do = output_mux_bits;
         4'hc: dbg_do = {8'h0, io_mux_bits};
         4'hd: dbg_do = {10'h0, inst_cache_invalidate, data_cache_invalidate,
                         data_cache_flush, cache_disabled, cache_map_sel};
         4'he: dbg_do = {3'h0, spi_mode, spi_ce_delay, spi_clk_div};
         default dbg_do = 16'h0;
         endcase
      end
      else if (dbg_a[7:4] == 4'h2 && dbg_rd == 1'b1)
      begin
         case (dbg_a[3:0])
         4'h0: dbg_do = debug_rdata;
         4'h1: dbg_do = debug_rdata;
         4'h2: dbg_do = debug_rdata;
         default dbg_do = 16'h0;
         endcase
      end
   end

endmodule

