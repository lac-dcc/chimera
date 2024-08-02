// This program was cloned from: https://github.com/ejfogleman/ef_smsdac
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Eric Fogleman
 * SPDX-License-Identifier: Apache-2.0
 *
 * Segmented mismatch-shaping DAC top-level wrapper
 * Input clock at 1-50 MHz
 * 8-b unsigned input data on d_in; sync'd to clk
 * d_out{3..0} connect to 8x, 4x, 2x, 1x weight 3-level DACs
 */
 
// Top level 
module ef_smsdac_top( clk, rst_b, en_enc, en_dith, d_in, d_out_3, d_out_2, d_out_1, d_out_0 );

  input clk;
  input rst_b;
  input en_enc;
  input en_dith;
  input  [7:0] d_in;
  output  [1:0] d_out_3;
  output  [1:0] d_out_2;
  output  [1:0] d_out_1;
  output  [1:0] d_out_0;

  wire [7:0] d_sync; // input data after clock syncrhonizer
  wire x_c = 1'b0;  // no carry in
  wire [6:0] r;  // random dither bits
  wire [1:0] y7, y6, y5, y4;  // encoder outputs

  // input data sync reg
  ef_smsdac_sync u_sync(
    .clk(clk), 
    .rst_b(rst_b), 
    .d(d_in), 
    .q(d_sync));  

  // mismatch-shaping encoder
  ef_smsdac_mse u_dac(
    .clk(clk), 
    .rst_b(rst_b), 
    .en(en_enc),
    .x(d_sync), 
    .x_c(x_c), 
    .r(r), 
    .y7(y7),
    .y6(y6), 
    .y5(y5), 
    .y4(y4));

  // lfsr for encoder dither
  ef_smsdac_lfsr10_7 u_lfsr(
    .clk(clk), 
    .rst_b(rst_b), 
    .en(en_dith), 
    .r(r));
  
  // output retiming reg
  ef_smsdac_reg u_reg(
    .clk(clk), 
    .rst_b(rst_b), 
    .d({y7[1:0],y6[1:0],y5[1:0],y4[1:0]}), 
    .q({d_out_3[1:0],d_out_2[1:0],d_out_1[1:0],d_out_0[1:0]}));

endmodule
