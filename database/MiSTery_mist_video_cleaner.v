//
//
// Copyright (c) 2018 Sorgelig
//
// This program is GPL Licensed. See COPYING for the full license.
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

// Align VBlank/VSync to HBlank/HSync edges.
// Warning! Breaks interlaced VSync.

module video_cleaner
(
	input            clk_vid,
	input            ce_pix,
	input            enable,

	input [COLOR_DEPTH-1:0] R,
	input [COLOR_DEPTH-1:0] G,
	input [COLOR_DEPTH-1:0] B,

	input            HSync,
	input            VSync,
	input            HBlank,
	input            VBlank,

	// video output signals
	output reg [COLOR_DEPTH-1:0] VGA_R,
	output reg [COLOR_DEPTH-1:0] VGA_G,
	output reg [COLOR_DEPTH-1:0] VGA_B,
	output reg       VGA_VS,
	output reg       VGA_HS,

	// optional aligned blank
	output reg       HBlank_out,
	output reg       VBlank_out
);

parameter COLOR_DEPTH = 8;

wire hs, vs;
s_fix sync_v(clk_vid, HSync, hs);
s_fix sync_h(clk_vid, VSync, vs);

wire hbl = hs | HBlank;
wire vbl = vs | VBlank;

always @(posedge clk_vid) begin
	if(!enable) begin
		HBlank_out <= HBlank;
		VBlank_out <= VBlank;
		VGA_HS <= HSync;
		VGA_VS <= VSync;
		VGA_R <= R;
		VGA_G <= G;
		VGA_B <= B;
	end else
	if(ce_pix) begin
		HBlank_out <= hbl;

		VGA_HS <= hs;
		if(~VGA_HS & hs) VGA_VS <= vs;

		VGA_R  <= R;
		VGA_G  <= G;
		VGA_B  <= B;

		if(HBlank_out & ~hbl) VBlank_out <= vbl;
	end
end

endmodule

module s_fix
(
	input clk,

	input sync_in,
	output sync_out
);

assign sync_out = sync_in ^ pol;

reg pol;
always @(posedge clk) begin
	integer pos = 0, neg = 0, cnt = 0;
	reg s1,s2;

	s1 <= sync_in;
	s2 <= s1;

	if(~s2 & s1) neg <= cnt;
	if(s2 & ~s1) pos <= cnt;

	cnt <= cnt + 1;
	if(s2 != s1) cnt <= 0;

	pol <= pos > neg;
end

endmodule
