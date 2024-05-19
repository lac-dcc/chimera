// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: rename
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-09-19 14:29:53
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:08:35
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


module rename (

	output [ `RB*32 - 1 :0 ] rnAct_X_dnxt,
	input [ `RB*32 - 1 :0 ] rnAct_X_qout,	

	output [32*`RP-1 : 0] rnBufU_rename_set,
	input [32*`RP-1 : 0] rnBufU_qout,

	input [4:0] rs1_raw,
	output [5+`RB-1:0] rs1_reName,

	input [4:0] rs2_raw,
	output [5+`RB-1:0] rs2_reName,
	
	input rd0_raw_valid,
	input [4:0] rd0_raw,
	output [5+`RB-1:0] rd0_reName,
	output rd0_runOut

);


wire [`RB-1:0] rd0_malloc;
assign rd0_reName = {rd0_raw, rd0_malloc};

generate
	for ( genvar i = 0;  i < 32; i = i + 1 )begin
		assign rnAct_X_dnxt[`RB*i +: `RB] = ( (rd0_raw == i) & rd0_raw_valid & ~rd0_runOut ) ? rd0_malloc : rnAct_X_qout[`RB*i +: `RB];
	end
endgenerate
	

assign rs1_reName = {rs1_raw, rnAct_X_qout[rs1_raw*`RB +: `RB]};
assign rs2_reName = {rs2_raw, rnAct_X_qout[rs2_raw*`RB +: `RB]};



wire [`RP-1:0] regX_used = rnBufU_qout[ `RP*rd0_raw +: `RP ];

lzp #(
	.CW(`RB)
) rd0_index(
	.in_i(regX_used),
	.pos_o(rd0_malloc),
	.all0(),
	.all1(rd0_runOut)
);



assign rnBufU_rename_set = (rd0_raw_valid & ~rd0_runOut)
								? {32*`RP{1'b0}} | (1'b1 << rd0_reName)
								: {32*`RP{1'b0}};













endmodule








