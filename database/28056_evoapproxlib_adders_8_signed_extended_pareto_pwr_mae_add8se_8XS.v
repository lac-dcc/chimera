// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 25.00 %
// MAE = 64 
// WCE% = 50.00 %
// WCE = 128 
// WCRE% = 9700.00 %
// EP% = 99.95 %
// MRE% = 249.36 %
// MSE = 4798 
// PDK45_PWR = 0.000 mW
// PDK45_AREA = 0.0 um2
// PDK45_DELAY = 0.00 ns

module add8se_8XS (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [8:0] O;
assign O[8] = A[7];
assign O[7] = A[7];
assign O[6] = A[6];
assign O[5] = B[6];
assign O[4] = A[5];
assign O[3] = B[3];
assign O[2] = A[5];
assign O[1] = A[1];
assign O[0] = 1'b0;

endmodule


