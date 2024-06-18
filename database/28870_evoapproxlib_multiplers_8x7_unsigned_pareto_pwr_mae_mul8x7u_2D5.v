// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 1.97 %
// MAE = 644 
// WCE% = 7.96 %
// WCE = 2609 
// WCRE% = 107.62 %
// EP% = 98.73 %
// MRE% = 25.98 %
// MSE = 638557 
// PDK45_PWR = 0.035 mW
// PDK45_AREA = 94.3 um2
// PDK45_DELAY = 0.55 ns

module mul8x7u_2D5 (
    A,
    B,
    O
);

input [7:0] A;
input [6:0] B;
output [14:0] O;

wire sig_95,sig_137,sig_138,sig_169,sig_172,sig_179,sig_180,sig_181,sig_207,sig_210,sig_212,sig_213,sig_214,sig_215,sig_216,sig_220,sig_221,sig_222,sig_223,sig_224;
wire sig_240,sig_245,sig_250,sig_251,sig_252,sig_253,sig_254,sig_255,sig_256,sig_257,sig_258,sig_259,sig_267,sig_268,sig_269,sig_270,sig_271,sig_272,sig_273,sig_291;
wire sig_292,sig_293,sig_294,sig_295,sig_296,sig_297,sig_298;

assign sig_95 = A[7] & B[3];
assign sig_137 = A[6] & B[4];
assign sig_138 = A[7] & B[4];
assign sig_169 = sig_95 ^ sig_137;
assign sig_172 = sig_169 ^ sig_95;
assign sig_179 = A[5] & B[5];
assign sig_180 = A[6] & B[5];
assign sig_181 = A[7] & B[5];
assign sig_207 = sig_172 ^ sig_179;
assign sig_210 = sig_207 ^ sig_137;
assign sig_212 = sig_138 ^ sig_180;
assign sig_213 = sig_138 & sig_180;
assign sig_214 = sig_212 & sig_95;
assign sig_215 = sig_212 ^ sig_95;
assign sig_216 = sig_213 | sig_214;
assign sig_220 = A[3] & B[6];
assign sig_221 = A[4] & B[6];
assign sig_222 = A[5] & B[6];
assign sig_223 = A[6] & B[6];
assign sig_224 = A[7] & B[6];
assign sig_240 = sig_223 | sig_220;
assign sig_245 = sig_220 ^ sig_221;
assign sig_250 = sig_215 ^ sig_222;
assign sig_251 = sig_215 & sig_222;
assign sig_252 = sig_250 & sig_137;
assign sig_253 = sig_250 ^ sig_137;
assign sig_254 = sig_251 | sig_252;
assign sig_255 = sig_181 ^ sig_223;
assign sig_256 = sig_181 & sig_223;
assign sig_257 = sig_255 & sig_216;
assign sig_258 = sig_255 ^ sig_216;
assign sig_259 = sig_256 | sig_257;
assign sig_267 = sig_245 ^ sig_220;
assign sig_268 = sig_253 & sig_210;
assign sig_269 = sig_253 ^ sig_210;
assign sig_270 = sig_258 & sig_254;
assign sig_271 = sig_258 ^ sig_254;
assign sig_272 = sig_224 & sig_259;
assign sig_273 = sig_224 ^ sig_259;
assign sig_291 = sig_271 ^ sig_268;
assign sig_292 = sig_271 & sig_268;
assign sig_293 = sig_273 ^ sig_270;
assign sig_294 = sig_273 & sig_270;
assign sig_295 = sig_293 & sig_292;
assign sig_296 = sig_293 ^ sig_292;
assign sig_297 = sig_294 | sig_295;
assign sig_298 = sig_272 | sig_297;

assign O[14] = sig_298;
assign O[13] = sig_296;
assign O[12] = sig_291;
assign O[11] = sig_269;
assign O[10] = sig_267;
assign O[9] = sig_220;
assign O[8] = sig_240;
assign O[7] = sig_181;
assign O[6] = sig_269;
assign O[5] = sig_256;
assign O[4] = 1'b0;
assign O[3] = sig_95;
assign O[2] = sig_269;
assign O[1] = sig_269;
assign O[0] = sig_256;

endmodule


