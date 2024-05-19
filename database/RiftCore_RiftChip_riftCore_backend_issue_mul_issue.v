// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: mul_issue
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-12-22 10:48:27
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:08:24
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


module mul_issue #(
	parameter DW = `MUL_ISSUE_INFO_DW,
	parameter DP = `MUL_ISSUE_INFO_DP,
	parameter EXE_DW = `MUL_EXEPARAM_DW
)
(
	//from fifo
	output mul_fifo_pop,
	input mul_fifo_empty,
	input [DW-1:0] mul_issue_info,

	//from execute
	input mul_execute_ready,
	output mul_exeparam_valid_qout,
	output [EXE_DW-1:0] mul_exeparam_qout,

	//from regFile
	input [32*`RP-1 : 0] wbLog_qout,

	input flush,
	input CLK,
	input RSTn
);







	wire rv64m_mul, rv64m_mulh, rv64m_mullhsu, rv64m_mulhu, rv64m_div, rv64m_divu, rv64m_rem, rv64m_remu, rv64m_mulw, rv64m_divw, rv64m_divuw, rv64_remw, rv64m_remuw;




	wire [5+`RB-1:0] mul_rd0;
	wire [5+`RB-1:0] mul_rs1;
	wire [5+`RB-1:0] mul_rs2;

	assign {
			rv64m_mul,
			rv64m_mulh,
			rv64m_mullhsu,
			rv64m_mulhu,
			rv64m_div,
			rv64m_divu,
			rv64m_rem,
			rv64m_remu,
			rv64m_mulw,
			rv64m_divw,
			rv64m_divuw,
			rv64_remw,
			rv64m_remuw,

			mul_rd0,
			mul_rs1,
			mul_rs2

			} = mul_issue_info;



	wire rs1_ready = wbLog_qout[mul_rs1] | (mul_rs1[`RB +: 5] == 5'd0);
	wire rs2_ready = wbLog_qout[mul_rs2] | (mul_rs2[`RB +: 5] == 5'd0);

	wire mul_isClearRAW = ( ~mul_fifo_empty ) 
							& 
							(
								( 
									rv64m_mul | rv64m_mulh | rv64m_mullhsu | rv64m_mulhu | rv64m_mulw
									| rv64m_div | rv64m_divu | rv64m_rem | rv64m_remu | rv64m_divw | rv64m_divuw | rv64_remw | rv64m_remuw
								)
									& rs1_ready & rs2_ready
							);

	wire [EXE_DW-1:0] mul_exeparam_dnxt = 
		mul_exeparam_valid_dnxt ? 
			mul_issue_info : 
			mul_exeparam_qout;

	wire mul_exeparam_valid_dnxt = flush ? 1'b0 : (mul_execute_ready & mul_isClearRAW);
	assign mul_fifo_pop = mul_exeparam_valid_dnxt;

	gen_dffr # (.DW(EXE_DW)) mul_exeparam ( .dnxt(mul_exeparam_dnxt), .qout(mul_exeparam_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(1)) mul_exeparam_valid ( .dnxt(mul_exeparam_valid_dnxt), .qout(mul_exeparam_valid_qout), .CLK(CLK), .RSTn(RSTn));













endmodule



















