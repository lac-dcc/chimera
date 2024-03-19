/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and ep parameters
***/
// MAE% = 1.54 %
// MAE = 7.9 
// WCE% = 8.59 %
// WCE = 44 
// WCRE% = 66.67 %
// EP% = 59.96 %
// MRE% = 3.76 %
// MSE = 190 
// PDK45_PWR = 0.018 mW
// PDK45_AREA = 65.2 um2
// PDK45_DELAY = 0.24 ns


module add8u_8FD(A, B, O);
  input [7:0] A, B;
  output [8:0] O;
  wire sig_17, sig_18, sig_24, sig_27, sig_28, sig_29;
  wire sig_32, sig_33, sig_34, sig_37, sig_38, sig_39;
  wire sig_42, sig_43, sig_44, sig_45, sig_47, sig_48;
  wire sig_49, sig_50;
  assign sig_17 = A[0] & B[0];
  assign sig_18 = A[1] | B[1];
  assign O[1] = sig_18 | sig_17;
  assign sig_24 = A[2] & B[2];
  assign sig_27 = sig_24;
  assign sig_28 = A[3] ^ B[3];
  assign sig_29 = A[3] & B[3];
  assign O[3] = sig_28 | sig_27;
  assign sig_32 = sig_29;
  assign sig_33 = A[4] ^ B[4];
  assign sig_34 = A[4] & B[4];
  assign O[0] = A[0] ^ B[0];
  assign O[4] = sig_33 | sig_32;
  assign sig_37 = sig_34;
  assign sig_38 = A[5] ^ B[5];
  assign sig_39 = A[5] & B[5];
  assign O[2] = B[2] ^ A[2];
  assign O[5] = sig_38 | sig_37;
  assign sig_42 = sig_39;
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
endmodule

