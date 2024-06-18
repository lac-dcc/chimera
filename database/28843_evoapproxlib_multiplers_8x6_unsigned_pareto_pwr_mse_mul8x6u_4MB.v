// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 1.14 %
// MAE = 186 
// WCE% = 4.81 %
// WCE = 788 
// WCRE% = 100.00 %
// EP% = 97.80 %
// MRE% = 17.53 %
// MSE = 53634 
// PDK45_PWR = 0.065 mW
// PDK45_AREA = 179.3 um2
// PDK45_DELAY = 0.82 ns

module mul8x6u_4MB (
    A,
    B,
    O
);

input [7:0] A;
input [5:0] B;
output [13:0] O;

wire sig_58,sig_62,sig_71,sig_100,sig_104,sig_105,sig_106,sig_107,sig_108,sig_115,sig_116,sig_144,sig_145,sig_149,sig_150,sig_151,sig_152,sig_153,sig_158,sig_159;
wire sig_160,sig_161,sig_184,sig_185,sig_186,sig_187,sig_188,sig_189,sig_190,sig_191,sig_192,sig_193,sig_194,sig_195,sig_196,sig_197,sig_198,sig_202,sig_203,sig_204;
wire sig_205,sig_206,sig_224,sig_225,sig_226,sig_227,sig_228,sig_229,sig_230,sig_231,sig_232,sig_233,sig_234,sig_235,sig_236,sig_237,sig_238,sig_239,sig_240,sig_241;
wire sig_242,sig_243;

assign sig_58 = B[2] & A[6];
assign sig_62 = B[1] & A[7];
assign sig_71 = A[7] & B[2];
assign sig_100 = B[3] & A[5];
assign sig_104 = sig_62 ^ sig_71;
assign sig_105 = sig_62 & B[2];
assign sig_106 = A[7] & sig_58;
assign sig_107 = sig_104 ^ sig_58;
assign sig_108 = sig_105 | sig_106;
assign sig_115 = A[6] & B[3];
assign sig_116 = A[7] & B[3];
assign sig_144 = sig_107 ^ sig_115;
assign sig_145 = sig_107 & sig_115;
assign sig_149 = sig_108 ^ sig_116;
assign sig_150 = sig_108 & sig_116;
assign sig_151 = sig_116 & sig_145;
assign sig_152 = sig_149 ^ sig_145;
assign sig_153 = sig_150 | sig_151;
assign sig_158 = A[4] & B[4];
assign sig_159 = A[5] & B[4];
assign sig_160 = A[6] & B[4];
assign sig_161 = A[7] & B[4];
assign sig_184 = sig_144 ^ sig_159;
assign sig_185 = sig_144 & sig_159;
assign sig_186 = sig_184 & sig_158;
assign sig_187 = sig_184 ^ sig_158;
assign sig_188 = sig_185 | sig_186;
assign sig_189 = sig_152 ^ sig_160;
assign sig_190 = sig_152 & sig_160;
assign sig_191 = sig_189 & sig_188;
assign sig_192 = sig_189 ^ sig_188;
assign sig_193 = sig_190 | sig_191;
assign sig_194 = sig_153 ^ sig_161;
assign sig_195 = sig_153 & B[4];
assign sig_196 = sig_161 & sig_193;
assign sig_197 = sig_194 ^ sig_193;
assign sig_198 = sig_195 | sig_196;
assign sig_202 = A[3] & B[5];
assign sig_203 = A[4] & B[5];
assign sig_204 = A[5] & B[5];
assign sig_205 = A[6] & B[5];
assign sig_206 = A[7] & B[5];
assign sig_224 = sig_187 ^ sig_203;
assign sig_225 = sig_187 & sig_203;
assign sig_226 = sig_224 & sig_202;
assign sig_227 = sig_224 ^ sig_202;
assign sig_228 = sig_225 | sig_226;
assign sig_229 = sig_192 ^ sig_204;
assign sig_230 = sig_192 & sig_204;
assign sig_231 = sig_229 & sig_228;
assign sig_232 = sig_229 ^ sig_228;
assign sig_233 = sig_230 | sig_231;
assign sig_234 = sig_197 ^ sig_205;
assign sig_235 = sig_197 & sig_205;
assign sig_236 = sig_234 & sig_233;
assign sig_237 = sig_234 ^ sig_233;
assign sig_238 = sig_235 | sig_236;
assign sig_239 = sig_198 ^ sig_206;
assign sig_240 = sig_198 & B[5];
assign sig_241 = sig_239 & sig_238;
assign sig_242 = sig_239 ^ sig_238;
assign sig_243 = sig_240 | sig_241;

assign O[13] = sig_243;
assign O[12] = sig_242;
assign O[11] = sig_237;
assign O[10] = sig_232;
assign O[9] = sig_227;
assign O[8] = sig_100;
assign O[7] = 1'b0;
assign O[6] = sig_108;
assign O[5] = sig_242;
assign O[4] = sig_240;
assign O[3] = 1'b0;
assign O[2] = sig_100;
assign O[1] = sig_106;
assign O[0] = sig_203;

endmodule


