// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT51.

    JT51 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT51 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT51.  If not, see <http://www.gnu.org/licenses/>.
	
	Author: Jose Tejada Gomez. Twitter: @topapate
	Version: 1.0
	Date: 27-10-2016
	*/
	
`timescale 1ns / 1ps

module jt51_sh2 #(parameter width=5, stages=32 )
(
	input 							clk,
	input							en,
	input							ld,
	input		[width-1:0]			din,
   	output		[width-1:0]			drop
);

genvar i;
generate
	for( i=0; i<width; i=i+1) begin: shifter
		jt51_sh1 #(.stages(stages)) u_sh1(
			.clk	( clk 	 ),
			.en		( en  	 ),
			.ld		( ld	 ),
			.din	( din[i] ),
			.drop	( drop[i])
		);
	end
endgenerate

endmodule

module jt51_sh1 #(parameter stages=32)
(
	input 	clk,
	input	en,
	input	ld,
	input	din,
   	output	drop
);

reg	[stages-1:0] shift;
assign drop = shift[0];
wire next = ld ? din : drop;

always @(posedge clk ) 
	if( en )
		shift <= {next, shift[stages-1:1]};

endmodule
