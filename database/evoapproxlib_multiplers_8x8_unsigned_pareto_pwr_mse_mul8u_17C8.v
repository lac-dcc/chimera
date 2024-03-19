/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, R. Hrbacek, Z. Vasicek and L. Sekanina, "EvoApprox8b: Library of approximate adders and multipliers for circuit design and benchmarking of approximation methods". Design, Automation & Test in Europe Conference & Exhibition (DATE), 2017, Lausanne, 2017, pp. 258-261. doi: 10.23919/DATE.2017.7926993 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 7.41 %
// MAE = 4858 
// WCE% = 25.78 %
// WCE = 16896 
// WCRE% = 300.00 %
// EP% = 99.21 %
// MRE% = 57.81 %
// MSE = 37660.75e3 
// PDK45_PWR = 0.0019 mW
// PDK45_AREA = 15.5 um2
// PDK45_DELAY = 0.10 ns

module mul8u_17C8 (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [15:0] O;

wire sig_181,sig_223,sig_267,sig_268,sig_303,sig_308,sig_328;

assign sig_181 = B[5] & A[6];
assign sig_223 = B[7] & A[5];
assign sig_267 = B[6] & A[7];
assign sig_268 = B[7] & A[7];
assign sig_303 = sig_267 | B[7];
assign sig_308 = B[6] & A[6];
assign sig_328 = B[7] ^ sig_303;

assign O[15] = sig_268;
assign O[14] = sig_308;
assign O[13] = sig_328;
assign O[12] = sig_223;
assign O[11] = sig_181;
assign O[10] = sig_181;
assign O[9] = sig_223;
assign O[8] = 1'b0;
assign O[7] = 1'b0;
assign O[6] = 1'b0;
assign O[5] = 1'b0;
assign O[4] = 1'b0;
assign O[3] = 1'b0;
assign O[2] = 1'b0;
assign O[1] = 1'b0;
assign O[0] = 1'b0;

endmodule


