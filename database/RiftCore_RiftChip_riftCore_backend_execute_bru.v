// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: bru
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-09-20 16:41:01
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:08:32
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

module bru #
	(
		parameter DW = `BRU_EXEPARAM_DW
	)
	(

	//from bru issue
	output bru_exeparam_ready,
	input bru_exeparam_valid,
	input [DW-1:0] bru_exeparam, 

	// to pc generate
	output takenBranch_qout,
	output takenBranch_valid_qout,
	output jalr_valid_qout,
	output [63:0] jalr_pc_qout,

	output bru_writeback_valid,
	output [63:0] bru_res_qout,
	output [(5+`RB)-1:0] bru_rd0_qout,

	//from regFile
	input [(64*`RP*32)-1:0] regFileX_read,

	input flush,
	input CLK,
	input RSTn

);

	wire bru_pcGen_ready = 1'b1;

	wire bru_jal;
	wire bru_jalr;
	wire bru_eq;
	wire bru_ne;
	wire bru_lt;
	wire bru_ge;
	wire bru_ltu;
	wire bru_geu;

	wire is_rvc;

	wire [(5+`RB)-1:0] bru_rs1;
	wire [(5+`RB)-1:0] bru_rs2;
	wire [(5+`RB)-1:0] bru_rd0_dnxt;

	wire [63:0] bru_pc;
	wire [63:0] bru_imm;


	assign { 
			bru_jal,
			bru_jalr,

			bru_eq,
			bru_ne,
			bru_lt,
			bru_ge,
			bru_ltu,
			bru_geu,

			is_rvc,

			bru_rs1,
			bru_rs2,
			bru_rd0_dnxt,

			bru_pc,
			bru_imm
			} = bru_exeparam;

	wire [63:0] src1 = regFileX_read[ 64*bru_rs1 +: 64];
	wire [63:0] src2 = regFileX_read[ 64*bru_rs2 +: 64];




	wire [63:0] jalr_pc_dnxt = (src1 + bru_imm) & ~(64'b1);
	wire jalr_valid_dnxt = (~flush) & bru_jalr & bru_exeparam_valid;

	gen_dffr # (.DW(1)) jalr_valid ( .dnxt(jalr_valid_dnxt), .qout(jalr_valid_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(64)) jalr_pc ( .dnxt(jalr_pc_dnxt), .qout(jalr_pc_qout), .CLK(CLK), .RSTn(RSTn));

	


	wire take_eq = (bru_eq & (src1 == src2));
	wire take_ne = (bru_ne & (src1 != src2));
	wire take_lt = (bru_lt) & ($signed(src1) < $signed(src2));
	wire take_ge = (bru_ge) & ($signed(src1) >= $signed(src2));
	wire take_ltu = (bru_ltu) & ($unsigned(src1) < $unsigned(src2));
	wire take_geu = (bru_geu) & ($unsigned(src1) >= $unsigned(src2));

	wire valid_dnxt = (~flush) & bru_pcGen_ready & bru_exeparam_valid 
						& ( bru_eq 
						| bru_ne
						| bru_lt
						| bru_ge
						| bru_ltu
						| bru_geu );

	wire takenBranch_dnxt = valid_dnxt 
								? (take_eq | take_ne | take_lt | take_ge | take_ltu | take_geu)
								: takenBranch_qout;




	gen_dffr # (.DW(1)) takenBranch ( .dnxt(takenBranch_dnxt), .qout(takenBranch_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(1)) takenBranch_valid ( .dnxt(valid_dnxt), .qout(takenBranch_valid_qout), .CLK(CLK), .RSTn(RSTn));


	assign bru_exeparam_ready = bru_pcGen_ready;
	wire [63:0] bru_res_dnxt = ({64{(bru_jal | bru_jalr)}} & (bru_pc + (is_rvc ? 64'd2 : 64'd4)))
								|
								( {64{(~bru_jal & ~bru_jalr)}} & 64'b0 );

	gen_dffr # (.DW((5+`RB))) bru_rd0 ( .dnxt(bru_rd0_dnxt), .qout(bru_rd0_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(64)) bru_res ( .dnxt( bru_res_dnxt), .qout(bru_res_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(1)) valid ( .dnxt(bru_exeparam_valid&(~flush)), .qout(bru_writeback_valid), .CLK(CLK), .RSTn(RSTn));






endmodule






