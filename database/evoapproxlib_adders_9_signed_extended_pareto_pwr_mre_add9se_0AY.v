/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 4.30 %
// MAE = 22 
// WCE% = 13.67 %
// WCE = 70 
// WCRE% = 6500.00 %
// EP% = 98.61 %
// MRE% = 38.51 %
// MSE = 729 
// PDK45_PWR = 0.012 mW
// PDK45_AREA = 34.3 um2
// PDK45_DELAY = 0.24 ns

module add9se_0AY (
    A,
    B,
    O
);

input [8:0] A;
input [8:0] B;
output [9:0] O;

wire sig_18,sig_29,sig_30,sig_31,sig_32,sig_33,sig_35,sig_46,sig_47,sig_48,sig_57,sig_58,sig_59,sig_66,sig_67,sig_72,sig_74,sig_75,sig_76;

assign sig_18 = B[8] & A[8];
assign sig_29 = B[8] ^ A[8];
assign sig_30 = A[6] & B[6];
assign sig_31 = A[6] ^ B[6];
assign sig_32 = A[7] & B[7];
assign sig_33 = A[7] ^ B[7];
assign sig_35 = A[8] ^ B[8];
assign sig_46 = sig_35 & sig_32;
assign sig_47 = sig_35 & sig_33;
assign sig_48 = sig_18 | sig_46;
assign sig_57 = B[5] | A[4];
assign sig_58 = sig_47 & sig_30;
assign sig_59 = sig_48 | sig_58;
assign sig_66 = sig_33 & sig_30;
assign sig_67 = sig_32 | sig_66;
assign sig_72 = A[3] | sig_57;
assign sig_74 = sig_33 ^ sig_30;
assign sig_75 = sig_29 ^ sig_67;
assign sig_76 = sig_35 ^ sig_59;

assign O[9] = sig_76;
assign O[8] = sig_75;
assign O[7] = sig_74;
assign O[6] = sig_31;
assign O[5] = sig_72;
assign O[4] = sig_72;
assign O[3] = sig_72;
assign O[2] = sig_72;
assign O[1] = A[4];
assign O[0] = B[5];

endmodule


