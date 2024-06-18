// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 2.26 %
// MAE = 46 
// WCE% = 6.88 %
// WCE = 141 
// WCRE% = 200.00 %
// EP% = 85.89 %
// MRE% = 26.44 %
// MSE = 3573 
// PDK45_PWR = 0.017 mW
// PDK45_AREA = 72.3 um2
// PDK45_DELAY = 0.33 ns

module mul8x3u_1F9 (
    A,
    B,
    O
);

input [7:0] A;
input [2:0] B;
output [10:0] O;

wire sig_13,sig_22,sig_25,sig_26,sig_41,sig_46,sig_50,sig_51,sig_54,sig_59,sig_60,sig_66,sig_67,sig_68,sig_82,sig_83,sig_91,sig_96,sig_97,sig_98;
wire sig_99,sig_100,sig_101,sig_102,sig_103,sig_104,sig_105;

assign sig_13 = B[0] & A[7];
assign sig_22 = B[1] & A[7];
assign sig_25 = A[6] & B[1];
assign sig_26 = B[1] & B[0];
assign sig_41 = ~(sig_22 | A[6]);
assign sig_46 = A[4] & B[2];
assign sig_50 = A[6] & sig_26;
assign sig_51 = sig_25 & B[0];
assign sig_54 = sig_13 ^ sig_25;
assign sig_59 = sig_25 & sig_13;
assign sig_60 = sig_50 ^ sig_22;
assign sig_66 = A[5] & B[2];
assign sig_67 = A[6] & B[2];
assign sig_68 = A[7] & B[2];
assign sig_82 = B[0] & A[4];
assign sig_83 = ~sig_41;
assign sig_91 = sig_54 ^ sig_51;
assign sig_96 = sig_60 ^ sig_67;
assign sig_97 = sig_60 & sig_67;
assign sig_98 = sig_83 & sig_66;
assign sig_99 = sig_96 ^ sig_66;
assign sig_100 = sig_97 | sig_98;
assign sig_101 = sig_59 ^ sig_68;
assign sig_102 = sig_25 & sig_68;
assign sig_103 = sig_68 & sig_98;
assign sig_104 = sig_101 ^ sig_100;
assign sig_105 = sig_102 | sig_103;

assign O[10] = sig_105;
assign O[9] = sig_104;
assign O[8] = sig_99;
assign O[7] = sig_91;
assign O[6] = sig_46;
assign O[5] = sig_82;
assign O[4] = sig_82;
assign O[3] = 1'b0;
assign O[2] = sig_105;
assign O[1] = sig_105;
assign O[0] = 1'b0;

endmodule


