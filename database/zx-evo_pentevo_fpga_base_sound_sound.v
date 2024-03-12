// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// integrates sound features: tapeout, beeper and covox

/*
    This file is part of ZX-Evo Base Configuration firmware.

    ZX-Evo Base Configuration firmware is free software:
    you can redistribute it and/or modify it under the terms of
    the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    ZX-Evo Base Configuration firmware is distributed in the hope that
    it will be useful, but WITHOUT ANY WARRANTY; without even
    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with ZX-Evo Base Configuration firmware.
    If not, see <http://www.gnu.org/licenses/>.
*/

`include "tune.v"

module sound(

	input  wire       clk,

	input  wire [7:0] din,


	input  wire       beeper_wr,
	input  wire       covox_wr,

	input  wire       beeper_mux, // output either tape_out or beeper


	output wire       sound_bit
);

	reg [6:0] ctr;
	reg [7:0] val;

	reg mx_beep_n_covox;

	reg beep_bit;
	reg beep_bit_old;

	wire covox_bit;




	always @(posedge clk)
	begin
/*		if( beeper_wr ) */
                                if( beeper_wr && (beep_bit!=beep_bit_old) )
			mx_beep_n_covox <= 1'b1;
		else if( covox_wr )
			mx_beep_n_covox <= 1'b0;
	end

	always @(posedge clk) if( beeper_wr ) beep_bit_old <= beep_bit;

	always @(posedge clk)
	if( beeper_wr )
		beep_bit <= beeper_mux ? din[3] /*tapeout*/ : din[4] /*beeper*/;


	always @(posedge clk)
	if( covox_wr )
		val <= din;

	always @(negedge clk)
		ctr <= ctr + 6'd1;

	assign covox_bit = ( {ctr,clk} < val );


	bothedge trigger
	(
		.clk( clk ),

		.d( mx_beep_n_covox ? beep_bit : covox_bit ),

		.q( sound_bit )
	);



endmodule




// both-edge trigger emulator
module bothedge(

	input  wire clk,

	input  wire d,

	output wire q

);
	reg trgp, trgn;

	assign q = trgp ^ trgn;

	always @(posedge clk)
	if( d!=q )
		trgp <= ~trgp;

	always @(negedge clk)
	if( d!=q )
		trgn <= ~trgn;

endmodule

