/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, R. Hrbacek, Z. Vasicek and L. Sekanina, "EvoApprox8b: Library of approximate adders and multipliers for circuit design and benchmarking of approximation methods". Design, Automation & Test in Europe Conference & Exhibition (DATE), 2017, Lausanne, 2017, pp. 258-261. doi: 10.23919/DATE.2017.7926993 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and ep parameters
***/
// MAE% = 0.65 %
// MAE = 426 
// WCE% = 6.23 %
// WCE = 4084 
// WCRE% = 65.98 %
// EP% = 65.97 %
// MRE% = 4.05 %
// MSE = 645336 
// PDK45_PWR = 0.237 mW
// PDK45_AREA = 479.2 um2
// PDK45_DELAY = 1.59 ns

module mul8u_1CMB (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [15:0] O;

wire sig_16,sig_17,sig_18,sig_19,sig_20,sig_21,sig_22,sig_23,sig_24,sig_25,sig_26,sig_27,sig_28,sig_29,sig_30,sig_31,sig_32,sig_33,sig_34,sig_37;
wire sig_42,sig_44,sig_49,sig_54,sig_59,sig_67,sig_68,sig_69,sig_70,sig_71,sig_72,sig_73,sig_76,sig_81,sig_86,sig_87,sig_91,sig_94,sig_96,sig_101;
wire sig_111,sig_112,sig_113,sig_115,sig_116,sig_117,sig_118,sig_119,sig_121,sig_126,sig_136,sig_141,sig_146,sig_156,sig_157,sig_158,sig_159,sig_160,sig_161,sig_162;
wire sig_163,sig_164,sig_165,sig_166,sig_167,sig_169,sig_171,sig_172,sig_173,sig_174,sig_175,sig_176,sig_177,sig_178,sig_179,sig_180,sig_181,sig_183,sig_184,sig_186;
wire sig_189,sig_191,sig_201,sig_202,sig_203,sig_204,sig_205,sig_206,sig_207,sig_208,sig_209,sig_210,sig_211,sig_212,sig_214,sig_215,sig_216,sig_217,sig_218,sig_219;
wire sig_220,sig_221,sig_222,sig_223,sig_224,sig_225,sig_226,sig_227,sig_228,sig_229,sig_230,sig_231,sig_232,sig_233,sig_234,sig_235,sig_236,sig_237,sig_238,sig_239;
wire sig_240,sig_243,sig_244,sig_246,sig_247,sig_248,sig_249,sig_250,sig_251,sig_252,sig_253,sig_254,sig_255,sig_256,sig_257,sig_258,sig_259,sig_260,sig_261,sig_262;
wire sig_263,sig_264,sig_265,sig_266,sig_267,sig_268,sig_269,sig_270,sig_271,sig_272,sig_273,sig_274,sig_275,sig_276,sig_277,sig_278,sig_279,sig_280,sig_281,sig_282;
wire sig_283,sig_284,sig_285,sig_286,sig_287,sig_288,sig_289,sig_290,sig_291,sig_292,sig_293,sig_294,sig_295,sig_296,sig_297,sig_298,sig_299,sig_300,sig_301,sig_302;
wire sig_303,sig_304,sig_305,sig_306,sig_307,sig_308,sig_309,sig_310,sig_311,sig_312,sig_313,sig_314,sig_315,sig_316,sig_317,sig_318,sig_319,sig_320,sig_321,sig_322;
wire sig_323,sig_324,sig_325,sig_326,sig_327,sig_328,sig_329,sig_330,sig_331,sig_332,sig_333,sig_334,sig_335;

assign sig_16 = B[0] & A[0];
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
assign sig_33 = A[2] & B[0];
assign sig_34 = sig_18 | sig_25;
assign sig_37 = sig_34 | sig_33;
assign sig_42 = sig_26 | sig_19;
assign sig_44 = sig_20 | sig_27;
assign sig_49 = sig_21 | sig_28;
assign sig_54 = sig_22 | sig_29;
assign sig_59 = sig_23 | sig_30;
assign sig_67 = B[1] & A[2];
assign sig_68 = B[2] & A[2];
assign sig_69 = B[3] & A[2];
assign sig_70 = B[4] & A[2];
assign sig_71 = B[5] & A[2];
assign sig_72 = B[6] & A[2];
assign sig_73 = B[7] & A[2];
assign sig_76 = sig_42 | sig_67;
assign sig_81 = sig_44 | sig_68;
assign sig_86 = sig_49 | sig_69;
assign sig_87 = A[3] & B[3];
assign sig_91 = sig_54 | sig_70;
assign sig_94 = sig_91 | sig_87;
assign sig_96 = sig_59 | sig_71;
assign sig_101 = sig_31 | sig_72;
assign sig_111 = B[0] & A[3];
assign sig_112 = B[1] & A[3];
assign sig_113 = B[2] & A[3];
assign sig_115 = B[4] & A[3];
assign sig_116 = B[5] & A[3];
assign sig_117 = B[6] & A[3];
assign sig_118 = B[7] & A[3];
assign sig_119 = sig_76 | sig_111;
assign sig_121 = sig_81 | sig_112;
assign sig_126 = sig_86 | sig_113;
assign sig_136 = sig_96 | sig_115;
assign sig_141 = sig_101 | sig_116;
assign sig_146 = sig_73 | sig_117;
assign sig_156 = B[0] & A[4];
assign sig_157 = B[1] & A[4];
assign sig_158 = B[2] & A[4];
assign sig_159 = B[3] & A[4];
assign sig_160 = B[4] & A[4];
assign sig_161 = B[5] & A[4];
assign sig_162 = B[6] & A[4];
assign sig_163 = B[7] & A[4];
assign sig_164 = sig_121 ^ sig_156;
assign sig_165 = sig_121 & sig_156;
assign sig_166 = sig_126 ^ sig_157;
assign sig_167 = sig_126 & sig_157;
assign sig_169 = sig_166 | sig_165;
assign sig_171 = sig_94 ^ sig_158;
assign sig_172 = sig_94 & sig_158;
assign sig_173 = sig_171 & sig_167;
assign sig_174 = sig_171 ^ sig_167;
assign sig_175 = sig_172 | sig_173;
assign sig_176 = sig_136 ^ sig_159;
assign sig_177 = sig_136 & sig_159;
assign sig_178 = sig_176 & sig_175;
assign sig_179 = sig_176 ^ sig_175;
assign sig_180 = sig_177 | sig_178;
assign sig_181 = sig_141 | sig_160;
assign sig_183 = sig_160 & sig_180;
assign sig_184 = sig_181 ^ sig_180;
assign sig_186 = sig_146 | sig_161;
assign sig_189 = sig_186 | sig_183;
assign sig_191 = sig_118 | sig_162;
assign sig_201 = B[0] & A[5];
assign sig_202 = B[1] & A[5];
assign sig_203 = B[2] & A[5];
assign sig_204 = B[3] & A[5];
assign sig_205 = B[4] & A[5];
assign sig_206 = B[5] & A[5];
assign sig_207 = B[6] & A[5];
assign sig_208 = B[7] & A[5];
assign sig_209 = sig_169 ^ sig_201;
assign sig_210 = sig_169 & sig_201;
assign sig_211 = sig_174 ^ sig_202;
assign sig_212 = sig_174 & sig_202;
assign sig_214 = sig_211 ^ sig_210;
assign sig_215 = sig_212 | sig_210;
assign sig_216 = sig_179 ^ sig_203;
assign sig_217 = sig_179 & sig_203;
assign sig_218 = sig_216 & sig_215;
assign sig_219 = sig_216 ^ sig_215;
assign sig_220 = sig_217 | sig_218;
assign sig_221 = sig_184 ^ sig_204;
assign sig_222 = sig_184 & sig_204;
assign sig_223 = sig_221 & sig_220;
assign sig_224 = sig_221 ^ sig_220;
assign sig_225 = sig_222 | sig_223;
assign sig_226 = sig_189 ^ sig_205;
assign sig_227 = sig_189 & sig_205;
assign sig_228 = sig_226 & sig_225;
assign sig_229 = sig_226 ^ sig_225;
assign sig_230 = sig_227 | sig_228;
assign sig_231 = sig_191 ^ sig_206;
assign sig_232 = sig_191 & sig_206;
assign sig_233 = sig_231 & sig_230;
assign sig_234 = sig_231 ^ sig_230;
assign sig_235 = sig_232 | sig_233;
assign sig_236 = sig_163 ^ sig_207;
assign sig_237 = sig_163 & sig_207;
assign sig_238 = sig_236 & sig_235;
assign sig_239 = sig_236 ^ sig_235;
assign sig_240 = sig_237 | sig_238;
assign sig_243 = sig_208 & sig_240;
assign sig_244 = sig_208 ^ sig_240;
assign sig_246 = B[0] & A[6];
assign sig_247 = B[1] & A[6];
assign sig_248 = B[2] & A[6];
assign sig_249 = B[3] & A[6];
assign sig_250 = B[4] & A[6];
assign sig_251 = B[5] & A[6];
assign sig_252 = B[6] & A[6];
assign sig_253 = B[7] & A[6];
assign sig_254 = sig_214 ^ sig_246;
assign sig_255 = sig_214 & sig_246;
assign sig_256 = sig_219 ^ sig_247;
assign sig_257 = sig_219 & sig_247;
assign sig_258 = sig_256 & sig_255;
assign sig_259 = sig_256 ^ sig_255;
assign sig_260 = sig_257 | sig_258;
assign sig_261 = sig_224 ^ sig_248;
assign sig_262 = sig_224 & sig_248;
assign sig_263 = sig_261 & sig_260;
assign sig_264 = sig_261 ^ sig_260;
assign sig_265 = sig_262 | sig_263;
assign sig_266 = sig_229 ^ sig_249;
assign sig_267 = sig_229 & sig_249;
assign sig_268 = sig_266 & sig_265;
assign sig_269 = sig_266 ^ sig_265;
assign sig_270 = sig_267 | sig_268;
assign sig_271 = sig_234 ^ sig_250;
assign sig_272 = sig_234 & sig_250;
assign sig_273 = sig_271 & sig_270;
assign sig_274 = sig_271 ^ sig_270;
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
assign sig_286 = sig_243 ^ sig_253;
assign sig_287 = sig_243 & A[6];
assign sig_288 = sig_253 & sig_285;
assign sig_289 = sig_286 ^ sig_285;
assign sig_290 = sig_287 | sig_288;
assign sig_291 = B[0] & A[7];
assign sig_292 = B[1] & A[7];
assign sig_293 = B[2] & A[7];
assign sig_294 = B[3] & A[7];
assign sig_295 = B[4] & A[7];
assign sig_296 = B[5] & A[7];
assign sig_297 = B[6] & A[7];
assign sig_298 = B[7] & A[7];
assign sig_299 = sig_259 ^ sig_291;
assign sig_300 = sig_259 & sig_291;
assign sig_301 = sig_264 ^ sig_292;
assign sig_302 = sig_264 & sig_292;
assign sig_303 = sig_301 & sig_300;
assign sig_304 = sig_301 ^ sig_300;
assign sig_305 = sig_302 | sig_303;
assign sig_306 = sig_269 ^ sig_293;
assign sig_307 = sig_269 & sig_293;
assign sig_308 = sig_306 & sig_305;
assign sig_309 = sig_306 ^ sig_305;
assign sig_310 = sig_307 | sig_308;
assign sig_311 = sig_274 ^ sig_294;
assign sig_312 = sig_274 & sig_294;
assign sig_313 = sig_311 & sig_310;
assign sig_314 = sig_311 ^ sig_310;
assign sig_315 = sig_312 | sig_313;
assign sig_316 = sig_279 ^ sig_295;
assign sig_317 = sig_279 & sig_295;
assign sig_318 = sig_316 & sig_315;
assign sig_319 = sig_316 ^ sig_315;
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
assign sig_333 = B[7] & sig_330;
assign sig_334 = sig_331 ^ sig_330;
assign sig_335 = sig_332 | sig_333;

assign O[15] = sig_335;
assign O[14] = sig_334;
assign O[13] = sig_329;
assign O[12] = sig_324;
assign O[11] = sig_319;
assign O[10] = sig_314;
assign O[9] = sig_309;
assign O[8] = sig_304;
assign O[7] = sig_299;
assign O[6] = sig_254;
assign O[5] = sig_209;
assign O[4] = sig_164;
assign O[3] = sig_119;
assign O[2] = sig_37;
assign O[1] = sig_32;
assign O[0] = sig_16;

endmodule


