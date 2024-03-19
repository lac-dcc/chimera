/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, R. Hrbacek, Z. Vasicek and L. Sekanina, "EvoApprox8b: Library of approximate adders and multipliers for circuit design and benchmarking of approximation methods". Design, Automation & Test in Europe Conference & Exhibition (DATE), 2017, Lausanne, 2017, pp. 258-261. doi: 10.23919/DATE.2017.7926993 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and mse parameters
***/
// MAE% = 0.45 %
// MAE = 2.3 
// WCE% = 1.37 %
// WCE = 7.0 
// WCRE% = 300.00 %
// EP% = 87.50 %
// MRE% = 1.23 %
// MSE = 8.0 
// PDK45_PWR = 0.019 mW
// PDK45_AREA = 43.6 um2
// PDK45_DELAY = 0.39 ns


module add8u_5EZ(A, B, O);
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
  HAX1 n32(.A(N[28]), .B(N[12]), .YS(N[32]), .YC(N[33]));
  OR2X1 n36(.A(N[24]), .B(N[8]), .Y(N[36]));
  XNOR2X1 n42(.A(N[2]), .B(N[2]), .Y(N[42]));
  assign N[43] = N[42];
  HAX1 n62(.A(N[6]), .B(N[22]), .YS(N[62]), .YC(N[63]));
  HAX1 n72(.A(N[8]), .B(N[24]), .YS(N[72]), .YC(N[73]));
  HAX1 n82(.A(N[10]), .B(N[26]), .YS(N[82]), .YC(N[83]));
  HAX1 n92(.A(N[12]), .B(N[28]), .YS(N[92]), .YC(N[93]));
  BUFX2 n94(.A(N[83]), .Y(N[94]));
  HAX1 n102(.A(N[14]), .B(N[30]), .YS(N[102]), .YC(N[103]));
  AND2X1 n142(.A(N[36]), .B(N[63]), .Y(N[142]));
  assign N[143] = N[142];
  OR2X1 n162(.A(N[73]), .B(N[143]), .Y(N[162]));
  assign N[163] = N[162];
  BUFX2 n168(.A(N[82]), .Y(N[168]));
  assign N[169] = N[168];
  AND2X1 n172(.A(N[32]), .B(N[94]), .Y(N[172]));
  assign N[173] = N[172];
  AND2X1 n182(.A(N[32]), .B(N[169]), .Y(N[182]));
  OR2X1 n192(.A(N[93]), .B(N[173]), .Y(N[192]));
  assign N[193] = N[192];
  AND2X1 n222(.A(N[182]), .B(N[163]), .Y(N[222]));
  assign N[223] = N[222];
  BUFX2 n230(.A(N[162]), .Y(N[230]));
  OR2X1 n242(.A(N[193]), .B(N[223]), .Y(N[242]));
  BUFX2 n262(.A(N[230]), .Y(N[262]));
  assign N[263] = N[262];
  BUFX2 n322(.A(N[63]), .Y(N[322]));
  AND2X1 n332(.A(N[168]), .B(N[263]), .Y(N[332]));
  OR2X1 n342(.A(N[94]), .B(N[332]), .Y(N[342]));
  HAX1 n382(.A(N[72]), .B(N[322]), .YS(N[382]), .YC(N[383]));
  HAX1 n392(.A(N[168]), .B(N[263]), .YS(N[392]), .YC(N[393]));
  HAX1 n402(.A(N[92]), .B(N[342]), .YS(N[402]), .YC(N[403]));
  HAX1 n412(.A(N[102]), .B(N[242]), .YS(N[412]), .YC(N[413]));
  OR2X1 n422(.A(N[103]), .B(N[413]), .Y(N[422]));
  assign O[0] = N[20];
  assign O[1] = N[4];
  assign O[2] = N[43];
  assign O[3] = N[62];
  assign O[4] = N[382];
  assign O[5] = N[392];
  assign O[6] = N[402];
  assign O[7] = N[412];
  assign O[8] = N[422];
endmodule


