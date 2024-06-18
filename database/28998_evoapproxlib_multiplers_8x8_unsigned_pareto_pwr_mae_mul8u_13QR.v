// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, R. Hrbacek, Z. Vasicek and L. Sekanina, "EvoApprox8b: Library of approximate adders and multipliers for circuit design and benchmarking of approximation methods". Design, Automation & Test in Europe Conference & Exhibition (DATE), 2017, Lausanne, 2017, pp. 258-261. doi: 10.23919/DATE.2017.7926993 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 4.83 %
// MAE = 3168 
// WCE% = 19.46 %
// WCE = 12754 
// WCRE% = 100.00 %
// EP% = 99.20 %
// MRE% = 44.00 %
// MSE = 15608.397e3 
// PDK45_PWR = 0.0085 mW
// PDK45_AREA = 41.3 um2
// PDK45_DELAY = 0.20 ns

module mul8u_13QR (
    A,
    B,
    O
);

input [7:0] A;
input [7:0] B;
output [15:0] O;

wire sig_180,sig_256,sig_257,sig_259,sig_266,sig_268,sig_283,sig_307,sig_311,sig_329,sig_330,sig_331,sig_332,sig_333,sig_334,sig_335;

assign sig_180 = B[7] & A[5];
assign sig_256 = A[6] & B[6];
assign sig_257 = B[7] & A[6];
assign sig_259 = sig_256 | sig_180;
assign sig_266 = B[5] & A[7];
assign sig_268 = B[7] & A[7];
assign sig_283 = A[7] & B[5];
assign sig_307 = A[7] & B[6];
assign sig_311 = sig_266 & B[6];
assign sig_329 = sig_307 ^ sig_283;
assign sig_330 = sig_307 & B[5];
assign sig_331 = sig_268 ^ sig_257;
assign sig_332 = A[7] & sig_257;
assign sig_333 = B[7] & sig_311;
assign sig_334 = sig_331 ^ sig_330;
assign sig_335 = sig_332 | sig_333;

assign O[15] = sig_335;
assign O[14] = sig_334;
assign O[13] = sig_329;
assign O[12] = sig_259;
assign O[11] = sig_259;
assign O[10] = sig_180;
assign O[9] = 1'b0;
assign O[8] = sig_259;
assign O[7] = sig_259;
assign O[6] = sig_332;
assign O[5] = 1'b0;
assign O[4] = sig_180;
assign O[3] = 1'b0;
assign O[2] = 1'b0;
assign O[1] = sig_268;
assign O[0] = 1'b0;

endmodule


