// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 0.15 %
// MAE = 101 
// WCE% = 0.69 %
// WCE = 449 
// WCRE% = 6500.00 %
// EP% = 91.89 %
// MRE% = 8.93 %
// MSE = 19690 
// PDK45_PWR = 0.289 mW
// PDK45_AREA = 543.0 um2
// PDK45_DELAY = 1.33 ns


module mul8s_1KVL ( A, B, O );
  input [7:0] A;
  input [7:0] B;
  output [15:0] O;

  wire C_2_5,C_2_7,C_3_2,C_3_3,C_3_4,C_3_5,C_3_6,C_3_7,C_4_1,C_4_2,C_4_3,C_4_4,C_4_5,C_4_6,C_4_7,C_5_0,C_5_1,C_5_2,C_5_3,C_5_4,C_5_5,C_5_6,C_5_7,C_6_0,C_6_1,C_6_2,C_6_3,C_6_4,C_6_5,C_6_6,C_6_7,C_7_0,C_7_1,C_7_2,C_7_3,C_7_4,C_7_5,C_7_6,C_7_7,C_8_0,C_8_1,C_8_2,C_8_3,C_8_4,C_8_5,C_8_6,C_8_7,S_0_7,S_1_6,S_2_3,S_2_4,S_2_5,S_2_6,S_2_7,S_3_2,S_3_3,S_3_4,S_3_5,S_3_6,S_3_7,S_4_1,S_4_2,S_4_3,S_4_4,S_4_5,S_4_6,S_4_7,S_5_0,S_5_1,S_5_2,S_5_3,S_5_4,S_5_5,S_5_6,S_5_7,S_6_0,S_6_1,S_6_2,S_6_3,S_6_4,S_6_5,S_6_6,S_6_7,S_7_0,S_7_1,S_7_2,S_7_3,S_7_4,S_7_5,S_7_6,S_7_7,S_8_0,S_8_1,S_8_2,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7;

  assign S_0_7 = 1'b1;
  assign S_1_6 = 1'b1;
  assign S_2_3 = (A[2] & B[3]);
  assign S_2_4 = (A[2] & B[4]);
  PDKGENHAX1 U4630 (.A(S_1_6), .B((A[2] & B[5])), .YS(S_2_5), .YC(C_2_5));
  assign S_2_6 = (A[2] & B[6]);
  PDKGENHAX1 U4632 (.A(1'b1), .B(~(A[2] & B[7])), .YS(S_2_7), .YC(C_2_7));
  PDKGENHAX1 U4635 (.A(S_2_3), .B((A[3] & B[2])), .YS(S_3_2), .YC(C_3_2));
  PDKGENHAX1 U4636 (.A(S_2_4), .B((A[3] & B[3])), .YS(S_3_3), .YC(C_3_3));
  PDKGENHAX1 U4637 (.A(S_2_5), .B((A[3] & B[4])), .YS(S_3_4), .YC(C_3_4));
  PDKGENFAX1 U4638 (.A(S_2_6), .B(C_2_5), .C((A[3] & B[5])), .YS(S_3_5), .YC(C_3_5));
  PDKGENHAX1 U4639 (.A(S_2_7), .B((A[3] & B[6])), .YS(S_3_6), .YC(C_3_6));
  PDKGENHAX1 U4640 (.A(C_2_7), .B(~(A[3] & B[7])), .YS(S_3_7), .YC(C_3_7));
  PDKGENHAX1 U4642 (.A(S_3_2), .B((A[4] & B[1])), .YS(S_4_1), .YC(C_4_1));
  PDKGENFAX1 U4643 (.A(S_3_3), .B(C_3_2), .C((A[4] & B[2])), .YS(S_4_2), .YC(C_4_2));
  PDKGENFAX1 U4644 (.A(S_3_4), .B(C_3_3), .C((A[4] & B[3])), .YS(S_4_3), .YC(C_4_3));
  PDKGENFAX1 U4645 (.A(S_3_5), .B(C_3_4), .C((A[4] & B[4])), .YS(S_4_4), .YC(C_4_4));
  PDKGENFAX1 U4646 (.A(S_3_6), .B(C_3_5), .C((A[4] & B[5])), .YS(S_4_5), .YC(C_4_5));
  PDKGENFAX1 U4647 (.A(S_3_7), .B(C_3_6), .C((A[4] & B[6])), .YS(S_4_6), .YC(C_4_6));
  PDKGENHAX1 U4648 (.A(C_3_7), .B(~(A[4] & B[7])), .YS(S_4_7), .YC(C_4_7));
  PDKGENHAX1 U4649 (.A(S_4_1), .B((A[5] & B[0])), .YS(S_5_0), .YC(C_5_0));
  PDKGENFAX1 U4650 (.A(S_4_2), .B(C_4_1), .C((A[5] & B[1])), .YS(S_5_1), .YC(C_5_1));
  PDKGENFAX1 U4651 (.A(S_4_3), .B(C_4_2), .C((A[5] & B[2])), .YS(S_5_2), .YC(C_5_2));
  PDKGENFAX1 U4652 (.A(S_4_4), .B(C_4_3), .C((A[5] & B[3])), .YS(S_5_3), .YC(C_5_3));
  PDKGENFAX1 U4653 (.A(S_4_5), .B(C_4_4), .C((A[5] & B[4])), .YS(S_5_4), .YC(C_5_4));
  PDKGENFAX1 U4654 (.A(S_4_6), .B(C_4_5), .C((A[5] & B[5])), .YS(S_5_5), .YC(C_5_5));
  PDKGENFAX1 U4655 (.A(S_4_7), .B(C_4_6), .C((A[5] & B[6])), .YS(S_5_6), .YC(C_5_6));
  PDKGENHAX1 U4656 (.A(C_4_7), .B(~(A[5] & B[7])), .YS(S_5_7), .YC(C_5_7));
  PDKGENFAX1 U4657 (.A(S_5_1), .B(C_5_0), .C((A[6] & B[0])), .YS(S_6_0), .YC(C_6_0));
  PDKGENFAX1 U4658 (.A(S_5_2), .B(C_5_1), .C((A[6] & B[1])), .YS(S_6_1), .YC(C_6_1));
  PDKGENFAX1 U4659 (.A(S_5_3), .B(C_5_2), .C((A[6] & B[2])), .YS(S_6_2), .YC(C_6_2));
  PDKGENFAX1 U4660 (.A(S_5_4), .B(C_5_3), .C((A[6] & B[3])), .YS(S_6_3), .YC(C_6_3));
  PDKGENFAX1 U4661 (.A(S_5_5), .B(C_5_4), .C((A[6] & B[4])), .YS(S_6_4), .YC(C_6_4));
  PDKGENFAX1 U4662 (.A(S_5_6), .B(C_5_5), .C((A[6] & B[5])), .YS(S_6_5), .YC(C_6_5));
  PDKGENFAX1 U4663 (.A(S_5_7), .B(C_5_6), .C((A[6] & B[6])), .YS(S_6_6), .YC(C_6_6));
  PDKGENHAX1 U4664 (.A(C_5_7), .B(~(A[6] & B[7])), .YS(S_6_7), .YC(C_6_7));
  PDKGENFAX1 U4665 (.A(S_6_1), .B(C_6_0), .C(~(A[7] & B[0])), .YS(S_7_0), .YC(C_7_0));
  PDKGENFAX1 U4666 (.A(S_6_2), .B(C_6_1), .C(~(A[7] & B[1])), .YS(S_7_1), .YC(C_7_1));
  PDKGENFAX1 U4667 (.A(S_6_3), .B(C_6_2), .C(~(A[7] & B[2])), .YS(S_7_2), .YC(C_7_2));
  PDKGENFAX1 U4668 (.A(S_6_4), .B(C_6_3), .C(~(A[7] & B[3])), .YS(S_7_3), .YC(C_7_3));
  PDKGENFAX1 U4669 (.A(S_6_5), .B(C_6_4), .C(~(A[7] & B[4])), .YS(S_7_4), .YC(C_7_4));
  PDKGENFAX1 U4670 (.A(S_6_6), .B(C_6_5), .C(~(A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  PDKGENFAX1 U4671 (.A(S_6_7), .B(C_6_6), .C(~(A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  PDKGENHAX1 U4672 (.A(C_6_7), .B((A[7] & B[7])), .YS(S_7_7), .YC(C_7_7));
  PDKGENHAX1 U4673 (.A(S_7_1), .B(C_7_0), .YS(S_8_0), .YC(C_8_0));
  PDKGENFAX1 U4674 (.A(S_7_2), .B(C_8_0), .C(C_7_1), .YS(S_8_1), .YC(C_8_1));
  PDKGENFAX1 U4675 (.A(S_7_3), .B(C_8_1), .C(C_7_2), .YS(S_8_2), .YC(C_8_2));
  PDKGENFAX1 U4676 (.A(S_7_4), .B(C_8_2), .C(C_7_3), .YS(S_8_3), .YC(C_8_3));
  PDKGENFAX1 U4677 (.A(S_7_5), .B(C_8_3), .C(C_7_4), .YS(S_8_4), .YC(C_8_4));
  PDKGENFAX1 U4678 (.A(S_7_6), .B(C_8_4), .C(C_7_5), .YS(S_8_5), .YC(C_8_5));
  PDKGENFAX1 U4679 (.A(S_7_7), .B(C_8_5), .C(C_7_6), .YS(S_8_6), .YC(C_8_6));
  PDKGENFAX1 U4680 (.A(1'b1), .B(C_8_6), .C(C_7_7), .YS(S_8_7), .YC(C_8_7));
  assign O = {S_8_7,S_8_6,S_8_5,S_8_4,S_8_3,S_8_2,S_8_1,S_8_0,S_7_0,S_6_0,S_5_0,1'b0,1'b0,1'b0,1'b0,1'b0};

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
