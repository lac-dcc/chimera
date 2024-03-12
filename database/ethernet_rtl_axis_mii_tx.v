// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 *
 * This is a 100M, Half-duplex MAC (or most of the TX side, anyway). It takes
 * an AXI stream of input data, appends the FCS, and drives the MII. The first
 * 57 bytes of data are stored to allow retrying upon collisions.
 *
 * The following diagram shows two frames, one under 56 bytes, and another
 * greater than 64 bytes. It is adapted from figure 4-5, but reworked to
 * remove complications added for 1000M, and to show the important state
 * transitions.
 *
 * | PREAMBLE | DATA_EARLY | PAD_EARLY | PAD_LATE    | FCS |
 * | PREAMBLE | DATA_EARLY             | DATA_MIDDLE | DATA_LATE | FCS |
 * |<--          Slot time          -->|
 *            |<--          Minimum frame size          -->|
 */

module axis_mii_tx (
	input clk, rst,

	/* MII */
	output reg mii_tx_ce,
	output reg mii_tx_en,
	output reg [3:0] mii_txd,

	input mii_col,
	input mii_crs,

	/* AXI Stream */
	input [7:0] axis_data,
	input axis_valid,
	output axis_ready,
	input axis_last,
	input axis_err,

	/* Use a slot time of one octet for backoff; test purposes only */
	input short_backoff,
	/* Enable Half-Duplex */
	input half_duplex,

	/* Clause 4 TransmitStatus */
	output reg transmit_ok,
	output reg gave_up,
	output reg late_collision,
	output reg underflow
);

	/*
	 * The inter-packet states. In IPG_EARLY, any assertion of CRS will
	 * reset the state counter. In IPG_LATE, CRS is ignored. However, if
	 * there is no packet waiting and CRS is asserted, then it will
	 * transition back to IPG_EARLY. Interestingly, IPG_EARLY_BYTES can be
	 * reduced to 0 if desired, removing this functionality altogether.
	 * Similarly, we go directly to IPG_LATE after transmitting a packet.
	 */
	localparam IPG_EARLY	=  0;
	localparam IPG_LATE	=  1;
	/*
	 * The preamble state. Even if we have a collision, we still transmit
	 * the full preamble before jamming.
	 */
	localparam PREAMBLE	=  2;
	/*
	 * The states used to transmit data. They are divided as follows:
	 *   - DATA_EARLY: Collisions during this state are early, and we need
	 *                 to pad to the minimum frame size.
	 *   - DATA_MIDDLE: Collisions during this state are late, but we
	 *                  still need to pad to the minimum frame size.
	 *   - DATA_LATE: Collisions are late, and we don't need to pad.
	 * An important consideration here is the management of the done
	 * signal. It must be asserted whenever we transition from early
	 * collisions to late collisions.
	 */
	localparam DATA_EARLY	=  3;
	localparam DATA_MIDDLE	=  4;
	localparam DATA_LATE	=  5;
	/*
	 * Padding states:
	 * - PAD_EARLY: If we get a collision we jam and retry.
	 * - PAD_LATE: Collisions are late.
	 */
	localparam PAD_EARLY	=  6;
	localparam PAD_LATE	=  7;
	/*
	 * Transmit the FCS.
	 */
	localparam FCS		=  8;
	/*
	 * Because bytes are sent over the MII one byte-time after the state
	 * machine moves on, we can have a late collision even after the FCS
	 * state is done. To detect this, we use an additional state which is
	 * either the first byte of the jam sequence or the first byte of the
	 * IPG, depending on whether we get a collision.
	 */
	localparam IPG_OR_JAM	=  9;
	/*
	 * The various jam sequences. They all send the same jam pattern, but
	 * differ on what happens next. JAM_FAIL just goes straight to the
	 * IPG. JAM_DRAIN goes to DRAIN. JAM_RETRY goes to BACKOFF if we still
	 * have retries, or to DRAIN if we don't.
	 */
	localparam JAM_RETRY	= 10;
	localparam JAM_DRAIN	= 11;
	localparam JAM_FAIL	= 12;
	/*
	 * Drain the replay buffer and whatever is feeding it until we get to
	 * the last byte.
	 */
	localparam DRAIN	= 13;
	/*
	 * Perform backoff. The amount is set by JAM_RETRY.
	 */
	localparam BACKOFF	= 14;

	localparam PREAMBLE_BYTES 	= 8;
	localparam FCS_BYTES		= 4;
	localparam JAM_BYTES		= 4;
	localparam SLOT_BYTES		= 64;
	localparam MIN_FRAME_BYTES	= 64;
	localparam IPG_BYTES		= 12;
	parameter IPG_EARLY_BYTES	= 8;
	localparam IPG_LATE_BYTES	= IPG_BYTES - IPG_EARLY_BYTES;
	/* +1 since we transition 8 bit times earlier than the MII */
	localparam DATA_EARLY_BYTES	= SLOT_BYTES - PREAMBLE_BYTES + 1;
	localparam DATA_MIDDLE_BYTES	= MIN_FRAME_BYTES - DATA_EARLY_BYTES - FCS_BYTES;
	localparam PAD_LATE_BYTES	= DATA_MIDDLE_BYTES;

	localparam MAX_RETRIES		= 16;

	parameter MII_100_RATIO		= 5;

	localparam DATA_PREAMBLE	= 8'h55;
	localparam DATA_SFD		= 8'hd5;
	parameter DATA_JAM		= 8'hff;
	parameter DATA_PAD		= 8'h00;

	localparam CRC_INIT	= 32'hffffffff;

	reg [7:0] data, data_next;
	reg [31:0] crc_state, crc_state_next, crc_state_out;

	lfsr #(
		.LFSR_WIDTH(32),
		.LFSR_POLY(32'h04c11db7),
		.LFSR_CONFIG("GALOIS"),
		.REVERSE(1),
		.DATA_WIDTH(8),
		.STYLE("REDUCTION")
	) crc (
		.data_in(data),
		.state_in(crc_state),
		.state_out(crc_state_out)
	);

	wire [7:0] buf_data;
	wire buf_err, buf_valid, buf_last;
	reg buf_ready, buf_ready_next, replay, replay_next, done, done_next;

	axis_replay_buffer #(
		.DATA_WIDTH(9),
		.BUF_SIZE(DATA_EARLY_BYTES)
	) replay_buffer (
		.clk(clk),
		.rst(rst),
		.s_axis_data({ axis_data, axis_err }),
		.s_axis_valid(axis_valid),
		.s_axis_ready(axis_ready),
		.s_axis_last(axis_last),
		.m_axis_data({ buf_data, buf_err }),
		.m_axis_valid(buf_valid),
		.m_axis_ready(buf_ready),
		.m_axis_last(buf_last),
		.replay(replay),
		.done(done)
	);

	reg [2:0] mii_tx_counter, mii_tx_counter_next;
	reg mii_tx_ce_next, mii_tx_ce_next_next, mii_tx_ce_next_next_next;
	reg mii_tx_en_next;
	reg do_crc, do_crc_next, do_state, odd, odd_next, collision, collision_next;
	reg [3:0] state, state_next, retries, retries_next;
	reg [5:0] state_counter, state_counter_next;
	reg [9:0] lfsr, lfsr_next, backoff, backoff_next;
	reg transmit_ok_next, gave_up_next, late_collision_next;
	reg underflow_next, err, err_next;
	initial lfsr <= 10'h3ff;

	always @(*) begin
		mii_tx_ce_next_next_next = 0;
		mii_tx_counter_next = mii_tx_counter - 1;
		if (!mii_tx_counter) begin
			mii_tx_ce_next_next_next = 1;
			mii_tx_counter_next = MII_100_RATIO - 1;
		end

		do_crc_next = 0;
		crc_state_next = crc_state;
		if (do_crc)
			crc_state_next = crc_state_out;

		lfsr_next = { lfsr[8:0], lfsr[9] ^ lfsr[6] };
		case (retries)
		15: backoff_next = lfsr[  0];
		14: backoff_next = lfsr[1:0];
		13: backoff_next = lfsr[2:0];
		12: backoff_next = lfsr[3:0];
		11: backoff_next = lfsr[4:0];
		10: backoff_next = lfsr[5:0];
		 9: backoff_next = lfsr[6:0];
		 8: backoff_next = lfsr[7:0];
		 7: backoff_next = lfsr[8:0];
		 6, 5, 4, 3, 2, 1, 0:
		    backoff_next = lfsr[9:0];
		endcase

		odd_next = odd ^ mii_tx_ce_next;
		mii_tx_en_next = mii_tx_en;

		do_state = 0;
		state_next = state;
		state_counter_next = state_counter;
		if (mii_tx_ce_next && odd) begin
			do_state = 1;
			state_counter_next = state_counter - 1;
		end

		err_next = 0;
		if (buf_ready && buf_valid && buf_err)
			err_next = 1;

		transmit_ok_next = 0;
		gave_up_next = 0;
		late_collision_next = 0;
		underflow_next = 0;

		buf_ready_next = 0;
		data_next = data;
		replay_next = 0;
		done_next = 0;
		retries_next = retries;
		collision_next = collision || (half_duplex && mii_col);
		case (state)
		IPG_EARLY: begin
			collision_next = 0;
			crc_state_next = CRC_INIT;
			if (mii_crs)
				state_counter_next = IPG_EARLY_BYTES - 1;

			if (do_state) begin
				mii_tx_en_next = 0;

				if (!state_counter && !mii_crs) begin
					state_counter_next = IPG_LATE_BYTES - 1;
					state_next = IPG_LATE;
				end
			end
		end
		IPG_LATE: begin
			collision_next = 0;
			crc_state_next = CRC_INIT;
			if (do_state && !state_counter) begin
				state_counter_next = state_counter;
				if (buf_valid) begin
					state_next = PREAMBLE;
					state_counter_next = PREAMBLE_BYTES - 1;
				end else if (half_duplex && mii_crs) begin
					state_next = IPG_EARLY;
					state_counter_next = IPG_EARLY_BYTES - 1;
				end
			end
		end
		PREAMBLE: begin
			crc_state_next = CRC_INIT;
			if (do_state) begin
				mii_tx_en_next = 1;
				data_next = DATA_PREAMBLE;
				if (!state_counter) begin
					data_next = DATA_SFD;
					state_next = DATA_EARLY;
					state_counter_next = DATA_EARLY_BYTES - 1;
					if (collision_next) begin
						state_next = JAM_RETRY;
						state_counter_next = JAM_BYTES - 1;
					end
				end
			end
		end
		DATA_EARLY,
		DATA_MIDDLE,
		DATA_LATE: begin
			buf_ready_next = mii_tx_ce_next_next && odd;
			if (do_state) begin
				data_next = buf_data;
				do_crc_next = 1;

				case (state)
				DATA_EARLY: begin
					if (!state_counter) begin
						if (buf_last)
							state_next = PAD_LATE;
						else
							state_next = DATA_MIDDLE;
						state_counter_next = DATA_MIDDLE_BYTES - 1;
						done_next = 1;
					end else if (buf_last) begin
						state_next = PAD_EARLY;
					end
				end
				DATA_MIDDLE: begin
					if (!state_counter) begin
						if (buf_last)
							state_next = FCS;
						else
							state_next = DATA_LATE;
						state_counter_next = FCS_BYTES - 1;
					end else if (buf_last) begin
						state_next = PAD_LATE;
					end
				end
				DATA_LATE: begin
					if (buf_last)
						state_next = FCS;
					state_counter_next = FCS_BYTES - 1;
				end
				endcase

				if (!buf_valid) begin
					if (buf_last)
						state_next = JAM_FAIL;
					else
						state_next = JAM_DRAIN;

					state_counter_next = JAM_BYTES - 1;
					underflow_next = 1;
					if (state == DATA_EARLY)
						done_next = 1;
				end

				if (collision_next) begin
					underflow_next = 0;
					if (state == DATA_EARLY) begin
						state_next = JAM_RETRY;
						done_next = 0;
					end else begin
						if (buf_last)
							state_next = JAM_FAIL;
						else
							state_next = JAM_DRAIN;
						late_collision_next = 1;
					end
					state_counter_next = JAM_BYTES - 1;
				end
			end

			if (err) begin
				state_next = JAM_DRAIN;
				state_counter_next = JAM_BYTES - 1;
				underflow_next = 1;
				if (state == DATA_EARLY)
					done_next = 1;
			end
		end
		PAD_EARLY,
		PAD_LATE: begin
			if (do_state) begin
				data_next = DATA_PAD;
				do_crc_next = 1;
				if (collision_next) begin
					if (state == PAD_EARLY) begin
						state_next = JAM_RETRY;
					end else begin
						state_next = JAM_FAIL;
						late_collision_next = 1;
					end
					state_counter_next = JAM_BYTES - 1;
				end else if (!state_counter) begin
					if (state == PAD_EARLY) begin
						state_next = PAD_LATE;
						state_counter_next =
							PAD_LATE_BYTES - 1;
						done_next = 1;
					end else begin
						state_next = FCS; 
						state_counter_next =
							FCS_BYTES - 1;
					end
				end
			end

			if (err) begin
				state_next = JAM_FAIL;
				state_counter_next = JAM_BYTES - 1;
				underflow_next = 1;
				if (state == PAD_EARLY)
					done_next = 1;
			end
		end
		FCS: begin
			if (do_state) begin
				case (state_counter[1:0])
				2'd3: data_next = ~crc_state[7:0];
				2'd2: data_next = ~crc_state[15:8];
				2'd1: data_next = ~crc_state[23:16];
				2'd0: begin
					data_next = ~crc_state[31:24];
					state_next = IPG_OR_JAM;
				end
				endcase

				if (collision_next) begin
					state_next = JAM_FAIL;
					state_counter_next = JAM_BYTES - 1;
					late_collision_next = 1;
					transmit_ok_next = 0;
				end
			end

			if (err) begin
				state_next = JAM_FAIL;
				state_counter_next = JAM_BYTES - 1;
				underflow_next = 1;
			end
		end
		IPG_OR_JAM: begin
			if (do_state) begin
				data_next = DATA_JAM;
				if (collision_next) begin
					state_next = JAM_FAIL;
					state_counter_next = JAM_BYTES - 2;
					late_collision_next = 1;
				end else begin
					mii_tx_en_next = 0;
					state_next = IPG_LATE;
					state_counter_next = IPG_BYTES - 2;
					transmit_ok_next = 1;
					retries_next = MAX_RETRIES - 1;
				end
			end
		end
		JAM_RETRY,
		JAM_DRAIN,
		JAM_FAIL: begin
			if (do_state)
				data_next = DATA_JAM;

			if (do_state && !state_counter) begin
				if (state == JAM_RETRY && retries) begin
					state_next = BACKOFF;
					/*
					 * A value of 0 would otherwise mean
					 * "wait one slot time", so start at
					 * the "end" of a slot time so we
					 * don't wait for no reason.
					 */
					state_counter_next = 0;
					replay_next = 1;
					retries_next = retries - 1;
				end else begin
					state_counter_next = IPG_BYTES - 1;
					if (state == JAM_FAIL) begin
						state_next = IPG_LATE;
						mii_tx_en_next = 0;
					end else begin
						state_next = DRAIN;
					end
					retries_next = MAX_RETRIES - 1;
					if (state == JAM_RETRY) begin
						gave_up_next = 1;
						done_next = 1;
					end
				end
			end
		end
		DRAIN: begin
			if (buf_ready && buf_valid && buf_last) begin
				if (half_duplex) begin
					state_next = IPG_EARLY;
					state_counter_next = IPG_EARLY_BYTES - 1;
				end else begin
					state_next = IPG_LATE;
					state_counter_next = IPG_BYTES - 1;
				end
			end else begin
				buf_ready_next = 1;
			end

			if (do_state)
				mii_tx_en_next = 0;
		end
		BACKOFF: begin
			backoff_next = backoff;
			if (mii_tx_ce_next && odd) begin
				mii_tx_en_next = 0;
				if (!state_counter) begin
					backoff_next = backoff - 1;
					if (short_backoff)
						state_counter_next = 0;
					else
						state_counter_next = SLOT_BYTES - 1;

					if (!backoff) begin
						state_next = IPG_EARLY;
						state_counter_next = IPG_EARLY_BYTES - 1;
					end
				end
			end
		end
		endcase
	end

	always @(posedge clk) begin
		do_crc <= do_crc_next;
		data <= data_next;
		mii_txd <= odd_next ? data_next[7:4] : data_next[3:0];
		backoff <= backoff_next;
		crc_state <= crc_state_next;
		collision <= collision_next;
		lfsr <= lfsr_next;
	end

	always @(posedge clk, posedge rst) begin
		if (rst) begin
			mii_tx_counter <= MII_100_RATIO;
			mii_tx_ce <= 0;
			mii_tx_ce_next <= 0;
			mii_tx_ce_next_next <= 0;
			mii_tx_en <= 0;
			odd <= 0;
			state <= IPG_EARLY;
			state_counter <= IPG_EARLY_BYTES - 1;
			retries <= MAX_RETRIES - 1;
			transmit_ok <= 0;
			gave_up <= 0;
			late_collision <= 0;
			underflow <= 0;
			buf_ready <= 0;
			err <= 0;
			done <= 0;
			replay <= 0;
		end else begin
			mii_tx_counter <= mii_tx_counter_next;
			mii_tx_ce <= mii_tx_ce_next;
			mii_tx_ce_next <= mii_tx_ce_next_next;
			mii_tx_ce_next_next <= mii_tx_ce_next_next_next;
			mii_tx_en <= mii_tx_en_next;
			odd <= odd_next;
			state <= state_next;
			state_counter <= state_counter_next;
			retries <= retries_next;
			transmit_ok <= transmit_ok_next;
			gave_up <= gave_up_next;
			late_collision <= late_collision_next;
			underflow <= underflow_next;
			buf_ready <= buf_ready_next;
			err <= err_next;
			done <= done_next;
			replay <= replay_next;
		end
	end

`ifndef SYNTHESIS
	reg [255:0] state_text;

	always @(*) begin
		case (state)
		IPG_EARLY: state_text = "IPG_EARLY";
		IPG_LATE: state_text = "IPG_LATE";
		PREAMBLE: state_text = "PREAMBLE";
		DATA_EARLY: state_text = "DATA_EARLY";
		DATA_MIDDLE: state_text = "DATA_MIDDLE";
		DATA_LATE: state_text = "DATA_LATE";
		PAD_EARLY: state_text = "PAD_EARLY";
		PAD_LATE: state_text = "PAD_LATE";
		FCS: state_text = "FCS";
		IPG_OR_JAM: state_text = "IPG_OR_JAM";
		JAM_RETRY: state_text = "JAM_RETRY";
		JAM_DRAIN: state_text = "JAM_DRAIN";
		JAM_FAIL: state_text = "JAM_FAIL";
		DRAIN: state_text = "DRAIN";
		BACKOFF: state_text = "BACKOFF";
		endcase
	end
`endif

endmodule
