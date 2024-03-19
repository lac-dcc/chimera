/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 7.97 %
// MAE = 10 
// WCE% = 19.53 %
// WCE = 25 
// WCRE% = 2500.00 %
// EP% = 96.88 %
// MRE% = 61.40 %
// MSE = 158 
// PDK45_PWR = 0.016 mW
// PDK45_AREA = 39.4 um2
// PDK45_DELAY = 0.37 ns

module add8s_6X9 (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [7:0] O;

wire sig_30,sig_31,sig_33,sig_34,sig_35,sig_37,sig_38,sig_39,sig_40,sig_41,sig_42,sig_43,sig_45,sig_46,sig_47,sig_48,sig_49;

assign sig_30 = A[7] & B[7];
assign sig_31 = A[6] & B[6];
assign sig_33 = A[4] | B[4];
assign sig_34 = A[4] & B[4];
assign sig_35 = sig_33 & sig_30;
assign sig_37 = sig_34 | sig_35;
assign sig_38 = A[5] ^ B[5];
assign sig_39 = A[5] & B[5];
assign sig_40 = sig_38 & sig_37;
assign sig_41 = sig_38 ^ sig_37;
assign sig_42 = sig_39 | sig_40;
assign sig_43 = A[6] ^ B[6];
assign sig_45 = sig_43 & sig_42;
assign sig_46 = sig_43 ^ sig_42;
assign sig_47 = sig_31 | sig_45;
assign sig_48 = A[7] ^ B[7];
assign sig_49 = sig_48 ^ sig_47;

assign O[7] = sig_49;
assign O[6] = sig_46;
assign O[5] = sig_41;
assign O[4] = A[3];
assign O[3] = B[3];
assign O[2] = A[2];
assign O[1] = 1'b0;
assign O[0] = A[0];

endmodule


