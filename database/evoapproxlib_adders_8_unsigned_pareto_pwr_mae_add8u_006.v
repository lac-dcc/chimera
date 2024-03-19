/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s):  
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 4.92 %
// MAE = 25 
// WCE% = 17.97 %
// WCE = 92 
// WCRE% = 6300.00 %
// EP% = 98.77 %
// MRE% = 14.58 %
// MSE = 960 
// PDK45_PWR = 0.0046 mW
// PDK45_AREA = 15.0 um2
// PDK45_DELAY = 0.17 ns


module add8u_006(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  wire sig_47, sig_48, sig_49, sig_50;
  assign O[5] = A[6] & B[6];
  assign O[3] = 1'b0;
  assign O[6] = !(A[6] | B[6]);
  assign O[4] = B[7];
  assign sig_47 = B[6] | A[6];
  assign sig_48 = A[7] ^ B[7];
  assign sig_49 = A[7] & B[7];
  assign sig_50 = sig_48 & sig_47;
  assign O[7] = sig_48 ^ sig_47;
  assign O[0] = sig_49 | sig_50;
  assign O[1] = A[3];
  assign O[2] = A[7];
  assign O[8] = O[0];
endmodule

