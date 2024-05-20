// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
`define OPENFRAME_IO_PADS 44

/*
 *-------------------------------------------------------------
 *
 * openframe_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user openframe project.
 *
 * Written by Tim Edwards
 * March 27, 2023
 * Efabless Corporation
 *
 *-------------------------------------------------------------
 */

module openframe_project_wrapper (
`ifdef USE_POWER_PINS
    inout vdda,		// User area 0 3.3V supply
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa,		// User area 0 analog ground
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd,		// Common 1.8V supply
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd,		// Common digital ground
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    /* Signals exported from the frame area to the user project */
    /* The user may elect to use any of these inputs.		*/

    input	 porb_h,	// power-on reset, sense inverted, 3.3V domain
    input	 porb_l,	// power-on reset, sense inverted, 1.8V domain
    input	 por_l,		// power-on reset, noninverted, 1.8V domain
    input	 resetb_h,	// master reset, sense inverted, 3.3V domain
    input	 resetb_l,	// master reset, sense inverted, 1.8V domain
    input [31:0] mask_rev,	// 32-bit user ID, 1.8V domain

    /* GPIOs.  There are 44 GPIOs (19 left, 19 right, 6 bottom). */
    /* These must be configured appropriately by the user project. */

    /* Basic bidirectional I/O.  Input gpio_in_h is in the 3.3V domain;  all
     * others are in the 1.8v domain.  OEB is output enable, sense inverted.
     */
    input  [`OPENFRAME_IO_PADS-1:0] gpio_in,
    input  [`OPENFRAME_IO_PADS-1:0] gpio_in_h,
    output [`OPENFRAME_IO_PADS-1:0] gpio_out,
    output [`OPENFRAME_IO_PADS-1:0] gpio_oeb,
    output [`OPENFRAME_IO_PADS-1:0] gpio_inp_dis,	// a.k.a. ieb

    /* Pad configuration.  These signals are usually static values.
     * See the documentation for the sky130_fd_io__gpiov2 cell signals
     * and their use.
     */
    output [`OPENFRAME_IO_PADS-1:0] gpio_ib_mode_sel,
    output [`OPENFRAME_IO_PADS-1:0] gpio_vtrip_sel,
    output [`OPENFRAME_IO_PADS-1:0] gpio_slow_sel,
    output [`OPENFRAME_IO_PADS-1:0] gpio_holdover,
    output [`OPENFRAME_IO_PADS-1:0] gpio_analog_en,
    output [`OPENFRAME_IO_PADS-1:0] gpio_analog_sel,
    output [`OPENFRAME_IO_PADS-1:0] gpio_analog_pol,
    output [`OPENFRAME_IO_PADS-1:0] gpio_dm2,
    output [`OPENFRAME_IO_PADS-1:0] gpio_dm1,
    output [`OPENFRAME_IO_PADS-1:0] gpio_dm0,

    /* These signals correct directly to the pad.  Pads using analog I/O
     * connections should keep the digital input and output buffers turned
     * off.  Both signals connect to the same pad.  The "noesd" signal
     * is a direct connection to the pad;  the other signal connects through
     * a series resistor which gives it minimal ESD protection.  Both signals
     * have basic over- and under-voltage protection at the pad.  These
     * signals may be expected to attenuate heavily above 50MHz.
     */
    inout  [`OPENFRAME_IO_PADS-1:0] analog_io,
    inout  [`OPENFRAME_IO_PADS-1:0] analog_noesd_io,

    /* These signals are constant one and zero in the 1.8V domain, one for
     * each GPIO pad, and can be looped back to the control signals on the
     * same GPIO pad to set a static configuration at power-up.
     */
    input  [`OPENFRAME_IO_PADS-1:0] gpio_loopback_one,
    input  [`OPENFRAME_IO_PADS-1:0] gpio_loopback_zero
);

	// Signals
	// -------

	wire k_zero;
	wire k_one;

	wire [`OPENFRAME_IO_PADS-1:0] pad_in;
	wire [`OPENFRAME_IO_PADS-1:0] pad_out;
	wire [`OPENFRAME_IO_PADS-1:0] pad_oeb;
	wire [`OPENFRAME_IO_PADS-1:0] pad_ana;


	// Main core
	// ---------

	tt_top top_I (
`ifdef USE_POWER_PINS
		.VPWR        (vccd1),
		.VGND        (vssd1),
`endif
		.io_ana      (pad_ana),
		.io_in       (pad_in),
		.io_out      (pad_out),
		.io_oeb      (pad_oeb),
		.k_zero      (k_zero),
		.k_one       (k_one)
	);


	// GPIO configuration
	// ------------------

	localparam [15:0] TT_PAD_CTRL   = 16'b0_00_00_0_0_0_0_0_0_0_0_001;
	localparam [15:0] TT_PAD_IN     = 16'b0_00_00_0_0_0_0_0_0_0_0_001;
	localparam [15:0] TT_PAD_OUT    = 16'b0_11_00_1_0_0_0_0_0_0_0_110;
	localparam [15:0] TT_PAD_INOUT  = 16'b0_10_00_0_0_0_0_0_0_0_0_110;
	localparam [15:0] TT_PAD_ANALOG = 16'b1_00_00_1_0_0_0_0_0_0_0_000;
	//                                    | |     | | | | | | | |  |
	// [   15] Analog path select --------' |     | | | | | | | |  |
	// [14:13] Output wiring mode ----------'     | | | | | | | |  |
	// [   10] gpio_inp_dis       ----------------' | | | | | | |  |
	// [    9] gpio_ib_mode_sel   ------------------' | | | | | |  |
	// [    8] gpio_vtrip_sel     --------------------' | | | | |  |
	// [    7] gpio_slow_sel      ----------------------' | | | |  |
	// [    6] gpio_holdover      ------------------------' | | |  |
	// [    5] gpio_analog_en     --------------------------' | |  |
	// [    4] gpio_analog_sel    ----------------------------' |  |
	// [    3] gpio_analog_pol    ------------------------------'  |
	// [ 2: 0] gpio_dm[2:0]       ---------------------------------'

	localparam [(`OPENFRAME_IO_PADS*16)-1:0] CONFIG = {
		TT_PAD_CTRL,	// 43 - ctrl[5]
		TT_PAD_CTRL,	// 42 - ctrl[4]
		TT_PAD_CTRL,	// 41 - ctrl[3]
		TT_PAD_CTRL,	// 40 - ctrl[2] ctrl_sel_rst_n
		TT_PAD_CTRL,	// 39 - ctrl[1] ctrl_sel_inc
		TT_PAD_CTRL,	// 38 - ctrl[0] ctrl_ena
		TT_PAD_ANALOG,	// 37 - usr_ana[11]
		TT_PAD_ANALOG,	// 36 - usr_ana[10]
		TT_PAD_ANALOG,	// 35 - usr_ana[9]
		TT_PAD_ANALOG,	// 34 - usr_ana[8]
		TT_PAD_ANALOG,	// 33 - usr_ana[7]
		TT_PAD_ANALOG,	// 32 - usr_ana[6]
		TT_PAD_OUT,		// 31 - usr_out[7]
		TT_PAD_OUT,		// 30 - usr_out[6]
		TT_PAD_OUT,		// 29 - usr_out[5]
		TT_PAD_OUT,		// 28 - usr_out[4]
		TT_PAD_OUT,		// 27 - usr_out[3]
		TT_PAD_OUT,		// 26 - usr_out[2]
		TT_PAD_OUT,		// 25 - usr_out[1]
		TT_PAD_OUT,		// 24 - usr_out[0]
		TT_PAD_INOUT,	// 23 - usr_io[7]
		TT_PAD_INOUT,	// 22 - usr_io[6]
		TT_PAD_INOUT,	// 21 - usr_io[5]
		TT_PAD_INOUT,	// 20 - usr_io[4]
		TT_PAD_INOUT,	// 19 - usr_io[3]
		TT_PAD_INOUT,	// 18 - usr_io[2]
		TT_PAD_INOUT,	// 17 - usr_io[1]
		TT_PAD_INOUT,	// 16 - usr_io[0]
		TT_PAD_IN,		// 15 - usr_rst
		TT_PAD_IN,		// 14 - usr_clk
		TT_PAD_IN,		// 13 - usr_in[7]
		TT_PAD_ANALOG,	// 12 - usr_ana[5]
		TT_PAD_ANALOG,	// 11 - usr_ana[4]
		TT_PAD_ANALOG,	// 10 - usr_ana[3]
		TT_PAD_ANALOG,	// 9  - usr_ana[2]
		TT_PAD_ANALOG,	// 8  - usr_ana[1]
		TT_PAD_ANALOG,	// 7  - usr_ana[0]
		TT_PAD_IN,		// 6  - usr_in[6]
		TT_PAD_IN,		// 5  - usr_in[5]
		TT_PAD_IN,		// 4  - usr_in[4]
		TT_PAD_IN,		// 3  - usr_in[3]
		TT_PAD_IN,		// 2  - usr_in[2]
		TT_PAD_IN,		// 1  - usr_in[1]
		TT_PAD_IN		// 0  - usr_in[0]
	};

	genvar i;
	for (i=0; i<`OPENFRAME_IO_PADS; i=i+1)
	begin : gpio
		tt_gpio #(
			.CONFIG(CONFIG[16*i+:16])
		) gpio_I (
			.pad_ana             (pad_ana[i]),
			.pad_in              (pad_in[i]),
			.pad_out             (pad_out[i]),
			.pad_oeb             (pad_oeb[i]),
			.gpio_in             (gpio_in[i]),
			.gpio_in_h           (gpio_in_h[i]),
			.gpio_out            (gpio_out[i]),
			.gpio_oeb            (gpio_oeb[i]),
			.gpio_inp_dis        (gpio_inp_dis[i]),
			.gpio_ib_mode_sel    (gpio_ib_mode_sel[i]),
			.gpio_vtrip_sel      (gpio_vtrip_sel[i]),
			.gpio_slow_sel       (gpio_slow_sel[i]),
			.gpio_holdover       (gpio_holdover[i]),
			.gpio_analog_en      (gpio_analog_en[i]),
			.gpio_analog_sel     (gpio_analog_sel[i]),
			.gpio_analog_pol     (gpio_analog_pol[i]),
			.gpio_dm2            (gpio_dm2[i]),
			.gpio_dm1            (gpio_dm1[i]),
			.gpio_dm0            (gpio_dm0[i]),
			.analog_io           (analog_io[i]),
			.analog_noesd_io     (analog_noesd_io[i]),
			.gpio_loopback_one   (gpio_loopback_one[i]),
			.gpio_loopback_zero  (gpio_loopback_zero[i])
		);
	end

endmodule	// openframe_project_wrapper
