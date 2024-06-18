// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

module top(
    input wire sys_clk,
    input wire sys_rst_n,
//    input wire wr_en,
//    input wire [9:0] wr_address,
//    input wire [15:0] wr_data,
    output ddc_scl,
    output ddc_sda,
    output tmds_clk_p,
    output tmds_clk_n,
    output [2:0] tmds_data_p,
    output [2:0] tmds_data_n
);
    wire clk_1x;
    wire clk_5x;
    wire pll_locked;
    wire rst_n;

    wire char_valid;
    wire char_valid_delay_1;
    wire char_valid_delay_2;
    // char index: 0 ~ 1999:
    wire [10:0] char_index;
    // char data: 2 bytes: BG/FG color, ASCII code:
    wire [15:0] char_data;
    wire [7:0] color_index_delay;
    // char pixel x, y:
    wire [2:0] char_pixel_x;
    wire [3:0] char_pixel_y;
    wire [2:0] char_pixel_x_delay_1;
    wire [2:0] char_pixel_x_delay_2;
    wire [3:0] char_pixel_y_delay;

    // a single byte represent a line of char font:
    wire [7:0] font_line_data;
    // pixel color index:
    wire [3:0] pixel_color_index;
    // pixel rgb color:
    wire [23:0] pix_rgb;

    wire pix_data_req;
    // pixel x, y:
    wire [9:0] pix_x;
    wire [9:0] pix_y;

    wire hsync;
    wire vsync;
    wire [23:0] rgb;

    assign rst_n = sys_rst_n & pll_locked;

    assign ddc_scl = 1'b1;
    assign ddc_sda = 1'b1;

    pll pll_inst (
        .areset (~sys_rst_n),
        .inclk0 (sys_clk),
        .c0 (clk_1x),
        .c1 (clk_5x),
        .locked (pll_locked)
    );

    clk_delay #(1) clk_delay_for_char_valid_1 (
        .clk (clk_1x),
        .in_data (char_valid),
        .out_data (char_valid_delay_1)
    );

    clk_delay #(1) clk_delay_for_char_valid_2 (
        .clk (clk_1x),
        .in_data (char_valid_delay_1),
        .out_data (char_valid_delay_2)
    );

    clk_delay #(3) clk_delay_for_char_pixel_x_1 (
        .clk (clk_1x),
        .in_data (char_pixel_x),
        .out_data (char_pixel_x_delay_1)
    );

    clk_delay #(3) clk_delay_for_char_pixel_x_2 (
        .clk (clk_1x),
        .in_data (char_pixel_x_delay_1),
        .out_data (char_pixel_x_delay_2)
    );

    clk_delay #(4) clk_delay_for_char_pixel_y (
        .clk (clk_1x),
        .in_data (char_pixel_y),
        .out_data (char_pixel_y_delay)
    );

    rom_font rom_font_inst (
        .clock (clk_1x),
        .address ({char_data[7:0], char_pixel_y_delay}),
        .q (font_line_data)
    );

    clk_delay #(8) clk_delay_for_color_index (
        .clk (clk_1x),
        .in_data (char_data[15:8]),
        .out_data (color_index_delay)
    );

    pixel_index_color pixel_index_color_inst (
        .valid (char_valid_delay_2),
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
        .rdclock (clk_1x),
        .wrclock (clk_1x),
        .data (16'd0),
        .rdaddress (char_index),
        .wraddress (11'd0),
        .wren (1'b0),
        .q (char_data)
    );

    pixel_to_char pixel_to_char_inst (
        .pix_req (pix_data_req),
        .pix_x (pix_x),
        .pix_y (pix_y),
        .char_valid (char_valid),
        .char_index (char_index),
        .char_pixel_x (char_pixel_x),
        .char_pixel_y (char_pixel_y)
    );

    vga_ctrl #(2, 24) vga_ctrl_inst (
        .clk (clk_1x),
        .rst_n (rst_n),
        .in_rgb (pix_rgb),
        .pix_data_req (pix_data_req),
        .pix_x (pix_x),
        .pix_y (pix_y),
        .hsync (hsync),
        .vsync (vsync),
        .out_rgb (rgb),
        .pix_valid (pix_valid)
    );

    hdmi_ctrl hdmi_ctrl_inst (
        .clk_1x (clk_1x),
        .clk_5x (clk_5x),
        .rst_n (rst_n),
        .rgb_r (rgb[23:16]),
        .rgb_g (rgb[15:8]),
        .rgb_b (rgb[7:0]),
        .hsync (hsync),
        .vsync (vsync),
        .de (pix_valid),
        .hdmi_clk_p (tmds_clk_p),
        .hdmi_clk_n (tmds_clk_n),
        .hdmi_r_p (tmds_data_p[2]),
        .hdmi_r_n (tmds_data_n[2]),
        .hdmi_g_p (tmds_data_p[1]),
        .hdmi_g_n (tmds_data_n[1]),
        .hdmi_b_p (tmds_data_p[0]),
        .hdmi_b_n (tmds_data_n[0])
    );

endmodule
