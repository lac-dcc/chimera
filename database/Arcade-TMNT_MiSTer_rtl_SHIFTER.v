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

// Pixel shifter / mux for fine scrolling

module SHIFTER(
	input CLK,
	input [1:0] SEL,
	input [3:0] DIN,
	output [3:0] DOUT
);

wire MUX1_OUT, MUX2_OUT, MUX3_OUT, MUX4_OUT;

T34 MUX1({1'b0, SEL[1], ~SEL[0]}, {~SEL[0], ~SEL[1], DIN[3]}, {SEL[0], ~SEL[1], DOUT[1]}, {SEL[0], SEL[1], DOUT[0]}, MUX1_OUT);
T34 MUX2({DOUT[0], SEL[1], ~SEL[0]}, {~SEL[0], ~SEL[1], DIN[2]}, {SEL[0], ~SEL[1], DOUT[2]}, {SEL[0], SEL[1], DOUT[1]}, MUX2_OUT);
T34 MUX3({DOUT[1], SEL[1], ~SEL[0]}, {~SEL[0], ~SEL[1], DIN[1]}, {SEL[0], ~SEL[1], DOUT[3]}, {SEL[0], SEL[1], DOUT[2]}, MUX3_OUT);
T34 MUX4({DOUT[2], SEL[1], ~SEL[0]}, {~SEL[0], ~SEL[1], DIN[0]}, {SEL[0], ~SEL[1], 1'b0}, {SEL[0], SEL[1], DOUT[3]}, MUX4_OUT);
FDS RG(CLK, {~MUX4_OUT, ~MUX3_OUT, ~MUX2_OUT, ~MUX1_OUT}, DOUT);

endmodule
