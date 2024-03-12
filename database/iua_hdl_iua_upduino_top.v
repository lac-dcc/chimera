/*
 * iua_upduino_top.v
 *
 * ice40 USB Analyzer - Top Level for UPduino board
 *
 * Copyright (C) 2008  Sylvain Munaut <tnt@246tNt.com>
 *
 * vim: ts=4 sw=4
 */

`ifdef SIM
`default_nettype none
`endif

module iua_upduino_top (
	// USB input
	input wire usb_dp_pad,
	input wire usb_dn_pad,

	// Serial interface
	output wire uart_tx,
	input  wire uart_rx,

	// Status LEDs
	output wire [2:0] led,

	// External clock
	input wire clk_in
);
	// Signals
	// -------

	// UART lines
	wire uart_tx_i;
	wire uart_rx_i;

	// Clocks / Reset
	wire rst_req;
	reg  rst_in = 1'b0;

	wire clk;
	wire rst;


	// Actual Logic Analyzer
	// ---------------------

	iua_top #(
		.SERIAL_DIV(53)		// 50 MHz / (53+1) = 925926 ~= 921600
	) iua_I (
		.usb_dp_pad(usb_dp_pad),
		.usb_dn_pad(usb_dn_pad),
		.uart_tx(uart_tx_i),
		.uart_rx(uart_rx_i),
		.clk(clk),
		.rst(rst)
	);

	assign uart_rx_i = uart_rx;
	assign uart_tx = uart_tx_i;


	// Clock and Reset generation
	// --------------------------

	iua_sysmgr #(
		// PLL setup to go from 10M to 50M
		.DIVR(4'b0000),			// DIVR =  0
		.DIVF(7'b1001111),		// DIVF = 79
		.DIVQ(3'b100),			// DIVQ =  4
		.FILTER_RANGE(3'b001)	// FILTER_RANGE = 1
	) sysmgr_I (
		.clk_in(clk_in),
		.rst_in(rst_in),
		.clk_out(clk),
		.rst_out(rst)
	);

	always @(posedge clk, posedge rst)
		if (rst)
			rst_in <= 1'b0;
		else
			rst_in <= rst_in | rst_req;

	assign rst_req = 1'b0;	// FIXME


	// Status LEDS
	// -----------

	reg dbg_started;
	reg dbg_uart_tx;
	reg dbg_uart_toggle;
	reg [24:0] dbg_cnt;
	reg [15:0] dbg_running;
	wire [2:0] led_ctrl;

	// Status bit
	always @(posedge clk)
		if (rst)
			dbg_started <= 1'b0;
		else if (clk)
			dbg_started <= 1'b1;

	// Status counter
	always @(posedge clk)
		if (rst)
			dbg_cnt <= 0;
		else if (clk)
			dbg_cnt <= dbg_cnt + 1;

	// Detect data is flowing
	always @(posedge clk)
	begin
		dbg_uart_tx <= uart_tx_i;
		dbg_uart_toggle <= uart_tx_i ^ dbg_uart_tx;
	end

	always @(posedge clk)
		if (rst)
			dbg_running <= 0;
		else
			dbg_running <= dbg_uart_toggle ? 16'hffff : (dbg_running - dbg_running[15]);

	// Monitoring
	assign led_ctrl[0] = dbg_started     & (dbg_cnt[1:0] == 2'b00);
	assign led_ctrl[1] = dbg_running[15] & (dbg_cnt[1:0] == 2'b00) & dbg_cnt[24];
	assign led_ctrl[2] = rst | rst_in;

	// Hardware LED driver
	SB_RGBA_DRV #(
		.CURRENT_MODE("0b1"),
		.RGB0_CURRENT("0b000001"),
		.RGB1_CURRENT("0b000001"),
		.RGB2_CURRENT("0b000001")
	) led_I (
		.RGBLEDEN(1'b1),
		.RGB0PWM(led_ctrl[0]),
		.RGB1PWM(led_ctrl[1]),
		.RGB2PWM(led_ctrl[2]),
		.CURREN(1'b1),
		.RGB0(led[0]),	// Green
		.RGB1(led[1]),	// Blue
		.RGB2(led[2])	// Red
	);

endmodule // iua_top
