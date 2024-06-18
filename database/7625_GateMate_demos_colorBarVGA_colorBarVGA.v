// This program was cloned from: https://github.com/trabucayre/GateMate_demos
// License: MIT License

`default_nettype none

module colorBarVGA (
	input  wire       clk_i, 
	input  wire       rstn_i,
	output wire [3:0] o_r,
	output wire [3:0] o_g,
	output wire [3:0] o_b,
	output wire       o_vsync,
	output wire       o_hsync,
	output wire       o_clk,
	output wire       o_rst,
	output wire [7:0] o_led
);

wire clk_pix, lock;

//`define SIM 1
`ifdef SIM
assign clk_pix = clk_i;
assign lock = rstn_i;
`else
/* PLL for 125MHz (1/2 hdmi clk rate) */
pll pll_inst (
    .clock_in(clk_i), // 10 MHz
	.rst_in(~rstn_i),
    .clock_out(clk_pix), // 40 MHz, 0 deg
    .locked(lock)
);
`endif
assign o_clk = 1'b0;//clk_pix;
assign o_rst = 1'b0;//lock;
wire   rst_s = ~lock;

localparam
	HRES = 640,
	HSZ  = $clog2(HRES),
	VRES = 480,
	VSZ  = $clog2(VRES);

wire [HSZ-1:0] hcount_s;
wire [VSZ-1:0] v_count_s;
wire de_s;

vga_core #(
	.HSZ(HSZ), .VSZ(VSZ)
) vga_inst (.clk_i(clk_pix), .rst_i(rst_s),
	.hcount_o(hcount_s), .vcount_o(v_count_s),
	.de_o(de_s),
	.vsync_o(o_vsync), .hsync_o(o_hsync)
);

wire [3:0] r_s, g_s, b_s;
color_bar #(
    .H_RES(80), .PIX_SZ(4)
) col_inst (
	.i_clk(clk_pix), .i_rst(rst_s),
	.i_blank(~de_s),
	.o_r(o_r), .o_g(o_g), .o_b(o_b)
);

assign o_led = 8'b0;
//blinker #(.MAX(25_000_000)
//) blink_inst (
//	.i_clk(clk_pix), .i_rst(rst_s), .o_led(o_led)
//);

endmodule
