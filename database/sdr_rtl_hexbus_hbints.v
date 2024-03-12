////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	hbints.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	
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
//
`define	INT_PREFIX	5'b11010
`define	INT_WORD	{ `INT_PREFIX, {(34-5){1'b0}} }
//
module	hbints(i_clk, i_reset, i_interrupt,
		i_stb,     i_word, o_int_busy,
		o_int_stb, o_int_word, i_busy);
	input	wire		i_clk, i_reset;
	input	wire		i_interrupt;
	//
	input	wire		i_stb;
	input	wire	[33:0]	i_word;
	output	wire		o_int_busy;
	//
	output	reg		o_int_stb;
	output	reg	[33:0]	o_int_word;
	input	wire		i_busy;

	reg	int_state, pending_interrupt, loaded, int_loaded;

	initial	int_state = 1'b0;
	always @(posedge i_clk)
		if (i_reset)
			int_state <= 1'b0;
		else if ((i_interrupt)&&(!int_state))
			int_state <= 1'b1;
		else if ((!pending_interrupt)&&(!i_interrupt))
			int_state <= 1'b0;

	initial	pending_interrupt = 1'b0;
	always @(posedge i_clk)
		if (i_reset)
			pending_interrupt <= 1'b0;
		else if ((i_interrupt)&&(!int_state))
			pending_interrupt <= 1'b1;
		else if ((o_int_stb)&&(!i_busy)&&(int_loaded))
			pending_interrupt <= 1'b0;

	initial	loaded = 1'b0;
	always @(posedge i_clk)
		if (i_reset)
			loaded <= 1'b0;
		else if ((i_stb)&&(!o_int_busy))
			loaded <= 1'b1;
		else if ((o_int_stb)&&(!i_busy))
			loaded <= 1'b0;

	initial	o_int_stb = 1'b0;
	always @(posedge i_clk)
		if (i_reset)
			o_int_stb <= 1'b0;
		else if ((i_stb)&&(!o_int_busy))
			o_int_stb <= 1'b1;
		else if ((pending_interrupt)&&((!int_loaded)||(i_busy)))
			o_int_stb <= 1'b1;
		else if ((!loaded)||(!i_busy))
			o_int_stb <= 1'b0;

	initial	int_loaded = 1'b1;
	initial	o_int_word = `INT_WORD;
	always @(posedge i_clk)
		if ((i_stb)&&(!o_int_busy))
		begin
			int_loaded <= 1'b0;
			o_int_word <= i_word;
		end else if ((!i_busy)||(!o_int_stb))
		begin
			// Send an interrupt
			o_int_word <= `INT_WORD;
			int_loaded <= 1'b1;
		end

	assign	o_int_busy = (o_int_stb)&&(loaded);
`ifdef	FORMAL
`ifdef	HBINTS
`define	ASSUME	assume
`define	ASSERT	assert
`else
`define	ASSUME	assert
`define	ASSERT	assert
`endif

	reg	f_past_valid;
	initial	f_past_valid = 1'b0;

	always @(posedge i_clk)
		f_past_valid <= 1'b1;

	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(i_stb))&&($past(o_int_busy)))
		`ASSUME(($stable(i_stb))&&($stable(i_word)));

	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(i_busy))&&($past(o_int_word != `INT_WORD))
			&&($past(o_int_stb)))
		`ASSERT(($stable(o_int_stb))&&($stable(o_int_word)));

	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(i_stb))&&(!$past(o_int_busy)))
		`ASSERT((o_int_stb)&&(o_int_word == $past(i_word)));

	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&(o_int_word != `INT_WORD))
		`ASSERT((!o_int_stb)||(loaded));

	always @(*)
	if (loaded)
		`ASSERT(o_int_stb);

	always @(*)
	if (i_stb)
		`ASSUME(i_word != `INT_WORD);

	// If we just sent an interrupt signal, then don't send another
	always @(posedge i_clk)
	if((f_past_valid)&&($past(o_int_stb))&&($past(o_int_word == `INT_WORD))
				&&(!$past(i_busy)))
		`ASSERT((!o_int_stb)||(o_int_word != `INT_WORD));

	always @(*)
		`ASSERT(int_loaded == (o_int_word == `INT_WORD));
	/*
	reg	f_state;
	always @(posedge i_clk)
	if (f_past_valid)
	case(f_state)
	if ((f_past_valid)&&($past(i_interrupt))&&(!$past(int_state)))
		f_state <= 2'b00
	*/
`endif
endmodule
