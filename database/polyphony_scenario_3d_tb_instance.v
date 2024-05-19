// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   tb_instance.v
//
// Abstract:
//   testbench instance
//
//  Created:
//    6 October 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
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


`include "polyphony_axi_def.v"
reg clk;
reg clk_v;
reg rst_x;
wire o_int;
wire [7:0] o_vr,o_vg,o_vb;
wire io_scl;
wire io_sda;

pullup(io_scl);
pullup(io_sda);

// AXI Slave Write Channel Signals
wire [P_AXI_S_AWID-1:0] w_awid_s;
wire [P_AXI_S_AWADDR-1:0] w_awaddr_s;
wire [P_AXI_S_AWLEN-1:0] w_awlen_s;
wire [P_AXI_S_AWSIZE-1:0] w_awsize_s;
wire [P_AXI_S_AWBURST-1:0] w_awburst_s;
wire [P_AXI_S_AWLOCK-1:0] w_awlock_s;
wire [P_AXI_S_AWCACHE-1:0] w_awcache_s;
wire [P_AXI_S_AWPROT-1:0] w_awprot_s;
wire w_awvalid_s;
wire w_awready_s;
wire [P_AXI_S_WID-1:0] w_wid_s;
wire [P_AXI_S_WDATA-1:0] w_wdata_s;
wire [P_AXI_S_WSTRB-1:0] w_wstrb_s;
wire w_wlast_s;
wire w_wvalid_s;
wire w_wready_s;
wire [P_AXI_S_BID-1:0] w_bid_s;
wire [P_AXI_S_BRESP-1:0] w_bresp_s;
wire w_bvalid_s;
wire w_bready_s;

// AXI Slave Read Channel Signals
wire [P_AXI_S_ARID-1:0] w_arid_s;
wire [P_AXI_S_ARADDR-1:0] w_araddr_s;
wire [P_AXI_S_ARLEN-1:0] w_arlen_s;
wire [P_AXI_S_ARSIZE-1:0] w_arsize_s;
wire [P_AXI_S_ARBURST-1:0] w_arburst_s;
wire [P_AXI_S_ARLOCK-1:0] w_arlock_s;
wire [P_AXI_S_ARCACHE-1:0] w_arcache_s;
wire [P_AXI_S_ARPROT-1:0] w_arprot_s;
wire w_arvalid_s;
wire w_arready_s;
wire [P_AXI_S_RID-1:0] w_rid_s;
wire [P_AXI_S_RDATA-1:0] w_rdata_s;
wire [P_AXI_S_RRESP-1:0] w_rresp_s;
wire w_rlast_s;
wire w_rvalid_s;
wire w_rready_s;

// AXI Master Write Channel Signals
wire [P_AXI_M_AWID-1:0] w_awid_m;
wire [P_AXI_M_AWADDR-1:0] w_awaddr_m;
wire [P_AXI_M_AWLEN-1:0] w_awlen_m;
wire [P_AXI_M_AWSIZE-1:0] w_awsize_m;
wire [P_AXI_M_AWBURST-1:0] w_awburst_m;
wire [P_AXI_M_AWLOCK-1:0] w_awlock_m;
wire [P_AXI_M_AWCACHE-1:0] w_awcache_m;
wire [P_AXI_M_AWPROT-1:0] w_awprot_m;
wire w_awvalid_m;
wire w_awready_m;
wire [P_AXI_M_WID-1:0] w_wid_m;
wire [P_AXI_M_WDATA-1:0] w_wdata_m;
wire [P_AXI_M_WSTRB-1:0] w_wstrb_m;
wire w_wlast_m;
wire w_wvalid_m;
wire w_wready_m;
wire [P_AXI_M_BID-1:0] w_bid_m;
wire [P_AXI_M_BRESP-1:0] w_bresp_m;
wire w_bvalid_m;
wire w_bready_m;
// AXI Master Read Channel Signals
wire [P_AXI_M_ARID-1:0] w_arid_m;
wire [P_AXI_M_ARADDR-1:0] w_araddr_m;
wire [P_AXI_M_ARLEN-1:0] w_arlen_m;
wire [P_AXI_M_ARSIZE-1:0] w_arsize_m;
wire [P_AXI_M_ARBURST-1:0] w_arburst_m;
wire [P_AXI_M_ARLOCK-1:0] w_arlock_m;
wire [P_AXI_M_ARCACHE-1:0] w_arcache_m;
wire [P_AXI_M_ARPROT-1:0] w_arprot_m;
wire w_arvalid_m;
wire w_arready_m;
wire [P_AXI_M_RID-1:0] w_rid_m;
wire [P_AXI_M_RDATA-1:0] w_rdata_m;
wire [P_AXI_M_RRESP-1:0] w_rresp_m;
wire w_rlast_m;
wire w_rvalid_m;
wire w_rready_m;

assign w_awid_s = 0;
assign w_arid_s = 0;
assign w_wid_s = 0;

pp_top pp_top (
  // Int out
  .o_int(o_int),
  // User Clock
  .clk_core(clk),
  .rst_x(rst_x),
  // AXI Slave write port
  .i_awid_s(w_awid_s),
  .i_awaddr_s(w_awaddr_s),
  .i_awlen_s(w_awlen_s),
  .i_awsize_s(w_awsize_s),
  .i_awburst_s(w_awburst_s),
  .i_awlock_s(w_awlock_s),
  .i_awcache_s(w_awcache_s),
  .i_awprot_s(w_awprot_s),
  .i_awvalid_s(w_awvalid_s),
  .o_awready_s(w_awready_s),
  .i_wid_s(w_wid_s),
  .i_wdata_s(w_wdata_s),
  .i_wstrb_s(w_wstrb_s),
  .i_wlast_s(w_wlast_s),
  .i_wvalid_s(w_wvalid_s),
  .o_wready_s(w_wready_s),
  .o_bid_s(w_bid_s),
  .o_bresp_s(w_bresp_s),
  .o_bvalid_s(w_bvalid_s),
  .i_bready_s(w_bready_s),
  // AXI Slave read port
  .i_arid_s(w_arid_s),
  .i_araddr_s(w_araddr_s),
  .i_arlen_s(w_arlen_s),
  .i_arsize_s(w_arsize_s),
  .i_arburst_s(w_arburst_s),
  .i_arlock_s(w_arlock_s),
  .i_arcache_s(w_arcache_s),
  .i_arprot_s(w_arprot_s),
  .i_arvalid_s(w_arvalid_s),
  .o_arready_s(w_arready_s),
  .o_rid_s(w_rid_s),
  .o_rdata_s(w_rdata_s),
  .o_rresp_s(w_rresp_s),
  .o_rlast_s(w_rlast_s),
  .o_rvalid_s(w_rvalid_s),
  .i_rready_s(w_rready_s),
  // AXI Master Write
  .o_awid_m(w_awid_m),
  .o_awaddr_m(w_awaddr_m),
  .o_awlen_m(w_awlen_m),
  .o_awsize_m(w_awsize_m),
  .o_awburst_m(w_awburst_m),
  .o_awlock_m(w_awlock_m),
  .o_awcache_m(w_awcache_m),
  .o_awprot_m(w_awprot_m),
  .o_awvalid_m(w_awvalid_m),
  .i_awready_m(w_awready_m),
  .o_wid_m(w_wid_m),
  .o_wdata_m(w_wdata_m),
  .o_wstrb_m(w_wstrb_m),
  .o_wlast_m(w_wlast_m),
  .o_wvalid_m(w_wvalid_m),
  .i_wready_m(w_wready_m),
  .i_bid_m(w_bid_m),
  .i_bresp_m(w_bresp_m),
  .i_bvalid_m(w_bvalid_m),
  .o_bready_m(w_bready_m),
  // AXI Master Read
  .o_arid_m(w_arid_m),
  .o_araddr_m(w_araddr_m),
  .o_arlen_m(w_arlen_m),
  .o_arsize_m(w_arsize_m),
  .o_arburst_m(w_arburst_m),
  .o_arlock_m(w_arlock_m),
  .o_arcache_m(w_arcache_m),
  .o_arprot_m(w_arprot_m),
  .o_arvalid_m(w_arvalid_m),
  .i_arready_m(w_arready_m),
  .i_rid_m(w_rid_m),
  .i_rdata_m(w_rdata_m),
  .i_rresp_m(w_rresp_m),
  .i_rlast_m(w_rlast_m),
  .i_rvalid_m(w_rvalid_m),
  .o_rready_m(w_rready_m),
  // Video out
  .clk_v(clk_v),
  .o_blank_x(o_blank_x),
  .o_hsync_x(o_hsync_x),
  .o_vsync_x(o_vsync_x),
  .o_vr(o_vr),
  .o_vg(o_vg),
  .o_vb(o_vb)
  // HDMI
`ifdef PP_USE_HDMI
  ,.io_scl(io_scl),
  .io_sda(io_sda),
  .clk_vo(clk_vo),
  .o_hd_vsync(o_hd_vsync),
  .o_hd_hsync(o_hd_hsync),
  .o_hd_de(o_hd_de),
  .o_hd_d(o_hd_d)
`endif
);

bv_axi_master u_axi_behavior (
  // System
  .clk_core(clk),
  .rst_x(rst_x),
  // AXI CH
  .o_awaddr(w_awaddr_s),
  .o_awlen(w_awlen_s),
  .o_awsize(w_awsize_s),
  .o_awburst(w_awburst_s),
  .o_awvalid(w_awvalid_s),
  .i_awready(w_awready_s),
  .o_wdata(w_wdata_s),
  .o_wstrb(w_wstrb_s),
  .o_wlast(w_wlast_s),
  .o_wvalid(w_wvalid_s),
  .i_wready(w_wready_s),
  .i_bresp(w_bresp_s),
  .i_bvalid(w_bvalid_s),
  .o_bready(w_bready_s),
  .o_araddr(w_araddr_s),
  .o_arlen(w_arlen_s),
  .o_arsize(w_arsize_s),
  .o_arburst(w_arburst_s),
  .o_arvalid(w_arvalid_s),
  .i_arready(w_arready_s),
  .i_rdata(w_rdata_s),
  .i_rresp(w_rresp_s),
  .i_rlast(w_rlast_s),
  .i_rvalid(w_rvalid_s),
  .o_rready(w_rready_s)
);


bv_axi_slave_mem u_axi_slave_mem (
  .clk_core(clk),
  .rst_x(rst_x),
  // AXI
  //   write channel
  .i_awid(w_awid_m),
  .i_awaddr(w_awaddr_m),
  .i_awlen(w_awlen_m),
  .i_awsize(w_awsize_m),
  .i_awburst(w_awburst_m),
  .i_awlock(w_awlock_m),
  .i_awcache(w_awcache_m),
  .i_awprot(w_awprot_m),
  .i_awvalid(w_awvalid_m),
  .o_awready(w_awready_m),
  .i_wid(w_wid_m),
  .i_wdata(w_wdata_m),
  .i_wstrb(w_wstrb_m),
  .i_wlast(w_wlast_m),
  .i_wvalid(w_wvalid_m),
  .o_wready(w_wready_m),
  .o_bid(w_bid_m),
  .i_bresp(w_bresp_m),
  .o_bvalid(w_bvalid_m),
  .i_bready(w_bready_m),
  //   read channel
  .i_arid(w_arid_m),
  .i_araddr(w_araddr_m),
  .i_arlen(w_arlen_m),
  .i_arsize(w_arsize_m),
  .i_arburst(w_arburst_m),
  .i_arlock(w_arlock_m),
  .i_arcache(w_arcache_m),
  .i_arprot(w_arprot_m),
  .i_arvalid(w_arvalid_m),
  .o_arready(w_arready_m),
  .o_rid(w_rid_m),
  .o_rdata(w_rdata_m),
  .o_rresp(w_rresp_m),
  .o_rlast(w_rlast_m),
  .o_rvalid(w_rvalid_m),
  .i_rready(w_rready_m)
);
