// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: lsu_issue
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-10-27 10:51:21
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-15 17:58:39
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

module lsu_issue #
	(
		parameter DW = `LSU_ISSUE_INFO_DW,
		parameter DP = `LSU_ISSUE_INFO_DP,
		parameter EXE_DW = `LSU_EXEPARAM_DW

	)
	(
		output lsu_fifo_pop,
		input lsu_fifo_empty,
		input [DW-1:0] lsu_issue_info,
		
		input issue_lsu_ready,
		output issue_lsu_valid,
		output [EXE_DW-1:0] issue_lsu_info,

		//from regFile
		input [(64*`RP*32)-1:0] regFileX_read,
		input [32*`RP-1 : 0] wbLog_qout,



		input flush,
		input CLK,
		input RSTn
);



	wire rv64i_lb;
	wire rv64i_lh;
	wire rv64i_lw;
	wire rv64i_ld;

	wire rv64i_lbu;
	wire rv64i_lhu;
	wire rv64i_lwu;

	wire rv64i_sb;
	wire rv64i_sh;
	wire rv64i_sw;
	wire rv64i_sd;

	wire rv64zi_fence_i;
	wire rv64i_fence;

	wire [63:0] imm;

	wire [(5+`RB)-1:0] lsu_rd0;
	wire [(5+`RB)-1:0] lsu_rs1;
	wire [(5+`RB)-1:0] lsu_rs2;

	wire rs1_ready;
	wire rs2_ready;

	wire lsu_isClearRAW;

	wire [63:0] op1;
	wire [63:0] op2;






	assign {
			rv64i_lb, rv64i_lh, rv64i_lw, rv64i_ld, rv64i_lbu, rv64i_lhu, rv64i_lwu,
			rv64i_sb, rv64i_sh, rv64i_sw, rv64i_sd,
			rv64zi_fence_i, rv64i_fence,
			imm,
			lsu_rd0,
			lsu_rs1,
			lsu_rs2
			} = lsu_issue_info;


	assign rs1_ready = wbLog_qout[lsu_rs1] | ( lsu_rs1[`RB +: 5] == 5'd0 );
	assign rs2_ready = wbLog_qout[lsu_rs2] | ( lsu_rs2[`RB +: 5] == 5'd0 );

	assign lsu_isClearRAW = ( ~lsu_fifo_empty ) & (
													(
														(rv64i_lb | rv64i_lh | rv64i_lw | rv64i_ld | rv64i_lbu | rv64i_lhu | rv64i_lwu)
														& rs1_ready 
													)
													|
													(
														(rv64i_sb | rv64i_sh | rv64i_sw | rv64i_sd)
														& rs1_ready & rs2_ready
													)
													|
													(
														rv64zi_fence_i | rv64i_fence
													)
												);


	assign op1 = regFileX_read[lsu_rs1 * 64 +: 64] + imm;
	assign op2 = regFileX_read[lsu_rs2 * 64 +: 64];


	wire issue_lsu_valid_set, issue_lsu_valid_rst, issue_lsu_valid_qout;
	wire [EXE_DW-1:0] issue_lsu_info_dnxt;
	wire [EXE_DW-1:0] issue_lsu_info_qout;



	assign issue_lsu_info_dnxt = issue_lsu_valid_set ? 
								{
									rv64i_lb, rv64i_lh, rv64i_lw, rv64i_ld, rv64i_lbu, rv64i_lhu, rv64i_lwu,
									rv64i_sb, rv64i_sh, rv64i_sw, rv64i_sd,
									rv64zi_fence_i, rv64i_fence,
									lsu_rd0,
									op1,
									op2
								} : issue_lsu_info_qout;
	assign issue_lsu_info = issue_lsu_info_qout;





	assign issue_lsu_valid_set = ~flush & (lsu_isClearRAW & ~issue_lsu_valid_qout);
	assign issue_lsu_valid_rst = flush | (issue_lsu_ready & issue_lsu_valid_qout);
	assign issue_lsu_valid = issue_lsu_valid_qout;

	assign lsu_fifo_pop = issue_lsu_valid_set;



	gen_dffr # (.DW(EXE_DW)) issue_lsu_info_dffr ( .dnxt(issue_lsu_info_dnxt), .qout(issue_lsu_info_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr # (.DW(1)) issue_lsu_valid_rsffr ( .set_in(issue_lsu_valid_set), .rst_in(issue_lsu_valid_rst), .qout(issue_lsu_valid_qout), .CLK(CLK), .RSTn(RSTn));

































endmodule
