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
	output wire [PIX_SZ-1:0] o_r,
	output wire [PIX_SZ-1:0] o_g,
	output wire [PIX_SZ-1:0] o_b
);

	localparam H_CNT = $clog2(H_RES);
	
	reg [2:0] bar_id;    // bar id
	reg [H_CNT-1:0] pos; // pixel count by bar
	always @(posedge i_clk) begin
		pos <= pos + 1'b1;
		if (pos - 1 == H_RES) begin
			bar_id <= bar_id + 1'b1;
			pos <= 0;
		end
		if (i_rst | i_blank) begin
			bar_id <= 3'b0;
			pos <= 0;
		end
	end

	assign o_b = (i_blank) ? {PIX_SZ{1'b0}} : {PIX_SZ{~bar_id[0]}};
	assign o_g = (i_blank) ? {PIX_SZ{1'b0}} : {PIX_SZ{~bar_id[2]}};
	assign o_r = (i_blank) ? {PIX_SZ{1'b0}} : {PIX_SZ{~bar_id[1]}};

endmodule
