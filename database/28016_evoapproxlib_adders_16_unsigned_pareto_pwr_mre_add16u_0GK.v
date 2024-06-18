// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s):  
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 0.91 %
// MAE = 1187 
// WCE% = 2.90 %
// WCE = 3803 
// WCRE% = 1503.12 %
// EP% = 99.98 %
// MRE% = 2.49 %
// MSE = 20515.545e2 
// PDK45_PWR = 0.018 mW
// PDK45_AREA = 45.5 um2
// PDK45_DELAY = 0.35 ns


module add16u_0GK(A, B, O);
  input [15:0] A, B;
  output [16:0] O;
  wire sig_89, sig_90, sig_91, sig_93, sig_94, sig_95;
  wire sig_96, sig_98, sig_99, sig_100, sig_101, sig_103;
  wire sig_105;
  assign sig_89 = A[12] ^ B[12];
  assign sig_90 = A[12] & B[12];
  assign sig_91 = sig_89 & B[11];
  assign O[12] = sig_89 ^ B[11];
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
  assign O[6] = A[15] ^ B[15];
  assign sig_105 = A[15] & B[15];
  assign O[3] = O[6] & sig_103;
  assign O[15] = O[6] ^ sig_103;
  assign O[16] = sig_105 | O[3];
  assign O[0] = B[13];
  assign O[1] = A[6];
  assign O[2] = B[7];
  assign O[4] = B[12];
  assign O[5] = A[10];
  assign O[7] = B[9];
  assign O[8] = B[6];
  assign O[9] = O[3];
  assign O[10] = A[6];
  assign O[11] = A[11];
endmodule

