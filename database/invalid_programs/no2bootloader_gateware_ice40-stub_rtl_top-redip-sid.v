/*
 * top-redip-sid.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2019-2020  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none
`include "boards.vh"

module top (
	// Shared I2C + Button/LED
	inout  wire scl_led,
	inout  wire sda_btn,

	// USB
	output wire usb_dp,
	output wire usb_dn,
	output wire usb_pu,

	// SPI
	output wire spi_mosi,
	input  wire spi_miso,
	output wire spi_clk,
	output wire spi_cs_n
);

	// FSM
	// ---

	localparam
		ST_START      = 0,
		ST_WAIT       = 1,
		ST_SEL        = 2,
		ST_SEL_WAIT   = 3,
		ST_FLASH_LOCK = 4,
		ST_CODEC_FIX  = 5,
		ST_BOOT       = 6;


	// Signals
	// -------

	// Button input
	wire btn_mux;
	wire btn_iob;
	wire btn_v;
	wire btn_r;
	wire btn_f;

	// FSM
	reg  [2:0] state_nxt;
	reg  [2:0] state;

	// Flash locking
	reg  fl_skip_lock;
	wire fl_go;
	wire fl_rdy;

	// Codec Fix
	wire cf_go;
	wire cf_rdy;

	// Boot selector
	wire boot_now;
	reg  boot_now_r;
	reg  [1:0] boot_sel;

	// Timer/Counter
	reg  [23:0] timer;
	wire timer_tick;
	wire timer_rst;

	// LED signalling
	wire [3:0] led_flash_cnt;
	wire led;

	// Clock / Reset
	wire clk;
	wire rst;


	// Button
	// ------

	glitch_filter #(
		.L(4)
	) btn_flt_I (
		.in  (btn_mux),
		.val (btn_v),
		.rise(btn_r),
		.fall(btn_f),
		.clk (clk),
		.rst (1'b0)	// Ensure the glitch filter has settled
					// before logic here engages
	);


	// State machine
	// -------------

	// Next state logic
	always @(*)
	begin
		// Default is to stay put
		state_nxt = state;

		// Main case
		case (state)
			ST_START:
				// Check for immediate boot
				state_nxt = btn_v ? ST_FLASH_LOCK : ST_WAIT;

			ST_WAIT:
				// Wait for first release
				if (btn_v == 1'b1)
					state_nxt = ST_SEL_WAIT;

			ST_SEL:
				// If button press, temporarily disable it
				if (btn_f)
					state_nxt = ST_SEL_WAIT;

				// Or wait for timeout
				else if (timer_tick)
					state_nxt = fl_skip_lock ? ST_BOOT : ST_FLASH_LOCK;

			ST_SEL_WAIT:
				// Wait for button to re-arm
				if (timer_tick)
					state_nxt = ST_SEL;

			ST_FLASH_LOCK:
				if (fl_rdy)
					state_nxt = ST_CODEC_FIX;

			ST_CODEC_FIX:
				if (cf_rdy)
					state_nxt = ST_BOOT;

			ST_BOOT:
				// Nothing to do ... will reconfigure shortly
				state_nxt = state;
		endcase
	end

	// State register
	always @(posedge clk or posedge rst)
		if (rst)
			state <= ST_START;
		else
			state <= state_nxt;


	// Timer
	// -----

	always @(posedge clk)
		if (timer_rst)
			timer <= 24'h000000;
		else
			timer <= timer + 1;

	assign timer_rst  = (btn_v == 1'b0) | timer_tick;
	assign timer_tick = (state == ST_SEL_WAIT) ? timer[17] : timer[23];


	// Flash locking
	// -------------

	// Keep track if we should lock or not
	always @(posedge clk)
		if (rst)
			fl_skip_lock <= 1'b0;
		else if ((state == ST_SEL) & (boot_sel == 2'b00) & btn_f)
			fl_skip_lock <= 1'b1;

	// Go signal
	assign fl_go = (state != ST_FLASH_LOCK) & (state_nxt == ST_FLASH_LOCK);

	// SPI command
	flash_lock #(
		.LOCK_DATA(`FLASH_LOCK)
	) flash_lock_I (
		.spi_mosi (spi_mosi),
		.spi_miso (spi_miso),
		.spi_clk  (spi_clk),
		.spi_cs_n (spi_cs_n),
		.go       (fl_go),
		.rdy      (fl_rdy),
		.clk      (clk),
		.rst      (rst)
	);


	// Codec Fix
	// ---------
		// (Send I2C command to shutdown the SGTL5000 VDDD regulator
		//  which is backfeeding ~ 1.5V into the 1.2V rail ...)

	// Go signal
	assign cf_go = (state != ST_CODEC_FIX) & (state_nxt == ST_CODEC_FIX);

	// I2C command
	codec_fix fix_I (
		.scl_led (scl_led),
		.sda_btn (sda_btn),
		.btn     (btn_mux),
		.led     (led),
		.go      (cf_go),
		.rdy     (cf_rdy),
		.clk     (clk),
		.rst     (rst)
	);


	// Warm Boot
	// ---------

	// Boot command
	assign boot_now = (state == ST_BOOT);

	always @(posedge clk or posedge rst)
		if (rst)
			boot_now_r <= 1'b0;
		else
			boot_now_r <= boot_now;

	// Image select
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			boot_sel <= 2'b10;	// App 1 Image by default
		else if (state == ST_WAIT)
			boot_sel <= 2'b01;	// DFU Image if in select mode
		else if (state == ST_SEL)
			boot_sel <= boot_sel + btn_f;
	end

	// IP
	SB_WARMBOOT warmboot (
		.BOOT(boot_now_r),
		.S0(boot_sel[0]),
		.S1(boot_sel[1])
	);


	// LED
	// ---

	// Single-LED : Use a flasher
	led_flasher flasher_I (
		.led       (led),
		.flash_cnt (led_flash_cnt),
		.clk       (clk),
		.rst       (rst)
	);

	assign led_flash_cnt = 4'h1 + boot_sel;


	// Dummy USB
	// ---------
	// (to avoid pullups triggering detection)

	SB_IO #(
		.PIN_TYPE(6'b101000),
		.PULLUP(1'b0),
		.IO_STANDARD("SB_LVCMOS")
	) usb[2:0] (
		.PACKAGE_PIN({usb_dp, usb_dn, usb_pu}),
		.OUTPUT_ENABLE(1'b0),
		.D_OUT_0(1'b0)
	);


	// Clock / Reset
	// -------------

	reg [7:0] cnt_reset;

	SB_HFOSC #(
		.CLKHF_DIV("0b10")	// 12 MHz
	) osc_I (
		.CLKHFPU(1'b1),
		.CLKHFEN(1'b1),
		.CLKHF(clk)
	);

	assign rst = ~cnt_reset[7];

	always @(posedge clk)
		if (cnt_reset[7] == 1'b0)
			cnt_reset <= cnt_reset + 1;

endmodule // top
