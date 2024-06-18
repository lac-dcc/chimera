// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.98 %
// MAE = 80 
// WCE% = 3.78 %
// WCE = 310 
// WCRE% = 6300.00 %
// EP% = 99.57 %
// MRE% = 2.64 %
// MSE = 10471 
// PDK45_PWR = 0.016 mW
// PDK45_AREA = 46.9 um2
// PDK45_DELAY = 0.32 ns


module add12u_4X2(A, B, O);
  input [11:0] A, B;
  output [12:0] O;
  wire sig_62, sig_66, sig_67, sig_68, sig_70, sig_71;
  wire sig_72, sig_73, sig_77;
  assign O[6] = 1'b1;
  assign O[7] = A[7] | B[7];
  assign O[8] = A[8] ^ B[8];
  assign sig_62 = A[8] & B[8];
  assign O[1] = sig_62;
  assign sig_66 = A[9] ^ B[9];
  assign sig_67 = A[9] & B[9];
  assign sig_68 = sig_66 & O[1];
  assign O[9] = sig_66 ^ O[1];
  assign sig_70 = sig_67 | sig_68;
  assign sig_71 = A[10] ^ B[10];
  assign sig_72 = A[10] & B[10];
  assign sig_73 = sig_71 & sig_70;
  assign O[10] = sig_71 ^ sig_70;
  assign O[2] = sig_72 | sig_73;
  assign O[4] = A[11] ^ B[11];
  assign sig_77 = A[11] & B[11];
  assign O[3] = O[4] & O[2];
  assign O[11] = O[4] ^ O[2];
  assign O[12] = sig_77 | O[3];
  assign O[0] = A[8];
  assign O[5] = B[3];
endmodule

