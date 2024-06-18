// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 25.47 %
// MAE = 33 
// WCE% = 72.66 %
// WCE = 93 
// WCRE% = 5600.00 %
// EP% = 99.11 %
// MRE% = 161.98 %
// MSE = 1507 
// PDK45_PWR = 0.0054 mW
// PDK45_AREA = 21.6 um2
// PDK45_DELAY = 0.17 ns

module add8s_701 (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [7:0] O;

wire sig_20,sig_28,sig_30,sig_33,sig_40,sig_57,sig_60;

assign sig_20 = ~(B[6] ^ A[6]);
assign sig_28 = A[6] & B[6];
assign sig_30 = A[7] ^ B[7];
assign sig_33 = B[7] & A[7];
assign sig_40 = ~(sig_33 | sig_20);
assign sig_57 = sig_28 | sig_33;
assign sig_60 = sig_57 ^ sig_30;

assign O[7] = sig_60;
assign O[6] = sig_40;
assign O[5] = A[5];
assign O[4] = A[0];
assign O[3] = sig_40;
assign O[2] = 1'b0;
assign O[1] = A[0];
assign O[0] = sig_40;

endmodule


