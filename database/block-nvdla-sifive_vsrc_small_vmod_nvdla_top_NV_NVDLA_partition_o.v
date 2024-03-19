// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_partition_o.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_define.h
///////////////////////////////////////////////////
//
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CSC.h
    //entry bits
    //atomC
    //in bytes, entry/8
    //CSC_ENTRY_HEX/2
    //CSC_ENTRY_HEX/4
    //CSC_ENTRY_HEX-1
    //atomK
    //atomK
    //atomK*2
    `define CC_ATOMC_DIV_ATOMK_EQUAL_1
//image stripe keep 2*atomK
//batch keep 1
module NV_NVDLA_partition_o (
   test_mode
  ,direct_reset_
  ,global_clk_ovr_on
  ,tmc2slcg_disable_clock_gating
  ,cdma2csb_resp_valid
  ,cdma2csb_resp_pd
  ,cdma_dat2glb_done_intr_pd
  ,cdma_dat2mcif_rd_req_valid
  ,cdma_dat2mcif_rd_req_ready
  ,cdma_dat2mcif_rd_req_pd
  ,cdma_wt2glb_done_intr_pd
  ,cdma_wt2mcif_rd_req_valid
  ,cdma_wt2mcif_rd_req_ready
  ,cdma_wt2mcif_rd_req_pd
  ,cmac_a2csb_resp_valid
  ,cmac_a2csb_resp_pd
  ,csb2cmac_a_req_pvld
  ,csb2cmac_a_req_prdy
  ,csb2cmac_a_req_pd
  ,cmac_b2csb_resp_valid
  ,cmac_b2csb_resp_pd
  ,csb2cmac_b_req_pvld
  ,csb2cmac_b_req_prdy
  ,csb2cmac_b_req_pd
  ,cacc2csb_resp_valid
  ,cacc2csb_resp_pd
  ,cacc2glb_done_intr_pd
  ,csb2cacc_req_pvld
  ,csb2cacc_req_prdy
  ,csb2cacc_req_pd
  ,csb2cdma_req_pvld
  ,csb2cdma_req_prdy
  ,csb2cdma_req_pd
  ,csb2csc_req_pvld
  ,csb2csc_req_prdy
  ,csb2csc_req_pd
  ,csb2nvdla_valid
  ,csb2nvdla_ready
  ,csb2nvdla_addr
  ,csb2nvdla_wdat
  ,csb2nvdla_write
  ,csb2nvdla_nposted
  ,csb2sdp_rdma_req_pvld
  ,csb2sdp_rdma_req_prdy
  ,csb2sdp_rdma_req_pd
  ,csb2sdp_req_pvld
  ,csb2sdp_req_prdy
  ,csb2sdp_req_pd
  ,csc2csb_resp_valid
  ,csc2csb_resp_pd
  ,mcif2cdma_dat_rd_rsp_valid
  ,mcif2cdma_dat_rd_rsp_ready
  ,mcif2cdma_dat_rd_rsp_pd
  ,mcif2cdma_wt_rd_rsp_valid
  ,mcif2cdma_wt_rd_rsp_ready
  ,mcif2cdma_wt_rd_rsp_pd
  ,mcif2noc_axi_ar_arvalid
  ,mcif2noc_axi_ar_arready
  ,mcif2noc_axi_ar_arid
  ,mcif2noc_axi_ar_arlen
  ,mcif2noc_axi_ar_araddr
  ,mcif2noc_axi_aw_awvalid
  ,mcif2noc_axi_aw_awready
  ,mcif2noc_axi_aw_awid
  ,mcif2noc_axi_aw_awlen
  ,mcif2noc_axi_aw_awaddr
  ,mcif2noc_axi_w_wvalid
  ,mcif2noc_axi_w_wready
  ,mcif2noc_axi_w_wdata
  ,mcif2noc_axi_w_wstrb
  ,mcif2noc_axi_w_wlast
  ,mcif2sdp_b_rd_rsp_valid
  ,mcif2sdp_b_rd_rsp_ready
  ,mcif2sdp_b_rd_rsp_pd
  ,sdp_b2mcif_rd_cdt_lat_fifo_pop
  ,sdp_b2mcif_rd_req_valid
  ,sdp_b2mcif_rd_req_ready
  ,sdp_b2mcif_rd_req_pd
  ,mcif2sdp_n_rd_rsp_valid
  ,mcif2sdp_n_rd_rsp_ready
  ,mcif2sdp_n_rd_rsp_pd
  ,sdp_n2mcif_rd_cdt_lat_fifo_pop
  ,sdp_n2mcif_rd_req_valid
  ,sdp_n2mcif_rd_req_ready
  ,sdp_n2mcif_rd_req_pd
  ,mcif2sdp_rd_rsp_valid
  ,mcif2sdp_rd_rsp_ready
  ,mcif2sdp_rd_rsp_pd
  ,mcif2sdp_wr_rsp_complete
  ,noc2mcif_axi_b_bvalid
  ,noc2mcif_axi_b_bready
  ,noc2mcif_axi_b_bid
  ,noc2mcif_axi_r_rvalid
  ,noc2mcif_axi_r_rready
  ,noc2mcif_axi_r_rid
  ,noc2mcif_axi_r_rlast
  ,noc2mcif_axi_r_rdata
  ,nvdla2csb_valid
  ,nvdla2csb_data
  ,nvdla2csb_wr_complete
  ,core_intr
  ,pwrbus_ram_pd
  ,sdp2csb_resp_valid
  ,sdp2csb_resp_pd
  ,sdp2glb_done_intr_pd
  ,sdp2mcif_rd_cdt_lat_fifo_pop
  ,sdp2mcif_rd_req_valid
  ,sdp2mcif_rd_req_ready
  ,sdp2mcif_rd_req_pd
  ,sdp2mcif_wr_req_valid
  ,sdp2mcif_wr_req_ready
  ,sdp2mcif_wr_req_pd
  ,sdp2pdp_valid
  ,sdp2pdp_ready
  ,sdp2pdp_pd
  ,sdp_rdma2csb_resp_valid
  ,sdp_rdma2csb_resp_pd
  ,nvdla_core_clk
  ,dla_reset_rstn
  ,nvdla_core_rstn
  ,nvdla_falcon_clk
  ,nvdla_clk_ovr_on
  );
//
// NV_NVDLA_partition_o_io.v
//
////////////////////////////////////////////////////////////////////
input test_mode;
input direct_reset_;
input global_clk_ovr_on;
input tmc2slcg_disable_clock_gating;
input cdma2csb_resp_valid; /* data valid */
input [33:0] cdma2csb_resp_pd; /* pkt_id_width=1 pkt_widths=33,33  */
input [1:0] cdma_dat2glb_done_intr_pd;
input [1:0] cdma_wt2glb_done_intr_pd;
input cmac_a2csb_resp_valid; /* data valid */
input [33:0] cmac_a2csb_resp_pd; /* pkt_id_width=1 pkt_widths=33,33  */
output csb2cmac_a_req_pvld; /* data valid */
input csb2cmac_a_req_prdy; /* data return handshake */
output [62:0] csb2cmac_a_req_pd;
input cmac_b2csb_resp_valid; /* data valid */
input [33:0] cmac_b2csb_resp_pd; /* pkt_id_width=1 pkt_widths=33,33  */
output csb2cmac_b_req_pvld; /* data valid */
input csb2cmac_b_req_prdy; /* data return handshake */
output [62:0] csb2cmac_b_req_pd;
input cacc2csb_resp_valid; /* data valid */
input [33:0] cacc2csb_resp_pd; /* pkt_id_width=1 pkt_widths=33,33  */
input [1:0] cacc2glb_done_intr_pd;
output csb2cacc_req_pvld; /* data valid */
input csb2cacc_req_prdy; /* data return handshake */
output [62:0] csb2cacc_req_pd;
output csb2cdma_req_pvld; /* data valid */
input csb2cdma_req_prdy; /* data return handshake */
output [62:0] csb2cdma_req_pd;
output csb2csc_req_pvld; /* data valid */
input csb2csc_req_prdy; /* data return handshake */
output [62:0] csb2csc_req_pd;
input csc2csb_resp_valid; /* data valid */
input [33:0] csc2csb_resp_pd; /* pkt_id_width=1 pkt_widths=33,33  */
input csb2nvdla_valid; /* data valid */
output csb2nvdla_ready; /* data return handshake */
input [15:0] csb2nvdla_addr;
input [31:0] csb2nvdla_wdat;
input csb2nvdla_write;
input csb2nvdla_nposted;
output csb2sdp_rdma_req_pvld; /* data valid */
input csb2sdp_rdma_req_prdy; /* data return handshake */
output [62:0] csb2sdp_rdma_req_pd;
output csb2sdp_req_pvld; /* data valid */
input csb2sdp_req_prdy; /* data return handshake */
output [62:0] csb2sdp_req_pd;
output mcif2noc_axi_ar_arvalid;
input mcif2noc_axi_ar_arready;
output [7:0] mcif2noc_axi_ar_arid;
output [3:0] mcif2noc_axi_ar_arlen;
output [32 -1:0] mcif2noc_axi_ar_araddr;
output mcif2noc_axi_aw_awvalid;
input mcif2noc_axi_aw_awready;
output [7:0] mcif2noc_axi_aw_awid;
output [3:0] mcif2noc_axi_aw_awlen;
output [32 -1:0] mcif2noc_axi_aw_awaddr;
output mcif2noc_axi_w_wvalid;
input mcif2noc_axi_w_wready;
output [64 -1:0] mcif2noc_axi_w_wdata;
output [64/8-1:0] mcif2noc_axi_w_wstrb;
output mcif2noc_axi_w_wlast;
input noc2mcif_axi_b_bvalid;
output noc2mcif_axi_b_bready;
input [7:0] noc2mcif_axi_b_bid;
input noc2mcif_axi_r_rvalid;
output noc2mcif_axi_r_rready;
input [7:0] noc2mcif_axi_r_rid;
input noc2mcif_axi_r_rlast;
input [64 -1:0] noc2mcif_axi_r_rdata;
input cdma_dat2mcif_rd_req_valid;
output cdma_dat2mcif_rd_req_ready;
input [32 +14:0] cdma_dat2mcif_rd_req_pd;
input cdma_wt2mcif_rd_req_valid;
output cdma_wt2mcif_rd_req_ready;
input [32 +14:0] cdma_wt2mcif_rd_req_pd;
output mcif2cdma_dat_rd_rsp_valid;
input mcif2cdma_dat_rd_rsp_ready;
output [64 +(64/8/8)-1:0] mcif2cdma_dat_rd_rsp_pd;
output mcif2cdma_wt_rd_rsp_valid;
input mcif2cdma_wt_rd_rsp_ready;
output [64 +(64/8/8)-1:0] mcif2cdma_wt_rd_rsp_pd;
output mcif2sdp_b_rd_rsp_valid;
input mcif2sdp_b_rd_rsp_ready;
output [64 +(64/8/8)-1:0] mcif2sdp_b_rd_rsp_pd;
input sdp_b2mcif_rd_cdt_lat_fifo_pop;
input sdp_b2mcif_rd_req_valid;
output sdp_b2mcif_rd_req_ready;
input [32 +14:0] sdp_b2mcif_rd_req_pd;
output mcif2sdp_n_rd_rsp_valid;
input mcif2sdp_n_rd_rsp_ready;
output [64 +(64/8/8)-1:0] mcif2sdp_n_rd_rsp_pd;
input sdp_n2mcif_rd_cdt_lat_fifo_pop;
input sdp_n2mcif_rd_req_valid;
output sdp_n2mcif_rd_req_ready;
input [32 +14:0] sdp_n2mcif_rd_req_pd;
input sdp2mcif_rd_cdt_lat_fifo_pop;
input sdp2mcif_rd_req_valid;
output sdp2mcif_rd_req_ready;
input [32 +14:0] sdp2mcif_rd_req_pd;
output mcif2sdp_rd_rsp_valid;
input mcif2sdp_rd_rsp_ready;
output [64 +(64/8/8)-1:0] mcif2sdp_rd_rsp_pd;
output mcif2sdp_wr_rsp_complete;
input sdp2mcif_wr_req_valid;
output sdp2mcif_wr_req_ready;
input [64 +(64/8/8):0] sdp2mcif_wr_req_pd;
output nvdla2csb_valid; /* data valid */
output [31:0] nvdla2csb_data;
output nvdla2csb_wr_complete;
output core_intr;
input [31:0] pwrbus_ram_pd;
input sdp2csb_resp_valid; /* data valid */
input [33:0] sdp2csb_resp_pd; /* pkt_id_width=1 pkt_widths=33,33  */
input [1:0] sdp2glb_done_intr_pd;
input sdp2pdp_valid;
output sdp2pdp_ready;
input [8*1 -1:0] sdp2pdp_pd;
input sdp_rdma2csb_resp_valid; /* data valid */
input [33:0] sdp_rdma2csb_resp_pd; /* pkt_id_width=1 pkt_widths=33,33  */
input nvdla_core_clk;
input dla_reset_rstn;
output nvdla_core_rstn;
input nvdla_falcon_clk;
output nvdla_clk_ovr_on;
/////////////////////////////////////////////////////////
wire [62:0] csb2cfgrom_req_pd;
wire csb2cfgrom_req_pvld;
wire csb2cfgrom_req_prdy;
wire [33:0] cfgrom2csb_resp_pd;
wire cfgrom2csb_resp_valid;
wire [33:0] bdma2csb_resp_pd;
wire bdma2csb_resp_valid;
wire bdma2cvif_rd_cdt_lat_fifo_pop;
wire cdp2cvif_rd_cdt_lat_fifo_pop;
wire pdp2cvif_rd_cdt_lat_fifo_pop;
wire rbk2cvif_rd_cdt_lat_fifo_pop;
wire sdp2cvif_rd_cdt_lat_fifo_pop;
wire sdp_n2cvif_rd_cdt_lat_fifo_pop;
wire sdp_e2cvif_rd_cdt_lat_fifo_pop;
wire sdp_b2cvif_rd_cdt_lat_fifo_pop;
wire bdma2mcif_rd_cdt_lat_fifo_pop;
wire cdp2mcif_rd_cdt_lat_fifo_pop;
wire pdp2mcif_rd_cdt_lat_fifo_pop;
wire rbk2mcif_rd_cdt_lat_fifo_pop;
wire sdp2mcif_rd_cdt_lat_fifo_pop;
wire sdp_n2mcif_rd_cdt_lat_fifo_pop;
wire sdp_e2mcif_rd_cdt_lat_fifo_pop;
wire sdp_b2mcif_rd_cdt_lat_fifo_pop;
wire cdma_wt2cvif_rd_cdt_lat_fifo_pop;
wire cdma_wt2mcif_rd_cdt_lat_fifo_pop;
wire cdma_dat2cvif_rd_cdt_lat_fifo_pop;
wire cdma_dat2mcif_rd_cdt_lat_fifo_pop;
wire [1:0] bdma2glb_done_intr_pd;
wire [32 +14:0] bdma2mcif_rd_req_pd;
wire bdma2mcif_rd_req_ready;
wire bdma2mcif_rd_req_valid;
wire [64 +(64/8/8):0] bdma2mcif_wr_req_pd;
wire bdma2mcif_wr_req_ready;
wire bdma2mcif_wr_req_valid;
wire [33:0] cdp2csb_resp_pd;
wire cdp2csb_resp_valid;
wire [1:0] cdp2glb_done_intr_pd;
wire [32 +14:0] cdp2mcif_rd_req_pd;
wire cdp2mcif_rd_req_ready;
wire cdp2mcif_rd_req_valid;
wire [64 +(64/8/8):0] cdp2mcif_wr_req_pd;
wire cdp2mcif_wr_req_ready;
wire cdp2mcif_wr_req_valid;
wire [33:0] cdp_rdma2csb_resp_pd;
wire cdp_rdma2csb_resp_valid;
wire [62:0] csb2bdma_req_pd;
wire csb2bdma_req_prdy;
wire csb2bdma_req_pvld;
wire [62:0] csb2cdp_rdma_req_pd;
wire csb2cdp_rdma_req_prdy;
wire csb2cdp_rdma_req_pvld;
wire [62:0] csb2cdp_req_pd;
wire csb2cdp_req_prdy;
wire csb2cdp_req_pvld;
wire [62:0] csb2glb_req_pd;
wire csb2glb_req_prdy;
wire csb2glb_req_pvld;
wire [62:0] csb2mcif_req_pd;
wire csb2mcif_req_prdy;
wire csb2mcif_req_pvld;
wire [62:0] csb2pdp_rdma_req_pd;
wire csb2pdp_rdma_req_prdy;
wire csb2pdp_rdma_req_pvld;
wire [62:0] csb2pdp_req_pd;
wire csb2pdp_req_prdy;
wire csb2pdp_req_pvld;
wire [62:0] csb2rbk_req_pd;
wire csb2rbk_req_prdy;
wire csb2rbk_req_pvld;
wire dla_clk_ovr_on_sync;
wire [33:0] glb2csb_resp_pd;
wire glb2csb_resp_valid;
wire global_clk_ovr_on_sync;
wire [64 +(64/8/8)-1:0] mcif2bdma_rd_rsp_pd;
wire mcif2bdma_rd_rsp_ready;
wire mcif2bdma_rd_rsp_valid;
wire mcif2bdma_wr_rsp_complete;
wire [64 +(64/8/8)-1:0] mcif2cdp_rd_rsp_pd;
wire mcif2cdp_rd_rsp_ready;
wire mcif2cdp_rd_rsp_valid;
wire mcif2cdp_wr_rsp_complete;
wire [33:0] mcif2csb_resp_pd;
wire mcif2csb_resp_valid;
wire [64 +(64/8/8)-1:0] mcif2pdp_rd_rsp_pd;
wire mcif2pdp_rd_rsp_ready;
wire mcif2pdp_rd_rsp_valid;
wire mcif2pdp_wr_rsp_complete;
wire [64 +(64/8/8)-1:0] mcif2rbk_rd_rsp_pd;
wire mcif2rbk_rd_rsp_ready;
wire mcif2rbk_rd_rsp_valid;
wire mcif2rbk_wr_rsp_complete;
wire nvdla_falcon_rstn;
wire [33:0] pdp2csb_resp_pd;
wire pdp2csb_resp_valid;
wire [1:0] pdp2glb_done_intr_pd;
wire [32 +14:0] pdp2mcif_rd_req_pd;
wire pdp2mcif_rd_req_ready;
wire pdp2mcif_rd_req_valid;
wire [64 +(64/8/8):0] pdp2mcif_wr_req_pd;
wire pdp2mcif_wr_req_ready;
wire pdp2mcif_wr_req_valid;
wire [33:0] pdp_rdma2csb_resp_pd;
wire pdp_rdma2csb_resp_valid;
wire [33:0] rbk2csb_resp_pd;
wire rbk2csb_resp_valid;
wire [32 +14:0] rbk2mcif_rd_req_pd;
wire rbk2mcif_rd_req_ready;
wire rbk2mcif_rd_req_valid;
wire [64 +(64/8/8):0] rbk2mcif_wr_req_pd;
wire rbk2mcif_wr_req_ready;
wire rbk2mcif_wr_req_valid;
wire [1:0] rubik2glb_done_intr_pd;
//
assign nvdla_clk_ovr_on = 0;
////////////////////////////////////////////////////////////////////////
// NVDLA Partition O: Reset Syncer for nvdla_core_clk //
////////////////////////////////////////////////////////////////////////
NV_NVDLA_core_reset u_sync_core_reset (
   .dla_reset_rstn (dla_reset_rstn)
  ,.direct_reset_ (direct_reset_)
  ,.test_mode (test_mode)
  ,.synced_rstn (nvdla_core_rstn)
  ,.core_reset_rstn (1'b1)
  ,.nvdla_clk (nvdla_core_clk)
  );
////////////////////////////////////////////////////////////////////////
// NVDLA Partition O: Reset Syncer for nvdla_falcon_clk //
////////////////////////////////////////////////////////////////////////
NV_NVDLA_reset u_sync_falcon_reset (
   .dla_reset_rstn (nvdla_core_rstn)
  ,.direct_reset_ (direct_reset_)
  ,.test_mode (test_mode)
  ,.synced_rstn (nvdla_falcon_rstn)
  ,.nvdla_clk (nvdla_falcon_clk)
  );
////////////////////////////////////////////////////////////////////////
// SLCG override
////////////////////////////////////////////////////////////////////////
NV_NVDLA_sync3d u_dla_clk_ovr_on_core_sync (
   .clk (nvdla_core_clk)
  ,.sync_i (nvdla_clk_ovr_on)
  ,.sync_o (dla_clk_ovr_on_sync)
  );
NV_NVDLA_sync3d_s u_global_clk_ovr_on_core_sync (
   .clk (nvdla_core_clk)
  ,.prst (nvdla_core_rstn)
  ,.sync_i (global_clk_ovr_on)
  ,.sync_o (global_clk_ovr_on_sync)
  );
////////////////////////////////////////////////////////////////////////
// NVDLA Partition O: CFGROM //
////////////////////////////////////////////////////////////////////////
NV_NVDLA_cfgrom u_NV_NVDLA_cfgrom(
  .nvdla_core_clk (nvdla_core_clk )
 ,.nvdla_core_rstn (nvdla_core_rstn )
 ,.csb2cfgrom_req_pd (csb2cfgrom_req_pd )
 ,.csb2cfgrom_req_pvld (csb2cfgrom_req_pvld )
 ,.csb2cfgrom_req_prdy (csb2cfgrom_req_prdy )
 ,.cfgrom2csb_resp_pd (cfgrom2csb_resp_pd )
 ,.cfgrom2csb_resp_valid (cfgrom2csb_resp_valid )
  );
////////////////////////////////////////////////////////////////////////
// NVDLA Partition O: CSB master //
////////////////////////////////////////////////////////////////////////
NV_NVDLA_csb_master u_NV_NVDLA_csb_master (
   .nvdla_core_clk (nvdla_core_clk)
  ,.nvdla_core_rstn (nvdla_core_rstn)
  ,.nvdla_falcon_clk (nvdla_falcon_clk)
  ,.nvdla_falcon_rstn (nvdla_falcon_rstn)
  ,.pwrbus_ram_pd (pwrbus_ram_pd)
  ,.csb2nvdla_valid (csb2nvdla_valid)
  ,.csb2nvdla_ready (csb2nvdla_ready)
  ,.csb2nvdla_addr (csb2nvdla_addr)
  ,.csb2nvdla_wdat (csb2nvdla_wdat)
  ,.csb2nvdla_write (csb2nvdla_write)
  ,.csb2nvdla_nposted (csb2nvdla_nposted)
  ,.nvdla2csb_valid (nvdla2csb_valid)
  ,.nvdla2csb_data (nvdla2csb_data)
  ,.nvdla2csb_wr_complete (nvdla2csb_wr_complete)
  ,.csb2cfgrom_req_pd (csb2cfgrom_req_pd )
  ,.csb2cfgrom_req_pvld (csb2cfgrom_req_pvld )
  ,.csb2cfgrom_req_prdy (csb2cfgrom_req_prdy )
  ,.cfgrom2csb_resp_pd (cfgrom2csb_resp_pd )
  ,.cfgrom2csb_resp_valid (cfgrom2csb_resp_valid )
  ,.csb2glb_req_pvld (csb2glb_req_pvld)
  ,.csb2glb_req_prdy (csb2glb_req_prdy)
  ,.csb2glb_req_pd (csb2glb_req_pd)
  ,.glb2csb_resp_valid (glb2csb_resp_valid)
  ,.glb2csb_resp_pd (glb2csb_resp_pd)
  ,.csb2mcif_req_pvld (csb2mcif_req_pvld)
  ,.csb2mcif_req_prdy (csb2mcif_req_prdy)
  ,.csb2mcif_req_pd (csb2mcif_req_pd)
  ,.mcif2csb_resp_valid (mcif2csb_resp_valid)
  ,.mcif2csb_resp_pd (mcif2csb_resp_pd)
  ,.csb2cdma_req_pvld (csb2cdma_req_pvld)
  ,.csb2cdma_req_prdy (csb2cdma_req_prdy)
  ,.csb2cdma_req_pd (csb2cdma_req_pd)
  ,.cdma2csb_resp_valid (cdma2csb_resp_valid)
  ,.cdma2csb_resp_pd (cdma2csb_resp_pd)
  ,.csb2csc_req_pvld (csb2csc_req_pvld)
  ,.csb2csc_req_prdy (csb2csc_req_prdy)
  ,.csb2csc_req_pd (csb2csc_req_pd)
  ,.csc2csb_resp_valid (csc2csb_resp_valid)
  ,.csc2csb_resp_pd (csc2csb_resp_pd)
  ,.csb2cmac_a_req_pvld (csb2cmac_a_req_pvld)
  ,.csb2cmac_a_req_prdy (csb2cmac_a_req_prdy)
  ,.csb2cmac_a_req_pd (csb2cmac_a_req_pd)
  ,.cmac_a2csb_resp_valid (cmac_a2csb_resp_valid)
  ,.cmac_a2csb_resp_pd (cmac_a2csb_resp_pd)
  ,.csb2cmac_b_req_pvld (csb2cmac_b_req_pvld)
  ,.csb2cmac_b_req_prdy (csb2cmac_b_req_prdy)
  ,.csb2cmac_b_req_pd (csb2cmac_b_req_pd)
  ,.cmac_b2csb_resp_valid (cmac_b2csb_resp_valid)
  ,.cmac_b2csb_resp_pd (cmac_b2csb_resp_pd)
  ,.csb2cacc_req_pvld (csb2cacc_req_pvld)
  ,.csb2cacc_req_prdy (csb2cacc_req_prdy)
  ,.csb2cacc_req_pd (csb2cacc_req_pd)
  ,.cacc2csb_resp_valid (cacc2csb_resp_valid)
  ,.cacc2csb_resp_pd (cacc2csb_resp_pd)
  ,.csb2sdp_rdma_req_pvld (csb2sdp_rdma_req_pvld)
  ,.csb2sdp_rdma_req_prdy (csb2sdp_rdma_req_prdy)
  ,.csb2sdp_rdma_req_pd (csb2sdp_rdma_req_pd)
  ,.sdp_rdma2csb_resp_valid (sdp_rdma2csb_resp_valid)
  ,.sdp_rdma2csb_resp_pd (sdp_rdma2csb_resp_pd)
  ,.csb2sdp_req_pvld (csb2sdp_req_pvld)
  ,.csb2sdp_req_prdy (csb2sdp_req_prdy)
  ,.csb2sdp_req_pd (csb2sdp_req_pd)
  ,.sdp2csb_resp_valid (sdp2csb_resp_valid)
  ,.sdp2csb_resp_pd (sdp2csb_resp_pd)
  ,.csb2pdp_rdma_req_pvld (csb2pdp_rdma_req_pvld)
  ,.csb2pdp_rdma_req_prdy (csb2pdp_rdma_req_prdy)
  ,.csb2pdp_rdma_req_pd (csb2pdp_rdma_req_pd)
  ,.pdp_rdma2csb_resp_valid (pdp_rdma2csb_resp_valid)
  ,.pdp_rdma2csb_resp_pd (pdp_rdma2csb_resp_pd)
  ,.csb2pdp_req_pvld (csb2pdp_req_pvld)
  ,.csb2pdp_req_prdy (csb2pdp_req_prdy)
  ,.csb2pdp_req_pd (csb2pdp_req_pd)
  ,.pdp2csb_resp_valid (pdp2csb_resp_valid)
  ,.pdp2csb_resp_pd (pdp2csb_resp_pd)
  ,.csb2cdp_rdma_req_pvld (csb2cdp_rdma_req_pvld)
  ,.csb2cdp_rdma_req_prdy (csb2cdp_rdma_req_prdy)
  ,.csb2cdp_rdma_req_pd (csb2cdp_rdma_req_pd)
  ,.cdp_rdma2csb_resp_valid (cdp_rdma2csb_resp_valid)
  ,.cdp_rdma2csb_resp_pd (cdp_rdma2csb_resp_pd)
  ,.csb2cdp_req_pvld (csb2cdp_req_pvld)
  ,.csb2cdp_req_prdy (csb2cdp_req_prdy)
  ,.csb2cdp_req_pd (csb2cdp_req_pd)
  ,.cdp2csb_resp_valid (cdp2csb_resp_valid)
  ,.cdp2csb_resp_pd (cdp2csb_resp_pd)
  );
////////////////////////////////////////////////////////////////////////
// NVDLA Partition O: ASYNC CROSSING INTERFACE //
////////////////////////////////////////////////////////////////////////
//&Instance NV_NVDLA_async;
////////////////////////////////////////////////////////////////////////
// NVDLA Partition O: AXI Interface to MC //
////////////////////////////////////////////////////////////////////////
//:my $i;
//:my $nindex=0;
//: my @dma_index = (0, 1, 1,1, 1,0, 1, 1, 0, 1,0,0,0,0,0,0);
//: my @dma_name = ("bdma","cdma_dat","cdma_wt","cdp","pdp","rbk","sdp","sdp_b","sdp_e","sdp_n");
//: my @lat_fifo_depth = (245,0,0,61,61,80,80,160,80,160,0,0,0,0,0,0);
//: for ($i=0;$i<16;$i++) {
//: if ($dma_index[$i]) {
//: if ($lat_fifo_depth[$i] != 0) {
//: print qq(
//: wire dma_sr_$dma_name[$i]_lat_fifo_pop = $dma_name[$i]2cvif_rd_cdt_lat_fifo_pop;
//: wire dma_dr_$dma_name[$i]_lat_fifo_pop = $dma_name[$i]2mcif_rd_cdt_lat_fifo_pop;
//: );
//: } else {
//: print qq(
//: wire dma_sr_$dma_name[$i]_lat_fifo_pop = 1'b0;
//: wire dma_dr_$dma_name[$i]_lat_fifo_pop = 1'b0;
//: );
//: }
//: $nindex++;
//: }
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire dma_sr_cdma_dat_lat_fifo_pop = 1'b0;
wire dma_dr_cdma_dat_lat_fifo_pop = 1'b0;

wire dma_sr_cdma_wt_lat_fifo_pop = 1'b0;
wire dma_dr_cdma_wt_lat_fifo_pop = 1'b0;

wire dma_sr_cdp_lat_fifo_pop = cdp2cvif_rd_cdt_lat_fifo_pop;
wire dma_dr_cdp_lat_fifo_pop = cdp2mcif_rd_cdt_lat_fifo_pop;

wire dma_sr_pdp_lat_fifo_pop = pdp2cvif_rd_cdt_lat_fifo_pop;
wire dma_dr_pdp_lat_fifo_pop = pdp2mcif_rd_cdt_lat_fifo_pop;

wire dma_sr_sdp_lat_fifo_pop = sdp2cvif_rd_cdt_lat_fifo_pop;
wire dma_dr_sdp_lat_fifo_pop = sdp2mcif_rd_cdt_lat_fifo_pop;

wire dma_sr_sdp_b_lat_fifo_pop = sdp_b2cvif_rd_cdt_lat_fifo_pop;
wire dma_dr_sdp_b_lat_fifo_pop = sdp_b2mcif_rd_cdt_lat_fifo_pop;

wire dma_sr_sdp_n_lat_fifo_pop = sdp_n2cvif_rd_cdt_lat_fifo_pop;
wire dma_dr_sdp_n_lat_fifo_pop = sdp_n2mcif_rd_cdt_lat_fifo_pop;

//| eperl: generated_end (DO NOT EDIT ABOVE)
// just for nv_small test, can be replaced by configurable design
NV_NVDLA_NOCIF_dram u_NV_NVDLA_mcif (
   .nvdla_core_clk (nvdla_core_clk) //|< i
  ,.nvdla_core_rstn (nvdla_core_rstn) //|< o
//:my $i;
//:my $nindex=0;
//: my @dma_index = (0, 1, 1,1, 1,0, 1, 1, 0, 1,0,0,0,0,0,0);
//: my @dma_name = ("bdma","cdma_dat","cdma_wt","cdp","pdp","rbk","sdp","sdp_b","sdp_e","sdp_n");
//: my @client_id = (0, 8, 9, 3, 2, 4, 1, 5, 7, 6,0,0,0,0,0,0,0);
//: my @lat_fifo_depth = (245,0,0,61,61,80,80,160,80,160,0,0,0,0,0,0);
//: for ($i=0;$i<16;$i++) {
//: if ($dma_index[$i]) {
//: print qq(
//: ,.client${nindex}2mcif_rd_cdt_lat_fifo_pop (dma_dr_$dma_name[$i]_lat_fifo_pop) //|<w
//: ,.client${nindex}2mcif_rd_req_valid ($dma_name[$i]2mcif_rd_req_valid) //|< w
//: ,.client${nindex}2mcif_rd_req_ready ($dma_name[$i]2mcif_rd_req_ready) //|> w
//: ,.client${nindex}2mcif_rd_req_pd ($dma_name[$i]2mcif_rd_req_pd ) //|< w
//: ,.client${nindex}2mcif_lat_fifo_depth (8'd$lat_fifo_depth[$i] ) //|< w
//: ,.mcif2client${nindex}_rd_rsp_valid (mcif2$dma_name[$i]_rd_rsp_valid) //|> w
//: ,.mcif2client${nindex}_rd_rsp_ready (mcif2$dma_name[$i]_rd_rsp_ready) //|< w
//: ,.mcif2client${nindex}_rd_rsp_pd (mcif2$dma_name[$i]_rd_rsp_pd ) //|> w
//: ,.client${nindex}2mcif_rd_axid (4'd$client_id[$i] )
//:);
//:$nindex = $nindex + 1;
//:}
//:}
//:my $i;
//:my $nindex=0;
//: my @dma_index = (0, 1,1, 1,0, 0,0,0,0,0,0,0,0,0,0,0);
//: my @dma_name = ("bdma","sdp","pdp","cdp","rbk");
//: my @client_id = (0,1,2,3,4);
//: for ($i=0;$i<16;$i++) {
//: if ($dma_index[$i]) {
//: print qq(
//: ,.client${nindex}2mcif_wr_req_valid ($dma_name[$i]2mcif_wr_req_valid) //|< w
//: ,.client${nindex}2mcif_wr_req_ready ($dma_name[$i]2mcif_wr_req_ready) //|> w
//: ,.client${nindex}2mcif_wr_req_pd ($dma_name[$i]2mcif_wr_req_pd ) //|< w
//: ,.mcif2client${nindex}_wr_rsp_complete (mcif2$dma_name[$i]_wr_rsp_complete) //|> w
//: ,.client${nindex}2mcif_wr_axid (4'd$client_id[$i] )
//:);
//:$nindex = $nindex + 1;
//:}
//:}
//| eperl: generated_beg (DO NOT EDIT BELOW)

,.client02mcif_rd_cdt_lat_fifo_pop (dma_dr_cdma_dat_lat_fifo_pop) //|<w
,.client02mcif_rd_req_valid (cdma_dat2mcif_rd_req_valid) //|< w
,.client02mcif_rd_req_ready (cdma_dat2mcif_rd_req_ready) //|> w
,.client02mcif_rd_req_pd (cdma_dat2mcif_rd_req_pd ) //|< w
,.client02mcif_lat_fifo_depth (8'd0 ) //|< w
,.mcif2client0_rd_rsp_valid (mcif2cdma_dat_rd_rsp_valid) //|> w
,.mcif2client0_rd_rsp_ready (mcif2cdma_dat_rd_rsp_ready) //|< w
,.mcif2client0_rd_rsp_pd (mcif2cdma_dat_rd_rsp_pd ) //|> w
,.client02mcif_rd_axid (4'd8 )

,.client12mcif_rd_cdt_lat_fifo_pop (dma_dr_cdma_wt_lat_fifo_pop) //|<w
,.client12mcif_rd_req_valid (cdma_wt2mcif_rd_req_valid) //|< w
,.client12mcif_rd_req_ready (cdma_wt2mcif_rd_req_ready) //|> w
,.client12mcif_rd_req_pd (cdma_wt2mcif_rd_req_pd ) //|< w
,.client12mcif_lat_fifo_depth (8'd0 ) //|< w
,.mcif2client1_rd_rsp_valid (mcif2cdma_wt_rd_rsp_valid) //|> w
,.mcif2client1_rd_rsp_ready (mcif2cdma_wt_rd_rsp_ready) //|< w
,.mcif2client1_rd_rsp_pd (mcif2cdma_wt_rd_rsp_pd ) //|> w
,.client12mcif_rd_axid (4'd9 )

,.client22mcif_rd_cdt_lat_fifo_pop (dma_dr_cdp_lat_fifo_pop) //|<w
,.client22mcif_rd_req_valid (cdp2mcif_rd_req_valid) //|< w
,.client22mcif_rd_req_ready (cdp2mcif_rd_req_ready) //|> w
,.client22mcif_rd_req_pd (cdp2mcif_rd_req_pd ) //|< w
,.client22mcif_lat_fifo_depth (8'd61 ) //|< w
,.mcif2client2_rd_rsp_valid (mcif2cdp_rd_rsp_valid) //|> w
,.mcif2client2_rd_rsp_ready (mcif2cdp_rd_rsp_ready) //|< w
,.mcif2client2_rd_rsp_pd (mcif2cdp_rd_rsp_pd ) //|> w
,.client22mcif_rd_axid (4'd3 )

,.client32mcif_rd_cdt_lat_fifo_pop (dma_dr_pdp_lat_fifo_pop) //|<w
,.client32mcif_rd_req_valid (pdp2mcif_rd_req_valid) //|< w
,.client32mcif_rd_req_ready (pdp2mcif_rd_req_ready) //|> w
,.client32mcif_rd_req_pd (pdp2mcif_rd_req_pd ) //|< w
,.client32mcif_lat_fifo_depth (8'd61 ) //|< w
,.mcif2client3_rd_rsp_valid (mcif2pdp_rd_rsp_valid) //|> w
,.mcif2client3_rd_rsp_ready (mcif2pdp_rd_rsp_ready) //|< w
,.mcif2client3_rd_rsp_pd (mcif2pdp_rd_rsp_pd ) //|> w
,.client32mcif_rd_axid (4'd2 )

,.client42mcif_rd_cdt_lat_fifo_pop (dma_dr_sdp_lat_fifo_pop) //|<w
,.client42mcif_rd_req_valid (sdp2mcif_rd_req_valid) //|< w
,.client42mcif_rd_req_ready (sdp2mcif_rd_req_ready) //|> w
,.client42mcif_rd_req_pd (sdp2mcif_rd_req_pd ) //|< w
,.client42mcif_lat_fifo_depth (8'd80 ) //|< w
,.mcif2client4_rd_rsp_valid (mcif2sdp_rd_rsp_valid) //|> w
,.mcif2client4_rd_rsp_ready (mcif2sdp_rd_rsp_ready) //|< w
,.mcif2client4_rd_rsp_pd (mcif2sdp_rd_rsp_pd ) //|> w
,.client42mcif_rd_axid (4'd1 )

,.client52mcif_rd_cdt_lat_fifo_pop (dma_dr_sdp_b_lat_fifo_pop) //|<w
,.client52mcif_rd_req_valid (sdp_b2mcif_rd_req_valid) //|< w
,.client52mcif_rd_req_ready (sdp_b2mcif_rd_req_ready) //|> w
,.client52mcif_rd_req_pd (sdp_b2mcif_rd_req_pd ) //|< w
,.client52mcif_lat_fifo_depth (8'd160 ) //|< w
,.mcif2client5_rd_rsp_valid (mcif2sdp_b_rd_rsp_valid) //|> w
,.mcif2client5_rd_rsp_ready (mcif2sdp_b_rd_rsp_ready) //|< w
,.mcif2client5_rd_rsp_pd (mcif2sdp_b_rd_rsp_pd ) //|> w
,.client52mcif_rd_axid (4'd5 )

,.client62mcif_rd_cdt_lat_fifo_pop (dma_dr_sdp_n_lat_fifo_pop) //|<w
,.client62mcif_rd_req_valid (sdp_n2mcif_rd_req_valid) //|< w
,.client62mcif_rd_req_ready (sdp_n2mcif_rd_req_ready) //|> w
,.client62mcif_rd_req_pd (sdp_n2mcif_rd_req_pd ) //|< w
,.client62mcif_lat_fifo_depth (8'd160 ) //|< w
,.mcif2client6_rd_rsp_valid (mcif2sdp_n_rd_rsp_valid) //|> w
,.mcif2client6_rd_rsp_ready (mcif2sdp_n_rd_rsp_ready) //|< w
,.mcif2client6_rd_rsp_pd (mcif2sdp_n_rd_rsp_pd ) //|> w
,.client62mcif_rd_axid (4'd6 )

,.client02mcif_wr_req_valid (sdp2mcif_wr_req_valid) //|< w
,.client02mcif_wr_req_ready (sdp2mcif_wr_req_ready) //|> w
,.client02mcif_wr_req_pd (sdp2mcif_wr_req_pd ) //|< w
,.mcif2client0_wr_rsp_complete (mcif2sdp_wr_rsp_complete) //|> w
,.client02mcif_wr_axid (4'd1 )

,.client12mcif_wr_req_valid (pdp2mcif_wr_req_valid) //|< w
,.client12mcif_wr_req_ready (pdp2mcif_wr_req_ready) //|> w
,.client12mcif_wr_req_pd (pdp2mcif_wr_req_pd ) //|< w
,.mcif2client1_wr_rsp_complete (mcif2pdp_wr_rsp_complete) //|> w
,.client12mcif_wr_axid (4'd2 )

,.client22mcif_wr_req_valid (cdp2mcif_wr_req_valid) //|< w
,.client22mcif_wr_req_ready (cdp2mcif_wr_req_ready) //|> w
,.client22mcif_wr_req_pd (cdp2mcif_wr_req_pd ) //|< w
,.mcif2client2_wr_rsp_complete (mcif2cdp_wr_rsp_complete) //|> w
,.client22mcif_wr_axid (4'd3 )

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,.csb2mcif_req_pvld (csb2mcif_req_pvld) //|< w
  ,.csb2mcif_req_prdy (csb2mcif_req_prdy) //|> w
  ,.csb2mcif_req_pd (csb2mcif_req_pd[62:0]) //|< w
  ,.mcif2csb_resp_valid (mcif2csb_resp_valid) //|> w
  ,.mcif2csb_resp_pd (mcif2csb_resp_pd[33:0]) //|> w
  ,.mcif2noc_axi_ar_arvalid (mcif2noc_axi_ar_arvalid) //|> o
  ,.mcif2noc_axi_ar_arready (mcif2noc_axi_ar_arready) //|< i
  ,.mcif2noc_axi_ar_arid (mcif2noc_axi_ar_arid[7:0]) //|> o
  ,.mcif2noc_axi_ar_arlen (mcif2noc_axi_ar_arlen[3:0]) //|> o
  ,.mcif2noc_axi_ar_araddr (mcif2noc_axi_ar_araddr ) //|> o
  ,.mcif2noc_axi_aw_awvalid (mcif2noc_axi_aw_awvalid) //|> o
  ,.mcif2noc_axi_aw_awready (mcif2noc_axi_aw_awready) //|< i
  ,.mcif2noc_axi_aw_awid (mcif2noc_axi_aw_awid[7:0]) //|> o
  ,.mcif2noc_axi_aw_awlen (mcif2noc_axi_aw_awlen[3:0]) //|> o
  ,.mcif2noc_axi_aw_awaddr (mcif2noc_axi_aw_awaddr ) //|> o
  ,.mcif2noc_axi_w_wvalid (mcif2noc_axi_w_wvalid) //|> o
  ,.mcif2noc_axi_w_wready (mcif2noc_axi_w_wready) //|< i
  ,.mcif2noc_axi_w_wdata (mcif2noc_axi_w_wdata ) //|> o
  ,.mcif2noc_axi_w_wstrb (mcif2noc_axi_w_wstrb ) //|> o
  ,.mcif2noc_axi_w_wlast (mcif2noc_axi_w_wlast) //|> o
  ,.noc2mcif_axi_b_bvalid (noc2mcif_axi_b_bvalid) //|< i
  ,.noc2mcif_axi_b_bready (noc2mcif_axi_b_bready) //|> o
  ,.noc2mcif_axi_b_bid (noc2mcif_axi_b_bid[7:0]) //|< i
  ,.noc2mcif_axi_r_rvalid (noc2mcif_axi_r_rvalid) //|< i
  ,.noc2mcif_axi_r_rready (noc2mcif_axi_r_rready) //|> o
  ,.noc2mcif_axi_r_rid (noc2mcif_axi_r_rid[7:0]) //|< i
  ,.noc2mcif_axi_r_rlast (noc2mcif_axi_r_rlast) //|< i
  ,.noc2mcif_axi_r_rdata (noc2mcif_axi_r_rdata ) //|< i
  ,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
  );
////////////////////////////////////////////////////////////////////////
// NVDLA Partition O: AXI Interface to CVSRAM //
////////////////////////////////////////////////////////////////////////
//
//
//
//&Connect s/sdp2(mc|cv)if_rd_(req|cdt)/sdp2${1}if_rd_${2}_dst/;
//&Connect s/(mc|cv)if2sdp_rd_(rsp)/${1}if2sdp_rd_${2}_src/;
//&Connect s/sdp_b2(mc|cv)if_rd_(req|cdt)/sdp_b2${1}if_rd_${2}_dst/;
//&Connect s/(mc|cv)if2sdp_b_rd_(rsp)/${1}if2sdp_b_rd_${2}_src/;
////////////////////////////////////////////////////////////////////////
// NVDLA Partition O: Bridge DMA //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// NVDLA Partition O: Rubik engine //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// NVDLA Partition O: Cross-Channel Data Processor //
////////////////////////////////////////////////////////////////////////
NV_NVDLA_cdp u_NV_NVDLA_cdp (
   .dla_clk_ovr_on_sync (dla_clk_ovr_on_sync) //|< w
  ,.global_clk_ovr_on_sync (global_clk_ovr_on_sync) //|< w
  ,.tmc2slcg_disable_clock_gating (tmc2slcg_disable_clock_gating) //|< i
  ,.nvdla_core_clk (nvdla_core_clk) //|< i
  ,.nvdla_core_rstn (nvdla_core_rstn) //|< o
  ,.cdp2csb_resp_valid (cdp2csb_resp_valid) //|> w
  ,.cdp2csb_resp_pd (cdp2csb_resp_pd[33:0]) //|> w
  ,.cdp2glb_done_intr_pd (cdp2glb_done_intr_pd[1:0]) //|> w
  ,.cdp2mcif_rd_cdt_lat_fifo_pop (cdp2mcif_rd_cdt_lat_fifo_pop) //|> w
  ,.cdp2mcif_rd_req_valid (cdp2mcif_rd_req_valid) //|> w
  ,.cdp2mcif_rd_req_ready (cdp2mcif_rd_req_ready) //|< w
  ,.cdp2mcif_rd_req_pd (cdp2mcif_rd_req_pd ) //|> w
  ,.cdp2mcif_wr_req_valid (cdp2mcif_wr_req_valid) //|> w
  ,.cdp2mcif_wr_req_ready (cdp2mcif_wr_req_ready) //|< w
  ,.cdp2mcif_wr_req_pd (cdp2mcif_wr_req_pd ) //|> w
  ,.cdp_rdma2csb_resp_valid (cdp_rdma2csb_resp_valid) //|> w
  ,.cdp_rdma2csb_resp_pd (cdp_rdma2csb_resp_pd[33:0]) //|> w
  ,.csb2cdp_rdma_req_pvld (csb2cdp_rdma_req_pvld) //|< w
  ,.csb2cdp_rdma_req_prdy (csb2cdp_rdma_req_prdy) //|> w
  ,.csb2cdp_rdma_req_pd (csb2cdp_rdma_req_pd[62:0]) //|< w
  ,.csb2cdp_req_pvld (csb2cdp_req_pvld) //|< w
  ,.csb2cdp_req_prdy (csb2cdp_req_prdy) //|> w
  ,.csb2cdp_req_pd (csb2cdp_req_pd[62:0]) //|< w
  ,.mcif2cdp_rd_rsp_valid (mcif2cdp_rd_rsp_valid) //|< w
  ,.mcif2cdp_rd_rsp_ready (mcif2cdp_rd_rsp_ready) //|> w
  ,.mcif2cdp_rd_rsp_pd (mcif2cdp_rd_rsp_pd ) //|< w
  ,.mcif2cdp_wr_rsp_complete (mcif2cdp_wr_rsp_complete) //|< w
  ,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
  );
////////////////////////////////////////////////////////////////////////
// NVDLA Partition O: Planar Data Processor //
////////////////////////////////////////////////////////////////////////
NV_NVDLA_pdp u_NV_NVDLA_pdp (
   .dla_clk_ovr_on_sync (dla_clk_ovr_on_sync) //|< w
  ,.global_clk_ovr_on_sync (global_clk_ovr_on_sync) //|< w
  ,.tmc2slcg_disable_clock_gating (tmc2slcg_disable_clock_gating) //|< i
  ,.nvdla_core_clk (nvdla_core_clk) //|< i
  ,.nvdla_core_rstn (nvdla_core_rstn) //|< o
  ,.csb2pdp_rdma_req_pvld (csb2pdp_rdma_req_pvld) //|< w
  ,.csb2pdp_rdma_req_prdy (csb2pdp_rdma_req_prdy) //|> w
  ,.csb2pdp_rdma_req_pd (csb2pdp_rdma_req_pd[62:0]) //|< w
  ,.csb2pdp_req_pvld (csb2pdp_req_pvld) //|< w
  ,.csb2pdp_req_prdy (csb2pdp_req_prdy) //|> w
  ,.csb2pdp_req_pd (csb2pdp_req_pd[62:0]) //|< w
  ,.mcif2pdp_rd_rsp_valid (mcif2pdp_rd_rsp_valid) //|< w
  ,.mcif2pdp_rd_rsp_ready (mcif2pdp_rd_rsp_ready) //|> w
  ,.mcif2pdp_rd_rsp_pd (mcif2pdp_rd_rsp_pd ) //|< w
  ,.mcif2pdp_wr_rsp_complete (mcif2pdp_wr_rsp_complete) //|< w
  ,.pdp2csb_resp_valid (pdp2csb_resp_valid) //|> w
  ,.pdp2csb_resp_pd (pdp2csb_resp_pd[33:0]) //|> w
  ,.pdp2glb_done_intr_pd (pdp2glb_done_intr_pd[1:0]) //|> w
  ,.pdp2mcif_rd_cdt_lat_fifo_pop (pdp2mcif_rd_cdt_lat_fifo_pop) //|> w
  ,.pdp2mcif_rd_req_valid (pdp2mcif_rd_req_valid) //|> w
  ,.pdp2mcif_rd_req_ready (pdp2mcif_rd_req_ready) //|< w
  ,.pdp2mcif_rd_req_pd (pdp2mcif_rd_req_pd ) //|> w
  ,.pdp2mcif_wr_req_valid (pdp2mcif_wr_req_valid) //|> w
  ,.pdp2mcif_wr_req_ready (pdp2mcif_wr_req_ready) //|< w
  ,.pdp2mcif_wr_req_pd (pdp2mcif_wr_req_pd ) //|> w
  ,.pdp_rdma2csb_resp_valid (pdp_rdma2csb_resp_valid) //|> w
  ,.pdp_rdma2csb_resp_pd (pdp_rdma2csb_resp_pd[33:0]) //|> w
  ,.pwrbus_ram_pd (pwrbus_ram_pd[31:0]) //|< i
  ,.sdp2pdp_valid (sdp2pdp_valid) //|< i
  ,.sdp2pdp_ready (sdp2pdp_ready) //|> o
  ,.sdp2pdp_pd (sdp2pdp_pd ) //|< i
  );
////////////////////////////////////////////////////////////////////////
// NVDLA Partition O: Global Unit //
////////////////////////////////////////////////////////////////////////
NV_NVDLA_glb u_NV_NVDLA_glb (
   .csb2glb_req_pvld (csb2glb_req_pvld) //|< w
  ,.csb2glb_req_prdy (csb2glb_req_prdy) //|> w
  ,.csb2glb_req_pd (csb2glb_req_pd[62:0]) //|< w
  ,.glb2csb_resp_valid (glb2csb_resp_valid) //|> w
  ,.glb2csb_resp_pd (glb2csb_resp_pd[33:0]) //|> w
  ,.core_intr (core_intr) //|> o
  ,.sdp2glb_done_intr_pd (sdp2glb_done_intr_pd[1:0]) //|< i
  ,.cdp2glb_done_intr_pd (cdp2glb_done_intr_pd[1:0]) //|< w
  ,.pdp2glb_done_intr_pd (pdp2glb_done_intr_pd[1:0]) //|< w
  ,.cdma_wt2glb_done_intr_pd (cdma_wt2glb_done_intr_pd[1:0]) //|< i
  ,.cdma_dat2glb_done_intr_pd (cdma_dat2glb_done_intr_pd[1:0]) //|< i
  ,.cacc2glb_done_intr_pd (cacc2glb_done_intr_pd[1:0]) //|< i
  ,.nvdla_core_clk (nvdla_core_clk) //|< i
  ,.nvdla_falcon_clk (nvdla_falcon_clk) //|< i
  ,.nvdla_core_rstn (nvdla_core_rstn) //|< o
  ,.nvdla_falcon_rstn (nvdla_falcon_rstn) //|< w
  ,.test_mode (test_mode) //|< i
  ,.direct_reset_ (direct_reset_) //|< i
  );
////////////////////////////////////////////////////////////////////////
// Dangles/Contenders report //
////////////////////////////////////////////////////////////////////////
endmodule // NV_NVDLA_partition_o
