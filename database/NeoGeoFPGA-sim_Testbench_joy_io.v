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

// SIMULATION - UNUSED
// Latches and buffers on the 68K bus for joypad I/Os
// 273s and 245s on the verification board
// Signals: nCTRL1ZONE, nCTRL2ZONE, nSTATUSBZONE, nBITWD0, (memcard nWP, nCD2, nCD1), SYSTEM_MODE

module joy_io(
	input nCTRL1ZONE,
	input nCTRL2ZONE,
	input nSTATUSBZONE,
	inout [15:0] M68K_DATA,
	input M68K_ADDR_A4,
	input [9:0] P1_IN,
	input [9:0] P2_IN,
	input nBITWD0,
	input nWP, nCD2, nCD1,
	input SYSTEM_MODE,
	output reg [2:0] P1_OUT,
	output reg [2:0] P2_OUT
);
		
	always @(negedge nBITWD0)
	begin
		// REG_POUTPUT
		if (!M68K_ADDR_A4) {P2_OUT, P1_OUT} <= M68K_DATA[5:0];
	end
	
	// REG_P1CNT
	assign M68K_DATA[15:8] = nCTRL1ZONE ? 8'bzzzzzzzz : P1_IN[7:0];
	// REG_P2CNT
	assign M68K_DATA[15:8] = nCTRL2ZONE ? 8'bzzzzzzzz : P2_IN[7:0];
	
	// REG_STATUS_B
	assign M68K_DATA[15:8] = nSTATUSBZONE ? 8'bzzzzzzzz : {SYSTEM_MODE, nWP, nCD2, nCD1, P2_IN[9:8], P1_IN[9:8]};
	
endmodule
