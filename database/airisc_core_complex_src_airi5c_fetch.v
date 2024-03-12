//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//

// In the event of publication, the following notice is applicable:
//
// (C) COPYRIGHT 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS
// AND SYSTEMS, DUISBURG, GERMANY.
// ALL RIGHTS RESERVED.
//
// The entire notice above must be reproduced on all authorized copies.
//
// File             : airi5c_fetch.v
// Author           : M. Richter, I. Hoyer, A. Stanitzki, S. Nolting
// Creation Date    : 09.10.2020 [richter]
// Version          : 2.0
// Abstract         : Airisc Instruction Fetcher
// History          : 07.07.20 - [richter] rebranding to AIRI5C
//                    03.08.22 - Notice inserted, Fixing SlowRedirect functionality
//                    15.12.22 - [nolting] complete rework; general concept/code adapted from github.com/stnolting/neorv32/blob/main/rtl/core/neorv32_cpu_control.vhd
//                    22.12.22 - [nolting] add option for SAFETY version of instruction prefetch buffer; minor cleanups
//

`include "rv32_opcodes.vh"
`include "airi5c_arch_options.vh"
`include "airi5c_hasti_constants.vh"
`ifdef WITH_SAFETY_FEATURES
  `include "airisc_safety_options.vh"
`endif

module airi5c_fetch (
// general I/O  
  input                                rst_ni,
  input                                clk_i,
// core-side I/O  
  input       [`XPR_LEN-1:0]           pc_pif_i,
  input                                kill_if_i,
  input                                de_ready_i,
  output wire [`XPR_LEN-1:0]           pc_if_o,
  output wire [`XPR_LEN-1:0]           inst_if_o,
  output wire                          if_valid_o,
  output wire                          compressed_o,
  output wire                          predicted_branch_if_o,
  output wire [2:0]                    error_in_if_o,
// memory-side I/O  
  input                                imem_hready_i, 
  output wire [`XPR_LEN-1:0]           imem_haddr_o,
  input       [`XPR_LEN-1:0]           imem_hrdata_i,
  input                                imem_badmem_i,
  output wire [`HASTI_TRANS_WIDTH-1:0] imem_htrans_o,
  output wire [`HASTI_BURST_WIDTH-1:0] imem_hburst_o,
  output wire                          imem_hmastlock_o,
  output wire [`HASTI_PROT_WIDTH-1:0]  imem_hprot_o
`ifdef WITH_SAFETY_PREFETCH
  , input [7:0]                        parity_i
`endif
);

// instruction fetcher
reg [`XPR_LEN-1:0] imem_haddr_r;
reg [`XPR_LEN-1:0] last_addr_r;
reg                if_unaligned_r;
reg [1:0]          state_r, state_prev_r;

localparam StRestart = 2'h0,
           StFetch   = 2'h1,
           StWait    = 2'h2;

// Instruction prefetch buffer
wire                    ipb_clear;
wire [1:0]              ipb_we;
wire [1:0]              ipb_re;
wire [1:0]              ipb_hfull;
wire [1:0]              ipb_free;
wire                    ipb_free_global;
wire                    ipb_hfull_global;
wire [1:0]              ipb_avail;
wire [(`XPR_LEN/2)-1:0] ipb_cmd_lo;
wire [(`XPR_LEN/2)-1:0] ipb_cmd_hi;
wire [2:0]              ipb_err_lo;
wire [2:0]              ipb_err_hi;

// instruction issue
reg                issue_unaligned_r;
reg                issue_unaligned_set;
reg                issue_unaligned_clr;
reg [`XPR_LEN-1:0] issue_cmd;
reg [`XPR_LEN-1:0] issue_pc_r;
reg [1:0]          issue_valid;
reg [2:0]          issue_err;

// decompression
wire [15:0]         c_input;
wire                c_valid;
wire [`XPR_LEN-1:0] c_decoded_cmd;
wire                c_jal, c_j;
wire                c_beqz, c_bnez;
wire [20:0]         c_jal_imm, c_j_imm;
wire [12:0]         c_beqz_imm, c_bnez_imm;


// --------------------------------------------------------------------------------------------
// Instruction fetcher
// -> always fetching full 32-bit words from 32-bit-aligned addresses
// --------------------------------------------------------------------------------------------

always @(posedge clk_i or negedge rst_ni) begin
  if (~rst_ni) begin
    state_r        <= StRestart;
    state_prev_r   <= StRestart;
    if_unaligned_r <= 1'b0;
    imem_haddr_r   <= 32'h80000000;
    last_addr_r    <= 32'h80000000;
  end else begin
    state_prev_r <= state_r;

    case (state_r)

      // start new fetch
      StRestart: begin
        last_addr_r <= imem_haddr_r;
        if (kill_if_i) begin // restart fetcher
          imem_haddr_r   <= {pc_pif_i[`XPR_LEN-1:2], 2'b00}; // always align to 32-bit-boundary
          if_unaligned_r <= pc_pif_i[1]; // set if starting unaligned
          state_r        <= StRestart;
        end else if (imem_hready_i) begin
          imem_haddr_r   <= imem_haddr_r + 32'h4;
          state_r        <= StFetch;       
        end
      end

      // continuous fetch in progress
      StFetch: begin
        if (kill_if_i) begin // restart fetcher
          imem_haddr_r   <= {pc_pif_i[`XPR_LEN-1:2], 2'b00}; // always align to 32-bit-boundary
          if_unaligned_r <= pc_pif_i[1]; // set if starting unaligned
          state_r        <= StRestart;
        end else begin
          if_unaligned_r <= 1'b0; // set if we are aligned again
          last_addr_r    <= imem_haddr_r;
          if (ipb_hfull_global) begin // no free IPB entry -> wait
            state_r      <= StWait;
          end else if (imem_hready_i) begin 
            // memory completes access and we have space left in the IPB
            // -> store the new fetched instruction to IPB
            // -> increment address for next access
            imem_haddr_r <= imem_haddr_r + 32'h4;
            state_r      <= StFetch;
          end
        end
      end

      // wait for free space in IPB
      StWait: begin
        if (kill_if_i) begin // restart fetcher
          imem_haddr_r   <= {pc_pif_i[`XPR_LEN-1:2], 2'b00}; // always align to 32-bit-boundary
          if_unaligned_r <= pc_pif_i[1]; // set if starting unaligned
          state_r        <= StRestart;
        end else if (~ipb_hfull_global) begin
          imem_haddr_r   <= last_addr_r; // resume from last-accessed address
          state_r        <= StFetch;
        end
      end

    endcase
  end
end

// bus request
assign imem_htrans_o    = `HASTI_TRANS_NONSEQ;
assign imem_haddr_o     = imem_haddr_r;
assign imem_hburst_o    = `HASTI_BURST_SINGLE;
assign imem_hmastlock_o = `HASTI_MASTER_NO_LOCK;
assign imem_hprot_o     = `HASTI_NO_PROT;

// write to IPB
assign ipb_we[0] = ((state_r == StFetch) && (state_prev_r != StWait) && (~if_unaligned_r) && (imem_hready_i) && (ipb_free_global)) ? 1'b1 : 1'b0; // instruction half-word LOW
assign ipb_we[1] = ((state_r == StFetch) && (state_prev_r != StWait) &&                      (imem_hready_i) && (ipb_free_global)) ? 1'b1 : 1'b0; // instruction half-word HIGH


// --------------------------------------------------------------------------------------------
// Instruction prefetch buffer
// Built from two individual FIFOs to handle instruction stream:
// -> instruction low half-word + error/status bits
// -> instruction high half-word + error/status bits
// This is required for handling unaligned 32-bit instructions (C ISA extension only) and for
// relaxing instruction fetch memory traffic / access times.
// --------------------------------------------------------------------------------------------

`ifdef WITH_SAFETY_FEATURES // -------- SAFETY prefetch buffer -------- /

  wire ecc_enable = ((last_addr_r & `ECC_REGION_ENABLE_MASK) == (`ECC_REGION_COMPARE_MASK & `ECC_REGION_ENABLE_MASK)) ? 1'b1 : 1'b0;

  // "dual slot" FIFO with ECC
  airi5c_safety_prebuf_fifo #(
    .FIFO_DEPTH(`IPB_DEPTH)
  ) ipb_lo (
    .clk_i(clk_i),
    .rstn_i(rst_ni),
    .clear_i(ipb_clear),
    .ecc_en_i(ecc_enable),
    .hfull_o(ipb_hfull[1:0]),
    .we_i(ipb_we[1:0]),
    .parity_i(parity_i),
    .data_i(imem_hrdata_i),
    .addr_i(last_addr_r),
    .free_o(ipb_free[1:0]),
    .re_i(ipb_re[1:0]),
    .data_lo_o(ipb_cmd_lo),
    .data_hi_o(ipb_cmd_hi),
    .err_lo_o(ipb_err_lo),
    .err_hi_o(ipb_err_hi),
    .avail_o(ipb_avail[1:0])
  );

`else // -------- normal prefetch buffer -------- //

  // low half-word of instruction word (+ memory error)
  airi5c_prebuf_fifo #(
    .FIFO_DEPTH(`IPB_DEPTH),
    .FIFO_WIDTH(3 + (`XPR_LEN/2))
  ) ipb_lo (
    .clk_i(clk_i),
    .rstn_i(rst_ni),
    .clear_i(ipb_clear),
    .hfull_o(ipb_hfull[0]),
    .we_i(ipb_we[0]),
    .data_i({2'b00, imem_badmem_i, imem_hrdata_i[(`XPR_LEN/2)-1:0]}),
    .free_o(ipb_free[0]),
    .re_i(ipb_re[0]),
    .data_o({ipb_err_lo, ipb_cmd_lo}),
    .avail_o(ipb_avail[0])
  );

  // high half-word of instruction word (+ memory error)
  airi5c_prebuf_fifo #(
    .FIFO_DEPTH(`IPB_DEPTH),
    .FIFO_WIDTH(3 + (`XPR_LEN/2))
  ) ipb_hi (
    .clk_i(clk_i),
    .rstn_i(rst_ni),
    .clear_i(ipb_clear),
    .hfull_o(ipb_hfull[1]),
    .we_i(ipb_we[1]),
    .data_i({2'b00, imem_badmem_i, imem_hrdata_i[`XPR_LEN-1:`XPR_LEN/2]}),
    .free_o(ipb_free[1]),
    .re_i(ipb_re[1]),
    .data_o({ipb_err_hi, ipb_cmd_hi}),
    .avail_o(ipb_avail[1])
  );

`endif

// free entry in _all_ IPB FIFOs?
assign ipb_free_global  = &ipb_free;
assign ipb_hfull_global = |ipb_hfull;

// invalidate all IPB FIFOs when flushing IF stage
assign ipb_clear = kill_if_i;


// --------------------------------------------------------------------------------------------
// Instruction issue
// --------------------------------------------------------------------------------------------

always @(posedge clk_i or negedge rst_ni) begin
  if (~rst_ni) begin
    issue_pc_r        <= 32'h80000000; // "shadow" PC for instruction issueing
    issue_unaligned_r <= 1'b0; // start aligned
  end else begin
    if (kill_if_i) begin // flush IF
      issue_pc_r        <= {pc_pif_i[`XPR_LEN-1:1], 1'b0};
      issue_unaligned_r <= pc_pif_i[1]; // set if new address is unaligned
    end else if (de_ready_i) begin // update only if DE is ready for new instruction
      issue_unaligned_r <= (issue_unaligned_r & (~issue_unaligned_clr)) | issue_unaligned_set; // "sync. RS flip-flop"
      if (|issue_valid) begin
        issue_pc_r <= (c_valid) ? (issue_pc_r + 2) : (issue_pc_r + 4);
      end
    end
  end
end


`ifdef ISA_EXT_C // -------- intermix of 32-bit and 16-bit instructions -------- //

  always @(*) begin
    issue_unaligned_set = 1'b0; // default
    issue_unaligned_clr = 1'b0; // default
    issue_valid         = 2'h0; // default
    issue_err           = 3'h0; // default

    if (~issue_unaligned_r) begin // start with LOW half-word
      if (ipb_cmd_lo[1:0] != 2'b11) begin // compressed
        issue_unaligned_set = ipb_avail[0]; // start of next instruction word is NOT 32-bit-aligned
        issue_valid[0]      = ipb_avail[0];
        issue_cmd           = c_decoded_cmd;
        issue_err           = ipb_err_lo;
      end else begin // aligned and uncompressed
        issue_valid[0]      = ipb_avail[0] & ipb_avail[1];
        issue_valid[1]      = ipb_avail[0] & ipb_avail[1];
        issue_cmd           = {ipb_cmd_hi, ipb_cmd_lo};
        issue_err           = ipb_err_hi | ipb_err_lo;
      end
    end else begin // start with HIGH half-word
      if (ipb_cmd_hi[1:0] != 2'b11) begin // compressed
        issue_unaligned_clr = ipb_avail[1]; // start of next instruction word IS 32-bit-aligned again
        issue_valid[1]      = ipb_avail[1];
        issue_cmd           = c_decoded_cmd;
        issue_err           = ipb_err_hi;
      end else begin // unaligned and uncompressed
        issue_valid[0]      = ipb_avail[0] & ipb_avail[1];
        issue_valid[1]      = ipb_avail[0] & ipb_avail[1];
        issue_cmd           = {ipb_cmd_lo, ipb_cmd_hi};
        issue_err           = ipb_err_lo | ipb_err_hi;
      end
    end
  end

  // interface to IPB
  assign ipb_re[0] = de_ready_i & issue_valid[0]; // low half-word FIFO
  assign ipb_re[1] = de_ready_i & issue_valid[1]; // high half-word FIFO

  // is compressed isntruction?
  assign compressed_o = c_valid;


`else // -------- 32-bit instructions only -------- //

  always @(*) begin
    issue_unaligned_set = 1'b0; // unused
    issue_unaligned_clr = 1'b0; // unused
    issue_err           = ipb_err_lo;

    if (&ipb_avail) begin // new instruction word available
      issue_cmd   = {ipb_cmd_hi, ipb_cmd_lo};
      issue_valid = 2'b11;
    end else begin
      issue_cmd   = `RV_NOP;
      issue_valid = 2'b00;
    end
  end

  // interface to IPB
  assign ipb_re = ((de_ready_i) && (&ipb_avail)) ? 2'b11 : 2'b00;

  // unused
  assign compressed_o = 1'b0;

`endif


// interface to DE pipeline stage
assign inst_if_o     = issue_cmd;
assign pc_if_o       = issue_pc_r;
assign if_valid_o    = |issue_valid;
assign error_in_if_o = (|issue_valid) ? issue_err : 3'b000;


// --------------------------------------------------------------------------------------------
// Decompression
// --------------------------------------------------------------------------------------------

`ifdef ISA_EXT_C

  airi5c_decompression decompression_logic (
    .instruction_i(c_input),
    .instruction_o(c_decoded_cmd),
    .c_inst_detected_o(c_valid),
    .c_jal_o(c_jal),
    .c_j_o(c_j),
    .c_beqz_o(c_beqz),
    .c_bnez_o(c_bnez),
    .jal_imm_o(c_jal_imm),
    .j_imm_o(c_j_imm),
    .beqz_imm_o(c_beqz_imm),
    .bnez_imm_o(c_bnez_imm)
  );

  // half-word select
  assign c_input = (issue_unaligned_r) ? ipb_cmd_hi : ipb_cmd_lo;

`else

  assign c_input       = 16'h0;
  assign c_valid       = 1'b0;
  assign c_decoded_cmd = 32'h0;
  assign c_jal         = 1'b0;
  assign c_j           = 1'b0;
  assign c_beqz        = 1'b0;
  assign c_bnez        = 1'b0;
  assign c_jal_imm     = 21'h0;
  assign c_j_imm       = 21'h0;
  assign c_beqz_imm    = 13'h0;
  assign c_bnez_imm    = 13'h0;

`endif


// --------------------------------------------------------------------------------------------
// Branch Prediction
// --------------------------------------------------------------------------------------------

assign predicted_branch_if_o = 1'b0; // coming soon!







endmodule
