// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek and R. Hrbacek, "Role of circuit representation in evolutionary design of energy-efficient approximate circuits" in IET Computers & Digital Techniques, vol. 12, no. 4, pp. 139-149, 7 2018. doi: 10.1049/iet-cdt.2017.0188 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 1.64 %
// MAE = 8.4 
// WCE% = 4.30 %
// WCE = 22 
// WCRE% = 100.00 %
// EP% = 96.88 %
// MRE% = 4.57 %
// MSE = 100 
// PDK45_PWR = 0.012 mW
// PDK45_AREA = 26.8 um2
// PDK45_DELAY = 0.27 ns

module add8u_2XT(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  wire n_193, n_44, n_47, n_40, n_42, n_187, n_49, n_149, n_147, n_144;
  wire n_209, n_182, n_180, n_8, n_9, n_184, n_4, n_5, n_6, n_7;
  wire n_0, n_1, n_2, n_3, n_37, n_38, n_14, n_15, n_12, n_13;
  wire n_10, n_11, n_116, n_178, n_118, n_156, n_213, n_211;
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
  assign n_37 = n_7 | n_15;
  assign n_38 = n_5 ^ n_13;
  assign n_40 = n_5 & n_13;
  assign n_42 = n_6 ^ n_14;
  assign n_44 = n_6 & n_14;
  assign n_47 = ~(n_7 ^ n_15);
  assign n_49 = n_7 & n_15;
  assign n_116 = n_38 & n_12;
  assign n_118 = ~(n_40 | n_116);
  assign n_144 = n_42 & n_116;
  assign n_147 = n_42 & n_40;
  assign n_149 = n_44 | n_147;
  assign n_156 = ~(n_149 | n_144);
  assign n_178 = n_37 & n_144;
  assign n_180 = n_37 & n_147;
  assign n_182 = n_37 & n_44;
  assign n_184 = n_49 | n_182;
  assign n_187 = n_180 | n_178;
  assign n_193 = n_184 | n_187;
  assign n_209 = n_38 ^ n_12;
  assign n_211 = ~(n_42 ^ n_118);
  assign n_213 = n_47 ^ n_156;
  assign O[0] = n_0;
  assign O[1] = n_5;
  assign O[2] = n_5;
  assign O[3] = n_11;
  assign O[4] = n_4;
  assign O[5] = n_209;
  assign O[6] = n_211;
  assign O[7] = n_213;
  assign O[8] = n_193;
endmodule

