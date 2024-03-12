////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	wbscope_tb.v
// {{{
// Project:	WBScope, a wishbone hosted scope
//
// Purpose:	This file is a test bench wrapper around the wishbone scope,
//		designed to create a "signal" which can then be scoped and
//	proven.  In our case here, the "signal" is a counter.  When we test
//	the scope within our bench/cpp Verilator testbench, we'll know if our
//	test was "correct" if the counter 1) only ever increments by 1, and
//	2) if the trigger lands on thte right data sample.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2015-2024, Gisselquist Technology, LLC
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
//
`default_nettype	none
// }}}
module	wbscope_tb (
		// {{{
		input	wire		i_clk,
		// i_reset is required by test infrastructure, yet unused here
					i_reset,
		// The test data.  o_data is internally generated here from a
		// counter, i_trigger is given externally
					i_trigger,
		output	wire	[31:0]	o_data,
		// Wishbone bus interaction
		// {{{
		input	wire		i_wb_cyc, i_wb_stb, i_wb_we,
		input	wire		i_wb_addr,
		input	wire	[31:0]	i_wb_data,
		input	wire	[3:0]	i_wb_sel,
		//
		output	wire		o_wb_stall,
		output	wire		o_wb_ack,
		output	wire	[31:0]	o_wb_data,
		// }}}
		// And our output interrupt
		output	wire		o_interrupt
		// }}}
	);

	// Signal declarations
	// {{{
	reg	[30:0]	counter;
	wire	wb_stall_ignored;
	// }}}

	// counter
	// {{{
	initial	counter = 0;
	always @(posedge i_clk)
		counter <= counter + 1'b1;
	// }}}

	assign	o_data = { i_trigger, counter };

	wbscope	#(.LGMEM(5'd6), .BUSW(32), .SYNCHRONOUS(1),
			.DEFAULT_HOLDOFF(1))
		scope(i_clk, 1'b1, i_trigger, o_data,
			i_clk, i_wb_cyc, i_wb_stb, i_wb_we,
					i_wb_addr, i_wb_data, i_wb_sel,
				wb_stall_ignored, o_wb_ack, o_wb_data,
			o_interrupt);

	assign	o_wb_stall = 1'b0;

	// Make Verilator happy
	// {{{
	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, i_reset, wb_stall_ignored };
	// verilator lint_on UNUSED
	// }}}
endmodule
