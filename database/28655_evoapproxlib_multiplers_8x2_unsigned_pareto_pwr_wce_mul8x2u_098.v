// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 2.00 %
// MAE = 20 
// WCE% = 7.91 %
// WCE = 81 
// WCRE% = 100.00 %
// EP% = 73.83 %
// MRE% = 25.39 %
// MSE = 829 
// PDK45_PWR = 0.0071 mW
// PDK45_AREA = 31.4 um2
// PDK45_DELAY = 0.19 ns

module mul8x2u_098 (
    A,
    B,
    O
);

input [7:0] A;
input [1:0] B;
output [9:0] O;

wire sig_12,sig_15,sig_17,sig_24,sig_25,sig_28,sig_35,sig_39,sig_50,sig_51,sig_52,sig_64;

assign sig_12 = A[6] & B[0];
assign sig_15 = A[5] & B[1];
assign sig_17 = A[7] & B[0];
assign sig_24 = A[6] & B[1];
assign sig_25 = A[7] & B[1];
assign sig_28 = sig_17 ^ sig_24;
assign sig_35 = B[1] & A[4];
assign sig_39 = sig_17 & sig_24;
assign sig_50 = sig_28 ^ sig_12;
assign sig_51 = sig_28 & sig_12;
assign sig_52 = sig_25 ^ sig_39;
assign sig_64 = sig_52 | sig_51;

assign O[9] = sig_39;
assign O[8] = sig_64;
assign O[7] = sig_50;
assign O[6] = sig_35;
assign O[5] = sig_15;
assign O[4] = sig_15;
assign O[3] = sig_15;
assign O[2] = sig_15;
assign O[1] = 1'b0;
assign O[0] = 1'b0;

endmodule


