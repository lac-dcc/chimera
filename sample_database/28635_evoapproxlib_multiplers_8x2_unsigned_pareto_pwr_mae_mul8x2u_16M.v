// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 1.50 %
// MAE = 15 
// WCE% = 8.30 %
// WCE = 85 
// WCRE% = 100.00 %
// EP% = 72.75 %
// MRE% = 21.82 %
// MSE = 528 
// PDK45_PWR = 0.0075 mW
// PDK45_AREA = 38.5 um2
// PDK45_DELAY = 0.25 ns

module mul8x2u_16M (
    A,
    B,
    O
);

input [7:0] A;
input [1:0] B;
output [9:0] O;

wire sig_16,sig_17,sig_21,sig_23,sig_24,sig_25,sig_26,sig_36,sig_37,sig_38,sig_39,sig_50,sig_51,sig_52,sig_64;

assign sig_16 = A[6] & B[0];
assign sig_17 = A[7] & B[0];
assign sig_21 = A[4] & B[1];
assign sig_23 = A[5] & B[1];
assign sig_24 = A[6] & B[1];
assign sig_25 = A[7] & B[1];
assign sig_26 = sig_17 & A[7];
assign sig_36 = sig_16 | sig_23;
assign sig_37 = sig_16 & sig_23;
assign sig_38 = sig_17 ^ sig_24;
assign sig_39 = sig_17 & sig_24;
assign sig_50 = sig_38 ^ sig_37;
assign sig_51 = sig_38 & sig_37;
assign sig_52 = sig_25 ^ sig_39;
assign sig_64 = sig_52 | sig_51;

assign O[9] = sig_39;
assign O[8] = sig_64;
assign O[7] = sig_50;
assign O[6] = sig_36;
assign O[5] = sig_21;
assign O[4] = sig_26;
assign O[3] = sig_21;
assign O[2] = sig_50;
assign O[1] = sig_50;
assign O[0] = 1'b0;

endmodule


