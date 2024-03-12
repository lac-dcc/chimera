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

module upd4990(
	input XTAL,
	input CS, OE,
	input CLK,
	input DATA_IN,
	input STROBE,
	output reg TP,
	output DATA_OUT	// Open drain (is this important ?)
);

	// Todo, low priority for now
	
	parameter TIME_REG = 48'h892424113000;		// Sould be 1989/03/24 11:30:00
	
	reg [3:0] COMMAND_SR;
	
	wire [51:0] TIME_SR;
	wire CLKG, STROBEG;		// Gated by CS

	assign TIME_SR = { COMMAND_SR, TIME_REG };	// 4 + 48 = 52 bits
	assign DATA_OUT = 1'b0;	// TODO
	assign CLKG = CS & CLK;
	assign STROBEG = CS & STROBE;

	initial
		TP = 1'b0;

	// DEBUG
	always
		#5000 TP = !TP;		// 10ms to make startup test quicker - Should be 1Hz -> 500000ns half period
		
	always @(posedge CLKG)
	begin
		$stop;
		if (CS)
		begin
			$display("RTC clocked in data bit '%B'", DATA_IN);		// DEBUG
			COMMAND_SR[2:0] <= COMMAND_SR[3:1];
			COMMAND_SR[3] <= DATA_IN;
		end
	end
	
	always @(posedge STROBEG)
		if (CS) $display("RTC strobed, data = %H", COMMAND_SR);	// DEBUG
	
endmodule
