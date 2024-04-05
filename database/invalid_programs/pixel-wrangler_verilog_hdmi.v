/*
 * HDMI frame buffer and streaming interface.
 *
 * This uses the decoded data from the tmds_decoder to
 * produce pixels. It can either write them into a frame
 * buffer, or make them available as a streaming interface
 * in the hdmi_clk domain.
 *
 * Requires a 5x or 10x PLL from the pixel clock.
 * Clock input should use a global buffer input
 * -- app note says " Global Buffer Input 7 (GBIN7) is the only one that supports differential clock inputs."
 * -- but experimentally only 37 works.
 *
 * Pair Inputs must use negative pin of differential pairs.
 * The positive pin *must not be mentioned* as an input.
 *
 * The bit clock and pixel clock have a constant, but unknown phase.
 * We should have a "tracking" function that tries to ensure it lines up.
 *
 * https://www.analog.com/en/design-notes/video-display-signals-and-the-max9406-dphdmidvi-level-shifter8212part-i.html
 * V+H sync and audio header on Blue (D0)
 * Audio data on Red and Green
 * Data island period is encoded with TERC4; can we ignore it?
 *
 * sync pulses are active low
 * H sync keeps pulsing while V is low (twice)
 * V sync is 63 usec, every 60 Hz
 * H sync is 4 usec, every 32 usec
 *
 * 640x480 frame is actually sent as an 800x525 frame.
 * hbi goes 80 into X, vbi goes 22 into y
 */
`include "mem.v"

module hdmi_stream(
	input hdmi_clk,
	input valid,
	input [1:0] sync,
	input [7:0] d0,
	input [7:0] d1,
	input [7:0] d2,

	// up to a 4k address output,
	// although we only support 640x480
	output [11:0] xaddr,
	output [11:0] yaddr,
	output rgb_valid,
	output [7:0] r,
	output [7:0] g,
	output [7:0] b,
	output vsync,
	output hsync
);
	reg vsync;
	reg hsync;
	reg last_hsync;
	reg last_vsync;

	reg [11:0] xaddr;
	reg [11:0] yaddr;

	reg rgb_valid;
	reg [7:0] r;
	reg [7:0] g;
	reg [7:0] b;

	wire data_valid = 1; // todo: determine data island period etc

	always @(posedge hdmi_clk)
	begin
		rgb_valid <= 0;
		r <= d2;
		g <= d1;
		b <= d0;

		hsync <= sync[0];
		last_hsync <= hsync;

		last_vsync <= sync[1];
		vsync <= last_vsync || sync[1]; // two clocks at least

		if (!valid)
		begin
			// literally nothing to do
		end else
		if (!vsync)
		begin
			// edge triggered, but we can hold this as long as we need to
			yaddr <= 0;
			xaddr <= 0;
		end else
		if (!hsync) begin
			// only advance the y on the falling edge of hsync
			if (last_hsync)
				yaddr <= yaddr + 1;
			xaddr <= 0;
		end else
		if (data_valid) begin
			rgb_valid <= 1;
			xaddr <= xaddr + 1;
		end
	end
endmodule


/*
 * Store a small window of the HDMI display for retrieval
 * WIDTH *must* be a power of 2.
 *
 * Read addresses are in framebuffer space, not HDMI space.
 */
module hdmi_framebuffer(
	// hdmi interface
	input hdmi_clk,
	input [11:0] xaddr,
	input [11:0] yaddr,
	input rgb_valid,
	input [7:0] r,
	input [7:0] g,
	input [7:0] b,
	output in_window,

	// reader inteface
	input clk,
	input [11:0] xaddr_r,
	input [11:0] yaddr_r,
	output [7:0] r_out,
	output [7:0] g_out,
	output [7:0] b_out
);
	parameter ADDR_WIDTH = 13;
	parameter [11:0] MIN_X = 50;
	parameter [11:0] MIN_Y = 50;
	parameter [11:0] WIDTH = 128;
	parameter [11:0] HEIGHT = 100;

	wire [11:0] xoffset = xaddr - MIN_X;
	wire [11:0] yoffset = yaddr - MIN_Y;
	wire in_window = (xoffset < WIDTH) && (yoffset < HEIGHT);

	reg [ADDR_WIDTH-1:0] waddr;
	reg wen = 0;

	ram #(
		.ADDR_WIDTH(ADDR_WIDTH),
		.DATA_WIDTH(8)
	) fb_r(
		.wr_clk(hdmi_clk),
		.wr_enable(wen),
		.wr_addr(waddr),
		.wr_data(r),
		.rd_clk(clk),
		.rd_addr(raddr),
		.rd_data(r_out)
	);

	ram #(
		.ADDR_WIDTH(ADDR_WIDTH),
		.DATA_WIDTH(8)
	) fb_g(
		.wr_clk(hdmi_clk),
		.wr_enable(wen),
		.wr_addr(waddr),
		.wr_data(g),
		.rd_clk(clk),
		.rd_addr(raddr),
		.rd_data(g_out)
	);

	ram #(
		.ADDR_WIDTH(ADDR_WIDTH),
		.DATA_WIDTH(8)
	) fb_b(
		.wr_clk(hdmi_clk),
		.wr_enable(wen),
		.wr_addr(waddr),
		.wr_data(b),
		.rd_clk(clk),
		.rd_addr(raddr),
		.rd_data(b_out)
	);

	wire [ADDR_WIDTH-1:0] raddr = xaddr_r | (yaddr_r * WIDTH);

	always @(posedge hdmi_clk)
	begin
		wen <= rgb_valid && in_window;
		waddr <= (xoffset) | (yoffset * WIDTH);
	end
endmodule
