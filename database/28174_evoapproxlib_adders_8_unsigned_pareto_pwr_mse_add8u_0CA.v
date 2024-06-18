// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s):  
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 6.45 %
// MAE = 33 
// WCE% = 16.60 %
// WCE = 85 
// WCRE% = 125.00 %
// EP% = 99.22 %
// MRE% = 16.82 %
// MSE = 1488 
// PDK45_PWR = 0.0032 mW
// PDK45_AREA = 8.9 um2
// PDK45_DELAY = 0.12 ns


module add8u_0CA(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  wire sig_48, sig_49, sig_50;
  assign O[0] = 1'b1;
  assign O[4] = A[5];
  assign sig_48 = A[7] ^ B[7];
  assign sig_49 = A[7] & B[7];
  assign sig_50 = sig_48 & B[6];
  assign O[7] = sig_48 ^ B[6];
  assign O[8] = sig_49 | sig_50;
  assign O[1] = A[4];
  assign O[2] = A[3];
  assign O[3] = A[2];
  assign O[5] = A[5];
  assign O[6] = A[6];
endmodule

