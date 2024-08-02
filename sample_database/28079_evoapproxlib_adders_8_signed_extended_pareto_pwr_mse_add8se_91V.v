// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 7.42 %
// MAE = 19 
// WCE% = 25.00 %
// WCE = 64 
// WCRE% = 6300.00 %
// EP% = 98.45 %
// MRE% = 67.81 %
// MSE = 545 
// PDK45_PWR = 0.0042 mW
// PDK45_AREA = 11.7 um2
// PDK45_DELAY = 0.13 ns

module add8se_91V (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [8:0] O;

wire sig_26,sig_30,sig_31,sig_32,sig_57,sig_58,sig_65,sig_66;

assign sig_26 = ~B[6];
assign sig_30 = A[7] & B[7];
assign sig_31 = A[7] ^ B[7];
assign sig_32 = A[7] ^ B[7];
assign sig_57 = sig_31 & B[6];
assign sig_58 = sig_30 | sig_57;
assign sig_65 = sig_31 ^ B[6];
assign sig_66 = sig_32 ^ sig_58;

assign O[8] = sig_66;
assign O[7] = sig_65;
assign O[6] = sig_26;
assign O[5] = A[6];
assign O[4] = A[5];
assign O[3] = B[5];
assign O[2] = B[5];
assign O[1] = A[6];
assign O[0] = A[6];

endmodule


