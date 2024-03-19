/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s):  
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 0.54 %
// MAE = 712 
// WCE% = 1.80 %
// WCE = 2365 
// WCRE% = 700.00 %
// EP% = 99.96 %
// MRE% = 1.50 %
// MSE = 761357 
// PDK45_PWR = 0.022 mW
// PDK45_AREA = 46.9 um2
// PDK45_DELAY = 0.43 ns


module add16u_0M6(A, B, O);
  input [15:0] A, B;
  output [16:0] O;
  wire sig_80, sig_83, sig_84, sig_86, sig_88, sig_89;
  wire sig_90, sig_91, sig_93, sig_94, sig_95, sig_96;
  wire sig_98, sig_99, sig_100, sig_101, sig_103, sig_104;
  wire sig_105, sig_106;
  assign O[3] = A[11];
  assign O[4] = 1'b0;
  assign O[2] = 1'b0;
  assign O[6] = 1'b0;
  assign O[7] = 1'b0;
  assign sig_80 = A[10] & A[10];
  assign sig_83 = sig_80;
  assign sig_84 = A[11] ^ B[11];
  assign O[5] = A[11] & B[11];
  assign sig_86 = sig_84 & sig_83;
  assign O[11] = sig_84 ^ sig_83;
  assign sig_88 = O[5] | sig_86;
  assign sig_89 = A[12] ^ B[12];
  assign sig_90 = A[12] & B[12];
  assign sig_91 = sig_89 & sig_88;
  assign O[12] = sig_89 ^ sig_88;
  assign sig_93 = sig_90 | sig_91;
  assign sig_94 = A[13] ^ B[13];
  assign sig_95 = A[13] & B[13];
  assign sig_96 = sig_94 & sig_93;
  assign O[13] = sig_94 ^ sig_93;
  assign sig_98 = sig_95 | sig_96;
  assign sig_99 = A[14] ^ B[14];
  assign sig_100 = A[14] & B[14];
  assign sig_101 = sig_99 & sig_98;
  assign O[14] = sig_99 ^ sig_98;
  assign sig_103 = sig_100 | sig_101;
  assign sig_104 = A[15] ^ B[15];
  assign sig_105 = A[15] & B[15];
  assign sig_106 = sig_104 & sig_103;
  assign O[15] = sig_104 ^ sig_103;
  assign O[16] = sig_105 | sig_106;
  assign O[0] = B[14];
  assign O[1] = A[0];
  assign O[8] = B[7];
  assign O[9] = B[6];
  assign O[10] = A[9];
endmodule

