// This program was cloned from: https://github.com/furrtek/Neogeo_MiSTer_old
// License: GNU General Public License v2.0

// NeoGeo logic definition
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

module FDRCell(
	input CK,
	input [3:0] D,
	input nCL,
	output reg [3:0] Q = 4'd0
);

	always @(posedge CK, negedge nCL)
	begin
		if (!nCL)
			Q <= #1 4'd0;
		else
			Q <= #1 D;
	end

endmodule
