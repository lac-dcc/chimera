/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 8.40 %
// MAE = 172 
// WCE% = 31.01 %
// WCE = 635 
// WCRE% = 210.94 %
// EP% = 87.06 %
// MRE% = 65.71 %
// MSE = 51275 
// PDK45_PWR = 0.0006 mW
// PDK45_AREA = 4.7 um2
// PDK45_DELAY = 0.04 ns

module mul8x3u_0Q5 (
    A,
    B,
    O
);

input [7:0] A;
input [2:0] B;
output [10:0] O;

wire sig_17,sig_34;

assign sig_17 = A[6] & B[1];
assign sig_34 = A[7] & B[2];

assign O[10] = sig_34;
assign O[9] = 1'b0;
assign O[8] = sig_17;
assign O[7] = sig_17;
assign O[6] = 1'b0;
assign O[5] = 1'b0;
assign O[4] = sig_34;
assign O[3] = sig_17;
assign O[2] = sig_17;
assign O[1] = sig_17;
assign O[0] = 1'b0;

endmodule


