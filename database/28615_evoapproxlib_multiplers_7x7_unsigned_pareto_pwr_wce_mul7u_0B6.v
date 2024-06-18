// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, S. S. Sarwar, L. Sekanina, Z. Vasicek and K. Roy, "Design of power-efficient approximate multipliers for approximate artificial neural networks," 2016 IEEE/ACM International Conference on Computer-Aided Design (ICCAD), Austin, TX, 2016, pp. 1-7. doi: 10.1145/2966986.2967021 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 1.13 %
// MAE = 186 
// WCE% = 4.96 %
// WCE = 812 
// WCRE% = 150.39 %
// EP% = 98.23 %
// MRE% = 17.68 %
// MSE = 54027 
// PDK45_PWR = 0.065 mW
// PDK45_AREA = 157.2 um2
// PDK45_DELAY = 0.75 ns


module mul7u_0B6(A, B, O);
  input [6:0] A, B;
  output [13:0] O;
  wire [6:0] A, B;
  wire [13:0] O;
  wire sig_83, sig_113, sig_119, sig_144, sig_145, sig_146;
  wire sig_147, sig_148, sig_149, sig_150, sig_155, sig_156;
  wire sig_157, sig_172, sig_173, sig_174, sig_177, sig_178;
  wire sig_179, sig_181, sig_182, sig_183, sig_184, sig_185;
  wire sig_186, sig_187, sig_191, sig_192, sig_193, sig_206;
  wire sig_209, sig_210, sig_211, sig_212, sig_213, sig_214;
  wire sig_215, sig_216, sig_217, sig_218, sig_219, sig_220;
  wire sig_221, sig_222, sig_223, sig_231, sig_232, sig_233;
  wire sig_234, sig_236, sig_238, sig_239, sig_241, sig_242;
  wire sig_243, sig_244, sig_246, sig_247, sig_248, sig_249;
  assign sig_83 = A[6] & B[3];
  assign sig_113 = A[6] & B[2];
  assign sig_119 = A[5] & B[4];
  assign O[6] = A[6] & B[4];
  assign sig_144 = A[3] & A[4];
  assign sig_145 = B[5] & A[4];
  assign sig_146 = sig_83 ^ sig_119;
  assign sig_147 = sig_83 & sig_119;
  assign sig_148 = sig_146 & sig_113;
  assign sig_149 = sig_146 ^ sig_113;
  assign sig_150 = sig_147 ^ sig_148;
  assign sig_155 = A[4] & B[5];
  assign sig_156 = A[5] & B[5];
  assign sig_157 = A[6] & B[5];
  assign sig_172 = B[6] & A[2];
  assign sig_173 = sig_144 ^ A[3];
  assign sig_174 = sig_144 & B[4];
  assign O[0] = sig_173 & B[5];
  assign sig_177 = sig_174 | O[0];
  assign sig_178 = sig_149 ^ sig_155;
  assign sig_179 = A[4] & B[5];
  assign sig_181 = sig_178 ^ sig_145;
  assign sig_182 = sig_179;
  assign sig_183 = O[6] ^ sig_156;
  assign sig_184 = O[6] & sig_156;
  assign sig_185 = sig_183 & sig_150;
  assign sig_186 = sig_183 ^ sig_150;
  assign sig_187 = sig_184 ^ sig_185;
  assign sig_191 = A[3] & B[6];
  assign sig_192 = A[4] & B[6];
  assign sig_193 = A[5] & B[6];
  assign O[2] = A[6] & B[6];
  assign O[4] = A[1] & B[6];
  assign sig_206 = A[1] & A[2];
  assign O[8] = O[4] ^ sig_172;
  assign sig_209 = sig_206 & B[6];
  assign sig_210 = sig_181 ^ sig_191;
  assign sig_211 = sig_181 & sig_191;
  assign sig_212 = sig_210 & sig_177;
  assign sig_213 = sig_210 ^ sig_177;
  assign sig_214 = sig_211 | sig_212;
  assign sig_215 = sig_186 ^ sig_192;
  assign sig_216 = sig_186 & sig_192;
  assign sig_217 = sig_215 & sig_182;
  assign sig_218 = sig_215 ^ sig_182;
  assign sig_219 = sig_216 | sig_217;
  assign sig_220 = sig_157 ^ sig_193;
  assign sig_221 = sig_157 & sig_193;
  assign sig_222 = sig_220 & sig_187;
  assign sig_223 = sig_220 ^ sig_187;
  assign O[3] = sig_221 ^ sig_222;
  assign sig_231 = B[3] & A[5];
  assign sig_232 = sig_213 ^ sig_209;
  assign sig_233 = sig_213 & sig_209;
  assign sig_234 = sig_232 & sig_231;
  assign O[9] = sig_232 ^ sig_231;
  assign sig_236 = sig_233 | sig_234;
  assign O[1] = sig_218 ^ sig_214;
  assign sig_238 = sig_218 & sig_214;
  assign sig_239 = O[1] & sig_236;
  assign O[10] = O[1] ^ sig_236;
  assign sig_241 = sig_238 ^ sig_239;
  assign sig_242 = sig_223 ^ sig_219;
  assign sig_243 = sig_223 & sig_219;
  assign sig_244 = sig_242 & sig_241;
  assign O[11] = sig_242 ^ sig_241;
  assign sig_246 = sig_243 | sig_244;
  assign sig_247 = O[2] ^ O[3];
  assign sig_248 = B[6] & O[3];
  assign sig_249 = sig_247 & sig_246;
  assign O[12] = sig_247 ^ sig_246;
  assign O[13] = sig_248 ^ sig_249;
  assign O[5] = O[4];
  assign O[7] = O[0];
endmodule

