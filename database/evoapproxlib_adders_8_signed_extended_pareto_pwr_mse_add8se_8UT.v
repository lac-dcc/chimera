/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 1.21 %
// MAE = 3.1 
// WCE% = 3.91 %
// WCE = 10 
// WCRE% = 800.00 %
// EP% = 90.62 %
// MRE% = 12.28 %
// MSE = 15 
// PDK45_PWR = 0.019 mW
// PDK45_AREA = 41.3 um2
// PDK45_DELAY = 0.35 ns

module add8se_8UT (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [8:0] O;

wire sig_24,sig_25,sig_26,sig_27,sig_28,sig_29,sig_30,sig_31,sig_32,sig_41,sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52;
wire sig_53,sig_60,sig_62,sig_63,sig_65,sig_66,sig_67,sig_68,sig_75,sig_76,sig_80,sig_81,sig_82,sig_83,sig_84;

assign sig_24 = A[4] & B[4];
assign sig_25 = A[4] ^ B[4];
assign sig_26 = A[5] & B[5];
assign sig_27 = A[5] ^ B[5];
assign sig_28 = A[6] & B[6];
assign sig_29 = A[6] ^ B[6];
assign sig_30 = A[7] & B[7];
assign sig_31 = A[7] ^ B[7];
assign sig_32 = A[7] ^ B[7];
assign sig_41 = sig_25 & B[3];
assign sig_43 = sig_24 | sig_41;
assign sig_44 = sig_27 & sig_24;
assign sig_45 = sig_27 & sig_25;
assign sig_46 = sig_26 | sig_44;
assign sig_47 = sig_29 & sig_26;
assign sig_48 = sig_29 & sig_27;
assign sig_49 = sig_28 | sig_47;
assign sig_50 = sig_31 & sig_28;
assign sig_51 = sig_31 & sig_29;
assign sig_52 = sig_30 | sig_50;
assign sig_53 = ~B[3];
assign sig_60 = sig_45 & B[3];
assign sig_62 = sig_46 | sig_60;
assign sig_63 = sig_48 & sig_43;
assign sig_65 = sig_49 | sig_63;
assign sig_66 = sig_51 & sig_46;
assign sig_67 = sig_51 & sig_45;
assign sig_68 = sig_52 | sig_66;
assign sig_75 = sig_67 & B[3];
assign sig_76 = sig_68 | sig_75;
assign sig_80 = sig_25 ^ B[3];
assign sig_81 = sig_27 ^ sig_43;
assign sig_82 = sig_29 ^ sig_62;
assign sig_83 = sig_31 ^ sig_65;
assign sig_84 = sig_32 ^ sig_76;

assign O[8] = sig_84;
assign O[7] = sig_83;
assign O[6] = sig_82;
assign O[5] = sig_81;
assign O[4] = sig_80;
assign O[3] = A[3];
assign O[2] = sig_53;
assign O[1] = 1'b0;
assign O[0] = A[3];

endmodule


