// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and ep parameters
***/
// MAE% = 0.0098 %
// MAE = 0.4 
// WCE% = 0.20 %
// WCE = 8.0 
// WCRE% = 400.00 %
// EP% = 4.69 %
// MRE% = 0.12 %
// MSE = 3.0 
// PDK45_PWR = 0.057 mW
// PDK45_AREA = 123.0 um2
// PDK45_DELAY = 0.92 ns

module add12se_5BQ (
    A,
    B,
    O
);

input [11:0] A;
input [11:0] B;
output [12:0] O;

wire sig_24,sig_25,sig_26,sig_27,sig_28,sig_29,sig_30,sig_31,sig_32,sig_33,sig_34,sig_35,sig_36,sig_37,sig_38,sig_39,sig_40,sig_41,sig_42,sig_43;
wire sig_44,sig_45,sig_46,sig_47,sig_48,sig_49,sig_51,sig_52,sig_53,sig_54,sig_55,sig_56,sig_57,sig_58,sig_59,sig_60,sig_61,sig_62,sig_63,sig_64;
wire sig_65,sig_66,sig_67,sig_68,sig_69,sig_70,sig_71,sig_72,sig_73,sig_74,sig_75,sig_76,sig_77,sig_78,sig_79,sig_80,sig_81,sig_82,sig_83,sig_84;
wire sig_85,sig_86,sig_87,sig_88,sig_89,sig_90,sig_91,sig_92,sig_93,sig_94,sig_95,sig_96,sig_97,sig_98,sig_99,sig_100,sig_101,sig_102,sig_103,sig_104;
wire sig_105,sig_106,sig_107,sig_108,sig_109,sig_110,sig_111,sig_112;

assign sig_24 = A[0] & B[0];
assign sig_25 = A[0] ^ B[0];
assign sig_26 = A[1] & B[1];
assign sig_27 = A[1] ^ B[1];
assign sig_28 = A[2] & B[2];
assign sig_29 = A[2] ^ B[2];
assign sig_30 = A[3] & B[3];
assign sig_31 = A[3] ^ B[3];
assign sig_32 = A[4] & B[4];
assign sig_33 = A[4] ^ B[4];
assign sig_34 = A[5] & B[5];
assign sig_35 = A[5] ^ B[5];
assign sig_36 = A[6] & B[6];
assign sig_37 = A[6] ^ B[6];
assign sig_38 = A[7] & B[7];
assign sig_39 = A[7] ^ B[7];
assign sig_40 = A[8] & B[8];
assign sig_41 = A[8] ^ B[8];
assign sig_42 = A[9] & B[9];
assign sig_43 = A[9] ^ B[9];
assign sig_44 = A[10] & B[10];
assign sig_45 = A[10] ^ B[10];
assign sig_46 = A[11] & B[11];
assign sig_47 = A[11] ^ B[11];
assign sig_48 = A[11] ^ B[11];
assign sig_49 = sig_29 & sig_26;
assign sig_51 = sig_28 | sig_49;
assign sig_52 = sig_33 & sig_30;
assign sig_53 = sig_33 & sig_31;
assign sig_54 = sig_32 | sig_52;
assign sig_55 = sig_37 & sig_34;
assign sig_56 = sig_37 & sig_35;
assign sig_57 = sig_36 | sig_55;
assign sig_58 = sig_41 & sig_38;
assign sig_59 = sig_41 & sig_39;
assign sig_60 = sig_40 | sig_58;
assign sig_61 = sig_45 & sig_42;
assign sig_62 = sig_45 & sig_43;
assign sig_63 = sig_44 | sig_61;
assign sig_64 = sig_27 & sig_24;
assign sig_65 = sig_26 | sig_64;
assign sig_66 = A[2] & sig_24;
assign sig_67 = sig_51 | sig_66;
assign sig_68 = sig_35 & sig_54;
assign sig_69 = sig_35 & sig_53;
assign sig_70 = sig_34 | sig_68;
assign sig_71 = sig_56 & sig_54;
assign sig_72 = sig_56 & sig_53;
assign sig_73 = sig_57 | sig_71;
assign sig_74 = sig_43 & sig_60;
assign sig_75 = sig_43 & sig_59;
assign sig_76 = sig_42 | sig_74;
assign sig_77 = sig_62 & sig_60;
assign sig_78 = sig_62 & sig_59;
assign sig_79 = sig_63 | sig_77;
assign sig_80 = sig_31 & sig_67;
assign sig_81 = sig_30 | sig_80;
assign sig_82 = sig_53 & sig_67;
assign sig_83 = sig_54 | sig_82;
assign sig_84 = sig_69 & sig_67;
assign sig_85 = sig_70 | sig_84;
assign sig_86 = sig_72 & sig_67;
assign sig_87 = sig_73 | sig_86;
assign sig_88 = sig_47 & sig_79;
assign sig_89 = sig_47 & sig_78;
assign sig_90 = sig_46 | sig_88;
assign sig_91 = sig_39 & sig_87;
assign sig_92 = sig_38 | sig_91;
assign sig_93 = sig_59 & sig_87;
assign sig_94 = sig_60 | sig_93;
assign sig_95 = sig_75 & sig_87;
assign sig_96 = sig_76 | sig_95;
assign sig_97 = sig_78 & sig_87;
assign sig_98 = sig_79 | sig_97;
assign sig_99 = sig_89 & sig_87;
assign sig_100 = sig_90 | sig_99;
assign sig_101 = sig_27 ^ sig_24;
assign sig_102 = sig_29 ^ sig_65;
assign sig_103 = sig_31 ^ sig_67;
assign sig_104 = sig_33 ^ sig_81;
assign sig_105 = sig_35 ^ sig_83;
assign sig_106 = sig_37 ^ sig_85;
assign sig_107 = sig_39 ^ sig_87;
assign sig_108 = sig_41 ^ sig_92;
assign sig_109 = sig_43 ^ sig_94;
assign sig_110 = sig_45 ^ sig_96;
assign sig_111 = sig_47 ^ sig_98;
assign sig_112 = sig_48 ^ sig_100;

assign O[12] = sig_112;
assign O[11] = sig_111;
assign O[10] = sig_110;
assign O[9] = sig_109;
assign O[8] = sig_108;
assign O[7] = sig_107;
assign O[6] = sig_106;
assign O[5] = sig_105;
assign O[4] = sig_104;
assign O[3] = sig_103;
assign O[2] = sig_102;
assign O[1] = sig_101;
assign O[0] = sig_25;

endmodule


