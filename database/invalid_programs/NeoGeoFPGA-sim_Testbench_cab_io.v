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

// SIMULATION - UNUSED
// Latches and buffers on the 68K bus for MVS cab I/Os
// 273s and 245s on the verification board
// Signals: nBITWD0, nDIPRD0, nLED_LATCH, nLED_DATA

module cab_io(
	input [7:4] M68K_ADDR,
	inout [7:0] M68K_DATA,
	output [3:0] EL_OUT,
	output [8:0] LED_OUT1,
	output [8:0] LED_OUT2
);
	
	assign EL_OUT = {LEDLATCH[0], LEDDATA[2:0]};
	assign LED_OUT1 = {LEDLATCH[1], LEDDATA};
	assign LED_OUT2 = {LEDLATCH[2], LEDDATA};
	
endmodule
