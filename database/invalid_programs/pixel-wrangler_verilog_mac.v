/*
 * HDMI interface for a classic Mac
 *
 */
`default_nettype none
`define WRANGLER_LED
`define WRANGLER_SWITCH
`include "top.v"
`include "dither.v"

module display(
	input clk_48mhz,
	input clk, // system clock, probably 12 or 24 Mhz
	input sw1, // user switch

	// Streaming HDMI interface (in 25 MHz hdmi_clk domain)
	input hdmi_clk,
	input hdmi_bit_clk,
	input hdmi_valid,
	output hdmi_reset,
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
	assign hdmi_reset = !sw1;

	// pulse the RGB led. shinputould do something with state here
	assign led_r = hdmi_reset ? 8'hFF : 8'h00;
	assign led_g = rgb_valid ? 8'h30 : 8'h00;
	assign led_b = hdmi_valid ? 8'h00 : 8'hf0;

	assign gpio_bank_1[3] = vsync;

	//wire [7:0] rate_r = 8'h0F;
	//wire [7:0] rate_g = 8'h1F;
	//wire [7:0] rate_b = 8'h3F;

	//breath breath_r(clk, rate_r, led_r);
	//breath breath_g(clk, rate_g, led_g);
	//breath breath_b(clk, rate_b, led_b);

	// produce a 16 MHz clock from the 48 Mhz clock
	wire clk_16mhz_raw;
	clk_div3 div3(clk_48mhz, reset, clk_16mhz_raw);

	// produce a 15.625 MHz from the HDMI clock (maybe)
	reg [2:0] clk_div;
	wire clk_15mhz = clk_div[2];
	always @(posedge hdmi_bit_clk)
		clk_div <= clk_div + 1;

	//wire clk_16mhz = hdmi_valid ? clk_15mhz : clk_16mhz_raw;
	wire clk_16mhz =  clk_16mhz_raw;

/*
	wire [9:0] fb_xaddr;
	wire [8:0] fb_yaddr;
	reg [7:0] fb[0:1023];
	initial $readmemh("apple-32.hex", fb);
	wire [9:0] fb_addr = { fb_yaddr[6:2], fb_xaddr[6:2] };
	wire fb_data = fb[fb_addr] > 127;
*/

	wire [15:0] mono_bits;
	wire [11:0] mono_xaddr;
	wire [11:0] mono_yaddr;
	wire mono_bits_ready;
	wire mono_vsync;

	hdmi_dither #(
		.X_OFFSET(64),
		.Y_OFFSET(128)
	) dither(
		.hdmi_clk(hdmi_clk),
		.hdmi_valid(hdmi_valid && rgb_valid),
		.hdmi_vsync(vsync),
		.hdmi_xaddr(hdmi_xaddr),
		.hdmi_yaddr(hdmi_yaddr),
		.hdmi_r(r),
		.hdmi_g(g),
		.hdmi_b(b),

		.mono_clk(clk_16mhz),
		.mono_bits(mono_bits),
		.mono_xaddr(mono_xaddr),
		.mono_yaddr(mono_yaddr),
		.mono_bits_ready(mono_bits_ready),
		.mono_vsync(mono_vsync)
	);

	reg [9:0] fb_xaddr;
	reg [8:0] fb_yaddr;
	reg [15:0] fb_bits;

	reg [13:0] rd_addr;
	//reg video_bit;

	reg mono_bits_ready_delay = 0;

	//wire reader_active = fb_xaddr[3:0] == 4'b1111;
	reg reader_active;

	// xaddr bottom 4 bits are all zero since there are 16-bits
	// returned at a time.  xaddr only goes to 511
	wire [13:0] wd_addr = { mono_yaddr[8:0], mono_xaddr[8:4] };

	reg fb_wen;

	// every 16 pixels cache the next 16 pixels worth of data
	wire [15:0] rd_data;

	// video comes from the read buffer on the clock immediately
	// after a read, otherwise it comes from the shift register
	wire video_bit = last_read_active ? rd_data[15] : fb_bits[15];

	reg last_read_active;
	always @(posedge clk_16mhz)
	begin
		fb_wen <= 0;
		last_read_active <= 0;
		mono_bits_ready_delay <= 0;

		if (fb_xaddr[3:0] == 4'b0000) begin
			// need to read a new set of pixels
			last_read_active <= 1;
 			rd_addr <= { fb_yaddr[8:0], fb_xaddr[8:4] };

			// delay any writes that might be happening
			// since reading from the frame buffer has
			// real-time priority
			mono_bits_ready_delay <= mono_bits_ready;
		end else begin
			// allow any writes or delayed writes to happen
			// when they are in the active part of the display
			// mono_bits_ready is only set if we're in the window
			fb_wen <= mono_bits_ready || mono_bits_ready_delay;
		end

		// refresh the buffer from the read or shift the buffer
		if (last_read_active)
			fb_bits[15:0] <= { rd_data[14:0], 1'b0 };
		else
			fb_bits[15:0] <= { fb_bits[14:0], 1'b0 };
	end


	// 512x512x1 fits in a single ice40up5k SPRAM
	spram_32k framebuffer(
		.clk(clk_16mhz),
		.wen(fb_wen),
		.wr_addr(wd_addr),
		.wr_data(mono_bits),
		.rd_addr(rd_addr),
		.rd_data(rd_data)
	);

	mac_display crt(
		.clk_16mhz(clk_16mhz),
		.reset(reset),
		.hsync(gpio_bank_1[1]),
		.vsync(gpio_bank_1[2]),
		.out(gpio_bank_1[0]),
		.xaddr(fb_xaddr),
		.yaddr(fb_yaddr),
		.fb_data(video_bit)
	);


endmodule


module mac_display(
	input reset,
	input clk_16mhz,
	output [9:0] xaddr,
	output [8:0] yaddr,
	input fb_data,
	output vsync,
	output hsync,
	output out
);
	parameter ACTIVE_WIDTH = 512;
	parameter ACTIVE_HEIGHT = 342;
	parameter ACTIVE_XOFFSET = 192;
	parameter ACTIVE_YOFFSET = 48;

	parameter TOTAL_WIDTH = 720;
	parameter TOTAL_HEIGHT = ACTIVE_HEIGHT + ACTIVE_YOFFSET + 1; //384;
	parameter VSYNC_LINES = 6; // how many hsyncs during vsync low
	parameter VSYNC_OFFSET = 128; // edge of vsync relative to hsync
	parameter HSYNC_OFFSET = 294; // rising edge of the hsync line

	reg hsync;
	reg vsync;
	reg out;

	reg [9:0] xscan;
	reg [8:0] yscan;
	wire [9:0] xaddr = xscan - ACTIVE_XOFFSET;
	wire [8:0] yaddr = yscan - ACTIVE_YOFFSET;

	// note that the "in active window" triggers one pixel
	// *after* xscan enters it, since xaddr is a request for
	// a pixel and it takes one clock for the framebuffer to be ready
	wire in_active_window = 1
		&& ACTIVE_XOFFSET < xscan
		&& xscan <= ACTIVE_XOFFSET + ACTIVE_WIDTH
		&& ACTIVE_YOFFSET < yscan
		&& yscan <= ACTIVE_YOFFSET + ACTIVE_HEIGHT;

	always @(posedge clk_16mhz)
	if (reset)
	begin
		xscan <= 0;
		yscan <= 0;
		vsync <= 1;
		hsync <= 1;
	end else begin
		// 45 usec per hsync * 16 MHz == 720 total X addresses
		// = 180 hsync + 512 active + 28?
		// vsync offset from hsync
		xscan <= xscan + 1;
		if (xscan == TOTAL_WIDTH-1)
		begin
			xscan <= 0;

			if (yscan == TOTAL_HEIGHT-1)
				yscan <= 0;
			else
				yscan <= yscan + 1;
		end

		if (yscan == 0 && xscan == VSYNC_OFFSET)
			vsync <= 0;
		else
		if (yscan == VSYNC_LINES && xscan == VSYNC_OFFSET)
			vsync <= 1;

		if (xscan == 0)
			hsync <= 0;
		else
		if (xscan == HSYNC_OFFSET)
			hsync <= 1;

		if (in_active_window)
			out <= ~fb_data;
		else
			out <= 1; // idle high
	end
endmodule
