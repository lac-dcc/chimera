// This program was cloned from: https://github.com/toivoh/tt07-basilisc-2816-cpu
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Toivo Henningsson <toivo.h.h@gmail.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module sbio_monitor #(parameter IO_BITS=2, SENS_BITS=2, COUNTER_BITS=5, INACTIVE_COUNTER_VALUE=31) (
		input wire clk, reset,

		input wire [IO_BITS-1:0] pins,

		output wire start, // Goes high when receving a start bit
		output wire active, // High during message except start bit
		output reg [COUNTER_BITS-1:0] counter, // INACTIVE_COUNTER_VALUE when inavtive and during start bit, then counts up
		input wire done // Put high during the the last cycle of the message
	);

	assign active = (counter != INACTIVE_COUNTER_VALUE);
	wire start_present = |pins[SENS_BITS-1:0];

	assign start = !active && start_present;
	wire reset_counter = (!active && !start_present) || done;

	wire [COUNTER_BITS-1:0] next_counter = reset_counter ? INACTIVE_COUNTER_VALUE : counter + {{(COUNTER_BITS-1){1'b0}}, 1'b1};

	always @(posedge clk) begin
		if (reset) begin
			counter <= INACTIVE_COUNTER_VALUE;
		end else begin
			counter <= next_counter;
		end
	end
endmodule : sbio_monitor
