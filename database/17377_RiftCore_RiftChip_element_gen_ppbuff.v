// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: gen_ppbuff
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-22 17:07:27
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-25 11:30:59
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


module gen_ppbuff #
(
	parameter DW = 100,
	parameter DP = 8
)
(
	input pop,
	input push,
	input [$clog2(DP)-1:0] index,

	input [ DW - 1 : 0] info_i,	
	output [ DW*DP - 1 : 0] info_o,

	output empty,
	output full,
	output [DP - 1 : 0] valid,
	
	input flush,
	input CLK,
	input RSTn
	
);





	wire [ DW*DP - 1 : 0] info_dnxt;
	wire [ DW*DP - 1 : 0] info_qout;
	wire [DP-1 : 0] info_en;


	wire [DP-1:0] valid_dnxt;
	wire [DP-1:0] valid_qout;
	wire [DP-1:0] valid_en;




	generate
		for ( genvar dp = 0; dp < DP; dp = dp + 1 ) begin

			assign info_dnxt[DW*dp +: DW] = info_i;
			assign info_en[dp] = push & (dp == index);
			assign valid_dnxt[dp] = push & (~flush);
			assign valid_en[dp] = (pop | push | flush) & (dp == index);

			gen_dffren #(.DW(DW)) info_dffren
			( 	
				.dnxt(info_dnxt[DW*dp +: DW]),
				.qout(info_qout[DW*dp +: DW]),
				.en(info_en[dp]),
				.CLK(CLK), .RSTn(RSTn)
			);

			gen_dffren #(.DW(1)) valid_dffren
			(
				.dnxt(valid_dnxt[dp]),
				.qout(valid_qout[dp]),
				.en(valid_en[dp]),
				.CLK (CLK),
				.RSTn(RSTn)	
			);

		end
	endgenerate

	assign info_o = info_qout;
	assign valid = valid_qout;

	assign empty =  & (~valid);
	assign full = & valid;














endmodule











