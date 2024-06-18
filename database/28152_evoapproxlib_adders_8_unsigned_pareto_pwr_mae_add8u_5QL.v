// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, R. Hrbacek, Z. Vasicek and L. Sekanina, "EvoApprox8b: Library of approximate adders and multipliers for circuit design and benchmarking of approximation methods". Design, Automation & Test in Europe Conference & Exhibition (DATE), 2017, Lausanne, 2017, pp. 258-261. doi: 10.23919/DATE.2017.7926993 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mae parameters
***/
// MAE% = 0.16 %
// MAE = 0.8 
// WCE% = 0.59 %
// WCE = 3.0 
// WCRE% = 50.00 %
// EP% = 43.75 %
// MRE% = 0.40 %
// MSE = 1.5 
// PDK45_PWR = 0.024 mW
// PDK45_AREA = 57.3 um2
// PDK45_DELAY = 0.47 ns


module add8u_5QL(A, B, O);
  input [7:0] A;
  input [7:0] B;
  output [8:0] O;
  wire [2031:0] N;
  assign N[0] = A[0];
  assign N[1] = A[0];
  assign N[2] = A[1];
  assign N[3] = A[1];
  assign N[4] = A[2];
  assign N[5] = A[2];
  assign N[6] = A[3];
  assign N[7] = A[3];
  assign N[8] = A[4];
  assign N[9] = A[4];
  assign N[10] = A[5];
  assign N[11] = A[5];
  assign N[12] = A[6];
  assign N[13] = A[6];
  assign N[14] = A[7];
  assign N[15] = A[7];
  assign N[16] = B[0];
  assign N[17] = B[0];
  assign N[18] = B[1];
  assign N[19] = B[1];
  assign N[20] = B[2];
  assign N[21] = B[2];
  assign N[22] = B[3];
  assign N[23] = B[3];
  assign N[24] = B[4];
  assign N[25] = B[4];
  assign N[26] = B[5];
  assign N[27] = B[5];
  assign N[28] = B[6];
  assign N[29] = B[6];
  assign N[30] = B[7];
  assign N[31] = B[7];
  PDKGENOR2X1 n32(.A(N[12]), .B(N[28]), .Y(N[32]));
  assign N[33] = N[32];
  PDKGENOR2X1 n34(.A(N[0]), .B(N[16]), .Y(N[34]));
  assign N[35] = N[34];
  PDKGENNAND2X1 n36(.A(N[4]), .B(N[20]), .Y(N[36]));
  assign N[37] = N[36];
  PDKGENINVX1 n38(.A(N[37]), .Y(N[38]));
  PDKGENBUFX2 n42(.A(N[38]), .Y(N[42]));
  assign N[43] = N[42];
  PDKGENNOR2X1 n46(.A(N[18]), .B(N[2]), .Y(N[46]));
  PDKGENHAX1 n50(.A(N[4]), .B(N[20]), .YS(N[50]), .YC(N[51]));
  PDKGENBUFX2 n56(.A(N[43]), .Y(N[56]));
  PDKGENFAX1 n58(.A(N[6]), .B(N[22]), .C(N[56]), .YS(N[58]), .YC(N[59]));
  PDKGENHAX1 n68(.A(N[8]), .B(N[24]), .YS(N[68]), .YC(N[69]));
  PDKGENBUFX2 n76(.A(N[68]), .Y(N[76]));
  assign N[77] = N[76];
  PDKGENHAX1 n78(.A(N[10]), .B(N[26]), .YS(N[78]), .YC(N[79]));
  PDKGENBUFX2 n84(.A(N[59]), .Y(N[84]));
  PDKGENHAX1 n86(.A(N[12]), .B(N[28]), .YS(N[86]), .YC(N[87]));
  PDKGENBUFX2 n92(.A(N[78]), .Y(N[92]));
  PDKGENHAX1 n96(.A(N[14]), .B(N[30]), .YS(N[96]), .YC(N[97]));
  PDKGENINVX1 n110(.A(N[46]), .Y(N[110]));
  PDKGENBUFX2 n122(.A(N[77]), .Y(N[122]));
  PDKGENBUFX2 n126(.A(N[69]), .Y(N[126]));
  assign N[127] = N[126];
  PDKGENAND2X1 n134(.A(N[77]), .B(N[84]), .Y(N[134]));
  PDKGENOR2X1 n152(.A(N[127]), .B(N[134]), .Y(N[152]));
  PDKGENAND2X1 n162(.A(N[33]), .B(N[79]), .Y(N[162]));
  PDKGENAND2X1 n170(.A(N[86]), .B(N[78]), .Y(N[170]));
  assign N[171] = N[170];
  PDKGENOR2X1 n180(.A(N[87]), .B(N[162]), .Y(N[180]));
  PDKGENBUFX2 n198(.A(N[152]), .Y(N[198]));
  assign N[199] = N[198];
  PDKGENAND2X1 n226(.A(N[92]), .B(N[199]), .Y(N[226]));
  PDKGENINVX1 n240(.A(N[84]), .Y(N[240]));
  PDKGENOR2X1 n244(.A(N[79]), .B(N[226]), .Y(N[244]));
  PDKGENAND2X1 n254(.A(N[171]), .B(N[198]), .Y(N[254]));
  PDKGENOR2X1 n272(.A(N[180]), .B(N[254]), .Y(N[272]));
  PDKGENXNOR2X1 n390(.A(N[240]), .B(N[122]), .Y(N[390]));
  assign N[391] = N[390];
  PDKGENHAX1 n394(.A(N[78]), .B(N[198]), .YS(N[394]), .YC(N[395]));
  PDKGENXOR2X1 n404(.A(N[86]), .B(N[244]), .Y(N[404]));
  PDKGENHAX1 n412(.A(N[96]), .B(N[272]), .YS(N[412]), .YC(N[413]));
  PDKGENOR2X1 n422(.A(N[97]), .B(N[413]), .Y(N[422]));
  assign N[423] = N[422];
  assign O[0] = N[35];
  assign O[1] = N[110];
  assign O[2] = N[50];
  assign O[3] = N[58];
  assign O[4] = N[391];
  assign O[5] = N[394];
  assign O[6] = N[404];
  assign O[7] = N[412];
  assign O[8] = N[423];
endmodule


/* mod */
module PDKGENAND2X1(input A, input B, output Y );
     assign Y = A & B;
endmodule
/* mod */
module PDKGENOR2X1(input A, input B, output Y );
     assign Y = A | B;
endmodule
/* mod */
module PDKGENHAX1( input A, input B, output YS, output YC );
    assign YS = A ^ B;
    assign YC = A & B;
endmodule
/* mod */
module PDKGENINVX1(input A, output Y );
     assign Y = ~A;
endmodule
/* mod */
module PDKGENXOR2X1(input A, input B, output Y );
     assign Y = A ^ B;
endmodule
/* mod */
module PDKGENNOR2X1(input A, input B, output Y );
     assign Y = ~(A | B);
endmodule
/* mod */
module PDKGENFAX1( input A, input B, input C, output YS, output YC );
    assign YS = (A ^ B) ^ C;
    assign YC = (A & B) | (B & C) | (A & C);
endmodule
/* mod */
module PDKGENBUFX2(input A, output Y );
     assign Y = A;
endmodule
/* mod */
module PDKGENXNOR2X1(input A, input B, output Y );
     assign Y = ~(A ^ B);
endmodule
/* mod */
module PDKGENNAND2X1(input A, input B, output Y );
     assign Y = ~(A & B);
endmodule
