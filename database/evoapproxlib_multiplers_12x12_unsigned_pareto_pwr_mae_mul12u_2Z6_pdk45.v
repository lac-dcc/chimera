/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 2.72 %
// MAE = 456704 
// WCE% = 10.89 %
// WCE = 1826817 
// WCRE% = 100.00 %
// EP% = 99.95 %
// MRE% = 26.78 %
// MSE = 27178.297e7 
// PDK45_PWR = 0.069 mW
// PDK45_AREA = 195.2 um2
// PDK45_DELAY = 0.89 ns


module mul12u_2Z6 ( A, B, O );
  input [11:0] A;
  input [11:0] B;
  output [23:0] O;

  wire C_10_10,C_10_8,C_10_9,C_11_10,C_11_7,C_11_8,C_11_9,C_8_10,C_9_10,C_9_9,S_10_10,S_10_11,S_10_8,S_10_9,S_11_10,S_11_11,S_11_7,S_11_8,S_11_9,S_12_10,S_12_11,S_12_6,S_12_7,S_12_8,S_12_9,S_7_11,S_8_10,S_8_11,S_9_10,S_9_11,S_9_9;

  assign S_7_11 = (A[7] & B[11]);
  HAX1 U292163 (.A(S_7_11), .B((A[8] & B[10])), .YS(S_8_10), .YC(C_8_10));
  assign S_8_11 = (A[8] & B[11]);
  HAX1 U292174 (.A(S_8_10), .B((A[9] & B[9])), .YS(S_9_9), .YC(C_9_9));
  FAX1 U292175 (.A(S_8_11), .B(C_8_10), .C((A[9] & B[10])), .YS(S_9_10), .YC(C_9_10));
  assign S_9_11 = (A[9] & B[11]);
  HAX1 U292185 (.A(S_9_9), .B((A[10] & B[8])), .YS(S_10_8), .YC(C_10_8));
  FAX1 U292186 (.A(S_9_10), .B(C_9_9), .C((A[10] & B[9])), .YS(S_10_9), .YC(C_10_9));
  FAX1 U292187 (.A(S_9_11), .B(C_9_10), .C((A[10] & B[10])), .YS(S_10_10), .YC(C_10_10));
  assign S_10_11 = (A[10] & B[11]);
  HAX1 U292196 (.A(S_10_8), .B((A[11] & B[7])), .YS(S_11_7), .YC(C_11_7));
  FAX1 U292197 (.A(S_10_9), .B(C_10_8), .C((A[11] & B[8])), .YS(S_11_8), .YC(C_11_8));
  FAX1 U292198 (.A(S_10_10), .B(C_10_9), .C((A[11] & B[9])), .YS(S_11_9), .YC(C_11_9));
  FAX1 U292199 (.A(S_10_11), .B(C_10_10), .C((A[11] & B[10])), .YS(S_11_10), .YC(C_11_10));
  assign S_11_11 = (A[11] & B[11]);
  assign {S_12_11, S_12_10, S_12_9, S_12_8, S_12_7, S_12_6} = {C_11_10, C_11_9, C_11_8, C_11_7, 1'b0} + {S_11_11, S_11_10, S_11_9, S_11_8, S_11_7};
  assign O = {S_12_11,S_12_10,S_12_9,S_12_8,S_12_7,S_12_6,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

endmodule

