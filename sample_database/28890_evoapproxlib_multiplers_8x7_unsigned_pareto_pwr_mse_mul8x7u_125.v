// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 0.86 %
// MAE = 283 
// WCE% = 3.75 %
// WCE = 1230 
// WCRE% = 109.38 %
// EP% = 98.45 %
// MRE% = 14.27 %
// MSE = 124595 
// PDK45_PWR = 0.075 mW
// PDK45_AREA = 191.5 um2
// PDK45_DELAY = 0.78 ns

module mul8x7u_125 (
    A,
    B,
    O
);

input [7:0] A;
input [6:0] B;
output [14:0] O;

wire sig_59,sig_72,sig_117,sig_146,sig_150,sig_151,sig_152,sig_153,sig_154,sig_160,sig_161,sig_162,sig_181,sig_188,sig_190,sig_191,sig_192,sig_193,sig_194,sig_195;
wire sig_196,sig_197,sig_198,sig_199,sig_204,sig_205,sig_206,sig_207,sig_209,sig_221,sig_225,sig_226,sig_227,sig_228,sig_229,sig_230,sig_231,sig_232,sig_233,sig_234;
wire sig_235,sig_237,sig_238,sig_239,sig_240,sig_241,sig_242,sig_243,sig_244,sig_247,sig_248,sig_249,sig_250,sig_251,sig_252,sig_265,sig_266,sig_267,sig_268,sig_269;
wire sig_270,sig_271,sig_272,sig_273,sig_274,sig_275,sig_276,sig_277,sig_278,sig_279,sig_280,sig_281,sig_282,sig_283,sig_284,sig_285,sig_286,sig_287,sig_288,sig_289;

assign sig_59 = B[4] & A[5];
assign sig_72 = A[7] & B[2];
assign sig_117 = A[7] & B[3];
assign sig_146 = B[3] & A[6];
assign sig_150 = sig_72 ^ sig_117;
assign sig_151 = sig_72 & B[3];
assign sig_152 = A[7] & sig_146;
assign sig_153 = sig_150 ^ sig_146;
assign sig_154 = sig_151 | sig_152;
assign sig_160 = A[5] & B[4];
assign sig_161 = A[6] & B[4];
assign sig_162 = A[7] & B[4];
assign sig_181 = B[1] & A[6];
assign sig_188 = sig_160 ^ sig_59;
assign sig_190 = sig_153 ^ sig_161;
assign sig_191 = sig_153 & sig_161;
assign sig_192 = sig_190 & sig_160;
assign sig_193 = sig_190 ^ sig_160;
assign sig_194 = sig_191 | sig_192;
assign sig_195 = sig_154 ^ sig_162;
assign sig_196 = sig_154 & B[4];
assign sig_197 = sig_162 & sig_194;
assign sig_198 = sig_195 ^ sig_194;
assign sig_199 = sig_196 | sig_197;
assign sig_204 = A[4] & B[5];
assign sig_205 = A[5] & B[5];
assign sig_206 = A[6] & B[5];
assign sig_207 = A[7] & B[5];
assign sig_209 = sig_206 & sig_198;
assign sig_221 = B[5] & A[3];
assign sig_225 = sig_188 | sig_204;
assign sig_226 = sig_188 & sig_204;
assign sig_227 = sig_204 & sig_221;
assign sig_228 = sig_225 ^ sig_221;
assign sig_229 = sig_226 | sig_227;
assign sig_230 = sig_193 ^ sig_205;
assign sig_231 = sig_193 & sig_205;
assign sig_232 = sig_230 & sig_229;
assign sig_233 = sig_230 ^ sig_229;
assign sig_234 = sig_231 | sig_232;
assign sig_235 = sig_198 ^ sig_206;
assign sig_237 = sig_235 & sig_234;
assign sig_238 = sig_235 ^ sig_234;
assign sig_239 = sig_209 | sig_237;
assign sig_240 = sig_199 ^ sig_207;
assign sig_241 = sig_199 & B[5];
assign sig_242 = A[7] & sig_239;
assign sig_243 = sig_240 ^ sig_239;
assign sig_244 = sig_241 | sig_242;
assign sig_247 = A[2] & B[6];
assign sig_248 = A[3] & B[6];
assign sig_249 = A[4] & B[6];
assign sig_250 = A[5] & B[6];
assign sig_251 = A[6] & B[6];
assign sig_252 = A[7] & B[6];
assign sig_265 = sig_228 ^ sig_248;
assign sig_266 = sig_228 & sig_248;
assign sig_267 = sig_265 & sig_247;
assign sig_268 = sig_265 ^ sig_247;
assign sig_269 = sig_266 | sig_267;
assign sig_270 = sig_233 ^ sig_249;
assign sig_271 = sig_233 & sig_249;
assign sig_272 = sig_270 & sig_269;
assign sig_273 = sig_270 ^ sig_269;
assign sig_274 = sig_271 | sig_272;
assign sig_275 = sig_238 ^ sig_250;
assign sig_276 = sig_238 & sig_250;
assign sig_277 = sig_275 & sig_274;
assign sig_278 = sig_275 ^ sig_274;
assign sig_279 = sig_276 | sig_277;
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
assign O[10] = sig_273;
assign O[9] = sig_268;
assign O[8] = sig_181;
assign O[7] = sig_248;
assign O[6] = sig_225;
assign O[5] = sig_289;
assign O[4] = sig_228;
assign O[3] = sig_221;
assign O[2] = sig_247;
assign O[1] = sig_59;
assign O[0] = 1'b0;

endmodule


