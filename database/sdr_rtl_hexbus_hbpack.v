////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	hbpack
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	Given a set of incoming bits (4 at a time, with one out of band
//		indicator), turn them into 34-bit command bits for our wishbone
//	protocol.
//
//	Values 5'h0 through 5'hf are used to build a data word to be sent with
//	the 34-bit command as the lower 32 bits.
//
//	Any value with the 5'th bit set, 5'h10-5'h1f, is an out of band
//	indicator.  These are used as indicators to end command words and start
//	the next command word.  Specific out of band words include:
//
//	5'h10	Read,    top 2-bits set to 2'b00
//	5'h11	Write,   top 2-bits set to 2'b01
//		  Payload is the value to be written
//
//	5'h12	Address, top 2-bits set to 2'b10
//		  Payload is the new address to go to
//
//	5'h13	Special, top 2-bits set to 2'b11
//
//	All other out of band characters are quietly ignored
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
module	hbpack(i_clk, i_reset, i_stb, i_bits, o_pck_stb, o_pck_word);
	input	wire	i_clk, i_reset;
	// The incoming (partially decoded) byte stream
	input	wire	i_stb;	// True if something is valid on input
	input	wire	[4:0]	i_bits;	// Value on input
	output	reg		o_pck_stb;
	output	reg	[33:0]	o_pck_word;

	reg		cmd_loaded;
	reg	[33:0]	r_word;

	initial	cmd_loaded = 1'b0;
	always @(posedge i_clk)
		if (i_reset)
			cmd_loaded <= 1'b0;
		else if ((i_stb)&&(i_bits[4:2] == 3'b100))
			cmd_loaded <= 1'b1;
		else if ((i_stb)&&(i_bits[4]))
			cmd_loaded <= 1'b0;

	initial	o_pck_stb = 1'b0;
	always @(posedge i_clk)
		o_pck_stb <= (!i_reset)&&((i_stb)&&(cmd_loaded)&&(i_bits[4]));

	initial	r_word = 0;
	always @(posedge i_clk)
		if (i_reset)
			r_word <= 0;
		else if (i_stb)
		begin
			if (i_bits[4])
			begin
				// Record the command into our buffer
				r_word[33:32] <= i_bits[1:0];
				// Clear our buffer on any new command
				r_word[31:0] <= 0;
			end else
				// Other wise, new hex digits just get
				// placed in the bottom of our shift register,
				// and everything quietly moves over by one
				r_word[31:0] <= { r_word[27:0], i_bits[3:0] };
		end

	initial	o_pck_word = 0;
	always @(posedge i_clk)
		if (i_reset)
			o_pck_word <= 0;
		else if (i_stb)
			o_pck_word <= r_word;
`ifdef	FORMAL
`ifdef	HBPACK
`define	ASSUME	assume
`define	ASSERT	assesrt
`else
`define	ASSUME	assert
`define	ASSERT	assert
`endif
	reg	f_past_valid;
	initial	f_past_valid = 1'b0;
	always @(posedge i_clk)
		f_past_valid = 1'b1;

	always @(posedge i_clk)
	if ((!f_past_valid)||($past(i_reset)))
	begin
		`ASSERT(cmd_loaded == 1'b0);
		`ASSERT(r_word == 0);
		`ASSERT(o_pck_word == 0);
		`ASSERT(o_pck_stb == 0);
	end

	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))
				&&($past(i_stb))&&($past(i_bits[4:2])==3'b100))
		`ASSERT(cmd_loaded);
`endif
endmodule
