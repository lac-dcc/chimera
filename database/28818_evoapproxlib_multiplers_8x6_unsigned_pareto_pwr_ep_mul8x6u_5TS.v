// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and ep parameters
***/
// MAE% = 0.0045 %
// MAE = 0.74 
// WCE% = 0.012 %
// WCE = 2.0 
// WCRE% = 100.00 %
// EP% = 37.11 %
// MRE% = 0.16 %
// MSE = 1.5 
// PDK45_PWR = 0.255 mW
// PDK45_AREA = 493.7 um2
// PDK45_DELAY = 1.58 ns

module mul8x6u_5TS (
    A,
    B,
    O
);

input [7:0] A;
input [5:0] B;
output [13:0] O;

wire sig_14,sig_16,sig_17,sig_18,sig_19,sig_20,sig_21,sig_22,sig_23,sig_24,sig_25,sig_26,sig_27,sig_28,sig_29,sig_30,sig_32,sig_33,sig_35,sig_37;
wire sig_38,sig_39,sig_40,sig_41,sig_42,sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55,sig_56,sig_57;
wire sig_58,sig_59,sig_60,sig_61,sig_62,sig_63,sig_64,sig_65,sig_66,sig_67,sig_68,sig_69,sig_70,sig_71,sig_72,sig_73,sig_74,sig_75,sig_76,sig_77;
wire sig_78,sig_79,sig_80,sig_81,sig_82,sig_83,sig_84,sig_85,sig_86,sig_87,sig_88,sig_89,sig_90,sig_91,sig_92,sig_93,sig_94,sig_95,sig_96,sig_97;
wire sig_98,sig_99,sig_100,sig_101,sig_102,sig_103,sig_104,sig_105,sig_106,sig_107,sig_108,sig_109,sig_110,sig_111,sig_112,sig_113,sig_114,sig_115,sig_116,sig_117;
wire sig_118,sig_119,sig_120,sig_121,sig_122,sig_123,sig_124,sig_125,sig_126,sig_127,sig_128,sig_129,sig_130,sig_131,sig_132,sig_133,sig_134,sig_135,sig_136,sig_137;
wire sig_138,sig_139,sig_140,sig_141,sig_142,sig_143,sig_144,sig_145,sig_146,sig_147,sig_148,sig_149,sig_150,sig_151,sig_152,sig_153,sig_154,sig_155,sig_156,sig_157;
wire sig_158,sig_159,sig_160,sig_161,sig_162,sig_163,sig_164,sig_165,sig_166,sig_167,sig_168,sig_169,sig_170,sig_171,sig_172,sig_173,sig_174,sig_175,sig_176,sig_177;
wire sig_178,sig_179,sig_180,sig_181,sig_182,sig_183,sig_184,sig_185,sig_186,sig_187,sig_188,sig_189,sig_190,sig_191,sig_192,sig_193,sig_194,sig_195,sig_196,sig_197;
wire sig_198,sig_199,sig_200,sig_201,sig_202,sig_203,sig_204,sig_205,sig_206,sig_207,sig_208,sig_209,sig_210,sig_211,sig_212,sig_213,sig_214,sig_215,sig_216,sig_217;
wire sig_218,sig_219,sig_220,sig_221,sig_222,sig_223,sig_224,sig_225,sig_226,sig_227,sig_228,sig_229,sig_230,sig_231,sig_232,sig_233,sig_234,sig_235,sig_236,sig_237;
wire sig_238,sig_239,sig_240,sig_241,sig_242,sig_243;

assign sig_14 = A[0] & B[0];
assign sig_16 = A[2] & B[0];
assign sig_17 = A[3] & B[0];
assign sig_18 = A[4] & B[0];
assign sig_19 = A[5] & B[0];
assign sig_20 = A[6] & B[0];
assign sig_21 = A[7] & B[0];
assign sig_22 = B[0] & B[1];
assign sig_23 = A[1] & B[1];
assign sig_24 = A[2] & B[1];
assign sig_25 = A[3] & B[1];
assign sig_26 = A[4] & B[1];
assign sig_27 = A[5] & B[1];
assign sig_28 = A[6] & B[1];
assign sig_29 = A[7] & B[1];
assign sig_30 = A[1] & sig_22;
assign sig_32 = sig_16 ^ sig_23;
assign sig_33 = B[0] & sig_23;
assign sig_35 = sig_32 ^ sig_30;
assign sig_37 = sig_17 ^ sig_24;
assign sig_38 = sig_17 & sig_24;
assign sig_39 = sig_37 & sig_33;
assign sig_40 = sig_37 ^ sig_33;
assign sig_41 = sig_38 | sig_39;
assign sig_42 = sig_18 ^ sig_25;
assign sig_43 = sig_18 & sig_25;
assign sig_44 = sig_42 & sig_41;
assign sig_45 = sig_42 ^ sig_41;
assign sig_46 = sig_43 | sig_44;
assign sig_47 = sig_19 ^ sig_26;
assign sig_48 = sig_19 & sig_26;
assign sig_49 = sig_47 & sig_46;
assign sig_50 = sig_47 ^ sig_46;
assign sig_51 = sig_48 | sig_49;
assign sig_52 = sig_20 ^ sig_27;
assign sig_53 = sig_20 & sig_27;
assign sig_54 = sig_52 & sig_51;
assign sig_55 = sig_52 ^ sig_51;
assign sig_56 = sig_53 | sig_54;
assign sig_57 = sig_21 ^ sig_28;
assign sig_58 = sig_21 & sig_28;
assign sig_59 = sig_57 & sig_56;
assign sig_60 = sig_57 ^ sig_56;
assign sig_61 = sig_58 | sig_59;
assign sig_62 = sig_61 & sig_29;
assign sig_63 = sig_61 ^ sig_29;
assign sig_64 = A[0] & B[2];
assign sig_65 = A[1] & B[2];
assign sig_66 = A[2] & B[2];
assign sig_67 = A[3] & B[2];
assign sig_68 = A[4] & B[2];
assign sig_69 = A[5] & B[2];
assign sig_70 = A[6] & B[2];
assign sig_71 = A[7] & B[2];
assign sig_72 = sig_35 & sig_64;
assign sig_73 = sig_35 ^ sig_64;
assign sig_74 = sig_40 ^ sig_65;
assign sig_75 = sig_40 & sig_65;
assign sig_76 = sig_74 & sig_72;
assign sig_77 = sig_74 ^ sig_72;
assign sig_78 = sig_75 | sig_76;
assign sig_79 = sig_45 ^ sig_66;
assign sig_80 = sig_45 & sig_66;
assign sig_81 = sig_79 & sig_78;
assign sig_82 = sig_79 ^ sig_78;
assign sig_83 = sig_80 | sig_81;
assign sig_84 = sig_50 ^ sig_67;
assign sig_85 = sig_50 & sig_67;
assign sig_86 = sig_84 & sig_83;
assign sig_87 = sig_84 ^ sig_83;
assign sig_88 = sig_85 | sig_86;
assign sig_89 = sig_55 ^ sig_68;
assign sig_90 = sig_55 & sig_68;
assign sig_91 = sig_89 & sig_88;
assign sig_92 = sig_89 ^ sig_88;
assign sig_93 = sig_90 | sig_91;
assign sig_94 = sig_60 ^ sig_69;
assign sig_95 = sig_60 & sig_69;
assign sig_96 = sig_94 & sig_93;
assign sig_97 = sig_94 ^ sig_93;
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
assign sig_109 = A[0] & B[3];
assign sig_110 = A[1] & B[3];
assign sig_111 = A[2] & B[3];
assign sig_112 = A[3] & B[3];
assign sig_113 = A[4] & B[3];
assign sig_114 = A[5] & B[3];
assign sig_115 = A[6] & B[3];
assign sig_116 = A[7] & B[3];
assign sig_117 = sig_77 & sig_109;
assign sig_118 = sig_77 ^ sig_109;
assign sig_119 = sig_82 ^ sig_110;
assign sig_120 = sig_82 & sig_110;
assign sig_121 = sig_119 & sig_117;
assign sig_122 = sig_119 ^ sig_117;
assign sig_123 = sig_120 | sig_121;
assign sig_124 = sig_87 ^ sig_111;
assign sig_125 = sig_87 & sig_111;
assign sig_126 = sig_124 & sig_123;
assign sig_127 = sig_124 ^ sig_123;
assign sig_128 = sig_125 | sig_126;
assign sig_129 = sig_92 ^ sig_112;
assign sig_130 = sig_92 & sig_112;
assign sig_131 = sig_129 & sig_128;
assign sig_132 = sig_129 ^ sig_128;
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
assign sig_150 = sig_108 & B[3];
assign sig_151 = sig_149 & sig_148;
assign sig_152 = sig_149 ^ sig_148;
assign sig_153 = sig_150 | sig_151;
assign sig_154 = A[0] & B[4];
assign sig_155 = A[1] & B[4];
assign sig_156 = A[2] & B[4];
assign sig_157 = A[3] & B[4];
assign sig_158 = A[4] & B[4];
assign sig_159 = A[5] & B[4];
assign sig_160 = A[6] & B[4];
assign sig_161 = A[7] & B[4];
assign sig_162 = sig_122 & sig_154;
assign sig_163 = sig_122 ^ sig_154;
assign sig_164 = sig_127 ^ sig_155;
assign sig_165 = sig_127 & sig_155;
assign sig_166 = sig_164 & sig_162;
assign sig_167 = sig_164 ^ sig_162;
assign sig_168 = sig_165 | sig_166;
assign sig_169 = sig_132 ^ sig_156;
assign sig_170 = sig_132 & sig_156;
assign sig_171 = sig_169 & sig_168;
assign sig_172 = sig_169 ^ sig_168;
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
assign sig_195 = sig_153 & B[4];
assign sig_196 = sig_161 & sig_193;
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
assign sig_207 = sig_167 & sig_199;
assign sig_208 = sig_167 ^ sig_199;
assign sig_209 = sig_172 ^ sig_200;
assign sig_210 = sig_172 & sig_200;
assign sig_211 = sig_209 & sig_207;
assign sig_212 = sig_209 ^ sig_207;
assign sig_213 = sig_210 | sig_211;
assign sig_214 = sig_177 ^ sig_201;
assign sig_215 = sig_177 & sig_201;
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
assign sig_240 = sig_198 & B[5];
assign sig_241 = A[7] & sig_238;
assign sig_242 = sig_239 ^ sig_238;
assign sig_243 = sig_240 | sig_241;

assign O[13] = sig_243;
assign O[12] = sig_242;
assign O[11] = sig_237;
assign O[10] = sig_232;
assign O[9] = sig_227;
assign O[8] = sig_222;
assign O[7] = sig_217;
assign O[6] = sig_212;
assign O[5] = sig_208;
assign O[4] = sig_163;
assign O[3] = sig_118;
assign O[2] = sig_73;
assign O[1] = sig_207;
assign O[0] = sig_14;

endmodule


