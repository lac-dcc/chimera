/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek and R. Hrbacek, "Role of circuit representation in evolutionary design of energy-efficient approximate circuits" in IET Computers & Digital Techniques, vol. 12, no. 4, pp. 139-149, 7 2018. doi: 10.1049/iet-cdt.2017.0188 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 3.40 %
// MAE = 17 
// WCE% = 9.96 %
// WCE = 51 
// WCRE% = 1500.00 %
// EP% = 98.44 %
// MRE% = 9.24 %
// MSE = 432 
// PDK45_PWR = 0.0075 mW
// PDK45_AREA = 17.8 um2
// PDK45_DELAY = 0.19 ns

module add8u_0H4(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  wire n_198, n_44, n_42, n_149, n_147, n_12, n_182, n_180, n_8, n_9;
  wire n_184, n_4, n_5, n_6, n_7, n_0, n_1, n_2, n_3, n_37;
  wire n_38, n_14, n_15, n_16, n_13, n_10, n_11, n_213, n_211;
  assign n_0 = A[0];
  assign n_1 = A[1];
  assign n_2 = A[2];
  assign n_3 = A[3];
  assign n_4 = A[4];
  assign n_5 = A[5];
  assign n_6 = A[6];
  assign n_7 = A[7];
  assign n_8 = B[0];
  assign n_9 = B[1];
  assign n_10 = B[2];
  assign n_11 = B[3];
  assign n_12 = B[4];
  assign n_13 = B[5];
  assign n_14 = B[6];
  assign n_15 = B[7];
  assign n_16 = n_15 | n_7;
  assign n_37 = n_7 & n_15;
  assign n_38 = n_15 ^ n_7;
  assign n_42 = n_6 ^ n_14;
  assign n_44 = n_6 & n_14;
  assign n_147 = n_42 & n_5;
  assign n_149 = ~(n_44 | n_147);
  assign n_180 = n_16 & n_147;
  assign n_182 = n_16 & n_44;
  assign n_184 = n_37 | n_182;
  assign n_198 = n_184 | n_180;
  assign n_211 = n_42 ^ n_5;
  assign n_213 = ~(n_38 ^ n_149);
  assign O[0] = n_4;
  assign O[1] = n_7;
  assign O[2] = n_9;
  assign O[3] = n_4;
  assign O[4] = n_8;
  assign O[5] = n_13;
  assign O[6] = n_211;
  assign O[7] = n_213;
  assign O[8] = n_198;
endmodule

