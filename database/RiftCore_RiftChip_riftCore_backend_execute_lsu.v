// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: lsu
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-18 19:03:39
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-17 16:43:14
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


module lsu #
(
	parameter DW = 128,
	parameter BK = 2,
	parameter CB = 4,
	parameter CL = 64
)
(

	//L1 D cache
	output [31:0] DL1_AWADDR,
	output [7:0] DL1_AWLEN,
	output [1:0] DL1_AWBURST,
	output DL1_AWVALID,
	input DL1_AWREADY,

	output [63:0] DL1_WDATA,
	output [7:0] DL1_WSTRB,
	output DL1_WLAST,
	output DL1_WVALID,
	input DL1_WREADY,

	input [1:0] DL1_BRESP,
	input DL1_BVALID,
	output DL1_BREADY,

	output [31:0] DL1_ARADDR,
	output [7:0] DL1_ARLEN,
	output [1:0] DL1_ARBURST,
	output DL1_ARVALID,
	input DL1_ARREADY,

	input [63:0] DL1_RDATA,
	input [1:0] DL1_RRESP,
	input DL1_RLAST,
	input DL1_RVALID,
	output DL1_RREADY,




	output [31:0] SYS_AWADDR,
	output SYS_AWVALID,
	input SYS_AWREADY,

	output [63:0] SYS_WDATA,
	output [7:0] SYS_WSTRB,
	output SYS_WVALID,
	input SYS_WREADY,

	input [1:0] SYS_BRESP,
	input SYS_BVALID,
	output SYS_BREADY,

	output [31:0] SYS_ARADDR,
	output SYS_ARVALID,
	input SYS_ARREADY,

	input [63:0] SYS_RDATA,
	input [1:0] SYS_RRESP,
	input SYS_RVALID,
	output SYS_RREADY,







	output lsu_fencei_valid,

	output issue_lsu_ready,
	input issue_lsu_valid,
	input [`LSU_EXEPARAM_DW-1:0] issue_lsu_info,
	
	output lsu_wb_valid,
	output [63:0] lsu_wb_res,
	output [(5+`RB-1):0] lsu_wb_rd0,

	//from commit
	input isFenceCommited,
	input isSuCommited,
	output isLSUAccessFault,
	output isLSUMisAlign,
	output [63:0] lsu_trap_addr, 

	input flush,

	output l2c_fence,
	input l2c_fence_end,

	output l3c_fence,
	input l3c_fence_end,


	input CLK,
	input RSTn
);

	localparam DL1_STATE_CFREE = 0;
	localparam DL1_STATE_CREAD = 1;
	localparam DL1_STATE_MWAIT = 2;
	localparam DL1_STATE_CMISS = 3;
	localparam DL1_STATE_FENCE = 4;
	localparam DL1_STATE_WRITE = 5;
	localparam DL1_STATE_PWAIT = 6;
	localparam DL1_STATE_PREAD = 7;

	localparam ADDR_LSB = $clog2(DW*BK/8);
	localparam LINE_W = $clog2(CL); 
	localparam TAG_W = 32 - ADDR_LSB - LINE_W;

	wire dl1_awvalid_set, dl1_awvalid_rst, dl1_awvalid_qout;
	wire dl1_wvalid_set, dl1_wvalid_rst, dl1_wvalid_qout;
	wire dl1_bready_set, dl1_bready_rst, dl1_bready_qout;
	wire dl1_arvalid_set, dl1_arvalid_rst, dl1_arvalid_qout;
	wire dl1_rready_set, dl1_rready_rst, dl1_rready_qout;
	wire dl1_aw_req, dl1_ar_req;
	wire dl1_end_r, dl1_end_w;

	// wire cache_fence_set;
	// wire cache_fence_rst;
	// wire cache_fence_qout;

	wire [2:0] dl1_state_dnxt;
	wire [2:0] dl1_state_qout;

	wire [2:0] dl1_state_mode_dir;

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
	
	wire [31:0] chkAddr;
	wire isHazard_r;
	wire wtb_push;
	wire wtb_pop;
	wire [103:0] wtb_data_i;
	wire [103:0] wtb_data_o;
	wire wtb_full;
	wire wtb_empty;

	wire [CB-1:0] cache_cl_valid;





// hhhhhhh                                                            d::::::d                hhhhhhh                               kkkkkkkk                            
// h:::::h                                                            d::::::d                h:::::h                               k::::::k                            
// h:::::h                                                            d::::::d                h:::::h                               k::::::k                            
// h:::::h                                                            d:::::d                 h:::::h                               k::::::k                            
//  h::::h hhhhh         aaaaaaaaaaaaa  nnnn  nnnnnnnn        ddddddddd:::::d     ssssssssss   h::::h hhhhh         aaaaaaaaaaaaa    k:::::k    kkkkkkk eeeeeeeeeeee    
//  h::::hh:::::hhh      a::::::::::::a n:::nn::::::::nn    dd::::::::::::::d   ss::::::::::s  h::::hh:::::hhh      a::::::::::::a   k:::::k   k:::::kee::::::::::::ee  
//  h::::::::::::::hh    aaaaaaaaa:::::an::::::::::::::nn  d::::::::::::::::d ss:::::::::::::s h::::::::::::::hh    aaaaaaaaa:::::a  k:::::k  k:::::ke::::::eeeee:::::ee
//  h:::::::hhh::::::h            a::::ann:::::::::::::::nd:::::::ddddd:::::d s::::::ssss:::::sh:::::::hhh::::::h            a::::a  k:::::k k:::::ke::::::e     e:::::e
//  h::::::h   h::::::h    aaaaaaa:::::a  n:::::nnnn:::::nd::::::d    d:::::d  s:::::s  ssssss h::::::h   h::::::h    aaaaaaa:::::a  k::::::k:::::k e:::::::eeeee::::::e
//  h:::::h     h:::::h  aa::::::::::::a  n::::n    n::::nd:::::d     d:::::d    s::::::s      h:::::h     h:::::h  aa::::::::::::a  k:::::::::::k  e:::::::::::::::::e 
//  h:::::h     h:::::h a::::aaaa::::::a  n::::n    n::::nd:::::d     d:::::d       s::::::s   h:::::h     h:::::h a::::aaaa::::::a  k:::::::::::k  e::::::eeeeeeeeeee  
//  h:::::h     h:::::ha::::a    a:::::a  n::::n    n::::nd:::::d     d:::::d ssssss   s:::::s h:::::h     h:::::ha::::a    a:::::a  k::::::k:::::k e:::::::e           
//  h:::::h     h:::::ha::::a    a:::::a  n::::n    n::::nd::::::ddddd::::::dds:::::ssss::::::sh:::::h     h:::::ha::::a    a:::::a k::::::k k:::::ke::::::::e          
//  h:::::h     h:::::ha:::::aaaa::::::a  n::::n    n::::n d:::::::::::::::::ds::::::::::::::s h:::::h     h:::::ha:::::aaaa::::::a k::::::k  k:::::ke::::::::eeeeeeee  
//  h:::::h     h:::::h a::::::::::aa:::a n::::n    n::::n  d:::::::::ddd::::d s:::::::::::ss  h:::::h     h:::::h a::::::::::aa:::ak::::::k   k:::::kee:::::::::::::e  
//  hhhhhhh     hhhhhhh  aaaaaaaaaa  aaaa nnnnnn    nnnnnn   ddddddddd   ddddd  sssssssssss    hhhhhhh     hhhhhhh  aaaaaaaaaa  aaaakkkkkkkk    kkkkkkk eeeeeeeeeeeeee  

	wire lsu_lb, lsu_lh, lsu_lw, lsu_ld, lsu_lbu, lsu_lhu, lsu_lwu, lsu_sb, lsu_sh, lsu_sw, lsu_sd, lsu_fence_i, lsu_fence;
	wire [(5+`RB)-1:0] lsu_rd0;
	wire [63:0] lsu_op1;
	wire [63:0] lsu_op2;
	wire lsu_wen;
	wire lsu_ren;
	wire [7:0] lsu_wstrb;
	wire [7:0] lsu_wstrb_align;
	wire io_access;
	wire mem_access;

	wire [31:0] lsu_op1_align64;
	wire [31:0] lsu_op1_alignCache;
	wire [2:0] lsu_op1_2_0;
	wire [5:0] lsu_op1_2_0_000;

	wire [7:0] lsu_rsp_data_reAlign8;
	wire [15:0] lsu_rsp_data_reAlign16;
	wire [31:0] lsu_rsp_data_reAlign32;
	wire [63:0] lsu_rsp_data_reAlign64;


	wire [63:0] lsu_wdata_align;

	assign lsu_op1_align64 = lsu_op1[31:0] & (~32'b111);
	assign lsu_op1_alignCache = lsu_op1[31:0] & { {(32-ADDR_LSB){1'b1}}, {ADDR_LSB{1'b0}}};
	assign lsu_op1_2_0 = lsu_op1[2:0];
	assign lsu_op1_2_0_000 = {lsu_op1_2_0, 3'b000};

	assign issue_lsu_ready = (dl1_state_qout != DL1_STATE_CFREE) & (dl1_state_dnxt == DL1_STATE_CFREE);



	assign { 
			lsu_lb, lsu_lh, lsu_lw, lsu_ld, lsu_lbu, lsu_lhu, lsu_lwu,
			lsu_sb, lsu_sh, lsu_sw, lsu_sd,
			lsu_fence_i, lsu_fence,
			lsu_rd0,
			lsu_op1,
			lsu_op2
			} = issue_lsu_info;
	assign lsu_ren = lsu_lb | lsu_lh | lsu_lw | lsu_ld | lsu_lbu | lsu_lhu | lsu_lwu;
	assign lsu_wen = lsu_sb | lsu_sh | lsu_sw | lsu_sd;

	assign lsu_wstrb =    ({8{lsu_sb}} & 8'b1  )
						| ({8{lsu_sh}} & 8'b11 )
						| ({8{lsu_sw}} & 8'b1111 )
						| ({8{lsu_sd}} & 8'b11111111 );
	assign lsu_wstrb_align = lsu_wstrb << lsu_op1_2_0;

	assign lsu_wdata_align = lsu_op2 << lsu_op1_2_0_000;



	assign io_access = (& (~lsu_op1[63:32]) ) & ~lsu_op1[31] & ~lsu_op1[30];
	assign mem_access = (& (~lsu_op1[63:32]) ) & lsu_op1[31];




	assign isLSUAccessFault = (~io_access & ~mem_access) & (lsu_ren | lsu_wen) & issue_lsu_valid;

	assign isLSUMisAlign = issue_lsu_valid &
				(
					  ( (lsu_lh | lsu_lhu | lsu_sh ) & (lsu_op1[0] != 1'b0) )
					| ( (lsu_lw | lsu_lwu | lsu_sw ) & (lsu_op1[1:0] != 2'b0 ) )
					| ( (lsu_ld | lsu_sd)            & (lsu_op1[2:0] != 3'b0) )				
				);

	assign lsu_trap_addr = lsu_op1;

	wire [(5+`RB)-1:0] lsu_wb_rd0_dnxt;
	wire [(5+`RB)-1:0] lsu_wb_rd0_qout;
	wire [63:0] lsu_wb_res_dnxt;
	wire [63:0] lsu_wb_res_qout;
	wire lsu_wb_valid_dnxt, lsu_wb_valid_qout;
	wire lsu_rsp_valid;
	wire [63:0] lsu_rdata_rsp;

	wire trans_kill_set, trans_kill_rst, trans_kill_qout;


	assign lsu_wb_valid_dnxt = lsu_rsp_valid & ~flush; 
	assign lsu_wb_valid = lsu_wb_valid_qout;

	assign lsu_wb_rd0_dnxt = lsu_rsp_valid ? lsu_rd0 : lsu_wb_rd0_qout;
	assign lsu_wb_rd0 = lsu_wb_rd0_qout;


	assign lsu_rsp_data_reAlign8 =
			  ({8{lsu_op1_2_0 == 3'b000}} & lsu_rdata_rsp[7:0])
			| ({8{lsu_op1_2_0 == 3'b001}} & lsu_rdata_rsp[15:8])
			| ({8{lsu_op1_2_0 == 3'b010}} & lsu_rdata_rsp[23:16])
			| ({8{lsu_op1_2_0 == 3'b011}} & lsu_rdata_rsp[31:24])
			| ({8{lsu_op1_2_0 == 3'b100}} & lsu_rdata_rsp[39:32])
			| ({8{lsu_op1_2_0 == 3'b101}} & lsu_rdata_rsp[47:40])
			| ({8{lsu_op1_2_0 == 3'b110}} & lsu_rdata_rsp[55:48])
			| ({8{lsu_op1_2_0 == 3'b111}} & lsu_rdata_rsp[63:56]);

	assign lsu_rsp_data_reAlign16 = 
			  ({16{lsu_op1_2_0 == 3'b000}} & lsu_rdata_rsp[15:0])
			| ({16{lsu_op1_2_0 == 3'b010}} & lsu_rdata_rsp[31:16])
			| ({16{lsu_op1_2_0 == 3'b100}} & lsu_rdata_rsp[47:32])
			| ({16{lsu_op1_2_0 == 3'b110}} & lsu_rdata_rsp[63:48]);


	assign lsu_rsp_data_reAlign32 = 
			  ({32{lsu_op1_2_0 == 3'b000}} & lsu_rdata_rsp[31:0])
			| ({32{lsu_op1_2_0 == 3'b100}} & lsu_rdata_rsp[63:32]);

	assign lsu_rsp_data_reAlign64 = lsu_rdata_rsp;

	assign lsu_wb_res_dnxt =
				lsu_rsp_valid ?
				(
					({64{lsu_lb}} & ( { {56{lsu_rsp_data_reAlign8[7]}}, lsu_rsp_data_reAlign8} ))
					|
					({64{lsu_lbu}} & ( { 56'b0,                         lsu_rsp_data_reAlign8} ))
					|
					({64{lsu_lh}} & ( { {48{lsu_rsp_data_reAlign16[15]}}, lsu_rsp_data_reAlign16} ))
					|
					({64{lsu_lhu}} & ( { 48'b0,                           lsu_rsp_data_reAlign16} ))
					|
					({64{lsu_lw}} & ( { {32{lsu_rsp_data_reAlign32[31]}}, lsu_rsp_data_reAlign32} ))
					|
					({64{lsu_lwu}} & ( { 32'b0,                           lsu_rsp_data_reAlign32} ))
					|
					({64{lsu_ld}} & lsu_rsp_data_reAlign64)			
				)
				: lsu_wb_res_qout;
	assign lsu_wb_res = lsu_wb_res_qout;

	assign trans_kill_set = flush;
	assign trans_kill_rst = ((dl1_state_dnxt == DL1_STATE_CFREE) | (dl1_state_qout == DL1_STATE_CFREE)) & ~flush;


	gen_dffr # (.DW((5+`RB))) lsu_wb_rd0_dffr ( .dnxt(lsu_wb_rd0_dnxt), .qout(lsu_wb_rd0_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(64)) lsu_wb_res_dffr (.dnxt(lsu_wb_res_dnxt), .qout(lsu_wb_res_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(1)) lsu_wb_valid_rsffr ( .dnxt(lsu_wb_valid_dnxt), .qout(lsu_wb_valid_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr # (.DW(1)) trans_kill_rsffr (.set_in(trans_kill_set), .rst_in(trans_kill_rst), .qout(trans_kill_qout), .CLK(CLK), .RSTn(RSTn));


























//    SSSSSSSSSSSSSSS YYYYYYY       YYYYYYY   SSSSSSSSSSSSSSS 
//  SS:::::::::::::::SY:::::Y       Y:::::Y SS:::::::::::::::S
// S:::::SSSSSS::::::SY:::::Y       Y:::::YS:::::SSSSSS::::::S
// S:::::S     SSSSSSSY::::::Y     Y::::::YS:::::S     SSSSSSS
// S:::::S            YYY:::::Y   Y:::::YYYS:::::S            
// S:::::S               Y:::::Y Y:::::Y   S:::::S            
//  S::::SSSS             Y:::::Y:::::Y     S::::SSSS         
//   SS::::::SSSSS         Y:::::::::Y       SS::::::SSSSS    
//     SSS::::::::SS        Y:::::::Y          SSS::::::::SS  
//        SSSSSS::::S        Y:::::Y              SSSSSS::::S 
//             S:::::S       Y:::::Y                   S:::::S
//             S:::::S       Y:::::Y                   S:::::S
// SSSSSSS     S:::::S       Y:::::Y       SSSSSSS     S:::::S
// S::::::SSSSSS:::::S    YYYY:::::YYYY    S::::::SSSSSS:::::S
// S:::::::::::::::SS     Y:::::::::::Y    S:::::::::::::::SS 
//  SSSSSSSSSSSSSSS       YYYYYYYYYYYYY     SSSSSSSSSSSSSSS 















	wire sys_awvalid_set, sys_awvalid_rst, sys_awvalid_qout;
	wire sys_wvalid_set, sys_wvalid_rst, sys_wvalid_qout;
	wire sys_bready_set, sys_bready_rst, sys_bready_qout;

	wire sys_arvalid_set, sys_arvalid_rst, sys_arvalid_qout;
	wire sys_rready_set, sys_rready_rst, sys_rready_qout;

	wire sys_ar_req, sys_aw_req;
	wire sys_end_r, sys_end_w;
	wire sys_end;

	assign sys_end_r = SYS_RVALID & SYS_RREADY;
	assign sys_end_w = SYS_WVALID & SYS_WREADY;
	assign sys_end = sys_end_r | sys_end_w;



	assign SYS_AWVALID = sys_awvalid_qout;
	assign SYS_WVALID  = sys_wvalid_qout;
	assign SYS_BREADY	= sys_bready_qout;

	assign SYS_ARADDR	= lsu_op1[31:0];
	assign SYS_ARVALID = sys_arvalid_qout;
	assign SYS_RREADY	= sys_rready_qout;



	assign sys_awvalid_set = sys_aw_req;
	assign sys_awvalid_rst = ~sys_awvalid_set & (SYS_AWREADY & sys_awvalid_qout);
	assign sys_wvalid_set = sys_aw_req;
	assign sys_wvalid_rst = ~sys_wvalid_set & (SYS_WREADY & sys_wvalid_qout);	
	assign sys_bready_set = SYS_BVALID & ~sys_bready_qout;
	assign sys_bready_rst = sys_bready_qout;

	gen_rsffr # (.DW(1)) sys_awvalid_rsffr (.set_in(sys_awvalid_set), .rst_in(sys_awvalid_rst), .qout(sys_awvalid_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr # (.DW(1)) sys_wvalid_rsffr (.set_in(sys_wvalid_set), .rst_in(sys_wvalid_rst), .qout(sys_wvalid_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr # (.DW(1)) sys_bready_rsffr (.set_in(sys_bready_set), .rst_in(sys_bready_rst), .qout(sys_bready_qout), .CLK(CLK), .RSTn(RSTn));








	assign sys_arvalid_set = sys_ar_req;
	assign sys_arvalid_rst = ~sys_arvalid_set & (SYS_ARREADY & sys_arvalid_qout);
	assign sys_rready_set = SYS_RVALID & ~sys_rready_qout;
	assign sys_rready_rst = sys_rready_qout;


	gen_rsffr # (.DW(1)) sys_arvalid_rsffr (.set_in(sys_arvalid_set), .rst_in(sys_arvalid_rst), .qout(sys_arvalid_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr # (.DW(1)) sys_rready_rsffr (.set_in(sys_rready_set), .rst_in(sys_rready_rst), .qout(sys_rready_qout), .CLK(CLK), .RSTn(RSTn));






























// MMMMMMMM               MMMMMMMMEEEEEEEEEEEEEEEEEEEEEEMMMMMMMM               MMMMMMMM
// M:::::::M             M:::::::ME::::::::::::::::::::EM:::::::M             M:::::::M
// M::::::::M           M::::::::ME::::::::::::::::::::EM::::::::M           M::::::::M
// M:::::::::M         M:::::::::MEE::::::EEEEEEEEE::::EM:::::::::M         M:::::::::M
// M::::::::::M       M::::::::::M  E:::::E       EEEEEEM::::::::::M       M::::::::::M
// M:::::::::::M     M:::::::::::M  E:::::E             M:::::::::::M     M:::::::::::M
// M:::::::M::::M   M::::M:::::::M  E::::::EEEEEEEEEE   M:::::::M::::M   M::::M:::::::M
// M::::::M M::::M M::::M M::::::M  E:::::::::::::::E   M::::::M M::::M M::::M M::::::M
// M::::::M  M::::M::::M  M::::::M  E:::::::::::::::E   M::::::M  M::::M::::M  M::::::M
// M::::::M   M:::::::M   M::::::M  E::::::EEEEEEEEEE   M::::::M   M:::::::M   M::::::M
// M::::::M    M:::::M    M::::::M  E:::::E             M::::::M    M:::::M    M::::::M
// M::::::M     MMMMM     M::::::M  E:::::E       EEEEEEM::::::M     MMMMM     M::::::M
// M::::::M               M::::::MEE::::::EEEEEEEE:::::EM::::::M               M::::::M
// M::::::M               M::::::ME::::::::::::::::::::EM::::::M               M::::::M
// M::::::M               M::::::ME::::::::::::::::::::EM::::::M               M::::::M
// MMMMMMMM               MMMMMMMMEEEEEEEEEEEEEEEEEEEEEEMMMMMMMM               MMMMMMMM





	assign DL1_AWLEN = 8'd0;
	assign DL1_AWBURST = 2'b00;
	assign DL1_AWVALID = dl1_awvalid_qout;
	assign DL1_WLAST = 1'b1;
	assign DL1_WVALID = dl1_wvalid_qout;
	assign DL1_BREADY = dl1_bready_qout;


	assign DL1_ARADDR = lsu_op1_alignCache;
	assign DL1_ARLEN = 8'd3;
	assign DL1_ARBURST = 2'b01;
	assign DL1_ARVALID = dl1_arvalid_qout;
	assign DL1_RREADY = dl1_rready_qout;
	assign dl1_end_r = DL1_RVALID & DL1_RREADY & DL1_RLAST;
	assign dl1_end_w = DL1_WVALID & DL1_WREADY & DL1_WLAST;


	assign dl1_awvalid_set = ~dl1_awvalid_qout & dl1_aw_req;
	assign dl1_awvalid_rst =  dl1_awvalid_qout & DL1_AWREADY ;
	gen_rsffr # (.DW(1)) dl1_awvalid_rsffr (.set_in(dl1_awvalid_set), .rst_in(dl1_awvalid_rst), .qout(dl1_awvalid_qout), .CLK(CLK), .RSTn(RSTn));

	assign dl1_wvalid_set = (~dl1_wvalid_qout & dl1_aw_req);
	assign dl1_wvalid_rst = (DL1_WREADY & dl1_wvalid_qout & DL1_WLAST) ;
	gen_rsffr # (.DW(1)) dl1_wvalid_rsffr (.set_in(dl1_wvalid_set), .rst_in(dl1_wvalid_rst), .qout(dl1_wvalid_qout), .CLK(CLK), .RSTn(RSTn));

	assign dl1_bready_set = (DL1_BVALID && ~dl1_bready_qout);
	assign dl1_bready_rst = dl1_bready_qout;
	gen_rsffr # (.DW(1)) dl1_bready_rsffr (.set_in(dl1_bready_set), .rst_in(dl1_bready_rst), .qout(dl1_bready_qout), .CLK(CLK), .RSTn(RSTn));
	
	assign dl1_arvalid_set = ~dl1_arvalid_qout & dl1_ar_req;
	assign dl1_arvalid_rst = dl1_arvalid_qout & DL1_ARREADY ;
	gen_rsffr # (.DW(1)) dl1_arvalid_rsffr (.set_in(dl1_arvalid_set), .rst_in(dl1_arvalid_rst), .qout(dl1_arvalid_qout), .CLK(CLK), .RSTn(RSTn));
	
	assign dl1_rready_set = DL1_RVALID & (~DL1_RLAST | ~dl1_rready_qout);
	assign dl1_rready_rst = DL1_RVALID &   DL1_RLAST &  dl1_rready_qout;
	gen_rsffr # (.DW(1)) dl1_rready_rsffr (.set_in(dl1_rready_set), .rst_in(dl1_rready_rst), .qout(dl1_rready_qout), .CLK(CLK), .RSTn(RSTn));










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









gen_dffr # (.DW(3)) dl1_state_dffr (.dnxt(dl1_state_dnxt), .qout(dl1_state_qout), .CLK(CLK), .RSTn(RSTn));



assign dl1_state_mode_dir = 
		(issue_lsu_valid & ~isLSUAccessFault & ~isLSUMisAlign & ~flush) ? 
			(
				  ({3{lsu_ren & mem_access}} & DL1_STATE_CREAD)
				| ({3{lsu_wen & ~wtb_full}} & DL1_STATE_WRITE)
				| ({3{lsu_ren & io_access &  isHazard_r}} & DL1_STATE_PWAIT)
				| ({3{lsu_ren & io_access & ~isHazard_r}} & DL1_STATE_PREAD)
			)
			: DL1_STATE_CFREE
			;



assign dl1_state_dnxt = 
		( {3{dl1_state_qout == DL1_STATE_CFREE}} & 
			( (issue_lsu_valid & (lsu_fence_i | lsu_fence) & ~flush ) ? DL1_STATE_FENCE : dl1_state_mode_dir )
		)
		|
		( {3{dl1_state_qout == DL1_STATE_CREAD}} &
			( (| cb_vhit ) ? DL1_STATE_CFREE : ( isHazard_r ? DL1_STATE_MWAIT : DL1_STATE_CMISS)  )
		)
		|
		( {3{dl1_state_qout == DL1_STATE_MWAIT}} & ( ~isHazard_r ? DL1_STATE_CMISS : DL1_STATE_MWAIT) )
		|
		( {3{dl1_state_qout == DL1_STATE_CMISS}} & ( dl1_end_r ? DL1_STATE_CFREE : DL1_STATE_CMISS ) )
		|
		( {3{dl1_state_qout == DL1_STATE_WRITE}} & DL1_STATE_CFREE )
		|
		( {3{dl1_state_qout == DL1_STATE_PWAIT}} & ( ~isHazard_r ? DL1_STATE_PREAD : DL1_STATE_PWAIT ) )
		|
		( {3{dl1_state_qout == DL1_STATE_PREAD}} & ( sys_end_r ? DL1_STATE_CFREE : DL1_STATE_PREAD ) )
		|
		( {3{dl1_state_qout == DL1_STATE_FENCE}} & ( fence_end_qout ? DL1_STATE_CFREE : DL1_STATE_FENCE ) )		
		;

assign sys_ar_req = (dl1_state_qout != DL1_STATE_PREAD) & (dl1_state_dnxt == DL1_STATE_PREAD);



assign lsu_rsp_valid = 
	  ( (dl1_state_qout == DL1_STATE_CREAD) & (dl1_state_dnxt == DL1_STATE_CFREE) )
	| ( (dl1_state_qout == DL1_STATE_CMISS) & (cache_addr_qout == lsu_op1_align64 ) & DL1_RVALID & DL1_RREADY & ~trans_kill_qout )
	| ( (dl1_state_qout == DL1_STATE_WRITE) & (dl1_state_dnxt == DL1_STATE_CFREE) )
	| ( (dl1_state_qout == DL1_STATE_FENCE) & wtb_empty & ~trans_kill_qout )
	| ( (dl1_state_qout == DL1_STATE_PREAD) & (dl1_state_dnxt == DL1_STATE_CFREE) & ~trans_kill_qout );

assign dl1_ar_req = 
	(
		  ((dl1_state_qout == DL1_STATE_CREAD) & (dl1_state_dnxt == DL1_STATE_CMISS))
		| ((dl1_state_qout == DL1_STATE_MWAIT) & (dl1_state_dnxt == DL1_STATE_CMISS))
	);



assign lsu_rdata_rsp = 
	  ( {64{dl1_state_qout == DL1_STATE_CREAD}} & cache_data_r )
	| ( {64{dl1_state_qout == DL1_STATE_CMISS}} & DL1_RDATA )
	| ( {64{dl1_state_qout == DL1_STATE_PREAD}} & SYS_RDATA );



assign cache_addr = (dl1_state_qout == DL1_STATE_CMISS) ? cache_addr_qout : lsu_op1_align64;
assign cache_en_w =
		{CB{mem_access}} &
		(
			  (cb_vhit & {CB{dl1_state_qout == DL1_STATE_CMISS & DL1_RVALID & DL1_RREADY}})
			| (cb_vhit & {CB{dl1_state_qout == DL1_STATE_WRITE}})
		);


assign cache_en_r = {CB{mem_access}} & {CB{dl1_state_dnxt == DL1_STATE_CREAD}};
assign cache_info_wstrb = (dl1_state_qout == DL1_STATE_CMISS) ? 8'b11111111 : lsu_wstrb_align;
assign cache_info_w = (dl1_state_qout == DL1_STATE_CMISS) ? DL1_RDATA : lsu_wdata_align;



assign tag_addr = lsu_op1_alignCache;
assign tag_en_w = blockReplace &
			{CB{
				  (dl1_state_qout == DL1_STATE_CREAD & dl1_state_dnxt == DL1_STATE_CMISS)
				| (dl1_state_qout == DL1_STATE_MWAIT & dl1_state_dnxt == DL1_STATE_CMISS)
			}};
assign tag_en_r = {CB{mem_access}} & {CB{(dl1_state_dnxt == DL1_STATE_CREAD) | (dl1_state_dnxt == DL1_STATE_WRITE) | (dl1_state_qout == DL1_STATE_CMISS & DL1_ARVALID & DL1_ARREADY)}};
assign tag_info_wstrb = {((TAG_W+7)/8){1'b1}};
assign tag_info_w = tag_addr[31 -: TAG_W];


assign cache_addr_dnxt = 
	  ( {32{dl1_state_qout == DL1_STATE_CFREE}} & lsu_op1_alignCache )
	| ( {32{dl1_state_qout == DL1_STATE_CREAD}} & lsu_op1_alignCache )
	| ( {32{dl1_state_qout == DL1_STATE_WRITE}} & lsu_op1_alignCache )
	| ( {32{dl1_state_qout == DL1_STATE_MWAIT}} & lsu_op1_alignCache )
	| ( {32{dl1_state_qout == DL1_STATE_CMISS}} & ( (DL1_RVALID & DL1_RREADY) ? cache_addr_qout + 32'b1000 : cache_addr_qout) )
	| ( {32{dl1_state_qout == DL1_STATE_FENCE}} & lsu_op1_alignCache )
	;

gen_dffr #(.DW(32)) cache_addr_dffr ( .dnxt(cache_addr_dnxt), .qout(cache_addr_qout), .CLK(CLK), .RSTn(RSTn));





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






assign valid_cl_sel = lsu_op1[ADDR_LSB +: LINE_W];

generate
	for ( genvar cb = 0; cb < CB; cb = cb + 1 ) begin
		assign cb_vhit[cb] = (tag_info_r[TAG_W*cb +: TAG_W] == lsu_op1[31 -: TAG_W]) & cache_valid_qout[CB*valid_cl_sel+cb];

		for ( genvar i = 0; i < 64; i = i + 1 ) begin
			assign cache_info_r_T[CB*i+cb] = cache_info_r[64*cb+i];
		end
	end

	for ( genvar i = 0; i < 64; i = i + 1 ) begin
		assign cache_data_r[i] = | (cache_info_r_T[CB*i +: CB] & cb_vhit);
	end


endgenerate







generate
	for ( genvar cl = 0; cl < CL; cl = cl + 1) begin
		for ( genvar cb = 0; cb < CB; cb = cb + 1 ) begin

			assign cache_valid_set[CB*cl+cb] =
				(
					  (dl1_state_qout == DL1_STATE_CREAD) & (dl1_state_dnxt == DL1_STATE_CMISS)
					| (dl1_state_qout == DL1_STATE_MWAIT) & (dl1_state_dnxt == DL1_STATE_CMISS)
				)
				& (cl == valid_cl_sel) & blockReplace[cb];

			assign cache_valid_rst[CB*cl+cb] = (dl1_state_qout == DL1_STATE_FENCE) & (dl1_state_dnxt == DL1_STATE_CFREE);

			gen_rsffr # (.DW(1)) cache_valid_rsffr (.set_in(cache_valid_set[CB*cl+cb]), .rst_in(cache_valid_rst[CB*cl+cb]), .qout(cache_valid_qout[CB*cl+cb]), .CLK(CLK), .RSTn(RSTn));

		end


	end

endgenerate




assign cache_cl_valid = cache_valid_qout[CB*valid_cl_sel +:CB];


lzp # ( .CW($clog2(CB)) ) dl1_malloc
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







// TTTTTTTTTTTTTTTTTTTTTTTXXXXXXX       XXXXXXX
// T:::::::::::::::::::::TX:::::X       X:::::X
// T:::::::::::::::::::::TX:::::X       X:::::X
// T:::::TT:::::::TT:::::TX::::::X     X::::::X
// TTTTTT  T:::::T  TTTTTTXXX:::::X   X:::::XXX
//         T:::::T           X:::::X X:::::X   
//         T:::::T            X:::::X:::::X    
//         T:::::T             X:::::::::X     
//         T:::::T             X:::::::::X     
//         T:::::T            X:::::X:::::X    
//         T:::::T           X:::::X X:::::X   
//         T:::::T        XXX:::::X   X:::::XXX
//       TT:::::::TT      X::::::X     X::::::X
//       T:::::::::T      X:::::X       X:::::X
//       T:::::::::T      X:::::X       X:::::X
//       TTTTTTTTTTT      XXXXXXX       XXXXXXX


















assign chkAddr = lsu_op1_align64;
assign wtb_push = (dl1_state_qout == DL1_STATE_WRITE);
assign wtb_pop = dl1_end_w | sys_end_w;
		
assign dl1_aw_req = ~wtb_empty & (~DL1_AWVALID & ~DL1_WVALID) & DL1_AWADDR[31];
assign sys_aw_req = ~wtb_empty & (~SYS_AWVALID & ~SYS_WVALID) & ~DL1_AWADDR[31] & ~DL1_AWADDR[30];


assign {DL1_WDATA,  DL1_WSTRB,  DL1_AWADDR}  = wtb_data_o;
assign {SYS_WDATA, SYS_WSTRB, SYS_AWADDR} = wtb_data_o;


localparam WTB_AW = 3;
localparam WTB_DP = 2**WTB_AW;


assign wtb_data_i = { lsu_wdata_align, lsu_wstrb_align, lsu_op1_align64 };

wt_block # ( .DW(104), .DP(WTB_DP), .TAG_W(TAG_W) ) i_wt_block
(
	.chkAddr(chkAddr),
	.isHazard_r(isHazard_r),

	.push(wtb_push),
	.data_i(wtb_data_i),

	.pop(wtb_pop),
	.data_o(wtb_data_o),

	.commit(isSuCommited),
	.isOpin_O(),
	.isOpin_W(),
	.empty(wtb_empty),
	.full(wtb_full),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)
);




// FFFFFFFFFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEEEEEEENNNNNNNN        NNNNNNNN        CCCCCCCCCCCCCEEEEEEEEEEEEEEEEEEEEEE
// F::::::::::::::::::::FE::::::::::::::::::::EN:::::::N       N::::::N     CCC::::::::::::CE::::::::::::::::::::E
// F::::::::::::::::::::FE::::::::::::::::::::EN::::::::N      N::::::N   CC:::::::::::::::CE::::::::::::::::::::E
// FF::::::FFFFFFFFF::::FEE::::::EEEEEEEEE::::EN:::::::::N     N::::::N  C:::::CCCCCCCC::::CEE::::::EEEEEEEEE::::E
//   F:::::F       FFFFFF  E:::::E       EEEEEEN::::::::::N    N::::::N C:::::C       CCCCCC  E:::::E       EEEEEE
//   F:::::F               E:::::E             N:::::::::::N   N::::::NC:::::C                E:::::E             
//   F::::::FFFFFFFFFF     E::::::EEEEEEEEEE   N:::::::N::::N  N::::::NC:::::C                E::::::EEEEEEEEEE   
//   F:::::::::::::::F     E:::::::::::::::E   N::::::N N::::N N::::::NC:::::C                E:::::::::::::::E   
//   F:::::::::::::::F     E:::::::::::::::E   N::::::N  N::::N:::::::NC:::::C                E:::::::::::::::E   
//   F::::::FFFFFFFFFF     E::::::EEEEEEEEEE   N::::::N   N:::::::::::NC:::::C                E::::::EEEEEEEEEE   
//   F:::::F               E:::::E             N::::::N    N::::::::::NC:::::C                E:::::E             
//   F:::::F               E:::::E       EEEEEEN::::::N     N:::::::::N C:::::C       CCCCCC  E:::::E       EEEEEE
// FF:::::::FF           EE::::::EEEEEEEE:::::EN::::::N      N::::::::N  C:::::CCCCCCCC::::CEE::::::EEEEEEEE:::::E
// F::::::::FF           E::::::::::::::::::::EN::::::N       N:::::::N   CC:::::::::::::::CE::::::::::::::::::::E
// F::::::::FF           E::::::::::::::::::::EN::::::N        N::::::N     CCC::::::::::::CE::::::::::::::::::::E
// FFFFFFFFFFF           EEEEEEEEEEEEEEEEEEEEEENNNNNNNN         NNNNNNN        CCCCCCCCCCCCCEEEEEEEEEEEEEEEEEEEEEE



wire dl1_fence_end;


wire fence_end_set, fence_end_rst, fence_end_qout;
wire l2c_fence_set, l2c_fence_rst, l2c_fence_qout;
wire l3c_fence_set, l3c_fence_rst, l3c_fence_qout;
wire l2c_fence_finish_set, l2c_fence_finish_rst, l2c_fence_finish_qout;
wire l3c_fence_finish_set, l3c_fence_finish_rst, l3c_fence_finish_qout;
wire isFence_set, isFence_rst, isFence_qout;

assign isFence_set = ~isFence_qout & isFenceCommited;
assign isFence_rst = dl1_state_dnxt == DL1_STATE_CFREE;
gen_rsffr # (.DW(1)) isFence_rsffr (.set_in(isFence_set), .rst_in(isFence_rst), .qout(isFence_qout), .CLK(CLK), .RSTn(RSTn));


assign l2c_fence_set = ~l2c_fence_rst & dl1_fence_end & isFence_qout & ~l2c_fence_finish_qout;
assign l3c_fence_set = ~l3c_fence_rst & dl1_fence_end & isFence_qout & ~l3c_fence_finish_qout;

assign l2c_fence_rst = l2c_fence_end;
assign l3c_fence_rst = l3c_fence_end;

assign l2c_fence_finish_set = l2c_fence_end;
assign l3c_fence_finish_set = l3c_fence_end;
assign l2c_fence_finish_rst = dl1_state_dnxt == DL1_STATE_CFREE;
assign l3c_fence_finish_rst = dl1_state_dnxt == DL1_STATE_CFREE;

assign l2c_fence = l2c_fence_qout;
assign l3c_fence = l3c_fence_qout;

assign dl1_fence_end = wtb_empty;
assign fence_end_set = (lsu_fence_i & dl1_fence_end) | (l3c_fence_end) | (flush & ~isFence_qout);
assign fence_end_rst = dl1_state_dnxt == DL1_STATE_CFREE;




gen_rsffr # (.DW(1)) l2c_fence_rsffr (.set_in(l2c_fence_set), .rst_in(l2c_fence_rst), .qout(l2c_fence_qout), .CLK(CLK), .RSTn(RSTn));
gen_rsffr # (.DW(1)) l3c_fence_rsffr (.set_in(l3c_fence_set), .rst_in(l3c_fence_rst), .qout(l3c_fence_qout), .CLK(CLK), .RSTn(RSTn));
gen_rsffr # (.DW(1)) l2c_fence_finish_rsffr (.set_in(l2c_fence_finish_set), .rst_in(l2c_fence_finish_rst), .qout(l2c_fence_finish_qout), .CLK(CLK), .RSTn(RSTn));
gen_rsffr # (.DW(1)) l3c_fence_finish_rsffr (.set_in(l3c_fence_finish_set), .rst_in(l3c_fence_finish_rst), .qout(l3c_fence_finish_qout), .CLK(CLK), .RSTn(RSTn));


gen_rsffr # (.DW(1)) fence_end_rsffr (.set_in(fence_end_set), .rst_in(fence_end_rst), .qout(fence_end_qout), .CLK(CLK), .RSTn(RSTn));

assign lsu_fencei_valid = lsu_fence_i & dl1_fence_end & issue_lsu_valid;


//ASSERT
always @( negedge CLK ) begin

	if ( 0 ) begin
		$display("Assert Fail at L1-Dcache");
		$stop;
	end


end


endmodule


