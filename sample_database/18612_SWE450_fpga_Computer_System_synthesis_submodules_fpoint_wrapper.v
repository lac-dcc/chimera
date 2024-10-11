// This program was cloned from: https://github.com/briancook247/SWE450
// License: MIT License

// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on

module fpoint_wrapper (
		clk,
		clk_en,
		dataa,
		datab,
		n,
		reset,
		start,
		
		done,
		result
);

	output           done;
	output  [ 31: 0] result;
	input            clk;
	input            clk_en;
	input   [ 31: 0] dataa;
	input   [ 31: 0] datab;
	input   [  1: 0] n;
	input            reset;
	input            start;

	wire		done;
	wire	[ 31: 0] result;

	parameter useDivider = 0;

	generate
		if (useDivider)
			begin
				fpoint_hw_qsys fpoint_instance (
					.clk(clk),
					.clk_en(clk_en),
					.dataa(dataa),
					.datab(datab),
					.n(n),
					.reset(reset),
					.start(start),
					.done(done),
					.result(result)
				);
			end
		else
			begin
				fpoint_qsys fpoint_instance (
					.clk(clk),
					.clk_en(clk_en),
					.dataa(dataa),
					.datab(datab),
					.n(n),
					.reset(reset),
					.start(start),
					.done(done),
					.result(result)
				);	
			end
	
	endgenerate


endmodule

