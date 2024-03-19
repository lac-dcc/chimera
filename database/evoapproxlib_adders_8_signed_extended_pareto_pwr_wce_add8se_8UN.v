/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 8.28 %
// MAE = 21 
// WCE% = 26.17 %
// WCE = 67 
// WCRE% = 6300.00 %
// EP% = 98.49 %
// MRE% = 56.09 %
// MSE = 672 
// PDK45_PWR = 0.0042 mW
// PDK45_AREA = 11.7 um2
// PDK45_DELAY = 0.13 ns

module add8se_8UN (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [8:0] O;

wire sig_46,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54;

assign sig_46 = ~A[6];
assign sig_48 = A[7] ^ B[7];
assign sig_49 = A[7] & B[7];
assign sig_50 = sig_48 & A[6];
assign sig_51 = sig_48 ^ A[6];
assign sig_52 = sig_49 | sig_50;
assign sig_53 = A[7] ^ B[7];
assign sig_54 = sig_53 ^ sig_52;

assign O[8] = sig_54;
assign O[7] = sig_51;
assign O[6] = sig_46;
assign O[5] = B[6];
assign O[4] = B[6];
assign O[3] = A[4];
assign O[2] = B[6];
assign O[1] = sig_51;
assign O[0] = sig_54;

endmodule


