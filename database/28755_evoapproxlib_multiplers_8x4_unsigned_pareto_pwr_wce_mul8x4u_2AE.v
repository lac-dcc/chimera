// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 1.45 %
// MAE = 60 
// WCE% = 5.35 %
// WCE = 219 
// WCRE% = 100.00 %
// EP% = 92.72 %
// MRE% = 20.48 %
// MSE = 5621 
// PDK45_PWR = 0.035 mW
// PDK45_AREA = 115.0 um2
// PDK45_DELAY = 0.59 ns

module mul8x4u_2AE (
    A,
    B,
    O
);

input [7:0] A;
input [3:0] B;
output [11:0] O;

wire sig_12,sig_13,sig_19,sig_27,sig_60,sig_61,sig_67,sig_68,sig_69,sig_97,sig_98,sig_99,sig_100,sig_101,sig_102,sig_103,sig_104,sig_105,sig_106,sig_111;
wire sig_112,sig_113,sig_114,sig_132,sig_133,sig_137,sig_138,sig_139,sig_140,sig_141,sig_142,sig_143,sig_144,sig_145,sig_146,sig_147,sig_148,sig_149,sig_150,sig_151;

assign sig_12 = A[6] & B[1];
assign sig_13 = A[3] & B[3];
assign sig_19 = A[7] & B[0];
assign sig_27 = A[7] & B[1];
assign sig_60 = sig_12 & A[7];
assign sig_61 = sig_12 ^ sig_27;
assign sig_67 = A[5] & B[2];
assign sig_68 = A[6] & B[2];
assign sig_69 = A[7] & B[2];
assign sig_97 = sig_61 ^ sig_68;
assign sig_98 = sig_61 & sig_68;
assign sig_99 = sig_97 & sig_67;
assign sig_100 = sig_97 ^ sig_67;
assign sig_101 = sig_98 | sig_99;
assign sig_102 = sig_60 ^ sig_69;
assign sig_103 = sig_60 & B[2];
assign sig_104 = A[7] & sig_101;
assign sig_105 = sig_102 ^ sig_101;
assign sig_106 = sig_103 | sig_104;
assign sig_111 = A[4] & B[3];
assign sig_112 = A[5] & B[3];
assign sig_113 = A[6] & B[3];
assign sig_114 = A[7] & B[3];
assign sig_132 = sig_19 | sig_111;
assign sig_133 = sig_19 & sig_111;
assign sig_137 = sig_100 ^ sig_112;
assign sig_138 = sig_100 & sig_112;
assign sig_139 = sig_137 & sig_133;
assign sig_140 = sig_137 ^ sig_133;
assign sig_141 = sig_138 | sig_139;
assign sig_142 = sig_105 ^ sig_113;
assign sig_143 = sig_105 & sig_113;
assign sig_144 = sig_142 & sig_141;
assign sig_145 = sig_142 ^ sig_141;
assign sig_146 = sig_143 | sig_144;
assign sig_147 = sig_106 ^ sig_114;
assign sig_148 = sig_106 & B[3];
assign sig_149 = sig_114 & sig_146;
assign sig_150 = sig_147 ^ sig_146;
assign sig_151 = sig_148 | sig_149;

assign O[11] = sig_151;
assign O[10] = sig_150;
assign O[9] = sig_145;
assign O[8] = sig_140;
assign O[7] = sig_132;
assign O[6] = sig_13;
assign O[5] = sig_132;
assign O[4] = sig_111;
assign O[3] = sig_13;
assign O[2] = sig_150;
assign O[1] = sig_13;
assign O[0] = 1'b0;

endmodule


