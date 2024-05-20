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

module lb_PR (
  input  wire             clk,
  input  wire             rst,

  // Data line to/from Eth interfaces
  input  wire [3*512-1:0] rx_axis_tdata,
  input  wire [3*64-1:0]  rx_axis_tkeep,
  input  wire [3-1:0]     rx_axis_tvalid,
  output wire [3-1:0]     rx_axis_tready,
  input  wire [3-1:0]     rx_axis_tlast,
  input  wire [3*13-1:0]  rx_axis_line_count,

  output wire [3*512-1:0] tx_axis_tdata,
  output wire [3*64-1:0]  tx_axis_tkeep,
  output wire [3-1:0]     tx_axis_tvalid,
  input  wire [3-1:0]     tx_axis_tready,
  output wire [3-1:0]     tx_axis_tlast,

  // DATA lines to/from cores
  output wire [3*512-1:0] data_m_axis_tdata,
  output wire [3*64-1:0]  data_m_axis_tkeep,
  output wire [3*9-1:0]   data_m_axis_tdest,
  output wire [3*3-1:0]   data_m_axis_tuser,
  output wire [3-1:0]     data_m_axis_tvalid,
  input  wire [3-1:0]     data_m_axis_tready,
  output wire [3-1:0]     data_m_axis_tlast,

  input  wire [3*512-1:0] data_s_axis_tdata,
  input  wire [3*64-1:0]  data_s_axis_tkeep,
  input  wire [3*9-1:0]   data_s_axis_tuser,
  input  wire [3-1:0]     data_s_axis_tvalid,
  output wire [3-1:0]     data_s_axis_tready,
  input  wire [3-1:0]     data_s_axis_tlast,

  // Control lines to/from cores
  output wire [36-1:0]    ctrl_m_axis_tdata,
  output wire             ctrl_m_axis_tvalid,
  input  wire             ctrl_m_axis_tready,
  output wire [4-1:0]     ctrl_m_axis_tdest,

  input  wire [36-1:0]    ctrl_s_axis_tdata,
  input  wire             ctrl_s_axis_tvalid,
  output wire             ctrl_s_axis_tready,
  input  wire [4-1:0]     ctrl_s_axis_tuser,

  // Cores commands, bits 31 to 29 already used
  input  wire [28:0]      host_cmd,
  input  wire             host_cmd_for_ints,
  input  wire [31:0]      host_cmd_wr_data,
  output wire [31:0]      host_cmd_rd_data,
  input  wire             host_cmd_wr_en
);

  parameter IF_COUNT        = 3;
  parameter PORT_COUNT      = 5;
  parameter CORE_COUNT      = 16;
  parameter SLOT_COUNT      = 16;
  parameter DATA_WIDTH      = 512;
  parameter CTRL_WIDTH      = 32+4;
  parameter LOOPBACK_PORT   = 3;
  parameter LOOPBACK_COUNT  = 1;
  parameter CLUSTER_COUNT   = 4;
  parameter RX_LINES_WIDTH  = 13;

  parameter DATA_S_RLEN     = 1;
  parameter DATA_M_RLEN     = 2;
  parameter RX_RLEN         = 2;
  parameter TX_RLEN         = 1;

  parameter SLOT_WIDTH      = $clog2(SLOT_COUNT+1);
  parameter CORE_ID_WIDTH   = $clog2(CORE_COUNT);
  parameter INTERFACE_WIDTH = $clog2(IF_COUNT);
  parameter PORT_WIDTH      = $clog2(PORT_COUNT);
  parameter TAG_WIDTH       = (SLOT_WIDTH>5) ? SLOT_WIDTH : 5;
  parameter ID_TAG_WIDTH    = CORE_ID_WIDTH+TAG_WIDTH;
  parameter STRB_WIDTH      = DATA_WIDTH/8;

  ///////////////////////////////////////////////////////////////////////////////
  //////////////////////// Register input and outputs ///////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  wire rst_r;
  sync_reset sync_rst_inst (
    .clk(clk),
    .rst(rst),
    .out(rst_r)
  );

  // registers for crossing PR boundary
  // _r for input signals after register, and _n for output signals before register
  `include "lb_PR_regs.v"

  // No action on TX side, just forwarding. Not using tuser from data_s either.
  assign tx_axis_tdata_n      = data_s_axis_tdata_r;
  assign tx_axis_tkeep_n      = data_s_axis_tkeep_r;
  assign tx_axis_tvalid_n     = data_s_axis_tvalid_r;
  assign tx_axis_tlast_n      = data_s_axis_tlast_r;
  assign data_s_axis_tready_r = tx_axis_tready_n;

  ///////////////////////////////////////////////////////////////////////////////
  ////////////////////////// Control channel handler ////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  wire [CORE_COUNT-1:0]            enabled_cores;
  wire [CORE_COUNT-1:0]            slots_flush;

  wire [CORE_COUNT*SLOT_WIDTH-1:0] slot_counts;
  wire [CORE_COUNT-1:0]            slot_valids;
  wire [CORE_COUNT-1:0]            slot_busys;
  wire [CORE_COUNT-1:0]            slot_ins_errs;

  wire [CORE_ID_WIDTH-1:0]         selected_core;
  wire                             desc_pop;
  wire [ID_TAG_WIDTH-1:0]          desc_data;

  lb_controller  # (
    .CORE_COUNT(CORE_COUNT),
    .SLOT_COUNT(SLOT_COUNT),
    .CTRL_WIDTH(CTRL_WIDTH),
    .LOOPBACK_PORT(LOOPBACK_PORT),
    .LOOPBACK_COUNT(LOOPBACK_COUNT),
    .CORE_ID_WIDTH(CORE_ID_WIDTH),
    .SLOT_WIDTH(SLOT_WIDTH),
    .TAG_WIDTH(TAG_WIDTH),
    .ID_TAG_WIDTH(ID_TAG_WIDTH)
  ) lb_controller_inst (
    .clk(clk),
    .rst(rst_r),
    // Control lines to/from cores
    .ctrl_m_axis_tdata (ctrl_m_axis_tdata_n),
    .ctrl_m_axis_tvalid(ctrl_m_axis_tvalid_n),
    .ctrl_m_axis_tready(ctrl_m_axis_tready_n),
    .ctrl_m_axis_tdest (ctrl_m_axis_tdest_n),

    .ctrl_s_axis_tdata (ctrl_s_axis_tdata_r),
    .ctrl_s_axis_tvalid(ctrl_s_axis_tvalid_r),
    .ctrl_s_axis_tready(ctrl_s_axis_tready_r),
    .ctrl_s_axis_tuser (ctrl_s_axis_tuser_r),

    // Config registers
    .enabled_cores (enabled_cores),
    .slots_flush   (slots_flush),

    // Slots status readbacks
    .slot_counts   (slot_counts),
    .slot_valids   (slot_valids),
    .slot_busys    (slot_busys),
    .slot_ins_errs (slot_ins_errs),

    // Core select, and its pop signal assert and descriptor readback
    .selected_core (selected_core),
    .desc_pop      (desc_pop),
    .desc_data     (desc_data)
  );

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////// RR load balancer ////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  lb_rr_lu # (
    .IF_COUNT(IF_COUNT),
    .PORT_COUNT(PORT_COUNT),
    .CORE_COUNT(CORE_COUNT),
    .SLOT_COUNT(SLOT_COUNT),
    .DATA_WIDTH(DATA_WIDTH),
    .RX_LINES_WIDTH(RX_LINES_WIDTH),
    .CLUSTER_COUNT(CLUSTER_COUNT),
    .SLOT_WIDTH(SLOT_WIDTH),
    .CORE_ID_WIDTH(CORE_ID_WIDTH),
    .INTERFACE_WIDTH(INTERFACE_WIDTH),
    .PORT_WIDTH(PORT_WIDTH),
    .TAG_WIDTH(TAG_WIDTH),
    .ID_TAG_WIDTH(ID_TAG_WIDTH),
    .STRB_WIDTH(STRB_WIDTH)
  ) lb_policy_inst (
    .clk(clk),
    .rst(rst_r),

    // Data input and output streams
    .s_axis_tdata(rx_axis_tdata_r),
    .s_axis_tkeep(rx_axis_tkeep_r),
    .s_axis_tvalid(rx_axis_tvalid_r),
    .s_axis_tready(rx_axis_tready_r),
    .s_axis_tlast(rx_axis_tlast_r),
    .s_axis_line_count(rx_axis_line_count_r),

    .m_axis_tdata(data_m_axis_tdata_n),
    .m_axis_tkeep(data_m_axis_tkeep_n),
    .m_axis_tdest(data_m_axis_tdest_n),
    .m_axis_tuser(data_m_axis_tuser_n),
    .m_axis_tvalid(data_m_axis_tvalid_n),
    .m_axis_tready(data_m_axis_tready_n),
    .m_axis_tlast(data_m_axis_tlast_n),

    // Host command interface
    .host_cmd(host_cmd_r),
    .host_cmd_wr_data(host_cmd_wr_data_r),
    .host_cmd_rd_data(host_cmd_rd_data_n),
    .host_cmd_wr_en(host_cmd_wr_en_r),
    .host_cmd_for_ints(host_cmd_for_ints_r),

    // Config registers outputs and slots status inputs
    .enabled_cores(enabled_cores),
    .slots_flush(slots_flush),
    .slot_counts(slot_counts),
    .slot_valids(slot_valids),
    .slot_busys(slot_busys),
    .slot_ins_errs(slot_ins_errs),

    // Request and response to lb_controller
    .selected_core(selected_core),
    .desc_pop(desc_pop),
    .desc_data(desc_data)
  );

endmodule

`resetall
