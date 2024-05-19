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
  wire [3:0] n17;
  wire [24:0] n2;
  wire [3:0] n25;
  wire [17:0] n29;
  wire [3:0] n5;
  wire [3:0] sm_bit1_num;  // sources/rtl/seg_4.v(27)
  wire [3:0] sm_bit2_num;  // sources/rtl/seg_4.v(28)
  wire [3:0] sm_bit3_num;  // sources/rtl/seg_4.v(29)
  wire [3:0] sm_bit4_num;  // sources/rtl/seg_4.v(30)
  wire [3:0] sm_seg_num;  // sources/rtl/seg_4.v(35)
  wire [7:0] sm_seg_pad;  // sources/rtl/seg_4.v(20)
  wire [3:0] \ux_rst/cnt ;  // sources/rtl/rst.v(20)
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
  wire \add0/c11 ;
  wire \add0/c15 ;
  wire \add0/c19 ;
  wire \add0/c23 ;
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire \add1/c1 ;
  wire \add1/c3 ;
  wire \add2/c1 ;
  wire \add2/c3 ;
  wire \add3/c1 ;
  wire \add3/c3 ;
  wire \add4/c1 ;
  wire \add4/c3 ;
  wire \add5/c11 ;
  wire \add5/c15 ;
  wire \add5/c3 ;
  wire \add5/c7 ;
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
  wire \ux_rst/add0/c1 ;
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
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(D*~C*~B*A)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(D*~C*~B*A)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000001000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000001000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u119|_al_u120  (
    .a({sm_bit2_num[0],open_n34}),
    .b({sm_bit2_num[1],n4_lutinv}),
    .c({sm_bit2_num[2],n13_lutinv}),
    .d({sm_bit2_num[3],n1}),
    .f({n13_lutinv,n15}));
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
    .do({open_n60,open_n61,open_n62,sm_seg_pad[5]}),
    .opad(sm_seg[5]));  // sources/rtl/seg_4.v(20)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(D*~C*~B*A)"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b0000001000000000),
    .MODE("LOGIC"))
    \_al_u121|_al_u122  (
    .a({sm_bit3_num[0],n1}),
    .b({sm_bit3_num[1],n4_lutinv}),
    .c({sm_bit3_num[2],n13_lutinv}),
    .d({sm_bit3_num[3],n20_lutinv}),
    .f({n20_lutinv,n23}));
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
    .do({open_n97,open_n98,open_n99,sm_seg_pad[4]}),
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
    .do({open_n114,open_n115,open_n116,sm_seg_pad[3]}),
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
    .do({open_n131,open_n132,open_n133,sm_seg_pad[2]}),
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
    .do({open_n148,open_n149,open_n150,sm_seg_pad[1]}),
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
    .do({open_n165,open_n166,open_n167,sm_seg_pad[0]}),
    .opad(sm_seg[0]));  // sources/rtl/seg_4.v(20)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*D)"),
    //.LUT1("~(C*~D)"),
    .INIT_LUT0(16'b1111000011111111),
    .INIT_LUT1(16'b1111111100001111),
    .MODE("LOGIC"))
    \_al_u23|_al_u26  (
    .c({cnt_w[17],cnt_w[17]}),
    .d({cnt_w[16],cnt_w[16]}),
    .f({mux11_b2_sel_is_2_o_neg,mux11_b1_sel_is_1_o_neg}));
  // sources/rtl/seg_4.v(148)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*D)"),
    //.LUT1("~(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000111111111111),
    .INIT_LUT1(16'b1111111100110101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u27|reg5_b3  (
    .a({sm_bit1_num[3],open_n205}),
    .b({sm_bit2_num[3],open_n206}),
    .c({cnt_w[16],_al_u27_o}),
    .clk(clk_24m_pad),
    .d({cnt_w[17],_al_u24_o}),
    .sr(rst_n),
    .f({_al_u27_o,open_n220}),
    .q({open_n224,sm_seg_num[3]}));  // sources/rtl/seg_4.v(148)
  // sources/rtl/seg_4.v(148)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*D)"),
    //.LUTF1("~(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("~(C*D)"),
    //.LUTG1("~(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000111111111111),
    .INIT_LUTF1(16'b0011010111111111),
    .INIT_LUTG0(16'b0000111111111111),
    .INIT_LUTG1(16'b0011010111111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u29|reg5_b2  (
    .a({sm_bit3_num[2],open_n225}),
    .b({sm_bit4_num[2],open_n226}),
    .c({cnt_w[16],_al_u30_o}),
    .clk(clk_24m_pad),
    .d({cnt_w[17],_al_u29_o}),
    .sr(rst_n),
    .f({_al_u29_o,open_n244}),
    .q({open_n248,sm_seg_num[2]}));  // sources/rtl/seg_4.v(148)
  // sources/rtl/seg_4.v(77)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("~(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("~(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111111100110101),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111111100110101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u30|reg0_b2  (
    .a({sm_bit1_num[2],open_n249}),
    .b({sm_bit2_num[2],open_n250}),
    .c({cnt_w[16],n5[2]}),
    .ce(n1),
    .clk(clk_24m_pad),
    .d({cnt_w[17],n4_lutinv}),
    .sr(rst_n),
    .f({_al_u30_o,open_n267}),
    .q({open_n271,sm_bit1_num[2]}));  // sources/rtl/seg_4.v(77)
  // sources/rtl/seg_4.v(122)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("~(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0011010111111111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u32|reg3_b1  (
    .a({sm_bit3_num[1],open_n272}),
    .b({sm_bit4_num[1],open_n273}),
    .c({cnt_w[16],n25[1]}),
    .ce(n23),
    .clk(clk_24m_pad),
    .d({cnt_w[17],n24_lutinv}),
    .sr(rst_n),
    .f({_al_u32_o,open_n286}),
    .q({open_n290,sm_bit4_num[1]}));  // sources/rtl/seg_4.v(122)
  // sources/rtl/seg_4.v(77)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("~(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("~(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111111100110101),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111111100110101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u33|reg0_b1  (
    .a({sm_bit1_num[1],open_n291}),
    .b({sm_bit2_num[1],open_n292}),
    .c({cnt_w[16],n5[1]}),
    .ce(n1),
    .clk(clk_24m_pad),
    .d({cnt_w[17],n4_lutinv}),
    .sr(rst_n),
    .f({_al_u33_o,open_n309}),
    .q({open_n313,sm_bit1_num[1]}));  // sources/rtl/seg_4.v(77)
  // sources/rtl/seg_4.v(148)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*D)"),
    //.LUT1("~(C*(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000111111111111),
    .INIT_LUT1(16'b0011111101011111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u35|reg5_b0  (
    .a({sm_bit2_num[0],open_n314}),
    .b({sm_bit4_num[0],open_n315}),
    .c({cnt_w[16],_al_u36_o}),
    .clk(clk_24m_pad),
    .d({cnt_w[17],_al_u35_o}),
    .sr(rst_n),
    .f({_al_u35_o,open_n329}),
    .q({open_n333,sm_seg_num[0]}));  // sources/rtl/seg_4.v(148)
  // sources/rtl/seg_4.v(77)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("~(~C*(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("~(~C*(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111001111110101),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111001111110101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u36|reg0_b0  (
    .a({sm_bit1_num[0],open_n334}),
    .b({sm_bit3_num[0],open_n335}),
    .c({cnt_w[16],n5[0]}),
    .ce(n1),
    .clk(clk_24m_pad),
    .d({cnt_w[17],n4_lutinv}),
    .sr(rst_n),
    .f({_al_u36_o,open_n352}),
    .q({open_n356,sm_bit1_num[0]}));  // sources/rtl/seg_4.v(77)
  // sources/rtl/seg_4.v(148)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*D)"),
    //.LUTF1("(~D*~C*B*~A)"),
    //.LUTG0("~(C*D)"),
    //.LUTG1("(~D*~C*B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000111111111111),
    .INIT_LUTF1(16'b0000000000000100),
    .INIT_LUTG0(16'b0000111111111111),
    .INIT_LUTG1(16'b0000000000000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u38|reg5_b1  (
    .a({sm_seg_num[0],open_n357}),
    .b({sm_seg_num[1],open_n358}),
    .c({sm_seg_num[2],_al_u33_o}),
    .clk(clk_24m_pad),
    .d({sm_seg_num[3],_al_u32_o}),
    .sr(rst_n),
    .f({sm_seg_pad[2],open_n376}),
    .q({open_n380,sm_seg_num[1]}));  // sources/rtl/seg_4.v(148)
  // sources/rtl/seg_4.v(77)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(D*~C*~B*A)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(D*~C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000001000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000001000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u40|reg0_b3  (
    .a({sm_bit1_num[0],open_n381}),
    .b({sm_bit1_num[1],open_n382}),
    .c({sm_bit1_num[2],n5[3]}),
    .ce(n1),
    .clk(clk_24m_pad),
    .d({sm_bit1_num[3],n4_lutinv}),
    .sr(rst_n),
    .f({n4_lutinv,open_n399}),
    .q({open_n403,sm_bit1_num[3]}));  // sources/rtl/seg_4.v(77)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(D*~C*B*~A)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(D*~C*B*~A)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000010000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000010000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u45|_al_u93  (
    .a({sm_bit2_num[0],open_n404}),
    .b({sm_bit2_num[1],open_n405}),
    .c({sm_bit2_num[2],n4_lutinv}),
    .d({sm_bit2_num[3],n1}),
    .f({n9_lutinv,n8}));
  EG_PHY_MSLICE #(
    //.LUT0("~(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~C*B*~A)"),
    .INIT_LUT0(16'b0011010111111111),
    .INIT_LUT1(16'b0000010000000000),
    .MODE("LOGIC"))
    \_al_u50|_al_u24  (
    .a({sm_bit3_num[0],sm_bit3_num[3]}),
    .b({sm_bit3_num[1],sm_bit4_num[3]}),
    .c({sm_bit3_num[2],cnt_w[16]}),
    .d({sm_bit3_num[3],cnt_w[17]}),
    .f({n16_lutinv,_al_u24_o}));
  // sources/rtl/seg_4.v(122)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(D*~C*B*~A)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(D*~C*B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000010000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000010000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u55|reg3_b3  (
    .a({sm_bit4_num[0],open_n450}),
    .b({sm_bit4_num[1],open_n451}),
    .c({sm_bit4_num[2],n25[3]}),
    .ce(n23),
    .clk(clk_24m_pad),
    .d({sm_bit4_num[3],n24_lutinv}),
    .sr(rst_n),
    .f({n24_lutinv,open_n468}),
    .q({open_n472,sm_bit4_num[3]}));  // sources/rtl/seg_4.v(122)
  // sources/rtl/seg_4.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u60|reg6_b9  (
    .b({cnt[8],open_n475}),
    .c({cnt[9],n2[9]}),
    .clk(clk_24m_pad),
    .d({cnt[7],n1}),
    .sr(rst_n),
    .f({_al_u60_o,open_n489}),
    .q({open_n493,cnt[9]}));  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u61|reg6_b6  (
    .a({cnt[3],open_n494}),
    .b({cnt[4],open_n495}),
    .c({cnt[5],n2[6]}),
    .clk(clk_24m_pad),
    .d({cnt[6],n1}),
    .sr(rst_n),
    .f({_al_u61_o,open_n513}),
    .q({open_n517,cnt[6]}));  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~D*~C*~B*A)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~D*~C*~B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000000000010),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u62|reg6_b24  (
    .a({cnt[21],open_n518}),
    .b({cnt[22],open_n519}),
    .c({cnt[23],n2[24]}),
    .clk(clk_24m_pad),
    .d({cnt[24],n1}),
    .sr(rst_n),
    .f({_al_u62_o,open_n537}),
    .q({open_n541,cnt[24]}));  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u63|reg6_b1  (
    .c({cnt[1],n2[1]}),
    .clk(clk_24m_pad),
    .d({cnt[0],n1}),
    .sr(rst_n),
    .f({_al_u63_o,open_n563}),
    .q({open_n567,cnt[1]}));  // sources/rtl/seg_4.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*B*A)"),
    .INIT_LUT0(16'b0000000010000000),
    .MODE("LOGIC"))
    _al_u64 (
    .a({open_n568,cnt[10]}),
    .b({open_n569,cnt[11]}),
    .c({open_n570,cnt[12]}),
    .d({open_n573,cnt[13]}),
    .f({open_n587,_al_u64_o}));
  // sources/rtl/seg_4.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~D*~C*~B*A)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~D*~C*~B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000000000010),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u65|reg6_b20  (
    .a({cnt[18],open_n593}),
    .b({cnt[19],open_n594}),
    .c({cnt[2],n2[20]}),
    .clk(clk_24m_pad),
    .d({cnt[20],n1}),
    .sr(rst_n),
    .f({_al_u65_o,open_n612}),
    .q({open_n616,cnt[20]}));  // sources/rtl/seg_4.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*~A)"),
    //.LUT1("(D*C*B*A)"),
    .INIT_LUT0(16'b0000000000000100),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u67|_al_u66  (
    .a({_al_u63_o,cnt[14]}),
    .b({_al_u64_o,cnt[15]}),
    .c({_al_u65_o,cnt[16]}),
    .d({_al_u66_o,cnt[17]}),
    .f({_al_u67_o,_al_u66_o}));
  // sources/rtl/rst.v(36)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u68|ux_rst/rst_n_reg  (
    .a({_al_u67_o,\ux_rst/cnt [0]}),
    .b({_al_u60_o,\ux_rst/cnt [1]}),
    .c({_al_u61_o,\ux_rst/cnt [2]}),
    .clk(clk_24m_pad),
    .d({_al_u62_o,\ux_rst/cnt [3]}),
    .f({n1,\ux_rst/n0 }),
    .q({open_n654,rst_n}));  // sources/rtl/rst.v(36)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*~D)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("~(~C*~D)"),
    //.LUTG1("(D*C*B*A)"),
    .INIT_LUTF0(16'b1111111111110000),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b1111111111110000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u69|_al_u25  (
    .a({cnt_w[0],open_n655}),
    .b({cnt_w[1],open_n656}),
    .c({cnt_w[10],cnt_w[17]}),
    .d({cnt_w[11],cnt_w[16]}),
    .f({_al_u69_o,mux11_b0_sel_is_0_o_neg}));
  // sources/rtl/seg_4.v(133)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u70|reg4_b9  (
    .a({cnt_w[6],open_n681}),
    .b({cnt_w[7],open_n682}),
    .c({cnt_w[8],n29[9]}),
    .clk(clk_24m_pad),
    .d({cnt_w[9],n28_lutinv}),
    .sr(rst_n),
    .f({_al_u70_o,open_n696}),
    .q({open_n700,cnt_w[9]}));  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u71|reg4_b5  (
    .a({cnt_w[2],open_n701}),
    .b({cnt_w[3],open_n702}),
    .c({cnt_w[4],n29[5]}),
    .clk(clk_24m_pad),
    .d({cnt_w[5],n28_lutinv}),
    .sr(rst_n),
    .f({_al_u71_o,open_n716}),
    .q({open_n720,cnt_w[5]}));  // sources/rtl/seg_4.v(133)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u73|_al_u72  (
    .a({open_n721,cnt_w[12]}),
    .b({_al_u71_o,cnt_w[13]}),
    .c({_al_u72_o,cnt_w[14]}),
    .d({_al_u70_o,cnt_w[15]}),
    .f({_al_u73_o,_al_u72_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(C*D)"),
    //.LUT1("(C*~B*D)"),
    .INIT_LUT0(16'b0000111111111111),
    .INIT_LUT1(16'b0011000000000000),
    .MODE("LOGIC"))
    \_al_u74|_al_u22  (
    .b({mux11_b3_sel_is_3_o_neg,open_n748}),
    .c({_al_u69_o,cnt_w[17]}),
    .d({_al_u73_o,cnt_w[16]}),
    .f({n28_lutinv,mux11_b3_sel_is_3_o_neg}));
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
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u123"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u11_al_u126  (
    .a({cnt[13],cnt[11]}),
    .b({cnt[14],cnt[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c11 ),
    .f({n2[13],n2[11]}),
    .fco(\add0/c15 ),
    .fx({n2[14],n2[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u123"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u15_al_u127  (
    .a({cnt[17],cnt[15]}),
    .b({cnt[18],cnt[16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c15 ),
    .f({n2[17],n2[15]}),
    .fco(\add0/c19 ),
    .fx({n2[18],n2[16]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u123"),
    //.R_POSITION("X0Y2Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u19_al_u128  (
    .a({cnt[21],cnt[19]}),
    .b({cnt[22],cnt[20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c19 ),
    .f({n2[21],n2[19]}),
    .fco(\add0/c23 ),
    .fx({n2[22],n2[20]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u123"),
    //.R_POSITION("X0Y3Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u23_al_u129  (
    .a({open_n840,cnt[23]}),
    .b({open_n841,cnt[24]}),
    .c(2'b00),
    .d({open_n844,1'b0}),
    .e({open_n845,1'b0}),
    .fci(\add0/c23 ),
    .f({open_n860,n2[23]}),
    .fx({open_n862,n2[24]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u123"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u3_al_u124  (
    .a({cnt[5],cnt[3]}),
    .b({cnt[6],cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n2[5],n2[3]}),
    .fco(\add0/c7 ),
    .fx({n2[6],n2[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u123"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u7_al_u125  (
    .a({cnt[9],cnt[7]}),
    .b({cnt[10],cnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n2[9],n2[7]}),
    .fco(\add0/c11 ),
    .fx({n2[10],n2[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u123"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/ucin_al_u123  (
    .a({cnt[1],1'b0}),
    .b({cnt[2],cnt[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n2[1],open_n918}),
    .fco(\add0/c3 ),
    .fx({n2[2],n2[0]}));
  EG_PHY_MSLICE #(
    //.MACRO("add1/u0|add1/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add1/u0|add1/ucin  (
    .a({sm_bit1_num[0],1'b0}),
    .b({1'b1,open_n921}),
    .f({n5[0],open_n941}),
    .fco(\add1/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("add1/u0|add1/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add1/u2|add1/u1  (
    .a(sm_bit1_num[2:1]),
    .b(2'b00),
    .fci(\add1/c1 ),
    .f(n5[2:1]),
    .fco(\add1/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("add1/u0|add1/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add1/u3_al_u135  (
    .a({open_n968,sm_bit1_num[3]}),
    .b({open_n969,1'b0}),
    .fci(\add1/c3 ),
    .f({open_n988,n5[3]}));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u0|add2/ucin  (
    .a({sm_bit2_num[0],1'b0}),
    .b({1'b1,open_n994}),
    .f({n10[0],open_n1014}),
    .fco(\add2/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u2|add2/u1  (
    .a(sm_bit2_num[2:1]),
    .b(2'b00),
    .fci(\add2/c1 ),
    .f(n10[2:1]),
    .fco(\add2/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u3_al_u136  (
    .a({open_n1041,sm_bit2_num[3]}),
    .b({open_n1042,1'b0}),
    .fci(\add2/c3 ),
    .f({open_n1061,n10[3]}));
  EG_PHY_MSLICE #(
    //.MACRO("add3/u0|add3/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add3/u0|add3/ucin  (
    .a({sm_bit3_num[0],1'b0}),
    .b({1'b1,open_n1067}),
    .f({n17[0],open_n1087}),
    .fco(\add3/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("add3/u0|add3/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add3/u2|add3/u1  (
    .a(sm_bit3_num[2:1]),
    .b(2'b00),
    .fci(\add3/c1 ),
    .f(n17[2:1]),
    .fco(\add3/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("add3/u0|add3/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add3/u3_al_u137  (
    .a({open_n1114,sm_bit3_num[3]}),
    .b({open_n1115,1'b0}),
    .fci(\add3/c3 ),
    .f({open_n1134,n17[3]}));
  EG_PHY_MSLICE #(
    //.MACRO("add4/u0|add4/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add4/u0|add4/ucin  (
    .a({sm_bit4_num[0],1'b0}),
    .b({1'b1,open_n1140}),
    .f({n25[0],open_n1160}),
    .fco(\add4/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("add4/u0|add4/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add4/u2|add4/u1  (
    .a(sm_bit4_num[2:1]),
    .b(2'b00),
    .fci(\add4/c1 ),
    .f(n25[2:1]),
    .fco(\add4/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("add4/u0|add4/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add4/u3_al_u138  (
    .a({open_n1187,sm_bit4_num[3]}),
    .b({open_n1188,1'b0}),
    .fci(\add4/c3 ),
    .f({open_n1207,n25[3]}));
  EG_PHY_LSLICE #(
    //.MACRO("add5/ucin_al_u130"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add5/u11_al_u133  (
    .a({cnt_w[13],cnt_w[11]}),
    .b({cnt_w[14],cnt_w[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add5/c11 ),
    .f({n29[13],n29[11]}),
    .fco(\add5/c15 ),
    .fx({n29[14],n29[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add5/ucin_al_u130"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add5/u15_al_u134  (
    .a({cnt_w[17],cnt_w[15]}),
    .b({open_n1231,cnt_w[16]}),
    .c(2'b00),
    .d(2'b00),
    .e({open_n1234,1'b0}),
    .fci(\add5/c15 ),
    .f({n29[17],n29[15]}),
    .fx({open_n1250,n29[16]}));
  EG_PHY_LSLICE #(
    //.MACRO("add5/ucin_al_u130"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add5/u3_al_u131  (
    .a({cnt_w[5],cnt_w[3]}),
    .b({cnt_w[6],cnt_w[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add5/c3 ),
    .f({n29[5],n29[3]}),
    .fco(\add5/c7 ),
    .fx({n29[6],n29[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add5/ucin_al_u130"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add5/u7_al_u132  (
    .a({cnt_w[9],cnt_w[7]}),
    .b({cnt_w[10],cnt_w[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add5/c7 ),
    .f({n29[9],n29[7]}),
    .fco(\add5/c11 ),
    .fx({n29[10],n29[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add5/ucin_al_u130"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add5/ucin_al_u130  (
    .a({cnt_w[1],1'b0}),
    .b({cnt_w[2],cnt_w[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n29[1],open_n1306}),
    .fco(\add5/c3 ),
    .fx({n29[2],n29[0]}));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  EG_PHY_MSLICE #(
    //.LUT0("(~A*~B*~C*~D+A*~B*~C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D)"),
    //.LUT1("(A*~B*~C*~D+~A*~B*C*~D)"),
    .INIT_LUT0(16'b1111110010000011),
    .INIT_LUT1(16'b0000000000010010),
    .MODE("LOGIC"))
    \mux12_b0_rom0|mux12_b6_rom0  (
    .a({sm_seg_num[0],sm_seg_num[0]}),
    .b({sm_seg_num[1],sm_seg_num[1]}),
    .c({sm_seg_num[2],sm_seg_num[2]}),
    .d({sm_seg_num[3],sm_seg_num[3]}),
    .f({sm_seg_pad[0],sm_seg_pad[6]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+A*B*C*~D)"),
    //.LUTF1("(A*~B*C*~D+~A*B*C*~D)"),
    //.LUTG0("(A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+A*B*C*~D)"),
    //.LUTG1("(A*~B*C*~D+~A*B*C*~D)"),
    .INIT_LUTF0(16'b0000000010001110),
    .INIT_LUTF1(16'b0000000001100000),
    .INIT_LUTG0(16'b0000000010001110),
    .INIT_LUTG1(16'b0000000001100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \mux12_b1_rom0|mux12_b5_rom0  (
    .a({sm_seg_num[0],sm_seg_num[0]}),
    .b({sm_seg_num[1],sm_seg_num[1]}),
    .c({sm_seg_num[2],sm_seg_num[2]}),
    .d({sm_seg_num[3],sm_seg_num[3]}),
    .f({sm_seg_pad[1],sm_seg_pad[5]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D)"),
    //.LUTF1("(A*~B*~C*~D+~A*~B*C*~D+A*B*C*~D)"),
    //.LUTG0("(A*~B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D)"),
    //.LUTG1("(A*~B*~C*~D+~A*~B*C*~D+A*B*C*~D)"),
    .INIT_LUTF0(16'b0000001010111010),
    .INIT_LUTF1(16'b0000000010010010),
    .INIT_LUTG0(16'b0000001010111010),
    .INIT_LUTG1(16'b0000000010010010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \mux12_b3_rom0|mux12_b4_rom0  (
    .a({sm_seg_num[0],sm_seg_num[0]}),
    .b({sm_seg_num[1],sm_seg_num[1]}),
    .c({sm_seg_num[2],sm_seg_num[2]}),
    .d({sm_seg_num[3],sm_seg_num[3]}),
    .f({sm_seg_pad[3],sm_seg_pad[4]}));
  // sources/rtl/seg_4.v(92)
  // sources/rtl/seg_4.v(92)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b0|reg1_b3  (
    .c({n10[0],n10[3]}),
    .ce(n8),
    .clk(clk_24m_pad),
    .d({n9_lutinv,n9_lutinv}),
    .sr(rst_n),
    .q({sm_bit2_num[0],sm_bit2_num[3]}));  // sources/rtl/seg_4.v(92)
  // sources/rtl/seg_4.v(92)
  // sources/rtl/seg_4.v(92)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b1|reg1_b2  (
    .c({n10[1],n10[2]}),
    .ce(n8),
    .clk(clk_24m_pad),
    .d({n9_lutinv,n9_lutinv}),
    .sr(rst_n),
    .q({sm_bit2_num[1],sm_bit2_num[2]}));  // sources/rtl/seg_4.v(92)
  // sources/rtl/seg_4.v(107)
  // sources/rtl/seg_4.v(107)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b0|reg2_b3  (
    .c({n17[0],n17[3]}),
    .ce(n15),
    .clk(clk_24m_pad),
    .d({n16_lutinv,n16_lutinv}),
    .sr(rst_n),
    .q({sm_bit3_num[0],sm_bit3_num[3]}));  // sources/rtl/seg_4.v(107)
  // sources/rtl/seg_4.v(107)
  // sources/rtl/seg_4.v(107)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b1|reg2_b2  (
    .c({n17[1],n17[2]}),
    .ce(n15),
    .clk(clk_24m_pad),
    .d({n16_lutinv,n16_lutinv}),
    .sr(rst_n),
    .q({sm_bit3_num[1],sm_bit3_num[2]}));  // sources/rtl/seg_4.v(107)
  // sources/rtl/seg_4.v(122)
  // sources/rtl/seg_4.v(122)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg3_b0|reg3_b2  (
    .c({n25[0],n25[2]}),
    .ce(n23),
    .clk(clk_24m_pad),
    .d({n24_lutinv,n24_lutinv}),
    .sr(rst_n),
    .q({sm_bit4_num[0],sm_bit4_num[2]}));  // sources/rtl/seg_4.v(122)
  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg4_b0|reg4_b17  (
    .c({n29[0],n29[17]}),
    .clk(clk_24m_pad),
    .d({n28_lutinv,n28_lutinv}),
    .sr(rst_n),
    .q({cnt_w[0],cnt_w[17]}));  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg4_b10|reg4_b16  (
    .c({n29[10],n29[16]}),
    .clk(clk_24m_pad),
    .d({n28_lutinv,n28_lutinv}),
    .sr(rst_n),
    .q({cnt_w[10],cnt_w[16]}));  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg4_b11|reg4_b8  (
    .c({n29[11],n29[8]}),
    .clk(clk_24m_pad),
    .d({n28_lutinv,n28_lutinv}),
    .sr(rst_n),
    .q({cnt_w[11],cnt_w[8]}));  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg4_b12|reg4_b7  (
    .c({n29[12],n29[7]}),
    .clk(clk_24m_pad),
    .d({n28_lutinv,n28_lutinv}),
    .sr(rst_n),
    .q({cnt_w[12],cnt_w[7]}));  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg4_b13|reg4_b6  (
    .c({n29[13],n29[6]}),
    .clk(clk_24m_pad),
    .d({n28_lutinv,n28_lutinv}),
    .sr(rst_n),
    .q({cnt_w[13],cnt_w[6]}));  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg4_b14|reg4_b4  (
    .c({n29[14],n29[4]}),
    .clk(clk_24m_pad),
    .d({n28_lutinv,n28_lutinv}),
    .sr(rst_n),
    .q({cnt_w[14],cnt_w[4]}));  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg4_b15|reg4_b3  (
    .c({n29[15],n29[3]}),
    .clk(clk_24m_pad),
    .d({n28_lutinv,n28_lutinv}),
    .sr(rst_n),
    .q({cnt_w[15],cnt_w[3]}));  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(133)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg4_b1|reg4_b2  (
    .c({n29[1],n29[2]}),
    .clk(clk_24m_pad),
    .d({n28_lutinv,n28_lutinv}),
    .sr(rst_n),
    .q({cnt_w[1],cnt_w[2]}));  // sources/rtl/seg_4.v(133)
  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b0|reg6_b8  (
    .c({n2[0],n2[8]}),
    .clk(clk_24m_pad),
    .d({n1,n1}),
    .sr(rst_n),
    .q({cnt[0],cnt[8]}));  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b10|reg6_b7  (
    .c({n2[10],n2[7]}),
    .clk(clk_24m_pad),
    .d({n1,n1}),
    .sr(rst_n),
    .q({cnt[10],cnt[7]}));  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b11|reg6_b5  (
    .c({n2[11],n2[5]}),
    .clk(clk_24m_pad),
    .d({n1,n1}),
    .sr(rst_n),
    .q({cnt[11],cnt[5]}));  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b12|reg6_b4  (
    .c({n2[12],n2[4]}),
    .clk(clk_24m_pad),
    .d({n1,n1}),
    .sr(rst_n),
    .q({cnt[12],cnt[4]}));  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b13|reg6_b3  (
    .c({n2[13],n2[3]}),
    .clk(clk_24m_pad),
    .d({n1,n1}),
    .sr(rst_n),
    .q({cnt[13],cnt[3]}));  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b14|reg6_b23  (
    .c({n2[14],n2[23]}),
    .clk(clk_24m_pad),
    .d({n1,n1}),
    .sr(rst_n),
    .q({cnt[14],cnt[23]}));  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b15|reg6_b22  (
    .c({n2[15],n2[22]}),
    .clk(clk_24m_pad),
    .d({n1,n1}),
    .sr(rst_n),
    .q({cnt[15],cnt[22]}));  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b16|reg6_b21  (
    .c({n2[16],n2[21]}),
    .clk(clk_24m_pad),
    .d({n1,n1}),
    .sr(rst_n),
    .q({cnt[16],cnt[21]}));  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b17|reg6_b2  (
    .c({n2[17],n2[2]}),
    .clk(clk_24m_pad),
    .d({n1,n1}),
    .sr(rst_n),
    .q({cnt[17],cnt[2]}));  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  // sources/rtl/seg_4.v(62)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b18|reg6_b19  (
    .c({n2[18],n2[19]}),
    .clk(clk_24m_pad),
    .d({n1,n1}),
    .sr(rst_n),
    .q({cnt[18],cnt[19]}));  // sources/rtl/seg_4.v(62)
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
    .do({open_n1969,open_n1970,open_n1971,mux11_b0_sel_is_0_o_neg}),
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
    .do({open_n1983,open_n1984,open_n1985,mux11_b1_sel_is_1_o_neg}),
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
    .do({open_n1997,open_n1998,open_n1999,mux11_b2_sel_is_2_o_neg}),
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
    .do({open_n2011,open_n2012,open_n2013,mux11_b3_sel_is_3_o_neg}),
    .osclk(clk_24m_pad),
    .rst(rst_n),
    .opad(sm_bit[3]));  // sources/rtl/seg_4.v(163)
  EG_PHY_MSLICE #(
    //.MACRO("ux_rst/reg0_b0|ux_rst/add0/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \ux_rst/reg0_b0|ux_rst/add0/ucin  (
    .a({\ux_rst/cnt [0],1'b0}),
    .b({1'b1,open_n2025}),
    .clk(clk_24m_pad),
    .sr(\ux_rst/n0 ),
    .fco(\ux_rst/add0/c1 ),
    .q({\ux_rst/cnt [0],open_n2047}));
  EG_PHY_MSLICE #(
    //.MACRO("ux_rst/reg0_b0|ux_rst/add0/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \ux_rst/reg0_b2|ux_rst/reg0_b1  (
    .a(\ux_rst/cnt [2:1]),
    .b(2'b00),
    .clk(clk_24m_pad),
    .fci(\ux_rst/add0/c1 ),
    .sr(\ux_rst/n0 ),
    .fco(\ux_rst/add0/c3 ),
    .q(\ux_rst/cnt [2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("ux_rst/reg0_b0|ux_rst/add0/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \ux_rst/reg0_b3_al_u139  (
    .a({open_n2068,\ux_rst/cnt [3]}),
    .b({open_n2069,1'b0}),
    .clk(clk_24m_pad),
    .fci(\ux_rst/add0/c3 ),
    .sr(\ux_rst/n0 ),
    .q({open_n2091,\ux_rst/cnt [3]}));

endmodule 

