/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and wce parameters
***/
// MAE% = 2.90 %
// MAE = 476 
// WCE% = 11.38 %
// WCE = 1865 
// WCRE% = 800.00 %
// EP% = 97.96 %
// MRE% = 35.91 %
// MSE = 353184 
// PDK45_PWR = 0.025 mW
// PDK45_AREA = 87.3 um2
// PDK45_DELAY = 0.45 ns

module mul8x6u_0MH (
    A,
    B,
    O
);

input [7:0] A;
input [5:0] B;
output [13:0] O;

wire sig_71,sig_150,sig_160,sig_161,sig_194,sig_195,sig_196,sig_197,sig_198,sig_203,sig_204,sig_205,sig_206,sig_225,sig_229,sig_231,sig_232,sig_233,sig_234,sig_235;
wire sig_236,sig_237,sig_238,sig_239,sig_240,sig_241,sig_242,sig_243;

assign sig_71 = A[5] & B[2];
assign sig_150 = B[3] & A[7];
assign sig_160 = A[6] & B[4];
assign sig_161 = A[7] & B[4];
assign sig_194 = sig_150 ^ sig_161;
assign sig_195 = sig_150 & B[4];
assign sig_196 = sig_161 & A[6];
assign sig_197 = sig_194 ^ sig_160;
assign sig_198 = sig_195 | sig_196;
assign sig_203 = A[4] & B[5];
assign sig_204 = A[5] & B[5];
assign sig_205 = A[6] & B[5];
assign sig_206 = A[7] & B[5];
assign sig_225 = B[5] & sig_71;
assign sig_229 = sig_71 ^ sig_204;
assign sig_231 = A[5] & sig_203;
assign sig_232 = sig_229 ^ sig_203;
assign sig_233 = sig_225 | sig_231;
assign sig_234 = sig_197 ^ sig_205;
assign sig_235 = sig_197 & sig_205;
assign sig_236 = sig_234 & sig_233;
assign sig_237 = sig_234 ^ sig_233;
assign sig_238 = sig_235 | sig_236;
assign sig_239 = sig_198 ^ sig_206;
assign sig_240 = sig_198 & B[5];
assign sig_241 = sig_206 & sig_238;
assign sig_242 = sig_239 ^ sig_238;
assign sig_243 = sig_240 | sig_241;

assign O[13] = sig_243;
assign O[12] = sig_242;
assign O[11] = sig_237;
assign O[10] = sig_232;
assign O[9] = 1'b0;
assign O[8] = 1'b0;
assign O[7] = sig_71;
assign O[6] = sig_237;
assign O[5] = 1'b0;
assign O[4] = 1'b0;
assign O[3] = 1'b0;
assign O[2] = sig_203;
assign O[1] = sig_225;
assign O[0] = 1'b0;

endmodule


