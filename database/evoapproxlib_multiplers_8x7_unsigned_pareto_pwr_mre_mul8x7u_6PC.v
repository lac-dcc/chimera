/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 3.19 %
// MAE = 1044 
// WCE% = 12.32 %
// WCE = 4037 
// WCRE% = 700.00 %
// EP% = 98.81 %
// MRE% = 35.41 %
// MSE = 16822.757e2 
// PDK45_PWR = 0.018 mW
// PDK45_AREA = 74.6 um2
// PDK45_DELAY = 0.37 ns

module mul8x7u_6PC (
    A,
    B,
    O
);

input [7:0] A;
input [6:0] B;
output [14:0] O;

wire sig_151,sig_162,sig_195,sig_196,sig_205,sig_207,sig_240,sig_241,sig_242,sig_243,sig_244,sig_249,sig_250,sig_251,sig_252,sig_280,sig_281,sig_282,sig_283,sig_284;
wire sig_285,sig_286,sig_287,sig_288,sig_289;

assign sig_151 = A[7] & B[3];
assign sig_162 = A[7] & B[4];
assign sig_195 = sig_151 ^ sig_162;
assign sig_196 = sig_151 & B[4];
assign sig_205 = A[6] & B[5];
assign sig_207 = A[7] & B[5];
assign sig_240 = sig_196 ^ sig_207;
assign sig_241 = sig_196 & B[5];
assign sig_242 = sig_207 & A[6];
assign sig_243 = sig_240 ^ sig_205;
assign sig_244 = sig_241 | sig_242;
assign sig_249 = A[3] & B[4];
assign sig_250 = A[5] & B[6];
assign sig_251 = A[6] & B[6];
assign sig_252 = A[7] & B[6];
assign sig_280 = sig_243 ^ sig_251;
assign sig_281 = sig_243 & sig_251;
assign sig_282 = sig_280 & sig_250;
assign sig_283 = sig_280 ^ sig_250;
assign sig_284 = sig_281 | sig_282;
assign sig_285 = sig_244 ^ sig_252;
assign sig_286 = sig_244 & sig_252;
assign sig_287 = A[7] & sig_284;
assign sig_288 = sig_285 ^ sig_284;
assign sig_289 = sig_286 | sig_287;

assign O[14] = sig_289;
assign O[13] = sig_288;
assign O[12] = sig_283;
assign O[11] = sig_195;
assign O[10] = sig_249;
assign O[9] = sig_283;
assign O[8] = sig_286;
assign O[7] = sig_242;
assign O[6] = 1'b0;
assign O[5] = 1'b0;
assign O[4] = sig_195;
assign O[3] = 1'b0;
assign O[2] = sig_252;
assign O[1] = sig_283;
assign O[0] = 1'b0;

endmodule


