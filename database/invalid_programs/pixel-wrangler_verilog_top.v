/*
 * Top-level interface for the Pixel Wrangler
 *
 * You should define a module display and include
 * this file to do all of the hardware setup.
 */
`default_nettype none
`include "tmds.v"
`include "hdmi.v"
`include "uart.v"
`include "i2c.v"
`include "pwm.v"
`include "util.v"

`ifndef WRANGLER_NO_HDMI
`define WRANGLER_HDMI
`endif
`ifndef WRANGLER_NO_GPIO
`define WRANGLER_GPIO
`endif

`ifdef WRANGLER_UART_TX
`define WRANGLER_UART
`endif

/*
 * You do not need to instantiate all of these interfaces!
 * These are the ones that are provided by the top module
 * and wrap the underlying HDMI decoder, USB port and gpio pins.
 */
/*
module display(
	input clk_48mhz,
	input clk, // system clock, probably 12 or 24 Mhz

	// Streaming HDMI interface (in 25 MHz hdmi_clk domain)
	input hdmi_clk,
	input hdmi_valid,
	input vsync,
	input hsync,
	input rgb_valid,
	input [7:0] r,
	input [7:0] g,
	input [7:0] b,
	input [11:0] xaddr,
	input [11:0] yaddr,

	// GPIO banks for output
	output [7:0] gpio_bank_0,
	output [7:0] gpio_bank_1,

	// USB interface tristate
	output usb_pullup,
	output usb_out_enable,
	output [1:0] usb_out,
	input [1:0] usb_in,

	input uart_txd_ready,
	output uart_txd_strobe,
	output [7:0] uart_txd,
	input uart_rxd_strobe,
	input [7:0] uart_rxd,

	// user switch
	input sw1,

	// RGB led on the board with PWM
	output [7:0] led_r,
	output [7:0] led_g,
	output [7:0] led_b,

	// SPI flash (be careful not to overwrite the boot loader!)
	output spi_cs,
	output spi_clk,
	output spi_do,
	input spi_di
);
*/

module top(
	output spi_cs,
	output led_r,
	output led_g,
	output led_b,

	//inout hdmi_sda, // OOPS conflicts with tmds clk
	input hdmi_scl,

	input tmds_d0n, // need to invert
	input tmds_d1n, // need to invert
	input tmds_d2p,
	input tmds_clkp,

	output gpio_0_0,
	output gpio_0_1,
	output gpio_0_2,
	output gpio_0_3,
	output gpio_0_4,
	output gpio_0_5,
	output gpio_0_6,
	//output gpio_0_7,
	inout gpio_0_7, // temporarily bodged to hdmi_sda

	output gpio_1_0,
	output gpio_1_1,
	output gpio_1_2,
	output gpio_1_3,
	output gpio_1_4,
	output gpio_1_5,
	output gpio_1_6,
	output gpio_1_7,

	input sw1
);
	assign spi_cs = 1; // it is necessary to turn off the SPI flash chip
	//reg led_r, led_g, led_b;

	reg reset = 0;
	wire clk_48mhz;
	SB_HFOSC inthosc(.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk_48mhz));

	reg [3:0] clk_div;
	wire clk = clk_div[2];
	always @(posedge clk_48mhz)
		clk_div <= clk_div + 1;

	wire hdmi_clk;
	wire hdmi_locked;
	reg valid;

`ifdef WRANGLER_LED
	/*
	 * builtin RGB LED
	 */
	wire [7:0] bright_r;
	wire [7:0] bright_g;
	wire [7:0] bright_b;

	rgb_drv rgb_drv_i(
		.clk(clk_48mhz),
		.enable(1'b1),
		.out({led_r,led_g,led_b}),
		.bright_r(bright_r),
		.bright_g(bright_g),
		.bright_b(bright_b)
	);
`else
	// turn off the LEDs
	assign led_r = 1;
	assign led_g = 1;
	assign led_b = 1;
`endif

	wire sw1_in;
	tristate #(.PULLUP(1)) sw1_buffer(
		.pin(sw1),
		.enable(0),
		.data_in(sw1_in),
		.data_out(1'b0)
	);

`ifdef WRANGLER_UART
	// serial port interface
	// TODO: replace with USB serial port
	wire uart_txd_strobe;
	wire uart_txd_ready;
	wire [7:0] uart_txd;

	wire uart_rxd_strobe;
	wire [7:0] uart_rxd;

	uart uart_i(
		.clk_48mhz(clk_48mhz),
		.clk(clk),
		.reset(reset),
		.serial_txd(`WRANGLER_UART_TX),
		.uart_txd(uart_txd),
		.uart_txd_strobe(uart_txd_strobe),
		.uart_rxd(`WRANGLER_UART_RX),
		.uart_rxd_strobe(uart_rxd_strobe)
	);
`endif

`ifdef WRANGLER_HDMI
	/*
	 * HDMI and TMDS decoders with streaming interface
	 * optional but why are you using this otherwise?
	 */
	wire hdmi_clk;
	wire hdmi_bit_clk;
	wire hdmi_valid;
	wire hdmi_locked;

	wire data_valid;
	wire [7:0] d0;
	wire [7:0] d1;
	wire [7:0] d2;

	wire [1:0] hdmi_sync;
	wire hsync, vsync;
	wire rgb_valid;
	wire [7:0] r;
	wire [7:0] g;
	wire [7:0] b;
	wire [11:0] hdmi_xaddr;
	wire [11:0] hdmi_yaddr;

	// need to expose this reset to the user?
	wire user_hdmi_reset;
	reg hdmi_reset = 0;
	reg [20:0] invalid_counter = 0;
	always @(posedge clk)
	begin
		if (!hdmi_valid)
			invalid_counter <= invalid_counter + 1;
		else
			invalid_counter <= invalid_counter == 0 ? 0 : invalid_counter - 1;

		hdmi_reset <= invalid_counter[20] || user_hdmi_reset;
	end

	tmds_decoder #(
		.INVERT(3'b011)
	) tmds_decoder_i(
		.reset(hdmi_reset),

		// physical inputs
		.clk_p(tmds_clkp),
		.d0_p(tmds_d0n),
		.d1_p(tmds_d1n),
		.d2_p(tmds_d2p),

		// outputs
		.hdmi_clk(hdmi_clk),
		.bit_clk(hdmi_bit_clk),
		.hdmi_valid(hdmi_valid),
		.hdmi_locked(hdmi_locked),
		.sync(hdmi_sync),
		.d0(d0),
		.d1(d1),
		.d2(d2),
		.data_valid(data_valid)
	);

	hdmi_stream hdmi_s(
		// inputs
		.hdmi_clk(hdmi_clk),
		.valid(hdmi_valid),
		.sync(hdmi_sync),
		.d0(d0),
		.d1(d1),
		.d2(d2),
		// outputs
		.xaddr(hdmi_xaddr),
		.yaddr(hdmi_yaddr),
		.vsync(vsync),
		.hsync(hsync),
		.rgb_valid(rgb_valid),
		.r(r),
		.g(g),
		.b(b)
	);
`endif
	reg [7:0] vsync_count;
	reg last_vsync;
	always @(posedge hdmi_clk)
	begin
		if (last_vsync && !vsync)
			vsync_count <= vsync_count + 1;
		last_vsync <= vsync;
	end

	// instantiate whatever display module included us
	display display_(
		.clk_48mhz(clk_48mhz),
		.clk(clk),

`ifdef WRANGLER_HDMI
		// Streaming HDMI interface (in 25 MHz hdmi_clk domain)
		.hdmi_clk(hdmi_clk),
		.hdmi_bit_clk(hdmi_bit_clk),
		.hdmi_valid(hdmi_valid),
		.hdmi_reset(user_hdmi_reset),
		.vsync(vsync),
		.hsync(hsync),
		.rgb_valid(rgb_valid),
		.r(r),
		.g(g),
		.b(b),
		//.g(hdmi_yaddr[7:0] + vsync_count),
		//.b(hdmi_xaddr[7:0] + vsync_count),
		.hdmi_xaddr(hdmi_xaddr),
		.hdmi_yaddr(hdmi_yaddr),
`endif

`ifdef WRANGLER_GPIO
	// GPIO banks for output
		.gpio_bank_0({
			gpio_0_0,
			gpio_0_1,
			gpio_0_2,
			gpio_0_3,
			gpio_0_4,
			gpio_0_5,
			gpio_0_6,
			gpio_0_7
		}),

		.gpio_bank_1({
			gpio_1_7,
			gpio_1_6,
			gpio_1_5,
			gpio_1_4,
			gpio_1_3,
			gpio_1_2,
			gpio_1_1,
			gpio_1_0
		}),
`endif

`ifdef WRANGLER_USB
	// USB interface tristate
	//output usb_pullup,
	//output usb_out_enable,
	//output [1:0] usb_out,
	//input [1:0] usb_in,
`endif

`ifdef WRANGLER_UART
		// serial interface (for now)
		.uart_txd(uart_txd),
		.uart_txd_strobe(uart_txd_strobe),
		.uart_txd_ready(uart_txd_ready),
		.uart_rxd(uart_rxd),
		.uart_rxd_strobe(uart_rxd_strobe),
`endif

`ifdef WRANGLER_SWITCH
	// user switch
		.sw1(sw1_in),
`endif

`ifdef WRANGLER_LED
		// RGB led on the board with PWM
		.led_r(bright_r),
		.led_g(bright_g),
		.led_b(bright_b),
`endif

	// SPI flash (be careful not to overwrite the boot loader!)
`ifdef WRANGLER_SPI
		.spi_cs(spi_cs),
		.spi_clk(spi_clk),
		.spi_do(spi_do),
		.spi_di(spi_di),
`endif
	);


	// EDID interface is not yet exposed to the user
	wire sda_out;
	wire sda_in;
	wire sda_enable;

	tristate sda_buffer(
		//.pin(hdmi_sda),
		.pin(gpio_0_7),
		.enable(sda_enable),
		.data_out(sda_out),
		.data_in(sda_in)
	);
	reg [7:0] edid[0:255];
	reg [7:0] edid_data;
	wire [7:0] edid_read_addr;
	initial $readmemh("edid.hex", edid);

	i2c_device i2c_i(
		.clk(clk),
		.reset(reset),
		.scl_in(hdmi_scl),
		.sda_in(sda_in),
		.sda_out(sda_out),
		.sda_enable(sda_enable),

		// we only implement reads
		.data_addr(edid_read_addr),
		.rd_data(edid[edid_read_addr])
	);
endmodule

