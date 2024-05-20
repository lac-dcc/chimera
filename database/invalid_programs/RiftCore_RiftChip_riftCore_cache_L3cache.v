// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: L3cache
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-19 10:11:07
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-16 19:51:12
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

module L3cache #
(
	parameter DW = 1024,
	parameter BK = 4,
	parameter CL = 256

)
(

	//form L2cache
	input [31:0] L2C_AWADDR,
	input [7:0] L2C_AWLEN,
	input [1:0] L2C_AWBURST,
	input L2C_AWVALID,
	output L2C_AWREADY,

	input [63:0] L2C_WDATA,
	input [7:0] L2C_WSTRB,
	input L2C_WLAST,
	input L2C_WVALID,
	output L2C_WREADY,

	output [1:0] L2C_BRESP,
	output L2C_BVALID,
	input L2C_BREADY,

	input [31:0] L2C_ARADDR,
	input [7:0] L2C_ARLEN,
	input [1:0] L2C_ARBURST,
	input L2C_ARVALID,
	output L2C_ARREADY,

	output [63:0] L2C_RDATA,
	output [1:0] L2C_RRESP,
	output L2C_RLAST,
	output L2C_RVALID,
	input L2C_RREADY,


	//from DDR
	output [0:0] MEM_AWID,
	output [63:0] MEM_AWADDR,
	output [7:0] MEM_AWLEN,
	output [2:0] MEM_AWSIZE,
	output [1:0] MEM_AWBURST,
	output MEM_AWLOCK,
	output [3:0] MEM_AWCACHE,
	output [2:0] MEM_AWPROT,
	output [3:0] MEM_AWQOS,
	output [0:0] MEM_AWUSER,
	output MEM_AWVALID,
	input MEM_AWREADY,

	output [63:0] MEM_WDATA,
	output [7:0] MEM_WSTRB,
	output MEM_WLAST,
	output [0:0] MEM_WUSER,
	output MEM_WVALID,
	input MEM_WREADY,

	input [0:0] MEM_BID,
	input [1:0] MEM_BRESP,
	input [0:0] MEM_BUSER,
	input MEM_BVALID,
	output MEM_BREADY,

	output [0:0] MEM_ARID,
	output [63:0] MEM_ARADDR,
	output [7:0] MEM_ARLEN,
	output [2:0] MEM_ARSIZE,
	output [1:0] MEM_ARBURST,
	output MEM_ARLOCK,
	output [3:0] MEM_ARCACHE,
	output [2:0] MEM_ARPROT,
	output [3:0] MEM_ARQOS,
	output [0:0] MEM_ARUSER,
	output MEM_ARVALID,
	input MEM_ARREADY,

	input [0:0] MEM_RID,
	input [63:0] MEM_RDATA,
	input [1:0] MEM_RRESP,
	input MEM_RLAST,
	input [0:0] MEM_RUSER,
	input MEM_RVALID,
	output MEM_RREADY,

	input l3c_fence,
	output l3c_fence_end,
	input CLK,
	input RSTn

);

localparam L3C_STATE_CFREE = 0;
localparam L3C_STATE_CKTAG = 1;
localparam L3C_STATE_EVICT = 2;
localparam L3C_STATE_FLASH = 3;
localparam L3C_STATE_RSPRD = 4;
localparam L3C_STATE_RSPWR = 5;
localparam L3C_STATE_FENCE = 6;

localparam ADDR_LSB = $clog2(DW*BK/8);
localparam LINE_W = $clog2(CL); 
localparam TAG_W = 32 - ADDR_LSB - LINE_W;

wire l2c_awready_set, l2c_awready_rst, l2c_awready_qout;
wire l2c_awburst_en;
wire [1:0] l2c_awburst_dnxt;
wire [1:0] l2c_awburst_qout;
wire l2c_awlen_en;
wire [7:0] l2c_awlen_dnxt;
wire [7:0] l2c_awlen_qout;
wire [7:0] l2c_awlen_cnt_dnxta;
wire [7:0] l2c_awlen_cnt_dnxtb;
wire [7:0] l2c_awlen_cnt_qout;
wire l2c_awlen_cnt_ena, l2c_awlen_cnt_enb;
wire l2c_wready_set, l2c_wready_rst, l2c_wready_qout;
wire l2c_bvalid_set, l2c_bvalid_rst, l2c_bvalid_qout;
wire l2c_arready_set, l2c_arready_rst, l2c_arready_qout;
wire l2c_arburst_en;
wire [1:0] l2c_arburst_dnxt;
wire [1:0] l2c_arburst_qout;
wire l2c_arlen_en;
wire [7:0] l2c_arlen_dnxt;
wire [7:0] l2c_arlen_qout;
wire [7:0] l2c_arlen_cnt_dnxta;
wire [7:0] l2c_arlen_cnt_dnxtb;
wire [7:0] l2c_arlen_cnt_qout;
wire l2c_arlen_cnt_ena, l2c_arlen_cnt_enb;
wire l2c_rvalid_set, l2c_rvalid_rst, l2c_rvalid_qout;
wire l2c_rlast_set, l2c_rlast_rst, l2c_rlast_qout;
wire l2c_aw_rsp, l2c_ar_rsp;
wire l2c_end_r, l2c_end_w;


wire mem_awvalid_set, mem_awvalid_rst, mem_awvalid_qout;
wire mem_wvalid_set, mem_wvalid_rst, mem_wvalid_qout;
wire mem_wlast_set, mem_wlast_rst, mem_wlast_qout;
wire [7:0] write_index_dnxt;
wire [7:0] write_index_qout;
wire mem_bready_set, mem_bready_rst, mem_bready_qout;
wire mem_arvalid_set, mem_arvalid_rst, mem_arvalid_qout;
wire mem_rready_set, mem_rready_rst, mem_rready_qout;
wire write_resp_error, read_resp_error;
wire mem_aw_req, mem_ar_req;
wire mem_end_r, mem_end_w;


wire [2:0] l3c_state_dnxt;
wire [2:0] l3c_state_qout;

wire [31:0] cache_addr;
wire cache_en_w;
wire cache_en_r;
wire [7:0] cache_info_wstrb;
wire [63:0] cache_info_w;
wire [63:0] cache_info_r;

wire [31:0] tag_addr;
wire tag_en_w;
wire tag_en_r;
wire [(TAG_W+7)/8-1:0] tag_info_wstrb;
wire [TAG_W-1:0] tag_info_w;
wire [TAG_W-1:0] tag_info_r;

wire [31:0] cache_addr_dnxt;
wire [31:0] cache_addr_qout;

wire cb_hit;
wire [CL-1:0] cl_sel;

wire db_push;
wire [31:0] db_addr_i;
wire db_pop;
wire [31:0] db_addr_o;
wire db_empty;
wire db_full;

wire [CL-1:0] cache_valid_dnxt;
wire [CL-1:0] cache_valid_qout;
wire cache_valid_en;
















// LLLLLLLLLLL              222222222222222           CCCCCCCCCCCCC                        PPPPPPPPPPPPPPPPP        OOOOOOOOO     RRRRRRRRRRRRRRRRR   TTTTTTTTTTTTTTTTTTTTTTT
// L:::::::::L             2:::::::::::::::22      CCC::::::::::::C                        P::::::::::::::::P     OO:::::::::OO   R::::::::::::::::R  T:::::::::::::::::::::T
// L:::::::::L             2::::::222222:::::2   CC:::::::::::::::C                        P::::::PPPPPP:::::P  OO:::::::::::::OO R::::::RRRRRR:::::R T:::::::::::::::::::::T
// LL:::::::LL             2222222     2:::::2  C:::::CCCCCCCC::::C                        PP:::::P     P:::::PO:::::::OOO:::::::ORR:::::R     R:::::RT:::::TT:::::::TT:::::T
//   L:::::L                           2:::::2 C:::::C       CCCCCC                          P::::P     P:::::PO::::::O   O::::::O  R::::R     R:::::RTTTTTT  T:::::T  TTTTTT
//   L:::::L                           2:::::2C:::::C                                        P::::P     P:::::PO:::::O     O:::::O  R::::R     R:::::R        T:::::T        
//   L:::::L                        2222::::2 C:::::C                                        P::::PPPPPP:::::P O:::::O     O:::::O  R::::RRRRRR:::::R         T:::::T        
//   L:::::L                   22222::::::22  C:::::C                                        P:::::::::::::PP  O:::::O     O:::::O  R:::::::::::::RR          T:::::T        
//   L:::::L                 22::::::::222    C:::::C                                        P::::PPPPPPPPP    O:::::O     O:::::O  R::::RRRRRR:::::R         T:::::T        
//   L:::::L                2:::::22222       C:::::C                                        P::::P            O:::::O     O:::::O  R::::R     R:::::R        T:::::T        
//   L:::::L               2:::::2            C:::::C                                        P::::P            O:::::O     O:::::O  R::::R     R:::::R        T:::::T        
//   L:::::L         LLLLLL2:::::2             C:::::C       CCCCCC                          P::::P            O::::::O   O::::::O  R::::R     R:::::R        T:::::T        
// LL:::::::LLLLLLLLL:::::L2:::::2       222222 C:::::CCCCCCCC::::C                        PP::::::PP          O:::::::OOO:::::::ORR:::::R     R:::::R      TT:::::::TT      
// L::::::::::::::::::::::L2::::::2222222:::::2  CC:::::::::::::::C                        P::::::::P           OO:::::::::::::OO R::::::R     R:::::R      T:::::::::T      
// L::::::::::::::::::::::L2::::::::::::::::::2    CCC::::::::::::C                        P::::::::P             OO:::::::::OO   R::::::R     R:::::R      T:::::::::T      
// LLLLLLLLLLLLLLLLLLLLLLLL22222222222222222222       CCCCCCCCCCCCC                        PPPPPPPPPP               OOOOOOOOO     RRRRRRRR     RRRRRRR      TTTTTTTTTTT      
//                                                                 ________________________                                                                                  
//                                                                 _::::::::::::::::::::::_                                                                                  
//                                                                 ________________________                                                                                  



	assign L2C_AWREADY = l2c_awready_qout;
	assign L2C_WREADY	= l2c_wready_qout;
	assign L2C_BRESP = 2'b00;
	assign L2C_BVALID	= l2c_bvalid_qout;
	assign L2C_ARREADY = l2c_arready_qout;
	assign L2C_RRESP = 2'b00;
	assign L2C_RLAST = l2c_rlast_qout;
	assign L2C_RVALID	= l2c_rvalid_qout;
	assign l2c_end_r = L2C_RVALID & L2C_RREADY & L2C_RLAST;
	assign l2c_end_w = L2C_WVALID & L2C_WREADY & L2C_WLAST;



	assign l2c_awready_set =  l2c_aw_rsp;
	assign l2c_awready_rst = ~l2c_aw_rsp & ~(L2C_WLAST & l2c_wready_qout);
	gen_rsffr # (.DW(1)) l2c_awready_rsffr (.set_in(l2c_awready_set), .rst_in(l2c_awready_rst), .qout(l2c_awready_qout), .CLK(CLK), .RSTn(RSTn));

	assign l2c_awburst_en = l2c_aw_rsp;
	assign l2c_awburst_dnxt = L2C_AWBURST;
	gen_dffren # (.DW(2)) l2c_awburst_dffren (.dnxt(l2c_awburst_dnxt), .qout(l2c_awburst_qout), .en(l2c_awburst_en), .CLK(CLK), .RSTn(RSTn));

	assign l2c_awlen_en = l2c_aw_rsp;
	assign l2c_awlen_dnxt = L2C_AWLEN;
	gen_dffren # (.DW(8)) l2c_awlen_dffren (.dnxt(l2c_awlen_dnxt), .qout(l2c_awlen_qout), .en(l2c_awlen_en), .CLK(CLK), .RSTn(RSTn));

	assign l2c_awlen_cnt_dnxta = 8'd0;
	assign l2c_awlen_cnt_dnxtb = l2c_awlen_cnt_qout + 8'd1;
	assign l2c_awlen_cnt_ena = l2c_aw_rsp;
	assign l2c_awlen_cnt_enb = (l2c_awlen_cnt_qout <= l2c_awlen_qout) & l2c_wready_qout & L2C_WVALID;
	gen_dpdffren # (.DW(8)) l2c_awlen_cnt_dpdffren( .dnxta(l2c_awlen_cnt_dnxta), .ena(l2c_awlen_cnt_ena), .dnxtb(l2c_awlen_cnt_dnxtb), .enb(l2c_awlen_cnt_enb), .qout(l2c_awlen_cnt_qout), .CLK(CLK), .RSTn(RSTn) );

	assign l2c_wready_set = ~l2c_wready_qout & L2C_WVALID & ( l3c_state_qout == L3C_STATE_RSPWR);
	assign l2c_wready_rst =  l2c_wready_qout & L2C_WLAST;
	gen_rsffr # (.DW(1)) l2c_wready_rsffr (.set_in(l2c_wready_set), .rst_in(l2c_wready_rst), .qout(l2c_wready_qout), .CLK(CLK), .RSTn(RSTn));

	assign l2c_bvalid_set = ~l2c_bvalid_qout & ( l3c_state_qout == L3C_STATE_RSPWR) & l2c_wready_qout & L2C_WVALID & L2C_WLAST;
	assign l2c_bvalid_rst =  l2c_bvalid_qout & L2C_BREADY;
	gen_rsffr # (.DW(1)) l2c_bvalid_rsffr (.set_in(l2c_bvalid_set), .rst_in(l2c_bvalid_rst), .qout(l2c_bvalid_qout), .CLK(CLK), .RSTn(RSTn));





	
	assign l2c_arready_set =  l2c_ar_rsp;
	assign l2c_arready_rst = ~l2c_ar_rsp & ~(l2c_rvalid_qout & L2C_RREADY & l2c_arlen_cnt_qout == l2c_arlen_qout);
	gen_rsffr # (.DW(1)) l2c_arready_rsffr (.set_in(l2c_arready_set), .rst_in(l2c_arready_rst), .qout(l2c_arready_qout), .CLK(CLK), .RSTn(RSTn));
	
	assign l2c_arburst_en = l2c_ar_rsp;
	assign l2c_arburst_dnxt = L2C_ARBURST;
	gen_dffren # (.DW(2)) l2c_arburst_dffren (.dnxt(l2c_arburst_dnxt), .qout(l2c_arburst_qout), .en(l2c_arburst_en), .CLK(CLK), .RSTn(RSTn));

	assign l2c_arlen_en = l2c_ar_rsp;
	assign l2c_arlen_dnxt = L2C_ARLEN;
	gen_dffren # (.DW(8)) l2c_arlen_dffren (.dnxt(l2c_arlen_dnxt), .qout(l2c_arlen_qout), .en(l2c_arlen_en), .CLK(CLK), .RSTn(RSTn));

	assign l2c_rlast_set = ((l2c_arlen_cnt_qout == l2c_arlen_qout) & ~l2c_rlast_qout & (l3c_state_qout == L3C_STATE_RSPRD) )  ;
	assign l2c_rlast_rst = l2c_ar_rsp | (((l2c_arlen_cnt_qout <= l2c_arlen_qout) | l2c_rlast_qout | (l3c_state_qout != L3C_STATE_RSPRD) ) & ( l2c_rvalid_qout & L2C_RREADY));
	gen_rsffr # (.DW(1)) l2c_rlast_rsffr (.set_in(l2c_rlast_set), .rst_in(l2c_rlast_rst), .qout(l2c_rlast_qout), .CLK(CLK), .RSTn(RSTn));

	assign l2c_arlen_cnt_dnxta = 8'd0;
	assign l2c_arlen_cnt_dnxtb = l2c_arlen_cnt_qout + 8'd1;
	assign l2c_arlen_cnt_ena = l2c_ar_rsp;
	assign l2c_arlen_cnt_enb = ((l2c_arlen_cnt_qout <= l2c_arlen_qout) & l2c_rvalid_qout & L2C_RREADY);
	gen_dpdffren # (.DW(8)) l2c_arlen_cnt_dpdffren( .dnxta(l2c_arlen_cnt_dnxta), .ena(l2c_arlen_cnt_ena), .dnxtb(l2c_arlen_cnt_dnxtb), .enb(l2c_arlen_cnt_enb), .qout(l2c_arlen_cnt_qout), .CLK(CLK), .RSTn(RSTn) );

	assign l2c_rvalid_set = ~l2c_rvalid_qout & (l3c_state_qout == L3C_STATE_RSPRD);
	assign l2c_rvalid_rst =  l2c_rvalid_qout & L2C_RREADY;
	gen_rsffr # (.DW(1)) l2c_rvalid_rsffr (.set_in(l2c_rvalid_set), .rst_in(l2c_rvalid_rst), .qout(l2c_rvalid_qout), .CLK(CLK), .RSTn(RSTn));






// MMMMMMMM               MMMMMMMMEEEEEEEEEEEEEEEEEEEEEEMMMMMMMM               MMMMMMMM                        PPPPPPPPPPPPPPPPP        OOOOOOOOO     RRRRRRRRRRRRRRRRR   TTTTTTTTTTTTTTTTTTTTTTT
// M:::::::M             M:::::::ME::::::::::::::::::::EM:::::::M             M:::::::M                        P::::::::::::::::P     OO:::::::::OO   R::::::::::::::::R  T:::::::::::::::::::::T
// M::::::::M           M::::::::ME::::::::::::::::::::EM::::::::M           M::::::::M                        P::::::PPPPPP:::::P  OO:::::::::::::OO R::::::RRRRRR:::::R T:::::::::::::::::::::T
// M:::::::::M         M:::::::::MEE::::::EEEEEEEEE::::EM:::::::::M         M:::::::::M                        PP:::::P     P:::::PO:::::::OOO:::::::ORR:::::R     R:::::RT:::::TT:::::::TT:::::T
// M::::::::::M       M::::::::::M  E:::::E       EEEEEEM::::::::::M       M::::::::::M                          P::::P     P:::::PO::::::O   O::::::O  R::::R     R:::::RTTTTTT  T:::::T  TTTTTT
// M:::::::::::M     M:::::::::::M  E:::::E             M:::::::::::M     M:::::::::::M                          P::::P     P:::::PO:::::O     O:::::O  R::::R     R:::::R        T:::::T        
// M:::::::M::::M   M::::M:::::::M  E::::::EEEEEEEEEE   M:::::::M::::M   M::::M:::::::M                          P::::PPPPPP:::::P O:::::O     O:::::O  R::::RRRRRR:::::R         T:::::T        
// M::::::M M::::M M::::M M::::::M  E:::::::::::::::E   M::::::M M::::M M::::M M::::::M                          P:::::::::::::PP  O:::::O     O:::::O  R:::::::::::::RR          T:::::T        
// M::::::M  M::::M::::M  M::::::M  E:::::::::::::::E   M::::::M  M::::M::::M  M::::::M                          P::::PPPPPPPPP    O:::::O     O:::::O  R::::RRRRRR:::::R         T:::::T        
// M::::::M   M:::::::M   M::::::M  E::::::EEEEEEEEEE   M::::::M   M:::::::M   M::::::M                          P::::P            O:::::O     O:::::O  R::::R     R:::::R        T:::::T        
// M::::::M    M:::::M    M::::::M  E:::::E             M::::::M    M:::::M    M::::::M                          P::::P            O:::::O     O:::::O  R::::R     R:::::R        T:::::T        
// M::::::M     MMMMM     M::::::M  E:::::E       EEEEEEM::::::M     MMMMM     M::::::M                          P::::P            O::::::O   O::::::O  R::::R     R:::::R        T:::::T        
// M::::::M               M::::::MEE::::::EEEEEEEE:::::EM::::::M               M::::::M                        PP::::::PP          O:::::::OOO:::::::ORR:::::R     R:::::R      TT:::::::TT      
// M::::::M               M::::::ME::::::::::::::::::::EM::::::M               M::::::M                        P::::::::P           OO:::::::::::::OO R::::::R     R:::::R      T:::::::::T      
// M::::::M               M::::::ME::::::::::::::::::::EM::::::M               M::::::M                        P::::::::P             OO:::::::::OO   R::::::R     R:::::R      T:::::::::T      
// MMMMMMMM               MMMMMMMMEEEEEEEEEEEEEEEEEEEEEEMMMMMMMM               MMMMMMMM                        PPPPPPPPPP               OOOOOOOOO     RRRRRRRR     RRRRRRR      TTTTTTTTTTT      
//                                                                                     ________________________                                                                                  
//                                                                                     _::::::::::::::::::::::_                                                                                  
//                                                                                     ________________________  



	assign MEM_AWID = 'b0;
	assign MEM_AWLEN = 8'd63;
	assign MEM_AWSIZE	= $clog2(64/8);
	assign MEM_AWBURST = 2'b01;
	assign MEM_AWLOCK	= 1'b0;
	assign MEM_AWCACHE = 4'b0000;
	assign MEM_AWPROT	= 3'h0;
	assign MEM_AWQOS = 4'h0;
	assign MEM_AWUSER	= 'b1;
	assign MEM_AWVALID = mem_awvalid_qout;


	assign MEM_WSTRB = {8{1'b1}};
	assign MEM_WLAST = mem_wlast_qout;
	assign MEM_WUSER = 'b0;
	assign MEM_WVALID = mem_wvalid_qout;
	assign MEM_BREADY = mem_bready_qout;


	assign MEM_ARID = 'b0;
	assign MEM_ARLEN = 8'd63;
	assign MEM_ARSIZE = $clog2(64/8);
	assign MEM_ARBURST = 2'b01;
	assign MEM_ARLOCK = 1'b0;
	assign MEM_ARCACHE = 4'b0000;
	assign MEM_ARPROT = 3'h0;
	assign MEM_ARQOS = 4'h0;
	assign MEM_ARUSER = 'b1;
	assign MEM_ARVALID = mem_arvalid_qout;
	assign MEM_RREADY = mem_rready_qout;
	assign mem_end_r = MEM_RVALID & MEM_RREADY & MEM_RLAST;
	assign mem_end_w = MEM_WVALID & MEM_WREADY & MEM_WLAST;


	assign mem_awvalid_set = ~mem_awvalid_qout & mem_aw_req;
	assign mem_awvalid_rst =  mem_awvalid_qout & MEM_AWREADY ;
	gen_rsffr # (.DW(1)) mem_awvalid_rsffr (.set_in(mem_awvalid_set), .rst_in(mem_awvalid_rst), .qout(mem_awvalid_qout), .CLK(CLK), .RSTn(RSTn));

	assign mem_wvalid_set = (~mem_wvalid_qout & mem_aw_req);
	assign mem_wvalid_rst = (MEM_WREADY & mem_wvalid_qout & mem_wlast_qout) ;
	gen_rsffr # (.DW(1)) mem_wvalid_rsffr (.set_in(mem_wvalid_set), .rst_in(mem_wvalid_rst), .qout(mem_wvalid_qout), .CLK(CLK), .RSTn(RSTn));

	assign mem_wlast_set = ((write_index_qout == MEM_AWLEN - 1 ) & MEM_WREADY & mem_wvalid_qout);
	assign mem_wlast_rst = ~mem_wlast_set & ( MEM_WREADY & mem_wvalid_qout | mem_wlast_qout );
	gen_rsffr # (.DW(1)) mem_wlast_rsffr (.set_in(mem_wlast_set), .rst_in(mem_wlast_rst), .qout(mem_wlast_qout), .CLK(CLK), .RSTn(RSTn));

	assign write_index_dnxt = mem_aw_req ? 8'd0 :
								(
									(MEM_WREADY & mem_wvalid_qout & (write_index_qout != MEM_AWLEN)) ? (write_index_qout + 8'd1) : write_index_qout
								);							
	gen_dffr # (.DW(8)) write_index_dffr (.dnxt(write_index_dnxt), .qout(write_index_qout), .CLK(CLK), .RSTn(RSTn));

	assign mem_bready_set = (MEM_BVALID && ~mem_bready_qout);
	assign mem_bready_rst = mem_bready_qout;
	gen_rsffr # (.DW(1)) mem_bready_rsffr (.set_in(mem_bready_set), .rst_in(mem_bready_rst), .qout(mem_bready_qout), .CLK(CLK), .RSTn(RSTn));
	

	assign write_resp_error = mem_bready_qout & MEM_BVALID & MEM_BRESP[1]; 
	assign mem_arvalid_set = ~mem_arvalid_qout & mem_ar_req;
	assign mem_arvalid_rst = mem_arvalid_qout & MEM_ARREADY ;
	gen_rsffr # (.DW(1)) mem_arvalid_rsffr (.set_in(mem_arvalid_set), .rst_in(mem_arvalid_rst), .qout(mem_arvalid_qout), .CLK(CLK), .RSTn(RSTn));
	
	assign mem_rready_set = MEM_RVALID & (~MEM_RLAST | ~mem_rready_qout);
	assign mem_rready_rst = MEM_RVALID &   MEM_RLAST &  mem_rready_qout;
	gen_rsffr # (.DW(1)) mem_rready_rsffr (.set_in(mem_rready_set), .rst_in(mem_rready_rst), .qout(mem_rready_qout), .CLK(CLK), .RSTn(RSTn));

	assign read_resp_error = mem_rready_qout & MEM_RVALID & MEM_RRESP[1];



// BBBBBBBBBBBBBBBBB   RRRRRRRRRRRRRRRRR                  AAA               MMMMMMMM               MMMMMMMM
// B::::::::::::::::B  R::::::::::::::::R                A:::A              M:::::::M             M:::::::M
// B::::::BBBBBB:::::B R::::::RRRRRR:::::R              A:::::A             M::::::::M           M::::::::M
// BB:::::B     B:::::BRR:::::R     R:::::R            A:::::::A            M:::::::::M         M:::::::::M
//   B::::B     B:::::B  R::::R     R:::::R           A:::::::::A           M::::::::::M       M::::::::::M
//   B::::B     B:::::B  R::::R     R:::::R          A:::::A:::::A          M:::::::::::M     M:::::::::::M
//   B::::BBBBBB:::::B   R::::RRRRRR:::::R          A:::::A A:::::A         M:::::::M::::M   M::::M:::::::M
//   B:::::::::::::BB    R:::::::::::::RR          A:::::A   A:::::A        M::::::M M::::M M::::M M::::::M
//   B::::BBBBBB:::::B   R::::RRRRRR:::::R        A:::::A     A:::::A       M::::::M  M::::M::::M  M::::::M
//   B::::B     B:::::B  R::::R     R:::::R      A:::::AAAAAAAAA:::::A      M::::::M   M:::::::M   M::::::M
//   B::::B     B:::::B  R::::R     R:::::R     A:::::::::::::::::::::A     M::::::M    M:::::M    M::::::M
//   B::::B     B:::::B  R::::R     R:::::R    A:::::AAAAAAAAAAAAA:::::A    M::::::M     MMMMM     M::::::M
// BB:::::BBBBBB::::::BRR:::::R     R:::::R   A:::::A             A:::::A   M::::::M               M::::::M
// B:::::::::::::::::B R::::::R     R:::::R  A:::::A               A:::::A  M::::::M               M::::::M
// B::::::::::::::::B  R::::::R     R:::::R A:::::A                 A:::::A M::::::M               M::::::M
// BBBBBBBBBBBBBBBBB   RRRRRRRR     RRRRRRRAAAAAAA                   AAAAAAAMMMMMMMM               MMMMMMMM



// assign cache_fence_set = l3c_fence;
// assign cache_fence_rst = ;

assign l3c_fence_end = (l3c_state_qout == L3C_STATE_FENCE) & (l3c_state_dnxt == L3C_STATE_CFREE);

// gen_rsffr # (.DW(1)) cache_fence_rsffr ( .set_in(cache_fence_set), .rst_in(cache_fence_rst), .qout(cache_fence_qout), .CLK(CLK), .RSTn(RSTn) );

gen_dffr #(.DW(3)) l3c_state_dffr (.dnxt(l3c_state_dnxt), .qout(l3c_state_qout), .CLK(CLK), .RSTn(RSTn));

assign l3c_state_dnxt = 
	  ( {3{l3c_state_qout == L3C_STATE_CFREE}} & ( l3c_fence ? L3C_STATE_FENCE : ( (L2C_AWVALID | L2C_ARVALID) ? L3C_STATE_CKTAG : L3C_STATE_CFREE) ) )
	| ( {3{l3c_state_qout == L3C_STATE_FENCE}} & ( ( db_empty ) ? L3C_STATE_CFREE : L3C_STATE_EVICT ) )
	| (
		{3{l3c_state_qout == L3C_STATE_CKTAG}} & 
		(
			  ({3{ cb_hit & cache_valid_qout[cl_sel] & L2C_AWVALID & ~ L2C_ARVALID}} & (db_full ? L3C_STATE_EVICT : L3C_STATE_RSPWR ) )
			| ({3{ cb_hit & cache_valid_qout[cl_sel] & L2C_ARVALID}} & L3C_STATE_RSPRD )
			| ({3{~cb_hit & cache_valid_qout[cl_sel]              }} & L3C_STATE_EVICT )
			| ({3{         ~cache_valid_qout[cl_sel]              }} & L3C_STATE_FLASH )
		)
	)
	| ( {3{l3c_state_qout == L3C_STATE_EVICT}} & ( ~mem_end_w ? L3C_STATE_EVICT : ( l3c_fence ? L3C_STATE_FENCE : L3C_STATE_CKTAG) ))
	| ( {3{l3c_state_qout == L3C_STATE_FLASH}} & ( mem_end_r ? L3C_STATE_CKTAG : L3C_STATE_FLASH ) )
	| ( {3{l3c_state_qout == L3C_STATE_RSPRD}} & ( l2c_end_r ? L3C_STATE_CFREE : L3C_STATE_RSPRD ) )
	| ( {3{l3c_state_qout == L3C_STATE_RSPWR}} & ( l2c_end_w ? L3C_STATE_CFREE : L3C_STATE_RSPWR ) )
	;

assign l2c_aw_rsp = l3c_state_qout == L3C_STATE_CKTAG & l3c_state_dnxt == L3C_STATE_RSPWR;
assign l2c_ar_rsp = l3c_state_qout == L3C_STATE_CKTAG & l3c_state_dnxt == L3C_STATE_RSPRD;
assign mem_ar_req = l3c_state_qout == L3C_STATE_CKTAG & l3c_state_dnxt == L3C_STATE_FLASH;
assign mem_aw_req = l3c_state_qout != L3C_STATE_EVICT & l3c_state_dnxt == L3C_STATE_EVICT;

cache_mem # ( .DW(DW), .BK(BK), .CB(1), .CL(CL), .TAG_W(TAG_W) ) i_cache_mem
(
	.cache_addr(cache_addr),
	.cache_en_w(cache_en_w),
	.cache_en_r(cache_en_r),
	.cache_info_wstrb(cache_info_wstrb),
	.cache_info_w(cache_info_w),
	.cache_info_r(cache_info_r),

	.tag_addr(tag_addr),
	.tag_en_w(tag_en_w),
	.tag_en_r(tag_en_r),
	.tag_info_wstrb(tag_info_wstrb),
	.tag_info_w(tag_info_w),
	.tag_info_r(tag_info_r),

	.CLK(CLK),
	.RSTn(RSTn)
);





gen_dffr #(.DW(32)) cache_addr_dffr ( .dnxt(cache_addr_dnxt), .qout(cache_addr_qout), .CLK(CLK), .RSTn(RSTn));


assign cache_addr = cache_addr_qout;


assign cache_addr_dnxt = 
	  ( {32{l3c_state_qout == L3C_STATE_CFREE}} & cache_addr_qout )
	| ( {32{l3c_state_qout == L3C_STATE_CKTAG}} & 
		(
			( 
			  	{32{L2C_ARVALID}} & L2C_ARADDR & ( l3c_state_dnxt == L3C_STATE_RSPRD ? ~32'h0 : { {(32-ADDR_LSB){1'b1}}, {ADDR_LSB{1'b0}} } )
			)
			|
			(
				{32{L2C_AWVALID}} & 
				(
					 ( {32{ db_full}} & db_addr_o )
					|( {32{~db_full}} & L2C_AWADDR & ( l3c_state_dnxt == L3C_STATE_RSPWR ? ~32'h0 : { {(32-ADDR_LSB){1'b1}}, {ADDR_LSB{1'b0}} } ) )		
				)
			)			
		)
	  )
	| ( {32{l3c_state_qout == L3C_STATE_FENCE}} & db_addr_o )
	| ( {32{l3c_state_qout == L3C_STATE_EVICT}} & ((MEM_WVALID & MEM_WREADY) ? cache_addr_qout + 32'b1000 : cache_addr_qout) )
	| ( {32{l3c_state_qout == L3C_STATE_FLASH}} & ((MEM_RVALID & MEM_RREADY) ? cache_addr_qout + 32'b1000 : cache_addr_qout) )
	| ( {32{l3c_state_qout == L3C_STATE_RSPRD}} & ((L2C_RVALID & L2C_RREADY) ? cache_addr_qout + 32'b1000 : cache_addr_qout) )
	| ( {32{l3c_state_qout == L3C_STATE_RSPWR}} & ((L2C_WVALID & L2C_WREADY) ? cache_addr_qout + 32'b1000 : cache_addr_qout) )
	;

assign tag_addr = L2C_ARVALID ? L2C_ARADDR : L2C_AWADDR;


assign cache_en_w = ( l3c_state_qout == L3C_STATE_FLASH & MEM_RVALID & MEM_RREADY) | ( l3c_state_qout == L3C_STATE_RSPWR & L2C_WVALID & L2C_WREADY);
assign cache_en_r = ( l3c_state_dnxt == L3C_STATE_EVICT ) | ( l3c_state_dnxt == L3C_STATE_RSPRD );
assign cache_info_wstrb = 
	  ( {8{l3c_state_qout == L3C_STATE_FLASH}} & {8{1'b1}})
	| ( {8{l3c_state_qout == L3C_STATE_RSPWR}} & L2C_WSTRB);

assign cache_info_w = 
	  ( {64{l3c_state_qout == L3C_STATE_FLASH}} & MEM_RDATA)
	| ( {64{l3c_state_qout == L3C_STATE_RSPWR}} & L2C_WDATA);


assign tag_en_w = ( l3c_state_qout == L3C_STATE_CKTAG ) & ( l3c_state_dnxt == L3C_STATE_FLASH );
assign tag_en_r = l3c_state_dnxt == L3C_STATE_CKTAG;
assign tag_info_wstrb = {((TAG_W+7)/8){1'b1}};
assign tag_info_w = tag_addr[31 -: TAG_W];


assign L2C_RDATA = cache_info_r;
assign MEM_WDATA = cache_info_r;
assign MEM_AWADDR = { 32'b0, cache_addr} & ~64'h1ff;
assign MEM_ARADDR = { 32'b0, cache_addr} & ~64'h1ff;

assign cb_hit = (tag_info_r == tag_addr[31 -: TAG_W]);

assign cl_sel = tag_addr[ADDR_LSB +: $clog2(CL)];


gen_dffren # (.DW(CL)) cache_valid_dffren (.dnxt(cache_valid_dnxt), .qout(cache_valid_qout), .en(cache_valid_en), .CLK(CLK), .RSTn(RSTn));

generate
	for ( genvar cl = 0; cl < CL; cl = cl + 1) begin
		assign cache_valid_dnxt[cl] =
			( l3c_state_qout == L3C_STATE_FENCE & l3c_state_dnxt == L3C_STATE_CFREE ) ? 1'b0 :
				(
					( cl != cl_sel ) ? cache_valid_qout[cl] :
						(
							  ( l3c_state_qout == L3C_STATE_EVICT & 1'b0 ) | ( l3c_state_qout == L3C_STATE_FLASH & 1'b1 )
						)				
				);
	end
	
endgenerate

assign cache_valid_en = ( l3c_state_qout == L3C_STATE_FENCE & l3c_state_dnxt == L3C_STATE_CFREE ) | (l3c_state_qout == L3C_STATE_EVICT) | (l3c_state_qout == L3C_STATE_FLASH);











dirty_block # ( .DW(32-ADDR_LSB), .DP(16) ) i_dirty_block
(
	.push(db_push),
	.addr_i(db_addr_i[31:ADDR_LSB]),

	.pop(db_pop),
	.addr_o(db_addr_o[31:ADDR_LSB]),

	.empty(db_empty),
	.full(db_full),

	.CLK(CLK),
	.RSTn(RSTn)
);

assign db_addr_o[ADDR_LSB-1:0] = 'd0;
assign db_push = ( l3c_state_qout == L3C_STATE_CKTAG & l3c_state_dnxt == L3C_STATE_RSPWR );
assign db_addr_i = tag_addr & { {(32-ADDR_LSB){1'b1}}, {ADDR_LSB{1'b0}} };
assign db_pop = ( l3c_state_qout == L3C_STATE_EVICT & l3c_state_dnxt != L3C_STATE_EVICT );





















//ASSERT
always @( negedge CLK ) begin
	if ( (l3c_state_dnxt == L3C_STATE_CKTAG) & ~L2C_AWVALID & ~L2C_ARVALID ) begin
		$display("Assert Fail at L3cache");
		$stop;
	end


end


initial begin 
	$warning("Request from L2C in one core should comes one by one, only when last one return can the next one comes. Multi-core don't care!");
end




endmodule












