//=======================================================================
// Project Polyphony
//
// File:
//   fm_axi_m.v
//
// Abstract:
//   this module convert internal protocol to AXI
//   should care read-afrer-write in the same address
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
`include "polyphony_def.v"
module fm_axi_m (
  clk_core,
  rst_x,
  i_vtx_int,
  // AXI Master configuration
  i_conf_arcache_m,
  i_conf_aruser_m,
  i_conf_awcache_m,
  i_conf_awuser_m,
  // Local Memory Range
  i_brg_req,
  i_brg_adrs,
  i_brg_id,
  i_brg_rw,
  i_brg_len,
  o_brg_ack,
  i_brg_wdvalid,
  i_brg_be,
  i_brg_wdata,
  o_brg_wack,
  o_brg_rdvalid,
  o_brg_rid,
  o_brg_rdata,
  o_brg_rlast,
  o_init_done,
  // AXI write port
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
  // AXI read port
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
  o_rready_m
`ifdef USE_AXI_MONITOR
// result out
  ,
  i_stop_trigger,
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
`endif
);
`include "polyphony_axi_def.v"
//////////////////////////////////
// I/O port definition
//////////////////////////////////
  // system
  input clk_core;
  input rst_x;
  // debug
  input i_vtx_int;
  // AXI Master configuration
  input [3:0] i_conf_arcache_m;
  input [4:0] i_conf_aruser_m;
  input [3:0] i_conf_awcache_m;
  input [4:0] i_conf_awuser_m;
  // Bridge Interface
  input          i_brg_req;
  input  [P_IB_ADDR_WIDTH-1:0]
                 i_brg_adrs;
  input          i_brg_rw;
  input  [1:0]   i_brg_id;
  input  [P_IB_LEN_WIDTH-1:0]
                 i_brg_len;
  output         o_brg_ack;
  input          i_brg_wdvalid;
  input  [P_IB_BE_WIDTH-1:0]
                 i_brg_be;
  input  [P_IB_DATA_WIDTH-1:0]
                 i_brg_wdata;
  output         o_brg_wack;
  output         o_brg_rdvalid;
  output [1:0]   o_brg_rid;
  output [P_IB_DATA_WIDTH-1:0]
                 o_brg_rdata;
  output         o_brg_rlast;
  output         o_init_done;
  // AXI Master
  //   write port
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
  input  i_awready_m;
  output [P_AXI_M_WID-1:0] o_wid_m;
  output [P_AXI_M_WDATA-1:0] o_wdata_m;
  output [P_AXI_M_WSTRB-1:0] o_wstrb_m;
  output o_wlast_m;
  output o_wvalid_m;
  input  i_wready_m;
  input  [P_AXI_M_BID-1:0] i_bid_m;
  input  [P_AXI_M_BRESP-1:0] i_bresp_m;
  input  i_bvalid_m;
  output o_bready_m;
  //   read port
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
  input  i_arready_m;
  // read response
  input  [P_AXI_M_RID-1:0] i_rid_m;
  input  [P_AXI_M_RDATA-1:0] i_rdata_m;
  input  [P_AXI_M_RRESP-1:0] i_rresp_m;
  input  i_rlast_m;
  input  i_rvalid_m;
  output o_rready_m;
`ifdef USE_AXI_MONITOR
localparam P_BUCKET_SIZE     = 'd32;
  input i_stop_trigger;
  // awvalid
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
  // arvalid
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
  // wdata
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
  output [P_BUCKET_SIZE-1:0] o_bukets_nrdy_0_r;
  output [P_BUCKET_SIZE-1:0] o_bukets_nrdy_1_r;
  output [P_BUCKET_SIZE-1:0] o_bukets_nrdy_2_r;
  output [P_BUCKET_SIZE-1:0] o_bukets_nrdy_3_r;

`endif
//////////////////////////////////
// parameter definition
//////////////////////////////////
localparam P_IDLE = 1'b0;
localparam P_WPROC = 1'b1;
//////////////////////////////////
// reg
//////////////////////////////////
  reg         r_brg_rdvalid;
  reg         r_brg_rlast;
  reg [1:0]   r_brg_rid;
  reg [P_IB_DATA_WIDTH-1:0] r_brg_rdata;
  reg [P_AXI_M_AWLEN-1:0] r_awlen;
  reg [1:0]   r_brg_wid;

  reg         r_wstate;
//////////////////////////////////
// wire
//////////////////////////////////
  // command/data interface
  wire   [P_IB_LEN_WIDTH+P_IB_ADDR_WIDTH+2+1-1:0]
                 w_fifo_cin;
  wire   [P_IB_DATA_WIDTH+P_IB_BE_WIDTH-1:0]
                 w_fifo_din;
  wire   [P_IB_LEN_WIDTH+P_IB_ADDR_WIDTH+2+1-1:0]
                 w_fifo_cout;
  wire   [P_IB_DATA_WIDTH+P_IB_BE_WIDTH-1:0]
                 w_fifo_dout;
  wire           w_cfifo_ack;
  wire           w_dfifo_ack;
  wire           w_brg_req;
  wire   [P_IB_ADDR_WIDTH-1:0]
                 w_brg_adrs;
  wire           w_brg_rw;
  wire   [1:0]   w_brg_id;
  wire   [1:0]   w_brg_wid;
  wire   [P_IB_LEN_WIDTH-1:0]
                 w_brg_len;
  wire   [P_IB_BE_WIDTH-1:0]
                 w_brg_be;
  wire   [P_IB_DATA_WIDTH-1:0]
                 w_brg_wdata;
  wire           w_brg_wdvalid;
  wire           w_wr_full;
  wire           w_wr_hit;
  wire           w_wr_empty;
  wire           w_wc_ack;
  wire 	         w_wdd_last_data;
  wire           w_arready_m_raw;
  wire           w_awready_m;
  wire           w_is_idle;
  wire           w_is_wproc;

  wire   [P_IB_DATA_WIDTH+P_IB_BE_WIDTH-1:0]
                 w_fifo_dout_f;
  wire   w_ren_f;
  wire   w_full_f;
  wire   w_empty_f;
  wire   w_write_command;
//////////////////////////////////
// assign
//////////////////////////////////
  assign w_write_command = w_brg_req & w_brg_rw;
  assign {w_brg_be,w_brg_wdata} = w_fifo_dout_f;
  assign w_is_idle = (r_wstate == P_IDLE);
  assign w_is_wproc = (r_wstate == P_WPROC);
  assign o_init_done = 1'b1;
  assign w_wc_ack = o_awvalid_m & i_awready_m;
  assign w_wdd_last_data = o_wlast_m;
//  assign w_cfifo_ack = (w_brg_rw) ? i_awready_m : i_arready_m;
// arready should be masked if RAW condition
  assign w_arready_m_raw = (w_wr_empty) ? i_arready_m :
                                          i_arready_m & (!w_wr_hit);
  assign w_awready_m = (w_wr_full) ? 1'b0 : i_awready_m;
  assign w_cfifo_ack = (r_wstate == P_WPROC) ? 1'b0:
                       (!w_brg_req) ? 1'b1:
                       (w_brg_rw) ? w_awready_m : w_arready_m_raw;
  assign w_fifo_cin = {i_brg_id,i_brg_rw,i_brg_adrs,i_brg_len};
  assign w_fifo_din = {i_brg_be,i_brg_wdata};
  assign {w_brg_id,w_brg_rw,w_brg_adrs,w_brg_len} = w_fifo_cout;
  assign w_ren_f = (w_empty_f) ? 1'b1:
                                 (w_is_wproc & i_wready_m);
// AXI write
  assign o_awid_m = {{(P_AXI_M_AWID-2){1'b0}},w_brg_id};
  assign o_awaddr_m = {w_brg_adrs,{P_IB_DATA_WIDTH_POW2{1'b0}}};
  assign o_awlen_m = w_brg_len-1'b1;
`ifdef PP_BUSWIDTH_64
  assign o_awsize_m = 'd3;
`else
  assign o_awsize_m = 'd2;
`endif
  assign o_awburst_m = 'd1;
  assign o_awlock_m = 'd0; // normal access
  assign o_awcache_m = i_conf_awcache_m;  // non-cachable
  assign o_awuser_m = i_conf_awuser_m;
  assign o_awprot_m = 'd0;
  assign o_awvalid_m = (w_wr_full| w_is_wproc) ? 1'b0 :
                        w_brg_req & w_brg_rw;
  assign w_brg_wid = (o_awvalid_m) ? w_brg_id : r_brg_wid;
  assign o_wid_m = {{(P_AXI_M_WID-2){1'b0}},w_brg_wid};
  assign o_wdata_m = w_brg_wdata;
  assign o_wstrb_m = w_brg_be;
  assign o_wlast_m = (r_awlen == 'd1);
  assign o_wvalid_m = w_is_wproc & (!w_empty_f);
  assign o_bready_m = !w_wr_full;
// AXI read
  assign o_arid_m = {{(P_AXI_M_ARID-2){1'b0}},w_brg_id};
  assign o_araddr_m = {w_brg_adrs,{P_IB_DATA_WIDTH_POW2{1'b0}}};
  assign o_arlen_m = w_brg_len-1'b1;
`ifdef PP_BUSWIDTH_64
  assign o_arsize_m = 'd3;
`else
  assign o_arsize_m = 'd2;
`endif
  assign o_arburst_m = 'd1;
  assign o_arlock_m = 'd0; // normal access
  assign o_arcache_m = i_conf_arcache_m;  // non-cachable
  assign o_aruser_m = i_conf_aruser_m;
  assign o_arprot_m = 'd0;
  assign o_arvalid_m = (w_is_wproc) ? 1'b0:
                       (w_wr_empty) ? w_brg_req & (!w_brg_rw) : 
                                      w_brg_req & (!w_brg_rw) & (!w_wr_hit);
  assign o_rready_m = 1'b1;
  // read response
  assign o_brg_rdvalid = r_brg_rdvalid;
  assign o_brg_rid = r_brg_rid;
  assign o_brg_rdata = r_brg_rdata;
  assign o_brg_rlast = r_brg_rlast;

//////////////////////////////////
// always
//////////////////////////////////

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_wstate <= P_IDLE;
    r_awlen <= 'd0;
  end else begin
    case (r_wstate)
      P_IDLE: begin
        if (w_write_command & w_cfifo_ack ) begin
          r_awlen <= w_brg_len;
          r_wstate <= P_WPROC;
        end
      end
      P_WPROC: begin
        if (!w_empty_f & i_wready_m) begin
          r_awlen <= r_awlen - 1'b1;  // data accept only
          if (w_wdd_last_data) r_wstate <= P_IDLE;
        end
      end
    endcase
  end
end

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_brg_rdvalid <= 1'b0;
  end else begin
    r_brg_rdvalid <= i_rvalid_m;
  end
end

always @(posedge clk_core) begin
  r_brg_rid <= i_rid_m[1:0];
  r_brg_rdata <= i_rdata_m;
  r_brg_rlast <= i_rlast_m;
end

always @(posedge clk_core) begin
  if (w_wc_ack) begin
    r_brg_wid <= w_brg_id;
  end
end
//////////////////////////////////
// module instance
//////////////////////////////////

// command interface
fm_cmn_cinterface #(P_IB_LEN_WIDTH+P_IB_ADDR_WIDTH+2+1) u_cinterface (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // bus side port
  .i_bstr(i_brg_req),
  .i_bdata(w_fifo_cin),
  .o_back(o_brg_ack),
  // internal port
  .o_istr(w_brg_req),
  .o_idata(w_fifo_cout),
  .i_iack(w_cfifo_ack)
);

// data interface
fm_cmn_dinterface #(P_IB_DATA_WIDTH+P_IB_BE_WIDTH) u_dinterface (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // bus side port
  .i_bstr(i_brg_wdvalid),
  .i_bdata(w_fifo_din),
  .o_back(o_brg_wack),
  // internal port
  .o_istr(w_brg_wdvalid),
  .o_idata(w_fifo_dout),
  .i_iack(!w_full_f)
);

// write data fifo
fm_fifo #(P_IB_DATA_WIDTH+P_IB_BE_WIDTH,1) u_wd_fifo (
  .clk_core(clk_core),
  .rst_x(rst_x),
  .i_wstrobe(w_brg_wdvalid),
  .i_dt(w_fifo_dout),
  .o_full(w_full_f),
  .i_renable(w_ren_f),
  .o_dt(w_fifo_dout_f),
  .o_empty(w_empty_f),
  .o_dnum()
);

/*
   assign w_wr_full = 0;
   assign w_wr_empty = 1;
   assign w_wr_hit = 0;
*/   
   
// write response fifo
fm_raw_fifo #(P_IB_ADDR_WIDTH) u_raw_fifo (
  .clk_core(clk_core),
  .rst_x(rst_x),
  .i_check_address(i_brg_adrs),
  .o_hit(w_wr_hit),
  .i_wstrobe(w_wc_ack),
  .i_dt(i_brg_adrs),
  .o_full(w_wr_full),
  .i_renable(i_bvalid_m),
  .o_dt(),
  .o_empty(w_wr_empty),
  .o_dnum()
);

///////////////////////////////////////////////////////////
// debug signals
reg [15:0] r_in_rcmd;
reg [15:0] r_in_wcmd;
reg [15:0] r_in_wd;

reg [15:0] r_axi_rcmd;
reg [15:0] r_axi_wcmd;
reg [15:0] r_axi_wd;
reg [15:0] r_axi_wd_last;
reg [15:0] r_axi_rd;
reg [15:0] r_axi_rd_last;
reg [15:0] r_axi_bcmd;

// id check
wire [1:0] w_last_rid;
wire w_rd_id;
wire w_diff;
assign w_rd_id = r_brg_rlast & r_brg_rdvalid;
assign w_diff = r_brg_rdvalid & w_last_rid != r_brg_rid;
   
fm_fifo #(2,8) u_id (
  .clk_core(clk_core),
  .rst_x(rst_x),
  .i_wstrobe(i_brg_req & (!i_brg_rw)),
  .i_dt(i_brg_id),
  .o_full(),
  .i_renable(w_rd_id),
  .o_dt(w_last_rid),
  .o_empty(),
  .o_dnum()
);

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_in_rcmd <= 'd0;
    r_in_wcmd <= 'd0;
    r_in_wd <= 'd0;
  end else begin
    if (i_brg_req & (!i_brg_rw)) r_in_rcmd <= r_in_rcmd + 1'b1;
    if (i_brg_req & i_brg_rw) r_in_wcmd <= r_in_wcmd + 1'b1;
    if (i_brg_wdvalid) r_in_wd <= r_in_wd + 1'b1;
  end
end

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_axi_rcmd <= 'd0;
    r_axi_wcmd <= 'd0;
    r_axi_wd <= 'd0;
    r_axi_wd_last <= 'd0;
    r_axi_bcmd <= 'd0;
  end else begin
    if (o_arvalid_m & i_arready_m) r_axi_rcmd <= r_axi_rcmd + 1'b1;
    if (o_awvalid_m & i_awready_m) r_axi_wcmd <= r_axi_wcmd + 1'b1;
    if (o_wvalid_m & i_wready_m) r_axi_wd <= r_axi_wd + 1'b1;
    if (o_wvalid_m & i_wready_m & o_wlast_m) r_axi_wd_last <= r_axi_wd_last + 1'b1;
    if (i_bvalid_m & o_bready_m) r_axi_bcmd <= r_axi_bcmd + 1'b1;
    if (i_rvalid_m & o_rready_m) r_axi_rd <= r_axi_rd + 1'b1;
    if (i_rvalid_m & o_rready_m & i_rlast_m) r_axi_rd_last <= r_axi_rd_last + 1'b1;

  end
end

`ifdef USE_AXI_MONITOR
fm_axi_monitor u_axi_monitor (
  .clk_core(clk_core),
  .rst_x(rst_x),
  .i_stop_trigger(i_stop_trigger),
  // AXI write port
  .i_awid_m(o_awid_m),
  .i_awaddr_m(o_awaddr_m),
  .i_awlen_m(o_awlen_m),
  .i_awsize_m(o_awsize_m),
  .i_awburst_m(o_awburst_m),
  .i_awlock_m(o_awlock_m),
  .i_awcache_m(o_awcache_m),
  .i_awuser_m(o_awuser_m),
  .i_awprot_m(o_awprot_m),
  .i_awvalid_m(o_awvalid_m),
  .i_awready_m(i_awready_m),
  .i_wid_m(o_wid_m),
  .i_wdata_m(o_wdata_m),
  .i_wstrb_m(o_wstrb_m),
  .i_wlast_m(o_wlast_m),
  .i_wvalid_m(o_wvalid_m),
  .i_wready_m(i_wready_m),
  .i_bid_m(i_bid_m),
  .i_bresp_m(i_bresp_m),
  .i_bvalid_m(i_bvalid_m),
  .i_bready_m(o_bready_m),
  // AXI read port
  .i_arid_m(o_arid_m),
  .i_araddr_m(o_araddr_m),
  .i_arlen_m(o_arlen_m),
  .i_arsize_m(o_arsize_m),
  .i_arburst_m(o_arburst_m),
  .i_arlock_m(o_arlock_m),
  .i_arcache_m(o_arcache_m),
  .i_aruser_m(o_aruser_m),
  .i_arprot_m(o_arprot_m),
  .i_arvalid_m(o_arvalid_m),
  .i_arready_m(i_arready_m),
  .i_rid_m(i_rid_m),
  .i_rdata_m(i_rdata_m),
  .i_rresp_m(i_rresp_m),
  .i_rlast_m(i_rlast_m),
  .i_rvalid_m(i_rvalid_m),
  .i_rready_m(o_rready_m),
// result out
  // awvalid
  .o_bukets_no_wait_aw(o_bukets_no_wait_aw),
  .o_bukets_0_aw(o_bukets_0_aw),
  .o_bukets_1_aw(o_bukets_1_aw),
  .o_bukets_2_aw(o_bukets_2_aw),
  .o_bukets_3_aw(o_bukets_3_aw),
  .o_bukets_more_aw(o_bukets_more_aw),
  .o_max_count_aw(o_max_count_aw),
  .o_min_count_aw(o_min_count_aw),
  .o_bukets_len_0_aw(o_bukets_len_0_aw),
  .o_bukets_len_1_aw(o_bukets_len_1_aw),
  .o_bukets_len_2_aw(o_bukets_len_2_aw),
  .o_bukets_len_3_aw(o_bukets_len_3_aw),
  .o_total_bytes_w(o_total_bytes_w),
  .o_cont_w(o_cont_w),
  .o_discont_w(o_discont_w),
  // arvalid
  .o_bukets_no_wait_ar(o_bukets_no_wait_ar),
  .o_bukets_0_ar(o_bukets_0_ar),
  .o_bukets_1_ar(o_bukets_1_ar),
  .o_bukets_2_ar(o_bukets_2_ar),
  .o_bukets_3_ar(o_bukets_3_ar),
  .o_bukets_more_ar(o_bukets_more_ar),
  .o_max_count_ar(o_max_count_ar),
  .o_min_count_ar(o_min_count_ar),
  .o_bukets_len_0_ar(o_bukets_len_0_ar),
  .o_bukets_len_1_ar(o_bukets_len_1_ar),
  .o_bukets_len_2_ar(o_bukets_len_2_ar),
  .o_bukets_len_3_ar(o_bukets_len_3_ar),
  .o_cont_ar(o_cont_ar),
  .o_discont_ar(o_discont_ar),
  .o_bukets_nrdy_0_w(o_bukets_nrdy_0_w),
  .o_bukets_nrdy_1_w(o_bukets_nrdy_1_w),
  .o_bukets_nrdy_2_w(o_bukets_nrdy_2_w),
  .o_bukets_nrdy_3_w(o_bukets_nrdy_3_w),
  // wdata
  .o_bukets_no_wait_b(o_bukets_no_wait_b),
  .o_bukets_0_b(o_bukets_0_b),
  .o_bukets_1_b(o_bukets_1_b),
  .o_bukets_2_b(o_bukets_2_b),
  .o_bukets_3_b(o_bukets_3_b),
  .o_bukets_more_b(o_bukets_more_b),
  .o_num_of_cmd_b(o_num_of_cmd_b),
  .o_num_of_b(o_num_of_b),
  // rdata
  .o_bukets_no_wait_r(o_bukets_no_wait_r),
  .o_bukets_0_r(o_bukets_0_r),
  .o_bukets_1_r(o_bukets_1_r),
  .o_bukets_2_r(o_bukets_2_r),
  .o_bukets_3_r(o_bukets_3_r),
  .o_bukets_more_r(o_bukets_more_r),
  .o_total_bytes_r(o_total_bytes_r),
  .o_rd_cont(o_rd_cont),
  .o_rd_discont(o_rd_discont),
  .o_bukets_nrdy_0_r(o_bukets_nrdy_0_r),
  .o_bukets_nrdy_1_r(o_bukets_nrdy_1_r),
  .o_bukets_nrdy_2_r(o_bukets_nrdy_2_r),
  .o_bukets_nrdy_3_r(o_bukets_nrdy_3_r)
);
`endif
   
//////////////////////////////////////////////////////////
/*
wire [35:0] CONTROL0;
wire [192:0] TRIG0;
wire [436:0] DATA;
chipscope_icon_v1_06_a_0 u_icon (
    .CONTROL0(CONTROL0)
);

chipscope_ila_v1_05_a_0 u_chipscope (
    .CONTROL(CONTROL0),
    .CLK(clk_core),
    .TRIG0(TRIG0),
    .DATA(DATA)
);

   assign DATA[0] = i_brg_req;
   assign DATA[30:1] = i_brg_adrs[29:0];
   assign DATA[31] = i_brg_rw;
   assign DATA[37:32] = i_brg_len[5:0];
   assign DATA[38] = o_brg_ack;
   assign DATA[39] = i_brg_wdvalid;
   assign DATA[43:40] = i_brg_be[3:0];
   assign DATA[75:44] = i_brg_wdata[31:0];
   assign DATA[76] = o_brg_wack;
   assign DATA[77] = o_brg_rdvalid;
   assign DATA[109:78] = o_brg_rdata[31:0];
   //   write port
   assign DATA[113:110] = o_awid_m[3:0];
   assign DATA[145:114] = o_awaddr_m[31:0];
   assign DATA[150:146] = o_awlen_m[4:0];
   assign DATA[151] = o_awvalid_m;
   assign DATA[152] = i_awready_m;
   assign DATA[156:153] = o_wid_m[3:0];
   assign DATA[188:157] = o_wdata_m[31:0];
   assign DATA[192:189] = o_wstrb_m[3:0];
   assign DATA[193] = o_wlast_m;
   assign DATA[194] = o_wvalid_m;
   assign DATA[195] = i_wready_m;
   assign DATA[199:196] = i_bid_m[3:0];
   assign DATA[201:200] = i_bresp_m[1:0];
   assign DATA[202] = i_bvalid_m;
   assign DATA[203] = o_bready_m;
  //   read port
   assign DATA[207:204] = o_arid_m[3:0];
   assign DATA[239:208] = o_araddr_m[31:0];
   assign DATA[244:240] = o_arlen_m[4:0];
   assign DATA[245] = o_arvalid_m;
   assign DATA[246] = i_arready_m;
  // read response
   assign DATA[250:247] = i_rid_m[3:0];
   assign DATA[282:251] = i_rdata_m[31:0];
   assign DATA[284:283] = i_rresp_m[1:0];
   assign DATA[285] = i_rlast_m;
   assign DATA[286] = i_rvalid_m;
   assign DATA[287] = o_rready_m;
   assign DATA[303:288] = r_in_rcmd[15:0];
   assign DATA[319:304] = r_in_wcmd[15:0];
   assign DATA[335:320] = r_in_wd[15:0];
   assign DATA[351:336] = r_axi_rcmd[15:0];
   assign DATA[367:352] = r_axi_wcmd[15:0];
   assign DATA[383:368] = r_axi_wd[15:0];
   assign DATA[399:384] = r_axi_bcmd[15:0];
   assign DATA[415:400] = r_axi_wd_last[15:0];
   assign DATA[431:416] = r_axi_rd_last[15:0];
   assign DATA[433:432] = r_brg_rid;
   assign DATA[435:434] = w_last_rid;
   assign DATA[436] = w_diff;
   
   assign TRIG0[0] = i_brg_req;
   assign TRIG0[30:1] = i_brg_adrs[29:0];
   assign TRIG0[31] = i_brg_rw;
   assign TRIG0[37:32] = i_brg_len[5:0];
   assign TRIG0[38] = o_brg_ack;
   assign TRIG0[39] = i_brg_wdvalid;
   assign TRIG0[43:40] = i_brg_be[3:0];
   assign TRIG0[75:44] = i_brg_wdata[31:0];
   assign TRIG0[76] = o_brg_wack;
   assign TRIG0[77] = o_brg_rdvalid;
   assign TRIG0[109:78] = o_brg_rdata[31:0];
   //   write port
   assign TRIG0[113:110] = o_awid_m[3:0];
   assign TRIG0[118:114] = o_awlen_m[4:0];
   assign TRIG0[119] = o_awvalid_m;
   assign TRIG0[120] = i_awready_m;
   assign TRIG0[124:121] = o_wid_m[3:0];
   assign TRIG0[128:125] = o_wstrb_m[3:0];
   assign TRIG0[129] = o_wlast_m;
   assign TRIG0[130] = o_wvalid_m;
   assign TRIG0[131] = i_wready_m;
   assign TRIG0[135:132] = i_bid_m[3:0];
   assign TRIG0[137:136] = i_bresp_m[1:0];
   assign TRIG0[138] = i_bvalid_m;
   assign TRIG0[139] = o_bready_m;
  //   read port
   assign TRIG0[143:140] = o_arid_m[3:0];
   assign TRIG0[175:144] = o_araddr_m[31:0];
   assign TRIG0[180:176] = o_arlen_m[4:0];
   assign TRIG0[181] = o_arvalid_m;
   assign TRIG0[182] = i_arready_m;
  // read response
   assign TRIG0[186:183] = i_rid_m[3:0];
   assign TRIG0[188:187] = i_rresp_m[1:0];
   assign TRIG0[189] = i_rlast_m;
   assign TRIG0[190] = i_rvalid_m;
   assign TRIG0[191] = o_rready_m;
   assign TRIG0[192] = w_diff;
*/
endmodule
