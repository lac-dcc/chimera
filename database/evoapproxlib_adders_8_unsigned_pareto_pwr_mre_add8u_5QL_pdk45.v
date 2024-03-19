/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, R. Hrbacek, Z. Vasicek and L. Sekanina, "EvoApprox8b: Library of approximate adders and multipliers for circuit design and benchmarking of approximation methods". Design, Automation & Test in Europe Conference & Exhibition (DATE), 2017, Lausanne, 2017, pp. 258-261. doi: 10.23919/DATE.2017.7926993 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mre parameters
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
  OR2X1 n32(.A(N[12]), .B(N[28]), .Y(N[32]));
  assign N[33] = N[32];
  OR2X1 n34(.A(N[0]), .B(N[16]), .Y(N[34]));
  assign N[35] = N[34];
  NAND2X1 n36(.A(N[4]), .B(N[20]), .Y(N[36]));
  assign N[37] = N[36];
  INVX1 n38(.A(N[37]), .Y(N[38]));
  BUFX2 n42(.A(N[38]), .Y(N[42]));
  assign N[43] = N[42];
  NOR2X1 n46(.A(N[18]), .B(N[2]), .Y(N[46]));
  HAX1 n50(.A(N[4]), .B(N[20]), .YS(N[50]), .YC(N[51]));
  BUFX2 n56(.A(N[43]), .Y(N[56]));
  FAX1 n58(.A(N[6]), .B(N[22]), .C(N[56]), .YS(N[58]), .YC(N[59]));
  HAX1 n68(.A(N[8]), .B(N[24]), .YS(N[68]), .YC(N[69]));
  BUFX2 n76(.A(N[68]), .Y(N[76]));
  assign N[77] = N[76];
  HAX1 n78(.A(N[10]), .B(N[26]), .YS(N[78]), .YC(N[79]));
  BUFX2 n84(.A(N[59]), .Y(N[84]));
  HAX1 n86(.A(N[12]), .B(N[28]), .YS(N[86]), .YC(N[87]));
  BUFX2 n92(.A(N[78]), .Y(N[92]));
  HAX1 n96(.A(N[14]), .B(N[30]), .YS(N[96]), .YC(N[97]));
  INVX1 n110(.A(N[46]), .Y(N[110]));
  BUFX2 n122(.A(N[77]), .Y(N[122]));
  BUFX2 n126(.A(N[69]), .Y(N[126]));
  assign N[127] = N[126];
  AND2X1 n134(.A(N[77]), .B(N[84]), .Y(N[134]));
  OR2X1 n152(.A(N[127]), .B(N[134]), .Y(N[152]));
  AND2X1 n162(.A(N[33]), .B(N[79]), .Y(N[162]));
  AND2X1 n170(.A(N[86]), .B(N[78]), .Y(N[170]));
  assign N[171] = N[170];
  OR2X1 n180(.A(N[87]), .B(N[162]), .Y(N[180]));
  BUFX2 n198(.A(N[152]), .Y(N[198]));
  assign N[199] = N[198];
  AND2X1 n226(.A(N[92]), .B(N[199]), .Y(N[226]));
  INVX1 n240(.A(N[84]), .Y(N[240]));
  OR2X1 n244(.A(N[79]), .B(N[226]), .Y(N[244]));
  AND2X1 n254(.A(N[171]), .B(N[198]), .Y(N[254]));
  OR2X1 n272(.A(N[180]), .B(N[254]), .Y(N[272]));
  XNOR2X1 n390(.A(N[240]), .B(N[122]), .Y(N[390]));
  assign N[391] = N[390];
  HAX1 n394(.A(N[78]), .B(N[198]), .YS(N[394]), .YC(N[395]));
  XOR2X1 n404(.A(N[86]), .B(N[244]), .Y(N[404]));
  HAX1 n412(.A(N[96]), .B(N[272]), .YS(N[412]), .YC(N[413]));
  OR2X1 n422(.A(N[97]), .B(N[413]), .Y(N[422]));
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


