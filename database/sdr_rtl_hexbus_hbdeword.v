////////////////////////////////////////////////////////////////////////////////
//
// Filename:	hbdeword.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	Once a word has come from the bus, hbdeword turns that 34-bit
//		word into a series of 5-bit data values.  The top bit of this
//	five bit word is an out of band bit, indicating that the top two
//	command bits of the interface have changed.
//
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2019-2024, Gisselquist Technology, LLC
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
////////////////////////////////////////////////////////////////////////////////
//
// }}}
module	hbdeword(i_clk, i_reset,
		i_stb, i_word, o_dw_busy,
		o_dw_stb, o_dw_bits, i_tx_busy);
	input	wire		i_clk, i_reset;
	// The input command word interface
	input	wire		i_stb;
	input	wire	[33:0]	i_word;
	output	wire		o_dw_busy;
	// The output command word interface
	output	reg		o_dw_stb;
	output	reg	[4:0]	o_dw_bits;
	input	wire		i_tx_busy;


	reg	[3:0]	r_len;
	reg	[31:0]	r_word;

	initial o_dw_stb  = 1'b0;
	initial r_len     = 4'h0;

	always @(posedge i_clk)
		if (i_reset)
		begin
			r_len <= 0;
			o_dw_stb <= 0;
		end else if ((i_stb)&&(!o_dw_busy))
		begin
			o_dw_stb <= 1'b1;
			if (i_word[33:32] == 2'b11)
				r_len <= 4'h0;
			else
				r_len <= 4'h8;
		end else if (!i_tx_busy)
		begin
			o_dw_stb <= (r_len != 4'h0);
			if (r_len != 4'h0)
				r_len <= r_len - 1'b1;
		end

	always @(posedge i_clk)
		// No reset logic needed
		if ((i_stb)&&(!o_dw_busy))
			r_word <= i_word[31:0];
		else if (!i_tx_busy)
			// Whenever we aren't busy, a new nibble is accepted
			// and the word shifts.  If we never set our output
			// strobe, this will never become busy, but if the
			// register isn't in use, there's no penalty for
			// clearing it repeatedly
			r_word <= { r_word[27:0], 4'h0 };

	always @(posedge i_clk)
		if ((i_stb)&&(!o_dw_busy))
		begin
			if (i_word[33:32] == 2'b11)
				o_dw_bits <= i_word[33:29];
			else
				o_dw_bits <= { 3'b100, i_word[33:32] };
		end else if (!i_tx_busy)
			o_dw_bits <= { 1'b0, r_word[31:28] };

	assign	o_dw_busy = o_dw_stb;

endmodule

