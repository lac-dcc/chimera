// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 28.83 %
// MAE = 37 
// WCE% = 84.38 %
// WCE = 108 
// WCRE% = 6500.00 %
// EP% = 99.22 %
// MRE% = 202.19 %
// MSE = 1995 
// PDK45_PWR = 0.0039 mW
// PDK45_AREA = 18.8 um2
// PDK45_DELAY = 0.20 ns

module add8s_6R6 (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [7:0] O;

wire sig_28,sig_30,sig_38,sig_44,sig_54,sig_60,sig_61;

assign sig_28 = A[6] & B[6];
assign sig_30 = A[7] ^ B[7];
assign sig_38 = A[7] & B[7];
assign sig_44 = sig_28 | sig_38;
assign sig_54 = B[5] | A[5];
assign sig_60 = B[1] | sig_54;
assign sig_61 = sig_30 ^ sig_44;

assign O[7] = sig_61;
assign O[6] = sig_60;
assign O[5] = B[4];
assign O[4] = 1'b0;
assign O[3] = A[4];
assign O[2] = A[1];
assign O[1] = A[1];
assign O[0] = 1'b0;

endmodule


