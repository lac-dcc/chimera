// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"
`include "pcs.vh"

`timescale 1ns/1ns

module pcs_rx_bits (
	input clk,
	/*
	 * Whether to start a new frame using the last value of @unaligned
	 * (instead of @aligned). This will adjust the alignment of @aligned.
	 * Should be a combinatorial input.
	 */
	input start,
	/*
	 * Fill the input buffer with 1s. This will take effect the cycle
	 * after it is asserted. It is possible that an overlapping R/J will
	 * not be detected, but any legal (non-overlapping) R/J will be
	 * detected properly. Should be a combinatorial input.
	 */
	input flush,
	/*
	 * The input bits from the PMA. The @bits[1] should be the
	 * oldest bit. If only one bit is valid, then @bits[1] will be
	 * considered valid. There cannot be more than two valid bits in one
	 * cycle.
	 */
	input [1:0] bits, bits_valid,

	/*
	 * Whether there was activity detected, as defined by 24.2.4.4.1. When
	 * this signal is asserted, then @unaligned contains valid code groups
	 * (such as /I/J/).
	 */
	output reg activity,
	/*
	 * Whether there are at least 10 1s in the input buffer, aligned
	 * or unaligned. This signal may be used to detect the end of a carrier
	 * event, as defined by 24.2.4.4.2.
	 */
	output reg idle,
	/*
	 * Whether @aligned contains valid code groups. This signal will be
	 * asserted (on average) every 5 clock cycles, and can be used as
	 * a clock enable.
	 */
	output reg indicate,
	/*
	 * The output bits from the alignment process. Despite the name, both
	 * code groups are aligned. @unaligned assumes that we are not
	 * receiving and tries to detect a new start of stream. @aligned
	 * assumes that we are receiving and bases the alignment of its code
	 * group off of a previous start of stream.
	 */
	output reg [9:0] aligned, unaligned
);

	reg activity_next, idle_next, indicate_next;
	reg [9:0] aligned_next, unaligned_next;

	/* A shift buffer containing the previous values of @bits. */
	reg [9:0] buffer, buffer_next;
	initial buffer = { `CODE_I, `CODE_I };
	/*
	 * The buffer combined with the new bits (e.g. the total set of bits we
	 * have to work with)
	 */
	wire [11:0] raw_bits = { buffer, bits };
	/* buffer_next before being shifted by bits_valid */
	reg [11:0] buffer_next_raw;
	/*
	 * The number of bits left to receive for the current code group.
	 * A value of 0 (or 1 if @bits_valid is 2) indicates that the current
	 * code group will be finished this cycle, and that @indicate_next will be
	 * set.
	 */
	reg [2:0] bits_remaining, bits_remaining_next;
	initial bits_remaining = 4;
	/*
	 * Whether the last unaligned code group had an "extra" valid bit. If
	 * this was the case, then the buffer will already contain an extra
	 * valid bit of the next code group.
	 */
	reg extra, extra_next;

	/* Detect an IJ pair (or a false carrier) */
	function start_ij(input [9:0] bits);
		start_ij = !(&bits[9:2]) && !bits[0];
	endfunction

	always @(*) begin
		idle_next = idle;
		if (bits_valid != 0)
			idle_next = &raw_bits[10:1];
		if (bits_valid & 2)
			idle_next = idle_next || &raw_bits[9:0];

		buffer_next_raw = raw_bits;
		if (flush)
			buffer_next_raw = { 9'h1FF, extra ? buffer[0] : 1'b1, bits };

		/* buffer_next = buffer_next_raw << bits_valid */
		if (bits_valid == 0)
			buffer_next = buffer_next_raw[11:2];
		else if (bits_valid == 1)
			buffer_next = buffer_next_raw[10:1];
		else
			buffer_next = buffer_next_raw[9:0];

		/* bits_remaining_next = (bits_remaining - bits_valid) % 5 */
		if (bits_valid > bits_remaining)
			bits_remaining_next = 5 + bits_remaining - bits_valid;
		else
			bits_remaining_next = bits_remaining - bits_valid;
		if (start)
			bits_remaining_next = 4 - bits_valid - extra;

		/* indicate = bits_remaining < bits_remaining_next */
		indicate_next = 0;
		if (bits_valid != 0)
			indicate_next = bits_remaining == 0;
		if (bits_valid & 2)
			indicate_next = indicate_next || bits_remaining == 1;
		/*
		 * If we are re-aligning, then indicate will not be valid
		 * (since it is using the old alignment). There should always
		 * be at least 3 clock cycles between indicates, so it's safe
		 * to just ignore it.
		 */
		if (start)
			indicate_next = 0;

		aligned_next = raw_bits[10:1];
		if (bits_valid & 2 && bits_remaining & 1)
			aligned_next = raw_bits[9:0];

		activity_next = 0;
		extra_next = 0;
		unaligned_next = raw_bits[10:1];
		if (bits_valid == 1) begin
			activity_next = start_ij(raw_bits[10:1]);
		end else if (bits_valid & 2) begin
			if (start_ij(raw_bits[10:1])) begin
				activity_next = 1;
				extra_next = 1;
			end else if (start_ij(raw_bits[9:0])) begin
				activity_next = 1;
				unaligned_next = raw_bits[9:0];
			end
		end

		/*
		 * If we are flushing then activity is based on stale data.
		 * Ignore it so we don't accidentally detect activity for data
		 * we are going to flush anyway.
		 */
		if (flush)
			activity_next = 0;
	end

	always @(posedge clk) begin
		buffer <= buffer_next;
		bits_remaining <= bits_remaining_next;
		extra <= extra_next;
		activity <= activity_next;
		idle <= idle_next;
		indicate <= indicate_next;
		aligned <= aligned_next;
		unaligned <= unaligned_next;
	end

endmodule

/* Receive process */
module pcs_rx (
	/* MII */
	input clk,
	output reg ce,
	output reg valid,
	output reg [3:0] data,
	output reg err,

	/* PMA */
	input [1:0] bits,
	input [1:0] bits_valid,
	input link_status,

	/* Internal */
	output reg rx,
	output reg false_carrier
);

	localparam IDLE		= 0;
	localparam START_J	= 1;
	localparam START_K	= 2;
	localparam BAD_SSD	= 3;
	localparam DATA		= 4;
	localparam PREMATURE	= 5;
	localparam FAILED	= 6;

	reg start, flush;
	wire activity, idle, indicate;
	wire [9:0] aligned, unaligned;

	reg [3:0] data_next;
	reg ce_next, valid_next, err_next;
	reg [2:0] state, state_next;
	initial state = IDLE;
	/* Whether we are aligned and receiving */
	reg rx_next, false_carrier_next;

	pcs_rx_bits rx_bits (
		.clk(clk),
		.start(start),
		.flush(flush),
		.bits(bits),
		.bits_valid(bits_valid),
		.activity(activity),
		.idle(idle),
		.indicate(indicate),
		.aligned(aligned),
		.unaligned(unaligned)
	);

	always @(*) begin
		case (aligned[9:5])
		`CODE_0: data_next = 4'h0;
		`CODE_1: data_next = 4'h1;
		`CODE_2: data_next = 4'h2;
		`CODE_3: data_next = 4'h3;
		`CODE_4: data_next = 4'h4;
		`CODE_5: data_next = 4'h5;
		`CODE_6: data_next = 4'h6;
		`CODE_7: data_next = 4'h7;
		`CODE_8: data_next = 4'h8;
		`CODE_9: data_next = 4'h9;
		`CODE_A: data_next = 4'hA;
		`CODE_B: data_next = 4'hB;
		`CODE_C: data_next = 4'hC;
		`CODE_D: data_next = 4'hD;
		`CODE_E: data_next = 4'hE;
		`CODE_F: data_next = 4'hF;
		`CODE_J: data_next = 4'h5;
		`CODE_K: data_next = 4'h5;
		/* This doesn't do anything :( */
		default: data_next = 4'hX;
		endcase

		start = 0;
		/*
		 * XXX: flush (unlike everything else here) is combinatorial;
		 * we should only flush if we are actually evaluating the
		 * state.
		 */
		flush = 0;
		rx_next = rx;
		ce_next = indicate;
		state_next = state;
		valid_next = valid;
		err_next = 0;
		false_carrier_next = 0;

`define BAD_SSD begin \
	state_next = BAD_SSD; \
	data_next = 4'b1110; \
	err_next = 1; \
end

		case (state)
		/* These two states evaluate continuously */
		IDLE: begin
			rx_next = 0;
			valid_next = 0;
			if (activity) begin
				start = 1;
				rx_next = 1;
				ce_next = 0;
				if (unaligned == { `CODE_I, `CODE_J })
					state_next = START_J;
				else begin
					`BAD_SSD;
					false_carrier_next = 1;
				end
			end
		end
		BAD_SSD: begin
			`BAD_SSD;
			if (idle)
				state_next = IDLE;
		end
		/* These states transition only on indicate */
		START_J: begin
			if (aligned[4:0] == `CODE_K) begin
				state_next = START_K;
				valid_next = 1;
			end else begin
				`BAD_SSD;
				false_carrier_next = indicate;
			end

			if (!indicate)
				state_next = START_J;
		end
		START_K: begin
			if (indicate)
				state_next = DATA;
		end
		DATA: begin
			case (aligned[9:5])
			`CODE_0,
			`CODE_1,
			`CODE_2,
			`CODE_3,
			`CODE_4,
			`CODE_5,
			`CODE_6,
			`CODE_7,
			`CODE_8,
			`CODE_9,
			`CODE_A,
			`CODE_B,
			`CODE_C,
			`CODE_D,
			`CODE_E,
			`CODE_F:
				;
			`CODE_T:
				if (aligned[4:0] == `CODE_R) begin
					if (indicate)
						flush = 1;
					state_next = IDLE;
					valid_next = 0;
				end else begin
					err_next = 1;
				end
			`CODE_I: begin
				err_next = 1;
				if (aligned[4:0] == `CODE_I)
					state_next = PREMATURE;
			end
			default:
				err_next = 1;
			endcase

			if (!indicate)
				state_next = DATA;
		end
		PREMATURE: begin
			valid_next = 0;
			if (indicate)
				state_next = IDLE;
		end
		FAILED: begin
			err_next = 1;
			rx_next = 0;
			if (indicate)
				state_next = IDLE;
		end
		endcase

		if (!link_status) begin
			flush = 1;
			if (indicate && valid_next) begin
				state_next = FAILED;
				err_next = 1;
			end else begin
				state_next = IDLE;
			end
		end
	end

	always @(posedge clk) begin
		rx <= rx_next;
		state <= state_next;
		ce <= ce_next;
		false_carrier <= false_carrier_next;
		if (ce_next) begin
			data <= data_next;
			valid <= valid_next;
			err <= err_next;
		end
	end

`ifndef SYNTHESIS
	wire [4:0] aligned_hi = aligned[9:5];
	wire [4:0] aligned_lo = aligned[4:0];
	wire [4:0] unaligned_hi = unaligned[9:5];
	wire [4:0] unaligned_lo = unaligned[4:0];
	reg [255:0] state_text;

	always @(*) begin
		case (state)
		IDLE: state_text = "IDLE";
		START_J: state_text = "START_J";
		START_K: state_text = "START_K";
		BAD_SSD: state_text = "BAD_SSD";
		DATA: state_text = "DATA";
		PREMATURE: state_text = "PREMATURE";
		FAILED: state_text = "FAILED";
		endcase
	end
`endif

endmodule
