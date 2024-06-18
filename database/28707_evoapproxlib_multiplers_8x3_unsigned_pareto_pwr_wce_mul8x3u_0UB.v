// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 0.07 %
// MAE = 1.4 
// WCE% = 0.20 %
// WCE = 4.0 
// WCRE% = 100.00 %
// EP% = 62.50 %
// MRE% = 1.57 %
// MSE = 4.0 
// PDK45_PWR = 0.068 mW
// PDK45_AREA = 187.3 um2
// PDK45_DELAY = 0.80 ns

module mul8x3u_0UB (
    A,
    B,
    O
);

input [7:0] A;
input [2:0] B;
output [10:0] O;

wire sig_11,sig_14,sig_15,sig_16,sig_17,sig_18,sig_20,sig_21,sig_22,sig_23,sig_24,sig_25,sig_26,sig_34,sig_35,sig_36,sig_37,sig_38,sig_39,sig_40;
wire sig_41,sig_42,sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55,sig_56,sig_57,sig_58,sig_59,sig_60;
wire sig_61,sig_62,sig_63,sig_64,sig_65,sig_66,sig_67,sig_68,sig_71,sig_72,sig_76,sig_77,sig_78,sig_79,sig_80,sig_81,sig_82,sig_83,sig_84,sig_85;
wire sig_86,sig_87,sig_88,sig_89,sig_90,sig_91,sig_92,sig_93,sig_94,sig_95,sig_96,sig_97,sig_98,sig_99,sig_100,sig_101,sig_102,sig_103,sig_104,sig_105;

assign sig_11 = A[2] & B[0];
assign sig_14 = A[3] & B[0];
assign sig_15 = A[4] & B[0];
assign sig_16 = A[5] & B[0];
assign sig_17 = A[6] & B[0];
assign sig_18 = A[7] & B[0];
assign sig_20 = A[1] & B[1];
assign sig_21 = A[2] & B[1];
assign sig_22 = A[3] & B[1];
assign sig_23 = A[4] & B[1];
assign sig_24 = A[5] & B[1];
assign sig_25 = A[6] & B[1];
assign sig_26 = A[7] & B[1];
assign sig_34 = sig_14 ^ sig_21;
assign sig_35 = sig_14 & sig_21;
assign sig_36 = sig_34 & sig_20;
assign sig_37 = sig_34 ^ sig_20;
assign sig_38 = sig_35 | sig_36;
assign sig_39 = sig_15 ^ sig_22;
assign sig_40 = sig_15 & sig_22;
assign sig_41 = sig_39 & sig_38;
assign sig_42 = sig_39 ^ sig_38;
assign sig_43 = sig_40 | sig_41;
assign sig_44 = sig_16 ^ sig_23;
assign sig_45 = sig_16 & sig_23;
assign sig_46 = sig_44 & sig_43;
assign sig_47 = sig_44 ^ sig_43;
assign sig_48 = sig_45 | sig_46;
assign sig_49 = sig_17 ^ sig_24;
assign sig_50 = sig_17 & sig_24;
assign sig_51 = sig_49 & sig_48;
assign sig_52 = sig_49 ^ sig_48;
assign sig_53 = sig_50 | sig_51;
assign sig_54 = sig_18 ^ sig_25;
assign sig_55 = sig_18 & sig_25;
assign sig_56 = sig_54 & sig_53;
assign sig_57 = sig_54 ^ sig_53;
assign sig_58 = sig_55 | sig_56;
assign sig_59 = sig_58 & A[7];
assign sig_60 = sig_58 ^ sig_26;
assign sig_61 = A[0] & B[2];
assign sig_62 = A[1] & B[2];
assign sig_63 = A[2] & B[2];
assign sig_64 = A[3] & B[2];
assign sig_65 = A[4] & B[2];
assign sig_66 = A[5] & B[2];
assign sig_67 = A[6] & B[2];
assign sig_68 = A[7] & B[2];
assign sig_71 = sig_37 ^ sig_62;
assign sig_72 = sig_37 & sig_62;
assign sig_76 = sig_42 ^ sig_63;
assign sig_77 = sig_42 & sig_63;
assign sig_78 = sig_76 & sig_72;
assign sig_79 = sig_76 ^ sig_72;
assign sig_80 = sig_77 | sig_78;
assign sig_81 = sig_47 ^ sig_64;
assign sig_82 = sig_47 & sig_64;
assign sig_83 = sig_81 & sig_80;
assign sig_84 = sig_81 ^ sig_80;
assign sig_85 = sig_82 | sig_83;
assign sig_86 = sig_52 ^ sig_65;
assign sig_87 = sig_52 & sig_65;
assign sig_88 = sig_86 & sig_85;
assign sig_89 = sig_86 ^ sig_85;
assign sig_90 = sig_87 | sig_88;
assign sig_91 = sig_57 ^ sig_66;
assign sig_92 = sig_57 & sig_66;
assign sig_93 = sig_91 & sig_90;
assign sig_94 = sig_91 ^ sig_90;
assign sig_95 = sig_92 | sig_93;
assign sig_96 = sig_60 ^ sig_67;
assign sig_97 = sig_60 & sig_67;
assign sig_98 = sig_96 & sig_95;
assign sig_99 = sig_96 ^ sig_95;
assign sig_100 = sig_97 | sig_98;
assign sig_101 = sig_59 ^ sig_68;
assign sig_102 = sig_59 & B[2];
assign sig_103 = A[7] & sig_100;
assign sig_104 = sig_101 ^ sig_100;
assign sig_105 = sig_102 | sig_103;

assign O[10] = sig_105;
assign O[9] = sig_104;
assign O[8] = sig_99;
assign O[7] = sig_94;
assign O[6] = sig_89;
assign O[5] = sig_84;
assign O[4] = sig_79;
assign O[3] = sig_71;
assign O[2] = sig_61;
assign O[1] = sig_11;
assign O[0] = sig_11;

endmodule


