// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: axi_ccm
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-04 17:31:55
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-15 16:04:38
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



module axi_ccm #
(
	parameter SRAM_AW = 11
)
(

	input [63:0] S_AXI_AWADDR,
	input S_AXI_AWVALID,
	output S_AXI_AWREADY,
	input [63:0] S_AXI_WDATA,   
	input [7:0] S_AXI_WSTRB,
	input S_AXI_WVALID,
	output S_AXI_WREADY,
	output [1:0] S_AXI_BRESP,
	output S_AXI_BVALID,
	input S_AXI_BREADY,
	input [63:0] S_AXI_ARADDR,
	input S_AXI_ARVALID,
	output S_AXI_ARREADY,
	output [63:0] S_AXI_RDATA,
	output [1:0] S_AXI_RRESP,
	output S_AXI_RVALID,
	input S_AXI_RREADY,

	input CLK,
	input RSTn
);





wire [63:0] sram_addr_r;
wire [63:0] sram_addr_w;
wire [127:0] sram_data_r;
wire [127:0] sram_data_w;
wire [15:0] sram_wstrb;

wire [10:0] sram_addr_odd_r;
wire [10:0] sram_addr_eve_r;
wire [10:0] sram_addr_odd_w;
wire [10:0] sram_addr_eve_w;

wire [63:0] sram_data_odd_w;
wire [63:0] sram_data_eve_w;
wire [63:0] sram_data_odd_r;
wire [63:0] sram_data_eve_r;

wire [7:0] sram_wstrb_odd;
wire [7:0] sram_wstrb_eve;

wire sram_wen_odd;
wire sram_wen_eve;

wire sram_reAlign_r;
wire sram_reAlign_w;

wire [2:0] addr_shift_r;
wire [2:0] addr_shift_w;

wire [5:0] byte_shift_r;
wire [5:0] byte_shift_w;


	wire axi_awready_set, axi_awready_rst, axi_awready_qout;
	wire aw_en_set, aw_en_rst, aw_en_qout;
	wire [63:0] axi_awaddr_dnxt;
	wire [63:0] axi_awaddr_qout;
	wire axi_awaddr_en;
	wire axi_wready_set, axi_wready_rst, axi_wready_qout;
	wire axi_bvalid_set, axi_bvalid_rst, axi_bvalid_qout;
	wire axi_arready_set, axi_arready_rst, axi_arready_qout;
	wire [63:0] axi_araddr_dnxt;
	wire [63:0] axi_araddr_qout;
	wire axi_araddr_en;
	wire axi_rvalid_set, axi_rvalid_rst, axi_rvalid_qout;
	wire slv_reg_wren;
	wire slv_reg_rden;

assign sram_reAlign_r = axi_araddr_qout[3];
assign sram_reAlign_w = axi_awaddr_qout[3];

assign addr_shift_r = axi_araddr_qout[2:0];
assign addr_shift_w = axi_awaddr_qout[2:0];

assign byte_shift_r = addr_shift_r << 3;
assign byte_shift_w = addr_shift_w << 3;



assign S_AXI_RDATA = sram_data_r[ byte_shift_r +: 64];
assign sram_data_r = (~sram_reAlign_r) ? {sram_data_odd_r, sram_data_eve_r} : {sram_data_eve_r, sram_data_odd_r};


assign sram_data_w = S_AXI_WDATA << (byte_shift_w);
assign sram_data_odd_w = (~sram_reAlign_w) ? sram_data_w[127:64] : sram_data_w[63:0];
assign sram_data_eve_w = (~sram_reAlign_w) ? sram_data_w[63:0] : sram_data_w[127:64];

assign sram_wstrb = S_AXI_WSTRB << (addr_shift_w);
assign sram_wstrb_odd = (~sram_reAlign_w) ? sram_wstrb[15:8] : sram_wstrb[7:0];
assign sram_wstrb_eve = (~sram_reAlign_w) ? sram_wstrb[7:0] : sram_wstrb[15:8];


assign sram_addr_r = axi_araddr_qout;
assign sram_addr_w = axi_awaddr_qout;
assign sram_addr_odd_r = sram_addr_r[4 +: SRAM_AW];
assign sram_addr_odd_w = sram_addr_w[4 +: SRAM_AW];
assign sram_addr_eve_r = ( ~sram_reAlign_r ) ? sram_addr_r[4 +: SRAM_AW] : sram_addr_r[4 +: SRAM_AW] + 'd1;
assign sram_addr_eve_w = ( ~sram_reAlign_w ) ? sram_addr_w[4 +: SRAM_AW] : sram_addr_w[4 +: SRAM_AW] + 'd1;


gen_sram # ( .DW(64), .AW(SRAM_AW) ) i_sram_odd
(
	.data_w(sram_data_odd_w),
	.addr_w(sram_addr_odd_w),
	.data_wstrb(sram_wstrb_odd),
	.en_w(slv_reg_wren),


	.data_r(sram_data_odd_r),
	.addr_r(sram_addr_odd_r),
	.en_r(slv_reg_rden),


	.CLK(CLK)
);

gen_sram # ( .DW(64), .AW(SRAM_AW) ) i_sram_eve
(
	.data_w(sram_data_eve_w),
	.addr_w(sram_addr_eve_w),
	.data_wstrb(sram_wstrb_eve),
	.en_w(slv_reg_wren),


	.data_r(sram_data_eve_r),
	.addr_r(sram_addr_eve_r),
	.en_r(slv_reg_rden),


	.CLK(CLK)
);


















	assign axi_awready_set = ~axi_awready_qout & S_AXI_AWVALID & S_AXI_WVALID & aw_en_qout;
	assign axi_awready_rst = ~axi_awready_set & (S_AXI_BREADY & axi_bvalid_qout);
	assign aw_en_set = axi_awready_rst;
	assign aw_en_rst = axi_awready_set;

	assign axi_awaddr_dnxt = S_AXI_AWADDR;
	assign axi_awaddr_en = ~axi_awready_qout & S_AXI_AWVALID & S_AXI_WVALID & aw_en_qout;

	assign axi_wready_set = ~axi_wready_qout & S_AXI_WVALID & S_AXI_AWVALID & aw_en_qout;
	assign axi_wready_rst = ~axi_wready_set;

	assign axi_bvalid_set = axi_awready_qout & S_AXI_AWVALID & ~axi_bvalid_qout & axi_wready_qout & S_AXI_WVALID;
	assign axi_bvalid_rst = ~axi_bvalid_set & (S_AXI_BREADY & axi_bvalid_qout);

	gen_rsffr #(.DW(1)) axi_awready_rsffr (.set_in(axi_awready_set), .rst_in(axi_awready_rst), .qout(axi_awready_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr #(.DW(1), .rstValue(1'b1)) aw_en_rsffr (.set_in(aw_en_set), .rst_in(aw_en_rst), .qout(aw_en_qout), .CLK(CLK), .RSTn(RSTn));

	gen_dffren #(.DW(64)) axi_awaddr_dffren (.dnxt(axi_awaddr_dnxt), .qout(axi_awaddr_qout), .en(axi_awaddr_en), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr #(.DW(1)) axi_wready_rsffr (.set_in(axi_wready_set), .rst_in(axi_wready_rst), .qout(axi_wready_qout), .CLK(CLK), .RSTn(RSTn));





	assign axi_arready_set = (~axi_arready_qout & S_AXI_ARVALID);
	assign axi_arready_rst = ~axi_arready_set;
	assign axi_araddr_dnxt = S_AXI_ARADDR;
	assign axi_araddr_en = (~axi_arready_qout & S_AXI_ARVALID);
	assign axi_rvalid_set = (axi_arready_qout & S_AXI_ARVALID & ~axi_rvalid_qout);
	assign axi_rvalid_rst = ~axi_rvalid_set & (axi_rvalid_qout & S_AXI_RREADY);

	gen_rsffr #(.DW(1)) axi_bvalid_rsffr (.set_in(axi_bvalid_set), .rst_in(axi_bvalid_rst), .qout(axi_bvalid_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr #(.DW(1)) axi_arready_rsffr (.set_in(axi_arready_set), .rst_in(axi_arready_rst), .qout(axi_arready_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffren #(.DW(64)) axi_araddr_dffren (.dnxt(axi_araddr_dnxt), .qout(axi_araddr_qout), .en(axi_araddr_en), .CLK(CLK), .RSTn(RSTn));

	gen_rsffr #(.DW(1)) axi_rvalid_rsffr (.set_in(axi_rvalid_set), .rst_in(axi_rvalid_rst), .qout(axi_rvalid_qout), .CLK(CLK), .RSTn(RSTn));


	assign slv_reg_wren = axi_wready_qout & S_AXI_WVALID & axi_awready_qout & S_AXI_AWVALID;
	assign slv_reg_rden = axi_arready_qout & S_AXI_ARVALID & ~axi_rvalid_qout;


	assign S_AXI_AWREADY = axi_awready_qout;
	assign S_AXI_WREADY	= axi_wready_qout;
	assign S_AXI_BRESP	= 2'b0;
	assign S_AXI_BVALID	= axi_bvalid_qout;
	assign S_AXI_ARREADY = axi_arready_qout;
	assign S_AXI_RRESP	= 2'b0;
	assign S_AXI_RVALID	= axi_rvalid_qout;

endmodule










