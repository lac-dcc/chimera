/*
#   reset.v - System reset counter, count down for 32 clocks
#  
#   Copyright (C) 2014  Binary Logic (nhi.phan.logic at gmail.com).
#
#   This file is part of the Virtual JTAG UART toolkit
#   
#   Virtual UART is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#   
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
*/

//=======================================================
//  System reset timer
//=======================================================
`include "system_include.v"

module reset (

	//////////// CLOCK //////////
	input clk_i,

	//////////// reset signal //////////
	output nreset_o
);

reg [3:0] reset_counter = 4'b1111;

// Reset is LOW until reset counter is 0, then goes high and stays high
assign nreset_o = (reset_counter == 1'b0);

always @(posedge clk_i)
begin
	if( reset_counter > 1'b0 ) reset_counter = reset_counter - 1'b1;
end

endmodule
