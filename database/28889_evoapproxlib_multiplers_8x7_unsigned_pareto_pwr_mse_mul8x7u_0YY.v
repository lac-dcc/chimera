// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, L. Sekanina, Z. Vasicek "Libraries of Approximate Circuits: Automated Design and Application in CNN Accelerators" IEEE Journal on Emerging and Selected Topics in Circuits and Systems, Vol 10, No 4, 2020 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 2.74 %
// MAE = 899 
// WCE% = 11.27 %
// WCE = 3693 
// WCRE% = 200.20 %
// EP% = 98.77 %
// MRE% = 31.30 %
// MSE = 12776.178e2 
// PDK45_PWR = 0.030 mW
// PDK45_AREA = 117.3 um2
// PDK45_DELAY = 0.49 ns

module mul8x7u_0YY (
    A,
    B,
    O
);

input [7:0] A;
input [6:0] B;
output [14:0] O;

wire sig_45,sig_46,sig_53,sig_54,sig_59,sig_61,sig_62,sig_68,sig_69,sig_70,sig_127,sig_130,sig_132,sig_133,sig_134,sig_136,sig_137,sig_138,sig_186,sig_187;
wire sig_188,sig_189,sig_224,sig_225,sig_226,sig_227,sig_254,sig_255,sig_259,sig_260,sig_261,sig_262,sig_263,sig_264,sig_265,sig_266,sig_267,sig_268,sig_301,sig_302;
wire sig_306,sig_307,sig_308,sig_309,sig_310,sig_311;

assign sig_45 = ~B[4];
assign sig_46 = A[7] & B[3];
assign sig_53 = A[6] & B[4];
assign sig_54 = A[7] & B[4];
assign sig_59 = A[4] & B[5];
assign sig_61 = A[6] & B[5];
assign sig_62 = A[7] & B[5];
assign sig_68 = A[5] & B[6];
assign sig_69 = A[6] & B[6];
assign sig_70 = A[7] & B[6];
assign sig_127 = ~(sig_45 | B[4]);
assign sig_130 = sig_127 | sig_59;
assign sig_132 = sig_46 | sig_53;
assign sig_133 = sig_46 & sig_53;
assign sig_134 = B[6] & A[5];
assign sig_136 = sig_133 | sig_134;
assign sig_137 = sig_54 & sig_61;
assign sig_138 = sig_54 ^ sig_61;
assign sig_186 = sig_136 ^ sig_68;
assign sig_187 = B[6] & A[5];
assign sig_188 = sig_137 ^ sig_69;
assign sig_189 = sig_137 & sig_69;
assign sig_224 = sig_138 & sig_186;
assign sig_225 = sig_138 | sig_133;
assign sig_226 = sig_62 & sig_188;
assign sig_227 = sig_62 ^ sig_188;
assign sig_254 = sig_225 ^ sig_132;
assign sig_255 = sig_225 & sig_132;
assign sig_259 = sig_227 ^ sig_224;
assign sig_260 = B[6] & sig_224;
assign sig_261 = sig_227 & sig_187;
assign sig_262 = sig_259 ^ sig_187;
assign sig_263 = sig_260 | sig_261;
assign sig_264 = sig_70 ^ sig_226;
assign sig_265 = sig_70 & sig_226;
assign sig_266 = sig_132 & sig_189;
assign sig_267 = sig_264 ^ sig_189;
assign sig_268 = sig_265 | sig_266;
assign sig_301 = sig_262 ^ sig_255;
assign sig_302 = sig_262 & sig_255;
assign sig_306 = sig_267 ^ sig_263;
assign sig_307 = sig_267 & sig_263;
assign sig_308 = sig_264 & sig_302;
assign sig_309 = sig_306 ^ sig_302;
assign sig_310 = sig_307 | sig_308;
assign sig_311 = sig_268 | sig_310;

assign O[14] = sig_311;
assign O[13] = sig_309;
assign O[12] = sig_301;
assign O[11] = sig_254;
assign O[10] = sig_130;
assign O[9] = sig_130;
assign O[8] = 1'b0;
assign O[7] = sig_127;
assign O[6] = 1'b0;
assign O[5] = sig_263;
assign O[4] = sig_132;
assign O[3] = 1'b0;
assign O[2] = sig_263;
assign O[1] = sig_62;
assign O[0] = sig_130;

endmodule


