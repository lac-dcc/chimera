// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: alu
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-11-16 09:37:52
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:08:33
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


module alu #(
		parameter DW = `ALU_EXEPARAM_DW 
	)
	(

	input alu_exeparam_valid,
	input [DW-1:0] alu_exeparam,

	output alu_writeback_valid,
	output [63:0] alu_res_qout,
	output [(5+`RB)-1:0] alu_rd0_qout,

	//from regFile
	input [(64*`RP*32)-1:0] regFileX_read,

	input flush,
	input CLK,
	input RSTn
	
);

	wire alu_fun_imm;
	wire alu_fun_add;
	wire alu_fun_sub;
	wire alu_fun_slt;
	wire alu_fun_xor;
	wire alu_fun_or;
	wire alu_fun_and;
	wire alu_fun_sll;
	wire alu_fun_srl;
	wire alu_fun_sra;
	wire is32w;
	wire isUsi;
	wire isImm;
	wire isShamt;

	wire [(5+`RB)-1:0] alu_rs1;
	wire [(5+`RB)-1:0] alu_rs2;
	wire [(5+`RB)-1:0] alu_rd0_dnxt;

	wire [63:0] exe_pc;
	wire [63:0] exe_imm;


assign {
		alu_fun_imm,
		alu_fun_add,
		alu_fun_sub,
		alu_fun_slt,
		alu_fun_xor,
		alu_fun_or,
		alu_fun_and,
		alu_fun_sll,
		alu_fun_srl,
		alu_fun_sra,

		is32w,
		isUsi,
		isImm,
		isShamt,

		alu_rs1,
		alu_rs2,
		alu_rd0_dnxt,

		exe_pc,
		exe_imm

		} = alu_exeparam;


	wire [63:0] src1 = regFileX_read[ 64*alu_rs1 +: 64];
	wire [63:0] src2 = regFileX_read[ 64*alu_rs2 +: 64];

	wire [63:0] adder_op1 = ({64{alu_fun_imm}} & exe_pc)
							|
							({64{alu_fun_add|alu_fun_sub}} & src1 );

	wire [63:0] adder_op2 = ({64{alu_fun_imm}} & exe_imm)
							|
							( {64{alu_fun_add & ~isImm}} & src2 )
							|
							( {64{alu_fun_add & isImm}} & exe_imm )
							|
							( {64{alu_fun_sub}} & (~src2 + 64'd1) );


	wire [63:0] adder_cal = $unsigned( is32w ? { {32{adder_op1[31]}}, adder_op1[31:0]} : adder_op1) + $unsigned(is32w ? { {32{adder_op2[31]}}, adder_op2[31:0]} : adder_op2);
	wire [63:0] alu_add_res = is32w ? {{32{adder_cal[31]}}, adder_cal[31:0]} : adder_cal;




	wire [63:0] log_op1 = src1;
	wire [63:0] log_op2 = ({64{isImm}} & exe_imm)
							|
							({64{~isImm}} & src2);


	wire [63:0] alu_xor_res = log_op1 ^ log_op2;
	wire [63:0] alu_or_res  = log_op1 | log_op2;
	wire [63:0] alu_and_res = log_op1 & log_op2;


	wire [63:0] slt_sign_res = ( $signed(log_op1) < $signed(log_op2) ) ? 64'd1 : 64'd0;
	wire [63:0] slt_unsign_res = ( $unsigned(log_op1) < $unsigned(log_op2) ) ? 64'd1 : 64'd0;
	wire [63:0] alu_slt_res = isUsi ? slt_unsign_res : slt_sign_res;


	wire [63:0] shift_op1 = src1;
	wire [5:0] shamt = isShamt ? {~is32w & exe_imm[5], exe_imm[4:0]} : {~is32w & src2[5], src2[4:0]};



	//shift SLL SRL SRA

	wire [63:0] shiftLeft_op1 = shift_op1;
	wire signed [64:0] shiftRigt_op1 = is32w ? { {33{(shift_op1[31] & alu_fun_sra)}}, shift_op1[31:0]} 
												: { (shift_op1[63] & alu_fun_sra), shift_op1 };

	wire [63:0] shift_left64 = shiftLeft_op1 << shamt;
	wire [63:0] shift_left32 = {{32{shift_left64[31]}},shift_left64[31:0]};

	wire signed [63:0] shift_rigt64 = shiftRigt_op1 >>> shamt;
	wire signed [63:0] shift_rigt32 = {{32{shift_rigt64[31]}},shift_rigt64[31:0]};

	wire [63:0] alu_sl_res = is32w ? shift_left32 : shift_left64;
	wire [63:0] alu_sr_res = is32w ? shift_rigt32 : shift_rigt64;

	



	wire [63:0] alu_res_dnxt = ( {64{alu_fun_imm | alu_fun_add | alu_fun_sub}} & alu_add_res )
								| ( {64{alu_fun_slt}} & alu_slt_res )
								| ( {64{alu_fun_xor}} & alu_xor_res )
								| ( {64{alu_fun_or}} & alu_or_res )
								| ( {64{alu_fun_and}} & alu_and_res )
								| ( {64{alu_fun_sll}} & alu_sl_res )
								| ( {64{alu_fun_srl | alu_fun_sra}} & alu_sr_res );


gen_dffr # (.DW((5+`RB))) alu_rd0 ( .dnxt(alu_rd0_dnxt), .qout(alu_rd0_qout), .CLK(CLK), .RSTn(RSTn));
gen_dffr # (.DW(64)) alu_res ( .dnxt(alu_res_dnxt), .qout(alu_res_qout), .CLK(CLK), .RSTn(RSTn));
gen_dffr # (.DW(1)) valid ( .dnxt(alu_exeparam_valid&(~flush)), .qout(alu_writeback_valid), .CLK(CLK), .RSTn(RSTn));




















endmodule
















