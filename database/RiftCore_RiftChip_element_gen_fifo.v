// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: gen_fifo
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-10-30 17:55:22
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-03 10:59:58
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


module gen_fifo # (
	parameter DW = 64,
	parameter AW = 3
) (

	input fifo_pop, 
	input fifo_push,
	input [DW-1:0] data_push,

	output fifo_empty, 
	output fifo_full, 
	output [DW-1:0] data_pop,

	output [AW+1-1:0] read_addr,
	output [AW+1-1:0] write_addr,

	output [(DW*(2**AW))-1:0] expose_o,
	output [((2**AW)-1):0] valid,

	input flush,
	input CLK,
	input RSTn
);

	localparam DP = 2**AW;


	wire [AW+1-1:0] read_addr_dnxt, read_addr_qout;
	wire [AW+1-1:0] write_addr_dnxt, write_addr_qout;
	wire [DP*DW-1:0] fifo_data_dnxt,fifo_data_qout;
	wire [DP-1:0] valid_set, valid_rst, valid_qout, valid_en;



	gen_dffr # (.DW(AW+1)) read_addr_dffr (.dnxt(read_addr_dnxt), .qout(read_addr_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(AW+1)) write_addr_dffr (.dnxt(write_addr_dnxt), .qout(write_addr_qout), .CLK(CLK), .RSTn(RSTn));

	assign fifo_empty = (read_addr_qout == write_addr_qout);
	assign fifo_full = (read_addr_qout[AW-1:0] == write_addr_qout[AW-1:0]) & (read_addr_qout[AW] != write_addr_qout[AW]);
	assign read_addr = read_addr_qout;
	assign write_addr = write_addr_qout;

generate
	for ( genvar i = 0; i < DP; i = i + 1 ) begin
		assign fifo_data_dnxt[DW*i+:DW] = (fifo_push & ~fifo_full & (write_addr_qout[AW-1:0] == i) ) ? data_push : fifo_data_qout[DW*i+:DW];


		gen_dffr # (.DW(DW)) fifo_data_dffr (.dnxt(fifo_data_dnxt[DW*i+:DW]), .qout(fifo_data_qout[DW*i+:DW]), .CLK(CLK), .RSTn(RSTn));

	end




endgenerate




	assign data_pop = fifo_data_qout[DW*read_addr_qout[AW-1:0]+:DW];

	assign read_addr_dnxt = flush ? ({(AW+1){1'b0}}) : (( fifo_pop & ~fifo_empty ) ? read_addr_qout + 'd1 : read_addr_qout);
	assign write_addr_dnxt = flush ? ({(AW+1){1'b0}}) : (( fifo_push & ~fifo_full ) ? write_addr_qout + 'd1 :  write_addr_qout);


	assign expose_o = fifo_data_qout;
	generate
		for ( genvar dp = 0; dp < DP; dp = dp + 1 ) begin
			assign valid_set[dp] = (fifo_push & ~fifo_full) & ( dp == write_addr_qout[AW-1:0 ] );
			assign valid_rst[dp] = ((fifo_pop & ~fifo_empty) & ( dp == read_addr_qout[AW-1:0 ] )) | flush;


			gen_rsffr #(.DW(1)) valid_rsffr (.set_in(valid_set[dp]), .rst_in(valid_rst[dp]), .qout(valid_qout[dp]), .CLK(CLK), .RSTn(RSTn));
		end
	endgenerate

endmodule 



