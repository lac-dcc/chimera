// This program was cloned from: https://github.com/trabucayre/fpgalibs
// License: MIT License

/*
 * serializer_xc7_10_to_1_generic_ddr.v
 *
 * Copyright (C) 2019-2022  Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 * SPDX-License-Identifier: MIT
 */

module serializer (
	input  wire       ref_clk_i,  // reference clock
	input  wire       fast_clk_i, // must be ref_clk frequency x (n / 2)
	input  wire       rst,
	input  wire [9:0] dat_i,
	output wire       dat_o_p,
	output wire       dat_o_n
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

	/* pos */
	ODDR #(.DDR_CLK_EDGE("SAME_EDGE")
	) dat_ddr_pos (.C(~fast_clk_i), .CE(1'b1), .S(1'b0), .R(1'b0),
		.D1(dat_pos[0]), .D2(dat_pos[1]),
		.Q(dat_o_p)
	);
	/* neg */
	ODDR #(.DDR_CLK_EDGE("SAME_EDGE")
	) dat_ddr_neg (.C(~fast_clk_i), .CE(1'b1), .S(1'b0), .R(1'b0),
		.D1(~dat_pos[0]), .D2(~dat_pos[1]),
		.Q(dat_o_n)
	);

endmodule
