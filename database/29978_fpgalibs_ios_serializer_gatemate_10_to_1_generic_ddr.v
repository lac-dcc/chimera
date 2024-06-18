// This program was cloned from: https://github.com/trabucayre/fpgalibs
// License: MIT License

/*
 * serializer_gamtemate_10_to_1_generic_ddr.v
 *
 * Copyright (C) 2022  Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 * SPDX-License-Identifier: MIT
 */

module serializer (
	input  wire       ref_clk_i,  // reference clock
	input  wire       fast_clk_i, // must be ref_clk frequency x (n / 2)
	input  wire       rst,
	input  wire [9:0] dat_i,
	output wire       dat_o
);

	/* detect ref_clk_i edge */
	reg ref_clk_i_d, ref_clk_i_s;
	reg ref_clk_i_edge;

	always @(posedge ref_clk_i)
		ref_clk_i_s <= (rst) ? 1'b0 : !ref_clk_i_s;

	always @(posedge fast_clk_i) begin
		ref_clk_i_d <= ref_clk_i_s;
		ref_clk_i_edge <= ref_clk_i_d ^ ref_clk_i_s;
	end

	reg [9:0] dat_pos;

	always @(posedge fast_clk_i) begin
		if (ref_clk_i_edge)
			dat_pos <= dat_i;
		else
			dat_pos <= {2'b0, dat_pos[9:2]};
	end

	CC_ODDR #(
		.CLK_INV(1'b0)
	) ddr_inst (.CLK(fast_clk_i), .DDR(fast_clk_i),
		.D0(~dat_pos[1]), .D1(~dat_pos[0]),
		.Q(dat_o)
	);

endmodule
