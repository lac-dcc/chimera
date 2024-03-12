/*
 * iua_core.v
 *
 * ice40 USB Analyzer - Logic Analyzer core
 *
 * Copyright (C) 2008  Sylvain Munaut <tnt@246tNt.com>
 *
 * vim: ts=4 sw=4
 */

`ifdef SIM
`default_nettype none
`endif

module iua_core (
	input  wire [ 1:0] data_t0,
	input  wire [ 1:0] data_t1,
	output reg  [31:0] out_data,
	output reg  [ 1:0] out_width,
	output reg  out_valid,
	input  wire clk,
	input  wire rst
);

	// Signals
	// -------

	// Stage 1
	reg [1:0] data_prev;

	reg [1:0] data_prev_1;
	reg [1:0] data_t0_1;
	reg data_t0_change_1;
	reg data_t1_change_1;

	// Stage 2
	reg [15:0] count_1;
	reg force_flush_1;

	reg [ 1:0] out0_data_2;
	reg [15:0] out0_count_2;
	reg out0_big_2;
	reg out0_valid_2;
	reg [ 1:0] out1_data_2;
	reg out1_valid_2;

	// Stage 3


	// First stage : Detect changes
	// ----------------------------

	always @(posedge clk)
		data_prev <= data_t1;

	always @(posedge clk)
	begin
		data_prev_1 <= data_prev;
		data_t0_1   <= data_t0;
		data_t0_change_1 <= (data_prev != data_t0);
		data_t1_change_1 <= (data_t0 != data_t1);
	end


	// Stage 2 : Generate RLE
	// ----------------------

	// Repeat count
	always @(posedge clk)
		if (rst)
			count_1 <= 0;
		else
			if (data_t1_change_1)
				count_1 <= 0;
			else if (data_t0_change_1)
				count_1 <= 1;
			else if (force_flush_1)
				count_1 <= 0;
			else
				count_1 <= count_1 + 2;

	// Force flush ?
	always @(posedge clk)
		if (rst)
			force_flush_1 <= 1'b0;
		else
			if (data_t0_change_1 | data_t1_change_1 | force_flush_1)
				force_flush_1 <= 1'b0;
			else
				force_flush_1 <= &count_1[15:3] & (count_1[2] | (count_1[1] & count_1[0]));

	// RLE
	always @(posedge clk)
	begin
		out0_data_2 <= data_prev_1;
		out1_data_2 <= data_t0_1;
	end

	always @(posedge clk)
		if (rst) begin
			out0_count_2 <= 16'h0000;
			out0_big_2   <= 1'b0;
			out0_valid_2 <= 1'b0;
			out1_valid_2 <= 1'b0;
		end else begin
			case ({data_t0_change_1, data_t1_change_1})
				2'b10: begin
					out0_count_2 <= count_1;
					out0_big_2   <= |(count_1[15:6]);
					out0_valid_2 <= 1'b1;
					out1_valid_2 <= 1'b0;
				end

				2'b01: begin
					out0_count_2 <= count_1 + 1;
					out0_big_2   <= count_1 > 62;
					out0_valid_2 <= 1'b1;
					out1_valid_2 <= 1'b0;
				end

				2'b11: begin
					out0_count_2 <= count_1;
					out0_big_2   <= |(count_1[15:6]);
					out0_valid_2 <= 1'b1;
					out1_valid_2 <= 1'b1;
				end

				default: begin
					if (force_flush_1) begin
						out0_count_2 <= count_1 + 1;
						out0_big_2   <= 1'b1;
						out0_valid_2 <= 1'b1;
						out1_valid_2 <= 1'b0;
					end else begin
						out0_count_2 <= 16'h0000;
						out0_big_2   <= 1'b0;
						out0_valid_2 <= 1'b0;
						out1_valid_2 <= 1'b0;
					end
				end
			endcase
		end


	// Stage 3 : Formatting
	// --------------------

	always @(posedge clk)
		if (rst) begin
			out_data  <= 32'h00000000;
			out_width <= 2'b00;
			out_valid <= 1'b0;
		end else begin
			if (out0_valid_2) begin
				if (out0_big_2) begin
					out_data  <= { 6'b000000, out1_data_2, out0_count_2, 6'b111111, out0_data_2 };
					out_width <= out1_valid_2 ? 2'b11 : 2'b10;
					out_valid <= 1'b1;
				end else begin
					out_data  <= { 16'h0000, 6'b000000, out1_data_2, out0_count_2[5:0], out0_data_2 };
					out_width <= out1_valid_2 ? 2'b01 : 2'b00;
					out_valid <= 1'b1;
				end
			end else begin
				out_data  <= 32'h00000000;
				out_width <= 2'b00;
				out_valid <= 1'b0;
			end
		end

endmodule // iua_core
