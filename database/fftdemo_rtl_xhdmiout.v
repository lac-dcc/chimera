////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	xhdmiout.v
// {{{
// Project:	FFT-DEMO, a verilator-based spectrogram display project
//
// Purpose:	This is a Xilinx-specific I/O driver designed to convert
//		the 10-bits data words of HDMI into a serial channel to be
//	sent to the HDMI hardware.  It does this via an appropriate pair of
//	OSERDES module.
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
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype	none
// `define	BYPASS_SERDES
// }}}
module	xhdmiout #(
		parameter [0:0]		BITREVERSE = 1'b0
	) (
		// {{{
		// i_clk, i_hsclk, i_ce, i_word, o_hs_wire);
		input	wire		i_clk, i_hsclk, i_ce,
		input	wire	[9:0]	i_word,
		output	wire	[1:0]	o_hs_wire
		// }}}
	);

	// Local declarations
	// {{{
	localparam	DLY = 0;

	wire	[5:0]	ignored_data;
	wire	[1:0]	slave_to_master;

	reg	sync_ce, q_ce, qq_ce, reset;

	wire	[9:0]	brev_input, w_in_word;

	reg	[9:0]	d_word;
	wire	w_hs_wire;
	// }}}

	// Reset synchronizer
	// {{{
	initial	reset = 1'b1;
	initial	{ sync_ce, qq_ce, q_ce } = 0;
	always @(posedge i_clk)
		q_ce <= i_ce;
	always @(posedge i_clk)
		qq_ce <= q_ce;
	always @(posedge i_clk)
		sync_ce <= qq_ce;
	always @(posedge i_clk)
		reset <= !sync_ce;
	// }}}

	////////////////////////////////////////////////////////////////////////
	//
	// Optionally bitreverse the input word
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// Arrange for (optionally) bit reversing the input
	//
	assign	brev_input[0] = i_word[9];
	assign	brev_input[1] = i_word[8];
	assign	brev_input[2] = i_word[7];
	assign	brev_input[3] = i_word[6];
	assign	brev_input[4] = i_word[5];
	assign	brev_input[5] = i_word[4];
	assign	brev_input[6] = i_word[3];
	assign	brev_input[7] = i_word[2];
	assign	brev_input[8] = i_word[1];
	assign	brev_input[9] = i_word[0];

	assign	w_in_word = (BITREVERSE) ? brev_input : i_word;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Sub-word delay -- if necessary
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// According to the Artix-7 SelectIO resources guide, OSERDESE2
	// latencies section, there is a 5 clock latency for a 10:1 DDR
	// OSERDESE2.  Hence, to keep things aligned, we'll need to pre-delay
	// the output by 5 clocks.  If we keep track of a previous output word,
	// such that:
	//	r_word, i_word
	// describes our sequence, we can delay by 5 clocks as in:
	//
	// We'll also use this opportunity to register our inputs, before
	// sending them out the door.
	generate
	if (DLY != 0)
	begin
		reg	[(DLY-1):0]	r_word;

		always @(posedge i_clk)
			r_word <= w_in_word[(DLY-1):0];
		always @(posedge i_clk)
			d_word <= (i_ce) ? { r_word, w_in_word[9:DLY] }: 10'h00;

	end else
		always @(posedge i_clk)
			d_word <= w_in_word;
	endgenerate
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// The outgoing SERDES itself
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
`ifdef	BYPASS_SERDES
	// We place this here to simplify the debugging of the following, so
	// that the rest of the design may move forward before we come back to
	// debugging this
	assign	w_hs_wire = 1'b0;
`else

	OSERDESE2	#(
		// {{{
		.DATA_RATE_OQ("DDR"),
		.DATA_RATE_TQ("SDR"),
		.DATA_WIDTH(10),
		.SERDES_MODE("MASTER"),
		.TRISTATE_WIDTH(1)	// Really ... this is unused
		// }}}
	) lowserdes(
		// {{{
		.OCE(sync_ce),	.OFB(),
		.TCE(1'b0),	.TFB(), .TQ(),
		.CLK(i_hsclk),	// HS clock
		.CLKDIV(i_clk),
		.OQ(w_hs_wire),
		.D1(d_word[9]),
		.D2(d_word[8]),
		.D3(d_word[7]),
		.D4(d_word[6]),
		.D5(d_word[5]),
		.D6(d_word[4]),
		.D7(d_word[3]),
		.D8(d_word[2]),
		.RST(reset),
		.TBYTEIN(1'b0), .TBYTEOUT(),
		.T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0),
		.SHIFTIN1(slave_to_master[0]), .SHIFTIN2(slave_to_master[1]),
		.SHIFTOUT1(), .SHIFTOUT2()
		// }}}
	);

	OSERDESE2	#(
		// {{{
		.DATA_RATE_OQ("DDR"),
		.DATA_WIDTH(10),
		.DATA_RATE_TQ("SDR"),
		.SERDES_MODE("SLAVE"),
		.TRISTATE_WIDTH(1)	// Really ... this is unused
		// }}}
	) hiserdes(
		// {{{
		.OCE(sync_ce),	.OFB(), .OQ(),
		.TCE(1'b0),	.TFB(), .TQ(),
		.CLK(i_hsclk),	// HS clock
		.CLKDIV(i_clk),
		.D1(1'h0),
		.D2(1'h0),
		.D3(d_word[1]),
		.D4(d_word[0]),
		.D5(1'h0),
		.D6(1'h0),
		.D7(1'h0),
		.D8(1'h0),
		.RST(reset),
		.TBYTEIN(1'b0), .TBYTEOUT(),
		.T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0),
		.SHIFTIN1(1'b0), .SHIFTIN2(1'b0),
		.SHIFTOUT1(slave_to_master[0]), .SHIFTOUT2(slave_to_master[1])
		// }}}
	);
`endif
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// The outgoing OBUF itself
	// {{{
	////////////////////////////////////////////////////////////////////////
	//

	OBUFDS
	hdmibuf(
		// {{{
		.I(w_hs_wire),
		.O(o_hs_wire[1]),
		.OB(o_hs_wire[0])
		// }}}
	);

	// }}}
endmodule
