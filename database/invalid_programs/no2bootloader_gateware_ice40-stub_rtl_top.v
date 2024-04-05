/*
 * top.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2019-2020  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none
`include "boards.vh"

module top (
	// Special features
`ifdef MISC_SEL
	output wire [($bits(`MISC_SEL)/2)-1:0] misc,
`endif

	// LED
`ifdef HAS_1LED
	output wire led,
`endif
`ifdef HAS_2LED
	output wire [1:0] led,
`endif

`ifdef HAS_RGB
	output wire [2:0] rgb,
`endif

	// Button
	input  wire btn,

	// USB
`ifdef HAS_USB
	output wire usb_dp,
	output wire usb_dn,
	output wire usb_pu,
`endif

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
		ST_BOOT       = 5;


	// Signals
	// -------

	// Button input
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

	// Boot selector
	wire boot_now;
	reg  boot_now_r;
	reg  [1:0] boot_sel;

	// Timer/Counter
	reg  [23:0] timer;
	wire timer_tick;
	wire timer_rst;

	// Clock / Reset
	wire clk;
	wire rst;


	// Button
	// ------

	SB_IO #(
		.PIN_TYPE(6'b000000),
		.PULLUP(1'b1),
		.IO_STANDARD("SB_LVCMOS")
	) btn_iob_I (
		.PACKAGE_PIN(btn),
		.INPUT_CLK(clk),
		.D_IN_0(btn_iob)
	);

	glitch_filter #(
		.L(4)
	) btn_flt_I (
		.in  (btn_iob),
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

`ifdef FLASH_LOCK

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

`else

	// Dummy
	assign spi_mosi = 1'b0;
	assign spi_clk  = 1'b0;
	assign spi_cs_n = 1'b1;

	assign fl_rdy = 1'b1;

`endif


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

	// Normal LEDs
		// Single-LED : Use a flasher
`ifdef HAS_1LED
	wire       led_i;
	wire [3:0] led_flash_cnt;

	led_flasher flasher_I (
		.led       (led_i),
		.flash_cnt (led_flash_cnt),
		.clk       (clk),
		.rst       (rst)
	);

	assign led = ~led_i | boot_now;
	assign led_flash_cnt = 4'h1 + boot_sel;
`endif

		// Two-LED : Display directly
`ifdef HAS_2LED
	assign led = ~boot_sel | {2{boot_now}};
`endif

	// RGB LEDs
`ifdef HAS_RGB
		// Signals
	wire [2:0] rgb_pwm;
	wire       dim;
		// Dimming
`ifdef RGB_DIM
	reg  [`RGB_DIM:0] dim_cnt;

	always @(posedge clk)
		if (dim_cnt[`RGB_DIM])
			dim_cnt <= 0;
		else
			dim_cnt <= dim_cnt + 1;

	assign dim = dim_cnt[`RGB_DIM];
`else
	assign dim = 1'b1;
`endif

		// Color
	assign rgb_pwm[0] = dim & ~boot_now & boot_sel[0];
	assign rgb_pwm[1] = dim & ~boot_now & boot_sel[1];
	assign rgb_pwm[2] = dim &  boot_now;

		// Driver
	SB_RGBA_DRV #(
		.CURRENT_MODE(`RGB_CURRENT_MODE),
		.RGB0_CURRENT(`RGB0_CURRENT),
		.RGB1_CURRENT(`RGB1_CURRENT),
		.RGB2_CURRENT(`RGB2_CURRENT)
	) rgb_drv_I (
		.RGBLEDEN(1'b1),
		.RGB0PWM(rgb_pwm[(`RGB_MAP >> 0) & 3]),
		.RGB1PWM(rgb_pwm[(`RGB_MAP >> 4) & 3]),
		.RGB2PWM(rgb_pwm[(`RGB_MAP >> 8) & 3]),
		.CURREN(1'b1),
		.RGB0(rgb[0]),
		.RGB1(rgb[1]),
		.RGB2(rgb[2])
	);
`endif


	// Dummy USB
	// ---------
	// (to avoid pullups triggering detection)

`ifdef HAS_USB
	SB_IO #(
		.PIN_TYPE(6'b101000),
		.PULLUP(1'b0),
		.IO_STANDARD("SB_LVCMOS")
	) usb[2:0] (
		.PACKAGE_PIN({usb_dp, usb_dn, usb_pu}),
		.OUTPUT_ENABLE(1'b0),
		.D_OUT_0(1'b0)
	);
`endif


	// Special features
	// ----------------

	// If the boards needs it, we can tie some pins to
	// High-Z, 50% PDM, High, Low
`ifdef MISC_SEL
	reg        misc_osc = 1'b0;
	wire [3:0] misc_opt;
	wire [$bits(`MISC_SEL)-1:0] misc_sel = `MISC_SEL;

	always @(posedge clk)
		misc_osc <= ~misc_osc;

	assign misc_opt = { 2'b10, misc_osc, 1'bz };

	genvar i;
	generate
		for (i=0; i<$bits(`MISC_SEL); i=i+2)
			assign misc[i/2] = misc_opt[misc_sel[i+:2]];
	endgenerate
`endif


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
