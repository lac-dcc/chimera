// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 3.81 %
// MAE = 312 
// WCE% = 15.44 %
// WCE = 1265 
// WCRE% = 303.12 %
// EP% = 96.37 %
// MRE% = 38.51 %
// MSE = 154036 
// PDK45_PWR = 0.015 mW
// PDK45_AREA = 56.3 um2
// PDK45_DELAY = 0.30 ns

module mul8x5u_0N9 (
    A,
    B,
    O
);

input [7:0] A;
input [4:0] B;
output [12:0] O;

wire sig_36,sig_44,sig_50,sig_51,sig_52,sig_97,sig_99,sig_100,sig_163,sig_167,sig_168,sig_172,sig_173,sig_186,sig_187,sig_188,sig_189,sig_203,sig_204,sig_207;

assign sig_36 = A[7] & B[2];
assign sig_44 = A[7] & B[3];
assign sig_50 = A[5] & B[4];
assign sig_51 = A[6] & B[4];
assign sig_52 = A[7] & B[4];
assign sig_97 = A[6] | A[5];
assign sig_99 = sig_44 ^ sig_51;
assign sig_100 = sig_44 & sig_51;
assign sig_163 = sig_97 & B[3];
assign sig_167 = sig_99 ^ sig_36;
assign sig_168 = sig_99 & sig_36;
assign sig_172 = sig_52 & sig_163;
assign sig_173 = sig_52 ^ sig_100;
assign sig_186 = sig_167 ^ sig_163;
assign sig_187 = sig_167 & sig_163;
assign sig_188 = sig_173 ^ sig_168;
assign sig_189 = B[4] & sig_168;
assign sig_203 = sig_188 ^ sig_187;
assign sig_204 = sig_172 | sig_189;
assign sig_207 = A[4] & B[4];

assign O[12] = sig_204;
assign O[11] = sig_203;
assign O[10] = sig_186;
assign O[9] = sig_207;
assign O[8] = sig_50;
assign O[7] = sig_204;
assign O[6] = 1'b0;
assign O[5] = 1'b0;
assign O[4] = sig_172;
assign O[3] = sig_186;
assign O[2] = sig_207;
assign O[1] = 1'b0;
assign O[0] = sig_203;

endmodule


