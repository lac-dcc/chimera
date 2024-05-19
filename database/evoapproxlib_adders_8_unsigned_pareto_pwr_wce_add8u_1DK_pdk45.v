// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek and R. Hrbacek, "Role of circuit representation in evolutionary design of energy-efficient approximate circuits" in IET Computers & Digital Techniques, vol. 12, no. 4, pp. 139-149, 7 2018. doi: 10.1049/iet-cdt.2017.0188 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 0.88 %
// MAE = 4.5 
// WCE% = 2.34 %
// WCE = 12 
// WCRE% = 1100.00 %
// EP% = 93.75 %
// MRE% = 2.54 %
// MSE = 30 
// PDK45_PWR = 0.016 mW
// PDK45_AREA = 53.0 um2
// PDK45_DELAY = 0.42 ns

module add8u_1DK(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  wire n_304, n_411, n_410, n_23, n_22, n_21, n_20, n_27, n_26, n_25;
  wire n_24, n_262, n_29, n_28, n_263, n_240, n_82, n_346, n_389, n_388;
  wire n_284, n_285, n_326, n_38, n_127, n_126, n_220, n_241, n_347, n_221;
  wire n_8, n_9, n_368, n_159, n_4, n_5, n_6, n_7, n_0, n_1;
  wire n_2, n_3, n_30, n_31, n_117, n_18, n_19, n_16, n_17, n_14;
  wire n_15, n_12, n_13, n_10, n_11, n_158, n_45, n_94, n_95, n_44;
  wire n_178, n_179, n_136, n_137, n_305, n_116;
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
  assign n_16 = B[0];
  assign n_17 = B[0];
  assign n_18 = B[1];
  assign n_19 = B[1];
  assign n_20 = B[2];
  assign n_21 = B[2];
  assign n_22 = B[3];
  assign n_23 = B[3];
  assign n_24 = B[4];
  assign n_25 = B[4];
  assign n_26 = B[5];
  assign n_27 = B[5];
  assign n_28 = B[6];
  assign n_29 = B[6];
  assign n_30 = B[7];
  assign n_31 = B[7];
  assign n_38 = n_6 & n_4;
  HAX1 tmp44(.YS(n_44), .YC(n_45), .A(n_22), .B(n_22));
  assign n_82 = n_38 & n_22;
  assign n_94 = n_20 & n_82;
  assign n_95 = n_94;
  HAX1 tmp48(.YS(n_116), .YC(n_117), .A(n_8), .B(n_24));
  assign n_126 = ~n_44;
  assign n_127 = n_126;
  FAX1 tmp51(.YS(n_136), .YC(n_137), .A(n_10), .B(n_26), .C(n_117));
  FAX1 tmp52(.YS(n_158), .YC(n_159), .A(n_12), .B(n_28), .C(n_137));
  FAX1 tmp53(.YS(n_178), .YC(n_179), .A(n_14), .B(n_30), .C(n_159));
  assign n_220 = ~(n_116 & n_95);
  assign n_221 = n_220;
  assign n_240 = ~n_221;
  assign n_241 = n_240;
  FAX1 tmp58(.YS(n_262), .YC(n_263), .A(n_10), .B(n_26), .C(n_127));
  FAX1 tmp59(.YS(n_284), .YC(n_285), .A(n_12), .B(n_28), .C(n_263));
  FAX1 tmp60(.YS(n_304), .YC(n_305), .A(n_14), .B(n_30), .C(n_285));
  MUX2X1 tmp61(.Y(n_326), .A(n_116), .B(n_220), .S(n_95));
  MUX2X1 tmp62(.Y(n_346), .A(n_136), .B(n_262), .S(n_240));
  assign n_347 = n_346;
  MUX2X1 tmp64(.Y(n_368), .A(n_158), .B(n_284), .S(n_240));
  MUX2X1 tmp65(.Y(n_388), .A(n_178), .B(n_304), .S(n_241));
  assign n_389 = n_388;
  MUX2X1 tmp67(.Y(n_410), .A(n_179), .B(n_305), .S(n_241));
  assign n_411 = n_410;
  assign O[0] = n_6;
  assign O[1] = n_18;
  assign O[2] = n_126;
  assign O[3] = n_127;
  assign O[4] = n_326;
  assign O[5] = n_347;
  assign O[6] = n_368;
  assign O[7] = n_389;
  assign O[8] = n_411;
endmodule

