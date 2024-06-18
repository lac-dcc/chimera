// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 0.000011 %
// MAE = 459 
// WCE% = 0.000051 %
// WCE = 2181 
// WCRE% = 300.00 %
// EP% = 99.15 %
// MRE% = 0.0011 %
// MSE = 329216 
// PDK45_PWR = 1.855 mW
// PDK45_AREA = 2685.3 um2
// PDK45_DELAY = 2.62 ns

module mult8_cgp14zr_wc1925_rcam (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [15:0] O;

wire sig_72,sig_118,sig_147,sig_151,sig_152,sig_153,sig_154,sig_155,sig_161,sig_162,sig_163,sig_191,sig_192,sig_193,sig_194,sig_195,sig_196,sig_197,sig_198,sig_199;
wire sig_200,sig_205,sig_206,sig_207,sig_208,sig_231,sig_232,sig_236,sig_237,sig_238,sig_239,sig_240,sig_241,sig_242,sig_243,sig_244,sig_245,sig_249,sig_250,sig_251;
wire sig_252,sig_253,sig_271,sig_272,sig_273,sig_274,sig_275,sig_276,sig_277,sig_278,sig_279,sig_280,sig_281,sig_282,sig_283,sig_284,sig_285,sig_286,sig_287,sig_288;
wire sig_289,sig_290,sig_295,sig_296,sig_297,sig_298,sig_307,sig_316,sig_317,sig_318,sig_319,sig_320,sig_321,sig_322,sig_323,sig_324,sig_325,sig_326,sig_327,sig_328;
wire sig_329,sig_330,sig_331,sig_332,sig_333,sig_334,sig_335;

assign sig_72 = B[7] & A[2];
assign sig_118 = B[7] & A[3];
assign sig_147 = B[6] & A[3];
assign sig_151 = sig_72 ^ sig_118;
assign sig_152 = sig_72 & A[3];
assign sig_153 = B[7] & sig_147;
assign sig_154 = sig_151 ^ sig_147;
assign sig_155 = sig_152 | sig_153;
assign sig_161 = B[5] & A[4];
assign sig_162 = B[6] & A[4];
assign sig_163 = B[7] & A[4];
assign sig_191 = sig_154 ^ sig_162;
assign sig_192 = sig_154 & sig_162;
assign sig_193 = sig_191 & sig_161;
assign sig_194 = sig_191 ^ sig_161;
assign sig_195 = sig_192 | sig_193;
assign sig_196 = sig_155 ^ sig_163;
assign sig_197 = sig_155 & sig_163;
assign sig_198 = B[7] & sig_195;
assign sig_199 = sig_196 ^ sig_195;
assign sig_200 = sig_197 | sig_198;
assign sig_205 = B[4] & A[5];
assign sig_206 = B[5] & A[5];
assign sig_207 = B[6] & A[5];
assign sig_208 = B[7] & A[5];
assign sig_231 = sig_194 ^ sig_206;
assign sig_232 = sig_194 & sig_206;
assign sig_236 = sig_199 ^ sig_207;
assign sig_237 = sig_199 & sig_207;
assign sig_238 = sig_236 & sig_232;
assign sig_239 = sig_236 ^ sig_232;
assign sig_240 = sig_237 | sig_238;
assign sig_241 = sig_200 ^ sig_208;
assign sig_242 = sig_200 & sig_208;
assign sig_243 = B[7] & sig_240;
assign sig_244 = sig_241 ^ sig_240;
assign sig_245 = sig_242 | sig_243;
assign sig_249 = B[2] & A[6];
assign sig_250 = B[4] & A[6];
assign sig_251 = B[5] & A[6];
assign sig_252 = B[6] & A[6];
assign sig_253 = B[7] & A[6];
assign sig_271 = sig_231 ^ sig_250;
assign sig_272 = sig_231 & sig_250;
assign sig_273 = sig_271 & sig_249;
assign sig_274 = sig_271 ^ sig_249;
assign sig_275 = sig_272 | sig_273;
assign sig_276 = sig_239 ^ sig_251;
assign sig_277 = sig_239 & sig_251;
assign sig_278 = sig_276 & sig_275;
assign sig_279 = sig_276 ^ sig_275;
assign sig_280 = sig_277 | sig_278;
assign sig_281 = sig_244 ^ sig_252;
assign sig_282 = sig_244 & sig_252;
assign sig_283 = sig_281 & sig_280;
assign sig_284 = sig_281 ^ sig_280;
assign sig_285 = sig_282 | sig_283;
assign sig_286 = sig_245 ^ sig_253;
assign sig_287 = sig_245 & sig_253;
assign sig_288 = sig_253 & sig_285;
assign sig_289 = sig_286 ^ sig_285;
assign sig_290 = sig_287 | sig_288;
assign sig_295 = B[4] & A[7];
assign sig_296 = B[5] & A[7];
assign sig_297 = B[6] & A[7];
assign sig_298 = B[7] & A[7];
assign sig_307 = A[7] & B[3];
assign sig_316 = sig_279 ^ sig_295;
assign sig_317 = sig_279 & sig_295;
assign sig_318 = sig_316 & sig_307;
assign sig_319 = sig_316 ^ sig_307;
assign sig_320 = sig_317 | sig_318;
assign sig_321 = sig_284 ^ sig_296;
assign sig_322 = sig_284 & sig_296;
assign sig_323 = sig_321 & sig_320;
assign sig_324 = sig_321 ^ sig_320;
assign sig_325 = sig_322 | sig_323;
assign sig_326 = sig_289 ^ sig_297;
assign sig_327 = sig_289 & sig_297;
assign sig_328 = sig_326 & sig_325;
assign sig_329 = sig_326 ^ sig_325;
assign sig_330 = sig_327 | sig_328;
assign sig_331 = sig_290 ^ sig_298;
assign sig_332 = sig_290 & A[7];
assign sig_333 = sig_298 & sig_330;
assign sig_334 = sig_331 ^ sig_330;
assign sig_335 = sig_332 | sig_333;

assign O[15] = sig_335;
assign O[14] = sig_334;
assign O[13] = sig_329;
assign O[12] = sig_324;
assign O[11] = sig_319;
assign O[10] = sig_274;
assign O[9] = sig_205;
assign O[8] = sig_205;
assign O[7] = 1'b0;
assign O[6] = 1'b0;
assign O[5] = sig_250;
assign O[4] = 1'b0;
assign O[3] = sig_194;
assign O[2] = sig_163;
assign O[1] = sig_205;
assign O[0] = 1'b0;

endmodule

module mult8_cgp14ep_ep63078_wc1_csamcsa (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [15:0] O;

wire sig_16,sig_17,sig_18,sig_19,sig_20,sig_21,sig_22,sig_23,sig_24,sig_25,sig_26,sig_27,sig_28,sig_29,sig_30,sig_31,sig_32,sig_33,sig_34,sig_35;
wire sig_36,sig_37,sig_38,sig_39,sig_40,sig_41,sig_42,sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55;
wire sig_56,sig_57,sig_58,sig_59,sig_60,sig_61,sig_62,sig_63,sig_64,sig_65,sig_66,sig_67,sig_68,sig_69,sig_70,sig_71,sig_72,sig_73,sig_74,sig_75;
wire sig_76,sig_77,sig_78,sig_79,sig_80,sig_81,sig_82,sig_83,sig_84,sig_85,sig_87,sig_88,sig_89,sig_90,sig_91,sig_92,sig_93,sig_94,sig_95,sig_96;
wire sig_97,sig_98,sig_99,sig_100,sig_101,sig_102,sig_103,sig_104,sig_105,sig_106,sig_107,sig_108,sig_109,sig_110,sig_111,sig_112,sig_113,sig_114,sig_115,sig_116;
wire sig_117,sig_118,sig_119,sig_120,sig_121,sig_122,sig_123,sig_124,sig_125,sig_126,sig_127,sig_128,sig_129,sig_130,sig_131,sig_132,sig_133,sig_134,sig_135,sig_136;
wire sig_137,sig_138,sig_139,sig_140,sig_141,sig_142,sig_143,sig_144,sig_145,sig_146,sig_147,sig_148,sig_149,sig_150,sig_151,sig_152,sig_153,sig_154,sig_155,sig_156;
wire sig_157,sig_158,sig_159,sig_160,sig_161,sig_162,sig_163,sig_164,sig_165,sig_166,sig_167,sig_168,sig_169,sig_170,sig_171,sig_172,sig_173,sig_174,sig_175,sig_176;
wire sig_177,sig_178,sig_179,sig_180,sig_181,sig_182,sig_183,sig_184,sig_185,sig_186,sig_187,sig_188,sig_189,sig_190,sig_191,sig_192,sig_193,sig_194,sig_195,sig_196;
wire sig_197,sig_198,sig_199,sig_200,sig_201,sig_202,sig_203,sig_204,sig_205,sig_206,sig_207,sig_208,sig_209,sig_210,sig_211,sig_212,sig_213,sig_214,sig_215,sig_216;
wire sig_217,sig_218,sig_219,sig_220,sig_221,sig_222,sig_223,sig_224,sig_225,sig_226,sig_227,sig_228,sig_229,sig_230,sig_231,sig_232,sig_233,sig_234,sig_235,sig_236;
wire sig_237,sig_238,sig_239,sig_240,sig_241,sig_242,sig_243,sig_244,sig_245,sig_246,sig_247,sig_248,sig_249,sig_250,sig_251,sig_252,sig_253,sig_254,sig_255,sig_256;
wire sig_257,sig_258,sig_259,sig_260,sig_261,sig_262,sig_263,sig_264,sig_265,sig_266,sig_267,sig_268,sig_269,sig_270,sig_271,sig_272,sig_273,sig_274,sig_275,sig_276;
wire sig_277,sig_278,sig_279,sig_280,sig_281,sig_282,sig_283,sig_284,sig_285,sig_286,sig_287,sig_288,sig_289,sig_290,sig_291,sig_292,sig_293,sig_294,sig_295,sig_296;
wire sig_297,sig_298,sig_299,sig_300,sig_301,sig_302,sig_303,sig_304,sig_305,sig_306,sig_307,sig_308,sig_309,sig_310,sig_311,sig_312,sig_313,sig_314,sig_315,sig_316;
wire sig_317,sig_318,sig_319,sig_320,sig_322,sig_323,sig_324,sig_325,sig_326,sig_327,sig_328,sig_329,sig_330,sig_331,sig_332,sig_333,sig_335,sig_336,sig_339,sig_340;
wire sig_341,sig_344,sig_345,sig_347,sig_348,sig_349,sig_350,sig_351,sig_352,sig_353,sig_354,sig_355,sig_356,sig_357,sig_358,sig_361,sig_362;

assign sig_16 = A[1] & B[6];
assign sig_17 = B[1] & A[0];
assign sig_18 = B[2] & A[0];
assign sig_19 = B[3] & A[0];
assign sig_20 = B[4] & A[0];
assign sig_21 = B[5] & A[0];
assign sig_22 = B[6] & A[0];
assign sig_23 = B[7] & A[0];
assign sig_24 = B[0] & A[1];
assign sig_25 = B[1] & A[1];
assign sig_26 = B[2] & A[1];
assign sig_27 = B[3] & A[1];
assign sig_28 = B[4] & A[1];
assign sig_29 = B[5] & A[1];
assign sig_30 = B[6] & A[1];
assign sig_31 = B[7] & A[1];
assign sig_32 = sig_17 | sig_24;
assign sig_33 = sig_17 & sig_24;
assign sig_34 = sig_18 ^ sig_25;
assign sig_35 = sig_18 & sig_25;
assign sig_36 = sig_19 ^ sig_26;
assign sig_37 = sig_19 & sig_26;
assign sig_38 = sig_20 ^ sig_27;
assign sig_39 = sig_20 & sig_27;
assign sig_40 = sig_21 ^ sig_28;
assign sig_41 = sig_21 & sig_28;
assign sig_42 = sig_22 ^ sig_29;
assign sig_43 = sig_22 & sig_29;
assign sig_44 = sig_23 ^ sig_16;
assign sig_45 = sig_23 & sig_30;
assign sig_46 = B[0] & A[2];
assign sig_47 = B[1] & A[2];
assign sig_48 = B[2] & A[2];
assign sig_49 = B[3] & A[2];
assign sig_50 = B[4] & A[2];
assign sig_51 = B[5] & A[2];
assign sig_52 = B[6] & A[2];
assign sig_53 = B[7] & A[2];
assign sig_54 = sig_34 ^ sig_46;
assign sig_55 = sig_34 & sig_46;
assign sig_56 = sig_54 & sig_33;
assign sig_57 = sig_54 ^ sig_33;
assign sig_58 = sig_55 | sig_56;
assign sig_59 = sig_36 ^ sig_47;
assign sig_60 = sig_36 & sig_47;
assign sig_61 = sig_59 & sig_35;
assign sig_62 = sig_59 ^ sig_35;
assign sig_63 = sig_60 | sig_61;
assign sig_64 = sig_38 ^ sig_48;
assign sig_65 = sig_38 & sig_48;
assign sig_66 = sig_64 & sig_37;
assign sig_67 = sig_64 ^ sig_37;
assign sig_68 = sig_65 | sig_66;
assign sig_69 = sig_40 ^ sig_49;
assign sig_70 = sig_40 & sig_49;
assign sig_71 = sig_69 & sig_39;
assign sig_72 = sig_69 ^ sig_39;
assign sig_73 = sig_70 | sig_71;
assign sig_74 = sig_42 ^ sig_50;
assign sig_75 = sig_42 & sig_50;
assign sig_76 = sig_74 & sig_41;
assign sig_77 = sig_74 ^ sig_41;
assign sig_78 = sig_75 | sig_76;
assign sig_79 = sig_44 ^ sig_51;
assign sig_80 = sig_44 & sig_51;
assign sig_81 = sig_79 & sig_43;
assign sig_82 = sig_79 ^ sig_43;
assign sig_83 = sig_80 | sig_81;
assign sig_84 = sig_31 ^ sig_52;
assign sig_85 = sig_31 & sig_52;
assign sig_87 = sig_84 ^ sig_45;
assign sig_88 = sig_85 | sig_45;
assign sig_89 = B[0] & A[3];
assign sig_90 = B[1] & A[3];
assign sig_91 = B[2] & A[3];
assign sig_92 = B[3] & A[3];
assign sig_93 = B[4] & A[3];
assign sig_94 = B[5] & A[3];
assign sig_95 = B[6] & A[3];
assign sig_96 = B[7] & A[3];
assign sig_97 = sig_62 ^ sig_89;
assign sig_98 = sig_62 & sig_89;
assign sig_99 = sig_97 & sig_58;
assign sig_100 = sig_97 ^ sig_58;
assign sig_101 = sig_98 | sig_99;
assign sig_102 = sig_67 ^ sig_90;
assign sig_103 = sig_67 & sig_90;
assign sig_104 = sig_102 & sig_63;
assign sig_105 = sig_102 ^ sig_63;
assign sig_106 = sig_103 | sig_104;
assign sig_107 = sig_72 ^ sig_91;
assign sig_108 = sig_72 & sig_91;
assign sig_109 = sig_107 & sig_68;
assign sig_110 = sig_107 ^ sig_68;
assign sig_111 = sig_108 | sig_109;
assign sig_112 = sig_77 ^ sig_92;
assign sig_113 = sig_77 & sig_92;
assign sig_114 = sig_112 & sig_73;
assign sig_115 = sig_112 ^ sig_73;
assign sig_116 = sig_113 | sig_114;
assign sig_117 = sig_82 ^ sig_93;
assign sig_118 = sig_82 & sig_93;
assign sig_119 = sig_117 & sig_78;
assign sig_120 = sig_117 ^ sig_78;
assign sig_121 = sig_118 | sig_119;
assign sig_122 = sig_87 ^ sig_94;
assign sig_123 = sig_87 & sig_94;
assign sig_124 = sig_122 & sig_83;
assign sig_125 = sig_122 ^ sig_83;
assign sig_126 = sig_123 | sig_124;
assign sig_127 = sig_53 ^ sig_95;
assign sig_128 = sig_53 & sig_95;
assign sig_129 = sig_127 & sig_88;
assign sig_130 = sig_127 ^ sig_88;
assign sig_131 = sig_128 | sig_129;
assign sig_132 = B[0] & A[4];
assign sig_133 = B[1] & A[4];
assign sig_134 = B[2] & A[4];
assign sig_135 = B[3] & A[4];
assign sig_136 = B[4] & A[4];
assign sig_137 = B[5] & A[4];
assign sig_138 = B[6] & A[4];
assign sig_139 = B[7] & A[4];
assign sig_140 = sig_105 ^ sig_132;
assign sig_141 = sig_105 & sig_132;
assign sig_142 = sig_140 & sig_101;
assign sig_143 = sig_140 ^ sig_101;
assign sig_144 = sig_141 | sig_142;
assign sig_145 = sig_110 ^ sig_133;
assign sig_146 = sig_110 & sig_133;
assign sig_147 = sig_145 & sig_106;
assign sig_148 = sig_145 ^ sig_106;
assign sig_149 = sig_146 | sig_147;
assign sig_150 = sig_115 ^ sig_134;
assign sig_151 = sig_115 & sig_134;
assign sig_152 = sig_150 & sig_111;
assign sig_153 = sig_150 ^ sig_111;
assign sig_154 = sig_151 | sig_152;
assign sig_155 = sig_120 ^ sig_135;
assign sig_156 = sig_120 & sig_135;
assign sig_157 = sig_155 & sig_116;
assign sig_158 = sig_155 ^ sig_116;
assign sig_159 = sig_156 | sig_157;
assign sig_160 = sig_125 ^ sig_136;
assign sig_161 = sig_125 & sig_136;
assign sig_162 = sig_160 & sig_121;
assign sig_163 = sig_160 ^ sig_121;
assign sig_164 = sig_161 | sig_162;
assign sig_165 = sig_130 ^ sig_137;
assign sig_166 = sig_130 & sig_137;
assign sig_167 = sig_165 & sig_126;
assign sig_168 = sig_165 ^ sig_126;
assign sig_169 = sig_166 | sig_167;
assign sig_170 = sig_96 ^ sig_138;
assign sig_171 = sig_96 & sig_138;
assign sig_172 = sig_170 & sig_131;
assign sig_173 = sig_170 ^ sig_131;
assign sig_174 = sig_171 | sig_172;
assign sig_175 = B[0] & A[5];
assign sig_176 = B[1] & A[5];
assign sig_177 = B[2] & A[5];
assign sig_178 = B[3] & A[5];
assign sig_179 = B[4] & A[5];
assign sig_180 = B[5] & A[5];
assign sig_181 = B[6] & A[5];
assign sig_182 = B[7] & A[5];
assign sig_183 = sig_148 ^ sig_175;
assign sig_184 = sig_148 & sig_175;
assign sig_185 = sig_183 & sig_144;
assign sig_186 = sig_183 ^ sig_144;
assign sig_187 = sig_184 | sig_185;
assign sig_188 = sig_153 ^ sig_176;
assign sig_189 = sig_153 & sig_176;
assign sig_190 = sig_188 & sig_149;
assign sig_191 = sig_188 ^ sig_149;
assign sig_192 = sig_189 | sig_190;
assign sig_193 = sig_158 ^ sig_177;
assign sig_194 = sig_158 & sig_177;
assign sig_195 = sig_193 & sig_154;
assign sig_196 = sig_193 ^ sig_154;
assign sig_197 = sig_194 | sig_195;
assign sig_198 = sig_163 ^ sig_178;
assign sig_199 = sig_163 & sig_178;
assign sig_200 = sig_198 & sig_159;
assign sig_201 = sig_198 ^ sig_159;
assign sig_202 = sig_199 | sig_200;
assign sig_203 = sig_168 ^ sig_179;
assign sig_204 = sig_168 & sig_179;
assign sig_205 = sig_203 & sig_164;
assign sig_206 = sig_203 ^ sig_164;
assign sig_207 = sig_204 | sig_205;
assign sig_208 = sig_173 ^ sig_180;
assign sig_209 = sig_173 & sig_180;
assign sig_210 = sig_208 & sig_169;
assign sig_211 = sig_208 ^ sig_169;
assign sig_212 = sig_209 | sig_210;
assign sig_213 = sig_139 ^ sig_181;
assign sig_214 = sig_139 & sig_181;
assign sig_215 = sig_213 & sig_174;
assign sig_216 = sig_213 ^ sig_174;
assign sig_217 = sig_214 | sig_215;
assign sig_218 = B[0] & A[6];
assign sig_219 = B[1] & A[6];
assign sig_220 = B[2] & A[6];
assign sig_221 = B[3] & A[6];
assign sig_222 = B[4] & A[6];
assign sig_223 = B[5] & A[6];
assign sig_224 = B[6] & A[6];
assign sig_225 = B[7] & A[6];
assign sig_226 = sig_191 ^ sig_218;
assign sig_227 = sig_191 & sig_218;
assign sig_228 = sig_226 & sig_187;
assign sig_229 = sig_226 ^ sig_187;
assign sig_230 = sig_227 | sig_228;
assign sig_231 = sig_196 ^ sig_219;
assign sig_232 = sig_196 & sig_219;
assign sig_233 = sig_231 & sig_192;
assign sig_234 = sig_231 ^ sig_192;
assign sig_235 = sig_232 | sig_233;
assign sig_236 = sig_201 ^ sig_220;
assign sig_237 = sig_201 & sig_220;
assign sig_238 = sig_236 & sig_197;
assign sig_239 = sig_236 ^ sig_197;
assign sig_240 = sig_237 | sig_238;
assign sig_241 = sig_206 ^ sig_221;
assign sig_242 = sig_206 & sig_221;
assign sig_243 = sig_241 & sig_202;
assign sig_244 = sig_241 ^ sig_202;
assign sig_245 = sig_242 | sig_243;
assign sig_246 = sig_211 ^ sig_222;
assign sig_247 = sig_211 & sig_222;
assign sig_248 = sig_246 & sig_207;
assign sig_249 = sig_246 ^ sig_207;
assign sig_250 = sig_247 | sig_248;
assign sig_251 = sig_216 ^ sig_223;
assign sig_252 = sig_216 & sig_223;
assign sig_253 = sig_251 & sig_212;
assign sig_254 = sig_251 ^ sig_212;
assign sig_255 = sig_252 | sig_253;
assign sig_256 = sig_182 ^ sig_224;
assign sig_257 = sig_182 & sig_224;
assign sig_258 = sig_256 & sig_217;
assign sig_259 = sig_256 ^ sig_217;
assign sig_260 = sig_257 | sig_258;
assign sig_261 = B[0] & A[7];
assign sig_262 = B[1] & A[7];
assign sig_263 = B[2] & A[7];
assign sig_264 = B[3] & A[7];
assign sig_265 = B[4] & A[7];
assign sig_266 = B[5] & A[7];
assign sig_267 = B[6] & A[7];
assign sig_268 = B[7] & A[7];
assign sig_269 = sig_234 ^ sig_261;
assign sig_270 = sig_234 & sig_261;
assign sig_271 = sig_269 & sig_230;
assign sig_272 = sig_269 ^ sig_230;
assign sig_273 = sig_270 | sig_271;
assign sig_274 = sig_239 ^ sig_262;
assign sig_275 = sig_239 & sig_262;
assign sig_276 = sig_274 & sig_235;
assign sig_277 = sig_274 ^ sig_235;
assign sig_278 = sig_275 | sig_276;
assign sig_279 = sig_244 ^ sig_263;
assign sig_280 = sig_244 & sig_263;
assign sig_281 = sig_279 & sig_240;
assign sig_282 = sig_279 ^ sig_240;
assign sig_283 = sig_280 | sig_281;
assign sig_284 = sig_249 ^ sig_264;
assign sig_285 = sig_249 & sig_264;
assign sig_286 = sig_284 & sig_245;
assign sig_287 = sig_284 ^ sig_245;
assign sig_288 = sig_285 | sig_286;
assign sig_289 = sig_254 ^ sig_265;
assign sig_290 = sig_254 & sig_265;
assign sig_291 = sig_289 & sig_250;
assign sig_292 = sig_289 ^ sig_250;
assign sig_293 = sig_290 | sig_291;
assign sig_294 = sig_259 ^ sig_266;
assign sig_295 = sig_259 & sig_266;
assign sig_296 = sig_294 & sig_255;
assign sig_297 = sig_294 ^ sig_255;
assign sig_298 = sig_295 | sig_296;
assign sig_299 = sig_225 ^ sig_267;
assign sig_300 = sig_225 & sig_267;
assign sig_301 = sig_299 & sig_260;
assign sig_302 = sig_299 ^ sig_260;
assign sig_303 = sig_300 | sig_301;
assign sig_304 = sig_277 ^ sig_273;
assign sig_305 = sig_277 & sig_273;
assign sig_306 = sig_282 ^ sig_278;
assign sig_307 = sig_282 & sig_278;
assign sig_308 = sig_306 & sig_305;
assign sig_309 = sig_306 ^ sig_305;
assign sig_310 = sig_307 | sig_308;
assign sig_311 = sig_287 ^ sig_283;
assign sig_312 = sig_287 & sig_283;
assign sig_313 = sig_311 & sig_310;
assign sig_314 = sig_311 ^ sig_310;
assign sig_315 = sig_312 | sig_313;
assign sig_316 = sig_292 ^ sig_288;
assign sig_317 = sig_292 & sig_288;
assign sig_318 = sig_316 & sig_315;
assign sig_319 = sig_316 ^ sig_315;
assign sig_320 = sig_317 | sig_318;
assign sig_322 = sig_297 & sig_293;
assign sig_323 = sig_302 ^ sig_298;
assign sig_324 = sig_302 & sig_298;
assign sig_325 = sig_323 & sig_322;
assign sig_326 = sig_323 ^ sig_322;
assign sig_327 = sig_324 | sig_325;
assign sig_328 = sig_268 ^ sig_303;
assign sig_329 = sig_268 & sig_303;
assign sig_330 = sig_328 & sig_327;
assign sig_331 = sig_328 ^ sig_327;
assign sig_332 = sig_329 | sig_330;
assign sig_333 = sig_297 ^ sig_293;
assign sig_335 = ~sig_333;
assign sig_336 = sig_322 | sig_333;
assign sig_339 = sig_323 & sig_336;
assign sig_340 = sig_323 ^ sig_336;
assign sig_341 = sig_327 | sig_339;
assign sig_344 = sig_328 & sig_339;
assign sig_345 = sig_328 ^ sig_341;
assign sig_347 = ~sig_320;
assign sig_348 = sig_333 & sig_347;
assign sig_349 = sig_335 & sig_320;
assign sig_350 = sig_348 | sig_349;
assign sig_351 = ~sig_320;
assign sig_352 = sig_326 & sig_351;
assign sig_353 = sig_340 & sig_320;
assign sig_354 = sig_352 | sig_353;
assign sig_355 = ~sig_320;
assign sig_356 = sig_331 & sig_355;
assign sig_357 = sig_345 & sig_320;
assign sig_358 = sig_356 | sig_357;
assign sig_361 = sig_344 & sig_320;
assign sig_362 = sig_332 | sig_361;

assign O[15] = sig_362;
assign O[14] = sig_358;
assign O[13] = sig_354;
assign O[12] = sig_350;
assign O[11] = sig_319;
assign O[10] = sig_314;
assign O[9] = sig_309;
assign O[8] = sig_304;
assign O[7] = sig_272;
assign O[6] = sig_229;
assign O[5] = sig_186;
assign O[4] = sig_143;
assign O[3] = sig_100;
assign O[2] = sig_57;
assign O[1] = sig_32;
assign O[0] = 1'b0;

endmodule


module trun8_tam00b ( A, B, O );
  input [7:0] A;
  input [7:0] B;
  output [15:0] O;

  wire C_1_0,C_1_1,C_1_2,C_1_3,C_1_4,C_1_5,C_1_6,C_2_0,C_2_1,C_2_2,C_2_3,C_2_4,C_2_5,C_2_6,C_3_0,C_3_1,C_3_2,C_3_3,C_3_4,C_3_5,C_3_6,C_4_0,C_4_1,C_4_2,C_4_3,C_4_4,C_4_5,C_4_6,C_5_0,C_5_1,C_5_2,C_5_3,C_5_4,C_5_5,C_5_6,C_6_0,C_6_1,C_6_2,C_6_3,C_6_4,C_6_5,C_6_6,C_7_0,C_7_1,C_7_2,C_7_3,C_7_4,C_7_5,C_7_6,S_0_0,S_0_1,S_0_2,S_0_3,S_0_4,S_0_5,S_0_6,S_0_7,S_1_0,S_1_1,S_1_2,S_1_3,S_1_4,S_1_5,S_1_6,S_1_7,S_2_0,S_2_1,S_2_2,S_2_3,S_2_4,S_2_5,S_2_6,S_2_7,S_3_0,S_3_1,S_3_2,S_3_3,S_3_4,S_3_5,S_3_6,S_3_7,S_4_0,S_4_1,S_4_2,S_4_3,S_4_4,S_4_5,S_4_6,S_4_7,S_5_0,S_5_1,S_5_2,S_5_3,S_5_4,S_5_5,S_5_6,S_5_7,S_6_0,S_6_1,S_6_2,S_6_3,S_6_4,S_6_5,S_6_6,S_6_7,S_7_0,S_7_1,S_7_2,S_7_3,S_7_4,S_7_5,S_7_6,S_7_7,S_8_0,S_8_1,S_8_2,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7;

  assign S_0_0 = (A[0] & B[0]);
  assign S_0_1 = (A[0] & B[1]);
  assign S_0_2 = (A[0] & B[2]);
  assign S_0_3 = (A[0] & B[3]);
  assign S_0_4 = (A[0] & B[4]);
  assign S_0_5 = (A[0] & B[5]);
  assign S_0_6 = (A[0] & B[6]);
  assign S_0_7 = (A[0] & B[7]);
  PDKGENHAX1 U13609 (.A(S_0_1), .B((A[1] & B[0])), .YS(S_1_0), .YC(C_1_0));
  PDKGENHAX1 U13610 (.A(S_0_2), .B((A[1] & B[1])), .YS(S_1_1), .YC(C_1_1));
  PDKGENHAX1 U13611 (.A(S_0_3), .B((A[1] & B[2])), .YS(S_1_2), .YC(C_1_2));
  PDKGENHAX1 U13612 (.A(S_0_4), .B((A[1] & B[3])), .YS(S_1_3), .YC(C_1_3));
  PDKGENHAX1 U13613 (.A(S_0_5), .B((A[1] & B[4])), .YS(S_1_4), .YC(C_1_4));
  PDKGENHAX1 U13614 (.A(S_0_6), .B((A[1] & B[5])), .YS(S_1_5), .YC(C_1_5));
  PDKGENHAX1 U13615 (.A(S_0_7), .B((A[1] & B[6])), .YS(S_1_6), .YC(C_1_6));
  assign S_1_7 = (A[1] & B[7]);
  PDKGENFAX1 U13617 (.A(S_1_1), .B(C_1_0), .C((A[2] & B[0])), .YS(S_2_0), .YC(C_2_0));
  PDKGENFAX1 U13618 (.A(S_1_2), .B(C_1_1), .C((A[2] & B[1])), .YS(S_2_1), .YC(C_2_1));
  PDKGENFAX1 U13619 (.A(S_1_3), .B(C_1_2), .C((A[2] & B[2])), .YS(S_2_2), .YC(C_2_2));
  PDKGENFAX1 U13620 (.A(S_1_4), .B(C_1_3), .C((A[2] & B[3])), .YS(S_2_3), .YC(C_2_3));
  PDKGENFAX1 U13621 (.A(S_1_5), .B(C_1_4), .C((A[2] & B[4])), .YS(S_2_4), .YC(C_2_4));
  PDKGENFAX1 U13622 (.A(S_1_6), .B(C_1_5), .C((A[2] & B[5])), .YS(S_2_5), .YC(C_2_5));
  PDKGENFAX1 U13623 (.A(S_1_7), .B(C_1_6), .C((A[2] & B[6])), .YS(S_2_6), .YC(C_2_6));
  assign S_2_7 = (A[2] & B[7]);
  PDKGENFAX1 U13625 (.A(S_2_1), .B(C_2_0), .C((A[3] & B[0])), .YS(S_3_0), .YC(C_3_0));
  PDKGENFAX1 U13626 (.A(S_2_2), .B(C_2_1), .C((A[3] & B[1])), .YS(S_3_1), .YC(C_3_1));
  PDKGENFAX1 U13627 (.A(S_2_3), .B(C_2_2), .C((A[3] & B[2])), .YS(S_3_2), .YC(C_3_2));
  PDKGENFAX1 U13628 (.A(S_2_4), .B(C_2_3), .C((A[3] & B[3])), .YS(S_3_3), .YC(C_3_3));
  PDKGENFAX1 U13629 (.A(S_2_5), .B(C_2_4), .C((A[3] & B[4])), .YS(S_3_4), .YC(C_3_4));
  PDKGENFAX1 U13630 (.A(S_2_6), .B(C_2_5), .C((A[3] & B[5])), .YS(S_3_5), .YC(C_3_5));
  PDKGENFAX1 U13631 (.A(S_2_7), .B(C_2_6), .C((A[3] & B[6])), .YS(S_3_6), .YC(C_3_6));
  assign S_3_7 = (A[3] & B[7]);
  PDKGENFAX1 U13633 (.A(S_3_1), .B(C_3_0), .C((A[4] & B[0])), .YS(S_4_0), .YC(C_4_0));
  PDKGENFAX1 U13634 (.A(S_3_2), .B(C_3_1), .C((A[4] & B[1])), .YS(S_4_1), .YC(C_4_1));
  PDKGENFAX1 U13635 (.A(S_3_3), .B(C_3_2), .C((A[4] & B[2])), .YS(S_4_2), .YC(C_4_2));
  PDKGENFAX1 U13636 (.A(S_3_4), .B(C_3_3), .C((A[4] & B[3])), .YS(S_4_3), .YC(C_4_3));
  PDKGENFAX1 U13637 (.A(S_3_5), .B(C_3_4), .C((A[4] & B[4])), .YS(S_4_4), .YC(C_4_4));
  PDKGENFAX1 U13638 (.A(S_3_6), .B(C_3_5), .C((A[4] & B[5])), .YS(S_4_5), .YC(C_4_5));
  PDKGENFAX1 U13639 (.A(S_3_7), .B(C_3_6), .C((A[4] & B[6])), .YS(S_4_6), .YC(C_4_6));
  assign S_4_7 = (A[4] & B[7]);
  PDKGENFAX1 U13641 (.A(S_4_1), .B(C_4_0), .C((A[5] & B[0])), .YS(S_5_0), .YC(C_5_0));
  PDKGENFAX1 U13642 (.A(S_4_2), .B(C_4_1), .C((A[5] & B[1])), .YS(S_5_1), .YC(C_5_1));
  PDKGENFAX1 U13643 (.A(S_4_3), .B(C_4_2), .C((A[5] & B[2])), .YS(S_5_2), .YC(C_5_2));
  PDKGENFAX1 U13644 (.A(S_4_4), .B(C_4_3), .C((A[5] & B[3])), .YS(S_5_3), .YC(C_5_3));
  PDKGENFAX1 U13645 (.A(S_4_5), .B(C_4_4), .C((A[5] & B[4])), .YS(S_5_4), .YC(C_5_4));
  PDKGENFAX1 U13646 (.A(S_4_6), .B(C_4_5), .C((A[5] & B[5])), .YS(S_5_5), .YC(C_5_5));
  PDKGENFAX1 U13647 (.A(S_4_7), .B(C_4_6), .C((A[5] & B[6])), .YS(S_5_6), .YC(C_5_6));
  assign S_5_7 = (A[5] & B[7]);
  PDKGENFAX1 U13649 (.A(S_5_1), .B(C_5_0), .C((A[6] & B[0])), .YS(S_6_0), .YC(C_6_0));
  PDKGENFAX1 U13650 (.A(S_5_2), .B(C_5_1), .C((A[6] & B[1])), .YS(S_6_1), .YC(C_6_1));
  PDKGENFAX1 U13651 (.A(S_5_3), .B(C_5_2), .C((A[6] & B[2])), .YS(S_6_2), .YC(C_6_2));
  PDKGENFAX1 U13652 (.A(S_5_4), .B(C_5_3), .C((A[6] & B[3])), .YS(S_6_3), .YC(C_6_3));
  PDKGENFAX1 U13653 (.A(S_5_5), .B(C_5_4), .C((A[6] & B[4])), .YS(S_6_4), .YC(C_6_4));
  PDKGENFAX1 U13654 (.A(S_5_6), .B(C_5_5), .C((A[6] & B[5])), .YS(S_6_5), .YC(C_6_5));
  PDKGENFAX1 U13655 (.A(S_5_7), .B(C_5_6), .C((A[6] & B[6])), .YS(S_6_6), .YC(C_6_6));
  assign S_6_7 = (A[6] & B[7]);
  PDKGENFAX1 U13657 (.A(S_6_1), .B(C_6_0), .C((A[7] & B[0])), .YS(S_7_0), .YC(C_7_0));
  PDKGENFAX1 U13658 (.A(S_6_2), .B(C_6_1), .C((A[7] & B[1])), .YS(S_7_1), .YC(C_7_1));
  PDKGENFAX1 U13659 (.A(S_6_3), .B(C_6_2), .C((A[7] & B[2])), .YS(S_7_2), .YC(C_7_2));
  PDKGENFAX1 U13660 (.A(S_6_4), .B(C_6_3), .C((A[7] & B[3])), .YS(S_7_3), .YC(C_7_3));
  PDKGENFAX1 U13661 (.A(S_6_5), .B(C_6_4), .C((A[7] & B[4])), .YS(S_7_4), .YC(C_7_4));
  PDKGENFAX1 U13662 (.A(S_6_6), .B(C_6_5), .C((A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  PDKGENFAX1 U13663 (.A(S_6_7), .B(C_6_6), .C((A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  assign S_7_7 = (A[7] & B[7]);
  assign {S_8_7, S_8_6, S_8_5, S_8_4, S_8_3, S_8_2, S_8_1, S_8_0} = {C_7_6, C_7_5, C_7_4, C_7_3, C_7_2, C_7_1, C_7_0} + {S_7_7, S_7_6, S_7_5, S_7_4, S_7_3, S_7_2, S_7_1};
  assign O = {S_8_7,S_8_6,S_8_5,S_8_4,S_8_3,S_8_2,S_8_1,S_8_0,S_7_0,S_6_0,S_5_0,S_4_0,S_3_0,S_2_0,S_1_0,S_0_0};

endmodule
module CLA32bit(a,b,c_in,sum,c_out);

input [31:0]a,b;
input c_in;
output [31:0]sum;
output c_out;

wire [31:0] sum_out,  p,  g;
wire [7:0] PPP, GGG;
wire [8:0] CC;

assign p[31:0] = a[31:0] ^ b[31:0];
assign g[31:0] = a[31:0] & b[31:0];

assign PPP[0]= p [3] & p [2] & p [1] & p [0];
assign PPP[1]= p [7] & p [6] & p [5] & p [4];
assign PPP[2]= p[11] & p[10] & p [9] & p [8];
assign PPP[3]= p[15] & p[14] & p[13] & p[12];
assign PPP[4]= p[19] & p[18] & p[17] & p[16];
assign PPP[5]= p[23] & p[22] & p[21] & p[20];
assign PPP[6]= p[27] & p[26] & p[25] & p[24];
assign PPP[7]= p[31] & p[30] & p[29] & p[28];

assign GGG[0]= g[3]  | (p [3] & g [2])  | (p [3] & p [2] & g [1])  | (p [3] & p [2] & p [1] & g [0]) ;
assign GGG[1]= g[7]  | (p [7] & g [6])  | (p [7] & p [6] & g [5])  | (p [7] & p [6] & p [5] & g [4]);
assign GGG[2]= g[11] | (p[11] & g[10])  | (p[11] & p[10] & g [9])  | (p[11] & p[10] & p [9] & g [8]);
assign GGG[3]= g[15] | (p[15] & g[14])  | (p[15] & p[14] & g[13])  | (p[15] & p[14] & p[13] & g[12]);
assign GGG[4]= g[19] | (p[19] & g[18])  | (p[19] & p[18] & g[17])  | (p[19] & p[18] & p[17] & g[16]);
assign GGG[5]= g[23] | (p[23] & g[22])  | (p[23] & p[22] & g[21])  | (p[23] & p[22] & p[21] & g[20]);
assign GGG[6]= g[27] | (p[27] & g[26])  | (p[27] & p[26] & g[25])  | (p[27] & p[26] & p[25] & g[24]);
assign GGG[7]= g[31] | (p[31] & g[30])  | (p[31] & p[30] & g[29])  | (p[31] & p[30] & p[29] & g[28]);
assign CC[0] = c_in;
assign CC[1] = GGG[0]  |  PPP[0]&  CC[0];
assign CC[2] = GGG[1]  |  PPP[1]&GGG[0]  |  PPP[1]&PPP[0]&  CC[0];
assign CC[3] = GGG[2]  |  PPP[2]&GGG[1]  |  PPP[2]&PPP[1]&GGG[0]  |  PPP[2]&PPP[1]&PPP[0]&  CC[0];
assign CC[4] = GGG[3]  |  PPP[3]&GGG[2]  |  PPP[3]&PPP[2]&GGG[1]  |  PPP[3]&PPP[2]&PPP[1]&GGG[0]  |  PPP[3]&PPP[2]&PPP[1]&PPP[0]&  CC[0];
assign CC[5] = GGG[4]  |  PPP[4]&GGG[3]  |  PPP[4]&PPP[3]&GGG[2]  |  PPP[4]&PPP[3]&PPP[2]&GGG[1]  |  PPP[4]&PPP[3]&PPP[2]&PPP[1]&GGG[0] |  PPP[4]&PPP[3]&PPP[2]&PPP[1]&PPP[0]&  CC[0];
assign CC[6] = GGG[5]  |  PPP[5]&GGG[4]  |  PPP[5]&PPP[4]&GGG[3]  |  PPP[5]&PPP[4]&PPP[3]&GGG[2]  |  PPP[5]&PPP[4]&PPP[3]&PPP[2]&GGG[1] |  PPP[5]&PPP[4]&PPP[3]&PPP[2]&PPP[1]&GGG[0] |  PPP[5]&PPP[4]&PPP[3]&PPP[2]&PPP[1]&PPP[0]& CC[0];
assign CC[7] = GGG[6]  | PPP[6]&GGG[5]  |  PPP[6]&PPP[5]&GGG[4]  |  PPP[6]&PPP[5]&PPP[4]&GGG[3]  |  PPP[6]&PPP[5]&PPP[4]&PPP[3]&GGG[2]  |  PPP[6]&PPP[5]&PPP[4]&PPP[3]&PPP[2]&GGG[1] |  PPP[6]&PPP[5]&PPP[4]&PPP[3]&PPP[2]&PPP[1]&GGG[0] |  PPP[6]&PPP[5]&PPP[4]&PPP[3]&PPP[2]&PPP[1]&PPP[0] & CC[0];
assign CC[8] = GGG[7] | PPP[7]&GGG[6]  | PPP[7]&PPP[6]&GGG[5]  |  PPP[7]&PPP[6]&PPP[5]&GGG[4]  |  PPP[7]&PPP[6]&PPP[5]&PPP[4]&GGG[3]  |  PPP[7]&PPP[6]&PPP[5]&PPP[4]&PPP[3]&GGG[2]  |  PPP[7]&PPP[6]&PPP[5]&PPP[4]&PPP[3]&PPP[2]&GGG[1] |  PPP[7]&PPP[6]&PPP[5]&PPP[4]&PPP[3]&PPP[2]&PPP[1]&GGG[0] |  PPP[7]&PPP[6]&PPP[5]&PPP[4]&PPP[3]&PPP[2]&PPP[1]&PPP[0] & CC[0];
cla_4bit cla4bit1(.aa(a  [3:0]),  .bb(b  [3:0]),  .cin(CC[0]),   .pp(p  [3:0]),  .gg(g  [3:0]),   .summ(sum  [3:0]));
cla_4bit cla4bit2(.aa(a  [7:4]),  .bb(b  [7:4]),  .cin(CC[1]),   .pp(p  [7:4]),  .gg(g  [7:4]),   .summ(sum  [7:4]));
cla_4bit cla4bit3(.aa(a [11:8]),  .bb(b [11:8]),  .cin(CC[2]),   .pp(p [11:8]),  .gg(g [11:8]),   .summ(sum [11:8]));
cla_4bit cla4bit4(.aa(a[15:12]),  .bb(b[15:12]),  .cin(CC[3]),   .pp(p[15:12]),  .gg(g[15:12]),   .summ(sum[15:12]));
cla_4bit cla4bit5(.aa(a[19:16]),  .bb(b[19:16]),  .cin(CC[4]),   .pp(p[19:16]),  .gg(g[19:16]),   .summ(sum[19:16]));
cla_4bit cla4bit6(.aa(a[23:20]),  .bb(b[23:20]),  .cin(CC[5]),   .pp(p[23:20]),  .gg(g[23:20]),   .summ(sum[23:20]));
cla_4bit cla4bit7(.aa(a[27:24]),  .bb(b[27:24]),  .cin(CC[6]),   .pp(p[27:24]),  .gg(g[27:24]),   .summ(sum[27:24]));
cla_4bit cla4bit8(.aa(a[31:28]),  .bb(b[31:28]),  .cin(CC[7]),   .pp(p[31:28]),  .gg(g[31:28]),   .summ(sum[31:28]));

assign c_out=CC[8];

endmodule
module cla_4bit(aa,bb,cin,summ,pp,gg);
input  [3:0] aa,bb,pp,gg;  
input cin;
output [3:0] summ;

wire [3:0] c;

   assign c[0] = cin;
   assign c[1] = gg[0] | (pp[0] & c[0]);
   assign c[2] = gg[1] | (pp[1] & gg[0]) | (pp[1] & pp[0] & c[0]);
   assign c[3] = gg[2] | (pp[2] & gg[1]) | (pp[2] & pp[1] & gg[0])| (pp[2] & pp[1] & pp[0] & c[0]);

   assign summ[3:0] = pp[3:0]  ^  c[3:0];
endmodule

`timescale 1ns/100ps
module mul16u_679 ( input[15:0] A,
                   input[15:0] B,
                   output [31:0] O
                 );

wire [15:0] ll,lh,hl,hh;
wire [31:0] llhhlh_sum;
wire [31:0] shifted_llhh, shifted_lh, shifted_hl;

localparam MAX1 = 15;
localparam MIN1 = 8;

localparam MAX2 = 7;
localparam MIN2 = 0;

mult8_cgp14zr_wc1925_rcam LxL (.A(A[MAX2:MIN2]), .B(B[MAX2:MIN2]), .O(ll));
trun8_tam00b HxL (.A(A[MAX1:MIN1]), .B(B[MAX2:MIN2]), .O(hl));
mult8_cgp14ep_ep63078_wc1_csamcsa LxH (.A(A[MAX2:MIN2]), .B(B[MAX1:MIN1]), .O(lh));
trun8_tam00b HxH (.A(A[MAX1:MIN1]), .B(B[MAX1:MIN1]), .O(hh));

assign shifted_llhh = { hh, ll }; 
assign shifted_lh = { {8{1'b0}}, lh, {8{1'b0}}}; 
assign shifted_hl = { {8{1'b0}}, hl, {8{1'b0}}};
CLA32bit LLHHLH (.a(shifted_llhh), .b(shifted_lh), .c_in(1'b0), .sum(llhhlh_sum), .c_out());
CLA32bit SUMO (.a(llhhlh_sum), .b(shifted_hl), .c_in(1'b0), .sum(O), .c_out());

endmodule


/* mod */
module PDKGENFAX1( input A, input B, input C, output YS, output YC );
    assign YS = (A ^ B) ^ C;
    assign YC = (A & B) | (B & C) | (A & C);
endmodule
/* mod */
module PDKGENHAX1( input A, input B, output YS, output YC );
    assign YS = A ^ B;
    assign YC = A & B;
endmodule
