// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: cache_mem
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-22 10:00:20
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-24 17:43:51
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


module cache_mem #
(
	parameter DW = 1024,
	parameter BK = 4,
	parameter CB = 1,
	parameter CL = 256,
	parameter TAG_W = 32

)
(
	input [31:0] cache_addr,
	input [CB-1:0] cache_en_w,
	input [CB-1:0] cache_en_r,
	input [7:0] cache_info_wstrb,
	input [63:0] cache_info_w,
	output [64*CB-1:0] cache_info_r,


	input [31:0] tag_addr,
	input [CB-1:0] tag_en_w,
	input [CB-1:0] tag_en_r,
	input [(TAG_W+7)/8-1:0] tag_info_wstrb,
	input [TAG_W-1:0] tag_info_w,
	output [TAG_W*CB-1:0] tag_info_r,

	input CLK,
	input RSTn
);

	localparam ADDR_LSB = $clog2(DW*BK/8);
	localparam LINE_W = $clog2(CL);


wire [$clog2(BK)-1:0] bank_sel = cache_addr[ ADDR_LSB-1 -: $clog2(BK)];
wire [LINE_W-1:0] cache_address_sel = cache_addr[ADDR_LSB +: LINE_W];
wire [$clog2(DW/8)-1:0] data_sel = cache_addr[ADDR_LSB-$clog2(BK)-1:0];

wire [LINE_W-1:0] tag_address_sel = tag_addr[ADDR_LSB +: LINE_W];
wire [TAG_W-1:0] tag_sel = tag_addr[31 -: TAG_W];

wire [CB*BK-1:0] cache_bank_en_w;
wire [CB*BK-1:0] cache_bank_en_r;
wire [DW*BK*CB-1:0] cache_bank_data_r;
wire [DW/8-1:0] cache_bank_wstrb = cache_info_wstrb << data_sel;


generate
	for ( genvar cb = 0 ; cb < CB; cb = cb + 1 ) begin

		gen_sram # ( .DW((TAG_W)), .AW(LINE_W)) tag_ram
		(
			.data_w(tag_info_w),
			.addr_w(tag_address_sel),
			.data_wstrb(tag_info_wstrb),
			.en_w(tag_en_w[cb]),

			.data_r(tag_info_r[TAG_W*cb +: TAG_W]),
			.addr_r(tag_address_sel),
			.en_r(tag_en_r[cb]),

			.CLK(CLK)		
		);

		for ( genvar bk = 0; bk < BK; bk = bk + 1 ) begin
			assign cache_bank_en_w[BK*cb+bk] = ( bank_sel == bk ) & cache_en_w[cb];
			assign cache_bank_en_r[BK*cb+bk] = ( bank_sel == bk ) & cache_en_r[cb];


			gen_sram # ( .DW(DW), .AW(LINE_W)) cache_bank_ram
			(
				.data_w({(DW/64){cache_info_w}}),
				.addr_w(cache_address_sel),
				.data_wstrb(cache_bank_wstrb),
				.en_w(cache_bank_en_w[cb*BK+bk]),

				.data_r(cache_bank_data_r[DW*(cb*BK+bk) +: DW]),
				.addr_r(cache_address_sel),
				.en_r(cache_bank_en_r[cb*BK+bk]),

				.CLK(CLK)		
			);

		end

	wire [DW*BK-1:0] cache_block_data_r = cache_bank_data_r[DW*BK*cb +: DW*BK];
	wire [DW-1:0] cache_data_r = cache_block_data_r[ DW*bank_sel +: DW ];
	assign cache_info_r[64*cb +: 64] = cache_data_r[ 8*data_sel +: 64];

	end
endgenerate












endmodule













