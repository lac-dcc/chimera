/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and ep parameters
***/
// MAE% = 0.34 %
// MAE = 224 
// WCE% = 1.37 %
// WCE = 896 
// WCRE% = 700.00 %
// EP% = 87.16 %
// MRE% = 15.72 %
// MSE = 95576 
// PDK45_PWR = 0.237 mW
// PDK45_AREA = 482.4 um2
// PDK45_DELAY = 1.19 ns


module mul8s_1KTY ( A, B, O );
  input [7:0] A;
  input [7:0] B;
  output [15:0] O;

  wire C_3_4,C_3_7,C_4_0,C_4_1,C_4_2,C_4_3,C_4_4,C_4_5,C_4_6,C_4_7,C_5_0,C_5_1,C_5_2,C_5_3,C_5_4,C_5_5,C_5_6,C_5_7,C_6_0,C_6_1,C_6_2,C_6_3,C_6_4,C_6_5,C_6_6,C_6_7,C_7_0,C_7_1,C_7_2,C_7_3,C_7_4,C_7_5,C_7_6,C_7_7,C_8_0,C_8_1,C_8_2,C_8_3,C_8_4,C_8_5,C_8_6,C_8_7,S_0_7,S_1_6,S_2_5,S_3_0,S_3_1,S_3_2,S_3_3,S_3_4,S_3_5,S_3_6,S_3_7,S_4_0,S_4_1,S_4_2,S_4_3,S_4_4,S_4_5,S_4_6,S_4_7,S_5_0,S_5_1,S_5_2,S_5_3,S_5_4,S_5_5,S_5_6,S_5_7,S_6_0,S_6_1,S_6_2,S_6_3,S_6_4,S_6_5,S_6_6,S_6_7,S_7_0,S_7_1,S_7_2,S_7_3,S_7_4,S_7_5,S_7_6,S_7_7,S_8_0,S_8_1,S_8_2,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7;

  assign S_0_7 = 1'b1;
  assign S_1_6 = 1'b1;
  assign S_2_5 = 1'b1;
  assign S_3_0 = (A[3] & B[0]);
  assign S_3_1 = (A[3] & B[1]);
  assign S_3_2 = (A[3] & B[2]);
  assign S_3_3 = (A[3] & B[3]);
  HAX1 U6077 (.A(S_2_5), .B((A[3] & B[4])), .YS(S_3_4), .YC(C_3_4));
  assign S_3_5 = (A[3] & B[5]);
  assign S_3_6 = (A[3] & B[6]);
  HAX1 U6080 (.A(1'b1), .B(~(A[3] & B[7])), .YS(S_3_7), .YC(C_3_7));
  HAX1 U6081 (.A(S_3_1), .B((A[4] & B[0])), .YS(S_4_0), .YC(C_4_0));
  HAX1 U6082 (.A(S_3_2), .B((A[4] & B[1])), .YS(S_4_1), .YC(C_4_1));
  HAX1 U6083 (.A(S_3_3), .B((A[4] & B[2])), .YS(S_4_2), .YC(C_4_2));
  HAX1 U6084 (.A(S_3_4), .B((A[4] & B[3])), .YS(S_4_3), .YC(C_4_3));
  FAX1 U6085 (.A(S_3_5), .B(C_3_4), .C((A[4] & B[4])), .YS(S_4_4), .YC(C_4_4));
  HAX1 U6086 (.A(S_3_6), .B((A[4] & B[5])), .YS(S_4_5), .YC(C_4_5));
  HAX1 U6087 (.A(S_3_7), .B((A[4] & B[6])), .YS(S_4_6), .YC(C_4_6));
  HAX1 U6088 (.A(C_3_7), .B(~(A[4] & B[7])), .YS(S_4_7), .YC(C_4_7));
  FAX1 U6089 (.A(S_4_1), .B(C_4_0), .C((A[5] & B[0])), .YS(S_5_0), .YC(C_5_0));
  FAX1 U6090 (.A(S_4_2), .B(C_4_1), .C((A[5] & B[1])), .YS(S_5_1), .YC(C_5_1));
  FAX1 U6091 (.A(S_4_3), .B(C_4_2), .C((A[5] & B[2])), .YS(S_5_2), .YC(C_5_2));
  FAX1 U6092 (.A(S_4_4), .B(C_4_3), .C((A[5] & B[3])), .YS(S_5_3), .YC(C_5_3));
  FAX1 U6093 (.A(S_4_5), .B(C_4_4), .C((A[5] & B[4])), .YS(S_5_4), .YC(C_5_4));
  FAX1 U6094 (.A(S_4_6), .B(C_4_5), .C((A[5] & B[5])), .YS(S_5_5), .YC(C_5_5));
  FAX1 U6095 (.A(S_4_7), .B(C_4_6), .C((A[5] & B[6])), .YS(S_5_6), .YC(C_5_6));
  HAX1 U6096 (.A(C_4_7), .B(~(A[5] & B[7])), .YS(S_5_7), .YC(C_5_7));
  FAX1 U6097 (.A(S_5_1), .B(C_5_0), .C((A[6] & B[0])), .YS(S_6_0), .YC(C_6_0));
  FAX1 U6098 (.A(S_5_2), .B(C_5_1), .C((A[6] & B[1])), .YS(S_6_1), .YC(C_6_1));
  FAX1 U6099 (.A(S_5_3), .B(C_5_2), .C((A[6] & B[2])), .YS(S_6_2), .YC(C_6_2));
  FAX1 U6100 (.A(S_5_4), .B(C_5_3), .C((A[6] & B[3])), .YS(S_6_3), .YC(C_6_3));
  FAX1 U6101 (.A(S_5_5), .B(C_5_4), .C((A[6] & B[4])), .YS(S_6_4), .YC(C_6_4));
  FAX1 U6102 (.A(S_5_6), .B(C_5_5), .C((A[6] & B[5])), .YS(S_6_5), .YC(C_6_5));
  FAX1 U6103 (.A(S_5_7), .B(C_5_6), .C((A[6] & B[6])), .YS(S_6_6), .YC(C_6_6));
  HAX1 U6104 (.A(C_5_7), .B(~(A[6] & B[7])), .YS(S_6_7), .YC(C_6_7));
  FAX1 U6105 (.A(S_6_1), .B(C_6_0), .C(~(A[7] & B[0])), .YS(S_7_0), .YC(C_7_0));
  FAX1 U6106 (.A(S_6_2), .B(C_6_1), .C(~(A[7] & B[1])), .YS(S_7_1), .YC(C_7_1));
  FAX1 U6107 (.A(S_6_3), .B(C_6_2), .C(~(A[7] & B[2])), .YS(S_7_2), .YC(C_7_2));
  FAX1 U6108 (.A(S_6_4), .B(C_6_3), .C(~(A[7] & B[3])), .YS(S_7_3), .YC(C_7_3));
  FAX1 U6109 (.A(S_6_5), .B(C_6_4), .C(~(A[7] & B[4])), .YS(S_7_4), .YC(C_7_4));
  FAX1 U6110 (.A(S_6_6), .B(C_6_5), .C(~(A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  FAX1 U6111 (.A(S_6_7), .B(C_6_6), .C(~(A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  HAX1 U6112 (.A(C_6_7), .B((A[7] & B[7])), .YS(S_7_7), .YC(C_7_7));
  HAX1 U6113 (.A(S_7_1), .B(C_7_0), .YS(S_8_0), .YC(C_8_0));
  FAX1 U6114 (.A(S_7_2), .B(C_8_0), .C(C_7_1), .YS(S_8_1), .YC(C_8_1));
  FAX1 U6115 (.A(S_7_3), .B(C_8_1), .C(C_7_2), .YS(S_8_2), .YC(C_8_2));
  FAX1 U6116 (.A(S_7_4), .B(C_8_2), .C(C_7_3), .YS(S_8_3), .YC(C_8_3));
  FAX1 U6117 (.A(S_7_5), .B(C_8_3), .C(C_7_4), .YS(S_8_4), .YC(C_8_4));
  FAX1 U6118 (.A(S_7_6), .B(C_8_4), .C(C_7_5), .YS(S_8_5), .YC(C_8_5));
  FAX1 U6119 (.A(S_7_7), .B(C_8_5), .C(C_7_6), .YS(S_8_6), .YC(C_8_6));
  FAX1 U6120 (.A(1'b1), .B(C_8_6), .C(C_7_7), .YS(S_8_7), .YC(C_8_7));
  assign O = {S_8_7,S_8_6,S_8_5,S_8_4,S_8_3,S_8_2,S_8_1,S_8_0,S_7_0,S_6_0,S_5_0,S_4_0,S_3_0,1'b0,1'b0,1'b0};

endmodule

