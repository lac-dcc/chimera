/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, S. S. Sarwar, L. Sekanina, Z. Vasicek and K. Roy, "Design of power-efficient approximate multipliers for approximate artificial neural networks," 2016 IEEE/ACM International Conference on Computer-Aided Design (ICCAD), Austin, TX, 2016, pp. 1-7. doi: 10.1145/2966986.2967021 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 3.63 %
// MAE = 595 
// WCE% = 14.44 %
// WCE = 2366 
// WCRE% = 300.00 %
// EP% = 98.41 %
// MRE% = 36.98 %
// MSE = 573266 
// PDK45_PWR = 0.019 mW
// PDK45_AREA = 76.0 um2
// PDK45_DELAY = 0.47 ns


module mul7u_00M(A, B, O);
  input [6:0] A, B;
  output [13:0] O;
  wire [6:0] A, B;
  wire [13:0] O;
  wire sig_55, sig_61, sig_62, sig_119, sig_120, sig_182;
  wire sig_184, sig_211, sig_212, sig_214, sig_215, sig_216;
  wire sig_219, sig_220, sig_221, sig_254, sig_255;
  assign sig_55 = A[6] & B[5];
  assign sig_61 = A[5] & B[6];
  assign sig_62 = A[6] & B[6];
  assign O[9] = B[6] & A[2];
  assign sig_119 = A[6] & B[4];
  assign sig_120 = A[6] ^ A[6];
  assign sig_182 = sig_120 & B[1];
  assign sig_184 = B[5] & sig_119;
  assign O[7] = sig_55 ^ sig_119;
  assign sig_211 = B[5] & A[5];
  assign sig_212 = B[6] & A[4];
  assign sig_214 = sig_211 | sig_212;
  assign sig_215 = O[7];
  assign sig_216 = B[4] & sig_182;
  assign O[8] = sig_215 & sig_61;
  assign O[1] = sig_215 ^ sig_61;
  assign sig_219 = sig_216 ^ O[8];
  assign sig_220 = sig_184 & B[6];
  assign sig_221 = sig_184 ^ sig_62;
  assign O[10] = A[3] & B[5];
  assign O[11] = O[1] ^ sig_214;
  assign O[0] = O[1] & sig_214;
  assign O[3] = O[0];
  assign sig_254 = sig_221 ^ sig_219;
  assign sig_255 = A[5] & sig_219;
  assign O[5] = sig_254 & O[3];
  assign O[12] = sig_254 ^ O[3];
  assign O[4] = sig_255 ^ O[5];
  assign O[13] = sig_220 ^ O[4];
  assign O[2] = O[0];
  assign O[6] = O[5];
endmodule

