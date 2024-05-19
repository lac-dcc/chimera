// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 10.42 %
// MAE = 853 
// WCE% = 34.07 %
// WCE = 2791 
// WCRE% = 125.20 %
// EP% = 96.48 %
// MRE% = 66.45 %
// MSE = 12108.165e2 
// PDK45_PWR = 0.00089 mW
// PDK45_AREA = 7.0 um2
// PDK45_DELAY = 0.04 ns

module mul8x5u_280 (
    A,
    B,
    O
);

input [7:0] A;
input [4:0] B;
output [12:0] O;

wire sig_34,sig_42,sig_172;

assign sig_34 = A[4] & B[2];
assign sig_42 = A[6] & B[3];
assign sig_172 = B[4] & A[7];

assign O[12] = sig_172;
assign O[11] = 1'b0;
assign O[10] = sig_42;
assign O[9] = sig_172;
assign O[8] = 1'b0;
assign O[7] = sig_34;
assign O[6] = 1'b0;
assign O[5] = 1'b0;
assign O[4] = 1'b0;
assign O[3] = 1'b0;
assign O[2] = sig_172;
assign O[1] = sig_34;
assign O[0] = 1'b0;

endmodule


