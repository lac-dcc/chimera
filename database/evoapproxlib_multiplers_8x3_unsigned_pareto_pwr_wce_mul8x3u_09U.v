/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 10.29 %
// MAE = 211 
// WCE% = 36.96 %
// WCE = 757 
// WCRE% = 100.20 %
// EP% = 87.06 %
// MRE% = 70.10 %
// MSE = 76819 
// PDK45_PWR = 0.0006 mW
// PDK45_AREA = 4.7 um2
// PDK45_DELAY = 0.04 ns

module mul8x3u_09U (
    A,
    B,
    O
);

input [7:0] A;
input [2:0] B;
output [10:0] O;

wire sig_39,sig_48;

assign sig_39 = B[1] & A[6];
assign sig_48 = A[7] & B[2];

assign O[10] = sig_48;
assign O[9] = 1'b0;
assign O[8] = 1'b0;
assign O[7] = sig_39;
assign O[6] = 1'b0;
assign O[5] = 1'b0;
assign O[4] = 1'b0;
assign O[3] = 1'b0;
assign O[2] = sig_39;
assign O[1] = 1'b0;
assign O[0] = sig_48;

endmodule


