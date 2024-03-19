/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 4.90 %
// MAE = 50 
// WCE% = 15.53 %
// WCE = 159 
// WCRE% = 100.00 %
// EP% = 74.22 %
// MRE% = 43.01 %
// MSE = 5217 
// PDK45_PWR = 0.0021 mW
// PDK45_AREA = 15.5 um2
// PDK45_DELAY = 0.10 ns

module mul8x2u_0XM (
    A,
    B,
    O
);

input [7:0] A;
input [1:0] B;
output [9:0] O;

wire sig_38,sig_51,sig_52,sig_69,sig_74,sig_78,sig_92;

assign sig_38 = A[6] & B[1];
assign sig_51 = A[6] & B[0];
assign sig_52 = A[7] & B[1];
assign sig_69 = sig_52 & B[0];
assign sig_74 = A[5] & B[0];
assign sig_78 = B[1] & A[7];
assign sig_92 = sig_78 ^ sig_69;

assign O[9] = sig_69;
assign O[8] = sig_92;
assign O[7] = sig_38;
assign O[6] = sig_51;
assign O[5] = sig_74;
assign O[4] = sig_38;
assign O[3] = 1'b0;
assign O[2] = 1'b0;
assign O[1] = sig_38;
assign O[0] = sig_78;

endmodule


