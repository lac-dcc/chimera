// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek and R. Hrbacek, "Role of circuit representation in evolutionary design of energy-efficient approximate circuits" in IET Computers & Digital Techniques, vol. 12, no. 4, pp. 139-149, 7 2018. doi: 10.1049/iet-cdt.2017.0188 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.13 %
// MAE = 11 
// WCE% = 0.44 %
// WCE = 36 
// WCRE% = 1500.00 %
// EP% = 97.22 %
// MRE% = 0.37 %
// MSE = 180 
// PDK45_PWR = 0.028 mW
// PDK45_AREA = 61.5 um2
// PDK45_DELAY = 0.55 ns

module add12u_0XE(A, B, O);
  input [11:0] A, B;
  output [12:0] O;
  wire n_352, n_198, n_36, n_413, n_259, n_377, n_418, n_193, n_23, n_22;
  wire n_21, n_20, n_24, n_341, n_249, n_80, n_382, n_85, n_280, n_388;
  wire n_285, n_141, n_203, n_126, n_300, n_208, n_100, n_121, n_106, n_403;
  wire n_347, n_188, n_8, n_9, n_4, n_5, n_6, n_7, n_0, n_1;
  wire n_2, n_3, n_218, n_408, n_18, n_19, n_16, n_17, n_14, n_15;
  wire n_12, n_13, n_10, n_11, n_393, n_116, n_95, n_111, n_90, n_75;
  wire n_295, n_290, n_331, n_213, n_336, n_136, n_177, n_398, n_131;
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
  assign n_24 = n_2 ^ n_2;
  assign n_36 = ~n_24;
  assign n_75 = ~(n_5 ^ n_17);
  assign n_80 = n_5 & n_17;
  assign n_85 = n_6 ^ n_18;
  assign n_90 = n_6 & n_18;
  assign n_95 = n_7 ^ n_19;
  assign n_100 = n_7 & n_19;
  assign n_106 = n_8 ^ n_20;
  assign n_111 = n_8 & n_20;
  assign n_116 = n_9 ^ n_21;
  assign n_121 = n_9 & n_21;
  assign n_126 = n_10 ^ n_22;
  assign n_131 = n_10 & n_22;
  assign n_136 = n_11 ^ n_23;
  assign n_141 = n_11 & n_23;
  assign n_177 = n_85 & n_80;
  assign n_188 = n_90 | n_177;
  assign n_193 = n_106 & n_100;
  assign n_198 = n_106 & n_95;
  assign n_203 = n_111 | n_193;
  assign n_208 = n_126 & n_121;
  assign n_213 = n_126 & n_116;
  assign n_218 = n_131 | n_208;
  assign n_249 = n_213 & n_203;
  assign n_259 = n_218 | n_249;
  assign n_280 = n_188;
  assign n_285 = n_198 & n_188;
  assign n_290 = n_203 | n_285;
  assign n_295 = n_213 & n_285;
  assign n_300 = n_259 | n_295;
  assign n_331 = ~n_80;
  assign n_336 = n_95 & n_188;
  assign n_341 = ~(n_100 | n_336);
  assign n_347 = n_116 & n_290;
  assign n_352 = n_121 | n_347;
  assign n_377 = ~n_75;
  assign n_382 = ~(n_85 ^ n_331);
  assign n_388 = n_95 ^ n_280;
  assign n_393 = ~(n_106 ^ n_341);
  assign n_398 = n_116 ^ n_290;
  assign n_403 = n_126 ^ n_352;
  assign n_408 = n_136 ^ n_300;
  assign n_413 = n_136 & n_300;
  assign n_418 = n_141 | n_413;
  assign O[0] = n_11;
  assign O[1] = n_2;
  assign O[2] = n_5;
  assign O[3] = n_16;
  assign O[4] = n_36;
  assign O[5] = n_377;
  assign O[6] = n_382;
  assign O[7] = n_388;
  assign O[8] = n_393;
  assign O[9] = n_398;
  assign O[10] = n_403;
  assign O[11] = n_408;
  assign O[12] = n_418;
endmodule

