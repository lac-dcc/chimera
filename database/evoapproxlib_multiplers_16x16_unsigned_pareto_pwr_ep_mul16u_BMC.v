/***
* This code is a part of EvoApproxLib library (ehw.fit.vutbr.cz/approxlib) distributed under The MIT License.
* When used, please cite the following article(s): V. Mrazek, Z. Vasicek, L. Sekanina, H. Jiang and J. Han, "Scalable Construction of Approximate Multipliers With Formally Guaranteed Worst Case Error" in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 11, pp. 2572-2576, Nov. 2018. doi: 10.1109/TVLSI.2018.2856362 
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
// PDK45_PWR = 2.202 mW
// PDK45_AREA = 3203.0 um2
// PDK45_DELAY = 3.11 ns



module mul8_364(A, B, O);
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
  assign N[149] = N[148];
  PDKGENAND2X1 n164(.A(N[0]), .B(N[18]), .Y(N[164]));
  PDKGENBUFX2 n166(.A(N[149]), .Y(N[166]));
  assign N[167] = N[166];
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
  PDKGENHAX1 n398(.A(N[167]), .B(N[264]), .YS(N[398]), .YC(N[399]));
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
  PDKGENFAX1 n1898(.A(N[1532]), .B(N[1764]), .C(N[1649]), .YS(N[1898]), .YC(N[1899]));
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


module trun8_tam00b ( A, B, O );
  input [7:0] A;
  input [7:0] B;
  output [15:0] O;

  wire C_1_0,C_1_1,C_1_2,C_1_3,C_1_4,C_1_5,C_1_6,C_2_0,C_2_1,C_2_2,C_2_3,C_2_4,C_2_5,C_2_6,C_3_0,C_3_1,C_3_2,C_3_3,C_3_4,C_3_5,C_3_6,C_4_0,C_4_1,C_4_2,C_4_3,C_4_4,C_4_5,C_4_6,C_5_0,C_5_1,C_5_2,C_5_3,C_5_4,C_5_5,C_5_6,C_6_0,C_6_1,C_6_2,C_6_3,C_6_4,C_6_5,C_6_6,C_7_0,C_7_1,C_7_2,C_7_3,C_7_4,C_7_5,C_7_6,S_0_0,S_0_1,S_0_2,S_0_3,S_0_4,S_0_5,S_0_6,S_0_7,S_1_0,S_1_1,S_1_2,S_1_3,S_1_4,S_1_5,S_1_6,S_1_7,S_2_0,S_2_1,S_2_2,S_2_3,S_2_4,S_2_5,S_2_6,S_2_7,S_3_0,S_3_1,S_3_2,S_3_3,S_3_4,S_3_5,S_3_6,S_3_7,S_4_0,S_4_1,S_4_2,S_4_3,S_4_4,S_4_5,S_4_6,S_4_7,S_5_0,S_5_1,S_5_2,S_5_3,S_5_4,S_5_5,S_5_6,S_5_7,S_6_0,S_6_1,S_6_2,S_6_3,S_6_4,S_6_5,S_6_6,S_6_7,S_7_0,S_7_1,S_7_2,S_7_3,S_7_4,S_7_5,S_7_6,S_7_7,S_8_0,S_8_1,S_8_2,S_8_3,S_8_4,S_8_5,S_8_6,S_8_7;

  assign S_0_0 = (A[0] & B[0]);
  assign S_0_1 = (A[0] & B[1]);
  assign S_0_2 = (A[0] & B[2]);
  assign S_0_3 = (A[0] & B[3]);
  assign S_0_4 = (A[0] & B[4]);
  assign S_0_5 = (A[0] & B[5]);
  assign S_0_6 = (A[0] & B[6]);
  assign S_0_7 = (A[0] & B[7]);
  PDKGENHAX1 U13609 (.A(S_0_1), .B((A[1] & B[0])), .YS(S_1_0), .YC(C_1_0));
  PDKGENHAX1 U13610 (.A(S_0_2), .B((A[1] & B[1])), .YS(S_1_1), .YC(C_1_1));
  PDKGENHAX1 U13611 (.A(S_0_3), .B((A[1] & B[2])), .YS(S_1_2), .YC(C_1_2));
  PDKGENHAX1 U13612 (.A(S_0_4), .B((A[1] & B[3])), .YS(S_1_3), .YC(C_1_3));
  PDKGENHAX1 U13613 (.A(S_0_5), .B((A[1] & B[4])), .YS(S_1_4), .YC(C_1_4));
  PDKGENHAX1 U13614 (.A(S_0_6), .B((A[1] & B[5])), .YS(S_1_5), .YC(C_1_5));
  PDKGENHAX1 U13615 (.A(S_0_7), .B((A[1] & B[6])), .YS(S_1_6), .YC(C_1_6));
  assign S_1_7 = (A[1] & B[7]);
  PDKGENFAX1 U13617 (.A(S_1_1), .B(C_1_0), .C((A[2] & B[0])), .YS(S_2_0), .YC(C_2_0));
  PDKGENFAX1 U13618 (.A(S_1_2), .B(C_1_1), .C((A[2] & B[1])), .YS(S_2_1), .YC(C_2_1));
  PDKGENFAX1 U13619 (.A(S_1_3), .B(C_1_2), .C((A[2] & B[2])), .YS(S_2_2), .YC(C_2_2));
  PDKGENFAX1 U13620 (.A(S_1_4), .B(C_1_3), .C((A[2] & B[3])), .YS(S_2_3), .YC(C_2_3));
  PDKGENFAX1 U13621 (.A(S_1_5), .B(C_1_4), .C((A[2] & B[4])), .YS(S_2_4), .YC(C_2_4));
  PDKGENFAX1 U13622 (.A(S_1_6), .B(C_1_5), .C((A[2] & B[5])), .YS(S_2_5), .YC(C_2_5));
  PDKGENFAX1 U13623 (.A(S_1_7), .B(C_1_6), .C((A[2] & B[6])), .YS(S_2_6), .YC(C_2_6));
  assign S_2_7 = (A[2] & B[7]);
  PDKGENFAX1 U13625 (.A(S_2_1), .B(C_2_0), .C((A[3] & B[0])), .YS(S_3_0), .YC(C_3_0));
  PDKGENFAX1 U13626 (.A(S_2_2), .B(C_2_1), .C((A[3] & B[1])), .YS(S_3_1), .YC(C_3_1));
  PDKGENFAX1 U13627 (.A(S_2_3), .B(C_2_2), .C((A[3] & B[2])), .YS(S_3_2), .YC(C_3_2));
  PDKGENFAX1 U13628 (.A(S_2_4), .B(C_2_3), .C((A[3] & B[3])), .YS(S_3_3), .YC(C_3_3));
  PDKGENFAX1 U13629 (.A(S_2_5), .B(C_2_4), .C((A[3] & B[4])), .YS(S_3_4), .YC(C_3_4));
  PDKGENFAX1 U13630 (.A(S_2_6), .B(C_2_5), .C((A[3] & B[5])), .YS(S_3_5), .YC(C_3_5));
  PDKGENFAX1 U13631 (.A(S_2_7), .B(C_2_6), .C((A[3] & B[6])), .YS(S_3_6), .YC(C_3_6));
  assign S_3_7 = (A[3] & B[7]);
  PDKGENFAX1 U13633 (.A(S_3_1), .B(C_3_0), .C((A[4] & B[0])), .YS(S_4_0), .YC(C_4_0));
  PDKGENFAX1 U13634 (.A(S_3_2), .B(C_3_1), .C((A[4] & B[1])), .YS(S_4_1), .YC(C_4_1));
  PDKGENFAX1 U13635 (.A(S_3_3), .B(C_3_2), .C((A[4] & B[2])), .YS(S_4_2), .YC(C_4_2));
  PDKGENFAX1 U13636 (.A(S_3_4), .B(C_3_3), .C((A[4] & B[3])), .YS(S_4_3), .YC(C_4_3));
  PDKGENFAX1 U13637 (.A(S_3_5), .B(C_3_4), .C((A[4] & B[4])), .YS(S_4_4), .YC(C_4_4));
  PDKGENFAX1 U13638 (.A(S_3_6), .B(C_3_5), .C((A[4] & B[5])), .YS(S_4_5), .YC(C_4_5));
  PDKGENFAX1 U13639 (.A(S_3_7), .B(C_3_6), .C((A[4] & B[6])), .YS(S_4_6), .YC(C_4_6));
  assign S_4_7 = (A[4] & B[7]);
  PDKGENFAX1 U13641 (.A(S_4_1), .B(C_4_0), .C((A[5] & B[0])), .YS(S_5_0), .YC(C_5_0));
  PDKGENFAX1 U13642 (.A(S_4_2), .B(C_4_1), .C((A[5] & B[1])), .YS(S_5_1), .YC(C_5_1));
  PDKGENFAX1 U13643 (.A(S_4_3), .B(C_4_2), .C((A[5] & B[2])), .YS(S_5_2), .YC(C_5_2));
  PDKGENFAX1 U13644 (.A(S_4_4), .B(C_4_3), .C((A[5] & B[3])), .YS(S_5_3), .YC(C_5_3));
  PDKGENFAX1 U13645 (.A(S_4_5), .B(C_4_4), .C((A[5] & B[4])), .YS(S_5_4), .YC(C_5_4));
  PDKGENFAX1 U13646 (.A(S_4_6), .B(C_4_5), .C((A[5] & B[5])), .YS(S_5_5), .YC(C_5_5));
  PDKGENFAX1 U13647 (.A(S_4_7), .B(C_4_6), .C((A[5] & B[6])), .YS(S_5_6), .YC(C_5_6));
  assign S_5_7 = (A[5] & B[7]);
  PDKGENFAX1 U13649 (.A(S_5_1), .B(C_5_0), .C((A[6] & B[0])), .YS(S_6_0), .YC(C_6_0));
  PDKGENFAX1 U13650 (.A(S_5_2), .B(C_5_1), .C((A[6] & B[1])), .YS(S_6_1), .YC(C_6_1));
  PDKGENFAX1 U13651 (.A(S_5_3), .B(C_5_2), .C((A[6] & B[2])), .YS(S_6_2), .YC(C_6_2));
  PDKGENFAX1 U13652 (.A(S_5_4), .B(C_5_3), .C((A[6] & B[3])), .YS(S_6_3), .YC(C_6_3));
  PDKGENFAX1 U13653 (.A(S_5_5), .B(C_5_4), .C((A[6] & B[4])), .YS(S_6_4), .YC(C_6_4));
  PDKGENFAX1 U13654 (.A(S_5_6), .B(C_5_5), .C((A[6] & B[5])), .YS(S_6_5), .YC(C_6_5));
  PDKGENFAX1 U13655 (.A(S_5_7), .B(C_5_6), .C((A[6] & B[6])), .YS(S_6_6), .YC(C_6_6));
  assign S_6_7 = (A[6] & B[7]);
  PDKGENFAX1 U13657 (.A(S_6_1), .B(C_6_0), .C((A[7] & B[0])), .YS(S_7_0), .YC(C_7_0));
  PDKGENFAX1 U13658 (.A(S_6_2), .B(C_6_1), .C((A[7] & B[1])), .YS(S_7_1), .YC(C_7_1));
  PDKGENFAX1 U13659 (.A(S_6_3), .B(C_6_2), .C((A[7] & B[2])), .YS(S_7_2), .YC(C_7_2));
  PDKGENFAX1 U13660 (.A(S_6_4), .B(C_6_3), .C((A[7] & B[3])), .YS(S_7_3), .YC(C_7_3));
  PDKGENFAX1 U13661 (.A(S_6_5), .B(C_6_4), .C((A[7] & B[4])), .YS(S_7_4), .YC(C_7_4));
  PDKGENFAX1 U13662 (.A(S_6_6), .B(C_6_5), .C((A[7] & B[5])), .YS(S_7_5), .YC(C_7_5));
  PDKGENFAX1 U13663 (.A(S_6_7), .B(C_6_6), .C((A[7] & B[6])), .YS(S_7_6), .YC(C_7_6));
  assign S_7_7 = (A[7] & B[7]);
  assign {S_8_7, S_8_6, S_8_5, S_8_4, S_8_3, S_8_2, S_8_1, S_8_0} = {C_7_6, C_7_5, C_7_4, C_7_3, C_7_2, C_7_1, C_7_0} + {S_7_7, S_7_6, S_7_5, S_7_4, S_7_3, S_7_2, S_7_1};
  assign O = {S_8_7,S_8_6,S_8_5,S_8_4,S_8_3,S_8_2,S_8_1,S_8_0,S_7_0,S_6_0,S_5_0,S_4_0,S_3_0,S_2_0,S_1_0,S_0_0};

endmodule
module CLA32bit(a,b,c_in,sum,c_out);

input [31:0]a,b;
input c_in;
output [31:0]sum;
output c_out;

wire [31:0] sum_out,  p,  g;
wire [7:0] PPP, GGG;
wire [8:0] CC;

assign p[31:0] = a[31:0] ^ b[31:0];
assign g[31:0] = a[31:0] & b[31:0];

assign PPP[0]= p [3] & p [2] & p [1] & p [0];
assign PPP[1]= p [7] & p [6] & p [5] & p [4];
assign PPP[2]= p[11] & p[10] & p [9] & p [8];
assign PPP[3]= p[15] & p[14] & p[13] & p[12];
assign PPP[4]= p[19] & p[18] & p[17] & p[16];
assign PPP[5]= p[23] & p[22] & p[21] & p[20];
assign PPP[6]= p[27] & p[26] & p[25] & p[24];
assign PPP[7]= p[31] & p[30] & p[29] & p[28];

assign GGG[0]= g[3]  | (p [3] & g [2])  | (p [3] & p [2] & g [1])  | (p [3] & p [2] & p [1] & g [0]) ;
assign GGG[1]= g[7]  | (p [7] & g [6])  | (p [7] & p [6] & g [5])  | (p [7] & p [6] & p [5] & g [4]);
assign GGG[2]= g[11] | (p[11] & g[10])  | (p[11] & p[10] & g [9])  | (p[11] & p[10] & p [9] & g [8]);
assign GGG[3]= g[15] | (p[15] & g[14])  | (p[15] & p[14] & g[13])  | (p[15] & p[14] & p[13] & g[12]);
assign GGG[4]= g[19] | (p[19] & g[18])  | (p[19] & p[18] & g[17])  | (p[19] & p[18] & p[17] & g[16]);
assign GGG[5]= g[23] | (p[23] & g[22])  | (p[23] & p[22] & g[21])  | (p[23] & p[22] & p[21] & g[20]);
assign GGG[6]= g[27] | (p[27] & g[26])  | (p[27] & p[26] & g[25])  | (p[27] & p[26] & p[25] & g[24]);
assign GGG[7]= g[31] | (p[31] & g[30])  | (p[31] & p[30] & g[29])  | (p[31] & p[30] & p[29] & g[28]);
assign CC[0] = c_in;
assign CC[1] = GGG[0]  |  PPP[0]&  CC[0];
assign CC[2] = GGG[1]  |  PPP[1]&GGG[0]  |  PPP[1]&PPP[0]&  CC[0];
assign CC[3] = GGG[2]  |  PPP[2]&GGG[1]  |  PPP[2]&PPP[1]&GGG[0]  |  PPP[2]&PPP[1]&PPP[0]&  CC[0];
assign CC[4] = GGG[3]  |  PPP[3]&GGG[2]  |  PPP[3]&PPP[2]&GGG[1]  |  PPP[3]&PPP[2]&PPP[1]&GGG[0]  |  PPP[3]&PPP[2]&PPP[1]&PPP[0]&  CC[0];
assign CC[5] = GGG[4]  |  PPP[4]&GGG[3]  |  PPP[4]&PPP[3]&GGG[2]  |  PPP[4]&PPP[3]&PPP[2]&GGG[1]  |  PPP[4]&PPP[3]&PPP[2]&PPP[1]&GGG[0] |  PPP[4]&PPP[3]&PPP[2]&PPP[1]&PPP[0]&  CC[0];
assign CC[6] = GGG[5]  |  PPP[5]&GGG[4]  |  PPP[5]&PPP[4]&GGG[3]  |  PPP[5]&PPP[4]&PPP[3]&GGG[2]  |  PPP[5]&PPP[4]&PPP[3]&PPP[2]&GGG[1] |  PPP[5]&PPP[4]&PPP[3]&PPP[2]&PPP[1]&GGG[0] |  PPP[5]&PPP[4]&PPP[3]&PPP[2]&PPP[1]&PPP[0]& CC[0];
assign CC[7] = GGG[6]  | PPP[6]&GGG[5]  |  PPP[6]&PPP[5]&GGG[4]  |  PPP[6]&PPP[5]&PPP[4]&GGG[3]  |  PPP[6]&PPP[5]&PPP[4]&PPP[3]&GGG[2]  |  PPP[6]&PPP[5]&PPP[4]&PPP[3]&PPP[2]&GGG[1] |  PPP[6]&PPP[5]&PPP[4]&PPP[3]&PPP[2]&PPP[1]&GGG[0] |  PPP[6]&PPP[5]&PPP[4]&PPP[3]&PPP[2]&PPP[1]&PPP[0] & CC[0];
assign CC[8] = GGG[7] | PPP[7]&GGG[6]  | PPP[7]&PPP[6]&GGG[5]  |  PPP[7]&PPP[6]&PPP[5]&GGG[4]  |  PPP[7]&PPP[6]&PPP[5]&PPP[4]&GGG[3]  |  PPP[7]&PPP[6]&PPP[5]&PPP[4]&PPP[3]&GGG[2]  |  PPP[7]&PPP[6]&PPP[5]&PPP[4]&PPP[3]&PPP[2]&GGG[1] |  PPP[7]&PPP[6]&PPP[5]&PPP[4]&PPP[3]&PPP[2]&PPP[1]&GGG[0] |  PPP[7]&PPP[6]&PPP[5]&PPP[4]&PPP[3]&PPP[2]&PPP[1]&PPP[0] & CC[0];
cla_4bit cla4bit1(.aa(a  [3:0]),  .bb(b  [3:0]),  .cin(CC[0]),   .pp(p  [3:0]),  .gg(g  [3:0]),   .summ(sum  [3:0]));
cla_4bit cla4bit2(.aa(a  [7:4]),  .bb(b  [7:4]),  .cin(CC[1]),   .pp(p  [7:4]),  .gg(g  [7:4]),   .summ(sum  [7:4]));
cla_4bit cla4bit3(.aa(a [11:8]),  .bb(b [11:8]),  .cin(CC[2]),   .pp(p [11:8]),  .gg(g [11:8]),   .summ(sum [11:8]));
cla_4bit cla4bit4(.aa(a[15:12]),  .bb(b[15:12]),  .cin(CC[3]),   .pp(p[15:12]),  .gg(g[15:12]),   .summ(sum[15:12]));
cla_4bit cla4bit5(.aa(a[19:16]),  .bb(b[19:16]),  .cin(CC[4]),   .pp(p[19:16]),  .gg(g[19:16]),   .summ(sum[19:16]));
cla_4bit cla4bit6(.aa(a[23:20]),  .bb(b[23:20]),  .cin(CC[5]),   .pp(p[23:20]),  .gg(g[23:20]),   .summ(sum[23:20]));
cla_4bit cla4bit7(.aa(a[27:24]),  .bb(b[27:24]),  .cin(CC[6]),   .pp(p[27:24]),  .gg(g[27:24]),   .summ(sum[27:24]));
cla_4bit cla4bit8(.aa(a[31:28]),  .bb(b[31:28]),  .cin(CC[7]),   .pp(p[31:28]),  .gg(g[31:28]),   .summ(sum[31:28]));

assign c_out=CC[8];

endmodule
module cla_4bit(aa,bb,cin,summ,pp,gg);
input  [3:0] aa,bb,pp,gg;  
input cin;
output [3:0] summ;

wire [3:0] c;

   assign c[0] = cin;
   assign c[1] = gg[0] | (pp[0] & c[0]);
   assign c[2] = gg[1] | (pp[1] & gg[0]) | (pp[1] & pp[0] & c[0]);
   assign c[3] = gg[2] | (pp[2] & gg[1]) | (pp[2] & pp[1] & gg[0])| (pp[2] & pp[1] & pp[0] & c[0]);

   assign summ[3:0] = pp[3:0]  ^  c[3:0];
endmodule

`timescale 1ns/100ps
module mul16u_BMC ( input[15:0] A,
                   input[15:0] B,
                   output [31:0] O
                 );

wire [15:0] ll,lh,hl,hh;
wire [31:0] llhhlh_sum;
wire [31:0] shifted_llhh, shifted_lh, shifted_hl;

localparam MAX1 = 15;
localparam MIN1 = 8;

localparam MAX2 = 7;
localparam MIN2 = 0;

mul8_364 LxL (.A(A[MAX2:MIN2]), .B(B[MAX2:MIN2]), .O(ll));
trun8_tam00b HxL (.A(A[MAX1:MIN1]), .B(B[MAX2:MIN2]), .O(hl));
mul8_364 LxH (.A(A[MAX2:MIN2]), .B(B[MAX1:MIN1]), .O(lh));
mul8_364 HxH (.A(A[MAX1:MIN1]), .B(B[MAX1:MIN1]), .O(hh));

assign shifted_llhh = { hh, ll }; 
assign shifted_lh = { {8{1'b0}}, lh, {8{1'b0}}}; 
assign shifted_hl = { {8{1'b0}}, hl, {8{1'b0}}};
CLA32bit LLHHLH (.a(shifted_llhh), .b(shifted_lh), .c_in(1'b0), .sum(llhhlh_sum), .c_out());
CLA32bit SUMO (.a(llhhlh_sum), .b(shifted_hl), .c_in(1'b0), .sum(O), .c_out());

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
/* mod */
module PDKGENBUFX2(input A, output Y );
     assign Y = A;
endmodule
