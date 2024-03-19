/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 4.36 %
// MAE = 89 
// WCE% = 13.62 %
// WCE = 279 
// WCRE% = 150.00 %
// EP% = 86.91 %
// MRE% = 43.25 %
// MSE = 13470 
// PDK45_PWR = 0.0057 mW
// PDK45_AREA = 30.0 um2
// PDK45_DELAY = 0.15 ns

module mul8x3u_1A4 (
    A,
    B,
    O
);

input [7:0] A;
input [2:0] B;
output [10:0] O;

wire sig_32,sig_33,sig_34,sig_63,sig_64,sig_66,sig_67,sig_68,sig_81,sig_82,sig_83,sig_97,sig_98;

assign sig_32 = B[2] & A[5];
assign sig_33 = A[6] & B[2];
assign sig_34 = A[7] & B[2];
assign sig_63 = B[1] & A[6];
assign sig_64 = B[1] & A[7];
assign sig_66 = sig_63 | sig_64;
assign sig_67 = sig_64 & sig_33;
assign sig_68 = sig_64 ^ sig_33;
assign sig_81 = sig_68 ^ sig_66;
assign sig_82 = sig_68 & B[1];
assign sig_83 = sig_34 ^ sig_67;
assign sig_97 = sig_83 ^ sig_82;
assign sig_98 = sig_34 & sig_66;

assign O[10] = sig_98;
assign O[9] = sig_97;
assign O[8] = sig_81;
assign O[7] = sig_32;
assign O[6] = sig_81;
assign O[5] = sig_32;
assign O[4] = 1'b0;
assign O[3] = sig_83;
assign O[2] = sig_34;
assign O[1] = sig_32;
assign O[0] = 1'b0;

endmodule


