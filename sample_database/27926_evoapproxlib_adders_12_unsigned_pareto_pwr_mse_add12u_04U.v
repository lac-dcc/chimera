// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s):  
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 3.20 %
// MAE = 262 
// WCE% = 7.71 %
// WCE = 632 
// WCRE% = 3100.00 %
// EP% = 99.91 %
// MRE% = 8.54 %
// MSE = 92047 
// PDK45_PWR = 0.0075 mW
// PDK45_AREA = 17.8 um2
// PDK45_DELAY = 0.19 ns


module add12u_04U(A, B, O);
  input [11:0] A, B;
  output [12:0] O;
  wire sig_71, sig_72, sig_73, sig_75, sig_76, sig_77;
  wire sig_78;
  assign O[5] = 1'b1;
  assign O[1] = 1'b0;
  assign sig_71 = A[10] ^ B[10];
  assign sig_72 = A[10] & B[10];
  assign sig_73 = sig_71 & B[9];
  assign O[10] = sig_71 ^ B[9];
  assign sig_75 = sig_72 | sig_73;
  assign sig_76 = A[11] ^ B[11];
  assign sig_77 = A[11] & B[11];
  assign sig_78 = sig_76 & sig_75;
  assign O[4] = sig_76 ^ sig_75;
  assign O[12] = sig_77 | sig_78;
  assign O[0] = B[6];
  assign O[2] = A[5];
  assign O[3] = B[9];
  assign O[6] = A[7];
  assign O[7] = A[7];
  assign O[8] = B[8];
  assign O[9] = A[9];
  assign O[11] = O[4];
endmodule

