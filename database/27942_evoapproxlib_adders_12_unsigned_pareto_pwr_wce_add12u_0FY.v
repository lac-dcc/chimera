// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s):  
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 0.46 %
// MAE = 37 
// WCE% = 1.34 %
// WCE = 110 
// WCRE% = 101.56 %
// EP% = 99.22 %
// MRE% = 1.26 %
// MSE = 2047 
// PDK45_PWR = 0.021 mW
// PDK45_AREA = 44.6 um2
// PDK45_DELAY = 0.43 ns


module add12u_0FY(A, B, O);
  input [11:0] A, B;
  output [12:0] O;
  wire sig_56, sig_57, sig_58, sig_60, sig_61, sig_62;
  wire sig_63, sig_65, sig_66, sig_67, sig_68, sig_70;
  wire sig_71, sig_72, sig_73, sig_75, sig_76, sig_77;
  wire sig_78;
  assign O[5] = A[5];
  assign O[1] = 1'b0;
  assign sig_56 = A[7] ^ B[7];
  assign sig_57 = A[7] & B[7];
  assign sig_58 = sig_56 & A[6];
  assign O[0] = sig_56 ^ A[6];
  assign sig_60 = sig_57 | sig_58;
  assign sig_61 = A[8] ^ B[8];
  assign sig_62 = A[8] & B[8];
  assign sig_63 = sig_61 & sig_60;
  assign O[8] = sig_61 ^ sig_60;
  assign sig_65 = sig_62 | sig_63;
  assign sig_66 = A[9] ^ B[9];
  assign sig_67 = A[9] & B[9];
  assign sig_68 = sig_66 & sig_65;
  assign O[3] = sig_66 ^ sig_65;
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
  assign O[2] = B[9];
  assign O[4] = B[6];
  assign O[6] = B[5];
  assign O[7] = O[0];
  assign O[9] = O[3];
endmodule

