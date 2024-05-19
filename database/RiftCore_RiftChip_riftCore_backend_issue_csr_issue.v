// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: csr_issue
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-10-27 10:51:47
* @Last Modified by:   Ruige Lee
<<<<<<< HEAD:RiftChip/riftCore/backend/issue/csr_issue.v
* @Last Modified time: 2021-01-05 16:45:28
=======
* @Last Modified time: 2021-01-03 12:08:27
>>>>>>> master:core/riftCore/backend/issue/csr_issue.v
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

module csr_issue #
	(
		parameter DW = `CSR_ISSUE_INFO_DW,
		parameter EXE_DW = `CSR_EXEPARAM_DW
	)
	(
	
	//from fifo
	output csr_fifo_pop,
	input csr_fifo_empty,
	input [DW-1:0] csr_issue_info,

	output csr_exeparam_valid_qout,
	output [EXE_DW-1 :0] csr_exeparam_qout,

	//from regFile
	input [32*`RP-1 : 0] wbLog_qout,

	//from commit
	input [63:0] commit_pc,

	input flush,
	input CLK,
	input RSTn
);



initial $info("the pervious instruction must be commited, then csr can issue and execute");

	//csr must be ready
	wire csr_exeparam_ready = 1'b1;


	wire rv64csr_rw;
	wire rv64csr_rs;
	wire rv64csr_rc;
	wire rv64csr_rwi;
	wire rv64csr_rsi;
	wire rv64csr_rci;

	wire [63:0] issue_pc;
	wire [(5+`RB)-1:0] csr_rd0;
	wire [(5+`RB)-1:0] csr_rs1;
	wire [11:0] csr_imm;

	wire csrILP_ready = (commit_pc == issue_pc);

	assign { 
			rv64csr_rw, rv64csr_rs, rv64csr_rc, rv64csr_rwi, rv64csr_rsi, rv64csr_rci,
			issue_pc, csr_imm, csr_rd0, csr_rs1


			} = csr_issue_info;







	wire csr_rw = rv64csr_rw | rv64csr_rwi;
	wire csr_rs = rv64csr_rs | rv64csr_rsi;
	wire csr_rc = rv64csr_rc | rv64csr_rci;

	wire rs1_ready = wbLog_qout[csr_rs1] | (csr_rs1[`RB +: 5] == 5'd0);

	wire csr_isClearRAW = ( ~csr_fifo_empty ) & ( 	((rv64csr_rw | rv64csr_rs | rv64csr_rc ) & rs1_ready )
													|
													(rv64csr_rwi | rv64csr_rsi | rv64csr_rci )
												);

	wire is_imm = rv64csr_rwi | rv64csr_rsi | rv64csr_rci;
	wire [11:0] addr = csr_imm;


	wire [EXE_DW-1:0] csr_exeparam_dnxt = csr_exeparam_valid_dnxt ? { 
											csr_rw,
											csr_rs,
											csr_rc,
								
											csr_rd0,
											csr_rs1,

											is_imm,
											addr
											} : csr_exeparam_qout;

	wire csr_exeparam_valid_dnxt = flush ? 1'b0 : (csr_isClearRAW & csrILP_ready & csr_exeparam_ready);

	assign csr_fifo_pop = csr_exeparam_valid_dnxt;


	gen_dffr # (.DW(EXE_DW)) csr_exeparam ( .dnxt(csr_exeparam_dnxt), .qout(csr_exeparam_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(1)) csr_exeparam_valid ( .dnxt(csr_exeparam_valid_dnxt), .qout(csr_exeparam_valid_qout), .CLK(CLK), .RSTn(RSTn));




endmodule











