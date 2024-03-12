////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	hbgenhex.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	Supports a conversion from a five digit channel to a printable
//		ASCII character representing the lower four bits, or special
//	command characters instead if the MSB (fifth bit) is set.  We use an
//	lowercase hexadecimal for the conversion as follows:
//
//		1'b0,0-9	->	0-9
//		1'b0,10-15	->	a-f
//
//	Other out of band characters are:
//
//	5'h10	-> R	(Read)
//	5'h11	-> W	(Write)
//	5'h12	-> A	(Address)
//	5'h13	-> S	(Special)
//	5'h14	-> I	(Interrupt)
//	5'h15	-> Z	(IDLE)
//	5'h16	-> T	(Reset)
//
//	All others characters will cause a carriage return, newline pair
//	to be sent, with the exception that duplicate carriage return, newlin
//	pairs will be suppressed.
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
//
`default_nettype	none
// }}}
module	hbgenhex(i_clk, i_reset, i_stb, i_bits, o_gx_busy, o_gx_stb, o_gx_char, i_busy);
	input	wire		i_clk, i_reset;
	input	wire		i_stb;
	input	wire	[4:0]	i_bits;
	output	wire		o_gx_busy;
	output	reg		o_gx_stb;
	output	reg	[6:0]	o_gx_char;
	input	wire		i_busy;

	initial	o_gx_stb    = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		o_gx_stb <= 1'b0;
	else if (!o_gx_busy)
		o_gx_stb <= i_stb;

	reg	[7:0]	w_gx_char;
	always @(*)
	case(i_bits)
		5'h00: w_gx_char = "0";
		5'h01: w_gx_char = "1";
		5'h02: w_gx_char = "2";
		5'h03: w_gx_char = "3";
		5'h04: w_gx_char = "4";
		5'h05: w_gx_char = "5";
		5'h06: w_gx_char = "6";
		5'h07: w_gx_char = "7";
		5'h08: w_gx_char = "8";
		5'h09: w_gx_char = "9";
		5'h0a: w_gx_char = "a";
		5'h0b: w_gx_char = "b";
		5'h0c: w_gx_char = "c";
		5'h0d: w_gx_char = "d";
		5'h0e: w_gx_char = "e";
		5'h0f: w_gx_char = "f";
		//
		5'h10: w_gx_char = "R";	// Read response w/data
		5'h11: w_gx_char = "K";	// Write ACK
		5'h12: w_gx_char = "A";	// Address was set
		5'h13: w_gx_char = "S";	// Special
		//
		5'h18: w_gx_char = "T";	// reseT
		5'h19: w_gx_char = "E";	// BUS Error
		5'h1a: w_gx_char = "I";	// Interrupt
		5'h1b: w_gx_char = "Z";	// Zzzz -- I'm here, but sleeping
		default: w_gx_char = 8'hd;	// Carriage return
		endcase

	initial	o_gx_char = 7'h00;
	always @(posedge i_clk)
	if (!o_gx_busy)
		o_gx_char <= w_gx_char[6:0];

	assign	o_gx_busy = (o_gx_stb)&&(i_busy);

	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = w_gx_char[7];
	// Verilator lint_on  UNUSED
`ifdef	FORMAL
`ifdef	HBGENHEX
`define	ASSUME	assume
`define	ASSERT	assert
`else
`define	ASSUME	assert
`define	ASSERT	assert
`endif
////
	reg	f_past_valid;
	initial	f_past_valid = 1'b0;
	always @(posedge i_clk)
		f_past_valid <= 1'b1;

	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))
			&&($past(i_stb))&&($past(o_gx_busy)))
		`ASSUME(($stable(i_stb))&&($stable(i_bits)));
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))
			&&($past(o_gx_stb))&&($past(i_busy)))
		`ASSERT(($stable(o_gx_stb))&&($stable(o_gx_char)));
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(i_stb))&&(!$past(i_busy)))
		`ASSERT(o_gx_stb);
`endif
endmodule

