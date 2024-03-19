/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 14.37 %
// MAE = 74 
// WCE% = 49.61 %
// WCE = 254 
// WCRE% = 7000.00 %
// EP% = 99.53 %
// MRE% = 69.54 %
// MSE = 8574 
// PDK45_PWR = 0.0046 mW
// PDK45_AREA = 14.1 um2
// PDK45_DELAY = 0.13 ns

module add9se_0DV (
    A,
    B,
    O
);

input [8:0] A;
input [8:0] B;
output [9:0] O;

wire sig_33,sig_34,sig_36,sig_43,sig_46,sig_48,sig_69,sig_75,sig_76;

assign sig_33 = A[7] | B[7];
assign sig_34 = A[8] & B[8];
assign sig_36 = A[8] ^ B[8];
assign sig_43 = B[8] ^ A[8];
assign sig_46 = sig_43 & A[7];
assign sig_48 = sig_34 | sig_46;
assign sig_69 = sig_33 ^ A[7];
assign sig_75 = sig_36 ^ A[7];
assign sig_76 = sig_36 ^ sig_48;

assign O[9] = sig_76;
assign O[8] = sig_75;
assign O[7] = sig_69;
assign O[6] = sig_76;
assign O[5] = sig_76;
assign O[4] = sig_76;
assign O[3] = 1'b0;
assign O[2] = sig_69;
assign O[1] = sig_76;
assign O[0] = sig_69;

endmodule


