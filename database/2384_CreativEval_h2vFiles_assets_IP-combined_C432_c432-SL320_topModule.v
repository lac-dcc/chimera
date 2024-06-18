// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
// Verilog
// c432
// Ninputs 36
// Noutputs 7
// NtotalGates 160
// NOT1 40
// NAND2 64
// NOR2 19
// AND9 3
// XOR2 18
// NAND4 14
// AND8 1
// NAND3 1

module top (N1,N4,N8,N11,N14,N17,N21,N24,N27,N30,
             N34,N37,N40,N43,N47,N50,N53,N56,N60,N63,
             N66,N69,N73,N76,N79,N82,N86,N89,N92,N95,
             N99,N102,N105,N108,N112,N115,N223,N329,N370,N421,
                  N430,N431,N432,
        keyIn_0_0, keyIn_0_1, keyIn_0_2, keyIn_0_3, keyIn_0_4,
        keyIn_0_5, keyIn_0_6, keyIn_0_7, keyIn_0_8, keyIn_0_9,
        keyIn_0_10, keyIn_0_11, keyIn_0_12, keyIn_0_13, keyIn_0_14,
        keyIn_0_15, keyIn_0_16, keyIn_0_17, keyIn_0_18, keyIn_0_19,
        keyIn_0_20, keyIn_0_21, keyIn_0_22, keyIn_0_23, keyIn_0_24,
        keyIn_0_25, keyIn_0_26, keyIn_0_27, keyIn_0_28, keyIn_0_29,
        keyIn_0_30, keyIn_0_31);

  input keyIn_0_0, keyIn_0_1, keyIn_0_2, keyIn_0_3, keyIn_0_4;
  input keyIn_0_5, keyIn_0_6, keyIn_0_7, keyIn_0_8, keyIn_0_9;
  input keyIn_0_10, keyIn_0_11, keyIn_0_12, keyIn_0_13, keyIn_0_14;
  input keyIn_0_15, keyIn_0_16, keyIn_0_17, keyIn_0_18, keyIn_0_19;
  input keyIn_0_20, keyIn_0_21, keyIn_0_22, keyIn_0_23, keyIn_0_24;
  input keyIn_0_25, keyIn_0_26, keyIn_0_27, keyIn_0_28, keyIn_0_29;
  input keyIn_0_30, keyIn_0_31;

  wire [0:31] KeyWire_0;
  wire [0:16] KeyNOTWire_0;

input N1,N4,N8,N11,N14,N17,N21,N24,N27,N30,
      N34,N37,N40,N43,N47,N50,N53,N56,N60,N63,
      N66,N69,N73,N76,N79,N82,N86,N89,N92,N95,
      N99,N102,N105,N108,N112,N115;

output N223,N329,N370,N421,N430,N431,N432;

wire N118,N119,N122,N123,N126,N127,N130,N131,N134,N135,
     N138,N139,N142,N143,N146,N147,N150,N151,N154,N157,
     N158,N159,N162,N165,N168,N171,N174,N177,N180,N183,
     N184,N185,N186,N187,N188,N189,N190,N191,N192,N193,
     N194,N195,N196,N197,N198,N199,N203,N213,N224,N227,
     N230,N233,N236,N239,N242,N243,N246,N247,N250,N251,
     N254,N255,N256,N257,N258,N259,N260,N263,N264,N267,
     N270,N273,N276,N279,N282,N285,N288,N289,N290,N291,
     N292,N293,N294,N295,N296,N300,N301,N302,N303,N304,
     N305,N306,N307,N308,N309,N319,N330,N331,N332,N333,
     N334,N335,N336,N337,N338,N339,N340,N341,N342,N343,
     N344,N345,N346,N347,N348,N349,N350,N351,N352,N353,
     N354,N355,N356,N357,N360,N371,N372,N373,N374,N375,
     N376,N377,N378,N379,N380,N381,N386,N393,N399,N404,
     N407,N411,N414,N415,N416,N417,N418,N419,N420,N422,
     N425,N428,N429;

not NOT1_1 (N118, N1);
not NOT1_2 (N119, N4);
  not NOT1_3 (KeyWire_0[0], N11);
  xor KeyGate_0_0(N122, keyIn_0_0, KeyWire_0[0]);
not NOT1_4 (N123, N17);
not NOT1_5 (N126, N24);
not NOT1_6 (N127, N30);
not NOT1_7 (N130, N37);
not NOT1_8 (N131, N43);
not NOT1_9 (N134, N50);
not NOT1_10 (N135, N56);
  not NOT1_11 (KeyWire_0[1], N63);
  xor KeyGate_0_1(N138, keyIn_0_1, KeyWire_0[1]);
not NOT1_12 (N139, N69);
not NOT1_13 (N142, N76);
not NOT1_14 (N143, N82);
  not NOT1_15 (KeyWire_0[2], N89);
  xnor KeyGate_0_2(KeyNOTWire_0[0], keyIn_0_2, KeyWire_0[2]);
  not KeyNOTGate_0_0(N146, KeyNOTWire_0[0]);
not NOT1_16 (N147, N95);
not NOT1_17 (N150, N102);
not NOT1_18 (N151, N108);
nand NAND2_19 (N154, N118, N4);
nor NOR2_20 (N157, N8, N119);
nor NOR2_21 (N158, N14, N119);
  nand NAND2_22 (KeyWire_0[3], N122, N17);
  xnor KeyGate_0_3(N159, keyIn_0_3, KeyWire_0[3]);
nand NAND2_23 (N162, N126, N30);
nand NAND2_24 (N165, N130, N43);
nand NAND2_25 (N168, N134, N56);
  nand NAND2_26 (KeyWire_0[4], N138, N69);
  xor KeyGate_0_4(KeyNOTWire_0[1], keyIn_0_4, KeyWire_0[4]);
  not KeyNOTGate_0_1(N171, KeyNOTWire_0[1]);
nand NAND2_27 (N174, N142, N82);
  nand NAND2_28 (KeyWire_0[5], N146, N95);
  xor KeyGate_0_5(N177, keyIn_0_5, KeyWire_0[5]);
nand NAND2_29 (N180, N150, N108);
nor NOR2_30 (N183, N21, N123);
nor NOR2_31 (N184, N27, N123);
nor NOR2_32 (N185, N34, N127);
nor NOR2_33 (N186, N40, N127);
nor NOR2_34 (N187, N47, N131);
nor NOR2_35 (N188, N53, N131);
nor NOR2_36 (N189, N60, N135);
nor NOR2_37 (N190, N66, N135);
nor NOR2_38 (N191, N73, N139);
nor NOR2_39 (N192, N79, N139);
nor NOR2_40 (N193, N86, N143);
nor NOR2_41 (N194, N92, N143);
nor NOR2_42 (N195, N99, N147);
nor NOR2_43 (N196, N105, N147);
nor NOR2_44 (N197, N112, N151);
nor NOR2_45 (N198, N115, N151);
  and AND9_46 (KeyWire_0[6], N154, N159, N162, N165, N168, N171, N174, N177, N180);
  xnor KeyGate_0_6(KeyNOTWire_0[2], keyIn_0_6, KeyWire_0[6]);
  not KeyNOTGate_0_2(N199, KeyNOTWire_0[2]);
  not NOT1_47 (KeyWire_0[7], N199);
  xor KeyGate_0_7(KeyNOTWire_0[3], keyIn_0_7, KeyWire_0[7]);
  not KeyNOTGate_0_3(N203, KeyNOTWire_0[3]);
not NOT1_48 (N213, N199);
not NOT1_49 (N223, N199);
  xor XOR2_50 (KeyWire_0[8], N203, N154);
  xor KeyGate_0_8(N224, keyIn_0_8, KeyWire_0[8]);
  xor XOR2_51 (KeyWire_0[9], N203, N159);
  xor KeyGate_0_9(KeyNOTWire_0[4], keyIn_0_9, KeyWire_0[9]);
  not KeyNOTGate_0_4(N227, KeyNOTWire_0[4]);
xor XOR2_52 (N230, N203, N162);
xor XOR2_53 (N233, N203, N165);
xor XOR2_54 (N236, N203, N168);
xor XOR2_55 (N239, N203, N171);
nand NAND2_56 (N242, N1, N213);
xor XOR2_57 (N243, N203, N174);
nand NAND2_58 (N246, N213, N11);
  xor XOR2_59 (KeyWire_0[10], N203, N177);
  xor KeyGate_0_10(N247, keyIn_0_10, KeyWire_0[10]);
nand NAND2_60 (N250, N213, N24);
xor XOR2_61 (N251, N203, N180);
nand NAND2_62 (N254, N213, N37);
nand NAND2_63 (N255, N213, N50);
nand NAND2_64 (N256, N213, N63);
nand NAND2_65 (N257, N213, N76);
nand NAND2_66 (N258, N213, N89);
nand NAND2_67 (N259, N213, N102);
  nand NAND2_68 (KeyWire_0[11], N224, N157);
  xor KeyGate_0_11(N260, keyIn_0_11, KeyWire_0[11]);
nand NAND2_69 (N263, N224, N158);
nand NAND2_70 (N264, N227, N183);
nand NAND2_71 (N267, N230, N185);
nand NAND2_72 (N270, N233, N187);
nand NAND2_73 (N273, N236, N189);
nand NAND2_74 (N276, N239, N191);
nand NAND2_75 (N279, N243, N193);
  nand NAND2_76 (KeyWire_0[12], N247, N195);
  xor KeyGate_0_12(KeyNOTWire_0[5], keyIn_0_12, KeyWire_0[12]);
  not KeyNOTGate_0_5(N282, KeyNOTWire_0[5]);
nand NAND2_77 (N285, N251, N197);
nand NAND2_78 (N288, N227, N184);
nand NAND2_79 (N289, N230, N186);
nand NAND2_80 (N290, N233, N188);
nand NAND2_81 (N291, N236, N190);
nand NAND2_82 (N292, N239, N192);
nand NAND2_83 (N293, N243, N194);
nand NAND2_84 (N294, N247, N196);
nand NAND2_85 (N295, N251, N198);
  and AND9_86 (KeyWire_0[13], N260, N264, N267, N270, N273, N276, N279, N282, N285);
  xnor KeyGate_0_13(KeyNOTWire_0[6], keyIn_0_13, KeyWire_0[13]);
  not KeyNOTGate_0_6(N296, KeyNOTWire_0[6]);
  not NOT1_87 (KeyWire_0[14], N263);
  xnor KeyGate_0_14(N300, keyIn_0_14, KeyWire_0[14]);
not NOT1_88 (N301, N288);
not NOT1_89 (N302, N289);
not NOT1_90 (N303, N290);
not NOT1_91 (N304, N291);
not NOT1_92 (N305, N292);
not NOT1_93 (N306, N293);
not NOT1_94 (N307, N294);
not NOT1_95 (N308, N295);
  not NOT1_96 (KeyWire_0[15], N296);
  xnor KeyGate_0_15(KeyNOTWire_0[7], keyIn_0_15, KeyWire_0[15]);
  not KeyNOTGate_0_7(N309, KeyNOTWire_0[7]);
not NOT1_97 (N319, N296);
not NOT1_98 (N329, N296);
  xor XOR2_99 (KeyWire_0[16], N309, N260);
  xnor KeyGate_0_16(KeyNOTWire_0[8], keyIn_0_16, KeyWire_0[16]);
  not KeyNOTGate_0_8(N330, KeyNOTWire_0[8]);
xor XOR2_100 (N331, N309, N264);
xor XOR2_101 (N332, N309, N267);
xor XOR2_102 (N333, N309, N270);
nand NAND2_103 (N334, N8, N319);
  xor XOR2_104 (KeyWire_0[17], N309, N273);
  xor KeyGate_0_17(N335, keyIn_0_17, KeyWire_0[17]);
nand NAND2_105 (N336, N319, N21);
xor XOR2_106 (N337, N309, N276);
nand NAND2_107 (N338, N319, N34);
xor XOR2_108 (N339, N309, N279);
nand NAND2_109 (N340, N319, N47);
xor XOR2_110 (N341, N309, N282);
nand NAND2_111 (N342, N319, N60);
xor XOR2_112 (N343, N309, N285);
nand NAND2_113 (N344, N319, N73);
nand NAND2_114 (N345, N319, N86);
nand NAND2_115 (N346, N319, N99);
nand NAND2_116 (N347, N319, N112);
  nand NAND2_117 (KeyWire_0[18], N330, N300);
  xor KeyGate_0_18(N348, keyIn_0_18, KeyWire_0[18]);
nand NAND2_118 (N349, N331, N301);
nand NAND2_119 (N350, N332, N302);
nand NAND2_120 (N351, N333, N303);
  nand NAND2_121 (KeyWire_0[19], N335, N304);
  xor KeyGate_0_19(N352, keyIn_0_19, KeyWire_0[19]);
nand NAND2_122 (N353, N337, N305);
nand NAND2_123 (N354, N339, N306);
nand NAND2_124 (N355, N341, N307);
nand NAND2_125 (N356, N343, N308);
  and AND9_126 (KeyWire_0[20], N348, N349, N350, N351, N352, N353, N354, N355, N356);
  xnor KeyGate_0_20(KeyNOTWire_0[9], keyIn_0_20, KeyWire_0[20]);
  not KeyNOTGate_0_9(N357, KeyNOTWire_0[9]);
  not NOT1_127 (KeyWire_0[21], N357);
  xor KeyGate_0_21(N360, keyIn_0_21, KeyWire_0[21]);
not NOT1_128 (N370, N357);
nand NAND2_129 (N371, N14, N360);
nand NAND2_130 (N372, N360, N27);
  nand NAND2_131 (KeyWire_0[22], N360, N40);
  xor KeyGate_0_22(KeyNOTWire_0[10], keyIn_0_22, KeyWire_0[22]);
  not KeyNOTGate_0_10(N373, KeyNOTWire_0[10]);
  nand NAND2_132 (KeyWire_0[23], N360, N53);
  xor KeyGate_0_23(KeyNOTWire_0[11], keyIn_0_23, KeyWire_0[23]);
  not KeyNOTGate_0_11(N374, KeyNOTWire_0[11]);
nand NAND2_133 (N375, N360, N66);
nand NAND2_134 (N376, N360, N79);
nand NAND2_135 (N377, N360, N92);
nand NAND2_136 (N378, N360, N105);
nand NAND2_137 (N379, N360, N115);
nand NAND4_138 (N380, N4, N242, N334, N371);
nand NAND4_139 (N381, N246, N336, N372, N17);
  nand NAND4_140 (KeyWire_0[24], N250, N338, N373, N30);
  xor KeyGate_0_24(KeyNOTWire_0[12], keyIn_0_24, KeyWire_0[24]);
  not KeyNOTGate_0_12(N386, KeyNOTWire_0[12]);
  nand NAND4_141 (KeyWire_0[25], N254, N340, N374, N43);
  xor KeyGate_0_25(N393, keyIn_0_25, KeyWire_0[25]);
nand NAND4_142 (N399, N255, N342, N375, N56);
nand NAND4_143 (N404, N256, N344, N376, N69);
nand NAND4_144 (N407, N257, N345, N377, N82);
nand NAND4_145 (N411, N258, N346, N378, N95);
nand NAND4_146 (N414, N259, N347, N379, N108);
not NOT1_147 (N415, N380);
and AND8_148 (N416, N381, N386, N393, N399, N404, N407, N411, N414);
  not NOT1_149 (KeyWire_0[26], N393);
  xor KeyGate_0_26(N417, keyIn_0_26, KeyWire_0[26]);
not NOT1_150 (N418, N404);
not NOT1_151 (N419, N407);
not NOT1_152 (N420, N411);
nor NOR2_153 (N421, N415, N416);
  nand NAND2_154 (KeyWire_0[27], N386, N417);
  xnor KeyGate_0_27(KeyNOTWire_0[13], keyIn_0_27, KeyWire_0[27]);
  not KeyNOTGate_0_13(N422, KeyNOTWire_0[13]);
  nand NAND4_155 (KeyWire_0[28], N386, N393, N418, N399);
  xnor KeyGate_0_28(KeyNOTWire_0[14], keyIn_0_28, KeyWire_0[28]);
  not KeyNOTGate_0_14(N425, KeyNOTWire_0[14]);
nand NAND3_156 (N428, N399, N393, N419);
  nand NAND4_157 (KeyWire_0[29], N386, N393, N407, N420);
  xnor KeyGate_0_29(KeyNOTWire_0[15], keyIn_0_29, KeyWire_0[29]);
  not KeyNOTGate_0_15(N429, KeyNOTWire_0[15]);
  nand NAND4_158 (KeyWire_0[30], N381, N386, N422, N399);
  xor KeyGate_0_30(N430, keyIn_0_30, KeyWire_0[30]);
nand NAND4_159 (N431, N381, N386, N425, N428);
  nand NAND4_160 (KeyWire_0[31], N381, N422, N425, N429);
  xor KeyGate_0_31(KeyNOTWire_0[16], keyIn_0_31, KeyWire_0[31]);
  not KeyNOTGate_0_16(N432, KeyNOTWire_0[16]);

endmodule
