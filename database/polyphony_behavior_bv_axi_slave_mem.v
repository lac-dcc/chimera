//=======================================================================
// Project Polyphony
//
// File:
//   bv_axi_slave_mem.v
//
// Abstract:
//   AXI memory
//
//  Created:
//    27 August 2008
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
//  Revision History

//`define RANDOM_RVALID
module bv_axi_slave_mem (
  clk_core,
  rst_x,
  // AXI
  //   write channel
  i_awid,
  i_awaddr,
  i_awlen,
  i_awsize,
  i_awburst,
  i_awlock,
  i_awcache,
  i_awprot,
  i_awvalid,
  o_awready,
  i_wid,
  i_wdata,
  i_wstrb,
  i_wlast,
  i_wvalid,
  o_wready,
  o_bid,
  i_bresp,
  o_bvalid,
  i_bready,
  //   read channel
  i_arid,
  i_araddr,
  i_arlen,
  i_arsize,
  i_arburst,
  i_arlock,
  i_arcache,
  i_arprot,
  i_arvalid,
  o_arready,
  o_rid,
  o_rdata,
  o_rresp,
  o_rlast,
  o_rvalid,
  i_rready
);
//////////////////////////////////
// parameter definition
//////////////////////////////////
`include "polyphony_axi_def.v"
  input clk_core;
  input rst_x;
  // AXI
  //   write channel
  input [P_AXI_M_AWID-1:0] i_awid;
  input [P_AXI_M_AWADDR-1:0] i_awaddr;
  input [P_AXI_M_AWLEN-1:0] i_awlen;
  input [P_AXI_M_AWSIZE-1:0] i_awsize;
  input [P_AXI_M_AWBURST-1:0] i_awburst;
  input [P_AXI_M_AWLOCK-1:0] i_awlock;
  input [P_AXI_M_AWCACHE-1:0] i_awcache;
  input [P_AXI_M_AWPROT-1:0] i_awprot;
  input i_awvalid;
  output  o_awready;
  input [P_AXI_M_WID-1:0] i_wid;
  input [P_AXI_M_WDATA-1:0] i_wdata;
  input [P_AXI_M_WSTRB-1:0] i_wstrb;
  input i_wlast;
  input i_wvalid;
  output o_wready;
  output [P_AXI_M_BID-1:0] o_bid;
  input [P_AXI_M_BRESP-1:0] i_bresp;
  output o_bvalid;
  input i_bready;
  //   read channel
  input [P_AXI_M_ARID-1:0] i_arid;
  input [P_AXI_M_ARADDR-1:0] i_araddr;
  input [P_AXI_M_ARLEN-1:0] i_arlen;
  input [P_AXI_M_ARSIZE-1:0] i_arsize;
  input [P_AXI_M_ARBURST-1:0] i_arburst;
  input [P_AXI_M_ARLOCK-1:0] i_arlock;
  input [P_AXI_M_ARCACHE-1:0] i_arcache;
  input [P_AXI_M_ARPROT-1:0] i_arprot;
  input i_arvalid;
  output  o_arready;
  output  [P_AXI_M_RID-1:0] o_rid;
  output  [P_AXI_M_RDATA-1:0] o_rdata;
  output  [P_AXI_M_RRESP-1:0] o_rresp;
  output  o_rlast;
  output  o_rvalid;
  input i_rready;

localparam P_MEM_SIZE='d24;

localparam P_W_IDLE = 0;
localparam P_W_WRITE = 1;
localparam P_W_WAIT = 2;

localparam P_B_IDLE = 0;
localparam P_B_OUT = 1;

localparam P_R_IDLE = 0;
localparam P_R_WAIT = 1;
localparam P_R_OUT = 2;

//////////////////////////////////
// reg
//////////////////////////////////
  reg [P_AXI_M_WDATA-1:0] r_mem[(1<<P_MEM_SIZE)-1:0];
  reg [3:0] r_w_state;
  reg [P_AXI_M_AWLEN-1:0] r_wlen;
  reg [3:0] r_r_state;
  reg [P_AXI_M_ARLEN-1:0] r_rlen;

  reg [3:0] r_b_state;
  reg [P_AXI_M_AWADDR-1-P_IB_DATA_WIDTH_POW2:0] r_waddr;
  reg [P_AXI_M_ARADDR-1-P_IB_DATA_WIDTH_POW2:0] r_raddr;
`ifdef RANDOM_RVALID
  reg r_rand_rvalid;
`endif
//////////////////////////////////
// wire
//////////////////////////////////
  wire [P_AXI_M_AWADDR-1-P_IB_DATA_WIDTH_POW2:0] w_waddr;
  wire [P_AXI_M_ARADDR-1-P_IB_DATA_WIDTH_POW2:0] w_raddr;

  wire           w_write;
  wire           w_end;
//////////////////////////////////
// assign
//////////////////////////////////
assign w_waddr = i_awaddr[P_AXI_M_AWADDR-1:P_IB_DATA_WIDTH_POW2];
assign w_raddr = i_araddr[P_AXI_M_ARADDR-1:P_IB_DATA_WIDTH_POW2];

`ifdef RANDOM_RVALID
assign o_awready = (r_w_state == P_W_IDLE) & r_rand_rvalid;
assign o_wready = (r_w_state == P_W_WRITE) & r_rand_rvalid;
`else
assign o_awready = (r_w_state == P_W_IDLE);
assign o_wready = (r_w_state == P_W_WRITE);
`endif
assign o_bid = 0;
assign o_bresp = 0;
assign o_bvalid = (r_b_state == P_B_OUT);

assign w_write = (r_w_state == P_W_WRITE) & i_wvalid;
assign w_end = (r_w_state == P_W_WRITE) & (r_wlen == 0) & i_wvalid;

assign o_arready = (r_r_state == P_R_IDLE);
assign o_rid = 0;
assign o_rdata = r_mem[r_raddr[P_MEM_SIZE-1:0]];
wire [63:0] w_tmp;
assign w_tmp = r_mem[r_raddr[P_MEM_SIZE-1:0]];
   
assign o_rresp = 0;
assign o_rlast = (r_rlen == 0); 
`ifdef RANDOM_RVALID
assign o_rvalid = (r_r_state == P_R_OUT) & r_rand_rvalid;
`else
assign o_rvalid = (r_r_state == P_R_OUT);
`endif
  
task memory_clear;
  integer i;
  begin
    for (i=0;i<1<<P_MEM_SIZE;i=i+1) r_mem[i] = {P_AXI_M_WDATA{1'b1}};
  end
endtask

task memory_clear_random;
  integer i;
  begin
    for (i=0;i<1<<P_MEM_SIZE;i=i+1) r_mem[i] = {$random,$random};
  end
endtask

//////////////////////////////////
// always
//////////////////////////////////

genvar gi;
generate for (gi=0;gi<P_AXI_M_WDATA/8;gi=gi+1) begin
always @(posedge clk_core) begin
  if (w_write) begin
    if (i_wstrb[gi]) r_mem[r_waddr[P_MEM_SIZE-1:0]][(gi+1)*8-1:gi*8] = i_wdata[(gi+1)*8-1:gi*8];
    // $display("write %d %x %x %x %x %x",gi,{r_waddr,3'b0},r_waddr,i_axi_mw.wdata[(gi+1)*8-1:gi*8],i_axi_mw.wdata,r_mem[r_waddr[P_MEM_SIZE-1:0]][(gi+1)*8-1:gi*8]);
  end
end
end
endgenerate

wire w_awvalid;
assign w_awvalid = i_awvalid;

wire w_wvalid;
assign w_wvalid = i_wvalid;

wire w_wlast;
assign w_wlast = i_wlast;
   

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_w_state <= P_W_IDLE;
  end else begin
    case (r_w_state)
      P_W_IDLE: begin
`ifdef RANDOM_RVALID
        if (i_awvalid & r_rand_rvalid) begin
`else
        if (i_awvalid) begin
`endif
          r_wlen <= i_awlen;
          //r_waddr <= i_axi_mw.awaddr[P_AXI_M_AWADDR-1:2];
          r_waddr <= w_waddr;
          r_w_state <= P_W_WRITE;
        end
      end
      P_W_WRITE: begin
`ifdef RANDOM_RVALID
        if (i_wvalid & r_rand_rvalid) begin
`else
        if (i_wvalid) begin
`endif
          r_waddr <= r_waddr + 1;
          r_wlen <= r_wlen - 1;
          if (r_wlen == 0) r_w_state <= P_W_IDLE;
        end else r_w_state <= P_W_WRITE;
      end
    endcase
  end
end


always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_b_state <= P_B_IDLE;
  end else begin
    case (r_b_state)
      P_B_IDLE: begin
       if (w_end) r_b_state <= P_B_OUT;
      end
      P_B_OUT: begin
       if (i_bready) r_b_state <= P_B_IDLE;
      end
    endcase
  end
end

`ifdef RANDOM_RVALID
always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_rand_rvalid <= 1'b1;
  end else begin
    r_rand_rvalid <= $random;
  end
end
`endif

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_r_state <= P_R_IDLE;
  end else begin
    case (r_r_state)
      P_R_IDLE: begin
        if (i_arvalid) begin
	   
          r_rlen <= i_arlen;
          //r_raddr <= i_axi_mr.araddr[P_AXI_M_ARADDR-1:2];
          r_raddr <= w_raddr;
          r_r_state <= P_R_WAIT;
        end
      end
      P_R_WAIT: begin
        r_r_state <= P_R_OUT;
      end
      P_R_OUT: begin
`ifdef RANDOM_RVALID
        if (i_rready & r_rand_rvalid) begin
`else
        if (i_rready) begin
`endif
          r_raddr <= r_raddr + 1;
          r_rlen <= r_rlen - 1;
          if (r_rlen == 0) r_r_state <= P_R_IDLE;
        end
      end
    endcase
  end
end

endmodule

