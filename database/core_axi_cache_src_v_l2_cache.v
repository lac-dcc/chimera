// This program was cloned from: https://github.com/ultraembedded/core_axi_cache
// License: BSD 3-Clause "New" or "Revised" License

//-----------------------------------------------------------------
// Copyright (c) 2021, admin@ultra-embedded.com
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions 
// are met:
//   - Redistributions of source code must retain the above copyright
//     notice, this list of conditions and the following disclaimer.
//   - Redistributions in binary form must reproduce the above copyright
//     notice, this list of conditions and the following disclaimer 
//     in the documentation and/or other materials provided with the 
//     distribution.
//   - Neither the name of the author nor the names of its contributors 
//     may be used to endorse or promote products derived from this 
//     software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE 
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF 
// SUCH DAMAGE.
//-----------------------------------------------------------------
module l2_cache
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
     parameter AXI_ID           = 0
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           dbg_mode_i
    ,input           inport_awvalid_i
    ,input  [ 31:0]  inport_awaddr_i
    ,input  [  3:0]  inport_awid_i
    ,input  [  7:0]  inport_awlen_i
    ,input  [  1:0]  inport_awburst_i
    ,input  [  2:0]  inport_awsize_i
    ,input           inport_wvalid_i
    ,input  [ 31:0]  inport_wdata_i
    ,input  [  3:0]  inport_wstrb_i
    ,input           inport_wlast_i
    ,input           inport_bready_i
    ,input           inport_arvalid_i
    ,input  [ 31:0]  inport_araddr_i
    ,input  [  3:0]  inport_arid_i
    ,input  [  7:0]  inport_arlen_i
    ,input  [  1:0]  inport_arburst_i
    ,input  [  2:0]  inport_arsize_i
    ,input           inport_rready_i
    ,input           outport_awready_i
    ,input           outport_wready_i
    ,input           outport_bvalid_i
    ,input  [  1:0]  outport_bresp_i
    ,input  [  3:0]  outport_bid_i
    ,input           outport_arready_i
    ,input           outport_rvalid_i
    ,input  [255:0]  outport_rdata_i
    ,input  [  1:0]  outport_rresp_i
    ,input  [  3:0]  outport_rid_i
    ,input           outport_rlast_i

    // Outputs
    ,output          inport_awready_o
    ,output          inport_wready_o
    ,output          inport_bvalid_o
    ,output [  1:0]  inport_bresp_o
    ,output [  3:0]  inport_bid_o
    ,output          inport_arready_o
    ,output          inport_rvalid_o
    ,output [ 31:0]  inport_rdata_o
    ,output [  1:0]  inport_rresp_o
    ,output [  3:0]  inport_rid_o
    ,output          inport_rlast_o
    ,output          outport_awvalid_o
    ,output [ 31:0]  outport_awaddr_o
    ,output [  3:0]  outport_awid_o
    ,output [  7:0]  outport_awlen_o
    ,output [  1:0]  outport_awburst_o
    ,output          outport_wvalid_o
    ,output [255:0]  outport_wdata_o
    ,output [ 31:0]  outport_wstrb_o
    ,output          outport_wlast_o
    ,output          outport_bready_o
    ,output          outport_arvalid_o
    ,output [ 31:0]  outport_araddr_o
    ,output [  3:0]  outport_arid_o
    ,output [  7:0]  outport_arlen_o
    ,output [  1:0]  outport_arburst_o
    ,output          outport_rready_o
);



wire [ 31:0]  mem_in_addr_w;
wire [ 31:0]  mem_in_data_wr_w;
wire          mem_in_rd_w;
wire [  3:0]  mem_in_wr_w;
wire [ 31:0]  mem_in_data_rd_w;
wire          mem_in_accept_w;
wire          mem_in_ack_w;
wire          mem_in_error_w;

wire          mem_out_wr_w;
wire          mem_out_rd_w;
wire [ 31:0]  mem_out_addr_w;
wire [255:0]  mem_out_write_data_w;
wire          mem_out_accept_w;
wire          mem_out_ack_w;
wire          mem_out_error_w;
wire [255:0]  mem_out_read_data_w;

reg dbg_mode_q;

always @ (posedge clk_i )
if (rst_i)
    dbg_mode_q <= 1'b0;
else
    dbg_mode_q <= dbg_mode_i;

wire flush_w = !dbg_mode_i & dbg_mode_q;

l2_cache_inport
u_ingress
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    ,.axi_awvalid_i(inport_awvalid_i)
    ,.axi_awaddr_i(inport_awaddr_i)
    ,.axi_awid_i(inport_awid_i)
    ,.axi_awlen_i(inport_awlen_i)
    ,.axi_awburst_i(inport_awburst_i)
    ,.axi_wvalid_i(inport_wvalid_i)
    ,.axi_wdata_i(inport_wdata_i)
    ,.axi_wstrb_i(inport_wstrb_i)
    ,.axi_wlast_i(inport_wlast_i)
    ,.axi_bready_i(inport_bready_i)
    ,.axi_arvalid_i(inport_arvalid_i)
    ,.axi_araddr_i(inport_araddr_i)
    ,.axi_arid_i(inport_arid_i)
    ,.axi_arlen_i(inport_arlen_i)
    ,.axi_arburst_i(inport_arburst_i)
    ,.axi_rready_i(inport_rready_i)
    ,.axi_awready_o(inport_awready_o)
    ,.axi_wready_o(inport_wready_o)
    ,.axi_bvalid_o(inport_bvalid_o)
    ,.axi_bresp_o(inport_bresp_o)
    ,.axi_bid_o(inport_bid_o)
    ,.axi_arready_o(inport_arready_o)
    ,.axi_rvalid_o(inport_rvalid_o)
    ,.axi_rdata_o(inport_rdata_o)
    ,.axi_rresp_o(inport_rresp_o)
    ,.axi_rid_o(inport_rid_o)
    ,.axi_rlast_o(inport_rlast_o)

    ,.outport_wr_o(mem_in_wr_w)
    ,.outport_rd_o(mem_in_rd_w)
    ,.outport_addr_o(mem_in_addr_w)
    ,.outport_write_data_o(mem_in_data_wr_w)
    ,.outport_accept_i(mem_in_accept_w)
    ,.outport_ack_i(mem_in_ack_w)
    ,.outport_error_i(mem_in_error_w)
    ,.outport_read_data_i(mem_in_data_rd_w)
);

l2_cache_core
u_core
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    ,.flush_i(flush_w)

    ,.inport_addr_i(mem_in_addr_w)
    ,.inport_data_wr_i(mem_in_data_wr_w)
    ,.inport_rd_i(mem_in_rd_w)
    ,.inport_wr_i(mem_in_wr_w)
    ,.inport_data_rd_o(mem_in_data_rd_w)
    ,.inport_accept_o(mem_in_accept_w)
    ,.inport_ack_o(mem_in_ack_w)
    ,.inport_error_o(mem_in_error_w)

    ,.outport_wr_o(mem_out_wr_w)
    ,.outport_rd_o(mem_out_rd_w)
    ,.outport_addr_o(mem_out_addr_w)
    ,.outport_write_data_o(mem_out_write_data_w)
    ,.outport_accept_i(mem_out_accept_w)
    ,.outport_ack_i(mem_out_ack_w)
    ,.outport_error_i(mem_out_error_w)
    ,.outport_read_data_i(mem_out_read_data_w)
);

l2_cache_outport
#(
     .AXI_ID(AXI_ID)
)
u_egress
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    ,.inport_wr_i(mem_out_wr_w)
    ,.inport_rd_i(mem_out_rd_w)
    ,.inport_addr_i(mem_out_addr_w)
    ,.inport_write_data_i(mem_out_write_data_w)
    ,.inport_accept_o(mem_out_accept_w)
    ,.inport_ack_o(mem_out_ack_w)
    ,.inport_error_o(mem_out_error_w)
    ,.inport_read_data_o(mem_out_read_data_w)

    ,.outport_awvalid_o(outport_awvalid_o)
    ,.outport_awaddr_o(outport_awaddr_o)
    ,.outport_awid_o(outport_awid_o)
    ,.outport_awlen_o(outport_awlen_o)
    ,.outport_awburst_o(outport_awburst_o)
    ,.outport_wvalid_o(outport_wvalid_o)
    ,.outport_wdata_o(outport_wdata_o)
    ,.outport_wstrb_o(outport_wstrb_o)
    ,.outport_wlast_o(outport_wlast_o)
    ,.outport_bready_o(outport_bready_o)
    ,.outport_arvalid_o(outport_arvalid_o)
    ,.outport_araddr_o(outport_araddr_o)
    ,.outport_arid_o(outport_arid_o)
    ,.outport_arlen_o(outport_arlen_o)
    ,.outport_arburst_o(outport_arburst_o)
    ,.outport_rready_o(outport_rready_o)
    ,.outport_awready_i(outport_awready_i)
    ,.outport_wready_i(outport_wready_i)
    ,.outport_bvalid_i(outport_bvalid_i)
    ,.outport_bresp_i(outport_bresp_i)
    ,.outport_bid_i(outport_bid_i)
    ,.outport_arready_i(outport_arready_i)
    ,.outport_rvalid_i(outport_rvalid_i)
    ,.outport_rdata_i(outport_rdata_i)
    ,.outport_rresp_i(outport_rresp_i)
    ,.outport_rid_i(outport_rid_i)
    ,.outport_rlast_i(outport_rlast_i)
);


endmodule
