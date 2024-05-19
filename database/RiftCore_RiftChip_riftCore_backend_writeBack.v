// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: writeBack
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-09-11 15:41:38
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:08:34
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

module writeBack (

	//from phyRegister
	input  [(64*`RP*32)-1:0] regFileX_qout,
	output [(64*`RP*32)-1:0] regFileX_dnxt,

	output [32*`RP-1 : 0] wbLog_writeb_set,


	//from adder
	input alu_writeback_valid,
	input [63:0] alu_res,
	input [(5+`RB-1):0] alu_rd0,

	//from bru
	input bru_writeback_valid,
	input [(5+`RB-1):0] bru_rd0,
	input [63:0] bru_res,

	//from lsu
	input lsu_writeback_valid,
	input [(5+`RB-1):0] lsu_rd0,
	input [63:0] lsu_res,

	//from csr
	input csr_writeback_valid,
	input [(5+`RB-1):0] csr_rd0,
	input [63:0] csr_res,

	//from mul
	input mul_writeback_valid,
	input [(5+`RB-1):0] mul_rd0,
	input [63:0] mul_res
);

// alu wb
wire [(64*`RP*32)-1:0] alu_writeback_dnxt;
//bru wb
wire [(64*`RP*32)-1:0] bru_writeback_dnxt;
//lsu wb
wire [(64*`RP*32)-1:0] lsu_writeback_dnxt;
//csr wb
wire [(64*`RP*32)-1:0] csr_writeback_dnxt;
//mul wb
wire [(64*`RP*32)-1:0] mul_writeback_dnxt;

//write back
assign regFileX_dnxt[0 +: 64*`RP] = {64*`RP{1'b0}};
generate
	for ( genvar SEL = `RP; SEL < 32*`RP; SEL = SEL + 1 ) begin
			// localparam  SEL = regNum*`RP+depth;

			assign regFileX_dnxt[64*SEL +: 64] =  
				(
					//adder wb
					({64{alu_writeback_valid & (alu_rd0 == SEL)}} & alu_res)
					|
					//bru wb
					({64{bru_writeback_valid & (bru_rd0 == SEL)}} & bru_res)
					|
					//lsu wb
					({64{lsu_writeback_valid & (lsu_rd0 == SEL)}} & lsu_res)
					|
					//csr wb
					({64{csr_writeback_valid & (csr_rd0 == SEL)}} & csr_res)
					|
					//mul wb
					({64{mul_writeback_valid & (mul_rd0 == SEL)}} & mul_res)
				)
				|
				(
					//nobody wb
					( 
						 
						{64{  ~(alu_writeback_valid & alu_rd0 == SEL)
							& ~(bru_writeback_valid & bru_rd0 == SEL)
							& ~(lsu_writeback_valid & lsu_rd0 == SEL)
							& ~(csr_writeback_valid & csr_rd0 == SEL)
							& ~(mul_writeback_valid & mul_rd0 == SEL) }}
					) 
					& regFileX_qout[64*SEL +: 64]
				);



	end
endgenerate


	assign wbLog_writeb_set = 
		( alu_writeback_valid << alu_rd0 )
		| 
		( bru_writeback_valid << bru_rd0 )
		| 
		( lsu_writeback_valid << lsu_rd0 )
		| 
		( csr_writeback_valid << csr_rd0 )
		| 
		( mul_writeback_valid << mul_rd0 )
		;





endmodule

