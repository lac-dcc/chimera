// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 0.76 %
// MAE = 124 
// WCE% = 3.06 %
// WCE = 501 
// WCRE% = 100.00 %
// EP% = 97.53 %
// MRE% = 12.27 %
// MSE = 24027 
// PDK45_PWR = 0.087 mW
// PDK45_AREA = 203.7 um2
// PDK45_DELAY = 0.88 ns

module mul8x6u_4RX (
    A,
    B,
    O
);

input [7:0] A;
input [5:0] B;
output [13:0] O;

wire sig_14,sig_16,sig_28,sig_61,sig_68,sig_70,sig_71,sig_101,sig_102,sig_104,sig_105,sig_106,sig_107,sig_108,sig_114,sig_115,sig_116,sig_139,sig_140,sig_141;
wire sig_142,sig_143,sig_144,sig_145,sig_146,sig_147,sig_148,sig_149,sig_150,sig_151,sig_152,sig_153,sig_157,sig_158,sig_159,sig_160,sig_161,sig_175,sig_179,sig_180;
wire sig_181,sig_182,sig_183,sig_184,sig_185,sig_186,sig_187,sig_188,sig_189,sig_190,sig_191,sig_192,sig_193,sig_194,sig_195,sig_196,sig_197,sig_198,sig_202,sig_203;
wire sig_204,sig_205,sig_206,sig_219,sig_220,sig_224,sig_225,sig_226,sig_227,sig_228,sig_229,sig_230,sig_231,sig_232,sig_233,sig_234,sig_235,sig_236,sig_237,sig_238;
wire sig_239,sig_240,sig_241,sig_242,sig_243;

assign sig_14 = B[5] & A[2];
assign sig_16 = A[4] & B[3];
assign sig_28 = A[7] & B[1];
assign sig_61 = sig_28 & A[7];
assign sig_68 = A[5] & B[2];
assign sig_70 = A[6] & B[2];
assign sig_71 = A[7] & B[2];
assign sig_101 = A[6] & sig_68;
assign sig_102 = sig_70 ^ sig_68;
assign sig_104 = sig_61 ^ sig_71;
assign sig_105 = B[1] & sig_71;
assign sig_106 = A[7] & sig_101;
assign sig_107 = sig_104 ^ sig_101;
assign sig_108 = sig_105 | sig_106;
assign sig_114 = A[5] & B[3];
assign sig_115 = A[6] & B[3];
assign sig_116 = A[7] & B[3];
assign sig_139 = sig_102 ^ sig_114;
assign sig_140 = sig_102 & sig_114;
assign sig_141 = sig_139 & sig_14;
assign sig_142 = sig_139 ^ sig_14;
assign sig_143 = sig_140 | sig_141;
assign sig_144 = sig_107 ^ sig_115;
assign sig_145 = sig_107 & sig_115;
assign sig_146 = sig_144 & sig_143;
assign sig_147 = sig_144 ^ sig_143;
assign sig_148 = sig_145 | sig_146;
assign sig_149 = sig_108 ^ sig_116;
assign sig_150 = sig_108 & B[3];
assign sig_151 = sig_116 & sig_148;
assign sig_152 = sig_149 ^ sig_148;
assign sig_153 = sig_150 | sig_151;
assign sig_157 = A[3] & B[4];
assign sig_158 = A[4] & B[4];
assign sig_159 = A[5] & B[4];
assign sig_160 = A[6] & B[4];
assign sig_161 = A[7] & B[4];
assign sig_175 = sig_160 | sig_157;
assign sig_179 = sig_142 ^ sig_158;
assign sig_180 = sig_142 & sig_158;
assign sig_181 = sig_179 & sig_175;
assign sig_182 = sig_179 ^ sig_175;
assign sig_183 = sig_180 | sig_181;
assign sig_184 = sig_147 ^ sig_159;
assign sig_185 = sig_147 & sig_159;
assign sig_186 = sig_184 & sig_183;
assign sig_187 = sig_184 ^ sig_183;
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
assign sig_219 = sig_182 ^ sig_202;
assign sig_220 = sig_182 & sig_202;
assign sig_224 = sig_187 ^ sig_203;
assign sig_225 = sig_187 & sig_203;
assign sig_226 = sig_224 & sig_220;
assign sig_227 = sig_224 ^ sig_220;
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
assign sig_240 = sig_198 & sig_206;
assign sig_241 = A[7] & sig_238;
assign sig_242 = sig_239 ^ sig_238;
assign sig_243 = sig_240 | sig_241;

assign O[13] = sig_243;
assign O[12] = sig_242;
assign O[11] = sig_237;
assign O[10] = sig_232;
assign O[9] = sig_227;
assign O[8] = sig_219;
assign O[7] = sig_16;
assign O[6] = sig_16;
assign O[5] = sig_153;
assign O[4] = 1'b0;
assign O[3] = sig_116;
assign O[2] = sig_220;
assign O[1] = 1'b0;
assign O[0] = sig_16;

endmodule


