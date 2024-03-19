/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek and R. Hrbacek, "Role of circuit representation in evolutionary design of energy-efficient approximate circuits" in IET Computers & Digital Techniques, vol. 12, no. 4, pp. 139-149, 7 2018. doi: 10.1049/iet-cdt.2017.0188 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.00 %
// MAE = 0 
// WCE% = 0.00 %
// WCE = 0 
// WCRE% = 0.00 %
// EP% = 0.00 %
// MRE% = 0.00 %
// MSE = 0 
// PDK45_PWR = 0.033 mW
// PDK45_AREA = 70.4 um2
// PDK45_DELAY = 0.63 ns

module add8u_0FP(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  wire n_198, n_36, n_189, n_195, n_42, n_192, n_23, n_21, n_20, n_27;
  wire n_40, n_24, n_48, n_147, n_66, n_60, n_201, n_108, n_129, n_39;
  wire n_207, n_204, n_120, n_8, n_9, n_4, n_5, n_6, n_7, n_0;
  wire n_1, n_2, n_3, n_33, n_34, n_18, n_19, n_16, n_17, n_14;
  wire n_15, n_12, n_13, n_10, n_11, n_114, n_45, n_78, n_93, n_111;
  wire n_150, n_75, n_51, n_57, n_54, n_46, n_213, n_210, n_132;
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
  assign n_16 = n_2 | n_10;
  assign n_17 = n_9 | n_1;
  assign n_18 = n_0 & n_8;
  assign n_19 = n_13 | n_5;
  assign n_20 = n_2 & n_10;
  assign n_21 = n_1 ^ n_9;
  assign n_23 = n_18 & n_17;
  assign n_24 = n_1 & n_9;
  assign n_27 = n_10 ^ n_2;
  assign n_33 = n_3 ^ n_11;
  assign n_34 = n_14 | n_6;
  assign n_36 = n_3 & n_11;
  assign n_39 = n_4 ^ n_12;
  assign n_40 = n_11 | n_3;
  assign n_42 = n_4 & n_12;
  assign n_45 = n_5 ^ n_13;
  assign n_46 = n_0 ^ n_8;
  assign n_48 = n_5 & n_13;
  assign n_51 = n_6 ^ n_14;
  assign n_54 = n_6 & n_14;
  assign n_57 = n_7 ^ n_15;
  assign n_60 = n_7 & n_15;
  assign n_66 = n_23 | n_24;
  assign n_75 = n_66 & n_16;
  assign n_78 = n_20 | n_75;
  assign n_93 = n_78 & n_40;
  assign n_108 = n_93 | n_36;
  assign n_111 = n_108 & n_39;
  assign n_114 = ~(n_111 | n_42);
  assign n_120 = ~n_114;
  assign n_129 = n_120 & n_19;
  assign n_132 = n_129 | n_48;
  assign n_147 = n_132 & n_34;
  assign n_150 = n_147 | n_54;
  assign n_189 = n_21 ^ n_18;
  assign n_192 = n_27 ^ n_66;
  assign n_195 = n_33 ^ n_78;
  assign n_198 = n_39 ^ n_108;
  assign n_201 = n_45 ^ n_120;
  assign n_204 = n_51 ^ n_132;
  assign n_207 = n_57 ^ n_150;
  assign n_210 = n_57 & n_150;
  assign n_213 = n_60 | n_210;
  assign O[0] = n_46;
  assign O[1] = n_189;
  assign O[2] = n_192;
  assign O[3] = n_195;
  assign O[4] = n_198;
  assign O[5] = n_201;
  assign O[6] = n_204;
  assign O[7] = n_207;
  assign O[8] = n_213;
endmodule

