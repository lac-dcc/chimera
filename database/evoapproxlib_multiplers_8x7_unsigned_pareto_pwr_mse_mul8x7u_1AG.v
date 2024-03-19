/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 8.05 %
// MAE = 2637 
// WCE% = 30.62 %
// WCE = 10033 
// WCRE% = 700.00 %
// EP% = 98.83 %
// MRE% = 64.51 %
// MSE = 11896.765e3 
// PDK45_PWR = 0.00089 mW
// PDK45_AREA = 7.0 um2
// PDK45_DELAY = 0.04 ns

module mul8x7u_1AG (
    A,
    B,
    O
);

input [7:0] A;
input [6:0] B;
output [14:0] O;

wire sig_222,sig_223,sig_240;

assign sig_222 = A[7] & B[6];
assign sig_223 = A[5] & B[4];
assign sig_240 = B[5] & A[6];

assign O[14] = sig_222;
assign O[13] = sig_240;
assign O[12] = sig_223;
assign O[11] = 1'b0;
assign O[10] = 1'b0;
assign O[9] = 1'b0;
assign O[8] = 1'b0;
assign O[7] = 1'b0;
assign O[6] = 1'b0;
assign O[5] = 1'b0;
assign O[4] = 1'b0;
assign O[3] = sig_222;
assign O[2] = 1'b0;
assign O[1] = 1'b0;
assign O[0] = 1'b0;

endmodule


