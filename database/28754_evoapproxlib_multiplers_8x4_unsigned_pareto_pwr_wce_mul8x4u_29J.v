// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 0.26 %
// MAE = 11 
// WCE% = 0.81 %
// WCE = 33 
// WCRE% = 800.00 %
// EP% = 88.33 %
// MRE% = 5.76 %
// MSE = 189 
// PDK45_PWR = 0.092 mW
// PDK45_AREA = 205.6 um2
// PDK45_DELAY = 0.85 ns

module mul8x4u_29J (
    A,
    B,
    O
);

input [7:0] A;
input [3:0] B;
output [11:0] O;

wire sig_17,sig_18,sig_19,sig_24,sig_25,sig_26,sig_27,sig_32,sig_42,sig_43,sig_45,sig_46,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54;
wire sig_55,sig_56,sig_57,sig_58,sig_59,sig_60,sig_61,sig_65,sig_66,sig_67,sig_68,sig_69,sig_77,sig_79,sig_82,sig_83,sig_84,sig_85,sig_86,sig_87;
wire sig_88,sig_89,sig_90,sig_91,sig_92,sig_93,sig_94,sig_95,sig_96,sig_97,sig_98,sig_99,sig_100,sig_101,sig_102,sig_103,sig_104,sig_105,sig_106,sig_109;
wire sig_110,sig_111,sig_112,sig_113,sig_114,sig_122,sig_123,sig_127,sig_128,sig_129,sig_130,sig_131,sig_132,sig_133,sig_134,sig_135,sig_136,sig_137,sig_138,sig_139;
wire sig_140,sig_141,sig_142,sig_143,sig_144,sig_145,sig_146,sig_147,sig_148,sig_149,sig_150,sig_151;

assign sig_17 = A[5] & B[0];
assign sig_18 = A[6] & B[0];
assign sig_19 = A[7] & B[0];
assign sig_24 = A[4] & B[1];
assign sig_25 = A[5] & B[1];
assign sig_26 = A[6] & B[1];
assign sig_27 = A[7] & B[1];
assign sig_32 = B[0] & A[4];
assign sig_42 = B[1] & A[2];
assign sig_43 = B[1] ^ sig_42;
assign sig_45 = sig_17 ^ sig_24;
assign sig_46 = sig_17 & sig_24;
assign sig_47 = sig_45 & sig_42;
assign sig_48 = sig_45 ^ sig_42;
assign sig_49 = sig_46 | sig_47;
assign sig_50 = sig_18 ^ sig_25;
assign sig_51 = sig_18 & sig_25;
assign sig_52 = sig_50 & sig_49;
assign sig_53 = sig_50 ^ sig_49;
assign sig_54 = sig_51 | sig_52;
assign sig_55 = sig_19 ^ sig_26;
assign sig_56 = sig_19 & sig_26;
assign sig_57 = sig_55 & sig_54;
assign sig_58 = sig_55 ^ sig_54;
assign sig_59 = sig_56 | sig_57;
assign sig_60 = sig_59 & sig_27;
assign sig_61 = sig_59 ^ sig_27;
assign sig_65 = A[3] & B[2];
assign sig_66 = A[4] & B[2];
assign sig_67 = A[5] & B[2];
assign sig_68 = A[6] & B[2];
assign sig_69 = A[7] & B[2];
assign sig_77 = sig_43 | B[2];
assign sig_79 = sig_77 & A[1];
assign sig_82 = sig_48 ^ sig_65;
assign sig_83 = sig_48 & sig_65;
assign sig_84 = sig_82 & sig_79;
assign sig_85 = sig_82 ^ sig_79;
assign sig_86 = sig_83 | sig_84;
assign sig_87 = sig_53 ^ sig_66;
assign sig_88 = sig_53 & sig_66;
assign sig_89 = sig_87 & sig_86;
assign sig_90 = sig_87 ^ sig_86;
assign sig_91 = sig_88 | sig_89;
assign sig_92 = sig_58 ^ sig_67;
assign sig_93 = sig_58 & sig_67;
assign sig_94 = sig_92 & sig_91;
assign sig_95 = sig_92 ^ sig_91;
assign sig_96 = sig_93 | sig_94;
assign sig_97 = sig_61 ^ sig_68;
assign sig_98 = sig_61 & sig_68;
assign sig_99 = sig_97 & sig_96;
assign sig_100 = sig_97 ^ sig_96;
assign sig_101 = sig_98 | sig_99;
assign sig_102 = sig_60 ^ sig_69;
assign sig_103 = sig_60 & sig_69;
assign sig_104 = sig_102 & sig_101;
assign sig_105 = sig_102 ^ sig_101;
assign sig_106 = sig_103 | sig_104;
assign sig_109 = A[2] & B[3];
assign sig_110 = A[3] & B[3];
assign sig_111 = A[4] & B[3];
assign sig_112 = A[5] & B[3];
assign sig_113 = A[6] & B[3];
assign sig_114 = A[7] & B[3];
assign sig_122 = sig_85 ^ sig_109;
assign sig_123 = sig_85 & sig_109;
assign sig_127 = sig_90 ^ sig_110;
assign sig_128 = sig_90 & sig_110;
assign sig_129 = sig_127 & sig_123;
assign sig_130 = sig_127 ^ sig_123;
assign sig_131 = sig_128 | sig_129;
assign sig_132 = sig_95 ^ sig_111;
assign sig_133 = sig_95 & sig_111;
assign sig_134 = sig_132 & sig_131;
assign sig_135 = sig_132 ^ sig_131;
assign sig_136 = sig_133 | sig_134;
assign sig_137 = sig_100 ^ sig_112;
assign sig_138 = sig_100 & sig_112;
assign sig_139 = sig_137 & sig_136;
assign sig_140 = sig_137 ^ sig_136;
assign sig_141 = sig_138 | sig_139;
assign sig_142 = sig_105 ^ sig_113;
assign sig_143 = sig_105 & sig_113;
assign sig_144 = sig_142 & sig_141;
assign sig_145 = sig_142 ^ sig_141;
assign sig_146 = sig_143 | sig_144;
assign sig_147 = sig_106 ^ sig_114;
assign sig_148 = sig_106 & B[3];
assign sig_149 = A[7] & sig_146;
assign sig_150 = sig_147 ^ sig_146;
assign sig_151 = sig_148 | sig_149;

assign O[11] = sig_151;
assign O[10] = sig_150;
assign O[9] = sig_145;
assign O[8] = sig_140;
assign O[7] = sig_135;
assign O[6] = sig_130;
assign O[5] = sig_122;
assign O[4] = sig_32;
assign O[3] = sig_110;
assign O[2] = sig_85;
assign O[1] = sig_19;
assign O[0] = sig_150;

endmodule


