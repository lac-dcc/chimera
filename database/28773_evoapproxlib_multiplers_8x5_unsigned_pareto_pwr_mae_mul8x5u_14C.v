// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 2.75 %
// MAE = 225 
// WCE% = 11.49 %
// WCE = 941 
// WCRE% = 300.00 %
// EP% = 96.39 %
// MRE% = 31.14 %
// MSE = 82463 
// PDK45_PWR = 0.024 mW
// PDK45_AREA = 85.4 um2
// PDK45_DELAY = 0.47 ns

module mul8x5u_14C (
    A,
    B,
    O
);

input [7:0] A;
input [4:0] B;
output [12:0] O;

wire sig_70,sig_99,sig_113,sig_114,sig_115,sig_143,sig_145,sig_146,sig_148,sig_149,sig_150,sig_151,sig_152,sig_157,sig_158,sig_159,sig_160,sig_178,sig_181,sig_182;
wire sig_183,sig_184,sig_186,sig_187,sig_188,sig_189,sig_190,sig_191,sig_192,sig_193,sig_194,sig_195,sig_196,sig_197;

assign sig_70 = A[7] & B[2];
assign sig_99 = B[1] & A[6];
assign sig_113 = A[5] & B[3];
assign sig_114 = A[6] & B[3];
assign sig_115 = A[7] & B[3];
assign sig_143 = sig_99 | sig_114;
assign sig_145 = A[6] & sig_113;
assign sig_146 = sig_143 ^ sig_113;
assign sig_148 = sig_70 ^ sig_115;
assign sig_149 = sig_70 & sig_115;
assign sig_150 = sig_148 & sig_145;
assign sig_151 = sig_148 ^ sig_145;
assign sig_152 = sig_149 | sig_150;
assign sig_157 = A[4] & B[4];
assign sig_158 = A[5] & B[4];
assign sig_159 = A[6] & B[4];
assign sig_160 = A[7] & B[4];
assign sig_178 = A[7] ^ sig_157;
assign sig_181 = sig_178 ^ A[7];
assign sig_182 = B[4] & sig_114;
assign sig_183 = sig_146 ^ sig_158;
assign sig_184 = sig_146 & sig_158;
assign sig_186 = sig_183 ^ sig_182;
assign sig_187 = sig_184 | sig_182;
assign sig_188 = sig_151 ^ sig_159;
assign sig_189 = sig_151 & sig_159;
assign sig_190 = sig_188 & sig_187;
assign sig_191 = sig_188 ^ sig_187;
assign sig_192 = sig_189 | sig_190;
assign sig_193 = sig_152 ^ sig_160;
assign sig_194 = sig_152 & B[4];
assign sig_195 = sig_160 & sig_192;
assign sig_196 = sig_193 ^ sig_192;
assign sig_197 = sig_194 | sig_195;

assign O[12] = sig_197;
assign O[11] = sig_196;
assign O[10] = sig_191;
assign O[9] = sig_186;
assign O[8] = sig_181;
assign O[7] = sig_157;
assign O[6] = 1'b0;
assign O[5] = sig_197;
assign O[4] = sig_157;
assign O[3] = sig_70;
assign O[2] = sig_194;
assign O[1] = sig_181;
assign O[0] = sig_191;

endmodule


