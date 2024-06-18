// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 6.74 %
// MAE = 34 
// WCE% = 19.14 %
// WCE = 98 
// WCRE% = 3400.00 %
// EP% = 99.22 %
// MRE% = 17.40 %
// MSE = 1688 
// PDK45_PWR = 0.0032 mW
// PDK45_AREA = 8.9 um2
// PDK45_DELAY = 0.12 ns


module add8u_8AS(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  wire sig_48, sig_49, sig_50;
  assign O[5] = 1'b1;
  assign O[1] = 1'b1;
  assign O[4] = 1'b0;
  assign sig_48 = A[7] ^ B[7];
  assign sig_49 = A[7] & B[7];
  assign sig_50 = sig_48 & B[6];
  assign O[7] = sig_48 ^ B[6];
  assign O[8] = sig_49 | sig_50;
  assign O[0] = B[0];
  assign O[2] = A[5];
  assign O[3] = A[4];
  assign O[6] = A[6];
endmodule

