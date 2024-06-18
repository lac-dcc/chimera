// This program was cloned from: https://github.com/trabucayre/fpgalibs
// License: MIT License

/*
 * vga_core.v
 *
 * Copyright (C) 2017-2022  Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 * SPDX-License-Identifier: MIT
 */
module vga_core #(
	parameter
		HSZ = 10,  // horizontal counter size
		VSZ = 9    // vertical counter size
) (
	input  wire           clk_i,
	input  wire           rst_i,
	// horizontal & vertical position
	output wire [HSZ-1:0] hcount_o,
	output wire [VSZ-1:0] vcount_o,
	// display enable (active area)
	output reg            de_o,
	// vga control
	output reg            vsync_o,
	output reg            hsync_o
);

`ifdef DISP_640x480_60Hz
	// 25MHz pixel clock
	localparam
		H_RES  = 640,
		H_FP   = 16,
		H_SYNC = 96,
		H_BP   = 48,

		V_RES  = 480,
		V_FP   = 10,
		V_SYNC = 2,
		V_BP   = 33;
`endif

	// horizontal timings
	localparam
		H_START_SYNC = H_RES + H_FP,
		H_END_SYNC   = H_START_SYNC + H_SYNC,
		H_MAX_COUNT  = H_END_SYNC + H_BP,
		HMAX_SZ      = $clog2(H_MAX_COUNT),
		// vertical timings
		V_START_SYNC = V_RES + V_FP,
		V_END_SYNC   = V_START_SYNC + V_SYNC,
		V_MAX_COUNT  = V_END_SYNC + V_BP,
		VMAX_SZ      = $clog2(V_MAX_COUNT);

	// hsync
	// -------------------------+       +------+
	//                           \_____/        \_
	//    display       | front   sync   back
	//                    porch   pulse  porch
	reg  [HMAX_SZ-1:0] hcount_s;
	wire hsync_s        = ~(hcount_s >= H_START_SYNC && hcount_s < H_END_SYNC);
	wire clear_hcount_s = (hcount_s == H_MAX_COUNT-1);
	
	// vsync
	// -------------------------+      +-------+
	//                           \____/         \_
	//    display       | front   sync   back
	//                    porch   pulse  porch
	reg  [VMAX_SZ-1:0] vcount_s;
	wire vsync_s        = ~(vcount_s >= V_START_SYNC && vcount_s < V_END_SYNC);
	wire clear_vcount_s = (vcount_s == V_MAX_COUNT-1);
	
	wire de_s           = (hcount_s <= H_RES-1 && vcount_s <= V_RES-1);
	
	always @(posedge clk_i) begin
		hsync_o <= hsync_s;
		vsync_o <= vsync_s;
		de_o    <= de_s;
	
		hcount_s <= hcount_s + 1'b1;
		if (rst_i || clear_hcount_s)
			hcount_s <= 0;
	
		if (clear_hcount_s)
			vcount_s <= (clear_vcount_s) ? 0 : vcount_s + 1'b1;
		if (rst_i)
			vcount_s <= 0;
	end
	assign hcount_o = hcount_s[HSZ-1:0];
	assign vcount_o = vcount_s[VSZ-1:0];
endmodule
