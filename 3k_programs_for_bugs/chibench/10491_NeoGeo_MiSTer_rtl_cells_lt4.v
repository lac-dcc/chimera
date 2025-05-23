// This program was cloned from: https://github.com/MiSTer-devel/NeoGeo_MiSTer
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

// altera message_off 10240
module LT4(
	input nG,
	input [3:0] D,
	output reg [3:0] P = 4'd0,
	output [3:0] N
);

	always @(*)
		P = (!nG) ? D : P;		// Latch
	
	assign N = ~P;

endmodule
