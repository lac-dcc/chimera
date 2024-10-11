// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 1.66 %
// MAE = 17 
// WCE% = 6.15 %
// WCE = 63 
// WCRE% = 100.00 %
// EP% = 73.24 %
// MRE% = 18.64 %
// MSE = 615 
// PDK45_PWR = 0.0086 mW
// PDK45_AREA = 39.9 um2
// PDK45_DELAY = 0.18 ns

module mul8x2u_0ZV (
    A,
    B,
    O
);

input [7:0] A;
input [1:0] B;
output [9:0] O;

wire sig_15,sig_16,sig_17,sig_20,sig_23,sig_24,sig_28,sig_36,sig_37,sig_38,sig_39,sig_50,sig_51,sig_53,sig_65;

assign sig_15 = A[5] & B[0];
assign sig_16 = A[6] & B[0];
assign sig_17 = A[7] & B[0];
assign sig_20 = B[0] & A[4];
assign sig_23 = A[5] & B[1];
assign sig_24 = A[6] & B[1];
assign sig_28 = A[7] & B[1];
assign sig_36 = sig_16 & sig_23;
assign sig_37 = sig_16 | sig_23;
assign sig_38 = sig_17 & sig_24;
assign sig_39 = sig_17 ^ sig_24;
assign sig_50 = sig_39 & sig_36;
assign sig_51 = sig_39 ^ sig_36;
assign sig_53 = sig_28 ^ sig_38;
assign sig_65 = sig_53 | sig_50;

assign O[9] = sig_38;
assign O[8] = sig_65;
assign O[7] = sig_51;
assign O[6] = sig_37;
assign O[5] = sig_20;
assign O[4] = sig_15;
assign O[3] = sig_15;
assign O[2] = sig_37;
assign O[1] = sig_15;
assign O[0] = sig_38;

endmodule


