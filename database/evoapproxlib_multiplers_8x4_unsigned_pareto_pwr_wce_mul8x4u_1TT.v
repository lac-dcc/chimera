/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 3.76 %
// MAE = 154 
// WCE% = 13.75 %
// WCE = 563 
// WCRE% = 100.00 %
// EP% = 92.99 %
// MRE% = 38.63 %
// MSE = 37866 
// PDK45_PWR = 0.011 mW
// PDK45_AREA = 44.1 um2
// PDK45_DELAY = 0.24 ns

module mul8x4u_1TT (
    A,
    B,
    O
);

input [7:0] A;
input [3:0] B;
output [11:0] O;

wire sig_49,sig_58,sig_79,sig_82,sig_91,sig_92,sig_123,sig_124,sig_125,sig_126,sig_127,sig_130,sig_136,sig_137,sig_140,sig_153;

assign sig_49 = A[7] & B[2];
assign sig_58 = B[2] & A[6];
assign sig_79 = A[5] & B[3];
assign sig_82 = A[7] & B[1];
assign sig_91 = A[6] & B[3];
assign sig_92 = A[7] & B[3];
assign sig_123 = sig_49 ^ sig_91;
assign sig_124 = sig_49 & sig_91;
assign sig_125 = sig_123 & sig_82;
assign sig_126 = sig_123 ^ sig_82;
assign sig_127 = sig_124 | sig_125;
assign sig_130 = sig_127 ^ sig_92;
assign sig_136 = sig_58 & sig_79;
assign sig_137 = sig_58 ^ sig_79;
assign sig_140 = B[3] & sig_127;
assign sig_153 = sig_130 | sig_136;

assign O[11] = sig_140;
assign O[10] = sig_153;
assign O[9] = sig_126;
assign O[8] = sig_137;
assign O[7] = sig_137;
assign O[6] = sig_136;
assign O[5] = 1'b0;
assign O[4] = sig_58;
assign O[3] = 1'b0;
assign O[2] = 1'b0;
assign O[1] = sig_140;
assign O[0] = 1'b0;

endmodule


