// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, S. S. Sarwar, L. Sekanina, Z. Vasicek and K. Roy, "Design of power-efficient approximate multipliers for approximate artificial neural networks," 2016 IEEE/ACM International Conference on Computer-Aided Design (ICCAD), Austin, TX, 2016, pp. 1-7. doi: 10.1145/2966986.2967021 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 0.45 %
// MAE = 74 
// WCE% = 1.92 %
// WCE = 314 
// WCRE% = 700.00 %
// EP% = 97.31 %
// MRE% = 8.23 %
// MSE = 8544 
// PDK45_PWR = 0.152 mW
// PDK45_AREA = 295.7 um2
// PDK45_DELAY = 1.05 ns


module mul7u_0GG(A, B, O);
  input [6:0] A, B;
  output [13:0] O;
  wire [6:0] A, B;
  wire [13:0] O;
  wire sig_27, sig_33, sig_34, sig_39, sig_40, sig_45;
  wire sig_46, sig_47, sig_48, sig_51, sig_52, sig_54;
  wire sig_55, sig_57, sig_58, sig_59, sig_60, sig_61;
  wire sig_62, sig_89, sig_91, sig_103, sig_104, sig_105;
  wire sig_106, sig_107, sig_108, sig_109, sig_110, sig_111;
  wire sig_112, sig_113, sig_114, sig_116, sig_118, sig_119;
  wire sig_120, sig_143, sig_144, sig_145, sig_146, sig_147;
  wire sig_148, sig_149, sig_150, sig_151, sig_152, sig_166;
  wire sig_167, sig_168, sig_169, sig_170, sig_171, sig_172;
  wire sig_173, sig_174, sig_175, sig_176, sig_177, sig_178;
  wire sig_179, sig_180, sig_181, sig_182, sig_183, sig_184;
  wire sig_185, sig_195, sig_196, sig_197, sig_199, sig_200;
  wire sig_201, sig_202, sig_203, sig_204, sig_205, sig_206;
  wire sig_207, sig_208, sig_209, sig_210, sig_211, sig_212;
  wire sig_213, sig_214, sig_215, sig_216, sig_217, sig_218;
  wire sig_219, sig_220, sig_221, sig_233, sig_234, sig_235;
  wire sig_236, sig_238, sig_239, sig_240, sig_241, sig_243;
  wire sig_244, sig_245, sig_248, sig_249, sig_250, sig_251;
  wire sig_253, sig_254, sig_255, sig_256, sig_258;
  assign sig_27 = A[6] & B[1];
  assign sig_33 = A[5] & B[2];
  assign sig_34 = A[6] & B[2];
  assign sig_39 = A[4] & B[3];
  assign sig_40 = A[5] & B[3];
  assign O[5] = A[6] & B[3];
  assign sig_45 = A[1] & B[3];
  assign sig_46 = A[4] & B[4];
  assign sig_47 = A[5] & B[4];
  assign sig_48 = A[6] & B[4];
  assign sig_51 = A[6] & B[0];
  assign sig_52 = A[3] & B[5];
  assign O[2] = A[4] & B[5];
  assign sig_54 = A[5] & B[5];
  assign sig_55 = A[6] & B[5];
  assign sig_57 = A[3] & B[4];
  assign sig_58 = A[2] & B[6];
  assign sig_59 = A[3] & B[6];
  assign sig_60 = A[4] & B[6];
  assign sig_61 = A[5] & B[6];
  assign sig_62 = A[6] & B[6];
  assign sig_89 = B[2] & A[4];
  assign O[6] = sig_27 & sig_33;
  assign sig_91 = sig_27 ^ sig_33;
  assign sig_103 = A[5] & B[1];
  assign sig_104 = sig_39 ^ sig_45;
  assign sig_105 = sig_39 & A[1];
  assign sig_106 = sig_104 & sig_51;
  assign sig_107 = sig_104 ^ sig_51;
  assign sig_108 = sig_105 ^ sig_106;
  assign sig_109 = sig_40 ^ sig_46;
  assign sig_110 = sig_40 & sig_46;
  assign sig_111 = sig_109 & sig_52;
  assign sig_112 = sig_109 ^ sig_52;
  assign sig_113 = sig_110 ^ sig_111;
  assign sig_114 = O[5] ^ sig_47;
  assign O[4] = O[5] & sig_47;
  assign sig_116 = sig_114 & O[2];
  assign O[1] = sig_114 ^ O[2];
  assign sig_118 = O[4] ^ sig_116;
  assign sig_119 = sig_48 & sig_54;
  assign sig_120 = sig_48 ^ sig_54;
  assign O[3] = B[4] & A[3];
  assign sig_143 = sig_91 ^ sig_89;
  assign sig_144 = sig_91 & sig_89;
  assign sig_145 = sig_143 & sig_107;
  assign sig_146 = sig_143 ^ sig_107;
  assign sig_147 = sig_144 ^ sig_145;
  assign sig_148 = sig_34 ^ O[6];
  assign sig_149 = A[5] & O[6];
  assign sig_150 = sig_148 & sig_112;
  assign sig_151 = sig_148 ^ sig_112;
  assign sig_152 = sig_149 | sig_150;
  assign sig_166 = B[6] & A[1];
  assign sig_167 = sig_146 ^ O[3];
  assign sig_168 = sig_146 & O[3];
  assign sig_169 = sig_167 & sig_103;
  assign sig_170 = sig_167 ^ sig_103;
  assign sig_171 = sig_168 ^ sig_169;
  assign sig_172 = sig_151 ^ sig_147;
  assign sig_173 = sig_151 & sig_147;
  assign sig_174 = sig_172 & sig_108;
  assign sig_175 = sig_172 ^ sig_108;
  assign sig_176 = sig_173 ^ sig_174;
  assign sig_177 = O[1] ^ sig_152;
  assign sig_178 = O[1] & sig_152;
  assign sig_179 = sig_177 & sig_113;
  assign sig_180 = sig_177 ^ sig_113;
  assign sig_181 = sig_178 | sig_179;
  assign sig_182 = sig_120 & sig_118;
  assign sig_183 = sig_120 ^ sig_118;
  assign sig_184 = B[5] & sig_119;
  assign sig_185 = sig_55 ^ sig_119;
  assign sig_195 = sig_170 ^ sig_166;
  assign sig_196 = sig_170 & sig_166;
  assign sig_197 = sig_195 & sig_57;
  assign O[7] = sig_195 ^ sig_57;
  assign sig_199 = sig_196 ^ sig_197;
  assign sig_200 = sig_175 ^ sig_171;
  assign sig_201 = sig_175 & sig_171;
  assign sig_202 = sig_200 & sig_58;
  assign sig_203 = sig_200 ^ sig_58;
  assign sig_204 = sig_201 ^ sig_202;
  assign sig_205 = sig_180 ^ sig_176;
  assign sig_206 = sig_180 & sig_176;
  assign sig_207 = sig_205 & sig_59;
  assign sig_208 = sig_205 ^ sig_59;
  assign sig_209 = sig_206 ^ sig_207;
  assign sig_210 = sig_183 ^ sig_181;
  assign sig_211 = sig_183 & sig_181;
  assign sig_212 = sig_210 & sig_60;
  assign sig_213 = sig_210 ^ sig_60;
  assign sig_214 = sig_211 | sig_212;
  assign sig_215 = sig_185 ^ sig_182;
  assign sig_216 = sig_185 & sig_182;
  assign sig_217 = sig_215 & sig_61;
  assign sig_218 = sig_215 ^ sig_61;
  assign sig_219 = sig_216 | sig_217;
  assign sig_220 = sig_184 & B[6];
  assign sig_221 = sig_184 ^ sig_62;
  assign sig_233 = B[5] & A[2];
  assign sig_234 = sig_203 ^ sig_199;
  assign sig_235 = sig_203 & sig_199;
  assign sig_236 = sig_234 & sig_233;
  assign O[8] = sig_234 ^ sig_233;
  assign sig_238 = sig_235 ^ sig_236;
  assign sig_239 = sig_208 ^ sig_204;
  assign sig_240 = sig_208 & sig_204;
  assign sig_241 = sig_239 & sig_238;
  assign O[9] = sig_239 ^ sig_238;
  assign sig_243 = sig_240 ^ sig_241;
  assign sig_244 = sig_213 ^ sig_209;
  assign sig_245 = sig_213 & sig_209;
  assign O[0] = sig_244 & sig_243;
  assign O[10] = sig_244 ^ sig_243;
  assign sig_248 = sig_245 ^ O[0];
  assign sig_249 = sig_218 ^ sig_214;
  assign sig_250 = sig_218 & sig_214;
  assign sig_251 = sig_249 & sig_248;
  assign O[11] = sig_249 ^ sig_248;
  assign sig_253 = sig_250 ^ sig_251;
  assign sig_254 = sig_221 ^ sig_219;
  assign sig_255 = sig_221 & sig_219;
  assign sig_256 = sig_254 & sig_253;
  assign O[12] = sig_254 ^ sig_253;
  assign sig_258 = sig_255 ^ sig_256;
  assign O[13] = sig_220 | sig_258;
endmodule

