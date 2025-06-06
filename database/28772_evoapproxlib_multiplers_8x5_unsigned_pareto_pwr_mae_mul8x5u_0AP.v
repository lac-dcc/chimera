// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 8.06 %
// MAE = 660 
// WCE% = 29.46 %
// WCE = 2413 
// WCRE% = 700.00 %
// EP% = 96.47 %
// MRE% = 65.69 %
// MSE = 759638 
// PDK45_PWR = 0.00089 mW
// PDK45_AREA = 7.0 um2
// PDK45_DELAY = 0.04 ns

module mul8x5u_0AP (
    A,
    B,
    O
);

input [7:0] A;
input [4:0] B;
output [12:0] O;

wire sig_51,sig_52,sig_169,sig_224;

assign sig_51 = A[5] & B[2];
assign sig_52 = A[7] & B[4];
assign sig_169 = B[3] & A[6];
assign sig_224 = A[7] & B[4];

assign O[12] = sig_52;
assign O[11] = sig_169;
assign O[10] = sig_51;
assign O[9] = 1'b0;
assign O[8] = 1'b0;
assign O[7] = sig_52;
assign O[6] = sig_169;
assign O[5] = 1'b0;
assign O[4] = 1'b0;
assign O[3] = 1'b0;
assign O[2] = sig_224;
assign O[1] = sig_169;
assign O[0] = 1'b0;

endmodule


