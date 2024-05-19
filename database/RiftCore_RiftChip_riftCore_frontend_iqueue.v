// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: iqueue
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-09-11 15:40:23
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-17 17:41:02
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

module iqueue (
	input lsu_fencei_valid,



	//form ifetch
	input [63:0] ic_iq_pc,
	input [63:0] ic_iq_instr,
	input ic_iq_valid,
	output ic_iq_ready,
	output fencei_stall,

	//to pcGen
	output branch_pc_valid,
	output [63:0] branch_pc,

	//from bru
	input jalr_valid,
	input [63:0] jalr_pc,
	input bru_res_valid,
	input bru_takenBranch,

	//to decoder
	output iq_id_valid,
	output [32+64+1-1:0] iq_id_info,
	input iq_id_ready,

	output isMisPredict,

	input flush,
	input CLK,
	input RSTn
);


	wire [255:0] instr_load;
	wire [15:0] iq_instr_mask_load;

	wire [63:0] pc_load;

	wire [63:0] align_instr;
	wire [3:0] align_instr_mask;

	wire instr_buf_empty;

	wire iq_stall;
	// wire fencei_stall;
	wire jalr_stall;
	wire bht_stall;

	wire [32+64+1-1:0] iq_id_info_dnxt;
	wire [32+64+1-1:0] iq_id_info_qout;
	wire iq_id_valid_dnxt;
	wire iq_id_valid_qout;
	wire [255:0] iq_instr_buf_dnxt;
	wire [255:0] iq_instr_buf_qout;
	wire [63:0] iq_pc_buf_dnxt;
	wire [63:0] iq_pc_buf_qout;
	wire [15:0] iq_instr_mask_dnxt;
	wire [15:0] iq_instr_mask_qout;




	iAlign i_align(

		.ic_iq_pc(ic_iq_pc),
		.ic_iq_instr(ic_iq_instr),

		.align_instr(align_instr),
		.align_instr_mask(align_instr_mask)

	);




	//if un-align onlu happen when flush,but will also check
	assign instr_load = 
			({256{iq_instr_mask_qout == 16'b0}} & {192'b0, (ic_iq_valid ? align_instr : 64'b0) })
			|
			({256{iq_instr_mask_qout == 16'b1}} & {176'b0, (ic_iq_valid ? align_instr : 64'b0), iq_instr_buf_qout[15:0]})
			|
			({256{iq_instr_mask_qout == 16'b11}} & {160'b0, (ic_iq_valid ? align_instr : 64'b0), iq_instr_buf_qout[31:0]})
			|
			({256{iq_instr_mask_qout == 16'b111}} & {144'b0, (ic_iq_valid ? align_instr : 64'b0), iq_instr_buf_qout[47:0]})
			|
			({256{iq_instr_mask_qout == 16'b1111}} & {128'b0, (ic_iq_valid ? align_instr : 64'b0), iq_instr_buf_qout[63:0]})
			|
			({256{iq_instr_mask_qout == 16'b11111}} & { 112'b0, (ic_iq_valid ? align_instr : 64'b0), iq_instr_buf_qout[79:0]})
			|
			({256{iq_instr_mask_qout == 16'b111111}} & { 96'b0, (ic_iq_valid ? align_instr : 64'b0), iq_instr_buf_qout[95:0]})
			|
			({256{iq_instr_mask_qout == 16'b1111111}} & { 80'b0, (ic_iq_valid ? align_instr : 64'b0), iq_instr_buf_qout[111:0]})
			|
			({256{iq_instr_mask_qout == 16'b11111111}} & { 64'b0, (ic_iq_valid ? align_instr : 64'b0), iq_instr_buf_qout[127:0]})
			|
			({256{iq_instr_mask_qout == 16'b111111111}} & { 48'b0, (ic_iq_valid ? align_instr : 64'b0), iq_instr_buf_qout[143:0]})
			|
			({256{iq_instr_mask_qout == 16'b1111111111}} & { 32'b0, (ic_iq_valid ? align_instr : 64'b0), iq_instr_buf_qout[159:0]})
			|
			({256{iq_instr_mask_qout == 16'b11111111111}} & { 16'b0, (ic_iq_valid ? align_instr : 64'b0), iq_instr_buf_qout[175:0]})
			|
			({256{iq_instr_mask_qout == 16'b111111111111}} & { (ic_iq_valid ? align_instr : 64'b0), iq_instr_buf_qout[191:0]})
			|
			({256{iq_instr_mask_qout == 16'b1111111111111}} & { 48'b0, iq_instr_buf_qout[207:0]})
			|
			({256{iq_instr_mask_qout == 16'b11111111111111}} & { 32'b0, iq_instr_buf_qout[223:0]})
			|
			({256{iq_instr_mask_qout == 16'b111111111111111}} & { 16'b0, iq_instr_buf_qout[239:0]})
			|
			({256{iq_instr_mask_qout == 16'b1111111111111111}} & iq_instr_buf_qout[255:0]);


	//only when iq_instr_buf is empty (flush) can iq use new pc fetch
	assign pc_load = (iq_instr_mask_qout == 16'b0 & ic_iq_valid) ? ic_iq_pc : iq_pc_buf_qout;
	assign iq_instr_mask_load = 
			({16{iq_instr_mask_qout == 16'b0}} & (ic_iq_valid ? align_instr_mask : 16'b0 ) )
			|
			({16{iq_instr_mask_qout == 16'b1}} & (ic_iq_valid ? {align_instr_mask, 1'b1} : 16'b1 ) )
			|
			({16{iq_instr_mask_qout == 16'b11}} & (ic_iq_valid ? {align_instr_mask, 2'b11} : 16'b11 ) )
			|
			({16{iq_instr_mask_qout == 16'b111}} & (ic_iq_valid ? {align_instr_mask, 3'b111} : 16'b111 ) )
			|
			({16{iq_instr_mask_qout == 16'b1111}} & (ic_iq_valid ? {align_instr_mask, 4'b1111} : 16'b1111 ) )
			|
			({16{iq_instr_mask_qout == 16'b11111}} & (ic_iq_valid ? {align_instr_mask, 5'b11111} : 16'b11111 ) )
			|
			({16{iq_instr_mask_qout == 16'b111111}} & (ic_iq_valid ? {align_instr_mask, 6'b111111} : 16'b111111 ) )
			|
			({16{iq_instr_mask_qout == 16'b1111111}} & (ic_iq_valid ? {align_instr_mask, 7'b1111111} : 16'b1111111 ) )
			|
			({16{iq_instr_mask_qout == 16'b11111111}} & (ic_iq_valid ? {align_instr_mask, 8'b11111111} : 16'b11111111 ) )

			|
			({16{iq_instr_mask_qout == 16'b111111111}} & (ic_iq_valid ? {align_instr_mask, 9'b111111111} : 16'b111111111 ) )
			|
			({16{iq_instr_mask_qout == 16'b1111111111}} & (ic_iq_valid ? {align_instr_mask, 10'b1111111111} : 16'b1111111111 ) )
			|
			({16{iq_instr_mask_qout == 16'b11111111111}} & (ic_iq_valid ? {align_instr_mask, 11'b11111111111} : 16'b11111111111 ) )
			|
			({16{iq_instr_mask_qout == 16'b111111111111}} & (ic_iq_valid ? {align_instr_mask, 12'b111111111111} : 16'b111111111111 ) )
			|
			({16{iq_instr_mask_qout == 16'b1111111111111}} & 16'b1111111111111 )
			|
			({16{iq_instr_mask_qout == 16'b11111111111111}} & 16'b11111111111111 )
			|
			({16{iq_instr_mask_qout == 16'b111111111111111}} & 16'b111111111111111 )
			|
			({16{iq_instr_mask_qout == 16'b1111111111111111}} & 16'b1111111111111111 );

	assign ic_iq_ready = (iq_instr_mask_qout[15:8] == 8'b00000000);







	wire isJal, isJalr, isBranch, isCall, isReturn, isRVC, isFencei;
	wire [63:0] imm;


	//branch predict
	preDecode i_preDecode(
		.instr_load(instr_load),
		.iq_instr_mask_load(iq_instr_mask_load),

		.instr_buf_empty(instr_buf_empty),
		.isJal(isJal),
		.isJalr(isJalr),
		.isBranch(isBranch),
		.isCall(isCall),
		.isReturn(isReturn),
		.isRVC(isRVC),
		.isFencei(isFencei),
		.imm(imm)
	);

	branch_predict i_branch_predict(

	.isFencei(isFencei),
	.lsu_fencei_valid(lsu_fencei_valid),
	.fencei_stall(fencei_stall),


		.isJal(isJal),
		.isJalr(isJalr),
		.isBranch(isBranch),
		.isCall(isCall),
		.isReturn(isReturn),
		.imm(imm),
		.isRVC(isRVC),
		.pc_load(pc_load),


		.jalr_valid(jalr_valid),
		.jalr_pc(jalr_pc),
		.bru_res_valid(bru_res_valid),
		.bru_takenBranch(bru_takenBranch),

		.branch_pc_valid(branch_pc_valid),
		.branch_pc(branch_pc),
		.isMisPredict(isMisPredict),

		.jalr_stall(jalr_stall),
		.bht_stall(bht_stall),
		.iq_id_ready(iq_id_ready),

		.flush(flush),
		.CLK(CLK),
		.RSTn(RSTn)

	);

wire [255:0] iq_instr_buf_shift;
wire [63:0] iq_pc_buf_shift;
wire [15:0] iq_instr_mask_shift;

assign iq_instr_buf_shift = instr_load >> (~isRVC ? 32 : 16);
assign iq_pc_buf_shift = pc_load + (~isRVC ? 64'd4 : 64'd2) ;
assign iq_instr_mask_shift =  iq_instr_mask_load >> (~isRVC ? 2 : 1);

assign iq_stall = fencei_stall | jalr_stall | bht_stall | ~iq_id_ready | instr_buf_empty;

assign iq_instr_buf_dnxt = (~iq_stall) ? iq_instr_buf_shift : instr_load ;
assign iq_pc_buf_dnxt = (~iq_stall) ? iq_pc_buf_shift : pc_load;
assign iq_instr_mask_dnxt = flush ? 16'b0 : 
										((~iq_stall) ? 
											( (branch_pc_valid) ? 16'b0 : iq_instr_mask_shift) : 
											iq_instr_mask_load);






initial begin $warning("This clumsy design can be resolved by implememnt branch predict in a single stage in the future"); end
wire jalr_stall_iq;
wire fencei_stall_iq;
gen_dffr # (.DW(1)) jalr_stall_dffr ( .dnxt(jalr_stall & iq_id_ready & ~flush), .qout(jalr_stall_iq), .CLK(CLK), .RSTn(RSTn));
gen_dffr # (.DW(1)) fencei_stall_dffr ( .dnxt(fencei_stall & iq_id_ready & ~flush), .qout(fencei_stall_iq), .CLK(CLK), .RSTn(RSTn));









assign iq_id_info_dnxt = {instr_load[31:0], pc_load, isRVC};
assign iq_id_valid_dnxt = ~fencei_stall_iq & ~jalr_stall_iq & ~bht_stall & iq_id_ready & ~instr_buf_empty & (~flush);
assign iq_id_valid = iq_id_valid_qout;
assign iq_id_info = iq_id_info_qout;
gen_dffr # (.DW(97)) iq_id_info_dffr ( .dnxt(iq_id_info_dnxt),  .qout(iq_id_info_qout),  .CLK(CLK), .RSTn(RSTn));
gen_dffr # (.DW(1), .rstValue(1'b0)) iq_id_valid_dffr ( .dnxt(iq_id_valid_dnxt), .qout(iq_id_valid_qout), .CLK(CLK), .RSTn(RSTn));









gen_dffr # (.DW(256)) iq_instr_buf_dffr ( .dnxt(iq_instr_buf_dnxt),   .qout(iq_instr_buf_qout), .CLK(CLK), .RSTn(RSTn));
gen_dffr # (.DW(64))  iq_pc_buf_dffr    ( .dnxt(iq_pc_buf_dnxt),      .qout(iq_pc_buf_qout),    .CLK(CLK), .RSTn(RSTn));
gen_dffr # (.DW(16))  iq_instr_mask_dffr ( .dnxt(iq_instr_mask_dnxt), .qout(iq_instr_mask_qout), .CLK(CLK), .RSTn(RSTn));








//sim

wire [63:0] iq_pc_qout;
wire [31:0] iq_instr_qout;
wire iq_isRVC_qout;
assign {iq_instr_qout, iq_pc_qout, iq_isRVC_qout} = iq_id_info_qout;
// always @(posedge CLK) begin
// 	if (iq_instr_mask_qout > 16'b1111 & if_iq_valid) begin
// 		$display("Assert Fail at iq, buf not enough big when fetch comes");
// 		$finish;
// 	end
// end




endmodule


