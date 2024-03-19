/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 3.08 %
// MAE = 2016 
// WCE% = 12.30 %
// WCE = 8064 
// WCRE% = 6300.00 %
// EP% = 98.05 %
// MRE% = 135.77 %
// MSE = 72829.102e2 
// PDK45_PWR = 0.052 mW
// PDK45_AREA = 172.2 um2
// PDK45_DELAY = 0.89 ns


module mul8s_1KR3 ( A, B, O );
  input [7:0] A;
  input [7:0] B;
  output [15:0] O;

  wire C_6_1,C_6_7,C_7_0,C_7_1,C_7_2,C_7_3,C_7_4,C_7_5,C_7_6,C_7_7,S_0_7,S_1_6,S_2_5,S_3_4,S_4_3,S_5_2,S_6_0,S_6_1,S_6_2,S_6_3,S_6_4,S_6_5,S_6_6,S_6_7,S_7_0,S_7_1,S_7_2,S_7_3,S_7_4,S_7_5,S_7_6,S_7_7,S_8_0,S_8_1,S_8_2,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7,S_8_8;

  assign S_0_7 = 1'b1;
  assign S_1_6 = 1'b1;
  assign S_2_5 = 1'b1;
  assign S_3_4 = 1'b1;
  assign S_4_3 = 1'b1;
  assign S_5_2 = 1'b1;
  assign S_6_0 = (A[6] & B[0]);
  HAX1 U292374 (.A(S_5_2), .B((A[6] & B[1])), .YS(S_6_1), .YC(C_6_1));
  assign S_6_2 = (A[6] & B[2]);
  assign S_6_3 = (A[6] & B[3]);
  assign S_6_4 = (A[6] & B[4]);
  assign S_6_5 = (A[6] & B[5]);
  assign S_6_6 = (A[6] & B[6]);
  HAX1 U292380 (.A(1'b1), .B(~(A[6] & B[7])), .YS(S_6_7), .YC(C_6_7));
  HAX1 U292381 (.A(S_6_1), .B(~(A[7] & B[0])), .YS(S_7_0), .YC(C_7_0));
  FAX1 U292382 (.A(S_6_2), .B(C_6_1), .C(~(A[7] & B[1])), .YS(S_7_1), .YC(C_7_1));
  HAX1 U292383 (.A(S_6_3), .B(~(A[7] & B[2])), .YS(S_7_2), .YC(C_7_2));
  HAX1 U292384 (.A(S_6_4), .B(~(A[7] & B[3])), .YS(S_7_3), .YC(C_7_3));
  HAX1 U292385 (.A(S_6_5), .B(~(A[7] & B[4])), .YS(S_7_4), .YC(C_7_4));
  HAX1 U292386 (.A(S_6_6), .B(~(A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  HAX1 U292387 (.A(S_6_7), .B(~(A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  HAX1 U292388 (.A(C_6_7), .B((A[7] & B[7])), .YS(S_7_7), .YC(C_7_7));
  assign {S_8_8, S_8_7, S_8_6, S_8_5, S_8_4, S_8_3, S_8_2, S_8_1, S_8_0} = {C_7_7, C_7_6, C_7_5, C_7_4, C_7_3, C_7_2, C_7_1, C_7_0} + {1'b1, S_7_7, S_7_6, S_7_5, S_7_4, S_7_3, S_7_2, S_7_1};
  assign O = {S_8_7,S_8_6,S_8_5,S_8_4,S_8_3,S_8_2,S_8_1,S_8_0,S_7_0,S_6_0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

endmodule

