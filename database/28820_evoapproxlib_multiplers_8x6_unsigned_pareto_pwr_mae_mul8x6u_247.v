// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 2.42 %
// MAE = 397 
// WCE% = 9.94 %
// WCE = 1629 
// WCRE% = 101.56 %
// EP% = 97.92 %
// MRE% = 29.00 %
// MSE = 242086 
// PDK45_PWR = 0.032 mW
// PDK45_AREA = 116.4 um2
// PDK45_DELAY = 0.57 ns

module mul8x6u_247 (
    A,
    B,
    O
);

input [7:0] A;
input [5:0] B;
output [13:0] O;

wire sig_51,sig_93,sig_94,sig_125,sig_126,sig_135,sig_136,sig_137,sig_168,sig_169,sig_171,sig_172,sig_178,sig_179,sig_180,sig_202,sig_206,sig_207,sig_208,sig_209;
wire sig_210,sig_211,sig_212,sig_213,sig_214,sig_215,sig_224,sig_225,sig_226,sig_227,sig_228,sig_229,sig_239,sig_240,sig_241,sig_243,sig_261,sig_265,sig_269,sig_270;
wire sig_271,sig_272,sig_275,sig_276;

assign sig_51 = A[7] & B[2];
assign sig_93 = A[6] & B[3];
assign sig_94 = A[7] & B[3];
assign sig_125 = sig_51 | sig_93;
assign sig_126 = sig_51 & sig_93;
assign sig_135 = A[5] & B[4];
assign sig_136 = A[6] & B[4];
assign sig_137 = A[7] & B[4];
assign sig_168 = sig_94 ^ sig_136;
assign sig_169 = sig_94 & sig_136;
assign sig_171 = sig_168 | sig_126;
assign sig_172 = sig_169 | sig_126;
assign sig_178 = A[5] & B[5];
assign sig_179 = A[6] & B[5];
assign sig_180 = A[7] & B[5];
assign sig_202 = B[5] & A[4];
assign sig_206 = sig_171 ^ sig_178;
assign sig_207 = sig_171 & sig_178;
assign sig_208 = sig_206 & sig_135;
assign sig_209 = sig_206 ^ sig_135;
assign sig_210 = sig_207 | sig_208;
assign sig_211 = sig_137 ^ sig_179;
assign sig_212 = sig_137 & sig_179;
assign sig_213 = sig_211 & sig_172;
assign sig_214 = sig_211 ^ sig_172;
assign sig_215 = sig_212 | sig_213;
assign sig_224 = sig_209 & sig_202;
assign sig_225 = sig_209 ^ sig_202;
assign sig_226 = sig_214 & sig_210;
assign sig_227 = sig_214 ^ sig_210;
assign sig_228 = sig_180 & sig_215;
assign sig_229 = sig_180 ^ sig_215;
assign sig_239 = sig_227 ^ sig_224;
assign sig_240 = sig_180 & sig_226;
assign sig_241 = sig_229 ^ sig_226;
assign sig_243 = sig_224 & sig_227;
assign sig_261 = sig_228 | sig_240;
assign sig_265 = ~sig_229;
assign sig_269 = ~sig_243;
assign sig_270 = sig_241 & sig_269;
assign sig_271 = sig_265 & sig_243;
assign sig_272 = sig_270 | sig_271;
assign sig_275 = A[7] & sig_243;
assign sig_276 = sig_261 | sig_275;

assign O[13] = sig_276;
assign O[12] = sig_272;
assign O[11] = sig_239;
assign O[10] = sig_225;
assign O[9] = sig_125;
assign O[8] = sig_136;
assign O[7] = sig_136;
assign O[6] = 1'b0;
assign O[5] = sig_240;
assign O[4] = sig_94;
assign O[3] = sig_225;
assign O[2] = sig_125;
assign O[1] = sig_169;
assign O[0] = sig_275;

endmodule


