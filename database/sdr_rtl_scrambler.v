////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	scrambler.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	To run WS bits through an LFSR and so generate WS output bits
//		on each clock cycle.  The LFSR length is given by the LN
//	parameter, and its internal feedback by the TAPS parameter.  The first
//	LN bits out of the register are given by the INITIAL_VALUE parameter.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2020-2024, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype	none
// }}}
module	scrambler #(
		// {{{
		parameter		WS=7,	// Nbr of output bits per clock
					LN=31,	// LFSR Reg length/poly deg
		parameter [(LN-1):0]	TAPS = 31'h00_00_20_01,
					INITIAL_FILL = { { (LN-1){1'b0}}, 1'b1 }
		// }}}
	) (
		// {{{
		input	wire			i_clk, i_reset, i_ce,
		input	wire	[(WS-1):0]	i_word,
		output	reg	[(WS-1):0]	o_word
		// }}}
	);

	// Signal declarations
	// {{{
	integer	ik;
	reg	[LN-1:0]	sreg;
	reg	[LN-1:0]	step		[0:WS-1];
	// }}}

	// step[]
	// {{{
	always @(*)
	begin
		step[0] ={ { ^{ (sreg & TAPS) , i_word[WS-1] }}, sreg[LN-1:1] };

		for(ik=1; ik<WS; ik=ik+1)
			step[ik]={ { ^{ (step[ik-1] & TAPS), i_word[WS-1-ik] } },
					step[ik-1][LN-1:1] };
	end
	// }}}

	// sreg
	// {{{
	initial	sreg = INITIAL_FILL;
	always @(posedge i_clk)
	if (i_reset)
		sreg <= INITIAL_FILL;
	else if (i_ce)
		sreg <= step[WS-1];
	// }}}

	// o_word
	// {{{
	always @(posedge i_clk)
	if (i_ce)
	begin
		// High order bit is "first", so we need to reverse here
		for(ik=0; ik<WS; ik=ik+1)
			o_word[ik] <= step[WS-1-ik][LN-1];
	end
	// }}}

`ifdef	FORMAL
`endif
endmodule
