// This program was cloned from: https://github.com/TinyTapeout/tt-multiplexer
// License: Apache License 2.0

/*
 * tt_gpio.v
 *
 * GPIO block
 *
 * Handles the interface between the actual pad frame and
 * the controller
 *
 * Copyright (c) 2024 Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_gpio #(
	parameter [15:0] CONFIG = 16'h0000
		/* [   15] Analog path select (0=protected, 1=noesd)
		 * [14:13] Output wiring mode
		 *          00 - Output disabled, value 0
		 *          01 - Output disabled, value 1
		 *          10 - Output dynamic
		 *          11 - Output enabled
		 * [   10] gpio_inp_dis
		 * [    9] gpio_ib_mode_sel
		 * [    8] gpio_vtrip_sel
		 * [    7] gpio_slow_sel
		 * [    6] gpio_holdover
		 * [    5] gpio_analog_en
		 * [    4] gpio_analog_sel
		 * [    3] gpio_analog_pol
		 * [ 2: 0] gpio_dm[2:0]
		 */
)(
	// Connection to controller
	inout  wire pad_ana,
	output wire pad_in,
	input  wire pad_out,
	input  wire pad_oeb,

	// Connection to the pad
	input  gpio_in,
	input  gpio_in_h,
	output gpio_out,
	output gpio_oeb,
	output gpio_inp_dis,
	output gpio_ib_mode_sel,
	output gpio_vtrip_sel,
	output gpio_slow_sel,
	output gpio_holdover,
	output gpio_analog_en,
	output gpio_analog_sel,
	output gpio_analog_pol,
	output gpio_dm2,
	output gpio_dm1,
	output gpio_dm0,
	inout  analog_io,
	inout  analog_noesd_io,
	input  gpio_loopback_one,
	input  gpio_loopback_zero
);

	// Wiring
	assign pad_in   = gpio_in;
	assign pad_ana  = CONFIG[15] ? analog_noesd_io : analog_io;
	assign gpio_out = CONFIG[14] ? pad_out : (CONFIG[13] ? gpio_loopback_one : gpio_loopback_zero);
	assign gpio_oeb = CONFIG[14] ? (CONFIG[13] ? gpio_loopback_zero : pad_oeb) : gpio_loopback_one;

	// Tie-Offs
	assign gpio_inp_dis    = CONFIG[10] ? gpio_loopback_one : gpio_loopback_zero;
	assign gpio_ib_mode_sel= CONFIG[ 9] ? gpio_loopback_one : gpio_loopback_zero;
	assign gpio_vtrip_sel  = CONFIG[ 8] ? gpio_loopback_one : gpio_loopback_zero;
	assign gpio_slow_sel   = CONFIG[ 7] ? gpio_loopback_one : gpio_loopback_zero;
	assign gpio_holdover   = CONFIG[ 6] ? gpio_loopback_one : gpio_loopback_zero;
	assign gpio_analog_en  = CONFIG[ 5] ? gpio_loopback_one : gpio_loopback_zero;
	assign gpio_analog_sel = CONFIG[ 4] ? gpio_loopback_one : gpio_loopback_zero;
	assign gpio_analog_pol = CONFIG[ 3] ? gpio_loopback_one : gpio_loopback_zero;
	assign gpio_dm2        = CONFIG[ 2] ? gpio_loopback_one : gpio_loopback_zero;
	assign gpio_dm1        = CONFIG[ 1] ? gpio_loopback_one : gpio_loopback_zero;
	assign gpio_dm0        = CONFIG[ 0] ? gpio_loopback_one : gpio_loopback_zero;

endmodule // tt_gpio

