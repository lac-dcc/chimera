/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 16.64 %
// MAE = 43 
// WCE% = 50.00 %
// WCE = 128 
// WCRE% = 6350.00 %
// EP% = 99.22 %
// MRE% = 75.00 %
// MSE = 2723 
// PDK45_PWR = 0.002 mW
// PDK45_AREA = 10.8 um2
// PDK45_DELAY = 0.09 ns

module add8se_7N1 (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [8:0] O;

wire sig_29,sig_32,sig_53,sig_68,sig_72,sig_82,sig_84;

assign sig_29 = A[6] | B[6];
assign sig_32 = A[7] ^ B[7];
assign sig_53 = B[7] | A[7];
assign sig_68 = A[7] | B[7];
assign sig_72 = sig_29 | sig_53;
assign sig_82 = sig_32 ^ sig_72;
assign sig_84 = sig_32 ^ sig_68;

assign O[8] = sig_84;
assign O[7] = 1'b0;
assign O[6] = sig_82;
assign O[5] = sig_82;
assign O[4] = sig_82;
assign O[3] = sig_82;
assign O[2] = sig_82;
assign O[1] = sig_82;
assign O[0] = sig_82;

endmodule


