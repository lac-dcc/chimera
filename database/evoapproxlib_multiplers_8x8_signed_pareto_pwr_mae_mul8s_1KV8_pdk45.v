/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.00 %
// MAE = 0 
// WCE% = 0.00 %
// WCE = 0 
// WCRE% = 0.00 %
// EP% = 0.00 %
// MRE% = 0.00 %
// MSE = 0 
// PDK45_PWR = 0.425 mW
// PDK45_AREA = 729.8 um2
// PDK45_DELAY = 1.48 ns


module mul8s_1KV8 ( A, B, O );
  input [7:0] A;
  input [7:0] B;
  output [15:0] O;

  wire C_1_0,C_1_1,C_1_2,C_1_3,C_1_4,C_1_5,C_1_6,C_1_7,C_2_0,C_2_1,C_2_2,C_2_3,C_2_4,C_2_5,C_2_6,C_2_7,C_3_0,C_3_1,C_3_2,C_3_3,C_3_4,C_3_5,C_3_6,C_3_7,C_4_0,C_4_1,C_4_2,C_4_3,C_4_4,C_4_5,C_4_6,C_4_7,C_5_0,C_5_1,C_5_2,C_5_3,C_5_4,C_5_5,C_5_6,C_5_7,C_6_0,C_6_1,C_6_2,C_6_3,C_6_4,C_6_5,C_6_6,C_6_7,C_7_0,C_7_1,C_7_2,C_7_3,C_7_4,C_7_5,C_7_6,C_7_7,C_8_0,C_8_1,C_8_2,C_8_3,C_8_4,C_8_5,C_8_6,C_8_7,S_0_0,S_0_1,S_0_2,S_0_3,S_0_4,S_0_5,S_0_6,S_0_7,S_1_0,S_1_1,S_1_2,S_1_3,S_1_4,S_1_5,S_1_6,S_1_7,S_2_0,S_2_1,S_2_2,S_2_3,S_2_4,S_2_5,S_2_6,S_2_7,S_3_0,S_3_1,S_3_2,S_3_3,S_3_4,S_3_5,S_3_6,S_3_7,S_4_0,S_4_1,S_4_2,S_4_3,S_4_4,S_4_5,S_4_6,S_4_7,S_5_0,S_5_1,S_5_2,S_5_3,S_5_4,S_5_5,S_5_6,S_5_7,S_6_0,S_6_1,S_6_2,S_6_3,S_6_4,S_6_5,S_6_6,S_6_7,S_7_0,S_7_1,S_7_2,S_7_3,S_7_4,S_7_5,S_7_6,S_7_7,S_8_0,S_8_1,S_8_2,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7;

  assign S_0_0 = (A[0] & B[0]);
  assign S_0_1 = (A[0] & B[1]);
  assign S_0_2 = (A[0] & B[2]);
  assign S_0_3 = (A[0] & B[3]);
  assign S_0_4 = (A[0] & B[4]);
  assign S_0_5 = (A[0] & B[5]);
  assign S_0_6 = (A[0] & B[6]);
  assign S_0_7 = ~(A[0] & B[7]);
  HAX1 U9 (.A(S_0_1), .B((A[1] & B[0])), .YS(S_1_0), .YC(C_1_0));
  HAX1 U10 (.A(S_0_2), .B((A[1] & B[1])), .YS(S_1_1), .YC(C_1_1));
  HAX1 U11 (.A(S_0_3), .B((A[1] & B[2])), .YS(S_1_2), .YC(C_1_2));
  HAX1 U12 (.A(S_0_4), .B((A[1] & B[3])), .YS(S_1_3), .YC(C_1_3));
  HAX1 U13 (.A(S_0_5), .B((A[1] & B[4])), .YS(S_1_4), .YC(C_1_4));
  HAX1 U14 (.A(S_0_6), .B((A[1] & B[5])), .YS(S_1_5), .YC(C_1_5));
  HAX1 U15 (.A(S_0_7), .B((A[1] & B[6])), .YS(S_1_6), .YC(C_1_6));
  HAX1 U16 (.A(1'b1), .B(~(A[1] & B[7])), .YS(S_1_7), .YC(C_1_7));
  FAX1 U17 (.A(S_1_1), .B(C_1_0), .C((A[2] & B[0])), .YS(S_2_0), .YC(C_2_0));
  FAX1 U18 (.A(S_1_2), .B(C_1_1), .C((A[2] & B[1])), .YS(S_2_1), .YC(C_2_1));
  FAX1 U19 (.A(S_1_3), .B(C_1_2), .C((A[2] & B[2])), .YS(S_2_2), .YC(C_2_2));
  FAX1 U20 (.A(S_1_4), .B(C_1_3), .C((A[2] & B[3])), .YS(S_2_3), .YC(C_2_3));
  FAX1 U21 (.A(S_1_5), .B(C_1_4), .C((A[2] & B[4])), .YS(S_2_4), .YC(C_2_4));
  FAX1 U22 (.A(S_1_6), .B(C_1_5), .C((A[2] & B[5])), .YS(S_2_5), .YC(C_2_5));
  FAX1 U23 (.A(S_1_7), .B(C_1_6), .C((A[2] & B[6])), .YS(S_2_6), .YC(C_2_6));
  HAX1 U24 (.A(C_1_7), .B(~(A[2] & B[7])), .YS(S_2_7), .YC(C_2_7));
  FAX1 U25 (.A(S_2_1), .B(C_2_0), .C((A[3] & B[0])), .YS(S_3_0), .YC(C_3_0));
  FAX1 U26 (.A(S_2_2), .B(C_2_1), .C((A[3] & B[1])), .YS(S_3_1), .YC(C_3_1));
  FAX1 U27 (.A(S_2_3), .B(C_2_2), .C((A[3] & B[2])), .YS(S_3_2), .YC(C_3_2));
  FAX1 U28 (.A(S_2_4), .B(C_2_3), .C((A[3] & B[3])), .YS(S_3_3), .YC(C_3_3));
  FAX1 U29 (.A(S_2_5), .B(C_2_4), .C((A[3] & B[4])), .YS(S_3_4), .YC(C_3_4));
  FAX1 U30 (.A(S_2_6), .B(C_2_5), .C((A[3] & B[5])), .YS(S_3_5), .YC(C_3_5));
  FAX1 U31 (.A(S_2_7), .B(C_2_6), .C((A[3] & B[6])), .YS(S_3_6), .YC(C_3_6));
  HAX1 U32 (.A(C_2_7), .B(~(A[3] & B[7])), .YS(S_3_7), .YC(C_3_7));
  FAX1 U33 (.A(S_3_1), .B(C_3_0), .C((A[4] & B[0])), .YS(S_4_0), .YC(C_4_0));
  FAX1 U34 (.A(S_3_2), .B(C_3_1), .C((A[4] & B[1])), .YS(S_4_1), .YC(C_4_1));
  FAX1 U35 (.A(S_3_3), .B(C_3_2), .C((A[4] & B[2])), .YS(S_4_2), .YC(C_4_2));
  FAX1 U36 (.A(S_3_4), .B(C_3_3), .C((A[4] & B[3])), .YS(S_4_3), .YC(C_4_3));
  FAX1 U37 (.A(S_3_5), .B(C_3_4), .C((A[4] & B[4])), .YS(S_4_4), .YC(C_4_4));
  FAX1 U38 (.A(S_3_6), .B(C_3_5), .C((A[4] & B[5])), .YS(S_4_5), .YC(C_4_5));
  FAX1 U39 (.A(S_3_7), .B(C_3_6), .C((A[4] & B[6])), .YS(S_4_6), .YC(C_4_6));
  HAX1 U40 (.A(C_3_7), .B(~(A[4] & B[7])), .YS(S_4_7), .YC(C_4_7));
  FAX1 U41 (.A(S_4_1), .B(C_4_0), .C((A[5] & B[0])), .YS(S_5_0), .YC(C_5_0));
  FAX1 U42 (.A(S_4_2), .B(C_4_1), .C((A[5] & B[1])), .YS(S_5_1), .YC(C_5_1));
  FAX1 U43 (.A(S_4_3), .B(C_4_2), .C((A[5] & B[2])), .YS(S_5_2), .YC(C_5_2));
  FAX1 U44 (.A(S_4_4), .B(C_4_3), .C((A[5] & B[3])), .YS(S_5_3), .YC(C_5_3));
  FAX1 U45 (.A(S_4_5), .B(C_4_4), .C((A[5] & B[4])), .YS(S_5_4), .YC(C_5_4));
  FAX1 U46 (.A(S_4_6), .B(C_4_5), .C((A[5] & B[5])), .YS(S_5_5), .YC(C_5_5));
  FAX1 U47 (.A(S_4_7), .B(C_4_6), .C((A[5] & B[6])), .YS(S_5_6), .YC(C_5_6));
  HAX1 U48 (.A(C_4_7), .B(~(A[5] & B[7])), .YS(S_5_7), .YC(C_5_7));
  FAX1 U49 (.A(S_5_1), .B(C_5_0), .C((A[6] & B[0])), .YS(S_6_0), .YC(C_6_0));
  FAX1 U50 (.A(S_5_2), .B(C_5_1), .C((A[6] & B[1])), .YS(S_6_1), .YC(C_6_1));
  FAX1 U51 (.A(S_5_3), .B(C_5_2), .C((A[6] & B[2])), .YS(S_6_2), .YC(C_6_2));
  FAX1 U52 (.A(S_5_4), .B(C_5_3), .C((A[6] & B[3])), .YS(S_6_3), .YC(C_6_3));
  FAX1 U53 (.A(S_5_5), .B(C_5_4), .C((A[6] & B[4])), .YS(S_6_4), .YC(C_6_4));
  FAX1 U54 (.A(S_5_6), .B(C_5_5), .C((A[6] & B[5])), .YS(S_6_5), .YC(C_6_5));
  FAX1 U55 (.A(S_5_7), .B(C_5_6), .C((A[6] & B[6])), .YS(S_6_6), .YC(C_6_6));
  HAX1 U56 (.A(C_5_7), .B(~(A[6] & B[7])), .YS(S_6_7), .YC(C_6_7));
  FAX1 U57 (.A(S_6_1), .B(C_6_0), .C(~(A[7] & B[0])), .YS(S_7_0), .YC(C_7_0));
  FAX1 U58 (.A(S_6_2), .B(C_6_1), .C(~(A[7] & B[1])), .YS(S_7_1), .YC(C_7_1));
  FAX1 U59 (.A(S_6_3), .B(C_6_2), .C(~(A[7] & B[2])), .YS(S_7_2), .YC(C_7_2));
  FAX1 U60 (.A(S_6_4), .B(C_6_3), .C(~(A[7] & B[3])), .YS(S_7_3), .YC(C_7_3));
  FAX1 U61 (.A(S_6_5), .B(C_6_4), .C(~(A[7] & B[4])), .YS(S_7_4), .YC(C_7_4));
  FAX1 U62 (.A(S_6_6), .B(C_6_5), .C(~(A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  FAX1 U63 (.A(S_6_7), .B(C_6_6), .C(~(A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  HAX1 U64 (.A(C_6_7), .B((A[7] & B[7])), .YS(S_7_7), .YC(C_7_7));
  HAX1 U65 (.A(S_7_1), .B(C_7_0), .YS(S_8_0), .YC(C_8_0));
  FAX1 U66 (.A(S_7_2), .B(C_8_0), .C(C_7_1), .YS(S_8_1), .YC(C_8_1));
  FAX1 U67 (.A(S_7_3), .B(C_8_1), .C(C_7_2), .YS(S_8_2), .YC(C_8_2));
  FAX1 U68 (.A(S_7_4), .B(C_8_2), .C(C_7_3), .YS(S_8_3), .YC(C_8_3));
  FAX1 U69 (.A(S_7_5), .B(C_8_3), .C(C_7_4), .YS(S_8_4), .YC(C_8_4));
  FAX1 U70 (.A(S_7_6), .B(C_8_4), .C(C_7_5), .YS(S_8_5), .YC(C_8_5));
  FAX1 U71 (.A(S_7_7), .B(C_8_5), .C(C_7_6), .YS(S_8_6), .YC(C_8_6));
  FAX1 U72 (.A(1'b1), .B(C_8_6), .C(C_7_7), .YS(S_8_7), .YC(C_8_7));
  assign O = {S_8_7,S_8_6,S_8_5,S_8_4,S_8_3,S_8_2,S_8_1,S_8_0,S_7_0,S_6_0,S_5_0,S_4_0,S_3_0,S_2_0,S_1_0,S_0_0};

endmodule

