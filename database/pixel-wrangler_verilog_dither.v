/*
 * Blue-Noise dithering of the HDMI signal into a 1bpp,
 * along with clock-crossing to make it usable by an externaly
 * clocked video output.
 */

module hdmi_dither(
	// inputs in the hdmi_clk domain
	input hdmi_clk,
	input hdmi_vsync,
	input [11:0] hdmi_xaddr,
	input [11:0] hdmi_yaddr,
	input hdmi_valid,
	input [7:0] hdmi_r,
	input [7:0] hdmi_g,
	input [7:0] hdmi_b,

	// outputs in the clk domain
	input mono_clk,
	output [15:0] mono_bits,
	output [11:0] mono_xaddr, // base address of the 16 bits
	output [11:0] mono_yaddr,
	output mono_bits_ready,
	output mono_vsync
);
	parameter DITHER_BITS = 6;
	parameter X_OFFSET = 64;
	parameter Y_OFFSET = 128;
	parameter WIDTH = 512;
	parameter HEIGHT = 342;

	reg [15:0] hdmi_bits;
	reg [15:0] mono_bits;

	reg bits_ready;
	reg mono_bits_ready;
	reg [11:0] mono_xaddr;
	reg [11:0] mono_yaddr;

	wire mono_vsync;

	wire vsync_falling_edge;
	edge_detect vsync_edge(hdmi_clk, hdmi_vsync, vsync_falling_edge); 

	clock_cross_strobe
		ready_strobe(hdmi_clk, bits_ready, mono_clk, mono_bits_ready);
	clock_cross_strobe
		vsync_strobe(hdmi_clk, vsync_falling_edge, mono_clk, mono_vsync);
	
	wire dither_bit;
	dither #(
		.ADDR_BITS(DITHER_BITS)
	) dither_i(
		.clk(hdmi_clk),
		.r(hdmi_r),
		.b(hdmi_b),
		.g(hdmi_g),
		.x(hdmi_xaddr[DITHER_BITS-1:0]),
		.y(hdmi_yaddr[DITHER_BITS-1:0]),
		.out(dither_bit)
	);

	wire [11:0] out_xaddr = hdmi_xaddr - X_OFFSET;
	wire [11:0] out_yaddr = hdmi_yaddr - Y_OFFSET;

	wire hdmi_in_window = 1
		&& X_OFFSET <= hdmi_xaddr && hdmi_xaddr < X_OFFSET + WIDTH
		&& Y_OFFSET <= hdmi_yaddr && hdmi_yaddr < Y_OFFSET + HEIGHT + 1;

	wire [15:0] hdmi_bits_next = { hdmi_bits[14:0], dither_bit };

	always @(posedge hdmi_clk)
	begin
		bits_ready <= 0;

		// accumulate the hdmi bits as they come in
		// dither bit is delayed by one clock, but that's ok
		// since it just shifts the display by a pixel
		if (hdmi_valid)
			hdmi_bits <= hdmi_bits_next;

		// clock crossing flag for the full shift register
		if (hdmi_valid && out_xaddr[3:0] == 4'b0000)
		begin
			// full shift register, store the base address
			// of the X register and the bits
			// do not signal if outside of the active window
			bits_ready <= hdmi_in_window;
			mono_bits <= hdmi_bits;
			mono_xaddr <= { out_xaddr[11:4]-1, 4'b0000 };
			mono_yaddr <= out_yaddr;
		end
	end
endmodule

/*
 * Blue Noise dithering uses two block RAMs to store the 32x32x8 image
 * and thresholds the sum to determine if this pixel is black or white
 */
module dither(
	input clk,
	input [7:0] r,
	input [7:0] g,
	input [7:0] b,
	input [ADDR_BITS-1:0] x,
	input [ADDR_BITS-1:0] y,
	output out
);
	parameter ADDR_BITS = 5;
	parameter NOISE_FILE =
		ADDR_BITS == 5 ? "bluenoise-32.hex" :
		ADDR_BITS == 6 ? "bluenoise-64.hex" :
		ADDR_BITS == 7 ? "bluenoise-128.hex" :
		ADDR_BITS == 8 ? "bluenoise-256.hex" :
		"unknown-noise-value";

	reg [7:0] noise[0:(1 << (2*ADDR_BITS)) - 1];
	initial $readmemh(NOISE_FILE, noise);
	wire [2*ADDR_BITS-1:0] noise_addr = { x, y };
	reg [7:0] noise_value0;
	reg [7:0] noise_value1;
	reg [7:0] noise_value2;

	reg out;

	// this may need to be adjusted once all three channels
	// are available. the plus one ensures that 255 -> 256
	// for a pure white and avoids a larger comparison in
	// the clocked block.
	//wire [9:0] sum = r + g + b + noise_value + 1;
	wire [8:0] r_sum = r + noise_value0 + 1;
	wire [8:0] b_sum = b + noise_value0 + 1;
	wire [8:0] g_sum = g + noise_value0 + 1;

	// r is not full range?
	wire r_dither = (r_sum > 9'd256);
	wire b_dither = (b_sum > 9'd256);
	wire g_dither = (g_sum > 9'd256);

	wire dither_bit = 0
		| r_dither
		| b_dither
		| g_dither
		;

	always @(posedge clk)
	begin
		// track the last few noise values
		// so that R, G, and B have slightly different patterns
		noise_value2 <= noise_value1;
		noise_value1 <= noise_value0;
		noise_value0 <= noise[noise_addr];

		out <= dither_bit;
	end
endmodule
