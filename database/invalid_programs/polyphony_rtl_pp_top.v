//=======================================================================
// Project Polyphony
//
// File:
//   pp_top.v
//
// Abstract:
//   polyphony core top module AXI version
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

module pp_top (
  // system
  clk_core,
  rst_x,
  o_int,
  o_debug,
  // AXI Slave
  //   write port
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
  //   read port
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
  // AXI Master
  o_awid_m,
  o_awaddr_m,
  o_awlen_m,
  o_awsize_m,
  o_awburst_m,
  o_awlock_m,
  o_awcache_m,
  o_awuser_m,
  o_awprot_m,
  o_awvalid_m,
  i_awready_m,
  o_wid_m,
  o_wdata_m,
  o_wstrb_m,
  o_wlast_m,
  o_wvalid_m,
  i_wready_m,
  i_bid_m,
  i_bresp_m,
  i_bvalid_m,
  o_bready_m,
  o_arid_m,
  o_araddr_m,
  o_arlen_m,
  o_arsize_m,
  o_arburst_m,
  o_arlock_m,
  o_arcache_m,
  o_aruser_m,
  o_arprot_m,
  o_arvalid_m,
  i_arready_m,
  i_rid_m,
  i_rdata_m,
  i_rresp_m,
  i_rlast_m,
  i_rvalid_m,
  o_rready_m,
  // Video out
  clk_v,
`ifdef PP_HDMI_TEST
  clk_v_90,
`endif
  o_blank_x,
  o_hsync_x,
  o_vsync_x,
  o_vr,
  o_vg,
  o_vb
`ifdef PP_USE_HDMI
  // HDMI
  ,io_scl,
  io_sda,
  clk_vo,
  o_hd_vsync,
  o_hd_hsync,
  o_hd_de,
  o_hd_d
`endif
);
`include "polyphony_axi_def.v"
//////////////////////////////////
// I/O port definition
//////////////////////////////////
  // system
  input clk_core;
  input rst_x;
  output o_int;
  output [1:0] o_debug;
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
  output [P_AXI_S_RID-1:0] o_rid_s;
  output [P_AXI_S_RDATA-1:0] o_rdata_s;
  output [P_AXI_S_RRESP-1:0] o_rresp_s;
  output o_rlast_s;
  output o_rvalid_s;
  input i_rready_s;
  // AXI Master
  output [P_AXI_M_AWID-1:0] o_awid_m;
  output [P_AXI_M_AWADDR-1:0] o_awaddr_m;
  output [P_AXI_M_AWLEN-1:0] o_awlen_m;
  output [P_AXI_M_AWSIZE-1:0] o_awsize_m;
  output [P_AXI_M_AWBURST-1:0] o_awburst_m;
  output [P_AXI_M_AWLOCK-1:0] o_awlock_m;
  output [P_AXI_M_AWCACHE-1:0] o_awcache_m;
  output [P_AXI_M_AWUSER-1:0] o_awuser_m;
  output [P_AXI_M_AWPROT-1:0] o_awprot_m;
  output o_awvalid_m;
  input i_awready_m;
  output [P_AXI_M_WID-1:0] o_wid_m;
  output [P_AXI_M_WDATA-1:0] o_wdata_m;
  output [P_AXI_M_WSTRB-1:0] o_wstrb_m;
  output o_wlast_m;
  output o_wvalid_m;
  input i_wready_m;
  input [P_AXI_M_BID-1:0] i_bid_m;
  input [P_AXI_M_BRESP-1:0] i_bresp_m;
  input i_bvalid_m;
  output o_bready_m;
  output [P_AXI_M_ARID-1:0] o_arid_m;
  output [P_AXI_M_ARADDR-1:0] o_araddr_m;
  output [P_AXI_M_ARLEN-1:0] o_arlen_m;
  output [P_AXI_M_ARSIZE-1:0] o_arsize_m;
  output [P_AXI_M_ARBURST-1:0] o_arburst_m;
  output [P_AXI_M_ARLOCK-1:0] o_arlock_m;
  output [P_AXI_M_ARCACHE-1:0] o_arcache_m;
  output [P_AXI_M_ARUSER-1:0] o_aruser_m;
  output [P_AXI_M_ARPROT-1:0] o_arprot_m;
  output o_arvalid_m;
  input i_arready_m;
  input [P_AXI_M_RID-1:0] i_rid_m;
  input [P_AXI_M_RDATA-1:0] i_rdata_m;
  input [P_AXI_M_RRESP-1:0] i_rresp_m;
  input i_rlast_m;
  input i_rvalid_m;
  output o_rready_m;
  // Video out
  input clk_v;
`ifdef PP_HDMI_TEST
  input clk_v_90;
`endif
  output o_blank_x;
  output o_hsync_x;
  output o_vsync_x;
  output [7:0] o_vr;
  output [7:0] o_vg;
  output [7:0] o_vb;
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

//////////////////////////////////
// wire
//////////////////////////////////
    // axi master - Memory interconenct
    wire           w_brg_req;
    wire  [P_IB_ADDR_WIDTH-1:0] w_brg_adrs;
    wire  [1:0]    w_brg_id;
    wire           w_brg_wr;
    wire  [P_IB_LEN_WIDTH-1:0]  w_brg_len;
    wire           w_brg_ack;
    wire           w_brg_wstr;
    wire  [P_IB_BE_WIDTH-1:0]   w_brg_be;
    wire  [P_IB_DATA_WIDTH-1:0] w_brg_wdata;
    wire           w_brg_wack;
    wire           w_brg_rstr;
    wire           w_brg_rlast;
    wire  [1:0]    w_brg_rid;
    wire  [P_IB_DATA_WIDTH-1:0] w_brg_rdata;
    // axi slave bus - request dispatcher
    wire           w_req_axi_s;
    wire           w_wr_axi_s;
    wire  [23:0]   w_adrs_axi_s;
    wire           w_ack_axi_s;
    wire  [3:0]    w_be_axi_s;
    wire  [31:0]   w_wd_axi_s;
    wire           w_rstr_axi_s;
    wire  [31:0]   w_rd_axi_s;
    // pci - request dispatcher
    wire           w_req_pci;
    wire           w_wr_pci;
    wire  [31:0]   w_adrs_pci;
    wire           w_ack_pci;
    wire  [3:0]    w_be_pci;
    wire  [31:0]   w_wd_pci;
    wire  [31:0]   w_rd_pci;
    // request dispatcher - System controller
    wire           w_req_sys;
    wire           w_wr_wr_s3;
    wire  [21:0]   w_wr_adrs_s3;
    wire           w_ack_sys;
    wire  [3:0]    w_wr_be_s3;
    wire  [31:0]   w_wr_wdata_s3;
    wire           w_rstr_sys;
    wire  [31:0]   w_rdata_sys;

    wire           w_dma_start;
    wire   [3:0]   w_dma_mode;
    wire           w_dma_end;
    wire   [19:0]  w_dma_top_address0;
    wire   [19:0]  w_dma_top_address1;
    wire   [19:0]  w_dma_top_address2;
    wire   [19:0]  w_dma_top_address3;
    wire   [17:0]  w_dma_length;
    wire   [3:0]   w_dma_be;
    wire   [31:0]  w_dma_wd0;
    wire   [31:0]  w_dma_wd1;
    // sdram interface
    wire           w_req_mem;
    wire           w_wr_mem;
    wire   [P_IB_ADDR_WIDTH-1:0] w_adrs_mem;
    wire   [P_IB_LEN_WIDTH-1:0]  w_len_mem;
    wire           w_ack_mem;
    wire           w_strw_mem;
    wire   [P_IB_BE_WIDTH-1:0]   w_be_mem;
    wire   [P_IB_DATA_WIDTH-1:0] w_wd_mem;
    wire           w_ackw_mem;
    // request dispatcher - 3D graphics core
    wire           w_req_3d;
    wire           w_ack_3d;
    wire           w_rstr_3d;
    wire  [31:0]   w_rdata_3d;
    // 3D graphics - memory interconnect
    wire           w_wr_req1;
    wire           w_wr_wr1;
    wire  [P_IB_ADDR_WIDTH-1:0] w_wr_adrs1;
    wire  [P_IB_LEN_WIDTH-1:0]  w_wr_len1;
    wire           w_wr_ack1;
    wire           w_wr_wstr1;
    wire  [P_IB_BE_WIDTH-1:0]   w_wr_be1;
    wire  [P_IB_DATA_WIDTH-1:0] w_wr_wdata1;
    wire           w_wr_wack1;
    wire           w_wr_rstr1;
    wire  [P_IB_DATA_WIDTH-1:0] w_wr_rdata1;
    // 3D graphics - system controller
    wire           w_vtx_int;
    // 3D graphics vertex fetsh
    wire           w_req_dma;
    wire  [P_IB_ADDR_WIDTH-1:0] w_adrs_dma;
    wire  [P_IB_LEN_WIDTH-1:0]  w_len_dma;
    wire           w_ack_dma;
    wire           w_strr_dma;
    wire  [P_IB_DATA_WIDTH-1:0] w_dbr_dma;
    // Memory interconnect - video controller
    wire           w_r_req2;
    wire  [P_IB_ADDR_WIDTH-1:0] w_r_adrs2;
    wire  [P_IB_LEN_WIDTH-1:0]  w_r_len2;
    wire           w_r_ack2;
    wire           w_r_rstr2;
    wire  [P_IB_DATA_WIDTH-1:0] w_r_rdata2;
    // System controller - video controller
    wire  [1:0]    w_video_start;
    wire  [2:0]    w_aa_en;
    wire  [11:0]   w_fb0_offset;
    wire  [11:0]   w_fb0_ms_offset;
    wire  [11:0]   w_fb1_offset;
    wire  [11:0]   w_fb1_ms_offset;
    wire  [1:0]    w_color_mode;
    wire           w_front_buffer;
    wire           w_fb_blend_en;

    wire           w_init_done;
    wire           w_vint_x;
    wire           w_vint_edge;

`ifdef PP_USE_HDMI
    // I2C for HDMI
    wire  [2:0] w_wb_adr;
    wire  [7:0] w_wb_dat_w;
    wire  [7:0] w_wb_dat_r;
    wire        w_wb_we;
    wire        w_wb_stb;
    wire        w_wb_cyc;
    wire        w_wb_ack;
    wire        w_scl_pad_i;
    wire        w_scl_pad_o;
    wire        w_scl_padoen_o;
    wire        w_sda_pad_i;
    wire        w_sda_pad_o;
    wire        w_sda_padoen_o;
    wire 	w_vde;
    wire        w_hsync_x;
    wire        w_vsync_x;
    wire [7:0]  w_vr;
    wire [7:0]  w_vg;
    wire [7:0]  w_vb;
`endif

    // AXI Master configuration
    wire [3:0]  w_conf_arcache_m;
    wire [4:0]  w_conf_aruser_m;
    wire [3:0]  w_conf_awcache_m;
    wire [4:0]  w_conf_awuser_m;
    // debug
    wire           w_idle;
    wire  [15:0]   w_ff;
    wire  [4:0]    w_fe;
    wire           w_la_pin;
    wire  [1:0]    w_sh4_state;
`ifdef USE_AXI_MONITOR
localparam P_BUCKET_SIZE     = 'd32;
   wire  w_stop_trigger;
// result out
  // awvalid
  wire [P_BUCKET_SIZE-1:0] w_bukets_no_wait_aw;
  wire [P_BUCKET_SIZE-1:0] w_bukets_0_aw;
  wire [P_BUCKET_SIZE-1:0] w_bukets_1_aw;
  wire [P_BUCKET_SIZE-1:0] w_bukets_2_aw;
  wire [P_BUCKET_SIZE-1:0] w_bukets_3_aw;
  wire [P_BUCKET_SIZE-1:0] w_bukets_more_aw;
  wire [P_BUCKET_SIZE-1:0] w_max_count_aw;
  wire [P_BUCKET_SIZE-1:0] w_min_count_aw;
  wire [P_BUCKET_SIZE-1:0] w_bukets_len_0_aw;
  wire [P_BUCKET_SIZE-1:0] w_bukets_len_1_aw;
  wire [P_BUCKET_SIZE-1:0] w_bukets_len_2_aw;
  wire [P_BUCKET_SIZE-1:0] w_bukets_len_3_aw;
  wire [P_BUCKET_SIZE-1:0] w_total_bytes_w;
  wire [P_BUCKET_SIZE-1:0] w_cont_w;
  wire [P_BUCKET_SIZE-1:0] w_discont_w;
  wire [P_BUCKET_SIZE-1:0] w_bukets_nrdy_0_w;
  wire [P_BUCKET_SIZE-1:0] w_bukets_nrdy_1_w;
  wire [P_BUCKET_SIZE-1:0] w_bukets_nrdy_2_w;
  wire [P_BUCKET_SIZE-1:0] w_bukets_nrdy_3_w;
  // arvalid
  wire [P_BUCKET_SIZE-1:0] w_bukets_no_wait_ar;
  wire [P_BUCKET_SIZE-1:0] w_bukets_0_ar;
  wire [P_BUCKET_SIZE-1:0] w_bukets_1_ar;
  wire [P_BUCKET_SIZE-1:0] w_bukets_2_ar;
  wire [P_BUCKET_SIZE-1:0] w_bukets_3_ar;
  wire [P_BUCKET_SIZE-1:0] w_bukets_more_ar;
  wire [P_BUCKET_SIZE-1:0] w_max_count_ar;
  wire [P_BUCKET_SIZE-1:0] w_min_count_ar;
  wire [P_BUCKET_SIZE-1:0] w_bukets_len_0_ar;
  wire [P_BUCKET_SIZE-1:0] w_bukets_len_1_ar;
  wire [P_BUCKET_SIZE-1:0] w_bukets_len_2_ar;
  wire [P_BUCKET_SIZE-1:0] w_bukets_len_3_ar;
  wire [P_BUCKET_SIZE-1:0] w_cont_ar;
  wire [P_BUCKET_SIZE-1:0] w_discont_ar;
  // wdata
  wire [P_BUCKET_SIZE-1:0] w_bukets_no_wait_b;
  wire [P_BUCKET_SIZE-1:0] w_bukets_0_b;
  wire [P_BUCKET_SIZE-1:0] w_bukets_1_b;
  wire [P_BUCKET_SIZE-1:0] w_bukets_2_b;
  wire [P_BUCKET_SIZE-1:0] w_bukets_3_b;
  wire [P_BUCKET_SIZE-1:0] w_bukets_more_b;
  wire [P_BUCKET_SIZE-1:0] w_num_of_cmd_b;
  wire [P_BUCKET_SIZE-1:0] w_num_of_b;
  // rdata
  wire [P_BUCKET_SIZE-1:0] w_bukets_no_wait_r;
  wire [P_BUCKET_SIZE-1:0] w_bukets_0_r;
  wire [P_BUCKET_SIZE-1:0] w_bukets_1_r;
  wire [P_BUCKET_SIZE-1:0] w_bukets_2_r;
  wire [P_BUCKET_SIZE-1:0] w_bukets_3_r;
  wire [P_BUCKET_SIZE-1:0] w_bukets_more_r;
  wire [P_BUCKET_SIZE-1:0] w_total_bytes_r;
  wire [P_BUCKET_SIZE-1:0] w_rd_cont;
  wire [P_BUCKET_SIZE-1:0] w_rd_discont;
  wire [P_BUCKET_SIZE-1:0] w_bukets_nrdy_0_r;
  wire [P_BUCKET_SIZE-1:0] w_bukets_nrdy_1_r;
  wire [P_BUCKET_SIZE-1:0] w_bukets_nrdy_2_r;
  wire [P_BUCKET_SIZE-1:0] w_bukets_nrdy_3_r;
`endif
//////////////////////////////////
// assign
//////////////////////////////////
  assign o_int = ~w_vtx_int;

//////////////////////////////////
// module instance
//////////////////////////////////
   
// AXI Slave I/F
fm_axi_s u_axi_s (
  // system
  .clk_core(clk_core),
  .rst_x(rst_x),
  // AXI write port
  .i_awid_s(i_awid_s),
  .i_awaddr_s(i_awaddr_s),
  .i_awlen_s(i_awlen_s),
  .i_awsize_s(i_awsize_s),
  .i_awburst_s(i_awburst_s),
  .i_awlock_s(i_awlock_s),
  .i_awcache_s(i_awcache_s),
  .i_awprot_s(i_awprot_s),
  .i_awvalid_s(i_awvalid_s),
  .o_awready_s(o_awready_s),
  .i_wid_s(i_wid_s),
  .i_wdata_s(i_wdata_s),
  .i_wstrb_s(i_wstrb_s),
  .i_wlast_s(i_wlast_s),
  .i_wvalid_s(i_wvalid_s),
  .o_wready_s(o_wready_s),
  .o_bid_s(o_bid_s),
  .o_bresp_s(o_bresp_s),
  .o_bvalid_s(o_bvalid_s),
  .i_bready_s(i_bready_s),
  // AXI read port
  .i_arid_s(i_arid_s),
  .i_araddr_s(i_araddr_s),
  .i_arlen_s(i_arlen_s),
  .i_arsize_s(i_arsize_s),
  .i_arburst_s(i_arburst_s),
  .i_arlock_s(i_arlock_s),
  .i_arcache_s(i_arcache_s),
  .i_arprot_s(i_arprot_s),
  .i_arvalid_s(i_arvalid_s),
  .o_arready_s(o_arready_s),
  .o_rid_s(o_rid_s),
  .o_rdata_s(o_rdata_s),
  .o_rresp_s(o_rresp_s),
  .o_rlast_s(o_rlast_s),
  .o_rvalid_s(o_rvalid_s),
  .i_rready_s(i_rready_s),
  // internal bus
  .o_req(w_req_axi_s),
  .o_wr(w_wr_axi_s),
  .o_adrs(w_adrs_axi_s),
  .i_ack(w_ack_axi_s),
  .o_be(w_be_axi_s),
  .o_wd(w_wd_axi_s),
  .i_rstr(w_rstr_axi_s),
  .i_rd(w_rd_axi_s)
);

// slave request dispatcher
fm_dispatch u_dispatch (
    .clk_core(clk_core),
    .rst_x(rst_x),
    // axi slave interface
    .i_req(w_req_axi_s),
    .i_wr(w_wr_axi_s),
    .i_adrs(w_adrs_axi_s),
    .o_ack(w_ack_axi_s),
    .i_be(w_be_axi_s),
    .i_wd(w_wd_axi_s),
    .o_rstr(w_rstr_axi_s),
    .o_rd(w_rd_axi_s),
    // internal side
    .o_req_sys(w_req_sys),
    .o_req_3d(w_req_3d),
    .o_wr(w_wr_wr_s3),
    .o_adrs(w_wr_adrs_s3),
    .i_ack_sys(w_ack_sys),
    .i_ack_3d(w_ack_3d),
    .o_be(w_wr_be_s3),
    .o_wd(w_wr_wdata_s3),
    .i_rstr_sys(w_rstr_sys),
    .i_rstr_3d(w_rstr_3d),
    .i_rd_sys(w_rdata_sys),
    .i_rd_3d(w_rdata_3d),
`ifdef PP_USE_HDMI
    // I2C wishbone
    .o_wb_adr(w_wb_adr),
    .o_wb_dat(w_wb_dat_w),
    .i_wb_dat(w_wb_dat_r),
    .o_wb_we(w_wb_we),
    .o_wb_stb(w_wb_stb),
    .o_wb_cyc(w_wb_cyc),
    .i_wb_ack(w_wb_ack)
`else
    // I2C wishbone
    .o_wb_adr(),
    .o_wb_dat(),
    .i_wb_dat(32'h0),
    .o_wb_we(),
    .o_wb_stb(),
    .o_wb_cyc(),
    .i_wb_ack(1'b1)
`endif
);

// System controller
fm_sys u_sys (
    .clk_core(clk_core),
    .rst_x(rst_x),
    // internal interface
    .i_req(w_req_sys),
    .i_wr(w_wr_wr_s3),
    .i_adrs(w_wr_adrs_s3),
    .o_ack(w_ack_sys),
    .i_be(w_wr_be_s3),
    .i_wd(w_wr_wdata_s3),
    .o_rstr(w_rstr_sys),
    .o_rd(w_rdata_sys),
    // configuration output
    //   Video controller
    .o_video_start(w_video_start),
    .o_aa_en(w_aa_en),
    .o_fb0_offset(w_fb0_offset),
    .o_fb0_ms_offset(w_fb0_ms_offset),
    .o_fb1_offset(w_fb1_offset),
    .o_fb1_ms_offset(w_fb1_ms_offset),
    .o_color_mode(w_color_mode),
    .o_front_buffer(w_front_buffer),
    .o_fb_blend_en(w_fb_blend_en),
    // vint
    .i_vint_x(w_vint_x),
    .i_vint_edge(w_vint_edge),
    // vertex dma int
    .i_vtx_int(w_vtx_dma),
    // int out
    .o_int_x(w_vtx_int),
    // DMA
    .o_dma_start(w_dma_start),
    .o_dma_mode(w_dma_mode),
    .i_dma_end(w_dma_end),
    .o_dma_top_address0(w_dma_top_address0),
    .o_dma_top_address1(w_dma_top_address1),
    .o_dma_top_address2(w_dma_top_address2),
    .o_dma_top_address3(w_dma_top_address3),
    .o_dma_length(w_dma_length),
    .o_dma_be(w_dma_be),
    .o_dma_wd0(w_dma_wd0),
    .o_dma_wd1(w_dma_wd1),
    // AXI Master configuration
    .o_conf_arcache_m(w_conf_arcache_m),
    .o_conf_aruser_m(w_conf_aruser_m),
    .o_conf_awcache_m(w_conf_awcache_m),
    .o_conf_awuser_m(w_conf_awuser_m)
`ifdef USE_AXI_MONITOR
// result out
  ,
  .o_stop_trigger(w_stop_trigger),
  .i_bukets_no_wait_aw(w_bukets_no_wait_aw),
  .i_bukets_0_aw(w_bukets_0_aw),
  .i_bukets_1_aw(w_bukets_1_aw),
  .i_bukets_2_aw(w_bukets_2_aw),
  .i_bukets_3_aw(w_bukets_3_aw),
  .i_bukets_more_aw(w_bukets_more_aw),
  .i_max_count_aw(w_max_count_aw),
  .i_min_count_aw(w_min_count_aw),
  .i_bukets_len_0_aw(w_bukets_len_0_aw),
  .i_bukets_len_1_aw(w_bukets_len_1_aw),
  .i_bukets_len_2_aw(w_bukets_len_2_aw),
  .i_bukets_len_3_aw(w_bukets_len_3_aw),
  .i_total_bytes_w(w_total_bytes_w),
  .i_cont_w(w_cont_w),
  .i_discont_w(w_discont_w),
  .i_bukets_nrdy_0_w(w_bukets_nrdy_0_w),
  .i_bukets_nrdy_1_w(w_bukets_nrdy_1_w),
  .i_bukets_nrdy_2_w(w_bukets_nrdy_2_w),
  .i_bukets_nrdy_3_w(w_bukets_nrdy_3_w),
  .i_bukets_no_wait_ar(w_bukets_no_wait_ar),
  .i_bukets_0_ar(w_bukets_0_ar),
  .i_bukets_1_ar(w_bukets_1_ar),
  .i_bukets_2_ar(w_bukets_2_ar),
  .i_bukets_3_ar(w_bukets_3_ar),
  .i_bukets_more_ar(w_bukets_more_ar),
  .i_max_count_ar(w_max_count_ar),
  .i_min_count_ar(w_min_count_ar),
  .i_bukets_len_0_ar(w_bukets_len_0_ar),
  .i_bukets_len_1_ar(w_bukets_len_1_ar),
  .i_bukets_len_2_ar(w_bukets_len_2_ar),
  .i_bukets_len_3_ar(w_bukets_len_3_ar),
  .i_cont_ar(w_cont_ar),
  .i_discont_ar(w_discont_ar),
  .i_bukets_no_wait_b(w_bukets_no_wait_b),
  .i_bukets_0_b(w_bukets_0_b),
  .i_bukets_1_b(w_bukets_1_b),
  .i_bukets_2_b(w_bukets_2_b),
  .i_bukets_3_b(w_bukets_3_b),
  .i_bukets_more_b(w_bukets_more_b),
  .i_num_of_cmd_b(w_num_of_cmd_b),
  .i_num_of_b(w_num_of_b),
  .i_bukets_no_wait_r(w_bukets_no_wait_r),
  .i_bukets_0_r(w_bukets_0_r),
  .i_bukets_1_r(w_bukets_1_r),
  .i_bukets_2_r(w_bukets_2_r),
  .i_bukets_3_r(w_bukets_3_r),
  .i_bukets_more_r(w_bukets_more_r),
  .i_total_bytes_r(w_total_bytes_r),
  .i_rd_cont(w_rd_cont),
  .i_rd_discont(w_rd_discont),
  .i_bukets_nrdy_0_r(w_bukets_nrdy_0_r),
  .i_bukets_nrdy_1_r(w_bukets_nrdy_1_r),
  .i_bukets_nrdy_2_r(w_bukets_nrdy_2_r),
  .i_bukets_nrdy_3_r(w_bukets_nrdy_3_r)
`endif
);

// DMAC
fm_dma u_dma (
    .clk_core(clk_core),
    .rst_x(rst_x),
    // DMA
    .i_dma_start(w_dma_start),
    .i_dma_mode(w_dma_mode),
    .o_dma_end(w_dma_end),
    .i_dma_top_address0(w_dma_top_address0),
    .i_dma_top_address1(w_dma_top_address1),
    .i_dma_top_address2(w_dma_top_address2),
    .i_dma_top_address3(w_dma_top_address3),
    .i_dma_length(w_dma_length),
    .i_dma_be(w_dma_be),
    .i_dma_wd0(w_dma_wd0),
    .i_dma_wd1(w_dma_wd1),
    // memory access
    .o_req_mem(w_req_mem),
    .o_wr_mem(w_wr_mem),
    .o_adrs_mem(w_adrs_mem),
    .o_len_mem(w_len_mem),
    .i_ack_mem(w_ack_mem),
    .o_strw_mem(w_strw_mem),
    .o_be_mem(w_be_mem),
    .o_wd_mem(w_wd_mem),
    .i_ackw_mem(w_ackw_mem)
);
 
// 3D Graphics Core
fm_3d u_3d (
    .clk_core(clk_core),
    .rst_x(rst_x),
    // debug
    .o_idle(w_idle),
    .o_ff(w_ff),
    .o_fe(w_fe),
    // configuration
    .i_color_mode(w_color_mode),
    // system bus
    .i_req_s(w_req_3d),
    .i_wr_s(w_wr_wr_s3),
    .i_adrs_s(w_wr_adrs_s3),
    .o_ack_s(w_ack_3d),
    .i_len_s(6'd1),
    .i_be_s(w_wr_be_s3),
    .i_dbw_s(w_wr_wdata_s3),
    .o_strr_s(w_rstr_3d),
    .o_dbr_s(w_rdata_3d),
    // vertex dma bus
    .o_vtx_int(w_vtx_dma),
    .o_req_dma(w_req_dma),
    .o_adrs_dma(w_adrs_dma),
    .o_len_dma(w_len_dma),
    .i_ack_dma(w_ack_dma),
    .i_strr_dma(w_strr_dma),
    .i_dbr_dma(w_dbr_dma),
    // memory bus
    .o_req_m(w_wr_req1),
    .o_wr_m(w_wr_wr1),
    .o_adrs_m(w_wr_adrs1),
    .i_ack_m(w_wr_ack1),
    .o_len_m(w_wr_len1),
    .o_be_m(w_wr_be1),
    .o_strw_m(w_wr_wstr1),
    .o_dbw_m(w_wr_wdata1),
    .i_ackw_m(w_wr_wack1),
    .i_strr_m(w_wr_rstr1),
    .i_dbr_m(w_wr_rdata1)
);

// Memory interconnect
fm_mic u_mic (
    .clk_core(clk_core),
    .rst_x(rst_x),
    // write/read port 0 (vertex fetch)
    .i_wr_req0(w_req_dma),
    .i_wr_wr0(1'b0),
    .i_wr_adrs0(w_adrs_dma),
    .i_wr_len0(w_len_dma),
    .o_wr_ack0(w_ack_dma),
    .i_wr_wstr0(1'b0),
    .i_wr_be0({P_IB_BE_WIDTH{1'b0}}),
    .i_wr_wdata0({P_IB_DATA_WIDTH{1'b0}}),
    .o_wr_wack0(),
    .o_wr_rstr0(w_strr_dma),
    .o_wr_rdata0(w_dbr_dma),
    // read/write port 1 (3D read/write)
    .i_wr_req1(w_wr_req1),
    .i_wr_wr1(w_wr_wr1),
    .i_wr_adrs1(w_wr_adrs1),
    .i_wr_len1(w_wr_len1),
    .o_wr_ack1(w_wr_ack1),
    .i_wr_wstr1(w_wr_wstr1),
    .i_wr_be1(w_wr_be1),
    .i_wr_wdata1(w_wr_wdata1),
    .o_wr_wack1(w_wr_wack1),
    .o_wr_rstr1(w_wr_rstr1),
    .o_wr_rdata1(w_wr_rdata1),
    // read port 2 (ctr controller)
    .i_r_req2(w_r_req2),
    .i_r_adrs2(w_r_adrs2),
    .i_r_len2(w_r_len2),
    .o_r_ack2(w_r_ack2),
    .o_r_rstr2(w_r_rstr2),
    .o_r_rdata2(w_r_rdata2),
    // write port 3 (DMA write)
    .i_wr_req3(w_req_mem),
    .i_wr_adrs3(w_adrs_mem),
    .i_wr_len3(w_len_mem),
    .o_wr_ack3(w_ack_mem),
    .i_wr_wstr3(w_strw_mem),
    .i_wr_be3(w_be_mem),
    .i_wr_wdata3(w_wd_mem),
    .o_wr_wack3(w_ackw_mem),
    // DIMM Bridge Interface
    .o_brg_req(w_brg_req),
    .o_brg_wr(w_brg_wr),
    .o_brg_id(w_brg_id),
    .o_brg_adrs(w_brg_adrs),
    .o_brg_len(w_brg_len),
    .i_brg_ack(w_brg_ack),
    .o_brg_wstr(w_brg_wstr),
    .o_brg_be(w_brg_be),
    .o_brg_wdata(w_brg_wdata),
    .i_brg_wack(w_brg_wack),
    .i_brg_rstr(w_brg_rstr),
    .i_brg_rlast(w_brg_rlast),
    .i_brg_rid(w_brg_rid),
    .i_brg_rdata(w_brg_rdata)
);

// AXI master bridge
fm_axi_m u_axi_m (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // debug
  .i_vtx_int(~w_vtx_int),
  // AXI Master configuration
  .i_conf_arcache_m(w_conf_arcache_m),
  .i_conf_aruser_m(w_conf_aruser_m),
  .i_conf_awcache_m(w_conf_awcache_m),
  .i_conf_awuser_m(w_conf_awuser_m),
  // Local Memory Range
  .i_brg_req(w_brg_req),
  .i_brg_adrs(w_brg_adrs),
  .i_brg_rw(w_brg_wr),
  .i_brg_id(w_brg_id),
  .i_brg_len(w_brg_len),
  .o_brg_ack(w_brg_ack),
  .i_brg_wdvalid(w_brg_wstr),
  .i_brg_be(w_brg_be),
  .i_brg_wdata(w_brg_wdata),
  .o_brg_wack(w_brg_wack),
  .o_brg_rdvalid(w_brg_rstr),
  .o_brg_rlast(w_brg_rlast),
  .o_brg_rid(w_brg_rid),
  .o_brg_rdata(w_brg_rdata),
  .o_init_done(w_init_done),
  // AXI write port
  .o_awid_m(o_awid_m),
  .o_awaddr_m(o_awaddr_m),
  .o_awlen_m(o_awlen_m),
  .o_awsize_m(o_awsize_m),
  .o_awburst_m(o_awburst_m),
  .o_awlock_m(o_awlock_m),
  .o_awcache_m(o_awcache_m),
  .o_awuser_m(o_awuser_m),
  .o_awprot_m(o_awprot_m),
  .o_awvalid_m(o_awvalid_m),
  .i_awready_m(i_awready_m),
  .o_wid_m(o_wid_m),
  .o_wdata_m(o_wdata_m),
  .o_wstrb_m(o_wstrb_m),
  .o_wlast_m(o_wlast_m),
  .o_wvalid_m(o_wvalid_m),
  .i_wready_m(i_wready_m),
  .i_bid_m(i_bid_m),
  .i_bresp_m(i_bresp_m),
  .i_bvalid_m(i_bvalid_m),
  .o_bready_m(o_bready_m),
  // AXI read port
  .o_arid_m(o_arid_m),
  .o_araddr_m(o_araddr_m),
  .o_arlen_m(o_arlen_m),
  .o_arsize_m(o_arsize_m),
  .o_arburst_m(o_arburst_m),
  .o_arlock_m(o_arlock_m),
  .o_arcache_m(o_arcache_m),
  .o_aruser_m(o_aruser_m),
  .o_arprot_m(o_arprot_m),
  .o_arvalid_m(o_arvalid_m),
  .i_arready_m(i_arready_m),
  .i_rid_m(i_rid_m),
  .i_rdata_m(i_rdata_m),
  .i_rresp_m(i_rresp_m),
  .i_rlast_m(i_rlast_m),
  .i_rvalid_m(i_rvalid_m),
  .o_rready_m(o_rready_m)
`ifdef USE_AXI_MONITOR
// result out
  ,
  .i_stop_trigger(w_stop_trigger),
  .o_bukets_no_wait_aw(w_bukets_no_wait_aw),
  .o_bukets_0_aw(w_bukets_0_aw),
  .o_bukets_1_aw(w_bukets_1_aw),
  .o_bukets_2_aw(w_bukets_2_aw),
  .o_bukets_3_aw(w_bukets_3_aw),
  .o_bukets_more_aw(w_bukets_more_aw),
  .o_max_count_aw(w_max_count_aw),
  .o_min_count_aw(w_min_count_aw),
  .o_bukets_len_0_aw(w_bukets_len_0_aw),
  .o_bukets_len_1_aw(w_bukets_len_1_aw),
  .o_bukets_len_2_aw(w_bukets_len_2_aw),
  .o_bukets_len_3_aw(w_bukets_len_3_aw),
  .o_total_bytes_w(w_total_bytes_w),
  .o_cont_w(w_cont_w),
  .o_discont_w(w_discont_w),
  .o_bukets_nrdy_0_w(w_bukets_nrdy_0_w),
  .o_bukets_nrdy_1_w(w_bukets_nrdy_1_w),
  .o_bukets_nrdy_2_w(w_bukets_nrdy_2_w),
  .o_bukets_nrdy_3_w(w_bukets_nrdy_3_w),
  .o_bukets_no_wait_ar(w_bukets_no_wait_ar),
  .o_bukets_0_ar(w_bukets_0_ar),
  .o_bukets_1_ar(w_bukets_1_ar),
  .o_bukets_2_ar(w_bukets_2_ar),
  .o_bukets_3_ar(w_bukets_3_ar),
  .o_bukets_more_ar(w_bukets_more_ar),
  .o_max_count_ar(w_max_count_ar),
  .o_min_count_ar(w_min_count_ar),
  .o_bukets_len_0_ar(w_bukets_len_0_ar),
  .o_bukets_len_1_ar(w_bukets_len_1_ar),
  .o_bukets_len_2_ar(w_bukets_len_2_ar),
  .o_bukets_len_3_ar(w_bukets_len_3_ar),
  .o_cont_ar(w_cont_ar),
  .o_discont_ar(w_discont_ar),
  .o_bukets_no_wait_b(w_bukets_no_wait_b),
  .o_bukets_0_b(w_bukets_0_b),
  .o_bukets_1_b(w_bukets_1_b),
  .o_bukets_2_b(w_bukets_2_b),
  .o_bukets_3_b(w_bukets_3_b),
  .o_bukets_more_b(w_bukets_more_b),
  .o_num_of_cmd_b(w_num_of_cmd_b),
  .o_num_of_b(w_num_of_b),
  .o_bukets_no_wait_r(w_bukets_no_wait_r),
  .o_bukets_0_r(w_bukets_0_r),
  .o_bukets_1_r(w_bukets_1_r),
  .o_bukets_2_r(w_bukets_2_r),
  .o_bukets_3_r(w_bukets_3_r),
  .o_bukets_more_r(w_bukets_more_r),
  .o_total_bytes_r(w_total_bytes_r),
  .o_rd_cont(w_rd_cont),
  .o_rd_discont(w_rd_discont),
  .o_bukets_nrdy_0_r(w_bukets_nrdy_0_r),
  .o_bukets_nrdy_1_r(w_bukets_nrdy_1_r),
  .o_bukets_nrdy_2_r(w_bukets_nrdy_2_r),
  .o_bukets_nrdy_3_r(w_bukets_nrdy_3_r)
`endif
);
   
// Video controller
fm_hvc u_hvc (
    .clk_core(clk_core),
    .clk_vi(clk_v),
    .rst_x(rst_x),
    // debug
    .o_debug(o_debug),
    // configuration registers
    .i_video_start(w_video_start),
    .i_fb0_offset(w_fb0_offset),
    .i_fb0_ms_offset(w_fb0_ms_offset),
    .i_fb1_offset(w_fb1_offset),
    .i_fb1_ms_offset(w_fb1_ms_offset),
    .i_color_mode(w_color_mode),
    .i_front_buffer(w_front_buffer),
    .i_aa_en(w_aa_en),
    .i_fb_blend_en(w_fb_blend_en),
    // status out
    .o_vint_x(w_vint_x),
    .o_vint_edge(w_vint_edge),
    // dram if
    .o_req(w_r_req2),
    .o_adrs(w_r_adrs2),
    .o_len(w_r_len2),
    .i_ack(w_r_ack2),
    .i_rstr(w_r_rstr2),
    .i_rd(w_r_rdata2),
    // video out
`ifdef PP_HDMI_TEST
    .clk_vo(),
`else
    .clk_vo(clk_vo),
`endif
    .o_r_neg(o_vr),
    .o_g_neg(o_vg),
    .o_b_neg(o_vb),
    .o_vsync_x_neg(o_vsync_x),
    .o_hsync_x_neg(o_hsync_x),
    .o_r(w_vr),
    .o_g(w_vg),
    .o_b(w_vb),
    .o_vsync_x(w_vsync_x),
    .o_hsync_x(w_hsync_x),
    .o_blank_x(w_vde)
);

// HDMI
`ifdef PP_HDMI_TEST
vga_hdmi u_vga_hdmi (
.clk_25(clk_v),
.clk_25_i(clk_v_90),
.vga_r(w_vr),
.vga_g(w_vg),
.vga_b(w_vb),
.vga_hs(w_hsync_x),
.vga_vs(w_vsync_x),
.vga_de(w_vde),

.hdmi_clk(clk_vo),
.hdmi_hsync(o_hd_hsync),
.hdmi_vsync(o_hd_vsync),
.hdmi_d(o_hd_d),
.hdmi_de(o_hd_de),
.hdmi_scl(io_scl),
.hdmi_sda(io_sda)
);
`else
`ifdef PP_USE_HDMI
fm_hdmi u_hdmi (
  .clk_v(clk_v),
  .rst_x(rst_x),
  // video in
  .i_vsync(w_vsync_x),
  .i_hsync(w_hsync_x),
  .i_de(w_vde),
  .i_cr(w_vr),
  .i_cg(w_vg),
  .i_cb(w_vb),
  // video out
  .o_hd_vsync(o_hd_vsync),
  .o_hd_hsync(o_hd_hsync),
  .o_hd_de(o_hd_de),
  .o_hd_d(o_hd_d)
);
`endif
`endif
   
`ifdef PP_USE_HDMI
// I2C for HDMI
i2c_master_top u_i2c_master_top (
  .wb_clk_i(clk_core),
  .wb_rst_i(1'b0),
  .arst_i(rst_x),
  .wb_adr_i(w_wb_adr),
  .wb_dat_i(w_wb_dat_w),
  .wb_dat_o(w_wb_dat_r),
  .wb_we_i(w_wb_we),
  .wb_stb_i(w_wb_stb),
  .wb_cyc_i(w_wb_cyc),
  .wb_ack_o(w_wb_ack),
  .wb_inta_o(),
  .scl_pad_i(w_scl_pad_i),
  .scl_pad_o(w_scl_pad_o),
  .scl_padoen_o(w_scl_padoen_o),
  .sda_pad_i(w_sda_pad_i),
  .sda_pad_o(w_sda_pad_o),
  .sda_padoen_o(w_sda_padoen_o)
);
`endif

`ifdef PP_HDMI_TEST
`else
`ifdef PP_USE_HDMI
assign io_scl = (w_scl_padoen_o) ? 'hz : w_scl_pad_o;
assign w_scl_pad_i = io_scl;
assign io_sda = (w_sda_padoen_o) ? 'hz : w_sda_pad_o;
assign w_sda_pad_i = io_sda;
`endif
`endif

endmodule
