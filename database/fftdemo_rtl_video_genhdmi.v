////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	genhdmi
// {{{
// Project:	FFT-DEMO, a verilator-based spectrogram display project
//
// Purpose:	Generates the timing signals (not the clock) for an outgoing
//		video signal, and then encodes the incoming pixels into
//	an HDMI data stream.
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
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype	none
// }}}
module	genhdmi #(
		// {{{
		parameter	HW=12,VW=12,
		localparam	BITS_PER_COLOR = 8,
		localparam	BPC = BITS_PER_COLOR,
				BITS_PER_PIXEL = 3 * BPC,
				BPP = BITS_PER_PIXEL
		// }}}
	) (
		// {{{
		input	wire			i_pixclk,
		// Verilator lint_off SYNCASYNCNET
		input	wire			i_reset,
		// Verilator lint_on SYNCASYNCNET
		input	wire	[BPP-1:0]	i_rgb_pix,
		// Video mode information
		// {{{
		input	wire	[HW-1:0]	i_hm_width, i_hm_porch,
						i_hm_synch, i_hm_raw,
		input	wire	[VW-1:0]	i_vm_height, i_vm_porch,
						i_vm_synch, i_vm_raw,
		// }}}
		// Pixel generation signals
		// {{{
		output	reg			o_rd, o_newline, o_newframe,
		// }}}
		// HDMI outputs
		// {{{
		output	wire	[9:0]		o_red, o_grn, o_blu
		// }}}
		// }}}
	);

	// Local declarations
	// {{{
	reg		vsync, hsync;
	reg	[1:0]	hdmi_type;
	reg	[3:0]	hdmi_ctl;
	reg	[11:0]	hdmi_data;
	reg	[7:0]	red_pixel, grn_pixel, blu_pixel;
	reg		pre_line;
	reg		first_frame;

	wire			w_rd;
	wire	[BPC-1:0]	i_red, i_grn, i_blu;
	assign	i_red = i_rgb_pix[3*BPC-1:2*BPC];
	assign	i_grn = i_rgb_pix[2*BPC-1:  BPC];
	assign	i_blu = i_rgb_pix[  BPC-1:0];

	reg	[HW-1:0]	hpos;
	reg	[VW-1:0]	vpos;
	reg			hrd, vrd;
	reg		pix_reset;
	reg	[1:0]	pix_reset_pipe;
`ifdef	FORMAL
	wire	[47:0]		f_vmode, f_hmode;
`endif
	// }}}

	// pix_reset, pix_reset_pipe
	// {{{
	initial	{ pix_reset, pix_reset_pipe } = -1;
	always @(posedge i_pixclk, posedge i_reset)
	if (i_reset)
		{ pix_reset, pix_reset_pipe } <= -1;
	else
		{ pix_reset, pix_reset_pipe } <= { pix_reset_pipe, 1'b0 };
	// }}}

	// hpos, o_newline, hsync, hrd
	// {{{
	initial	hpos       = 0;
	initial	o_newline  = 0;
	initial	hsync = 0;
	initial	hrd = 1;
	always @(posedge i_pixclk)
	if (pix_reset)
	begin
		hpos <= 0;
		o_newline <= 1'b0;
		hsync <= 1'b0;
		hrd <= 1;
	end else begin
		hrd <= (hpos < i_hm_width-2)
				||(hpos >= i_hm_raw-2);
		if (hpos < i_hm_raw-1'b1)
			hpos <= hpos + 1'b1;
		else
			hpos <= 0;
		o_newline <= (hpos == i_hm_width-2);
		hsync <= (hpos >= i_hm_porch-1'b1)&&(hpos<i_hm_synch-1'b1);
	end
	// }}}

	// o_newframe
	// {{{
	always @(posedge i_pixclk)
	if (pix_reset)
		o_newframe <= 1'b0;
	else if ((hpos == i_hm_width - 2)&&(vpos == i_vm_height-1))
		o_newframe <= 1'b1;
	else
		o_newframe <= 1'b0;
	// }}}

	// vpos, vsync
	// {{{
	initial	vpos = 0;
	initial	vsync = 1'b0;
	always @(posedge i_pixclk)
	if (pix_reset)
	begin
		vpos <= 0;
		vsync <= 1'b0;
	end else if (hpos == i_hm_porch-1'b1)
	begin
		if (vpos < i_vm_raw-1'b1)
			vpos <= vpos + 1'b1;
		else
			vpos <= 0;
		// Realistically, the new frame begins at the top
		// of the next frame.  Here, we define it as the end
		// last valid row.  That gives any software depending
		// upon this the entire time of the front and back
		// porches, together with the synch pulse width time,
		// to prepare to actually draw on this new frame before
		// the first pixel clock is valid.
		vsync <= (vpos >= i_vm_porch-1'b1)&&(vpos<i_vm_synch-1'b1);
	end
	// }}}

	// vrd
	// {{{
	initial	vrd = 1'b1;
	always @(posedge i_pixclk)
		vrd <= (vpos < i_vm_height)&&(!pix_reset);
	// }}}

	// first_frame
	//  {{{
	initial	first_frame = 1'b1;
	always @(posedge i_pixclk)
	if (pix_reset)
		first_frame <= 1'b1;
	else if (o_newframe)
		first_frame <= 1'b0;
	// }}}

	assign	w_rd = (hrd)&&(vrd)&&(!first_frame);

	// o_rd
	// {{{
	initial	o_rd = 1'b0;
	always @(posedge i_pixclk)
	if (pix_reset)
		o_rd <= 1'b0;
	else
		o_rd <= w_rd;
	// }}}

	// x_pixel
	// {{{
	always @(posedge i_pixclk)
	if (w_rd)
	begin
		red_pixel <= i_red;
		grn_pixel <= i_grn;
		blu_pixel <= i_blu;
	end else begin
		red_pixel <= 0;
		grn_pixel <= 0;
		blu_pixel <= 0;
	end
	// }}}

	localparam	[1:0]	GUARD = 2'b00;
	localparam	[1:0]	CTL_PERIOD  = 2'b01;
	// localparam	[1:0]	DATA_ISLAND = 2'b10;
	localparam	[1:0]	VIDEO_DATA  = 2'b11;

	// pre_line
	// {{{
	initial	pre_line = 1'b1;
	always @(posedge i_pixclk)
	if (pix_reset)
		pre_line <= 1'b1;
	else
		pre_line <= (vpos < i_vm_height);
	// }}}

	// hdmi_type
	// {{{
	initial	hdmi_type = GUARD;
	always @(posedge i_pixclk)
	if (pix_reset)
		hdmi_type <= GUARD;
	else if (pre_line)
	begin
		if (hpos >= i_hm_raw - 1)
			hdmi_type <= VIDEO_DATA;
		else if (hpos < i_hm_width - 1)
			hdmi_type <= VIDEO_DATA;
		else if (hpos > i_hm_raw - 4)
			hdmi_type <= GUARD;
		else
			hdmi_type <= CTL_PERIOD;
	end else
		hdmi_type <= CTL_PERIOD;
	// }}}

	// hdmi_ctl
	// {{{
	always @(*)
		hdmi_ctl = 4'h1;
	// }}}

	// hdmi_data
	// {{{
	always @(*)
	begin
		hdmi_data[1:0]	= { vsync, hsync };
		hdmi_data[11:2] = 0;
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// TMDS encoding
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// Channel 0 = blue
	tmdsencode #(.CHANNEL(2'b00)
	) hdmi_encoder_ch0(i_pixclk,
			hdmi_type, { vsync, hsync },
			hdmi_data[3:0], blu_pixel, o_blu);

	// Channel 1 = green
	tmdsencode #(.CHANNEL(2'b01)
	) hdmi_encoder_ch1(i_pixclk,
			hdmi_type, hdmi_ctl[1:0],
			hdmi_data[7:4], grn_pixel, o_grn);

	// Channel 2 = red
	tmdsencode #(.CHANNEL(2'b10)
	) hdmi_encoder_ch2(i_pixclk,
			hdmi_type, hdmi_ctl[3:2],
			hdmi_data[11:8], red_pixel, o_red);
	// }}}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal properties for verification purposes
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
	reg	f_past_valid;
	initial	f_past_valid = 1'b0;
	always @(posedge i_pixclk)
		f_past_valid <= 1'b1;
	always @(*)
		if (!f_past_valid)
			assume(i_reset);

	always @(*)
	begin
		assume(12'h10 < i_hm_width);
		assume(i_hm_width < i_hm_porch);
		assume(i_hm_porch < i_hm_synch);
		assume(i_hm_synch < i_hm_raw);
		assume(i_hm_porch+14 < i_hm_raw);

		assume(12'h10 < i_vm_height);
		assume(i_vm_height < i_vm_porch);
		assume(i_vm_porch  < i_vm_synch);
		assume(i_vm_synch  < i_vm_raw);
	end

	assign	f_hmode = { i_hm_width,  i_hm_porch, i_hm_synch, i_hm_raw };
	assign	f_vmode = { i_vm_height, i_vm_porch, i_vm_synch, i_vm_raw };

	reg	[47:0]	f_last_vmode, f_last_hmode;
	always @(posedge i_pixclk)
		f_last_vmode <= f_vmode;
	always @(posedge i_pixclk)
		f_last_hmode <= f_hmode;

	reg	f_stable_mode;
	always @(*)
		f_stable_mode = (f_last_vmode == f_vmode)&&(f_last_hmode == f_hmode);

	always @(*)
		if (!pix_reset)
			assume(f_stable_mode);

	always @(posedge i_pixclk)
	if ((!f_past_valid)||($past(pix_reset)))
	begin
		assert(hpos == 0);
		assert(vpos == 0);
	end

	always @(posedge i_pixclk)
	if ((f_past_valid)&&(!$past(pix_reset))&&(!pix_reset)
			&&(f_stable_mode)&&($past(f_stable_mode)))
	begin

		// The horizontal position counter should increment
		if ($past(hpos >= i_hm_raw-1'b1))
			assert(hpos == 0);
		else
			assert(hpos == $past(hpos)+1'b1);

		// The vertical position counter should increment
		if (hpos == i_hm_porch)
		begin
			if ($past(vpos >= i_vm_raw-1'b1))
				assert(vpos == 0);
			else
				assert(vpos == $past(vpos)+1'b1);
		end else
			assert(vpos == $past(vpos));

		// For induction purposes, we need to insist that both
		// horizontal and vertical counters stay within their
		// required ranges
		assert(hpos < i_hm_raw);
		assert(vpos < i_vm_raw);

		// If we are less than the data width for both horizontal
		// and vertical, then we should be asserting we are in a
		// valid data cycle
		if ((hpos < i_hm_width)&&(vpos < i_vm_height)
				&&(!first_frame))
			assert(o_rd);
		else
			assert(!o_rd);

		//
		// The horizontal sync should only be valid between positions
		// i_hm_porch <= hpos < i_hm_sync, invalid at all other times
		//
		if (hpos < i_hm_porch)
			assert(!hsync);
		else if (hpos < i_hm_synch)
			assert(hsync);
		else
			assert(!hsync);

		// Same thing for vertical
		if (vpos < i_vm_porch)
			assert(!vsync);
		else if (vpos < i_vm_synch)
			assert(vsync);
		else
			assert(!vsync);

		// At the end of every horizontal line cycle, we assert
		// a new line
		if (hpos == i_hm_width-1'b1)
			assert(o_newline);
		else
			assert(!o_newline);

		// At the end of every vertical frame cycle, we assert
		// a new frame, but only on the newline measure
		if ((vpos == i_vm_height-1'b1)&&(o_newline))
			assert(o_newframe);
		else
			assert(!o_newframe);
	end

	//////////////////////////////
	//
	// HDMI Specific properties
	//
	//////////////////////////////
	reg	[3:0]	f_ctrl_length;
	reg	[1:0]	f_video_start, f_packet_start;

	always @(posedge i_pixclk)
	if (pix_reset)
		f_ctrl_length <= 4'hf;
	else if (hdmi_type != CTL_PERIOD)
		f_ctrl_length <= 0;
	else if (f_ctrl_length < 4'hf)
		f_ctrl_length <= f_ctrl_length + 1'b1;

	initial	f_video_start = 2'b01;
	always @(posedge i_pixclk)
	if (pix_reset)
		f_video_start = 2'b01;
	else if ((f_video_start == 2'b00)
			&&(f_ctrl_length >= 4'hc)&&(hdmi_type == GUARD)
			&&(hdmi_ctl == 4'h1))
		f_video_start <= 2'b1;
	else if ((f_video_start == 2'b01)&&(hdmi_type == GUARD)
			&&(hdmi_ctl == 4'h1))
		f_video_start <= 2'b10;
	else
		f_video_start <= 2'b00;

	always @(posedge i_pixclk)
	if ((f_ctrl_length >= 4'hc)&&(hdmi_type == GUARD))
		f_packet_start <= 2'b1;
	else if ((f_packet_start == 2'b1)&&(hdmi_type == GUARD))
		f_packet_start <= 2'b10;
	else
		f_packet_start <= 2'b00;

	always @(posedge i_pixclk)
	if ((f_past_valid)&&(!$past(pix_reset)))
	begin
		if (($past(hdmi_type != VIDEO_DATA))
				&&(f_video_start != 2'b10))
			assert(hdmi_type != VIDEO_DATA);
	end

	always @(posedge i_pixclk)
	if ((f_past_valid)&&(!$past(pix_reset))&&(!pix_reset))
	begin
		if ((hpos < i_hm_width)&&(vpos < i_vm_height))
			assert(hdmi_type == VIDEO_DATA);
		else
			assert(hdmi_type != VIDEO_DATA);
		if (!first_frame)
			assert(o_rd == (hdmi_type == VIDEO_DATA));

		if (vpos < i_vm_height)
		begin
			if (hpos < i_hm_width)
				assert(hdmi_type == VIDEO_DATA);
			if (hpos >= (i_hm_raw-2))
				assert(hdmi_type == GUARD);
			else if (hpos >= (i_hm_raw-14))
				assert((hdmi_type == CTL_PERIOD)
					&&(hdmi_ctl == 4'h1));
		end
	end

	// always @(posedge i_pixclk)
	// if ((f_past_valid)&&(!$past(i_reset)))
		// assert(o_rd == (hdmi_type == VIDEO_DATA));

`ifdef	VERIFIC
	sequence	VIDEO_PREAMBLE;
		(hdmi_type == CTL_PERIOD) [*2]
		##1 ((hdmi_type == CTL_PERIOD)&&(hdmi_ctl == 4'h1)) [*10]
		##1 (hdmi_type == GUARD) [*2];
	endsequence

	assert property (@(posedge i_pixclk)
		VIDEO_PREAMBLE
		|=> (hdmi_type == VIDEO_DATA)&&(hpos == 0)&&(vpos == 0));

	assert property (@(posedge i_pixclk)
		disable iff (pix_reset)
		((hdmi_type != VIDEO_DATA) throughout (not VIDEO_PREAMBLE))
	);

	//
	// Data Islands
	//
	sequence	DATA_PREAMBLE;
		(hdmi_type == CTL_PERIOD) [*2]
		##1 ((hdmi_type == CTL_PERIOD)&&(hdmi_ctl == 4'h5)) [*10]
		##1 (hdmi_type == GUARD) [*2];
	endsequence

	assert property (@(posedge i_pixclk)
		disable iff (pix_reset)
		(DATA_PREAMBLE)
		|=> (hdmi_type == DATA_ISLAND)[*64]
		##1 (hdmi_type == GUARD) [*2]);

	assert property (@(posedge i_pixclk)
		disable iff (pix_reset)
		((hdmi_type != DATA_ISLAND) throughout (not DATA_PREAMBLE))
		|=> (hdmi_type != DATA_ISLAND));

`endif
`endif
// }}}
endmodule
