// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek and R. Hrbacek, "Role of circuit representation in evolutionary design of energy-efficient approximate circuits" in IET Computers & Digital Techniques, vol. 12, no. 4, pp. 139-149, 7 2018. doi: 10.1049/iet-cdt.2017.0188 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.0061 %
// MAE = 0.5 
// WCE% = 0.012 %
// WCE = 1.0 
// WCRE% = 50.00 %
// EP% = 50.00 %
// MRE% = 0.017 %
// MSE = 0.5 
// PDK45_PWR = 0.047 mW
// PDK45_AREA = 97.1 um2
// PDK45_DELAY = 0.88 ns

module add12u_20A(A, B, O);
  input [11:0] A, B;
  output [12:0] O;
  wire n_415, n_410, n_255, n_312, n_259, n_419, n_317, n_46, n_41, n_384;
  wire n_148, n_388, n_406, n_68, n_401, n_246, n_241, n_32, n_37, n_397;
  wire n_392, n_299, n_152, n_157, n_237, n_23, n_22, n_21, n_20, n_24;
  wire n_28, n_126, n_121, n_344, n_228, n_184, n_188, n_348, n_224, n_2;
  wire n_18, n_19, n_16, n_17, n_14, n_15, n_12, n_13, n_10, n_11;
  wire n_95, n_90, n_99, n_330, n_335, n_139, n_339, n_135, n_357, n_352;
  wire n_197, n_81, n_86, n_108, n_104, n_361, n_366, n_117, n_112, n_295;
  wire n_77, n_72, n_290, n_215, n_219, n_277, n_379, n_272, n_375, n_370;
  wire n_161, n_166, n_281, n_64, n_201, n_206, n_264, n_8, n_9, n_4;
  wire n_5, n_6, n_7, n_0, n_1, n_268, n_3, n_59, n_175, n_52;
  wire n_50, n_179, n_55;
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
  assign n_24 = ~(n_11 | n_21);
  assign n_28 = n_24 & n_21;
  assign n_32 = n_1 ^ n_13;
  assign n_37 = n_1 & n_13;
  assign n_41 = n_2 ^ n_14;
  assign n_46 = n_2 & n_14;
  assign n_50 = n_3 ^ n_15;
  assign n_52 = ~(n_6 & n_28);
  assign n_55 = n_3 & n_15;
  assign n_59 = n_4 ^ n_16;
  assign n_64 = n_4 & n_16;
  assign n_68 = n_5 ^ n_17;
  assign n_72 = n_5 & n_17;
  assign n_77 = n_6 ^ n_18;
  assign n_81 = n_6 & n_18;
  assign n_86 = n_7 ^ n_19;
  assign n_90 = n_7 & n_19;
  assign n_95 = n_8 ^ n_20;
  assign n_99 = n_8 & n_20;
  assign n_104 = n_9 ^ n_21;
  assign n_108 = n_9 & n_21;
  assign n_112 = n_10 ^ n_22;
  assign n_117 = n_10 & n_22;
  assign n_121 = n_11 ^ n_23;
  assign n_126 = n_11 & n_23;
  assign n_135 = n_28 | n_37;
  assign n_139 = n_2 & n_50;
  assign n_148 = n_13 & n_50;
  assign n_152 = n_14 & n_139;
  assign n_157 = n_152 | n_55;
  assign n_161 = n_157 & n_59;
  assign n_166 = n_161 | n_64;
  assign n_175 = n_13 & n_59;
  assign n_179 = n_72 & n_77;
  assign n_184 = n_179 | n_81;
  assign n_188 = n_68 & n_77;
  assign n_197 = n_179 | n_81;
  assign n_201 = n_197 & n_86;
  assign n_206 = n_201 | n_90;
  assign n_215 = n_188 & n_86;
  assign n_219 = n_99 & n_104;
  assign n_224 = n_219 | n_108;
  assign n_228 = n_95 & n_104;
  assign n_237 = n_224;
  assign n_241 = n_237 & n_112;
  assign n_246 = n_241 | n_117;
  assign n_255 = n_52 & n_112;
  assign n_259 = n_37 & n_41;
  assign n_264 = n_259 | n_46;
  assign n_268 = n_259 & n_148;
  assign n_272 = n_268 | n_157;
  assign n_277 = n_268 & n_175;
  assign n_281 = n_277 | n_166;
  assign n_290 = n_277 | n_166;
  assign n_295 = n_290 & n_68;
  assign n_299 = n_295 | n_72;
  assign n_312 = n_295 & n_188;
  assign n_317 = n_312 | n_184;
  assign n_330 = n_312 & n_215;
  assign n_335 = n_330 | n_206;
  assign n_339 = n_335 & n_95;
  assign n_344 = n_339 | n_99;
  assign n_348 = n_335 & n_228;
  assign n_352 = n_348 | n_224;
  assign n_357 = n_348 & n_255;
  assign n_361 = n_357 | n_246;
  assign n_366 = n_32;
  assign n_370 = n_41 ^ n_135;
  assign n_375 = n_50 ^ n_264;
  assign n_379 = n_59 ^ n_272;
  assign n_384 = n_68 ^ n_281;
  assign n_388 = n_77 ^ n_299;
  assign n_392 = n_86 ^ n_317;
  assign n_397 = n_95 ^ n_335;
  assign n_401 = n_104 ^ n_344;
  assign n_406 = n_112 ^ n_352;
  assign n_410 = n_121 ^ n_361;
  assign n_415 = n_121 & n_361;
  assign n_419 = n_126 | n_415;
  assign O[0] = n_52;
  assign O[1] = n_366;
  assign O[2] = n_370;
  assign O[3] = n_375;
  assign O[4] = n_379;
  assign O[5] = n_384;
  assign O[6] = n_388;
  assign O[7] = n_392;
  assign O[8] = n_397;
  assign O[9] = n_401;
  assign O[10] = n_406;
  assign O[11] = n_410;
  assign O[12] = n_419;
endmodule

