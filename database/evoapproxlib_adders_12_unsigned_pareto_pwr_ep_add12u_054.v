// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s):  
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and ep parameters
***/
// MAE% = 6.35 %
// MAE = 520 
// WCE% = 14.55 %
// WCE = 1192 
// WCRE% = 4000.00 %
// EP% = 89.56 %
// MRE% = 16.19 %
// MSE = 524173 
// PDK45_PWR = 0.033 mW
// PDK45_AREA = 92.5 um2
// PDK45_DELAY = 0.45 ns


module add12u_054(A, B, O);
  input [11:0] A, B;
  output [12:0] O;
  wire sig_25, sig_26, sig_35, sig_36, sig_50, sig_51;
  wire sig_53, sig_55, sig_56, sig_57, sig_58, sig_60;
  wire sig_61, sig_62, sig_63, sig_65, sig_66, sig_72;
  wire sig_75, sig_76, sig_77, sig_78;
  assign sig_25 = A[0] & B[0];
  assign sig_26 = A[1] ^ B[1];
  assign O[4] = B[4] & A[4];
  assign O[1] = sig_26 ^ sig_25;
  assign O[2] = 1'b0;
  assign sig_35 = B[2] | A[2];
  assign sig_36 = !(A[3] & B[3]);
  assign O[3] = sig_36 ^ sig_35;
  assign O[5] = !(B[5] ^ A[5]);
  assign sig_50 = B[5] | A[5];
  assign sig_51 = A[6] ^ B[6];
  assign sig_53 = B[6] & sig_50;
  assign O[6] = sig_51 ^ sig_50;
  assign sig_55 = A[6] | sig_53;
  assign sig_56 = A[7] ^ B[7];
  assign sig_57 = A[7] & B[7];
  assign sig_58 = sig_56 & sig_55;
  assign O[7] = sig_56 ^ sig_55;
  assign sig_60 = sig_57 | sig_58;
  assign sig_61 = A[8] ^ B[8];
  assign sig_62 = A[8] & B[8];
  assign sig_63 = sig_61 & sig_60;
  assign O[8] = sig_61 ^ sig_60;
  assign sig_65 = sig_62 | sig_63;
  assign sig_66 = A[9] ^ B[9];
  assign O[0] = A[0] ^ B[0];
  assign O[9] = sig_66 ^ sig_65;
  assign O[10] = 1'b0;
  assign sig_72 = A[10] | B[10];
  assign sig_75 = sig_72;
  assign sig_76 = A[11] ^ B[11];
  assign sig_77 = A[11] & B[11];
  assign sig_78 = sig_76 & sig_75;
  assign O[11] = sig_76 ^ sig_75;
  assign O[12] = sig_77 | sig_78;
endmodule

