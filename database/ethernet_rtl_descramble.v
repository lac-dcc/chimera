// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

module descramble (
	input clk,
	input [1:0] scrambled, scrambled_valid,
	input signal_status, test_mode,
	output reg locked,
	output reg [1:0] descrambled, descrambled_valid
);

	initial descrambled_valid = 0;
	reg relock, relock_next, locked_next;
	initial relock = 0;
	reg [1:0] ldd, descrambled_next;
	reg [10:0] lfsr, lfsr_next;

	/*
	 * The number of consecutive idle bits to require when locking, as
	 * well as the number necessary to prevent unlocking. For the first
	 * case, this must be less than 60 bits (7.2.3.1.1), including the
	 * bits necessary to initialize the lfsr. For the second, this must be
	 * less than 29 bits (7.2.3.3(f)). We use 29 to meet these requirements;
	 * it is increased by 1 to allow for an easier implementation of the
	 * counter, and decreased by 1 to allow easier implementation when
	 * scrambled_valid = 2. The end result is that only 28 bits might be
	 * required in certain situations.
	 */
	localparam CONSECUTIVE_IDLES = 5'd29;
	reg [4:0] idle_counter, idle_counter_next;
	initial idle_counter = CONSECUTIVE_IDLES;

	/*
	 * We use a LFSR for the unlock counter in order to relax the timing
	 * requirements. Although we could use a 16-bit register, we use
	 * a 17-bit one to reduce the number of taps we need. Values were
	 * generated with:
	 *
	 * $ scripts/lfsr.py 0x12000 90460 45125 625
	 *
	 * The amount of time without receiving consecutive idles before we
	 * unlock. This must be greater than 361us (7.2.3.3(f)), which is
	 * 45125 cycles at 125MHz.
	 */
	localparam UNLOCK_VALUE = 17'h05b08;
	/* One 9000-byte jumbo frame plus an extra preamble */
	localparam JUMBO_UNLOCK_VALUE = 17'h053f9;
	/* One minimum-length packet plus some extra (5us or 625 cycles) */
	localparam TEST_UNLOCK_VALUE = 17'h020ef;
	reg [16:0] unlock_counter, unlock_counter_next;

	always @(*) begin
		ldd = { lfsr[8] ^ lfsr[10], lfsr[7] ^ lfsr[9] };
		descrambled_next = scrambled ^ ldd;

		/*
		 * We must invert scrambled before adding it to the lfsr in
		 * order to remove the ^1 from the input idle. This doesn't
		 * affect the output of the lfsr during the sample state
		 * because two bits from the lfsr are xor'd together,
		 * canceling out the inversion.
		 */
		lfsr_next = lfsr;
		if (scrambled_valid[0])
			lfsr_next = { lfsr[9:0], locked ? ldd[1] : ~scrambled[1] };
		else if (scrambled_valid[1])
			lfsr_next = { lfsr[8:0], locked ? ldd : ~scrambled };

		/*
		 * Reset the counter to 2 to ensure we can always subtract
		 * idles without underflowing. This clause is made to depend
		 * on idle_counter (and not idle_counter_next) to reduce the critical
		 * path. The actual condition is idle_counter_next <= 1 (aka
		 * we are about to underflow, and have gotten at least 28
		 * consecutive 1s).
		 */
`define RELOCK begin \
	idle_counter_next = 2; \
	relock_next = 1; \
end

		idle_counter_next = idle_counter;
		relock_next = 0;
		if (scrambled_valid[1]) begin
			if (descrambled_next[1] && descrambled_next[0]) begin
				idle_counter_next = idle_counter - 2;
				if (!idle_counter[4:2])
					`RELOCK
			end else if (descrambled_next[0]) begin
				idle_counter_next = idle_counter - 1;
				if (!idle_counter[4:2] && idle_counter[1:0] != 2'b11)
					`RELOCK
			end else begin
				idle_counter_next = CONSECUTIVE_IDLES;
			end
		end else if (scrambled_valid[0]) begin
			if (descrambled_next[1]) begin
				idle_counter_next = idle_counter - 1;
				if (!idle_counter[4:2] && idle_counter[1:0] != 2'b11)
					`RELOCK
			end else begin
				idle_counter_next = CONSECUTIVE_IDLES;
			end
		end

		locked_next = 1;
		unlock_counter_next = unlock_counter;
		if (relock) begin
			unlock_counter_next = test_mode ? TEST_UNLOCK_VALUE : UNLOCK_VALUE;
		end else if (!(&unlock_counter)) begin
			unlock_counter_next[0] = unlock_counter[16] ^ unlock_counter[13];
			unlock_counter_next[16:1] = unlock_counter[15:0];
		end else begin
			locked_next = 0;
		end
	end

	always @(posedge clk) begin
		descrambled <= descrambled_next;
		descrambled_valid <= scrambled_valid;
		if (signal_status) begin
			lfsr <= lfsr_next;
			idle_counter <= idle_counter_next;
			relock <= relock_next;
			unlock_counter <= unlock_counter_next;
			locked <= locked_next;
		end else begin
			lfsr <= 0;
			idle_counter <= CONSECUTIVE_IDLES;
			relock <= 0;
			unlock_counter <= 17'h1ffff;
			locked <= 0;
		end
	end

endmodule
