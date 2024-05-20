// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: axi_full_slv_sram
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-24 09:25:27
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-11 14:48:28
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

`include "define.vh"




module axi_full_slv_sram
(

	input [31:0] MEM_AWADDR,
	input [7:0] MEM_AWLEN,
	input [2:0] MEM_AWSIZE,
	input [1:0] MEM_AWBURST,
	input MEM_AWVALID,
	output MEM_AWREADY,


	input [63:0] MEM_WDATA,
	input [7:0] MEM_WSTRB,
	input MEM_WLAST,
	input MEM_WVALID,
	output MEM_WREADY,

	output [1:0] MEM_BRESP,
	output MEM_BVALID,
	input MEM_BREADY,

	input [31:0] MEM_ARADDR,
	input [7:0] MEM_ARLEN,
	input [2:0] MEM_ARSIZE,
	input [1:0] MEM_ARBURST,
	input MEM_ARVALID,
	output MEM_ARREADY,

	output [63:0] MEM_RDATA,
	output [1:0] MEM_RRESP,
	output MEM_RLAST,
	output MEM_RVALID,
	input MEM_RREADY,

	input CLK,
	input RSTn
);

	localparam ADDR_LSB = $clog2(64/8);


	wire [31:0] aw_wrap_size; 
	wire [31:0] ar_wrap_size; 
	wire aw_wrap_en, ar_wrap_en;

	wire axi_awready_set, axi_awready_rst, axi_awready_qout;
	wire axi_awv_awr_flag_set, axi_awv_awr_flag_rst, axi_awv_awr_flag_qout;
	wire [31:0] axi_awaddr_dnxta;
	wire [31:0] axi_awaddr_dnxtb;
	wire [31:0] axi_awaddr_qout;
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
	wire [31:0] axi_araddr_dnxta;
	wire [31:0] axi_araddr_dnxtb;
	wire [31:0] axi_araddr_qout;
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


	assign MEM_AWREADY = axi_awready_qout;
	assign MEM_WREADY	= axi_wready_qout;
	assign MEM_BRESP = 2'b00;
	assign MEM_BVALID	= axi_bvalid_qout;
	assign MEM_ARREADY = axi_arready_qout;
	assign MEM_RRESP = 2'b00;
	assign MEM_RLAST = axi_rlast_qout;
	assign MEM_RVALID	= axi_rvalid_qout;



	assign axi_awready_set =  (~axi_awready_qout & MEM_AWVALID & ~axi_awv_awr_flag_qout & ~axi_arv_arr_flag_qout);
	assign axi_awready_rst = ~(~axi_awready_qout & MEM_AWVALID & ~axi_awv_awr_flag_qout & ~axi_arv_arr_flag_qout) & ~(MEM_WLAST & axi_wready_qout);
	gen_rsffr axi_awready_rsffr (.set_in(axi_awready_set), .rst_in(axi_awready_rst), .qout(axi_awready_qout), .CLK(CLK), .RSTn(RSTn));

	assign axi_awv_awr_flag_set = (~axi_awready_qout & MEM_AWVALID & ~axi_awv_awr_flag_qout & ~axi_arv_arr_flag_qout);
	assign axi_awv_awr_flag_rst = ( axi_awready_qout | ~MEM_AWVALID | axi_awv_awr_flag_qout |  axi_arv_arr_flag_qout) & (MEM_WLAST & axi_wready_qout);
	gen_rsffr axi_awv_awr_flag_rsffr (.set_in(axi_awv_awr_flag_set), .rst_in(axi_awv_awr_flag_rst), .qout(axi_awv_awr_flag_qout), .CLK(CLK), .RSTn(RSTn));

	assign axi_awaddr_dnxta = MEM_AWADDR;
	assign axi_awaddr_dnxtb = ( {32{axi_awburst_qout == 2'b00}} & axi_awaddr_qout )
							| 
							( {32{axi_awburst_qout == 2'b01}} & axi_awaddr_qout + (1<<ADDR_LSB) );

	assign axi_awaddr_ena = ~axi_awready_qout & MEM_AWVALID & ~axi_awv_awr_flag_qout;
	assign axi_awaddr_enb = (axi_awlen_cnt_qout <= axi_awlen_qout) & axi_wready_qout & MEM_WVALID;
	gen_dpdffren # (.DW(32)) axi_awaddr_dpdffren( .dnxta(axi_awaddr_dnxta), .ena(axi_awaddr_ena), .dnxtb(axi_awaddr_dnxtb), .enb(axi_awaddr_enb), .qout(axi_awaddr_qout), .CLK(CLK), .RSTn(RSTn) );

	assign axi_awburst_en = (~axi_awready_qout & MEM_AWVALID & ~axi_awv_awr_flag_qout);
	assign axi_awburst_dnxt = MEM_AWBURST;
	gen_dffren # (.DW(2)) axi_awburst_dffren (.dnxt(axi_awburst_dnxt), .qout(axi_awburst_qout), .en(axi_awburst_en), .CLK(CLK), .RSTn(RSTn));




	assign axi_awlen_en = ~axi_awready_qout & MEM_AWVALID & ~axi_awv_awr_flag_qout;
	assign axi_awlen_dnxt = MEM_AWLEN;
	gen_dffren # (.DW(8)) axi_awlen_dffren (.dnxt(axi_awlen_dnxt), .qout(axi_awlen_qout), .en(axi_awlen_en), .CLK(CLK), .RSTn(RSTn));


	assign axi_awlen_cnt_dnxta = 8'd0;
	assign axi_awlen_cnt_dnxtb = axi_awlen_cnt_qout + 8'd1;
	assign axi_awlen_cnt_ena = ~axi_awready_qout & MEM_AWVALID & ~axi_awv_awr_flag_qout;
	assign axi_awlen_cnt_enb = (axi_awlen_cnt_qout <= axi_awlen_qout) & axi_wready_qout & MEM_WVALID;
	gen_dpdffren # (.DW(8)) axi_awlen_cnt_dpdffren( .dnxta(axi_awlen_cnt_dnxta), .ena(axi_awlen_cnt_ena), .dnxtb(axi_awlen_cnt_dnxtb), .enb(axi_awlen_cnt_enb), .qout(axi_awlen_cnt_qout), .CLK(CLK), .RSTn(RSTn) );


	assign axi_wready_set = ~axi_wready_qout & MEM_WVALID & axi_awv_awr_flag_qout;
	assign axi_wready_rst =  axi_wready_qout & MEM_WLAST;
	gen_rsffr axi_wready_rsffr (.set_in(axi_wready_set), .rst_in(axi_wready_rst), .qout(axi_wready_qout), .CLK(CLK), .RSTn(RSTn));



	assign axi_bvalid_set = ~axi_bvalid_qout & axi_awv_awr_flag_qout & axi_wready_qout & MEM_WVALID & MEM_WLAST;
	assign axi_bvalid_rst =  axi_bvalid_qout & MEM_BREADY;
	gen_rsffr axi_bvalid_rsffr (.set_in(axi_bvalid_set), .rst_in(axi_bvalid_rst), .qout(axi_bvalid_qout), .CLK(CLK), .RSTn(RSTn));




	
	assign axi_arready_set = (~axi_arready_qout & MEM_ARVALID & ~axi_awv_awr_flag_qout & ~axi_arv_arr_flag_qout);
	assign axi_arready_rst = ~(~axi_arready_qout & MEM_ARVALID & ~axi_awv_awr_flag_qout & ~axi_arv_arr_flag_qout) & ~(axi_rvalid_qout & MEM_RREADY & axi_arlen_cnt_qout == axi_arlen_qout);
	gen_rsffr axi_arready_rsffr (.set_in(axi_arready_set), .rst_in(axi_arready_rst), .qout(axi_arready_qout), .CLK(CLK), .RSTn(RSTn));

	assign axi_arv_arr_flag_set = (~axi_arready_qout &  MEM_ARVALID & ~axi_awv_awr_flag_qout & ~axi_arv_arr_flag_qout);
	assign axi_arv_arr_flag_rst = ( axi_arready_qout | ~MEM_ARVALID |  axi_awv_awr_flag_qout |  axi_arv_arr_flag_qout) & (axi_rvalid_qout & MEM_RREADY & axi_arlen_cnt_qout == axi_arlen_qout);
	gen_rsffr axi_arv_arr_flag_rsffr (.set_in(axi_arv_arr_flag_set), .rst_in(axi_arv_arr_flag_rst), .qout(axi_arv_arr_flag_qout), .CLK(CLK), .RSTn(RSTn));



	assign axi_araddr_dnxta = MEM_ARADDR;
	assign axi_araddr_dnxtb = ({32{axi_arburst_qout == 2'b00}} & axi_araddr_qout)
							|
							({32{axi_arburst_qout == 2'b01}} & axi_araddr_qout + (1<<ADDR_LSB));
	assign axi_araddr_ena = (~axi_arready_qout & MEM_ARVALID & ~axi_arv_arr_flag_qout);
	assign axi_araddr_enb = ((axi_arlen_cnt_qout <= axi_arlen_qout) & axi_rvalid_qout & MEM_RREADY);
	gen_dpdffren # (.DW(32)) axi_araddr_dpdffren( .dnxta(axi_araddr_dnxta), .ena(axi_araddr_ena), .dnxtb(axi_araddr_dnxtb), .enb(axi_araddr_enb), .qout(axi_araddr_qout), .CLK(CLK), .RSTn(RSTn) );

	
	assign axi_arburst_en = (~axi_arready_qout & MEM_ARVALID & ~axi_arv_arr_flag_qout);
	assign axi_arburst_dnxt = MEM_ARBURST;
	gen_dffren # (.DW(2)) axi_arburst_dffren (.dnxt(axi_arburst_dnxt), .qout(axi_arburst_qout), .en(axi_arburst_en), .CLK(CLK), .RSTn(RSTn));


	assign axi_arlen_en = (~axi_arready_qout && MEM_ARVALID && ~axi_arv_arr_flag_qout);
	assign axi_arlen_dnxt = MEM_ARLEN;
	gen_dffren # (.DW(8)) axi_arlen_dffren (.dnxt(axi_arlen_dnxt), .qout(axi_arlen_qout), .en(axi_arlen_en), .CLK(CLK), .RSTn(RSTn));


	assign axi_rlast_set = ((axi_arlen_cnt_qout == axi_arlen_qout) & ~axi_rlast_qout & axi_arv_arr_flag_qout )  ;
	assign axi_rlast_rst = (~axi_arready_qout & MEM_ARVALID & ~axi_arv_arr_flag_qout) | (((axi_arlen_cnt_qout <= axi_arlen_qout) | axi_rlast_qout | ~axi_arv_arr_flag_qout ) & ( axi_rvalid_qout & MEM_RREADY));
	gen_rsffr axi_rlast_rsffr (.set_in(axi_rlast_set), .rst_in(axi_rlast_rst), .qout(axi_rlast_qout), .CLK(CLK), .RSTn(RSTn));



	assign axi_arlen_cnt_dnxta = 8'd0;
	assign axi_arlen_cnt_dnxtb = axi_arlen_cnt_qout + 8'd1;
	assign axi_arlen_cnt_ena = (~axi_arready_qout & MEM_ARVALID & ~axi_arv_arr_flag_qout);
	assign axi_arlen_cnt_enb = ((axi_arlen_cnt_qout <= axi_arlen_qout) & axi_rvalid_qout & MEM_RREADY);
	gen_dpdffren # (.DW(8)) axi_arlen_cnt_dpdffren( .dnxta(axi_arlen_cnt_dnxta), .ena(axi_arlen_cnt_ena), .dnxtb(axi_arlen_cnt_dnxtb), .enb(axi_arlen_cnt_enb), .qout(axi_arlen_cnt_qout), .CLK(CLK), .RSTn(RSTn) );



	assign axi_rvalid_set = ~axi_rvalid_qout & axi_arv_arr_flag_qout;
	assign axi_rvalid_rst =  axi_rvalid_qout & MEM_RREADY;
	gen_rsffr axi_rvalid_rsffr (.set_in(axi_rvalid_set), .rst_in(axi_rvalid_rst), .qout(axi_rvalid_qout), .CLK(CLK), .RSTn(RSTn));





//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------

	wire [63:0] data_w = MEM_WDATA;
	wire [13:0] addr_w = axi_awaddr_qout[3 +: 14];
	wire [7:0] data_wstrb = MEM_WSTRB;
	wire en_w = axi_awv_awr_flag_qout;

	wire [63:0] data_r;
	assign MEM_RDATA = data_r;
	wire [13:0] addr_r = axi_araddr_qout[3 +: 14];
	wire en_r = axi_arv_arr_flag_qout;



gen_sram # ( .DW(64), .AW(14) ) i_sram
(

	.data_w(data_w),
	.addr_w(addr_w),
	.data_wstrb(data_wstrb),
	.en_w(en_w),

	.data_r(data_r),
	.addr_r(addr_r),
	.en_r(en_r),

	.CLK(CLK)

);




endmodule












