// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

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

module ssg_ch(
	input PHI_S,
	input [11:0] FREQ,
	output reg OSC_OUT
	);
	
	reg [11:0] CNT;
	
	always @(posedge PHI_S)		// ?
	begin
		if (CNT)
			CNT <= CNT - 1'b1;
		else
		begin
			CNT <= FREQ;
			OSC_OUT <= ~OSC_OUT;
		end
	end
	
endmodule
