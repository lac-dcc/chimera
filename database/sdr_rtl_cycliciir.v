////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	cycliciir.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	Implements a cycle of recursive averaging filters.
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
module	cycliciir #(
		// {{{
		parameter	IW=15, OW=16, LGALPHA=4,
		parameter	AW=(IW > OW ? IW : OW) +LGALPHA,
		parameter	NCYCLE = 8,	// Must be >= 4
		localparam	LGNCYCLE = $clog2(NCYCLE)
		// }}}
	) (
		// {{{
		input	wire			i_clk, i_reset, i_ce,
		input	wire	[(IW-1):0]	i_data,
		output	wire	[(OW-1):0]	o_data
		// }}}
	);

	// Signal declarations
	// {{{
	reg	signed [(AW-1):0]	mem	[0:(1<<LGNCYCLE)-1];
	wire	signed [(AW-1):0]	difference;
	reg	[(AW-1):0]	last_avg, this_avg, new_avg, adjustment;
	reg	[LGNCYCLE-1:0]	indx, last_indx, this_indx, new_indx;
	reg	[3:0]		pipece;
	// }}}

	// indx, last_indx
	// {{{
	initial	indx = 0;
	always @(posedge i_clk)
	if (i_ce)
	begin
		indx <= indx + 1;
		last_indx <= indx;
	end
	// }}}

	// last_avg
	// {{{
	always @(posedge i_clk)
	if (i_ce)
		last_avg <= mem[indx];
	// }}}

	// pipece
	// {{{
	initial	pipece = 0;
	always @(posedge i_clk)
	if (i_ce)
		pipece <= 1;
	else
		pipece <= pipece << 1;
	// }}}

	assign	difference = { i_data, {(AW-IW){1'b0}} } - last_avg;

	// adjustment, this_avg, this_indx
	// {{{
	always @(posedge i_clk)
	if (pipece[1])
	begin
		adjustment <= { {(LGALPHA){(difference[(AW-1)])}},
				difference[(AW-1):LGALPHA] };

		this_avg  <= last_avg;
		this_indx <= last_indx;
	end
	// }}}

	// new_avg, new_indx
	// {{{
	always @(posedge i_clk)
	if (pipece[2])
	begin
		new_avg  <= this_avg + adjustment;
		new_indx <= this_indx;
	end
	// }}}

	always @(posedge i_clk)
	if (pipece[3])
		mem[new_indx] <= new_avg;

	assign	o_data = new_avg[AW-1:AW-OW];

	// Make Verilator happy
	// {{{
	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, i_reset };
	// verilator lint_on  UNUSED
	// }}}
endmodule
