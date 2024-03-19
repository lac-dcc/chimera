/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek and R. Hrbacek, "Role of circuit representation in evolutionary design of energy-efficient approximate circuits" in IET Computers & Digital Techniques, vol. 12, no. 4, pp. 139-149, 7 2018. doi: 10.1049/iet-cdt.2017.0188 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 1.62 %
// MAE = 133 
// WCE% = 4.49 %
// WCE = 368 
// WCRE% = 1500.00 %
// EP% = 99.81 %
// MRE% = 4.44 %
// MSE = 24176 
// PDK45_PWR = 0.012 mW
// PDK45_AREA = 26.8 um2
// PDK45_DELAY = 0.27 ns

module add12u_2PX(A, B, O);
  input [11:0] A, B;
  output [12:0] O;
  wire n_414, n_251, n_256, n_419, n_237, n_23, n_22, n_21, n_20, n_27;
  wire n_410, n_405, n_38, n_126, n_107, n_303, n_265, n_8, n_9, n_400;
  wire n_4, n_5, n_6, n_7, n_0, n_1, n_2, n_3, n_358, n_18;
  wire n_19, n_16, n_17, n_14, n_15, n_12, n_13, n_10, n_11, n_117;
  wire n_112, n_130;
  assign n_0 = A[0];
  assign n_1 = A[1];
  assign n_2 = A[2];
  assign n_3 = A[3];
  assign n_4 = A[4];
  assign n_5 = A[5];
  assign n_6 = A[6];
  assign n_7 = A[7];
  assign n_8 = A[8];
  assign n_9 = A[9];
  assign n_10 = A[10];
  assign n_11 = A[11];
  assign n_12 = B[0];
  assign n_13 = B[1];
  assign n_14 = B[2];
  assign n_15 = B[3];
  assign n_16 = B[4];
  assign n_17 = B[5];
  assign n_18 = B[6];
  assign n_19 = B[7];
  assign n_20 = B[8];
  assign n_21 = B[9];
  assign n_22 = B[10];
  assign n_23 = B[11];
  assign n_27 = n_22 & n_10;
  assign n_38 = n_22 | n_10;
  assign n_107 = n_9 ^ n_21;
  assign n_112 = n_9 & n_21;
  assign n_117 = n_10 ^ n_22;
  assign n_126 = n_11 ^ n_23;
  assign n_130 = n_11 & n_23;
  assign n_237 = n_8 & n_107;
  assign n_251 = n_112 & n_38;
  assign n_256 = n_251 | n_27;
  assign n_265 = n_237 & n_38;
  assign n_303 = n_265 | n_256;
  assign n_358 = ~(n_237 | n_112);
  assign n_400 = n_107 ^ n_8;
  assign n_405 = ~(n_117 ^ n_358);
  assign n_410 = n_126 ^ n_303;
  assign n_414 = n_126 & n_303;
  assign n_419 = n_130 | n_414;
  assign O[0] = n_20;
  assign O[1] = n_7;
  assign O[2] = n_14;
  assign O[3] = n_11;
  assign O[4] = n_0;
  assign O[5] = n_10;
  assign O[6] = n_3;
  assign O[7] = n_19;
  assign O[8] = n_20;
  assign O[9] = n_400;
  assign O[10] = n_405;
  assign O[11] = n_410;
  assign O[12] = n_419;
endmodule

