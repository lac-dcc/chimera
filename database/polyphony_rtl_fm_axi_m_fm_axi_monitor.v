module fm_axi_monitor (
  clk_core,
  rst_x,
  i_stop_trigger,
  // AXI write port
  i_awid_m,
  i_awaddr_m,
  i_awlen_m,
  i_awsize_m,
  i_awburst_m,
  i_awlock_m,
  i_awcache_m,
  i_awuser_m,
  i_awprot_m,
  i_awvalid_m,
  i_awready_m,
  i_wid_m,
  i_wdata_m,
  i_wstrb_m,
  i_wlast_m,
  i_wvalid_m,
  i_wready_m,
  i_bid_m,
  i_bresp_m,
  i_bvalid_m,
  i_bready_m,
  // AXI read port
  i_arid_m,
  i_araddr_m,
  i_arlen_m,
  i_arsize_m,
  i_arburst_m,
  i_arlock_m,
  i_arcache_m,
  i_aruser_m,
  i_arprot_m,
  i_arvalid_m,
  i_arready_m,
  i_rid_m,
  i_rdata_m,
  i_rresp_m,
  i_rlast_m,
  i_rvalid_m,
  i_rready_m,
// result out
  // awvalid
  o_bukets_no_wait_aw,
  o_bukets_0_aw,
  o_bukets_1_aw,
  o_bukets_2_aw,
  o_bukets_3_aw,
  o_bukets_more_aw,
  o_max_count_aw,
  o_min_count_aw,
  o_bukets_len_0_aw,
  o_bukets_len_1_aw,
  o_bukets_len_2_aw,
  o_bukets_len_3_aw,
  o_total_bytes_w,
  o_cont_w,
  o_discont_w,
  o_bukets_nrdy_0_w,
  o_bukets_nrdy_1_w,
  o_bukets_nrdy_2_w,
  o_bukets_nrdy_3_w,
  // arvalid
  o_bukets_no_wait_ar,
  o_bukets_0_ar,
  o_bukets_1_ar,
  o_bukets_2_ar,
  o_bukets_3_ar,
  o_bukets_more_ar,
  o_max_count_ar,
  o_min_count_ar,
  o_bukets_len_0_ar,
  o_bukets_len_1_ar,
  o_bukets_len_2_ar,
  o_bukets_len_3_ar,
  o_cont_ar,
  o_discont_ar,
  // wdata
  o_bukets_no_wait_b,
  o_bukets_0_b,
  o_bukets_1_b,
  o_bukets_2_b,
  o_bukets_3_b,
  o_bukets_more_b,
  o_num_of_cmd_b,
  o_num_of_b,
  // rdata
  o_bukets_no_wait_r,
  o_bukets_0_r,
  o_bukets_1_r,
  o_bukets_2_r,
  o_bukets_3_r,
  o_bukets_more_r,
  o_total_bytes_r,
  o_rd_cont,
  o_rd_discont,
  o_bukets_nrdy_0_r,
  o_bukets_nrdy_1_r,
  o_bukets_nrdy_2_r,
  o_bukets_nrdy_3_r
);
`include "polyphony_axi_def.v"
localparam P_BUCKET_SIZE     = 'd32;
//////////////////////////////////
// I/O port definition
//////////////////////////////////
  // system
  input clk_core;
  input rst_x;
  input i_stop_trigger;
   
  // AXI Master
  //   write port
  input  [P_AXI_M_AWID-1:0] i_awid_m;
/*  (* mark_debug = "true" *)*/  input  [P_AXI_M_AWADDR-1:0] i_awaddr_m;
   input  [P_AXI_M_AWLEN-1:0] i_awlen_m;
  input  [P_AXI_M_AWSIZE-1:0] i_awsize_m;
  input  [P_AXI_M_AWBURST-1:0] i_awburst_m;
  input  [P_AXI_M_AWLOCK-1:0] i_awlock_m;
  input  [P_AXI_M_AWCACHE-1:0] i_awcache_m;
  input  [P_AXI_M_AWUSER-1:0] i_awuser_m;
  input  [P_AXI_M_AWPROT-1:0] i_awprot_m;
      input  i_awvalid_m;
      input  i_awready_m;
  input  [P_AXI_M_WID-1:0] i_wid_m;
   input  [P_AXI_M_WDATA-1:0] i_wdata_m;
   input  [P_AXI_M_WSTRB-1:0] i_wstrb_m;
        input  i_wlast_m;
        input  i_wvalid_m;
        input  i_wready_m;
   input  [P_AXI_M_BID-1:0] i_bid_m;
   input  [P_AXI_M_BRESP-1:0] i_bresp_m;
        input  i_bvalid_m;
        input  i_bready_m;
  //   read port
  input  [P_AXI_M_ARID-1:0] i_arid_m;
     input  [P_AXI_M_ARADDR-1:0] i_araddr_m;
     input  [P_AXI_M_ARLEN-1:0] i_arlen_m;
  input  [P_AXI_M_ARSIZE-1:0] i_arsize_m;
  input  [P_AXI_M_ARBURST-1:0] i_arburst_m;
  input  [P_AXI_M_ARLOCK-1:0] i_arlock_m;
  input  [P_AXI_M_ARCACHE-1:0] i_arcache_m;
  input  [P_AXI_M_ARUSER-1:0] i_aruser_m;
  input  [P_AXI_M_ARPROT-1:0] i_arprot_m;
     input  i_arvalid_m;
     input  i_arready_m;
  // read response
     input  [P_AXI_M_RID-1:0] i_rid_m;
     input  [P_AXI_M_RDATA-1:0] i_rdata_m;
     input  [P_AXI_M_RRESP-1:0] i_rresp_m;
     input  i_rlast_m;
     input  i_rvalid_m;
     input  i_rready_m;
// result out
  output [P_BUCKET_SIZE-1:0] o_bukets_no_wait_aw;
  output [P_BUCKET_SIZE-1:0] o_bukets_0_aw;
  output [P_BUCKET_SIZE-1:0] o_bukets_1_aw;
  output [P_BUCKET_SIZE-1:0] o_bukets_2_aw;
  output [P_BUCKET_SIZE-1:0] o_bukets_3_aw;
  output [P_BUCKET_SIZE-1:0] o_bukets_more_aw;
  output [P_BUCKET_SIZE-1:0] o_max_count_aw;
  output [P_BUCKET_SIZE-1:0] o_min_count_aw;
  output [P_BUCKET_SIZE-1:0] o_bukets_len_0_aw;
  output [P_BUCKET_SIZE-1:0] o_bukets_len_1_aw;
  output [P_BUCKET_SIZE-1:0] o_bukets_len_2_aw;
  output [P_BUCKET_SIZE-1:0] o_bukets_len_3_aw;
  output [P_BUCKET_SIZE-1:0] o_total_bytes_w;
  output [P_BUCKET_SIZE-1:0] o_cont_w;
  output [P_BUCKET_SIZE-1:0] o_discont_w;
  output [P_BUCKET_SIZE-1:0] o_bukets_nrdy_0_w;
  output [P_BUCKET_SIZE-1:0] o_bukets_nrdy_1_w;
  output [P_BUCKET_SIZE-1:0] o_bukets_nrdy_2_w;
  output [P_BUCKET_SIZE-1:0] o_bukets_nrdy_3_w;

  output [P_BUCKET_SIZE-1:0] o_bukets_no_wait_ar;
  output [P_BUCKET_SIZE-1:0] o_bukets_0_ar;
  output [P_BUCKET_SIZE-1:0] o_bukets_1_ar;
  output [P_BUCKET_SIZE-1:0] o_bukets_2_ar;
  output [P_BUCKET_SIZE-1:0] o_bukets_3_ar;
  output [P_BUCKET_SIZE-1:0] o_bukets_more_ar;
  output [P_BUCKET_SIZE-1:0] o_max_count_ar;
  output [P_BUCKET_SIZE-1:0] o_min_count_ar;
  output [P_BUCKET_SIZE-1:0] o_bukets_len_0_ar;
  output [P_BUCKET_SIZE-1:0] o_bukets_len_1_ar;
  output [P_BUCKET_SIZE-1:0] o_bukets_len_2_ar;
  output [P_BUCKET_SIZE-1:0] o_bukets_len_3_ar;
  output [P_BUCKET_SIZE-1:0] o_cont_ar;
  output [P_BUCKET_SIZE-1:0] o_discont_ar;
   

        output [P_BUCKET_SIZE-1:0] o_bukets_no_wait_b;
        output [P_BUCKET_SIZE-1:0] o_bukets_0_b;
        output [P_BUCKET_SIZE-1:0] o_bukets_1_b;
        output [P_BUCKET_SIZE-1:0] o_bukets_2_b;
        output [P_BUCKET_SIZE-1:0] o_bukets_3_b;
        output [P_BUCKET_SIZE-1:0] o_bukets_more_b;
        output [P_BUCKET_SIZE-1:0] o_num_of_cmd_b;
        output [P_BUCKET_SIZE-1:0] o_num_of_b;

  // rdata
  output [P_BUCKET_SIZE-1:0] o_bukets_no_wait_r;
  output [P_BUCKET_SIZE-1:0] o_bukets_0_r;
  output [P_BUCKET_SIZE-1:0] o_bukets_1_r;
  output [P_BUCKET_SIZE-1:0] o_bukets_2_r;
  output [P_BUCKET_SIZE-1:0] o_bukets_3_r;
  output [P_BUCKET_SIZE-1:0] o_bukets_more_r;
  output [P_BUCKET_SIZE-1:0] o_total_bytes_r;
  output [P_BUCKET_SIZE-1:0] o_rd_cont;
  output [P_BUCKET_SIZE-1:0] o_rd_discont;
  output [P_BUCKET_SIZE-1:0]   o_bukets_nrdy_0_r;
  output [P_BUCKET_SIZE-1:0]   o_bukets_nrdy_1_r;
  output [P_BUCKET_SIZE-1:0]   o_bukets_nrdy_2_r;
  output [P_BUCKET_SIZE-1:0]   o_bukets_nrdy_3_r;

//////////
   
  reg [P_BUCKET_SIZE-1:0] r_bukets_no_wait_aw;
  reg [P_BUCKET_SIZE-1:0] r_bukets_0_aw;
  reg [P_BUCKET_SIZE-1:0] r_bukets_1_aw;
  reg [P_BUCKET_SIZE-1:0] r_bukets_2_aw;
  reg [P_BUCKET_SIZE-1:0] r_bukets_3_aw;
  reg [P_BUCKET_SIZE-1:0] r_bukets_more_aw;
  reg [P_BUCKET_SIZE-1:0] r_max_count_aw;
  reg [P_BUCKET_SIZE-1:0] r_min_count_aw;
  reg [P_BUCKET_SIZE-1:0] r_bukets_len_0_aw;
  reg [P_BUCKET_SIZE-1:0] r_bukets_len_1_aw;
  reg [P_BUCKET_SIZE-1:0] r_bukets_len_2_aw;
  reg [P_BUCKET_SIZE-1:0] r_bukets_len_3_aw;
  reg [P_BUCKET_SIZE-1:0] r_total_bytes_w;
  reg [P_BUCKET_SIZE-1:0] r_cont_w;
  reg [P_BUCKET_SIZE-1:0] r_discont_w;
  reg [P_BUCKET_SIZE-1:0] r_bukets_nrdy_0_w;
  reg [P_BUCKET_SIZE-1:0] r_bukets_nrdy_1_w;
  reg [P_BUCKET_SIZE-1:0] r_bukets_nrdy_2_w;
  reg [P_BUCKET_SIZE-1:0] r_bukets_nrdy_3_w;

  reg [P_BUCKET_SIZE-1:0] r_bukets_no_wait_ar;
  reg [P_BUCKET_SIZE-1:0] r_bukets_0_ar;
  reg [P_BUCKET_SIZE-1:0] r_bukets_1_ar;
  reg [P_BUCKET_SIZE-1:0] r_bukets_2_ar;
  reg [P_BUCKET_SIZE-1:0] r_bukets_3_ar;
  reg [P_BUCKET_SIZE-1:0] r_bukets_more_ar;
  reg [P_BUCKET_SIZE-1:0] r_max_count_ar;
  reg [P_BUCKET_SIZE-1:0] r_min_count_ar;
  reg [P_BUCKET_SIZE-1:0] r_bukets_len_0_ar;
  reg [P_BUCKET_SIZE-1:0] r_bukets_len_1_ar;
  reg [P_BUCKET_SIZE-1:0] r_bukets_len_2_ar;
  reg [P_BUCKET_SIZE-1:0] r_bukets_len_3_ar;
  reg [P_BUCKET_SIZE-1:0] r_cont_ar;
  reg [P_BUCKET_SIZE-1:0] r_discont_ar;

  reg [P_BUCKET_SIZE-1:0] r_bukets_no_wait_b;
  reg [P_BUCKET_SIZE-1:0] r_bukets_0_b;
  reg [P_BUCKET_SIZE-1:0] r_bukets_1_b;
  reg [P_BUCKET_SIZE-1:0] r_bukets_2_b;
  reg [P_BUCKET_SIZE-1:0] r_bukets_3_b;
  reg [P_BUCKET_SIZE-1:0] r_bukets_more_b;
  reg [P_BUCKET_SIZE-1:0] r_num_of_cmd_b;
  reg [P_BUCKET_SIZE-1:0] r_num_of_b;

  // rdata
  reg [P_BUCKET_SIZE-1:0] r_bukets_no_wait_r;
  reg [P_BUCKET_SIZE-1:0] r_bukets_0_r;
  reg [P_BUCKET_SIZE-1:0] r_bukets_1_r;
  reg [P_BUCKET_SIZE-1:0] r_bukets_2_r;
  reg [P_BUCKET_SIZE-1:0] r_bukets_3_r;
  reg [P_BUCKET_SIZE-1:0] r_bukets_more_r;
  reg [P_BUCKET_SIZE-1:0] r_total_bytes_r;
  reg [P_BUCKET_SIZE-1:0] r_rd_cont;
  reg [P_BUCKET_SIZE-1:0] r_rd_discont;
  reg [P_BUCKET_SIZE-1:0]   r_bukets_nrdy_0_r;
  reg [P_BUCKET_SIZE-1:0]   r_bukets_nrdy_1_r;
  reg [P_BUCKET_SIZE-1:0]   r_bukets_nrdy_2_r;
  reg [P_BUCKET_SIZE-1:0]   r_bukets_nrdy_3_r;
   
//    
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
  wire [P_BUCKET_SIZE-1:0]   w_bukets_nrdy_0_r;
  wire [P_BUCKET_SIZE-1:0]   w_bukets_nrdy_1_r;
  wire [P_BUCKET_SIZE-1:0]   w_bukets_nrdy_2_r;
  wire [P_BUCKET_SIZE-1:0]   w_bukets_nrdy_3_r;

assign o_bukets_no_wait_aw = r_bukets_no_wait_aw;
assign o_bukets_0_aw = r_bukets_0_aw;
assign o_bukets_1_aw = r_bukets_1_aw;
assign o_bukets_2_aw = r_bukets_2_aw;
assign o_bukets_3_aw = r_bukets_3_aw;
assign o_bukets_more_aw = r_bukets_more_aw;
assign o_max_count_aw = r_max_count_aw;
assign o_min_count_aw = r_min_count_aw;
assign o_bukets_len_0_aw = r_bukets_len_0_aw;
assign o_bukets_len_1_aw = r_bukets_len_1_aw;
assign o_bukets_len_2_aw = r_bukets_len_2_aw;
assign o_bukets_len_3_aw = r_bukets_len_3_aw;
assign o_total_bytes_w = r_total_bytes_w;
assign o_cont_w = r_cont_w;
assign o_discont_w = r_discont_w;
assign o_bukets_nrdy_0_w = r_bukets_nrdy_0_w;
assign o_bukets_nrdy_1_w = r_bukets_nrdy_1_w;
assign o_bukets_nrdy_2_w = r_bukets_nrdy_2_w;
assign o_bukets_nrdy_3_w = r_bukets_nrdy_3_w;

assign o_bukets_no_wait_ar = r_bukets_no_wait_ar;
assign o_bukets_0_ar = r_bukets_0_ar;
assign o_bukets_1_ar = r_bukets_1_ar;
assign o_bukets_2_ar = r_bukets_2_ar;
assign o_bukets_3_ar = r_bukets_3_ar;
assign o_bukets_more_ar = r_bukets_more_ar;
assign o_max_count_ar = r_max_count_ar;
assign o_min_count_ar = r_min_count_ar;
assign o_bukets_len_0_ar = r_bukets_len_0_ar;
assign o_bukets_len_1_ar = r_bukets_len_1_ar;
assign o_bukets_len_2_ar = r_bukets_len_2_ar;
assign o_bukets_len_3_ar = r_bukets_len_3_ar;
assign o_cont_ar = r_cont_ar;
assign o_discont_ar = r_discont_ar;

assign o_bukets_no_wait_b = r_bukets_no_wait_b;
assign o_bukets_0_b = r_bukets_0_b;
assign o_bukets_1_b = r_bukets_1_b;
assign o_bukets_2_b = r_bukets_2_b;
assign o_bukets_3_b = r_bukets_3_b;
assign o_bukets_more_b = r_bukets_more_b;
assign o_num_of_cmd_b = r_num_of_cmd_b;
assign o_num_of_b = r_num_of_b;

  // rdata
assign o_bukets_no_wait_r = r_bukets_no_wait_r;
assign o_bukets_0_r = r_bukets_0_r;
assign o_bukets_1_r = r_bukets_1_r;
assign o_bukets_2_r = r_bukets_2_r;
assign o_bukets_3_r = r_bukets_3_r;
assign o_bukets_more_r = r_bukets_more_r;
assign o_total_bytes_r = r_total_bytes_r;
assign o_rd_cont = r_rd_cont;
assign o_rd_discont = r_rd_discont;
assign o_bukets_nrdy_0_r = r_bukets_nrdy_0_r;
assign o_bukets_nrdy_1_r = r_bukets_nrdy_1_r;
assign o_bukets_nrdy_2_r = r_bukets_nrdy_2_r;
assign o_bukets_nrdy_3_r = r_bukets_nrdy_3_r;

   
always @(posedge clk_core) begin
  if (!i_stop_trigger) begin
    r_bukets_no_wait_aw <= w_bukets_no_wait_aw;
    r_bukets_0_aw <= w_bukets_0_aw;
    r_bukets_1_aw <= w_bukets_1_aw;
    r_bukets_2_aw <= w_bukets_2_aw;
    r_bukets_3_aw <= w_bukets_3_aw;
    r_bukets_more_aw <= w_bukets_more_aw;
    r_max_count_aw <= w_max_count_aw;
    r_min_count_aw <= w_min_count_aw;
    r_bukets_len_0_aw <= w_bukets_len_0_aw;
    r_bukets_len_1_aw <= w_bukets_len_1_aw;
    r_bukets_len_2_aw <= w_bukets_len_2_aw;
    r_bukets_len_3_aw <= w_bukets_len_3_aw;
    r_total_bytes_w <= w_total_bytes_w;
    r_cont_w <= w_cont_w;
    r_discont_w <= w_discont_w;
    r_bukets_nrdy_0_w <= w_bukets_nrdy_0_w;
    r_bukets_nrdy_1_w <= w_bukets_nrdy_1_w;
    r_bukets_nrdy_2_w <= w_bukets_nrdy_2_w;
    r_bukets_nrdy_3_w <= w_bukets_nrdy_3_w;

    r_bukets_no_wait_ar <= w_bukets_no_wait_ar;
    r_bukets_0_ar <= w_bukets_0_ar;
    r_bukets_1_ar <= w_bukets_1_ar;
    r_bukets_2_ar <= w_bukets_2_ar;
    r_bukets_3_ar <= w_bukets_3_ar;
    r_bukets_more_ar <= w_bukets_more_ar;
    r_max_count_ar <= w_max_count_ar;
    r_min_count_ar <= w_min_count_ar;
    r_bukets_len_0_ar <= w_bukets_len_0_ar;
    r_bukets_len_1_ar <= w_bukets_len_1_ar;
    r_bukets_len_2_ar <= w_bukets_len_2_ar;
    r_bukets_len_3_ar <= w_bukets_len_3_ar;
    r_cont_ar <= w_cont_ar;
    r_discont_ar <= w_discont_ar;

    r_bukets_no_wait_b <= w_bukets_no_wait_b;
    r_bukets_0_b <= w_bukets_0_b;
    r_bukets_1_b <= w_bukets_1_b;
    r_bukets_2_b <= w_bukets_2_b;
    r_bukets_3_b <= w_bukets_3_b;
    r_bukets_more_b <= w_bukets_more_b;
    r_num_of_cmd_b <= w_num_of_cmd_b;
    r_num_of_b <= w_num_of_b;

  // rdata
   r_bukets_no_wait_r <= w_bukets_no_wait_r;
   r_bukets_0_r <= w_bukets_0_r;
   r_bukets_1_r <= w_bukets_1_r;
   r_bukets_2_r <= w_bukets_2_r;
   r_bukets_3_r <= w_bukets_3_r;
   r_bukets_more_r <= w_bukets_more_r;
   r_total_bytes_r <= w_total_bytes_r;
   r_rd_cont <= w_rd_cont;
   r_rd_discont <= w_rd_discont;
   r_bukets_nrdy_0_r <= w_bukets_nrdy_0_r;
   r_bukets_nrdy_1_r <= w_bukets_nrdy_1_r;
   r_bukets_nrdy_2_r <= w_bukets_nrdy_2_r;
   r_bukets_nrdy_3_r <= w_bukets_nrdy_3_r;
  end
end

//////////////////////////////////
// module instance
//////////////////////////////////

// awvalid - awready
fm_axi_monitor_vw u_mon_awvalid (
  .clk_core(clk_core),
  .rst_x(rst_x),
  .i_start(i_awvalid_m),
  .i_clear(1'b0),
  .i_stop(i_awready_m),
  .i_alen(i_awlen_m),
  .i_wvalid(i_wvalid_m),
  .i_wlast(i_wlast_m),
  .i_wready(i_wready_m),
  // result out
  .o_set_no_wait(),
  .o_set_bukets(),
  .o_set_no_more(),
  .o_counter(),
  .o_bukets_no_wait(w_bukets_no_wait_aw),  // awvalid no wait
  .o_bukets_0(w_bukets_0_aw),              // awvarid accept range
  .o_bukets_1(w_bukets_1_aw),
  .o_bukets_2(w_bukets_2_aw),
  .o_bukets_3(w_bukets_3_aw),
  .o_bukets_more(w_bukets_more_aw),
  .o_max_count(w_max_count_aw),   // max accept cycle
  .o_min_count(w_min_count_aw),   // min accept cycle
  .o_bukets_len_0(w_bukets_len_0_aw),
  .o_bukets_len_1(w_bukets_len_1_aw),
  .o_bukets_len_2(w_bukets_len_2_aw),
  .o_bukets_len_3(w_bukets_len_3_aw),
  .o_total_bytes(w_total_bytes_w),
  .o_bukets_nrdy_0(w_bukets_nrdy_0_w),
  .o_bukets_nrdy_1(w_bukets_nrdy_1_w),
  .o_bukets_nrdy_2(w_bukets_nrdy_2_w),
  .o_bukets_nrdy_3(w_bukets_nrdy_3_w),
  .o_wr_cont(w_cont_w),
  .o_wr_discont(w_discont_w)
);

// arvalid - arready
fm_axi_monitor_vr u_mon_arvalid (
  .clk_core(clk_core),
  .rst_x(rst_x),
  .i_start(i_arvalid_m),
  .i_clear(1'b0),
  .i_stop(i_arready_m),
  .i_alen(i_arlen_m),
  // result out
  .o_set_no_wait(),
  .o_set_bukets(),
  .o_set_no_more(),
  .o_counter(),
  .o_bukets_no_wait(w_bukets_no_wait_ar),
  .o_bukets_0(w_bukets_0_ar),
  .o_bukets_1(w_bukets_1_ar),
  .o_bukets_2(w_bukets_2_ar),
  .o_bukets_3(w_bukets_3_ar),
  .o_bukets_more(w_bukets_more_ar),
  .o_max_count(w_max_count_ar),   // max accept cycle
  .o_min_count(w_min_count_ar),   // min accept cycle
  .o_bukets_len_0(w_bukets_len_0_ar),
  .o_bukets_len_1(w_bukets_len_1_ar),
  .o_bukets_len_2(w_bukets_len_2_ar),
  .o_bukets_len_3(w_bukets_len_3_ar)
);

// wvalid & wlast & wready - bvalid & bready
fm_axi_monitor_b u_mon_bvalid (
  .clk_core(clk_core),
  .rst_x(rst_x),
  .i_clear(1'b0),
  .i_wvalid(i_wvalid_m & i_wlast_m),
  .i_wready(i_wready_m),
  .i_bid(i_bid_m),
  .i_bresp(i_bresp_m),
  .i_bvalid(i_bvalid_m),
  .i_bready(i_bready_m),
  // result out
  .o_set_no_wait(),
  .o_set_bukets(),
  .o_set_no_more(),
  .o_counter(),
  .o_bukets_no_wait(w_bukets_no_wait_b),
  .o_bukets_0(w_bukets_0_b),
  .o_bukets_1(w_bukets_1_b),
  .o_bukets_2(w_bukets_2_b),
  .o_bukets_3(w_bukets_3_b),
  .o_bukets_more(w_bukets_more_b),
  .o_num_of_cmd(w_num_of_cmd_b),
  .o_num_of_b(w_num_of_b)
);

// arvalid&arready - rvalid & rready
fm_axi_monitor_r u_mon_read (
  .clk_core(clk_core),
  .rst_x(rst_x),
  .i_clear(1'b0),
  .i_arvalid(i_arvalid_m),
  .i_arready(i_arready_m),
  .i_arlen(i_arlen_m),
  .i_rresp(i_rresp_m),
  .i_rlast(i_rlast_m),
  .i_rvalid(i_rvalid_m),
  .i_rready(i_rready_m),
  // result out
  .o_set_no_wait(),
  .o_set_bukets(),
  .o_set_no_more(),
  .o_timer(),
  .o_bukets_no_wait(w_bukets_no_wait_r),
  .o_bukets_0(w_bukets_0_r),
  .o_bukets_1(w_bukets_1_r),
  .o_bukets_2(w_bukets_2_r),
  .o_bukets_3(w_bukets_3_r),
  .o_bukets_more(w_bukets_more_r),
  .o_rvalid_invalid_cycles(),
  .o_state(),
  .o_len(),
  .o_total_bytes(w_total_bytes_r),
  .o_rd_cont(w_rd_cont),
  .o_rd_discont(w_rd_discont),
  .o_bukets_nrdy_0(w_bukets_nrdy_0_r),
  .o_bukets_nrdy_1(w_bukets_nrdy_1_r),
  .o_bukets_nrdy_2(w_bukets_nrdy_2_r),
  .o_bukets_nrdy_3(w_bukets_nrdy_3_r)
);


`ifdef RTL_DEBUG
`else 
/*  
wire [35:0] CONTROL0;
wire [95:0] TRIG0;
wire [549:0] DATA;
chipscope_icon_v1_06_a_0 u_icon (
    .CONTROL0(CONTROL0)
);

chipscope_ila_v1_05_a_0 u_chipscope (
    .CONTROL(CONTROL0),
    .CLK(clk_core),
    .TRIG0(TRIG0),
    .DATA(DATA)
);

assign DATA[15:0] = o_bukets_no_wait_w[15:0];
assign DATA[31:16] = o_bukets_0_w[15:0];
assign DATA[47:32] = o_bukets_1_w[15:0];
assign DATA[63:48] = o_bukets_2_w[15:0];
assign DATA[79:64] = o_bukets_3_w[15:0];
assign DATA[95:80] = o_bukets_more_w[15:0];
assign DATA[111:96] = o_bukets_no_wait_r[15:0];
assign DATA[127:112] = o_bukets_0_r[15:0];
assign DATA[143:128] = o_bukets_1_r[15:0];
assign DATA[159:144] = o_bukets_2_r[15:0];
assign DATA[175:160] = o_bukets_3_r[15:0];
assign DATA[191:176] = o_bukets_more_r[15:0];
assign DATA[207:192] = o_bukets_no_wait_b[15:0];
assign DATA[223:208] = o_bukets_0_b[15:0];
assign DATA[239:224] = o_bukets_1_b[15:0];
assign DATA[255:240] = o_bukets_2_b[15:0];
assign DATA[271:256] = o_bukets_3_b[15:0];
assign DATA[287:272] = o_bukets_more_b[15:0];
assign DATA[303:288] = o_bukets_no_wait_rr[15:0];
assign DATA[319:304] = o_bukets_0_rr[15:0];
assign DATA[335:320] = o_bukets_1_rr[15:0];
assign DATA[351:336] = o_bukets_2_rr[15:0];
assign DATA[367:352] = o_bukets_3_rr[15:0];
assign DATA[383:368] = o_bukets_more_rr[15:0];
assign DATA[384] = w_set_no_wait_w;
assign DATA[388:385] = w_set_bukets_w[3:0];
assign DATA[389] = w_set_no_more_w;
assign DATA[405:390] = w_counter_w[15:0];
assign DATA[406] = w_set_no_wait_r;
assign DATA[410:407] = w_set_bukets_r[3:0];
assign DATA[411] = w_set_no_more_r;
assign DATA[427:412] = w_counter_r[15:0];
assign DATA[428] = w_set_no_wait_b;
assign DATA[432:429] = w_set_bukets_b[3:0];
assign DATA[433] = w_set_no_more_b;
assign DATA[449:434] = w_counter_b[15:0];
assign DATA[450] = w_set_no_wait_rr;
assign DATA[454:451] = w_set_bukets_rr[3:0];
assign DATA[455] = w_set_no_more_rr;
assign DATA[467:456] = w_timer_rr[11:0];
assign DATA[483:468] = w_num_of_cmd_w[15:0];
assign DATA[499:484] = w_num_of_b[15:0];
assign DATA[500] = i_awvalid_m;
assign DATA[501] = i_awready_m;
assign DATA[502] = i_wlast_m;
assign DATA[503] = i_wvalid_m;
assign DATA[504] = i_wready_m;
assign DATA[505] = i_bvalid_m;
assign DATA[506] = i_bready_m;
assign DATA[507] = i_arvalid_m;
assign DATA[508] = i_arready_m;
assign DATA[509] = i_rvalid_m;
assign DATA[510] = i_rready_m;
assign DATA[526:511] = r_wvalid_no_wready_cnt[15:0];
assign DATA[542:527] = w_rvalid_invalid_cycles[15:0];
assign DATA[543] = i_rlast_m;
assign DATA[544] = w_state;
assign DATA[549:545] = w_len;
   
assign TRIG0[0] = i_awvalid_m;
assign TRIG0[1] = i_awready_m;
assign TRIG0[2] = i_wlast_m;
assign TRIG0[3] = i_wvalid_m;
assign TRIG0[4] = i_wready_m;
assign TRIG0[5] = i_bvalid_m;
assign TRIG0[6] = i_bready_m;
assign TRIG0[7] = i_arvalid_m;
assign TRIG0[8] = i_arready_m;
assign TRIG0[9] = i_rvalid_m;
assign TRIG0[10] = i_rready_m;
assign TRIG0[11] = w_set_no_wait_w;
assign TRIG0[15:12] = w_set_bukets_w[3:0];
assign TRIG0[16] = w_set_no_more_w;
assign TRIG0[32:17] = w_counter_w[15:0];
assign TRIG0[33] = w_set_no_wait_r;
assign TRIG0[37:34] = w_set_bukets_r[3:0];
assign TRIG0[38] = w_set_no_more_r;
assign TRIG0[54:39] = w_counter_r[15:0];
assign TRIG0[55] = w_set_no_wait_b;
assign TRIG0[59:56] = w_set_bukets_b[3:0];
assign TRIG0[60] = w_set_no_more_b;
assign TRIG0[76:61] = w_counter_b[15:0];
assign TRIG0[77] = w_set_no_wait_rr;
assign TRIG0[81:78] = w_set_bukets_rr[3:0];
assign TRIG0[82] = w_set_no_more_rr;
assign TRIG0[94:83] = w_timer_rr[11:0];
assign TRIG0[95] = i_stop_trigger;
*/
`endif
endmodule
