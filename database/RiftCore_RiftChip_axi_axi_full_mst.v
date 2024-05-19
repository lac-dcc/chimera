// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: axi_full_mst
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-19 11:37:20
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-24 14:30:59
*/





/*
	Copyright (c) 2020 - 2021 Ruige Lee <wut.ruigeli@gmail.com>

	 Licensed under the Apache License, Version 2.0 (the "License");
	 you may not use this file except in compliance with the License.
	 You may obtain a copy of the License at

			 http://www.apache.org/licenses/LICENSE-2.0

	 Unless required by applicable law or agreed to in writing, software
	 distributed under the License is distributed on an "AS IS" BASIS,
	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 See the License for the specific language governing permissions and
	 limitations under the License.
*/


`timescale 1 ns / 1 ps





module axi_full_mst #
(
	parameter DW = 64,
	parameter AW = 64,
	parameter ID_W = 1,
	parameter USER_W = 1
)
(

	output [ID_W-1:0] M_AXI_AWID,
	output [AW-1:0] M_AXI_AWADDR,
	output [7:0] M_AXI_AWLEN,
	output [2:0] M_AXI_AWSIZE,
	output [1:0] M_AXI_AWBURST,
	output M_AXI_AWLOCK,
	output [3:0] M_AXI_AWCACHE,
	output [2:0] M_AXI_AWPROT,
	output [3:0] M_AXI_AWQOS,
	output [USER_W-1:0] M_AXI_AWUSER,
	output M_AXI_AWVALID,
	input M_AXI_AWREADY,

	output [DW-1:0] M_AXI_WDATA,
	output [DW/8-1:0] M_AXI_WSTRB,
	output M_AXI_WLAST,
	output [USER_W-1:0] M_AXI_WUSER,
	output M_AXI_WVALID,
	input M_AXI_WREADY,

	input [ID_W-1:0] M_AXI_BID,
	input [1:0] M_AXI_BRESP,
	input [USER_W-1:0] M_AXI_BUSER,
	input M_AXI_BVALID,
	output M_AXI_BREADY,

	output [ID_W-1:0] M_AXI_ARID,
	output [AW-1:0] M_AXI_ARADDR,
	output [7:0] M_AXI_ARLEN,
	output [2:0] M_AXI_ARSIZE,
	output [1:0] M_AXI_ARBURST,
	output M_AXI_ARLOCK,
	output [3:0] M_AXI_ARCACHE,
	output [2:0] M_AXI_ARPROT,
	output [3:0] M_AXI_ARQOS,
	output [USER_W-1:0] M_AXI_ARUSER,
	output M_AXI_ARVALID,
	input M_AXI_ARREADY,

	input [ID_W-1:0] M_AXI_RID,
	input [DW-1:0] M_AXI_RDATA,
	input [1:0] M_AXI_RRESP,
	input M_AXI_RLAST,
	input [USER_W-1:0] M_AXI_RUSER,
	input M_AXI_RVALID,
	output M_AXI_RREADY,

	input CLK,
	input RSTn
);


	wire axi_awvalid_set, axi_awvalid_rst, axi_awvalid_qout;
	wire axi_wvalid_set, axi_wvalid_rst, axi_wvalid_qout;
	wire axi_wlast_set, axi_wlast_rst, axi_wlast_qout;
	wire [7:0] write_index_dnxt;
	wire [7:0] write_index_qout;
	wire axi_bready_set, axi_bready_rst, axi_bready_qout;
	wire axi_arvalid_set, axi_arvalid_rst, axi_arvalid_qout;
	wire [7:0] read_index_dnxt;
	wire [7:0] read_index_qout;
	wire axi_rready_set, axi_rready_rst, axi_rready_qout;
	wire wnext, rnext;
	wire write_resp_error, read_resp_error;
	wire start_single_burst_read, start_single_burst_write;


	assign M_AXI_AWID = 'b0;
	assign M_AXI_AWADDR	= ;
	assign M_AXI_AWLEN = C_M_AXI_BURST_LEN - 1;//Burst LENgth is number of transaction beats, minus 1
	assign M_AXI_AWSIZE	= $clog2(DW/8);//Size should be C_M_AXI_DATA_WIDTH, in 2^SIZE bytes, otherwise narrow bursts are used
	assign M_AXI_AWBURST = 2'b01;//INCR burst type is usually used, except for keyhole bursts
	assign M_AXI_AWLOCK	= 1'b0;
	assign M_AXI_AWCACHE = 4'b0010;//Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
	assign M_AXI_AWPROT	= 3'h0;
	assign M_AXI_AWQOS = 4'h0;
	assign M_AXI_AWUSER	= 'b1;
	assign M_AXI_AWVALID = axi_awvalid_qout;

	assign M_AXI_WDATA = ;
	assign M_AXI_WSTRB = {(DW/8){1'b1}};//All bursts are complete and aligned in this example
	assign M_AXI_WLAST = axi_wlast_qout;
	assign M_AXI_WUSER = 'b0;
	assign M_AXI_WVALID	= axi_wvalid_qout;

	assign M_AXI_BREADY	= axi_bready_qout;


	assign M_AXI_ARID = 'b0;
	assign M_AXI_ARADDR	= ;
	
	assign M_AXI_ARLEN	= C_M_AXI_BURST_LEN - 1;//Burst LENgth is number of transaction beats, minus 1
	assign M_AXI_ARSIZE	= $clog2(DW/8);//Size should be C_M_AXI_DATA_WIDTH, in 2^n bytes, otherwise narrow bursts are used
	assign M_AXI_ARBURST = 2'b01;//INCR burst type is usually used, except for keyhole bursts
	assign M_AXI_ARLOCK	= 1'b0;
	
	assign M_AXI_ARCACHE = 4'b0010;//Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
	assign M_AXI_ARPROT	= 3'h0;
	assign M_AXI_ARQOS	= 4'h0;
	assign M_AXI_ARUSER	= 'b1;
	assign M_AXI_ARVALID = axi_arvalid_qout;
	
	assign M_AXI_RREADY	= axi_rready_qout;



	assign axi_awvalid_set = ~axi_awvalid_qout & start_single_burst_write;
	assign axi_awvalid_rst =  axi_awvalid_qout & M_AXI_AWREADY ;
	gen_rsffr # (.DW(1)) axi_awvalid_rsffr (.set_in(axi_awvalid_set), .rst_in(axi_awvalid_rst), .qout(axi_awvalid_qout), .CLK(CLK), .RSTn(RSTn));



	assign wnext = M_AXI_WREADY & axi_wvalid_qout;


	assign axi_wvalid_set = (~axi_wvalid_qout & start_single_burst_write);
	assign axi_wvalid_rst = (wnext & axi_wlast_qout) ;
	gen_rsffr # (.DW(1)) axi_wvalid_rsffr (.set_in(axi_wvalid_set), .rst_in(axi_wvalid_rst), .qout(axi_wvalid_qout), .CLK(CLK), .RSTn(RSTn));




	assign axi_wlast_set = ((write_index_qout == C_M_AXI_BURST_LEN-2 && C_M_AXI_BURST_LEN >= 2) && wnext) || (C_M_AXI_BURST_LEN == 1 );
	assign axi_wlast_rst = ~axi_wlast_set & ( wnext | (axi_wlast_qout && C_M_AXI_BURST_LEN == 1) );
	gen_rsffr # (.DW(1)) axi_wlast_rsffr (.set_in(axi_wlast_set), .rst_in(axi_wlast_rst), .qout(axi_wlast_qout), .CLK(CLK), .RSTn(RSTn));


	assign write_index_dnxt = start_single_burst_write ? 8'd0 :
								(
									(wnext && (write_index_qout != C_M_AXI_BURST_LEN-1)) ? (write_index_qout + 8'd1) : write_index_qout
								);							
	gen_dffr # (.DW(8)) write_index_dffr (.dnxt(write_index_dnxt), .qout(write_index_qout), .CLK(CLK), .RSTn(RSTn));


	assign axi_bready_set = (M_AXI_BVALID && ~axi_bready_qout);
	assign axi_bready_rst = axi_bready_qout;
	gen_rsffr # (.DW(1)) axi_bready_rsffr (.set_in(axi_bready_set), .rst_in(axi_bready_rst), .qout(axi_bready_qout), .CLK(CLK), .RSTn(RSTn));
	

	assign write_resp_error = axi_bready_qout & M_AXI_BVALID & M_AXI_BRESP[1]; 




	assign axi_arvalid_set = ~axi_arvalid_qout & start_single_burst_read;
	assign axi_arvalid_rst = axi_arvalid_qout & M_AXI_ARREADY ;
	gen_rsffr # (.DW(1)) axi_arvalid_rsffr (.set_in(axi_arvalid_set), .rst_in(axi_arvalid_rst), .qout(axi_arvalid_qout), .CLK(CLK), .RSTn(RSTn));
	

	assign rnext = M_AXI_RVALID && axi_rready_qout;



	assign read_index_dnxt = start_single_burst_read ? 8'd0 :
								(
									(rnext & (read_index_qout != C_M_AXI_BURST_LEN-1)) ? (read_index_qout + 8'd1) : read_index_qout
								);							
	gen_dffr # (.DW(8)) read_index_dffr (.dnxt(read_index_dnxt), .qout(read_index_qout), .CLK(CLK), .RSTn(RSTn));


	assign axi_rready_set = M_AXI_RVALID & (~M_AXI_RLAST | ~axi_rready_qout);
	assign axi_rready_rst = M_AXI_RVALID &   M_AXI_RLAST &  axi_rready_qout;
	gen_rsffr # (.DW(1)) axi_rready_rsffr (.set_in(axi_rready_set), .rst_in(axi_rready_rst), .qout(axi_rready_qout), .CLK(CLK), .RSTn(RSTn));


	assign read_resp_error = axi_rready_qout & M_AXI_RVALID & M_AXI_RRESP[1];




endmodule




