// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2019-09-12 by mza
// based on mza_test031
// last updated 2020-01-10 by mza

module superkekb (
	input clock,
	input reset,
	output revo,
	output reg [7:0] revo_word
);
	reg reg_revo = 1;
	parameter number_of_quad_bunches_minus_one = 1280 - 1;
	parameter number_of_quad_bunches_over_two = 1280>>1;
	reg [10:0] quad_bunch_counter = number_of_quad_bunches_minus_one;
	always @(posedge clock) begin
		if (reset) begin
			quad_bunch_counter <= number_of_quad_bunches_minus_one;
			revo_word <= 8'b11111111;
			reg_revo <= 1;
		end else begin
			if (0<quad_bunch_counter) begin
				quad_bunch_counter <= quad_bunch_counter - 1'b1;
			end else begin
				quad_bunch_counter <= number_of_quad_bunches_minus_one;
			end
			if (quad_bunch_counter<number_of_quad_bunches_over_two) begin
				revo_word <= 8'b11111111;
				reg_revo <= 1;
			end else begin
				revo_word <= 8'b00000000;
				reg_revo <= 0;
			end
		end
	end
	assign revo = reg_revo;
endmodule

