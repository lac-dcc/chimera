// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: alu_issue
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-11-16 10:00:58
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-26 10:31:15
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


module alu_issue #(
		parameter DW = `ALU_ISSUE_INFO_DW,
		parameter DP = `ALU_ISSUE_INFO_DP,
		parameter EXE_DW = `ALU_EXEPARAM_DW
	)
	(
	
		//from buffer
		output alu_buffer_pop,
		output [$clog2(DP)-1:0] alu_buffer_pop_index,
		input [DP-1:0] alu_buffer_malloc,
		input [DW*DP-1 : 0] alu_issue_info,

		//from execute
		// input alu_execute_ready,
		output alu_exeparam_valid_qout,
		output [EXE_DW-1:0] alu_exeparam_qout,

		//from regFile
		input [32*`RP-1 : 0] wbLog_qout,

		input flush,
		input CLK,
		input RSTn

);

	//alu should be ready
	wire alu_exeparam_ready = 1'b1;



	wire [DP-1:0] rv64i_lui;
	wire [DP-1:0] rv64i_auipc;
	wire [DP-1:0] rv64i_addi;
	wire [DP-1:0] rv64i_addiw;
	wire [DP-1:0] rv64i_add;
	wire [DP-1:0] rv64i_addw;
	wire [DP-1:0] rv64i_sub;
	wire [DP-1:0] rv64i_subw;

	wire [DP-1:0] rv64i_slti;
	wire [DP-1:0] rv64i_sltiu;
	wire [DP-1:0] rv64i_slt;
	wire [DP-1:0] rv64i_sltu;
	wire [DP-1:0] rv64i_xori;
	wire [DP-1:0] rv64i_ori;
	wire [DP-1:0] rv64i_andi;
	wire [DP-1:0] rv64i_xor;
	wire [DP-1:0] rv64i_or;
	wire [DP-1:0] rv64i_and;

	wire [DP-1:0] rv64i_slli;
	wire [DP-1:0] rv64i_slliw;
	wire [DP-1:0] rv64i_srli;
	wire [DP-1:0] rv64i_srliw;
	wire [DP-1:0] rv64i_srai;
	wire [DP-1:0] rv64i_sraiw;
	wire [DP-1:0] rv64i_sll;
	wire [DP-1:0] rv64i_sllw;
	wire [DP-1:0] rv64i_srl;
	wire [DP-1:0] rv64i_srlw;
	wire [DP-1:0] rv64i_sra;
	wire [DP-1:0] rv64i_sraw;

	wire [64*DP-1:0] alu_pc;
	wire [6*DP-1:0] alu_shamt;
	wire [64*DP-1:0] alu_imm;

	wire [(5+`RP)*DP-1:0] alu_rd0;
	wire [(5+`RP)*DP-1:0] alu_rs1;
	wire [(5+`RP)*DP-1:0] alu_rs2;

	wire [DP-1:0] rs1_ready;
	wire [DP-1:0] rs2_ready;

	wire [DP-1:0] is32w;
	wire [DP-1:0] isUsi;
	wire [DP-1:0] isImm;
	wire [DP-1:0] isShamt;

	wire [DP-1:0] alu_fun_imm;
	wire [DP-1:0] alu_fun_add;
	wire [DP-1:0] alu_fun_sub;
	wire [DP-1:0] alu_fun_slt;
	wire [DP-1:0] alu_fun_xor;
	wire [DP-1:0] alu_fun_or;
	wire [DP-1:0] alu_fun_and;
	wire [DP-1:0] alu_fun_sll;
	wire [DP-1:0] alu_fun_srl;
	wire [DP-1:0] alu_fun_sra;

	wire [64*DP-1:0] exe_pc;
	wire [64*DP-1:0] exe_imm;


	wire [DP-1:0] alu_isClearRAW;

generate
	for ( genvar i = 0; i < DP; i = i + 1 ) begin

		assign { 	
					rv64i_lui[i], rv64i_auipc[i],
					rv64i_addi[i], rv64i_addiw[i], rv64i_add[i], rv64i_addw[i], rv64i_sub[i], rv64i_subw[i],
					
					rv64i_slti[i], rv64i_sltiu[i], rv64i_slt[i], rv64i_sltu[i],
					rv64i_xori[i], rv64i_ori[i], rv64i_andi[i], rv64i_xor[i], rv64i_or[i], rv64i_and[i],
					
					rv64i_slli[i], rv64i_slliw[i], rv64i_sll[i], rv64i_sllw[i],
					rv64i_srli[i], rv64i_srliw[i], rv64i_srl[i], rv64i_srlw[i],
					rv64i_srai[i], rv64i_sraiw[i], rv64i_sra[i], rv64i_sraw[i], 
					
					alu_pc[64*i +: 64], alu_shamt[6*i +: 6], alu_imm[64*i +: 64],

					alu_rd0[(5+`RB)*i +: (5+`RB)],
					alu_rs1[(5+`RB)*i +: (5+`RB)],
					alu_rs2[(5+`RB)*i +: (5+`RB)]

				} = alu_issue_info[DW*i +: DW];

		assign rs1_ready[i] = wbLog_qout[alu_rs1[(5+`RB)*i +: (5+`RB)]] | (alu_rs1[(`RB+5)*i + `RB +: 5] == 5'd0);
		assign rs2_ready[i] = wbLog_qout[alu_rs2[(5+`RB)*i +: (5+`RB)]] | (alu_rs2[(`RB+5)*i + `RB +: 5] == 5'd0);
		
		assign alu_isClearRAW[i] = ( alu_buffer_malloc[i] ) & 
										(
										  rv64i_lui[i]
										| rv64i_auipc[i]
										| ( rv64i_addi[i] & rs1_ready[i] )
										| ( rv64i_addiw[i] & rs1_ready[i] )
										| ( rv64i_add[i] & rs1_ready[i] & rs2_ready[i] )
										| ( rv64i_addw[i] & rs1_ready[i] & rs2_ready[i] )
										| ( rv64i_sub[i] & rs1_ready[i] & rs2_ready[i] )
										| ( rv64i_subw[i] & rs1_ready[i] & rs2_ready[i] )

										| ( rv64i_slti[i] & rs1_ready[i] )
										| ( rv64i_sltiu[i] & rs1_ready[i] )
										| ( rv64i_slt[i] & rs1_ready[i] & rs2_ready[i] )
										| ( rv64i_sltu[i] & rs1_ready[i] & rs2_ready[i] )
										| ( rv64i_xori[i] & rs1_ready[i] )
										| ( rv64i_xor[i] & rs1_ready[i] & rs2_ready[i] )
										| ( rv64i_ori[i] & rs1_ready[i]  )
										| ( rv64i_or[i] & rs1_ready[i] & rs2_ready[i] )
										| ( rv64i_andi[i] & rs1_ready[i] )
										| ( rv64i_and[i] & rs1_ready[i] & rs2_ready[i] )

										| ( rv64i_slli[i] & rs1_ready[i] )
										| ( rv64i_slliw[i] & rs1_ready[i] )
										| ( rv64i_sll[i] & rs1_ready[i] & rs2_ready[i] )
										| ( rv64i_sllw[i] & rs1_ready[i] & rs2_ready[i] )
										| ( rv64i_srli[i] & rs1_ready[i] )
										| ( rv64i_srliw[i] & rs1_ready[i] )
										| ( rv64i_srl[i] & rs1_ready[i] & rs2_ready[i] )
										| ( rv64i_srlw[i] & rs1_ready[i] & rs2_ready[i] )
										| ( rv64i_srai[i] & rs1_ready[i] )
										| ( rv64i_sraiw[i] & rs1_ready[i] )
										| ( rv64i_sra[i] & rs1_ready[i] & rs2_ready[i] )
										| ( rv64i_sraw[i] & rs1_ready[i] & rs2_ready[i] )
									);

		assign alu_fun_imm[i] = rv64i_lui[i] | rv64i_auipc[i];
		assign alu_fun_add[i] = rv64i_addi[i] | rv64i_addiw[i] | rv64i_add[i] | rv64i_addw[i];
		assign alu_fun_sub[i] = rv64i_sub[i] | rv64i_subw[i];
		assign alu_fun_slt[i] = rv64i_slti[i] | rv64i_sltiu[i] | rv64i_slt[i] | rv64i_sltu[i];
		assign alu_fun_xor[i] = rv64i_xori[i] | rv64i_xor[i];
		assign alu_fun_or[i] = rv64i_ori[i] | rv64i_or[i];
		assign alu_fun_and[i] = rv64i_andi[i] | rv64i_and[i];
		assign alu_fun_sll[i] = rv64i_slli[i] | rv64i_slliw[i] | rv64i_sll[i] | rv64i_sllw[i];
		assign alu_fun_srl[i] = rv64i_srli[i] | rv64i_srliw[i] | rv64i_srl[i] | rv64i_srlw[i];
		assign alu_fun_sra[i] = rv64i_srai[i] | rv64i_sraiw[i] | rv64i_sra[i] | rv64i_sraw[i];

		
		assign is32w[i] = rv64i_addiw[i]
						| rv64i_addw[i]
						| rv64i_subw[i]
						| rv64i_slliw[i]
						| rv64i_sllw[i]
						| rv64i_srliw[i]
						| rv64i_srlw[i]
						| rv64i_sraiw[i]
						| rv64i_sraw[i];

		assign isUsi[i] = rv64i_sltiu[i]
						| rv64i_sltu[i];

		assign isImm[i] = rv64i_lui[i] | rv64i_auipc[i] 
						| rv64i_addi[i] | rv64i_addiw[i]
						| rv64i_slti[i] | rv64i_sltiu[i]
						| rv64i_xori[i] | rv64i_ori[i] | rv64i_andi[i];

		assign isShamt[i] = rv64i_slli[i] | rv64i_slliw[i]
							| rv64i_srli[i] | rv64i_srliw[i]
							| rv64i_srai[i] | rv64i_sraiw[i];

		assign exe_pc[64*i +: 64] = rv64i_auipc[i] ? alu_pc[64*i +: 64] : 64'b0;

		assign exe_imm[64*i +: 64] = ( {64{isImm[i]}} & alu_imm[64*i +: 64] )
									|
									( {64{isShamt[i]}} & {58'b0, alu_shamt[6*i +: 6]} );

	end
endgenerate



	wire alu_all_RAW;
	wire [$clog2(DP)-1:0] index;
	wire alu_exeparam_valid_dnxt;
	wire [EXE_DW-1:0] alu_exeparam_dnxt;

	lzp #(
		.CW($clog2(DP))
	) alu_RAWClear(
		.in_i(~alu_isClearRAW),
		.pos_o(index),
		.all1(alu_all_RAW),
		.all0()
	);
	assign alu_buffer_pop_index = index;


	assign alu_exeparam_valid_dnxt = flush ? 1'b0 : (alu_exeparam_ready & ~alu_all_RAW);
	assign alu_exeparam_dnxt = alu_exeparam_valid_dnxt 
								? { 
									alu_fun_imm[index],
									alu_fun_add[index],
									alu_fun_sub[index],
									alu_fun_slt[index],
									alu_fun_xor[index],
									alu_fun_or[index],
									alu_fun_and[index],
									alu_fun_sll[index],
									alu_fun_srl[index],
									alu_fun_sra[index],

									is32w[index],
									isUsi[index],
									isImm[index],
									isShamt[index],

									alu_rs1[(5+`RB)*index+: (5+`RB)],
									alu_rs2[(5+`RB)*index+: (5+`RB)],
									alu_rd0[(`RB+5)*index +: (`RB+5)],

									exe_pc[64*index +: 64],
									exe_imm[64*index +: 64]
								}
								: alu_exeparam_qout;




	assign alu_buffer_pop = alu_exeparam_valid_dnxt;

//T4

gen_dffr # (.DW(EXE_DW)) alu_exeparam ( .dnxt(alu_exeparam_dnxt), .qout(alu_exeparam_qout), .CLK(CLK), .RSTn(RSTn));
gen_dffr # (.DW(1)) alu_exeparam_valid ( .dnxt(alu_exeparam_valid_dnxt), .qout(alu_exeparam_valid_qout), .CLK(CLK), .RSTn(RSTn));








endmodule


