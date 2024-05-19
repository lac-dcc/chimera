// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: decoder
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-12-09 17:28:05
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-05 20:08:15
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



module decoder
(
	input iq_id_valid,
	output iq_id_ready,
	input [32+64+1-1:0] iq_id_info,

	input instrFifo_reject,
	output [`DECODE_INFO_DW-1:0] decode_microInstr,
	output instrFifo_push,

	input flush,
	input CLK,
	input RSTn

);







	wire [`DECODE_INFO_DW-1:0] decode_microInstr_16;
	wire [`DECODE_INFO_DW-1:0] decode_microInstr_32;


	wire bp_valid_i;
	wire bp_valid_o;
	wire bp_ready_i;
	wire bp_ready_o;

	wire [32+64+1-1:0] bp_data_i;
	wire [32+64+1-1:0] bp_data_o;

	assign iq_id_ready = ~instrFifo_reject & bp_ready_i;

	assign bp_valid_i = iq_id_valid;
	assign bp_ready_o = ~instrFifo_reject;
	assign bp_data_i = iq_id_info;

gen_bypassfifo #( .DW(32+64+1) ) bp_fifo
(
	.valid_i(bp_valid_i),
	.data_i(bp_data_i),
	.ready_i(bp_ready_i),

	.valid_o(bp_valid_o),
	.data_o(bp_data_o),
	.ready_o(bp_ready_o),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)
);


	wire privil_accessFault;
	wire [`DECODE_INFO_DW-1:0] accessFault_info;

	wire [63:0] id_pc = bp_data_o[64:1];
	wire [31:0] id_instr32 = bp_data_o[96:65];
	wire [15:0] id_instr16 = bp_data_o[80:65];
	wire isRVC = bp_data_o[0];

	assign privil_accessFault = bp_valid_o & bp_ready_o & ( |id_pc[63:32] );



	assign accessFault_info = { 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b1, 1'b0,
		1'b0,
		id_pc, 64'b0, 6'b0, 5'd0,5'b0,5'b0
		};







decoder16 i_decoder16
(
	.instr(id_instr16),
	.pc(id_pc),
	.is_rvc(isRVC),

	.decode_microInstr(decode_microInstr_16)
);



decoder32 i_decoder32
(
	.instr(id_instr32),
	.pc(id_pc),
	.is_rvc(isRVC),

	.decode_microInstr(decode_microInstr_32)
);


	assign decode_microInstr = (~privil_accessFault) ? 
								(isRVC ? decode_microInstr_16 : decode_microInstr_32)
								: accessFault_info;
	assign instrFifo_push = bp_valid_o & ~instrFifo_reject;






endmodule








