////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	rtl/hdmiddr.v
// {{{
// Project:	FFT-DEMO, a verilator-based spectrogram display project
//
// Purpose:	This is the top level simulatable HDL component.  To truly
//		simulate this design, though, you'll need to provide two
//	clocks, i_clk at 100MHz and i_pixclk at (IIRC) 56MHz.  To build this
//	within an FPGA, you'll need to modify the port list and add an external
//	memory since most FPGA's don't have 2MB+ of block RAM.
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
module	hdmiddr (
		// {{{
		input	wire		i_clk, i_reset, i_pixclk,
		// External bus interface
		// {{{
		output	wire			o_sdram_cyc, o_sdram_stb, o_sdram_we,
		output	wire	[27-1:0]	o_sdram_addr,
		output	wire	[32-1:0]	o_sdram_data,
		output	wire	[3:0]		o_sdram_sel,
		input	wire	[32-1:0]	i_sdram_data,
		input	wire			i_sdram_ack, i_sdram_stall, i_sdram_err,
		// }}}
		// HDMI outputs
		// {{{
		output	wire	[9:0]	o_hdmi_red, o_hdmi_grn, o_hdmi_blu,
		// }}}
		// PMic3 Microphone
		// {{{
		output	wire		o_adc_csn, o_adc_sck,
		input	wire		i_adc_miso,
		// }}}
		// 8x LEDs
		output	wire	[7:0]	o_led
		// }}}
	);

	// Local declarations
	// {{{
	localparam	LGMEM=21, AW=LGMEM-2; // LGDW = 5
	localparam	FW=13, LW=12;
	// Horizontal/Vertical video parameters
	localparam [FW-1:0]	HWIDTH=800, HPORCH=840, HSYNC=868, HRAW=1056;
	localparam [LW-1:0]	LHEIGHT=600,LPORCH=601, LSYNC=605, LRAW=628;
	localparam [AW-1:0]	BASEADDR=0,
				LINEWORDS = 200; //  HWIDTH/(1<<(LGMEM-AW));
	//
	//
	wire			dat_cyc, dat_stb, video_cyc, video_stb, dat_we;
				// mem_cyc, mem_stb, mem_we;
	wire	[AW-1:0]	video_addr; // mem_addr;
	//
	wire	[AW-1:0]	dat_addr;
	wire	[31:0]		dat_pix;
	wire	[3:0]		dat_sel;
	//
	// wire	[31:0]		mem_in, mem_data;
	wire			dat_stall, video_stall, // mem_stall,
				dat_ack, video_ack, // mem_ack,
				dat_err, video_err; // mem_err;
	// wire	[3:0]		mem_sel;
	reg			adc_start;
	reg	[6:0]		adc_divider;
	wire			adc_ign;
	wire			adc_ce;
	wire	[11:0]		adc_sample;
	reg	[31:0]		adc_led_counter;
	wire			fil_ce;
	wire	[20:0]		fil_sample;
	reg	[31:0]		fltr_led_counter;
	reg			alt_ce;
	reg	[6:0]		alt_countdown;
	wire			pre_frame, pre_ce;
	wire	[11:0]		pre_sample;
	wire			fft_sync;
	wire	[31:0]		fft_sample;
	wire			raw_sync;
	wire	[7:0]		raw_pixel;
	wire	[AW-1:0]	baseoffset;
	wire	[AW-1:0]	last_line_addr;
	wire			video_refresh;
	wire	[AW-1:0]	read_offset;

	reg	[31:0]		frame_led_count;
	reg			stb_led, ack_led;
	reg	[31:0]		clk_led;
	reg	[7:0]		adc_mag;
	reg			adc_clipping;
	reg	[28:0]		adc_clip_counter;
	reg	[7:0]		fil_mag;
	reg			fltr_clipping;
	reg	[28:0]		fltr_clip_counter;
	reg	[7:0]		pix_mag, pix_tmp;
	reg	[7:0]		clip_leds;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// ADC clock divider: Divide 100MHz by 100 to achieve 1MHz sample clock
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	initial	adc_start = 1;
	initial	adc_divider = 0;
	always @(posedge i_clk)
	if (adc_divider == 7'd99)
	begin
		adc_divider <= 0;
		adc_start <= 1;
	end else begin
		adc_divider <= adc_divider+1'b1;
		adc_start <= 0;
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// A/DC SPI controller
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	pmic
	adc(
		// {{{
		i_clk, adc_start, 1'b1, 1'b1, o_adc_csn, o_adc_sck, i_adc_miso,
			{ adc_ign, adc_ce, adc_sample }
		// }}}
	);

	// adc_led_counter: Create a 1Hz LED flash from our sample clock
	// {{{
	initial	adc_led_counter = 0;
	always @(posedge i_clk)
	if (i_reset)
		adc_led_counter <= 0;
	else if (adc_ce)
		adc_led_counter <= adc_led_counter + 32'd4295;
	// }}}
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Apply a downsampling filter
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
`ifdef	HIFREQUENCIES
	localparam	NDOWN = 23,
			FLTR_MSB=12;
	subfildown #(
		// {{{
		.IW(12), .OW(20), .CW(12), .NDOWN(23), .NCOEFFS(1023),
			.INITIAL_COEFFS("subfildown.hex")
		// }}}
	) fil(
		// {{{
		i_clk, i_reset, 1'b0, 12'h0, adc_ce, adc_sample[11:0],
			fil_ce, fil_sample
		// }}}
	);

	assign	fil_sample[20] == fil_sample[19];
`else
	localparam	NDOWN = 125,
			FLTR_MSB=15;
	// Low frequencies more appropriate for voice
	subfildown #(
		// {{{
		.IW(12), .OW(21), .CW(12), .NDOWN(NDOWN), .NCOEFFS(4095),
			.INITIAL_COEFFS("subfildownlow.hex"),
			.SHIFT(0)
		// }}}
	) fil(
		// {{{
		i_clk, i_reset, 1'b0, 12'h0, adc_ce, adc_sample[11:0],
		fil_ce, fil_sample
		// }}}
	);
`endif

	// fltr_led_counter
	// {{{
	// We just downsampled by 23.  We should now have a 43kHz sample clock
	initial	fltr_led_counter = 0;
	always @(posedge i_clk)
	if (i_reset)
		fltr_led_counter <= 0;
	else if (fil_ce)
		fltr_led_counter <= fltr_led_counter + 32'd98_784;
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Apply a window function to reduce spectral leakage
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	// This also raises our data rate by a factor of two, since we are
	// overlapping by a half FFT length
	//
`define	HANNING
`ifdef	HANNING
	//
	// A basic Hanning window
	//

	// alt_countdown, alt_ce
	// {{{
	initial	alt_countdown = 0;
	always @(posedge i_clk)
	if (i_reset)
	begin
		alt_ce <= 1'b0;
		alt_countdown <= NDOWN[6:0];
	end else if (fil_ce)
	begin
		alt_countdown <= { 1'b0, NDOWN[6:1] };
		alt_ce <= 1'b0;
	end else if (alt_countdown > 0)
	begin
		alt_countdown <= alt_countdown - 1'b1;
		alt_ce <= (alt_countdown <= 1);
	end else
		alt_ce <= 1'b0;
	// }}}

	windowfn #(
		// {{{
		.IW(12), .OW(12), .TW(12), .LGNFFT(10),
		.OPT_FIXED_TAPS(1'b1),
		.INITIAL_COEFFS("hanning.hex")
		// }}}
	) wndw(
		// {{{
		i_clk, i_reset,
		1'b0, 12'h0, fil_ce, fil_sample[FLTR_MSB-1:FLTR_MSB-12], alt_ce,
		pre_frame, pre_ce, pre_sample
		// }}}
	);
`else
	//
	// One of two (much) more powerful windows
	//

	// alt_countdown, alt_ce
	// {{{
	initial	alt_countdown = 0;
	always @(posedge i_clk)
	if (i_reset)
	begin
		alt_ce <= 1'b0;
		alt_countdown <= NDOWN[6:0];
	end else if (fil_ce)
	begin
		alt_countdown <= NDOWN[6:0];
		alt_ce <= 1'b0;
	end else if (alt_countdown > 0)
	begin
		alt_countdown <= alt_countdown - 1'b1;
		alt_ce <= (alt_countdown[0]) && (alt_countdown < 7'd66)
				&& (alt_countdown[3:1] == 0);
	end else
		alt_ce <= 1'b0;
	// }}}

	hires #(
		// {{{
		.IW(12), .OW(12), .TW(12),
			.LGNFFT(10), .LGFLEN(2), .LGSTEPSZ(7),
		.OPT_FIXED_TAPS(1'b1),
		.INITIAL_COEFFS("f3.txt")
		// }}}
	) wndw(
		// {{{
		i_clk, i_reset,
		1'b0, 12'h0, fil_ce, fil_sample[FLTR_MSB-1:FLTR_MSB-12],
		alt_ce, pre_frame, pre_ce, pre_sample
		// }}}
	);
`endif
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// FFT the data
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	fftmain
	fftmaini(
		// {{{
		i_clk, i_reset, pre_ce, { pre_sample, 12'h0 },
			fft_sample, fft_sync
		// }}}
	);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Calculate the log of the squared output
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	// This helps us get better dynamic range in a moment when writing
	// to memory and then video
	//
	logfn
	logi(
		// {{{
		i_clk, i_reset,
			pre_ce, fft_sync, fft_sample[31:16], fft_sample[15:0],
			raw_pixel, raw_sync
		// }}}
	);
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Write the data to a scrolling memory area
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	assign	last_line_addr = BASEADDR
			+ LINEWORDS * ({{(AW-LW-1){1'b0}}, LHEIGHT, 1'b0}-2);
	wrdata	#(
		// {{{
		.AW(AW), .LW(LW)
		// }}}
	) data2mem(
		// {{{
		i_clk, i_reset,
			pre_ce, raw_pixel, raw_sync,
			last_line_addr,LINEWORDS,LHEIGHT, baseoffset,
			dat_cyc, dat_stb, dat_we, dat_addr, dat_pix, dat_sel,
				dat_ack, dat_stall, dat_err
		// }}}
	);
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Arbitrate access to memory: either the pixel writer or the pixel
	// reader may have access to the memory, but never both
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	wbpriarbiter #(
		// {{{
		.AW(AW)
		// }}}
	) arb(
		// {{{
		.i_clk(i_clk),
		// New data writing: the first (priority) input channel
		// {{{
		.i_a_cyc(dat_cyc), .i_a_stb(dat_stb), .i_a_we(dat_we),
			.i_a_adr(dat_addr), .i_a_dat(dat_pix),
			.i_a_sel(dat_sel),
		.o_a_stall(dat_stall), .o_a_ack(dat_ack), .o_a_err(dat_err),
		// }}}
		// Video reading: the second Wishbone channel
		// {{{
		.i_b_cyc(video_cyc), .i_b_stb(video_stb), .i_b_we(1'b0),
			.i_b_adr(video_addr), .i_b_dat(dat_pix),
			.i_b_sel(dat_sel),
		.o_b_stall(video_stall), .o_b_ack(video_ack), .o_b_err(video_err),
		// }}}
		// The arbitrated memory channel
		// {{{
		.o_cyc(o_sdram_cyc), .o_stb(o_sdram_stb), .o_we(o_sdram_we),
			.o_adr(o_sdram_addr[AW-1:0]), .o_dat(o_sdram_data),
			.o_sel(o_sdram_sel),
		.i_stall(i_sdram_stall), .i_ack(i_sdram_ack), .i_err(i_sdram_err)
		// }}}
		// }}}
	);

	assign	o_sdram_addr[26:AW] = 0;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Read a framebuffer from memory and write it to the screen
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	assign	read_offset = baseoffset; // LINEWORDS - baseoffset;
	hdmiframe #(
		// {{{
		.ADDRESS_WIDTH(AW), .FW(FW), .LW(LW)
		// }}}
	) hdmii(
		// {{{
		i_clk, i_pixclk, i_reset, 1'b1,
		BASEADDR + read_offset, LINEWORDS[FW:0],
		HWIDTH,  HPORCH, HSYNC, HRAW,	// Horizontal mode
		LHEIGHT, LPORCH, LSYNC, LRAW,	// Vertical mode
		// Wishbone
		video_cyc, video_stb, video_addr,
			video_ack, video_err, video_stall, i_sdram_data,
		o_hdmi_red, o_hdmi_grn, o_hdmi_blu,
		video_refresh
		// }}}
	);
	// }}}
	// frame_led_count
	// {{{
	initial	frame_led_count = 0;
	always @(posedge i_clk)
	if (i_reset)
		frame_led_count <= 0;
	else if (video_refresh)
		frame_led_count <= frame_led_count + 32'd71_582_788;
	// }}}

	// stb_led
	// {{{
	initial	{ stb_led, ack_led } = 0;
	always @(posedge i_clk)
	if ((o_sdram_stb)&&(!i_sdram_stall))
		stb_led <= !stb_led;
	// }}}

	// ack_led
	// {{{
	always @(posedge i_clk)
	if (i_sdram_ack)
		ack_led <= !ack_led;
	// }}}

	// clk_led
	// {{{
	initial	clk_led = 0;
	always @(posedge i_clk)
	if (i_reset)
		clk_led <= 0;
	else
		clk_led <= clk_led + 32'd43;
	// }}}

	// adc_mag
	// {{{
	always @(posedge i_clk)
	casez(adc_sample)
	12'b0000_0000_0000: adc_mag <= 8'h00;
	12'b0000_0000_0001: adc_mag <= 8'h00;
	12'b0000_0000_001?: adc_mag <= 8'h00;
	12'b0000_0000_01??: adc_mag <= 8'h00;
	12'b0000_0000_1???: adc_mag <= 8'h00;
	12'b0000_0001_????: adc_mag <= 8'h00;
	12'b0000_001?_????: adc_mag <= 8'h00;
	12'b0000_010?_????: adc_mag <= 8'h01;
	12'b0000_011?_????: adc_mag <= 8'h02;
	12'b0000_10??_????: adc_mag <= 8'h03;
	12'b0000_11??_????: adc_mag <= 8'h07;
	12'b0001_0???_????: adc_mag <= 8'h0f;
	12'b0001_1???_????: adc_mag <= 8'h1f;
	12'b0010_????_????: adc_mag <= 8'h3f;
	12'b0011_????_????: adc_mag <= 8'h7f;
	12'b01??_????_????: adc_mag <= 8'hff;
	//
	12'b1111_1111_1111: adc_mag <= 8'h00;
	12'b1111_1111_1110: adc_mag <= 8'h00;
	12'b1111_1111_110?: adc_mag <= 8'h00;
	12'b1111_1111_10??: adc_mag <= 8'h00;
	12'b1111_1111_0???: adc_mag <= 8'h00;
	12'b1111_1110_????: adc_mag <= 8'h00;
	12'b1111_110?_????: adc_mag <= 8'h00;
	12'b1111_101?_????: adc_mag <= 8'h01;
	12'b1111_100?_????: adc_mag <= 8'h02;
	12'b1111_01??_????: adc_mag <= 8'h03;
	12'b1111_00??_????: adc_mag <= 8'h07;
	12'b1110_1???_????: adc_mag <= 8'h0f;
	12'b1110_0???_????: adc_mag <= 8'h1f;
	12'b1101_????_????: adc_mag <= 8'h3f;
	12'b1100_????_????: adc_mag <= 8'h7f;
	12'b10??_????_????: adc_mag <= 8'hff;
	endcase
	// }}}

	// adc_clipping
	// {{{
	always @(posedge i_clk)
	if (adc_ce)
		adc_clipping <= (adc_sample[11:10] == 2'b10)
			||(adc_sample[11:10] == 2'b01);
	// }}}

	// adc_clip_counter
	// {{{
	initial	adc_clip_counter = 29'h1fff_ffff;
	always @(posedge i_clk)
	if ((adc_clipping)||(!(&adc_clip_counter)))
		adc_clip_counter <= adc_clip_counter + 1'b1;
	// }}}

	// fil_mag
	// {{{
	always @(posedge i_clk)
	casez(fil_sample[FLTR_MSB-1:FLTR_MSB-12])
	12'b0000_0000_0000: fil_mag <= 8'h00;
	12'b0000_0000_0001: fil_mag <= 8'h00;
	12'b0000_0000_001?: fil_mag <= 8'h00;
	12'b0000_0000_01??: fil_mag <= 8'h00;
	12'b0000_0000_1???: fil_mag <= 8'h00;
	12'b0000_0001_????: fil_mag <= 8'h00;
	12'b0000_001?_????: fil_mag <= 8'h00;
	12'b0000_010?_????: fil_mag <= 8'h01;
	12'b0000_011?_????: fil_mag <= 8'h02;
	12'b0000_10??_????: fil_mag <= 8'h03;
	12'b0000_11??_????: fil_mag <= 8'h07;
	12'b0001_0???_????: fil_mag <= 8'h0f;
	12'b0001_1???_????: fil_mag <= 8'h1f;
	12'b0010_????_????: fil_mag <= 8'h3f;
	12'b0011_????_????: fil_mag <= 8'h7f;
	12'b01??_????_????: fil_mag <= 8'hff;
	//
	12'b1111_1111_1111: fil_mag <= 8'h00;
	12'b1111_1111_1110: fil_mag <= 8'h00;
	12'b1111_1111_110?: fil_mag <= 8'h00;
	12'b1111_1111_10??: fil_mag <= 8'h00;
	12'b1111_1111_0???: fil_mag <= 8'h00;
	12'b1111_1110_????: fil_mag <= 8'h00;
	12'b1111_110?_????: fil_mag <= 8'h00;
	12'b1111_101?_????: fil_mag <= 8'h01;
	12'b1111_100?_????: fil_mag <= 8'h02;
	12'b1111_01??_????: fil_mag <= 8'h03;
	12'b1111_00??_????: fil_mag <= 8'h07;
	12'b1110_1???_????: fil_mag <= 8'h0f;
	12'b1110_0???_????: fil_mag <= 8'h1f;
	12'b1101_????_????: fil_mag <= 8'h3f;
	12'b1100_????_????: fil_mag <= 8'h7f;
	12'b10??_????_????: fil_mag <= 8'hff;
	endcase
	// }}}

	// fltr_clipping
	// {{{
	initial	fltr_clipping = 0;
	always @(posedge i_clk)
	if (fil_ce)
		fltr_clipping <=
			(&fil_sample[20:FLTR_MSB-1])&&(!fil_sample[FLTR_MSB-2])
			||(fil_sample[20:FLTR_MSB-1]==0)
					&&(fil_sample[FLTR_MSB-2]);
	// }}}

	// fltr_clip_counter
	// {{{
	initial	fltr_clip_counter = 29'h1fff_ffff;
	always @(posedge i_clk)
	if ((fltr_clipping)||(!(&fltr_clip_counter)))
		fltr_clip_counter <= fltr_clip_counter + 1'b1;
	// }}}

	// pix_mag
	// {{{
	always @(posedge i_clk)
	if (raw_sync)
	begin
		if (pix_tmp[7])
			pix_mag <= -pix_tmp;
		else
			pix_mag <= pix_tmp;
	end
	// }}}

	// pix_tmp
	// {{{
	always @(posedge i_clk)
	if (raw_sync)
		pix_tmp <= raw_pixel;
	else if (raw_pixel > pix_tmp)
		pix_tmp <= raw_pixel;
	// }}}
	
	// assign	o_led[0] = adc_led_counter[31];
	// assign	o_led[1] = fltr_led_counter[31];
	// assign	o_led[2] = frame_led_count[31];
	// assign	o_led = adc_mag;
	// assign	o_led = fil_mag;
	// assign	o_led = pix_mag;

	// clip_leds
	// {{{
	always @(posedge i_clk)
	if (adc_clip_counter != 29'h1f_ff_ff_ff)
		clip_leds <= {(8){adc_clip_counter[23]}};
	else if (fltr_clip_counter != 29'h1f_ff_ff_ff)
		clip_leds <= { 2'b11, {(6){fltr_clip_counter[25]}} };
	else
		clip_leds <= adc_mag;
	// }}}

	assign	o_led = clip_leds;

	// Make Verilator happy
	// {{{
	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, fil_sample[20], fil_sample[8:0],
			pre_frame, adc_ign, video_refresh,
			adc_mag, fil_mag, pix_mag };
	// verilator lint_on  UNUSED		
	// }}}
endmodule
