// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: icache
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-12-09 17:53:14
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-17 14:59:42
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


module icache #
(
	parameter DW = 128,
	parameter BK = 2,
	parameter CB = 2,
	parameter CL = 64
)
(
	//L1 I Cache
	output [31:0] IL1_ARADDR,
	output [7:0] IL1_ARLEN,
	output [1:0] IL1_ARBURST,
	output IL1_ARVALID,
	input IL1_ARREADY,

	input [63:0] IL1_RDATA,
	input [1:0] IL1_RRESP,
	input IL1_RLAST,
	input IL1_RVALID,
	output IL1_RREADY,

	//from pcGen
	input [63:0] pc_ic_addr,
	output pc_ic_ready,

	//to iqueue
	output [63:0] ic_iq_pc,
	output [63:0] ic_iq_instr,
	output ic_iq_valid,
	input ic_iq_ready,


	input il1_fence,

	input flush,
	input CLK,
	input RSTn

);

	localparam IL1_STATE_CFREE = 0;
	localparam IL1_STATE_CKTAG = 1;
	localparam IL1_STATE_CMISS = 2;
	localparam IL1_STATE_FENCE = 3;


	localparam ADDR_LSB = $clog2(DW*BK/8);
	localparam LINE_W = $clog2(CL); 
	localparam TAG_W = 32 - ADDR_LSB - LINE_W;

	wire [31:0] ic_addr_req;
	wire [63:0] ic_data_rsp;

	wire [63:0] ic_iq_pc_dnxt;
	wire [63:0] ic_iq_pc_qout;
	wire [63:0] ic_iq_instr_dnxt;
	wire [63:0] ic_iq_instr_qout;	
	wire ic_iq_valid_dnxt, ic_iq_valid_qout;

	assign ic_addr_req = pc_ic_addr[31:0] & (~32'b111);

	assign ic_iq_pc_dnxt = pc_ic_ready ? pc_ic_addr : ic_iq_pc_qout;
	assign ic_iq_instr_dnxt = pc_ic_ready ? ic_data_rsp : ic_iq_instr_qout;
	assign ic_iq_valid_dnxt = pc_ic_ready & ~flush;

	assign ic_iq_pc = ic_iq_pc_qout;
	assign ic_iq_instr = ic_iq_instr_qout;
	assign ic_iq_valid = ic_iq_valid_qout;


	gen_dffr # (.DW(64)) ic_iq_pc_dffr (.dnxt(ic_iq_pc_dnxt), .qout(ic_iq_pc_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(64)) ic_iq_instr_dffr (.dnxt(ic_iq_instr_dnxt), .qout(ic_iq_instr_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(1)) ic_iq_valid_dffr (.dnxt(ic_iq_valid_dnxt), .qout(ic_iq_valid_qout), .CLK(CLK), .RSTn(RSTn));












	wire il1_arvalid_set, il1_arvalid_rst, il1_arvalid_qout;
	wire il1_rready_set, il1_rready_rst, il1_rready_qout;
	wire il1_ar_req;
	wire il1_end_r;


	wire [1:0] il1_state_dnxt;
	wire [1:0] il1_state_qout;
	// wire [1:0] il1_state_mode_dir;

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
	wire [LINE_W-1:0] valid_cl_sel;
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

	assign IL1_ARBURST = 2'b01;
	assign IL1_ARADDR = addr_req_qout & { {(32-ADDR_LSB){1'b1}}, {ADDR_LSB{1'b0}} };
	assign IL1_ARLEN = 8'd3;
	assign IL1_ARVALID = il1_arvalid_qout;
	assign IL1_RREADY = il1_rready_qout;

	assign il1_end_r = IL1_RVALID & IL1_RREADY & IL1_RLAST;
	
	assign il1_arvalid_set = ~il1_arvalid_qout & il1_ar_req;
	assign il1_arvalid_rst = il1_arvalid_qout & IL1_ARREADY ;
	gen_rsffr # (.DW(1)) il1_arvalid_rsffr (.set_in(il1_arvalid_set), .rst_in(il1_arvalid_rst), .qout(il1_arvalid_qout), .CLK(CLK), .RSTn(RSTn));
	
	assign il1_rready_set = IL1_RVALID & (~IL1_RLAST | ~il1_rready_qout);
	assign il1_rready_rst = IL1_RVALID &   IL1_RLAST &  il1_rready_qout;
	gen_rsffr # (.DW(1)) il1_rready_rsffr (.set_in(il1_rready_set), .rst_in(il1_rready_rst), .qout(il1_rready_qout), .CLK(CLK), .RSTn(RSTn));






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

wire trans_kill_set, trans_kill_rst, trans_kill_qout;


assign trans_kill_set = (flush & il1_state_dnxt == IL1_STATE_CMISS);
assign trans_kill_rst = il1_state_dnxt != IL1_STATE_CMISS;

gen_rsffr #(.DW(1)) trans_kill_rsffr (.set_in(trans_kill_set), .rst_in(trans_kill_rst), .qout(trans_kill_qout), .CLK(CLK), .RSTn(RSTn));


// assign cache_fence_set = il1_fence;
// assign cache_fence_rst = (il1_state_qout == IL1_STATE_FENCE);
// gen_rsffr # (.DW(1)) cache_fence_rsffr ( .set_in(cache_fence_set), .rst_in(cache_fence_rst), .qout(cache_fence_qout), .CLK(CLK), .RSTn(RSTn) );

wire il1_fence_set, il1_fence_rst, il1_fence_qout;

assign il1_fence_set =  il1_fence & ~il1_fence_qout;
assign il1_fence_rst = ~il1_fence &  il1_fence_qout;

gen_rsffr # (.DW(1)) il1_fence_rsffr (.set_in(il1_fence_set), .rst_in(il1_fence_rst), .qout(il1_fence_qout), .CLK(CLK), .RSTn(RSTn));

gen_dffr # (.DW(2)) il1_state_dffr (.dnxt(il1_state_dnxt), .qout(il1_state_qout), .CLK(CLK), .RSTn(RSTn));


// assign il1_state_mode_dir = 
// 	ifu_req_valid ? IL1_STATE_CKTAG : IL1_STATE_CFREE;


assign il1_state_dnxt = 
	( {2{il1_state_qout == IL1_STATE_CFREE}} & (il1_fence_qout ? IL1_STATE_FENCE : (ic_iq_ready&(~flush) ? IL1_STATE_CKTAG : IL1_STATE_CFREE)) ) 
	|
	( {2{il1_state_qout == IL1_STATE_CKTAG}} & ((| cb_vhit ) ? IL1_STATE_CFREE : IL1_STATE_CMISS) )
	|
	( {2{il1_state_qout == IL1_STATE_CMISS}} & (il1_end_r ? IL1_STATE_CFREE : IL1_STATE_CMISS) )
	|
	( {2{il1_state_qout == IL1_STATE_FENCE}} & (~il1_fence_qout ? IL1_STATE_CFREE : IL1_STATE_FENCE) )
	;





assign pc_ic_ready = 
	  ( (il1_state_qout == IL1_STATE_CKTAG) & (| cb_vhit ) & ~flush) 
	| ( (il1_state_qout == IL1_STATE_CMISS) & (cache_addr_qout == addr_req_qout) & IL1_RVALID & IL1_RREADY & ~trans_kill_qout );

assign ic_data_rsp = 
	  ( {64{il1_state_qout == IL1_STATE_CKTAG}} & cache_data_r )
	| ( {64{il1_state_qout == IL1_STATE_CMISS}} & IL1_RDATA );


assign il1_ar_req = (il1_state_qout == IL1_STATE_CKTAG) & (il1_state_dnxt == IL1_STATE_CMISS);







	assign cache_en_w = cb_vhit & {CB{il1_state_qout == IL1_STATE_CMISS & IL1_RVALID & IL1_RREADY}};
	assign cache_en_r = {CB{il1_state_dnxt == IL1_STATE_CKTAG}};
	assign cache_info_wstrb = 8'b11111111;
	assign cache_info_w = IL1_RDATA;

	assign tag_addr = (il1_state_qout == IL1_STATE_CMISS) ? addr_req_qout : ic_addr_req;
	assign tag_en_w = blockReplace & {CB{il1_state_qout == IL1_STATE_CKTAG & il1_state_dnxt == IL1_STATE_CMISS}};
	assign tag_en_r = {CB{(il1_state_dnxt == IL1_STATE_CKTAG) | (il1_state_qout == IL1_STATE_CMISS & IL1_ARVALID & IL1_ARREADY)}};
	assign tag_info_wstrb = {((TAG_W+7)/8){1'b1}};
	assign tag_info_w = tag_addr[31 -: TAG_W];


	assign cache_addr_dnxt = 
		  ( {32{il1_state_qout == IL1_STATE_CFREE}} & ic_addr_req & { {(32-ADDR_LSB){1'b1}}, {ADDR_LSB{1'b0}} } )
		| ( {32{il1_state_qout == IL1_STATE_CKTAG}} & ic_addr_req & { {(32-ADDR_LSB){1'b1}}, {ADDR_LSB{1'b0}} } )
		| ( {32{il1_state_qout == IL1_STATE_CMISS}} & ( (IL1_RVALID & IL1_RREADY) ? cache_addr_qout + 32'b1000 : cache_addr_qout) )
		| ( {32{il1_state_qout == IL1_STATE_FENCE}} & ic_addr_req & { {(32-ADDR_LSB){1'b1}}, {ADDR_LSB{1'b0}} } )
		;

		wire [31:0] addr_req_dnxt;
		wire [31:0] addr_req_qout;
		
	assign addr_req_dnxt = (il1_state_qout == IL1_STATE_CFREE) ? ic_addr_req : addr_req_qout;


	gen_dffr #(.DW(32)) addr_req_dffr ( .dnxt(addr_req_dnxt), .qout(addr_req_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr #(.DW(32)) cache_addr_dffr ( .dnxt(cache_addr_dnxt), .qout(cache_addr_qout), .CLK(CLK), .RSTn(RSTn));


	assign cache_addr = (il1_state_qout == IL1_STATE_CMISS) ? cache_addr_qout : ic_addr_req;


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












assign valid_cl_sel = addr_req_qout[ADDR_LSB +: LINE_W];
wire [TAG_W-1:0] chk_tag = addr_req_qout[31 -: TAG_W];

generate
	for ( genvar cb = 0; cb < CB; cb = cb + 1 ) begin
		assign cb_vhit[cb] = (tag_info_r[TAG_W*cb +: TAG_W] == chk_tag) & cache_valid_qout[CB*valid_cl_sel+cb];

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

			assign cache_valid_set[CB*cl+cb] = (il1_state_qout == IL1_STATE_CKTAG) & (il1_state_dnxt == IL1_STATE_CMISS) & (cl == valid_cl_sel) & blockReplace[cb];
			assign cache_valid_rst[CB*cl+cb] = (il1_state_qout == IL1_STATE_FENCE) & (il1_state_dnxt == IL1_STATE_CFREE);

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




