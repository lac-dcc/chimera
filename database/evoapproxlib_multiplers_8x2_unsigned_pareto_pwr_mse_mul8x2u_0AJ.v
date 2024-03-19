/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 4.25 %
// MAE = 44 
// WCE% = 18.46 %
// WCE = 189 
// WCRE% = 112.50 %
// EP% = 74.32 %
// MRE% = 45.58 %
// MSE = 3672 
// PDK45_PWR = 0.002 mW
// PDK45_AREA = 12.7 um2
// PDK45_DELAY = 0.09 ns

module mul8x2u_0AJ (
    A,
    B,
    O
);

input [7:0] A;
input [1:0] B;
output [9:0] O;

wire sig_24,sig_25,sig_38,sig_50,sig_53;

assign sig_24 = A[6] & B[1];
assign sig_25 = A[7] & B[1];
assign sig_38 = sig_25 & A[6];
assign sig_50 = B[0] & A[7];
assign sig_53 = sig_25 ^ sig_24;

assign O[9] = sig_38;
assign O[8] = sig_53;
assign O[7] = sig_50;
assign O[6] = sig_50;
assign O[5] = 1'b0;
assign O[4] = sig_53;
assign O[3] = 1'b0;
assign O[2] = 1'b0;
assign O[1] = 1'b0;
assign O[0] = sig_50;

endmodule


