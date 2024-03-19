/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 3.56 %
// MAE = 584 
// WCE% = 13.99 %
// WCE = 2292 
// WCRE% = 101.56 %
// EP% = 97.90 %
// MRE% = 36.16 %
// MSE = 532474 
// PDK45_PWR = 0.016 mW
// PDK45_AREA = 64.8 um2
// PDK45_DELAY = 0.39 ns

module mul8x6u_23K (
    A,
    B,
    O
);

input [7:0] A;
input [5:0] B;
output [13:0] O;

wire sig_105,sig_114,sig_134,sig_160,sig_165,sig_194,sig_195,sig_204,sig_205,sig_206,sig_225,sig_227,sig_229,sig_230,sig_231,sig_232,sig_233,sig_234,sig_235,sig_236;
wire sig_237,sig_238,sig_239,sig_240,sig_241,sig_242,sig_243;

assign sig_105 = B[4] & A[7];
assign sig_114 = A[7] & B[3];
assign sig_134 = ~sig_105;
assign sig_160 = A[6] & B[4];
assign sig_165 = ~sig_134;
assign sig_194 = sig_114 ^ sig_165;
assign sig_195 = sig_114 & B[4];
assign sig_204 = A[5] & B[5];
assign sig_205 = A[6] & B[5];
assign sig_206 = A[7] & B[5];
assign sig_225 = B[5] & A[4];
assign sig_227 = B[4] & A[5];
assign sig_229 = sig_160 | sig_204;
assign sig_230 = sig_160 & sig_204;
assign sig_231 = sig_229 & sig_225;
assign sig_232 = sig_229 | sig_225;
assign sig_233 = sig_230 | sig_231;
assign sig_234 = sig_194 ^ sig_205;
assign sig_235 = sig_194 & sig_205;
assign sig_236 = sig_234 & sig_233;
assign sig_237 = sig_234 ^ sig_233;
assign sig_238 = sig_235 | sig_236;
assign sig_239 = sig_195 ^ sig_206;
assign sig_240 = sig_195 & B[5];
assign sig_241 = sig_206 & sig_238;
assign sig_242 = sig_239 ^ sig_238;
assign sig_243 = sig_240 | sig_241;

assign O[13] = sig_243;
assign O[12] = sig_242;
assign O[11] = sig_237;
assign O[10] = sig_232;
assign O[9] = sig_227;
assign O[8] = sig_227;
assign O[7] = sig_160;
assign O[6] = sig_227;
assign O[5] = sig_195;
assign O[4] = sig_114;
assign O[3] = 1'b0;
assign O[2] = sig_243;
assign O[1] = 1'b0;
assign O[0] = 1'b0;

endmodule


