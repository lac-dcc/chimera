// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 7.95 %
// MAE = 326 
// WCE% = 27.91 %
// WCE = 1143 
// WCRE% = 300.00 %
// EP% = 93.36 %
// MRE% = 62.04 %
// MSE = 184297 
// PDK45_PWR = 0.00089 mW
// PDK45_AREA = 7.0 um2
// PDK45_DELAY = 0.04 ns

module mul8x4u_2FE (
    A,
    B,
    O
);

input [7:0] A;
input [3:0] B;
output [11:0] O;

wire sig_96,sig_138,sig_150;

assign sig_96 = A[5] & B[1];
assign sig_138 = A[7] & B[3];
assign sig_150 = A[6] & B[2];

assign O[11] = sig_138;
assign O[10] = sig_150;
assign O[9] = 1'b0;
assign O[8] = sig_96;
assign O[7] = 1'b0;
assign O[6] = 1'b0;
assign O[5] = 1'b0;
assign O[4] = 1'b0;
assign O[3] = sig_138;
assign O[2] = 1'b0;
assign O[1] = 1'b0;
assign O[0] = 1'b0;

endmodule


