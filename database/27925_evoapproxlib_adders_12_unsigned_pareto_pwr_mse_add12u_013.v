// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s):  
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 0.21 %
// MAE = 17 
// WCE% = 0.82 %
// WCE = 67 
// WCRE% = 6300.00 %
// EP% = 97.84 %
// MRE% = 0.58 %
// MSE = 474 
// PDK45_PWR = 0.024 mW
// PDK45_AREA = 54.9 um2
// PDK45_DELAY = 0.47 ns


module add12u_013(A, B, O);
  input [11:0] A, B;
  output [12:0] O;
  wire sig_55, sig_56, sig_57, sig_58, sig_60, sig_61;
  wire sig_62, sig_63, sig_65, sig_66, sig_67, sig_68;
  wire sig_70, sig_71, sig_72, sig_73, sig_75, sig_76;
  wire sig_77, sig_78;
  assign O[4] = 1'b0;
  assign O[5] = A[5] & B[5];
  assign O[6] = !(B[6] ^ A[6]);
  assign O[3] = 1'b0;
  assign O[2] = 1'b0;
  assign sig_55 = A[6] | B[6];
  assign sig_56 = A[7] ^ B[7];
  assign sig_57 = A[7] & B[7];
  assign sig_58 = sig_56 & sig_55;
  assign O[7] = sig_56 ^ sig_55;
  assign sig_60 = sig_57 | sig_58;
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
  assign O[0] = A[7];
  assign O[1] = B[7];
endmodule

