// This program was cloned from: https://github.com/jotego/jtcores
// License: GNU General Public License v3.0

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

module FDS16bit(
	input CK,
	input [15:0] D,
	output [15:0] Q
);

	FDSCell CellA(CK, D[3:0], Q[3:0]);
	FDSCell CellB(CK, D[7:4], Q[7:4]);
	FDSCell CellC(CK, D[11:8], Q[11:8]);
	FDSCell CellD(CK, D[15:12], Q[15:12]);
	
endmodule
