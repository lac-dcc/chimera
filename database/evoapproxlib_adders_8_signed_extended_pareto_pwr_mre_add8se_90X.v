/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 15.35 %
// MAE = 39 
// WCE% = 50.00 %
// WCE = 128 
// WCRE% = 9500.00 %
// EP% = 99.22 %
// MRE% = 100.10 %
// MSE = 2301 
// PDK45_PWR = 0.000065 mW
// PDK45_AREA = 1.4 um2
// PDK45_DELAY = 0.01 ns

module add8se_90X (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [8:0] O;

wire sig_30;

assign sig_30 = ~A[7];

assign O[8] = B[7];
assign O[7] = B[7];
assign O[6] = sig_30;
assign O[5] = sig_30;
assign O[4] = A[6];
assign O[3] = B[5];
assign O[2] = A[6];
assign O[1] = B[5];
assign O[0] = B[5];

endmodule


