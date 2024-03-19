/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.051 %
// MAE = 33 
// WCE% = 0.21 %
// WCE = 137 
// WCRE% = 900.00 %
// EP% = 74.80 %
// MRE% = 2.73 %
// MSE = 2746 
// PDK45_PWR = 0.363 mW
// PDK45_AREA = 635.0 um2
// PDK45_DELAY = 1.37 ns


module mul8s_1KR6 ( A, B, O );
  input [7:0] A;
  input [7:0] B;
  output [15:0] O;

  wire C_1_6,C_1_7,C_2_1,C_2_2,C_2_3,C_2_4,C_2_5,C_2_6,C_2_7,C_3_0,C_3_1,C_3_2,C_3_3,C_3_4,C_3_5,C_3_6,C_3_7,C_4_0,C_4_1,C_4_2,C_4_3,C_4_4,C_4_5,C_4_6,C_4_7,C_5_0,C_5_1,C_5_2,C_5_3,C_5_4,C_5_5,C_5_6,C_5_7,C_6_0,C_6_1,C_6_2,C_6_3,C_6_4,C_6_5,C_6_6,C_6_7,C_7_0,C_7_1,C_7_2,C_7_3,C_7_4,C_7_5,C_7_6,C_7_7,C_8_0,C_8_1,C_8_2,C_8_3,C_8_4,C_8_5,C_8_6,C_8_7,S_0_7,S_1_2,S_1_3,S_1_4,S_1_5,S_1_6,S_1_7,S_2_1,S_2_2,S_2_3,S_2_4,S_2_5,S_2_6,S_2_7,S_3_0,S_3_1,S_3_2,S_3_3,S_3_4,S_3_5,S_3_6,S_3_7,S_4_0,S_4_1,S_4_2,S_4_3,S_4_4,S_4_5,S_4_6,S_4_7,S_5_0,S_5_1,S_5_2,S_5_3,S_5_4,S_5_5,S_5_6,S_5_7,S_6_0,S_6_1,S_6_2,S_6_3,S_6_4,S_6_5,S_6_6,S_6_7,S_7_0,S_7_1,S_7_2,S_7_3,S_7_4,S_7_5,S_7_6,S_7_7,S_8_0,S_8_1,S_8_2,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7;

  assign S_0_7 = 1'b1;
  assign S_1_2 = (A[1] & B[2]);
  assign S_1_3 = (A[1] & B[3]);
  assign S_1_4 = (A[1] & B[4]);
  assign S_1_5 = (A[1] & B[5]);
  PDKGENHAX1 U2463 (.A(S_0_7), .B((A[1] & B[6])), .YS(S_1_6), .YC(C_1_6));
  PDKGENHAX1 U2464 (.A(1'b1), .B(~(A[1] & B[7])), .YS(S_1_7), .YC(C_1_7));
  PDKGENHAX1 U2466 (.A(S_1_2), .B((A[2] & B[1])), .YS(S_2_1), .YC(C_2_1));
  PDKGENHAX1 U2467 (.A(S_1_3), .B((A[2] & B[2])), .YS(S_2_2), .YC(C_2_2));
  PDKGENHAX1 U2468 (.A(S_1_4), .B((A[2] & B[3])), .YS(S_2_3), .YC(C_2_3));
  PDKGENHAX1 U2469 (.A(S_1_5), .B((A[2] & B[4])), .YS(S_2_4), .YC(C_2_4));
  PDKGENHAX1 U2470 (.A(S_1_6), .B((A[2] & B[5])), .YS(S_2_5), .YC(C_2_5));
  PDKGENFAX1 U2471 (.A(S_1_7), .B(C_1_6), .C((A[2] & B[6])), .YS(S_2_6), .YC(C_2_6));
  PDKGENHAX1 U2472 (.A(C_1_7), .B(~(A[2] & B[7])), .YS(S_2_7), .YC(C_2_7));
  PDKGENHAX1 U2473 (.A(S_2_1), .B((A[3] & B[0])), .YS(S_3_0), .YC(C_3_0));
  PDKGENFAX1 U2474 (.A(S_2_2), .B(C_2_1), .C((A[3] & B[1])), .YS(S_3_1), .YC(C_3_1));
  PDKGENFAX1 U2475 (.A(S_2_3), .B(C_2_2), .C((A[3] & B[2])), .YS(S_3_2), .YC(C_3_2));
  PDKGENFAX1 U2476 (.A(S_2_4), .B(C_2_3), .C((A[3] & B[3])), .YS(S_3_3), .YC(C_3_3));
  PDKGENFAX1 U2477 (.A(S_2_5), .B(C_2_4), .C((A[3] & B[4])), .YS(S_3_4), .YC(C_3_4));
  PDKGENFAX1 U2478 (.A(S_2_6), .B(C_2_5), .C((A[3] & B[5])), .YS(S_3_5), .YC(C_3_5));
  PDKGENFAX1 U2479 (.A(S_2_7), .B(C_2_6), .C((A[3] & B[6])), .YS(S_3_6), .YC(C_3_6));
  PDKGENHAX1 U2480 (.A(C_2_7), .B(~(A[3] & B[7])), .YS(S_3_7), .YC(C_3_7));
  PDKGENFAX1 U2481 (.A(S_3_1), .B(C_3_0), .C((A[4] & B[0])), .YS(S_4_0), .YC(C_4_0));
  PDKGENFAX1 U2482 (.A(S_3_2), .B(C_3_1), .C((A[4] & B[1])), .YS(S_4_1), .YC(C_4_1));
  PDKGENFAX1 U2483 (.A(S_3_3), .B(C_3_2), .C((A[4] & B[2])), .YS(S_4_2), .YC(C_4_2));
  PDKGENFAX1 U2484 (.A(S_3_4), .B(C_3_3), .C((A[4] & B[3])), .YS(S_4_3), .YC(C_4_3));
  PDKGENFAX1 U2485 (.A(S_3_5), .B(C_3_4), .C((A[4] & B[4])), .YS(S_4_4), .YC(C_4_4));
  PDKGENFAX1 U2486 (.A(S_3_6), .B(C_3_5), .C((A[4] & B[5])), .YS(S_4_5), .YC(C_4_5));
  PDKGENFAX1 U2487 (.A(S_3_7), .B(C_3_6), .C((A[4] & B[6])), .YS(S_4_6), .YC(C_4_6));
  PDKGENHAX1 U2488 (.A(C_3_7), .B(~(A[4] & B[7])), .YS(S_4_7), .YC(C_4_7));
  PDKGENFAX1 U2489 (.A(S_4_1), .B(C_4_0), .C((A[5] & B[0])), .YS(S_5_0), .YC(C_5_0));
  PDKGENFAX1 U2490 (.A(S_4_2), .B(C_4_1), .C((A[5] & B[1])), .YS(S_5_1), .YC(C_5_1));
  PDKGENFAX1 U2491 (.A(S_4_3), .B(C_4_2), .C((A[5] & B[2])), .YS(S_5_2), .YC(C_5_2));
  PDKGENFAX1 U2492 (.A(S_4_4), .B(C_4_3), .C((A[5] & B[3])), .YS(S_5_3), .YC(C_5_3));
  PDKGENFAX1 U2493 (.A(S_4_5), .B(C_4_4), .C((A[5] & B[4])), .YS(S_5_4), .YC(C_5_4));
  PDKGENFAX1 U2494 (.A(S_4_6), .B(C_4_5), .C((A[5] & B[5])), .YS(S_5_5), .YC(C_5_5));
  PDKGENFAX1 U2495 (.A(S_4_7), .B(C_4_6), .C((A[5] & B[6])), .YS(S_5_6), .YC(C_5_6));
  PDKGENHAX1 U2496 (.A(C_4_7), .B(~(A[5] & B[7])), .YS(S_5_7), .YC(C_5_7));
  PDKGENFAX1 U2497 (.A(S_5_1), .B(C_5_0), .C((A[6] & B[0])), .YS(S_6_0), .YC(C_6_0));
  PDKGENFAX1 U2498 (.A(S_5_2), .B(C_5_1), .C((A[6] & B[1])), .YS(S_6_1), .YC(C_6_1));
  PDKGENFAX1 U2499 (.A(S_5_3), .B(C_5_2), .C((A[6] & B[2])), .YS(S_6_2), .YC(C_6_2));
  PDKGENFAX1 U2500 (.A(S_5_4), .B(C_5_3), .C((A[6] & B[3])), .YS(S_6_3), .YC(C_6_3));
  PDKGENFAX1 U2501 (.A(S_5_5), .B(C_5_4), .C((A[6] & B[4])), .YS(S_6_4), .YC(C_6_4));
  PDKGENFAX1 U2502 (.A(S_5_6), .B(C_5_5), .C((A[6] & B[5])), .YS(S_6_5), .YC(C_6_5));
  PDKGENFAX1 U2503 (.A(S_5_7), .B(C_5_6), .C((A[6] & B[6])), .YS(S_6_6), .YC(C_6_6));
  PDKGENHAX1 U2504 (.A(C_5_7), .B(~(A[6] & B[7])), .YS(S_6_7), .YC(C_6_7));
  PDKGENFAX1 U2505 (.A(S_6_1), .B(C_6_0), .C(~(A[7] & B[0])), .YS(S_7_0), .YC(C_7_0));
  PDKGENFAX1 U2506 (.A(S_6_2), .B(C_6_1), .C(~(A[7] & B[1])), .YS(S_7_1), .YC(C_7_1));
  PDKGENFAX1 U2507 (.A(S_6_3), .B(C_6_2), .C(~(A[7] & B[2])), .YS(S_7_2), .YC(C_7_2));
  PDKGENFAX1 U2508 (.A(S_6_4), .B(C_6_3), .C(~(A[7] & B[3])), .YS(S_7_3), .YC(C_7_3));
  PDKGENFAX1 U2509 (.A(S_6_5), .B(C_6_4), .C(~(A[7] & B[4])), .YS(S_7_4), .YC(C_7_4));
  PDKGENFAX1 U2510 (.A(S_6_6), .B(C_6_5), .C(~(A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  PDKGENFAX1 U2511 (.A(S_6_7), .B(C_6_6), .C(~(A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  PDKGENHAX1 U2512 (.A(C_6_7), .B((A[7] & B[7])), .YS(S_7_7), .YC(C_7_7));
  PDKGENHAX1 U2513 (.A(S_7_1), .B(C_7_0), .YS(S_8_0), .YC(C_8_0));
  PDKGENFAX1 U2514 (.A(S_7_2), .B(C_8_0), .C(C_7_1), .YS(S_8_1), .YC(C_8_1));
  PDKGENFAX1 U2515 (.A(S_7_3), .B(C_8_1), .C(C_7_2), .YS(S_8_2), .YC(C_8_2));
  PDKGENFAX1 U2516 (.A(S_7_4), .B(C_8_2), .C(C_7_3), .YS(S_8_3), .YC(C_8_3));
  PDKGENFAX1 U2517 (.A(S_7_5), .B(C_8_3), .C(C_7_4), .YS(S_8_4), .YC(C_8_4));
  PDKGENFAX1 U2518 (.A(S_7_6), .B(C_8_4), .C(C_7_5), .YS(S_8_5), .YC(C_8_5));
  PDKGENFAX1 U2519 (.A(S_7_7), .B(C_8_5), .C(C_7_6), .YS(S_8_6), .YC(C_8_6));
  PDKGENFAX1 U2520 (.A(1'b1), .B(C_8_6), .C(C_7_7), .YS(S_8_7), .YC(C_8_7));
  assign O = {S_8_7,S_8_6,S_8_5,S_8_4,S_8_3,S_8_2,S_8_1,S_8_0,S_7_0,S_6_0,S_5_0,S_4_0,S_3_0,1'b0,1'b0,1'b0};

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
