// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: L2cache
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-18 14:26:30
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-17 11:39:59
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



module L2cache #
(
	parameter DW = 256,
	parameter BK = 4,
	parameter CB = 4,
	parameter CL = 32
)
(

	//L1 I Cache
	input [31:0] IL1_ARADDR,
	input [7:0] IL1_ARLEN,
	input [1:0] IL1_ARBURST,
	input IL1_ARVALID,
	output IL1_ARREADY,

	output [63:0] IL1_RDATA,
	output [1:0] IL1_RRESP,
	output IL1_RLAST,
	output IL1_RVALID,
	input IL1_RREADY,

	//L1 D cache
	input [31:0] DL1_AWADDR,
	input [7:0] DL1_AWLEN,
	input [1:0] DL1_AWBURST,
	input DL1_AWVALID,
	output DL1_AWREADY,

	input [63:0] DL1_WDATA,
	input [7:0] DL1_WSTRB,
	input DL1_WLAST,
	input DL1_WVALID,
	output DL1_WREADY,

	output [1:0] DL1_BRESP,
	output DL1_BVALID,
	input DL1_BREADY,

	input [31:0] DL1_ARADDR,
	input [7:0] DL1_ARLEN,
	input [1:0] DL1_ARBURST,
	input DL1_ARVALID,
	output DL1_ARREADY,

	output [63:0] DL1_RDATA,
	output [1:0] DL1_RRESP,
	output DL1_RLAST,
	output DL1_RVALID,
	input DL1_RREADY,


	//L3Cache
	output [31:0] MEM_AWADDR,
	output [7:0] MEM_AWLEN,
	output [1:0] MEM_AWBURST,
	output MEM_AWVALID,
	input MEM_AWREADY,
	output [63:0] MEM_WDATA,
	output [7:0] MEM_WSTRB,
	output MEM_WLAST,
	output MEM_WVALID,
	input MEM_WREADY,

	input [1:0] MEM_BRESP,
	input MEM_BVALID,
	output MEM_BREADY,

	output [31:0] MEM_ARADDR,
	output [7:0] MEM_ARLEN,
	output [1:0] MEM_ARBURST,
	output MEM_ARVALID,
	input MEM_ARREADY,

	input [63:0] MEM_RDATA,
	input [1:0] MEM_RRESP,
	input MEM_RLAST,
	input MEM_RVALID,
	output MEM_RREADY,

	input l2c_fence,
	output l2c_fence_end,
	input CLK,
	input RSTn
);

	localparam L2C_STATE_CFREE = 0;
	localparam L2C_STATE_CKTAG = 1;
	localparam L2C_STATE_FLASH = 2;
	localparam L2C_STATE_RSPIR = 3;
	localparam L2C_STATE_RSPDR = 4;
	localparam L2C_STATE_RSPDW = 5;
	localparam L2C_STATE_FENCE = 6;

	localparam ADDR_LSB = $clog2(DW*BK/8);
	localparam LINE_W = $clog2(CL); 
	localparam TAG_W = 32 - ADDR_LSB - LINE_W;

	wire il1_wready_set, il1_wready_rst, il1_wready_qout;
	wire il1_bvalid_set, il1_bvalid_rst, il1_bvalid_qout;
	wire il1_arready_set, il1_arready_rst, il1_arready_qout;
	wire [31:0] il1_araddr_dnxta;
	wire [31:0] il1_araddr_dnxtb;
	wire [31:0] il1_araddr_qout;
	wire il1_araddr_ena, il1_araddr_enb, il1_arburst_en;
	wire [1:0] il1_arburst_dnxt;
	wire [1:0] il1_arburst_qout;
	wire il1_arlen_en;
	wire [7:0] il1_arlen_dnxt;
	wire [7:0] il1_arlen_qout;
	wire [7:0] il1_arlen_cnt_dnxta;
	wire [7:0] il1_arlen_cnt_dnxtb;
	wire [7:0] il1_arlen_cnt_qout;
	wire il1_arlen_cnt_ena, il1_arlen_cnt_enb;
	wire il1_rvalid_set, il1_rvalid_rst, il1_rvalid_qout;
	wire il1_rlast_set, il1_rlast_rst, il1_rlast_qout;
	wire il1_ar_rsp;
	wire il1_end_r;

	wire dl1_arready_set, dl1_arready_rst, dl1_arready_qout;
	wire [31:0] dl1_araddr_dnxta;
	wire [31:0] dl1_araddr_dnxtb;
	wire [31:0] dl1_araddr_qout;
	wire dl1_araddr_ena, dl1_araddr_enb, dl1_arburst_en;
	wire [1:0] dl1_arburst_dnxt;
	wire [1:0] dl1_arburst_qout;
	wire dl1_arlen_en;
	wire [7:0] dl1_arlen_dnxt;
	wire [7:0] dl1_arlen_qout;
	wire [7:0] dl1_arlen_cnt_dnxta;
	wire [7:0] dl1_arlen_cnt_dnxtb;
	wire [7:0] dl1_arlen_cnt_qout;
	wire dl1_arlen_cnt_ena, dl1_arlen_cnt_enb;
	wire dl1_rvalid_set, dl1_rvalid_rst, dl1_rvalid_qout;
	wire dl1_rlast_set, dl1_rlast_rst, dl1_rlast_qout;
	wire dl1_ar_rsp;
	wire dl1_end_r;
	wire dl1_end_w;

	wire mem_arvalid_set, mem_arvalid_rst, mem_arvalid_qout;
	wire mem_rready_set, mem_rready_rst, mem_rready_qout;
	wire read_resp_error;
	wire mem_ar_req;
	wire mem_end_r;

	wire [2:0] l2c_state_dnxt;
	wire [2:0] l2c_state_qout;

	// wire cache_fence_set;
	// wire cache_fence_rst;
	// wire cache_fence_qout;

	wire [31:0] cache_addr;

	wire [CB-1:0] cache_en_w;
	wire [CB-1:0] cache_en_r;
	wire [7:0] cache_info_wstrb;
	wire [63:0] cache_info_w;
	wire [64*CB-1:0] cache_info_r;

	wire [31:0] tag_addr;
	wire [CB-1:0] tag_en_w;
	wire [CB-1:0] tag_en_r;
	wire [(TAG_W+7)/8-1:0] tag_info_wstrb;
	wire [TAG_W-1:0] tag_info_w;
	wire [TAG_W*CB-1:0] tag_info_r;

	wire [31:0] cache_addr_dnxt;
	wire [31:0] cache_addr_qout;


	wire [31:0] tag_addr_lock_dnxt;
	wire [31:0] tag_addr_sel;
	wire [31:0] tag_addr_lock_qout;

	wire [CB-1:0] cb_vhit;
	wire [CL-1:0] valid_cl_sel;
	wire [63:0] cache_data_r;
	wire [64*CB-1:0] cache_info_r_T;


	wire [CL*CB-1:0] cache_valid_set;
	wire [CL*CB-1:0] cache_valid_rst;
	wire [CL*CB-1:0] cache_valid_qout;

	wire isCacheBlockRunout;
	wire [$clog2(CB)-1:0] cache_block_sel;
	wire [15:0] random;
	wire [CB-1:0] blockReplace;

	wire [CB-1:0] cache_cl_valid;








	assign DL1_AWREADY = (l2c_state_qout == L2C_STATE_RSPDW) & MEM_AWREADY;
	assign DL1_WREADY = (l2c_state_qout == L2C_STATE_RSPDW) & MEM_WREADY;
	assign DL1_BRESP = MEM_BRESP;
	assign DL1_BVALID = (l2c_state_qout == L2C_STATE_RSPDW) & MEM_BVALID;
	assign MEM_AWADDR = DL1_AWADDR;
	assign MEM_AWLEN = DL1_AWLEN;
	assign MEM_AWBURST = DL1_AWBURST;
	assign MEM_AWVALID = (l2c_state_qout == L2C_STATE_RSPDW) & DL1_AWVALID;
	assign MEM_WDATA = DL1_WDATA;
	assign MEM_WSTRB = DL1_WSTRB;
	assign MEM_WLAST = (l2c_state_qout == L2C_STATE_RSPDW) & DL1_WLAST;
	assign MEM_WVALID = (l2c_state_qout == L2C_STATE_RSPDW) & DL1_WVALID;
	assign MEM_BREADY = (l2c_state_qout == L2C_STATE_RSPDW) & DL1_BREADY;







// IIIIIIIIIILLLLLLLLLLL               1111111                           PPPPPPPPPPPPPPPPP        OOOOOOOOO     RRRRRRRRRRRRRRRRR   TTTTTTTTTTTTTTTTTTTTTTT
// I::::::::IL:::::::::L              1::::::1                           P::::::::::::::::P     OO:::::::::OO   R::::::::::::::::R  T:::::::::::::::::::::T
// I::::::::IL:::::::::L             1:::::::1                           P::::::PPPPPP:::::P  OO:::::::::::::OO R::::::RRRRRR:::::R T:::::::::::::::::::::T
// II::::::IILL:::::::LL             111:::::1                           PP:::::P     P:::::PO:::::::OOO:::::::ORR:::::R     R:::::RT:::::TT:::::::TT:::::T
//   I::::I    L:::::L                  1::::1                             P::::P     P:::::PO::::::O   O::::::O  R::::R     R:::::RTTTTTT  T:::::T  TTTTTT
//   I::::I    L:::::L                  1::::1                             P::::P     P:::::PO:::::O     O:::::O  R::::R     R:::::R        T:::::T        
//   I::::I    L:::::L                  1::::1                             P::::PPPPPP:::::P O:::::O     O:::::O  R::::RRRRRR:::::R         T:::::T        
//   I::::I    L:::::L                  1::::l                             P:::::::::::::PP  O:::::O     O:::::O  R:::::::::::::RR          T:::::T        
//   I::::I    L:::::L                  1::::l                             P::::PPPPPPPPP    O:::::O     O:::::O  R::::RRRRRR:::::R         T:::::T        
//   I::::I    L:::::L                  1::::l                             P::::P            O:::::O     O:::::O  R::::R     R:::::R        T:::::T        
//   I::::I    L:::::L                  1::::l                             P::::P            O:::::O     O:::::O  R::::R     R:::::R        T:::::T        
//   I::::I    L:::::L         LLLLLL   1::::l                             P::::P            O::::::O   O::::::O  R::::R     R:::::R        T:::::T        
// II::::::IILL:::::::LLLLLLLLL:::::L111::::::111                        PP::::::PP          O:::::::OOO:::::::ORR:::::R     R:::::R      TT:::::::TT      
// I::::::::IL::::::::::::::::::::::L1::::::::::1                        P::::::::P           OO:::::::::::::OO R::::::R     R:::::R      T:::::::::T      
// I::::::::IL::::::::::::::::::::::L1::::::::::1                        P::::::::P             OO:::::::::OO   R::::::R     R:::::R      T:::::::::T      
// IIIIIIIIIILLLLLLLLLLLLLLLLLLLLLLLL111111111111                        PPPPPPPPPP               OOOOOOOOO     RRRRRRRR     RRRRRRR      TTTTTTTTTTT      
//                                               ________________________                                                                                  
//                                               _::::::::::::::::::::::_                                                                                  
//                                               ________________________                                                                                  
                                                                              





	assign IL1_ARREADY = il1_arready_qout;
	assign IL1_RRESP = 2'b00;
	assign IL1_RLAST = il1_rlast_qout;
	assign IL1_RVALID	= il1_rvalid_qout;
	assign il1_end_r = IL1_RVALID & IL1_RREADY & IL1_RLAST;


	
	assign il1_arready_set = il1_ar_rsp;
	assign il1_arready_rst = ~il1_ar_rsp & ~(il1_rvalid_qout & IL1_RREADY & il1_arlen_cnt_qout == il1_arlen_qout);
	gen_rsffr # (.DW(1)) il1_arready_rsffr (.set_in(il1_arready_set), .rst_in(il1_arready_rst), .qout(il1_arready_qout), .CLK(CLK), .RSTn(RSTn));

	assign il1_araddr_dnxta = IL1_ARADDR;
	assign il1_araddr_dnxtb = ({32{il1_arburst_qout == 2'b01}} & il1_araddr_qout + (1<<3));

	assign il1_araddr_ena = il1_ar_rsp;
	assign il1_araddr_enb = ((il1_arlen_cnt_qout <= il1_arlen_qout) & il1_rvalid_qout & IL1_RREADY);
	gen_dpdffren # (.DW(32)) il1_araddr_dpdffren( .dnxta(il1_araddr_dnxta), .ena(il1_araddr_ena), .dnxtb(il1_araddr_dnxtb), .enb(il1_araddr_enb), .qout(il1_araddr_qout), .CLK(CLK), .RSTn(RSTn) );

	assign il1_arburst_en = il1_ar_rsp;
	assign il1_arburst_dnxt = IL1_ARBURST;
	gen_dffren # (.DW(2)) il1_arburst_dffren (.dnxt(il1_arburst_dnxt), .qout(il1_arburst_qout), .en(il1_arburst_en), .CLK(CLK), .RSTn(RSTn));

	assign il1_arlen_en = il1_ar_rsp;
	assign il1_arlen_dnxt = IL1_ARLEN;
	gen_dffren # (.DW(8)) il1_arlen_dffren (.dnxt(il1_arlen_dnxt), .qout(il1_arlen_qout), .en(il1_arlen_en), .CLK(CLK), .RSTn(RSTn));

	assign il1_rlast_set = ((il1_arlen_cnt_qout == il1_arlen_qout) & ~il1_rlast_qout & (l2c_state_qout == L2C_STATE_RSPIR) )  ;
	assign il1_rlast_rst = il1_ar_rsp | (((il1_arlen_cnt_qout <= il1_arlen_qout) | il1_rlast_qout | ~(l2c_state_qout != L2C_STATE_RSPIR) ) & ( il1_rvalid_qout & IL1_RREADY));
	gen_rsffr # (.DW(1)) il1_rlast_rsffr (.set_in(il1_rlast_set), .rst_in(il1_rlast_rst), .qout(il1_rlast_qout), .CLK(CLK), .RSTn(RSTn));

	assign il1_arlen_cnt_dnxta = 8'd0;
	assign il1_arlen_cnt_dnxtb = il1_arlen_cnt_qout + 8'd1;
	assign il1_arlen_cnt_ena = il1_ar_rsp;
	assign il1_arlen_cnt_enb = ((il1_arlen_cnt_qout <= il1_arlen_qout) & il1_rvalid_qout & IL1_RREADY);
	gen_dpdffren # (.DW(8)) il1_arlen_cnt_dpdffren( .dnxta(il1_arlen_cnt_dnxta), .ena(il1_arlen_cnt_ena), .dnxtb(il1_arlen_cnt_dnxtb), .enb(il1_arlen_cnt_enb), .qout(il1_arlen_cnt_qout), .CLK(CLK), .RSTn(RSTn) );

	assign il1_rvalid_set = ~il1_rvalid_qout & (l2c_state_qout == L2C_STATE_RSPIR);
	assign il1_rvalid_rst =  il1_rvalid_qout & IL1_RREADY;
	gen_rsffr # (.DW(1)) il1_rvalid_rsffr (.set_in(il1_rvalid_set), .rst_in(il1_rvalid_rst), .qout(il1_rvalid_qout), .CLK(CLK), .RSTn(RSTn));







// DDDDDDDDDDDDD      LLLLLLLLLLL               1111111                           PPPPPPPPPPPPPPPPP        OOOOOOOOO     RRRRRRRRRRRRRRRRR   TTTTTTTTTTTTTTTTTTTTTTT
// D::::::::::::DDD   L:::::::::L              1::::::1                           P::::::::::::::::P     OO:::::::::OO   R::::::::::::::::R  T:::::::::::::::::::::T
// D:::::::::::::::DD L:::::::::L             1:::::::1                           P::::::PPPPPP:::::P  OO:::::::::::::OO R::::::RRRRRR:::::R T:::::::::::::::::::::T
// DDD:::::DDDDD:::::DLL:::::::LL             111:::::1                           PP:::::P     P:::::PO:::::::OOO:::::::ORR:::::R     R:::::RT:::::TT:::::::TT:::::T
//   D:::::D    D:::::D L:::::L                  1::::1                             P::::P     P:::::PO::::::O   O::::::O  R::::R     R:::::RTTTTTT  T:::::T  TTTTTT
//   D:::::D     D:::::DL:::::L                  1::::1                             P::::P     P:::::PO:::::O     O:::::O  R::::R     R:::::R        T:::::T        
//   D:::::D     D:::::DL:::::L                  1::::1                             P::::PPPPPP:::::P O:::::O     O:::::O  R::::RRRRRR:::::R         T:::::T        
//   D:::::D     D:::::DL:::::L                  1::::l                             P:::::::::::::PP  O:::::O     O:::::O  R:::::::::::::RR          T:::::T        
//   D:::::D     D:::::DL:::::L                  1::::l                             P::::PPPPPPPPP    O:::::O     O:::::O  R::::RRRRRR:::::R         T:::::T        
//   D:::::D     D:::::DL:::::L                  1::::l                             P::::P            O:::::O     O:::::O  R::::R     R:::::R        T:::::T        
//   D:::::D     D:::::DL:::::L                  1::::l                             P::::P            O:::::O     O:::::O  R::::R     R:::::R        T:::::T        
//   D:::::D    D:::::D L:::::L         LLLLLL   1::::l                             P::::P            O::::::O   O::::::O  R::::R     R:::::R        T:::::T        
// DDD:::::DDDDD:::::DLL:::::::LLLLLLLLL:::::L111::::::111                        PP::::::PP          O:::::::OOO:::::::ORR:::::R     R:::::R      TT:::::::TT      
// D:::::::::::::::DD L::::::::::::::::::::::L1::::::::::1                        P::::::::P           OO:::::::::::::OO R::::::R     R:::::R      T:::::::::T      
// D::::::::::::DDD   L::::::::::::::::::::::L1::::::::::1                        P::::::::P             OO:::::::::OO   R::::::R     R:::::R      T:::::::::T      
// DDDDDDDDDDDDD      LLLLLLLLLLLLLLLLLLLLLLLL111111111111                        PPPPPPPPPP               OOOOOOOOO     RRRRRRRR     RRRRRRR      TTTTTTTTTTT      
//                                                        ________________________                                                                                  
//                                                        _::::::::::::::::::::::_                                                                                  
//                                                        ________________________              









	assign DL1_ARREADY = dl1_arready_qout;
	assign DL1_RRESP = 2'b00;
	assign DL1_RLAST = dl1_rlast_qout;
	assign DL1_RVALID = dl1_rvalid_qout;


	assign dl1_end_r = DL1_RVALID & DL1_RREADY & DL1_RLAST;
	assign dl1_end_w = DL1_WVALID & DL1_WREADY & DL1_WLAST;


	assign dl1_arready_set = dl1_ar_rsp;
	assign dl1_arready_rst = ~dl1_ar_rsp & ~(dl1_rvalid_qout & DL1_RREADY & dl1_arlen_cnt_qout == dl1_arlen_qout);
	gen_rsffr # (.DW(1)) dl1_arready_rsffr (.set_in(dl1_arready_set), .rst_in(dl1_arready_rst), .qout(dl1_arready_qout), .CLK(CLK), .RSTn(RSTn));

	assign dl1_araddr_dnxta = DL1_ARADDR;
	assign dl1_araddr_dnxtb = ({32{dl1_arburst_qout == 2'b01}} & dl1_araddr_qout + (1<<ADDR_LSB));
	assign dl1_araddr_ena = dl1_ar_rsp;
	assign dl1_araddr_enb = ((dl1_arlen_cnt_qout <= dl1_arlen_qout) & dl1_rvalid_qout & DL1_RREADY);
	gen_dpdffren # (.DW(32)) dl1_araddr_dpdffren( .dnxta(dl1_araddr_dnxta), .ena(dl1_araddr_ena), .dnxtb(dl1_araddr_dnxtb), .enb(dl1_araddr_enb), .qout(dl1_araddr_qout), .CLK(CLK), .RSTn(RSTn) );

	
	assign dl1_arburst_en = dl1_ar_rsp;
	assign dl1_arburst_dnxt = DL1_ARBURST;
	gen_dffren # (.DW(2)) dl1_arburst_dffren (.dnxt(dl1_arburst_dnxt), .qout(dl1_arburst_qout), .en(dl1_arburst_en), .CLK(CLK), .RSTn(RSTn));


	assign dl1_arlen_en = dl1_ar_rsp;
	assign dl1_arlen_dnxt = DL1_ARLEN;
	gen_dffren # (.DW(8)) dl1_arlen_dffren (.dnxt(dl1_arlen_dnxt), .qout(dl1_arlen_qout), .en(dl1_arlen_en), .CLK(CLK), .RSTn(RSTn));


	assign dl1_rlast_set = ((dl1_arlen_cnt_qout == dl1_arlen_qout) & ~dl1_rlast_qout & (l2c_state_qout == L2C_STATE_RSPDR) )  ;
	assign dl1_rlast_rst = dl1_ar_rsp | (((dl1_arlen_cnt_qout <= dl1_arlen_qout) | dl1_rlast_qout | (l2c_state_qout != L2C_STATE_RSPDR) ) & ( dl1_rvalid_qout & DL1_RREADY));
	gen_rsffr # (.DW(1)) dl1_rlast_rsffr (.set_in(dl1_rlast_set), .rst_in(dl1_rlast_rst), .qout(dl1_rlast_qout), .CLK(CLK), .RSTn(RSTn));



	assign dl1_arlen_cnt_dnxta = 8'd0;
	assign dl1_arlen_cnt_dnxtb = dl1_arlen_cnt_qout + 8'd1;
	assign dl1_arlen_cnt_ena = dl1_ar_rsp;
	assign dl1_arlen_cnt_enb = ((dl1_arlen_cnt_qout <= dl1_arlen_qout) & dl1_rvalid_qout & DL1_RREADY);
	gen_dpdffren # (.DW(8)) dl1_arlen_cnt_dpdffren( .dnxta(dl1_arlen_cnt_dnxta), .ena(dl1_arlen_cnt_ena), .dnxtb(dl1_arlen_cnt_dnxtb), .enb(dl1_arlen_cnt_enb), .qout(dl1_arlen_cnt_qout), .CLK(CLK), .RSTn(RSTn) );



	assign dl1_rvalid_set = ~dl1_rvalid_qout & (l2c_state_qout == L2C_STATE_RSPDR);
	assign dl1_rvalid_rst =  dl1_rvalid_qout & DL1_RREADY;
	gen_rsffr # (.DW(1)) dl1_rvalid_rsffr (.set_in(dl1_rvalid_set), .rst_in(dl1_rvalid_rst), .qout(dl1_rvalid_qout), .CLK(CLK), .RSTn(RSTn));









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





	assign MEM_ARLEN = 8'd15;
	assign MEM_ARBURST = 2'b01;
	assign MEM_ARVALID = mem_arvalid_qout;
	assign MEM_RREADY = mem_rready_qout;

	assign mem_end_r = MEM_RVALID & MEM_RREADY & MEM_RLAST;
	
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








// assign cache_fence_set = l2c_fence;
// assign cache_fence_rst = (l2c_state_qout == L2C_STATE_FENCE);
// gen_rsffr # (.DW(1)) cache_fence_rsffr ( .set_in(cache_fence_set), .rst_in(cache_fence_rst), .qout(cache_fence_qout), .CLK(CLK), .RSTn(RSTn) );

assign l2c_fence_end = l2c_state_qout == L2C_STATE_FENCE;
gen_dffr # (.DW(3)) l2c_state_dffr (.dnxt(l2c_state_dnxt), .qout(l2c_state_qout), .CLK(CLK), .RSTn(RSTn));

wire [1:0] req_no_dnxt;
wire [1:0] req_no_qout;

gen_dffr # (.DW(2)) req_no_dffr (.dnxt(req_no_dnxt), .qout(req_no_qout), .CLK(CLK), .RSTn(RSTn));

assign req_no_dnxt =
				(l2c_state_dnxt == L2C_STATE_CKTAG & l2c_state_qout == L2C_STATE_CFREE) ? 
				(IL1_ARVALID ? 2'd1 : (DL1_ARVALID ? 2'd2 : (DL1_AWVALID ? 2'd3 : 2'd0))) : req_no_qout;


assign l2c_state_dnxt = 
	  ( {3{l2c_state_qout == L2C_STATE_CFREE}} & ( l2c_fence ? L2C_STATE_FENCE : ( (IL1_ARVALID | DL1_ARVALID | DL1_AWVALID) ? L2C_STATE_CKTAG : L2C_STATE_CFREE) ) )
	| ( {3{l2c_state_qout == L2C_STATE_FENCE}} & L2C_STATE_CFREE )
	| (
		{3{l2c_state_qout == L2C_STATE_CKTAG}} & 
		(
			  ( {3{req_no_qout == 2'd1}} & ( (| cb_vhit ) ? L2C_STATE_RSPIR : L2C_STATE_FLASH))
			| ( {3{req_no_qout == 2'd2}} & ( (| cb_vhit ) ? L2C_STATE_RSPDR : L2C_STATE_FLASH))
			| ( {3{req_no_qout == 2'd3}} & L2C_STATE_RSPDW)
		)
	  )
	| ( {3{l2c_state_qout == L2C_STATE_FLASH}} & ( mem_end_r ? L2C_STATE_CKTAG : L2C_STATE_FLASH ) )
	| ( {3{l2c_state_qout == L2C_STATE_RSPIR}} & ( il1_end_r ? L2C_STATE_CFREE : L2C_STATE_RSPIR ) )	
	| ( {3{l2c_state_qout == L2C_STATE_RSPDR}} & ( dl1_end_r ? L2C_STATE_CFREE : L2C_STATE_RSPDR ) )
	| ( {3{l2c_state_qout == L2C_STATE_RSPDW}} & ( dl1_end_w ? L2C_STATE_CFREE : L2C_STATE_RSPDW ) )
	;


	assign il1_ar_rsp = ~il1_arready_qout & IL1_ARVALID & l2c_state_qout == L2C_STATE_CKTAG & l2c_state_dnxt == L2C_STATE_RSPIR;
	assign dl1_ar_rsp = ~dl1_arready_qout & DL1_ARVALID & l2c_state_qout == L2C_STATE_CKTAG & l2c_state_dnxt == L2C_STATE_RSPDR;
	assign mem_ar_req = l2c_state_qout == L2C_STATE_CKTAG & l2c_state_dnxt == L2C_STATE_FLASH;










cache_mem # ( .DW(DW), .BK(BK), .CB(CB), .CL(CL), .TAG_W(TAG_W) ) i_cache_mem
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
gen_dffr #(.DW(32)) tag_addr_lock_dffren   ( .dnxt(tag_addr_lock_dnxt), .qout(tag_addr_lock_qout), .CLK(CLK), .RSTn(RSTn));

assign tag_addr_lock_dnxt = (l2c_state_dnxt == L2C_STATE_CKTAG) ? tag_addr_sel : tag_addr_lock_qout;
assign tag_addr_sel = (req_no_dnxt == 2'd1) ? IL1_ARADDR : ((req_no_dnxt == 2'd2) ? DL1_ARADDR : DL1_AWADDR );


assign cache_addr = cache_addr_qout;
assign tag_addr = (l2c_state_qout == L2C_STATE_CFREE) ? tag_addr_sel : tag_addr_lock_qout;


assign cache_addr_dnxt = 
	  ( {32{l2c_state_qout == L2C_STATE_CFREE}} & cache_addr_qout )
	| ( {32{l2c_state_qout == L2C_STATE_CKTAG}} &	 
		(
			((req_no_qout == 2'd1) ? (IL1_ARADDR) : ((req_no_qout == 2'd2) ? DL1_ARADDR : DL1_AWADDR )) &
				(
					(l2c_state_dnxt == L2C_STATE_FLASH) ? { {(32-ADDR_LSB){1'b1}}, {ADDR_LSB{1'b0}} } : {32{1'b1}}
				)
		)
	  )
	| ( {32{l2c_state_qout == L2C_STATE_FENCE}} & cache_addr_qout )
	| ( {32{l2c_state_qout == L2C_STATE_FLASH}} & ((MEM_RVALID & MEM_RREADY) ? cache_addr_qout + 32'b1000 : cache_addr_qout) )
	| ( {32{l2c_state_qout == L2C_STATE_RSPIR}} & ((IL1_RVALID & IL1_RREADY) ? cache_addr_qout + 32'b1000 : cache_addr_qout) )
	| ( {32{l2c_state_qout == L2C_STATE_RSPDR}} & ((DL1_RVALID & DL1_RREADY) ? cache_addr_qout + 32'b1000 : cache_addr_qout) )
	| ( {32{l2c_state_qout == L2C_STATE_RSPDW}} & cache_addr_qout) 
	;



assign cache_en_w =  
	(cb_vhit & {CB{(l2c_state_qout == L2C_STATE_FLASH) & MEM_RVALID & MEM_RREADY}})
	| 
	(cb_vhit & {CB{(l2c_state_qout == L2C_STATE_RSPDW) & MEM_WVALID & MEM_WREADY}});

assign cache_en_r = 
	cb_vhit & {CB{(l2c_state_dnxt == L2C_STATE_RSPIR) | (l2c_state_dnxt == L2C_STATE_RSPDR)}};

assign cache_info_wstrb = 
	  ( {8{l2c_state_qout == L2C_STATE_FLASH}} & {8{1'b1}})
	| ( {8{l2c_state_qout == L2C_STATE_RSPDW}} & DL1_WSTRB);

assign cache_info_w =
	  ( {64{l2c_state_qout == L2C_STATE_FLASH}} & MEM_RDATA)
	| ( {64{l2c_state_qout == L2C_STATE_RSPDW}} & DL1_WDATA);


assign tag_en_w = 
	{CB{(l2c_state_qout == L2C_STATE_CKTAG) & (l2c_state_dnxt == L2C_STATE_FLASH)}} &  
		( blockReplace );
assign tag_en_r = 
	{CB{l2c_state_dnxt == L2C_STATE_CKTAG}}
	|
	{CB{MEM_ARVALID & MEM_ARREADY}}
	;
assign tag_info_wstrb = {((TAG_W+7)/8){1'b1}};
assign tag_info_w = tag_addr[31 -: TAG_W];


assign IL1_RDATA = cache_data_r;
assign DL1_RDATA = cache_data_r;
assign MEM_WDATA = DL1_WDATA;
assign MEM_ARADDR = tag_addr & { {(32-ADDR_LSB){1'b1}}, {ADDR_LSB{1'b0}} };




assign valid_cl_sel = tag_addr[ADDR_LSB +: $clog2(CL)];

generate
	for ( genvar cb = 0; cb < CB; cb = cb + 1 ) begin
		assign cb_vhit[cb] = (tag_info_r[TAG_W*cb +: TAG_W] == tag_addr[31 -: TAG_W]) & cache_valid_qout[CB*valid_cl_sel+cb];

		for ( genvar i = 0; i < 64; i = i + 1) begin
			assign cache_info_r_T[CB*i+cb] = cache_info_r[64*cb+i];
		end
	end

	for ( genvar i = 0; i < 64; i = i + 1 ) begin
		assign cache_data_r[i] = | (cache_info_r_T[CB*i +: CB] &  cb_vhit);
	end


endgenerate







generate
	for ( genvar cl = 0; cl < CL; cl = cl + 1) begin
		for ( genvar cb = 0; cb < CB; cb = cb + 1 ) begin
			assign cache_valid_set[CB*cl+cb] = (l2c_state_qout == L2C_STATE_CKTAG) & (l2c_state_dnxt == L2C_STATE_FLASH) & (cl == valid_cl_sel) & blockReplace[cb];
			assign cache_valid_rst[CB*cl+cb] = (l2c_state_qout == L2C_STATE_FENCE) & (l2c_state_dnxt == L2C_STATE_CFREE);

			gen_rsffr # (.DW(1)) cache_valid_rsffr (.set_in(cache_valid_set[CB*cl+cb]), .rst_in(cache_valid_rst[CB*cl+cb]), .qout(cache_valid_qout[CB*cl+cb]), .CLK(CLK), .RSTn(RSTn));

		end


	end

endgenerate


assign cache_cl_valid = cache_valid_qout[CB*valid_cl_sel +:CB];

lzp # ( .CW($clog2(CB)) ) l2c_malloc
(
	.in_i(cache_cl_valid),
	.pos_o(cache_block_sel),
	.all1(isCacheBlockRunout),
	.all0()
);

lfsr i_lfsr
(
	.random(random),
	.CLK(CLK)
);

assign blockReplace = 1 << ( isCacheBlockRunout ? random[$clog2(CB):0] : cache_block_sel );


endmodule





