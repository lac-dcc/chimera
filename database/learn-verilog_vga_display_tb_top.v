// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ps/1ps

module tb_top (
	output wire hsync,
	output wire vsync,
	output wire [15:0] rgb,

	// char index: 0 ~ 1999:
	output wire [10:0] char_index,
	// char data: 2 bytes: BG/FG color, ASCII code:
	output wire [15:0] char_data,
	output wire [7:0] color_index_delay,
	// char pixel x, y:
	output wire [2:0] char_pixel_x,
	output wire [3:0] char_pixel_y,
	output wire [2:0] char_pixel_x_delay_1,
	output wire [2:0] char_pixel_x_delay_2,
	output wire [3:0] char_pixel_y_delay,

    // a single byte represent a line of char font:
	output wire [7:0] font_line_data,
	// pixel color index:
	output wire [3:0] pixel_color_index,
    // pixel rgb color:
	output wire [15:0] pix_rgb,

    // pixel x, y:
	output wire [9:0] pix_x,
	output wire [9:0] pix_y
);

	reg vga_clk;
	reg vga_rst_n;
	
	clk_delay #(3) clk_delay_for_char_pixel_x_1 (
		.clk (vga_clk),
		.in_data (char_pixel_x),
		.out_data (char_pixel_x_delay_1)
	);

	clk_delay #(3) clk_delay_for_char_pixel_x_2 (
		.clk (vga_clk),
		.in_data (char_pixel_x_delay_1),
		.out_data (char_pixel_x_delay_2)
	);

	clk_delay #(4) clk_delay_for_char_pixel_y (
		.clk (vga_clk),
		.in_data (char_pixel_y),
		.out_data (char_pixel_y_delay)
	);

	rom_font rom_font_inst (
		.clock (vga_clk),
		.address ({ char_data[7:0], char_pixel_y_delay}),
		.q (font_line_data)
	);

	clk_delay #(8) clk_delay_for_color_index (
		.clk (vga_clk),
		.in_data (char_data[15:8]),
		.out_data (color_index_delay)
	);

    pixel_index_color pixel_index_color_inst (
    	.font_line_data (font_line_data),
        .char_pix_x (char_pixel_x_delay_2),
        .bg_fg_index (color_index_delay),
        .color_index (pixel_color_index)
	);

	index_color_to_rgb index_color_to_rgb_inst (
		.color_index (pixel_color_index),
		.color_rgb (pix_rgb)
	);

	ram_buffer ram_buffer_inst (
	    .rdclock (vga_clk),
	    .wrclock (vga_clk),
	    .data (16'd0),
	    .rdaddress (char_index),
	    .wraddress (11'd0),
	    .wren (1'b0),
	    .q (char_data)
	);

	vga_ctrl vga_ctrl_inst (
		.clk (vga_clk),
		.rst_n (vga_rst_n),
		.in_rgb (pix_rgb),
		.pix_x (pix_x),
		.pix_y (pix_y),
		.hsync (hsync),
		.vsync (vsync),
		.out_rgb (rgb)
	);

    pixel_to_char pixel_to_char_inst (
		.pix_x (pix_x),
		.pix_y (pix_y),
		.char_index (char_index),
		.char_pixel_x (char_pixel_x),
		.char_pixel_y (char_pixel_y)
	);

    initial begin
        vga_clk = 1'b1;
        vga_rst_n = 1'b0;
        #10
        vga_rst_n = 1'b1;
        #5000000
        $finish;
    end

    always #1 vga_clk = ~vga_clk;

endmodule
