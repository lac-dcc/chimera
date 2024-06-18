// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: issue_buffer
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-10-27 18:04:15
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:08:26
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

module issue_buffer #
(
	parameter DW = 100,
	parameter DP = 8
)


(

	input [ DW - 1 : 0] dispat_info,
	input buffer_push,
	output buffer_full,


	input buffer_pop,
	input [$clog2(DP)-1:0] pop_index,
	output [ DW*DP - 1 : 0] issue_info_qout,
	output [DP - 1 : 0] buffer_malloc_qout,
	
	input flush,
	input CLK,
	input RSTn
	
);



	wire [ DW*DP - 1 : 0] issue_info_dnxt;
	wire [$clog2(DP)-1:0] issue_push_index_pre;
	wire [$clog2(DP)-1:0] issue_push_index = (buffer_pop & buffer_push) ? pop_index : issue_push_index_pre;
	wire [DP-1:0] buffer_valid_dnxt;
	wire [DP-1:0] buffer_valid_qout;
	assign buffer_malloc_qout = buffer_valid_qout;

	generate
		for ( genvar dp = 0; dp < DP; dp = dp + 1 ) begin

			assign issue_info_dnxt[DW*dp +: DW] = buffer_push & ( dp == issue_push_index )
												? dispat_info
												: issue_info_qout[DW*dp +: DW];

			gen_dffr #(.DW(DW)) issue_info ( .dnxt(issue_info_dnxt[DW*dp +: DW]), .qout(issue_info_qout[DW*dp +: DW]), .CLK(CLK), .RSTn(RSTn) );

		end
	endgenerate




	gen_dffr #(.DW(DP)) buffer_valid ( .dnxt(buffer_valid_dnxt), .qout(buffer_valid_qout), .CLK(CLK), .RSTn(RSTn) );

	assign buffer_valid_dnxt = flush ? {DP{1'b0}} : (( 
														{DP{(buffer_pop & buffer_push) | (~buffer_pop & ~buffer_push)}}
														& buffer_valid_qout
													)
													| 
													( 
														{DP{(buffer_push & ~buffer_pop) }}
														& (buffer_valid_qout | (1'b1 << issue_push_index_pre))
													) 
													| 
													( 
														{DP{(~buffer_push & buffer_pop)}}
														& (buffer_valid_qout & ~(1'b1 << pop_index))
													));

	

	lzp #(
		.CW($clog2(DP))
	) empty_buffer(
		.in_i(buffer_valid_qout),
		.pos_o(issue_push_index_pre),
		.all0(),
		.all1(buffer_full)
	);














endmodule








