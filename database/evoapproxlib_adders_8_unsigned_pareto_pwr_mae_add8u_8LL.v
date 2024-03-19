/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 1.97 %
// MAE = 10 
// WCE% = 6.25 %
// WCE = 32 
// WCRE% = 3100.00 %
// EP% = 96.97 %
// MRE% = 6.16 %
// MSE = 154 
// PDK45_PWR = 0.0095 mW
// PDK45_AREA = 25.8 um2
// PDK45_DELAY = 0.24 ns


module add8u_8LL(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  wire sig_42, sig_43, sig_44, sig_45, sig_47, sig_48;
  wire sig_49, sig_50;
  assign O[2] = 1'b0;
  assign O[5] = !(A[5] ^ B[5]);
  assign sig_42 = B[5] | A[5];
  assign sig_43 = A[6] ^ B[6];
  assign sig_44 = A[6] & B[6];
  assign sig_45 = sig_43 & sig_42;
  assign O[6] = sig_43 ^ sig_42;
  assign sig_47 = sig_44 | sig_45;
  assign sig_48 = A[7] ^ B[7];
  assign sig_49 = A[7] & B[7];
  assign sig_50 = sig_48 & sig_47;
  assign O[7] = sig_48 ^ sig_47;
  assign O[8] = sig_49 | sig_50;
  assign O[0] = B[3];
  assign O[1] = A[4];
  assign O[3] = A[4];
  assign O[4] = O[2];
endmodule

