`include "util.v"
`include "usb_uart.v"
`include "oled.v"

/*
 * Connect a WEH001602A OLED Character 16x2 to the TinyFPGA
 *
 *  1 Gnd
 *  2 Vcc (3.3v)
 *  3 NC
 *  4 RS
 *  5 R/!W
 *  6 E
 *  7 DB0
 *  8 DB1
 *  9 DB2
 * 10 DB3
 * 11 DB4
 * 12 DB5
 * 13 DB6
 * 14 DB7
 * 15 NC (button?)
 * 16 NC (button?)
 *
 * Write mode timing should be fine for a 6 Mhz clock:
 *
 * Tc	Enable Cycle Time (E) 1200 ns (0.8 mhz)
 * Tpw 	Enable Pulse Width (E) 140 ns (7 mhz)
 * Tas	Address setup time RS/RW/E 0ns
 * Tah	Address hold times RS/RW/E 10 ns (100 mhz)
 * Tdsw	Data setup time DB0-DB8 40 ns (50 mhz)
 * Th	Data hold time DB0-DB7 10 ns (100 mhz)
 */
module top(
	input pin_clk,
	output pin_led,

	// physical layer
	inout  pin_usbp,
	inout  pin_usbn,
	output pin_pu,

	output pin_1, // rs
	output pin_2, // r
	output pin_3, // e
	inout  pin_4, // db0
	inout  pin_5, // db1
	inout  pin_6, // db2
	inout  pin_7, // db3
	inout  pin_8, // db4
	inout  pin_9, // db5
	inout  pin_10, // db6
	inout  pin_11 // db7
);
	wire clk_48mhz, locked;
	wire reset;
	pll pll_inst(pin_clk, clk_48mhz, locked);

	// generate a 2 MHz clock from the 16 MHz input
	wire clk_24mhz, clk_12mhz, clk_6mhz, clk_3mhz, clk_1mhz;
	wire clk_500khz, clk_250khz, clk_100khz;
	always @(posedge clk_48mhz) clk_24mhz = !clk_24mhz;
	always @(posedge clk_24mhz) clk_12mhz = !clk_12mhz;
	always @(posedge clk_12mhz) clk_6mhz = !clk_6mhz;
	always @(posedge clk_6mhz) clk_3mhz = !clk_3mhz;
	always @(posedge clk_3mhz) clk_1mhz = !clk_1mhz;
	always @(posedge clk_1mhz) clk_500khz = !clk_500khz;
	always @(posedge clk_500khz) clk_250khz = !clk_250khz;
	always @(posedge clk_250khz) clk_100khz = !clk_100khz;
	wire clk = clk_24mhz;

	reg [15:0] reset_counter;
	always @(posedge clk) begin
		if (!locked) begin
			reset <= 1;
			reset_counter <= 0;
		end else
		if (&reset_counter) begin
			reset <= 0;
		end else
			reset_counter <= reset_counter + 1;
	end


	// verilog sucks
	parameter ROWS = 80;
	reg [15:0] bitmap[ROWS-1:0];
	initial $readmemh("bitmap.hex", bitmap);

	reg [7:0] rx_offset;
	wire [7:0] row;

	// read data from the serial port into the frame buffer
	reg [7:0] tx_data;
	reg tx_strobe = 0;
	wire [7:0] rx_data;
	wire rx_strobe;

	usb_uart uart(
		.clk(clk),
		.clk_48mhz(clk_48mhz),
		.reset(reset),
		.pin_usbp(pin_usbp),
		.pin_usbn(pin_usbn),
		.pin_pu(pin_pu),
		.rx_data(rx_data),
		.rx_strobe(rx_strobe),
		.tx_data(tx_data),
		.tx_strobe(tx_strobe)
	);

	always @(posedge clk) if (!reset) begin
		if (rx_strobe)
		begin
			pin_led <= !pin_led;;

			if (rx_offset[0])
				bitmap[rx_offset[7:1]][7:0] <= rx_data;
			else
				bitmap[rx_offset[7:1]][15:8] <= rx_data;

			if (rx_offset == 2*ROWS-1)
				rx_offset <= 0;
			else
				rx_offset <= rx_offset + 1;
		end
	end

	oled_graphics #(.ROWS(ROWS)) oled(
		.clk(clk),
		.reset(reset),

		// physical connection
		.rs_pin(pin_1),
		.read_pin(pin_2),
		.enable_pin(pin_3),
		.db_pins({
			pin_11,
			pin_10, 
			pin_9,
			pin_8,
			pin_7,
			pin_6,
			pin_5,
			pin_4
		}),

		.row(row),
		.pixels(bitmap[row]),
	);
endmodule


/**
 * PLL configuration
 *
 * This Verilog module was generated automatically
 * using the icepll tool from the IceStorm project.
 * Use at your own risk.
 *
 * Given input frequency:        16.000 MHz
 * Requested output frequency:   48.000 MHz
 * Achieved output frequency:    48.000 MHz
 */

module pll(
	input  clock_in,
	output clock_out,
	output locked
	);

SB_PLL40_CORE #(
		.FEEDBACK_PATH("SIMPLE"),
		.DIVR(4'b0000),		// DIVR =  0
		.DIVF(7'b0101111),	// DIVF = 47
		.DIVQ(3'b100),		// DIVQ =  4
		.FILTER_RANGE(3'b001)	// FILTER_RANGE = 1
	) uut (
		.LOCK(locked),
		.RESETB(1'b1),
		.BYPASS(1'b0),
		.REFERENCECLK(clock_in),
		.PLLOUTCORE(clock_out)
		);

endmodule
