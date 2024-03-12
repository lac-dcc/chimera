////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	hbbus.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	This is the top level of the debug bus itself, converting
//		8-bit input words to bus requests and bus returns to outgoing
//	8-bit words.
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
module	hbbus(i_clk,
		i_rx_stb, i_rx_byte,
		o_wb_cyc, o_wb_stb, o_wb_we, o_wb_addr, o_wb_data, o_wb_sel,
		i_wb_stall, i_wb_ack, i_wb_data, i_wb_err,
		i_interrupt,
		o_tx_stb, o_tx_byte, i_tx_busy);
	parameter	AW=30;
	localparam	DW=32;
	input	wire		i_clk;
	input	wire		i_rx_stb;
	input	wire	[7:0]	i_rx_byte;
	output	wire		o_wb_cyc, o_wb_stb, o_wb_we;
	output	wire	[(AW-1):0]	o_wb_addr;
	output	wire	[(DW-1):0]	o_wb_data;
	output	wire	[(DW/8-1):0]	o_wb_sel;
	input	wire			i_wb_stall, i_wb_ack;
	input	wire	[(DW-1):0]	i_wb_data;
	input	wire			i_wb_err;
	input	wire			i_interrupt;
	output	wire			o_tx_stb;
	output	wire	[7:0]		o_tx_byte;
	input	wire			i_tx_busy;


	wire		w_reset;
	wire		dec_stb;
	wire	[4:0]	dec_bits;
	wire		iw_stb;
	wire	[33:0]	iw_word;
	wire		ow_stb;
	wire	[33:0]	ow_word;
	wire		idl_busy, int_stb;
	wire	[33:0]	int_word;
	wire		hb_busy, idl_stb;
	wire	[33:0]	idl_word;
	wire		hb_stb, hx_busy;
	wire	[4:0]	hb_bits;
	wire		hx_stb, nl_busy;
	wire	[6:0]	hx_byte;
	// verilator lint_off UNUSED
	wire		wb_busy;
	wire		int_busy;
	// verilator lint_on UNUSED

	//
	//
	// The incoming stream ...
	//
	//
	// First step, convert the incoming bytes into bits
	hbdechex dechxi(i_clk,
		i_rx_stb, i_rx_byte,
		dec_stb, w_reset, dec_bits);


	// ... that can then be transformed into bus command words
	hbpack	packxi(i_clk, w_reset,
		dec_stb, dec_bits, iw_stb, iw_word);

	//
	// We'll use these bus command words to drive a wishbone bus
	//
	hbexec	#(AW) wbexec(i_clk, w_reset, iw_stb, iw_word, wb_busy,
			ow_stb, ow_word,
			o_wb_cyc, o_wb_stb, o_wb_we, o_wb_addr, o_wb_data,
				o_wb_sel, i_wb_ack, i_wb_stall, i_wb_err,
				i_wb_data);

	// We'll then take the responses from the bus, and add an interrupt
	// flag to the output any time things are idle.  This also acts
	// as a one-stage FIFO
	hbints	addints(i_clk, w_reset, i_interrupt,
			ow_stb,  ow_word,  int_busy,
			int_stb, int_word, idl_busy);

	//
	//
	//
	hbidle	addidles(i_clk, w_reset,
			int_stb, int_word, idl_busy,
			idl_stb, idl_word, hb_busy);

	// We'll then take that ouput from that stage, and disassemble the
	// response word into smaller (5-bit) sized units ...
	hbdeword unpackx(i_clk, w_reset,
			idl_stb, idl_word, hb_busy,
			hb_stb, hb_bits, hx_busy);

	// ... that can then be transmitted back down the channel
	hbgenhex genhex(i_clk, w_reset, hb_stb, hb_bits, hx_busy,
			hx_stb, hx_byte, nl_busy);

	//
	// We'll also add carriage return newline pairs any time the channel
	// goes idle
	hbnewline addnl(i_clk, w_reset, hx_stb, hx_byte, nl_busy,
			o_tx_stb, o_tx_byte[6:0], i_tx_busy);
	assign	o_tx_byte[7] = 1'b0;

endmodule
