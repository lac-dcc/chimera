// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: bru_issue
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-10-27 10:50:36
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:08:28
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

module bru_issue #
	(
		parameter DW = `BRU_ISSUE_INFO_DW,
		parameter EXE_DW = `BRU_EXEPARAM_DW
	)
	(

	//from fifo
	output bru_fifo_pop,
	input bru_fifo_empty,
	input [DW-1:0] bru_issue_info,

	//from execute

	input bru_exeparam_ready,
	output bru_exeparam_valid_qout,
	output [EXE_DW-1:0] bru_exeparam_qout,
	input bruILP_ready,

	input [32*`RP-1 : 0] wbLog_qout,

	input flush,
	input CLK,
	input RSTn
);


	wire rv64i_jal;
	wire rv64i_jalr;
	wire rv64i_beq;
	wire rv64i_bne;
	wire rv64i_blt;
	wire rv64i_bge;
	wire rv64i_bltu;
	wire rv64i_bgeu;

	wire is_rvc;

	wire [63:0] bru_pc;
	wire [63:0] bru_imm;

	wire [5+`RB-1:0] bru_rd0;
	wire [5+`RB-1:0] bru_rs1;
	wire [5+`RB-1:0] bru_rs2;


	assign {
				rv64i_jal,
				rv64i_jalr,
				rv64i_beq,
				rv64i_bne,
				rv64i_blt,
				rv64i_bge,
				rv64i_bltu,
				rv64i_bgeu,

				is_rvc,

				bru_pc,
				bru_imm,

				bru_rd0,
				bru_rs1,
				bru_rs2
			} = bru_issue_info;


	wire rs1_ready = wbLog_qout[bru_rs1] | (bru_rs1[`RB +: 5] == 5'd0);
	wire rs2_ready = wbLog_qout[bru_rs2] | (bru_rs2[`RB +: 5] == 5'd0);

	wire bru_isClearRAW = ( ~bru_fifo_empty ) 
							& (
								( ( rv64i_beq
									| rv64i_bne
									| rv64i_blt
									| rv64i_bge
									| rv64i_bltu
									| rv64i_bgeu
									) & rs1_ready & rs2_ready & bruILP_ready)
								|  rv64i_jal
								| ( rv64i_jalr & rs1_ready )
								);

	wire [EXE_DW-1:0] bru_exeparam_dnxt = bru_exeparam_valid_dnxt ? { 
										rv64i_jal,
										rv64i_jalr,

										rv64i_beq,
										rv64i_bne,
										rv64i_blt,
										rv64i_bge,
										rv64i_bltu,
										rv64i_bgeu,

										is_rvc,

										bru_rs1,
										bru_rs2,
										bru_rd0,

										bru_pc,
										bru_imm
									}
									: bru_exeparam_qout;

	wire bru_exeparam_valid_dnxt = flush ? 1'b0 : (bru_exeparam_ready & bru_isClearRAW);
	assign bru_fifo_pop = bru_exeparam_valid_dnxt;

	gen_dffr # (.DW(EXE_DW)) bru_exeparam ( .dnxt(bru_exeparam_dnxt), .qout(bru_exeparam_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(1)) bru_exeparam_valid ( .dnxt(bru_exeparam_valid_dnxt), .qout(bru_exeparam_valid_qout), .CLK(CLK), .RSTn(RSTn));






endmodule







