// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

//============================================================================
//  Konami TMNT for MiSTer
//
//  Copyright (C) 2022 Sean 'Furrtek' Gonsalves
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//============================================================================

// Cell names for layer A only, layer B instance has identical logic

module k052109_scroll(
	input RES_SYNC,
	input [3:0] PXH,
	input [8:3] PXHF,
	input [7:0] ROW,
	input READ_SCROLL,
	input [7:0] VD_IN,
	input FLIP_SCREEN,
	input SCROLL_Y_EN,
	input BB33,
	output [10:0] MAP,
	output [2:0] ROW_S,
	output [2:0] FINE
);

// X scroll
// Catch X scroll value LSBs from VRAM
FDN AA2(PXH[1], PXH[3], READ_SCROLL, AA2_Q);
reg [7:0] SCROLL_X;
wire SCROLL_X_MSB;
assign nAA2_Q = ~AA2_Q;
always @(posedge nAA2_Q or negedge RES_SYNC) begin
	if (!RES_SYNC)
		SCROLL_X <= 8'h00;
	else
		SCROLL_X <= VD_IN;
end

// Catch X scroll value MSB from VRAM
FDE AA22(PXH[1], PXH[3], READ_SCROLL, , AA22_nQ);
FDE AA41(~AA22_nQ, VD_IN[0], RES_SYNC, SCROLL_X_MSB);

// Coarse, tile scrolling
wire [8:0] ADD_X;
assign ADD_X = {{6{FLIP_SCREEN}}, 1'b0, {2{FLIP_SCREEN}}} + {SCROLL_X_MSB, SCROLL_X};
assign MAP[5:0] = PXHF + ADD_X[8:3];

// Fine, pixel scrolling (sent to k051962)
wire [2:0] ADD_X_F;
assign ADD_X_F = ADD_X[2:0] ^ {3{FLIP_SCREEN}};
assign FINE = ADD_X_F + PXH[2:0];


// Y scroll
assign BB30 = ~|{PXH[2], BB33 & ~SCROLL_Y_EN} & RES_SYNC;
FDE BB20(PXH[1], 1'b1, BB30, BB20_Q);

// Catch Y scroll value from VRAM
reg [7:0] SCROLL_Y;
always @(posedge BB20_Q or negedge RES_SYNC) begin
	if (!RES_SYNC)
		SCROLL_Y <= 8'h00;
	else
		SCROLL_Y <= VD_IN;
end

assign {MAP[10:6], ROW_S[2:0]} = ROW + SCROLL_Y;

endmodule
