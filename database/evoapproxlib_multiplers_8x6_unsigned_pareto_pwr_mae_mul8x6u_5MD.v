/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.19 %
// MAE = 32 
// WCE% = 0.77 %
// WCE = 126 
// WCRE% = 3300.00 %
// EP% = 94.54 %
// MRE% = 5.22 %
// MSE = 1597 
// PDK45_PWR = 0.161 mW
// PDK45_AREA = 331.3 um2
// PDK45_DELAY = 1.07 ns

module mul8x6u_5MD (
    A,
    B,
    O
);

input [7:0] A;
input [5:0] B;
output [13:0] O;

wire sig_21,sig_28,sig_29,sig_54,sig_57,sig_58,sig_59,sig_60,sig_61,sig_62,sig_63,sig_68,sig_69,sig_70,sig_71,sig_77,sig_89,sig_92,sig_94,sig_95;
wire sig_96,sig_97,sig_98,sig_99,sig_100,sig_101,sig_102,sig_103,sig_104,sig_105,sig_106,sig_107,sig_108,sig_112,sig_113,sig_114,sig_115,sig_116,sig_126,sig_129;
wire sig_130,sig_131,sig_132,sig_133,sig_134,sig_135,sig_136,sig_137,sig_138,sig_139,sig_140,sig_141,sig_142,sig_143,sig_144,sig_145,sig_146,sig_147,sig_148,sig_149;
wire sig_150,sig_151,sig_152,sig_153,sig_155,sig_156,sig_157,sig_158,sig_159,sig_160,sig_161,sig_169,sig_170,sig_171,sig_172,sig_173,sig_174,sig_175,sig_176,sig_177;
wire sig_178,sig_179,sig_180,sig_181,sig_182,sig_183,sig_184,sig_185,sig_186,sig_187,sig_188,sig_189,sig_190,sig_191,sig_192,sig_193,sig_194,sig_195,sig_196,sig_197;
wire sig_198,sig_199,sig_200,sig_201,sig_202,sig_203,sig_204,sig_205,sig_206,sig_209,sig_210,sig_212,sig_214,sig_215,sig_216,sig_217,sig_218,sig_219,sig_220,sig_221;
wire sig_222,sig_223,sig_224,sig_225,sig_226,sig_227,sig_228,sig_229,sig_230,sig_231,sig_232,sig_233,sig_234,sig_235,sig_236,sig_237,sig_238,sig_240,sig_241,sig_242;
wire sig_243;

assign sig_21 = A[7] & B[0];
assign sig_28 = A[6] & B[1];
assign sig_29 = A[7] & B[1];
assign sig_54 = B[1] & A[5];
assign sig_57 = sig_21 ^ sig_28;
assign sig_58 = sig_21 & sig_28;
assign sig_59 = sig_57 & sig_54;
assign sig_60 = sig_57 ^ sig_54;
assign sig_61 = sig_58 | sig_59;
assign sig_62 = sig_61 & sig_29;
assign sig_63 = sig_61 ^ sig_29;
assign sig_68 = ~B[0];
assign sig_69 = A[5] & B[2];
assign sig_70 = A[6] & B[2];
assign sig_71 = A[7] & B[2];
assign sig_77 = B[2] & A[4];
assign sig_89 = A[6] | sig_68;
assign sig_92 = sig_89 ^ sig_68;
assign sig_94 = sig_60 ^ sig_69;
assign sig_95 = sig_60 & sig_69;
assign sig_96 = sig_94 & sig_77;
assign sig_97 = sig_94 ^ sig_77;
assign sig_98 = sig_95 | sig_96;
assign sig_99 = sig_63 ^ sig_70;
assign sig_100 = sig_63 & sig_70;
assign sig_101 = sig_99 & sig_98;
assign sig_102 = sig_99 ^ sig_98;
assign sig_103 = sig_100 | sig_101;
assign sig_104 = sig_62 ^ sig_71;
assign sig_105 = sig_62 & B[2];
assign sig_106 = A[7] & sig_103;
assign sig_107 = sig_104 ^ sig_103;
assign sig_108 = sig_105 | sig_106;
assign sig_112 = A[3] & B[3];
assign sig_113 = A[4] & B[3];
assign sig_114 = A[5] & B[3];
assign sig_115 = A[6] & B[3];
assign sig_116 = A[7] & B[3];
assign sig_126 = A[2] & B[3];
assign sig_129 = sig_92 ^ sig_112;
assign sig_130 = sig_92 & sig_112;
assign sig_131 = sig_129 & sig_126;
assign sig_132 = sig_129 ^ sig_126;
assign sig_133 = sig_130 | sig_131;
assign sig_134 = sig_97 ^ sig_113;
assign sig_135 = sig_97 & sig_113;
assign sig_136 = sig_134 & sig_133;
assign sig_137 = sig_134 ^ sig_133;
assign sig_138 = sig_135 | sig_136;
assign sig_139 = sig_102 ^ sig_114;
assign sig_140 = sig_102 & sig_114;
assign sig_141 = sig_139 & sig_138;
assign sig_142 = sig_139 ^ sig_138;
assign sig_143 = sig_140 | sig_141;
assign sig_144 = sig_107 ^ sig_115;
assign sig_145 = sig_107 & sig_115;
assign sig_146 = sig_144 & sig_143;
assign sig_147 = sig_144 ^ sig_143;
assign sig_148 = sig_145 | sig_146;
assign sig_149 = sig_108 ^ sig_116;
assign sig_150 = sig_108 & sig_116;
assign sig_151 = A[7] & sig_148;
assign sig_152 = sig_149 ^ sig_148;
assign sig_153 = sig_150 | sig_151;
assign sig_155 = A[1] & B[0];
assign sig_156 = A[2] & B[4];
assign sig_157 = A[3] & B[4];
assign sig_158 = A[4] & B[4];
assign sig_159 = A[5] & B[4];
assign sig_160 = A[6] & B[4];
assign sig_161 = A[7] & B[4];
assign sig_169 = sig_132 ^ sig_156;
assign sig_170 = sig_132 & sig_156;
assign sig_171 = sig_169 & sig_155;
assign sig_172 = sig_169 ^ sig_155;
assign sig_173 = sig_170 | sig_171;
assign sig_174 = sig_137 ^ sig_157;
assign sig_175 = sig_137 & sig_157;
assign sig_176 = sig_174 & sig_173;
assign sig_177 = sig_174 ^ sig_173;
assign sig_178 = sig_175 | sig_176;
assign sig_179 = sig_142 ^ sig_158;
assign sig_180 = sig_142 & sig_158;
assign sig_181 = sig_179 & sig_178;
assign sig_182 = sig_179 ^ sig_178;
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
assign sig_195 = sig_153 & sig_161;
assign sig_196 = sig_194 & sig_193;
assign sig_197 = sig_194 ^ sig_193;
assign sig_198 = sig_195 | sig_196;
assign sig_199 = A[0] & B[5];
assign sig_200 = A[1] & B[5];
assign sig_201 = A[2] & B[5];
assign sig_202 = A[3] & B[5];
assign sig_203 = A[4] & B[5];
assign sig_204 = A[5] & B[5];
assign sig_205 = A[6] & B[5];
assign sig_206 = A[7] & B[5];
assign sig_209 = sig_172 ^ sig_200;
assign sig_210 = sig_172 & sig_200;
assign sig_212 = sig_198 ^ sig_206;
assign sig_214 = sig_177 ^ sig_201;
assign sig_215 = sig_177 & sig_201;
assign sig_216 = sig_214 & sig_210;
assign sig_217 = sig_214 ^ sig_210;
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
assign sig_240 = sig_198 & B[5];
assign sig_241 = A[7] & sig_238;
assign sig_242 = sig_212 ^ sig_238;
assign sig_243 = sig_240 | sig_241;

assign O[13] = sig_243;
assign O[12] = sig_242;
assign O[11] = sig_237;
assign O[10] = sig_232;
assign O[9] = sig_227;
assign O[8] = sig_222;
assign O[7] = sig_217;
assign O[6] = sig_209;
assign O[5] = sig_199;
assign O[4] = sig_215;
assign O[3] = sig_157;
assign O[2] = sig_172;
assign O[1] = 1'b0;
assign O[0] = sig_29;

endmodule


