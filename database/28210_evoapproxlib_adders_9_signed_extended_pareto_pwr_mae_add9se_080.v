// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 7.32 %
// MAE = 38 
// WCE% = 24.61 %
// WCE = 126 
// WCRE% = 4000.00 %
// EP% = 99.21 %
// MRE% = 44.90 %
// MSE = 2070 
// PDK45_PWR = 0.010 mW
// PDK45_AREA = 24.4 um2
// PDK45_DELAY = 0.23 ns

module add9se_080 (
    A,
    B,
    O
);

input [8:0] A;
input [8:0] B;
output [9:0] O;

wire sig_45,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55,sig_56,sig_57,sig_58,sig_59,sig_61;

assign sig_45 = A[6] | B[6];
assign sig_50 = A[7] ^ B[7];
assign sig_51 = A[7] & B[7];
assign sig_52 = sig_50 & sig_45;
assign sig_53 = sig_50 ^ sig_45;
assign sig_54 = sig_51 | sig_52;
assign sig_55 = A[8] ^ B[8];
assign sig_56 = A[8] & B[8];
assign sig_57 = sig_55 & sig_54;
assign sig_58 = sig_55 ^ sig_54;
assign sig_59 = sig_56 | sig_57;
assign sig_61 = sig_55 ^ sig_59;

assign O[9] = sig_61;
assign O[8] = sig_58;
assign O[7] = sig_53;
assign O[6] = 1'b0;
assign O[5] = sig_53;
assign O[4] = 1'b0;
assign O[3] = sig_58;
assign O[2] = sig_61;
assign O[1] = sig_58;
assign O[0] = 1'b0;

endmodule


