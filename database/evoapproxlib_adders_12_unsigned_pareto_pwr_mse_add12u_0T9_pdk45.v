/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek and R. Hrbacek, "Role of circuit representation in evolutionary design of energy-efficient approximate circuits" in IET Computers & Digital Techniques, vol. 12, no. 4, pp. 139-149, 7 2018. doi: 10.1049/iet-cdt.2017.0188 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 0.037 %
// MAE = 3.0 
// WCE% = 0.098 %
// WCE = 8.0 
// WCRE% = 800.00 %
// EP% = 90.62 %
// MRE% = 0.10 %
// MSE = 14 
// PDK45_PWR = 0.036 mW
// PDK45_AREA = 72.7 um2
// PDK45_DELAY = 0.68 ns

module add12u_0T9(A, B, O);
  input [11:0] A, B;
  output [12:0] O;
  wire n_318, n_319, n_411, n_410, n_255, n_254, n_796, n_546, n_702, n_45;
  wire n_44, n_47, n_46, n_41, n_40, n_43, n_42, n_380, n_141, n_140;
  wire n_670, n_462, n_774, n_775, n_754, n_400, n_244, n_245, n_755, n_712;
  wire n_30, n_31, n_32, n_33, n_34, n_35, n_36, n_37, n_38, n_39;
  wire n_817, n_816, n_785, n_390, n_391, n_784, n_150, n_151, n_660, n_433;
  wire n_432, n_722, n_235, n_234, n_23, n_22, n_21, n_20, n_27, n_26;
  wire n_25, n_24, n_29, n_28, n_806, n_807, n_556, n_484, n_121, n_120;
  wire n_836, n_349, n_348, n_224, n_225, n_2, n_18, n_19, n_16, n_17;
  wire n_14, n_3, n_12, n_13, n_10, n_11, n_98, n_99, n_130, n_131;
  wire n_826, n_827, n_453, n_452, n_15, n_89, n_88, n_536, n_537, n_442;
  wire n_692, n_110, n_111, n_297, n_296, n_504, n_277, n_276, n_566, n_370;
  wire n_680, n_163, n_162, n_286, n_287, n_598, n_206, n_207, n_514, n_266;
  wire n_267, n_8, n_9, n_4, n_5, n_6, n_7, n_0, n_1, n_307;
  wire n_306, n_172, n_173, n_797, n_422, n_765, n_764, n_608, n_609;
  assign n_0 = A[0];
  assign n_1 = A[0];
  assign n_2 = A[1];
  assign n_3 = A[1];
  assign n_4 = A[2];
  assign n_5 = A[2];
  assign n_6 = A[3];
  assign n_7 = A[3];
  assign n_8 = A[4];
  assign n_9 = A[4];
  assign n_10 = A[5];
  assign n_11 = A[5];
  assign n_12 = A[6];
  assign n_13 = A[6];
  assign n_14 = A[7];
  assign n_15 = A[7];
  assign n_16 = A[8];
  assign n_17 = A[8];
  assign n_18 = A[9];
  assign n_19 = A[9];
  assign n_20 = A[10];
  assign n_21 = A[10];
  assign n_22 = A[11];
  assign n_23 = A[11];
  assign n_24 = B[0];
  assign n_25 = B[0];
  assign n_26 = B[1];
  assign n_27 = B[1];
  assign n_28 = B[2];
  assign n_29 = B[2];
  assign n_30 = B[3];
  assign n_31 = B[3];
  assign n_32 = B[4];
  assign n_33 = B[4];
  assign n_34 = B[5];
  assign n_35 = B[5];
  assign n_36 = B[6];
  assign n_37 = B[6];
  assign n_38 = B[7];
  assign n_39 = B[7];
  assign n_40 = B[8];
  assign n_41 = B[8];
  assign n_42 = B[9];
  assign n_43 = B[9];
  assign n_44 = B[10];
  assign n_45 = B[10];
  assign n_46 = B[11];
  assign n_47 = B[11];
  HAX1 tmp59(.YS(n_88), .YC(n_89), .A(n_8), .B(n_32));
  HAX1 tmp60(.YS(n_98), .YC(n_99), .A(n_10), .B(n_34));
  HAX1 tmp61(.YS(n_110), .YC(n_111), .A(n_12), .B(n_36));
  HAX1 tmp62(.YS(n_120), .YC(n_121), .A(n_14), .B(n_38));
  HAX1 tmp63(.YS(n_130), .YC(n_131), .A(n_16), .B(n_40));
  HAX1 tmp64(.YS(n_140), .YC(n_141), .A(n_18), .B(n_42));
  HAX1 tmp65(.YS(n_150), .YC(n_151), .A(n_20), .B(n_44));
  HAX1 tmp66(.YS(n_162), .YC(n_163), .A(n_22), .B(n_46));
  assign n_172 = n_6;
  assign n_173 = n_172;
  assign n_206 = ~n_6;
  assign n_207 = n_206;
  assign n_224 = n_89;
  assign n_225 = n_224;
  assign n_234 = n_110 & n_99;
  assign n_235 = n_234;
  assign n_244 = n_110 & n_98;
  assign n_245 = n_244;
  assign n_254 = n_111 | n_235;
  assign n_255 = n_254;
  assign n_266 = n_130 & n_121;
  assign n_267 = n_266;
  assign n_276 = n_130 & n_120;
  assign n_277 = n_276;
  assign n_286 = n_131 | n_267;
  assign n_287 = n_286;
  assign n_296 = n_150 & n_141;
  assign n_297 = n_296;
  assign n_306 = n_150 & n_140;
  assign n_307 = n_306;
  assign n_318 = n_151 | n_297;
  assign n_319 = n_318;
  assign n_348 = n_88 & n_6;
  assign n_349 = n_348;
  assign n_370 = n_225 | n_348;
  assign n_380 = n_245 & n_225;
  assign n_390 = n_244 & n_349;
  assign n_391 = n_390;
  assign n_400 = n_255 | n_380;
  assign n_410 = n_277 & n_255;
  assign n_411 = n_410;
  assign n_422 = n_276 & n_244;
  assign n_432 = n_287 | n_410;
  assign n_433 = n_432;
  assign n_442 = n_306 & n_286;
  assign n_452 = n_307 & n_276;
  assign n_453 = n_452;
  assign n_462 = n_319 | n_442;
  assign n_484 = n_370;
  assign n_504 = n_400 | n_391;
  assign n_514 = n_422 & n_484;
  assign n_536 = n_433 | n_514;
  assign n_537 = n_536;
  assign n_546 = n_453 & n_411;
  assign n_556 = n_452;
  assign n_566 = n_462 | n_546;
  assign n_598 = n_556 & n_514;
  assign n_608 = n_566 | n_598;
  assign n_609 = n_608;
  assign n_660 = n_98 & n_484;
  assign n_670 = n_99 | n_660;
  assign n_680 = n_120 & n_504;
  assign n_692 = n_121 | n_680;
  assign n_702 = n_140 & n_537;
  assign n_712 = n_141 | n_702;
  assign n_722 = n_30;
  HAX1 tmp125(.YS(n_754), .YC(n_755), .A(n_88), .B(n_173));
  HAX1 tmp126(.YS(n_764), .YC(n_765), .A(n_98), .B(n_484));
  HAX1 tmp127(.YS(n_774), .YC(n_775), .A(n_110), .B(n_670));
  HAX1 tmp128(.YS(n_784), .YC(n_785), .A(n_120), .B(n_504));
  HAX1 tmp129(.YS(n_796), .YC(n_797), .A(n_130), .B(n_692));
  HAX1 tmp130(.YS(n_806), .YC(n_807), .A(n_140), .B(n_536));
  HAX1 tmp131(.YS(n_816), .YC(n_817), .A(n_150), .B(n_712));
  HAX1 tmp132(.YS(n_826), .YC(n_827), .A(n_162), .B(n_609));
  assign n_836 = n_163 | n_827;
  assign O[0] = n_24;
  assign O[1] = n_2;
  assign O[2] = n_722;
  assign O[3] = n_207;
  assign O[4] = n_754;
  assign O[5] = n_764;
  assign O[6] = n_774;
  assign O[7] = n_784;
  assign O[8] = n_796;
  assign O[9] = n_806;
  assign O[10] = n_816;
  assign O[11] = n_826;
  assign O[12] = n_836;
endmodule

