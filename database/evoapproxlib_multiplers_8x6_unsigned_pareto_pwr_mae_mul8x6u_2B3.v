/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 7.61 %
// MAE = 1248 
// WCE% = 29.79 %
// WCE = 4880 
// WCRE% = 700.00 %
// EP% = 98.03 %
// MRE% = 56.56 %
// MSE = 25176.553e2 
// PDK45_PWR = 0.0017 mW
// PDK45_AREA = 13.1 um2
// PDK45_DELAY = 0.09 ns

module mul8x6u_2B3 (
    A,
    B,
    O
);

input [7:0] A;
input [5:0] B;
output [13:0] O;

wire sig_59,sig_61,sig_203,sig_207,sig_256,sig_270;

assign sig_59 = A[6] & B[5];
assign sig_61 = A[7] & B[5];
assign sig_203 = A[4] & B[3];
assign sig_207 = A[7] & B[4];
assign sig_256 = ~sig_207;
assign sig_270 = ~(sig_256 | B[5]);

assign O[13] = sig_61;
assign O[12] = sig_270;
assign O[11] = sig_59;
assign O[10] = sig_203;
assign O[9] = sig_59;
assign O[8] = sig_59;
assign O[7] = 1'b0;
assign O[6] = 1'b0;
assign O[5] = 1'b0;
assign O[4] = sig_59;
assign O[3] = 1'b0;
assign O[2] = 1'b0;
assign O[1] = 1'b0;
assign O[0] = sig_270;

endmodule


