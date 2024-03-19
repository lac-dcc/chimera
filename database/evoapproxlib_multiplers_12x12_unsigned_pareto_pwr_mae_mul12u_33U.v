/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.38 %
// MAE = 63232 
// WCE% = 1.51 %
// WCE = 252929 
// WCRE% = 100.00 %
// EP% = 99.86 %
// MRE% = 5.01 %
// MSE = 56232.128e5 
// PDK45_PWR = 0.273 mW
// PDK45_AREA = 542.0 um2
// PDK45_DELAY = 1.22 ns


module mul12u_33U ( A, B, O );
  input [11:0] A;
  input [11:0] B;
  output [23:0] O;

  wire C_10_10,C_10_5,C_10_6,C_10_7,C_10_8,C_10_9,C_11_10,C_11_5,C_11_6,C_11_7,C_11_8,C_11_9,C_12_10,C_12_5,C_12_6,C_12_7,C_12_8,C_12_9,C_6_10,C_6_5,C_6_6,C_6_7,C_6_8,C_6_9,C_7_10,C_7_5,C_7_6,C_7_7,C_7_8,C_7_9,C_8_10,C_8_5,C_8_6,C_8_7,C_8_8,C_8_9,C_9_10,C_9_5,C_9_6,C_9_7,C_9_8,C_9_9,S_10_0,S_10_1,S_10_10,S_10_11,S_10_2,S_10_3,S_10_4,S_10_5,S_10_6,S_10_7,S_10_8,S_10_9,S_11_0,S_11_1,S_11_10,S_11_11,S_11_2,S_11_3,S_11_4,S_11_5,S_11_6,S_11_7,S_11_8,S_11_9,S_12_0,S_12_1,S_12_10,S_12_11,S_12_2,S_12_3,S_12_4,S_12_5,S_12_6,S_12_7,S_12_8,S_12_9,S_5_10,S_5_11,S_5_5,S_5_6,S_5_7,S_5_8,S_5_9,S_6_10,S_6_11,S_6_4,S_6_5,S_6_6,S_6_7,S_6_8,S_6_9,S_7_10,S_7_11,S_7_3,S_7_4,S_7_5,S_7_6,S_7_7,S_7_8,S_7_9,S_8_10,S_8_11,S_8_2,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7,S_8_8,S_8_9,S_9_1,S_9_10,S_9_11,S_9_2,S_9_3,S_9_4,S_9_5,S_9_6,S_9_7,S_9_8,S_9_9;

  assign S_5_5 = (A[5] & B[5]);
  assign S_5_6 = (A[5] & B[6]);
  assign S_5_7 = (A[5] & B[7]);
  assign S_5_8 = (A[5] & B[8]);
  assign S_5_9 = (A[5] & B[9]);
  assign S_5_10 = (A[5] & B[10]);
  assign S_5_11 = (A[5] & B[11]);
  assign S_6_4 = S_5_5;
  PDKGENHAX1 U2790 (.A(S_5_6), .B((A[6] & B[5])), .YS(S_6_5), .YC(C_6_5));
  PDKGENHAX1 U2791 (.A(S_5_7), .B((A[6] & B[6])), .YS(S_6_6), .YC(C_6_6));
  PDKGENHAX1 U2792 (.A(S_5_8), .B((A[6] & B[7])), .YS(S_6_7), .YC(C_6_7));
  PDKGENHAX1 U2793 (.A(S_5_9), .B((A[6] & B[8])), .YS(S_6_8), .YC(C_6_8));
  PDKGENHAX1 U2794 (.A(S_5_10), .B((A[6] & B[9])), .YS(S_6_9), .YC(C_6_9));
  PDKGENHAX1 U2795 (.A(S_5_11), .B((A[6] & B[10])), .YS(S_6_10), .YC(C_6_10));
  assign S_6_11 = (A[6] & B[11]);
  assign S_7_3 = S_6_4;
  assign S_7_4 = S_6_5;
  PDKGENFAX1 U2802 (.A(S_6_6), .B(C_6_5), .C((A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  PDKGENFAX1 U2803 (.A(S_6_7), .B(C_6_6), .C((A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  PDKGENFAX1 U2804 (.A(S_6_8), .B(C_6_7), .C((A[7] & B[7])), .YS(S_7_7), .YC(C_7_7));
  PDKGENFAX1 U2805 (.A(S_6_9), .B(C_6_8), .C((A[7] & B[8])), .YS(S_7_8), .YC(C_7_8));
  PDKGENFAX1 U2806 (.A(S_6_10), .B(C_6_9), .C((A[7] & B[9])), .YS(S_7_9), .YC(C_7_9));
  PDKGENFAX1 U2807 (.A(S_6_11), .B(C_6_10), .C((A[7] & B[10])), .YS(S_7_10), .YC(C_7_10));
  assign S_7_11 = (A[7] & B[11]);
  assign S_8_2 = S_7_3;
  assign S_8_3 = S_7_4;
  assign S_8_4 = S_7_5;
  PDKGENFAX1 U2814 (.A(S_7_6), .B(C_7_5), .C((A[8] & B[5])), .YS(S_8_5), .YC(C_8_5));
  PDKGENFAX1 U2815 (.A(S_7_7), .B(C_7_6), .C((A[8] & B[6])), .YS(S_8_6), .YC(C_8_6));
  PDKGENFAX1 U2816 (.A(S_7_8), .B(C_7_7), .C((A[8] & B[7])), .YS(S_8_7), .YC(C_8_7));
  PDKGENFAX1 U2817 (.A(S_7_9), .B(C_7_8), .C((A[8] & B[8])), .YS(S_8_8), .YC(C_8_8));
  PDKGENFAX1 U2818 (.A(S_7_10), .B(C_7_9), .C((A[8] & B[9])), .YS(S_8_9), .YC(C_8_9));
  PDKGENFAX1 U2819 (.A(S_7_11), .B(C_7_10), .C((A[8] & B[10])), .YS(S_8_10), .YC(C_8_10));
  assign S_8_11 = (A[8] & B[11]);
  assign S_9_1 = S_8_2;
  assign S_9_2 = S_8_3;
  assign S_9_3 = S_8_4;
  assign S_9_4 = S_8_5;
  PDKGENFAX1 U2826 (.A(S_8_6), .B(C_8_5), .C((A[9] & B[5])), .YS(S_9_5), .YC(C_9_5));
  PDKGENFAX1 U2827 (.A(S_8_7), .B(C_8_6), .C((A[9] & B[6])), .YS(S_9_6), .YC(C_9_6));
  PDKGENFAX1 U2828 (.A(S_8_8), .B(C_8_7), .C((A[9] & B[7])), .YS(S_9_7), .YC(C_9_7));
  PDKGENFAX1 U2829 (.A(S_8_9), .B(C_8_8), .C((A[9] & B[8])), .YS(S_9_8), .YC(C_9_8));
  PDKGENFAX1 U2830 (.A(S_8_10), .B(C_8_9), .C((A[9] & B[9])), .YS(S_9_9), .YC(C_9_9));
  PDKGENFAX1 U2831 (.A(S_8_11), .B(C_8_10), .C((A[9] & B[10])), .YS(S_9_10), .YC(C_9_10));
  assign S_9_11 = (A[9] & B[11]);
  assign S_10_0 = S_9_1;
  assign S_10_1 = S_9_2;
  assign S_10_2 = S_9_3;
  assign S_10_3 = S_9_4;
  assign S_10_4 = S_9_5;
  PDKGENFAX1 U2838 (.A(S_9_6), .B(C_9_5), .C((A[10] & B[5])), .YS(S_10_5), .YC(C_10_5));
  PDKGENFAX1 U2839 (.A(S_9_7), .B(C_9_6), .C((A[10] & B[6])), .YS(S_10_6), .YC(C_10_6));
  PDKGENFAX1 U2840 (.A(S_9_8), .B(C_9_7), .C((A[10] & B[7])), .YS(S_10_7), .YC(C_10_7));
  PDKGENFAX1 U2841 (.A(S_9_9), .B(C_9_8), .C((A[10] & B[8])), .YS(S_10_8), .YC(C_10_8));
  PDKGENFAX1 U2842 (.A(S_9_10), .B(C_9_9), .C((A[10] & B[9])), .YS(S_10_9), .YC(C_10_9));
  PDKGENFAX1 U2843 (.A(S_9_11), .B(C_9_10), .C((A[10] & B[10])), .YS(S_10_10), .YC(C_10_10));
  assign S_10_11 = (A[10] & B[11]);
  assign S_11_0 = S_10_1;
  assign S_11_1 = S_10_2;
  assign S_11_2 = S_10_3;
  assign S_11_3 = S_10_4;
  assign S_11_4 = S_10_5;
  PDKGENFAX1 U2850 (.A(S_10_6), .B(C_10_5), .C((A[11] & B[5])), .YS(S_11_5), .YC(C_11_5));
  PDKGENFAX1 U2851 (.A(S_10_7), .B(C_10_6), .C((A[11] & B[6])), .YS(S_11_6), .YC(C_11_6));
  PDKGENFAX1 U2852 (.A(S_10_8), .B(C_10_7), .C((A[11] & B[7])), .YS(S_11_7), .YC(C_11_7));
  PDKGENFAX1 U2853 (.A(S_10_9), .B(C_10_8), .C((A[11] & B[8])), .YS(S_11_8), .YC(C_11_8));
  PDKGENFAX1 U2854 (.A(S_10_10), .B(C_10_9), .C((A[11] & B[9])), .YS(S_11_9), .YC(C_11_9));
  PDKGENFAX1 U2855 (.A(S_10_11), .B(C_10_10), .C((A[11] & B[10])), .YS(S_11_10), .YC(C_11_10));
  assign S_11_11 = (A[11] & B[11]);
  assign S_12_0 = S_11_1;
  assign S_12_1 = S_11_2;
  assign S_12_2 = S_11_3;
  assign S_12_3 = S_11_4;
  assign S_12_4 = S_11_5;
  PDKGENHAX1 U2862 (.A(S_11_6), .B(C_11_5), .YS(S_12_5), .YC(C_12_5));
  PDKGENFAX1 U2863 (.A(S_11_7), .B(C_12_5), .C(C_11_6), .YS(S_12_6), .YC(C_12_6));
  PDKGENFAX1 U2864 (.A(S_11_8), .B(C_12_6), .C(C_11_7), .YS(S_12_7), .YC(C_12_7));
  PDKGENFAX1 U2865 (.A(S_11_9), .B(C_12_7), .C(C_11_8), .YS(S_12_8), .YC(C_12_8));
  PDKGENFAX1 U2866 (.A(S_11_10), .B(C_12_8), .C(C_11_9), .YS(S_12_9), .YC(C_12_9));
  PDKGENFAX1 U2867 (.A(S_11_11), .B(C_12_9), .C(C_11_10), .YS(S_12_10), .YC(C_12_10));
  assign S_12_11 = C_12_10;
  assign O = {S_12_11,S_12_10,S_12_9,S_12_8,S_12_7,S_12_6,S_12_5,S_12_4,S_12_3,S_12_2,S_12_1,S_12_0,S_11_0,S_10_0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

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
