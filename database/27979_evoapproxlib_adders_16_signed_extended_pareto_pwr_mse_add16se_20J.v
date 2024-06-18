// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 0.0015 %
// MAE = 1.0 
// WCE% = 0.0031 %
// WCE = 2.0 
// WCRE% = 100.00 %
// EP% = 75.00 %
// MRE% = 0.033 %
// MSE = 1.5 
// PDK45_PWR = 0.066 mW
// PDK45_AREA = 129.1 um2
// PDK45_DELAY = 1.17 ns

module add16se_20J (
    A,
    B,
    O
);

input [15:0] A;
input [15:0] B;
output [16:0] O;

wire sig_36,sig_37,sig_38,sig_39,sig_40,sig_41,sig_42,sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55;
wire sig_56,sig_57,sig_58,sig_59,sig_60,sig_61,sig_62,sig_63,sig_64,sig_65,sig_67,sig_68,sig_69,sig_70,sig_71,sig_72,sig_73,sig_74,sig_75,sig_76;
wire sig_77,sig_78,sig_79,sig_80,sig_81,sig_82,sig_83,sig_84,sig_85,sig_88,sig_89,sig_90,sig_91,sig_92,sig_93,sig_94,sig_95,sig_96,sig_97,sig_98;
wire sig_99,sig_100,sig_101,sig_102,sig_103,sig_104,sig_105,sig_106,sig_107,sig_108,sig_109,sig_110,sig_111,sig_114,sig_115,sig_116,sig_117,sig_118,sig_119,sig_120;
wire sig_121,sig_122,sig_123,sig_124,sig_125,sig_126,sig_127,sig_129,sig_130,sig_131,sig_132,sig_133,sig_134,sig_135,sig_136,sig_137,sig_138,sig_139,sig_140,sig_141;
wire sig_142,sig_143;

assign sig_36 = A[2] & B[2];
assign sig_37 = A[2] ^ B[2];
assign sig_38 = A[3] & B[3];
assign sig_39 = A[3] ^ B[3];
assign sig_40 = A[4] & B[4];
assign sig_41 = A[4] ^ B[4];
assign sig_42 = A[5] & B[5];
assign sig_43 = A[5] ^ B[5];
assign sig_44 = A[6] & B[6];
assign sig_45 = A[6] ^ B[6];
assign sig_46 = A[7] & B[7];
assign sig_47 = A[7] ^ B[7];
assign sig_48 = A[8] & B[8];
assign sig_49 = A[8] ^ B[8];
assign sig_50 = A[9] & B[9];
assign sig_51 = A[9] ^ B[9];
assign sig_52 = A[10] & B[10];
assign sig_53 = A[10] ^ B[10];
assign sig_54 = A[11] & B[11];
assign sig_55 = A[11] ^ B[11];
assign sig_56 = A[12] & B[12];
assign sig_57 = A[12] ^ B[12];
assign sig_58 = A[13] & B[13];
assign sig_59 = A[13] ^ B[13];
assign sig_60 = A[14] & B[14];
assign sig_61 = A[14] ^ B[14];
assign sig_62 = A[15] & B[15];
assign sig_63 = A[15] ^ B[15];
assign sig_64 = A[15] ^ B[15];
assign sig_65 = sig_37 & A[1];
assign sig_67 = sig_36 | sig_65;
assign sig_68 = sig_41 & sig_38;
assign sig_69 = sig_41 & sig_39;
assign sig_70 = sig_40 | sig_68;
assign sig_71 = sig_45 & sig_42;
assign sig_72 = sig_45 & sig_43;
assign sig_73 = sig_44 | sig_71;
assign sig_74 = sig_49 & sig_46;
assign sig_75 = sig_49 & sig_47;
assign sig_76 = sig_48 | sig_74;
assign sig_77 = sig_53 & sig_50;
assign sig_78 = sig_53 & sig_51;
assign sig_79 = sig_52 | sig_77;
assign sig_80 = sig_57 & sig_54;
assign sig_81 = sig_57 & sig_55;
assign sig_82 = sig_56 | sig_80;
assign sig_83 = sig_61 & sig_58;
assign sig_84 = sig_61 & sig_59;
assign sig_85 = sig_60 | sig_83;
assign sig_88 = sig_72 & sig_70;
assign sig_89 = sig_72 & sig_69;
assign sig_90 = sig_73 | sig_88;
assign sig_91 = sig_78 & sig_76;
assign sig_92 = sig_78 & sig_75;
assign sig_93 = sig_79 | sig_91;
assign sig_94 = sig_84 & sig_82;
assign sig_95 = sig_84 & sig_81;
assign sig_96 = sig_85 | sig_94;
assign sig_97 = sig_89 & sig_67;
assign sig_98 = sig_90 | sig_97;
assign sig_99 = sig_95 & sig_93;
assign sig_100 = sig_95 & sig_92;
assign sig_101 = sig_96 | sig_99;
assign sig_102 = sig_100 & sig_98;
assign sig_103 = sig_101 | sig_102;
assign sig_104 = sig_92 & sig_98;
assign sig_105 = sig_93 | sig_104;
assign sig_106 = sig_69 & sig_67;
assign sig_107 = sig_70 | sig_106;
assign sig_108 = sig_75 & sig_98;
assign sig_109 = sig_76 | sig_108;
assign sig_110 = sig_81 & sig_105;
assign sig_111 = sig_82 | sig_110;
assign sig_114 = sig_39 & sig_67;
assign sig_115 = sig_38 | sig_114;
assign sig_116 = sig_43 & sig_107;
assign sig_117 = sig_42 | sig_116;
assign sig_118 = sig_47 & sig_98;
assign sig_119 = sig_46 | sig_118;
assign sig_120 = sig_51 & sig_109;
assign sig_121 = sig_50 | sig_120;
assign sig_122 = sig_55 & sig_105;
assign sig_123 = sig_54 | sig_122;
assign sig_124 = sig_59 & sig_111;
assign sig_125 = sig_58 | sig_124;
assign sig_126 = sig_63 & sig_103;
assign sig_127 = sig_62 | sig_126;
assign sig_129 = sig_37 ^ A[1];
assign sig_130 = sig_39 ^ sig_67;
assign sig_131 = sig_41 ^ sig_115;
assign sig_132 = sig_43 ^ sig_107;
assign sig_133 = sig_45 ^ sig_117;
assign sig_134 = sig_47 ^ sig_98;
assign sig_135 = sig_49 ^ sig_119;
assign sig_136 = sig_51 ^ sig_109;
assign sig_137 = sig_53 ^ sig_121;
assign sig_138 = sig_55 ^ sig_105;
assign sig_139 = sig_57 ^ sig_123;
assign sig_140 = sig_59 ^ sig_111;
assign sig_141 = sig_61 ^ sig_125;
assign sig_142 = sig_63 ^ sig_103;
assign sig_143 = sig_64 ^ sig_127;

assign O[16] = sig_143;
assign O[15] = sig_142;
assign O[14] = sig_141;
assign O[13] = sig_140;
assign O[12] = sig_139;
assign O[11] = sig_138;
assign O[10] = sig_137;
assign O[9] = sig_136;
assign O[8] = sig_135;
assign O[7] = sig_134;
assign O[6] = sig_133;
assign O[5] = sig_132;
assign O[4] = sig_131;
assign O[3] = sig_130;
assign O[2] = sig_129;
assign O[1] = B[1];
assign O[0] = 1'b0;

endmodule


