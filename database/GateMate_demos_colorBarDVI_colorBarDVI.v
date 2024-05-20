// This program was cloned from: https://github.com/trabucayre/GateMate_demos
// License: MIT License

/*
 * colorBarDVI.v
 *
 * Copyright (C) 2022  Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 * SPDX-License-Identifier: MIT
 */

`default_nettype none

module colorBarDVI (
	input  wire       clk_i,
	output wire       TMDS_0_clk_p,
	output wire       TMDS_0_clk_n,
	output wire [2:0] TMDS_0_data_p,
	output wire [2:0] TMDS_0_data_n
);
	wire TMDS_0_clk;
	wire [2:0] TMDS_0_data;

	CC_LVDS_OBUF lvds_obuf_inst [3:0] (
		.A({TMDS_0_clk, TMDS_0_data}),
		.O_P({TMDS_0_clk_n, TMDS_0_data_n}),
		.O_N({TMDS_0_clk_p, TMDS_0_data_p})
	);

	/* PLL: 25MHz (pix clock) and 125MHz (hdmi clk rate) */
	wire clk_pix, clk_dvi, lock;
	pll pll_inst (
		.clock_in(clk_i),       //  10 MHz reference
		.clock_out(clk_pix),    //  25 MHz, 0 deg
		.clock_5x_out(clk_dvi), // 125 MHz, 0 deg
		.lock_out(lock)
	);

	wire rst = ~lock;

	localparam
		HRES = 640,
		HSZ  = $clog2(HRES),
		VRES = 480,
		VSZ  = $clog2(VRES);

	wire de_s, hsync_s, vsync_s;

    vga_core #(
		.HSZ(HSZ), .VSZ(VSZ)
	) vga_inst (.clk_i(clk_pix), .rst_i (rst),
		.hcount_o(), .vcount_o(),
		.de_o(de_s),
		.vsync_o(vsync_s), .hsync_o(hsync_s)
	);

	wire [7:0] r_s, g_s, b_s;
	wire       blank2_s, vsync2_s, hsync2_s;

	color_bar #(
		.H_RES(HRES/8), .PIX_SZ(8)
	) col_inst (
		.i_clk(clk_pix), .i_rst(rst),
		.i_blank(~de_s),
		.i_vsync(vsync_s), .i_hsync(hsync_s),
		.o_blank(blank2_s),
		.o_vsync(vsync2_s), .o_hsync(hsync2_s),
		.o_r(r_s), .o_g(g_s), .o_b(b_s)
	);

	dvi_core dvi_inst (
		.clk_pix(clk_pix), .rst(rst), .clk_dvi(clk_dvi),
		// horizontal & vertical synchro
		.hsync_i(hsync2_s), .vsync_i(vsync2_s),
		// display enable (active area)
		.de_i(~blank2_s),
		// pixel colors
		.pix_r(r_s), .pix_g(g_s), .pix_b(b_s),
		// output signals
		.TMDS_clk(TMDS_0_clk),
		.TMDS_data(TMDS_0_data)
	);
endmodule
