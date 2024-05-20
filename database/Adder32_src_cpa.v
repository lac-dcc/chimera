// This program was cloned from: https://github.com/HVT06/Adder32
// License: Apache License 2.0


module cpa_16bit(x_in, y_in,sum);
  
  input [15:0] x_in;
  input [15:0] y_in;
  
  output [16:0] sum;
 
  wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16;
  
  assign c1 = x_in[0]&y_in[0];
  assign c2 = x_in[1]&y_in[1] | c1&(x_in[1]|y_in[1]);
  assign c3 = x_in[2]&y_in[2] | c2&(x_in[2]|y_in[2]);
  assign c4 = x_in[3]&y_in[3] | c3&(x_in[3]|y_in[3]);
  assign c5 = x_in[4]&y_in[4] | c4&(x_in[4]|y_in[4]);
  assign c6 = x_in[5]&y_in[5] | c5&(x_in[5]|y_in[5]);
  assign c7 = x_in[6]&y_in[6] | c6&(x_in[6]|y_in[6]);
  assign c8 = x_in[7]&y_in[7] | c7&(x_in[7]|y_in[7]);
  assign c9 = x_in[8]&y_in[8] | c8&(x_in[8]|y_in[8]);
  assign c10 = x_in[9]&y_in[9] | c9&(x_in[9]|y_in[9]);
  assign c11 = x_in[10]&y_in[10] | c10&(x_in[10]|y_in[10]);
  assign c12 = x_in[11]&y_in[11] | c11&(x_in[11]|y_in[11]);
  assign c13 = x_in[12]&y_in[12] | c12&(x_in[12]|y_in[12]);
  assign c14 = x_in[13]&y_in[13] | c13&(x_in[13]|y_in[13]);
  assign c15 = x_in[14]&y_in[14] | c14&(x_in[14]|y_in[14]);
  assign c16 = x_in[15]&y_in[15] | c15&(x_in[15]|y_in[15]);
  assign sum[16] = c16;
  
//fa(c_in, x_in, y_in, sum)
  fa_no_carry_out fa0(1'b0, x_in[0], y_in[0], sum[0]);
  fa_no_carry_out fa1(c1, x_in[1], y_in[1], sum[1]);
  fa_no_carry_out fa2(c2, x_in[2], y_in[2], sum[2]);
  fa_no_carry_out fa3(c3, x_in[3], y_in[3], sum[3]);
  fa_no_carry_out fa4(c4, x_in[4], y_in[4], sum[4]);
  fa_no_carry_out fa5(c5, x_in[5], y_in[5], sum[5]);
  fa_no_carry_out fa6(c6, x_in[6], y_in[6], sum[6]);
  fa_no_carry_out fa7(c7, x_in[7], y_in[7], sum[7]);
  fa_no_carry_out fa8(c8, x_in[8], y_in[8], sum[8]);
  fa_no_carry_out fa9(c9, x_in[9], y_in[9], sum[9]);
  fa_no_carry_out fa10(c10, x_in[10], y_in[10], sum[10]);
  fa_no_carry_out fa11(c11, x_in[11], y_in[11], sum[11]);
  fa_no_carry_out fa12(c12, x_in[12], y_in[12], sum[12]);
  fa_no_carry_out fa13(c13, x_in[13], y_in[13], sum[13]);
  fa_no_carry_out fa14(c14, x_in[14], y_in[14], sum[14]);
  fa_no_carry_out fa15(c15, x_in[15], y_in[15], sum[15]);
    
endmodule

module cpa_17bit(x_in, y_in,sum);
  
  input [16:0] x_in;
  input [16:0] y_in;
  
  output [17:0] sum;
 
  wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17;
  
  assign c1 = x_in[0]&y_in[0];
  assign c2 = x_in[1]&y_in[1] | c1&(x_in[1]|y_in[1]);
  assign c3 = x_in[2]&y_in[2] | c2&(x_in[2]|y_in[2]);
  assign c4 = x_in[3]&y_in[3] | c3&(x_in[3]|y_in[3]);
  assign c5 = x_in[4]&y_in[4] | c4&(x_in[4]|y_in[4]);
  assign c6 = x_in[5]&y_in[5] | c5&(x_in[5]|y_in[5]);
  assign c7 = x_in[6]&y_in[6] | c6&(x_in[6]|y_in[6]);
  assign c8 = x_in[7]&y_in[7] | c7&(x_in[7]|y_in[7]);
  assign c9 = x_in[8]&y_in[8] | c8&(x_in[8]|y_in[8]);
  assign c10 = x_in[9]&y_in[9] | c9&(x_in[9]|y_in[9]);
  assign c11 = x_in[10]&y_in[10] | c10&(x_in[10]|y_in[10]);
  assign c12 = x_in[11]&y_in[11] | c11&(x_in[11]|y_in[11]);
  assign c13 = x_in[12]&y_in[12] | c12&(x_in[12]|y_in[12]);
  assign c14 = x_in[13]&y_in[13] | c13&(x_in[13]|y_in[13]);
  assign c15 = x_in[14]&y_in[14] | c14&(x_in[14]|y_in[14]);
  assign c16 = x_in[15]&y_in[15] | c15&(x_in[15]|y_in[15]);
  assign c17 = x_in[16]&y_in[16] | c16&(x_in[16]|y_in[16]);
  assign sum[17] = c17;
//fa(c_in, x_in, y_in, sum)
  fa_no_carry_out fa0(1'b0, x_in[0], y_in[0], sum[0]);
  fa_no_carry_out fa1(c1, x_in[1], y_in[1], sum[1]);
  fa_no_carry_out fa2(c2, x_in[2], y_in[2], sum[2]);
  fa_no_carry_out fa3(c3, x_in[3], y_in[3], sum[3]);
  fa_no_carry_out fa4(c4, x_in[4], y_in[4], sum[4]);
  fa_no_carry_out fa5(c5, x_in[5], y_in[5], sum[5]);
  fa_no_carry_out fa6(c6, x_in[6], y_in[6], sum[6]);
  fa_no_carry_out fa7(c7, x_in[7], y_in[7], sum[7]);
  fa_no_carry_out fa8(c8, x_in[8], y_in[8], sum[8]);
  fa_no_carry_out fa9(c9, x_in[9], y_in[9], sum[9]);
  fa_no_carry_out fa10(c10, x_in[10], y_in[10], sum[10]);
  fa_no_carry_out fa11(c11, x_in[11], y_in[11], sum[11]);
  fa_no_carry_out fa12(c12, x_in[12], y_in[12], sum[12]);
  fa_no_carry_out fa13(c13, x_in[13], y_in[13], sum[13]);
  fa_no_carry_out fa14(c14, x_in[14], y_in[14], sum[14]);
  fa_no_carry_out fa15(c15, x_in[15], y_in[15], sum[15]);
  fa_no_carry_out fa16(c16, x_in[16], y_in[16], sum[16]);
    
endmodule

module modify_cpa_16bit(x_in, y_in,sum);
  
  input [15:0] x_in;
  input [15:0] y_in;
  
  output [15:0] sum;
 
  wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16;
  
  assign c1 = x_in[0]&y_in[0];
  assign c2 = x_in[1]&y_in[1] | c1&(x_in[1]|y_in[1]);
  assign c3 = x_in[2]&y_in[2] | c2&(x_in[2]|y_in[2]);
  assign c4 = x_in[3]&y_in[3] | c3&(x_in[3]|y_in[3]);
  assign c5 = x_in[4]&y_in[4] | c4&(x_in[4]|y_in[4]);
  assign c6 = x_in[5]&y_in[5] | c5&(x_in[5]|y_in[5]);
  assign c7 = x_in[6]&y_in[6] | c6&(x_in[6]|y_in[6]);
  assign c8 = x_in[7]&y_in[7] | c7&(x_in[7]|y_in[7]);
  assign c9 = x_in[8]&y_in[8] | c8&(x_in[8]|y_in[8]);
  assign c10 = x_in[9]&y_in[9] | c9&(x_in[9]|y_in[9]);
  assign c11 = x_in[10]&y_in[10] | c10&(x_in[10]|y_in[10]);
  assign c12 = x_in[11]&y_in[11] | c11&(x_in[11]|y_in[11]);
  assign c13 = x_in[12]&y_in[12] | c12&(x_in[12]|y_in[12]);
  assign c14 = x_in[13]&y_in[13] | c13&(x_in[13]|y_in[13]);
  assign c15 = x_in[14]&y_in[14] | c14&(x_in[14]|y_in[14]);
  assign sum[15] = c15;
  
//fa(c_in, x_in, y_in, sum)
  fa_no_carry_out fa0(1'b0, x_in[0], y_in[0], sum[0]);
  fa_no_carry_out fa1(c1, x_in[1], y_in[1], sum[1]);
  fa_no_carry_out fa2(c2, x_in[2], y_in[2], sum[2]);
  fa_no_carry_out fa3(c3, x_in[3], y_in[3], sum[3]);
  fa_no_carry_out fa4(c4, x_in[4], y_in[4], sum[4]);
  fa_no_carry_out fa5(c5, x_in[5], y_in[5], sum[5]);
  fa_no_carry_out fa6(c6, x_in[6], y_in[6], sum[6]);
  fa_no_carry_out fa7(c7, x_in[7], y_in[7], sum[7]);
  fa_no_carry_out fa8(c8, x_in[8], y_in[8], sum[8]);
  fa_no_carry_out fa9(c9, x_in[9], y_in[9], sum[9]);
  fa_no_carry_out fa10(c10, x_in[10], y_in[10], sum[10]);
  fa_no_carry_out fa11(c11, x_in[11], y_in[11], sum[11]);
  fa_no_carry_out fa12(c12, x_in[12], y_in[12], sum[12]);
  fa_no_carry_out fa13(c13, x_in[13], y_in[13], sum[13]);
  fa_no_carry_out fa14(c14, x_in[14], y_in[14], sum[14]);
  
    
endmodule