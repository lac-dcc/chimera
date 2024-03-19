/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 10.08 %
// MAE = 13 
// WCE% = 35.16 %
// WCE = 45 
// WCRE% = 1650.00 %
// EP% = 97.84 %
// MRE% = 49.43 %
// MSE = 240 
// PDK45_PWR = 0.013 mW
// PDK45_AREA = 31.4 um2
// PDK45_DELAY = 0.27 ns

module add8s_70S (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [7:0] O;

wire sig_34,sig_36,sig_38,sig_39,sig_40,sig_41,sig_42,sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_49;

assign sig_34 = A[7] & B[7];
assign sig_36 = B[4] | A[4];
assign sig_38 = A[5] ^ B[5];
assign sig_39 = A[5] & B[5];
assign sig_40 = sig_38 & sig_34;
assign sig_41 = sig_38 ^ sig_34;
assign sig_42 = sig_39 | sig_40;
assign sig_43 = A[6] ^ B[6];
assign sig_44 = A[6] & B[6];
assign sig_45 = sig_43 & sig_42;
assign sig_46 = sig_43 ^ sig_42;
assign sig_47 = sig_44 | sig_45;
assign sig_48 = A[7] ^ B[7];
assign sig_49 = sig_48 ^ sig_47;

assign O[7] = sig_49;
assign O[6] = sig_46;
assign O[5] = sig_41;
assign O[4] = sig_36;
assign O[3] = sig_36;
assign O[2] = A[4];
assign O[1] = 1'b0;
assign O[0] = sig_46;

endmodule


