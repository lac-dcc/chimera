// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 1.72 %
// MAE = 8.8 
// WCE% = 5.08 %
// WCE = 26 
// WCRE% = 1800.00 %
// EP% = 96.88 %
// MRE% = 18.00 %
// MSE = 112 
// PDK45_PWR = 0.019 mW
// PDK45_AREA = 44.6 um2
// PDK45_DELAY = 0.38 ns

module add9se_036 (
    A,
    B,
    O
);

input [8:0] A;
input [8:0] B;
output [9:0] O;

wire sig_21,sig_24,sig_36,sig_40,sig_41,sig_42,sig_43,sig_44,sig_45,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55,sig_56,sig_57;
wire sig_58,sig_59,sig_61;

assign sig_21 = A[6] & B[6];
assign sig_24 = B[2] | B[3];
assign sig_36 = A[4] & B[4];
assign sig_40 = A[5] ^ B[5];
assign sig_41 = A[5] & B[5];
assign sig_42 = sig_40 & sig_36;
assign sig_43 = sig_40 ^ sig_36;
assign sig_44 = sig_41 | sig_42;
assign sig_45 = A[6] ^ B[6];
assign sig_47 = sig_45 & sig_44;
assign sig_48 = sig_45 ^ sig_44;
assign sig_49 = sig_21 | sig_47;
assign sig_50 = A[7] ^ B[7];
assign sig_51 = A[7] & B[7];
assign sig_52 = sig_50 & sig_49;
assign sig_53 = sig_50 ^ sig_49;
assign sig_54 = sig_51 | sig_52;
assign sig_55 = A[8] ^ B[8];
assign sig_56 = A[8] & B[8];
assign sig_57 = sig_55 & sig_54;
assign sig_58 = sig_55 ^ sig_54;
assign sig_59 = sig_56 | sig_57;
assign sig_61 = sig_55 ^ sig_59;

assign O[9] = sig_61;
assign O[8] = sig_58;
assign O[7] = sig_53;
assign O[6] = sig_48;
assign O[5] = sig_43;
assign O[4] = sig_24;
assign O[3] = A[3];
assign O[2] = sig_58;
assign O[1] = sig_58;
assign O[0] = sig_53;

endmodule


