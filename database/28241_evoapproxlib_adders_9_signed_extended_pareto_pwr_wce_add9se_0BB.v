// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 12.32 %
// MAE = 63 
// WCE% = 26.17 %
// WCE = 134 
// WCRE% = 7400.00 %
// EP% = 99.92 %
// MRE% = 142.15 %
// MSE = 4705 
// PDK45_PWR = 0.0056 mW
// PDK45_AREA = 18.3 um2
// PDK45_DELAY = 0.17 ns

module add9se_0BB (
    A,
    B,
    O
);

input [8:0] A;
input [8:0] B;
output [9:0] O;

wire sig_50,sig_51,sig_55,sig_56,sig_57,sig_58,sig_59,sig_61;

assign sig_50 = A[7] ^ B[7];
assign sig_51 = A[7] & B[7];
assign sig_55 = A[8] ^ B[8];
assign sig_56 = A[8] & B[8];
assign sig_57 = sig_55 & sig_51;
assign sig_58 = sig_55 ^ sig_51;
assign sig_59 = sig_56 | sig_57;
assign sig_61 = sig_55 ^ sig_59;

assign O[9] = sig_61;
assign O[8] = sig_58;
assign O[7] = sig_50;
assign O[6] = B[6];
assign O[5] = A[6];
assign O[4] = A[6];
assign O[3] = B[2];
assign O[2] = A[6];
assign O[1] = sig_61;
assign O[0] = sig_61;

endmodule


