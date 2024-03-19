/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 0.29 %
// MAE = 95 
// WCE% = 1.47 %
// WCE = 483 
// WCRE% = 100.00 %
// EP% = 97.33 %
// MRE% = 5.73 %
// MSE = 14382 
// PDK45_PWR = 0.172 mW
// PDK45_AREA = 364.2 um2
// PDK45_DELAY = 1.24 ns

module mul8x7u_635 (
    A,
    B,
    O
);

input [7:0] A;
input [6:0] B;
output [14:0] O;

wire sig_22,sig_29,sig_30,sig_62,sig_63,sig_64,sig_70,sig_71,sig_72,sig_94,sig_96,sig_98,sig_99,sig_100,sig_101,sig_102,sig_103,sig_104,sig_105,sig_106;
wire sig_107,sig_108,sig_109,sig_113,sig_114,sig_115,sig_116,sig_117,sig_134,sig_135,sig_136,sig_137,sig_138,sig_139,sig_140,sig_141,sig_142,sig_143,sig_144,sig_145;
wire sig_146,sig_147,sig_148,sig_149,sig_150,sig_151,sig_152,sig_153,sig_154,sig_156,sig_158,sig_159,sig_160,sig_161,sig_162,sig_175,sig_176,sig_180,sig_181,sig_182;
wire sig_183,sig_184,sig_185,sig_186,sig_187,sig_188,sig_189,sig_190,sig_191,sig_192,sig_193,sig_194,sig_195,sig_196,sig_197,sig_198,sig_199,sig_202,sig_203,sig_204;
wire sig_205,sig_206,sig_207,sig_216,sig_218,sig_220,sig_221,sig_222,sig_223,sig_224,sig_225,sig_226,sig_227,sig_228,sig_229,sig_230,sig_231,sig_232,sig_233,sig_234;
wire sig_235,sig_236,sig_237,sig_238,sig_239,sig_240,sig_241,sig_242,sig_243,sig_244,sig_245,sig_246,sig_247,sig_248,sig_249,sig_250,sig_251,sig_252,sig_253,sig_255;
wire sig_256,sig_258,sig_260,sig_261,sig_262,sig_263,sig_264,sig_265,sig_266,sig_267,sig_268,sig_269,sig_270,sig_271,sig_272,sig_273,sig_274,sig_275,sig_276,sig_277;
wire sig_278,sig_279,sig_280,sig_281,sig_282,sig_283,sig_284,sig_285,sig_286,sig_287,sig_288,sig_289;

assign sig_22 = A[7] & B[0];
assign sig_29 = A[6] & B[1];
assign sig_30 = A[7] & B[1];
assign sig_62 = sig_29 | sig_22;
assign sig_63 = sig_62 & sig_30;
assign sig_64 = sig_62 ^ sig_30;
assign sig_70 = A[5] & B[2];
assign sig_71 = A[6] & B[2];
assign sig_72 = A[7] & B[2];
assign sig_94 = B[5] | sig_29;
assign sig_96 = B[5] & sig_70;
assign sig_98 = sig_96 ^ sig_94;
assign sig_99 = sig_96 | sig_70;
assign sig_100 = sig_64 ^ sig_71;
assign sig_101 = sig_64 & sig_71;
assign sig_102 = sig_100 & sig_99;
assign sig_103 = sig_100 ^ sig_99;
assign sig_104 = sig_101 | sig_102;
assign sig_105 = sig_63 ^ sig_72;
assign sig_106 = sig_63 & sig_72;
assign sig_107 = sig_105 & sig_104;
assign sig_108 = sig_105 ^ sig_104;
assign sig_109 = sig_106 | sig_107;
assign sig_113 = sig_70 & sig_96;
assign sig_114 = A[4] & B[3];
assign sig_115 = A[5] & B[3];
assign sig_116 = A[6] & B[3];
assign sig_117 = A[7] & B[3];
assign sig_134 = sig_113 | sig_114;
assign sig_135 = sig_98 ^ sig_114;
assign sig_136 = sig_98 & sig_114;
assign sig_137 = sig_135 & sig_134;
assign sig_138 = ~(sig_135 & sig_113);
assign sig_139 = sig_136 | sig_137;
assign sig_140 = sig_103 ^ sig_115;
assign sig_141 = sig_103 & sig_115;
assign sig_142 = sig_140 & sig_139;
assign sig_143 = sig_140 ^ sig_139;
assign sig_144 = sig_141 | sig_142;
assign sig_145 = sig_108 ^ sig_116;
assign sig_146 = sig_108 & sig_116;
assign sig_147 = sig_145 & sig_144;
assign sig_148 = sig_145 ^ sig_144;
assign sig_149 = sig_146 | sig_147;
assign sig_150 = sig_109 ^ sig_117;
assign sig_151 = sig_109 & sig_117;
assign sig_152 = sig_150 & sig_149;
assign sig_153 = sig_150 ^ sig_149;
assign sig_154 = sig_151 | sig_152;
assign sig_156 = A[1] & B[4];
assign sig_158 = A[3] & B[4];
assign sig_159 = A[4] & B[4];
assign sig_160 = A[5] & B[4];
assign sig_161 = A[6] & B[4];
assign sig_162 = A[7] & B[4];
assign sig_175 = sig_138 ^ sig_158;
assign sig_176 = sig_138 & sig_158;
assign sig_180 = sig_143 ^ sig_159;
assign sig_181 = sig_143 & sig_159;
assign sig_182 = sig_180 & sig_176;
assign sig_183 = sig_180 ^ sig_176;
assign sig_184 = sig_181 | sig_182;
assign sig_185 = sig_148 ^ sig_160;
assign sig_186 = sig_148 & sig_160;
assign sig_187 = sig_185 & sig_184;
assign sig_188 = sig_185 ^ sig_184;
assign sig_189 = sig_186 | sig_187;
assign sig_190 = sig_153 ^ sig_161;
assign sig_191 = sig_153 & sig_161;
assign sig_192 = sig_190 & sig_189;
assign sig_193 = sig_190 ^ sig_189;
assign sig_194 = sig_191 | sig_192;
assign sig_195 = sig_154 ^ sig_162;
assign sig_196 = sig_154 & sig_162;
assign sig_197 = sig_195 & sig_194;
assign sig_198 = sig_195 ^ sig_194;
assign sig_199 = sig_196 | sig_197;
assign sig_202 = A[2] & B[5];
assign sig_203 = A[3] & B[5];
assign sig_204 = A[4] & B[5];
assign sig_205 = A[5] & B[5];
assign sig_206 = A[6] & B[5];
assign sig_207 = A[7] & B[5];
assign sig_216 = sig_175 & sig_202;
assign sig_218 = sig_202 & sig_204;
assign sig_220 = sig_183 ^ sig_203;
assign sig_221 = sig_183 & sig_203;
assign sig_222 = sig_220 & sig_216;
assign sig_223 = sig_220 ^ sig_216;
assign sig_224 = sig_221 | sig_222;
assign sig_225 = sig_188 ^ sig_204;
assign sig_226 = sig_188 & sig_204;
assign sig_227 = sig_225 & sig_224;
assign sig_228 = sig_225 ^ sig_224;
assign sig_229 = sig_226 | sig_227;
assign sig_230 = sig_193 ^ sig_205;
assign sig_231 = sig_193 & sig_205;
assign sig_232 = sig_230 & sig_229;
assign sig_233 = sig_230 ^ sig_229;
assign sig_234 = sig_231 | sig_232;
assign sig_235 = sig_198 ^ sig_206;
assign sig_236 = sig_198 & sig_206;
assign sig_237 = sig_235 & sig_234;
assign sig_238 = sig_235 ^ sig_234;
assign sig_239 = sig_236 | sig_237;
assign sig_240 = sig_199 ^ sig_207;
assign sig_241 = sig_199 & sig_207;
assign sig_242 = A[7] & sig_239;
assign sig_243 = sig_240 ^ sig_239;
assign sig_244 = sig_241 | sig_242;
assign sig_245 = A[0] & B[6];
assign sig_246 = A[1] & B[6];
assign sig_247 = A[2] & B[6];
assign sig_248 = A[3] & B[6];
assign sig_249 = A[4] & B[6];
assign sig_250 = A[5] & B[6];
assign sig_251 = A[6] & B[6];
assign sig_252 = A[7] & B[6];
assign sig_253 = sig_221 & sig_246;
assign sig_255 = sig_218 ^ sig_246;
assign sig_256 = sig_218 & sig_246;
assign sig_258 = sig_255 | sig_253;
assign sig_260 = sig_223 ^ sig_247;
assign sig_261 = sig_223 & sig_247;
assign sig_262 = sig_260 & sig_256;
assign sig_263 = sig_260 ^ sig_256;
assign sig_264 = sig_261 | sig_262;
assign sig_265 = sig_228 ^ sig_248;
assign sig_266 = sig_228 & sig_248;
assign sig_267 = sig_265 & sig_264;
assign sig_268 = sig_265 ^ sig_264;
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
assign sig_287 = sig_285 & sig_284;
assign sig_288 = sig_285 ^ sig_284;
assign sig_289 = sig_286 | sig_287;

assign O[14] = sig_289;
assign O[13] = sig_288;
assign O[12] = sig_283;
assign O[11] = sig_278;
assign O[10] = sig_273;
assign O[9] = sig_268;
assign O[8] = sig_263;
assign O[7] = sig_258;
assign O[6] = sig_245;
assign O[5] = sig_156;
assign O[4] = sig_160;
assign O[3] = sig_195;
assign O[2] = 1'b0;
assign O[1] = sig_199;
assign O[0] = sig_186;

endmodule


