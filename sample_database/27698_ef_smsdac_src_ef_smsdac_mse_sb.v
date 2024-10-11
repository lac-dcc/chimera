// This program was cloned from: https://github.com/ejfogleman/ef_smsdac
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Eric Fogleman
 * SPDX-License-Identifier: Apache-2.0
 *
 * Switching block for fully-segmented mismatch shaping encoder
 * from SEGMENTED MISMATCH-SHAPING D/A CONVERSION, 
 * Fishov, Fogleman, Siragusa, Galton 
 * 2002 IEEE International Symposium on Circuits and Systems (ISCAS)
 */

module ef_smsdac_mse_sb ( clk, rst_b, r, en, x0, x_c, y0, y1, y_c );

  input clk, rst_b, r, en, x0, x_c; 
  output y0, y1, y_c;

	reg q, q0;			// switching sequence state machine
	wire s;				// switching sequence
	wire q_d, q0_d;
	wire odd; 			// input parity
	wire y1, y0, y_c;	// encoder outputs

	// input parity
	assign odd = x0 ^ x_c;

	// switching sequence; 1st order shaped or random
	assign s = en ? q : r;

	// "carry" output (extra lsb); round up/down on odd input
	assign y_c = odd ? s : x0;

	// 3-level DAC outputs
	assign y1 = odd & ~s;
	assign y0 = ~odd | ~s;

	// switching sequence; update only on odd inputs
	// en == 1'b0 stops mismatch shaping (static encoder)
	assign q0_d = (en & odd) ? ~q0 : q0; 
	assign q_d = (en & odd) ? ( ~q ? ~q0 : r ) : q;

	always @( posedge clk, negedge rst_b ) begin 
		if ( rst_b == 1'b0 ) begin
			q0 <= 1'b0;
			q <= 1'b0;
		end
		else begin 
			q0 <= q0_d;
			q <= q_d; 
		end
	end
			 
endmodule
