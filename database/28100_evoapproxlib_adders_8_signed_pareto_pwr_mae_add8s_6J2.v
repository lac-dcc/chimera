// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 12.27 %
// MAE = 16 
// WCE% = 33.59 %
// WCE = 43 
// WCRE% = 2800.00 %
// EP% = 98.52 %
// MRE% = 75.00 %
// MSE = 343 
// PDK45_PWR = 0.012 mW
// PDK45_AREA = 32.9 um2
// PDK45_DELAY = 0.27 ns

module add8s_6J2 (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [7:0] O;

wire sig_23,sig_29,sig_35,sig_38,sig_40,sig_41,sig_42,sig_43,sig_44,sig_45,sig_46,sig_47,sig_49;

assign sig_23 = A[5] & B[5];
assign sig_29 = A[7] ^ B[7];
assign sig_35 = B[7] & A[7];
assign sig_38 = A[5] ^ B[5];
assign sig_40 = sig_38 & sig_35;
assign sig_41 = sig_38 ^ sig_40;
assign sig_42 = sig_23 | sig_40;
assign sig_43 = A[6] ^ B[6];
assign sig_44 = A[6] & B[6];
assign sig_45 = sig_43 & sig_42;
assign sig_46 = sig_43 ^ sig_42;
assign sig_47 = sig_44 | sig_45;
assign sig_49 = sig_29 ^ sig_47;

assign O[7] = sig_49;
assign O[6] = sig_46;
assign O[5] = sig_41;
assign O[4] = A[4];
assign O[3] = A[1];
assign O[2] = sig_49;
assign O[1] = B[1];
assign O[0] = sig_46;

endmodule


