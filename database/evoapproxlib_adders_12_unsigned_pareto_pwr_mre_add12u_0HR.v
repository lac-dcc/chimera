// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s):  
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 0.50 %
// MAE = 41 
// WCE% = 1.67 %
// WCE = 137 
// WCRE% = 9600.00 %
// EP% = 99.28 %
// MRE% = 1.39 %
// MSE = 2518 
// PDK45_PWR = 0.019 mW
// PDK45_AREA = 43.6 um2
// PDK45_DELAY = 0.39 ns


module add12u_0HR(A, B, O);
  input [11:0] A, B;
  output [12:0] O;
  wire sig_57, sig_60, sig_61, sig_62, sig_63, sig_65;
  wire sig_66, sig_67, sig_68, sig_70, sig_71, sig_72;
  wire sig_73, sig_75, sig_76, sig_77, sig_78;
  assign O[5] = 1'b1;
  assign O[0] = 1'b1;
  assign O[7] = B[7] ^ A[7];
  assign sig_57 = A[7] & B[7];
  assign sig_60 = sig_57;
  assign sig_61 = A[8] ^ B[8];
  assign sig_62 = A[8] & B[8];
  assign sig_63 = sig_61 & sig_60;
  assign O[8] = sig_61 ^ sig_60;
  assign sig_65 = sig_62 | sig_63;
  assign sig_66 = A[9] ^ B[9];
  assign sig_67 = A[9] & B[9];
  assign sig_68 = sig_66 & sig_65;
  assign O[9] = sig_66 ^ sig_65;
  assign sig_70 = sig_67 | sig_68;
  assign sig_71 = A[10] ^ B[10];
  assign sig_72 = A[10] & B[10];
  assign sig_73 = sig_71 & sig_70;
  assign O[10] = sig_71 ^ sig_70;
  assign sig_75 = sig_72 | sig_73;
  assign sig_76 = A[11] ^ B[11];
  assign sig_77 = A[11] & B[11];
  assign sig_78 = sig_76 & sig_75;
  assign O[11] = sig_76 ^ sig_75;
  assign O[12] = sig_77 | sig_78;
  assign O[1] = A[1];
  assign O[2] = A[10];
  assign O[3] = B[1];
  assign O[4] = B[6];
  assign O[6] = O[5];
endmodule

