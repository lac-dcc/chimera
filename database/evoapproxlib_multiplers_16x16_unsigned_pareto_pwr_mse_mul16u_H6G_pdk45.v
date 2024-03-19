/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 1.76 %
// MAE = 75464704 
// WCE% = 7.03 %
// WCE = 301858817 
// WCRE% = 100.00 %
// EP% = 100.00 %
// MRE% = 19.30 %
// MSE = 73909.015e11 
// PDK45_PWR = 0.101 mW
// PDK45_AREA = 244.0 um2
// PDK45_DELAY = 1.03 ns


module mul16u_H6G ( A, B, O );
  input [15:0] A;
  input [15:0] B;
  output [31:0] O;

  wire C_12_13,C_12_14,C_13_12,C_13_13,C_13_14,C_14_11,C_14_12,C_14_13,C_14_14,C_15_10,C_15_11,C_15_12,C_15_13,C_15_14,C_16_10,C_16_11,C_16_12,C_16_13,C_16_14,S_11_14,S_11_15,S_12_13,S_12_14,S_12_15,S_13_12,S_13_13,S_13_14,S_13_15,S_14_11,S_14_12,S_14_13,S_14_14,S_14_15,S_15_10,S_15_11,S_15_12,S_15_13,S_15_14,S_15_15,S_16_10,S_16_11,S_16_12,S_16_13,S_16_14,S_16_15,S_16_9;

  assign S_11_14 = (A[11] & B[14]);
  assign S_11_15 = (A[11] & B[15]);
  HAX1 U231294 (.A(S_11_14), .B((A[12] & B[13])), .YS(S_12_13), .YC(C_12_13));
  HAX1 U231295 (.A(S_11_15), .B((A[12] & B[14])), .YS(S_12_14), .YC(C_12_14));
  assign S_12_15 = (A[12] & B[15]);
  HAX1 U231309 (.A(S_12_13), .B((A[13] & B[12])), .YS(S_13_12), .YC(C_13_12));
  FAX1 U231310 (.A(S_12_14), .B(C_12_13), .C((A[13] & B[13])), .YS(S_13_13), .YC(C_13_13));
  FAX1 U231311 (.A(S_12_15), .B(C_12_14), .C((A[13] & B[14])), .YS(S_13_14), .YC(C_13_14));
  assign S_13_15 = (A[13] & B[15]);
  HAX1 U231324 (.A(S_13_12), .B((A[14] & B[11])), .YS(S_14_11), .YC(C_14_11));
  FAX1 U231325 (.A(S_13_13), .B(C_13_12), .C((A[14] & B[12])), .YS(S_14_12), .YC(C_14_12));
  FAX1 U231326 (.A(S_13_14), .B(C_13_13), .C((A[14] & B[13])), .YS(S_14_13), .YC(C_14_13));
  FAX1 U231327 (.A(S_13_15), .B(C_13_14), .C((A[14] & B[14])), .YS(S_14_14), .YC(C_14_14));
  assign S_14_15 = (A[14] & B[15]);
  HAX1 U231339 (.A(S_14_11), .B((A[15] & B[10])), .YS(S_15_10), .YC(C_15_10));
  FAX1 U231340 (.A(S_14_12), .B(C_14_11), .C((A[15] & B[11])), .YS(S_15_11), .YC(C_15_11));
  FAX1 U231341 (.A(S_14_13), .B(C_14_12), .C((A[15] & B[12])), .YS(S_15_12), .YC(C_15_12));
  FAX1 U231342 (.A(S_14_14), .B(C_14_13), .C((A[15] & B[13])), .YS(S_15_13), .YC(C_15_13));
  FAX1 U231343 (.A(S_14_15), .B(C_14_14), .C((A[15] & B[14])), .YS(S_15_14), .YC(C_15_14));
  assign S_15_15 = (A[15] & B[15]);
  assign S_16_9 = S_15_10;
  HAX1 U231355 (.A(S_15_11), .B(C_15_10), .YS(S_16_10), .YC(C_16_10));
  FAX1 U231356 (.A(S_15_12), .B(C_16_10), .C(C_15_11), .YS(S_16_11), .YC(C_16_11));
  FAX1 U231357 (.A(S_15_13), .B(C_16_11), .C(C_15_12), .YS(S_16_12), .YC(C_16_12));
  FAX1 U231358 (.A(S_15_14), .B(C_16_12), .C(C_15_13), .YS(S_16_13), .YC(C_16_13));
  FAX1 U231359 (.A(S_15_15), .B(C_16_13), .C(C_15_14), .YS(S_16_14), .YC(C_16_14));
  assign S_16_15 = C_16_14;
  assign O = {S_16_15,S_16_14,S_16_13,S_16_12,S_16_11,S_16_10,S_16_9,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

endmodule

