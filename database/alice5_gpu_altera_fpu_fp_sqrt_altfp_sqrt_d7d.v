// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// Created by altera_lib_lpm.pl from fp_sqrt.v

//synthesis_resources = lpm_add_sub 27 reg 761
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
/*verilator lint_off CASEX*/
/*verilator lint_off COMBDLY*/
/*verilator lint_off INITIALDLY*/
/*verilator lint_off LITENDIAN*/
/*verilator lint_off MULTIDRIVEN*/
/*verilator lint_off UNOPTFLAT*/
/*verilator lint_off BLKANDNBLK*/
module  fp_sqrt_altfp_sqrt_d7d
	(
	clk_en,
	clock,
	data,
	result) ;
	input   clk_en;
	input   clock;
	input   [31:0]  data;
	output   [31:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	// logic   clk_en; // -- converted tristate to logic
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [24:0]   wire_alt_sqrt_block2_root_result;
	reg	exp_all_one_ff;
	reg	[7:0]	exp_ff1;
	reg	[7:0]	exp_ff20c;
	reg	[7:0]	exp_ff210c;
	reg	[7:0]	exp_ff211c;
	reg	[7:0]	exp_ff212c;
	reg	[7:0]	exp_ff21c;
	reg	[7:0]	exp_ff22c;
	reg	[7:0]	exp_ff23c;
	reg	[7:0]	exp_ff24c;
	reg	[7:0]	exp_ff25c;
	reg	[7:0]	exp_ff26c;
	reg	[7:0]	exp_ff27c;
	reg	[7:0]	exp_ff28c;
	reg	[7:0]	exp_ff29c;
	reg	[7:0]	exp_in_ff;
	reg	exp_not_zero_ff;
	reg	[7:0]	exp_result_ff;
	reg	[0:0]	infinity_ff0;
	reg	[0:0]	infinity_ff1;
	reg	[0:0]	infinity_ff2;
	reg	[0:0]	infinity_ff3;
	reg	[0:0]	infinity_ff4;
	reg	[0:0]	infinity_ff5;
	reg	[0:0]	infinity_ff6;
	reg	[0:0]	infinity_ff7;
	reg	[0:0]	infinity_ff8;
	reg	[0:0]	infinity_ff9;
	reg	[0:0]	infinity_ff10;
	reg	[0:0]	infinity_ff11;
	reg	[0:0]	infinity_ff12;
	reg	[22:0]	man_in_ff;
	reg	man_not_zero_ff;
	reg	[22:0]	man_result_ff;
	reg	[22:0]	man_rounding_ff;
	reg	[0:0]	nan_man_ff0;
	reg	[0:0]	nan_man_ff1;
	reg	[0:0]	nan_man_ff2;
	reg	[0:0]	nan_man_ff3;
	reg	[0:0]	nan_man_ff4;
	reg	[0:0]	nan_man_ff5;
	reg	[0:0]	nan_man_ff6;
	reg	[0:0]	nan_man_ff7;
	reg	[0:0]	nan_man_ff8;
	reg	[0:0]	nan_man_ff9;
	reg	[0:0]	nan_man_ff10;
	reg	[0:0]	nan_man_ff11;
	reg	[0:0]	nan_man_ff12;
	reg	[0:0]	sign_node_ff0;
	reg	[0:0]	sign_node_ff1;
	reg	[0:0]	sign_node_ff2;
	reg	[0:0]	sign_node_ff3;
	reg	[0:0]	sign_node_ff4;
	reg	[0:0]	sign_node_ff5;
	reg	[0:0]	sign_node_ff6;
	reg	[0:0]	sign_node_ff7;
	reg	[0:0]	sign_node_ff8;
	reg	[0:0]	sign_node_ff9;
	reg	[0:0]	sign_node_ff10;
	reg	[0:0]	sign_node_ff11;
	reg	[0:0]	sign_node_ff12;
	reg	[0:0]	sign_node_ff13;
	reg	[0:0]	sign_node_ff14;
	reg	[0:0]	sign_node_ff15;
	reg	[0:0]	zero_exp_ff0;
	reg	[0:0]	zero_exp_ff1;
	reg	[0:0]	zero_exp_ff2;
	reg	[0:0]	zero_exp_ff3;
	reg	[0:0]	zero_exp_ff4;
	reg	[0:0]	zero_exp_ff5;
	reg	[0:0]	zero_exp_ff6;
	reg	[0:0]	zero_exp_ff7;
	reg	[0:0]	zero_exp_ff8;
	reg	[0:0]	zero_exp_ff9;
	reg	[0:0]	zero_exp_ff10;
	reg	[0:0]	zero_exp_ff11;
	reg	[0:0]	zero_exp_ff12;
	wire  [8:0]   wire_add_sub1_result;
	wire  [22:0]   wire_add_sub3_result;
	wire aclr;
	wire  [7:0]  bias;
	wire  [7:0]  exp_all_one_w;
	wire  [7:0]  exp_div_w;
	wire  [7:0]  exp_ff2_w;
	wire  [7:0]  exp_not_zero_w;
	wire  infinitycondition_w;
	wire  [22:0]  man_not_zero_w;
	wire  [24:0]  man_root_result_w;
	wire  nancondition_w;
	wire  preadjust_w;
	wire  [25:0]  radicand_w;
	wire  roundbit_w;

	fp_sqrt_alt_sqrt_block_ocb   alt_sqrt_block2
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.rad(radicand_w),
	.root_result(wire_alt_sqrt_block2_root_result));
	// synopsys translate_off
	initial
		exp_all_one_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_all_one_ff <= 1'b0;
		else if  (clk_en == 1'b1)   exp_all_one_ff <= exp_all_one_w[7];
	// synopsys translate_off
	initial
		exp_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff1 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff1 <= exp_div_w;
	// synopsys translate_off
	initial
		exp_ff20c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff20c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff20c <= exp_ff1;
	// synopsys translate_off
	initial
		exp_ff210c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff210c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff210c <= exp_ff29c;
	// synopsys translate_off
	initial
		exp_ff211c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff211c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff211c <= exp_ff210c;
	// synopsys translate_off
	initial
		exp_ff212c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff212c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff212c <= exp_ff211c;
	// synopsys translate_off
	initial
		exp_ff21c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff21c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff21c <= exp_ff20c;
	// synopsys translate_off
	initial
		exp_ff22c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff22c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff22c <= exp_ff21c;
	// synopsys translate_off
	initial
		exp_ff23c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff23c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff23c <= exp_ff22c;
	// synopsys translate_off
	initial
		exp_ff24c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff24c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff24c <= exp_ff23c;
	// synopsys translate_off
	initial
		exp_ff25c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff25c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff25c <= exp_ff24c;
	// synopsys translate_off
	initial
		exp_ff26c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff26c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff26c <= exp_ff25c;
	// synopsys translate_off
	initial
		exp_ff27c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff27c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff27c <= exp_ff26c;
	// synopsys translate_off
	initial
		exp_ff28c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff28c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff28c <= exp_ff27c;
	// synopsys translate_off
	initial
		exp_ff29c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_ff29c <= 8'b0;
		else if  (clk_en == 1'b1)   exp_ff29c <= exp_ff28c;
	// synopsys translate_off
	initial
		exp_in_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_in_ff <= 8'b0;
		else if  (clk_en == 1'b1)   exp_in_ff <= data[30:23];
	// synopsys translate_off
	initial
		exp_not_zero_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_not_zero_ff <= 1'b0;
		else if  (clk_en == 1'b1)   exp_not_zero_ff <= exp_not_zero_w[7];
	// synopsys translate_off
	initial
		exp_result_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_ff <= 8'b0;
		else if  (clk_en == 1'b1)   exp_result_ff <= (((exp_ff2_w & {8{zero_exp_ff12[0:0]}}) | {8{nan_man_ff12[0:0]}}) | {8{infinity_ff12[0:0]}});
	// synopsys translate_off
	initial
		infinity_ff0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff0 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff0 <= (infinitycondition_w & (~ sign_node_ff1[0:0]));
	// synopsys translate_off
	initial
		infinity_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff1 <= infinity_ff0[0:0];
	// synopsys translate_off
	initial
		infinity_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff2 <= infinity_ff1[0:0];
	// synopsys translate_off
	initial
		infinity_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff3 <= infinity_ff2[0:0];
	// synopsys translate_off
	initial
		infinity_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff4 <= infinity_ff3[0:0];
	// synopsys translate_off
	initial
		infinity_ff5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff5 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff5 <= infinity_ff4[0:0];
	// synopsys translate_off
	initial
		infinity_ff6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff6 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff6 <= infinity_ff5[0:0];
	// synopsys translate_off
	initial
		infinity_ff7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff7 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff7 <= infinity_ff6[0:0];
	// synopsys translate_off
	initial
		infinity_ff8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff8 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff8 <= infinity_ff7[0:0];
	// synopsys translate_off
	initial
		infinity_ff9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff9 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff9 <= infinity_ff8[0:0];
	// synopsys translate_off
	initial
		infinity_ff10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff10 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff10 <= infinity_ff9[0:0];
	// synopsys translate_off
	initial
		infinity_ff11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff11 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff11 <= infinity_ff10[0:0];
	// synopsys translate_off
	initial
		infinity_ff12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_ff12 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_ff12 <= infinity_ff11[0:0];
	// synopsys translate_off
	initial
		man_in_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_in_ff <= 23'b0;
		else if  (clk_en == 1'b1)   man_in_ff <= data[22:0];
	// synopsys translate_off
	initial
		man_not_zero_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_not_zero_ff <= 1'b0;
		else if  (clk_en == 1'b1)   man_not_zero_ff <= man_not_zero_w[22];
	// synopsys translate_off
	initial
		man_result_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_result_ff <= 23'b0;
		else if  (clk_en == 1'b1)   man_result_ff <= ((man_rounding_ff & {23{zero_exp_ff12[0:0]}}) | {23{nan_man_ff12[0:0]}});
	// synopsys translate_off
	initial
		man_rounding_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_rounding_ff <= 23'b0;
		else if  (clk_en == 1'b1)   man_rounding_ff <= wire_add_sub3_result;
	// synopsys translate_off
	initial
		nan_man_ff0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff0 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff0 <= nancondition_w;
	// synopsys translate_off
	initial
		nan_man_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff1 <= nan_man_ff0[0:0];
	// synopsys translate_off
	initial
		nan_man_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff2 <= nan_man_ff1[0:0];
	// synopsys translate_off
	initial
		nan_man_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff3 <= nan_man_ff2[0:0];
	// synopsys translate_off
	initial
		nan_man_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff4 <= nan_man_ff3[0:0];
	// synopsys translate_off
	initial
		nan_man_ff5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff5 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff5 <= nan_man_ff4[0:0];
	// synopsys translate_off
	initial
		nan_man_ff6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff6 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff6 <= nan_man_ff5[0:0];
	// synopsys translate_off
	initial
		nan_man_ff7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff7 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff7 <= nan_man_ff6[0:0];
	// synopsys translate_off
	initial
		nan_man_ff8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff8 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff8 <= nan_man_ff7[0:0];
	// synopsys translate_off
	initial
		nan_man_ff9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff9 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff9 <= nan_man_ff8[0:0];
	// synopsys translate_off
	initial
		nan_man_ff10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff10 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff10 <= nan_man_ff9[0:0];
	// synopsys translate_off
	initial
		nan_man_ff11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff11 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff11 <= nan_man_ff10[0:0];
	// synopsys translate_off
	initial
		nan_man_ff12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_man_ff12 <= 1'b0;
		else if  (clk_en == 1'b1)   nan_man_ff12 <= nan_man_ff11[0:0];
	// synopsys translate_off
	initial
		sign_node_ff0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff0 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff0 <= data[31];
	// synopsys translate_off
	initial
		sign_node_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff1 <= sign_node_ff0[0:0];
	// synopsys translate_off
	initial
		sign_node_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff2 <= sign_node_ff1[0:0];
	// synopsys translate_off
	initial
		sign_node_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff3 <= sign_node_ff2[0:0];
	// synopsys translate_off
	initial
		sign_node_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff4 <= sign_node_ff3[0:0];
	// synopsys translate_off
	initial
		sign_node_ff5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff5 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff5 <= sign_node_ff4[0:0];
	// synopsys translate_off
	initial
		sign_node_ff6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff6 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff6 <= sign_node_ff5[0:0];
	// synopsys translate_off
	initial
		sign_node_ff7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff7 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff7 <= sign_node_ff6[0:0];
	// synopsys translate_off
	initial
		sign_node_ff8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff8 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff8 <= sign_node_ff7[0:0];
	// synopsys translate_off
	initial
		sign_node_ff9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff9 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff9 <= sign_node_ff8[0:0];
	// synopsys translate_off
	initial
		sign_node_ff10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff10 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff10 <= sign_node_ff9[0:0];
	// synopsys translate_off
	initial
		sign_node_ff11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff11 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff11 <= sign_node_ff10[0:0];
	// synopsys translate_off
	initial
		sign_node_ff12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff12 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff12 <= sign_node_ff11[0:0];
	// synopsys translate_off
	initial
		sign_node_ff13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff13 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff13 <= sign_node_ff12[0:0];
	// synopsys translate_off
	initial
		sign_node_ff14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff14 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff14 <= sign_node_ff13[0:0];
	// synopsys translate_off
	initial
		sign_node_ff15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff15 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff15 <= sign_node_ff14[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff0 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff0 <= exp_not_zero_ff;
	// synopsys translate_off
	initial
		zero_exp_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff1 <= zero_exp_ff0[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff2 <= zero_exp_ff1[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff3 <= zero_exp_ff2[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff4 <= zero_exp_ff3[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff5 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff5 <= zero_exp_ff4[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff6 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff6 <= zero_exp_ff5[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff7 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff7 <= zero_exp_ff6[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff8 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff8 <= zero_exp_ff7[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff9 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff9 <= zero_exp_ff8[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff10 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff10 <= zero_exp_ff9[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff11 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff11 <= zero_exp_ff10[0:0];
	// synopsys translate_off
	initial
		zero_exp_ff12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_exp_ff12 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_exp_ff12 <= zero_exp_ff11[0:0];
	lpm_add_sub   add_sub1
	(
	.cout(),
	.dataa({1'b0, exp_in_ff}),
	.datab({1'b0, bias}),
	.overflow(),
	.result(wire_add_sub1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub1.lpm_direction = "ADD",
		add_sub1.lpm_pipeline = 0,
		add_sub1.lpm_width = 9,
		add_sub1.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub3
	(
	.cout(),
	.dataa(man_root_result_w[23:1]),
	.datab({{22{1'b0}}, roundbit_w}),
	.overflow(),
	.result(wire_add_sub3_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub3.lpm_direction = "ADD",
		add_sub3.lpm_pipeline = 0,
		add_sub3.lpm_width = 23,
		add_sub3.lpm_type = "lpm_add_sub";
	assign
		aclr = 1'b0,
		bias = {1'b0, {7{1'b1}}},
		exp_all_one_w = {(exp_in_ff[7] & exp_all_one_w[6]), (exp_in_ff[6] & exp_all_one_w[5]), (exp_in_ff[5] & exp_all_one_w[4]), (exp_in_ff[4] & exp_all_one_w[3]), (exp_in_ff[3] & exp_all_one_w[2]), (exp_in_ff[2] & exp_all_one_w[1]), (exp_in_ff[1] & exp_all_one_w[0]), exp_in_ff[0]},
		exp_div_w = {wire_add_sub1_result[8:1]},
		exp_ff2_w = exp_ff212c,
		exp_not_zero_w = {(exp_in_ff[7] | exp_not_zero_w[6]), (exp_in_ff[6] | exp_not_zero_w[5]), (exp_in_ff[5] | exp_not_zero_w[4]), (exp_in_ff[4] | exp_not_zero_w[3]), (exp_in_ff[3] | exp_not_zero_w[2]), (exp_in_ff[2] | exp_not_zero_w[1]), (exp_in_ff[1] | exp_not_zero_w[0]), exp_in_ff[0]},
		infinitycondition_w = ((~ man_not_zero_ff) & exp_all_one_ff),
		man_not_zero_w = {(man_in_ff[22] | man_not_zero_w[21]), (man_in_ff[21] | man_not_zero_w[20]), (man_in_ff[20] | man_not_zero_w[19]), (man_in_ff[19] | man_not_zero_w[18]), (man_in_ff[18] | man_not_zero_w[17]), (man_in_ff[17] | man_not_zero_w[16]), (man_in_ff[16] | man_not_zero_w[15]), (man_in_ff[15] | man_not_zero_w[14]), (man_in_ff[14] | man_not_zero_w[13]), (man_in_ff[13] | man_not_zero_w[12]), (man_in_ff[12] | man_not_zero_w[11]), (man_in_ff[11] | man_not_zero_w[10]), (man_in_ff[10] | man_not_zero_w[9]), (man_in_ff[9] | man_not_zero_w[8]), (man_in_ff[8] | man_not_zero_w[7]), (man_in_ff[7] | man_not_zero_w[6]), (man_in_ff[6] | man_not_zero_w[5]), (man_in_ff[5] | man_not_zero_w[4]), (man_in_ff[4] | man_not_zero_w[3]), (man_in_ff[3] | man_not_zero_w[2]), (man_in_ff[2] | man_not_zero_w[1]), (man_in_ff[1] | man_not_zero_w[0]), man_in_ff[0]},
		man_root_result_w = wire_alt_sqrt_block2_root_result,
		nancondition_w = ((sign_node_ff1[0:0] & exp_not_zero_ff) | (exp_all_one_ff & man_not_zero_ff)),
		preadjust_w = exp_in_ff[0],
		radicand_w = {(~ preadjust_w), (preadjust_w | (man_in_ff[22] & (~ preadjust_w))), ((man_in_ff[22:1] & {22{preadjust_w}}) | (man_in_ff[21:0] & {22{(~ preadjust_w)}})), (man_in_ff[0] & preadjust_w), 1'b0},
		result = {sign_node_ff15[0:0], exp_result_ff, man_result_ff},
		roundbit_w = wire_alt_sqrt_block2_root_result[0];
endmodule //fp_sqrt_altfp_sqrt_d7d

