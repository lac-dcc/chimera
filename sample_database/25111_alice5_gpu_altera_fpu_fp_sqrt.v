// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from fp_sqrt.v
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
/*verilator lint_off CASEX*/
/*verilator lint_off COMBDLY*/
/*verilator lint_off INITIALDLY*/
/*verilator lint_off LITENDIAN*/
/*verilator lint_off MULTIDRIVEN*/
/*verilator lint_off UNOPTFLAT*/
/*verilator lint_off BLKANDNBLK*/
module fp_sqrt (
	clk_en,
	clock,
	data,
	result);

	input	  clk_en;
	input	  clock;
	input	[31:0]  data;
	output	[31:0]  result;

	wire [31:0] sub_wire0;
	wire [31:0] result = sub_wire0[31:0];

	fp_sqrt_altfp_sqrt_d7d	fp_sqrt_altfp_sqrt_d7d_component (
				.clk_en (clk_en),
				.clock (clock),
				.data (data),
				.result (sub_wire0));

endmodule

