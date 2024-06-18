// This program was cloned from: https://github.com/ehw-fit/evoapproxlib
// License: MIT License

/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, R. Hrbacek, Z. Vasicek and L. Sekanina, "EvoApprox8b: Library of approximate adders and multipliers for circuit design and benchmarking of approximation methods". Design, Automation & Test in Europe Conference & Exhibition (DATE), 2017, Lausanne, 2017, pp. 258-261. doi: 10.23919/DATE.2017.7926993 
* This file contains a circuit from a sub-set of pareto optimal circuits with respect to the pwr and ep parameters
***/
// MAE% = 0.00 %
// MAE = 0 
// WCE% = 0.00 %
// WCE = 0 
// WCRE% = 0.00 %
// EP% = 0.00 %
// MRE% = 0.00 %
// MSE = 0 
// PDK45_PWR = 0.391 mW
// PDK45_AREA = 709.6 um2
// PDK45_DELAY = 1.43 ns



module mul8u_1JFF(A, B, O);
  input [7:0] A;
  input [7:0] B;
  output [15:0] O;
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

  PDKGENAND2X1 n32(.A(N[0]), .B(N[16]), .Y(N[32]));
  PDKGENAND2X1 n48(.A(N[2]), .B(N[16]), .Y(N[48]));
  PDKGENAND2X1 n64(.A(N[4]), .B(N[16]), .Y(N[64]));
  PDKGENAND2X1 n82(.A(N[6]), .B(N[16]), .Y(N[82]));
  PDKGENAND2X1 n98(.A(N[8]), .B(N[16]), .Y(N[98]));
  PDKGENAND2X1 n114(.A(N[10]), .B(N[16]), .Y(N[114]));
  PDKGENAND2X1 n132(.A(N[12]), .B(N[16]), .Y(N[132]));
  PDKGENAND2X1 n148(.A(N[14]), .B(N[16]), .Y(N[148]));
  PDKGENAND2X1 n164(.A(N[0]), .B(N[18]), .Y(N[164]));
  PDKGENAND2X1 n182(.A(N[2]), .B(N[18]), .Y(N[182]));
  PDKGENAND2X1 n198(.A(N[4]), .B(N[18]), .Y(N[198]));
  PDKGENAND2X1 n214(.A(N[6]), .B(N[18]), .Y(N[214]));
  PDKGENAND2X1 n232(.A(N[8]), .B(N[18]), .Y(N[232]));
  PDKGENAND2X1 n248(.A(N[10]), .B(N[18]), .Y(N[248]));
  PDKGENAND2X1 n264(.A(N[12]), .B(N[18]), .Y(N[264]));
  PDKGENAND2X1 n282(.A(N[14]), .B(N[18]), .Y(N[282]));
  PDKGENHAX1 n298(.A(N[48]), .B(N[164]), .YS(N[298]), .YC(N[299]));
  PDKGENHAX1 n314(.A(N[64]), .B(N[182]), .YS(N[314]), .YC(N[315]));
  PDKGENHAX1 n332(.A(N[82]), .B(N[198]), .YS(N[332]), .YC(N[333]));
  PDKGENHAX1 n348(.A(N[98]), .B(N[214]), .YS(N[348]), .YC(N[349]));
  PDKGENHAX1 n364(.A(N[114]), .B(N[232]), .YS(N[364]), .YC(N[365]));
  PDKGENHAX1 n382(.A(N[132]), .B(N[248]), .YS(N[382]), .YC(N[383]));
  PDKGENHAX1 n398(.A(N[148]), .B(N[264]), .YS(N[398]), .YC(N[399]));
  PDKGENAND2X1 n414(.A(N[0]), .B(N[20]), .Y(N[414]));
  PDKGENAND2X1 n432(.A(N[2]), .B(N[20]), .Y(N[432]));
  PDKGENAND2X1 n448(.A(N[4]), .B(N[20]), .Y(N[448]));
  PDKGENAND2X1 n464(.A(N[6]), .B(N[20]), .Y(N[464]));
  PDKGENAND2X1 n482(.A(N[8]), .B(N[20]), .Y(N[482]));
  PDKGENAND2X1 n498(.A(N[10]), .B(N[20]), .Y(N[498]));
  PDKGENAND2X1 n514(.A(N[12]), .B(N[20]), .Y(N[514]));
  PDKGENAND2X1 n532(.A(N[14]), .B(N[20]), .Y(N[532]));
  PDKGENFAX1 n548(.A(N[314]), .B(N[414]), .C(N[299]), .YS(N[548]), .YC(N[549]));
  PDKGENFAX1 n564(.A(N[332]), .B(N[432]), .C(N[315]), .YS(N[564]), .YC(N[565]));
  PDKGENFAX1 n582(.A(N[348]), .B(N[448]), .C(N[333]), .YS(N[582]), .YC(N[583]));
  PDKGENFAX1 n598(.A(N[364]), .B(N[464]), .C(N[349]), .YS(N[598]), .YC(N[599]));
  PDKGENFAX1 n614(.A(N[382]), .B(N[482]), .C(N[365]), .YS(N[614]), .YC(N[615]));
  PDKGENFAX1 n632(.A(N[398]), .B(N[498]), .C(N[383]), .YS(N[632]), .YC(N[633]));
  PDKGENFAX1 n648(.A(N[282]), .B(N[514]), .C(N[399]), .YS(N[648]), .YC(N[649]));
  PDKGENAND2X1 n664(.A(N[0]), .B(N[22]), .Y(N[664]));
  PDKGENAND2X1 n682(.A(N[2]), .B(N[22]), .Y(N[682]));
  PDKGENAND2X1 n698(.A(N[4]), .B(N[22]), .Y(N[698]));
  PDKGENAND2X1 n714(.A(N[6]), .B(N[22]), .Y(N[714]));
  PDKGENAND2X1 n732(.A(N[8]), .B(N[22]), .Y(N[732]));
  PDKGENAND2X1 n748(.A(N[10]), .B(N[22]), .Y(N[748]));
  PDKGENAND2X1 n764(.A(N[12]), .B(N[22]), .Y(N[764]));
  PDKGENAND2X1 n782(.A(N[14]), .B(N[22]), .Y(N[782]));
  PDKGENFAX1 n798(.A(N[564]), .B(N[664]), .C(N[549]), .YS(N[798]), .YC(N[799]));
  PDKGENFAX1 n814(.A(N[582]), .B(N[682]), .C(N[565]), .YS(N[814]), .YC(N[815]));
  PDKGENFAX1 n832(.A(N[598]), .B(N[698]), .C(N[583]), .YS(N[832]), .YC(N[833]));
  PDKGENFAX1 n848(.A(N[614]), .B(N[714]), .C(N[599]), .YS(N[848]), .YC(N[849]));
  PDKGENFAX1 n864(.A(N[632]), .B(N[732]), .C(N[615]), .YS(N[864]), .YC(N[865]));
  PDKGENFAX1 n882(.A(N[648]), .B(N[748]), .C(N[633]), .YS(N[882]), .YC(N[883]));
  PDKGENFAX1 n898(.A(N[532]), .B(N[764]), .C(N[649]), .YS(N[898]), .YC(N[899]));
  PDKGENAND2X1 n914(.A(N[0]), .B(N[24]), .Y(N[914]));
  PDKGENAND2X1 n932(.A(N[2]), .B(N[24]), .Y(N[932]));
  PDKGENAND2X1 n948(.A(N[4]), .B(N[24]), .Y(N[948]));
  PDKGENAND2X1 n964(.A(N[6]), .B(N[24]), .Y(N[964]));
  PDKGENAND2X1 n982(.A(N[8]), .B(N[24]), .Y(N[982]));
  PDKGENAND2X1 n998(.A(N[10]), .B(N[24]), .Y(N[998]));
  PDKGENAND2X1 n1014(.A(N[12]), .B(N[24]), .Y(N[1014]));
  PDKGENAND2X1 n1032(.A(N[14]), .B(N[24]), .Y(N[1032]));
  PDKGENFAX1 n1048(.A(N[814]), .B(N[914]), .C(N[799]), .YS(N[1048]), .YC(N[1049]));
  PDKGENFAX1 n1064(.A(N[832]), .B(N[932]), .C(N[815]), .YS(N[1064]), .YC(N[1065]));
  PDKGENFAX1 n1082(.A(N[848]), .B(N[948]), .C(N[833]), .YS(N[1082]), .YC(N[1083]));
  PDKGENFAX1 n1098(.A(N[864]), .B(N[964]), .C(N[849]), .YS(N[1098]), .YC(N[1099]));
  PDKGENFAX1 n1114(.A(N[882]), .B(N[982]), .C(N[865]), .YS(N[1114]), .YC(N[1115]));
  PDKGENFAX1 n1132(.A(N[898]), .B(N[998]), .C(N[883]), .YS(N[1132]), .YC(N[1133]));
  PDKGENFAX1 n1148(.A(N[782]), .B(N[1014]), .C(N[899]), .YS(N[1148]), .YC(N[1149]));
  PDKGENAND2X1 n1164(.A(N[0]), .B(N[26]), .Y(N[1164]));
  PDKGENAND2X1 n1182(.A(N[2]), .B(N[26]), .Y(N[1182]));
  PDKGENAND2X1 n1198(.A(N[4]), .B(N[26]), .Y(N[1198]));
  PDKGENAND2X1 n1214(.A(N[6]), .B(N[26]), .Y(N[1214]));
  PDKGENAND2X1 n1232(.A(N[8]), .B(N[26]), .Y(N[1232]));
  PDKGENAND2X1 n1248(.A(N[10]), .B(N[26]), .Y(N[1248]));
  PDKGENAND2X1 n1264(.A(N[12]), .B(N[26]), .Y(N[1264]));
  PDKGENAND2X1 n1282(.A(N[14]), .B(N[26]), .Y(N[1282]));
  PDKGENFAX1 n1298(.A(N[1064]), .B(N[1164]), .C(N[1049]), .YS(N[1298]), .YC(N[1299]));
  PDKGENFAX1 n1314(.A(N[1082]), .B(N[1182]), .C(N[1065]), .YS(N[1314]), .YC(N[1315]));
  PDKGENFAX1 n1332(.A(N[1098]), .B(N[1198]), .C(N[1083]), .YS(N[1332]), .YC(N[1333]));
  PDKGENFAX1 n1348(.A(N[1114]), .B(N[1214]), .C(N[1099]), .YS(N[1348]), .YC(N[1349]));
  PDKGENFAX1 n1364(.A(N[1132]), .B(N[1232]), .C(N[1115]), .YS(N[1364]), .YC(N[1365]));
  PDKGENFAX1 n1382(.A(N[1148]), .B(N[1248]), .C(N[1133]), .YS(N[1382]), .YC(N[1383]));
  PDKGENFAX1 n1398(.A(N[1032]), .B(N[1264]), .C(N[1149]), .YS(N[1398]), .YC(N[1399]));
  PDKGENAND2X1 n1414(.A(N[0]), .B(N[28]), .Y(N[1414]));
  PDKGENAND2X1 n1432(.A(N[2]), .B(N[28]), .Y(N[1432]));
  PDKGENAND2X1 n1448(.A(N[4]), .B(N[28]), .Y(N[1448]));
  PDKGENAND2X1 n1464(.A(N[6]), .B(N[28]), .Y(N[1464]));
  PDKGENAND2X1 n1482(.A(N[8]), .B(N[28]), .Y(N[1482]));
  PDKGENAND2X1 n1498(.A(N[10]), .B(N[28]), .Y(N[1498]));
  PDKGENAND2X1 n1514(.A(N[12]), .B(N[28]), .Y(N[1514]));
  PDKGENAND2X1 n1532(.A(N[14]), .B(N[28]), .Y(N[1532]));
  assign N[1533] = N[1532];
  PDKGENFAX1 n1548(.A(N[1314]), .B(N[1414]), .C(N[1299]), .YS(N[1548]), .YC(N[1549]));
  PDKGENFAX1 n1564(.A(N[1332]), .B(N[1432]), .C(N[1315]), .YS(N[1564]), .YC(N[1565]));
  PDKGENFAX1 n1582(.A(N[1348]), .B(N[1448]), .C(N[1333]), .YS(N[1582]), .YC(N[1583]));
  PDKGENFAX1 n1598(.A(N[1364]), .B(N[1464]), .C(N[1349]), .YS(N[1598]), .YC(N[1599]));
  PDKGENFAX1 n1614(.A(N[1382]), .B(N[1482]), .C(N[1365]), .YS(N[1614]), .YC(N[1615]));
  PDKGENFAX1 n1632(.A(N[1398]), .B(N[1498]), .C(N[1383]), .YS(N[1632]), .YC(N[1633]));
  PDKGENFAX1 n1648(.A(N[1282]), .B(N[1514]), .C(N[1399]), .YS(N[1648]), .YC(N[1649]));
  PDKGENAND2X1 n1664(.A(N[0]), .B(N[30]), .Y(N[1664]));
  PDKGENAND2X1 n1682(.A(N[2]), .B(N[30]), .Y(N[1682]));
  PDKGENAND2X1 n1698(.A(N[4]), .B(N[30]), .Y(N[1698]));
  PDKGENAND2X1 n1714(.A(N[6]), .B(N[30]), .Y(N[1714]));
  PDKGENAND2X1 n1732(.A(N[8]), .B(N[30]), .Y(N[1732]));
  PDKGENAND2X1 n1748(.A(N[10]), .B(N[30]), .Y(N[1748]));
  PDKGENAND2X1 n1764(.A(N[12]), .B(N[30]), .Y(N[1764]));
  PDKGENAND2X1 n1782(.A(N[14]), .B(N[30]), .Y(N[1782]));
  PDKGENFAX1 n1798(.A(N[1564]), .B(N[1664]), .C(N[1549]), .YS(N[1798]), .YC(N[1799]));
  PDKGENFAX1 n1814(.A(N[1582]), .B(N[1682]), .C(N[1565]), .YS(N[1814]), .YC(N[1815]));
  PDKGENFAX1 n1832(.A(N[1598]), .B(N[1698]), .C(N[1583]), .YS(N[1832]), .YC(N[1833]));
  PDKGENFAX1 n1848(.A(N[1614]), .B(N[1714]), .C(N[1599]), .YS(N[1848]), .YC(N[1849]));
  PDKGENFAX1 n1864(.A(N[1632]), .B(N[1732]), .C(N[1615]), .YS(N[1864]), .YC(N[1865]));
  PDKGENFAX1 n1882(.A(N[1648]), .B(N[1748]), .C(N[1633]), .YS(N[1882]), .YC(N[1883]));
  PDKGENFAX1 n1898(.A(N[1533]), .B(N[1764]), .C(N[1649]), .YS(N[1898]), .YC(N[1899]));
  PDKGENHAX1 n1914(.A(N[1814]), .B(N[1799]), .YS(N[1914]), .YC(N[1915]));
  PDKGENFAX1 n1932(.A(N[1832]), .B(N[1815]), .C(N[1915]), .YS(N[1932]), .YC(N[1933]));
  PDKGENFAX1 n1948(.A(N[1848]), .B(N[1833]), .C(N[1933]), .YS(N[1948]), .YC(N[1949]));
  PDKGENFAX1 n1964(.A(N[1864]), .B(N[1849]), .C(N[1949]), .YS(N[1964]), .YC(N[1965]));
  PDKGENFAX1 n1982(.A(N[1882]), .B(N[1865]), .C(N[1965]), .YS(N[1982]), .YC(N[1983]));
  PDKGENFAX1 n1998(.A(N[1898]), .B(N[1883]), .C(N[1983]), .YS(N[1998]), .YC(N[1999]));
  PDKGENFAX1 n2014(.A(N[1782]), .B(N[1899]), .C(N[1999]), .YS(N[2014]), .YC(N[2015]));

  assign O[0] = N[32];
  assign O[1] = N[298];
  assign O[2] = N[548];
  assign O[3] = N[798];
  assign O[4] = N[1048];
  assign O[5] = N[1298];
  assign O[6] = N[1548];
  assign O[7] = N[1798];
  assign O[8] = N[1914];
  assign O[9] = N[1932];
  assign O[10] = N[1948];
  assign O[11] = N[1964];
  assign O[12] = N[1982];
  assign O[13] = N[1998];
  assign O[14] = N[2014];
  assign O[15] = N[2015];

endmodule


/* mod */
module PDKGENHAX1( input A, input B, output YS, output YC );
    assign YS = A ^ B;
    assign YC = A & B;
endmodule
/* mod */
module PDKGENAND2X1(input A, input B, output Y );
     assign Y = A & B;
endmodule
/* mod */
module PDKGENFAX1( input A, input B, input C, output YS, output YC );
    assign YS = (A ^ B) ^ C;
    assign YC = (A & B) | (B & C) | (A & C);
endmodule
