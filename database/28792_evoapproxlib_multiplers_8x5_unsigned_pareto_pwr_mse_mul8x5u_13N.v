// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 3.70 %
// MAE = 303 
// WCE% = 13.88 %
// WCE = 1137 
// WCRE% = 115.82 %
// EP% = 96.36 %
// MRE% = 39.67 %
// MSE = 142736 
// PDK45_PWR = 0.014 mW
// PDK45_AREA = 51.6 um2
// PDK45_DELAY = 0.34 ns

module mul8x5u_13N (
    A,
    B,
    O
);

input [7:0] A;
input [4:0] B;
output [12:0] O;

wire sig_41,sig_50,sig_93,sig_130,sig_134,sig_136,sig_142,sig_167,sig_168,sig_169,sig_170,sig_171,sig_182,sig_183,sig_184,sig_185,sig_196,sig_197,sig_208;

assign sig_41 = A[7] & B[2];
assign sig_50 = B[2] & sig_41;
assign sig_93 = A[7] & B[3];
assign sig_130 = A[6] & B[4];
assign sig_134 = A[5] & B[4];
assign sig_136 = A[7] & B[4];
assign sig_142 = A[6] & B[3];
assign sig_167 = sig_93 ^ sig_130;
assign sig_168 = sig_93 & sig_130;
assign sig_169 = sig_167 & sig_50;
assign sig_170 = sig_167 ^ sig_50;
assign sig_171 = sig_168 | sig_169;
assign sig_182 = sig_170 & sig_134;
assign sig_183 = sig_170 ^ sig_134;
assign sig_184 = sig_136 & sig_171;
assign sig_185 = sig_136 ^ sig_171;
assign sig_196 = A[7] & sig_182;
assign sig_197 = sig_185 ^ sig_182;
assign sig_208 = sig_184 | sig_196;

assign O[12] = sig_208;
assign O[11] = sig_197;
assign O[10] = sig_183;
assign O[9] = sig_142;
assign O[8] = sig_142;
assign O[7] = sig_130;
assign O[6] = sig_183;
assign O[5] = sig_142;
assign O[4] = sig_183;
assign O[3] = 1'b0;
assign O[2] = sig_185;
assign O[1] = sig_208;
assign O[0] = sig_41;

endmodule


