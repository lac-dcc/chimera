// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.52 %
// MAE = 340 
// WCE% = 2.66 %
// WCE = 1743 
// WCRE% = 6300.00 %
// EP% = 97.75 %
// MRE% = 27.44 %
// MSE = 191238 
// PDK45_PWR = 0.126 mW
// PDK45_AREA = 284.9 um2
// PDK45_DELAY = 0.94 ns


module mul8s_1L1G ( A, B, O );
  input [7:0] A;
  input [7:0] B;
  output [15:0] O;

  wire C_4_3,C_4_4,C_4_5,C_4_6,C_4_7,C_5_3,C_5_4,C_5_5,C_5_6,C_5_7,C_6_3,C_6_4,C_6_5,C_6_6,C_6_7,C_7_3,C_7_4,C_7_5,C_7_6,C_7_7,C_8_3,C_8_4,C_8_5,C_8_6,C_8_7,S_3_3,S_3_4,S_3_5,S_3_6,S_3_7,S_4_2,S_4_3,S_4_4,S_4_5,S_4_6,S_4_7,S_5_1,S_5_2,S_5_3,S_5_4,S_5_5,S_5_6,S_5_7,S_6_0,S_6_1,S_6_2,S_6_3,S_6_4,S_6_5,S_6_6,S_6_7,S_7_0,S_7_1,S_7_2,S_7_3,S_7_4,S_7_5,S_7_6,S_7_7,S_8_0,S_8_1,S_8_2,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7;

  assign S_3_3 = (A[3] & B[3]);
  assign S_3_4 = (A[3] & B[4]);
  assign S_3_5 = (A[3] & B[5]);
  assign S_3_6 = (A[3] & B[6]);
  assign S_3_7 = ~(A[3] & B[7]);
  assign S_4_2 = S_3_3;
  PDKGENHAX1 U468 (.A(S_3_4), .B((A[4] & B[3])), .YS(S_4_3), .YC(C_4_3));
  PDKGENHAX1 U469 (.A(S_3_5), .B((A[4] & B[4])), .YS(S_4_4), .YC(C_4_4));
  PDKGENHAX1 U470 (.A(S_3_6), .B((A[4] & B[5])), .YS(S_4_5), .YC(C_4_5));
  PDKGENHAX1 U471 (.A(S_3_7), .B((A[4] & B[6])), .YS(S_4_6), .YC(C_4_6));
  PDKGENHAX1 U472 (.A(1'b1), .B(~(A[4] & B[7])), .YS(S_4_7), .YC(C_4_7));
  assign S_5_1 = S_4_2;
  assign S_5_2 = S_4_3;
  PDKGENFAX1 U476 (.A(S_4_4), .B(C_4_3), .C((A[5] & B[3])), .YS(S_5_3), .YC(C_5_3));
  PDKGENFAX1 U477 (.A(S_4_5), .B(C_4_4), .C((A[5] & B[4])), .YS(S_5_4), .YC(C_5_4));
  PDKGENFAX1 U478 (.A(S_4_6), .B(C_4_5), .C((A[5] & B[5])), .YS(S_5_5), .YC(C_5_5));
  PDKGENFAX1 U479 (.A(S_4_7), .B(C_4_6), .C((A[5] & B[6])), .YS(S_5_6), .YC(C_5_6));
  PDKGENHAX1 U480 (.A(C_4_7), .B(~(A[5] & B[7])), .YS(S_5_7), .YC(C_5_7));
  assign S_6_0 = S_5_1;
  assign S_6_1 = S_5_2;
  assign S_6_2 = S_5_3;
  PDKGENFAX1 U484 (.A(S_5_4), .B(C_5_3), .C((A[6] & B[3])), .YS(S_6_3), .YC(C_6_3));
  PDKGENFAX1 U485 (.A(S_5_5), .B(C_5_4), .C((A[6] & B[4])), .YS(S_6_4), .YC(C_6_4));
  PDKGENFAX1 U486 (.A(S_5_6), .B(C_5_5), .C((A[6] & B[5])), .YS(S_6_5), .YC(C_6_5));
  PDKGENFAX1 U487 (.A(S_5_7), .B(C_5_6), .C((A[6] & B[6])), .YS(S_6_6), .YC(C_6_6));
  PDKGENHAX1 U488 (.A(C_5_7), .B(~(A[6] & B[7])), .YS(S_6_7), .YC(C_6_7));
  assign S_7_0 = S_6_1;
  assign S_7_1 = S_6_2;
  assign S_7_2 = S_6_3;
  PDKGENFAX1 U492 (.A(S_6_4), .B(C_6_3), .C(~(A[7] & B[3])), .YS(S_7_3), .YC(C_7_3));
  PDKGENFAX1 U493 (.A(S_6_5), .B(C_6_4), .C(~(A[7] & B[4])), .YS(S_7_4), .YC(C_7_4));
  PDKGENFAX1 U494 (.A(S_6_6), .B(C_6_5), .C(~(A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  PDKGENFAX1 U495 (.A(S_6_7), .B(C_6_6), .C(~(A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  PDKGENHAX1 U496 (.A(C_6_7), .B((A[7] & B[7])), .YS(S_7_7), .YC(C_7_7));
  assign S_8_0 = S_7_1;
  assign S_8_1 = S_7_2;
  assign S_8_2 = S_7_3;
  PDKGENHAX1 U500 (.A(S_7_4), .B(C_7_3), .YS(S_8_3), .YC(C_8_3));
  PDKGENFAX1 U501 (.A(S_7_5), .B(C_8_3), .C(C_7_4), .YS(S_8_4), .YC(C_8_4));
  PDKGENFAX1 U502 (.A(S_7_6), .B(C_8_4), .C(C_7_5), .YS(S_8_5), .YC(C_8_5));
  PDKGENFAX1 U503 (.A(S_7_7), .B(C_8_5), .C(C_7_6), .YS(S_8_6), .YC(C_8_6));
  PDKGENFAX1 U504 (.A(1'b1), .B(C_8_6), .C(C_7_7), .YS(S_8_7), .YC(C_8_7));
  assign O = {S_8_7,S_8_6,S_8_5,S_8_4,S_8_3,S_8_2,S_8_1,S_8_0,S_7_0,S_6_0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

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
