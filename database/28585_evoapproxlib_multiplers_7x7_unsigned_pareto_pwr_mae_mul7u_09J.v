// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, S. S. Sarwar, L. Sekanina, Z. Vasicek and K. Roy, "Design of power-efficient approximate multipliers for approximate artificial neural networks," 2016 IEEE/ACM International Conference on Computer-Aided Design (ICCAD), Austin, TX, 2016, pp. 1-7. doi: 10.1145/2966986.2967021 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.46 %
// MAE = 75 
// WCE% = 1.93 %
// WCE = 317 
// WCRE% = 3100.00 %
// EP% = 97.53 %
// MRE% = 10.12 %
// MSE = 8789 
// PDK45_PWR = 0.123 mW
// PDK45_AREA = 280.2 um2
// PDK45_DELAY = 0.95 ns


module mul7u_09J(A, B, O);
  input [6:0] A, B;
  output [13:0] O;
  wire [6:0] A, B;
  wire [13:0] O;
  wire sig_27, sig_45, sig_46, sig_71, sig_73, sig_75;
  wire sig_76, sig_81, sig_83, sig_103, sig_104, sig_107;
  wire sig_108, sig_109, sig_110, sig_111, sig_112, sig_117;
  wire sig_118, sig_119, sig_120, sig_135, sig_136, sig_137;
  wire sig_138, sig_139, sig_140, sig_141, sig_142, sig_143;
  wire sig_144, sig_145, sig_146, sig_147, sig_149, sig_150;
  wire sig_153, sig_154, sig_155, sig_156, sig_157, sig_167;
  wire sig_168, sig_171, sig_172, sig_173, sig_174, sig_175;
  wire sig_176, sig_177, sig_178, sig_179, sig_180, sig_181;
  wire sig_182, sig_183, sig_184, sig_185, sig_187, sig_189;
  wire sig_190, sig_191, sig_192, sig_193, sig_194, sig_199;
  wire sig_200, sig_203, sig_204, sig_205, sig_206, sig_207;
  wire sig_208, sig_209, sig_210, sig_212, sig_213, sig_214;
  wire sig_215, sig_216, sig_217, sig_218, sig_219, sig_220;
  wire sig_222, sig_223, sig_224, sig_226, sig_227, sig_228;
  wire sig_229, sig_231, sig_232, sig_233, sig_234, sig_236;
  wire sig_237, sig_238, sig_239, sig_241, sig_242, sig_243;
  wire sig_244, sig_245, sig_246, sig_247, sig_248, sig_249;
  wire sig_250, sig_252, sig_253, sig_254, sig_255, sig_256;
  wire sig_257, sig_258, sig_262, sig_263, sig_264, sig_267;
  wire sig_268;
  assign sig_27 = A[6] & B[1];
  assign sig_45 = A[5] & B[2];
  assign sig_46 = A[6] & B[2];
  assign sig_71 = A[4] & B[3];
  assign O[6] = sig_27 | sig_45;
  assign sig_73 = B[1] & sig_45;
  assign sig_75 = O[6];
  assign sig_76 = sig_73 & A[6];
  assign sig_81 = A[4] & B[3];
  assign O[2] = A[5] & B[3];
  assign sig_83 = A[6] & B[3];
  assign sig_103 = B[5] & A[2];
  assign sig_104 = sig_75 ^ sig_81;
  assign sig_107 = sig_104 ^ sig_71;
  assign sig_108 = B[3] & A[4];
  assign sig_109 = sig_46 ^ O[2];
  assign sig_110 = sig_46 & O[2];
  assign sig_111 = B[1] & sig_76;
  assign sig_112 = sig_109 ^ sig_76;
  assign O[5] = sig_110 | sig_111;
  assign sig_117 = A[0] & B[5];
  assign sig_118 = A[3] & B[4];
  assign sig_119 = A[5] & B[4];
  assign sig_120 = A[6] & B[4];
  assign sig_135 = A[2] & B[5];
  assign sig_136 = sig_107 ^ sig_117;
  assign sig_137 = sig_107 & sig_117;
  assign sig_138 = sig_136 & sig_103;
  assign sig_139 = sig_136 ^ sig_103;
  assign sig_140 = sig_137 ^ sig_138;
  assign sig_141 = sig_112 ^ sig_118;
  assign sig_142 = sig_112 & sig_118;
  assign sig_143 = sig_141 & sig_108;
  assign sig_144 = sig_141 ^ sig_108;
  assign sig_145 = sig_142 | sig_143;
  assign sig_146 = sig_83 ^ sig_119;
  assign sig_147 = sig_83 & sig_119;
  assign O[1] = sig_146 & O[5];
  assign sig_149 = sig_146 ^ O[5];
  assign sig_150 = sig_147 ^ O[1];
  assign sig_153 = A[2] & B[5];
  assign sig_154 = A[3] & B[5];
  assign sig_155 = A[4] & B[5];
  assign sig_156 = A[5] & B[5];
  assign sig_157 = A[6] & B[5];
  assign sig_167 = B[6] & A[1];
  assign sig_168 = sig_139 ^ sig_153;
  assign sig_171 = sig_168 ^ sig_135;
  assign sig_172 = B[4] & A[4];
  assign sig_173 = sig_144 ^ sig_154;
  assign sig_174 = sig_144 & sig_154;
  assign sig_175 = sig_173 & sig_140;
  assign sig_176 = sig_173 ^ sig_140;
  assign sig_177 = sig_174 | sig_175;
  assign sig_178 = sig_149 ^ sig_155;
  assign sig_179 = sig_149 & sig_155;
  assign sig_180 = sig_178 & sig_145;
  assign sig_181 = sig_178 ^ sig_145;
  assign sig_182 = sig_179 ^ sig_180;
  assign sig_183 = sig_120 ^ sig_156;
  assign sig_184 = sig_120 & sig_156;
  assign sig_185 = sig_183 & sig_150;
  assign O[0] = sig_183 ^ sig_150;
  assign sig_187 = sig_184 | sig_185;
  assign sig_189 = A[1] & B[6];
  assign sig_190 = A[2] & B[6];
  assign sig_191 = A[3] & B[6];
  assign sig_192 = A[4] & B[6];
  assign sig_193 = A[5] & B[6];
  assign sig_194 = A[6] & B[6];
  assign sig_199 = A[2] & B[0];
  assign sig_200 = sig_171 | sig_189;
  assign sig_203 = sig_200 ^ sig_167;
  assign sig_204 = B[6] & A[1];
  assign sig_205 = sig_176 ^ sig_190;
  assign sig_206 = sig_176 & sig_190;
  assign sig_207 = sig_205 & sig_172;
  assign sig_208 = sig_205 ^ sig_172;
  assign sig_209 = sig_206 | sig_207;
  assign sig_210 = sig_181 ^ sig_191;
  assign O[4] = sig_181 & sig_191;
  assign sig_212 = sig_210 & sig_177;
  assign sig_213 = sig_210 ^ sig_177;
  assign sig_214 = O[4] | sig_212;
  assign sig_215 = O[0] ^ sig_192;
  assign sig_216 = O[0] & sig_192;
  assign sig_217 = sig_215 & sig_182;
  assign sig_218 = sig_215 ^ sig_182;
  assign sig_219 = sig_216 ^ sig_217;
  assign sig_220 = sig_157 ^ sig_193;
  assign O[3] = sig_157 & sig_193;
  assign sig_222 = sig_220 & sig_187;
  assign sig_223 = sig_220 ^ sig_187;
  assign sig_224 = O[3] ^ sig_222;
  assign O[7] = sig_203 ^ sig_199;
  assign sig_226 = sig_203 & sig_199;
  assign sig_227 = sig_208 ^ sig_204;
  assign sig_228 = sig_208 & sig_204;
  assign sig_229 = sig_227 & sig_226;
  assign O[8] = sig_227 ^ sig_226;
  assign sig_231 = sig_228 | sig_229;
  assign sig_232 = sig_213 ^ sig_209;
  assign sig_233 = sig_213 & sig_209;
  assign sig_234 = sig_232 & sig_231;
  assign O[9] = sig_232 ^ sig_231;
  assign sig_236 = sig_233 | sig_234;
  assign sig_237 = sig_218 ^ sig_214;
  assign sig_238 = sig_218 & sig_214;
  assign sig_239 = sig_237 & sig_236;
  assign O[10] = sig_237 ^ sig_236;
  assign sig_241 = sig_238 | sig_239;
  assign sig_242 = sig_223 ^ sig_219;
  assign sig_243 = sig_223 & sig_219;
  assign sig_244 = sig_194 ^ sig_224;
  assign sig_245 = !(B[6] ^ sig_224);
  assign sig_246 = A[6] & sig_243;
  assign sig_247 = sig_244 ^ sig_243;
  assign sig_248 = sig_245 | sig_246;
  assign sig_249 = sig_223 ^ sig_219;
  assign sig_250 = sig_223;
  assign sig_252 = sig_250 | sig_249;
  assign sig_253 = sig_194 ^ sig_224;
  assign sig_254 = sig_194 & B[5];
  assign sig_255 = sig_253 & sig_252;
  assign sig_256 = sig_253 ^ sig_252;
  assign sig_257 = sig_254 | sig_255;
  assign sig_258 = !sig_241;
  assign O[11] = !(sig_242 ^ sig_258);
  assign sig_262 = !sig_241;
  assign sig_263 = sig_247 & sig_262;
  assign sig_264 = sig_256 & sig_241;
  assign O[12] = sig_263 | sig_264;
  assign sig_267 = sig_248 & B[6];
  assign sig_268 = sig_257 & sig_241;
  assign O[13] = sig_267 | sig_268;
endmodule

