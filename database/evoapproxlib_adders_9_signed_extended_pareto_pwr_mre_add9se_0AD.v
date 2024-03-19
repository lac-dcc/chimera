/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 2.23 %
// MAE = 11 
// WCE% = 6.84 %
// WCE = 35 
// WCRE% = 2600.00 %
// EP% = 97.44 %
// MRE% = 20.67 %
// MSE = 186 
// PDK45_PWR = 0.017 mW
// PDK45_AREA = 43.6 um2
// PDK45_DELAY = 0.31 ns

module add9se_0AD (
    A,
    B,
    O
);

input [8:0] A;
input [8:0] B;
output [9:0] O;

wire sig_28,sig_29,sig_30,sig_31,sig_32,sig_33,sig_34,sig_35,sig_36,sig_43,sig_45,sig_46,sig_47,sig_48,sig_57,sig_58,sig_59,sig_66,sig_67,sig_71;
wire sig_73,sig_74,sig_75,sig_76;

assign sig_28 = A[5] & B[5];
assign sig_29 = A[5] ^ B[5];
assign sig_30 = A[6] & B[6];
assign sig_31 = A[6] ^ B[6];
assign sig_32 = A[7] & B[7];
assign sig_33 = A[7] ^ B[7];
assign sig_34 = A[8] & B[8];
assign sig_35 = A[8] | B[8];
assign sig_36 = A[8] ^ B[8];
assign sig_43 = sig_31 & sig_28;
assign sig_45 = sig_30 | sig_43;
assign sig_46 = sig_35 & sig_32;
assign sig_47 = sig_35 & sig_33;
assign sig_48 = sig_34 | sig_46;
assign sig_57 = A[0] | B[4];
assign sig_58 = sig_47 & sig_45;
assign sig_59 = sig_48 | sig_58;
assign sig_66 = sig_33 & sig_45;
assign sig_67 = sig_32 | sig_66;
assign sig_71 = sig_57 | A[4];
assign sig_73 = sig_31 ^ sig_28;
assign sig_74 = sig_33 ^ sig_45;
assign sig_75 = sig_36 ^ sig_67;
assign sig_76 = sig_36 ^ sig_59;

assign O[9] = sig_76;
assign O[8] = sig_75;
assign O[7] = sig_74;
assign O[6] = sig_73;
assign O[5] = sig_29;
assign O[4] = sig_71;
assign O[3] = sig_57;
assign O[2] = sig_76;
assign O[1] = sig_57;
assign O[0] = sig_71;

endmodule


