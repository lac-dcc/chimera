/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 7.98 %
// MAE = 1308 
// WCE% = 30.23 %
// WCE = 4953 
// WCRE% = 707.81 %
// EP% = 98.02 %
// MRE% = 64.72 %
// MSE = 29431.077e2 
// PDK45_PWR = 0.00089 mW
// PDK45_AREA = 7.0 um2
// PDK45_DELAY = 0.04 ns

module mul8x6u_045 (
    A,
    B,
    O
);

input [7:0] A;
input [5:0] B;
output [13:0] O;

wire sig_203,sig_285,sig_292;

assign sig_203 = B[4] & A[6];
assign sig_285 = B[3] & A[5];
assign sig_292 = A[7] & B[5];

assign O[13] = sig_292;
assign O[12] = sig_203;
assign O[11] = sig_285;
assign O[10] = 1'b0;
assign O[9] = 1'b0;
assign O[8] = 1'b0;
assign O[7] = 1'b0;
assign O[6] = 1'b0;
assign O[5] = 1'b0;
assign O[4] = sig_285;
assign O[3] = 1'b0;
assign O[2] = sig_285;
assign O[1] = 1'b0;
assign O[0] = 1'b0;

endmodule


