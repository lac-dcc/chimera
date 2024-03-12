////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	hbidle.v
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
`define	IDLE_SUB_WORD	5'b11011
`define	IDLE_WORD	{ `IDLE_SUB_WORD, {(34-5){1'b0}} }
//
//
module	hbidle(i_clk, i_reset, i_cmd_stb, i_cmd_word, o_idl_busy,
			o_idl_stb, o_idl_word, i_busy);
	input	wire		i_clk, i_reset;
	//
	input	wire		i_cmd_stb;
	input	wire	[33:0]	i_cmd_word;
	output	wire		o_idl_busy;
	//
	output	reg		o_idl_stb;
	output	reg	[33:0]	o_idl_word;
	input	wire		i_busy;


	//
	// If our bus has been idle for a long time, then set an idle_stb, so
	// that we can send a message back just to say that we are alive.
	//
	reg		idle_stb;
`ifdef	VERILATOR
	reg	[22:0]	idle_counter;
`else
	reg	[29:0]	idle_counter;
`endif
	initial	idle_stb = 0;
	initial	idle_counter = 0;
	always @(posedge i_clk)
		if ((i_reset)||(i_cmd_stb))
		begin
			idle_stb <= 1'b0;
			idle_counter <= 0;
		end else
			{ idle_stb, idle_counter } <= idle_counter + 1'b1;

	initial	o_idl_stb = 1'b0;
	always @(posedge i_clk)
		if (i_reset)
			o_idl_stb <= 1'b0;
		else if ((i_cmd_stb)&&(!o_idl_busy))
			o_idl_stb <= 1'b1;
		else if ((idle_stb)&&(!o_idl_stb))
			o_idl_stb <= 1'b1;
		else if (!i_busy)
			o_idl_stb <= 1'b0;

	initial	o_idl_word = `IDLE_WORD;
	always @(posedge i_clk)
		if ((i_cmd_stb)&&(!o_idl_busy))
			o_idl_word <= i_cmd_word;
		else if (!i_busy)
			o_idl_word <= `IDLE_WORD;

	assign	o_idl_busy = (o_idl_stb)&&(i_busy);

endmodule

