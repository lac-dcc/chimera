/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 2.23 %
// MAE = 5.7 
// WCE% = 6.64 %
// WCE = 17 
// WCRE% = 1600.00 %
// EP% = 94.73 %
// MRE% = 22.56 %
// MSE = 48 
// PDK45_PWR = 0.014 mW
// PDK45_AREA = 32.4 um2
// PDK45_DELAY = 0.27 ns

module add8se_8ZX (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [8:0] O;

wire sig_26,sig_27,sig_28,sig_29,sig_30,sig_31,sig_32,sig_38,sig_44,sig_46,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_63,sig_65,sig_66,sig_68;
wire sig_81,sig_82,sig_83,sig_84;

assign sig_26 = A[5] & B[5];
assign sig_27 = A[5] ^ B[5];
assign sig_28 = A[6] & B[6];
assign sig_29 = A[6] ^ B[6];
assign sig_30 = A[7] & B[7];
assign sig_31 = A[7] ^ B[7];
assign sig_32 = A[7] ^ B[7];
assign sig_38 = ~B[4];
assign sig_44 = sig_27 & B[4];
assign sig_46 = sig_26 | sig_44;
assign sig_47 = sig_29 & sig_26;
assign sig_48 = sig_29 & sig_27;
assign sig_49 = sig_28 | sig_47;
assign sig_50 = sig_31 & sig_28;
assign sig_51 = sig_31 & sig_29;
assign sig_52 = sig_30 | sig_50;
assign sig_63 = sig_48 & B[4];
assign sig_65 = sig_49 | sig_63;
assign sig_66 = sig_51 & sig_46;
assign sig_68 = sig_52 | sig_66;
assign sig_81 = sig_27 ^ B[4];
assign sig_82 = sig_29 ^ sig_46;
assign sig_83 = sig_31 ^ sig_65;
assign sig_84 = sig_32 ^ sig_68;

assign O[8] = sig_84;
assign O[7] = sig_83;
assign O[6] = sig_82;
assign O[5] = sig_81;
assign O[4] = A[4];
assign O[3] = sig_38;
assign O[2] = B[3];
assign O[1] = A[1];
assign O[0] = sig_46;

endmodule


