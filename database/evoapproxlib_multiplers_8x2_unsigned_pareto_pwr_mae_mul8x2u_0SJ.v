/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 3.53 %
// MAE = 36 
// WCE% = 12.70 %
// WCE = 130 
// WCRE% = 100.00 %
// EP% = 74.41 %
// MRE% = 37.40 %
// MSE = 2582 
// PDK45_PWR = 0.0023 mW
// PDK45_AREA = 15.0 um2
// PDK45_DELAY = 0.11 ns

module mul8x2u_0SJ (
    A,
    B,
    O
);

input [7:0] A;
input [1:0] B;
output [9:0] O;

wire sig_14,sig_15,sig_17,sig_20,sig_25,sig_31,sig_40,sig_42,sig_65;

assign sig_14 = ~(B[1] & A[6]);
assign sig_15 = B[0] & A[5];
assign sig_17 = A[7] & B[0];
assign sig_20 = ~A[6];
assign sig_25 = A[7] & B[1];
assign sig_31 = ~(A[7] | sig_14);
assign sig_40 = sig_25 & sig_20;
assign sig_42 = ~(sig_14 | sig_31);
assign sig_65 = sig_40 | sig_31;

assign O[9] = sig_42;
assign O[8] = sig_65;
assign O[7] = sig_17;
assign O[6] = sig_15;
assign O[5] = 1'b0;
assign O[4] = 1'b0;
assign O[3] = sig_17;
assign O[2] = 1'b0;
assign O[1] = sig_25;
assign O[0] = 1'b0;

endmodule


