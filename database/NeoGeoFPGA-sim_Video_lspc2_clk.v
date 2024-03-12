// NeoGeo logic definition (simulation only)
// Copyright (C) 2018 Sean Gonsalves
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

`timescale 1ns/1ns

module lspc2_clk(
	input CLK_24M,
	input RESETP,
	
	output CLK_24MB,
	output LSPC_12M,
	output LSPC_8M,
	output LSPC_6M,
	output LSPC_4M,
	output LSPC_3M,
	output LSPC_1_5M,
	
	output Q53_CO
);
	
	assign CLK_24MB = ~CLK_24M;
	
	C43 Q53(CLK_24MB, 4'b0010, RESETP, 1'b1, 1'b1, 1'b1, {LSPC_1_5M, LSPC_3M, LSPC_6M, LSPC_12M}, Q53_CO);
	
	FJD R262(CLK_24M, R268_Q, 1'b1, 1'b1, R262_Q, R262_nQ);
	FJD R268(CLK_24M, R262_nQ, 1'b1, 1'b1, R268_Q, );
	FDM S276(CLK_24MB, R262_Q, S276_Q, );
	
	// S274A
	assign LSPC_8M = ~|{S276_Q, R262_Q};
	
	FD4 S219A(LSPC_8M, S219A_nQ, 1'b1, 1'b1, LSPC_4M, S219A_nQ);
	
endmodule
