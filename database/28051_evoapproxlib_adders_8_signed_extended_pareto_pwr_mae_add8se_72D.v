// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.27 %
// MAE = 0.7 
// WCE% = 0.78 %
// WCE = 2.0 
// WCRE% = 100.00 %
// EP% = 62.40 %
// MRE% = 2.88 %
// MSE = 1.0 
// PDK45_PWR = 0.030 mW
// PDK45_AREA = 65.7 um2
// PDK45_DELAY = 0.55 ns

module add8se_72D (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [8:0] O;

wire sig_18,sig_19,sig_20,sig_21,sig_22,sig_23,sig_24,sig_25,sig_26,sig_27,sig_28,sig_29,sig_30,sig_32,sig_38,sig_39,sig_40,sig_41,sig_42,sig_43;
wire sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55,sig_56,sig_58,sig_59,sig_60,sig_62,sig_63,sig_65,sig_66,sig_67,sig_68,sig_71;
wire sig_72,sig_73,sig_74,sig_75,sig_76,sig_78,sig_79,sig_80,sig_81,sig_82,sig_83,sig_84;

assign sig_18 = A[1] & B[1];
assign sig_19 = A[1] ^ B[1];
assign sig_20 = A[2] & B[2];
assign sig_21 = A[2] ^ B[2];
assign sig_22 = A[3] & B[3];
assign sig_23 = A[3] ^ B[3];
assign sig_24 = A[4] & B[4];
assign sig_25 = A[4] ^ B[4];
assign sig_26 = A[5] & B[5];
assign sig_27 = A[5] ^ B[5];
assign sig_28 = A[6] & B[6];
assign sig_29 = A[6] ^ B[6];
assign sig_30 = A[7] & B[7];
assign sig_32 = A[7] ^ B[7];
assign sig_38 = sig_23 & sig_20;
assign sig_39 = sig_23 & sig_21;
assign sig_40 = sig_22 | sig_38;
assign sig_41 = sig_25 & sig_22;
assign sig_42 = sig_25 & sig_23;
assign sig_43 = sig_24 | sig_41;
assign sig_47 = sig_29 & sig_26;
assign sig_48 = sig_29 & sig_27;
assign sig_49 = sig_28 | sig_47;
assign sig_50 = sig_32 & sig_49;
assign sig_51 = sig_32 & sig_48;
assign sig_52 = sig_30 | sig_50;
assign sig_53 = sig_21 & sig_18;
assign sig_54 = sig_20 | sig_53;
assign sig_55 = sig_39 & sig_18;
assign sig_56 = sig_40 | sig_55;
assign sig_58 = sig_42 & sig_54;
assign sig_59 = sig_43 | sig_58;
assign sig_60 = sig_27 & sig_43;
assign sig_62 = sig_26 | sig_60;
assign sig_63 = sig_48 & sig_43;
assign sig_65 = sig_49 | sig_63;
assign sig_66 = sig_51 & sig_43;
assign sig_67 = sig_51 & sig_42;
assign sig_68 = sig_52 | sig_66;
assign sig_71 = sig_27 & sig_58;
assign sig_72 = sig_62 | sig_71;
assign sig_73 = sig_48 & sig_58;
assign sig_74 = sig_65 | sig_73;
assign sig_75 = sig_67 & sig_56;
assign sig_76 = sig_68 | sig_75;
assign sig_78 = sig_21 ^ sig_18;
assign sig_79 = sig_23 ^ sig_54;
assign sig_80 = sig_25 ^ sig_56;
assign sig_81 = sig_27 ^ sig_59;
assign sig_82 = sig_29 ^ sig_72;
assign sig_83 = sig_32 ^ sig_74;
assign sig_84 = sig_32 ^ sig_76;

assign O[8] = sig_84;
assign O[7] = sig_83;
assign O[6] = sig_82;
assign O[5] = sig_81;
assign O[4] = sig_80;
assign O[3] = sig_79;
assign O[2] = sig_78;
assign O[1] = sig_19;
assign O[0] = sig_84;

endmodule


