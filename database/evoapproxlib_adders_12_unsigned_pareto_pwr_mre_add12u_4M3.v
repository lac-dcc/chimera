/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 4.81 %
// MAE = 394 
// WCE% = 14.84 %
// WCE = 1216 
// WCRE% = 3300.00 %
// EP% = 99.93 %
// MRE% = 13.00 %
// MSE = 231551 
// PDK45_PWR = 0.0075 mW
// PDK45_AREA = 17.8 um2
// PDK45_DELAY = 0.19 ns


module add12u_4M3(A, B, O);
  input [11:0] A, B;
  output [12:0] O;
  wire sig_70, sig_71, sig_72, sig_73, sig_75, sig_76;
  wire sig_77, sig_78;
  assign O[5] = A[4];
  assign O[1] = 1'b0;
  assign sig_70 = B[9];
  assign sig_71 = A[10] ^ B[10];
  assign sig_72 = A[10] & B[10];
  assign sig_73 = sig_71 & sig_70;
  assign O[10] = sig_71 ^ B[9];
  assign sig_75 = sig_72 | sig_73;
  assign sig_76 = A[11] ^ B[11];
  assign sig_77 = A[11] & B[11];
  assign sig_78 = sig_76 & sig_75;
  assign O[11] = sig_76 ^ sig_75;
  assign O[12] = sig_77 | sig_78;
  assign O[0] = B[5];
  assign O[2] = A[6];
  assign O[3] = B[7];
  assign O[4] = B[1];
  assign O[6] = B[5];
  assign O[7] = B[10];
  assign O[8] = B[8];
  assign O[9] = A[4];
endmodule

