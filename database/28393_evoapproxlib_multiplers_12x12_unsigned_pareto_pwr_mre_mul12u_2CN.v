// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 0.031 %
// MAE = 5120 
// WCE% = 0.12 %
// WCE = 20481 
// WCRE% = 100.00 %
// EP% = 99.68 %
// MRE% = 0.87 %
// MSE = 32042.894e3 
// PDK45_PWR = 0.670 mW
// PDK45_AREA = 993.5 um2
// PDK45_DELAY = 2.31 ns


module mul12u_2CN ( A, B, O );
  input [11:0] A;
  input [11:0] B;
  output [23:0] O;

  wire C_10_1,C_10_10,C_10_2,C_10_3,C_10_4,C_10_5,C_10_6,C_10_7,C_10_8,C_10_9,C_11_0,C_11_1,C_11_10,C_11_2,C_11_3,C_11_4,C_11_5,C_11_6,C_11_7,C_11_8,C_11_9,C_12_0,C_12_1,C_12_10,C_12_2,C_12_3,C_12_4,C_12_5,C_12_6,C_12_7,C_12_8,C_12_9,C_1_10,C_2_10,C_2_9,C_3_10,C_3_8,C_3_9,C_4_10,C_4_7,C_4_8,C_4_9,C_5_10,C_5_6,C_5_7,C_5_8,C_5_9,C_6_10,C_6_5,C_6_6,C_6_7,C_6_8,C_6_9,C_7_10,C_7_4,C_7_5,C_7_6,C_7_7,C_7_8,C_7_9,C_8_10,C_8_3,C_8_4,C_8_5,C_8_6,C_8_7,C_8_8,C_8_9,C_9_10,C_9_2,C_9_3,C_9_4,C_9_5,C_9_6,C_9_7,C_9_8,C_9_9,S_0_11,S_10_1,S_10_10,S_10_11,S_10_2,S_10_3,S_10_4,S_10_5,S_10_6,S_10_7,S_10_8,S_10_9,S_11_0,S_11_1,S_11_10,S_11_11,S_11_2,S_11_3,S_11_4,S_11_5,S_11_6,S_11_7,S_11_8,S_11_9,S_12_0,S_12_1,S_12_10,S_12_11,S_12_2,S_12_3,S_12_4,S_12_5,S_12_6,S_12_7,S_12_8,S_12_9,S_1_10,S_1_11,S_2_10,S_2_11,S_2_9,S_3_10,S_3_11,S_3_8,S_3_9,S_4_10,S_4_11,S_4_7,S_4_8,S_4_9,S_5_10,S_5_11,S_5_6,S_5_7,S_5_8,S_5_9,S_6_10,S_6_11,S_6_5,S_6_6,S_6_7,S_6_8,S_6_9,S_7_10,S_7_11,S_7_4,S_7_5,S_7_6,S_7_7,S_7_8,S_7_9,S_8_10,S_8_11,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7,S_8_8,S_8_9,S_9_10,S_9_11,S_9_2,S_9_3,S_9_4,S_9_5,S_9_6,S_9_7,S_9_8,S_9_9;

  assign S_0_11 = (A[0] & B[11]);
  PDKGENHAX1 U15551 (.A(S_0_11), .B((A[1] & B[10])), .YS(S_1_10), .YC(C_1_10));
  assign S_1_11 = (A[1] & B[11]);
  PDKGENHAX1 U15562 (.A(S_1_10), .B((A[2] & B[9])), .YS(S_2_9), .YC(C_2_9));
  PDKGENFAX1 U15563 (.A(S_1_11), .B(C_1_10), .C((A[2] & B[10])), .YS(S_2_10), .YC(C_2_10));
  assign S_2_11 = (A[2] & B[11]);
  PDKGENHAX1 U15573 (.A(S_2_9), .B((A[3] & B[8])), .YS(S_3_8), .YC(C_3_8));
  PDKGENFAX1 U15574 (.A(S_2_10), .B(C_2_9), .C((A[3] & B[9])), .YS(S_3_9), .YC(C_3_9));
  PDKGENFAX1 U15575 (.A(S_2_11), .B(C_2_10), .C((A[3] & B[10])), .YS(S_3_10), .YC(C_3_10));
  assign S_3_11 = (A[3] & B[11]);
  PDKGENHAX1 U15584 (.A(S_3_8), .B((A[4] & B[7])), .YS(S_4_7), .YC(C_4_7));
  PDKGENFAX1 U15585 (.A(S_3_9), .B(C_3_8), .C((A[4] & B[8])), .YS(S_4_8), .YC(C_4_8));
  PDKGENFAX1 U15586 (.A(S_3_10), .B(C_3_9), .C((A[4] & B[9])), .YS(S_4_9), .YC(C_4_9));
  PDKGENFAX1 U15587 (.A(S_3_11), .B(C_3_10), .C((A[4] & B[10])), .YS(S_4_10), .YC(C_4_10));
  assign S_4_11 = (A[4] & B[11]);
  PDKGENHAX1 U15595 (.A(S_4_7), .B((A[5] & B[6])), .YS(S_5_6), .YC(C_5_6));
  PDKGENFAX1 U15596 (.A(S_4_8), .B(C_4_7), .C((A[5] & B[7])), .YS(S_5_7), .YC(C_5_7));
  PDKGENFAX1 U15597 (.A(S_4_9), .B(C_4_8), .C((A[5] & B[8])), .YS(S_5_8), .YC(C_5_8));
  PDKGENFAX1 U15598 (.A(S_4_10), .B(C_4_9), .C((A[5] & B[9])), .YS(S_5_9), .YC(C_5_9));
  PDKGENFAX1 U15599 (.A(S_4_11), .B(C_4_10), .C((A[5] & B[10])), .YS(S_5_10), .YC(C_5_10));
  assign S_5_11 = (A[5] & B[11]);
  PDKGENHAX1 U15606 (.A(S_5_6), .B((A[6] & B[5])), .YS(S_6_5), .YC(C_6_5));
  PDKGENFAX1 U15607 (.A(S_5_7), .B(C_5_6), .C((A[6] & B[6])), .YS(S_6_6), .YC(C_6_6));
  PDKGENFAX1 U15608 (.A(S_5_8), .B(C_5_7), .C((A[6] & B[7])), .YS(S_6_7), .YC(C_6_7));
  PDKGENFAX1 U15609 (.A(S_5_9), .B(C_5_8), .C((A[6] & B[8])), .YS(S_6_8), .YC(C_6_8));
  PDKGENFAX1 U15610 (.A(S_5_10), .B(C_5_9), .C((A[6] & B[9])), .YS(S_6_9), .YC(C_6_9));
  PDKGENFAX1 U15611 (.A(S_5_11), .B(C_5_10), .C((A[6] & B[10])), .YS(S_6_10), .YC(C_6_10));
  assign S_6_11 = (A[6] & B[11]);
  PDKGENHAX1 U15617 (.A(S_6_5), .B((A[7] & B[4])), .YS(S_7_4), .YC(C_7_4));
  PDKGENFAX1 U15618 (.A(S_6_6), .B(C_6_5), .C((A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  PDKGENFAX1 U15619 (.A(S_6_7), .B(C_6_6), .C((A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  PDKGENFAX1 U15620 (.A(S_6_8), .B(C_6_7), .C((A[7] & B[7])), .YS(S_7_7), .YC(C_7_7));
  PDKGENFAX1 U15621 (.A(S_6_9), .B(C_6_8), .C((A[7] & B[8])), .YS(S_7_8), .YC(C_7_8));
  PDKGENFAX1 U15622 (.A(S_6_10), .B(C_6_9), .C((A[7] & B[9])), .YS(S_7_9), .YC(C_7_9));
  PDKGENFAX1 U15623 (.A(S_6_11), .B(C_6_10), .C((A[7] & B[10])), .YS(S_7_10), .YC(C_7_10));
  assign S_7_11 = (A[7] & B[11]);
  PDKGENHAX1 U15628 (.A(S_7_4), .B((A[8] & B[3])), .YS(S_8_3), .YC(C_8_3));
  PDKGENFAX1 U15629 (.A(S_7_5), .B(C_7_4), .C((A[8] & B[4])), .YS(S_8_4), .YC(C_8_4));
  PDKGENFAX1 U15630 (.A(S_7_6), .B(C_7_5), .C((A[8] & B[5])), .YS(S_8_5), .YC(C_8_5));
  PDKGENFAX1 U15631 (.A(S_7_7), .B(C_7_6), .C((A[8] & B[6])), .YS(S_8_6), .YC(C_8_6));
  PDKGENFAX1 U15632 (.A(S_7_8), .B(C_7_7), .C((A[8] & B[7])), .YS(S_8_7), .YC(C_8_7));
  PDKGENFAX1 U15633 (.A(S_7_9), .B(C_7_8), .C((A[8] & B[8])), .YS(S_8_8), .YC(C_8_8));
  PDKGENFAX1 U15634 (.A(S_7_10), .B(C_7_9), .C((A[8] & B[9])), .YS(S_8_9), .YC(C_8_9));
  PDKGENFAX1 U15635 (.A(S_7_11), .B(C_7_10), .C((A[8] & B[10])), .YS(S_8_10), .YC(C_8_10));
  assign S_8_11 = (A[8] & B[11]);
  PDKGENHAX1 U15639 (.A(S_8_3), .B((A[9] & B[2])), .YS(S_9_2), .YC(C_9_2));
  PDKGENFAX1 U15640 (.A(S_8_4), .B(C_8_3), .C((A[9] & B[3])), .YS(S_9_3), .YC(C_9_3));
  PDKGENFAX1 U15641 (.A(S_8_5), .B(C_8_4), .C((A[9] & B[4])), .YS(S_9_4), .YC(C_9_4));
  PDKGENFAX1 U15642 (.A(S_8_6), .B(C_8_5), .C((A[9] & B[5])), .YS(S_9_5), .YC(C_9_5));
  PDKGENFAX1 U15643 (.A(S_8_7), .B(C_8_6), .C((A[9] & B[6])), .YS(S_9_6), .YC(C_9_6));
  PDKGENFAX1 U15644 (.A(S_8_8), .B(C_8_7), .C((A[9] & B[7])), .YS(S_9_7), .YC(C_9_7));
  PDKGENFAX1 U15645 (.A(S_8_9), .B(C_8_8), .C((A[9] & B[8])), .YS(S_9_8), .YC(C_9_8));
  PDKGENFAX1 U15646 (.A(S_8_10), .B(C_8_9), .C((A[9] & B[9])), .YS(S_9_9), .YC(C_9_9));
  PDKGENFAX1 U15647 (.A(S_8_11), .B(C_8_10), .C((A[9] & B[10])), .YS(S_9_10), .YC(C_9_10));
  assign S_9_11 = (A[9] & B[11]);
  PDKGENHAX1 U15650 (.A(S_9_2), .B((A[10] & B[1])), .YS(S_10_1), .YC(C_10_1));
  PDKGENFAX1 U15651 (.A(S_9_3), .B(C_9_2), .C((A[10] & B[2])), .YS(S_10_2), .YC(C_10_2));
  PDKGENFAX1 U15652 (.A(S_9_4), .B(C_9_3), .C((A[10] & B[3])), .YS(S_10_3), .YC(C_10_3));
  PDKGENFAX1 U15653 (.A(S_9_5), .B(C_9_4), .C((A[10] & B[4])), .YS(S_10_4), .YC(C_10_4));
  PDKGENFAX1 U15654 (.A(S_9_6), .B(C_9_5), .C((A[10] & B[5])), .YS(S_10_5), .YC(C_10_5));
  PDKGENFAX1 U15655 (.A(S_9_7), .B(C_9_6), .C((A[10] & B[6])), .YS(S_10_6), .YC(C_10_6));
  PDKGENFAX1 U15656 (.A(S_9_8), .B(C_9_7), .C((A[10] & B[7])), .YS(S_10_7), .YC(C_10_7));
  PDKGENFAX1 U15657 (.A(S_9_9), .B(C_9_8), .C((A[10] & B[8])), .YS(S_10_8), .YC(C_10_8));
  PDKGENFAX1 U15658 (.A(S_9_10), .B(C_9_9), .C((A[10] & B[9])), .YS(S_10_9), .YC(C_10_9));
  PDKGENFAX1 U15659 (.A(S_9_11), .B(C_9_10), .C((A[10] & B[10])), .YS(S_10_10), .YC(C_10_10));
  assign S_10_11 = (A[10] & B[11]);
  PDKGENHAX1 U15661 (.A(S_10_1), .B((A[11] & B[0])), .YS(S_11_0), .YC(C_11_0));
  PDKGENFAX1 U15662 (.A(S_10_2), .B(C_10_1), .C((A[11] & B[1])), .YS(S_11_1), .YC(C_11_1));
  PDKGENFAX1 U15663 (.A(S_10_3), .B(C_10_2), .C((A[11] & B[2])), .YS(S_11_2), .YC(C_11_2));
  PDKGENFAX1 U15664 (.A(S_10_4), .B(C_10_3), .C((A[11] & B[3])), .YS(S_11_3), .YC(C_11_3));
  PDKGENFAX1 U15665 (.A(S_10_5), .B(C_10_4), .C((A[11] & B[4])), .YS(S_11_4), .YC(C_11_4));
  PDKGENFAX1 U15666 (.A(S_10_6), .B(C_10_5), .C((A[11] & B[5])), .YS(S_11_5), .YC(C_11_5));
  PDKGENFAX1 U15667 (.A(S_10_7), .B(C_10_6), .C((A[11] & B[6])), .YS(S_11_6), .YC(C_11_6));
  PDKGENFAX1 U15668 (.A(S_10_8), .B(C_10_7), .C((A[11] & B[7])), .YS(S_11_7), .YC(C_11_7));
  PDKGENFAX1 U15669 (.A(S_10_9), .B(C_10_8), .C((A[11] & B[8])), .YS(S_11_8), .YC(C_11_8));
  PDKGENFAX1 U15670 (.A(S_10_10), .B(C_10_9), .C((A[11] & B[9])), .YS(S_11_9), .YC(C_11_9));
  PDKGENFAX1 U15671 (.A(S_10_11), .B(C_10_10), .C((A[11] & B[10])), .YS(S_11_10), .YC(C_11_10));
  assign S_11_11 = (A[11] & B[11]);
  PDKGENHAX1 U15673 (.A(S_11_1), .B(C_11_0), .YS(S_12_0), .YC(C_12_0));
  PDKGENFAX1 U15674 (.A(S_11_2), .B(C_12_0), .C(C_11_1), .YS(S_12_1), .YC(C_12_1));
  PDKGENFAX1 U15675 (.A(S_11_3), .B(C_12_1), .C(C_11_2), .YS(S_12_2), .YC(C_12_2));
  PDKGENFAX1 U15676 (.A(S_11_4), .B(C_12_2), .C(C_11_3), .YS(S_12_3), .YC(C_12_3));
  PDKGENFAX1 U15677 (.A(S_11_5), .B(C_12_3), .C(C_11_4), .YS(S_12_4), .YC(C_12_4));
  PDKGENFAX1 U15678 (.A(S_11_6), .B(C_12_4), .C(C_11_5), .YS(S_12_5), .YC(C_12_5));
  PDKGENFAX1 U15679 (.A(S_11_7), .B(C_12_5), .C(C_11_6), .YS(S_12_6), .YC(C_12_6));
  PDKGENFAX1 U15680 (.A(S_11_8), .B(C_12_6), .C(C_11_7), .YS(S_12_7), .YC(C_12_7));
  PDKGENFAX1 U15681 (.A(S_11_9), .B(C_12_7), .C(C_11_8), .YS(S_12_8), .YC(C_12_8));
  PDKGENFAX1 U15682 (.A(S_11_10), .B(C_12_8), .C(C_11_9), .YS(S_12_9), .YC(C_12_9));
  PDKGENFAX1 U15683 (.A(S_11_11), .B(C_12_9), .C(C_11_10), .YS(S_12_10), .YC(C_12_10));
  assign S_12_11 = C_12_10;
  assign O = {S_12_11,S_12_10,S_12_9,S_12_8,S_12_7,S_12_6,S_12_5,S_12_4,S_12_3,S_12_2,S_12_1,S_12_0,S_11_0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

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
