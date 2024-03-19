/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 3.67 %
// MAE = 4.7 
// WCE% = 10.16 %
// WCE = 13 
// WCRE% = 400.00 %
// EP% = 94.56 %
// MRE% = 19.71 %
// MSE = 31 
// PDK45_PWR = 0.022 mW
// PDK45_AREA = 56.8 um2
// PDK45_DELAY = 0.48 ns

module add8s_6TN (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [7:0] O;

wire sig_21,sig_22,sig_23,sig_24,sig_25,sig_26,sig_27,sig_28,sig_29,sig_30,sig_33,sig_35,sig_37,sig_38,sig_39,sig_41,sig_44,sig_46,sig_47,sig_48;
wire sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55,sig_56,sig_57,sig_59,sig_60,sig_61,sig_62,sig_63,sig_64;

assign sig_21 = ~(A[2] & B[2]);
assign sig_22 = A[3] & B[3];
assign sig_23 = A[3] | B[3];
assign sig_24 = A[4] & B[4];
assign sig_25 = A[4] ^ B[4];
assign sig_26 = A[5] & B[5];
assign sig_27 = A[5] ^ B[5];
assign sig_28 = A[6] & B[6];
assign sig_29 = A[6] ^ B[6];
assign sig_30 = A[7] ^ B[7];
assign sig_33 = sig_22 | B[7];
assign sig_35 = sig_25 & sig_23;
assign sig_37 = sig_29 & sig_26;
assign sig_38 = sig_29 & sig_27;
assign sig_39 = sig_28 | sig_37;
assign sig_41 = A[0] | sig_21;
assign sig_44 = sig_27 & sig_24;
assign sig_46 = sig_26 | sig_44;
assign sig_47 = sig_38 & sig_24;
assign sig_48 = sig_38 & sig_35;
assign sig_49 = sig_39 | sig_47;
assign sig_50 = sig_23 & sig_33;
assign sig_51 = sig_50 | sig_22;
assign sig_52 = sig_35 & sig_33;
assign sig_53 = sig_24 | sig_52;
assign sig_54 = sig_27 & sig_52;
assign sig_55 = sig_46 | sig_54;
assign sig_56 = sig_48 & sig_33;
assign sig_57 = sig_49 | sig_56;
assign sig_59 = sig_21 ^ sig_41;
assign sig_60 = sig_23 ^ sig_51;
assign sig_61 = sig_25 ^ sig_51;
assign sig_62 = sig_27 ^ sig_53;
assign sig_63 = sig_29 ^ sig_55;
assign sig_64 = sig_30 ^ sig_57;

assign O[7] = sig_64;
assign O[6] = sig_63;
assign O[5] = sig_62;
assign O[4] = sig_61;
assign O[3] = sig_60;
assign O[2] = sig_64;
assign O[1] = sig_59;
assign O[0] = sig_60;

endmodule


