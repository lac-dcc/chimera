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

module ym2i2s(
	input nRESET,
	input CLK_I2S,
	input [5:0] ANA,
	input SH1, SH2, OP0, PHI_M,
	output I2S_MCLK, I2S_BICK, I2S_SDTI, I2S_LRCK
);

	wire [23:0] I2S_SAMPLE;
	reg [23:0] I2S_SR;
	reg [3:0] SR_CNT;
	reg [7:0] CLKDIV;
	
	assign I2S_SAMPLE = {18'b000000000000000000, ANA};			// Todo :)
	
	assign I2S_MCLK = CLK_I2S;
	assign I2S_LRCK = CLKDIV[7];		// LRCK = I2S_MCLK/512
	assign I2S_BICK = CLKDIV[4];		// BICK = I2S_MCLK/64
	assign I2S_SDTI = I2S_SR[23];
	
	always @(negedge I2S_BICK)
	begin
		if (!nRESET)
			SR_CNT <= 0;
		else
		begin
			if (!SR_CNT)
			begin
				I2S_SR[23:0] <= I2S_SAMPLE;	// Load SR
			end
			else
			begin
				I2S_SR[23:0] <= {I2S_SR[22:0], 1'b0};
				SR_CNT <= SR_CNT + 1'b1;
			end
		end
	end
	
	always @(posedge I2S_MCLK)
	begin
		CLKDIV <= CLKDIV + 1'b1;
	end

endmodule
