// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: instr_fifo
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-06 11:11:59
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-13 14:35:25
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





module instr_fifo # (
	parameter DW = 64,
	parameter AW = 3
) (

	input instrFifo_pop, 
	input instrFifo_push,
	input [DW-1:0] decode_microInstr_push,

	output instrFifo_empty, 
	output instrFifo_reject, 
	output [DW-1:0] decode_microInstr_pop,

	input feflush,
	input CLK,
	input RSTn
);

wire [AW+1-1:0] read_addr;
wire [AW+1-1:0] write_addr;



gen_fifo # (.DW(`DECODE_INFO_DW),.AW(AW)) 
	fifo (
	.fifo_pop(instrFifo_pop),
	.fifo_push(instrFifo_push),

	.data_push(decode_microInstr_push),
	.data_pop(decode_microInstr_pop),

	.fifo_empty(instrFifo_empty),
	.fifo_full(),

	.read_addr(read_addr),
	.write_addr(write_addr),


	.flush(feflush),
	.CLK(CLK),
	.RSTn(RSTn)
);


wire reject_set;
wire reject_rst;

assign reject_set = (write_addr[AW-1:AW-2] == (read_addr[AW-1:AW-2] - 2'b01)) & (write_addr[AW-3:0] == (read_addr[AW-3:0]));
assign reject_rst = feflush 
					| ((write_addr[AW-1:AW-2] == (read_addr[AW-1:AW-2] + 2'b01)) & (write_addr[AW-3:0] == (read_addr[AW-3:0])));

gen_rsffr # (.DW(1)) reject_rsffr ( .set_in(reject_set), .rst_in(reject_rst), .qout(instrFifo_reject), .CLK(CLK), .RSTn(RSTn) );







endmodule








