// This program was cloned from: https://github.com/MahmouodMagdi/Clock-Domain-Crossing-Synchronizers
// License: MIT License

/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Sat Feb 25 04:01:18 2023
/////////////////////////////////////////////////////////////


module FIFO_Write_Pointer ( W_CLK, W_rst_n, W_inc, Wq2_rptr, W_Full, W_ptr, 
        W_Addr );
  input [4:0] Wq2_rptr;
  output [4:0] W_ptr;
  output [3:0] W_Addr;
  input W_CLK, W_rst_n, W_inc;
  output W_Full;
  wire   n38, \Binary_W_ptr[4] , FULL_VALUE, n1, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37;
  wire   [3:0] Gray_W_ptr;
  wire   [4:0] Binary_W_ptr_next;

  DFFRQX2M \Binary_W_ptr_reg[4]  ( .D(n5), .CK(W_CLK), .RN(W_rst_n), .Q(
        \Binary_W_ptr[4] ) );
  DFFRQX2M \W_ptr_reg[4]  ( .D(n5), .CK(W_CLK), .RN(W_rst_n), .Q(W_ptr[4]) );
  DFFRQX4M \Binary_W_ptr_reg[0]  ( .D(n1), .CK(W_CLK), .RN(W_rst_n), .Q(
        W_Addr[0]) );
  DFFRQX4M \Binary_W_ptr_reg[2]  ( .D(n3), .CK(W_CLK), .RN(W_rst_n), .Q(
        W_Addr[2]) );
  DFFRQX4M \Binary_W_ptr_reg[1]  ( .D(Binary_W_ptr_next[1]), .CK(W_CLK), .RN(
        W_rst_n), .Q(W_Addr[1]) );
  DFFRQX2M \W_ptr_reg[3]  ( .D(Gray_W_ptr[3]), .CK(W_CLK), .RN(W_rst_n), .Q(
        W_ptr[3]) );
  DFFRQX2M \W_ptr_reg[0]  ( .D(Gray_W_ptr[0]), .CK(W_CLK), .RN(W_rst_n), .Q(
        W_ptr[0]) );
  DFFRQX2M \W_ptr_reg[1]  ( .D(Gray_W_ptr[1]), .CK(W_CLK), .RN(W_rst_n), .Q(
        W_ptr[1]) );
  DFFRQX2M \W_ptr_reg[2]  ( .D(Gray_W_ptr[2]), .CK(W_CLK), .RN(W_rst_n), .Q(
        W_ptr[2]) );
  DFFRHQX4M W_Full_reg ( .D(FULL_VALUE), .CK(W_CLK), .RN(W_rst_n), .Q(n38) );
  DFFRQX4M \Binary_W_ptr_reg[3]  ( .D(Binary_W_ptr_next[3]), .CK(W_CLK), .RN(
        W_rst_n), .Q(W_Addr[3]) );
  XOR2X4M U3 ( .A(n19), .B(n3), .Y(n20) );
  XOR2X4M U4 ( .A(n21), .B(Wq2_rptr[0]), .Y(n36) );
  INVX2M U5 ( .A(n31), .Y(Gray_W_ptr[2]) );
  XNOR2X4M U6 ( .A(n18), .B(W_Addr[0]), .Y(n1) );
  NAND2BX4M U7 ( .AN(n25), .B(W_Addr[3]), .Y(n11) );
  OAI221X4M U8 ( .A0(W_Addr[3]), .A1(n28), .B0(n27), .B1(n28), .C0(n26), .Y(
        n29) );
  INVX2M U9 ( .A(n25), .Y(n27) );
  OR3X2M U10 ( .A(n25), .B(n24), .C(n23), .Y(n26) );
  XOR2X8M U11 ( .A(n3), .B(n30), .Y(n31) );
  CLKXOR2X16M U12 ( .A(n4), .B(W_Addr[2]), .Y(n3) );
  XOR2X8M U13 ( .A(n19), .B(n1), .Y(n21) );
  CLKXOR2X8M U14 ( .A(n10), .B(W_Addr[1]), .Y(n19) );
  INVX2M U15 ( .A(n30), .Y(Binary_W_ptr_next[3]) );
  AOI222X4M U16 ( .A0(W_inc), .A1(n7), .B0(n24), .B1(n15), .C0(n24), .C1(n8), 
        .Y(n6) );
  INVX32M U17 ( .A(W_inc), .Y(n8) );
  XOR2X8M U18 ( .A(n9), .B(n29), .Y(n33) );
  NOR3X12M U19 ( .A(n12), .B(n14), .C(n8), .Y(n4) );
  CLKBUFX40M U20 ( .A(n38), .Y(W_Full) );
  NAND2BX1M U21 ( .AN(W_Full), .B(W_inc), .Y(n18) );
  CLKINVX2M U22 ( .A(n21), .Y(Gray_W_ptr[0]) );
  XOR2X8M U23 ( .A(n31), .B(Wq2_rptr[2]), .Y(n32) );
  XOR2X8M U24 ( .A(n11), .B(n22), .Y(n5) );
  XOR2X8M U25 ( .A(Wq2_rptr[4]), .B(n5), .Y(n34) );
  CLKINVX1M U26 ( .A(n20), .Y(Gray_W_ptr[1]) );
  INVXLM U27 ( .A(n19), .Y(Binary_W_ptr_next[1]) );
  AND3X6M U28 ( .A(n34), .B(n33), .C(n32), .Y(n35) );
  INVX2M U29 ( .A(n15), .Y(n16) );
  INVX2M U30 ( .A(n17), .Y(n7) );
  OR2X2M U31 ( .A(n14), .B(n13), .Y(n15) );
  INVX2M U32 ( .A(n23), .Y(n28) );
  INVX2M U33 ( .A(n6), .Y(n9) );
  NAND2BX2M U34 ( .AN(n14), .B(W_inc), .Y(n10) );
  NAND2BX2M U35 ( .AN(W_Full), .B(W_Addr[0]), .Y(n14) );
  CLKINVX2M U36 ( .A(W_Addr[3]), .Y(n24) );
  NAND2BX2M U37 ( .AN(n12), .B(W_Addr[2]), .Y(n13) );
  INVX2M U38 ( .A(W_Addr[1]), .Y(n12) );
  CLKXOR2X2M U39 ( .A(n22), .B(Wq2_rptr[3]), .Y(n23) );
  INVX2M U40 ( .A(\Binary_W_ptr[4] ), .Y(n22) );
  CLKXOR2X2M U41 ( .A(n5), .B(Binary_W_ptr_next[3]), .Y(Gray_W_ptr[3]) );
  NAND2BX4M U42 ( .AN(n15), .B(W_inc), .Y(n25) );
  OR3X2M U43 ( .A(n14), .B(n24), .C(n13), .Y(n17) );
  OAI222X4M U44 ( .A0(n8), .A1(n17), .B0(W_Addr[3]), .B1(n16), .C0(W_Addr[3]), 
        .C1(W_inc), .Y(n30) );
  XOR2X4M U45 ( .A(Wq2_rptr[1]), .B(n20), .Y(n37) );
  AND3X4M U46 ( .A(n36), .B(n37), .C(n35), .Y(FULL_VALUE) );
endmodule


module FIFO_R_Pointer ( R_CLK, R_rst_n, R_inc, Rq2_wptr, R_empty, R_ptr, 
        R_Addr );
  input [4:0] Rq2_wptr;
  output [4:0] R_ptr;
  output [3:0] R_Addr;
  input R_CLK, R_rst_n, R_inc;
  output R_empty;
  wire   n12, Empty_Value, \Binary_R_ptr[4] , N1, \add_70/carry[4] ,
         \add_70/carry[3] , \add_70/carry[2] , \add_70/carry[1] , n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11;
  wire   [4:0] Gray_R_ptr;
  wire   [3:0] Binary_R_ptr_next;

  DFFRHQX8M \Binary_R_ptr_reg[2]  ( .D(Binary_R_ptr_next[2]), .CK(R_CLK), .RN(
        R_rst_n), .Q(R_Addr[2]) );
  DFFRHQX8M \Binary_R_ptr_reg[3]  ( .D(Binary_R_ptr_next[3]), .CK(R_CLK), .RN(
        R_rst_n), .Q(R_Addr[3]) );
  DFFRQX2M \Binary_R_ptr_reg[4]  ( .D(Gray_R_ptr[4]), .CK(R_CLK), .RN(R_rst_n), 
        .Q(\Binary_R_ptr[4] ) );
  DFFRQX2M \R_ptr_reg[4]  ( .D(Gray_R_ptr[4]), .CK(R_CLK), .RN(R_rst_n), .Q(
        R_ptr[4]) );
  DFFRQX2M \R_ptr_reg[0]  ( .D(Gray_R_ptr[0]), .CK(R_CLK), .RN(R_rst_n), .Q(
        R_ptr[0]) );
  DFFRQX2M \R_ptr_reg[1]  ( .D(Gray_R_ptr[1]), .CK(R_CLK), .RN(R_rst_n), .Q(
        R_ptr[1]) );
  DFFRQX2M \R_ptr_reg[2]  ( .D(Gray_R_ptr[2]), .CK(R_CLK), .RN(R_rst_n), .Q(
        R_ptr[2]) );
  DFFRQX2M \R_ptr_reg[3]  ( .D(Gray_R_ptr[3]), .CK(R_CLK), .RN(R_rst_n), .Q(
        R_ptr[3]) );
  DFFRHQX8M \Binary_R_ptr_reg[1]  ( .D(Binary_R_ptr_next[1]), .CK(R_CLK), .RN(
        R_rst_n), .Q(R_Addr[1]) );
  DFFSQX2M R_empty_reg ( .D(Empty_Value), .CK(R_CLK), .SN(R_rst_n), .Q(n12) );
  DFFRX2M \Binary_R_ptr_reg[0]  ( .D(Binary_R_ptr_next[0]), .CK(R_CLK), .RN(
        R_rst_n), .Q(R_Addr[0]), .QN(n2) );
  CLKBUFX20M U3 ( .A(n12), .Y(R_empty) );
  INVX2M U4 ( .A(n2), .Y(n3) );
  NOR2BX2M U5 ( .AN(Gray_R_ptr[0]), .B(Rq2_wptr[0]), .Y(n5) );
  NOR2BX2M U6 ( .AN(Rq2_wptr[0]), .B(Gray_R_ptr[0]), .Y(n4) );
  CLKXOR2X2M U7 ( .A(Gray_R_ptr[4]), .B(Binary_R_ptr_next[3]), .Y(
        Gray_R_ptr[3]) );
  CLKXOR2X2M U8 ( .A(Binary_R_ptr_next[2]), .B(Binary_R_ptr_next[1]), .Y(
        Gray_R_ptr[1]) );
  CLKXOR2X2M U9 ( .A(Binary_R_ptr_next[1]), .B(Binary_R_ptr_next[0]), .Y(
        Gray_R_ptr[0]) );
  CLKXOR2X2M U10 ( .A(Binary_R_ptr_next[3]), .B(Binary_R_ptr_next[2]), .Y(
        Gray_R_ptr[2]) );
  NOR2BX2M U11 ( .AN(R_inc), .B(R_empty), .Y(N1) );
  CLKXOR2X2M U12 ( .A(\Binary_R_ptr[4] ), .B(\add_70/carry[4] ), .Y(
        Gray_R_ptr[4]) );
  AND2X1M U13 ( .A(\add_70/carry[3] ), .B(R_Addr[3]), .Y(\add_70/carry[4] ) );
  CLKXOR2X2M U14 ( .A(R_Addr[3]), .B(\add_70/carry[3] ), .Y(
        Binary_R_ptr_next[3]) );
  AND2X1M U15 ( .A(\add_70/carry[2] ), .B(R_Addr[2]), .Y(\add_70/carry[3] ) );
  CLKXOR2X2M U16 ( .A(R_Addr[2]), .B(\add_70/carry[2] ), .Y(
        Binary_R_ptr_next[2]) );
  AND2X1M U17 ( .A(\add_70/carry[1] ), .B(R_Addr[1]), .Y(\add_70/carry[2] ) );
  CLKXOR2X2M U18 ( .A(R_Addr[1]), .B(\add_70/carry[1] ), .Y(
        Binary_R_ptr_next[1]) );
  AND2X1M U19 ( .A(n3), .B(N1), .Y(\add_70/carry[1] ) );
  CLKXOR2X2M U20 ( .A(N1), .B(n3), .Y(Binary_R_ptr_next[0]) );
  CLKXOR2X2M U21 ( .A(Rq2_wptr[2]), .B(Gray_R_ptr[2]), .Y(n11) );
  OAI2B2X1M U22 ( .A1N(Gray_R_ptr[1]), .A0(n4), .B0(Rq2_wptr[1]), .B1(n4), .Y(
        n7) );
  OAI2B2X1M U23 ( .A1N(Rq2_wptr[1]), .A0(n5), .B0(Gray_R_ptr[1]), .B1(n5), .Y(
        n6) );
  CLKNAND2X2M U24 ( .A(n7), .B(n6), .Y(n10) );
  CLKXOR2X2M U25 ( .A(Rq2_wptr[3]), .B(Gray_R_ptr[3]), .Y(n9) );
  CLKXOR2X2M U26 ( .A(Rq2_wptr[4]), .B(Gray_R_ptr[4]), .Y(n8) );
  NOR4X1M U27 ( .A(n11), .B(n10), .C(n9), .D(n8), .Y(Empty_Value) );
endmodule


module ASYNC_FIFO_RAM ( W_CLK, W_CLK_en, W_Data, W_Addr, R_Addr, R_Data );
  input [7:0] W_Data;
  input [3:0] W_Addr;
  input [3:0] R_Addr;
  output [7:0] R_Data;
  input W_CLK, W_CLK_en;
  wire   N10, N11, N12, N13, \MEM[0][7] , \MEM[0][6] , \MEM[0][5] ,
         \MEM[0][4] , \MEM[0][3] , \MEM[0][2] , \MEM[0][1] , \MEM[0][0] ,
         \MEM[1][7] , \MEM[1][6] , \MEM[1][5] , \MEM[1][4] , \MEM[1][3] ,
         \MEM[1][2] , \MEM[1][1] , \MEM[1][0] , \MEM[2][7] , \MEM[2][6] ,
         \MEM[2][5] , \MEM[2][4] , \MEM[2][3] , \MEM[2][2] , \MEM[2][1] ,
         \MEM[2][0] , \MEM[3][7] , \MEM[3][6] , \MEM[3][5] , \MEM[3][4] ,
         \MEM[3][3] , \MEM[3][2] , \MEM[3][1] , \MEM[3][0] , \MEM[4][7] ,
         \MEM[4][6] , \MEM[4][5] , \MEM[4][4] , \MEM[4][3] , \MEM[4][2] ,
         \MEM[4][1] , \MEM[4][0] , \MEM[5][7] , \MEM[5][6] , \MEM[5][5] ,
         \MEM[5][4] , \MEM[5][3] , \MEM[5][2] , \MEM[5][1] , \MEM[5][0] ,
         \MEM[6][7] , \MEM[6][6] , \MEM[6][5] , \MEM[6][4] , \MEM[6][3] ,
         \MEM[6][2] , \MEM[6][1] , \MEM[6][0] , \MEM[7][7] , \MEM[7][6] ,
         \MEM[7][5] , \MEM[7][4] , \MEM[7][3] , \MEM[7][2] , \MEM[7][1] ,
         \MEM[7][0] , \MEM[8][7] , \MEM[8][6] , \MEM[8][5] , \MEM[8][4] ,
         \MEM[8][3] , \MEM[8][2] , \MEM[8][1] , \MEM[8][0] , \MEM[9][7] ,
         \MEM[9][6] , \MEM[9][5] , \MEM[9][4] , \MEM[9][3] , \MEM[9][2] ,
         \MEM[9][1] , \MEM[9][0] , \MEM[10][7] , \MEM[10][6] , \MEM[10][5] ,
         \MEM[10][4] , \MEM[10][3] , \MEM[10][2] , \MEM[10][1] , \MEM[10][0] ,
         \MEM[11][7] , \MEM[11][6] , \MEM[11][5] , \MEM[11][4] , \MEM[11][3] ,
         \MEM[11][2] , \MEM[11][1] , \MEM[11][0] , \MEM[12][7] , \MEM[12][6] ,
         \MEM[12][5] , \MEM[12][4] , \MEM[12][3] , \MEM[12][2] , \MEM[12][1] ,
         \MEM[12][0] , \MEM[13][7] , \MEM[13][6] , \MEM[13][5] , \MEM[13][4] ,
         \MEM[13][3] , \MEM[13][2] , \MEM[13][1] , \MEM[13][0] , \MEM[14][7] ,
         \MEM[14][6] , \MEM[14][5] , \MEM[14][4] , \MEM[14][3] , \MEM[14][2] ,
         \MEM[14][1] , \MEM[14][0] , \MEM[15][7] , \MEM[15][6] , \MEM[15][5] ,
         \MEM[15][4] , \MEM[15][3] , \MEM[15][2] , \MEM[15][1] , \MEM[15][0] ,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245;
  assign N10 = R_Addr[0];
  assign N11 = R_Addr[1];
  assign N12 = R_Addr[2];
  assign N13 = R_Addr[3];

  DFFQX2M \MEM_reg[0][0]  ( .D(n158), .CK(W_CLK), .Q(\MEM[0][0] ) );
  DFFQX1M \MEM_reg[5][0]  ( .D(n118), .CK(W_CLK), .Q(\MEM[5][0] ) );
  DFFQX1M \MEM_reg[9][2]  ( .D(n88), .CK(W_CLK), .Q(\MEM[9][2] ) );
  DFFQX1M \MEM_reg[13][3]  ( .D(n57), .CK(W_CLK), .Q(\MEM[13][3] ) );
  DFFQX1M \MEM_reg[13][2]  ( .D(n56), .CK(W_CLK), .Q(\MEM[13][2] ) );
  DFFQX1M \MEM_reg[13][0]  ( .D(n54), .CK(W_CLK), .Q(\MEM[13][0] ) );
  DFFQX1M \MEM_reg[6][3]  ( .D(n113), .CK(W_CLK), .Q(\MEM[6][3] ) );
  DFFQX1M \MEM_reg[6][0]  ( .D(n110), .CK(W_CLK), .Q(\MEM[6][0] ) );
  DFFQX1M \MEM_reg[10][2]  ( .D(n80), .CK(W_CLK), .Q(\MEM[10][2] ) );
  DFFQX1M \MEM_reg[14][3]  ( .D(n49), .CK(W_CLK), .Q(\MEM[14][3] ) );
  DFFQX1M \MEM_reg[14][2]  ( .D(n48), .CK(W_CLK), .Q(\MEM[14][2] ) );
  DFFQX1M \MEM_reg[14][0]  ( .D(n46), .CK(W_CLK), .Q(\MEM[14][0] ) );
  DFFQX1M \MEM_reg[4][3]  ( .D(n129), .CK(W_CLK), .Q(\MEM[4][3] ) );
  DFFQX1M \MEM_reg[4][0]  ( .D(n126), .CK(W_CLK), .Q(\MEM[4][0] ) );
  DFFQX1M \MEM_reg[8][2]  ( .D(n96), .CK(W_CLK), .Q(\MEM[8][2] ) );
  DFFQX1M \MEM_reg[12][3]  ( .D(n65), .CK(W_CLK), .Q(\MEM[12][3] ) );
  DFFQX1M \MEM_reg[12][2]  ( .D(n64), .CK(W_CLK), .Q(\MEM[12][2] ) );
  DFFQX1M \MEM_reg[12][0]  ( .D(n62), .CK(W_CLK), .Q(\MEM[12][0] ) );
  DFFQX1M \MEM_reg[7][3]  ( .D(n105), .CK(W_CLK), .Q(\MEM[7][3] ) );
  DFFQX1M \MEM_reg[7][0]  ( .D(n102), .CK(W_CLK), .Q(\MEM[7][0] ) );
  DFFQX1M \MEM_reg[11][2]  ( .D(n72), .CK(W_CLK), .Q(\MEM[11][2] ) );
  DFFQX1M \MEM_reg[15][2]  ( .D(n40), .CK(W_CLK), .Q(\MEM[15][2] ) );
  DFFQX1M \MEM_reg[6][4]  ( .D(n114), .CK(W_CLK), .Q(\MEM[6][4] ) );
  DFFQX1M \MEM_reg[6][1]  ( .D(n111), .CK(W_CLK), .Q(\MEM[6][1] ) );
  DFFQX1M \MEM_reg[10][7]  ( .D(n85), .CK(W_CLK), .Q(\MEM[10][7] ) );
  DFFQX1M \MEM_reg[10][6]  ( .D(n84), .CK(W_CLK), .Q(\MEM[10][6] ) );
  DFFQX1M \MEM_reg[10][4]  ( .D(n82), .CK(W_CLK), .Q(\MEM[10][4] ) );
  DFFQX1M \MEM_reg[14][7]  ( .D(n53), .CK(W_CLK), .Q(\MEM[14][7] ) );
  DFFQX1M \MEM_reg[14][6]  ( .D(n52), .CK(W_CLK), .Q(\MEM[14][6] ) );
  DFFQX1M \MEM_reg[14][4]  ( .D(n50), .CK(W_CLK), .Q(\MEM[14][4] ) );
  DFFQX1M \MEM_reg[14][1]  ( .D(n47), .CK(W_CLK), .Q(\MEM[14][1] ) );
  DFFQX1M \MEM_reg[2][6]  ( .D(n148), .CK(W_CLK), .Q(\MEM[2][6] ) );
  DFFQX1M \MEM_reg[6][6]  ( .D(n116), .CK(W_CLK), .Q(\MEM[6][6] ) );
  DFFQX1M \MEM_reg[5][4]  ( .D(n122), .CK(W_CLK), .Q(\MEM[5][4] ) );
  DFFQX1M \MEM_reg[5][1]  ( .D(n119), .CK(W_CLK), .Q(\MEM[5][1] ) );
  DFFQX1M \MEM_reg[9][7]  ( .D(n93), .CK(W_CLK), .Q(\MEM[9][7] ) );
  DFFQX1M \MEM_reg[9][6]  ( .D(n92), .CK(W_CLK), .Q(\MEM[9][6] ) );
  DFFQX1M \MEM_reg[9][4]  ( .D(n90), .CK(W_CLK), .Q(\MEM[9][4] ) );
  DFFQX1M \MEM_reg[13][7]  ( .D(n61), .CK(W_CLK), .Q(\MEM[13][7] ) );
  DFFQX1M \MEM_reg[13][6]  ( .D(n60), .CK(W_CLK), .Q(\MEM[13][6] ) );
  DFFQX1M \MEM_reg[13][4]  ( .D(n58), .CK(W_CLK), .Q(\MEM[13][4] ) );
  DFFQX1M \MEM_reg[13][1]  ( .D(n55), .CK(W_CLK), .Q(\MEM[13][1] ) );
  DFFQX1M \MEM_reg[1][4]  ( .D(n154), .CK(W_CLK), .Q(\MEM[1][4] ) );
  DFFQX1M \MEM_reg[1][6]  ( .D(n156), .CK(W_CLK), .Q(\MEM[1][6] ) );
  DFFQX1M \MEM_reg[5][6]  ( .D(n124), .CK(W_CLK), .Q(\MEM[5][6] ) );
  DFFQX1M \MEM_reg[7][4]  ( .D(n106), .CK(W_CLK), .Q(\MEM[7][4] ) );
  DFFQX1M \MEM_reg[7][1]  ( .D(n103), .CK(W_CLK), .Q(\MEM[7][1] ) );
  DFFQX1M \MEM_reg[11][7]  ( .D(n77), .CK(W_CLK), .Q(\MEM[11][7] ) );
  DFFQX1M \MEM_reg[11][6]  ( .D(n76), .CK(W_CLK), .Q(\MEM[11][6] ) );
  DFFQX1M \MEM_reg[11][4]  ( .D(n74), .CK(W_CLK), .Q(\MEM[11][4] ) );
  DFFQX1M \MEM_reg[15][7]  ( .D(n45), .CK(W_CLK), .Q(\MEM[15][7] ) );
  DFFQX1M \MEM_reg[3][6]  ( .D(n140), .CK(W_CLK), .Q(\MEM[3][6] ) );
  DFFQX1M \MEM_reg[7][6]  ( .D(n108), .CK(W_CLK), .Q(\MEM[7][6] ) );
  DFFQX1M \MEM_reg[4][4]  ( .D(n130), .CK(W_CLK), .Q(\MEM[4][4] ) );
  DFFQX1M \MEM_reg[4][1]  ( .D(n127), .CK(W_CLK), .Q(\MEM[4][1] ) );
  DFFQX1M \MEM_reg[8][7]  ( .D(n101), .CK(W_CLK), .Q(\MEM[8][7] ) );
  DFFQX1M \MEM_reg[8][6]  ( .D(n100), .CK(W_CLK), .Q(\MEM[8][6] ) );
  DFFQX1M \MEM_reg[8][4]  ( .D(n98), .CK(W_CLK), .Q(\MEM[8][4] ) );
  DFFQX1M \MEM_reg[12][7]  ( .D(n69), .CK(W_CLK), .Q(\MEM[12][7] ) );
  DFFQX1M \MEM_reg[12][6]  ( .D(n68), .CK(W_CLK), .Q(\MEM[12][6] ) );
  DFFQX1M \MEM_reg[12][4]  ( .D(n66), .CK(W_CLK), .Q(\MEM[12][4] ) );
  DFFQX1M \MEM_reg[12][1]  ( .D(n63), .CK(W_CLK), .Q(\MEM[12][1] ) );
  DFFQX1M \MEM_reg[0][4]  ( .D(n162), .CK(W_CLK), .Q(\MEM[0][4] ) );
  DFFQX1M \MEM_reg[0][6]  ( .D(n164), .CK(W_CLK), .Q(\MEM[0][6] ) );
  DFFQX1M \MEM_reg[4][6]  ( .D(n132), .CK(W_CLK), .Q(\MEM[4][6] ) );
  DFFQX1M \MEM_reg[1][5]  ( .D(n155), .CK(W_CLK), .Q(\MEM[1][5] ) );
  DFFQX1M \MEM_reg[5][5]  ( .D(n123), .CK(W_CLK), .Q(\MEM[5][5] ) );
  DFFQX1M \MEM_reg[2][5]  ( .D(n147), .CK(W_CLK), .Q(\MEM[2][5] ) );
  DFFQX1M \MEM_reg[6][5]  ( .D(n115), .CK(W_CLK), .Q(\MEM[6][5] ) );
  DFFQX1M \MEM_reg[3][5]  ( .D(n139), .CK(W_CLK), .Q(\MEM[3][5] ) );
  DFFQX1M \MEM_reg[7][5]  ( .D(n107), .CK(W_CLK), .Q(\MEM[7][5] ) );
  DFFQX1M \MEM_reg[0][5]  ( .D(n163), .CK(W_CLK), .Q(\MEM[0][5] ) );
  DFFQX1M \MEM_reg[4][5]  ( .D(n131), .CK(W_CLK), .Q(\MEM[4][5] ) );
  DFFQX1M \MEM_reg[2][3]  ( .D(n145), .CK(W_CLK), .Q(\MEM[2][3] ) );
  DFFQX1M \MEM_reg[2][2]  ( .D(n144), .CK(W_CLK), .Q(\MEM[2][2] ) );
  DFFQX1M \MEM_reg[2][1]  ( .D(n143), .CK(W_CLK), .Q(\MEM[2][1] ) );
  DFFQX1M \MEM_reg[2][0]  ( .D(n142), .CK(W_CLK), .Q(\MEM[2][0] ) );
  DFFQX1M \MEM_reg[6][7]  ( .D(n117), .CK(W_CLK), .Q(\MEM[6][7] ) );
  DFFQX1M \MEM_reg[6][2]  ( .D(n112), .CK(W_CLK), .Q(\MEM[6][2] ) );
  DFFQX1M \MEM_reg[10][3]  ( .D(n81), .CK(W_CLK), .Q(\MEM[10][3] ) );
  DFFQX1M \MEM_reg[10][1]  ( .D(n79), .CK(W_CLK), .Q(\MEM[10][1] ) );
  DFFQX1M \MEM_reg[10][0]  ( .D(n78), .CK(W_CLK), .Q(\MEM[10][0] ) );
  DFFQX1M \MEM_reg[1][7]  ( .D(n157), .CK(W_CLK), .Q(\MEM[1][7] ) );
  DFFQX1M \MEM_reg[1][3]  ( .D(n153), .CK(W_CLK), .Q(\MEM[1][3] ) );
  DFFQX1M \MEM_reg[1][2]  ( .D(n152), .CK(W_CLK), .Q(\MEM[1][2] ) );
  DFFQX1M \MEM_reg[1][1]  ( .D(n151), .CK(W_CLK), .Q(\MEM[1][1] ) );
  DFFQX1M \MEM_reg[1][0]  ( .D(n150), .CK(W_CLK), .Q(\MEM[1][0] ) );
  DFFQX1M \MEM_reg[5][7]  ( .D(n125), .CK(W_CLK), .Q(\MEM[5][7] ) );
  DFFQX1M \MEM_reg[5][2]  ( .D(n120), .CK(W_CLK), .Q(\MEM[5][2] ) );
  DFFQX1M \MEM_reg[9][3]  ( .D(n89), .CK(W_CLK), .Q(\MEM[9][3] ) );
  DFFQX1M \MEM_reg[9][1]  ( .D(n87), .CK(W_CLK), .Q(\MEM[9][1] ) );
  DFFQX1M \MEM_reg[9][0]  ( .D(n86), .CK(W_CLK), .Q(\MEM[9][0] ) );
  DFFQX1M \MEM_reg[3][7]  ( .D(n141), .CK(W_CLK), .Q(\MEM[3][7] ) );
  DFFQX1M \MEM_reg[3][3]  ( .D(n137), .CK(W_CLK), .Q(\MEM[3][3] ) );
  DFFQX1M \MEM_reg[3][2]  ( .D(n136), .CK(W_CLK), .Q(\MEM[3][2] ) );
  DFFQX1M \MEM_reg[3][1]  ( .D(n135), .CK(W_CLK), .Q(\MEM[3][1] ) );
  DFFQX1M \MEM_reg[3][0]  ( .D(n134), .CK(W_CLK), .Q(\MEM[3][0] ) );
  DFFQX1M \MEM_reg[7][7]  ( .D(n109), .CK(W_CLK), .Q(\MEM[7][7] ) );
  DFFQX1M \MEM_reg[7][2]  ( .D(n104), .CK(W_CLK), .Q(\MEM[7][2] ) );
  DFFQX1M \MEM_reg[11][3]  ( .D(n73), .CK(W_CLK), .Q(\MEM[11][3] ) );
  DFFQX1M \MEM_reg[11][1]  ( .D(n71), .CK(W_CLK), .Q(\MEM[11][1] ) );
  DFFQX1M \MEM_reg[11][0]  ( .D(n70), .CK(W_CLK), .Q(\MEM[11][0] ) );
  DFFQX1M \MEM_reg[0][7]  ( .D(n165), .CK(W_CLK), .Q(\MEM[0][7] ) );
  DFFQX1M \MEM_reg[0][3]  ( .D(n161), .CK(W_CLK), .Q(\MEM[0][3] ) );
  DFFQX1M \MEM_reg[0][2]  ( .D(n160), .CK(W_CLK), .Q(\MEM[0][2] ) );
  DFFQX1M \MEM_reg[0][1]  ( .D(n159), .CK(W_CLK), .Q(\MEM[0][1] ) );
  DFFQX1M \MEM_reg[4][7]  ( .D(n133), .CK(W_CLK), .Q(\MEM[4][7] ) );
  DFFQX1M \MEM_reg[4][2]  ( .D(n128), .CK(W_CLK), .Q(\MEM[4][2] ) );
  DFFQX1M \MEM_reg[8][3]  ( .D(n97), .CK(W_CLK), .Q(\MEM[8][3] ) );
  DFFQX1M \MEM_reg[8][1]  ( .D(n95), .CK(W_CLK), .Q(\MEM[8][1] ) );
  DFFQX1M \MEM_reg[8][0]  ( .D(n94), .CK(W_CLK), .Q(\MEM[8][0] ) );
  DFFQX1M \MEM_reg[9][5]  ( .D(n91), .CK(W_CLK), .Q(\MEM[9][5] ) );
  DFFQX1M \MEM_reg[13][5]  ( .D(n59), .CK(W_CLK), .Q(\MEM[13][5] ) );
  DFFQX1M \MEM_reg[10][5]  ( .D(n83), .CK(W_CLK), .Q(\MEM[10][5] ) );
  DFFQX1M \MEM_reg[14][5]  ( .D(n51), .CK(W_CLK), .Q(\MEM[14][5] ) );
  DFFQX1M \MEM_reg[11][5]  ( .D(n75), .CK(W_CLK), .Q(\MEM[11][5] ) );
  DFFQX1M \MEM_reg[15][5]  ( .D(n43), .CK(W_CLK), .Q(\MEM[15][5] ) );
  DFFQX1M \MEM_reg[8][5]  ( .D(n99), .CK(W_CLK), .Q(\MEM[8][5] ) );
  DFFQX1M \MEM_reg[12][5]  ( .D(n67), .CK(W_CLK), .Q(\MEM[12][5] ) );
  DFFQX2M \MEM_reg[15][6]  ( .D(n44), .CK(W_CLK), .Q(\MEM[15][6] ) );
  DFFQX2M \MEM_reg[15][4]  ( .D(n42), .CK(W_CLK), .Q(\MEM[15][4] ) );
  DFFQX2M \MEM_reg[15][1]  ( .D(n39), .CK(W_CLK), .Q(\MEM[15][1] ) );
  DFFQX2M \MEM_reg[2][7]  ( .D(n149), .CK(W_CLK), .Q(\MEM[2][7] ) );
  DFFQX2M \MEM_reg[15][3]  ( .D(n41), .CK(W_CLK), .Q(\MEM[15][3] ) );
  DFFQX2M \MEM_reg[15][0]  ( .D(n38), .CK(W_CLK), .Q(\MEM[15][0] ) );
  DFFQX2M \MEM_reg[5][3]  ( .D(n121), .CK(W_CLK), .Q(\MEM[5][3] ) );
  DFFQX2M \MEM_reg[3][4]  ( .D(n138), .CK(W_CLK), .Q(\MEM[3][4] ) );
  DFFQX2M \MEM_reg[2][4]  ( .D(n146), .CK(W_CLK), .Q(\MEM[2][4] ) );
  CLKBUFX32M U2 ( .A(n16), .Y(n6) );
  AND2X8M U3 ( .A(n25), .B(n235), .Y(n16) );
  BUFX18M U4 ( .A(n22), .Y(n179) );
  INVX24M U5 ( .A(n8), .Y(n31) );
  AO2B2X4M U6 ( .B0(\MEM[14][4] ), .B1(n231), .A0(W_Data[4]), .A1N(n231), .Y(
        n50) );
  AO2B2X4M U7 ( .B0(\MEM[14][1] ), .B1(n231), .A0(W_Data[1]), .A1N(n231), .Y(
        n47) );
  AO2B2X4M U8 ( .B0(\MEM[14][5] ), .B1(n231), .A0(W_Data[5]), .A1N(n231), .Y(
        n51) );
  OAI2BB2X2M U9 ( .B0(n245), .B1(n181), .A0N(\MEM[12][0] ), .A1N(n181), .Y(n62) );
  INVX16M U10 ( .A(n223), .Y(n176) );
  OAI2BB2X2M U11 ( .B0(n238), .B1(n229), .A0N(\MEM[12][7] ), .A1N(n181), .Y(
        n69) );
  CLKBUFX20M U12 ( .A(n19), .Y(n229) );
  INVX20M U13 ( .A(n180), .Y(n181) );
  AO2B2X2M U14 ( .B0(\MEM[12][6] ), .B1(n181), .A0(W_Data[6]), .A1N(n229), .Y(
        n68) );
  AND2X12M U15 ( .A(n24), .B(n6), .Y(n1) );
  INVX24M U16 ( .A(n1), .Y(n26) );
  OAI2BB2X2M U17 ( .B0(n245), .B1(n34), .A0N(\MEM[2][0] ), .A1N(n34), .Y(n142)
         );
  OAI2BB2X2M U18 ( .B0(n243), .B1(n34), .A0N(\MEM[2][2] ), .A1N(n34), .Y(n144)
         );
  OAI2BB2X2M U19 ( .B0(n240), .B1(n34), .A0N(\MEM[2][5] ), .A1N(n34), .Y(n147)
         );
  OAI2BB2X2M U20 ( .B0(n239), .B1(n34), .A0N(\MEM[2][6] ), .A1N(n34), .Y(n148)
         );
  OAI2BB2X2M U21 ( .B0(n244), .B1(n34), .A0N(\MEM[2][1] ), .A1N(n34), .Y(n143)
         );
  OAI2BB2X2M U22 ( .B0(n242), .B1(n34), .A0N(\MEM[2][3] ), .A1N(n34), .Y(n145)
         );
  BUFX32M U23 ( .A(n27), .Y(n226) );
  BUFX32M U24 ( .A(n17), .Y(n230) );
  BUFX32M U25 ( .A(n32), .Y(n224) );
  BUFX32M U26 ( .A(n29), .Y(n225) );
  BUFX32M U27 ( .A(n179), .Y(n228) );
  NAND2X6M U28 ( .A(n18), .B(n6), .Y(n19) );
  OAI2BB2X2M U29 ( .B0(n241), .B1(n229), .A0N(\MEM[12][4] ), .A1N(n181), .Y(
        n66) );
  AO2B2X2M U30 ( .B0(\MEM[12][3] ), .B1(n181), .A0(W_Data[3]), .A1N(n229), .Y(
        n65) );
  INVX10M U31 ( .A(n20), .Y(n183) );
  NAND2X6M U32 ( .A(n21), .B(n4), .Y(n20) );
  INVX24M U33 ( .A(n183), .Y(n184) );
  NAND2X4M U34 ( .A(n30), .B(n24), .Y(n37) );
  INVX24M U35 ( .A(n187), .Y(n30) );
  CLKBUFX40M U36 ( .A(n15), .Y(n231) );
  AO2B2X4M U37 ( .B0(\MEM[14][2] ), .B1(n231), .A0(W_Data[2]), .A1N(n231), .Y(
        n48) );
  AO2B2X4M U38 ( .B0(\MEM[14][0] ), .B1(n231), .A0(W_Data[0]), .A1N(n231), .Y(
        n46) );
  AO2B2X4M U39 ( .B0(\MEM[14][7] ), .B1(n231), .A0(W_Data[7]), .A1N(n231), .Y(
        n53) );
  AO2B2X4M U40 ( .B0(\MEM[14][6] ), .B1(n231), .A0(W_Data[6]), .A1N(n231), .Y(
        n52) );
  AND2X1M U41 ( .A(W_CLK_en), .B(W_Addr[3]), .Y(n2) );
  NAND2X6M U42 ( .A(n2), .B(n3), .Y(n23) );
  AND2X2M U43 ( .A(n24), .B(W_Addr[0]), .Y(n3) );
  BUFX32M U44 ( .A(n12), .Y(n232) );
  NAND2X4M U45 ( .A(n4), .B(n13), .Y(n12) );
  BUFX20M U46 ( .A(n14), .Y(n4) );
  CLKBUFX20M U47 ( .A(n37), .Y(n221) );
  BUFX14M U48 ( .A(n37), .Y(n222) );
  CLKINVX24M U49 ( .A(n19), .Y(n180) );
  OAI2BB2X2M U50 ( .B0(n244), .B1(n229), .A0N(\MEM[12][1] ), .A1N(n181), .Y(
        n63) );
  AO2B2X2M U51 ( .B0(\MEM[12][2] ), .B1(n181), .A0(W_Data[2]), .A1N(n229), .Y(
        n64) );
  OAI2BB2X2M U52 ( .B0(n240), .B1(n229), .A0N(\MEM[12][5] ), .A1N(n181), .Y(
        n67) );
  INVX20M U53 ( .A(n232), .Y(n170) );
  AND2X12M U54 ( .A(n25), .B(W_Addr[0]), .Y(n14) );
  BUFX32M U55 ( .A(n7), .Y(n5) );
  BUFX18M U56 ( .A(n23), .Y(n7) );
  MX4X4M U57 ( .A(n215), .B(n213), .C(n214), .D(n212), .S0(N13), .S1(N12), .Y(
        R_Data[6]) );
  NAND2X2M U58 ( .A(n18), .B(n14), .Y(n17) );
  AND2X12M U59 ( .A(W_CLK_en), .B(W_Addr[3]), .Y(n25) );
  BUFX32M U60 ( .A(n7), .Y(n227) );
  OAI2BB2X2M U61 ( .B0(n239), .B1(n182), .A0N(\MEM[8][6] ), .A1N(n182), .Y(
        n100) );
  INVX32M U62 ( .A(n1), .Y(n182) );
  INVX2M U63 ( .A(W_Addr[3]), .Y(n11) );
  MX4X1M U64 ( .A(\MEM[12][5] ), .B(\MEM[13][5] ), .C(\MEM[14][5] ), .D(
        \MEM[15][5] ), .S0(n220), .S1(N11), .Y(n208) );
  MX4X1M U65 ( .A(\MEM[4][5] ), .B(\MEM[5][5] ), .C(\MEM[6][5] ), .D(
        \MEM[7][5] ), .S0(n220), .S1(N11), .Y(n210) );
  MX2X2M U66 ( .A(n185), .B(n186), .S0(N11), .Y(n212) );
  MX2X2M U67 ( .A(\MEM[12][6] ), .B(\MEM[13][6] ), .S0(n220), .Y(n185) );
  CLKBUFX20M U68 ( .A(N10), .Y(n220) );
  INVX6M U69 ( .A(W_Data[4]), .Y(n241) );
  NOR2X4M U70 ( .A(W_Addr[1]), .B(W_Addr[2]), .Y(n24) );
  INVX6M U71 ( .A(W_Data[5]), .Y(n240) );
  INVX4M U72 ( .A(W_Data[6]), .Y(n239) );
  INVX6M U73 ( .A(W_Data[7]), .Y(n238) );
  INVX6M U74 ( .A(W_Data[1]), .Y(n244) );
  BUFX4M U75 ( .A(n12), .Y(n233) );
  INVX6M U76 ( .A(W_Data[3]), .Y(n242) );
  INVX6M U77 ( .A(W_Data[2]), .Y(n243) );
  INVX6M U78 ( .A(W_Data[0]), .Y(n245) );
  MX4X1M U79 ( .A(\MEM[0][5] ), .B(\MEM[1][5] ), .C(\MEM[2][5] ), .D(
        \MEM[3][5] ), .S0(n220), .S1(N11), .Y(n211) );
  MX4X1M U80 ( .A(\MEM[8][5] ), .B(\MEM[9][5] ), .C(\MEM[10][5] ), .D(
        \MEM[11][5] ), .S0(n220), .S1(N11), .Y(n209) );
  MX4X1M U81 ( .A(n219), .B(n217), .C(n218), .D(n216), .S0(N13), .S1(N12), .Y(
        R_Data[7]) );
  INVX2M U82 ( .A(\MEM[2][4] ), .Y(n173) );
  INVX2M U83 ( .A(\MEM[3][4] ), .Y(n177) );
  INVX4M U84 ( .A(n31), .Y(n174) );
  OAI2BB2X2M U85 ( .B0(n169), .B1(n170), .A0N(n170), .A1N(W_Data[0]), .Y(n38)
         );
  OAI2BB2X2M U86 ( .B0(n168), .B1(n170), .A0N(n170), .A1N(W_Data[3]), .Y(n41)
         );
  OAI2BB2X1M U87 ( .B0(n240), .B1(n228), .A0N(\MEM[10][5] ), .A1N(n228), .Y(
        n83) );
  OAI2BB2X1M U88 ( .B0(n240), .B1(n227), .A0N(\MEM[9][5] ), .A1N(n5), .Y(n91)
         );
  OAI2BB2X1M U89 ( .B0(n245), .B1(n227), .A0N(\MEM[9][0] ), .A1N(n7), .Y(n86)
         );
  OAI2BB2X1M U90 ( .B0(n245), .B1(n228), .A0N(\MEM[10][0] ), .A1N(n228), .Y(
        n78) );
  OAI2BB2X1M U91 ( .B0(n244), .B1(n228), .A0N(\MEM[10][1] ), .A1N(n228), .Y(
        n79) );
  OAI2BB2X1M U92 ( .B0(n241), .B1(n227), .A0N(\MEM[9][4] ), .A1N(n5), .Y(n90)
         );
  OAI2BB2X1M U93 ( .B0(n238), .B1(n227), .A0N(\MEM[9][7] ), .A1N(n7), .Y(n93)
         );
  OAI2BB2X1M U94 ( .B0(n241), .B1(n228), .A0N(\MEM[10][4] ), .A1N(n228), .Y(
        n82) );
  OAI2BB2X1M U95 ( .B0(n238), .B1(n228), .A0N(\MEM[10][7] ), .A1N(n228), .Y(
        n85) );
  MX4X1M U96 ( .A(n203), .B(n201), .C(n202), .D(n200), .S0(N13), .S1(N12), .Y(
        R_Data[3]) );
  MX4X1M U97 ( .A(n199), .B(n197), .C(n198), .D(n196), .S0(N13), .S1(N12), .Y(
        R_Data[2]) );
  BUFX14M U98 ( .A(N11), .Y(n234) );
  NOR2X6M U99 ( .A(n237), .B(n236), .Y(n13) );
  CLKAND2X6M U100 ( .A(n28), .B(n24), .Y(n9) );
  CLKAND2X6M U101 ( .A(n28), .B(n18), .Y(n8) );
  NOR2X6M U102 ( .A(n237), .B(W_Addr[1]), .Y(n18) );
  CLKAND2X6M U103 ( .A(n30), .B(n21), .Y(n172) );
  INVXLM U104 ( .A(n21), .Y(n167) );
  INVX2M U105 ( .A(\MEM[5][3] ), .Y(n175) );
  INVX2M U106 ( .A(\MEM[15][0] ), .Y(n169) );
  INVX2M U107 ( .A(\MEM[15][3] ), .Y(n168) );
  INVX2M U108 ( .A(\MEM[2][7] ), .Y(n178) );
  INVX2M U109 ( .A(\MEM[15][1] ), .Y(n171) );
  INVX2M U110 ( .A(\MEM[15][4] ), .Y(n166) );
  INVX2M U111 ( .A(\MEM[15][6] ), .Y(n10) );
  MX2X2M U112 ( .A(\MEM[14][6] ), .B(\MEM[15][6] ), .S0(n220), .Y(n186) );
  BUFX18M U113 ( .A(n33), .Y(n223) );
  NAND2X4M U114 ( .A(n28), .B(n21), .Y(n33) );
  INVX24M U115 ( .A(n9), .Y(n35) );
  AO2B2X4M U116 ( .B0(W_Data[0]), .B1(n176), .A0(\MEM[3][0] ), .A1N(n176), .Y(
        n134) );
  AO2B2X2M U117 ( .B0(W_Data[4]), .B1(n183), .A0(\MEM[11][4] ), .A1N(n183), 
        .Y(n74) );
  OAI2BB2X2M U118 ( .B0(n232), .B1(n243), .A0N(\MEM[15][2] ), .A1N(n233), .Y(
        n40) );
  OAI2BB2X2M U119 ( .B0(n10), .B1(n170), .A0N(n170), .A1N(W_Data[6]), .Y(n44)
         );
  AO2B2X2M U120 ( .B0(\MEM[11][2] ), .B1(n184), .A0(W_Data[2]), .A1N(n184), 
        .Y(n72) );
  AO2B2X2M U121 ( .B0(\MEM[11][7] ), .B1(n184), .A0(W_Data[7]), .A1N(n184), 
        .Y(n77) );
  AO2B2X2M U122 ( .B0(\MEM[11][6] ), .B1(n184), .A0(W_Data[6]), .A1N(n184), 
        .Y(n76) );
  AO2B2X2M U123 ( .B0(\MEM[11][0] ), .B1(n184), .A0(W_Data[0]), .A1N(n184), 
        .Y(n70) );
  AO2B2X2M U124 ( .B0(\MEM[11][5] ), .B1(n184), .A0(W_Data[5]), .A1N(n184), 
        .Y(n75) );
  AO2B2X2M U125 ( .B0(\MEM[11][3] ), .B1(n184), .A0(W_Data[3]), .A1N(n184), 
        .Y(n73) );
  AO2B2X2M U126 ( .B0(\MEM[11][1] ), .B1(n184), .A0(W_Data[1]), .A1N(n184), 
        .Y(n71) );
  AND2X6M U127 ( .A(W_CLK_en), .B(n11), .Y(n36) );
  OAI2BB2X2M U128 ( .B0(n166), .B1(n170), .A0N(n170), .A1N(W_Data[4]), .Y(n42)
         );
  NAND2BX8M U129 ( .AN(n167), .B(n6), .Y(n22) );
  OAI2BB2X2M U130 ( .B0(n242), .B1(n231), .A0N(\MEM[14][3] ), .A1N(n231), .Y(
        n49) );
  OAI2BB2X2M U131 ( .B0(n238), .B1(n35), .A0N(\MEM[1][7] ), .A1N(n35), .Y(n157) );
  AO2B2X2M U132 ( .B0(\MEM[1][3] ), .B1(n35), .A0(W_Data[3]), .A1N(n35), .Y(
        n153) );
  AO2B2X2M U133 ( .B0(\MEM[1][2] ), .B1(n35), .A0(W_Data[2]), .A1N(n35), .Y(
        n152) );
  AO2B2X2M U134 ( .B0(\MEM[1][1] ), .B1(n35), .A0(W_Data[1]), .A1N(n35), .Y(
        n151) );
  AO2B2X2M U135 ( .B0(\MEM[1][5] ), .B1(n35), .A0(W_Data[5]), .A1N(n35), .Y(
        n155) );
  AO2B2X2M U136 ( .B0(\MEM[1][4] ), .B1(n35), .A0(W_Data[4]), .A1N(n35), .Y(
        n154) );
  AO2B2X2M U137 ( .B0(\MEM[1][6] ), .B1(n35), .A0(W_Data[6]), .A1N(n35), .Y(
        n156) );
  OAI2BB2X2M U138 ( .B0(n171), .B1(n170), .A0N(n170), .A1N(W_Data[1]), .Y(n39)
         );
  NAND2X12M U139 ( .A(n36), .B(n235), .Y(n187) );
  OAI2BB2X2M U140 ( .B0(n241), .B1(n221), .A0N(\MEM[0][4] ), .A1N(n222), .Y(
        n162) );
  AO2B2X2M U141 ( .B0(\MEM[0][6] ), .B1(n222), .A0(W_Data[6]), .A1N(n221), .Y(
        n164) );
  AND2X12M U142 ( .A(n36), .B(W_Addr[0]), .Y(n28) );
  AO2B2X2M U143 ( .B0(\MEM[0][3] ), .B1(n222), .A0(W_Data[3]), .A1N(n221), .Y(
        n161) );
  AO2B2X2M U144 ( .B0(\MEM[0][7] ), .B1(n222), .A0(W_Data[7]), .A1N(n221), .Y(
        n165) );
  AO2B2X2M U145 ( .B0(\MEM[0][2] ), .B1(n222), .A0(W_Data[2]), .A1N(n221), .Y(
        n160) );
  INVX32M U146 ( .A(n172), .Y(n34) );
  OAI2B2X2M U147 ( .A1N(n34), .A0(n173), .B0(n241), .B1(n34), .Y(n146) );
  OAI2BB2X4M U148 ( .B0(n175), .B1(n174), .A0N(W_Data[3]), .A1N(n174), .Y(n121) );
  OAI2BB2X4M U149 ( .B0(n177), .B1(n176), .A0N(W_Data[4]), .A1N(n176), .Y(n138) );
  AO2B2X2M U150 ( .B0(\MEM[5][0] ), .B1(n31), .A0(W_Data[0]), .A1N(n31), .Y(
        n118) );
  AO2B2X2M U151 ( .B0(\MEM[3][6] ), .B1(n223), .A0(W_Data[6]), .A1N(n223), .Y(
        n140) );
  AO2B2X2M U152 ( .B0(\MEM[5][7] ), .B1(n31), .A0(W_Data[7]), .A1N(n31), .Y(
        n125) );
  AO2B2X2M U153 ( .B0(\MEM[3][5] ), .B1(n223), .A0(W_Data[5]), .A1N(n223), .Y(
        n139) );
  AO2B2X2M U154 ( .B0(\MEM[5][2] ), .B1(n31), .A0(W_Data[2]), .A1N(n31), .Y(
        n120) );
  AO2B2X2M U155 ( .B0(\MEM[3][7] ), .B1(n223), .A0(W_Data[7]), .A1N(n223), .Y(
        n141) );
  OAI2B2X2M U156 ( .A1N(n34), .A0(n178), .B0(n238), .B1(n34), .Y(n149) );
  AO2B2X2M U157 ( .B0(\MEM[5][4] ), .B1(n31), .A0(W_Data[4]), .A1N(n31), .Y(
        n122) );
  AO2B2X2M U158 ( .B0(\MEM[3][3] ), .B1(n223), .A0(W_Data[3]), .A1N(n223), .Y(
        n137) );
  AO2B2X2M U159 ( .B0(\MEM[3][2] ), .B1(n223), .A0(W_Data[2]), .A1N(n223), .Y(
        n136) );
  AO2B2X2M U160 ( .B0(\MEM[5][5] ), .B1(n31), .A0(W_Data[5]), .A1N(n31), .Y(
        n123) );
  AO2B2X2M U161 ( .B0(\MEM[3][1] ), .B1(n223), .A0(W_Data[1]), .A1N(n223), .Y(
        n135) );
  AO2B2X2M U162 ( .B0(\MEM[5][1] ), .B1(n31), .A0(W_Data[1]), .A1N(n31), .Y(
        n119) );
  AO2B2X2M U163 ( .B0(\MEM[5][6] ), .B1(n31), .A0(W_Data[6]), .A1N(n31), .Y(
        n124) );
  NAND2X6M U164 ( .A(n28), .B(n13), .Y(n27) );
  NAND2X4M U165 ( .A(n30), .B(n13), .Y(n29) );
  NAND2X3M U166 ( .A(n6), .B(n13), .Y(n15) );
  NAND2X4M U167 ( .A(n30), .B(n18), .Y(n32) );
  OAI2BB2X2M U168 ( .B0(n240), .B1(n221), .A0N(\MEM[0][5] ), .A1N(n222), .Y(
        n163) );
  OAI2BB2X2M U169 ( .B0(n245), .B1(n222), .A0N(\MEM[0][0] ), .A1N(n222), .Y(
        n158) );
  OAI2BB2X2M U170 ( .B0(n232), .B1(n238), .A0N(\MEM[15][7] ), .A1N(n233), .Y(
        n45) );
  OAI2BB2X2M U171 ( .B0(n232), .B1(n240), .A0N(\MEM[15][5] ), .A1N(n233), .Y(
        n43) );
  OAI2BB2X2M U172 ( .B0(n245), .B1(n35), .A0N(\MEM[1][0] ), .A1N(n35), .Y(n150) );
  OAI2BB2X2M U173 ( .B0(n244), .B1(n221), .A0N(\MEM[0][1] ), .A1N(n222), .Y(
        n159) );
  MX4XLM U174 ( .A(\MEM[4][2] ), .B(\MEM[5][2] ), .C(\MEM[6][2] ), .D(
        \MEM[7][2] ), .S0(N10), .S1(n234), .Y(n198) );
  MX4XLM U175 ( .A(\MEM[0][2] ), .B(\MEM[1][2] ), .C(\MEM[2][2] ), .D(
        \MEM[3][2] ), .S0(N10), .S1(n234), .Y(n199) );
  MX4XLM U176 ( .A(\MEM[8][3] ), .B(\MEM[9][3] ), .C(\MEM[10][3] ), .D(
        \MEM[11][3] ), .S0(N10), .S1(n234), .Y(n201) );
  MX4XLM U177 ( .A(\MEM[0][3] ), .B(\MEM[1][3] ), .C(\MEM[2][3] ), .D(
        \MEM[3][3] ), .S0(N10), .S1(n234), .Y(n203) );
  MX4XLM U178 ( .A(\MEM[0][1] ), .B(\MEM[1][1] ), .C(\MEM[2][1] ), .D(
        \MEM[3][1] ), .S0(N10), .S1(n234), .Y(n195) );
  MX4XLM U179 ( .A(\MEM[8][1] ), .B(\MEM[9][1] ), .C(\MEM[10][1] ), .D(
        \MEM[11][1] ), .S0(N10), .S1(n234), .Y(n193) );
  MX4XLM U180 ( .A(\MEM[8][0] ), .B(\MEM[9][0] ), .C(\MEM[10][0] ), .D(
        \MEM[11][0] ), .S0(N10), .S1(N11), .Y(n189) );
  MX4XLM U181 ( .A(\MEM[0][0] ), .B(\MEM[1][0] ), .C(\MEM[2][0] ), .D(
        \MEM[3][0] ), .S0(N10), .S1(N11), .Y(n191) );
  MX4XLM U182 ( .A(\MEM[12][0] ), .B(\MEM[13][0] ), .C(\MEM[14][0] ), .D(
        \MEM[15][0] ), .S0(N10), .S1(N11), .Y(n188) );
  MX4XLM U183 ( .A(\MEM[4][0] ), .B(\MEM[5][0] ), .C(\MEM[6][0] ), .D(
        \MEM[7][0] ), .S0(N10), .S1(N11), .Y(n190) );
  MX4XLM U184 ( .A(\MEM[12][2] ), .B(\MEM[13][2] ), .C(\MEM[14][2] ), .D(
        \MEM[15][2] ), .S0(N10), .S1(n234), .Y(n196) );
  MX4XLM U185 ( .A(\MEM[12][3] ), .B(\MEM[13][3] ), .C(\MEM[14][3] ), .D(
        \MEM[15][3] ), .S0(N10), .S1(n234), .Y(n200) );
  MX4XLM U186 ( .A(\MEM[4][3] ), .B(\MEM[5][3] ), .C(\MEM[6][3] ), .D(
        \MEM[7][3] ), .S0(N10), .S1(n234), .Y(n202) );
  MX4XLM U187 ( .A(\MEM[8][2] ), .B(\MEM[9][2] ), .C(\MEM[10][2] ), .D(
        \MEM[11][2] ), .S0(N10), .S1(n234), .Y(n197) );
  NOR2X4M U188 ( .A(n236), .B(W_Addr[2]), .Y(n21) );
  MX4X1M U189 ( .A(\MEM[0][6] ), .B(\MEM[1][6] ), .C(\MEM[2][6] ), .D(
        \MEM[3][6] ), .S0(n220), .S1(N11), .Y(n215) );
  MX4X1M U190 ( .A(\MEM[4][6] ), .B(\MEM[5][6] ), .C(\MEM[6][6] ), .D(
        \MEM[7][6] ), .S0(n220), .S1(N11), .Y(n214) );
  OAI2BB2X1M U191 ( .B0(n245), .B1(n230), .A0N(\MEM[13][0] ), .A1N(n230), .Y(
        n54) );
  OAI2BB2X1M U192 ( .B0(n244), .B1(n230), .A0N(\MEM[13][1] ), .A1N(n230), .Y(
        n55) );
  OAI2BB2X1M U193 ( .B0(n243), .B1(n230), .A0N(\MEM[13][2] ), .A1N(n230), .Y(
        n56) );
  OAI2BB2X1M U194 ( .B0(n242), .B1(n230), .A0N(\MEM[13][3] ), .A1N(n230), .Y(
        n57) );
  OAI2BB2X1M U195 ( .B0(n241), .B1(n230), .A0N(\MEM[13][4] ), .A1N(n230), .Y(
        n58) );
  OAI2BB2X1M U196 ( .B0(n240), .B1(n230), .A0N(\MEM[13][5] ), .A1N(n230), .Y(
        n59) );
  OAI2BB2X1M U197 ( .B0(n239), .B1(n230), .A0N(\MEM[13][6] ), .A1N(n230), .Y(
        n60) );
  OAI2BB2X1M U198 ( .B0(n238), .B1(n230), .A0N(\MEM[13][7] ), .A1N(n230), .Y(
        n61) );
  OAI2BB2X1M U199 ( .B0(n243), .B1(n228), .A0N(\MEM[10][2] ), .A1N(n228), .Y(
        n80) );
  OAI2BB2X1M U200 ( .B0(n242), .B1(n228), .A0N(\MEM[10][3] ), .A1N(n228), .Y(
        n81) );
  OAI2BB2X1M U201 ( .B0(n239), .B1(n228), .A0N(\MEM[10][6] ), .A1N(n228), .Y(
        n84) );
  OAI2BB2X1M U202 ( .B0(n244), .B1(n227), .A0N(\MEM[9][1] ), .A1N(n5), .Y(n87)
         );
  OAI2BB2X1M U203 ( .B0(n243), .B1(n227), .A0N(\MEM[9][2] ), .A1N(n5), .Y(n88)
         );
  OAI2BB2X1M U204 ( .B0(n242), .B1(n5), .A0N(\MEM[9][3] ), .A1N(n5), .Y(n89)
         );
  OAI2BB2X1M U205 ( .B0(n239), .B1(n227), .A0N(\MEM[9][6] ), .A1N(n5), .Y(n92)
         );
  OAI2BB2X1M U206 ( .B0(n245), .B1(n182), .A0N(\MEM[8][0] ), .A1N(n182), .Y(
        n94) );
  OAI2BB2X1M U207 ( .B0(n244), .B1(n182), .A0N(\MEM[8][1] ), .A1N(n182), .Y(
        n95) );
  OAI2BB2X1M U208 ( .B0(n243), .B1(n182), .A0N(\MEM[8][2] ), .A1N(n182), .Y(
        n96) );
  OAI2BB2X1M U209 ( .B0(n242), .B1(n182), .A0N(\MEM[8][3] ), .A1N(n182), .Y(
        n97) );
  OAI2BB2X1M U210 ( .B0(n241), .B1(n26), .A0N(\MEM[8][4] ), .A1N(n182), .Y(n98) );
  OAI2BB2X1M U211 ( .B0(n240), .B1(n182), .A0N(\MEM[8][5] ), .A1N(n182), .Y(
        n99) );
  OAI2BB2X1M U212 ( .B0(n238), .B1(n182), .A0N(\MEM[8][7] ), .A1N(n182), .Y(
        n101) );
  OAI2BB2X1M U213 ( .B0(n245), .B1(n226), .A0N(\MEM[7][0] ), .A1N(n226), .Y(
        n102) );
  OAI2BB2X1M U214 ( .B0(n244), .B1(n226), .A0N(\MEM[7][1] ), .A1N(n226), .Y(
        n103) );
  OAI2BB2X1M U215 ( .B0(n243), .B1(n226), .A0N(\MEM[7][2] ), .A1N(n226), .Y(
        n104) );
  OAI2BB2X1M U216 ( .B0(n242), .B1(n226), .A0N(\MEM[7][3] ), .A1N(n226), .Y(
        n105) );
  OAI2BB2X1M U217 ( .B0(n241), .B1(n226), .A0N(\MEM[7][4] ), .A1N(n226), .Y(
        n106) );
  OAI2BB2X1M U218 ( .B0(n240), .B1(n226), .A0N(\MEM[7][5] ), .A1N(n226), .Y(
        n107) );
  OAI2BB2X1M U219 ( .B0(n239), .B1(n226), .A0N(\MEM[7][6] ), .A1N(n226), .Y(
        n108) );
  OAI2BB2X1M U220 ( .B0(n238), .B1(n226), .A0N(\MEM[7][7] ), .A1N(n226), .Y(
        n109) );
  OAI2BB2X1M U221 ( .B0(n245), .B1(n225), .A0N(\MEM[6][0] ), .A1N(n225), .Y(
        n110) );
  OAI2BB2X1M U222 ( .B0(n244), .B1(n225), .A0N(\MEM[6][1] ), .A1N(n225), .Y(
        n111) );
  OAI2BB2X1M U223 ( .B0(n243), .B1(n225), .A0N(\MEM[6][2] ), .A1N(n225), .Y(
        n112) );
  OAI2BB2X1M U224 ( .B0(n242), .B1(n225), .A0N(\MEM[6][3] ), .A1N(n225), .Y(
        n113) );
  OAI2BB2X1M U225 ( .B0(n241), .B1(n225), .A0N(\MEM[6][4] ), .A1N(n225), .Y(
        n114) );
  OAI2BB2X1M U226 ( .B0(n240), .B1(n225), .A0N(\MEM[6][5] ), .A1N(n225), .Y(
        n115) );
  OAI2BB2X1M U227 ( .B0(n239), .B1(n225), .A0N(\MEM[6][6] ), .A1N(n225), .Y(
        n116) );
  OAI2BB2X1M U228 ( .B0(n238), .B1(n225), .A0N(\MEM[6][7] ), .A1N(n225), .Y(
        n117) );
  OAI2BB2X1M U229 ( .B0(n245), .B1(n224), .A0N(\MEM[4][0] ), .A1N(n224), .Y(
        n126) );
  OAI2BB2X1M U230 ( .B0(n244), .B1(n224), .A0N(\MEM[4][1] ), .A1N(n224), .Y(
        n127) );
  OAI2BB2X1M U231 ( .B0(n243), .B1(n224), .A0N(\MEM[4][2] ), .A1N(n224), .Y(
        n128) );
  OAI2BB2X1M U232 ( .B0(n242), .B1(n224), .A0N(\MEM[4][3] ), .A1N(n224), .Y(
        n129) );
  OAI2BB2X1M U233 ( .B0(n241), .B1(n224), .A0N(\MEM[4][4] ), .A1N(n224), .Y(
        n130) );
  OAI2BB2X1M U234 ( .B0(n240), .B1(n224), .A0N(\MEM[4][5] ), .A1N(n224), .Y(
        n131) );
  OAI2BB2X1M U235 ( .B0(n239), .B1(n224), .A0N(\MEM[4][6] ), .A1N(n224), .Y(
        n132) );
  OAI2BB2X1M U236 ( .B0(n238), .B1(n224), .A0N(\MEM[4][7] ), .A1N(n224), .Y(
        n133) );
  MX4X1M U237 ( .A(\MEM[8][6] ), .B(\MEM[9][6] ), .C(\MEM[10][6] ), .D(
        \MEM[11][6] ), .S0(n220), .S1(N11), .Y(n213) );
  MX4X1M U238 ( .A(\MEM[12][1] ), .B(\MEM[13][1] ), .C(\MEM[14][1] ), .D(
        \MEM[15][1] ), .S0(N10), .S1(N11), .Y(n192) );
  MX4X1M U239 ( .A(\MEM[4][1] ), .B(\MEM[5][1] ), .C(\MEM[6][1] ), .D(
        \MEM[7][1] ), .S0(N10), .S1(n234), .Y(n194) );
  MX4X1M U240 ( .A(n207), .B(n205), .C(n206), .D(n204), .S0(N13), .S1(N12), 
        .Y(R_Data[4]) );
  MX4X1M U241 ( .A(\MEM[0][4] ), .B(\MEM[1][4] ), .C(\MEM[2][4] ), .D(
        \MEM[3][4] ), .S0(N10), .S1(n234), .Y(n207) );
  MX4X1M U242 ( .A(\MEM[4][4] ), .B(\MEM[5][4] ), .C(\MEM[6][4] ), .D(
        \MEM[7][4] ), .S0(N10), .S1(n234), .Y(n206) );
  MX4X1M U243 ( .A(\MEM[12][4] ), .B(\MEM[13][4] ), .C(\MEM[14][4] ), .D(
        \MEM[15][4] ), .S0(N10), .S1(n234), .Y(n204) );
  MX4X1M U244 ( .A(\MEM[8][4] ), .B(\MEM[9][4] ), .C(\MEM[10][4] ), .D(
        \MEM[11][4] ), .S0(N10), .S1(n234), .Y(n205) );
  INVX2M U245 ( .A(W_Addr[2]), .Y(n237) );
  INVX2M U246 ( .A(W_Addr[1]), .Y(n236) );
  INVX2M U247 ( .A(W_Addr[0]), .Y(n235) );
  MX4X1M U248 ( .A(\MEM[12][7] ), .B(\MEM[13][7] ), .C(\MEM[14][7] ), .D(
        \MEM[15][7] ), .S0(n220), .S1(N11), .Y(n216) );
  MX4X1M U249 ( .A(\MEM[4][7] ), .B(\MEM[5][7] ), .C(\MEM[6][7] ), .D(
        \MEM[7][7] ), .S0(n220), .S1(N11), .Y(n218) );
  MX4X1M U250 ( .A(\MEM[8][7] ), .B(\MEM[9][7] ), .C(\MEM[10][7] ), .D(
        \MEM[11][7] ), .S0(n220), .S1(N11), .Y(n217) );
  MX4X1M U251 ( .A(\MEM[0][7] ), .B(\MEM[1][7] ), .C(\MEM[2][7] ), .D(
        \MEM[3][7] ), .S0(n220), .S1(N11), .Y(n219) );
  MX4XLM U252 ( .A(n195), .B(n193), .C(n194), .D(n192), .S0(N13), .S1(N12), 
        .Y(R_Data[1]) );
  MX4X1M U253 ( .A(n211), .B(n209), .C(n210), .D(n208), .S0(N13), .S1(N12), 
        .Y(R_Data[5]) );
  MX4X1M U254 ( .A(n191), .B(n189), .C(n190), .D(n188), .S0(N13), .S1(N12), 
        .Y(R_Data[0]) );
endmodule


module Sync_R2W ( W_CLK, W_rst_n, R_ptr, Wq2_rptr );
  input [4:0] R_ptr;
  output [4:0] Wq2_rptr;
  input W_CLK, W_rst_n;

  wire   [4:0] Wq1_rptr;

  DFFRQX2M \Wq2_rptr_reg[1]  ( .D(Wq1_rptr[1]), .CK(W_CLK), .RN(W_rst_n), .Q(
        Wq2_rptr[1]) );
  DFFRQX2M \Wq2_rptr_reg[0]  ( .D(Wq1_rptr[0]), .CK(W_CLK), .RN(W_rst_n), .Q(
        Wq2_rptr[0]) );
  DFFRQX2M \Wq2_rptr_reg[4]  ( .D(Wq1_rptr[4]), .CK(W_CLK), .RN(W_rst_n), .Q(
        Wq2_rptr[4]) );
  DFFRQX2M \Wq2_rptr_reg[2]  ( .D(Wq1_rptr[2]), .CK(W_CLK), .RN(W_rst_n), .Q(
        Wq2_rptr[2]) );
  DFFRQX2M \Wq2_rptr_reg[3]  ( .D(Wq1_rptr[3]), .CK(W_CLK), .RN(W_rst_n), .Q(
        Wq2_rptr[3]) );
  DFFRQX2M \Wq1_rptr_reg[4]  ( .D(R_ptr[4]), .CK(W_CLK), .RN(W_rst_n), .Q(
        Wq1_rptr[4]) );
  DFFRQX2M \Wq1_rptr_reg[3]  ( .D(R_ptr[3]), .CK(W_CLK), .RN(W_rst_n), .Q(
        Wq1_rptr[3]) );
  DFFRQX2M \Wq1_rptr_reg[2]  ( .D(R_ptr[2]), .CK(W_CLK), .RN(W_rst_n), .Q(
        Wq1_rptr[2]) );
  DFFRQX2M \Wq1_rptr_reg[1]  ( .D(R_ptr[1]), .CK(W_CLK), .RN(W_rst_n), .Q(
        Wq1_rptr[1]) );
  DFFRQX2M \Wq1_rptr_reg[0]  ( .D(R_ptr[0]), .CK(W_CLK), .RN(W_rst_n), .Q(
        Wq1_rptr[0]) );
endmodule


module Sync_W2R ( R_CLK, R_rst_n, W_ptr, Rq2_wptr );
  input [4:0] W_ptr;
  output [4:0] Rq2_wptr;
  input R_CLK, R_rst_n;

  wire   [4:0] Rq1_wptr;

  DFFRQX2M \Rq2_wptr_reg[2]  ( .D(Rq1_wptr[2]), .CK(R_CLK), .RN(R_rst_n), .Q(
        Rq2_wptr[2]) );
  DFFRQX2M \Rq2_wptr_reg[4]  ( .D(Rq1_wptr[4]), .CK(R_CLK), .RN(R_rst_n), .Q(
        Rq2_wptr[4]) );
  DFFRQX2M \Rq2_wptr_reg[3]  ( .D(Rq1_wptr[3]), .CK(R_CLK), .RN(R_rst_n), .Q(
        Rq2_wptr[3]) );
  DFFRQX2M \Rq2_wptr_reg[1]  ( .D(Rq1_wptr[1]), .CK(R_CLK), .RN(R_rst_n), .Q(
        Rq2_wptr[1]) );
  DFFRQX2M \Rq2_wptr_reg[0]  ( .D(Rq1_wptr[0]), .CK(R_CLK), .RN(R_rst_n), .Q(
        Rq2_wptr[0]) );
  DFFRQX2M \Rq1_wptr_reg[4]  ( .D(W_ptr[4]), .CK(R_CLK), .RN(R_rst_n), .Q(
        Rq1_wptr[4]) );
  DFFRQX2M \Rq1_wptr_reg[3]  ( .D(W_ptr[3]), .CK(R_CLK), .RN(R_rst_n), .Q(
        Rq1_wptr[3]) );
  DFFRQX2M \Rq1_wptr_reg[2]  ( .D(W_ptr[2]), .CK(R_CLK), .RN(R_rst_n), .Q(
        Rq1_wptr[2]) );
  DFFRQX2M \Rq1_wptr_reg[1]  ( .D(W_ptr[1]), .CK(R_CLK), .RN(R_rst_n), .Q(
        Rq1_wptr[1]) );
  DFFRQX2M \Rq1_wptr_reg[0]  ( .D(W_ptr[0]), .CK(R_CLK), .RN(R_rst_n), .Q(
        Rq1_wptr[0]) );
endmodule


module FIFO_TOP ( W_CLK, R_CLK, W_rst_n, R_rst_n, W_inc, R_inc, W_Data, Full, 
        Empty, R_Data );
  input [7:0] W_Data;
  output [7:0] R_Data;
  input W_CLK, R_CLK, W_rst_n, R_rst_n, W_inc, R_inc;
  output Full, Empty;
  wire   n14, n15, n16, n17, n18, n19, n20, n21, _0_net_, n1, n2, n6, n12, n13
;
  wire   [4:0] Wq2_rptr;
  wire   [4:0] W_ptr;
  wire   [3:0] W_Addr;
  wire   [4:0] Rq2_wptr;
  wire   [4:0] R_ptr;
  wire   [3:0] R_Addr;

  FIFO_Write_Pointer FIFO_Write_Pointer_F1 ( .W_CLK(W_CLK), .W_rst_n(W_rst_n), 
        .W_inc(W_inc), .Wq2_rptr(Wq2_rptr), .W_Full(Full), .W_ptr(W_ptr), 
        .W_Addr(W_Addr) );
  FIFO_R_Pointer FIFO_R_Pointer_F2 ( .R_CLK(R_CLK), .R_rst_n(R_rst_n), .R_inc(
        R_inc), .Rq2_wptr(Rq2_wptr), .R_empty(Empty), .R_ptr(R_ptr), .R_Addr(
        R_Addr) );
  ASYNC_FIFO_RAM ASYNC_FIFO_RAM_F3 ( .W_CLK(W_CLK), .W_CLK_en(_0_net_), 
        .W_Data(W_Data), .W_Addr(W_Addr), .R_Addr({R_Addr[3:2], n13, n12}), 
        .R_Data({n14, n15, n16, n17, n18, n19, n20, n21}) );
  Sync_R2W Sync_R2W_F4 ( .W_CLK(W_CLK), .W_rst_n(W_rst_n), .R_ptr(R_ptr), 
        .Wq2_rptr(Wq2_rptr) );
  Sync_W2R Sync_W2R_F5 ( .R_CLK(R_CLK), .R_rst_n(R_rst_n), .W_ptr(W_ptr), 
        .Rq2_wptr(Rq2_wptr) );
  CLKBUFX32M U2 ( .A(n14), .Y(R_Data[7]) );
  CLKINVX2M U3 ( .A(n17), .Y(n6) );
  CLKBUFX32M U4 ( .A(R_Addr[1]), .Y(n13) );
  CLKBUFX32M U5 ( .A(R_Addr[0]), .Y(n12) );
  CLKINVX32M U6 ( .A(n1), .Y(_0_net_) );
  NAND2X12M U7 ( .A(W_inc), .B(n2), .Y(n1) );
  CLKINVX40M U8 ( .A(Full), .Y(n2) );
  CLKBUFX32M U9 ( .A(n15), .Y(R_Data[6]) );
  CLKINVX32M U10 ( .A(n6), .Y(R_Data[4]) );
  CLKBUFX32M U11 ( .A(n21), .Y(R_Data[0]) );
  CLKBUFX32M U12 ( .A(n19), .Y(R_Data[2]) );
  CLKBUFX32M U13 ( .A(n16), .Y(R_Data[5]) );
  CLKBUFX32M U14 ( .A(n20), .Y(R_Data[1]) );
  CLKBUFX32M U15 ( .A(n18), .Y(R_Data[3]) );
endmodule

