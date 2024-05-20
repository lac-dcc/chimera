// This program was cloned from: https://github.com/toivoh/tt07-basilisc-2816-cpu
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Toivo Henningsson
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

`include "common.vh"

/*
Bit serial register file with 2 read/write ports.
When scanning a register, scan out the bottom NSHIFT bits each cycle, and scan in the top NSHIFT bits.
*/
module regfile #( parameter LOG2_NR=3, REG_BITS=8, NSHIFT=2 ) (
		input wire clk, reset,

		input wire [LOG2_NR-1:0] reg_index, reg_index2,

		input wire do_scan, do_scan2,
		// If both indices are the same and scanning, scan_in is used over scan_in2
		input wire [NSHIFT-1:0] scan_in, scan_in2,
		output wire [NSHIFT-1:0] scan_out, scan_out2
	);

	localparam NUM_REGS = 2**LOG2_NR;

	genvar i;

	reg [REG_BITS-1:0] regs[NUM_REGS];

	assign scan_out  = regs[reg_index ][NSHIFT-1:0];
	assign scan_out2 = regs[reg_index2][NSHIFT-1:0];

	generate
		for (i = 0; i < NUM_REGS; i++) begin
			wire active_reg  = (i == reg_index)  & do_scan;
			wire active_reg2 = (i == reg_index2) & do_scan2;
			// Prefer scan_in over scan_in2
			wire [NSHIFT-1:0] reg_scan_in = active_reg ? scan_in : scan_in2;
			wire reg_scan = active_reg | active_reg2;

			always @(posedge clk) begin
				if (reg_scan) regs[i] <= {reg_scan_in, regs[i][REG_BITS-1:NSHIFT]};
			end
		end
	endgenerate
endmodule
