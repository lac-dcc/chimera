/*
#   heartbeat.v - Simple heartbeat module - not necessary for the UART
#						but nice to know the config is loaded properly :)
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
//  Heartbeat module
//=======================================================
`include "system_include.v"

//=======================================================
//  Module definition
//=======================================================
module heartbeat(
	input clk_i,
	input nreset_i,
	output heartbeat_o
);

//=======================================================
//  Registers
//=======================================================
reg [26:0] cntr;
reg heartbeat;

//=======================================================
//  Output assignments
//=======================================================

assign heartbeat_o = heartbeat;

//=======================================================
//  Procedural logic
//=======================================================

always @(posedge clk_i)
begin
	if (!nreset_i)
	begin
		cntr = 0;
		heartbeat = 0;
	end else	begin
		cntr = cntr + 1'b1;
		if( cntr == 27'd100000000 )
		begin
			cntr = 0;
			heartbeat = !heartbeat;
		end
	end
end


endmodule
