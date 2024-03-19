/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 9.40 %
// MAE = 770 
// WCE% = 35.66 %
// WCE = 2921 
// WCRE% = 300.00 %
// EP% = 96.48 %
// MRE% = 68.94 %
// MSE = 972416 
// PDK45_PWR = 0.0006 mW
// PDK45_AREA = 4.7 um2
// PDK45_DELAY = 0.04 ns

module mul8x5u_453 (
    A,
    B,
    O
);

input [7:0] A;
input [4:0] B;
output [12:0] O;

wire sig_114,sig_195;

assign sig_114 = A[6] & B[3];
assign sig_195 = B[4] & A[7];

assign O[12] = sig_195;
assign O[11] = sig_114;
assign O[10] = 1'b0;
assign O[9] = 1'b0;
assign O[8] = 1'b0;
assign O[7] = sig_195;
assign O[6] = 1'b0;
assign O[5] = 1'b0;
assign O[4] = sig_195;
assign O[3] = 1'b0;
assign O[2] = 1'b0;
assign O[1] = sig_195;
assign O[0] = sig_195;

endmodule


