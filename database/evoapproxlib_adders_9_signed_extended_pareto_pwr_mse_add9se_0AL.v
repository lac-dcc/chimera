/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 7.83 %
// MAE = 40 
// WCE% = 24.80 %
// WCE = 127 
// WCRE% = 9100.00 %
// EP% = 99.24 %
// MRE% = 74.66 %
// MSE = 2406 
// PDK45_PWR = 0.0067 mW
// PDK45_AREA = 25.3 um2
// PDK45_DELAY = 0.17 ns

module add9se_0AL (
    A,
    B,
    O
);

input [8:0] A;
input [8:0] B;
output [9:0] O;

wire sig_21,sig_25,sig_32,sig_33,sig_34,sig_35,sig_36,sig_46,sig_59,sig_73,sig_75,sig_76;

assign sig_21 = B[6] | A[6];
assign sig_25 = B[4] | A[2];
assign sig_32 = A[7] & B[7];
assign sig_33 = A[7] ^ B[7];
assign sig_34 = A[8] & B[8];
assign sig_35 = A[8] ^ B[8];
assign sig_36 = A[8] ^ B[8];
assign sig_46 = sig_35 & sig_32;
assign sig_59 = sig_34 | sig_46;
assign sig_73 = B[6] | A[5];
assign sig_75 = sig_35 ^ sig_32;
assign sig_76 = sig_36 ^ sig_59;

assign O[9] = sig_76;
assign O[8] = sig_75;
assign O[7] = sig_33;
assign O[6] = sig_73;
assign O[5] = sig_21;
assign O[4] = sig_25;
assign O[3] = B[6];
assign O[2] = sig_21;
assign O[1] = sig_21;
assign O[0] = A[3];

endmodule


