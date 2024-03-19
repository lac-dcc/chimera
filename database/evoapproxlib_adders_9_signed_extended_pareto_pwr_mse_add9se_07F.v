/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 0.94 %
// MAE = 4.8 
// WCE% = 2.73 %
// WCE = 14 
// WCRE% = 500.00 %
// EP% = 94.14 %
// MRE% = 9.31 %
// MSE = 33 
// PDK45_PWR = 0.024 mW
// PDK45_AREA = 52.6 um2
// PDK45_DELAY = 0.43 ns

module add9se_07F (
    A,
    B,
    O
);

input [8:0] A;
input [8:0] B;
output [9:0] O;

wire sig_19,sig_25,sig_26,sig_27,sig_28,sig_29,sig_30,sig_31,sig_32,sig_33,sig_34,sig_35,sig_40,sig_42,sig_43,sig_44,sig_45,sig_46,sig_47,sig_48;
wire sig_51,sig_53,sig_57,sig_58,sig_59,sig_64,sig_65,sig_66,sig_67,sig_70,sig_71,sig_72,sig_73,sig_74,sig_75,sig_76;

assign sig_19 = B[4] | A[4];
assign sig_25 = A[3] | B[3];
assign sig_26 = A[4] & B[4];
assign sig_27 = A[4] ^ B[4];
assign sig_28 = A[5] & B[5];
assign sig_29 = A[5] ^ B[5];
assign sig_30 = A[6] & B[6];
assign sig_31 = A[6] ^ B[6];
assign sig_32 = A[7] & B[7];
assign sig_33 = A[7] ^ B[7];
assign sig_34 = A[8] & B[8];
assign sig_35 = A[8] ^ B[8];
assign sig_40 = sig_19 & B[3];
assign sig_42 = sig_26 | sig_40;
assign sig_43 = sig_31 & sig_28;
assign sig_44 = sig_31 & sig_29;
assign sig_45 = sig_30 | sig_43;
assign sig_46 = sig_35 & sig_32;
assign sig_47 = sig_35 & sig_33;
assign sig_48 = sig_34 | sig_46;
assign sig_51 = sig_44 & sig_42;
assign sig_53 = sig_45 | sig_51;
assign sig_57 = sig_40 | sig_26;
assign sig_58 = sig_47 & sig_53;
assign sig_59 = sig_48 | sig_58;
assign sig_64 = sig_29 & sig_57;
assign sig_65 = sig_28 | sig_64;
assign sig_66 = sig_33 & sig_53;
assign sig_67 = sig_32 | sig_66;
assign sig_70 = sig_25 ^ B[3];
assign sig_71 = sig_27 ^ B[3];
assign sig_72 = sig_29 ^ sig_57;
assign sig_73 = sig_31 ^ sig_65;
assign sig_74 = sig_33 ^ sig_53;
assign sig_75 = sig_35 ^ sig_67;
assign sig_76 = sig_35 ^ sig_59;

assign O[9] = sig_76;
assign O[8] = sig_75;
assign O[7] = sig_74;
assign O[6] = sig_73;
assign O[5] = sig_72;
assign O[4] = sig_71;
assign O[3] = sig_70;
assign O[2] = sig_75;
assign O[1] = 1'b0;
assign O[0] = sig_70;

endmodule


