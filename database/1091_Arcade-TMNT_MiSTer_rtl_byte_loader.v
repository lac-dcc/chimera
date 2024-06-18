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

module byte_loader(
	input clk,
	input en,
	input wein,
	output reg weout,
	output reg lsb
);

// clk	_|'|_|'|_|'|_|'|_|'|_|'|_
// wein 	_____|'''|_______________
// weout	_________|'''''''|_______
// lsb	_____________|'''|_______

always @(posedge clk) begin
	if (en) begin
		if (wein) begin
			lsb <= 1'b0;
			weout <= 1'b1;
		end
		if (weout) begin
			lsb <= ~lsb;
			if (lsb) weout <= 1'b0;
		end
	end else begin
		lsb <= 1'b0;
		weout <= 1'b0;
	end
end

endmodule
