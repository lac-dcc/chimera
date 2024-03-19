/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 2.66 %
// MAE = 871 
// WCE% = 9.76 %
// WCE = 3197 
// WCRE% = 135.16 %
// EP% = 98.77 %
// MRE% = 30.68 %
// MSE = 11319.049e2 
// PDK45_PWR = 0.033 mW
// PDK45_AREA = 113.6 um2
// PDK45_DELAY = 0.48 ns

module mul8x7u_15S (
    A,
    B,
    O
);

input [7:0] A;
input [6:0] B;
output [14:0] O;

wire sig_21,sig_162,sig_191,sig_195,sig_196,sig_197,sig_198,sig_199,sig_205,sig_206,sig_207,sig_230,sig_233,sig_235,sig_236,sig_240,sig_241,sig_242,sig_243,sig_244;
wire sig_249,sig_250,sig_251,sig_252,sig_270,sig_271,sig_275,sig_276,sig_278,sig_279,sig_280,sig_281,sig_282,sig_283,sig_284,sig_285,sig_286,sig_287,sig_288,sig_289;

assign sig_21 = A[7] & B[3];
assign sig_162 = A[7] & B[4];
assign sig_191 = A[6] & B[4];
assign sig_195 = sig_21 ^ sig_162;
assign sig_196 = sig_21 & B[4];
assign sig_197 = A[7] & sig_191;
assign sig_198 = sig_195 ^ sig_191;
assign sig_199 = sig_196 | sig_197;
assign sig_205 = A[5] & B[5];
assign sig_206 = A[6] & B[5];
assign sig_207 = A[7] & B[5];
assign sig_230 = B[5] ^ sig_205;
assign sig_233 = sig_230 ^ B[5];
assign sig_235 = sig_198 ^ sig_206;
assign sig_236 = sig_198 & sig_206;
assign sig_240 = sig_199 ^ sig_207;
assign sig_241 = sig_199 & B[5];
assign sig_242 = A[7] & sig_236;
assign sig_243 = sig_240 ^ sig_236;
assign sig_244 = sig_241 | sig_242;
assign sig_249 = A[4] & B[6];
assign sig_250 = A[5] & B[6];
assign sig_251 = A[6] & B[6];
assign sig_252 = A[7] & B[6];
assign sig_270 = sig_233 | sig_249;
assign sig_271 = sig_233 & sig_249;
assign sig_275 = sig_235 ^ sig_250;
assign sig_276 = sig_235 & sig_250;
assign sig_278 = sig_275 | sig_271;
assign sig_279 = sig_276 | sig_271;
assign sig_280 = sig_243 ^ sig_251;
assign sig_281 = sig_243 & sig_251;
assign sig_282 = sig_280 & sig_279;
assign sig_283 = sig_280 ^ sig_279;
assign sig_284 = sig_281 | sig_282;
assign sig_285 = sig_244 ^ sig_252;
assign sig_286 = sig_244 & sig_252;
assign sig_287 = A[7] & sig_284;
assign sig_288 = sig_285 ^ sig_284;
assign sig_289 = sig_286 | sig_287;

assign O[14] = sig_289;
assign O[13] = sig_288;
assign O[12] = sig_283;
assign O[11] = sig_278;
assign O[10] = sig_270;
assign O[9] = 1'b0;
assign O[8] = sig_235;
assign O[7] = sig_289;
assign O[6] = sig_235;
assign O[5] = sig_235;
assign O[4] = 1'b0;
assign O[3] = sig_235;
assign O[2] = sig_252;
assign O[1] = sig_197;
assign O[0] = 1'b0;

endmodule


