// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

module mdio (
	input clk,
	input ce,
	input mdi,
	output reg mdo,
	output reg mdo_valid,

	input ack, err,
	output cyc,
	output reg stb, we,
	output reg [4:0] addr,
	output reg [15:0] data_write,
	input [15:0] data_read
);

	parameter [PHYAD_BITS-1:0] ADDRESS = 0;

	localparam IDLE		= 0;
	localparam PREAMBLE	= 1;
	localparam ST		= 2;
	localparam OP		= 3;
	localparam PHYAD	= 4;
	localparam REGAD	= 5;
	localparam TA		= 6;
	localparam DATA		= 7;

	localparam PREAMBLE_BITS	= 32;
	localparam OP_BITS		= 2;
	localparam PHYAD_BITS		= 5;
	localparam REGAD_BITS		= 5;
	localparam TA_BITS		= 2;
	localparam DATA_BITS		= 16;

	localparam OP_READ	= 2'b10;
	localparam OP_WRITE	= 2'b01;

	reg mdo_next, mdo_valid_next;
	reg stb_next, we_next;
	initial stb = 0;
	reg [4:0] addr_next;
	reg [15:0] data_next;

	reg bad, bad_next, saved_err, saved_err_next;
	reg [2:0] state, state_next;
	reg [4:0] state_counter, state_counter_next;
	initial state = IDLE;

	/*
	 * NB: stb_next and data_next are assigned to stb and data_write every
	 * clock, whereas the other signals are only assigned if ce is high.
	 * This ensures that no duplicate reads/writes are issued, and that
	 * data_read is sampled promptly. However, it also means that any
	 * assignments to these regs in the state machine must be qualified
	 * by ce.
	 */
	always @(*) begin
		mdo_next = 1'bX;
		mdo_valid_next = 0;

		stb_next = stb;
		we_next = we;
		addr_next = addr;
		data_next = data_write;
		saved_err_next = saved_err;
		if (stb && (ack || err)) begin
			stb_next = 0;
			if (err)
				saved_err_next = 1;
			else
				data_next = data_read;
		end

		state_next = state;
		state_counter_next = state_counter - 1;
		bad_next = bad;
		case (state)
		IDLE: begin
			bad_next = 0;
			state_counter_next = PREAMBLE_BITS - 1;
			if (mdi)
				state_next = PREAMBLE;
		end
		PREAMBLE: begin
			if (!state_counter)
				state_counter_next = 0;

			if (!mdi) begin
				if (state_counter)
					state_next = IDLE;
				else
					state_next = ST;
			end
		end
		ST: begin
			if (!mdi)
				bad_next = 1;
			state_next = OP;
			state_counter_next = OP_BITS - 1;
		end
		OP: begin
			/* This is a bit of an abuse of we :) */
			we_next = mdi;
			/* Accordingly, cancel any outstanding transactions */
			stb_next = 0;
			saved_err_next = 0;
			if (!state_counter) begin
				case ({ we, mdi })
				OP_READ: we_next = 0;
				OP_WRITE: we_next = 1;
				default: bad_next = 1;
				endcase

				state_next = PHYAD;
				state_counter_next = PHYAD_BITS - 1;
			end
		end
		PHYAD: begin
			if (mdi != ADDRESS[state_counter])
				bad_next = 1;

			if (!state_counter) begin
				state_next = REGAD;
				state_counter_next = REGAD_BITS - 1;
			end
		end
		REGAD: begin
			addr_next = { addr[3:0], mdi };

			if (!state_counter) begin
				if (ce && !we && !bad)
					stb_next = 1;

				state_next = TA;
				state_counter_next = TA_BITS - 1;
			end
		end
		TA: begin
			if (!state_counter) begin
				if (!we && !bad) begin
					mdo_next = 0;
					mdo_valid_next = 1;
					if (stb || saved_err) begin
						/* No response */
						if (ce)
							stb_next = 0;
						bad_next = 1;
						mdo_valid_next = 0;
					end
				end

				state_next = DATA;
				state_counter_next = DATA_BITS - 1;
			end
		end
		DATA: begin
			if (ce && we) begin
				data_next = { data_write[14:0], mdi };
			end else if (!bad) begin
				/* More data_write abuse */
				mdo_next = data_write[15];
				mdo_valid_next = 1;
				if (ce)
					data_next = { data_write[14:0], 1'bX };
			end

			if (!state_counter) begin
				if (ce && we && !bad)
					stb_next = 1;

				bad_next = 0;
				state_next = IDLE;
			end
		end
		endcase
	end

	always @(posedge clk) begin
		stb <= stb_next;
		data_write <= data_next;
		saved_err <= saved_err_next;
		if (ce) begin
			mdo <= mdo_next;
			mdo_valid <= mdo_valid_next;
			we <= we_next;
			addr <= addr_next;
			state <= state_next;
			state_counter <= state_counter_next;
			bad <= bad_next;
		end
	end

	/* No multi-beat transactions */
	assign cyc = stb;

`ifndef SYNTHESIS
	reg [255:0] state_text;

	always @(*) begin
		case (state)
		IDLE: state_text = "IDLE";
		PREAMBLE: state_text = "PREAMBLE";
		ST: state_text = "ST";
		OP: state_text = "OP";
		PHYAD: state_text = "PHYAD";
		REGAD: state_text = "REGAD";
		TA: state_text = "TA";
		DATA: state_text = "DATA";
		endcase
	end
`endif

endmodule
