// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and ep parameters
***/
// MAE% = 0.047 %
// MAE = 1.9 
// WCE% = 0.17 %
// WCE = 7.0 
// WCRE% = 100.00 %
// EP% = 60.16 %
// MRE% = 1.18 %
// MSE = 8.0 
// PDK45_PWR = 0.120 mW
// PDK45_AREA = 288.6 um2
// PDK45_DELAY = 1.09 ns

module mul8x4u_30G (
    A,
    B,
    O
);

input [7:0] A;
input [3:0] B;
output [11:0] O;

wire sig_14,sig_15,sig_16,sig_17,sig_18,sig_19,sig_21,sig_22,sig_23,sig_24,sig_25,sig_26,sig_27,sig_31,sig_35,sig_36,sig_38,sig_40,sig_41,sig_42;
wire sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55,sig_56,sig_57,sig_58,sig_59,sig_60,sig_61,sig_62;
wire sig_63,sig_64,sig_65,sig_66,sig_67,sig_68,sig_69,sig_70,sig_71,sig_72,sig_73,sig_75,sig_76,sig_77,sig_78,sig_79,sig_80,sig_81,sig_82,sig_83;
wire sig_84,sig_85,sig_86,sig_87,sig_88,sig_89,sig_90,sig_91,sig_92,sig_93,sig_94,sig_95,sig_96,sig_97,sig_98,sig_99,sig_100,sig_101,sig_102,sig_103;
wire sig_104,sig_105,sig_106,sig_107,sig_108,sig_109,sig_110,sig_111,sig_112,sig_113,sig_114,sig_115,sig_116,sig_117,sig_118,sig_119,sig_120,sig_121,sig_122,sig_123;
wire sig_124,sig_125,sig_126,sig_127,sig_128,sig_129,sig_130,sig_131,sig_132,sig_133,sig_134,sig_135,sig_136,sig_137,sig_138,sig_139,sig_140,sig_141,sig_142,sig_143;
wire sig_144,sig_145,sig_146,sig_147,sig_148,sig_149,sig_150,sig_151;

assign sig_14 = A[2] & B[1];
assign sig_15 = A[3] & B[0];
assign sig_16 = A[4] & B[0];
assign sig_17 = A[5] & B[0];
assign sig_18 = A[6] & B[0];
assign sig_19 = A[7] & B[0];
assign sig_21 = A[1] & B[1];
assign sig_22 = A[2] & B[1];
assign sig_23 = A[3] & B[1];
assign sig_24 = A[4] & B[1];
assign sig_25 = A[5] & B[1];
assign sig_26 = A[6] & B[1];
assign sig_27 = A[7] & B[1];
assign sig_31 = sig_14 & B[0];
assign sig_35 = sig_15 | sig_22;
assign sig_36 = B[0] & sig_22;
assign sig_38 = sig_35 ^ sig_31;
assign sig_40 = sig_16 ^ sig_23;
assign sig_41 = sig_16 & sig_23;
assign sig_42 = sig_40 & sig_36;
assign sig_43 = sig_40 ^ sig_36;
assign sig_44 = sig_41 | sig_42;
assign sig_45 = sig_17 ^ sig_24;
assign sig_46 = sig_17 & sig_24;
assign sig_47 = sig_45 & sig_44;
assign sig_48 = sig_45 ^ sig_44;
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
assign sig_62 = A[0] & B[2];
assign sig_63 = A[1] & B[2];
assign sig_64 = A[2] & B[2];
assign sig_65 = A[3] & B[2];
assign sig_66 = A[4] & B[2];
assign sig_67 = A[5] & B[2];
assign sig_68 = A[6] & B[2];
assign sig_69 = A[7] & B[2];
assign sig_70 = sig_21 & sig_62;
assign sig_71 = sig_15 | sig_62;
assign sig_72 = sig_38 ^ sig_63;
assign sig_73 = sig_38 & sig_63;
assign sig_75 = sig_72 ^ sig_70;
assign sig_76 = sig_73 | sig_70;
assign sig_77 = sig_43 ^ sig_64;
assign sig_78 = sig_43 & sig_64;
assign sig_79 = sig_77 & sig_76;
assign sig_80 = sig_77 ^ sig_76;
assign sig_81 = sig_78 | sig_79;
assign sig_82 = sig_48 ^ sig_65;
assign sig_83 = sig_48 & sig_65;
assign sig_84 = sig_82 & sig_81;
assign sig_85 = sig_82 ^ sig_81;
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
assign sig_103 = sig_60 & B[2];
assign sig_104 = sig_69 & sig_101;
assign sig_105 = sig_102 ^ sig_101;
assign sig_106 = sig_103 | sig_104;
assign sig_107 = A[0] & B[3];
assign sig_108 = A[1] & B[3];
assign sig_109 = A[2] & B[3];
assign sig_110 = A[3] & B[3];
assign sig_111 = A[4] & B[3];
assign sig_112 = A[5] & B[3];
assign sig_113 = A[6] & B[3];
assign sig_114 = A[7] & B[3];
assign sig_115 = sig_75 & sig_107;
assign sig_116 = sig_75 ^ sig_107;
assign sig_117 = sig_80 ^ sig_108;
assign sig_118 = sig_80 & sig_108;
assign sig_119 = sig_117 & sig_115;
assign sig_120 = sig_117 ^ sig_115;
assign sig_121 = sig_118 | sig_119;
assign sig_122 = sig_85 ^ sig_109;
assign sig_123 = sig_85 & sig_109;
assign sig_124 = sig_122 & sig_121;
assign sig_125 = sig_122 ^ sig_121;
assign sig_126 = sig_123 | sig_124;
assign sig_127 = sig_90 ^ sig_110;
assign sig_128 = sig_90 & sig_110;
assign sig_129 = sig_127 & sig_126;
assign sig_130 = sig_127 ^ sig_126;
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
assign O[5] = sig_125;
assign O[4] = sig_120;
assign O[3] = sig_116;
assign O[2] = sig_71;
assign O[1] = sig_21;
assign O[0] = sig_76;

endmodule


