// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
***/
// MAE% = 0.032 %
// MAE = 5438 
// WCE% = 0.17 %
// WCE = 28623 
// WCRE% = 6300.00 %
// EP% = 98.39 %
// MRE% = 2.64 %
// MSE = 48933.638e3 
// PDK45_PWR = 0.579 mW
// PDK45_AREA = 925.0 um2
// PDK45_DELAY = 1.70 ns


module mul12s_36A ( A, B, O );
  input [11:0] A;
  input [11:0] B;
  output [23:0] O;

  wire C_10_10,C_10_11,C_10_3,C_10_4,C_10_5,C_10_6,C_10_7,C_10_8,C_10_9,C_11_10,C_11_11,C_11_3,C_11_4,C_11_5,C_11_6,C_11_7,C_11_8,C_11_9,C_12_10,C_12_11,C_12_3,C_12_4,C_12_5,C_12_6,C_12_7,C_12_8,C_12_9,C_4_10,C_4_11,C_4_3,C_4_4,C_4_5,C_4_6,C_4_7,C_4_8,C_4_9,C_5_10,C_5_11,C_5_3,C_5_4,C_5_5,C_5_6,C_5_7,C_5_8,C_5_9,C_6_10,C_6_11,C_6_3,C_6_4,C_6_5,C_6_6,C_6_7,C_6_8,C_6_9,C_7_10,C_7_11,C_7_3,C_7_4,C_7_5,C_7_6,C_7_7,C_7_8,C_7_9,C_8_10,C_8_11,C_8_3,C_8_4,C_8_5,C_8_6,C_8_7,C_8_8,C_8_9,C_9_10,C_9_11,C_9_3,C_9_4,C_9_5,C_9_6,C_9_7,C_9_8,C_9_9,S_10_0,S_10_1,S_10_10,S_10_11,S_10_2,S_10_3,S_10_4,S_10_5,S_10_6,S_10_7,S_10_8,S_10_9,S_11_0,S_11_1,S_11_10,S_11_11,S_11_2,S_11_3,S_11_4,S_11_5,S_11_6,S_11_7,S_11_8,S_11_9,S_12_0,S_12_1,S_12_10,S_12_11,S_12_2,S_12_3,S_12_4,S_12_5,S_12_6,S_12_7,S_12_8,S_12_9,S_3_10,S_3_11,S_3_3,S_3_4,S_3_5,S_3_6,S_3_7,S_3_8,S_3_9,S_4_10,S_4_11,S_4_2,S_4_3,S_4_4,S_4_5,S_4_6,S_4_7,S_4_8,S_4_9,S_5_1,S_5_10,S_5_11,S_5_2,S_5_3,S_5_4,S_5_5,S_5_6,S_5_7,S_5_8,S_5_9,S_6_0,S_6_1,S_6_10,S_6_11,S_6_2,S_6_3,S_6_4,S_6_5,S_6_6,S_6_7,S_6_8,S_6_9,S_7_0,S_7_1,S_7_10,S_7_11,S_7_2,S_7_3,S_7_4,S_7_5,S_7_6,S_7_7,S_7_8,S_7_9,S_8_0,S_8_1,S_8_10,S_8_11,S_8_2,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7,S_8_8,S_8_9,S_9_0,S_9_1,S_9_10,S_9_11,S_9_2,S_9_3,S_9_4,S_9_5,S_9_6,S_9_7,S_9_8,S_9_9;

  assign S_3_3 = (A[3] & B[3]);
  assign S_3_4 = (A[3] & B[4]);
  assign S_3_5 = (A[3] & B[5]);
  assign S_3_6 = (A[3] & B[6]);
  assign S_3_7 = (A[3] & B[7]);
  assign S_3_8 = (A[3] & B[8]);
  assign S_3_9 = (A[3] & B[9]);
  assign S_3_10 = (A[3] & B[10]);
  assign S_3_11 = ~(A[3] & B[11]);
  assign S_4_2 = S_3_3;
  PDKGENHAX1 U2140 (.A(S_3_4), .B((A[4] & B[3])), .YS(S_4_3), .YC(C_4_3));
  PDKGENHAX1 U2141 (.A(S_3_5), .B((A[4] & B[4])), .YS(S_4_4), .YC(C_4_4));
  PDKGENHAX1 U2142 (.A(S_3_6), .B((A[4] & B[5])), .YS(S_4_5), .YC(C_4_5));
  PDKGENHAX1 U2143 (.A(S_3_7), .B((A[4] & B[6])), .YS(S_4_6), .YC(C_4_6));
  PDKGENHAX1 U2144 (.A(S_3_8), .B((A[4] & B[7])), .YS(S_4_7), .YC(C_4_7));
  PDKGENHAX1 U2145 (.A(S_3_9), .B((A[4] & B[8])), .YS(S_4_8), .YC(C_4_8));
  PDKGENHAX1 U2146 (.A(S_3_10), .B((A[4] & B[9])), .YS(S_4_9), .YC(C_4_9));
  PDKGENHAX1 U2147 (.A(S_3_11), .B((A[4] & B[10])), .YS(S_4_10), .YC(C_4_10));
  PDKGENHAX1 U2148 (.A(1'b1), .B(~(A[4] & B[11])), .YS(S_4_11), .YC(C_4_11));
  assign S_5_1 = S_4_2;
  assign S_5_2 = S_4_3;
  PDKGENFAX1 U2152 (.A(S_4_4), .B(C_4_3), .C((A[5] & B[3])), .YS(S_5_3), .YC(C_5_3));
  PDKGENFAX1 U2153 (.A(S_4_5), .B(C_4_4), .C((A[5] & B[4])), .YS(S_5_4), .YC(C_5_4));
  PDKGENFAX1 U2154 (.A(S_4_6), .B(C_4_5), .C((A[5] & B[5])), .YS(S_5_5), .YC(C_5_5));
  PDKGENFAX1 U2155 (.A(S_4_7), .B(C_4_6), .C((A[5] & B[6])), .YS(S_5_6), .YC(C_5_6));
  PDKGENFAX1 U2156 (.A(S_4_8), .B(C_4_7), .C((A[5] & B[7])), .YS(S_5_7), .YC(C_5_7));
  PDKGENFAX1 U2157 (.A(S_4_9), .B(C_4_8), .C((A[5] & B[8])), .YS(S_5_8), .YC(C_5_8));
  PDKGENFAX1 U2158 (.A(S_4_10), .B(C_4_9), .C((A[5] & B[9])), .YS(S_5_9), .YC(C_5_9));
  PDKGENFAX1 U2159 (.A(S_4_11), .B(C_4_10), .C((A[5] & B[10])), .YS(S_5_10), .YC(C_5_10));
  PDKGENHAX1 U2160 (.A(C_4_11), .B(~(A[5] & B[11])), .YS(S_5_11), .YC(C_5_11));
  assign S_6_0 = S_5_1;
  assign S_6_1 = S_5_2;
  assign S_6_2 = S_5_3;
  PDKGENFAX1 U2164 (.A(S_5_4), .B(C_5_3), .C((A[6] & B[3])), .YS(S_6_3), .YC(C_6_3));
  PDKGENFAX1 U2165 (.A(S_5_5), .B(C_5_4), .C((A[6] & B[4])), .YS(S_6_4), .YC(C_6_4));
  PDKGENFAX1 U2166 (.A(S_5_6), .B(C_5_5), .C((A[6] & B[5])), .YS(S_6_5), .YC(C_6_5));
  PDKGENFAX1 U2167 (.A(S_5_7), .B(C_5_6), .C((A[6] & B[6])), .YS(S_6_6), .YC(C_6_6));
  PDKGENFAX1 U2168 (.A(S_5_8), .B(C_5_7), .C((A[6] & B[7])), .YS(S_6_7), .YC(C_6_7));
  PDKGENFAX1 U2169 (.A(S_5_9), .B(C_5_8), .C((A[6] & B[8])), .YS(S_6_8), .YC(C_6_8));
  PDKGENFAX1 U2170 (.A(S_5_10), .B(C_5_9), .C((A[6] & B[9])), .YS(S_6_9), .YC(C_6_9));
  PDKGENFAX1 U2171 (.A(S_5_11), .B(C_5_10), .C((A[6] & B[10])), .YS(S_6_10), .YC(C_6_10));
  PDKGENHAX1 U2172 (.A(C_5_11), .B(~(A[6] & B[11])), .YS(S_6_11), .YC(C_6_11));
  assign S_7_0 = S_6_1;
  assign S_7_1 = S_6_2;
  assign S_7_2 = S_6_3;
  PDKGENFAX1 U2176 (.A(S_6_4), .B(C_6_3), .C((A[7] & B[3])), .YS(S_7_3), .YC(C_7_3));
  PDKGENFAX1 U2177 (.A(S_6_5), .B(C_6_4), .C((A[7] & B[4])), .YS(S_7_4), .YC(C_7_4));
  PDKGENFAX1 U2178 (.A(S_6_6), .B(C_6_5), .C((A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  PDKGENFAX1 U2179 (.A(S_6_7), .B(C_6_6), .C((A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  PDKGENFAX1 U2180 (.A(S_6_8), .B(C_6_7), .C((A[7] & B[7])), .YS(S_7_7), .YC(C_7_7));
  PDKGENFAX1 U2181 (.A(S_6_9), .B(C_6_8), .C((A[7] & B[8])), .YS(S_7_8), .YC(C_7_8));
  PDKGENFAX1 U2182 (.A(S_6_10), .B(C_6_9), .C((A[7] & B[9])), .YS(S_7_9), .YC(C_7_9));
  PDKGENFAX1 U2183 (.A(S_6_11), .B(C_6_10), .C((A[7] & B[10])), .YS(S_7_10), .YC(C_7_10));
  PDKGENHAX1 U2184 (.A(C_6_11), .B(~(A[7] & B[11])), .YS(S_7_11), .YC(C_7_11));
  assign S_8_0 = S_7_1;
  assign S_8_1 = S_7_2;
  assign S_8_2 = S_7_3;
  PDKGENFAX1 U2188 (.A(S_7_4), .B(C_7_3), .C((A[8] & B[3])), .YS(S_8_3), .YC(C_8_3));
  PDKGENFAX1 U2189 (.A(S_7_5), .B(C_7_4), .C((A[8] & B[4])), .YS(S_8_4), .YC(C_8_4));
  PDKGENFAX1 U2190 (.A(S_7_6), .B(C_7_5), .C((A[8] & B[5])), .YS(S_8_5), .YC(C_8_5));
  PDKGENFAX1 U2191 (.A(S_7_7), .B(C_7_6), .C((A[8] & B[6])), .YS(S_8_6), .YC(C_8_6));
  PDKGENFAX1 U2192 (.A(S_7_8), .B(C_7_7), .C((A[8] & B[7])), .YS(S_8_7), .YC(C_8_7));
  PDKGENFAX1 U2193 (.A(S_7_9), .B(C_7_8), .C((A[8] & B[8])), .YS(S_8_8), .YC(C_8_8));
  PDKGENFAX1 U2194 (.A(S_7_10), .B(C_7_9), .C((A[8] & B[9])), .YS(S_8_9), .YC(C_8_9));
  PDKGENFAX1 U2195 (.A(S_7_11), .B(C_7_10), .C((A[8] & B[10])), .YS(S_8_10), .YC(C_8_10));
  PDKGENHAX1 U2196 (.A(C_7_11), .B(~(A[8] & B[11])), .YS(S_8_11), .YC(C_8_11));
  assign S_9_0 = S_8_1;
  assign S_9_1 = S_8_2;
  assign S_9_2 = S_8_3;
  PDKGENFAX1 U2200 (.A(S_8_4), .B(C_8_3), .C((A[9] & B[3])), .YS(S_9_3), .YC(C_9_3));
  PDKGENFAX1 U2201 (.A(S_8_5), .B(C_8_4), .C((A[9] & B[4])), .YS(S_9_4), .YC(C_9_4));
  PDKGENFAX1 U2202 (.A(S_8_6), .B(C_8_5), .C((A[9] & B[5])), .YS(S_9_5), .YC(C_9_5));
  PDKGENFAX1 U2203 (.A(S_8_7), .B(C_8_6), .C((A[9] & B[6])), .YS(S_9_6), .YC(C_9_6));
  PDKGENFAX1 U2204 (.A(S_8_8), .B(C_8_7), .C((A[9] & B[7])), .YS(S_9_7), .YC(C_9_7));
  PDKGENFAX1 U2205 (.A(S_8_9), .B(C_8_8), .C((A[9] & B[8])), .YS(S_9_8), .YC(C_9_8));
  PDKGENFAX1 U2206 (.A(S_8_10), .B(C_8_9), .C((A[9] & B[9])), .YS(S_9_9), .YC(C_9_9));
  PDKGENFAX1 U2207 (.A(S_8_11), .B(C_8_10), .C((A[9] & B[10])), .YS(S_9_10), .YC(C_9_10));
  PDKGENHAX1 U2208 (.A(C_8_11), .B(~(A[9] & B[11])), .YS(S_9_11), .YC(C_9_11));
  assign S_10_0 = S_9_1;
  assign S_10_1 = S_9_2;
  assign S_10_2 = S_9_3;
  PDKGENFAX1 U2212 (.A(S_9_4), .B(C_9_3), .C((A[10] & B[3])), .YS(S_10_3), .YC(C_10_3));
  PDKGENFAX1 U2213 (.A(S_9_5), .B(C_9_4), .C((A[10] & B[4])), .YS(S_10_4), .YC(C_10_4));
  PDKGENFAX1 U2214 (.A(S_9_6), .B(C_9_5), .C((A[10] & B[5])), .YS(S_10_5), .YC(C_10_5));
  PDKGENFAX1 U2215 (.A(S_9_7), .B(C_9_6), .C((A[10] & B[6])), .YS(S_10_6), .YC(C_10_6));
  PDKGENFAX1 U2216 (.A(S_9_8), .B(C_9_7), .C((A[10] & B[7])), .YS(S_10_7), .YC(C_10_7));
  PDKGENFAX1 U2217 (.A(S_9_9), .B(C_9_8), .C((A[10] & B[8])), .YS(S_10_8), .YC(C_10_8));
  PDKGENFAX1 U2218 (.A(S_9_10), .B(C_9_9), .C((A[10] & B[9])), .YS(S_10_9), .YC(C_10_9));
  PDKGENFAX1 U2219 (.A(S_9_11), .B(C_9_10), .C((A[10] & B[10])), .YS(S_10_10), .YC(C_10_10));
  PDKGENHAX1 U2220 (.A(C_9_11), .B(~(A[10] & B[11])), .YS(S_10_11), .YC(C_10_11));
  assign S_11_0 = S_10_1;
  assign S_11_1 = S_10_2;
  assign S_11_2 = S_10_3;
  PDKGENFAX1 U2224 (.A(S_10_4), .B(C_10_3), .C(~(A[11] & B[3])), .YS(S_11_3), .YC(C_11_3));
  PDKGENFAX1 U2225 (.A(S_10_5), .B(C_10_4), .C(~(A[11] & B[4])), .YS(S_11_4), .YC(C_11_4));
  PDKGENFAX1 U2226 (.A(S_10_6), .B(C_10_5), .C(~(A[11] & B[5])), .YS(S_11_5), .YC(C_11_5));
  PDKGENFAX1 U2227 (.A(S_10_7), .B(C_10_6), .C(~(A[11] & B[6])), .YS(S_11_6), .YC(C_11_6));
  PDKGENFAX1 U2228 (.A(S_10_8), .B(C_10_7), .C(~(A[11] & B[7])), .YS(S_11_7), .YC(C_11_7));
  PDKGENFAX1 U2229 (.A(S_10_9), .B(C_10_8), .C(~(A[11] & B[8])), .YS(S_11_8), .YC(C_11_8));
  PDKGENFAX1 U2230 (.A(S_10_10), .B(C_10_9), .C(~(A[11] & B[9])), .YS(S_11_9), .YC(C_11_9));
  PDKGENFAX1 U2231 (.A(S_10_11), .B(C_10_10), .C(~(A[11] & B[10])), .YS(S_11_10), .YC(C_11_10));
  PDKGENHAX1 U2232 (.A(C_10_11), .B((A[11] & B[11])), .YS(S_11_11), .YC(C_11_11));
  assign S_12_0 = S_11_1;
  assign S_12_1 = S_11_2;
  assign S_12_2 = S_11_3;
  PDKGENHAX1 U2236 (.A(S_11_4), .B(C_11_3), .YS(S_12_3), .YC(C_12_3));
  PDKGENFAX1 U2237 (.A(S_11_5), .B(C_12_3), .C(C_11_4), .YS(S_12_4), .YC(C_12_4));
  PDKGENFAX1 U2238 (.A(S_11_6), .B(C_12_4), .C(C_11_5), .YS(S_12_5), .YC(C_12_5));
  PDKGENFAX1 U2239 (.A(S_11_7), .B(C_12_5), .C(C_11_6), .YS(S_12_6), .YC(C_12_6));
  PDKGENFAX1 U2240 (.A(S_11_8), .B(C_12_6), .C(C_11_7), .YS(S_12_7), .YC(C_12_7));
  PDKGENFAX1 U2241 (.A(S_11_9), .B(C_12_7), .C(C_11_8), .YS(S_12_8), .YC(C_12_8));
  PDKGENFAX1 U2242 (.A(S_11_10), .B(C_12_8), .C(C_11_9), .YS(S_12_9), .YC(C_12_9));
  PDKGENFAX1 U2243 (.A(S_11_11), .B(C_12_9), .C(C_11_10), .YS(S_12_10), .YC(C_12_10));
  PDKGENFAX1 U2244 (.A(1'b1), .B(C_12_10), .C(C_11_11), .YS(S_12_11), .YC(C_12_11));
  assign O = {S_12_11,S_12_10,S_12_9,S_12_8,S_12_7,S_12_6,S_12_5,S_12_4,S_12_3,S_12_2,S_12_1,S_12_0,S_11_0,S_10_0,S_9_0,S_8_0,S_7_0,S_6_0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

endmodule

/* mod */
module PDKGENHAX1( input A, input B, output YS, output YC );
    assign YS = A ^ B;
    assign YC = A & B;
endmodule
/* mod */
module PDKGENFAX1( input A, input B, input C, output YS, output YC );
    assign YS = (A ^ B) ^ C;
    assign YC = (A & B) | (B & C) | (A & C);
endmodule
