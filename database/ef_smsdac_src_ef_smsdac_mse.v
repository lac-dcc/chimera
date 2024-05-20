// This program was cloned from: https://github.com/ejfogleman/ef_smsdac
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Eric Fogleman
 * SPDX-License-Identifier: Apache-2.0
 *
 * Fully-segmented mismatch shaping encoder 
 * from SEGMENTED MISMATCH-SHAPING D/A CONVERSION, 
 * Fishov, Fogleman, Siragusa, Galton 
 * 2002 IEEE International Symposium on Circuits and Systems (ISCAS)
 * y0 drives 1x 3-level DAC
 * y1: 2x, y2: 4x, ..., y6: 64x
 * 128x DAC driven by x7, y_c
 * en == 1'b0 stops mismatch shaping (static encoder)
 */
 
module ef_smsdac_mse ( clk, rst_b, en, x, x_c, r, y7, y6, y5, y4 );

  input clk;
  input rst_b;
  input en;		
  input  [7:0] x;
  input x_c;
  input  [6:0] r;
  output  [1:0] y7, y6, y5, y4;
 
	wire y_c_0, y_c_1, y_c_2, y_c_3, y_c_4, y_c_5, y_c_6;

	wire  [1:0] y7;
	wire  [1:0] y6;
	wire  [1:0] y5;
	wire  [1:0] y4;
    /* verilator lint_off UNUSEDSIGNAL */
	wire  [1:0] y3;
	wire  [1:0] y2;
	wire  [1:0] y1;
	wire  [1:0] y0;
    /* verilator lint_on UNUSEDSIGNAL */

	ef_smsdac_mse_sb u_s0( .x0(x[0]), 
						.x_c(x_c), 
						.r(r[0]), 
						.en(en),
						.clk(clk), 
						.rst_b(rst_b), 
						.y_c(y_c_0), 
						.y0(y0[0]), 
						.y1(y0[1]));
	ef_smsdac_mse_sb u_s1( .x0(x[1]), 
						.x_c(y_c_0), 
						.r(r[1]), 
						.en(en),
						.clk(clk), 
						.rst_b(rst_b), 
						.y_c(y_c_1), 
						.y0(y1[0]), 
						.y1(y1[1]));
	ef_smsdac_mse_sb u_s2( .x0(x[2]), 
						.x_c(y_c_1), 
						.r(r[2]),
						.en(en), 
						.clk(clk), 
						.rst_b(rst_b), 
						.y_c(y_c_2), 
						.y0(y2[0]), 
						.y1(y2[1]));
	ef_smsdac_mse_sb u_s3( .x0(x[3]), 
						.x_c(y_c_2), 
						.r(r[3]),
						.en(en), 
						.clk(clk), 
						.rst_b(rst_b), 
						.y_c(y_c_3), 
						.y0(y3[0]), 
						.y1(y3[1]));
	ef_smsdac_mse_sb u_s4( .x0(x[4]), 
						.x_c(y_c_3), 
						.r(r[4]),
						.en(en), 
						.clk(clk), 
						.rst_b(rst_b), 
						.y_c(y_c_4), 
						.y0(y4[0]), 
						.y1(y4[1]));
	ef_smsdac_mse_sb u_s5( .x0(x[5]), 
						.x_c(y_c_4), 
						.r(r[5]),
						.en(en), 
						.clk(clk), 
						.rst_b(rst_b), 
						.y_c(y_c_5), 
						.y0(y5[0]), 
						.y1(y5[1]));
	ef_smsdac_mse_sb u_s6( .x0(x[6]), 
						.x_c(y_c_5), 
						.r(r[6]),
						.en(en), 
						.clk(clk), 
						.rst_b(rst_b), 
						.y_c(y_c_6), 
						.y0(y6[0]), 
						.y1(y6[1]));
	assign y7[1:0] = {x[7], y_c_6};		// ms-segment from {input msb, final carry out}

endmodule
