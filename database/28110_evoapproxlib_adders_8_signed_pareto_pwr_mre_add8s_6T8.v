// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 18.28 %
// MAE = 23 
// WCE% = 54.69 %
// WCE = 70 
// WCRE% = 3300.00 %
// EP% = 98.52 %
// MRE% = 67.56 %
// MSE = 839 
// PDK45_PWR = 0.0063 mW
// PDK45_AREA = 26.8 um2
// PDK45_DELAY = 0.17 ns

module add8s_6T8 (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [7:0] O;

wire sig_27,sig_28,sig_29,sig_30,sig_34,sig_44,sig_49,sig_62,sig_63,sig_64;

assign sig_27 = A[5] | B[5];
assign sig_28 = A[6] & B[6];
assign sig_29 = A[6] ^ B[6];
assign sig_30 = A[7] ^ B[7];
assign sig_34 = B[7] & A[7];
assign sig_44 = sig_27 & sig_34;
assign sig_49 = sig_28 | sig_34;
assign sig_62 = sig_44 ^ sig_27;
assign sig_63 = sig_29 | sig_34;
assign sig_64 = sig_30 ^ sig_49;

assign O[7] = sig_64;
assign O[6] = sig_63;
assign O[5] = sig_62;
assign O[4] = sig_62;
assign O[3] = sig_62;
assign O[2] = sig_64;
assign O[1] = sig_63;
assign O[0] = 1'b0;

endmodule


