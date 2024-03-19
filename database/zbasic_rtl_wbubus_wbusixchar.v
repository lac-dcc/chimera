////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	wbusixchar.v
//
// Project:	FPGA library
//
// Purpose:	Supports a conversion from a six digit bus to a printable
//		ASCII character representing those six bits.  The encoding is
//		as follows:
//
//		0-9	->	0-9
//		A-Z	->	10-35
//		a-z	->	36-61
//		@	->	62
//		%	->	63
//
//		Note that decoding is stateless, yet requires one clock.
//
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2015-2020, Gisselquist Technology, LLC
//
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
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype	none
//
module	wbusixchar(i_clk, i_stb, i_bits, o_stb, o_char, o_busy, i_busy);
	input	wire		i_clk;
	input	wire		i_stb;
	input	wire	[6:0]	i_bits;
	output	reg		o_stb;
	output	reg	[7:0]	o_char;
	output	wire		o_busy;
	input	wire		i_busy;

	initial	o_stb = 1'b0;
	always @(posedge i_clk)
	if (!o_stb || !i_busy)
		o_stb <= i_stb;

	reg	[6:0]	remap	[0:127];
	reg	[6:0]	newv;

	integer	k;
	always @(*) begin
		for(k=0; k<128; k=k+1)
		begin
			newv = 0;
			// verilator lint_off WIDTH
// `define	BROKEN_CODE
`ifdef	BROKEN_CODE
			if (k[6])
`else
			if (k >= 64)
`endif
				newv = 7'h0a;
			else if (k <= 6'h09) // A digit, WORKS
				newv = "0" + { 3'h0, k[3:0] };
			else if (k[5:0] <= 6'd35) // Upper case
				newv[6:0] = 7'h41 + { 1'h0, k[5:0] } - 7'd10; // -'A'+10
			else if (k[5:0] <= 6'd61)
				newv = 7'h61 + { 1'h0, k[5:0] } - 7'd36;// -'a'+(10+26)
			// verilator lint_on WIDTH
			else if (k[5:0] == 6'd62) // An '@' sign
				newv = 7'h40;
			else // if (i_char == 6'h63) // A '%' sign
				newv = 7'h25;

			remap[k] = newv;
		end
	end

	initial	o_char = 8'h00;
	always @(posedge i_clk)
	if (!o_busy)
		o_char <= { 1'b0, remap[i_bits] };

	assign	o_busy = o_stb;

endmodule

