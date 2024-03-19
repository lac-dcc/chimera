/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 2.98 %
// MAE = 488 
// WCE% = 11.68 %
// WCE = 1913 
// WCRE% = 301.56 %
// EP% = 97.93 %
// MRE% = 34.19 %
// MSE = 376281 
// PDK45_PWR = 0.025 mW
// PDK45_AREA = 78.4 um2
// PDK45_DELAY = 0.45 ns

module mul8x6u_0SQ (
    A,
    B,
    O
);

input [7:0] A;
input [5:0] B;
output [13:0] O;

wire sig_44,sig_45,sig_52,sig_53,sig_59,sig_60,sig_61,sig_120,sig_122,sig_123,sig_124,sig_125,sig_126,sig_127,sig_128,sig_129,sig_149,sig_196,sig_199,sig_201;
wire sig_202,sig_204,sig_217,sig_219,sig_220,sig_221,sig_222,sig_233,sig_237,sig_238,sig_297,sig_305;

assign sig_44 = A[6] & B[3];
assign sig_45 = A[7] & B[3];
assign sig_52 = A[6] & B[4];
assign sig_53 = A[7] & B[4];
assign sig_59 = A[5] & B[5];
assign sig_60 = A[6] & B[5];
assign sig_61 = A[7] & B[5];
assign sig_120 = B[5] & A[4];
assign sig_122 = sig_44 | sig_120;
assign sig_123 = sig_45 ^ sig_52;
assign sig_124 = sig_45 & sig_52;
assign sig_125 = sig_123 & sig_59;
assign sig_126 = sig_123 ^ sig_59;
assign sig_127 = sig_124 | sig_125;
assign sig_128 = sig_53 & sig_60;
assign sig_129 = sig_53 ^ sig_60;
assign sig_149 = B[4] & A[5];
assign sig_196 = sig_126 | sig_122;
assign sig_199 = sig_196 ^ sig_122;
assign sig_201 = sig_129 & sig_127;
assign sig_202 = sig_129 ^ sig_127;
assign sig_204 = sig_61 ^ sig_128;
assign sig_217 = sig_199 | sig_149;
assign sig_219 = sig_202 ^ sig_122;
assign sig_220 = sig_202 & sig_122;
assign sig_221 = sig_204 ^ sig_201;
assign sig_222 = sig_204 & sig_201;
assign sig_233 = sig_128 | sig_222;
assign sig_237 = A[7] & sig_220;
assign sig_238 = sig_221 ^ sig_220;
assign sig_297 = sig_237 | sig_233;
assign sig_305 = A[7] & B[2];

assign O[13] = sig_297;
assign O[12] = sig_238;
assign O[11] = sig_219;
assign O[10] = sig_217;
assign O[9] = sig_305;
assign O[8] = sig_126;
assign O[7] = sig_126;
assign O[6] = sig_128;
assign O[5] = sig_217;
assign O[4] = sig_128;
assign O[3] = sig_219;
assign O[2] = 1'b0;
assign O[1] = sig_128;
assign O[0] = sig_204;

endmodule


