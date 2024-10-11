// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 4.22 %
// MAE = 11 
// WCE% = 13.28 %
// WCE = 34 
// WCRE% = 3100.00 %
// EP% = 97.07 %
// MRE% = 38.69 %
// MSE = 175 
// PDK45_PWR = 0.0094 mW
// PDK45_AREA = 23.5 um2
// PDK45_DELAY = 0.19 ns

module add8se_8TX (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [8:0] O;

wire sig_28,sig_29,sig_30,sig_31,sig_32,sig_40,sig_46,sig_57,sig_58,sig_63,sig_64,sig_65,sig_66;

assign sig_28 = A[6] & B[6];
assign sig_29 = A[6] ^ B[6];
assign sig_30 = A[7] & B[7];
assign sig_31 = A[7] ^ B[7];
assign sig_32 = A[7] ^ B[7];
assign sig_40 = sig_29 & B[5];
assign sig_46 = sig_28 | sig_40;
assign sig_57 = sig_31 & sig_46;
assign sig_58 = sig_30 | sig_57;
assign sig_63 = ~B[5];
assign sig_64 = sig_29 ^ B[5];
assign sig_65 = sig_31 ^ sig_46;
assign sig_66 = sig_32 ^ sig_58;

assign O[8] = sig_66;
assign O[7] = sig_65;
assign O[6] = sig_64;
assign O[5] = sig_63;
assign O[4] = A[5];
assign O[3] = B[4];
assign O[2] = B[4];
assign O[1] = sig_64;
assign O[0] = A[1];

endmodule


