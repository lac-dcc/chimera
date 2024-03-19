/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 3.14 %
// MAE = 129 
// WCE% = 11.94 %
// WCE = 489 
// WCRE% = 806.25 %
// EP% = 93.12 %
// MRE% = 37.30 %
// MSE = 26288 
// PDK45_PWR = 0.017 mW
// PDK45_AREA = 73.7 um2
// PDK45_DELAY = 0.34 ns

module mul8x4u_1YD (
    A,
    B,
    O
);

input [7:0] A;
input [3:0] B;
output [11:0] O;

wire sig_27,sig_35,sig_40,sig_42,sig_43,sig_74,sig_76,sig_80,sig_97,sig_107,sig_110,sig_113,sig_124,sig_125,sig_127,sig_128,sig_129,sig_130,sig_139,sig_140;
wire sig_143,sig_144,sig_153,sig_154,sig_195,sig_196;

assign sig_27 = A[7] & B[1];
assign sig_35 = A[7] & B[2];
assign sig_40 = A[4] & B[1];
assign sig_42 = A[6] & B[3];
assign sig_43 = A[7] & B[3];
assign sig_74 = ~A[7];
assign sig_76 = sig_35 & A[6];
assign sig_80 = sig_27 & B[1];
assign sig_97 = B[2] & A[6];
assign sig_107 = B[3] & A[5];
assign sig_110 = sig_35 ^ sig_76;
assign sig_113 = sig_110 | sig_42;
assign sig_124 = sig_74 & sig_97;
assign sig_125 = sig_80 | sig_40;
assign sig_127 = sig_113 ^ sig_107;
assign sig_128 = sig_113 & sig_107;
assign sig_129 = sig_43 ^ sig_76;
assign sig_130 = B[3] & sig_76;
assign sig_139 = sig_125 | sig_124;
assign sig_140 = sig_125 & sig_124;
assign sig_143 = sig_129 ^ sig_128;
assign sig_144 = A[7] & sig_128;
assign sig_153 = B[3] & sig_140;
assign sig_154 = sig_127 ^ sig_140;
assign sig_195 = sig_143 | sig_153;
assign sig_196 = sig_130 | sig_144;

assign O[11] = sig_196;
assign O[10] = sig_195;
assign O[9] = sig_154;
assign O[8] = sig_139;
assign O[7] = sig_27;
assign O[6] = sig_127;
assign O[5] = sig_139;
assign O[4] = sig_195;
assign O[3] = sig_43;
assign O[2] = sig_127;
assign O[1] = sig_40;
assign O[0] = sig_42;

endmodule


