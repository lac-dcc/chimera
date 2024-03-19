/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 0.078 %
// MAE = 0.2 
// WCE% = 0.39 %
// WCE = 1.0 
// WCRE% = 50.00 %
// EP% = 25.00 %
// MRE% = 0.87 %
// MSE = 0.2 
// PDK45_PWR = 0.034 mW
// PDK45_AREA = 70.4 um2
// PDK45_DELAY = 0.62 ns

module add8se_8YC (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [8:0] O;

wire sig_16,sig_17,sig_18,sig_19,sig_20,sig_21,sig_22,sig_23,sig_24,sig_25,sig_26,sig_27,sig_28,sig_29,sig_30,sig_31,sig_32,sig_33,sig_34,sig_35;
wire sig_36,sig_37,sig_38,sig_39,sig_40,sig_41,sig_42,sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55;
wire sig_56,sig_57,sig_58,sig_59,sig_60,sig_61,sig_62,sig_63,sig_64,sig_65,sig_66,sig_67,sig_68,sig_69,sig_70,sig_71,sig_72,sig_73,sig_74,sig_75;
wire sig_76,sig_77,sig_78,sig_79,sig_80,sig_81,sig_82,sig_83,sig_84;

assign sig_16 = A[0] & B[0];
assign sig_17 = ~(A[0] & B[0]);
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
assign sig_31 = A[7] ^ B[7];
assign sig_32 = A[7] ^ B[7];
assign sig_33 = sig_19 & sig_16;
assign sig_34 = sig_18 | sig_33;
assign sig_35 = sig_21 & sig_18;
assign sig_36 = sig_21 & sig_19;
assign sig_37 = sig_20 | sig_35;
assign sig_38 = sig_23 & sig_20;
assign sig_39 = sig_23 & sig_21;
assign sig_40 = sig_22 | sig_38;
assign sig_41 = sig_25 & sig_22;
assign sig_42 = sig_25 & sig_23;
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
assign sig_53 = sig_36 & sig_16;
assign sig_54 = sig_37 | sig_53;
assign sig_55 = sig_39 & sig_34;
assign sig_56 = sig_40 | sig_55;
assign sig_57 = sig_42 & sig_37;
assign sig_58 = sig_42 & sig_36;
assign sig_59 = sig_43 | sig_57;
assign sig_60 = sig_45 & sig_40;
assign sig_61 = sig_45 & sig_39;
assign sig_62 = sig_46 | sig_60;
assign sig_63 = sig_48 & sig_43;
assign sig_64 = sig_48 & sig_42;
assign sig_65 = sig_49 | sig_63;
assign sig_66 = sig_51 & sig_46;
assign sig_67 = sig_51 & sig_45;
assign sig_68 = sig_52 | sig_66;
assign sig_69 = sig_58 & sig_16;
assign sig_70 = sig_59 | sig_69;
assign sig_71 = sig_61 & sig_34;
assign sig_72 = sig_62 | sig_71;
assign sig_73 = sig_64 & sig_54;
assign sig_74 = sig_65 | sig_73;
assign sig_75 = sig_67 & sig_56;
assign sig_76 = sig_68 | sig_75;
assign sig_77 = sig_19 ^ sig_16;
assign sig_78 = sig_21 ^ sig_34;
assign sig_79 = sig_23 ^ sig_54;
assign sig_80 = sig_25 ^ sig_56;
assign sig_81 = sig_27 ^ sig_70;
assign sig_82 = sig_29 ^ sig_72;
assign sig_83 = sig_31 ^ sig_74;
assign sig_84 = sig_32 ^ sig_76;

assign O[8] = sig_84;
assign O[7] = sig_83;
assign O[6] = sig_82;
assign O[5] = sig_81;
assign O[4] = sig_80;
assign O[3] = sig_79;
assign O[2] = sig_78;
assign O[1] = sig_77;
assign O[0] = sig_17;

endmodule


