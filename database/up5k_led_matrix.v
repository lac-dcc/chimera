`include "util.v"
`include "uart.v"

module top(
	output serial_txd,
	input serial_rxd,
	output spi_cs,
	output led_r,

	output gpio_26,
	output gpio_27,
	output gpio_32,
	output gpio_35,
	output gpio_31,
	output gpio_37,
	output gpio_34,
	output gpio_43,
	output gpio_36,
	output gpio_42,
	output gpio_38,
	output gpio_28
);
	assign spi_cs = 1; // it is necessary to turn off the SPI flash chip
	reg reset = 0;
	wire clk_48mhz;
	SB_HFOSC osc(1,1, clk_48mhz);
	reg [10:0] counter;
	always @(posedge clk_48mhz) begin
		counter <= counter + 1;
		if (~counter == 0)
			reset <= 0;
	end

	wire clk = clk_48mhz; // counter[0];
	

	wire [2:0] led_addr = {gpio_36, gpio_34, gpio_43};

	reg [7:0] r;
	reg [7:0] g;
	reg [7:0] b;
	reg [7:0] x;
	reg [7:0] y;
	reg input_strobe;
	

	led_matrix matrix(
		.clk(clk),
		.reset(reset),

		// pins
		.led_clk(gpio_38),
		.led_latch(gpio_42),
		.led_oe(gpio_28),
		.led_addr(led_addr),
		.led_r({gpio_35, gpio_27}),
		.led_g({gpio_31, gpio_26}),
		.led_b({gpio_37, gpio_32}),

		//
		.input_clk(clk),
		.strobe(input_strobe),
		.r(r),
		.g(g),
		.b(b),
		.x(x),
		.y(y)
	);

	// generate a 3 MHz/12 MHz serial clock from the 48 MHz clock
	// this is the 3 Mb/s maximum supported by the FTDI chip
	wire clk_4;
	divide_by_n #(.N( 4)) div4(clk_48mhz, reset, clk_4);

	wire [7:0] uart_rxd;
	wire uart_rxd_strobe;
	assign serial_txd = 1;

	uart_rx rxd(
		.mclk(clk),
		.reset(reset),
		.baud_x4(clk_4),
		.serial(serial_rxd),
		.data(uart_rxd),
		.data_strobe(uart_rxd_strobe)
	);

	reg [1:0] channel = 0;

	always @(posedge clk)
	begin
		input_strobe <= 0;
		led_r <= 1;

		if (!uart_rxd_strobe)
		begin
			// nothing
		end else
		if (channel == 0) begin
			if (x != 31)
				x <= x + 1;
			else begin
				x <= 0;
				if (y != 15)
					y <= y + 1;
				else
					y <= 0;
			end

			r <= uart_rxd;
			channel <= 1;
			//led_r <= 0;
		end else
		if (channel == 1) begin
			//led_r <= 0;
			g <= uart_rxd;
			channel <= 2;
		end else
		if (channel == 2) begin
			//led_r <= 0;
			b <= uart_rxd;
			input_strobe <= 1;
			channel <= 0;
		end else begin
			led_r <= 0;
			channel <= 0;
		end
	end

endmodule



/*
 * Max output chains:
 * 8 rgb sets * 8 rows per set = 64 vertical rows
 *
 * Max resolution on a up5k:
 * 30 * 4096 bit dual port block RAM
 * 64 * 64 == 4096 pixels @ 24 bits per pixel
 *
 * Using SPRAM, 4 * 256 Kb
 * 8192 pixels per SPRAM @ 24 bits per pixel
 * 1024 x 64
 *
 * Max update at 1024 == 46 K-rows / sec
 * 5 KHz per row (@ 8 row scan)
 * == 128 levels @ 45 Hz
 */
module led_matrix(
	input clk,
	input reset,

	// physical interface
	output reg led_clk,
	output reg led_latch,
	output reg led_oe,
	output reg [ADDR_WIDTH-1:0] led_addr,
	output reg [ROWS-1:0] led_r,
	output reg [ROWS-1:0] led_g,
	output reg [ROWS-1:0] led_b,

	// input from caller to update a frame buffer
	input input_clk,
	input [7:0] r,
	input [7:0] g,
	input [7:0] b,
	input [7:0] x,
	input [7:0] y,
	input strobe
);
	parameter ROWS = 2;
	parameter ADDR_WIDTH = 3;
	parameter X_RES = 32;
	parameter Y_SHIFT = 5; // CLOG2(X_RES)
	parameter Y_STRIDE = 8; //1 << ADDR_WIDTH;
	parameter Y_RES = ROWS * Y_STRIDE;
	parameter DIM = 0;

	reg [7:0] bright;
	reg [7:0] led_x;
	reg [7:0] led_y;
	reg [7:0] row;
	reg all_rows_done;
	reg all_pixels_done;

	reg [15:0] framebuffer_0[X_RES * Y_RES/2 - 1 : 0];
	reg [15:0] framebuffer_1[X_RES * Y_RES/2 - 1 : 0];

	wire [15:0] pix_0 = (led_y << Y_SHIFT) | led_x;
	wire [15:0] pix_1 = ((led_y+Y_STRIDE) << Y_SHIFT) | led_x;

	reg [7:0] pix_r0;
	reg [7:0] pix_g0;
	reg [7:0] pix_b0;

	reg [7:0] pix_r1;
	reg [7:0] pix_g1;
	reg [7:0] pix_b1;

	always @(posedge clk) begin
		pix_r0 <= framebuffer_0[pix_0][15:11] << 1;
		pix_g0 <= framebuffer_0[pix_0][10:5] << 0;
		pix_b0 <= framebuffer_0[pix_0][4:0] << 1;

		pix_r1 <= framebuffer_1[pix_1][15:11] << 1;
		pix_g1 <= framebuffer_1[pix_1][10:5] << 0;
		pix_b1 <= framebuffer_1[pix_1][4:0] << 1;
	end

	initial $readmemh("packed0.hex", framebuffer_0);
	initial $readmemh("packed1.hex", framebuffer_1);
	//initial $readmemh("blue.hex", framebuffer_b);

	reg stall;

	// output logic
	always @(posedge clk)
	begin
		led_clk <= 0;
		led_latch <= 0;

		if (reset)
		begin
			bright <= 0;
			row <= 0;
			led_addr <= 0;
			led_x <= 0;
			led_y <= 0;
			led_oe <= 1;
			all_rows_done <= 0;
			all_pixels_done <= 0;
		end else
		if (stall) begin
			stall <= 0;
		end else
		if (all_pixels_done)
		begin
			if (bright == 255) begin
				// have done all of the brightness at this
				// output address, switch off the output
				// and update the output address
				bright <= 0;
				led_oe <= 1;
				led_x <= 0;
				all_pixels_done <= 0;
				all_rows_done <= 0;

				// led_addr will wrap
				led_addr <= led_addr + 1;
				led_y <= led_addr + 1;
			end else begin
				// not yet done with this row
				// increase the brightness
				// and reset to the start of this row
				bright <= bright + 1;
				led_x <= 0;
				all_pixels_done <= 0;
				all_rows_done <= 0;
				stall <= 1;
			end
		end else
		if (all_rows_done)
		begin
			// updated all the rows, clock out this pixel
			// and prepare to clock out the next 
			led_clk <= 1;
			led_y <= led_addr;
			row <= 0;
			all_rows_done <= 0;

			if (led_x == X_RES-1) begin
				// end of the row, latch it and enable output
				all_pixels_done <= 1;
				led_latch <= 1;
				led_oe <= 0;
			end else begin
				led_x <= led_x + 1;
			end
		end else begin
			// update the output bit for this r/g/b
			led_r[0] <= (pix_r0 >> DIM) > bright;
			led_g[0] <= (pix_g0 >> DIM) > bright;
			led_b[0] <= (pix_b0 >> DIM) > bright;
			led_r[1] <= (pix_r1 >> DIM) > bright;
			led_g[1] <= (pix_g1 >> DIM) > bright;
			led_b[1] <= (pix_b1 >> DIM) > bright;

			//led_r[row] <= (led_x << 2) > bright;
			//led_g[row] <= 0; //
			//led_b[row] <= 0; //bright < 200;

			all_rows_done <= 1;
		end
	end


	// input can run in a separate clock domain
	// this might need an input fifo to allow the framebuffer
	// to move into an spram
	wire [15:0] input_offset = (y << Y_SHIFT) | x;

	// 16-bit packed pixels, 5 red, 6 green, 5 blue
	wire [15:0] input_packed = { r[7:3], g[7:3], 1'b0, b[7:3] };

	always @(posedge input_clk)
	begin
		if (strobe) begin
			if (y[3] == 0)
				framebuffer_0[input_offset] <= input_packed;
			else
				framebuffer_1[input_offset] <= input_packed;
		end
	end

endmodule
