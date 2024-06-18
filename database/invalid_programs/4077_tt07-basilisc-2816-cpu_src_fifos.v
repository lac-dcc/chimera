// This program was cloned from: https://github.com/toivoh/tt07-basilisc-2816-cpu
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Toivo Henningsson
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

`include "common.vh"

module FIFO #( parameter DEPTH=3, BITS=1 ) (
		input wire clk, reset,

		input wire add, remove,
		input wire [BITS-1:0] new_entry,
		output wire [BITS-1:0] last_entry,
		output wire empty, full,
		output reg [$clog2(DEPTH+1)-1:0] num_entries
	);
	localparam NE_BITS = $clog2(DEPTH + 1);

	genvar i;

	reg [BITS-1:0] entries[0:DEPTH];
	always @(posedge clk) entries[0] <= 'X;

	always @(posedge clk) begin
		if (reset) begin
			num_entries <= 0;
		end else begin
			num_entries <= num_entries + ({{(NE_BITS-1){1'b0}}, add} - {{(NE_BITS-1){1'b0}}, remove});
		end

		if (add) begin
			entries[1] <= new_entry;
		end
	end

	generate
		for (i=2; i <= DEPTH; i++) begin
			always @(posedge clk) begin
				if (add) entries[i] <= entries[i-1];
			end
		end
	endgenerate

	assign last_entry = entries[num_entries];
	assign empty = (num_entries == 0);
	assign full  = (num_entries == DEPTH);
endmodule : FIFO

/*
Shift register based FIFO.
Entries start at the top (depth=0) and fall to the bottom if there is no valid entry at the next depth.
Has a latency of at least DEPTH, but should be more area efficient.
*/
module SRFIFO #( parameter DEPTH=3, BITS=1 ) (
		input wire clk, reset,

		input wire add, remove, // only add when can_add is high, only remove when last_valid is
		input wire [BITS-1:0] new_entry,
		output wire [BITS-1:0] last_entry,
		output wire can_add, last_valid,
		output reg [$clog2(DEPTH+1)-1:0] num_entries // should track the number of valid entries as long as only adding/removing when allowed
	);
	localparam NE_BITS = $clog2(DEPTH + 1);

	genvar i;

	reg [BITS-1:0] sr_entries[DEPTH];
	reg [DEPTH-1:0] valid;

	wire [DEPTH:0] valid_ext = {!remove, valid};

	always @(posedge clk) begin
		if (reset) begin
			num_entries <= 0;
		end else begin
			num_entries <= num_entries + ({{(NE_BITS-1){1'b0}}, add} - {{(NE_BITS-1){1'b0}}, remove});
		end

		if (reset) begin
			valid[0] <= 0;
		end else if (add) begin
			valid[0] <= 1;
			sr_entries[0] <= new_entry;
		end else if (!valid_ext[1]) begin // empty space ahead; shift forward
			valid[0] <= 0;
		end
	end

	generate
		for (i=1; i < DEPTH; i++) begin
			always @(posedge clk) begin
				if (reset) begin
					valid[i] <= 0;
				end else if (valid[i-1] && !valid[i]) begin // shift in from position i
					valid[i]   <= 1;
					sr_entries[i] <= sr_entries[i-1];
				end else if (!valid_ext[i+1]) begin // empty space ahead; shift forward and 
					valid[i] <= 0;
				end
			end
		end
	endgenerate

	assign can_add = !valid[0];
	assign last_valid = valid[DEPTH-1];
	assign last_entry = sr_entries[DEPTH-1];
endmodule : SRFIFO
