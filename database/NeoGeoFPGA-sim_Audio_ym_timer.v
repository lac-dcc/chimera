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

module ym_timer #(parameter cnt_width = 8, mult_width = 1) (
	input	CLK,
	input TICK_144,
	input	nRESET,
	input	[cnt_width-1:0] LOAD_VALUE,
	input	LOAD,
	input	CLR_FLAG,
	input	SET_RUN,
	input	CLR_RUN,
	output reg OVF_FLAG,
	output reg OVF
);

	reg RUN;
	reg [mult_width-1:0] MULT;
	reg [cnt_width-1:0] CNT;
	reg [mult_width+cnt_width-1:0] NEXT, INIT;
		
	always @(posedge CLK)
	begin
		if (CLR_RUN || !nRESET)
			RUN <= 0;
		else if (SET_RUN || LOAD)
			RUN <= 1;
		
		if (CLR_FLAG || !nRESET)
			OVF_FLAG <= 0;
		else if (OVF)
			OVF_FLAG <= 1;
	
		if (TICK_144)
		begin
			if (LOAD)
			begin
			  MULT <= { (mult_width){1'b0} };
			  CNT <= LOAD_VALUE;
			end
			else if (RUN)
			  { CNT, MULT } <= OVF ? INIT : NEXT;
		end
	end

	always @(*)
	begin
		{ OVF, NEXT } <= { 1'b0, CNT, MULT } + 1'b1;
		INIT <= { LOAD_VALUE, { (mult_width){1'b0} } };
	end

endmodule
