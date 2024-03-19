/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 0.47 %
// MAE = 4.8 
// WCE% = 2.05 %
// WCE = 21 
// WCRE% = 100.00 %
// EP% = 70.90 %
// MRE% = 8.16 %
// MSE = 49 
// PDK45_PWR = 0.017 mW
// PDK45_AREA = 68.0 um2
// PDK45_DELAY = 0.37 ns

module mul8x2u_0ZF (
    A,
    B,
    O
);

input [7:0] A;
input [1:0] B;
output [9:0] O;

wire sig_11,sig_12,sig_14,sig_15,sig_16,sig_17,sig_19,sig_20,sig_23,sig_24,sig_27,sig_29,sig_32,sig_35,sig_36,sig_37,sig_39,sig_42,sig_46,sig_47;
wire sig_48,sig_49,sig_50,sig_51,sig_52,sig_53,sig_54,sig_55,sig_56,sig_57,sig_58,sig_59;

assign sig_11 = A[4] & B[1];
assign sig_12 = ~A[3];
assign sig_14 = A[4] & B[0];
assign sig_15 = A[5] & B[0];
assign sig_16 = A[6] & B[0];
assign sig_17 = A[7] & B[0];
assign sig_19 = sig_12 & B[1];
assign sig_20 = A[3] & B[1];
assign sig_23 = A[5] & B[1];
assign sig_24 = A[6] & B[1];
assign sig_27 = A[7] & B[1];
assign sig_29 = sig_16 & sig_23;
assign sig_32 = sig_20 & sig_14;
assign sig_35 = sig_15 ^ sig_11;
assign sig_36 = sig_19 ^ B[1];
assign sig_37 = sig_14 & sig_36;
assign sig_39 = sig_15 & sig_11;
assign sig_42 = sig_36 | sig_14;
assign sig_46 = sig_35 ^ sig_37;
assign sig_47 = sig_39 | sig_32;
assign sig_48 = sig_16 ^ sig_23;
assign sig_49 = sig_47 & sig_42;
assign sig_50 = sig_48 & sig_47;
assign sig_51 = sig_48 ^ sig_49;
assign sig_52 = sig_29 | sig_50;
assign sig_53 = sig_17 ^ sig_24;
assign sig_54 = sig_17 & sig_24;
assign sig_55 = sig_53 & sig_52;
assign sig_56 = sig_53 ^ sig_52;
assign sig_57 = sig_54 | sig_55;
assign sig_58 = sig_57 & sig_27;
assign sig_59 = sig_57 ^ sig_27;

assign O[9] = sig_58;
assign O[8] = sig_59;
assign O[7] = sig_56;
assign O[6] = sig_51;
assign O[5] = sig_46;
assign O[4] = sig_42;
assign O[3] = sig_42;
assign O[2] = sig_58;
assign O[1] = 1'b0;
assign O[0] = sig_51;

endmodule


