////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	hbdechex.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	To decode incoming hexadecimal numbers, together with some
//		out of band control characters, into a stream that can be
//	further processed into a wishbone bus command stream.
//
//	Note that the decoding is stateless, yet it still requires one clock.
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
module	hbdechex(i_clk, i_stb, i_byte, o_dh_stb, o_reset, o_dh_bits);
	input	wire		i_clk, i_stb;
	input	wire	[7:0]	i_byte;
	output	reg		o_dh_stb;
	output	reg		o_reset;
	output	reg	[4:0]	o_dh_bits;

	initial	o_reset = 1'b1;
	always @(posedge i_clk)
		o_reset <= (i_stb)&&(i_byte[6:0] == 7'h54);

	initial	o_dh_stb   = 1'b0;
	always @(posedge i_clk)
		o_dh_stb <= (i_stb)&&(i_byte[6:0] != 7'h7f);

	always @(posedge i_clk)
	begin
		// These are the defaults, to be overwridden by the ifs below
		o_dh_bits <= 5'h00;

		case(i_byte[6:0])
		// Transform hexadecimal characters '0' to '9' to their
		// binary equivalents, with the out of band flag cleared
		7'h30: o_dh_bits <= 5'h00;
		7'h31: o_dh_bits <= 5'h01;
		7'h32: o_dh_bits <= 5'h02;
		7'h33: o_dh_bits <= 5'h03;
		7'h34: o_dh_bits <= 5'h04;
		7'h35: o_dh_bits <= 5'h05;
		7'h36: o_dh_bits <= 5'h06;
		7'h37: o_dh_bits <= 5'h07;
		7'h38: o_dh_bits <= 5'h08;
		7'h39: o_dh_bits <= 5'h09;
		//
		// Hexadecimal characters 'a' through 'f'
		//	(Note that 'A' is used for 'Address' and hence we don't
		//	support upper case hexadecimal letters here)
		7'h61: o_dh_bits <= 5'h0a;
		7'h62: o_dh_bits <= 5'h0b;
		7'h63: o_dh_bits <= 5'h0c;
		7'h64: o_dh_bits <= 5'h0d;
		7'h65: o_dh_bits <= 5'h0e;
		7'h66: o_dh_bits <= 5'h0f;
		//
		// Other characters set out of band information (o_dh_bits[4])
		// These are primarily the bus command bits
		7'h52: o_dh_bits <= 5'h10;	// 'R'
		7'h57: o_dh_bits <= 5'h11;	// 'W'
		7'h41: o_dh_bits <= 5'h12;	// 'A'
		7'h53: o_dh_bits <= 5'h13;	// 'S'
		7'h54: o_dh_bits <= 5'h16;	// 'T' --set for form only
		default: // an "other" character, to be subsequently ignored.
			// Also used as an end of word character, if received
			o_dh_bits <= 5'h1f;
		endcase
	end

	// And just to keep verilator happy
	// verilator lint_on UNUSED
	wire	unused;
	assign	unused = i_byte[7];
	// verilator lint_off UNUSED
	
endmodule

