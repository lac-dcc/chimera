/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 6.79 %
// MAE = 2223 
// WCE% = 25.20 %
// WCE = 8258 
// WCRE% = 6325.00 %
// EP% = 98.82 %
// MRE% = 63.75 %
// MSE = 79116.74e2 
// PDK45_PWR = 0.0023 mW
// PDK45_AREA = 12.7 um2
// PDK45_DELAY = 0.08 ns

module mul8x7u_048 (
    A,
    B,
    O
);

input [7:0] A;
input [6:0] B;
output [14:0] O;

wire sig_69,sig_70,sig_95,sig_188,sig_189,sig_256,sig_258,sig_265,sig_267,sig_309;

assign sig_69 = A[6] & B[6];
assign sig_70 = A[7] & B[6];
assign sig_95 = A[7] & B[5];
assign sig_188 = sig_95 | sig_69;
assign sig_189 = sig_95 & sig_69;
assign sig_256 = B[6] & A[7];
assign sig_258 = sig_188 | sig_256;
assign sig_265 = A[1] & B[4];
assign sig_267 = sig_70 ^ sig_189;
assign sig_309 = sig_267 ^ sig_258;

assign O[14] = sig_70;
assign O[13] = sig_309;
assign O[12] = 1'b0;
assign O[11] = sig_265;
assign O[10] = 1'b0;
assign O[9] = 1'b0;
assign O[8] = 1'b0;
assign O[7] = 1'b0;
assign O[6] = sig_256;
assign O[5] = 1'b0;
assign O[4] = 1'b0;
assign O[3] = sig_265;
assign O[2] = 1'b0;
assign O[1] = sig_256;
assign O[0] = 1'b0;

endmodule


