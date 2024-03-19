/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 1.90 %
// MAE = 39 
// WCE% = 6.88 %
// WCE = 141 
// WCRE% = 100.00 %
// EP% = 86.23 %
// MRE% = 24.47 %
// MSE = 2709 
// PDK45_PWR = 0.019 mW
// PDK45_AREA = 76.5 um2
// PDK45_DELAY = 0.37 ns

module mul8x3u_0ET (
    A,
    B,
    O
);

input [7:0] A;
input [2:0] B;
output [10:0] O;

wire sig_12,sig_18,sig_24,sig_25,sig_30,sig_46,sig_50,sig_54,sig_57,sig_59,sig_60,sig_61,sig_66,sig_67,sig_68,sig_82,sig_87,sig_89,sig_90,sig_91;
wire sig_92,sig_94,sig_95,sig_96,sig_97,sig_98,sig_99,sig_100,sig_101,sig_102,sig_103,sig_104,sig_105;

assign sig_12 = A[5] & B[2];
assign sig_18 = A[7] & B[0];
assign sig_24 = B[0] & B[1];
assign sig_25 = A[6] & B[1];
assign sig_30 = B[1] & A[7];
assign sig_46 = A[4] & B[2];
assign sig_50 = A[6] & sig_24;
assign sig_54 = sig_18 ^ sig_25;
assign sig_57 = sig_54 ^ sig_50;
assign sig_59 = sig_25 & sig_18;
assign sig_60 = sig_50 ^ sig_30;
assign sig_61 = sig_12 & B[1];
assign sig_66 = A[5] & B[2];
assign sig_67 = A[6] & B[2];
assign sig_68 = A[7] & B[2];
assign sig_82 = B[1] & A[4];
assign sig_87 = sig_12 & B[0];
assign sig_89 = sig_46 | sig_82;
assign sig_90 = sig_87 | sig_61;
assign sig_91 = sig_57 ^ sig_66;
assign sig_92 = sig_18 & sig_66;
assign sig_94 = sig_91 ^ sig_90;
assign sig_95 = sig_92 | sig_90;
assign sig_96 = sig_60 ^ sig_67;
assign sig_97 = sig_60 & sig_67;
assign sig_98 = sig_96 & sig_95;
assign sig_99 = sig_96 ^ sig_95;
assign sig_100 = sig_97 | sig_98;
assign sig_101 = sig_59 ^ sig_68;
assign sig_102 = sig_59 & sig_99;
assign sig_103 = sig_68 & sig_100;
assign sig_104 = sig_101 ^ sig_100;
assign sig_105 = sig_102 | sig_103;

assign O[10] = sig_105;
assign O[9] = sig_104;
assign O[8] = sig_99;
assign O[7] = sig_94;
assign O[6] = sig_46;
assign O[5] = sig_89;
assign O[4] = sig_82;
assign O[3] = 1'b0;
assign O[2] = sig_57;
assign O[1] = 1'b0;
assign O[0] = sig_66;

endmodule


