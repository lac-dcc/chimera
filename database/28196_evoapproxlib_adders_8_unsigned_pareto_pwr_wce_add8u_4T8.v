// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek and R. Hrbacek, "Role of circuit representation in evolutionary design of energy-efficient approximate circuits" in IET Computers & Digital Techniques, vol. 12, no. 4, pp. 139-149, 7 2018. doi: 10.1049/iet-cdt.2017.0188 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 0.098 %
// MAE = 0.5 
// WCE% = 0.20 %
// WCE = 1.0 
// WCRE% = 100.00 %
// EP% = 50.00 %
// MRE% = 0.27 %
// MSE = 0.5 
// PDK45_PWR = 0.028 mW
// PDK45_AREA = 61.5 um2
// PDK45_DELAY = 0.55 ns

module add8u_4T8(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  wire n_196, n_192, n_23, n_46, n_27, n_42, n_85, n_69, n_166, n_89;
  wire n_66, n_62, n_200, n_108, n_204, n_208, n_127, n_100, n_189, n_104;
  wire n_8, n_9, n_185, n_4, n_5, n_6, n_7, n_0, n_1, n_2;
  wire n_3, n_31, n_35, n_16, n_39, n_14, n_15, n_12, n_13, n_10;
  wire n_11, n_96, n_173, n_58, n_92, n_177, n_50, n_77, n_154, n_119;
  wire n_54, n_73, n_169, n_212, n_139, n_135, n_131;
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
  assign n_16 = n_3 | n_11;
  assign n_23 = n_1 ^ n_9;
  assign n_27 = n_1 & n_9;
  assign n_31 = n_10 ^ n_2;
  assign n_35 = n_2 & n_10;
  assign n_39 = n_3 ^ n_11;
  assign n_42 = n_3 & n_11;
  assign n_46 = n_4 ^ n_12;
  assign n_50 = n_4 & n_12;
  assign n_54 = n_5 ^ n_13;
  assign n_58 = n_13 & n_5;
  assign n_62 = n_6 ^ n_14;
  assign n_66 = n_6 & n_14;
  assign n_69 = n_7 ^ n_15;
  assign n_73 = n_7 & n_15;
  assign n_77 = n_31 & n_27;
  assign n_85 = n_35 | n_77;
  assign n_89 = n_46 & n_42;
  assign n_92 = n_46 & n_39;
  assign n_96 = n_50 | n_89;
  assign n_100 = n_62 & n_58;
  assign n_104 = n_62 & n_54;
  assign n_108 = n_66 | n_100;
  assign n_119 = n_92 & n_85;
  assign n_127 = n_96 | n_119;
  assign n_131 = n_104 & n_96;
  assign n_135 = n_104 & n_119;
  assign n_139 = n_108 | n_131;
  assign n_154 = n_139 | n_135;
  assign n_166 = n_16 & n_85;
  assign n_169 = n_42 | n_166;
  assign n_173 = n_54 & n_127;
  assign n_177 = n_58 | n_173;
  assign n_185 = n_31 ^ n_27;
  assign n_189 = n_39 ^ n_85;
  assign n_192 = n_46 ^ n_169;
  assign n_196 = n_54 ^ n_127;
  assign n_200 = n_62 ^ n_177;
  assign n_204 = n_69 ^ n_154;
  assign n_208 = n_69 & n_154;
  assign n_212 = n_73 | n_208;
  assign O[0] = n_0;
  assign O[1] = n_23;
  assign O[2] = n_185;
  assign O[3] = n_189;
  assign O[4] = n_192;
  assign O[5] = n_196;
  assign O[6] = n_200;
  assign O[7] = n_204;
  assign O[8] = n_212;
endmodule

