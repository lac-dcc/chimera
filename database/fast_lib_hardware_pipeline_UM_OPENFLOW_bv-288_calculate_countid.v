//
//  calculate_countid module
//
//  bv2.0_programmable
//
//  Created by LiJunnan on 16/9/23.
//  Copyright (c) 2016year LiJunnan. All rights reserved.
//

`timescale 1ns/1ps

module calculate_countid(
clk,
reset,
bv_in_valid,
bv_in,
countid_valid,
countid
);
parameter	width_bv_and	= 64;
parameter	width_count		= 6;


input	clk;
input	reset;
input	bv_in_valid;
input	[width_bv_and-1:0]	bv_in;
output	wire	countid_valid;
output	wire	[width_count-1:0]	countid;


wire	[width_count-1:0]	count_out[0:width_count];
wire	[width_count-1:0]	count[0:width_count];
wire	bv_valid[0:width_count];
wire	[width_bv_and-1:0]	bv[0:width_count];
wire	bv_out_valid[0:width_count];
wire	[width_bv_and-1:0]	bv_out[0:width_count];

assign	count[width_count] = {width_count{1'b0}};
assign	bv_valid[width_count]	= bv_in_valid;
assign	bv[width_count]		= bv_in;


generate
	genvar i;
	for(i=2; i<= width_count; i=i+1) begin : bv_count
		bv_count bv_c
		(
		.reset(reset),
		.clk(clk),
		.bv_valid(bv_valid[i]),
		.bv(bv[i]),
		.count(count[i]),
		.bv_out_valid(bv_valid[i-1]),
		.bv_out(bv[i-1]),
		.count_out(count[i-1])
		);
	defparam
	/*
		bv_count[i].bv_c.width		= width_bv_and,
		bv_count[i].bv_c.width_count= width_count,
		bv_count[i].bv_c.stage		= i,
		bv_count[i].bv_c.range_end	= 1<<(i-1);
	*/
		bv_c.width		= width_bv_and,
		bv_c.width_count= width_count,
		bv_c.stage		= i,
		bv_c.range_end	= 1<<(i-1);
	end
endgenerate

bv_count bv_count_1(
.reset(reset),
.clk(clk),
.bv_valid(bv_valid[1]),
.bv(bv[1]),
.count(count[1]),
.bv_out_valid(countid_valid),
.bv_out(bv[0]),
.count_out(countid)
);









endmodule