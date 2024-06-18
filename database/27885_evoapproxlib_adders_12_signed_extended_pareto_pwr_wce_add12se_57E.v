// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 0.20 %
// MAE = 8.2 
// WCE% = 0.46 %
// WCE = 19 
// WCRE% = 1800.00 %
// EP% = 96.97 %
// MRE% = 3.25 %
// MSE = 90 
// PDK45_PWR = 0.033 mW
// PDK45_AREA = 66.6 um2
// PDK45_DELAY = 0.60 ns

module add12se_57E (
    A,
    B,
    O
);

input [11:0] A;
input [11:0] B;
output [12:0] O;

wire sig_34,sig_35,sig_36,sig_37,sig_38,sig_39,sig_40,sig_41,sig_42,sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_55,sig_56,sig_57,sig_58,sig_59;
wire sig_60,sig_61,sig_62,sig_63,sig_67,sig_69,sig_70,sig_71,sig_73,sig_74,sig_75,sig_78,sig_79,sig_84,sig_85,sig_86,sig_87,sig_88,sig_89,sig_90;
wire sig_91,sig_96,sig_97,sig_98,sig_99,sig_100,sig_101,sig_102,sig_103;

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
assign sig_55 = sig_37 & sig_34;
assign sig_56 = sig_37 & sig_35;
assign sig_57 = sig_36 | sig_55;
assign sig_58 = sig_41 & sig_38;
assign sig_59 = sig_41 & sig_39;
assign sig_60 = sig_40 | sig_58;
assign sig_61 = sig_45 & sig_42;
assign sig_62 = sig_45 & sig_43;
assign sig_63 = sig_44 | sig_61;
assign sig_67 = sig_56 & A[4];
assign sig_69 = sig_62 & sig_60;
assign sig_70 = sig_62 & sig_59;
assign sig_71 = sig_63 | sig_69;
assign sig_73 = sig_57 | sig_67;
assign sig_74 = sig_70 & sig_73;
assign sig_75 = sig_71 | sig_74;
assign sig_78 = sig_59 & sig_73;
assign sig_79 = sig_60 | sig_78;
assign sig_84 = sig_35 & A[4];
assign sig_85 = sig_34 | sig_84;
assign sig_86 = sig_39 & sig_73;
assign sig_87 = sig_38 | sig_86;
assign sig_88 = sig_43 & sig_79;
assign sig_89 = sig_42 | sig_88;
assign sig_90 = sig_47 & sig_75;
assign sig_91 = sig_46 | sig_90;
assign sig_96 = sig_35 ^ A[4];
assign sig_97 = sig_37 ^ sig_85;
assign sig_98 = sig_39 ^ sig_73;
assign sig_99 = sig_41 ^ sig_87;
assign sig_100 = sig_43 ^ sig_79;
assign sig_101 = sig_45 ^ sig_89;
assign sig_102 = sig_47 ^ sig_75;
assign sig_103 = sig_48 ^ sig_91;

assign O[12] = sig_103;
assign O[11] = sig_102;
assign O[10] = sig_101;
assign O[9] = sig_100;
assign O[8] = sig_99;
assign O[7] = sig_98;
assign O[6] = sig_97;
assign O[5] = sig_96;
assign O[4] = B[4];
assign O[3] = A[3];
assign O[2] = B[2];
assign O[1] = sig_79;
assign O[0] = B[8];

endmodule


