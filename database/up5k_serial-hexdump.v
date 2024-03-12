/** \file
 * Print a hexdump of the incoming serial data.
 *
 * The up5k has 1024 Kb of single ported block RAM.
 * This is can't read/write simultaneously, so it is necessary to
 * mux the read/write pins.
 *
 * This tests the 16to8 fifo, which allows us to enqueue two characters
 * at a time into the tx fifo, perfect for hexdumps.
 */
`include "util.v"
`include "uart.v"
`include "spram.v"

module top(
	output led_r,
	output led_g,
	output led_b,
	output serial_txd,
	input serial_rxd,
	output spi_cs,
	output gpio_2,
);
	assign spi_cs = 1; // it is necessary to turn off the SPI flash chip
	wire debug0 = gpio_2;

	wire clk_48;
	wire reset = 0;
	SB_HFOSC u_hfosc (
		.CLKHFPU(1'b1),
		.CLKHFEN(1'b1),
		.CLKHF(clk_48)
	);

	reg [31:0] counter;
	always @(posedge clk_48)
		counter <= counter + 1;

	// pulse the green LED to know that we're alive
	wire pwm_g;
	pwm pwm_g_driver(clk_48, 1, pwm_g);
	assign led_g = !(counter[25:23] == 0 && pwm_g);

	assign led_b = serial_rxd; // idles high

	// generate a 3 MHz/12 MHz serial clock from the 48 MHz clock
	// this is the 3 Mb/s maximum supported by the FTDI chip
	wire clk_1, clk_4;
	divide_by_n #(.N(16)) div1(clk_48, reset, clk_1);
	divide_by_n #(.N( 4)) div4(clk_48, reset, clk_4);

	reg [7:0] uart_txd;
	reg uart_txd_strobe;
	wire uart_txd_ready;

	wire [7:0] uart_rxd;
	wire uart_rxd_strobe;

	uart_tx txd(
		.mclk(clk_48),
		.reset(reset),
		.baud_x1(clk_1),
		.serial(serial_txd),
		.ready(uart_txd_ready),
		.data(uart_txd),
		.data_strobe(uart_txd_strobe)
	);

	uart_rx rxd(
		.mclk(clk_48),
		.reset(reset),
		.baud_x4(clk_4),
		.serial(serial_rxd),
		.data(uart_rxd),
		.data_strobe(uart_rxd_strobe)
	);

	assign debug0 = serial_txd;

	reg fifo_read_strobe;
	wire fifo_available;

	fifo_spram_16to8 buffer(
		.clk(clk_48),
		.reset(reset),
		.write_data({ hexdigit(uart_rxd[7:4]), hexdigit(uart_rxd[3:0]) }),
		.write_strobe(uart_rxd_strobe),
		.data_available(fifo_available),
		.read_data(uart_txd),
		.read_strobe(fifo_read_strobe)
	);

	always @(posedge clk_48) begin
		uart_txd_strobe <= 0;
		fifo_read_strobe <= 0;
		led_r <= 1;

		// single port fifo can't read/write the same cycle
		if (fifo_available
		&&  uart_txd_ready
		&& !uart_rxd_strobe
		&& !uart_txd_strobe
		) begin
			fifo_read_strobe <= 1;
			uart_txd_strobe <= 1;
			led_r <= 0;
		end
	end
endmodule
