////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	clkcounter.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	Given a clock, asynchronous to the main or system clock, and
//		given a PPS strobe that is synchronous to the main clock, count
//	the number of clock ticks that take place between system clocks.
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
module	clkcounter #(
		// {{{
		parameter	SYSFREQUENCY_HZ = 100_000_000,
				LGNAVGS = 6, BUSW=32
		// }}}
	) (
		// {{{
		input	wire			i_sys_clk, i_tst_clk,
		output	wire	[(BUSW-1):0]	o_sys_counts
		// }}}
	);

	// Signal declarations
	// {{{
	reg	[$clog2(SYSFREQUENCY_HZ)-1:0]	sys_pps_counts;
	reg	ck_pps;
	reg	[(LGNAVGS-1):0]	avgs;
	reg	tst_posedge;
	reg	[(BUSW-LGNAVGS-1):0]	counter;
	reg	[(BUSW-LGNAVGS-1):0]	r_sys_counts;
	(* ASYNC_REG = "TRUE" *)
	reg	q_v, qq_v;
	// }}}

	// ck_pps, sys_pps_counts
	// {{{
	initial	{ ck_pps, sys_pps_counts } = 0;
	always @(posedge i_sys_clk)
	if (sys_pps_counts == 0)
	begin
		sys_pps_counts <= SYSFREQUENCY_HZ-1;
		ck_pps <= 1;
	end else begin
		ck_pps <= 0;
		sys_pps_counts <= sys_pps_counts - 1;
	end
	// }}}

	// avgs, accumulated on the test clock	
	// {{{
	always @(posedge i_tst_clk)
		avgs <= avgs + 1'b1;
	// }}}

	// tst_posedge: Move the positive edge of the MSB of avgs across clocks
	// {{{
	always @(posedge i_sys_clk)
		q_v <= avgs[(LGNAVGS-1)];
	always @(posedge i_sys_clk)
		qq_v <= q_v;

	always @(posedge i_sys_clk)
		tst_posedge <= (!qq_v)&&(q_v);
	// }}}

	// counter: the actual clock counter
	// {{{
	always @(posedge i_sys_clk)
	if (ck_pps)
		counter <= 0;
	else if (tst_posedge)
		counter <= counter + 1'b1;
	// }}}

	// r_sys_counts, o_sys_counts
	// {{{
	always @(posedge i_sys_clk)
	if (ck_pps)
		r_sys_counts <= counter;

	assign	o_sys_counts = { r_sys_counts, {(LGNAVGS){1'b0}} };
	// }}}
endmodule
