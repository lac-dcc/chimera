////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	tmdstest.v
// {{{
// Project:	FFT-DEMO, a verilator-based spectrogram display project
//
// Purpose:	This wrapper composes a TMDS encoder with a TMDS decoder.  If
//		the two work properly, then whatever goes into the encoder will
//	come out of the decoder properly, and that's what we assert here.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2018-2024, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
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
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype	none
// }}}
module	tmdstest (
		// {{{
		// (i_clk, i_dtype, i_ctl, i_color, o_ctl, o_color);
		input	wire		i_clk,
		input	wire	[1:0]	i_dtype,
		input	wire	[1:0]	i_ctl,
		input	wire	[7:0]	i_color,
		//
		output	reg	[1:0]	o_ctl,
		output	reg	[7:0]	o_color
		// }}}
	);

	// Local declarations
	// {{{
	reg	[9:0]	tmds_word;
	reg	[1:0]	dec_ctl;
	reg	[6:0]	dec_aux;
	reg	[7:0]	dec_pix;
	reg	[2:0]	runup;
	reg		valid_test;
	// }}}

	tmdsencode
	encoder(i_clk, i_dtype, i_ctl, i_color[3:0], i_color, tmds_word);

	tmdsdecode
	decoder(i_clk, tmds_word, dec_ctl, dec_aux, dec_pix);

	// o_color
	// {{{
	always @(*)
		o_color = dec_pix;
	// }}}

	// o_ctl
	// {{{
	always @(*)
		o_ctl = dec_ctl;
	// }}}

	// runup
	// {{{
	initial	runup = 0;
	always @(posedge i_clk)
	if (runup!=3'h7)
		runup <= runup + 1'b1;
	// }}}

	// valid_test
	// {{{
	initial	valid_test = 1'b0;
	always @(posedge i_clk)
	if (runup == 3'h7)
		valid_test <= 1'b1;
	// }}}

	// Make verilator happy
	// {{{
	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, valid_test, dec_aux, dec_pix };
	// Verilator lint_on  UNUSED
	// }}}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal property checks
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
	always @(posedge i_clk)
	if (valid_test)
	begin
		case($past(i_dtype,4))
		2'b00: // Guard period
			assert(dec_aux[6] && dec_ctl == 2'b0);
		2'b01: // Control period
			assert(dec_aux[4]
				&&(dec_ctl == $past(i_ctl,4)));
		2'b10: // Data Island
			assert(dec_aux[5]
				&&(dec_aux[3:0] == $past(i_color[3:0],4)));
		2'b11: // Video data
			assert((!dec_aux[4])&&(o_color == $past(i_color,4)));
		endcase
	end

	always @(posedge i_clk)
	if (runup != 0)
		assume(i_dtype == $past(i_dtype));
`endif
// }}}
endmodule
