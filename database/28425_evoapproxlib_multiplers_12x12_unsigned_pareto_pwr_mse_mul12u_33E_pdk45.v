// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 3.02 %
// MAE = 505856 
// WCE% = 12.06 %
// WCE = 2023425 
// WCRE% = 100.00 %
// EP% = 99.95 %
// MRE% = 26.71 %
// MSE = 36219.961e7 
// PDK45_PWR = 0.055 mW
// PDK45_AREA = 167.5 um2
// PDK45_DELAY = 0.62 ns


module mul12u_33E ( A, B, O );
  input [11:0] A;
  input [11:0] B;
  output [23:0] O;

  wire C_10_10,C_10_8,C_10_9,C_11_10,C_11_8,C_11_9,C_12_10,C_12_8,C_12_9,C_9_10,C_9_8,C_9_9,S_10_10,S_10_11,S_10_6,S_10_7,S_10_8,S_10_9,S_11_10,S_11_11,S_11_5,S_11_6,S_11_7,S_11_8,S_11_9,S_12_10,S_12_11,S_12_4,S_12_5,S_12_6,S_12_7,S_12_8,S_12_9,S_8_10,S_8_11,S_8_8,S_8_9,S_9_10,S_9_11,S_9_7,S_9_8,S_9_9;

  assign S_8_8 = (A[8] & B[8]);
  assign S_8_9 = (A[8] & B[9]);
  assign S_8_10 = (A[8] & B[10]);
  assign S_8_11 = (A[8] & B[11]);
  assign S_9_7 = S_8_8;
  HAX1 U3765 (.A(S_8_9), .B((A[9] & B[8])), .YS(S_9_8), .YC(C_9_8));
  HAX1 U3766 (.A(S_8_10), .B((A[9] & B[9])), .YS(S_9_9), .YC(C_9_9));
  HAX1 U3767 (.A(S_8_11), .B((A[9] & B[10])), .YS(S_9_10), .YC(C_9_10));
  assign S_9_11 = (A[9] & B[11]);
  assign S_10_6 = S_9_7;
  assign S_10_7 = S_9_8;
  FAX1 U3777 (.A(S_9_9), .B(C_9_8), .C((A[10] & B[8])), .YS(S_10_8), .YC(C_10_8));
  FAX1 U3778 (.A(S_9_10), .B(C_9_9), .C((A[10] & B[9])), .YS(S_10_9), .YC(C_10_9));
  FAX1 U3779 (.A(S_9_11), .B(C_9_10), .C((A[10] & B[10])), .YS(S_10_10), .YC(C_10_10));
  assign S_10_11 = (A[10] & B[11]);
  assign S_11_5 = S_10_6;
  assign S_11_6 = S_10_7;
  assign S_11_7 = S_10_8;
  FAX1 U3789 (.A(S_10_9), .B(C_10_8), .C((A[11] & B[8])), .YS(S_11_8), .YC(C_11_8));
  FAX1 U3790 (.A(S_10_10), .B(C_10_9), .C((A[11] & B[9])), .YS(S_11_9), .YC(C_11_9));
  FAX1 U3791 (.A(S_10_11), .B(C_10_10), .C((A[11] & B[10])), .YS(S_11_10), .YC(C_11_10));
  assign S_11_11 = (A[11] & B[11]);
  assign S_12_4 = S_11_5;
  assign S_12_5 = S_11_6;
  assign S_12_6 = S_11_7;
  assign S_12_7 = S_11_8;
  HAX1 U3801 (.A(S_11_9), .B(C_11_8), .YS(S_12_8), .YC(C_12_8));
  FAX1 U3802 (.A(S_11_10), .B(C_12_8), .C(C_11_9), .YS(S_12_9), .YC(C_12_9));
  FAX1 U3803 (.A(S_11_11), .B(C_12_9), .C(C_11_10), .YS(S_12_10), .YC(C_12_10));
  assign S_12_11 = C_12_10;
  assign O = {S_12_11,S_12_10,S_12_9,S_12_8,S_12_7,S_12_6,S_12_5,S_12_4,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

endmodule

