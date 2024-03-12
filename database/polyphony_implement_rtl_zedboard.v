//=======================================================================
// Project Polyphony
//
// File:
//   zedboard.v
//
// Abstract:
//   Zedboard top module
//
//  Created:
//    8 June 2020
//
// Copyright (c) 2020  Kenji Ishimaru, All rights reserved.
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

module zedboard
   (CLK_100,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    btns_5bits_tri_i,
    leds_8bits_tri_o,
    sws_8bits_tri_i,
    o_hsync_x,
    o_vsync_x,
    o_vr,
    o_vg,
    o_vb
`ifdef PP_USE_HDMI
    ,io_scl,
    io_sda,
    clk_vo,
    o_hd_vsync,
    o_hd_hsync,
    o_hd_de,
    o_hd_d
`endif
);
  input CLK_100;   
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input [4:0]btns_5bits_tri_i;
  output [7:0]leds_8bits_tri_o;
  input [7:0]sws_8bits_tri_i;

  output o_hsync_x;
  output o_vsync_x;
  output [3:0] o_vr;
  output [3:0] o_vg;
  output [3:0] o_vb;
`ifdef PP_USE_HDMI
  // HDMI
  inout  io_scl;
  inout  io_sda;
  output clk_vo;
  output o_hd_vsync;
  output o_hd_hsync;
  output o_hd_de;
  output [15:0] o_hd_d;
`endif
  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;

  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [31:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [3:0]M_AXI_arcache;
  wire [11:0]M_AXI_arid;
  wire [3:0]M_AXI_arlen;
  wire [1:0]M_AXI_arlock;
  wire [2:0]M_AXI_arprot;
  wire [3:0]M_AXI_arqos;
  wire M_AXI_arready;
  wire [2:0]M_AXI_arsize;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [3:0]M_AXI_awcache;
  wire [11:0]M_AXI_awid;
  wire [3:0]M_AXI_awlen;
  wire [1:0]M_AXI_awlock;
  wire [2:0]M_AXI_awprot;
  wire [3:0]M_AXI_awqos;
  wire M_AXI_awready;
  wire [2:0]M_AXI_awsize;
  wire M_AXI_awvalid;
  wire [11:0]M_AXI_bid;
  wire M_AXI_bready;
  wire [1:0]M_AXI_bresp;
  wire M_AXI_bvalid;
  wire [31:0]M_AXI_rdata;
  wire [11:0]M_AXI_rid;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire [1:0]M_AXI_rresp;
  wire M_AXI_rvalid;
  wire [31:0]M_AXI_wdata;
  wire [11:0]M_AXI_wid;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_wvalid;

  wire [31:0]S_AXI_araddr;
  wire [1:0]S_AXI_arburst;
  wire [3:0]S_AXI_arcache;
  wire [2:0]S_AXI_arid;
  wire [7:0]S_AXI_arlen;
  wire [0:0]S_AXI_arlock;
  wire [2:0]S_AXI_arprot;
  wire [3:0]S_AXI_arqos;
  wire S_AXI_arready;
  wire [3:0]S_AXI_arregion;
  wire [2:0]S_AXI_arsize;
  wire [4:0]S_AXI_aruser;
  wire S_AXI_arvalid;
  wire [31:0]S_AXI_awaddr;
  wire [1:0]S_AXI_awburst;
  wire [3:0]S_AXI_awcache;
  wire [2:0]S_AXI_awid;
  wire [7:0]S_AXI_awlen;
  wire [0:0]S_AXI_awlock;
  wire [2:0]S_AXI_awprot;
  wire [3:0]S_AXI_awqos;
  wire S_AXI_awready;
  wire [3:0]S_AXI_awregion;
  wire [2:0]S_AXI_awsize;
  wire [4:0]S_AXI_awuser;
  wire S_AXI_awvalid;
  wire [2:0]S_AXI_bid;
  wire S_AXI_bready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [63:0]S_AXI_rdata;
  wire [2:0]S_AXI_rid;
  wire S_AXI_rlast;
  wire S_AXI_rready;
  wire [1:0]S_AXI_rresp;
  wire [4:0]S_AXI_ruser;
  wire S_AXI_rvalid;
  wire [63:0]S_AXI_wdata;
  wire S_AXI_wlast;
  wire S_AXI_wready;
  wire [7:0]S_AXI_wstrb;
  wire [4:0]S_AXI_wuser;
  wire S_AXI_wvalid;
   
  wire [4:0]btns_5bits_tri_i;
  wire [7:0]leds_8bits_tri_o;
  wire [7:0]sws_8bits_tri_i;
 
  wire [7:0] w_vr;
  wire [7:0] w_vg;
  wire [7:0] w_vb;
  wire       w_int;
  assign o_vr = w_vr[7:4];
  assign o_vg = w_vg[7:4];
  assign o_vb = w_vb[7:4];
  wire [1:0] w_debug;

   wire      clk_v_pll;
   wire      clk_v_pll_90;
   wire      clkfb;
   

   PLLE2_BASE  #(
      .BANDWIDTH("OPTIMIZED"),
      .CLKFBOUT_MULT(8),
      .CLKFBOUT_PHASE(0.0),
      .CLKIN1_PERIOD(10.0),
      .CLKOUT0_DIVIDE(32),
      .CLKOUT1_DIVIDE(32),
      .CLKOUT2_DIVIDE(32),
      .CLKOUT3_DIVIDE(1),
      .CLKOUT4_DIVIDE(1),
      .CLKOUT5_DIVIDE(1),
      .CLKOUT0_DUTY_CYCLE(0.5),
      .CLKOUT1_DUTY_CYCLE(0.5),
      .CLKOUT2_DUTY_CYCLE(0.5),
      .CLKOUT3_DUTY_CYCLE(0.5),
      .CLKOUT4_DUTY_CYCLE(0.5),
      .CLKOUT5_DUTY_CYCLE(0.5),
      .CLKOUT0_PHASE(0.0),
      .CLKOUT1_PHASE(0.0),
      .CLKOUT2_PHASE(135.0),
      .CLKOUT3_PHASE(0.0),
      .CLKOUT4_PHASE(0.0),
      .CLKOUT5_PHASE(0.0),
      .DIVCLK_DIVIDE(1),
      .REF_JITTER1(0.0),
      .STARTUP_WAIT("FALSE")
   ) u_PLLE2_BASE
   (
      .CLKOUT0(),
      .CLKOUT1(clk_v_pll),
      .CLKOUT2(clk_v_pll_90),
      .CLKOUT3(),
      .CLKOUT4(),
      .CLKOUT5(),
      .CLKFBOUT(clkfb),
      .LOCKED(),
      .CLKIN1(CLK_100),
      .PWRDWN(),
      .RST(0),
      .CLKFBIN(clkfb)
   );
 
   pp_top u_pp_top (
    // system
    .clk_core(FCLK_CLK0),
    .rst_x(FCLK_RESET0_N),
    .o_int(w_int),
    .o_debug(w_debug),
    // AXI Slave
    //   write port
    .i_awid_s(M_AXI_awid[7:0]),
    .i_awaddr_s(M_AXI_awaddr),
    .i_awlen_s({1'b0,M_AXI_awlen[3:0]}),
    .i_awsize_s(M_AXI_awsize),
    .i_awburst_s(M_AXI_awburst),
    .i_awlock_s('d0),
    .i_awcache_s('d0),
    .i_awprot_s('d0),
    .i_awvalid_s(M_AXI_awvalid),
    .o_awready_s(M_AXI_awready),
    .i_wid_s(M_AXI_awid[7:0]),
    .i_wdata_s(M_AXI_wdata),
    .i_wstrb_s(M_AXI_wstrb),
    .i_wlast_s(M_AXI_wlast),
    .i_wvalid_s(M_AXI_wvalid),
    .o_wready_s(M_AXI_wready),
    .o_bid_s(M_AXI_bid[7:0]),
    .o_bresp_s(M_AXI_bresp),
    .o_bvalid_s(M_AXI_bvalid),
    .i_bready_s(M_AXI_bready),
    //   read port
    .i_arid_s(M_AXI_arid[7:0]),
    .i_araddr_s(M_AXI_araddr),
    .i_arlen_s({1'b0,M_AXI_arlen[3:0]}),
    .i_arsize_s(M_AXI_arsize),
    .i_arburst_s(M_AXI_arburst),
    .i_arlock_s('d0),
    .i_arcache_s('d0),
    .i_arprot_s('d0),
    .i_arvalid_s(M_AXI_arvalid),
    .o_arready_s(M_AXI_arready),
    .o_rid_s(M_AXI_rid[7:0]),
    .o_rdata_s(M_AXI_rdata),
    .o_rresp_s(M_AXI_rresp),
    .o_rlast_s(M_AXI_rlast),
    .o_rvalid_s(M_AXI_rvalid),
    .i_rready_s(M_AXI_rready),
    // AXI Master
    .o_awid_m(S_AXI_awid),
    .o_awaddr_m(S_AXI_awaddr),
    .o_awlen_m(S_AXI_awlen[4:0]),
    .o_awsize_m(S_AXI_awsize),
    .o_awburst_m(S_AXI_awburst),
    .o_awlock_m(S_AXI_awlock),
    .o_awcache_m(S_AXI_awcache),
    .o_awuser_m(S_AXI_awuser),
    .o_awprot_m(S_AXI_awprot),
    .o_awvalid_m(S_AXI_awvalid),
    .i_awready_m(S_AXI_awready),
    .o_wid_m(),
    .o_wdata_m(S_AXI_wdata),
    .o_wstrb_m(S_AXI_wstrb),
    .o_wlast_m(S_AXI_wlast),
    .o_wvalid_m(S_AXI_wvalid),
    .i_wready_m(S_AXI_wready),
    .i_bid_m(S_AXI_bid),
    .i_bresp_m(S_AXI_bresp),
    .i_bvalid_m(S_AXI_bvalid),
    .o_bready_m(S_AXI_bready),
    .o_arid_m(S_AXI_arid),
    .o_araddr_m(S_AXI_araddr),
    .o_arlen_m(S_AXI_arlen[4:0]),
    .o_arsize_m(S_AXI_arsize),
    .o_arburst_m(S_AXI_arburst),
    .o_arlock_m(S_AXI_arlock),
    .o_arcache_m(S_AXI_arcache),
    .o_aruser_m(S_AXI_aruser),
    .o_arprot_m(S_AXI_arprot),
    .o_arvalid_m(S_AXI_arvalid),
    .i_arready_m(S_AXI_arready),
    .i_rid_m(S_AXI_rid),
    .i_rdata_m(S_AXI_rdata),
    .i_rresp_m(S_AXI_rresp),
    .i_rlast_m(S_AXI_rlast),
    .i_rvalid_m(S_AXI_rvalid),
    .o_rready_m(S_AXI_rready),
    // Video out
/*
    .clk_v(FCLK_CLK3),
    .clk_v_90(FCLK_CLK3),
*/
    .clk_v(clk_v_pll),
 //   .clk_v_90(clk_v_pll_90),  HDMI Test
    .o_blank_x(),
    .o_hsync_x(o_hsync_x),
    .o_vsync_x(o_vsync_x),
    .o_vr(w_vr),
    .o_vg(w_vg),
    .o_vb(w_vb)
`ifdef PP_USE_HDMI
    // HDMI
    ,.io_scl(io_scl),
    .io_sda(io_sda),
    .clk_vo(clk_vo),
    .o_hd_vsync(o_hd_vsync),
    .o_hd_hsync(o_hd_hsync),
    .o_hd_de(o_hd_de),
    .o_hd_d(o_hd_d)
`endif
  );
 
zed_base zed_base_i
       (.IRQ_F2P(w_int),
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FCLK_CLK0(FCLK_CLK0),
        .FCLK_RESET0_N(FCLK_RESET0_N),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .M_AXI_araddr(M_AXI_araddr),
        .M_AXI_arburst(M_AXI_arburst),
        .M_AXI_arcache(M_AXI_arcache),
        .M_AXI_arid(M_AXI_arid),
        .M_AXI_arlen(M_AXI_arlen),
        .M_AXI_arlock(M_AXI_arlock),
        .M_AXI_arprot(M_AXI_arprot),
        .M_AXI_arqos(M_AXI_arqos),
        .M_AXI_arready(M_AXI_arready),
        .M_AXI_arsize(M_AXI_arsize),
        .M_AXI_arvalid(M_AXI_arvalid),
        .M_AXI_awaddr(M_AXI_awaddr),
        .M_AXI_awburst(M_AXI_awburst),
        .M_AXI_awcache(M_AXI_awcache),
        .M_AXI_awid(M_AXI_awid),
        .M_AXI_awlen(M_AXI_awlen),
        .M_AXI_awlock(M_AXI_awlock),
        .M_AXI_awprot(M_AXI_awprot),
        .M_AXI_awqos(M_AXI_awqos),
        .M_AXI_awready(M_AXI_awready),
        .M_AXI_awsize(M_AXI_awsize),
        .M_AXI_awvalid(M_AXI_awvalid),
        .M_AXI_bid(M_AXI_bid),
        .M_AXI_bready(M_AXI_bready),
        .M_AXI_bresp(M_AXI_bresp),
        .M_AXI_bvalid(M_AXI_bvalid),
        .M_AXI_rdata(M_AXI_rdata),
        .M_AXI_rid(M_AXI_rid),
        .M_AXI_rlast(M_AXI_rlast),
        .M_AXI_rready(M_AXI_rready),
        .M_AXI_rresp(M_AXI_rresp),
        .M_AXI_rvalid(M_AXI_rvalid),
        .M_AXI_wdata(M_AXI_wdata),
        .M_AXI_wid(M_AXI_wid),
        .M_AXI_wlast(M_AXI_wlast),
        .M_AXI_wready(M_AXI_wready),
        .M_AXI_wstrb(M_AXI_wstrb),
        .M_AXI_wvalid(M_AXI_wvalid),
        .S_AXI_araddr(S_AXI_araddr),
        .S_AXI_arburst(S_AXI_arburst),
        .S_AXI_arcache(S_AXI_arcache),
        .S_AXI_arlen(S_AXI_arlen),
        .S_AXI_arlock(S_AXI_arlock),
        .S_AXI_arprot(S_AXI_arprot),
        .S_AXI_arqos(S_AXI_arqos),
        .S_AXI_arready(S_AXI_arready),
        .S_AXI_arregion(S_AXI_arregion),
        .S_AXI_arsize(S_AXI_arsize),
//        .S_AXI_aruser(S_AXI_aruser),
        .S_AXI_arvalid(S_AXI_arvalid),
        .S_AXI_awaddr(S_AXI_awaddr),
        .S_AXI_awburst(S_AXI_awburst),
        .S_AXI_awcache(S_AXI_awcache),
        .S_AXI_awlen(S_AXI_awlen),
        .S_AXI_awlock(S_AXI_awlock),
        .S_AXI_awprot(S_AXI_awprot),
        .S_AXI_awqos(S_AXI_awqos),
        .S_AXI_awready(S_AXI_awready),
        .S_AXI_awregion(S_AXI_awregion),
        .S_AXI_awsize(S_AXI_awsize),
//        .S_AXI_awuser(S_AXI_awuser),
        .S_AXI_awvalid(S_AXI_awvalid),
        .S_AXI_bready(S_AXI_bready),
        .S_AXI_bresp(S_AXI_bresp),
        .S_AXI_bvalid(S_AXI_bvalid),
        .S_AXI_rdata(S_AXI_rdata),
        .S_AXI_rlast(S_AXI_rlast),
        .S_AXI_rready(S_AXI_rready),
        .S_AXI_rresp(S_AXI_rresp),
        .S_AXI_rvalid(S_AXI_rvalid),
        .S_AXI_wdata(S_AXI_wdata),
        .S_AXI_wlast(S_AXI_wlast),
        .S_AXI_wready(S_AXI_wready),
        .S_AXI_wstrb(S_AXI_wstrb),
        .S_AXI_wvalid(S_AXI_wvalid),
        .btns_5bits_tri_i(btns_5bits_tri_i),
        .leds_8bits_tri_o(leds_8bits_tri_o),
        .sws_8bits_tri_i(sws_8bits_tri_i));
endmodule
