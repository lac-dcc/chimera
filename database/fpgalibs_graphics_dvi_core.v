// This program was cloned from: https://github.com/trabucayre/fpgalibs
// License: MIT License

/*
 * dvi_core.v
 *
 * Copyright (C) 2019-2022  Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 * SPDX-License-Identifier: MIT
 */
module dvi_core (
	input  wire       clk_pix,
	input  wire       clk_dvi,
	input  wire       rst,
	// horizontal & vertical position
	input  wire       hsync_i,
	input  wire       vsync_i,
	// display enable (active area)
	input  wire       de_i,
	// pixel colors
	input  wire [7:0] pix_r,
	input  wire [7:0] pix_g,
	input  wire [7:0] pix_b,
	// output signals
	output wire       TMDS_clk,
	output wire [2:0] TMDS_data
);
	wire [9:0] red2_s, green2_s, blue2_s;

	TMDS_encoder encod_blue (
		.i_clk(clk_pix), .i_de(de_i),
		.i_data(pix_b), .i_c0(hsync_i), .i_c1(vsync_i), .o_data(blue2_s));
	TMDS_encoder encod_green (
		.i_clk(clk_pix), .i_de(de_i),
		.i_data(pix_g), .i_c0(1'b0), .i_c1(1'b0), .o_data(green2_s));
	TMDS_encoder encod_red (
		.i_clk(clk_pix), .i_de(de_i),
		.i_data(pix_r), .i_c0(1'b0), .i_c1(1'b0), .o_data(red2_s));

	/* clock serializer */
	serializer serClk(.ref_clk_i(clk_pix), .fast_clk_i(clk_dvi), .rst(rst),
		.dat_i(10'b0000011111), .dat_o(TMDS_clk));

	/* data serializer */
	serializer serDat[2:0](.ref_clk_i(clk_pix), .fast_clk_i(clk_dvi), .rst(rst),
		.dat_i({red2_s, green2_s, blue2_s}), .dat_o(TMDS_data));
endmodule
