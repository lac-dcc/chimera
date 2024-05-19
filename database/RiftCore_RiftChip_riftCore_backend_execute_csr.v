// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: csr
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-10-30 14:30:32
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-05 14:36:14
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

module csr #
	(
		parameter DW = `CSR_EXEPARAM_DW
	)
	(

	input csr_exeparam_valid,
	input [DW-1 :0] csr_exeparam,

	// //from csrfiles
	output [11:0] csrexe_addr,
	output [63:0] op,
	input [63:0] csrexe_res,
	output rw,
	output rs,
	output rc,

	output csr_writeback_valid,
	output [63:0] csr_res_qout,
	output [(5+`RB-1):0] csr_rd0_qout,

	input [(64*`RP*32)-1:0] regFileX_read,

	input CLK,
	input RSTn,
	input flush
	
);


	wire rv64csr_rw;
	wire rv64csr_rs;
	wire rv64csr_rc;

	wire [(5+`RB)-1:0] csr_rd0_dnxt;
	wire [(5+`RB)-1:0] csr_rs1;
	wire is_imm;
	wire [63:0] op;


	assign { 
			rv64csr_rw,
			rv64csr_rs,
			rv64csr_rc,

			csr_rd0_dnxt,
			csr_rs1,
			is_imm,
			csrexe_addr

			} = csr_exeparam;


	assign op = ({64{~is_imm}} & regFileX_read[csr_rs1*64 +: 64])
					|
					({64{is_imm}} & {{(64-5){1'b0}}, csr_rs1[`RB +: 5]} );





wire dontRead = (csr_rd0_dnxt[`RB +: 5] == 5'd0) & rv64csr_rw;
wire dontWrite = (op == 64'd0) & ( rv64csr_rs | rv64csr_rc );

initial $warning("no exception in csr exe at this version");
wire illagle_op = 1'b0;




assign rw = ~dontWrite & csr_exeparam_valid & rv64csr_rw;
assign rs = ~dontWrite & csr_exeparam_valid & rv64csr_rs;
assign rc = ~dontWrite & csr_exeparam_valid & rv64csr_rc;

wire [63:0] csr_res_dnxt = csrexe_res;


gen_dffr # (.DW((5+`RB))) csr_rd0_dffr ( .dnxt(csr_rd0_dnxt), .qout(csr_rd0_qout), .CLK(CLK), .RSTn(RSTn));
gen_dffr # (.DW(64)) csr_res_dffr ( .dnxt(csr_res_dnxt), .qout(csr_res_qout), .CLK(CLK), .RSTn(RSTn));
gen_dffr # (.DW(1)) valid_dffr ( .dnxt(csr_exeparam_valid&(~flush)), .qout(csr_writeback_valid), .CLK(CLK), .RSTn(RSTn));



endmodule














