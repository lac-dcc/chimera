// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: issue_fifo
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-10-28 15:34:24
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:05:23
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

module issue_fifo #(
	parameter DW = 100,
	parameter DP = 8
)
(

	input [ DW - 1 : 0] issue_info_push,
	output [ DW - 1 : 0] issue_info_pop,

	input issue_push,
	input issue_pop,
	output fifo_full,
	output fifo_empty,

	input flush,
	input CLK,
	input RSTn
	
);



gen_fifo # ( .DW(DW), .AW($clog2(DP)))
i_fifo(
	.fifo_pop(issue_pop), 
	.fifo_push(issue_push),
	.data_push(issue_info_push),

	.fifo_empty(fifo_empty), 
	.fifo_full(fifo_full), 
	.data_pop(issue_info_pop),

	.flush(flush),
	.CLK(CLK),
	.RSTn(RSTn)
);




endmodule







