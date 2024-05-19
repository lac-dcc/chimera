// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: phyRegister
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-10-23 15:42:33
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:05:41
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

module phyRegister (
	input flush,


	input  [(64*`RP*32)-1:0] regFileX_dnxt,
	output [(64*`RP*32)-1:0] regFileX_qout,


	input [ `RB*32 - 1 :0 ] rnAct_X_dnxt,
	output [ `RB*32 - 1 :0 ] rnAct_X_qout,

	input [32*`RP-1 : 0] rnBufU_rename_set,
	input [32*`RP-1 : 0] rnBufU_commit_rst,
	output [32*`RP-1 : 0] rnBufU_qout,

	input [32*`RP-1 : 0] wbLog_writeb_set,
	input [32*`RP-1 : 0] wbLog_commit_rst,
	output [32*`RP-1 : 0] wbLog_qout,

	input [ `RB*32 - 1 :0 ] archi_X_dnxt,
	output [ `RB*32 - 1 :0 ] archi_X_qout,

	input CLK,
	input RSTn
	
);
















//代表架构寄存器，指向128个寄存器中的地址，完成commit
//指向当前前端可以用的寄存器位置（只会读寄存器），读完不管,32个寄存器，每个可能深度为4
//架构寄存器在commit阶段更新，同时释放rename位置

generate
	for ( genvar i = 0 ; i < 32; i = i + 1 ) begin
		gen_dffr #(.DW(`RB)) archi_X ( .dnxt(archi_X_dnxt[`RB*i +: `RB]), .qout(archi_X_qout[`RB*i +: `RB]), .CLK(CLK), .RSTn(RSTn) );
	end
endgenerate


//读操作不会改变重命名活动指针，
//读操作需要通过重命名活动指针寻找正确的寄存器，
//写操作需要改变重命名活动指针到一个新位置，需要是空的，否则挂起流水线


generate
	for ( genvar i = 0 ; i < 32; i = i + 1 ) begin
		gen_dffr #(.DW(`RB)) 
		rnActive_X 
		( 
			.dnxt( {`RB{~flush}} & rnAct_X_dnxt[`RB*i +: `RB] 
					| {`RB{flush}} & archi_X_qout[`RB*i +: `RB]),
			.qout(rnAct_X_qout[`RB*i +: `RB]),
			.CLK(CLK),
			.RSTn(RSTn)
		);
	end
endgenerate


//指示128-32个寄存器组中哪些被用了
wire [32*`RP-1 : 0] rnBufU_dnxt;

generate
	for ( genvar i = 0; i < 32; i = i + 1 ) begin

		//commit的复位，重命名的置位
		assign rnBufU_dnxt[`RP*i +: `RP] = flush ? 
													(1'b1 << archi_X_qout[`RB*i +: `RB])
													: ( ( rnBufU_qout[`RP*i +: `RP] 
														| rnBufU_rename_set[`RP*i +: `RP] )
														& (~rnBufU_commit_rst[`RP*i +: `RP]));

		gen_dffr #(.DW(`RP), .rstValue(`RP'b1)) rnBufU ( .dnxt(rnBufU_dnxt[`RP*i +: `RP]), .qout(rnBufU_qout[`RP*i +: `RP]), .CLK(CLK), .RSTn(RSTn) );


	end

endgenerate



	//指示乱序写回是否完成,影响真数据冒险
	wire [32*`RP-1 : 0] wbLog_dnxt;

generate
	for ( genvar i = 0; i < 32; i = i + 1 ) begin

		//写回时置1，commit时复位
		assign wbLog_dnxt[`RP*i +: `RP] = flush ? 
											(1'b1 << archi_X_qout[`RB*i +: `RB])
											: 	(
													(wbLog_qout[`RP*i +: `RP] 
													| wbLog_writeb_set[`RP*i +: `RP])
													& ~wbLog_commit_rst[`RP*i +: `RP]);

		gen_dffr #(.DW(`RP), .rstValue(`RP'b1)) wbLog ( .dnxt(wbLog_dnxt[`RP*i +: `RP]), .qout(wbLog_qout[`RP*i +: `RP]), .CLK(CLK), .RSTn(RSTn) );

	end
endgenerate





regFiles i_regFiles
(
	.regFileX_dnxt(regFileX_dnxt),
	.regFileX_qout(regFileX_qout),

	.CLK(CLK),
	.RSTn(RSTn)
);








endmodule












