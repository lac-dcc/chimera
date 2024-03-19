/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and ep parameters
***/
// MAE% = 0.94 %
// MAE = 4.8 
// WCE% = 3.12 %
// WCE = 16 
// WCRE% = 800.00 %
// EP% = 76.56 %
// MRE% = 9.87 %
// MSE = 40 
// PDK45_PWR = 0.028 mW
// PDK45_AREA = 78.8 um2
// PDK45_DELAY = 0.39 ns

module add9se_05G (
    A,
    B,
    O
);

input [8:0] A;
input [8:0] B;
output [9:0] O;

wire sig_18,sig_19,sig_20,sig_23,sig_24,sig_25,sig_27,sig_28,sig_29,sig_30,sig_31,sig_32,sig_33,sig_34,sig_35,sig_36,sig_38,sig_40,sig_41,sig_42;
wire sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55,sig_56,sig_57,sig_58,sig_59,sig_60,sig_61;

assign sig_18 = A[0] | B[0];
assign sig_19 = B[0] & A[0];
assign sig_20 = A[1] ^ B[1];
assign sig_23 = sig_20 ^ sig_19;
assign sig_24 = A[1] | sig_20;
assign sig_25 = A[2] | B[2];
assign sig_27 = A[3] | sig_24;
assign sig_28 = sig_25 | sig_24;
assign sig_29 = B[3] | sig_27;
assign sig_30 = A[3] ^ B[3];
assign sig_31 = ~(sig_29 | B[3]);
assign sig_32 = sig_27 & A[1];
assign sig_33 = sig_30 | sig_29;
assign sig_34 = sig_31 & sig_32;
assign sig_35 = A[4] ^ B[4];
assign sig_36 = A[4] & B[4];
assign sig_38 = sig_35 ^ sig_34;
assign sig_40 = A[5] ^ B[5];
assign sig_41 = A[5] & B[5];
assign sig_42 = sig_40 & sig_36;
assign sig_43 = sig_40 ^ sig_36;
assign sig_44 = sig_41 | sig_42;
assign sig_45 = A[6] ^ B[6];
assign sig_46 = A[6] & B[6];
assign sig_47 = sig_45 & sig_44;
assign sig_48 = sig_45 ^ sig_44;
assign sig_49 = sig_46 | sig_47;
assign sig_50 = A[7] ^ B[7];
assign sig_51 = A[7] & B[7];
assign sig_52 = sig_50 & sig_49;
assign sig_53 = sig_50 ^ sig_49;
assign sig_54 = sig_51 | sig_52;
assign sig_55 = A[8] ^ B[8];
assign sig_56 = A[8] & B[8];
assign sig_57 = sig_55 & sig_54;
assign sig_58 = sig_55 ^ sig_54;
assign sig_59 = sig_56 | sig_57;
assign sig_60 = A[8] ^ B[8];
assign sig_61 = sig_60 ^ sig_59;

assign O[9] = sig_61;
assign O[8] = sig_58;
assign O[7] = sig_53;
assign O[6] = sig_48;
assign O[5] = sig_43;
assign O[4] = sig_38;
assign O[3] = sig_33;
assign O[2] = sig_28;
assign O[1] = sig_23;
assign O[0] = sig_18;

endmodule


