// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_axi_s.v
//
// Abstract:
//   this module convert axi slave access to internal protocol
//
//  Created:
//    8 October 2013
//
// Copyright (c) 2013  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//
// Copyright (c) 2020, Kenji Ishimaru
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  -Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//  -Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

module fm_axi_s (
  // system
  clk_core,
  rst_x,
  // AXI write port
  i_awid_s,
  i_awaddr_s,
  i_awlen_s,
  i_awsize_s,
  i_awburst_s,
  i_awlock_s,
  i_awcache_s,
  i_awprot_s,
  i_awvalid_s,
  o_awready_s,
  i_wid_s,
  i_wdata_s,
  i_wstrb_s,
  i_wlast_s,
  i_wvalid_s,
  o_wready_s,
  o_bid_s,
  o_bresp_s,
  o_bvalid_s,
  i_bready_s,
  // AXI read port
  i_arid_s,
  i_araddr_s,
  i_arlen_s,
  i_arsize_s,
  i_arburst_s,
  i_arlock_s,
  i_arcache_s,
  i_arprot_s,
  i_arvalid_s,
  o_arready_s,
  o_rid_s,
  o_rdata_s,
  o_rresp_s,
  o_rlast_s,
  o_rvalid_s,
  i_rready_s,
  // internal bus
  o_req,
  o_wr,
  o_adrs,
  i_ack,
  o_be,
  o_wd,
  i_rstr,
  i_rd
);
`include "polyphony_axi_def.v"
//////////////////////////////////
// I/O port definition
//////////////////////////////////
  // system
  input clk_core;
  input rst_x;
  // AXI Slave
  //   write port
  input [P_AXI_S_AWID-1:0] i_awid_s;
  input [P_AXI_S_AWADDR-1:0] i_awaddr_s;
  input [P_AXI_S_AWLEN-1:0] i_awlen_s;
  input [P_AXI_S_AWSIZE-1:0] i_awsize_s;
  input [P_AXI_S_AWBURST-1:0] i_awburst_s;
  input [P_AXI_S_AWLOCK-1:0] i_awlock_s;
  input [P_AXI_S_AWCACHE-1:0] i_awcache_s;
  input [P_AXI_S_AWPROT-1:0] i_awprot_s;
  input i_awvalid_s;
  output o_awready_s;
  input [P_AXI_S_WID-1:0] i_wid_s;
  input [P_AXI_S_WDATA-1:0] i_wdata_s;
  input [P_AXI_S_WSTRB-1:0] i_wstrb_s;
  input i_wlast_s;
  input i_wvalid_s;
  output o_wready_s;
  output [P_AXI_S_BID-1:0] o_bid_s;
  output [P_AXI_S_BRESP-1:0] o_bresp_s;
  output o_bvalid_s;
  input i_bready_s;
  //   read port
  input [P_AXI_S_ARID-1:0] i_arid_s;
  input [P_AXI_S_ARADDR-1:0] i_araddr_s;
  input [P_AXI_S_ARLEN-1:0] i_arlen_s;
  input [P_AXI_S_ARSIZE-1:0] i_arsize_s;
  input [P_AXI_S_ARBURST-1:0] i_arburst_s;
  input [P_AXI_S_ARLOCK-1:0] i_arlock_s;
  input [P_AXI_S_ARCACHE-1:0] i_arcache_s;
  input [P_AXI_S_ARPROT-1:0] i_arprot_s;
  input i_arvalid_s;
  output o_arready_s;
  // read response
  output [P_AXI_S_RID-1:0] o_rid_s;
  output [P_AXI_S_RDATA-1:0] o_rdata_s;
  output [P_AXI_S_RRESP-1:0] o_rresp_s;
  output o_rlast_s;
  output o_rvalid_s;
  input i_rready_s;
  // internal side
  output          o_req;
  output          o_wr;
  output [23:0]   o_adrs;
  input           i_ack;
  output [3:0]    o_be;
  output [31:0]   o_wd;
  input           i_rstr;
  input  [31:0]   i_rd;
//////////////////////////////////
// parameter definition
//////////////////////////////////
  localparam P_IDLE = 'd0;
  localparam P_WRITE_CMD = 'd1;
  localparam P_READ_CMD = 'd2;
  localparam P_READ_DT  = 'd3;

  localparam P_WC_FIFO_W = P_AXI_S_AWID +
                           P_AXI_S_AWADDR +
                           P_AXI_S_AWLEN +
                           P_AXI_S_AWSIZE +
                           P_AXI_S_AWBURST +
                           P_AXI_S_AWLOCK +
                           P_AXI_S_AWCACHE +
                           P_AXI_S_AWPROT;

  localparam P_WD_FIFO_W = P_AXI_S_WID +
                           P_AXI_S_WDATA +
                           P_AXI_S_WSTRB + 1;

  localparam P_WR_FIFO_W = P_AXI_S_BID +
                           P_AXI_S_BRESP;

  localparam P_RC_FIFO_W = P_AXI_S_ARID +
                           P_AXI_S_ARADDR +
                           P_AXI_S_ARLEN +
                           P_AXI_S_ARSIZE +
                           P_AXI_S_ARBURST +
                           P_AXI_S_ARLOCK +
                           P_AXI_S_ARCACHE +
                           P_AXI_S_ARPROT;

  localparam P_RR_FIFO_W =  P_AXI_S_RID +
                            P_AXI_S_RDATA +
                            P_AXI_S_RRESP + 1;

//////////////////////////////////
// reg
//////////////////////////////////
  reg [1:0] r_state;
  reg [P_AXI_S_ARID-1:0] r_arid_s;
//////////////////////////////////
// wire
//////////////////////////////////
  wire w_w_access;
  wire w_r_access;

  // write command
  wire [P_AXI_S_AWID-1:0] w_awid_s;
  wire [P_AXI_S_AWADDR-1:0] w_awaddr_s;
  wire [P_AXI_S_AWLEN-1:0] w_awlen_s;
  wire [P_AXI_S_AWSIZE-1:0] w_awsize_s;
  wire [P_AXI_S_AWBURST-1:0] w_awburst_s;
  wire [P_AXI_S_AWLOCK-1:0] w_awlock_s;
  wire [P_AXI_S_AWCACHE-1:0] w_awcache_s;
  wire [P_AXI_S_AWPROT-1:0] w_awprot_s;
  wire [P_WC_FIFO_W-1:0] w_wc_fifo_in;
  wire [P_WC_FIFO_W-1:0] w_wc_fifo_out;
  wire w_wc_full;
  wire w_wc_empty;
  wire w_wc_ren;
  // write data
  wire [P_AXI_S_WID-1:0] w_wid_s;
  wire [P_AXI_S_WDATA-1:0] w_wdata_s;
  wire [P_AXI_S_WSTRB-1:0] w_wstrb_s;
  wire w_wlast_s;
  wire [P_WD_FIFO_W-1:0] w_wd_fifo_in;
  wire [P_WD_FIFO_W-1:0] w_wd_fifo_out;
  wire w_wd_full;
  wire w_wd_empty;
  wire w_wd_ren;
  // write response
  wire [P_AXI_S_BID-1:0] w_bid_s;
  wire [P_AXI_S_BRESP-1:0] w_bresp_s;
  wire [P_WR_FIFO_W-1:0] w_wr_fifo_in;
  wire [P_WR_FIFO_W-1:0] w_wr_fifo_out;
  wire w_wr_full;
  wire w_wr_empty;
  wire w_wr_ren;
  // read command
  wire [P_AXI_S_ARID-1:0] w_arid_s;
  wire [P_AXI_S_ARADDR-1:0] w_araddr_s;
  wire [P_AXI_S_ARLEN-1:0] w_arlen_s;
  wire [P_AXI_S_ARSIZE-1:0] w_arsize_s;
  wire [P_AXI_S_ARBURST-1:0] w_arburst_s;
  wire [P_AXI_S_ARLOCK-1:0] w_arlock_s;
  wire [P_AXI_S_ARCACHE-1:0] w_arcache_s;
  wire [P_AXI_S_ARPROT-1:0] w_arprot_s;
  wire [P_RC_FIFO_W-1:0] w_rc_fifo_in;
  wire [P_RC_FIFO_W-1:0] w_rc_fifo_out;
  wire w_rc_full;
  wire w_rc_empty;
  wire w_rc_ren;
  // read response
  wire [P_AXI_S_RID-1:0] w_rid_s;
  wire [P_AXI_S_RDATA-1:0] w_rdata_s;
  wire [P_AXI_S_RRESP-1:0] w_rresp_s;
  wire w_rlast_s;
  wire [P_RR_FIFO_W-1:0] w_rr_fifo_in;
  wire [P_RR_FIFO_W-1:0] w_rr_fifo_out;
  wire w_rr_full;
  wire w_rr_empty;
  wire w_rr_ren;
//////////////////////////////////
// assign
//////////////////////////////////
  assign o_awready_s = ~w_wc_full;
  assign w_wc_fifo_in = {
    i_awid_s,
    i_awaddr_s,
    i_awlen_s,
    i_awsize_s,
    i_awburst_s,
    i_awlock_s,
    i_awcache_s,
    i_awprot_s
  };

  assign {
    w_awid_s,
    w_awaddr_s,
    w_awlen_s,
    w_awsize_s,
    w_awburst_s,
    w_awlock_s,
    w_awcache_s,
    w_awprot_s
  } = w_wc_fifo_out;

  assign o_wready_s = ~w_wd_full;
  assign w_wd_fifo_in = {
    i_wid_s,
    i_wdata_s,
    i_wstrb_s,
    i_wlast_s};

  assign {
    w_wid_s,
    w_wdata_s,
    w_wstrb_s,
    w_wlast_s} = w_wd_fifo_out;

  assign w_bid_s = w_awid_s;
  assign w_bresp_s = {P_AXI_S_BRESP{1'b0}};
  assign w_wr_fifo_in = {
    w_bid_s,
    w_bresp_s};

  assign {
    o_bid_s,
    o_bresp_s} = w_wr_fifo_out;

  assign o_bvalid_s = !w_wr_empty;
  assign w_rc_fifo_in = {
    i_arid_s,
    i_araddr_s,
    i_arlen_s,
    i_arsize_s,
    i_arburst_s,
    i_arlock_s,
    i_arcache_s,
    i_arprot_s};

  assign o_arready_s = ~w_rc_full;
  assign {
    w_arid_s,
    w_araddr_s,
    w_arlen_s,
    w_arsize_s,
    w_arburst_s,
    w_arlock_s,
    w_arcache_s,
    w_arprot_s} = w_rc_fifo_out;

  assign {
    o_rid_s,
    o_rdata_s,
    o_rresp_s,
    o_rlast_s} = w_rr_fifo_out;

  assign w_rresp_s = {P_AXI_S_RRESP{1'b0}};
  assign w_rlast_s = 1'b1;
  assign w_rr_fifo_in = {
    r_arid_s,
    i_rd,
    w_rresp_s,
    w_rlast_s};

  assign o_rvalid_s = !w_rr_empty;
  assign w_w_access = !w_wc_empty & !w_wd_empty;
  assign w_r_access = !w_rc_empty;
  assign w_wc_ren = (r_state == P_WRITE_CMD) & i_ack;
  assign w_wd_ren = (r_state == P_WRITE_CMD) & i_ack;
  assign w_rc_ren = (r_state == P_READ_CMD) & i_ack;
  assign o_req = (r_state == P_WRITE_CMD) | (r_state == P_READ_CMD);
  assign o_wr = (r_state == P_WRITE_CMD);
  assign o_adrs = (r_state == P_WRITE_CMD) ? w_awaddr_s[23:0] : w_araddr_s[23:0];
  assign o_be = w_wstrb_s;
  assign o_wd = w_wdata_s;
//////////////////////////////////
// always
//////////////////////////////////
  always @(posedge clk_core) begin
    if ((r_state == P_IDLE) & w_r_access) r_arid_s <= w_arid_s;
  end

  always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_state <= P_IDLE;
    end else begin
      case (r_state)
        P_IDLE : begin
          if (w_w_access) r_state <= P_WRITE_CMD;
          else if (w_r_access) r_state <= P_READ_CMD;
        end
        P_WRITE_CMD : begin
          if (i_ack) r_state <= P_IDLE;
        end
        P_READ_CMD : begin
          if (i_ack) begin
            if (i_rstr) r_state <= P_IDLE;
            else r_state <= P_READ_DT;
          end
        end
        P_READ_DT : begin
          if (i_rstr) r_state <= P_IDLE;
        end

      endcase
    end
  end


//////////////////////////////////
// module instance
//////////////////////////////////
// AXI write command
  fm_fifo #(P_WC_FIFO_W) u_wc_fifo (
    .clk_core(clk_core),
    .rst_x(rst_x),
    .i_wstrobe(i_awvalid_s),
    .i_dt(w_wc_fifo_in),
    .o_full(w_wc_full),
    .i_renable(w_wc_ren),
    .o_dt(w_wc_fifo_out),
    .o_empty(w_wc_empty),
    .o_dnum()
  );
// AXI write data
  fm_fifo #(P_WD_FIFO_W) u_wd_fifo (
    .clk_core(clk_core),
    .rst_x(rst_x),
    .i_wstrobe(i_wvalid_s),
    .i_dt(w_wd_fifo_in),
    .o_full(w_wd_full),
    .i_renable(w_wd_ren),
    .o_dt(w_wd_fifo_out),
    .o_empty(w_wd_empty),
    .o_dnum()
  );
// AXI write response
  fm_fifo #(P_WR_FIFO_W) u_wr_fifo (
    .clk_core(clk_core),
    .rst_x(rst_x),
    .i_wstrobe(w_wd_ren),
    .i_dt(w_wr_fifo_in),
    .o_full(w_wr_full),
    .i_renable(i_bready_s),
    .o_dt(w_wr_fifo_out),
    .o_empty(w_wr_empty),
    .o_dnum()
  );
// AXI read command
  fm_fifo #(P_RC_FIFO_W) u_rc_fifo (
    .clk_core(clk_core),
    .rst_x(rst_x),
    .i_wstrobe(i_arvalid_s),
    .i_dt(w_rc_fifo_in),
    .o_full(w_rc_full),
    .i_renable(w_rc_ren),
    .o_dt(w_rc_fifo_out),
    .o_empty(w_rc_empty),
    .o_dnum()
  );
// AXI read data
  fm_fifo #(P_RR_FIFO_W) u_rr_fifo (
    .clk_core(clk_core),
    .rst_x(rst_x),
    .i_wstrobe(i_rstr),
    .i_dt(w_rr_fifo_in),
    .o_full(w_rr_full),
    .i_renable(i_rready_s),
    .o_dt(w_rr_fifo_out),
    .o_empty(w_rr_empty),
    .o_dnum()
  );

endmodule

