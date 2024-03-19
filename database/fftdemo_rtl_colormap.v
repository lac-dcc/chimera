////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	colormap.v
// {{{
// Project:	FFT-DEMO, a verilator-based spectrogram display project
//
// Purpose:	Convert an 8-bit single-color B/W pixel input into 3 8-bit
//		color components with a false-color map applied.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2018-2024, Gisselquist Technology, LLC
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
//
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype	none
// }}}
module	colormap (
		// {{{
	// (i_clk, i_map, i_pixel, o_r, o_g, o_b);
		input	wire		i_clk,
		input	wire	[2:0]	i_map,
		input	wire	[7:0]	i_pixel,
		output	reg	[7:0]	o_r, o_g, o_b
		// }}}
	);

	// Local declarations
	// {{{
	wire	[7:0]	bw_r, bw_g, bw_b,
			md_r, md_g, md_b,
			mr_r, mr_g, mr_b,
			ln_r, ln_g, ln_b,
			gt_r, gt_g, gt_b;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Supported colormap instantiations
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	bwmap  bwmapi(i_pixel,  bw_r, bw_g, bw_b);
	midmap midmapi(i_pixel, md_r, md_g, md_b);
	mmrmap mmrmapi(i_pixel, mr_r, mr_g, mr_b);
	linmap linmap(i_pixel,  ln_r, ln_g, ln_b);
	gtmap  gtmap(i_pixel,   gt_r, gt_g, gt_b);
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Multiplex between the various color choices
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	always @(posedge i_clk)
	if (i_map == 3'h0)
		{ o_r, o_g, o_b } <= { bw_r, bw_g, bw_b };
	else if (i_map == 3'h1)
		{ o_r, o_g, o_b } <= { md_r, md_g, md_b };
	else if (i_map == 3'h2)
		{ o_r, o_g, o_b } <= { mr_r, mr_g, mr_b };
	else if (i_map == 3'h3)
		{ o_r, o_g, o_b } <= { ln_r, ln_g, ln_b };
	else // if (i_map == 3)
		{ o_r, o_g, o_b } <= { gt_r, gt_g, gt_b };
	// }}}
endmodule
