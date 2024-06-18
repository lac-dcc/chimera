// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, R. Hrbacek, Z. Vasicek and L. Sekanina, "EvoApprox8b: Library of approximate adders and multipliers for circuit design and benchmarking of approximation methods". Design, Automation & Test in Europe Conference & Exhibition (DATE), 2017, Lausanne, 2017, pp. 258-261. doi: 10.23919/DATE.2017.7926993 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.18 %
// MAE = 119 
// WCE% = 0.79 %
// WCE = 518 
// WCRE% = 125.00 %
// EP% = 98.05 %
// MRE% = 4.16 %
// MSE = 22286 
// PDK45_PWR = 0.206 mW
// PDK45_AREA = 427.5 um2
// PDK45_DELAY = 1.41 ns

module mul8u_185Q (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [15:0] O;

wire sig_17,sig_30,sig_39,sig_59,sig_62,sig_63,sig_72,sig_73,sig_81,sig_98,sig_100,sig_101,sig_104,sig_106,sig_107,sig_108,sig_109,sig_110,sig_115,sig_116;
wire sig_117,sig_118,sig_136,sig_141,sig_142,sig_143,sig_144,sig_145,sig_146,sig_147,sig_148,sig_149,sig_150,sig_151,sig_152,sig_153,sig_154,sig_155,sig_160,sig_161;
wire sig_162,sig_163,sig_167,sig_177,sig_179,sig_180,sig_181,sig_182,sig_183,sig_184,sig_185,sig_186,sig_187,sig_188,sig_189,sig_190,sig_191,sig_192,sig_193,sig_194;
wire sig_195,sig_196,sig_197,sig_198,sig_199,sig_200,sig_202,sig_204,sig_205,sig_206,sig_207,sig_208,sig_221,sig_222,sig_223,sig_224,sig_225,sig_226,sig_227,sig_228;
wire sig_229,sig_230,sig_231,sig_232,sig_233,sig_234,sig_235,sig_236,sig_237,sig_238,sig_239,sig_240,sig_241,sig_242,sig_243,sig_244,sig_245,sig_247,sig_248,sig_249;
wire sig_250,sig_251,sig_252,sig_253,sig_259,sig_260,sig_261,sig_262,sig_264,sig_265,sig_266,sig_267,sig_268,sig_269,sig_270,sig_271,sig_272,sig_273,sig_274,sig_275;
wire sig_276,sig_277,sig_278,sig_279,sig_280,sig_281,sig_282,sig_283,sig_284,sig_285,sig_286,sig_287,sig_288,sig_289,sig_290,sig_291,sig_292,sig_293,sig_294,sig_295;
wire sig_296,sig_297,sig_298,sig_299,sig_300,sig_301,sig_302,sig_303,sig_304,sig_305,sig_306,sig_307,sig_308,sig_309,sig_310,sig_311,sig_312,sig_313,sig_314,sig_315;
wire sig_316,sig_317,sig_318,sig_319,sig_320,sig_321,sig_322,sig_323,sig_324,sig_325,sig_326,sig_327,sig_328,sig_329,sig_330,sig_331,sig_332,sig_333,sig_334,sig_335;

assign sig_17 = B[7] & A[1];
assign sig_30 = B[6] & A[1];
assign sig_39 = ~sig_17;
assign sig_59 = A[3] | sig_30;
assign sig_62 = sig_59 ^ A[3];
assign sig_63 = A[0] & sig_17;
assign sig_72 = B[6] & A[2];
assign sig_73 = B[7] & A[2];
assign sig_81 = ~(A[0] | sig_39);
assign sig_98 = sig_62 & A[2];
assign sig_100 = A[2] & sig_98;
assign sig_101 = sig_81 | sig_72;
assign sig_104 = sig_101 ^ sig_98;
assign sig_106 = sig_63 ^ sig_73;
assign sig_107 = sig_63 & A[2];
assign sig_108 = B[7] & sig_100;
assign sig_109 = sig_106 ^ sig_100;
assign sig_110 = sig_107 | sig_108;
assign sig_115 = B[4] & A[3];
assign sig_116 = B[5] & A[3];
assign sig_117 = B[6] & A[3];
assign sig_118 = B[7] & A[3];
assign sig_136 = sig_117 | sig_115;
assign sig_141 = sig_104 ^ sig_116;
assign sig_142 = sig_101 & sig_116;
assign sig_143 = sig_115 & sig_72;
assign sig_144 = sig_141 ^ sig_143;
assign sig_145 = sig_142 | sig_143;
assign sig_146 = sig_109 ^ sig_117;
assign sig_147 = sig_109 & sig_117;
assign sig_148 = sig_146 & sig_145;
assign sig_149 = sig_146 ^ sig_145;
assign sig_150 = sig_147 | sig_148;
assign sig_151 = sig_110 ^ sig_118;
assign sig_152 = sig_110 & A[3];
assign sig_153 = sig_151 & sig_150;
assign sig_154 = sig_151 ^ sig_150;
assign sig_155 = sig_152 | sig_153;
assign sig_160 = B[4] & A[4];
assign sig_161 = B[5] & A[4];
assign sig_162 = B[6] & A[4];
assign sig_163 = B[7] & A[4];
assign sig_167 = B[5] & A[2];
assign sig_177 = A[4] & B[3];
assign sig_179 = sig_136 | sig_167;
assign sig_180 = sig_177 | sig_142;
assign sig_181 = sig_144 ^ sig_160;
assign sig_182 = sig_144 & sig_160;
assign sig_183 = sig_181 & sig_180;
assign sig_184 = sig_181 ^ sig_180;
assign sig_185 = sig_182 | sig_183;
assign sig_186 = sig_149 ^ sig_161;
assign sig_187 = sig_149 & sig_161;
assign sig_188 = sig_186 & sig_185;
assign sig_189 = sig_186 ^ sig_185;
assign sig_190 = sig_187 | sig_188;
assign sig_191 = sig_154 ^ sig_162;
assign sig_192 = sig_154 & sig_162;
assign sig_193 = sig_191 & sig_190;
assign sig_194 = sig_191 ^ sig_190;
assign sig_195 = sig_192 | sig_193;
assign sig_196 = sig_155 ^ sig_163;
assign sig_197 = sig_155 & A[4];
assign sig_198 = B[7] & sig_195;
assign sig_199 = sig_196 ^ sig_195;
assign sig_200 = sig_197 | sig_198;
assign sig_202 = B[2] & A[5];
assign sig_204 = B[3] & A[5];
assign sig_205 = B[4] & A[5];
assign sig_206 = B[5] & A[5];
assign sig_207 = B[6] & A[5];
assign sig_208 = B[7] & A[5];
assign sig_221 = sig_184 ^ sig_204;
assign sig_222 = sig_184 & sig_204;
assign sig_223 = sig_221 & sig_179;
assign sig_224 = sig_221 ^ sig_179;
assign sig_225 = sig_222 | sig_223;
assign sig_226 = sig_189 ^ sig_205;
assign sig_227 = sig_189 & sig_205;
assign sig_228 = sig_226 & sig_225;
assign sig_229 = sig_226 ^ sig_225;
assign sig_230 = sig_227 | sig_228;
assign sig_231 = sig_194 ^ sig_206;
assign sig_232 = sig_194 & sig_206;
assign sig_233 = sig_231 & sig_230;
assign sig_234 = sig_231 ^ sig_230;
assign sig_235 = sig_232 | sig_233;
assign sig_236 = sig_199 ^ sig_207;
assign sig_237 = sig_199 & sig_207;
assign sig_238 = sig_236 & sig_235;
assign sig_239 = sig_236 ^ sig_235;
assign sig_240 = sig_237 | sig_238;
assign sig_241 = sig_200 ^ sig_208;
assign sig_242 = sig_200 & sig_208;
assign sig_243 = sig_241 & sig_240;
assign sig_244 = sig_241 ^ sig_240;
assign sig_245 = sig_242 | sig_243;
assign sig_247 = B[1] & A[6];
assign sig_248 = B[2] & A[6];
assign sig_249 = B[3] & A[6];
assign sig_250 = B[4] & A[6];
assign sig_251 = B[5] & A[6];
assign sig_252 = B[6] & A[6];
assign sig_253 = B[7] & A[6];
assign sig_259 = sig_247 | sig_202;
assign sig_260 = sig_247 & sig_202;
assign sig_261 = sig_224 ^ sig_248;
assign sig_262 = sig_224 & sig_248;
assign sig_264 = sig_261 ^ sig_260;
assign sig_265 = sig_262 | sig_260;
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
assign sig_286 = sig_245 ^ sig_253;
assign sig_287 = sig_245 & A[6];
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
assign sig_299 = sig_259 | sig_291;
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
assign O[6] = sig_162;
assign O[5] = sig_304;
assign O[4] = sig_110;
assign O[3] = 1'b0;
assign O[2] = sig_290;
assign O[1] = sig_147;
assign O[0] = 1'b0;

endmodule


