// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 3.97 %
// MAE = 162 
// WCE% = 18.63 %
// WCE = 763 
// WCRE% = 106.25 %
// EP% = 93.09 %
// MRE% = 39.63 %
// MSE = 43327 
// PDK45_PWR = 0.010 mW
// PDK45_AREA = 48.3 um2
// PDK45_DELAY = 0.26 ns

module mul8x4u_4Z7 (
    A,
    B,
    O
);

input [7:0] A;
input [3:0] B;
output [11:0] O;

wire sig_27,sig_68,sig_69,sig_97,sig_104,sig_112,sig_113,sig_114,sig_141,sig_142,sig_144,sig_145,sig_147,sig_148,sig_149,sig_150,sig_151;

assign sig_27 = A[7] & B[1];
assign sig_68 = A[6] & B[2];
assign sig_69 = A[7] & B[2];
assign sig_97 = sig_27 ^ sig_68;
assign sig_104 = sig_27 & sig_68;
assign sig_112 = A[5] & B[3];
assign sig_113 = A[6] & B[3];
assign sig_114 = A[7] & B[3];
assign sig_141 = sig_113 | sig_112;
assign sig_142 = sig_69 | sig_113;
assign sig_144 = sig_142 & sig_141;
assign sig_145 = sig_142 ^ sig_141;
assign sig_147 = sig_104 ^ sig_114;
assign sig_148 = sig_104 & sig_114;
assign sig_149 = A[7] & sig_144;
assign sig_150 = sig_147 ^ sig_144;
assign sig_151 = sig_148 | sig_149;

assign O[11] = sig_151;
assign O[10] = sig_150;
assign O[9] = sig_145;
assign O[8] = sig_97;
assign O[7] = sig_69;
assign O[6] = sig_97;
assign O[5] = sig_69;
assign O[4] = sig_112;
assign O[3] = sig_151;
assign O[2] = sig_27;
assign O[1] = sig_104;
assign O[0] = 1'b0;

endmodule


