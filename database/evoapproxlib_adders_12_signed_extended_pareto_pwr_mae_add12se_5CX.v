// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.81 %
// MAE = 33 
// WCE% = 2.10 %
// WCE = 86 
// WCRE% = 6400.00 %
// EP% = 99.22 %
// MRE% = 12.63 %
// MSE = 1513 
// PDK45_PWR = 0.023 mW
// PDK45_AREA = 48.8 um2
// PDK45_DELAY = 0.43 ns

module add12se_5CX (
    A,
    B,
    O
);

input [11:0] A;
input [11:0] B;
output [12:0] O;

wire sig_38,sig_39,sig_40,sig_41,sig_42,sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_58,sig_59,sig_60,sig_61,sig_62,sig_63,sig_74,sig_75,sig_76;
wire sig_77,sig_78,sig_79,sig_88,sig_89,sig_90,sig_91,sig_92,sig_93,sig_94,sig_95,sig_96,sig_97,sig_98,sig_99,sig_100,sig_107,sig_108,sig_109,sig_110;
wire sig_111,sig_112;

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
assign sig_58 = sig_41 & sig_38;
assign sig_59 = sig_41 & sig_39;
assign sig_60 = sig_40 | sig_58;
assign sig_61 = sig_45 & sig_42;
assign sig_62 = sig_45 & sig_43;
assign sig_63 = sig_44 | sig_61;
assign sig_74 = sig_43 & sig_60;
assign sig_75 = sig_43 & sig_59;
assign sig_76 = sig_42 | sig_74;
assign sig_77 = sig_62 & sig_60;
assign sig_78 = sig_62 & sig_59;
assign sig_79 = sig_63 | sig_77;
assign sig_88 = sig_47 & sig_79;
assign sig_89 = sig_47 & sig_78;
assign sig_90 = sig_46 | sig_88;
assign sig_91 = sig_39 & B[6];
assign sig_92 = sig_38 | sig_91;
assign sig_93 = sig_59 & B[6];
assign sig_94 = sig_60 | sig_93;
assign sig_95 = sig_75 & B[6];
assign sig_96 = sig_76 | sig_95;
assign sig_97 = sig_78 & B[6];
assign sig_98 = sig_79 | sig_97;
assign sig_99 = sig_89 & B[6];
assign sig_100 = sig_90 | sig_99;
assign sig_107 = sig_39 ^ B[6];
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
assign O[6] = A[6];
assign O[5] = A[5];
assign O[4] = 1'b0;
assign O[3] = A[4];
assign O[2] = 1'b0;
assign O[1] = 1'b0;
assign O[0] = sig_111;

endmodule


