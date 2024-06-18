// This program was cloned from: https://github.com/trabucayre/fpgalibs
// License: MIT License

/*
 * color_bar.v
 *
 * Copyright (C) 2022  Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 * SPDX-License-Identifier: MIT
 */

`default_nettype none

module color_bar #(
	parameter H_RES = 10,
		PIX_SZ = 8
) (
	input  wire              i_clk,
	input  wire              i_rst,
	input  wire              i_blank,
	input  wire              i_vsync,
	input  wire              i_hsync,
	output reg              o_blank,
	output reg              o_vsync,
	output reg              o_hsync,
	output wire [PIX_SZ-1:0] o_r,
	output wire [PIX_SZ-1:0] o_g,
	output wire [PIX_SZ-1:0] o_b
);

	localparam      H_CNT    = $clog2(H_RES);
	localparam real GAIN     = 255;
	localparam real OFFSET   = 2;
	localparam real BAR_LEN  = H_RES;
	localparam real TIME_LEN = BAR_LEN + (OFFSET * 2);

`define MATH_PI 3.14159265358979323846264338325790288419716

	reg [PIX_SZ-1:0] sin_rom [0:H_RES-1];

	integer j;
	initial begin
		for(j = 0; j < H_RES; j = j+1)
    		sin_rom[j] = $rtoi($ceil($sin((j+OFFSET) * (`MATH_PI / TIME_LEN)) * GAIN));
	end
	
	reg [2:0] bar_id;    // bar id
	reg [H_CNT-1:0] pos; // pixel count by bar
	always @(posedge i_clk) begin
		pos <= pos + 1'b1;
		if (pos == H_RES - 1) begin
			bar_id <= bar_id + 1'b1;
			pos <= 0;
		end
		if (i_rst | i_blank) begin
			bar_id <= 3'b0;
			pos <= 0;
		end
	end

	wire [    PIX_SZ-1:0] rom_val = sin_rom[pos];
	wire [    PIX_SZ-1:0]     b_s = {PIX_SZ{~bar_id[0]}};
	wire [    PIX_SZ-1:0]     g_s = {PIX_SZ{~bar_id[2]}};
	wire [    PIX_SZ-1:0]     r_s = {PIX_SZ{~bar_id[1]}};
	wire [(2*PIX_SZ)-1:0]    b2_s = b_s * rom_val;
	wire [(2*PIX_SZ)-1:0]    g2_s = g_s * rom_val;
	wire [(2*PIX_SZ)-1:0]    r2_s = r_s * rom_val;
	wire [PIX_SZ-1:0]        b3_s = b2_s[(2*PIX_SZ)-1:PIX_SZ];
	wire [PIX_SZ-1:0]        g3_s = g2_s[(2*PIX_SZ)-1:PIX_SZ];
	wire [PIX_SZ-1:0]        r3_s = r2_s[(2*PIX_SZ)-1:PIX_SZ];

	reg  [PIX_SZ-1:0]        bd_s;
	reg  [PIX_SZ-1:0]        gd_s;
	reg  [PIX_SZ-1:0]        rd_s;

	always @(posedge i_clk) begin
		bd_s    = b3_s;
		gd_s    = g3_s;
		rd_s    = r3_s;
		o_blank = i_blank;
		o_vsync = i_vsync;
		o_hsync = i_hsync;
	end

	assign o_b = (o_blank) ? {PIX_SZ{1'b0}} : bd_s;
	assign o_g = (o_blank) ? {PIX_SZ{1'b0}} : gd_s;
	assign o_r = (o_blank) ? {PIX_SZ{1'b0}} : rd_s;

endmodule
