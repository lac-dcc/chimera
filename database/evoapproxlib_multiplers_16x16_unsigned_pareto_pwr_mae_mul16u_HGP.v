// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 1.54 %
// MAE = 66027520 
// WCE% = 6.15 %
// WCE = 264110081 
// WCRE% = 100.00 %
// EP% = 100.00 %
// MRE% = 15.90 %
// MSE = 61094.229e11 
// PDK45_PWR = 0.106 mW
// PDK45_AREA = 269.4 um2
// PDK45_DELAY = 0.81 ns


module mul16u_HGP ( A, B, O );
  input [15:0] A;
  input [15:0] B;
  output [31:0] O;

  wire C_12_11,C_12_12,C_12_13,C_12_14,C_13_11,C_13_12,C_13_13,C_13_14,C_14_11,C_14_12,C_14_13,C_14_14,C_15_11,C_15_12,C_15_13,C_15_14,S_11_11,S_11_12,S_11_13,S_11_14,S_11_15,S_12_10,S_12_11,S_12_12,S_12_13,S_12_14,S_12_15,S_13_10,S_13_11,S_13_12,S_13_13,S_13_14,S_13_15,S_13_9,S_14_10,S_14_11,S_14_12,S_14_13,S_14_14,S_14_15,S_14_8,S_14_9,S_15_10,S_15_11,S_15_12,S_15_13,S_15_14,S_15_15,S_15_7,S_15_8,S_15_9,S_16_10,S_16_11,S_16_12,S_16_13,S_16_14,S_16_15,S_16_6,S_16_7,S_16_8,S_16_9;

  assign S_11_11 = (A[11] & B[11]);
  assign S_11_12 = (A[11] & B[12]);
  assign S_11_13 = (A[11] & B[13]);
  assign S_11_14 = (A[11] & B[14]);
  assign S_11_15 = (A[11] & B[15]);
  assign S_12_10 = S_11_11;
  PDKGENHAX1 U24214 (.A(S_11_12), .B((A[12] & B[11])), .YS(S_12_11), .YC(C_12_11));
  PDKGENHAX1 U24215 (.A(S_11_13), .B((A[12] & B[12])), .YS(S_12_12), .YC(C_12_12));
  PDKGENHAX1 U24216 (.A(S_11_14), .B((A[12] & B[13])), .YS(S_12_13), .YC(C_12_13));
  PDKGENHAX1 U24217 (.A(S_11_15), .B((A[12] & B[14])), .YS(S_12_14), .YC(C_12_14));
  assign S_12_15 = (A[12] & B[15]);
  assign S_13_9 = S_12_10;
  assign S_13_10 = S_12_11;
  PDKGENFAX1 U24230 (.A(S_12_12), .B(C_12_11), .C((A[13] & B[11])), .YS(S_13_11), .YC(C_13_11));
  PDKGENFAX1 U24231 (.A(S_12_13), .B(C_12_12), .C((A[13] & B[12])), .YS(S_13_12), .YC(C_13_12));
  PDKGENFAX1 U24232 (.A(S_12_14), .B(C_12_13), .C((A[13] & B[13])), .YS(S_13_13), .YC(C_13_13));
  PDKGENFAX1 U24233 (.A(S_12_15), .B(C_12_14), .C((A[13] & B[14])), .YS(S_13_14), .YC(C_13_14));
  assign S_13_15 = (A[13] & B[15]);
  assign S_14_8 = S_13_9;
  assign S_14_9 = S_13_10;
  assign S_14_10 = S_13_11;
  PDKGENFAX1 U24246 (.A(S_13_12), .B(C_13_11), .C((A[14] & B[11])), .YS(S_14_11), .YC(C_14_11));
  PDKGENFAX1 U24247 (.A(S_13_13), .B(C_13_12), .C((A[14] & B[12])), .YS(S_14_12), .YC(C_14_12));
  PDKGENFAX1 U24248 (.A(S_13_14), .B(C_13_13), .C((A[14] & B[13])), .YS(S_14_13), .YC(C_14_13));
  PDKGENFAX1 U24249 (.A(S_13_15), .B(C_13_14), .C((A[14] & B[14])), .YS(S_14_14), .YC(C_14_14));
  assign S_14_15 = (A[14] & B[15]);
  assign S_15_7 = S_14_8;
  assign S_15_8 = S_14_9;
  assign S_15_9 = S_14_10;
  assign S_15_10 = S_14_11;
  PDKGENFAX1 U24262 (.A(S_14_12), .B(C_14_11), .C((A[15] & B[11])), .YS(S_15_11), .YC(C_15_11));
  PDKGENFAX1 U24263 (.A(S_14_13), .B(C_14_12), .C((A[15] & B[12])), .YS(S_15_12), .YC(C_15_12));
  PDKGENFAX1 U24264 (.A(S_14_14), .B(C_14_13), .C((A[15] & B[13])), .YS(S_15_13), .YC(C_15_13));
  PDKGENFAX1 U24265 (.A(S_14_15), .B(C_14_14), .C((A[15] & B[14])), .YS(S_15_14), .YC(C_15_14));
  assign S_15_15 = (A[15] & B[15]);
  assign S_16_6 = S_15_7;
  assign S_16_7 = S_15_8;
  assign S_16_8 = S_15_9;
  assign S_16_9 = S_15_10;
  assign S_16_10 = S_15_11;
  assign {S_16_15, S_16_14, S_16_13, S_16_12, S_16_11} = {C_15_14, C_15_13, C_15_12, C_15_11} + {S_15_15, S_15_14, S_15_13, S_15_12};
  assign O = {S_16_15,S_16_14,S_16_13,S_16_12,S_16_11,S_16_10,S_16_9,S_16_8,S_16_7,S_16_6,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

endmodule

/* mod */
module PDKGENHAX1( input A, input B, output YS, output YC );
    assign YS = A ^ B;
    assign YC = A & B;
endmodule
/* mod */
module PDKGENFAX1( input A, input B, input C, output YS, output YC );
    assign YS = (A ^ B) ^ C;
    assign YC = (A & B) | (B & C) | (A & C);
endmodule
