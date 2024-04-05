/** \file
 * Monitor a flash device and print the addresses read
 *
 * The up5k has 1024 Kb of single ported block RAM.
 * This is can't read/write simultaneously, so it is necessary to
 * mux the read/write pins.
 *
 */
`include "util.v"
`include "uart.v"
`include "spram.v"
`include "spi_device.v"

module top(
	output led_r,
	output led_g,
	output led_b,
	output serial_txd,
	input serial_rxd,
	output spi_cs, // to the onboard flash chip

	// to the 
	input gpio_28,
	input gpio_38,
	input gpio_42,
	input gpio_36,
	output gpio_43 // copy of gpio_36, to pass through the CS
);
	assign spi_cs = 1; // it is necessary to turn off the SPI flash chip

	wire clk_48;
	SB_HFOSC u_hfosc (
		.CLKHFPU(1'b1),
		.CLKHFEN(1'b1),
		.CLKHF(clk_48)
	);

	wire reset = 0;

/*
	reg [31:0] counter;
	always @(posedge clk_48)
		counter <= counter + 1;

	// pulse the green LED to know that we're alive
	wire pwm_g;
	pwm pwm_g_driver(clk_48, 1, pwm_g);
	assign led_g = !(counter[25:23] == 0 && pwm_g);
*/
	assign led_g = 1;


	// generate a 3 MHz/12 MHz serial clock from the 48 MHz clock
	// this is the 3 Mb/s maximum supported by the FTDI chip
	wire clk_1, clk_4;
	divide_by_n #(.N(16)) div1(clk_48, reset, clk_1);
	divide_by_n #(.N( 4)) div4(clk_48, reset, clk_4);

	reg [7:0] uart_txd;
	reg uart_txd_strobe;
	wire uart_txd_ready;

	uart_tx txd(
		.mclk(clk_48),
		.reset(reset),
		.baud_x1(clk_1),
		.serial(serial_txd),
		.ready(uart_txd_ready),
		.data(uart_txd),
		.data_strobe(uart_txd_strobe)
	);

/* this demo doesn't use the serial port
	wire [7:0] uart_rxd;
	wire uart_rxd_strobe;

	uart_rx rxd(
		.mclk(clk_48),
		.reset(reset),
		.baud_x4(clk_4),
		.serial(serial_rxd),
		.data(uart_rxd),
		.data_strobe(uart_rxd_strobe)
	);

	assign debug0 = serial_txd;
*/

	// Emlated 256 bytes of flash ROM
	reg [23:0] read_addr;
	reg [7:0] flash_rom[0:255];
	wire [7:0] flash_data = flash_rom[read_addr[7:0]];

	// initialize the flash_rom
	initial $readmemb("flash.bin", flash_rom);

	// Connect the SPI port to the decoder
	reg spi_tx_strobe;
	wire spi_rx_strobe;
	wire [7:0] spi_rx_data;

/* 35c3 cable:
 * 1 cs on chip		43
 * 2 cs on mainboard	36
 * 3 miso		42
 * 4 !wp
 * 5 gnd		GND
 * 6 mosi		38
 * 7 sck		28
 * 8 !rst
 * 9 vcc
 */

	wire spi_cs_in = gpio_36;

	// copy the incoming CS pin to the outbound CS
	assign gpio_43 = gpio_36;

	spi_device spi0(
		.mclk(clk_48),
		.reset(reset),
		.spi_cs(spi_cs_in),
		.spi_clk(gpio_28),
		.spi_mosi(gpio_38),
		.spi_miso_in(gpio_42),
		//.spi_miso_out(),
		.spi_tx_data(flash_data),
		.spi_tx_strobe(spi_tx_strobe),
		.spi_rx_strobe(spi_rx_strobe),
		.spi_rx_data(spi_rx_data)
	);

	reg [12:0] bytes;
	reg [15:0] serial_out;
	reg do_serial;
	reg do_hex;
	reg spi_cs_buf;
	reg spi_cs_prev;
	reg spi_cs_sync;

	assign led_b = spi_cs_sync; // idles high

	reg read_in_progress;
	// watch for new commands on the SPI bus, print first x bytes
	always @(posedge clk_48)
	begin
		// Double buffer and latch the SPI CS to track edges
		spi_cs_buf <= spi_cs_in;
		spi_cs_prev <= spi_cs_buf;
		spi_cs_sync <= spi_cs_prev;

		// Default is no output from the SPI bus
		do_serial <= 0;
		do_hex <= 0;

		if (reset) begin
			// nothing to do
		end else
		if (!spi_cs_sync && spi_cs_prev) begin
			// falling edge of the CS, reset the transaction
			bytes <= 0;
			if (read_in_progress) begin
				serial_out = "\r\n";
				do_serial <= 1;
			end
			read_in_progress <= 0;
		end else
		if (spi_cs_sync && !spi_cs_prev) begin
			// rising edge of the CS, send newline if we
			// have received a non-zero number of bytes
			read_in_progress <= 0;
		end else
		if (spi_rx_strobe) begin
			// new byte on the wire; print the first four bytes
			// parse the command in the first byte
			if (bytes == 0 && spi_rx_data == 3) begin
				read_in_progress <= 1;
			end else
			if (bytes <= 3 && read_in_progress)
			begin
				read_addr <= { read_addr[15:8], spi_rx_data };
				do_serial <= 1;
				do_hex <= 1;
			end else
			if (read_in_progress)
			begin
				read_addr <= read_addr + 1;
			end

			bytes <= bytes + 1;
		end else begin
/*
			if (read_addr == 24'hFFB880) begin
				// disable flash address overlays
				do_overlay <= 0;
				do_serial <= 1;
				serial_out <= "--";
			end else
			if (read_addr == 24'hFFB800) begin
				// enable overlay
				do_overlay <= 1;
				do_serial <= 1;
				serial_out <= "++";
			end
*/
		end
	end


	reg fifo_read_strobe;
	wire fifo_available;

	fifo_spram_16to8 buffer(
		.clk(clk_48),
		.reset(reset),
		.write_data(do_hex
		  ? { hexdigit(spi_rx_data[7:4]), hexdigit(spi_rx_data[3:0]) }
		  : serial_out),
		.write_strobe(do_serial) ,
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
		&& !do_serial
		&& !uart_txd_strobe
		) begin
			fifo_read_strobe <= 1;
			uart_txd_strobe <= 1;
			led_r <= 0;
		end
	end
endmodule
