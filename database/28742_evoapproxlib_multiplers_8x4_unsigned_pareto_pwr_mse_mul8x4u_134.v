// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 9.08 %
// MAE = 372 
// WCE% = 34.11 %
// WCE = 1397 
// WCRE% = 234.38 %
// EP% = 93.33 %
// MRE% = 67.10 %
// MSE = 230371 
// PDK45_PWR = 0.0006 mW
// PDK45_AREA = 4.7 um2
// PDK45_DELAY = 0.04 ns

module mul8x4u_134 (
    A,
    B,
    O
);

input [7:0] A;
input [3:0] B;
output [11:0] O;

wire sig_26,sig_43;

assign sig_26 = A[6] & B[2];
assign sig_43 = A[7] & B[3];

assign O[11] = sig_43;
assign O[10] = 1'b0;
assign O[9] = sig_26;
assign O[8] = sig_26;
assign O[7] = 1'b0;
assign O[6] = sig_26;
assign O[5] = 1'b0;
assign O[4] = sig_26;
assign O[3] = sig_26;
assign O[2] = 1'b0;
assign O[1] = 1'b0;
assign O[0] = 1'b0;

endmodule


