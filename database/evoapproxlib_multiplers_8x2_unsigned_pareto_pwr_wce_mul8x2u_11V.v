// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 1.17 %
// MAE = 12 
// WCE% = 3.81 %
// WCE = 39 
// WCRE% = 100.00 %
// EP% = 71.29 %
// MRE% = 15.38 %
// MSE = 296 
// PDK45_PWR = 0.010 mW
// PDK45_AREA = 55.8 um2
// PDK45_DELAY = 0.21 ns

module mul8x2u_11V (
    A,
    B,
    O
);

input [7:0] A;
input [1:0] B;
output [9:0] O;

wire sig_11,sig_12,sig_14,sig_17,sig_19,sig_20,sig_22,sig_25,sig_26,sig_27,sig_28,sig_39,sig_44,sig_51,sig_53,sig_55,sig_56,sig_57,sig_58,sig_59;

assign sig_11 = A[6] & B[0];
assign sig_12 = A[4] & B[0];
assign sig_14 = B[0] & A[3];
assign sig_17 = A[7] & B[0];
assign sig_19 = A[5] & B[1];
assign sig_20 = B[1] & A[6];
assign sig_22 = A[4] & B[1];
assign sig_25 = sig_19 & B[0];
assign sig_26 = A[6] | A[7];
assign sig_27 = sig_17 & sig_20;
assign sig_28 = sig_11 ^ sig_19;
assign sig_39 = B[1] & A[7];
assign sig_44 = B[0] & sig_25;
assign sig_51 = sig_28 ^ sig_44;
assign sig_53 = sig_17 ^ sig_20;
assign sig_55 = sig_26 & sig_25;
assign sig_56 = sig_53 ^ sig_44;
assign sig_57 = sig_27 | sig_55;
assign sig_58 = sig_57 & sig_39;
assign sig_59 = sig_57 ^ sig_39;

assign O[9] = sig_58;
assign O[8] = sig_59;
assign O[7] = sig_56;
assign O[6] = sig_51;
assign O[5] = sig_22;
assign O[4] = sig_12;
assign O[3] = sig_14;
assign O[2] = sig_12;
assign O[1] = sig_56;
assign O[0] = sig_12;

endmodule


