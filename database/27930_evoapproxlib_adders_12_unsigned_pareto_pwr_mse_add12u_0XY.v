// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek and R. Hrbacek, "Role of circuit representation in evolutionary design of energy-efficient approximate circuits" in IET Computers & Digital Techniques, vol. 12, no. 4, pp. 139-149, 7 2018. doi: 10.1049/iet-cdt.2017.0188 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 0.10 %
// MAE = 8.2 
// WCE% = 0.24 %
// WCE = 20 
// WCRE% = 100.00 %
// EP% = 96.88 %
// MRE% = 0.28 %
// MSE = 92 
// PDK45_PWR = 0.031 mW
// PDK45_AREA = 62.4 um2
// PDK45_DELAY = 0.60 ns

module add12u_0XY(A, B, O);
  input [11:0] A, B;
  output [12:0] O;
  wire n_414, n_251, n_256, n_293, n_196, n_419, n_354, n_237, n_23, n_22;
  wire n_21, n_20, n_358, n_28, n_405, n_186, n_289, n_382, n_84, n_386;
  wire n_89, n_410, n_200, n_326, n_349, n_205, n_103, n_391, n_126, n_107;
  wire n_233, n_335, n_303, n_344, n_228, n_265, n_8, n_9, n_400, n_4;
  wire n_5, n_6, n_7, n_0, n_1, n_2, n_3, n_93, n_224, n_18;
  wire n_19, n_16, n_17, n_14, n_15, n_12, n_13, n_10, n_11, n_172;
  wire n_340, n_117, n_396, n_79, n_112, n_298, n_75, n_70, n_98, n_330;
  wire n_214, n_219, n_121, n_210, n_130;
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
  assign n_28 = n_4;
  assign n_70 = n_5 ^ n_17;
  assign n_75 = n_5 & n_17;
  assign n_79 = n_6 ^ n_18;
  assign n_84 = n_6 & n_18;
  assign n_89 = n_7 ^ n_19;
  assign n_93 = n_7 & n_19;
  assign n_98 = n_8 ^ n_20;
  assign n_103 = n_8 & n_20;
  assign n_107 = n_9 ^ n_21;
  assign n_112 = n_9 & n_21;
  assign n_117 = n_10 ^ n_22;
  assign n_121 = n_10 & n_22;
  assign n_126 = n_11 ^ n_23;
  assign n_130 = n_11 & n_23;
  assign n_172 = n_4;
  assign n_186 = n_5 & n_79;
  assign n_196 = n_70 & n_79;
  assign n_200 = n_17 & n_186;
  assign n_205 = n_200 | n_84;
  assign n_210 = n_205 & n_89;
  assign n_214 = n_210 | n_93;
  assign n_219 = n_196;
  assign n_224 = n_219 & n_89;
  assign n_228 = n_103 & n_107;
  assign n_233 = n_228 | n_112;
  assign n_237 = n_98 & n_107;
  assign n_251 = n_233 & n_117;
  assign n_256 = n_251 | n_121;
  assign n_265 = n_237 & n_117;
  assign n_289 = n_28 & n_224;
  assign n_293 = n_289 | n_214;
  assign n_298 = n_293 & n_265;
  assign n_303 = n_298 | n_256;
  assign n_326 = n_4 & n_70;
  assign n_330 = n_326 | n_75;
  assign n_335 = n_4 & n_196;
  assign n_340 = n_335 | n_205;
  assign n_344 = n_293 & n_98;
  assign n_349 = n_344 | n_103;
  assign n_354 = n_344 & n_237;
  assign n_358 = n_354 | n_233;
  assign n_382 = n_70 ^ n_172;
  assign n_386 = n_79 ^ n_330;
  assign n_391 = n_89 ^ n_340;
  assign n_396 = n_98 ^ n_293;
  assign n_400 = n_107 ^ n_349;
  assign n_405 = n_117 ^ n_358;
  assign n_410 = n_126 ^ n_303;
  assign n_414 = n_126 & n_303;
  assign n_419 = n_130 | n_414;
  assign O[0] = n_14;
  assign O[1] = n_1;
  assign O[2] = n_10;
  assign O[3] = n_15;
  assign O[4] = n_16;
  assign O[5] = n_382;
  assign O[6] = n_386;
  assign O[7] = n_391;
  assign O[8] = n_396;
  assign O[9] = n_400;
  assign O[10] = n_405;
  assign O[11] = n_410;
  assign O[12] = n_419;
endmodule

