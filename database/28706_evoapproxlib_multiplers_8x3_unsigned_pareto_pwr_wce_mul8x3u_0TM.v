// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 4.51 %
// MAE = 92 
// WCE% = 14.45 %
// WCE = 296 
// WCRE% = 178.12 %
// EP% = 87.11 %
// MRE% = 44.73 %
// MSE = 14111 
// PDK45_PWR = 0.0051 mW
// PDK45_AREA = 25.8 um2
// PDK45_DELAY = 0.14 ns

module mul8x3u_0TM (
    A,
    B,
    O
);

input [7:0] A;
input [2:0] B;
output [10:0] O;

wire sig_24,sig_26,sig_32,sig_34,sig_63,sig_66,sig_67,sig_68,sig_72,sig_81,sig_82,sig_83,sig_97,sig_111;

assign sig_24 = A[6] & B[2];
assign sig_26 = A[7] & B[1];
assign sig_32 = A[5] & B[2];
assign sig_34 = A[7] & B[2];
assign sig_63 = B[1] & A[6];
assign sig_66 = sig_63 | sig_26;
assign sig_67 = sig_26 & sig_24;
assign sig_68 = sig_26 ^ sig_24;
assign sig_72 = sig_34 & sig_66;
assign sig_81 = sig_68 ^ sig_66;
assign sig_82 = sig_68 & B[1];
assign sig_83 = sig_34 ^ sig_67;
assign sig_97 = sig_83 ^ sig_82;
assign sig_111 = sig_67 | sig_72;

assign O[10] = sig_111;
assign O[9] = sig_97;
assign O[8] = sig_81;
assign O[7] = sig_32;
assign O[6] = sig_81;
assign O[5] = sig_81;
assign O[4] = sig_32;
assign O[3] = 1'b0;
assign O[2] = sig_81;
assign O[1] = sig_32;
assign O[0] = sig_34;

endmodule


