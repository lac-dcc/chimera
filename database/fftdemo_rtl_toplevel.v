////////////////////////////////////////////////////////////////////////////////
//
// Filename:	./rtl/toplevel.v
// {{{
// Project:	FFT-DEMO, a verilator-based spectrogram display project
//
// Purpose:	This is the "top-level" of the implementable design (HDMI+DDR).
//		It's also the one file that doesn't get simulated with
//	Verilator, so it contains Xilinx only (unsimulatable) primitives
//	within it.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2017-2024, Gisselquist Technology, LLC
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
//
// Here we declare our toplevel.v (toplevel) design module.
// All design logic must take place beneath this top level.
//
// The port declarations just copy data from the @TOP.PORTLIST
// key, or equivalently from the @MAIN.PORTLIST key if
// @TOP.PORTLIST is absent.  For those peripherals that don't need
// any top level logic, the @MAIN.PORTLIST should be sufficent,
// so the @TOP.PORTLIST key may be left undefined.
// }}}
module	toplevel(i_clk,
		// SDRAM I/O port wires
		ddr3_ck_p, ddr3_ck_n,
		ddr3_reset_n, ddr3_cke,
		ddr3_ras_n, ddr3_cas_n, ddr3_we_n,
		ddr3_ba, ddr3_addr, ddr3_odt, ddr3_dm,
		ddr3_dqs_p, ddr3_dqs_n,
		ddr3_dq,
		// i_cpu_resetn,
		//
		// HDMI output clock
		o_hdmi_out_clk_n, o_hdmi_out_clk_p,
		// HDMI output pixels
		o_hdmi_out_p, o_hdmi_out_n,
		//
		// Extra HDMI wires
		io_hdmi_out_cec,
		i_hdmi_out_hpd_n,
		io_hdmi_out_scl,
		io_hdmi_out_sda,
		// The PMic3 microphone wires
		o_mic_csn, o_mic_sck, i_mic_din,
		//
		o_led);
	//
	// Declaring our input and output ports.  We listed these above,
	// now we are declaring them here.
	//
	// These declarations just copy data from the @TOP.IODECLS key,
	// or from the @MAIN.IODECL key if @TOP.IODECL is absent.  For
	// those peripherals that don't do anything at the top level,
	// the @MAIN.IODECL key should be sufficient, so the @TOP.IODECL
	// key may be left undefined.
	//
	input	wire		i_clk;
	// I/O declarations for the SDRAM
	output	wire	ddr3_ck_p, ddr3_ck_n, ddr3_reset_n, ddr3_cke,
		ddr3_ras_n, ddr3_cas_n, ddr3_we_n;
	output	wire	[2:0]	ddr3_ba;
	output	wire	[14:0]	ddr3_addr;
	output	wire	[0:0]	ddr3_odt;
	output	wire	[1:0]	ddr3_dm;
	inout	wire	[1:0]	ddr3_dqs_p, ddr3_dqs_n;
	inout	wire	[15:0]	ddr3_dq;
	// input	wire		i_cpu_resetn;
	// HDMI output clock
	output	wire		o_hdmi_out_clk_n, o_hdmi_out_clk_p;
	// HDMI output pixels
	output	wire [2:0]	o_hdmi_out_p, o_hdmi_out_n;
	// PMod MIC3
	output	wire		o_mic_csn, o_mic_sck;
	input	wire		i_mic_din;
	output	wire	[7:0]	o_led;

	output	wire	io_hdmi_out_cec;
	input	wire	i_hdmi_out_hpd_n;
	output	wire	io_hdmi_out_scl, io_hdmi_out_sda;

	assign	{ io_hdmi_out_scl, io_hdmi_out_sda, io_hdmi_out_cec } = 3'h7;

	//
	// Declaring component data, internal wires and registers
	//
	// These declarations just copy data from the @TOP.DEFNS key
	// within the component data files.
	//
	// Wires necessary to run the SDRAM
	//
	wire	sdram_cyc, sdram_stb, sdram_we,
		sdram_ack, sdram_stall, sdram_err;
	wire	[(25-1):0]	sdram_addr;
	wire	[(32-1):0]	sdram_data,
				sdram_idata;
	wire	[(32/8-1):0]	sdram_sel;

	wire	s_clk, s_reset;

	wire		w_hdmi_out_hsclk; // w_hdmi_out_logic_clk;
	wire	[9:0]	w_hdmi_out_r, w_hdmi_out_g, w_hdmi_out_b;
	// Definitions for the clock generation circuit
	//
	wire	s_clk_200mhz, s_clk_200mhz_unbuffered,
		sysclk_locked, sysclk_feedback;
	//
	wire			w_hdmi_out_en;
	wire			w_hdmi_bypass_sda;
	wire			w_hdmi_bypass_scl;
	wire	[7:0]		w_net_rxd, w_net_txd, w_led;
	assign	w_hdmi_out_en = 1'b1;


	//
	// Time to call the main module within main.v.  Remember, the purpose
	// of the main.v module is to contain all of our portable logic.
	// Things that are Xilinx (or even Altera) specific, or for that
	// matter anything that requires something other than on-off logic,
	// such as the high impedence states required by many wires, is
	// kept in this (toplevel.v) module.  Everything else goes in
	// main.v.
	//
	// We automatically place s_clk, and s_reset here.  You may need
	// to define those above.  (You did, didn't you?)  Other
	// component descriptions come from the keys @TOP.MAIN (if it
	// exists), or @MAIN.PORTLIST if it does not.
	//

	hdmiddr	thedesign(s_clk, s_reset, s_pixclk,
		// The SDRAM interface to an toplevel AXI4 module
		//
		sdram_cyc, sdram_stb, sdram_we,
			sdram_addr, sdram_data, sdram_sel,
			sdram_ack, sdram_stall, sdram_idata, sdram_err,
		// HDMI output ports
		// 10-bit HDMI output pixels, set within the main module
		w_hdmi_out_r, w_hdmi_out_g, w_hdmi_out_b,
		// The PMic3 microphone wires
		o_mic_csn, o_mic_sck, i_mic_din,
		w_led);


	//
	//	DDR3 SDRAM
	//
	wire	[31:0]	sdram_debug;
	wire	i_clk_buffered;

	// Synchronous reset
	reg	r_reset;
	initial	r_reset = 1'b1;
	always @(posedge i_clk_buffered)
		r_reset <= 1'b0;

	BUFG sdramclkbufi(.I(i_clk), .O(i_clk_buffered));

	migsdram #(.AXIDWIDTH(5), .WBDATAWIDTH(32),
			.DDRWIDTH(16),
			.RAMABITS(29)) sdrami(
		.i_clk(i_clk_buffered),
		.i_clk_200mhz(s_clk_200mhz),
		.o_sys_clk(s_clk),
		.i_rst(r_reset),
		.o_sys_reset(s_reset),
		.i_wb_cyc(sdram_cyc),
		.i_wb_stb(sdram_stb),
		.i_wb_we(sdram_we),
		.i_wb_addr(sdram_addr),
		.i_wb_data(sdram_data),
		.i_wb_sel(sdram_sel),
		.o_wb_ack(sdram_ack),
		.o_wb_stall(sdram_stall),
		.o_wb_data(sdram_idata),
		.o_wb_err(sdram_err),
		.o_ddr_ck_p(ddr3_ck_p),
		.o_ddr_ck_n(ddr3_ck_n),
		.o_ddr_reset_n(ddr3_reset_n),
		.o_ddr_cke(ddr3_cke),
		// .o_ddr_cs_n(ddr3_cs_n),
		.o_ddr_ras_n(ddr3_ras_n),
		.o_ddr_cas_n(ddr3_cas_n),
		.o_ddr_we_n(ddr3_we_n),
		.o_ddr_ba(ddr3_ba),
		.o_ddr_addr(ddr3_addr),
		.o_ddr_odt(ddr3_odt),
		.o_ddr_dm(ddr3_dm),
		.io_ddr_dqs_p(ddr3_dqs_p),
		.io_ddr_dqs_n(ddr3_dqs_n),
		.io_ddr_data(ddr3_dq)
		// , .o_ram_dbg(sdram_debug)
		);

	xhdmiout #(.BITREVERSE(1'b0)) ohdmick(s_pixclk, s_pixclkx10,
			w_hdmi_out_en,
			10'h3e0, { o_hdmi_out_clk_p, o_hdmi_out_clk_n });
	xhdmiout #(.BITREVERSE(1'b0)) ohdmir(s_pixclk, s_pixclkx10,
			w_hdmi_out_en,
			w_hdmi_out_r, { o_hdmi_out_p[2], o_hdmi_out_n[2] });
	xhdmiout #(.BITREVERSE(1'b0)) ohdmig(s_pixclk, s_pixclkx10,
			w_hdmi_out_en,
			w_hdmi_out_g, { o_hdmi_out_p[1], o_hdmi_out_n[1] });
	xhdmiout #(.BITREVERSE(1'b0)) ohdmib(s_pixclk, s_pixclkx10,
			w_hdmi_out_en,
			w_hdmi_out_b, { o_hdmi_out_p[0], o_hdmi_out_n[0] });

	wire	s_pixclk,    s_pixclk_unbuffered,
		s_pixclkx10, s_pixclkx10_unbuffered,
		sysclk_feedback_unbuffered;

	// But ... the delay controller requires a 200 MHz reference clock,
	// so ... let's create one
	PLLE2_BASE #(
		.CLKFBOUT_MULT(8),
		.CLKFBOUT_PHASE(0.0),
		.CLKIN1_PERIOD(10),
		.CLKOUT0_DIVIDE(4),
		.CLKOUT1_DIVIDE(20),
		.CLKOUT2_DIVIDE(2)) gen_clocks(
			.CLKIN1(i_clk),				// 100 MHz
			.CLKOUT0(s_clk_200mhz_unbuffered),	// 200 MHz
			.CLKOUT1(s_pixclk_unbuffered),		//  40 MHz
			.CLKOUT2(s_pixclkx10_unbuffered),	// 400 MHz
			.PWRDWN(1'b0), .RST(1'b0),
			.CLKFBOUT(sysclk_feedback_unbuffered),
			.CLKFBIN(sysclk_feedback),
			.LOCKED(sysclk_locked));

	BUFG	sysbuf(.I(s_clk_200mhz_unbuffered),.O(s_clk_200mhz));
	BUFG	pixbuf(.I(s_pixclk_unbuffered),    .O(s_pixclk));
	BUFG	pix10x(.I(s_pixclkx10_unbuffered), .O(s_pixclkx10));
	BUFG	buffb(.I(sysclk_feedback_unbuffered), .O(sysclk_feedback));

	assign	o_led = (i_hdmi_out_hpd_n) ? 8'hff : w_led;

endmodule // end of toplevel.v module definition
