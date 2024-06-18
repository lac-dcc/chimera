// This program was cloned from: https://github.com/ejfogleman/ef_smsdac
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Eric Fogleman
 * SPDX-License-Identifier: Apache-2.0
 *
 * 10-b LFSR w/ 7 tapped outputs
 * updates 5 states at a time to avoid correlation in tapped bits
 */

module ef_smsdac_lfsr10_7 ( clk, rst_b, en, r );

  input clk;
  input rst_b;
  input en;
  output  [6:0] r;

	reg [9:0] q;
	wire [6:0] r;

	assign r[6:0] = q[9:3];  // tap random bit outputs

	// note:  all zeros is an invalid state; init w/ nonzero state
	always @( posedge clk, negedge rst_b ) begin
		if( rst_b == 1'b0 ) begin
			q[9:1] <= 9'b0;
			q[0] <= 1'b1;
		end
		else begin
			if ( en ) begin
				// jumps 5 states per clock
				// columnwise from left to right
				q[9:5] <= q[4:0] ^ q[7:3];
				q[4:0] <= q[9:5];
			end
		end
	end
	
endmodule
