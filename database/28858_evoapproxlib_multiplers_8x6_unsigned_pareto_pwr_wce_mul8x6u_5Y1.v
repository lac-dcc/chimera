// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 0.31 %
// MAE = 50 
// WCE% = 1.21 %
// WCE = 198 
// WCRE% = 150.00 %
// EP% = 95.89 %
// MRE% = 6.26 %
// MSE = 3923 
// PDK45_PWR = 0.139 mW
// PDK45_AREA = 298.0 um2
// PDK45_DELAY = 1.17 ns

module mul8x6u_5Y1 (
    A,
    B,
    O
);

input [7:0] A;
input [5:0] B;
output [13:0] O;

wire sig_14,sig_20,sig_21,sig_28,sig_52,sig_53,sig_57,sig_58,sig_60,sig_63,sig_69,sig_70,sig_71,sig_90,sig_94,sig_95,sig_96,sig_97,sig_98,sig_99;
wire sig_100,sig_101,sig_102,sig_103,sig_104,sig_105,sig_106,sig_107,sig_108,sig_112,sig_113,sig_115,sig_116,sig_118,sig_126,sig_134,sig_135,sig_136,sig_137,sig_138;
wire sig_139,sig_141,sig_142,sig_143,sig_144,sig_145,sig_146,sig_147,sig_148,sig_149,sig_150,sig_151,sig_152,sig_153,sig_155,sig_156,sig_157,sig_158,sig_159,sig_160;
wire sig_161,sig_174,sig_175,sig_179,sig_180,sig_181,sig_182,sig_183,sig_184,sig_185,sig_186,sig_187,sig_188,sig_189,sig_190,sig_191,sig_192,sig_193,sig_194,sig_195;
wire sig_196,sig_197,sig_198,sig_201,sig_202,sig_203,sig_204,sig_205,sig_206,sig_211,sig_213,sig_214,sig_215,sig_216,sig_217,sig_218,sig_219,sig_220,sig_221,sig_222;
wire sig_223,sig_224,sig_225,sig_226,sig_227,sig_228,sig_229,sig_230,sig_231,sig_232,sig_233,sig_234,sig_235,sig_236,sig_237,sig_238,sig_239,sig_241,sig_242,sig_243;

assign sig_14 = A[7] & B[1];
assign sig_20 = A[6] & B[0];
assign sig_21 = A[7] & B[0];
assign sig_28 = A[6] & B[1];
assign sig_52 = B[0] & A[5];
assign sig_53 = sig_20 & B[1];
assign sig_57 = sig_21 ^ sig_28;
assign sig_58 = sig_21 & sig_28;
assign sig_60 = sig_57 ^ sig_53;
assign sig_63 = sig_53 ^ sig_14;
assign sig_69 = A[5] & B[2];
assign sig_70 = A[6] & B[2];
assign sig_71 = A[7] & B[2];
assign sig_90 = B[2] & A[4];
assign sig_94 = sig_60 ^ sig_69;
assign sig_95 = sig_60 & sig_69;
assign sig_96 = sig_94 & sig_90;
assign sig_97 = sig_94 ^ sig_90;
assign sig_98 = sig_95 | sig_96;
assign sig_99 = sig_63 ^ sig_70;
assign sig_100 = sig_63 & sig_70;
assign sig_101 = sig_99 & sig_98;
assign sig_102 = sig_99 ^ sig_98;
assign sig_103 = sig_100 | sig_101;
assign sig_104 = sig_58 ^ sig_71;
assign sig_105 = sig_58 & B[2];
assign sig_106 = sig_71 & sig_103;
assign sig_107 = sig_104 ^ sig_103;
assign sig_108 = sig_105 | sig_106;
assign sig_112 = A[3] & B[3];
assign sig_113 = A[4] & B[3];
assign sig_115 = A[6] & B[3];
assign sig_116 = A[7] & B[3];
assign sig_118 = A[5] & B[3];
assign sig_126 = sig_118 & sig_102;
assign sig_134 = sig_97 ^ sig_113;
assign sig_135 = sig_97 & sig_113;
assign sig_136 = sig_134 & sig_112;
assign sig_137 = sig_134 ^ sig_112;
assign sig_138 = sig_135 | sig_136;
assign sig_139 = sig_102 ^ sig_118;
assign sig_141 = sig_139 & sig_138;
assign sig_142 = sig_139 ^ sig_138;
assign sig_143 = sig_126 | sig_141;
assign sig_144 = sig_107 ^ sig_115;
assign sig_145 = sig_107 & sig_115;
assign sig_146 = sig_144 & sig_143;
assign sig_147 = sig_144 ^ sig_143;
assign sig_148 = sig_145 | sig_146;
assign sig_149 = sig_108 ^ sig_116;
assign sig_150 = sig_108 & sig_116;
assign sig_151 = sig_116 & sig_148;
assign sig_152 = sig_149 ^ sig_148;
assign sig_153 = sig_150 | sig_151;
assign sig_155 = A[1] & B[5];
assign sig_156 = A[2] & B[4];
assign sig_157 = A[3] & B[4];
assign sig_158 = A[4] & B[4];
assign sig_159 = A[5] & B[4];
assign sig_160 = A[6] & B[4];
assign sig_161 = A[7] & B[4];
assign sig_174 = sig_137 ^ sig_157;
assign sig_175 = sig_137 & sig_157;
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
assign sig_201 = A[2] & B[5];
assign sig_202 = A[3] & B[5];
assign sig_203 = A[4] & B[5];
assign sig_204 = A[5] & B[5];
assign sig_205 = A[6] & B[5];
assign sig_206 = A[7] & B[5];
assign sig_211 = B[5] & sig_198;
assign sig_213 = sig_155 | sig_156;
assign sig_214 = sig_174 ^ sig_201;
assign sig_215 = sig_174 & sig_201;
assign sig_216 = sig_214 & sig_213;
assign sig_217 = sig_214 ^ sig_213;
assign sig_218 = sig_215 | sig_216;
assign sig_219 = sig_182 ^ sig_202;
assign sig_220 = sig_182 & sig_202;
assign sig_221 = sig_219 & sig_218;
assign sig_222 = sig_219 ^ sig_218;
assign sig_223 = sig_220 | sig_221;
assign sig_224 = sig_187 ^ sig_203;
assign sig_225 = sig_187 & sig_203;
assign sig_226 = sig_224 & sig_223;
assign sig_227 = sig_224 ^ sig_223;
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
assign sig_241 = sig_206 & sig_238;
assign sig_242 = sig_239 ^ sig_238;
assign sig_243 = sig_211 | sig_241;

assign O[13] = sig_243;
assign O[12] = sig_242;
assign O[11] = sig_237;
assign O[10] = sig_232;
assign O[9] = sig_227;
assign O[8] = sig_222;
assign O[7] = sig_217;
assign O[6] = sig_52;
assign O[5] = sig_155;
assign O[4] = sig_156;
assign O[3] = 1'b0;
assign O[2] = 1'b0;
assign O[1] = sig_135;
assign O[0] = sig_58;

endmodule


