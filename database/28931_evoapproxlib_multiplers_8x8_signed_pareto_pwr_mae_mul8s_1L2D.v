// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.23 %
// MAE = 150 
// WCE% = 1.16 %
// WCE = 759 
// WCRE% = 1500.00 %
// EP% = 93.16 %
// MRE% = 12.26 %
// MSE = 38236 
// PDK45_PWR = 0.200 mW
// PDK45_AREA = 411.6 um2
// PDK45_DELAY = 1.14 ns


module mul8s_1L2D ( A, B, O );
  input [7:0] A;
  input [7:0] B;
  output [15:0] O;

  wire C_3_2,C_3_3,C_3_4,C_3_5,C_3_6,C_3_7,C_4_2,C_4_3,C_4_4,C_4_5,C_4_6,C_4_7,C_5_2,C_5_3,C_5_4,C_5_5,C_5_6,C_5_7,C_6_2,C_6_3,C_6_4,C_6_5,C_6_6,C_6_7,C_7_2,C_7_3,C_7_4,C_7_5,C_7_6,C_7_7,C_8_2,C_8_3,C_8_4,C_8_5,C_8_6,C_8_7,S_2_2,S_2_3,S_2_4,S_2_5,S_2_6,S_2_7,S_3_1,S_3_2,S_3_3,S_3_4,S_3_5,S_3_6,S_3_7,S_4_0,S_4_1,S_4_2,S_4_3,S_4_4,S_4_5,S_4_6,S_4_7,S_5_0,S_5_1,S_5_2,S_5_3,S_5_4,S_5_5,S_5_6,S_5_7,S_6_0,S_6_1,S_6_2,S_6_3,S_6_4,S_6_5,S_6_6,S_6_7,S_7_0,S_7_1,S_7_2,S_7_3,S_7_4,S_7_5,S_7_6,S_7_7,S_8_0,S_8_1,S_8_2,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7;

  assign S_2_2 = (A[2] & B[2]);
  assign S_2_3 = (A[2] & B[3]);
  assign S_2_4 = (A[2] & B[4]);
  assign S_2_5 = (A[2] & B[5]);
  assign S_2_6 = (A[2] & B[6]);
  assign S_2_7 = ~(A[2] & B[7]);
  assign S_3_1 = S_2_2;
  PDKGENHAX1 U315 (.A(S_2_3), .B((A[3] & B[2])), .YS(S_3_2), .YC(C_3_2));
  PDKGENHAX1 U316 (.A(S_2_4), .B((A[3] & B[3])), .YS(S_3_3), .YC(C_3_3));
  PDKGENHAX1 U317 (.A(S_2_5), .B((A[3] & B[4])), .YS(S_3_4), .YC(C_3_4));
  PDKGENHAX1 U318 (.A(S_2_6), .B((A[3] & B[5])), .YS(S_3_5), .YC(C_3_5));
  PDKGENHAX1 U319 (.A(S_2_7), .B((A[3] & B[6])), .YS(S_3_6), .YC(C_3_6));
  PDKGENHAX1 U320 (.A(1'b1), .B(~(A[3] & B[7])), .YS(S_3_7), .YC(C_3_7));
  assign S_4_0 = S_3_1;
  assign S_4_1 = S_3_2;
  PDKGENFAX1 U323 (.A(S_3_3), .B(C_3_2), .C((A[4] & B[2])), .YS(S_4_2), .YC(C_4_2));
  PDKGENFAX1 U324 (.A(S_3_4), .B(C_3_3), .C((A[4] & B[3])), .YS(S_4_3), .YC(C_4_3));
  PDKGENFAX1 U325 (.A(S_3_5), .B(C_3_4), .C((A[4] & B[4])), .YS(S_4_4), .YC(C_4_4));
  PDKGENFAX1 U326 (.A(S_3_6), .B(C_3_5), .C((A[4] & B[5])), .YS(S_4_5), .YC(C_4_5));
  PDKGENFAX1 U327 (.A(S_3_7), .B(C_3_6), .C((A[4] & B[6])), .YS(S_4_6), .YC(C_4_6));
  PDKGENHAX1 U328 (.A(C_3_7), .B(~(A[4] & B[7])), .YS(S_4_7), .YC(C_4_7));
  assign S_5_0 = S_4_1;
  assign S_5_1 = S_4_2;
  PDKGENFAX1 U331 (.A(S_4_3), .B(C_4_2), .C((A[5] & B[2])), .YS(S_5_2), .YC(C_5_2));
  PDKGENFAX1 U332 (.A(S_4_4), .B(C_4_3), .C((A[5] & B[3])), .YS(S_5_3), .YC(C_5_3));
  PDKGENFAX1 U333 (.A(S_4_5), .B(C_4_4), .C((A[5] & B[4])), .YS(S_5_4), .YC(C_5_4));
  PDKGENFAX1 U334 (.A(S_4_6), .B(C_4_5), .C((A[5] & B[5])), .YS(S_5_5), .YC(C_5_5));
  PDKGENFAX1 U335 (.A(S_4_7), .B(C_4_6), .C((A[5] & B[6])), .YS(S_5_6), .YC(C_5_6));
  PDKGENHAX1 U336 (.A(C_4_7), .B(~(A[5] & B[7])), .YS(S_5_7), .YC(C_5_7));
  assign S_6_0 = S_5_1;
  assign S_6_1 = S_5_2;
  PDKGENFAX1 U339 (.A(S_5_3), .B(C_5_2), .C((A[6] & B[2])), .YS(S_6_2), .YC(C_6_2));
  PDKGENFAX1 U340 (.A(S_5_4), .B(C_5_3), .C((A[6] & B[3])), .YS(S_6_3), .YC(C_6_3));
  PDKGENFAX1 U341 (.A(S_5_5), .B(C_5_4), .C((A[6] & B[4])), .YS(S_6_4), .YC(C_6_4));
  PDKGENFAX1 U342 (.A(S_5_6), .B(C_5_5), .C((A[6] & B[5])), .YS(S_6_5), .YC(C_6_5));
  PDKGENFAX1 U343 (.A(S_5_7), .B(C_5_6), .C((A[6] & B[6])), .YS(S_6_6), .YC(C_6_6));
  PDKGENHAX1 U344 (.A(C_5_7), .B(~(A[6] & B[7])), .YS(S_6_7), .YC(C_6_7));
  assign S_7_0 = S_6_1;
  assign S_7_1 = S_6_2;
  PDKGENFAX1 U347 (.A(S_6_3), .B(C_6_2), .C(~(A[7] & B[2])), .YS(S_7_2), .YC(C_7_2));
  PDKGENFAX1 U348 (.A(S_6_4), .B(C_6_3), .C(~(A[7] & B[3])), .YS(S_7_3), .YC(C_7_3));
  PDKGENFAX1 U349 (.A(S_6_5), .B(C_6_4), .C(~(A[7] & B[4])), .YS(S_7_4), .YC(C_7_4));
  PDKGENFAX1 U350 (.A(S_6_6), .B(C_6_5), .C(~(A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  PDKGENFAX1 U351 (.A(S_6_7), .B(C_6_6), .C(~(A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  PDKGENHAX1 U352 (.A(C_6_7), .B((A[7] & B[7])), .YS(S_7_7), .YC(C_7_7));
  assign S_8_0 = S_7_1;
  assign S_8_1 = S_7_2;
  PDKGENHAX1 U355 (.A(S_7_3), .B(C_7_2), .YS(S_8_2), .YC(C_8_2));
  PDKGENFAX1 U356 (.A(S_7_4), .B(C_8_2), .C(C_7_3), .YS(S_8_3), .YC(C_8_3));
  PDKGENFAX1 U357 (.A(S_7_5), .B(C_8_3), .C(C_7_4), .YS(S_8_4), .YC(C_8_4));
  PDKGENFAX1 U358 (.A(S_7_6), .B(C_8_4), .C(C_7_5), .YS(S_8_5), .YC(C_8_5));
  PDKGENFAX1 U359 (.A(S_7_7), .B(C_8_5), .C(C_7_6), .YS(S_8_6), .YC(C_8_6));
  PDKGENFAX1 U360 (.A(1'b1), .B(C_8_6), .C(C_7_7), .YS(S_8_7), .YC(C_8_7));
  assign O = {S_8_7,S_8_6,S_8_5,S_8_4,S_8_3,S_8_2,S_8_1,S_8_0,S_7_0,S_6_0,S_5_0,S_4_0,1'b0,1'b0,1'b0,1'b0};

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
