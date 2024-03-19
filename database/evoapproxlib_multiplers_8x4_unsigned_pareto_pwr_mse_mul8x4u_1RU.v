/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 1.71 %
// MAE = 70 
// WCE% = 6.67 %
// WCE = 273 
// WCRE% = 106.25 %
// EP% = 92.65 %
// MRE% = 22.99 %
// MSE = 7822 
// PDK45_PWR = 0.032 mW
// PDK45_AREA = 108.4 um2
// PDK45_DELAY = 0.47 ns

module mul8x4u_1RU (
    A,
    B,
    O
);

input [7:0] A;
input [3:0] B;
output [11:0] O;

wire sig_26,sig_28,sig_56,sig_57,sig_60,sig_61,sig_66,sig_67,sig_68,sig_69,sig_97,sig_98,sig_99,sig_100,sig_101,sig_102,sig_103,sig_104,sig_105,sig_106;
wire sig_112,sig_114,sig_137,sig_138,sig_139,sig_140,sig_141,sig_142,sig_143,sig_144,sig_145,sig_146,sig_147,sig_148,sig_149,sig_150,sig_151;

assign sig_26 = A[6] & B[3];
assign sig_28 = B[1] & A[7];
assign sig_56 = B[0] & A[7];
assign sig_57 = B[1] & A[6];
assign sig_60 = sig_56 & B[1];
assign sig_61 = sig_56 ^ sig_28;
assign sig_66 = A[4] & B[3];
assign sig_67 = A[5] & B[2];
assign sig_68 = A[6] & B[2];
assign sig_69 = A[7] & B[2];
assign sig_97 = sig_61 ^ sig_68;
assign sig_98 = sig_61 & sig_68;
assign sig_99 = sig_97 & sig_67;
assign sig_100 = sig_97 ^ sig_67;
assign sig_101 = sig_98 | sig_99;
assign sig_102 = sig_60 ^ sig_69;
assign sig_103 = sig_60 & sig_69;
assign sig_104 = A[7] & sig_101;
assign sig_105 = sig_102 ^ sig_101;
assign sig_106 = sig_103 | sig_104;
assign sig_112 = A[5] & B[3];
assign sig_114 = A[7] & B[3];
assign sig_137 = sig_100 ^ sig_112;
assign sig_138 = sig_100 & sig_112;
assign sig_139 = sig_137 & sig_66;
assign sig_140 = sig_137 ^ sig_66;
assign sig_141 = sig_138 | sig_139;
assign sig_142 = sig_105 ^ sig_26;
assign sig_143 = sig_105 & sig_26;
assign sig_144 = sig_142 & sig_141;
assign sig_145 = sig_142 ^ sig_141;
assign sig_146 = sig_143 | sig_144;
assign sig_147 = sig_106 ^ sig_114;
assign sig_148 = sig_106 & sig_114;
assign sig_149 = A[7] & sig_146;
assign sig_150 = sig_147 ^ sig_146;
assign sig_151 = sig_148 | sig_149;

assign O[11] = sig_151;
assign O[10] = sig_150;
assign O[9] = sig_145;
assign O[8] = sig_140;
assign O[7] = sig_57;
assign O[6] = sig_57;
assign O[5] = sig_57;
assign O[4] = sig_60;
assign O[3] = sig_140;
assign O[2] = sig_57;
assign O[1] = 1'b0;
assign O[0] = sig_106;

endmodule


