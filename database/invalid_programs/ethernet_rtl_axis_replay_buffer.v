// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 *
 * This module implements a "replay buffer" for an AXI stream, allowing the
 * first BUF_SIZE cycles of a packet to be replayed. This may be done by
 * asserting replay while replayable is true.
 *
 * replayable will remain true until BUF_SIZE + 1 handshakes have occured
 * without a replay. In particular, it is possible to restart a packet 
 * even after a handshake with m_axis_last set. To support this late replay
 * feature, done must be asserted when the consumer does not wish to perform
 * any more replays.
 *
 * In general, this buffer will add two cycles of latency. Additionally, there
 * will may some latency when replayable goes low. This is because the slave
 * interface stalls to avoid overwriting the first part of the packet. However,
 * it will still read ahead to the physical end of the buffer. This will result
 * in no stall as long as BUF_SIZE is at least three less than a power of two.
 *
 * Only axis_data is provided. For user, keep, etc. concatenate them into
 * axis_data. 
 */

`include "common.vh"

module axis_replay_buffer (
	input clk, rst,

	/* AXI Stream slave */
	input [DATA_WIDTH - 1:0] s_axis_data,
	input s_axis_valid,
	output reg s_axis_ready,
	input s_axis_last,

	/* AXI Stream master */
	output reg [DATA_WIDTH - 1:0] m_axis_data,
	output reg m_axis_valid,
	input m_axis_ready,
	output reg m_axis_last,

	/* Control */

	/*
	 * Replay the packet. May be asserted any time replayable is high,
	 * including after BUF_SIZE handshakes have occured and after
	 * m_axis_last is high. Must not be asserted when replayable is low.
	 */
	input replay,
	/*
	 * Force replayable low. This must be asserted for packets <= BUF_SIZE,
	 * since they may still be replayed even after the end of the packet.
	 */
	input done,
	/*
	 * High when replay may be asserted.
	 */
	output reg replayable
);

	parameter DATA_WIDTH	= 9;
	parameter BUF_SIZE	= 54;
	localparam BUF_WIDTH	= $clog2(BUF_SIZE + 1);

	reg s_axis_ready_next;
	reg m_axis_valid_next, m_axis_last_next;
	reg sent_last, sent_last_next;
	reg [DATA_WIDTH - 1:0] buffer [(2 ** BUF_WIDTH) - 1:0];
	reg [BUF_WIDTH:0] m_ptr, m_ptr_next, s_ptr, s_ptr_next, last_ptr,
			  last_ptr_next, max_s_ptr;
	reg last, last_next;
	reg full, full_next, empty, replayable_next, we, re;

	always @(*) begin
		we = 0;
		s_ptr_next = s_ptr;
		last_next = last;
		last_ptr_next = last_ptr;
		if (s_axis_valid && s_axis_ready) begin
			we = 1;
			s_ptr_next = s_ptr + 1;
			if (s_axis_last) begin
				last_next = 1;
				last_ptr_next = s_ptr;
			end
		end

		empty = s_ptr == m_ptr;
		max_s_ptr = { ~m_ptr[BUF_WIDTH], m_ptr[BUF_WIDTH - 1:0] };
		full = s_ptr == max_s_ptr;
		/* Value of full assuming no movement on the master interface */
		full_next = s_ptr_next == max_s_ptr;

		if (replayable)
			s_axis_ready_next = &s_ptr[BUF_WIDTH - 1:0] == s_ptr[BUF_WIDTH];
		else
			s_axis_ready_next = !full_next;

		if (last_next)
			s_axis_ready_next = 0;

		/* read the next datum (if it's available)... */
		m_axis_valid_next = !empty;
		m_axis_last_next = last && m_ptr == last_ptr;
		re = !empty;
		m_ptr_next = m_ptr + !empty;
		/* ...except if we need to stall */
		if (m_axis_valid && !m_axis_ready) begin
			m_axis_valid_next = m_axis_valid;
			m_axis_last_next = m_axis_last;
			re = 0;
			m_ptr_next = m_ptr;
		end

		replayable_next = replayable;
		sent_last_next = sent_last;
		if (m_axis_valid && m_axis_ready) begin
			replayable_next = replayable && (replay || m_ptr != BUF_SIZE + 1);
			sent_last_next = sent_last || m_axis_last;
		end

		if (done)
			replayable_next = 0;

		if (sent_last && !replayable) begin
			m_ptr_next = 0;
			s_ptr_next = 0;
			last_next = 0;
			replayable_next = 1;
			sent_last_next = 0;
		end

		if (replay) begin
			m_ptr_next = 0;
			sent_last_next = 0;
			m_axis_valid_next = 0;
			m_axis_last_next = 0;
		end
	end

	always @(posedge clk) begin
		if (we)
			buffer[s_ptr[BUF_WIDTH - 1:0]] <= { s_axis_data };
		if (re)
			{ m_axis_data } <= buffer[m_ptr[BUF_WIDTH - 1:0]];
		last_ptr <= last_ptr_next;
	end

	always @(posedge clk, posedge rst) begin
		if (rst) begin
			m_ptr <= 0;
			s_ptr <= 0;
			last <= 0;
			replayable <= 1;
			s_axis_ready <= 0;
			m_axis_valid <= 0;
			m_axis_last <= 0;
			sent_last <= 0;
		end else begin
			m_ptr <= m_ptr_next;
			s_ptr <= s_ptr_next;
			last <= last_next;
			replayable <= replayable_next;
			s_axis_ready <= s_axis_ready_next;
			m_axis_last <= m_axis_last_next;
			m_axis_valid <= m_axis_valid_next;
			sent_last <= sent_last_next;
		end
	end

`ifndef SYNTHESIS
	/* This is the only way to look into a buffer... */
	genvar i;
	generate for (i = 0; i < 2 ** BUF_WIDTH; i = i + 1)
		wire [DATA_WIDTH - 1:0] tmp = buffer[i];
	endgenerate
`endif

endmodule
