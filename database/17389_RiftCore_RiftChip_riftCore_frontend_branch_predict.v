// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: branch_predict
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-05 16:42:46
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-19 16:27:01
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

module branch_predict (
	input isFencei,
	input lsu_fencei_valid,
	output fencei_stall,

	input isJal,
	input isJalr,
	input isBranch,
	input isCall,
	input isReturn,
	input [63:0] imm,
	input isRVC,
	input [63:0] pc_load,

	input jalr_valid,
	input [63:0] jalr_pc,
	input bru_res_valid,
	input bru_takenBranch,

	output branch_pc_valid,
	output [63:0] branch_pc,
	output isMisPredict,

	output jalr_stall,
	output bht_stall,
	input iq_id_ready,

	input flush,
	input CLK,
	input RSTn

);




	wire [63:0] next_pc;
	wire [63:0] take_pc;
	wire [63:0] resolve_pc; 

	wire [63+1:0] bht_data_pop;
	wire [63+1:0] bht_data_push;

	wire isTakenBranch;
	wire bht_full;
	wire bht_pop;
	wire bht_push;

	wire jalr_stall;
	wire bht_stall;

	wire [63:0] ras_addr_pop;
	wire [63:0] ras_addr_push;
	wire ras_push;
	wire ras_pop;
	wire ras_empty;
	wire jalr_empty;
	wire jalr_last;
	wire jalr_front;



	assign bht_data_push = 
				{
					isTakenBranch, 
					(({64{~isTakenBranch}} & take_pc) | ({64{isTakenBranch}} & next_pc))
				};


	assign bht_pop = bru_res_valid;
	assign bht_push = isBranch & ~bht_full & iq_id_ready;

	assign isMisPredict = bru_res_valid & ( bru_takenBranch ^ bht_data_pop[64]);
	assign resolve_pc = bht_data_pop[63:0];

	assign jalr_stall = isJalr & ~jalr_last & ( ras_empty | ~isReturn );
	assign bht_stall = (bht_full & isBranch);
	assign fencei_stall = isFencei & ~lsu_fencei_valid;


	assign branch_pc_valid = 
							isMisPredict //mis-predict
							| isTakenBranch // bru jump, jal jump, jalr ras pop
							| jalr_last //jalr return
							| (isFencei & lsu_fencei_valid)
								;


	assign branch_pc = ({64{isMisPredict}} & resolve_pc)
						|
						({64{isTakenBranch& ~isMisPredict}} & take_pc)
						|
						({64{jalr_last}} & jalr_pc )
						|
						({64{isFencei & lsu_fencei_valid}} & next_pc);



	//static predict
	assign isTakenBranch = ( (isBranch) & ( imm[63] == 1'b0) )
							| (isJal | ras_pop); 






	assign ras_push = isCall & ( isJal | isJalr ) & iq_id_ready;
	assign ras_pop = isReturn & ( isJalr ) & ( !ras_empty ) & iq_id_ready;

	assign next_pc = pc_load + ( isRVC ? 64'd2 : 64'd4 );
	assign take_pc = ( {64{isJal | isBranch}} & (pc_load + imm) )
						| ( {64{ras_pop}} & ras_addr_pop );

	assign ras_addr_push = next_pc;





	gen_fifo # ( .DW(64+1), .AW(4) ) bht(
		.fifo_pop(bht_pop), .fifo_push(bht_push),
		.data_push(bht_data_push), .data_pop(bht_data_pop),
		.fifo_empty(), .fifo_full(bht_full), 
		
		.flush(flush),
		.CLK(CLK),
		.RSTn(RSTn)
	);




	assign jalr_last = jalr_valid & jalr_empty;
	assign jalr_front = jalr_valid & ~jalr_empty;


	gen_ringStack # (.DW(64), .AW(4)) ras(
		.stack_pop(ras_pop), .stack_push(ras_push),
		.stack_empty(ras_empty),
		.data_pop(ras_addr_pop), .data_push(ras_addr_push),

		.flush(flush),
		.CLK(CLK),
		.RSTn(RSTn)
	);

	gen_fifo # ( .DW(1), .AW(4) ) ras_cnt(
		.fifo_pop(jalr_front), .fifo_push(ras_pop),
		.data_push(1'b0), .data_pop(),
		.fifo_empty(jalr_empty), .fifo_full(), 
		
		.flush(flush),
		.CLK(CLK),
		.RSTn(RSTn)
	);








endmodule




