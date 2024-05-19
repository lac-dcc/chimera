// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 4.38 %
// MAE = 11 
// WCE% = 12.50 %
// WCE = 32 
// WCRE% = 3100.00 %
// EP% = 97.27 %
// MRE% = 39.03 %
// MSE = 190 
// PDK45_PWR = 0.0094 mW
// PDK45_AREA = 23.5 um2
// PDK45_DELAY = 0.19 ns

module add8se_8UF (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [8:0] O;

wire sig_25,sig_26,sig_28,sig_29,sig_30,sig_31,sig_32,sig_40,sig_46,sig_56,sig_57,sig_58,sig_62,sig_63,sig_64,sig_65,sig_66;

assign sig_25 = ~A[5];
assign sig_26 = A[0] & B[5];
assign sig_28 = A[6] & B[6];
assign sig_29 = A[6] ^ B[6];
assign sig_30 = A[7] & B[7];
assign sig_31 = A[7] ^ B[7];
assign sig_32 = A[7] ^ B[7];
assign sig_40 = sig_29 & B[5];
assign sig_46 = sig_28 | sig_40;
assign sig_56 = sig_26 | B[5];
assign sig_57 = sig_31 & sig_46;
assign sig_58 = sig_30 | sig_57;
assign sig_62 = ~sig_25;
assign sig_63 = ~B[5];
assign sig_64 = sig_29 ^ sig_56;
assign sig_65 = sig_31 ^ sig_46;
assign sig_66 = sig_32 ^ sig_58;

assign O[8] = sig_66;
assign O[7] = sig_65;
assign O[6] = sig_64;
assign O[5] = sig_63;
assign O[4] = sig_62;
assign O[3] = A[3];
assign O[2] = sig_62;
assign O[1] = A[1];
assign O[0] = 1'b0;

endmodule


