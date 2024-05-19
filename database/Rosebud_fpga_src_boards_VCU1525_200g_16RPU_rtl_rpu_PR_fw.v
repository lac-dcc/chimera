// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2021 Moein Khazraee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

module rpu_PR (
  input  wire         clk,
  input  wire         rst,
  input  wire         core_reset,

  // DMA interface
  input  wire         dma_cmd_wr_en,
  input  wire [25:0]  dma_cmd_wr_addr,
  input  wire         dma_cmd_hdr_wr_en,
  input  wire [23:0]  dma_cmd_hdr_wr_addr,
  input  wire [127:0] dma_cmd_wr_data,
  input  wire [15:0]  dma_cmd_wr_strb,
  input  wire         dma_cmd_wr_last,
  output wire         dma_cmd_wr_ready,

  input  wire         dma_cmd_rd_en,
  input  wire [25:0]  dma_cmd_rd_addr,
  input  wire         dma_cmd_rd_last,
  output wire         dma_cmd_rd_ready,

  output wire         dma_rd_resp_valid,
  output wire [127:0] dma_rd_resp_data,
  input  wire         dma_rd_resp_ready,

  // Descriptor to/from core
  input  wire [63:0]  in_desc,
  input  wire         in_desc_valid,
  output wire         in_desc_taken,

  output wire [63:0]  out_desc,
  output wire         out_desc_2nd,
  output wire         out_desc_valid,
  input  wire         out_desc_ready,

  // Broadcast messages
  input  wire [46:0]  bc_msg_in,
  input  wire         bc_msg_in_valid,
  output wire [46:0]  bc_msg_out,
  output wire         bc_msg_out_valid,
  input  wire         bc_msg_out_ready,

  // Status channel to core
  input  wire [31:0]  intercon_status_data,
  input  wire [2:0]   intercon_status_addr,

  // Status channel from core
  output reg  [31:0]  rpu_status_data,
  output reg  [2:0]   rpu_status_addr
);

  // Parameters that should match rpu_PR_inst
  parameter DATA_WIDTH      = 128;
  parameter STRB_WIDTH      = (DATA_WIDTH/8);
  parameter IMEM_SIZE       = 65536/2;
  parameter PMEM_SIZE       = 1048576;
  parameter DMEM_SIZE       = 32768;
  parameter SLOW_M_B_LINES  = 4096;
  parameter FAST_M_B_LINES  = 1024;
  parameter ACC_ROM_EN      = 0;
  parameter BC_REGION_SIZE  = 8192;
  parameter BC_START_ADDR   = 32'h01000000+PMEM_SIZE-BC_REGION_SIZE;
  parameter MSG_WIDTH       = 32+4+$clog2(BC_REGION_SIZE)-2;
  parameter CORE_ID_WIDTH   = 4;
  parameter SLOT_COUNT      = 16;

  parameter ADD_PMEM_RD_REG = 0;

  ///////////////////////////////////////////////////////////////////////////////
  /////////////////// Register input and outputs ////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  (* KEEP = "TRUE" *) reg rst_r;
  (* KEEP = "TRUE" *) reg core_reset_r;

  always @ (posedge clk) begin
    rst_r        <= rst;
    core_reset_r <= core_reset;
  end

  // registers for crossing PR boundary
  // _r for input signals after register, and _n for output signals before register
  `include "rpu_PR_regs.v"

  ///////////////////////////////////////////////////////////////////////////////
  ////////////////////////////// RISCV BLOCK  ///////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  rpu # (
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .IMEM_SIZE(IMEM_SIZE),
      .PMEM_SIZE(PMEM_SIZE),
      .DMEM_SIZE(DMEM_SIZE),
      .ACC_ROM_EN(ACC_ROM_EN),
      .SLOW_M_B_LINES(SLOW_M_B_LINES),
      .FAST_M_B_LINES(FAST_M_B_LINES),
      .BC_REGION_SIZE(BC_REGION_SIZE),
      .BC_START_ADDR(BC_START_ADDR),
      .MSG_WIDTH(MSG_WIDTH),
      .CORE_ID_WIDTH(CORE_ID_WIDTH),
      .SLOT_COUNT(SLOT_COUNT),
      .ADD_PMEM_RD_REG(ADD_PMEM_RD_REG)
  ) rpu_inst (
      .clk(clk),
      .rst(rst_r),
      .core_reset(core_reset_r),

      .dma_cmd_wr_en(dma_cmd_wr_en_r),
      .dma_cmd_wr_addr(dma_cmd_wr_addr_r),
      .dma_cmd_hdr_wr_en(dma_cmd_hdr_wr_en_r),
      .dma_cmd_hdr_wr_addr(dma_cmd_hdr_wr_addr_r),
      .dma_cmd_wr_data(dma_cmd_wr_data_r),
      .dma_cmd_wr_strb(dma_cmd_wr_strb_r),
      .dma_cmd_wr_last(dma_cmd_wr_last_r),
      .dma_cmd_wr_ready(dma_cmd_wr_ready_r),
      .dma_cmd_rd_en(dma_cmd_rd_en_r),
      .dma_cmd_rd_addr(dma_cmd_rd_addr_r),
      .dma_cmd_rd_last(dma_cmd_rd_last_r),
      .dma_cmd_rd_ready(dma_cmd_rd_ready_r),
      .dma_rd_resp_valid(dma_rd_resp_valid_n),
      .dma_rd_resp_data(dma_rd_resp_data_n),
      .dma_rd_resp_ready(dma_rd_resp_ready_n),

      .in_desc(in_desc_r),
      .in_desc_valid(in_desc_valid_r),
      .in_desc_taken(in_desc_taken_r),
      .out_desc(out_desc_n),
      .out_desc_2nd(out_desc_2nd_n),
      .out_desc_valid(out_desc_valid_n),
      .out_desc_ready(out_desc_ready_n),

      .bc_msg_out(bc_msg_out_n),
      .bc_msg_out_valid(bc_msg_out_valid_n),
      .bc_msg_out_ready(bc_msg_out_ready_n),
      .bc_msg_in(bc_msg_in_r),
      .bc_msg_in_valid(bc_msg_in_valid_r),

      .intercon_status_data(intercon_status_data_r),
      .intercon_status_addr(intercon_status_addr_r),
      .rpu_status_data(rpu_status_data_n),
      .rpu_status_addr(rpu_status_addr_n)
  );

endmodule

`resetall
