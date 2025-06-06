// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 0.067 %
// MAE = 0.69 
// WCE% = 0.29 %
// WCE = 3.0 
// WCRE% = 100.00 %
// EP% = 37.50 %
// MRE% = 1.45 %
// MSE = 1.5 
// PDK45_PWR = 0.027 mW
// PDK45_AREA = 100.4 um2
// PDK45_DELAY = 0.59 ns

module mul8x2u_0S7 (
    A,
    B,
    O
);

input [7:0] A;
input [1:0] B;
output [9:0] O;

wire sig_10,sig_12,sig_13,sig_14,sig_15,sig_16,sig_17,sig_19,sig_20,sig_21,sig_22,sig_23,sig_24,sig_25,sig_26,sig_29,sig_32,sig_33,sig_34,sig_35;
wire sig_36,sig_37,sig_38,sig_39,sig_40,sig_41,sig_42,sig_43,sig_44,sig_45,sig_46,sig_47,sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55;
wire sig_56,sig_57,sig_58,sig_59;

assign sig_10 = A[0] & B[1];
assign sig_12 = A[2] & B[0];
assign sig_13 = A[3] & B[0];
assign sig_14 = A[4] & B[0];
assign sig_15 = A[5] & B[0];
assign sig_16 = A[6] & B[0];
assign sig_17 = A[7] & B[0];
assign sig_19 = A[1] & B[1];
assign sig_20 = A[2] & B[1];
assign sig_21 = A[3] & B[1];
assign sig_22 = A[4] & B[1];
assign sig_23 = A[5] & B[1];
assign sig_24 = A[6] & B[1];
assign sig_25 = A[7] & B[1];
assign sig_26 = sig_12 | sig_19;
assign sig_29 = sig_12 & sig_19;
assign sig_32 = B[1] & sig_29;
assign sig_33 = sig_13 ^ sig_20;
assign sig_34 = sig_13 & sig_20;
assign sig_35 = sig_34 | sig_32;
assign sig_36 = sig_33 ^ sig_32;
assign sig_37 = sig_34 | sig_29;
assign sig_38 = sig_14 ^ sig_21;
assign sig_39 = sig_14 & sig_21;
assign sig_40 = sig_38 & sig_37;
assign sig_41 = sig_38 ^ sig_35;
assign sig_42 = sig_39 | sig_40;
assign sig_43 = sig_15 ^ sig_22;
assign sig_44 = sig_15 & sig_22;
assign sig_45 = sig_43 & sig_42;
assign sig_46 = sig_43 ^ sig_42;
assign sig_47 = sig_44 | sig_45;
assign sig_48 = sig_16 ^ sig_23;
assign sig_49 = sig_16 & sig_23;
assign sig_50 = sig_48 & sig_47;
assign sig_51 = sig_48 ^ sig_47;
assign sig_52 = sig_49 | sig_50;
assign sig_53 = sig_17 ^ sig_24;
assign sig_54 = sig_17 & sig_24;
assign sig_55 = sig_53 & sig_52;
assign sig_56 = sig_53 ^ sig_52;
assign sig_57 = sig_54 | sig_55;
assign sig_58 = sig_57 & sig_25;
assign sig_59 = sig_57 ^ sig_25;

assign O[9] = sig_58;
assign O[8] = sig_59;
assign O[7] = sig_56;
assign O[6] = sig_51;
assign O[5] = sig_46;
assign O[4] = sig_41;
assign O[3] = sig_36;
assign O[2] = sig_26;
assign O[1] = sig_10;
assign O[0] = sig_12;

endmodule


