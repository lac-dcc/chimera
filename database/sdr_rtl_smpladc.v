////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	smpladc.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	Reads a sample from a SPI-controlled ADC, such as the Analog
//		Devices AD7476A.  In particular, the source was designed to
//	interact with Digilent's PMod MIC3 MEMs microphone with adjustable
//	gain.
//
//	To use, first adjust the CKPCK "clocks per clock" parameter to determine
//	how many clocks to divide the SCLK down by.  If this parameter is set
//	to 2 for example, the SCLK clock frequency will be the input clock rate
//	divided by four (2*CKPCK).
//
//	The next step in using the core is to set enable it by setting i_en
//	high.  This controls how long the SPI port will be active.  If the
//	enable line goes low, the transaction will finish and CS will be
//	de-asserted (raised high)
//
//	If i_en is high, then any time i_request is high a sample will be
//	requested.  In general, you'll want to set i_request high for one
//	clock cycle each time you want a sample, and at the rate you wish
//	the A/D to sample at.
//
//	The results of this core are placed into the output word, o_word.
//	The bits in this word are:
//
//	o_word[13]	True if the interface is idle and disabled, zero
//			otherwise.
//
//	o_word[12]	A strobe, valid for the one clock when a new sample is
//			ready, zero otherwise.
//
//	o_word[11:0]	The last received sample
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
//
`default_nettype	none
// }}}
module	smpladc #(
		parameter [8:0]	CKPCK = 2
	) (
		// {{{
		input	wire		i_clk, i_request, i_rd, i_en,
		output	wire		o_csn,
		output	reg		o_sck,
		input	wire		i_miso,
		output	wire	[13:0]	o_data
		// }}}
	);

	// Signal declarations
	// {{{
	reg	[8:0]	r_clk;
	reg		active, last_en, valid_stb, zclk, r_valid, hclk;
	reg	[4:0]	m_clk;
	reg	[10:0]	r_data;
	reg	[11:0]	r_output;
	// }}}

	initial	active    = 1'b0;
	initial	last_en   = 1'b0;
	initial	valid_stb = 1'b0;
	initial	m_clk     = 5'h0;
	initial	zclk      = 1'b0;
	initial	o_sck     = 1'b1;
	initial	r_clk     = 0;
	initial	hclk      = 1'b0;
	always @(posedge i_clk)
	begin
		// last_en, active
		// {{{
		if (r_clk == CKPCK-1)
		begin
			if ((i_request)&&(!active))
				last_en <= i_en;
			if ((i_request)&&(!active)&&((i_en)||(last_en)))
				active <= 1'b1;
		end else if ((hclk)&&(o_sck)&&(m_clk >= 5'h0a)&&(!i_en))
			active <= 1'b0;
		else if ((hclk)&&(o_sck)&&(m_clk >= 5'h10))
			active <= 1'b0;
		// }}}

		valid_stb <= ((hclk)&&(o_sck)&&(m_clk >= 5'h10));

		// m_clk
		// {{{
		if (!active)
			m_clk <= 5'h0;
		else if (zclk)
			m_clk <= m_clk + 1'b1;
		// }}}

		// zclk, hclk, o_sck, r_clk
		// {{{
		zclk <= 1'b0;
		hclk <= 1'b0;	// hclk is the half clock
		if ((active)||(!o_sck))
		begin
			// {{{
			if (r_clk == CKPCK-1)
			begin
				hclk <= 1'b1;
				zclk  <= o_sck;
				o_sck <= (!o_sck)||(!active);
				r_clk <= 0;
			end else
				r_clk <= r_clk + 1'b1;
			// }}}
		end else begin
			// {{{
			if (r_clk < CKPCK-1)
				r_clk <= r_clk + 1;
			else
				r_clk <= CKPCK-1;
			o_sck <= 1'b1;
			// }}}
		end
		// }}}
	end
	assign	o_csn = !active;

	// r_valid
	// {{{
	initial	r_valid = 1'b0;
	always @(posedge i_clk)
	if (i_rd)
		r_valid <= (valid_stb);
	else
		r_valid <= (r_valid)||(valid_stb);
	// }}}

	// r_data
	// {{{
	// Grab the value on the rise
	always @(posedge i_clk)
	if ((hclk)&&(!zclk))
		r_data <= { r_data[9:0], i_miso };
	// }}}

	// r_output
	// {{{
	initial	r_output = 0;
	always @(posedge i_clk)
	if ((hclk)&&(o_sck)&&(m_clk >= 5'h10))
		r_output <= { r_data[10:0], i_miso };
	// }}}

	// o_data
	// {{{
	assign	o_data = { !last_en, r_valid, r_output };
	// }}}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal properties
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
`ifdef	SMPLADC
`define	ASSUME	assume
`else
`define	ASSUME	assert
`endif

	reg	f_past_valid;
	reg	[11:0]	f_sreg;

	initial	f_past_valid = 0;
	always @(posedge i_clk)
		f_past_valid <= 1'b1;

	initial	f_sreg = 0;

	// Constrain the inputs
	always @(posedge i_clk)
	if ((!o_csn)&&(o_sck))
		assume($stable(i_miso));

	// Constrain the outputs
	reg	[5:0]	f_nck;
	reg	[9:0]	f_zcount;
	initial		f_nck    = 0;
	initial		f_zcount = 0;
	always @(posedge i_clk)
	begin
		if ((zclk)&&(active))
			assert(r_clk == 0);
		if ((hclk)&&(active))
			assert(r_clk == 0);
		if (o_csn)
			assert(o_sck);

		if (!active)
			f_zcount <= CKPCK-2;
		else if (!zclk)
			f_zcount <= f_zcount + 1'b1;
		else // if (zclk)
			f_zcount <= 0;
		assert(f_zcount <= CKPCK*2-1);

		if (hclk) assert((f_zcount == CKPCK-1)||(f_zcount == CKPCK*2-1));
		if (hclk)
			assert(r_clk == 0);
		if (!o_csn)
			assert(r_clk <= CKPCK-1);
		if ((f_past_valid)&&(f_zcount < CKPCK-1))
			assert($past(o_sck) == o_sck);

		if (!active)
			f_nck <= 0;
		else if ((f_past_valid)&&($past(o_sck))&&(!o_sck))
			f_nck <= f_nck + 1'b1;

		if (active)
			assert(f_nck == m_clk);

		if ((f_past_valid)&&($rose(o_sck)))
			f_sreg[11:0] <= {f_sreg[10:0], i_miso };

		if ((f_past_valid)&&(!valid_stb))
			assert(o_data[11:0] == $past(o_data[11:0]));

		if (((active)||(!o_sck))&&(r_clk > 1))
		begin
				if (m_clk >= 5'h2)
					assert(r_data[0] == f_sreg[0]);
				if (m_clk >= 5'h3)
					assert(r_data[1] == f_sreg[1]);
				if (m_clk >= 5'h4)
					assert(r_data[2] == f_sreg[2]);
				if (m_clk >= 5'h5)
					assert(r_data[3:0] == f_sreg[3:0]);
				if (m_clk >= 5'h6)
					assert(r_data[4:0] == f_sreg[4:0]);
				if (m_clk >= 5'h7)
					assert(r_data[5:0] == f_sreg[5:0]);
				if (m_clk >= 5'h8)
					assert(r_data[6:0] == f_sreg[6:0]);
				if (m_clk >= 5'h9)
					assert(r_data[7:0] == f_sreg[7:0]);
				if (m_clk >= 5'ha)
					assert(r_data[8:0] == f_sreg[8:0]);
				if (m_clk >= 5'hb)
					assert(r_data[9:0] == f_sreg[9:0]);
				if (m_clk >= 5'hc)
					assert(r_data[10:0] == f_sreg[10:0]);
		end
		if (valid_stb)
			assert(o_data[11:0] == f_sreg[11:0]);

		if ((f_past_valid)&&(!$past(o_csn))&&(o_csn))
		begin
			if (!$past(i_en))
				assert((f_nck >= 5'ha)&&(f_nck <= 6'h10));
			else
				assert(f_nck == 6'h10);
		end

		if ((f_past_valid)&&($past(i_request))&&($past(i_en))
				&&($past(o_csn))&&($past(r_clk)==CKPCK-1))
			assert(!o_csn);
	end

	always @(*)
	if (o_csn)
		assert(o_sck);

	always @(posedge i_clk)
		cover(r_valid);
`endif
`ifdef	VERIFIC
	sequence CLOCK_PERIOD(HALFCLOCKS,ST);
		((!o_sck)&&(hclk)&&(zclk)&&(r_clk == 0))
		##1 ((!o_sck)&&(!hclk)&&(!zclk)&&(m_clk==ST)) [*HALFCLOCKS-1]
		##1 ((o_sck)&&(hclk)&&(!zclk)&&(m_clk==ST)&&(r_clk == 0))
		##1 ((o_sck)&&(!hclk)&&(!zclk)&&(m_clk==ST)) [*HALFCLOCKS-1];
	endsequence

	sequence DATA_PERIOD(HALFCLOCKS,ST,MISO,RDAT);
		((!o_sck)&&(hclk)&&(zclk)&&(r_clk == 0))
		##1 ((!o_sck)&&(!hclk)&&(!zclk)&&(m_clk==ST)
			&&(i_miso == MISO)) [*HALFCLOCKS-1]
		##1 ((o_sck)&&(hclk)&&(!zclk)&&(m_clk==ST)&&(r_clk == 0)
			&&(RDAT))
		##1 ((o_sck)&&(!hclk)&&(!zclk)&&(m_clk==ST)
			&&(RDAT)) [*HALFCLOCKS-1];
	endsequence

	assert property (@(posedge i_clk)
		(!active)&&(i_request)&&(i_en)&&(r_clk == CKPCK-1)
		|=> (((active)&&(!valid_stb)) throughout
			((o_sck) ##1 
			CLOCK_PERIOD(CKPCK, 5'h1)
			##1 CLOCK_PERIOD(CKPCK, 5'h2)
			##1 CLOCK_PERIOD(CKPCK, 5'h3)
			##1 CLOCK_PERIOD(CKPCK, 5'h4)
			##1 CLOCK_PERIOD(CKPCK, 5'h5)
			##1 CLOCK_PERIOD(CKPCK, 5'h6)
			##1 CLOCK_PERIOD(CKPCK, 5'h7)
			##1 CLOCK_PERIOD(CKPCK, 5'h8)
			##1 CLOCK_PERIOD(CKPCK, 5'h9)
			##1 ((!o_sck)&&(hclk)&&(zclk)&&(r_clk == 0))
			##1 ((!o_sck)&&(!hclk)&&(!zclk)&&(m_clk==5'ha)) [*CKPCK-1]
			##1 ((o_sck)&&(hclk)&&(!zclk)&&(m_clk==5'ha)&&(r_clk == 0)))));

	(* anyconst *)	wire	[11:0]	f_data;
	(* anyseq *)	wire	[3:0]	f_ignored;

	assert property (@(posedge i_clk)
		disable iff (!i_en)
		(!active)&&(i_request)&&(i_en)
		##1 (((active)&&(!valid_stb)) throughout
			(o_sck)
			##1 DATA_PERIOD(CKPCK,5'h1, f_ignored[3], 1'b1)
			##1 DATA_PERIOD(CKPCK,5'h2, f_ignored[2], 1'b1)
			##1 DATA_PERIOD(CKPCK,5'h3, f_ignored[1], 1'b1)
			##1 DATA_PERIOD(CKPCK,5'h4, f_ignored[0], 1'b1)
			##1 DATA_PERIOD(CKPCK,5'h5, f_data[11],
					(r_data[   0] == f_data[11   ]))
			##1 DATA_PERIOD(CKPCK,5'h6, f_data[10],
					(r_data[ 1:0] == f_data[11:10]))
			##1 DATA_PERIOD(CKPCK,5'h7, f_data[ 9],
					(r_data[ 2:0] == f_data[11: 9]))
			##1 DATA_PERIOD(CKPCK,5'h8, f_data[ 8],
					(r_data[ 3:0] == f_data[11: 8]))
			##1 DATA_PERIOD(CKPCK,5'h9, f_data[ 7],
					(r_data[ 4:0] == f_data[11: 7]))
			##1 DATA_PERIOD(CKPCK,5'ha, f_data[ 6],
					(r_data[ 5:0] == f_data[11: 6]))
			##1 DATA_PERIOD(CKPCK,5'hb, f_data[ 5],
					(r_data[ 6:0] == f_data[11: 5]))
			##1 DATA_PERIOD(CKPCK,5'hc, f_data[ 4],
					(r_data[ 7:0] == f_data[11: 4]))
			##1 DATA_PERIOD(CKPCK,5'hd, f_data[ 3],
					(r_data[ 8:0] == f_data[11: 3]))
			##1 DATA_PERIOD(CKPCK,5'he, f_data[ 2],
					(r_data[ 9:0] == f_data[11: 2]))
			##1 DATA_PERIOD(CKPCK,5'hf, f_data[ 1],
					(r_data[10:0] == f_data[11: 1]))
			##1 ((!o_sck)&&(hclk)&&(zclk)&&(r_clk == 0))
			##1 ((!o_sck)&&(!hclk)&&(!zclk)&&(m_clk==5'h10)) [*CKPCK-1]
			##1 ((o_sck)&&(hclk)&&(!zclk)&&(m_clk==5'h10)&&(r_clk == 0)&&(i_miso == f_data[0])))
		|=> (!active)&&(valid_stb)&&(o_data[11:0] == f_data)
		##1 (r_valid)&&(o_data[11:0] == f_data));

`endif
// }}}
endmodule

