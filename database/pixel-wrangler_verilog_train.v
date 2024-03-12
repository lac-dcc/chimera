/*
 * HDMI interface for the NS Train display.
 *
 * This uses the HDMI streaming interface to populate two
 * block RAM framebuffers that are then clocked out on the GPIO
 * pins of the pixel wrangler.
 */
`default_nettype none
`define WRANGLER_LED
`include "top.v"

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
	input [11:0] hdmi_xaddr,
	input [11:0] hdmi_yaddr,

	// GPIO banks for output
	output [7:0] gpio_bank_0,
	output [7:0] gpio_bank_1,

	// RGB led on the board with PWM
	output [7:0] led_r,
	output [7:0] led_g,
	output [7:0] led_b
);
	wire reset = 0;

	wire panel_data1 = gpio_bank_0[7]; // gpio_12;
	wire panel_latch = gpio_bank_0[6]; // gpio_21;
	wire panel_clk = gpio_bank_0[5]; // gpio_13;
	wire panel_en = gpio_bank_0[4]; // gpio_19;
	wire panel_a3 = gpio_bank_0[3]; // gpio_18;
	wire [2:0] panel_addr = { gpio_bank_0[2:0] }; // { gpio_11, gpio_9, gpio_6 };
	wire panel_data0 = gpio_bank_1[3]; // gpio_44;
	assign panel_a3 = 0;

	// for debug output the sync signals on the gpio
	assign gpio_bank_1[0] = vsync;
	assign gpio_bank_1[1] = hsync;
	assign gpio_bank_1[2] = hdmi_valid;

	parameter LED_PANEL_WIDTH = 104;
	parameter ADDR_WIDTH = 12;
	parameter MIN_X = 50;
	parameter MIN_Y = 110; // we aren't doing overscan correctly

	// turn the weird linear addresses from the led matrix into
	// frame buffer read addresses for the RAM.  note that both
	// framebuffers are read with the same x and y since the
	// read addresses are in fb space, not hdmi space
	wire [ADDR_WIDTH-1:0] led_addr;
	wire [11:0] led_xaddr;
	wire [11:0] led_yaddr;
	display_mapper mapper(led_addr, led_xaddr, led_yaddr);

	// outputs to the LED matrices
	wire [7:0] r0;
	wire [7:0] g0;
	wire [7:0] b0;
	wire [7:0] r1;
	wire [7:0] g1;
	wire [7:0] b1;

	// the train display has two separate LED modules,
	// so two subsections of the frame buffer are used
	// the modules aren't 128 across, but for simplicity
	// the overlapping bits are stored here anyway
	hdmi_framebuffer #(
		.MIN_X(MIN_X + 0*LED_PANEL_WIDTH),
		.MIN_Y(MIN_Y),
		.WIDTH(128),
		.HEIGHT(32),
	) fb0(
		// hdmi side
		.hdmi_clk(hdmi_clk),
		.xaddr(hdmi_xaddr),
		.yaddr(hdmi_yaddr),
		.rgb_valid(rgb_valid),
		.r(r),
		.g(g),
		.b(b),
		// output side
		.clk(clk),
		.xaddr_r(led_xaddr),
		.yaddr_r(led_yaddr),
		.r_out(r0),
		.g_out(g0),
		.b_out(b0)
	);

	hdmi_framebuffer #(
		.MIN_X(MIN_X + 1*LED_PANEL_WIDTH),
		.MIN_Y(MIN_Y),
		.WIDTH(128),
		.HEIGHT(32),
	) fb1(
		// hdmi side
		.hdmi_clk(hdmi_clk),
		.rgb_valid(rgb_valid),
		.xaddr(hdmi_xaddr),
		.yaddr(hdmi_yaddr),
		.r(r),
		.g(g),
		.b(b),
		// output side
		.clk(clk),
		.xaddr_r(led_xaddr),
		.yaddr_r(led_yaddr),
		.r_out(r1),
		.g_out(g1),
		.b_out(b1)
	);

	led_matrix #(
		// internal display 4 address lines, 32 * 128
		//.DISP_ADDR_WIDTH(4),
		//.DISPLAY_WIDTH(13'd384), // 24 * 16
		// external display is 3 address lines, 32 * 104
		.DISP_ADDR_WIDTH(3),
		.DISPLAY_WIDTH(416), // 13 columns * 16 * 2
		.FB_ADDR_WIDTH(ADDR_WIDTH)
	) disp0(
		.clk(clk),
		.reset(reset),
		// physical interface
		.data_out(panel_data0), // gpio_34),
		.clk_out(panel_clk), // gpio_26),
		.latch_out(panel_latch), // gpio_25),
		.enable_out(panel_en), // gpio_27),
		.addr_out(panel_addr), // outside panel has 3 address bits
		// logical interface
		.data_in(b0),
		.data_addr(led_addr)
	);

	led_matrix #(
		// internal display 4 address lines, 32 * 128
		//.DISP_ADDR_WIDTH(4),
		//.DISPLAY_WIDTH(13'd384), // 24 * 16
		// external display is 3 address lines, 32 * 104
		.DISP_ADDR_WIDTH(3),
		.DISPLAY_WIDTH(416), // 26 * 16 * 2
		.FB_ADDR_WIDTH(ADDR_WIDTH)
	) disp1(
		.clk(clk),
		.reset(reset),
		// physical interface (only data is used)
		.data_out(panel_data1), // gpio_23),
		// logical interface
		.data_in(b1),
		//.data_addr(read_addr)
	);

	// pulse the RGB led. should do something with state here
	wire [7:0] rate_r = 8'h0F;
	wire [7:0] rate_g = 8'h1F;
	wire [7:0] rate_b = 8'h3F;

	breath breath_r(clk, rate_r, led_r);
	breath breath_g(clk, rate_g, led_g);
	breath breath_b(clk, rate_b, led_b);
endmodule



// for speed of receiving the HDMI signals, the framebuffer is stored in
// normal layout with a power-of-two pitch.
// the actual LED matrix might be weird, so turn a linear offset
// into a framebuffer offset.
//
// external display is 104 wide 32 high, but mapped like:
//
// 10 skip eight    30 repeat 13 times 190
// |           \    |                  |
// 1f           \   3f                 19f -> go back to second column
// 00 1a0        \->20                 180
// |  |             |                  |
// 0f 1af           2f                 18f
// 

module display_mapper(
	input [12:0] linear_addr,
	output [11:0] x_addr,
	output [4:0] y_addr
);
	parameter PANEL_SHIFT_WIDTH = (13 * 32) / 32;
	parameter PANEL_PITCH = 128;

	wire y_bank = linear_addr[4];

	wire [12:0] x_value = linear_addr[12:5];
	wire [12:0] x_offset;
	reg [2:0] x_minor;
	reg [12:0] x_major;

	wire [4:0] y_addr = linear_addr[3:0] + (y_bank ? 0 : 16);
	wire [11:0] x_addr = x_major*8 + x_minor;

	always @(*)
	begin
		if (x_value >= 7 * PANEL_SHIFT_WIDTH) begin
			x_minor = 7;
			x_major = x_value - 7 * PANEL_SHIFT_WIDTH;
		end else
		if (x_value >= 6 * PANEL_SHIFT_WIDTH) begin
			x_minor = 6;
			x_major = x_value - 6 * PANEL_SHIFT_WIDTH;
		end else
		if (x_value >= 5 * PANEL_SHIFT_WIDTH) begin
			x_minor = 5;
			x_major = x_value - 5 * PANEL_SHIFT_WIDTH;
		end else
		if (x_value >= 4 * PANEL_SHIFT_WIDTH) begin
			x_minor = 4;
			x_major = x_value - 4 * PANEL_SHIFT_WIDTH;
		end else
		if (x_value >= 3 * PANEL_SHIFT_WIDTH) begin
			x_minor = 3;
			x_major = x_value - 3 * PANEL_SHIFT_WIDTH;
		end else
		if (x_value >= 2 * PANEL_SHIFT_WIDTH) begin
			x_minor = 2;
			x_major = x_value - 2 * PANEL_SHIFT_WIDTH;
		end else
		if (x_value >= 1 * PANEL_SHIFT_WIDTH) begin
			x_minor = 1;
			x_major = x_value - 1 * PANEL_SHIFT_WIDTH;
		end else begin
			x_minor = 0;
			x_major = x_value;
		end
	end
endmodule


module led_matrix(
	input clk,
	input reset,
	// physical
	output data_out,
	output clk_out,
	output latch_out,
	output enable_out,
	output [DISP_ADDR_WIDTH-1:0] addr_out,
	// framebuffer
	output [FB_ADDR_WIDTH-1:0] data_addr,
	input [DATA_WIDTH-1:0] data_in
);
	parameter DISP_ADDR_WIDTH = 4;
	parameter DISPLAY_WIDTH = 32;
	parameter FB_ADDR_WIDTH = 8;
	parameter DATA_WIDTH = 8;

	reg clk_out;
	reg latch_out;
	reg data_out;
	reg enable_out;
	reg [DISP_ADDR_WIDTH-1:0] addr_out;
	reg [DISP_ADDR_WIDTH-1:0] addr;

	reg [FB_ADDR_WIDTH-1:0] x_index;
	reg [FB_ADDR_WIDTH-1:0] data_addr;

	reg [FB_ADDR_WIDTH-1:0] counter;
	reg [30:0] counter_timer;

	// usable brightness values start around 0x40
	reg [2:0] latch_counter = 0;
	reg [7:0] brightness = 8'hFF;

	always @(posedge clk)
	begin
		clk_out <= 0;

		counter_timer <= counter_timer + 1;
		enable_out <= !(brightness > counter_timer[7:0]);

		if (reset)
		begin
			counter <= 0;
			enable_out <= 1;
			data_addr <= ~0;
			x_index <= 0;
			addr_out <= 0;
			addr <= 0;
			data_out <= 0;
			latch_counter <= 0;
			brightness <= 8'h80;
		end else
		if (latch_out)
		begin
			// unlatch and re-enable the display
			latch_out <= 0;
			//enable_out <= 0;

			// if this has wrapped the display,
			// start over on reading the frame buffer
			if (addr == 0)
				data_addr <= 0;
			// hold the clock high
			clk_out <= 1;
		end else
		if (x_index == DISPLAY_WIDTH)
		begin
			if (latch_counter == 7)
			begin
				// done with this scan line, reset for the next time
				addr <= addr + 1;
				brightness <= 8'hFF; // last one, so make it bright
			end else begin
				// redraw the same scan line a few times at different brightness levels
				data_addr <= data_addr - DISPLAY_WIDTH;
				brightness <= brightness + 8'h18;
			end

			// latch this data and ensure that the correct matrix row is selected
			latch_out <= 1;
			addr_out <= addr;
			latch_counter <= latch_counter + 1;

			// start a new scan line
			x_index <= 0;
			// hold the clock high
			clk_out <= 1;
		end else
		if (clk_out == 1)
		begin
			// falling edge of the clock, prepare the next output
			// use binary-coded pulse modulation, so turn on the output
			// based on each bit and the current brightness level
			if (data_in[latch_counter])
			//if (data_in)
				data_out <= 1;
			else
				data_out <= 0;

			x_index <= x_index + 1;

			// start the fetch for the next address
			data_addr <= data_addr + 1;
		end else begin
			// rising edge of the clock, new data should be ready
			// and stable, so mark it
			clk_out <= 1;
		end
	end
endmodule
