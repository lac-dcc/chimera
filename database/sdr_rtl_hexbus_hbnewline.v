////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	hbnewlines.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	Add a newline to the response stream any time the receive bus
//		goes from busy to idle.
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
module	hbnewline(i_clk, i_reset,
		i_stb, i_byte, o_nl_busy,
		o_nl_stb, o_nl_byte, i_busy);
	input	wire	i_clk, i_reset;
	//
	input	wire		i_stb;
	input	wire	[6:0]	i_byte;
	output	wire		o_nl_busy;
	//
	output	reg		o_nl_stb;
	output	reg	[6:0]	o_nl_byte;
	input	wire		i_busy;

	// LAST_CR will be true any time we have sent a carriage return, but
	// have not yet sent any valid words.  Hence, once the valid words
	// stop, last_cr will go true and a carriage return will be sent.
	// No further carriage returns will be sent until after the next
	// valid word.
	reg	last_cr;

	// CR_STATE will be true any time we have sent a carriage return, but
	// not the following newline
	reg	cr_state;

	// The loaded register indicates whether or not we have a valid
	// command word (that cannot be interrupted) loaded into our buffer.
	// Valid words are anything given us from our input, as well as the
	// line-feed following a carriage return.  We use this logic so that
	// a desired output that should only be output when the bus is idle
	// (such as a newline) can be pre-empted when a new command comes
	// down the interface, but before the bus has had a chance to become
	// idle.
	reg	loaded;

	initial	last_cr  = 1'b1;
	initial	cr_state = 1'b0;
	initial o_nl_stb = 1'b0;
	initial	loaded   = 1'b0;
	initial o_nl_byte = 7'h7f;
	always @(posedge i_clk)
		if (i_reset)
		begin
			cr_state <= 1'b0;
			last_cr  <= 1'b1;
			o_nl_stb <= 1'b0;
			loaded   <= 1'b0;
			o_nl_byte<= 7'h7f;
		end else if ((i_stb)&&(!o_nl_busy))
		begin
			o_nl_stb  <= i_stb;
			o_nl_byte <= i_byte;
			cr_state  <= (i_byte[6:0]==7'hd);
			last_cr   <= (i_byte[6:0] == 7'hd);
			loaded    <= 1'b1;
		end else if (!i_busy)
		begin
			if (!last_cr)
			begin
				// A command just ended, send an
				// (interruptable) CR
				cr_state  <= 1'b1;
				o_nl_byte <= 7'hd;
				last_cr   <= (!i_stb);
				o_nl_stb  <= (!i_stb);
				loaded    <= 1'b0;
			end else if (cr_state)
			begin
				cr_state  <= 1'b0;
				o_nl_byte <= 7'ha;
				o_nl_stb  <= 1'b1;
				loaded    <= 1'b1;
			end else
			begin
				loaded    <= 1'b0;
				o_nl_stb  <= 1'b0;
				o_nl_byte <= 7'h7f;
			end
		end

	// assign	o_nl_busy = (o_nl_stb)&&(loaded);
	assign	o_nl_busy = ((i_busy)&&(o_nl_stb)&&(loaded))
				||((cr_state)&&(!i_busy));
`ifdef	FORMAL
`ifdef	HBNEWLINE
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
	if ((f_past_valid)&&(!$past(i_reset))&&($past(i_stb))&&($past(o_nl_busy)))
		`ASSUME(($stable(i_stb))&&($stable(i_byte)));

	always @(*)
		`ASSUME(i_byte != 7'ha);
	always @(*)
		`ASSUME(i_byte != 7'h7f);

	///////////////////////////
	//
	// Stability
	//
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(o_nl_stb))
				&&($past(i_busy)))
	begin
		if ($past(o_nl_byte) != 7'hd)
			`ASSERT(($stable(o_nl_stb))&&($stable(o_nl_byte)));
		else
			`ASSERT((o_nl_byte == 7'hd)
					||(o_nl_byte == $past(i_byte)));
	end

	// Forward any incoming bytes immediately to the output
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))
			&&($past(i_stb))&&(!$past(o_nl_busy)))
		`ASSERT((o_nl_stb)&&(o_nl_byte == $past(i_byte)));

	// Following a carriage return, always a new-line
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(o_nl_stb))
			&&(!$past(i_busy))&&($past(o_nl_byte)==7'hd))
		`ASSERT((o_nl_stb)&&(o_nl_byte == 7'ha));

	// Following a newline, either a new character or nothing
	always @(posedge i_clk)
	if ((f_past_valid)&&($past(o_nl_stb))&&(!$past(i_busy))
				&&($past(o_nl_byte)==7'ha))
		`ASSERT((!o_nl_stb)||(o_nl_byte != 7'ha));

	always @(*)
	if (!o_nl_stb)
		`ASSERT(o_nl_byte == 7'h7f);


	// Consistency checks
	always @(*)
	if ((o_nl_stb)&&(o_nl_byte == 7'hd))
		`ASSERT((last_cr)&&(cr_state));
	always @(*)
	if ((last_cr)&&(o_nl_stb))
		`ASSERT((o_nl_byte==7'hd)||(o_nl_byte==7'ha));

	always @(*)
	if(!i_stb)
		`ASSERT((o_nl_byte == 7'hd)== ((last_cr)&&(cr_state)));

	always @(*)
		`ASSERT((o_nl_byte==7'ha)==
			((o_nl_stb)&&(last_cr)&&(!cr_state)&&(loaded)));

	always @(*)
	if ((o_nl_byte != 7'h7f)&&(o_nl_byte != 7'hd)&&(o_nl_byte != 7'ha))
		`ASSERT((o_nl_stb)&&(loaded)&&(!last_cr)&&(!cr_state));

	always @(*)
	if (o_nl_byte == 7'h7f)
		`ASSERT((!o_nl_stb)&&(!loaded)&&(last_cr)&&(!cr_state));

	always @(*)
	if ((o_nl_stb)&&(o_nl_byte == 7'ha))
		`ASSERT((last_cr)&&(!cr_state));

	always @(*)
		`ASSERT(cr_state == (o_nl_byte == 7'hd));

`endif
endmodule
