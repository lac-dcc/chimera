// This program was cloned from: https://github.com/ejfogleman/ef_smsdac
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Eric Fogleman
 * SPDX-License-Identifier: Apache-2.0
 *
 * wrapper for retiming register
 * retime all DAC outputs to posedge clk
 */
 
module ef_smsdac_reg( clk, rst_b, d, q );

  input clk;
  input rst_b;
  input  [7:0] d;
  output  [7:0] q;

	reg [7:0] q;

	always @( posedge clk, negedge rst_b ) 
		if ( rst_b == 1'b0 ) 
			q <= 0;
		else
			q <= d;

endmodule
