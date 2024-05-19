// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: gen_counter
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-03-03 11:35:15
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-03 11:43:13
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

module gen_counter #
(
	parameter AW = 3
)
(

	input push,
	input pop,

	output empty,
	output full,

	output [AW-1:0] cnt,

	input flush,
	input CLK,
	input RSTn
	
);

wire [AW+1-1:0] rdp_dnxt;
wire [AW+1-1:0] rdp_qout;
wire [AW+1-1:0] wrp_dnxt;
wire [AW+1-1:0] wrp_qout;

gen_dffr #( .DW(AW+1) ) rdp_dffr ( .dnxt(rdp_dnxt), .qout(rdp_qout), .CLK(CLK), .RSTn(RSTn));
gen_dffr #( .DW(AW+1) ) wrp_dffr ( .dnxt(wrp_dnxt), .qout(wrp_qout), .CLK(CLK), .RSTn(RSTn));

assign rdp_dnxt = flush ? {(AW+1){1'b0}}: (pop  ? rdp_qout + 'd1 : rdp_qout);
assign wrp_dnxt = flush ? {(AW+1){1'b0}}: (push ? wrp_qout + 'd1 : wrp_qout);

assign empty = (rdpr_qout == wrp_qout);
assign full = (rdp_qout[AW-1:0] == wrp_qout[AW-1:0]) & (rdpr_qout[AW] != wrp_qout[AW]);

assign cnt = wrp_qout[AW-1:0] - rdp_qout[AW-1:0];






endmodule






