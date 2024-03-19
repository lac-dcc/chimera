/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 3.63 %
// MAE = 19 
// WCE% = 12.11 %
// WCE = 62 
// WCRE% = 1800.00 %
// EP% = 98.39 %
// MRE% = 26.55 %
// MSE = 514 
// PDK45_PWR = 0.014 mW
// PDK45_AREA = 34.7 um2
// PDK45_DELAY = 0.27 ns

module add9se_0A3 (
    A,
    B,
    O
);

input [8:0] A;
input [8:0] B;
output [9:0] O;

wire sig_30,sig_31,sig_32,sig_33,sig_34,sig_36,sig_46,sig_47,sig_48,sig_51,sig_53,sig_57,sig_58,sig_59,sig_64,sig_66,sig_67,sig_70,sig_72,sig_73;
wire sig_74,sig_75,sig_76;

assign sig_30 = A[6] & B[6];
assign sig_31 = A[6] ^ B[6];
assign sig_32 = A[7] & B[7];
assign sig_33 = A[7] ^ B[7];
assign sig_34 = A[8] & B[8];
assign sig_36 = A[8] ^ B[8];
assign sig_46 = sig_36 & sig_32;
assign sig_47 = sig_36 & sig_33;
assign sig_48 = sig_34 | sig_46;
assign sig_51 = sig_31 & B[5];
assign sig_53 = sig_30 | sig_51;
assign sig_57 = ~sig_53;
assign sig_58 = sig_47 & sig_53;
assign sig_59 = sig_48 | sig_58;
assign sig_64 = A[5] & B[5];
assign sig_66 = sig_33 & sig_53;
assign sig_67 = sig_32 | sig_66;
assign sig_70 = ~sig_57;
assign sig_72 = A[5] ^ sig_64;
assign sig_73 = sig_31 ^ B[5];
assign sig_74 = sig_33 ^ sig_70;
assign sig_75 = sig_36 ^ sig_67;
assign sig_76 = sig_36 ^ sig_59;

assign O[9] = sig_76;
assign O[8] = sig_75;
assign O[7] = sig_74;
assign O[6] = sig_73;
assign O[5] = sig_72;
assign O[4] = sig_76;
assign O[3] = sig_73;
assign O[2] = sig_72;
assign O[1] = sig_75;
assign O[0] = 1'b0;

endmodule


