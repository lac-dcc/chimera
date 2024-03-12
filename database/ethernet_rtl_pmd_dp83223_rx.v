// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 *
 * This roughly follows the design of XAPP225. However, we use a 2x rate DDR
 * clock instead of two clocks 90 degrees out of phase. Yosys/nextpnr cannot
 * guarantee the phase relationship of any clocks, even those from the same
 * PLL. Because of this, we assume that clk_250 and clk_125 are unrelated.
 */

`include "common.vh"
`include "io.vh"

`timescale 1ns/1ps

module pmd_dp83223_rx (
	input clk_250,
	input clk_125,

	input signal_detect,
	input indicate_data,

	/* PMD */
	output signal_status,
	output reg [1:0] rx_data,
	output reg [1:0] rx_data_valid
);

	reg [1:0] rx_p, rx_n;
	reg [4:0] sd_delay;
	initial sd_delay[4:0] = 5'b0;

`ifdef SYNTHESIS
	SB_IO #(
		.PIN_TYPE(`PIN_OUTPUT_NEVER | `PIN_INPUT_DDR),
	) rx_data_pin (
		.PACKAGE_PIN(indicate_data),
		.INPUT_CLK(clk_250),
		.D_IN_0(rx_p[0]),
		.D_IN_1(rx_n[0])
	);
`else
	always @(posedge clk_250)
		rx_p[0] <= indicate_data;

	always @(negedge clk_250)
		rx_n[0] <= indicate_data;
`endif

	/*
	 * Delay signal status until the known good data has had a chance to
	 * make it through the pipeline. This isn't necessary for real hardware
	 * (since signal status is asserted long after we have good data), but
	 * it helps out during simulation. It also helps avoid metastability.
	 */
	always @(posedge clk_125)
		sd_delay[4:0] <= { sd_delay[3:0], signal_detect };

	assign signal_status = sd_delay[4];

	/*
	 * Get things into the clk_250 domain so that we sample posedge before
	 * negedge. Without this we can have a negedge which happens before the
	 * posedge.
	 */
	always @(posedge clk_250) begin
		rx_p[1] <= rx_p[0];
		rx_n[1] <= rx_n[0];
	end

	reg [3:0] rx_a, rx_b, rx_c, rx_d;

	/* Get everything in the clk_125 domain */
	always @(posedge clk_125) begin
		rx_a[0] <= rx_p[1];
		rx_b[0] <= rx_n[1];
	end

	always @(negedge clk_125) begin
		rx_c[0] <= rx_p[1];
		rx_d[0] <= rx_n[1];
	end

	/*
	 * Buffer things a bit. We wait a cycle to avoid metastability. After
	 * that, we need two cycles of history to detect edges, plus a final
	 * cycle to select from.
	 */
	always @(posedge clk_125) begin
		rx_a[3:1] <= rx_a[2:0];
		rx_b[3:1] <= rx_b[2:0];
		rx_c[3:1] <= rx_c[2:0];
		rx_d[3:1] <= rx_d[2:0];
	end

	localparam A = 0;
	localparam B = 1;
	localparam C = 2;
	localparam D = 3;

	reg [1:0] state, state_next;
	initial state = A;
	reg valid, valid_next;
	reg wraparound, wraparound_next;
	initial valid = 0;
	reg [1:0] rx_data_next, rx_data_valid_next;
	reg [3:0] rx_r, rx_f;

	always @(*) begin
		rx_r = {
			rx_a[1] & ~rx_a[2],
			rx_b[1] & ~rx_b[2],
			rx_c[1] & ~rx_c[2],
			rx_d[1] & ~rx_d[2]
		};

		rx_f = {
			~rx_a[1] & rx_a[2],
			~rx_b[1] & rx_b[2],
			~rx_c[1] & rx_c[2],
			~rx_d[1] & rx_d[2]
		};

		state_next = state;
		valid_next = 1;
		wraparound_next = 0;
		if (rx_r == 4'b1111 || rx_f == 4'b1111) begin
			state_next = C;
		end else if (rx_r == 4'b1000 || rx_f == 4'b1000) begin
			state_next = D;
			wraparound_next = state == A;
		end else if (rx_r == 4'b1100 || rx_f == 4'b1100) begin
			state_next = A;
			wraparound_next = state == D;
		end else if (rx_r == 4'b1110 || rx_f == 4'b1110) begin
			state_next = B;
		end else begin
			valid_next = valid;
		end

		if (!signal_status) begin
			state_next = A;
			valid_next = 0;
		end

		rx_data_next[0] = rx_d[3];
		rx_data_valid_next = 1;
		case (state)
		A: begin
			rx_data_next[1] = rx_a[3];
			rx_data_valid_next = !wraparound;
		end
		B: begin
			rx_data_next[1] = rx_b[3];
		end
		C: begin
			rx_data_next[1] = rx_c[3];
		end
		D: begin
			rx_data_next[1] = rx_d[3];
			if (wraparound) begin
				rx_data_next[1] = rx_a[3];
				rx_data_valid_next = 2;
			end
		end
		endcase

		if (!valid_next)
			rx_data_valid_next = 0;
	end

	always @(posedge clk_125) begin
		state <= state_next;
		valid <= valid_next;
		wraparound <= wraparound_next;
		rx_data <= rx_data_next;
		rx_data_valid <= rx_data_valid_next;
	end

`ifndef SYNTHESIS
	reg [255:0] state_text;
	wire [13:0] delay;

	always @(*) begin
		case (state)
		A: state_text = "A";
		B: state_text = "B";
		C: state_text = "C";
		D: state_text = "D";
		endcase
	end
`endif

endmodule
