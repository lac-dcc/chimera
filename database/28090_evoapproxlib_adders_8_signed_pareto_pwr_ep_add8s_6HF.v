// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and ep parameters
***/
// MAE% = 44.45 %
// MAE = 57 
// WCE% = 100.00 %
// WCE = 128 
// WCRE% = 200.00 %
// EP% = 99.48 %
// MRE% = 99.98 %
// MSE = 4551 
// PDK45_PWR = 0.000 mW
// PDK45_AREA = 0.0 um2
// PDK45_DELAY = 0.00 ns

module add8s_6HF (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [7:0] O;

wire sig_61,sig_64;

assign sig_61 = ~B[3];
assign sig_64 = ~(sig_61 & B[3]);

assign O[7] = sig_64;
assign O[6] = sig_64;
assign O[5] = sig_64;
assign O[4] = sig_64;
assign O[3] = sig_64;
assign O[2] = sig_64;
assign O[1] = sig_64;
assign O[0] = sig_64;

endmodule


