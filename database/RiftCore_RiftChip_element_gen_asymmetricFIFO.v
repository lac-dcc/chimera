// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: gen_asymmetricFIFO
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-08 19:22:16
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-09 13:26:05
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


module gen_asymmetricFIFO # (
	parameter DW = 64,
	parameter AW = 3,

	parameter WP = 4,
	parameter RP = 4	


) (


	input fifo_push,
	input fifo_pop, 

	output fifo_empty, 
	output fifo_full,

	input [DW*WP-1:0] data_w,
	output [DW*RP-1:0] data_r,


	input flush,
	input CLK,
	input RSTn
);

	localpara DP = 2**AW;
	localpara FN = (WP > RP) ? WP : RP;

	generate
		for ( genvar i = 0; i < FN; i = i + 1 ) begin

			gen_fifo # (
				.DW(DW),
				.AW(AW)
			) bank(

				input fifo_pop, 
				input fifo_push,
				input [DW-1:0] data_push,

				output fifo_empty, 
				output fifo_full, 
				output [DW-1:0] data_pop,

				input flush,
				input CLK,
				input RSTn
			);






		end
	endgenerate













	wire [AW+1-1:0] read_addr_dnxt, read_addr_qout;
	wire [AW+1-1:0] write_addr_dnxt, write_addr_qout;
	wire [DP*DW-1:0] fifo_data_dnxt, fifo_data_qout;
	wire [DP-1:0] fifo_status_dnxt, fifo_status_qout;

	gen_dffr # (.DW(AW+1)) read_addr (.dnxt(read_addr_dnxt), .qout(read_addr_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(AW+1)) write_addr (.dnxt(write_addr_dnxt), .qout(write_addr_qout), .CLK(CLK), .RSTn(RSTn));

	wire [WP-1:0] fifo_full_all;
	wire [RP-1:0] fifo_empty_all;

	// assign fifo_empty[0] = (read_addr_qout == write_addr_qout);
	// assign fifo_full[0] = (read_addr_qout[AW-1:0] == write_addr_qout[AW-1:0]) & (read_addr_qout[AW] != write_addr_qout[AW]);

	assign fifo_empty = | fifo_empty_all;
	assign fifo_full = | fifo_full_all;














	generate
		for ( genvar i = 0 ; i < WP; i = i + 1 ) begin
			wire [AW+1-1:0] write_addr_pre = write_addr_qout + WP;
			assign fifo_full_all[WP] = (read_addr_qout[AW-1:0] == write_addr_pre[AW-1:0]) & (read_addr_qout[AW] != write_addr_pre[AW]);
		end
	endgenerate

	generate
		for ( genvar i = 0 ; i < RP; i = i + 1 ) begin
			wire [AW+1-1:0] read_addr_pre = read_addr_qout + RP;
			assign fifo_empty_all[RP] = ( read_addr_pre == write_addr_qout );
		end
	endgenerate




// generate
// 	for ( genvar i = 0; i < DP; i = i + 1 ) begin
// 		for ( genvar j = 0; j < WR; j = j + 1 ) bgein
// 			assign fifo_data_dnxt[DW*i+:DW] = (fifo_push & ~fifo_full & (write_addr_qout[AW-1:0] == i) ) ? data_push : fifo_data_qout[DW*i+:DW];


// 			gen_dffr # (.DW(DW)) fifo_data (.dnxt(fifo_data_dnxt[DW*i+:DW]), .qout(fifo_data_qout[DW*i+:DW]), .CLK(CLK), .RSTn(RSTn));
// 		end
// 	end




// endgenerate




// 	assign data_pop = fifo_data_qout[DW*read_addr_qout[AW-1:0]+:DW];

// 	assign read_addr_dnxt = flush ? ({(AW+1){1'b1}}) : (( fifo_pop & ~fifo_empty ) ? read_addr_qout + 'd1 : read_addr_qout);
// 	assign write_addr_dnxt = flush ? ({(AW+1){1'b1}}) : (( fifo_push & ~fifo_full ) ? write_addr_qout + 'd1 :  write_addr_qout);


endmodule 

















