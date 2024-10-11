// This program was cloned from: https://github.com/28add11/tt07_qoa_decode
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Nicholas Alan West
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module qoa_decoder (
		input wire sys_rst_n,
		input wire sys_clk,
		input wire data_rdy,
		input wire [7:0] spi_in,
		output reg [15:0] sample
	);

	// LMS predictor history and weights, 2 * 4 16 bit registers
	reg signed [15:0] history [3:0];
	reg signed [15:0] weights [3:0];

	wire [15:0] hist0sample;

	// Internal control signals
	parameter WAIT = 2'b0;
	parameter PARSE = 2'b01;
	parameter PROCESSING = 2'b10;
	wire multStatus;
	reg [1:0] state;

	// Internal data
	reg [3:0] sf_index;
	reg [2:0] r_index;
	reg [1:0] hw_index; // History/weights index
	reg hw_selector;
	reg high_low;
	reg signed [15:0] dequant;
	reg signed [31:0] accumulator;	

	assign hist0sample = history[0];

	always @(posedge sys_clk) begin
		if (~sys_rst_n) begin
			state <= WAIT;
			// Reset history and weights
			history[0] <= 16'b0;
			weights[0] <= 16'b0;
			history[1] <= 16'b0;
			weights[1] <= 16'b0;
			history[2] <= 16'b0;
			weights[2] <= 16'b0;
			history[3] <= 16'b0;
			weights[3] <= 16'b0;

			accumulator <= 32'b0;
			high_low <= 1'b1; // Start at high bit for MSB
		end else begin
			case (state)
				WAIT: begin
					if (data_rdy) begin
						if (spi_in[0]) begin
							r_index <= spi_in[3:1];
							sf_index <= spi_in[7:4];
							
							state <= PROCESSING; // Set state to process the values
						end else begin
							hw_selector <= spi_in[1];
							hw_index <= spi_in[3:2];

							state <= PARSE; // Parse the next two bytes for history/weights
						end
					end
				end

				PARSE: begin
					if (data_rdy) begin
						if (hw_selector) begin

							// hw_selector being 1 = weights
							if (high_low) begin
								// High byte
								weights[hw_index] <= {spi_in, weights[hw_index][7:0]};
								high_low <= 1'b0;
								
							end else begin
								// Low byte
								weights[hw_index] <= {weights[hw_index][15:8], spi_in};
								high_low <= 1'b1; 
								state <= WAIT; // We are done putting things into the weights so return to waiting
							end
						end else begin
							// hw_selector 0 = history
							if (high_low) begin
								// High byte
								history[hw_index] <= {spi_in, history[hw_index][7:0]};
								high_low <= 1'b0;
								
							end else begin
								// Low byte
								history[hw_index] <= {history[hw_index][15:8], spi_in};
								high_low <= 1'b1; 
								state <= WAIT; // We are done putting things into the history so return to waiting
							end
						end
					end
				end

				default: state <= WAIT;

			endcase
		end
	end
endmodule