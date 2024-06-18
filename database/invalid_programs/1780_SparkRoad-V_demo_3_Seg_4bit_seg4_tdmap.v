// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Fri Jul 26 18:02:11 2019

`timescale 1ns / 1ps
module seg4  // sources/rtl/seg_4.v(14)
  (
  clk_24m,
  sm_bit,
  sm_seg
  );

  input clk_24m;  // sources/rtl/seg_4.v(19)
  output [3:0] sm_bit;  // sources/rtl/seg_4.v(21)
  output [7:0] sm_seg;  // sources/rtl/seg_4.v(20)

  parameter CNT_TIME = 2400000;
  // localparam S0 = 4'b0000;
  // localparam S1 = 4'b0001;
  // localparam S2 = 4'b0010;
  // localparam S3 = 4'b0011;
  // localparam S4 = 4'b0100;
  // localparam S5 = 4'b0101;
  // localparam S6 = 4'b0110;
  // localparam S7 = 4'b0111;
  // localparam S8 = 4'b1000;
  // localparam S9 = 4'b1001;
  wire [24:0] cnt;  // sources/rtl/seg_4.v(25)
  wire [17:0] cnt_w;  // sources/rtl/seg_4.v(32)
  wire [3:0] n10;
  wire [3:0] n11;
  wire [3:0] n17;
  wire [3:0] n18;
  wire [24:0] n2;
  wire [3:0] n25;
  wire [3:0] n26;
  wire [17:0] n29;
  wire [24:0] n3;
  wire [17:0] n30;
  wire [3:0] n31;
  wire [3:0] n5;
  wire [3:0] n6;
  wire [3:0] sm_bit1_num;  // sources/rtl/seg_4.v(27)
  wire [3:0] sm_bit2_num;  // sources/rtl/seg_4.v(28)
  wire [3:0] sm_bit3_num;  // sources/rtl/seg_4.v(29)
  wire [3:0] sm_bit4_num;  // sources/rtl/seg_4.v(30)
  wire [3:0] sm_seg_num;  // sources/rtl/seg_4.v(35)
  wire [7:0] sm_seg_pad;  // sources/rtl/seg_4.v(20)
  wire [3:0] \ux_rst/cnt ;  // sources/rtl/rst.v(20)
  wire [3:0] \ux_rst/n1 ;
  wire _al_u24_o;
  wire _al_u27_o;
  wire _al_u29_o;
  wire _al_u30_o;
  wire _al_u32_o;
  wire _al_u33_o;
  wire _al_u35_o;
  wire _al_u36_o;
  wire _al_u60_o;
  wire _al_u61_o;
  wire _al_u62_o;
  wire _al_u63_o;
  wire _al_u64_o;
  wire _al_u65_o;
  wire _al_u66_o;
  wire _al_u67_o;
  wire _al_u69_o;
  wire _al_u70_o;
  wire _al_u71_o;
  wire _al_u72_o;
  wire _al_u73_o;
  wire \add0/c0 ;
  wire \add0/c1 ;
  wire \add0/c10 ;
  wire \add0/c11 ;
  wire \add0/c12 ;
  wire \add0/c13 ;
  wire \add0/c14 ;
  wire \add0/c15 ;
  wire \add0/c16 ;
  wire \add0/c17 ;
  wire \add0/c18 ;
  wire \add0/c19 ;
  wire \add0/c2 ;
  wire \add0/c20 ;
  wire \add0/c21 ;
  wire \add0/c22 ;
  wire \add0/c23 ;
  wire \add0/c24 ;
  wire \add0/c3 ;
  wire \add0/c4 ;
  wire \add0/c5 ;
  wire \add0/c6 ;
  wire \add0/c7 ;
  wire \add0/c8 ;
  wire \add0/c9 ;
  wire \add1/c0 ;
  wire \add1/c1 ;
  wire \add1/c2 ;
  wire \add1/c3 ;
  wire \add2/c0 ;
  wire \add2/c1 ;
  wire \add2/c2 ;
  wire \add2/c3 ;
  wire \add3/c0 ;
  wire \add3/c1 ;
  wire \add3/c2 ;
  wire \add3/c3 ;
  wire \add4/c0 ;
  wire \add4/c1 ;
  wire \add4/c2 ;
  wire \add4/c3 ;
  wire \add5/c0 ;
  wire \add5/c1 ;
  wire \add5/c10 ;
  wire \add5/c11 ;
  wire \add5/c12 ;
  wire \add5/c13 ;
  wire \add5/c14 ;
  wire \add5/c15 ;
  wire \add5/c16 ;
  wire \add5/c17 ;
  wire \add5/c2 ;
  wire \add5/c3 ;
  wire \add5/c4 ;
  wire \add5/c5 ;
  wire \add5/c6 ;
  wire \add5/c7 ;
  wire \add5/c8 ;
  wire \add5/c9 ;
  wire clk_24m_pad;  // sources/rtl/seg_4.v(19)
  wire mux11_b0_sel_is_0_o_neg;
  wire mux11_b1_sel_is_1_o_neg;
  wire mux11_b2_sel_is_2_o_neg;
  wire mux11_b3_sel_is_3_o_neg;
  wire n1;
  wire n13_lutinv;
  wire n15;
  wire n16_lutinv;
  wire n20_lutinv;
  wire n23;
  wire n24_lutinv;
  wire n28_lutinv;
  wire n4_lutinv;
  wire n8;
  wire n9_lutinv;
  wire rst_n;  // sources/rtl/seg_4.v(24)
  wire \ux_rst/add0/c0 ;
  wire \ux_rst/add0/c1 ;
  wire \ux_rst/add0/c2 ;
  wire \ux_rst/add0/c3 ;
  wire \ux_rst/n0 ;

  EG_PHY_PAD #(
    //.LOCATION("A2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u10 (
    .do({open_n1,open_n2,open_n3,1'b1}),
    .opad(sm_seg[7]));  // sources/rtl/seg_4.v(20)
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u100 (
    .a(n1),
    .b(n2[3]),
    .o(n3[3]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u101 (
    .a(n1),
    .b(n2[24]),
    .o(n3[24]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u102 (
    .a(n1),
    .b(n2[23]),
    .o(n3[23]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u103 (
    .a(n1),
    .b(n2[22]),
    .o(n3[22]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u104 (
    .a(n1),
    .b(n2[21]),
    .o(n3[21]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u105 (
    .a(n1),
    .b(n2[20]),
    .o(n3[20]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u106 (
    .a(n1),
    .b(n2[2]),
    .o(n3[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u107 (
    .a(n1),
    .b(n2[19]),
    .o(n3[19]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u108 (
    .a(n1),
    .b(n2[18]),
    .o(n3[18]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u109 (
    .a(n1),
    .b(n2[17]),
    .o(n3[17]));
  EG_PHY_PAD #(
    //.LOCATION("B2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u11 (
    .do({open_n18,open_n19,open_n20,sm_seg_pad[6]}),
    .opad(sm_seg[6]));  // sources/rtl/seg_4.v(20)
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u110 (
    .a(n1),
    .b(n2[16]),
    .o(n3[16]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u111 (
    .a(n1),
    .b(n2[15]),
    .o(n3[15]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u112 (
    .a(n1),
    .b(n2[14]),
    .o(n3[14]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u113 (
    .a(n1),
    .b(n2[13]),
    .o(n3[13]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u114 (
    .a(n1),
    .b(n2[12]),
    .o(n3[12]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u115 (
    .a(n1),
    .b(n2[11]),
    .o(n3[11]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u116 (
    .a(n1),
    .b(n2[10]),
    .o(n3[10]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u117 (
    .a(n1),
    .b(n2[1]),
    .o(n3[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u118 (
    .a(n1),
    .b(n2[0]),
    .o(n3[0]));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u119 (
    .a(sm_bit2_num[0]),
    .b(sm_bit2_num[1]),
    .c(sm_bit2_num[2]),
    .d(sm_bit2_num[3]),
    .o(n13_lutinv));
  EG_PHY_PAD #(
    //.LOCATION("D3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u12 (
    .do({open_n35,open_n36,open_n37,sm_seg_pad[5]}),
    .opad(sm_seg[5]));  // sources/rtl/seg_4.v(20)
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u120 (
    .a(n1),
    .b(n4_lutinv),
    .c(n13_lutinv),
    .o(n15));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u121 (
    .a(sm_bit3_num[0]),
    .b(sm_bit3_num[1]),
    .c(sm_bit3_num[2]),
    .d(sm_bit3_num[3]),
    .o(n20_lutinv));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u122 (
    .a(n1),
    .b(n4_lutinv),
    .c(n13_lutinv),
    .d(n20_lutinv),
    .o(n23));
  EG_PHY_PAD #(
    //.LOCATION("F5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u13 (
    .do({open_n52,open_n53,open_n54,sm_seg_pad[4]}),
    .opad(sm_seg[4]));  // sources/rtl/seg_4.v(20)
  EG_PHY_PAD #(
    //.LOCATION("E4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u14 (
    .do({open_n69,open_n70,open_n71,sm_seg_pad[3]}),
    .opad(sm_seg[3]));  // sources/rtl/seg_4.v(20)
  EG_PHY_PAD #(
    //.LOCATION("F4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u15 (
    .do({open_n86,open_n87,open_n88,sm_seg_pad[2]}),
    .opad(sm_seg[2]));  // sources/rtl/seg_4.v(20)
  EG_PHY_PAD #(
    //.LOCATION("B3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u16 (
    .do({open_n103,open_n104,open_n105,sm_seg_pad[1]}),
    .opad(sm_seg[1]));  // sources/rtl/seg_4.v(20)
  EG_PHY_PAD #(
    //.LOCATION("E3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u17 (
    .do({open_n120,open_n121,open_n122,sm_seg_pad[0]}),
    .opad(sm_seg[0]));  // sources/rtl/seg_4.v(20)
  AL_MAP_LUT2 #(
    .EQN("~(B*A)"),
    .INIT(4'h7))
    _al_u22 (
    .a(cnt_w[16]),
    .b(cnt_w[17]),
    .o(mux11_b3_sel_is_3_o_neg));
  AL_MAP_LUT2 #(
    .EQN("~(B*~A)"),
    .INIT(4'hb))
    _al_u23 (
    .a(cnt_w[16]),
    .b(cnt_w[17]),
    .o(mux11_b2_sel_is_2_o_neg));
  AL_MAP_LUT4 #(
    .EQN("~(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h35ff))
    _al_u24 (
    .a(sm_bit3_num[3]),
    .b(sm_bit4_num[3]),
    .c(cnt_w[16]),
    .d(cnt_w[17]),
    .o(_al_u24_o));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u25 (
    .a(cnt_w[16]),
    .b(cnt_w[17]),
    .o(mux11_b0_sel_is_0_o_neg));
  AL_MAP_LUT2 #(
    .EQN("~(~B*A)"),
    .INIT(4'hd))
    _al_u26 (
    .a(cnt_w[16]),
    .b(cnt_w[17]),
    .o(mux11_b1_sel_is_1_o_neg));
  AL_MAP_LUT4 #(
    .EQN("~(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hff35))
    _al_u27 (
    .a(sm_bit1_num[3]),
    .b(sm_bit2_num[3]),
    .c(cnt_w[16]),
    .d(cnt_w[17]),
    .o(_al_u27_o));
  AL_MAP_LUT2 #(
    .EQN("~(B*A)"),
    .INIT(4'h7))
    _al_u28 (
    .a(_al_u24_o),
    .b(_al_u27_o),
    .o(n31[3]));
  AL_MAP_LUT4 #(
    .EQN("~(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h35ff))
    _al_u29 (
    .a(sm_bit3_num[2]),
    .b(sm_bit4_num[2]),
    .c(cnt_w[16]),
    .d(cnt_w[17]),
    .o(_al_u29_o));
  AL_MAP_LUT4 #(
    .EQN("~(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hff35))
    _al_u30 (
    .a(sm_bit1_num[2]),
    .b(sm_bit2_num[2]),
    .c(cnt_w[16]),
    .d(cnt_w[17]),
    .o(_al_u30_o));
  AL_MAP_LUT2 #(
    .EQN("~(B*A)"),
    .INIT(4'h7))
    _al_u31 (
    .a(_al_u29_o),
    .b(_al_u30_o),
    .o(n31[2]));
  AL_MAP_LUT4 #(
    .EQN("~(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h35ff))
    _al_u32 (
    .a(sm_bit3_num[1]),
    .b(sm_bit4_num[1]),
    .c(cnt_w[16]),
    .d(cnt_w[17]),
    .o(_al_u32_o));
  AL_MAP_LUT4 #(
    .EQN("~(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hff35))
    _al_u33 (
    .a(sm_bit1_num[1]),
    .b(sm_bit2_num[1]),
    .c(cnt_w[16]),
    .d(cnt_w[17]),
    .o(_al_u33_o));
  AL_MAP_LUT2 #(
    .EQN("~(B*A)"),
    .INIT(4'h7))
    _al_u34 (
    .a(_al_u32_o),
    .b(_al_u33_o),
    .o(n31[1]));
  AL_MAP_LUT4 #(
    .EQN("~(C*(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .INIT(16'h3f5f))
    _al_u35 (
    .a(sm_bit2_num[0]),
    .b(sm_bit4_num[0]),
    .c(cnt_w[16]),
    .d(cnt_w[17]),
    .o(_al_u35_o));
  AL_MAP_LUT4 #(
    .EQN("~(~C*(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .INIT(16'hf3f5))
    _al_u36 (
    .a(sm_bit1_num[0]),
    .b(sm_bit3_num[0]),
    .c(cnt_w[16]),
    .d(cnt_w[17]),
    .o(_al_u36_o));
  AL_MAP_LUT2 #(
    .EQN("~(B*A)"),
    .INIT(4'h7))
    _al_u37 (
    .a(_al_u35_o),
    .b(_al_u36_o),
    .o(n31[0]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*~A)"),
    .INIT(16'h0004))
    _al_u38 (
    .a(sm_seg_num[0]),
    .b(sm_seg_num[1]),
    .c(sm_seg_num[2]),
    .d(sm_seg_num[3]),
    .o(sm_seg_pad[2]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u39 (
    .a(\ux_rst/cnt [0]),
    .b(\ux_rst/cnt [1]),
    .c(\ux_rst/cnt [2]),
    .d(\ux_rst/cnt [3]),
    .o(\ux_rst/n0 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u40 (
    .a(sm_bit1_num[0]),
    .b(sm_bit1_num[1]),
    .c(sm_bit1_num[2]),
    .d(sm_bit1_num[3]),
    .o(n4_lutinv));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u41 (
    .a(n4_lutinv),
    .b(n5[3]),
    .o(n6[3]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u42 (
    .a(n4_lutinv),
    .b(n5[2]),
    .o(n6[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u43 (
    .a(n4_lutinv),
    .b(n5[1]),
    .o(n6[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u44 (
    .a(n4_lutinv),
    .b(n5[0]),
    .o(n6[0]));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*~A)"),
    .INIT(16'h0400))
    _al_u45 (
    .a(sm_bit2_num[0]),
    .b(sm_bit2_num[1]),
    .c(sm_bit2_num[2]),
    .d(sm_bit2_num[3]),
    .o(n9_lutinv));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u46 (
    .a(n9_lutinv),
    .b(n10[3]),
    .o(n11[3]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u47 (
    .a(n9_lutinv),
    .b(n10[2]),
    .o(n11[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u48 (
    .a(n9_lutinv),
    .b(n10[1]),
    .o(n11[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u49 (
    .a(n9_lutinv),
    .b(n10[0]),
    .o(n11[0]));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*~A)"),
    .INIT(16'h0400))
    _al_u50 (
    .a(sm_bit3_num[0]),
    .b(sm_bit3_num[1]),
    .c(sm_bit3_num[2]),
    .d(sm_bit3_num[3]),
    .o(n16_lutinv));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u51 (
    .a(n16_lutinv),
    .b(n17[3]),
    .o(n18[3]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u52 (
    .a(n16_lutinv),
    .b(n17[2]),
    .o(n18[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u53 (
    .a(n16_lutinv),
    .b(n17[1]),
    .o(n18[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u54 (
    .a(n16_lutinv),
    .b(n17[0]),
    .o(n18[0]));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*~A)"),
    .INIT(16'h0400))
    _al_u55 (
    .a(sm_bit4_num[0]),
    .b(sm_bit4_num[1]),
    .c(sm_bit4_num[2]),
    .d(sm_bit4_num[3]),
    .o(n24_lutinv));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u56 (
    .a(n24_lutinv),
    .b(n25[3]),
    .o(n26[3]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u57 (
    .a(n24_lutinv),
    .b(n25[2]),
    .o(n26[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u58 (
    .a(n24_lutinv),
    .b(n25[1]),
    .o(n26[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u59 (
    .a(n24_lutinv),
    .b(n25[0]),
    .o(n26[0]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*~A)"),
    .INIT(8'h40))
    _al_u60 (
    .a(cnt[7]),
    .b(cnt[8]),
    .c(cnt[9]),
    .o(_al_u60_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u61 (
    .a(cnt[3]),
    .b(cnt[4]),
    .c(cnt[5]),
    .d(cnt[6]),
    .o(_al_u61_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u62 (
    .a(cnt[21]),
    .b(cnt[22]),
    .c(cnt[23]),
    .d(cnt[24]),
    .o(_al_u62_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u63 (
    .a(cnt[0]),
    .b(cnt[1]),
    .o(_al_u63_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u64 (
    .a(cnt[10]),
    .b(cnt[11]),
    .c(cnt[12]),
    .d(cnt[13]),
    .o(_al_u64_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u65 (
    .a(cnt[18]),
    .b(cnt[19]),
    .c(cnt[2]),
    .d(cnt[20]),
    .o(_al_u65_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*~A)"),
    .INIT(16'h0004))
    _al_u66 (
    .a(cnt[14]),
    .b(cnt[15]),
    .c(cnt[16]),
    .d(cnt[17]),
    .o(_al_u66_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u67 (
    .a(_al_u63_o),
    .b(_al_u64_o),
    .c(_al_u65_o),
    .d(_al_u66_o),
    .o(_al_u67_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u68 (
    .a(_al_u67_o),
    .b(_al_u60_o),
    .c(_al_u61_o),
    .d(_al_u62_o),
    .o(n1));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u69 (
    .a(cnt_w[0]),
    .b(cnt_w[1]),
    .c(cnt_w[10]),
    .d(cnt_w[11]),
    .o(_al_u69_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u70 (
    .a(cnt_w[6]),
    .b(cnt_w[7]),
    .c(cnt_w[8]),
    .d(cnt_w[9]),
    .o(_al_u70_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u71 (
    .a(cnt_w[2]),
    .b(cnt_w[3]),
    .c(cnt_w[4]),
    .d(cnt_w[5]),
    .o(_al_u71_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u72 (
    .a(cnt_w[12]),
    .b(cnt_w[13]),
    .c(cnt_w[14]),
    .d(cnt_w[15]),
    .o(_al_u72_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u73 (
    .a(_al_u70_o),
    .b(_al_u71_o),
    .c(_al_u72_o),
    .o(_al_u73_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u74 (
    .a(_al_u73_o),
    .b(mux11_b3_sel_is_3_o_neg),
    .c(_al_u69_o),
    .o(n28_lutinv));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u75 (
    .a(n28_lutinv),
    .b(n29[9]),
    .o(n30[9]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u76 (
    .a(n28_lutinv),
    .b(n29[8]),
    .o(n30[8]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u77 (
    .a(n28_lutinv),
    .b(n29[7]),
    .o(n30[7]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u78 (
    .a(n28_lutinv),
    .b(n29[6]),
    .o(n30[6]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u79 (
    .a(n28_lutinv),
    .b(n29[5]),
    .o(n30[5]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u80 (
    .a(n28_lutinv),
    .b(n29[4]),
    .o(n30[4]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u81 (
    .a(n28_lutinv),
    .b(n29[3]),
    .o(n30[3]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u82 (
    .a(n28_lutinv),
    .b(n29[2]),
    .o(n30[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u83 (
    .a(n28_lutinv),
    .b(n29[17]),
    .o(n30[17]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u84 (
    .a(n28_lutinv),
    .b(n29[16]),
    .o(n30[16]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u85 (
    .a(n28_lutinv),
    .b(n29[15]),
    .o(n30[15]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u86 (
    .a(n28_lutinv),
    .b(n29[14]),
    .o(n30[14]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u87 (
    .a(n28_lutinv),
    .b(n29[13]),
    .o(n30[13]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u88 (
    .a(n28_lutinv),
    .b(n29[12]),
    .o(n30[12]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u89 (
    .a(n28_lutinv),
    .b(n29[11]),
    .o(n30[11]));
  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u9 (
    .ipad(clk_24m),
    .di(clk_24m_pad));  // sources/rtl/seg_4.v(19)
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u90 (
    .a(n28_lutinv),
    .b(n29[10]),
    .o(n30[10]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u91 (
    .a(n28_lutinv),
    .b(n29[1]),
    .o(n30[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u92 (
    .a(n28_lutinv),
    .b(n29[0]),
    .o(n30[0]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u93 (
    .a(n1),
    .b(n4_lutinv),
    .o(n8));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u94 (
    .a(n1),
    .b(n2[9]),
    .o(n3[9]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u95 (
    .a(n1),
    .b(n2[8]),
    .o(n3[8]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u96 (
    .a(n1),
    .b(n2[7]),
    .o(n3[7]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u97 (
    .a(n1),
    .b(n2[6]),
    .o(n3[6]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u98 (
    .a(n1),
    .b(n2[5]),
    .o(n3[5]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u99 (
    .a(n1),
    .b(n2[4]),
    .o(n3[4]));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(cnt[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n2[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(cnt[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n2[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u10  (
    .a(cnt[10]),
    .b(1'b0),
    .c(\add0/c10 ),
    .o({\add0/c11 ,n2[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u11  (
    .a(cnt[11]),
    .b(1'b0),
    .c(\add0/c11 ),
    .o({\add0/c12 ,n2[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u12  (
    .a(cnt[12]),
    .b(1'b0),
    .c(\add0/c12 ),
    .o({\add0/c13 ,n2[12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u13  (
    .a(cnt[13]),
    .b(1'b0),
    .c(\add0/c13 ),
    .o({\add0/c14 ,n2[13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u14  (
    .a(cnt[14]),
    .b(1'b0),
    .c(\add0/c14 ),
    .o({\add0/c15 ,n2[14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u15  (
    .a(cnt[15]),
    .b(1'b0),
    .c(\add0/c15 ),
    .o({\add0/c16 ,n2[15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u16  (
    .a(cnt[16]),
    .b(1'b0),
    .c(\add0/c16 ),
    .o({\add0/c17 ,n2[16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u17  (
    .a(cnt[17]),
    .b(1'b0),
    .c(\add0/c17 ),
    .o({\add0/c18 ,n2[17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u18  (
    .a(cnt[18]),
    .b(1'b0),
    .c(\add0/c18 ),
    .o({\add0/c19 ,n2[18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u19  (
    .a(cnt[19]),
    .b(1'b0),
    .c(\add0/c19 ),
    .o({\add0/c20 ,n2[19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(cnt[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n2[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u20  (
    .a(cnt[20]),
    .b(1'b0),
    .c(\add0/c20 ),
    .o({\add0/c21 ,n2[20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u21  (
    .a(cnt[21]),
    .b(1'b0),
    .c(\add0/c21 ),
    .o({\add0/c22 ,n2[21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u22  (
    .a(cnt[22]),
    .b(1'b0),
    .c(\add0/c22 ),
    .o({\add0/c23 ,n2[22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u23  (
    .a(cnt[23]),
    .b(1'b0),
    .c(\add0/c23 ),
    .o({\add0/c24 ,n2[23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u24  (
    .a(cnt[24]),
    .b(1'b0),
    .c(\add0/c24 ),
    .o({open_n153,n2[24]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(cnt[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({\add0/c4 ,n2[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u4  (
    .a(cnt[4]),
    .b(1'b0),
    .c(\add0/c4 ),
    .o({\add0/c5 ,n2[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u5  (
    .a(cnt[5]),
    .b(1'b0),
    .c(\add0/c5 ),
    .o({\add0/c6 ,n2[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u6  (
    .a(cnt[6]),
    .b(1'b0),
    .c(\add0/c6 ),
    .o({\add0/c7 ,n2[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u7  (
    .a(cnt[7]),
    .b(1'b0),
    .c(\add0/c7 ),
    .o({\add0/c8 ,n2[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u8  (
    .a(cnt[8]),
    .b(1'b0),
    .c(\add0/c8 ),
    .o({\add0/c9 ,n2[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u9  (
    .a(cnt[9]),
    .b(1'b0),
    .c(\add0/c9 ),
    .o({\add0/c10 ,n2[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n156}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u0  (
    .a(sm_bit1_num[0]),
    .b(1'b1),
    .c(\add1/c0 ),
    .o({\add1/c1 ,n5[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u1  (
    .a(sm_bit1_num[1]),
    .b(1'b0),
    .c(\add1/c1 ),
    .o({\add1/c2 ,n5[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u2  (
    .a(sm_bit1_num[2]),
    .b(1'b0),
    .c(\add1/c2 ),
    .o({\add1/c3 ,n5[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u3  (
    .a(sm_bit1_num[3]),
    .b(1'b0),
    .c(\add1/c3 ),
    .o({open_n157,n5[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add1/ucin  (
    .a(1'b0),
    .o({\add1/c0 ,open_n160}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add2/u0  (
    .a(sm_bit2_num[0]),
    .b(1'b1),
    .c(\add2/c0 ),
    .o({\add2/c1 ,n10[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add2/u1  (
    .a(sm_bit2_num[1]),
    .b(1'b0),
    .c(\add2/c1 ),
    .o({\add2/c2 ,n10[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add2/u2  (
    .a(sm_bit2_num[2]),
    .b(1'b0),
    .c(\add2/c2 ),
    .o({\add2/c3 ,n10[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add2/u3  (
    .a(sm_bit2_num[3]),
    .b(1'b0),
    .c(\add2/c3 ),
    .o({open_n161,n10[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add2/ucin  (
    .a(1'b0),
    .o({\add2/c0 ,open_n164}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add3/u0  (
    .a(sm_bit3_num[0]),
    .b(1'b1),
    .c(\add3/c0 ),
    .o({\add3/c1 ,n17[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add3/u1  (
    .a(sm_bit3_num[1]),
    .b(1'b0),
    .c(\add3/c1 ),
    .o({\add3/c2 ,n17[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add3/u2  (
    .a(sm_bit3_num[2]),
    .b(1'b0),
    .c(\add3/c2 ),
    .o({\add3/c3 ,n17[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add3/u3  (
    .a(sm_bit3_num[3]),
    .b(1'b0),
    .c(\add3/c3 ),
    .o({open_n165,n17[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add3/ucin  (
    .a(1'b0),
    .o({\add3/c0 ,open_n168}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add4/u0  (
    .a(sm_bit4_num[0]),
    .b(1'b1),
    .c(\add4/c0 ),
    .o({\add4/c1 ,n25[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add4/u1  (
    .a(sm_bit4_num[1]),
    .b(1'b0),
    .c(\add4/c1 ),
    .o({\add4/c2 ,n25[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add4/u2  (
    .a(sm_bit4_num[2]),
    .b(1'b0),
    .c(\add4/c2 ),
    .o({\add4/c3 ,n25[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add4/u3  (
    .a(sm_bit4_num[3]),
    .b(1'b0),
    .c(\add4/c3 ),
    .o({open_n169,n25[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add4/ucin  (
    .a(1'b0),
    .o({\add4/c0 ,open_n172}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u0  (
    .a(cnt_w[0]),
    .b(1'b1),
    .c(\add5/c0 ),
    .o({\add5/c1 ,n29[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u1  (
    .a(cnt_w[1]),
    .b(1'b0),
    .c(\add5/c1 ),
    .o({\add5/c2 ,n29[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u10  (
    .a(cnt_w[10]),
    .b(1'b0),
    .c(\add5/c10 ),
    .o({\add5/c11 ,n29[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u11  (
    .a(cnt_w[11]),
    .b(1'b0),
    .c(\add5/c11 ),
    .o({\add5/c12 ,n29[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u12  (
    .a(cnt_w[12]),
    .b(1'b0),
    .c(\add5/c12 ),
    .o({\add5/c13 ,n29[12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u13  (
    .a(cnt_w[13]),
    .b(1'b0),
    .c(\add5/c13 ),
    .o({\add5/c14 ,n29[13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u14  (
    .a(cnt_w[14]),
    .b(1'b0),
    .c(\add5/c14 ),
    .o({\add5/c15 ,n29[14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u15  (
    .a(cnt_w[15]),
    .b(1'b0),
    .c(\add5/c15 ),
    .o({\add5/c16 ,n29[15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u16  (
    .a(cnt_w[16]),
    .b(1'b0),
    .c(\add5/c16 ),
    .o({\add5/c17 ,n29[16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u17  (
    .a(cnt_w[17]),
    .b(1'b0),
    .c(\add5/c17 ),
    .o({open_n173,n29[17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u2  (
    .a(cnt_w[2]),
    .b(1'b0),
    .c(\add5/c2 ),
    .o({\add5/c3 ,n29[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u3  (
    .a(cnt_w[3]),
    .b(1'b0),
    .c(\add5/c3 ),
    .o({\add5/c4 ,n29[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u4  (
    .a(cnt_w[4]),
    .b(1'b0),
    .c(\add5/c4 ),
    .o({\add5/c5 ,n29[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u5  (
    .a(cnt_w[5]),
    .b(1'b0),
    .c(\add5/c5 ),
    .o({\add5/c6 ,n29[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u6  (
    .a(cnt_w[6]),
    .b(1'b0),
    .c(\add5/c6 ),
    .o({\add5/c7 ,n29[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u7  (
    .a(cnt_w[7]),
    .b(1'b0),
    .c(\add5/c7 ),
    .o({\add5/c8 ,n29[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u8  (
    .a(cnt_w[8]),
    .b(1'b0),
    .c(\add5/c8 ),
    .o({\add5/c9 ,n29[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add5/u9  (
    .a(cnt_w[9]),
    .b(1'b0),
    .c(\add5/c9 ),
    .o({\add5/c10 ,n29[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add5/ucin  (
    .a(1'b0),
    .o({\add5/c0 ,open_n176}));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  AL_MAP_LUT4 #(
    .EQN("(A*~B*~C*~D+~A*~B*C*~D)"),
    .INIT(16'b0000000000010010))
    mux12_b0_rom0 (
    .a(sm_seg_num[0]),
    .b(sm_seg_num[1]),
    .c(sm_seg_num[2]),
    .d(sm_seg_num[3]),
    .o(sm_seg_pad[0]));
  AL_MAP_LUT4 #(
    .EQN("(A*~B*C*~D+~A*B*C*~D)"),
    .INIT(16'b0000000001100000))
    mux12_b1_rom0 (
    .a(sm_seg_num[0]),
    .b(sm_seg_num[1]),
    .c(sm_seg_num[2]),
    .d(sm_seg_num[3]),
    .o(sm_seg_pad[1]));
  AL_MAP_LUT4 #(
    .EQN("(A*~B*~C*~D+~A*~B*C*~D+A*B*C*~D)"),
    .INIT(16'b0000000010010010))
    mux12_b3_rom0 (
    .a(sm_seg_num[0]),
    .b(sm_seg_num[1]),
    .c(sm_seg_num[2]),
    .d(sm_seg_num[3]),
    .o(sm_seg_pad[3]));
  AL_MAP_LUT4 #(
    .EQN("(A*~B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D)"),
    .INIT(16'b0000001010111010))
    mux12_b4_rom0 (
    .a(sm_seg_num[0]),
    .b(sm_seg_num[1]),
    .c(sm_seg_num[2]),
    .d(sm_seg_num[3]),
    .o(sm_seg_pad[4]));
  AL_MAP_LUT4 #(
    .EQN("(A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+A*B*C*~D)"),
    .INIT(16'b0000000010001110))
    mux12_b5_rom0 (
    .a(sm_seg_num[0]),
    .b(sm_seg_num[1]),
    .c(sm_seg_num[2]),
    .d(sm_seg_num[3]),
    .o(sm_seg_pad[5]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~B*~C*~D+A*~B*~C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D)"),
    .INIT(16'b1111110010000011))
    mux12_b6_rom0 (
    .a(sm_seg_num[0]),
    .b(sm_seg_num[1]),
    .c(sm_seg_num[2]),
    .d(sm_seg_num[3]),
    .o(sm_seg_pad[6]));
  reg_ar_as_w1 reg0_b0 (
    .clk(clk_24m_pad),
    .d(n6[0]),
    .en(n1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit1_num[0]));  // sources/rtl/seg_4.v(77)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk_24m_pad),
    .d(n6[1]),
    .en(n1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit1_num[1]));  // sources/rtl/seg_4.v(77)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk_24m_pad),
    .d(n6[2]),
    .en(n1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit1_num[2]));  // sources/rtl/seg_4.v(77)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk_24m_pad),
    .d(n6[3]),
    .en(n1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit1_num[3]));  // sources/rtl/seg_4.v(77)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk_24m_pad),
    .d(n11[0]),
    .en(n8),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit2_num[0]));  // sources/rtl/seg_4.v(92)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk_24m_pad),
    .d(n11[1]),
    .en(n8),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit2_num[1]));  // sources/rtl/seg_4.v(92)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk_24m_pad),
    .d(n11[2]),
    .en(n8),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit2_num[2]));  // sources/rtl/seg_4.v(92)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk_24m_pad),
    .d(n11[3]),
    .en(n8),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit2_num[3]));  // sources/rtl/seg_4.v(92)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk_24m_pad),
    .d(n18[0]),
    .en(n15),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit3_num[0]));  // sources/rtl/seg_4.v(107)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk_24m_pad),
    .d(n18[1]),
    .en(n15),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit3_num[1]));  // sources/rtl/seg_4.v(107)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk_24m_pad),
    .d(n18[2]),
    .en(n15),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit3_num[2]));  // sources/rtl/seg_4.v(107)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk_24m_pad),
    .d(n18[3]),
    .en(n15),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit3_num[3]));  // sources/rtl/seg_4.v(107)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk_24m_pad),
    .d(n26[0]),
    .en(n23),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit4_num[0]));  // sources/rtl/seg_4.v(122)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk_24m_pad),
    .d(n26[1]),
    .en(n23),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit4_num[1]));  // sources/rtl/seg_4.v(122)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk_24m_pad),
    .d(n26[2]),
    .en(n23),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit4_num[2]));  // sources/rtl/seg_4.v(122)
  reg_ar_as_w1 reg3_b3 (
    .clk(clk_24m_pad),
    .d(n26[3]),
    .en(n23),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_bit4_num[3]));  // sources/rtl/seg_4.v(122)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk_24m_pad),
    .d(n30[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[0]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk_24m_pad),
    .d(n30[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[1]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b10 (
    .clk(clk_24m_pad),
    .d(n30[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[10]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b11 (
    .clk(clk_24m_pad),
    .d(n30[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[11]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b12 (
    .clk(clk_24m_pad),
    .d(n30[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[12]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b13 (
    .clk(clk_24m_pad),
    .d(n30[13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[13]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b14 (
    .clk(clk_24m_pad),
    .d(n30[14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[14]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b15 (
    .clk(clk_24m_pad),
    .d(n30[15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[15]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b16 (
    .clk(clk_24m_pad),
    .d(n30[16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[16]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b17 (
    .clk(clk_24m_pad),
    .d(n30[17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[17]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b2 (
    .clk(clk_24m_pad),
    .d(n30[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[2]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b3 (
    .clk(clk_24m_pad),
    .d(n30[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[3]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b4 (
    .clk(clk_24m_pad),
    .d(n30[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[4]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b5 (
    .clk(clk_24m_pad),
    .d(n30[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[5]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b6 (
    .clk(clk_24m_pad),
    .d(n30[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[6]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b7 (
    .clk(clk_24m_pad),
    .d(n30[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[7]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b8 (
    .clk(clk_24m_pad),
    .d(n30[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[8]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg4_b9 (
    .clk(clk_24m_pad),
    .d(n30[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[9]));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w1 reg5_b0 (
    .clk(clk_24m_pad),
    .d(n31[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_seg_num[0]));  // sources/rtl/seg_4.v(148)
  reg_ar_as_w1 reg5_b1 (
    .clk(clk_24m_pad),
    .d(n31[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_seg_num[1]));  // sources/rtl/seg_4.v(148)
  reg_ar_as_w1 reg5_b2 (
    .clk(clk_24m_pad),
    .d(n31[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_seg_num[2]));  // sources/rtl/seg_4.v(148)
  reg_ar_as_w1 reg5_b3 (
    .clk(clk_24m_pad),
    .d(n31[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_seg_num[3]));  // sources/rtl/seg_4.v(148)
  reg_ar_as_w1 reg6_b0 (
    .clk(clk_24m_pad),
    .d(n3[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[0]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b1 (
    .clk(clk_24m_pad),
    .d(n3[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[1]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b10 (
    .clk(clk_24m_pad),
    .d(n3[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[10]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b11 (
    .clk(clk_24m_pad),
    .d(n3[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[11]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b12 (
    .clk(clk_24m_pad),
    .d(n3[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[12]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b13 (
    .clk(clk_24m_pad),
    .d(n3[13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[13]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b14 (
    .clk(clk_24m_pad),
    .d(n3[14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[14]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b15 (
    .clk(clk_24m_pad),
    .d(n3[15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[15]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b16 (
    .clk(clk_24m_pad),
    .d(n3[16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[16]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b17 (
    .clk(clk_24m_pad),
    .d(n3[17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[17]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b18 (
    .clk(clk_24m_pad),
    .d(n3[18]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[18]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b19 (
    .clk(clk_24m_pad),
    .d(n3[19]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[19]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b2 (
    .clk(clk_24m_pad),
    .d(n3[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[2]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b20 (
    .clk(clk_24m_pad),
    .d(n3[20]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[20]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b21 (
    .clk(clk_24m_pad),
    .d(n3[21]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[21]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b22 (
    .clk(clk_24m_pad),
    .d(n3[22]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[22]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b23 (
    .clk(clk_24m_pad),
    .d(n3[23]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[23]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b24 (
    .clk(clk_24m_pad),
    .d(n3[24]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[24]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b3 (
    .clk(clk_24m_pad),
    .d(n3[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[3]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b4 (
    .clk(clk_24m_pad),
    .d(n3[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[4]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b5 (
    .clk(clk_24m_pad),
    .d(n3[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[5]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b6 (
    .clk(clk_24m_pad),
    .d(n3[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[6]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b7 (
    .clk(clk_24m_pad),
    .d(n3[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[7]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b8 (
    .clk(clk_24m_pad),
    .d(n3[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[8]));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w1 reg6_b9 (
    .clk(clk_24m_pad),
    .d(n3[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[9]));  // sources/rtl/seg_4.v(62)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("B1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    reg7_b0_DO (
    .ce(1'b1),
    .do({open_n224,open_n225,open_n226,mux11_b0_sel_is_0_o_neg}),
    .osclk(clk_24m_pad),
    .rst(rst_n),
    .opad(sm_bit[0]));  // sources/rtl/seg_4.v(163)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("C3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    reg7_b1_DO (
    .ce(1'b1),
    .do({open_n238,open_n239,open_n240,mux11_b1_sel_is_1_o_neg}),
    .osclk(clk_24m_pad),
    .rst(rst_n),
    .opad(sm_bit[1]));  // sources/rtl/seg_4.v(163)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("C2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    reg7_b2_DO (
    .ce(1'b1),
    .do({open_n252,open_n253,open_n254,mux11_b2_sel_is_2_o_neg}),
    .osclk(clk_24m_pad),
    .rst(rst_n),
    .opad(sm_bit[2]));  // sources/rtl/seg_4.v(163)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("F3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    reg7_b3_DO (
    .ce(1'b1),
    .do({open_n266,open_n267,open_n268,mux11_b3_sel_is_3_o_neg}),
    .osclk(clk_24m_pad),
    .rst(rst_n),
    .opad(sm_bit[3]));  // sources/rtl/seg_4.v(163)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \ux_rst/add0/u0  (
    .a(\ux_rst/cnt [0]),
    .b(1'b1),
    .c(\ux_rst/add0/c0 ),
    .o({\ux_rst/add0/c1 ,\ux_rst/n1 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \ux_rst/add0/u1  (
    .a(\ux_rst/cnt [1]),
    .b(1'b0),
    .c(\ux_rst/add0/c1 ),
    .o({\ux_rst/add0/c2 ,\ux_rst/n1 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \ux_rst/add0/u2  (
    .a(\ux_rst/cnt [2]),
    .b(1'b0),
    .c(\ux_rst/add0/c2 ),
    .o({\ux_rst/add0/c3 ,\ux_rst/n1 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \ux_rst/add0/u3  (
    .a(\ux_rst/cnt [3]),
    .b(1'b0),
    .c(\ux_rst/add0/c3 ),
    .o({open_n280,\ux_rst/n1 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \ux_rst/add0/ucin  (
    .a(1'b0),
    .o({\ux_rst/add0/c0 ,open_n283}));
  reg_ar_ss_w1 \ux_rst/reg0_b0  (
    .clk(clk_24m_pad),
    .d(\ux_rst/n1 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(\ux_rst/n0 ),
    .q(\ux_rst/cnt [0]));  // sources/rtl/rst.v(28)
  reg_ar_ss_w1 \ux_rst/reg0_b1  (
    .clk(clk_24m_pad),
    .d(\ux_rst/n1 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(\ux_rst/n0 ),
    .q(\ux_rst/cnt [1]));  // sources/rtl/rst.v(28)
  reg_ar_ss_w1 \ux_rst/reg0_b2  (
    .clk(clk_24m_pad),
    .d(\ux_rst/n1 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(\ux_rst/n0 ),
    .q(\ux_rst/cnt [2]));  // sources/rtl/rst.v(28)
  reg_ar_ss_w1 \ux_rst/reg0_b3  (
    .clk(clk_24m_pad),
    .d(\ux_rst/n1 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(\ux_rst/n0 ),
    .q(\ux_rst/cnt [3]));  // sources/rtl/rst.v(28)
  reg_ar_as_w1 \ux_rst/rst_n_reg  (
    .clk(clk_24m_pad),
    .d(\ux_rst/n0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rst_n));  // sources/rtl/rst.v(36)

endmodule 

module reg_ar_as_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(enout),
    .reset(reset),
    .set(set),
    .q(q));

endmodule 

module reg_ar_ss_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire setout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(setout),
    .reset(reset),
    .set(1'b0),
    .q(q));
  AL_MUX u_set0 (
    .i0(enout),
    .i1(1'b1),
    .sel(set),
    .o(setout));

endmodule 

module AL_MUX
  (
  input i0,
  input i1,
  input sel,
  output o
  );

  wire not_sel, sel_i0, sel_i1;
  not u0 (not_sel, sel);
  and u1 (sel_i1, sel, i1);
  and u2 (sel_i0, not_sel, i0);
  or u3 (o, sel_i1, sel_i0);

endmodule

module AL_DFF
  (
  input reset,
  input set,
  input clk,
  input d,
  output reg q
  );

  parameter INI = 1'b0;

  always @(posedge reset or posedge set or posedge clk)
  begin
    if (reset)
      q <= 1'b0;
    else if (set)
      q <= 1'b1;
    else
      q <= d;
  end

endmodule

