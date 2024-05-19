// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 0.0000012 %
// MAE = 0.2 
// WCE% = 0.000006 %
// WCE = 1.0 
// WCRE% = 100.00 %
// EP% = 25.00 %
// MRE% = 0.00047 %
// MSE = 0.2 
// PDK45_PWR = 1.205 mW
// PDK45_AREA = 1644.4 um2
// PDK45_DELAY = 2.34 ns


module mul12s_2KM ( A, B, O );
  input [11:0] A;
  input [11:0] B;
  output [23:0] O;

  wire C_10_0,C_10_1,C_10_10,C_10_11,C_10_2,C_10_3,C_10_4,C_10_5,C_10_6,C_10_7,C_10_8,C_10_9,C_11_0,C_11_1,C_11_10,C_11_11,C_11_2,C_11_3,C_11_4,C_11_5,C_11_6,C_11_7,C_11_8,C_11_9,C_12_0,C_12_1,C_12_10,C_12_11,C_12_2,C_12_3,C_12_4,C_12_5,C_12_6,C_12_7,C_12_8,C_12_9,C_1_0,C_1_1,C_1_10,C_1_11,C_1_2,C_1_3,C_1_4,C_1_5,C_1_6,C_1_7,C_1_8,C_1_9,C_2_0,C_2_1,C_2_10,C_2_11,C_2_2,C_2_3,C_2_4,C_2_5,C_2_6,C_2_7,C_2_8,C_2_9,C_3_0,C_3_1,C_3_10,C_3_11,C_3_2,C_3_3,C_3_4,C_3_5,C_3_6,C_3_7,C_3_8,C_3_9,C_4_0,C_4_1,C_4_10,C_4_11,C_4_2,C_4_3,C_4_4,C_4_5,C_4_6,C_4_7,C_4_8,C_4_9,C_5_0,C_5_1,C_5_10,C_5_11,C_5_2,C_5_3,C_5_4,C_5_5,C_5_6,C_5_7,C_5_8,C_5_9,C_6_0,C_6_1,C_6_10,C_6_11,C_6_2,C_6_3,C_6_4,C_6_5,C_6_6,C_6_7,C_6_8,C_6_9,C_7_0,C_7_1,C_7_10,C_7_11,C_7_2,C_7_3,C_7_4,C_7_5,C_7_6,C_7_7,C_7_8,C_7_9,C_8_0,C_8_1,C_8_10,C_8_11,C_8_2,C_8_3,C_8_4,C_8_5,C_8_6,C_8_7,C_8_8,C_8_9,C_9_0,C_9_1,C_9_10,C_9_11,C_9_2,C_9_3,C_9_4,C_9_5,C_9_6,C_9_7,C_9_8,C_9_9,S_0_1,S_0_10,S_0_11,S_0_2,S_0_3,S_0_4,S_0_5,S_0_6,S_0_7,S_0_8,S_0_9,S_10_0,S_10_1,S_10_10,S_10_11,S_10_2,S_10_3,S_10_4,S_10_5,S_10_6,S_10_7,S_10_8,S_10_9,S_11_0,S_11_1,S_11_10,S_11_11,S_11_2,S_11_3,S_11_4,S_11_5,S_11_6,S_11_7,S_11_8,S_11_9,S_12_0,S_12_1,S_12_10,S_12_11,S_12_2,S_12_3,S_12_4,S_12_5,S_12_6,S_12_7,S_12_8,S_12_9,S_1_0,S_1_1,S_1_10,S_1_11,S_1_2,S_1_3,S_1_4,S_1_5,S_1_6,S_1_7,S_1_8,S_1_9,S_2_0,S_2_1,S_2_10,S_2_11,S_2_2,S_2_3,S_2_4,S_2_5,S_2_6,S_2_7,S_2_8,S_2_9,S_3_0,S_3_1,S_3_10,S_3_11,S_3_2,S_3_3,S_3_4,S_3_5,S_3_6,S_3_7,S_3_8,S_3_9,S_4_0,S_4_1,S_4_10,S_4_11,S_4_2,S_4_3,S_4_4,S_4_5,S_4_6,S_4_7,S_4_8,S_4_9,S_5_0,S_5_1,S_5_10,S_5_11,S_5_2,S_5_3,S_5_4,S_5_5,S_5_6,S_5_7,S_5_8,S_5_9,S_6_0,S_6_1,S_6_10,S_6_11,S_6_2,S_6_3,S_6_4,S_6_5,S_6_6,S_6_7,S_6_8,S_6_9,S_7_0,S_7_1,S_7_10,S_7_11,S_7_2,S_7_3,S_7_4,S_7_5,S_7_6,S_7_7,S_7_8,S_7_9,S_8_0,S_8_1,S_8_10,S_8_11,S_8_2,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7,S_8_8,S_8_9,S_9_0,S_9_1,S_9_10,S_9_11,S_9_2,S_9_3,S_9_4,S_9_5,S_9_6,S_9_7,S_9_8,S_9_9;

  assign S_0_1 = (A[0] & B[1]);
  assign S_0_2 = (A[0] & B[2]);
  assign S_0_3 = (A[0] & B[3]);
  assign S_0_4 = (A[0] & B[4]);
  assign S_0_5 = (A[0] & B[5]);
  assign S_0_6 = (A[0] & B[6]);
  assign S_0_7 = (A[0] & B[7]);
  assign S_0_8 = (A[0] & B[8]);
  assign S_0_9 = (A[0] & B[9]);
  assign S_0_10 = (A[0] & B[10]);
  assign S_0_11 = ~(A[0] & B[11]);
  PDKGENHAX1 U13573 (.A(S_0_1), .B((A[1] & B[0])), .YS(S_1_0), .YC(C_1_0));
  PDKGENHAX1 U13574 (.A(S_0_2), .B((A[1] & B[1])), .YS(S_1_1), .YC(C_1_1));
  PDKGENHAX1 U13575 (.A(S_0_3), .B((A[1] & B[2])), .YS(S_1_2), .YC(C_1_2));
  PDKGENHAX1 U13576 (.A(S_0_4), .B((A[1] & B[3])), .YS(S_1_3), .YC(C_1_3));
  PDKGENHAX1 U13577 (.A(S_0_5), .B((A[1] & B[4])), .YS(S_1_4), .YC(C_1_4));
  PDKGENHAX1 U13578 (.A(S_0_6), .B((A[1] & B[5])), .YS(S_1_5), .YC(C_1_5));
  PDKGENHAX1 U13579 (.A(S_0_7), .B((A[1] & B[6])), .YS(S_1_6), .YC(C_1_6));
  PDKGENHAX1 U13580 (.A(S_0_8), .B((A[1] & B[7])), .YS(S_1_7), .YC(C_1_7));
  PDKGENHAX1 U13581 (.A(S_0_9), .B((A[1] & B[8])), .YS(S_1_8), .YC(C_1_8));
  PDKGENHAX1 U13582 (.A(S_0_10), .B((A[1] & B[9])), .YS(S_1_9), .YC(C_1_9));
  PDKGENHAX1 U13583 (.A(S_0_11), .B((A[1] & B[10])), .YS(S_1_10), .YC(C_1_10));
  PDKGENHAX1 U13584 (.A(1'b1), .B(~(A[1] & B[11])), .YS(S_1_11), .YC(C_1_11));
  PDKGENFAX1 U13585 (.A(S_1_1), .B(C_1_0), .C((A[2] & B[0])), .YS(S_2_0), .YC(C_2_0));
  PDKGENFAX1 U13586 (.A(S_1_2), .B(C_1_1), .C((A[2] & B[1])), .YS(S_2_1), .YC(C_2_1));
  PDKGENFAX1 U13587 (.A(S_1_3), .B(C_1_2), .C((A[2] & B[2])), .YS(S_2_2), .YC(C_2_2));
  PDKGENFAX1 U13588 (.A(S_1_4), .B(C_1_3), .C((A[2] & B[3])), .YS(S_2_3), .YC(C_2_3));
  PDKGENFAX1 U13589 (.A(S_1_5), .B(C_1_4), .C((A[2] & B[4])), .YS(S_2_4), .YC(C_2_4));
  PDKGENFAX1 U13590 (.A(S_1_6), .B(C_1_5), .C((A[2] & B[5])), .YS(S_2_5), .YC(C_2_5));
  PDKGENFAX1 U13591 (.A(S_1_7), .B(C_1_6), .C((A[2] & B[6])), .YS(S_2_6), .YC(C_2_6));
  PDKGENFAX1 U13592 (.A(S_1_8), .B(C_1_7), .C((A[2] & B[7])), .YS(S_2_7), .YC(C_2_7));
  PDKGENFAX1 U13593 (.A(S_1_9), .B(C_1_8), .C((A[2] & B[8])), .YS(S_2_8), .YC(C_2_8));
  PDKGENFAX1 U13594 (.A(S_1_10), .B(C_1_9), .C((A[2] & B[9])), .YS(S_2_9), .YC(C_2_9));
  PDKGENFAX1 U13595 (.A(S_1_11), .B(C_1_10), .C((A[2] & B[10])), .YS(S_2_10), .YC(C_2_10));
  PDKGENHAX1 U13596 (.A(C_1_11), .B(~(A[2] & B[11])), .YS(S_2_11), .YC(C_2_11));
  PDKGENFAX1 U13597 (.A(S_2_1), .B(C_2_0), .C((A[3] & B[0])), .YS(S_3_0), .YC(C_3_0));
  PDKGENFAX1 U13598 (.A(S_2_2), .B(C_2_1), .C((A[3] & B[1])), .YS(S_3_1), .YC(C_3_1));
  PDKGENFAX1 U13599 (.A(S_2_3), .B(C_2_2), .C((A[3] & B[2])), .YS(S_3_2), .YC(C_3_2));
  PDKGENFAX1 U13600 (.A(S_2_4), .B(C_2_3), .C((A[3] & B[3])), .YS(S_3_3), .YC(C_3_3));
  PDKGENFAX1 U13601 (.A(S_2_5), .B(C_2_4), .C((A[3] & B[4])), .YS(S_3_4), .YC(C_3_4));
  PDKGENFAX1 U13602 (.A(S_2_6), .B(C_2_5), .C((A[3] & B[5])), .YS(S_3_5), .YC(C_3_5));
  PDKGENFAX1 U13603 (.A(S_2_7), .B(C_2_6), .C((A[3] & B[6])), .YS(S_3_6), .YC(C_3_6));
  PDKGENFAX1 U13604 (.A(S_2_8), .B(C_2_7), .C((A[3] & B[7])), .YS(S_3_7), .YC(C_3_7));
  PDKGENFAX1 U13605 (.A(S_2_9), .B(C_2_8), .C((A[3] & B[8])), .YS(S_3_8), .YC(C_3_8));
  PDKGENFAX1 U13606 (.A(S_2_10), .B(C_2_9), .C((A[3] & B[9])), .YS(S_3_9), .YC(C_3_9));
  PDKGENFAX1 U13607 (.A(S_2_11), .B(C_2_10), .C((A[3] & B[10])), .YS(S_3_10), .YC(C_3_10));
  PDKGENHAX1 U13608 (.A(C_2_11), .B(~(A[3] & B[11])), .YS(S_3_11), .YC(C_3_11));
  PDKGENFAX1 U13609 (.A(S_3_1), .B(C_3_0), .C((A[4] & B[0])), .YS(S_4_0), .YC(C_4_0));
  PDKGENFAX1 U13610 (.A(S_3_2), .B(C_3_1), .C((A[4] & B[1])), .YS(S_4_1), .YC(C_4_1));
  PDKGENFAX1 U13611 (.A(S_3_3), .B(C_3_2), .C((A[4] & B[2])), .YS(S_4_2), .YC(C_4_2));
  PDKGENFAX1 U13612 (.A(S_3_4), .B(C_3_3), .C((A[4] & B[3])), .YS(S_4_3), .YC(C_4_3));
  PDKGENFAX1 U13613 (.A(S_3_5), .B(C_3_4), .C((A[4] & B[4])), .YS(S_4_4), .YC(C_4_4));
  PDKGENFAX1 U13614 (.A(S_3_6), .B(C_3_5), .C((A[4] & B[5])), .YS(S_4_5), .YC(C_4_5));
  PDKGENFAX1 U13615 (.A(S_3_7), .B(C_3_6), .C((A[4] & B[6])), .YS(S_4_6), .YC(C_4_6));
  PDKGENFAX1 U13616 (.A(S_3_8), .B(C_3_7), .C((A[4] & B[7])), .YS(S_4_7), .YC(C_4_7));
  PDKGENFAX1 U13617 (.A(S_3_9), .B(C_3_8), .C((A[4] & B[8])), .YS(S_4_8), .YC(C_4_8));
  PDKGENFAX1 U13618 (.A(S_3_10), .B(C_3_9), .C((A[4] & B[9])), .YS(S_4_9), .YC(C_4_9));
  PDKGENFAX1 U13619 (.A(S_3_11), .B(C_3_10), .C((A[4] & B[10])), .YS(S_4_10), .YC(C_4_10));
  PDKGENHAX1 U13620 (.A(C_3_11), .B(~(A[4] & B[11])), .YS(S_4_11), .YC(C_4_11));
  PDKGENFAX1 U13621 (.A(S_4_1), .B(C_4_0), .C((A[5] & B[0])), .YS(S_5_0), .YC(C_5_0));
  PDKGENFAX1 U13622 (.A(S_4_2), .B(C_4_1), .C((A[5] & B[1])), .YS(S_5_1), .YC(C_5_1));
  PDKGENFAX1 U13623 (.A(S_4_3), .B(C_4_2), .C((A[5] & B[2])), .YS(S_5_2), .YC(C_5_2));
  PDKGENFAX1 U13624 (.A(S_4_4), .B(C_4_3), .C((A[5] & B[3])), .YS(S_5_3), .YC(C_5_3));
  PDKGENFAX1 U13625 (.A(S_4_5), .B(C_4_4), .C((A[5] & B[4])), .YS(S_5_4), .YC(C_5_4));
  PDKGENFAX1 U13626 (.A(S_4_6), .B(C_4_5), .C((A[5] & B[5])), .YS(S_5_5), .YC(C_5_5));
  PDKGENFAX1 U13627 (.A(S_4_7), .B(C_4_6), .C((A[5] & B[6])), .YS(S_5_6), .YC(C_5_6));
  PDKGENFAX1 U13628 (.A(S_4_8), .B(C_4_7), .C((A[5] & B[7])), .YS(S_5_7), .YC(C_5_7));
  PDKGENFAX1 U13629 (.A(S_4_9), .B(C_4_8), .C((A[5] & B[8])), .YS(S_5_8), .YC(C_5_8));
  PDKGENFAX1 U13630 (.A(S_4_10), .B(C_4_9), .C((A[5] & B[9])), .YS(S_5_9), .YC(C_5_9));
  PDKGENFAX1 U13631 (.A(S_4_11), .B(C_4_10), .C((A[5] & B[10])), .YS(S_5_10), .YC(C_5_10));
  PDKGENHAX1 U13632 (.A(C_4_11), .B(~(A[5] & B[11])), .YS(S_5_11), .YC(C_5_11));
  PDKGENFAX1 U13633 (.A(S_5_1), .B(C_5_0), .C((A[6] & B[0])), .YS(S_6_0), .YC(C_6_0));
  PDKGENFAX1 U13634 (.A(S_5_2), .B(C_5_1), .C((A[6] & B[1])), .YS(S_6_1), .YC(C_6_1));
  PDKGENFAX1 U13635 (.A(S_5_3), .B(C_5_2), .C((A[6] & B[2])), .YS(S_6_2), .YC(C_6_2));
  PDKGENFAX1 U13636 (.A(S_5_4), .B(C_5_3), .C((A[6] & B[3])), .YS(S_6_3), .YC(C_6_3));
  PDKGENFAX1 U13637 (.A(S_5_5), .B(C_5_4), .C((A[6] & B[4])), .YS(S_6_4), .YC(C_6_4));
  PDKGENFAX1 U13638 (.A(S_5_6), .B(C_5_5), .C((A[6] & B[5])), .YS(S_6_5), .YC(C_6_5));
  PDKGENFAX1 U13639 (.A(S_5_7), .B(C_5_6), .C((A[6] & B[6])), .YS(S_6_6), .YC(C_6_6));
  PDKGENFAX1 U13640 (.A(S_5_8), .B(C_5_7), .C((A[6] & B[7])), .YS(S_6_7), .YC(C_6_7));
  PDKGENFAX1 U13641 (.A(S_5_9), .B(C_5_8), .C((A[6] & B[8])), .YS(S_6_8), .YC(C_6_8));
  PDKGENFAX1 U13642 (.A(S_5_10), .B(C_5_9), .C((A[6] & B[9])), .YS(S_6_9), .YC(C_6_9));
  PDKGENFAX1 U13643 (.A(S_5_11), .B(C_5_10), .C((A[6] & B[10])), .YS(S_6_10), .YC(C_6_10));
  PDKGENHAX1 U13644 (.A(C_5_11), .B(~(A[6] & B[11])), .YS(S_6_11), .YC(C_6_11));
  PDKGENFAX1 U13645 (.A(S_6_1), .B(C_6_0), .C((A[7] & B[0])), .YS(S_7_0), .YC(C_7_0));
  PDKGENFAX1 U13646 (.A(S_6_2), .B(C_6_1), .C((A[7] & B[1])), .YS(S_7_1), .YC(C_7_1));
  PDKGENFAX1 U13647 (.A(S_6_3), .B(C_6_2), .C((A[7] & B[2])), .YS(S_7_2), .YC(C_7_2));
  PDKGENFAX1 U13648 (.A(S_6_4), .B(C_6_3), .C((A[7] & B[3])), .YS(S_7_3), .YC(C_7_3));
  PDKGENFAX1 U13649 (.A(S_6_5), .B(C_6_4), .C((A[7] & B[4])), .YS(S_7_4), .YC(C_7_4));
  PDKGENFAX1 U13650 (.A(S_6_6), .B(C_6_5), .C((A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  PDKGENFAX1 U13651 (.A(S_6_7), .B(C_6_6), .C((A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  PDKGENFAX1 U13652 (.A(S_6_8), .B(C_6_7), .C((A[7] & B[7])), .YS(S_7_7), .YC(C_7_7));
  PDKGENFAX1 U13653 (.A(S_6_9), .B(C_6_8), .C((A[7] & B[8])), .YS(S_7_8), .YC(C_7_8));
  PDKGENFAX1 U13654 (.A(S_6_10), .B(C_6_9), .C((A[7] & B[9])), .YS(S_7_9), .YC(C_7_9));
  PDKGENFAX1 U13655 (.A(S_6_11), .B(C_6_10), .C((A[7] & B[10])), .YS(S_7_10), .YC(C_7_10));
  PDKGENHAX1 U13656 (.A(C_6_11), .B(~(A[7] & B[11])), .YS(S_7_11), .YC(C_7_11));
  PDKGENFAX1 U13657 (.A(S_7_1), .B(C_7_0), .C((A[8] & B[0])), .YS(S_8_0), .YC(C_8_0));
  PDKGENFAX1 U13658 (.A(S_7_2), .B(C_7_1), .C((A[8] & B[1])), .YS(S_8_1), .YC(C_8_1));
  PDKGENFAX1 U13659 (.A(S_7_3), .B(C_7_2), .C((A[8] & B[2])), .YS(S_8_2), .YC(C_8_2));
  PDKGENFAX1 U13660 (.A(S_7_4), .B(C_7_3), .C((A[8] & B[3])), .YS(S_8_3), .YC(C_8_3));
  PDKGENFAX1 U13661 (.A(S_7_5), .B(C_7_4), .C((A[8] & B[4])), .YS(S_8_4), .YC(C_8_4));
  PDKGENFAX1 U13662 (.A(S_7_6), .B(C_7_5), .C((A[8] & B[5])), .YS(S_8_5), .YC(C_8_5));
  PDKGENFAX1 U13663 (.A(S_7_7), .B(C_7_6), .C((A[8] & B[6])), .YS(S_8_6), .YC(C_8_6));
  PDKGENFAX1 U13664 (.A(S_7_8), .B(C_7_7), .C((A[8] & B[7])), .YS(S_8_7), .YC(C_8_7));
  PDKGENFAX1 U13665 (.A(S_7_9), .B(C_7_8), .C((A[8] & B[8])), .YS(S_8_8), .YC(C_8_8));
  PDKGENFAX1 U13666 (.A(S_7_10), .B(C_7_9), .C((A[8] & B[9])), .YS(S_8_9), .YC(C_8_9));
  PDKGENFAX1 U13667 (.A(S_7_11), .B(C_7_10), .C((A[8] & B[10])), .YS(S_8_10), .YC(C_8_10));
  PDKGENHAX1 U13668 (.A(C_7_11), .B(~(A[8] & B[11])), .YS(S_8_11), .YC(C_8_11));
  PDKGENFAX1 U13669 (.A(S_8_1), .B(C_8_0), .C((A[9] & B[0])), .YS(S_9_0), .YC(C_9_0));
  PDKGENFAX1 U13670 (.A(S_8_2), .B(C_8_1), .C((A[9] & B[1])), .YS(S_9_1), .YC(C_9_1));
  PDKGENFAX1 U13671 (.A(S_8_3), .B(C_8_2), .C((A[9] & B[2])), .YS(S_9_2), .YC(C_9_2));
  PDKGENFAX1 U13672 (.A(S_8_4), .B(C_8_3), .C((A[9] & B[3])), .YS(S_9_3), .YC(C_9_3));
  PDKGENFAX1 U13673 (.A(S_8_5), .B(C_8_4), .C((A[9] & B[4])), .YS(S_9_4), .YC(C_9_4));
  PDKGENFAX1 U13674 (.A(S_8_6), .B(C_8_5), .C((A[9] & B[5])), .YS(S_9_5), .YC(C_9_5));
  PDKGENFAX1 U13675 (.A(S_8_7), .B(C_8_6), .C((A[9] & B[6])), .YS(S_9_6), .YC(C_9_6));
  PDKGENFAX1 U13676 (.A(S_8_8), .B(C_8_7), .C((A[9] & B[7])), .YS(S_9_7), .YC(C_9_7));
  PDKGENFAX1 U13677 (.A(S_8_9), .B(C_8_8), .C((A[9] & B[8])), .YS(S_9_8), .YC(C_9_8));
  PDKGENFAX1 U13678 (.A(S_8_10), .B(C_8_9), .C((A[9] & B[9])), .YS(S_9_9), .YC(C_9_9));
  PDKGENFAX1 U13679 (.A(S_8_11), .B(C_8_10), .C((A[9] & B[10])), .YS(S_9_10), .YC(C_9_10));
  PDKGENHAX1 U13680 (.A(C_8_11), .B(~(A[9] & B[11])), .YS(S_9_11), .YC(C_9_11));
  PDKGENFAX1 U13681 (.A(S_9_1), .B(C_9_0), .C((A[10] & B[0])), .YS(S_10_0), .YC(C_10_0));
  PDKGENFAX1 U13682 (.A(S_9_2), .B(C_9_1), .C((A[10] & B[1])), .YS(S_10_1), .YC(C_10_1));
  PDKGENFAX1 U13683 (.A(S_9_3), .B(C_9_2), .C((A[10] & B[2])), .YS(S_10_2), .YC(C_10_2));
  PDKGENFAX1 U13684 (.A(S_9_4), .B(C_9_3), .C((A[10] & B[3])), .YS(S_10_3), .YC(C_10_3));
  PDKGENFAX1 U13685 (.A(S_9_5), .B(C_9_4), .C((A[10] & B[4])), .YS(S_10_4), .YC(C_10_4));
  PDKGENFAX1 U13686 (.A(S_9_6), .B(C_9_5), .C((A[10] & B[5])), .YS(S_10_5), .YC(C_10_5));
  PDKGENFAX1 U13687 (.A(S_9_7), .B(C_9_6), .C((A[10] & B[6])), .YS(S_10_6), .YC(C_10_6));
  PDKGENFAX1 U13688 (.A(S_9_8), .B(C_9_7), .C((A[10] & B[7])), .YS(S_10_7), .YC(C_10_7));
  PDKGENFAX1 U13689 (.A(S_9_9), .B(C_9_8), .C((A[10] & B[8])), .YS(S_10_8), .YC(C_10_8));
  PDKGENFAX1 U13690 (.A(S_9_10), .B(C_9_9), .C((A[10] & B[9])), .YS(S_10_9), .YC(C_10_9));
  PDKGENFAX1 U13691 (.A(S_9_11), .B(C_9_10), .C((A[10] & B[10])), .YS(S_10_10), .YC(C_10_10));
  PDKGENHAX1 U13692 (.A(C_9_11), .B(~(A[10] & B[11])), .YS(S_10_11), .YC(C_10_11));
  PDKGENFAX1 U13693 (.A(S_10_1), .B(C_10_0), .C(~(A[11] & B[0])), .YS(S_11_0), .YC(C_11_0));
  PDKGENFAX1 U13694 (.A(S_10_2), .B(C_10_1), .C(~(A[11] & B[1])), .YS(S_11_1), .YC(C_11_1));
  PDKGENFAX1 U13695 (.A(S_10_3), .B(C_10_2), .C(~(A[11] & B[2])), .YS(S_11_2), .YC(C_11_2));
  PDKGENFAX1 U13696 (.A(S_10_4), .B(C_10_3), .C(~(A[11] & B[3])), .YS(S_11_3), .YC(C_11_3));
  PDKGENFAX1 U13697 (.A(S_10_5), .B(C_10_4), .C(~(A[11] & B[4])), .YS(S_11_4), .YC(C_11_4));
  PDKGENFAX1 U13698 (.A(S_10_6), .B(C_10_5), .C(~(A[11] & B[5])), .YS(S_11_5), .YC(C_11_5));
  PDKGENFAX1 U13699 (.A(S_10_7), .B(C_10_6), .C(~(A[11] & B[6])), .YS(S_11_6), .YC(C_11_6));
  PDKGENFAX1 U13700 (.A(S_10_8), .B(C_10_7), .C(~(A[11] & B[7])), .YS(S_11_7), .YC(C_11_7));
  PDKGENFAX1 U13701 (.A(S_10_9), .B(C_10_8), .C(~(A[11] & B[8])), .YS(S_11_8), .YC(C_11_8));
  PDKGENFAX1 U13702 (.A(S_10_10), .B(C_10_9), .C(~(A[11] & B[9])), .YS(S_11_9), .YC(C_11_9));
  PDKGENFAX1 U13703 (.A(S_10_11), .B(C_10_10), .C(~(A[11] & B[10])), .YS(S_11_10), .YC(C_11_10));
  PDKGENHAX1 U13704 (.A(C_10_11), .B((A[11] & B[11])), .YS(S_11_11), .YC(C_11_11));
  PDKGENHAX1 U13705 (.A(S_11_1), .B(C_11_0), .YS(S_12_0), .YC(C_12_0));
  PDKGENFAX1 U13706 (.A(S_11_2), .B(C_12_0), .C(C_11_1), .YS(S_12_1), .YC(C_12_1));
  PDKGENFAX1 U13707 (.A(S_11_3), .B(C_12_1), .C(C_11_2), .YS(S_12_2), .YC(C_12_2));
  PDKGENFAX1 U13708 (.A(S_11_4), .B(C_12_2), .C(C_11_3), .YS(S_12_3), .YC(C_12_3));
  PDKGENFAX1 U13709 (.A(S_11_5), .B(C_12_3), .C(C_11_4), .YS(S_12_4), .YC(C_12_4));
  PDKGENFAX1 U13710 (.A(S_11_6), .B(C_12_4), .C(C_11_5), .YS(S_12_5), .YC(C_12_5));
  PDKGENFAX1 U13711 (.A(S_11_7), .B(C_12_5), .C(C_11_6), .YS(S_12_6), .YC(C_12_6));
  PDKGENFAX1 U13712 (.A(S_11_8), .B(C_12_6), .C(C_11_7), .YS(S_12_7), .YC(C_12_7));
  PDKGENFAX1 U13713 (.A(S_11_9), .B(C_12_7), .C(C_11_8), .YS(S_12_8), .YC(C_12_8));
  PDKGENFAX1 U13714 (.A(S_11_10), .B(C_12_8), .C(C_11_9), .YS(S_12_9), .YC(C_12_9));
  PDKGENFAX1 U13715 (.A(S_11_11), .B(C_12_9), .C(C_11_10), .YS(S_12_10), .YC(C_12_10));
  PDKGENFAX1 U13716 (.A(1'b1), .B(C_12_10), .C(C_11_11), .YS(S_12_11), .YC(C_12_11));
  assign O = {S_12_11,S_12_10,S_12_9,S_12_8,S_12_7,S_12_6,S_12_5,S_12_4,S_12_3,S_12_2,S_12_1,S_12_0,S_11_0,S_10_0,S_9_0,S_8_0,S_7_0,S_6_0,S_5_0,S_4_0,S_3_0,S_2_0,S_1_0,1'b0};

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
