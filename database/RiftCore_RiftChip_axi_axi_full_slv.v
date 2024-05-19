// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: axi_full_slv
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-19 14:57:31
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-24 14:59:22
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


module axi_full_slv
(
	parameter DW = 64,
	parameter AW = 64,
	parameter ID_W = 1,
	parameter USER_W = 1
)
(
	input [ID_W-1:0] S_AXI_AWID,
	input [AW-1:0] S_AXI_AWADDR,
	input [7:0] S_AXI_AWLEN,
	input [2:0] S_AXI_AWSIZE,
	input [1:0] S_AXI_AWBURST,
	input S_AXI_AWLOCK,
	input [3:0] S_AXI_AWCACHE,
	input [2:0] S_AXI_AWPROT,
	input [3:0] S_AXI_AWQOS,
	input [3:0] S_AXI_AWREGION,
	input [USER_W-1:0] S_AXI_AWUSER,
	input S_AXI_AWVALID,
	output S_AXI_AWREADY,


	input [DW-1:0] S_AXI_WDATA,
	input [(DW/8)-1:0] S_AXI_WSTRB,
	input S_AXI_WLAST,
	input [USER_W-1:0] S_AXI_WUSER,
	input S_AXI_WVALID,
	output S_AXI_WREADY,

	output [ID_W-1:0] S_AXI_BID,
	output [1:0] S_AXI_BRESP,
	output [USER_W-1:0] S_AXI_BUSER,
	output S_AXI_BVALID,
	input S_AXI_BREADY,

	input [ID_W-1:0] S_AXI_ARID,
	input [AW-1:0] S_AXI_ARADDR,
	input [7:0] S_AXI_ARLEN,
	input [2:0] S_AXI_ARSIZE,
	input [1:0] S_AXI_ARBURST,
	input S_AXI_ARLOCK,
	input [3:0] S_AXI_ARCACHE,
	input [2:0] S_AXI_ARPROT,
	input [3:0] S_AXI_ARQOS,
	input [3:0] S_AXI_ARREGION,
	input [USER_W-1:0] S_AXI_ARUSER,
	input S_AXI_ARVALID,
	output S_AXI_ARREADY,

	output [ID_W-1:0] S_AXI_RID,
	output [DW-1:0] S_AXI_RDATA,
	output [1:0] S_AXI_RRESP,
	output S_AXI_RLAST,
	output [USER_W-1:0] S_AXI_RUSER,
	output S_AXI_RVALID,
	input S_AXI_RREADY,

	input CLK,
	input RSTn
);

	localparam ADDR_LSB = $clog2(DW/8);


	wire [AW-1:0] aw_wrap_size; 
	wire [AW-1:0] ar_wrap_size; 
	wire aw_wrap_en, ar_wrap_en;

	wire axi_awready_set, axi_awready_rst, axi_awready_qout;
	wire axi_awv_awr_flag_set, axi_awv_awr_flag_rst, axi_awv_awr_flag_qout;
	wire [AW-1:0] axi_awaddr_dnxta;
	wire [AW-1:0] axi_awaddr_dnxtb;
	wire [AW-1:0] axi_awaddr_qout;
	wire axi_awaddr_ena, axi_awaddr_enb;
	wire axi_awburst_en;
	wire [1:0] axi_awburst_dnxt;
	wire [1:0] axi_awburst_qout;
	wire axi_awlen_en;
	wire [7:0] axi_awlen_dnxt;
	wire [7:0] axi_awlen_qout;
	wire [7:0] axi_awlen_cnt_dnxta;
	wire [7:0] axi_awlen_cnt_dnxtb;
	wire [7:0] axi_awlen_cnt_qout;
	wire axi_awlen_cnt_ena, axi_awlen_cnt_enb;
	wire axi_wready_set, axi_wready_rst, axi_wready_qout;
	wire axi_bvalid_set, axi_bvalid_rst, axi_bvalid_qout;
	wire axi_arready_set, axi_arready_rst, axi_arready_qout;
	wire axi_arv_arr_flag_set, axi_arv_arr_flag_rst, axi_arv_arr_flag_qout;
	wire [AW-1:0] axi_araddr_dnxta;
	wire [AW-1:0] axi_araddr_dnxtb;
	wire [AW-1:0] axi_araddr_qout;
	wire axi_araddr_ena, axi_araddr_enb, axi_arburst_en;
	wire [1:0] axi_arburst_dnxt;
	wire [1:0] axi_arburst_qout;
	wire axi_arlen_en;
	wire [7:0] axi_arlen_dnxt;
	wire [7:0] axi_arlen_qout;
	wire [7:0] axi_arlen_cnt_dnxta;
	wire [7:0] axi_arlen_cnt_dnxtb;
	wire [7:0] axi_arlen_cnt_qout;
	wire axi_arlen_cnt_ena, axi_arlen_cnt_enb;
	wire axi_rvalid_set, axi_rvalid_rst, axi_rvalid_qout;
	wire axi_rlast_set, axi_rlast_rst, axi_rlast_qout;


	assign S_AXI_AWREADY = axi_awready_qout;
	assign S_AXI_WREADY	= axi_wready_qout;
	assign S_AXI_BRESP = 2'b00;
	assign S_AXI_BUSER = 'b0;
	assign S_AXI_BVALID	= axi_bvalid_qout;
	assign S_AXI_ARREADY = axi_arready_qout;
	assign S_AXI_RDATA = ;
	assign S_AXI_RRESP = 2'b00;
	assign S_AXI_RLAST = axi_rlast_qout;
	assign S_AXI_RUSER = 'd0;
	assign S_AXI_RVALID	= axi_rvalid_qout;
	assign S_AXI_BID = S_AXI_AWID;
	assign S_AXI_RID = S_AXI_ARID;
	assign aw_wrap_size = (C_S_AXI_DATA_WIDTH/8 * (axi_awlen_qout)); 
	assign ar_wrap_size = (C_S_AXI_DATA_WIDTH/8 * (axi_arlen_qout)); 
	assign aw_wrap_en = ((axi_awaddr_qout & aw_wrap_size) == aw_wrap_size) ? 1'b1 : 1'b0;
	assign ar_wrap_en = ((axi_araddr_qout & ar_wrap_size) == ar_wrap_size) ? 1'b1 : 1'b0;





	assign axi_awready_set =  (~axi_awready_qout & S_AXI_AWVALID & ~axi_awv_awr_flag_qout & ~axi_arv_arr_flag_qout);
	assign axi_awready_rst = ~(~axi_awready_qout & S_AXI_AWVALID & ~axi_awv_awr_flag_qout & ~axi_arv_arr_flag_qout) & ~(S_AXI_WLAST & axi_wready_qout);
	gen_rsffr # (.DW(1)) axi_awready_rsffr (.set_in(axi_awready_set), .rst_in(axi_awready_rst), .qout(axi_awready_qout), .CLK(CLK), .RSTn(RSTn));

	assign axi_awv_awr_flag_set = (~axi_awready_qout & S_AXI_AWVALID & ~axi_awv_awr_flag_qout & ~axi_arv_arr_flag_qout);
	assign axi_awv_awr_flag_rst = ( axi_awready_qout | ~S_AXI_AWVALID | axi_awv_awr_flag_qout |  axi_arv_arr_flag_qout) & (S_AXI_WLAST & axi_wready_qout);
	gen_rsffr # (.DW(1)) axi_awv_awr_flag_rsffr (.set_in(axi_awv_awr_flag_set), .rst_in(axi_awv_awr_flag_rst), .qout(axi_awv_awr_flag_qout), .CLK(CLK), .RSTn(RSTn));

	assign axi_awaddr_dnxta = S_AXI_AWADDR;
	assign axi_awaddr_dnxtb = ( {AW{axi_awburst_qout == 2'b00}} & axi_awaddr_qout )
							| 
							( {AW{axi_awburst_qout == 2'b01}} & axi_awaddr_qout + (1<<ADDR_LSB) )
							|
							( {AW{axi_awburst_qout == 2'b10}} & 
								(
									{AW{ aw_wrap_en}} & (axi_awaddr_qout - aw_wrap_size)
									|
									{AW{~aw_wrap_en}} & (axi_awaddr_qout + (1<<ADDR_LSB) )
								)
							);
	assign axi_awaddr_ena = ~axi_awready_qout & S_AXI_AWVALID & ~axi_awv_awr_flag_qout;
	assign axi_awaddr_enb = (axi_awlen_cnt_qout <= axi_awlen_qout) & axi_wready_qout & S_AXI_WVALID;
	gen_dpdffren # (.DW(AW)) axi_awaddr_dpdffren( .dnxta(axi_awaddr_dnxta), .ena(axi_awaddr_ena), .dnxtb(axi_awaddr_dnxtb), .enb(axi_awaddr_enb), .qout(axi_awaddr_qout), .CLK(CLK), .RSTn(RSTn) );

	assign axi_awburst_en = (~axi_awready_qout & S_AXI_AWVALID & ~axi_awv_awr_flag_qout);
	assign axi_awburst_dnxt = S_AXI_AWBURST;
	gen_dffren # (.DW(2)) axi_awburst_dffren (.dnxt(axi_awburst_dnxt), .qout(axi_awburst_qout), .en(axi_awburst_en), .CLK(CLK), .RSTn(RSTn));




	assign axi_awlen_en = ~axi_awready_qout & S_AXI_AWVALID & ~axi_awv_awr_flag_qout;
	assign axi_awlen_dnxt = S_AXI_AWLEN;
	gen_dffren # (.DW(8)) axi_awlen_dffren (.dnxt(axi_awlen_dnxt), .qout(axi_awlen_qout), .en(axi_awlen_en), .CLK(CLK), .RSTn(RSTn));


	assign axi_awlen_cnt_dnxta = 8'd0;
	assign axi_awlen_cnt_dnxtb = axi_awlen_cnt_qout + 8'd1;
	assign axi_awlen_cnt_ena = ~axi_awready_qout & S_AXI_AWVALID & ~axi_awv_awr_flag_qout;
	assign axi_awlen_cnt_enb = (axi_awlen_cnt_qout <= axi_awlen_qout) & axi_wready_qout & S_AXI_WVALID;
	gen_dpdffren # (.DW(8)) axi_awlen_cnt_dpdffren( .dnxta(axi_awlen_cnt_dnxta), .ena(axi_awlen_cnt_ena), .dnxtb(axi_awlen_cnt_dnxtb), .enb(axi_awlen_cnt_enb), .qout(axi_awlen_cnt_qout), .CLK(CLK), .RSTn(RSTn) );


	assign axi_wready_set = ~axi_wready_qout & S_AXI_WVALID & axi_awv_awr_flag_qout;
	assign axi_wready_rst =  axi_wready_qout & S_AXI_WLAST;
	gen_rsffr # (.DW(1)) axi_wready_rsffr (.set_in(axi_wready_set), .rst_in(axi_wready_rst), .qout(axi_wready_qout), .CLK(CLK), .RSTn(RSTn));



	assign axi_bvalid_set = ~axi_bvalid_qout & axi_awv_awr_flag_qout & axi_wready_qout & S_AXI_WVALID & S_AXI_WLAST;
	assign axi_bvalid_rst =  axi_bvalid_qout & S_AXI_BREADY;
	gen_rsffr # (.DW(1)) axi_bvalid_rsffr (.set_in(axi_bvalid_set), .rst_in(axi_bvalid_rst), .qout(axi_bvalid_qout), .CLK(CLK), .RSTn(RSTn));




	
	assign axi_arready_set = (~axi_arready_qout & S_AXI_ARVALID & ~axi_awv_awr_flag_qout & ~axi_arv_arr_flag_qout);
	assign axi_arready_rst = ~(~axi_arready_qout & S_AXI_ARVALID & ~axi_awv_awr_flag_qout & ~axi_arv_arr_flag_qout) & ~(axi_rvalid_qout & S_AXI_RREADY & axi_arlen_cnt_qout == axi_arlen_qout);
	gen_rsffr # (.DW(1)) axi_arready_rsffr (.set_in(axi_arready_set), .rst_in(axi_arready_rst), .qout(axi_arready_qout), .CLK(CLK), .RSTn(RSTn));

	assign axi_arv_arr_flag_set = (~axi_arready_qout &  S_AXI_ARVALID & ~axi_awv_awr_flag_qout & ~axi_arv_arr_flag_qout);
	assign axi_arv_arr_flag_rst = ( axi_arready_qout | ~S_AXI_ARVALID |  axi_awv_awr_flag_qout |  axi_arv_arr_flag_qout) & (axi_rvalid_qout & S_AXI_RREADY & axi_arlen_cnt_qout == axi_arlen_qout);
	gen_rsffr # (.DW(1)) axi_arv_arr_flag_rsffr (.set_in(axi_arv_arr_flag_set), .rst_in(axi_arv_arr_flag_rst), .qout(axi_arv_arr_flag_qout), .CLK(CLK), .RSTn(RSTn));



	assign axi_araddr_dnxta = S_AXI_ARADDR;
	assign axi_araddr_dnxtb = ({AW{axi_arburst_qout == 2'b00}} & axi_araddr_qout)
							|
							({AW{axi_arburst_qout == 2'b01}} & axi_araddr_qout + (1<<ADDR_LSB))
							|
							({AW{axi_arburst_qout == 2'b10}} & 
								(
									({AW{ ar_wrap_en}} & (axi_araddr_qout - ar_wrap_size) )
									|
									({AW{~ar_wrap_en}} & (axi_araddr_qout + (1<<ADDR_LSB)))
								)
							);
	assign axi_araddr_ena = (~axi_arready_qout & S_AXI_ARVALID & ~axi_arv_arr_flag_qout);
	assign axi_araddr_enb = ((axi_arlen_cnt_qout <= axi_arlen_qout) & axi_rvalid_qout & S_AXI_RREADY);
	gen_dpdffren # (.DW(AW)) axi_araddr_dpdffren( .dnxta(axi_araddr_dnxta), .ena(axi_araddr_ena), .dnxtb(axi_araddr_dnxtb), .enb(axi_araddr_enb), .qout(axi_araddr_qout), .CLK(CLK), .RSTn(RSTn) );

	
	assign axi_arburst_en = (~axi_arready_qout & S_AXI_ARVALID & ~axi_arv_arr_flag_qout);
	assign axi_arburst_dnxt = S_AXI_ARBURST;
	gen_dffren # (.DW(2)) axi_arburst_dffren (.dnxt(axi_arburst_dnxt), .qout(axi_arburst_qout), .en(axi_arburst_en), .CLK(CLK), .RSTn(RSTn));


	assign axi_arlen_en = (~axi_arready_qout && S_AXI_ARVALID && ~axi_arv_arr_flag_qout);
	assign axi_arlen_dnxt = S_AXI_ARLEN;
	gen_dffren # (.DW(8)) axi_arlen_dffren (.dnxt(axi_arlen_dnxt), .qout(axi_arlen_qout), .en(axi_arlen_en), .CLK(CLK), .RSTn(RSTn));


	assign axi_rlast_set = ((axi_arlen_cnt_qout == axi_arlen_qout) & ~axi_rlast_qout & axi_arv_arr_flag_qout )  ;
	assign axi_rlast_rst = (~axi_arready_qout & S_AXI_ARVALID & ~axi_arv_arr_flag_qout) | (((axi_arlen_cnt_qout <= axi_arlen_qout) | axi_rlast_qout | ~axi_arv_arr_flag_qout ) & ( axi_rvalid_qout & S_AXI_RREADY));
	gen_rsffr # (.DW(1)) axi_rlast_rsffr (.set_in(axi_rlast_set), .rst_in(axi_rlast_rst), .qout(axi_rlast_qout), .CLK(CLK), .RSTn(RSTn));



	assign axi_arlen_cnt_dnxta = 8'd0;
	assign axi_arlen_cnt_dnxtb = axi_arlen_cnt_qout + 8'd1;
	assign axi_arlen_cnt_ena = (~axi_arready_qout & S_AXI_ARVALID & ~axi_arv_arr_flag_qout);
	assign axi_arlen_cnt_enb = ((axi_arlen_cnt_qout <= axi_arlen_qout) & axi_rvalid_qout & S_AXI_RREADY);
	gen_dpdffren # (.DW(8)) axi_arlen_cnt_dpdffren( .dnxta(axi_arlen_cnt_dnxta), .ena(axi_arlen_cnt_ena), .dnxtb(axi_arlen_cnt_dnxtb), .enb(axi_arlen_cnt_enb), .qout(axi_arlen_cnt_qout), .CLK(CLK), .RSTn(RSTn) );



	assign axi_rvalid_set = ~axi_rvalid_qout & axi_arv_arr_flag_qout;
	assign axi_rvalid_rst =  axi_rvalid_qout & S_AXI_RREADY;
	gen_rsffr # (.DW(1)) axi_rvalid_rsffr (.set_in(axi_rvalid_set), .rst_in(axi_rvalid_rst), .qout(axi_rvalid_qout), .CLK(CLK), .RSTn(RSTn));



endmodule





