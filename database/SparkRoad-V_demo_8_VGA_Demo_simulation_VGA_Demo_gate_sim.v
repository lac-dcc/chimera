// Verilog netlist created by TD v4.6.12906
// Thu Aug  8 15:19:07 2019

`timescale 1ns / 1ps
module VGA_Demo  // source/rtl/VGA_Demo.v(2)
  (
  clk_24m,
  rst_n,
  vga_b,
  vga_clk,
  vga_de,
  vga_g,
  vga_hs,
  vga_r,
  vga_vs
  );

  input clk_24m;  // source/rtl/VGA_Demo.v(4)
  input rst_n;  // source/rtl/VGA_Demo.v(5)
  output [7:0] vga_b;  // source/rtl/VGA_Demo.v(16)
  output vga_clk;  // source/rtl/VGA_Demo.v(8)
  output vga_de;  // source/rtl/VGA_Demo.v(12)
  output [7:0] vga_g;  // source/rtl/VGA_Demo.v(15)
  output vga_hs;  // source/rtl/VGA_Demo.v(9)
  output [7:0] vga_r;  // source/rtl/VGA_Demo.v(14)
  output vga_vs;  // source/rtl/VGA_Demo.v(10)

  wire [23:0] lcd_data;  // source/rtl/VGA_Demo.v(22)
  wire [11:0] lcd_xpos;  // source/rtl/VGA_Demo.v(20)
  wire [11:0] lcd_ypos;  // source/rtl/VGA_Demo.v(21)
  wire [7:0] vga_b_pad;  // source/rtl/VGA_Demo.v(16)
  wire [7:0] vga_g_pad;  // source/rtl/VGA_Demo.v(15)
  wire [7:0] vga_r_pad;  // source/rtl/VGA_Demo.v(14)
  wire clk_24m_pad;  // source/rtl/VGA_Demo.v(4)
  wire clk_vga;  // source/rtl/VGA_Demo.v(19)
  wire rst_n_pad;  // source/rtl/VGA_Demo.v(5)
  wire vga_clk_pad;  // source/rtl/VGA_Demo.v(8)
  wire vga_de_pad;  // source/rtl/VGA_Demo.v(12)
  wire vga_hs_pad;  // source/rtl/VGA_Demo.v(9)
  wire vga_vs_pad;  // source/rtl/VGA_Demo.v(10)

  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u0 (
    .ipad(clk_24m),
    .di(clk_24m_pad));  // source/rtl/VGA_Demo.v(4)
  EG_PHY_PAD #(
    //.LOCATION("G11"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u1 (
    .ipad(rst_n),
    .di(rst_n_pad));  // source/rtl/VGA_Demo.v(5)
  EG_PHY_PAD #(
    //.LOCATION("H2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u10 (
    .do({open_n35,open_n36,open_n37,vga_clk_pad}),
    .opad(vga_clk));  // source/rtl/VGA_Demo.v(8)
  EG_PHY_PAD #(
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u11 (
    .do({open_n52,open_n53,open_n54,vga_de_pad}),
    .opad(vga_de));  // source/rtl/VGA_Demo.v(12)
  EG_PHY_PAD #(
    //.LOCATION("H5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u12 (
    .do({open_n69,open_n70,open_n71,vga_g_pad[7]}),
    .opad(vga_g[7]));  // source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("H1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u13 (
    .do({open_n86,open_n87,open_n88,vga_g_pad[6]}),
    .opad(vga_g[6]));  // source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("J6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u14 (
    .do({open_n103,open_n104,open_n105,vga_g_pad[5]}),
    .opad(vga_g[5]));  // source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("H3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u15 (
    .do({open_n120,open_n121,open_n122,vga_g_pad[4]}),
    .opad(vga_g[4]));  // source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("J1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u16 (
    .do({open_n137,open_n138,open_n139,vga_g_pad[3]}),
    .opad(vga_g[3]));  // source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("K1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u17 (
    .do({open_n154,open_n155,open_n156,vga_g_pad[2]}),
    .opad(vga_g[2]));  // source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("K2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u18 (
    .do({open_n171,open_n172,open_n173,vga_g_pad[1]}),
    .opad(vga_g[1]));  // source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("L1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u19 (
    .do({open_n188,open_n189,open_n190,vga_g_pad[0]}),
    .opad(vga_g[0]));  // source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("C1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u2 (
    .do({open_n205,open_n206,open_n207,vga_b_pad[7]}),
    .opad(vga_b[7]));  // source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("J3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u20 (
    .do({open_n222,open_n223,open_n224,vga_hs_pad}),
    .opad(vga_hs));  // source/rtl/VGA_Demo.v(9)
  EG_PHY_PAD #(
    //.LOCATION("L5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u21 (
    .do({open_n239,open_n240,open_n241,vga_r_pad[7]}),
    .opad(vga_r[7]));  // source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("L3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u22 (
    .do({open_n256,open_n257,open_n258,vga_r_pad[6]}),
    .opad(vga_r[6]));  // source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("M2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u23 (
    .do({open_n273,open_n274,open_n275,vga_r_pad[5]}),
    .opad(vga_r[5]));  // source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("M1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u24 (
    .do({open_n290,open_n291,open_n292,vga_r_pad[4]}),
    .opad(vga_r[4]));  // source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("L4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u25 (
    .do({open_n307,open_n308,open_n309,vga_r_pad[3]}),
    .opad(vga_r[3]));  // source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("K5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u26 (
    .do({open_n324,open_n325,open_n326,vga_r_pad[2]}),
    .opad(vga_r[2]));  // source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("K3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u27 (
    .do({open_n341,open_n342,open_n343,vga_r_pad[1]}),
    .opad(vga_r[1]));  // source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("K6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u28 (
    .do({open_n358,open_n359,open_n360,vga_r_pad[0]}),
    .opad(vga_r[0]));  // source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("J4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u29 (
    .do({open_n375,open_n376,open_n377,vga_vs_pad}),
    .opad(vga_vs));  // source/rtl/VGA_Demo.v(10)
  EG_PHY_PAD #(
    //.LOCATION("D1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u3 (
    .do({open_n392,open_n393,open_n394,vga_b_pad[6]}),
    .opad(vga_b[6]));  // source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("E2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u4 (
    .do({open_n409,open_n410,open_n411,vga_b_pad[5]}),
    .opad(vga_b[5]));  // source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("G3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u5 (
    .do({open_n426,open_n427,open_n428,vga_b_pad[4]}),
    .opad(vga_b[4]));  // source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("E1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u6 (
    .do({open_n443,open_n444,open_n445,vga_b_pad[3]}),
    .opad(vga_b[3]));  // source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("F2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u7 (
    .do({open_n460,open_n461,open_n462,vga_b_pad[2]}),
    .opad(vga_b[2]));  // source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("F1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u8 (
    .do({open_n477,open_n478,open_n479,vga_b_pad[1]}),
    .opad(vga_b[1]));  // source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("G1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u9 (
    .do({open_n494,open_n495,open_n496,vga_b_pad[0]}),
    .opad(vga_b[0]));  // source/rtl/VGA_Demo.v(16)
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  Clk_div u0_PLL (
    .clk(clk_24m_pad),
    .rst_n(rst_n_pad),
    .clk_div(clk_vga));  // source/rtl/VGA_Demo.v(25)
  Driver u1_Driver (
    .clk(clk_vga),
    .lcd_data(lcd_data),
    .rst_n(rst_n_pad),
    .lcd_dclk(vga_clk_pad),
    .lcd_en(vga_de_pad),
    .lcd_hs(vga_hs_pad),
    .lcd_rgb({vga_r_pad,vga_g_pad,vga_b_pad}),
    .lcd_vs(vga_vs_pad),
    .lcd_xpos(lcd_xpos),
    .lcd_ypos(lcd_ypos));  // source/rtl/VGA_Demo.v(34)
  EG_PHY_MULT18 #(
    .CEPDMUX("1"),
    .CLKMUX("SIG"),
    .INPUTREGA("DISABLE"),
    .INPUTREGB("DISABLE"),
    .MODE("MULT18X18C"),
    .OUTPUTREG("ENABLE"),
    .RSTPDNMUX("SIG"),
    .SIGNEDAMUX("0"),
    .SIGNEDBMUX("0"))
    \u2_Display/mult0_  (
    .a({6'b000000,lcd_xpos}),
    .b({6'b000000,lcd_ypos}),
    .clk(clk_vga),
    .rstpdn(rst_n_pad),
    .p({open_n638,open_n639,open_n640,open_n641,open_n642,open_n643,open_n644,open_n645,open_n646,open_n647,open_n648,open_n649,lcd_data}));

endmodule 

module Clk_div  // source/rtl/Clk_div.v(2)
  (
  clk,
  rst_n,
  clk_div
  );

  input clk;  // source/rtl/Clk_div.v(4)
  input rst_n;  // source/rtl/Clk_div.v(5)
  output clk_div;  // source/rtl/Clk_div.v(7)

  wire n0;

  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTG0("(~D)"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    _al_u0 (
    .d({open_n8,rst_n}),
    .f({open_n26,n0}));
  PLL uut (
    .refclk(clk),
    .reset(n0),
    .clk0_out(clk_div));  // source/rtl/Clk_div.v(12)

endmodule 

module Driver  // source/rtl/Driver.v(11)
  (
  clk,
  lcd_data,
  rst_n,
  lcd_dclk,
  lcd_en,
  lcd_hs,
  lcd_rgb,
  lcd_vs,
  lcd_xpos,
  lcd_ypos
  );

  input clk;  // source/rtl/Driver.v(26)
  input [23:0] lcd_data;  // source/rtl/Driver.v(28)
  input rst_n;  // source/rtl/Driver.v(27)
  output lcd_dclk;  // source/rtl/Driver.v(31)
  output lcd_en;  // source/rtl/Driver.v(34)
  output lcd_hs;  // source/rtl/Driver.v(32)
  output [23:0] lcd_rgb;  // source/rtl/Driver.v(35)
  output lcd_vs;  // source/rtl/Driver.v(33)
  output [11:0] lcd_xpos;  // source/rtl/Driver.v(38)
  output [11:0] lcd_ypos;  // source/rtl/Driver.v(39)

  parameter H_BACK = 248;
  parameter H_DISP = 1280;
  parameter H_FRONT = 48;
  parameter H_SYNC = 112;
  parameter H_TOTAL = 1688;
  parameter V_BACK = 38;
  parameter V_DISP = 1024;
  parameter V_FRONT = 1;
  parameter V_SYNC = 3;
  parameter V_TOTAL = 1066;
  // localparam H_AHEAD = 12'b000000000001;
  wire [11:0] hcnt;  // source/rtl/Driver.v(44)
  wire [11:0] n2;
  wire [12:0] n20;
  wire [12:0] n21;
  wire [11:0] n7;
  wire [11:0] vcnt;  // source/rtl/Driver.v(45)
  wire _al_u61_o;
  wire _al_u62_o;
  wire _al_u64_o;
  wire _al_u65_o;
  wire \add0/c11 ;
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire \add1/c11 ;
  wire \add1/c3 ;
  wire \add1/c7 ;
  wire lt0_c1;
  wire lt0_c11;
  wire lt0_c3;
  wire lt0_c5;
  wire lt0_c7;
  wire lt0_c9;
  wire lt1_c1;
  wire lt1_c11;
  wire lt1_c3;
  wire lt1_c5;
  wire lt1_c7;
  wire lt1_c9;
  wire lt2_c1;
  wire lt2_c11;
  wire lt2_c3;
  wire lt2_c5;
  wire lt2_c7;
  wire lt2_c9;
  wire lt3_c1;
  wire lt3_c11;
  wire lt3_c3;
  wire lt3_c5;
  wire lt3_c7;
  wire lt3_c9;
  wire lt4_c1;
  wire lt4_c11;
  wire lt4_c3;
  wire lt4_c5;
  wire lt4_c7;
  wire lt4_c9;
  wire lt5_c1;
  wire lt5_c11;
  wire lt5_c3;
  wire lt5_c5;
  wire lt5_c7;
  wire lt5_c9;
  wire lt6_c1;
  wire lt6_c11;
  wire lt6_c3;
  wire lt6_c5;
  wire lt6_c7;
  wire lt6_c9;
  wire lt7_c1;
  wire lt7_c11;
  wire lt7_c3;
  wire lt7_c5;
  wire lt7_c7;
  wire lt7_c9;
  wire lt8_c1;
  wire lt8_c11;
  wire lt8_c3;
  wire lt8_c5;
  wire lt8_c7;
  wire lt8_c9;
  wire n1;
  wire n10;
  wire n11;
  wire n12;
  wire n14;
  wire n15;
  wire n17;
  wire n18;
  wire n4;
  wire n5;
  wire n6_lutinv;
  wire \sub0/c11 ;
  wire \sub0/c3 ;
  wire \sub0/c7 ;
  wire \sub1/c11 ;
  wire \sub1/c3 ;
  wire \sub1/c7 ;

  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u13|_al_u12  (
    .a({open_n0,n11}),
    .b({open_n1,n12}),
    .c({lcd_data[9],n14}),
    .d({lcd_en,n15}),
    .f({lcd_rgb[9],lcd_en}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u14|_al_u36  (
    .c({lcd_data[8],lcd_data[0]}),
    .d({lcd_en,lcd_en}),
    .f({lcd_rgb[8],lcd_rgb[0]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u15|_al_u35  (
    .c({lcd_data[7],lcd_data[1]}),
    .d({lcd_en,lcd_en}),
    .f({lcd_rgb[7],lcd_rgb[1]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u16|_al_u34  (
    .c({lcd_data[6],lcd_data[10]}),
    .d({lcd_en,lcd_en}),
    .f({lcd_rgb[6],lcd_rgb[10]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u17|_al_u33  (
    .c({lcd_data[5],lcd_data[11]}),
    .d({lcd_en,lcd_en}),
    .f({lcd_rgb[5],lcd_rgb[11]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u18|_al_u32  (
    .c({lcd_data[4],lcd_data[12]}),
    .d({lcd_en,lcd_en}),
    .f({lcd_rgb[4],lcd_rgb[12]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u19|_al_u31  (
    .c({lcd_data[3],lcd_data[13]}),
    .d({lcd_en,lcd_en}),
    .f({lcd_rgb[3],lcd_rgb[13]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u20|_al_u30  (
    .c({lcd_data[23],lcd_data[14]}),
    .d({lcd_en,lcd_en}),
    .f({lcd_rgb[23],lcd_rgb[14]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u21|_al_u29  (
    .c({lcd_data[22],lcd_data[15]}),
    .d({lcd_en,lcd_en}),
    .f({lcd_rgb[22],lcd_rgb[15]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u22|_al_u28  (
    .c({lcd_data[21],lcd_data[16]}),
    .d({lcd_en,lcd_en}),
    .f({lcd_rgb[21],lcd_rgb[16]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u23|_al_u27  (
    .c({lcd_data[20],lcd_data[17]}),
    .d({lcd_en,lcd_en}),
    .f({lcd_rgb[20],lcd_rgb[17]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u24|_al_u26  (
    .c({lcd_data[2],lcd_data[18]}),
    .d({lcd_en,lcd_en}),
    .f({lcd_rgb[2],lcd_rgb[18]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u37|_al_u60  (
    .a({n14,n14}),
    .b({n15,n15}),
    .c({n17,n17}),
    .d({n18,n18}),
    .e({n21[9],n20[0]}),
    .f({lcd_ypos[9],lcd_xpos[0]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u38|_al_u59  (
    .a({n14,n14}),
    .b({n15,n15}),
    .c({n17,n17}),
    .d({n18,n18}),
    .e({n21[8],n20[1]}),
    .f({lcd_ypos[8],lcd_xpos[1]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u39|_al_u58  (
    .a({n14,n14}),
    .b({n15,n15}),
    .c({n17,n17}),
    .d({n18,n18}),
    .e({n21[7],n20[10]}),
    .f({lcd_ypos[7],lcd_xpos[10]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u40|_al_u57  (
    .a({n14,n14}),
    .b({n15,n15}),
    .c({n17,n17}),
    .d({n18,n18}),
    .e({n21[6],n20[11]}),
    .f({lcd_ypos[6],lcd_xpos[11]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u41|_al_u56  (
    .a({n14,n14}),
    .b({n15,n15}),
    .c({n17,n17}),
    .d({n18,n18}),
    .e({n21[5],n20[2]}),
    .f({lcd_ypos[5],lcd_xpos[2]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u42|_al_u55  (
    .a({n14,n14}),
    .b({n15,n15}),
    .c({n17,n17}),
    .d({n18,n18}),
    .e({n21[4],n20[3]}),
    .f({lcd_ypos[4],lcd_xpos[3]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u43|_al_u54  (
    .a({n14,n14}),
    .b({n15,n15}),
    .c({n17,n17}),
    .d({n18,n18}),
    .e({n21[3],n20[4]}),
    .f({lcd_ypos[3],lcd_xpos[4]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u44|_al_u53  (
    .a({n14,n14}),
    .b({n15,n15}),
    .c({n17,n17}),
    .d({n18,n18}),
    .e({n21[2],n20[5]}),
    .f({lcd_ypos[2],lcd_xpos[5]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u45|_al_u52  (
    .a({n14,n14}),
    .b({n15,n15}),
    .c({n17,n17}),
    .d({n18,n18}),
    .e({n21[11],n20[6]}),
    .f({lcd_ypos[11],lcd_xpos[6]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u46|_al_u51  (
    .a({n14,n14}),
    .b({n15,n15}),
    .c({n17,n17}),
    .d({n18,n18}),
    .e({n21[10],n20[7]}),
    .f({lcd_ypos[10],lcd_xpos[7]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u47|_al_u50  (
    .a({n14,n14}),
    .b({n15,n15}),
    .c({n17,n17}),
    .d({n18,n18}),
    .e({n21[1],n20[8]}),
    .f({lcd_ypos[1],lcd_xpos[8]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u48|_al_u49  (
    .a({n14,n14}),
    .b({n15,n15}),
    .c({n17,n17}),
    .d({n18,n18}),
    .e({n21[0],n20[9]}),
    .f({lcd_ypos[0],lcd_xpos[9]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*~D*C*~B*A)"),
    //.LUTF1("(~0*D*~C*B*A)"),
    //.LUTG0("(1*~D*C*~B*A)"),
    //.LUTG1("(~1*D*~C*B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000100000000000),
    .INIT_LUTG0(16'b0000000000100000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u62|_al_u63  (
    .a({_al_u61_o,_al_u62_o}),
    .b({hcnt[2],hcnt[6]}),
    .c({hcnt[3],hcnt[7]}),
    .d({hcnt[4],hcnt[8]}),
    .e({hcnt[5],hcnt[9]}),
    .f({_al_u62_o,n5}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~0*~D*~C*~B*A)"),
    //.LUTF1("(0*~D*C*~B*A)"),
    //.LUTG0("(~1*~D*~C*~B*A)"),
    //.LUTG1("(1*~D*C*~B*A)"),
    .INIT_LUTF0(16'b0000000000000010),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b0000000000100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u65|_al_u66  (
    .a({_al_u64_o,_al_u65_o}),
    .b({vcnt[2],vcnt[6]}),
    .c({vcnt[3],vcnt[7]}),
    .d({vcnt[4],vcnt[8]}),
    .e({vcnt[5],vcnt[9]}),
    .f({_al_u65_o,n6_lutinv}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u79|_al_u25  (
    .c({open_n646,lcd_data[19]}),
    .d({clk,lcd_en}),
    .f({lcd_dclk,lcd_rgb[19]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(~D)"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u80|_al_u61  (
    .a({open_n671,hcnt[0]}),
    .b({open_n672,hcnt[1]}),
    .c({open_n673,hcnt[10]}),
    .d({n4,hcnt[11]}),
    .f({lcd_hs,_al_u61_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*A)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(~D*C*~B*A)"),
    //.LUTG1("(~D)"),
    .INIT_LUTF0(16'b0000000000100000),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000000100000),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u81|_al_u64  (
    .a({open_n698,vcnt[0]}),
    .b({open_n699,vcnt[1]}),
    .c({open_n700,vcnt[10]}),
    .d({n10,vcnt[11]}),
    .f({lcd_vs,_al_u64_o}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u82"),
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
    \add0/u11_al_u85  (
    .a({open_n725,hcnt[11]}),
    .c(2'b00),
    .d({open_n730,1'b0}),
    .fci(\add0/c11 ),
    .f({open_n747,n2[11]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u82"),
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
    \add0/u3_al_u83  (
    .a({hcnt[5],hcnt[3]}),
    .b({hcnt[6],hcnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n2[5],n2[3]}),
    .fco(\add0/c7 ),
    .fx({n2[6],n2[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u82"),
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
    \add0/u7_al_u84  (
    .a({hcnt[9],hcnt[7]}),
    .b({hcnt[10],hcnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n2[9],n2[7]}),
    .fco(\add0/c11 ),
    .fx({n2[10],n2[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u82"),
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
    \add0/ucin_al_u82  (
    .a({hcnt[1],1'b0}),
    .b({hcnt[2],hcnt[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n2[1],open_n806}),
    .fco(\add0/c3 ),
    .fx({n2[2],n2[0]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u86"),
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
    \add1/u11_al_u89  (
    .a({open_n809,vcnt[11]}),
    .c(2'b00),
    .d({open_n814,1'b0}),
    .fci(\add1/c11 ),
    .f({open_n831,n7[11]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u86"),
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
    \add1/u3_al_u87  (
    .a({vcnt[5],vcnt[3]}),
    .b({vcnt[6],vcnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c3 ),
    .f({n7[5],n7[3]}),
    .fco(\add1/c7 ),
    .fx({n7[6],n7[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u86"),
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
    \add1/u7_al_u88  (
    .a({vcnt[9],vcnt[7]}),
    .b({vcnt[10],vcnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c7 ),
    .f({n7[9],n7[7]}),
    .fco(\add1/c11 ),
    .fx({n7[10],n7[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u86"),
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
    \add1/ucin_al_u86  (
    .a({vcnt[1],1'b0}),
    .b({vcnt[2],vcnt[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n7[1],open_n890}),
    .fco(\add1/c3 ),
    .fx({n7[2],n7[0]}));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_0|lt0_cin  (
    .a({hcnt[0],1'b0}),
    .b({1'b1,open_n893}),
    .fco(lt0_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_10|lt0_9  (
    .a(hcnt[10:9]),
    .b(2'b11),
    .fci(lt0_c9),
    .fco(lt0_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_2|lt0_1  (
    .a(hcnt[2:1]),
    .b(2'b11),
    .fci(lt0_c1),
    .fco(lt0_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_4|lt0_3  (
    .a(hcnt[4:3]),
    .b(2'b10),
    .fci(lt0_c3),
    .fco(lt0_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_6|lt0_5  (
    .a(hcnt[6:5]),
    .b(2'b00),
    .fci(lt0_c5),
    .fco(lt0_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_8|lt0_7  (
    .a(hcnt[8:7]),
    .b(2'b01),
    .fci(lt0_c7),
    .fco(lt0_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_cout|lt0_11  (
    .a({1'b0,hcnt[11]}),
    .b(2'b10),
    .fci(lt0_c11),
    .f({n1,open_n1057}));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_0|lt1_cin  (
    .a({hcnt[0],1'b1}),
    .b({1'b1,open_n1063}),
    .fco(lt1_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_10|lt1_9  (
    .a(hcnt[10:9]),
    .b(2'b00),
    .fci(lt1_c9),
    .fco(lt1_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_2|lt1_1  (
    .a(hcnt[2:1]),
    .b(2'b11),
    .fci(lt1_c1),
    .fco(lt1_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_4|lt1_3  (
    .a(hcnt[4:3]),
    .b(2'b01),
    .fci(lt1_c3),
    .fco(lt1_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_6|lt1_5  (
    .a(hcnt[6:5]),
    .b(2'b11),
    .fci(lt1_c5),
    .fco(lt1_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_8|lt1_7  (
    .a(hcnt[8:7]),
    .b(2'b00),
    .fci(lt1_c7),
    .fco(lt1_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_cout|lt1_11  (
    .a({1'b0,hcnt[11]}),
    .b(2'b10),
    .fci(lt1_c11),
    .f({n4,open_n1227}));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_0|lt2_cin  (
    .a({vcnt[0],1'b1}),
    .b({1'b0,open_n1233}),
    .fco(lt2_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_10|lt2_9  (
    .a(vcnt[10:9]),
    .b(2'b00),
    .fci(lt2_c9),
    .fco(lt2_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_2|lt2_1  (
    .a(vcnt[2:1]),
    .b(2'b01),
    .fci(lt2_c1),
    .fco(lt2_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_4|lt2_3  (
    .a(vcnt[4:3]),
    .b(2'b00),
    .fci(lt2_c3),
    .fco(lt2_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_6|lt2_5  (
    .a(vcnt[6:5]),
    .b(2'b00),
    .fci(lt2_c5),
    .fco(lt2_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_8|lt2_7  (
    .a(vcnt[8:7]),
    .b(2'b00),
    .fci(lt2_c7),
    .fco(lt2_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_cout|lt2_11  (
    .a({1'b0,vcnt[11]}),
    .b(2'b10),
    .fci(lt2_c11),
    .f({n10,open_n1397}));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_0|lt3_cin  (
    .a(2'b01),
    .b({hcnt[0],open_n1403}),
    .fco(lt3_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_10|lt3_9  (
    .a(2'b00),
    .b(hcnt[10:9]),
    .fci(lt3_c9),
    .fco(lt3_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_2|lt3_1  (
    .a(2'b00),
    .b(hcnt[2:1]),
    .fci(lt3_c1),
    .fco(lt3_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_4|lt3_3  (
    .a(2'b01),
    .b(hcnt[4:3]),
    .fci(lt3_c3),
    .fco(lt3_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_6|lt3_5  (
    .a(2'b11),
    .b(hcnt[6:5]),
    .fci(lt3_c5),
    .fco(lt3_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_8|lt3_7  (
    .a(2'b10),
    .b(hcnt[8:7]),
    .fci(lt3_c7),
    .fco(lt3_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_cout|lt3_11  (
    .a(2'b00),
    .b({1'b1,hcnt[11]}),
    .fci(lt3_c11),
    .f({n11,open_n1567}));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_0|lt4_cin  (
    .a({hcnt[0],1'b0}),
    .b({1'b0,open_n1573}),
    .fco(lt4_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_10|lt4_9  (
    .a(hcnt[10:9]),
    .b(2'b11),
    .fci(lt4_c9),
    .fco(lt4_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_2|lt4_1  (
    .a(hcnt[2:1]),
    .b(2'b00),
    .fci(lt4_c1),
    .fco(lt4_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_4|lt4_3  (
    .a(hcnt[4:3]),
    .b(2'b01),
    .fci(lt4_c3),
    .fco(lt4_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_6|lt4_5  (
    .a(hcnt[6:5]),
    .b(2'b11),
    .fci(lt4_c5),
    .fco(lt4_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_8|lt4_7  (
    .a(hcnt[8:7]),
    .b(2'b00),
    .fci(lt4_c7),
    .fco(lt4_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_cout|lt4_11  (
    .a({1'b0,hcnt[11]}),
    .b(2'b10),
    .fci(lt4_c11),
    .f({n12,open_n1737}));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_0|lt5_cin  (
    .a(2'b11),
    .b({vcnt[0],open_n1743}),
    .fco(lt5_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_10|lt5_9  (
    .a(2'b00),
    .b(vcnt[10:9]),
    .fci(lt5_c9),
    .fco(lt5_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_2|lt5_1  (
    .a(2'b00),
    .b(vcnt[2:1]),
    .fci(lt5_c1),
    .fco(lt5_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_4|lt5_3  (
    .a(2'b01),
    .b(vcnt[4:3]),
    .fci(lt5_c3),
    .fco(lt5_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_6|lt5_5  (
    .a(2'b01),
    .b(vcnt[6:5]),
    .fci(lt5_c5),
    .fco(lt5_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_8|lt5_7  (
    .a(2'b00),
    .b(vcnt[8:7]),
    .fci(lt5_c7),
    .fco(lt5_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_cout|lt5_11  (
    .a(2'b00),
    .b({1'b1,vcnt[11]}),
    .fci(lt5_c11),
    .f({n14,open_n1907}));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_0|lt6_cin  (
    .a({vcnt[0],1'b0}),
    .b({1'b1,open_n1913}),
    .fco(lt6_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_10|lt6_9  (
    .a(vcnt[10:9]),
    .b(2'b10),
    .fci(lt6_c9),
    .fco(lt6_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_2|lt6_1  (
    .a(vcnt[2:1]),
    .b(2'b00),
    .fci(lt6_c1),
    .fco(lt6_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_4|lt6_3  (
    .a(vcnt[4:3]),
    .b(2'b01),
    .fci(lt6_c3),
    .fco(lt6_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_6|lt6_5  (
    .a(vcnt[6:5]),
    .b(2'b01),
    .fci(lt6_c5),
    .fco(lt6_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_8|lt6_7  (
    .a(vcnt[8:7]),
    .b(2'b00),
    .fci(lt6_c7),
    .fco(lt6_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_cout|lt6_11  (
    .a({1'b0,vcnt[11]}),
    .b(2'b10),
    .fci(lt6_c11),
    .f({n15,open_n2077}));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_0|lt7_cin  (
    .a(2'b11),
    .b({hcnt[0],open_n2083}),
    .fco(lt7_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_10|lt7_9  (
    .a(2'b00),
    .b(hcnt[10:9]),
    .fci(lt7_c9),
    .fco(lt7_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_2|lt7_1  (
    .a(2'b11),
    .b(hcnt[2:1]),
    .fci(lt7_c1),
    .fco(lt7_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_4|lt7_3  (
    .a(2'b00),
    .b(hcnt[4:3]),
    .fci(lt7_c3),
    .fco(lt7_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_6|lt7_5  (
    .a(2'b11),
    .b(hcnt[6:5]),
    .fci(lt7_c5),
    .fco(lt7_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_8|lt7_7  (
    .a(2'b10),
    .b(hcnt[8:7]),
    .fci(lt7_c7),
    .fco(lt7_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_cout|lt7_11  (
    .a(2'b00),
    .b({1'b1,hcnt[11]}),
    .fci(lt7_c11),
    .f({n17,open_n2247}));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_0|lt8_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_0|lt8_cin  (
    .a({hcnt[0],1'b0}),
    .b({1'b1,open_n2253}),
    .fco(lt8_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_0|lt8_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_10|lt8_9  (
    .a(hcnt[10:9]),
    .b(2'b11),
    .fci(lt8_c9),
    .fco(lt8_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_0|lt8_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2|lt8_1  (
    .a(hcnt[2:1]),
    .b(2'b11),
    .fci(lt8_c1),
    .fco(lt8_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_0|lt8_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_4|lt8_3  (
    .a(hcnt[4:3]),
    .b(2'b00),
    .fci(lt8_c3),
    .fco(lt8_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_0|lt8_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_6|lt8_5  (
    .a(hcnt[6:5]),
    .b(2'b11),
    .fci(lt8_c5),
    .fco(lt8_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_0|lt8_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_8|lt8_7  (
    .a(hcnt[8:7]),
    .b(2'b00),
    .fci(lt8_c7),
    .fco(lt8_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_0|lt8_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_cout|lt8_11  (
    .a({1'b0,hcnt[11]}),
    .b(2'b10),
    .fci(lt8_c11),
    .f({n18,open_n2417}));
  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
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
    \reg0_b0|reg0_b9  (
    .c({n7[0],n7[9]}),
    .ce(n5),
    .clk(clk),
    .d({n6_lutinv,n6_lutinv}),
    .sr(rst_n),
    .q({vcnt[0],vcnt[9]}));  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
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
    \reg0_b10|reg0_b8  (
    .c({n7[10],n7[8]}),
    .ce(n5),
    .clk(clk),
    .d({n6_lutinv,n6_lutinv}),
    .sr(rst_n),
    .q({vcnt[10],vcnt[8]}));  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
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
    \reg0_b11|reg0_b7  (
    .c({n7[11],n7[7]}),
    .ce(n5),
    .clk(clk),
    .d({n6_lutinv,n6_lutinv}),
    .sr(rst_n),
    .q({vcnt[11],vcnt[7]}));  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
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
    \reg0_b1|reg0_b6  (
    .c({n7[1],n7[6]}),
    .ce(n5),
    .clk(clk),
    .d({n6_lutinv,n6_lutinv}),
    .sr(rst_n),
    .q({vcnt[1],vcnt[6]}));  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
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
    \reg0_b2|reg0_b5  (
    .c({n7[2],n7[5]}),
    .ce(n5),
    .clk(clk),
    .d({n6_lutinv,n6_lutinv}),
    .sr(rst_n),
    .q({vcnt[2],vcnt[5]}));  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
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
    \reg0_b3|reg0_b4  (
    .c({n7[3],n7[4]}),
    .ce(n5),
    .clk(clk),
    .d({n6_lutinv,n6_lutinv}),
    .sr(rst_n),
    .q({vcnt[3],vcnt[4]}));  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b0|reg1_b9  (
    .c({n1,n1}),
    .clk(clk),
    .d({n2[0],n2[9]}),
    .sr(rst_n),
    .q({hcnt[0],hcnt[9]}));  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b10|reg1_b8  (
    .c({n1,n1}),
    .clk(clk),
    .d({n2[10],n2[8]}),
    .sr(rst_n),
    .q({hcnt[10],hcnt[8]}));  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b11|reg1_b7  (
    .c({n1,n1}),
    .clk(clk),
    .d({n2[11],n2[7]}),
    .sr(rst_n),
    .q({hcnt[11],hcnt[7]}));  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b1|reg1_b6  (
    .c({n1,n1}),
    .clk(clk),
    .d({n2[1],n2[6]}),
    .sr(rst_n),
    .q({hcnt[1],hcnt[6]}));  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b2|reg1_b5  (
    .c({n1,n1}),
    .clk(clk),
    .d({n2[2],n2[5]}),
    .sr(rst_n),
    .q({hcnt[2],hcnt[5]}));  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b3|reg1_b4  (
    .c({n1,n1}),
    .clk(clk),
    .d({n2[3],n2[4]}),
    .sr(rst_n),
    .q({hcnt[3],hcnt[4]}));  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.MACRO("sub0/ucin_al_u90"),
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
    \sub0/u11_al_u93  (
    .a({open_n2729,hcnt[11]}),
    .c(2'b11),
    .d({open_n2734,1'b0}),
    .fci(\sub0/c11 ),
    .f({open_n2751,n20[11]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub0/ucin_al_u90"),
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
    \sub0/u3_al_u91  (
    .a({hcnt[5],hcnt[3]}),
    .b({hcnt[6],hcnt[4]}),
    .c(2'b11),
    .d(2'b10),
    .e(2'b10),
    .fci(\sub0/c3 ),
    .f({n20[5],n20[3]}),
    .fco(\sub0/c7 ),
    .fx({n20[6],n20[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub0/ucin_al_u90"),
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
    \sub0/u7_al_u92  (
    .a({hcnt[9],hcnt[7]}),
    .b({hcnt[10],hcnt[8]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b01),
    .fci(\sub0/c7 ),
    .f({n20[9],n20[7]}),
    .fco(\sub0/c11 ),
    .fx({n20[10],n20[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub0/ucin_al_u90"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h0005),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \sub0/ucin_al_u90  (
    .a({hcnt[1],1'b0}),
    .b({hcnt[2],hcnt[0]}),
    .c(2'b11),
    .d(2'b11),
    .e(2'b11),
    .f({n20[1],open_n2810}),
    .fco(\sub0/c3 ),
    .fx({n20[2],n20[0]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub1/ucin_al_u94"),
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
    \sub1/u11_al_u97  (
    .a({open_n2813,vcnt[11]}),
    .c(2'b11),
    .d({open_n2818,1'b0}),
    .fci(\sub1/c11 ),
    .f({open_n2835,n21[11]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub1/ucin_al_u94"),
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
    \sub1/u3_al_u95  (
    .a({vcnt[5],vcnt[3]}),
    .b({vcnt[6],vcnt[4]}),
    .c(2'b11),
    .d(2'b11),
    .e(2'b00),
    .fci(\sub1/c3 ),
    .f({n21[5],n21[3]}),
    .fco(\sub1/c7 ),
    .fx({n21[6],n21[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub1/ucin_al_u94"),
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
    \sub1/u7_al_u96  (
    .a({vcnt[9],vcnt[7]}),
    .b({vcnt[10],vcnt[8]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b00),
    .fci(\sub1/c7 ),
    .f({n21[9],n21[7]}),
    .fco(\sub1/c11 ),
    .fx({n21[10],n21[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub1/ucin_al_u94"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h0005),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \sub1/ucin_al_u94  (
    .a({vcnt[1],1'b0}),
    .b({vcnt[2],vcnt[0]}),
    .c(2'b11),
    .d(2'b01),
    .e(2'b01),
    .f({n21[1],open_n2894}),
    .fco(\sub1/c3 ),
    .fx({n21[2],n21[0]}));

endmodule 

module PLL  // al_ip/PLL.v(22)
  (
  refclk,
  reset,
  clk0_out,
  extlock
  );

  input refclk;  // al_ip/PLL.v(27)
  input reset;  // al_ip/PLL.v(28)
  output clk0_out;  // al_ip/PLL.v(30)
  output extlock;  // al_ip/PLL.v(29)

  wire clk0_buf;  // al_ip/PLL.v(32)

  EG_PHY_GCLK bufg_feedback (
    .clki(clk0_buf),
    .clko(clk0_out));  // al_ip/PLL.v(34)
  EG_PHY_PLL #(
    .CLKC0_CPHASE(8),
    .CLKC0_DIV(9),
    .CLKC0_DIV2_ENABLE("DISABLE"),
    .CLKC0_ENABLE("ENABLE"),
    .CLKC0_FPHASE(0),
    .CLKC1_CPHASE(1),
    .CLKC1_DIV(1),
    .CLKC1_DIV2_ENABLE("DISABLE"),
    .CLKC1_ENABLE("DISABLE"),
    .CLKC1_FPHASE(0),
    .CLKC2_CPHASE(1),
    .CLKC2_DIV(1),
    .CLKC2_DIV2_ENABLE("DISABLE"),
    .CLKC2_ENABLE("DISABLE"),
    .CLKC2_FPHASE(0),
    .CLKC3_CPHASE(1),
    .CLKC3_DIV(1),
    .CLKC3_DIV2_ENABLE("DISABLE"),
    .CLKC3_ENABLE("DISABLE"),
    .CLKC3_FPHASE(0),
    .CLKC4_CPHASE(1),
    .CLKC4_DIV(1),
    .CLKC4_DIV2_ENABLE("DISABLE"),
    .CLKC4_ENABLE("DISABLE"),
    .CLKC4_FPHASE(0),
    .DERIVE_PLL_CLOCKS("DISABLE"),
    .DPHASE_SOURCE("DISABLE"),
    .DYNCFG("DISABLE"),
    .FBCLK_DIV(9),
    .FEEDBK_MODE("NORMAL"),
    .FEEDBK_PATH("CLKC0_EXT"),
    .FIN("24.000"),
    .FREQ_LOCK_ACCURACY(2),
    .GEN_BASIC_CLOCK("DISABLE"),
    .GMC_GAIN(6),
    .GMC_TEST(14),
    .ICP_CURRENT(3),
    .IF_ESCLKSTSW("DISABLE"),
    .INTFB_WAKE("DISABLE"),
    .KVCO(6),
    .LPF_CAPACITOR(3),
    .LPF_RESISTOR(2),
    .NORESET("DISABLE"),
    .ODIV_MUXC0("DIV"),
    .ODIV_MUXC1("DIV"),
    .ODIV_MUXC2("DIV"),
    .ODIV_MUXC3("DIV"),
    .ODIV_MUXC4("DIV"),
    .PLLC2RST_ENA("DISABLE"),
    .PLLC34RST_ENA("DISABLE"),
    .PLLMRST_ENA("DISABLE"),
    .PLLRST_ENA("ENABLE"),
    .PLL_LOCK_MODE(0),
    .PREDIV_MUXC0("VCO"),
    .PREDIV_MUXC1("VCO"),
    .PREDIV_MUXC2("VCO"),
    .PREDIV_MUXC3("VCO"),
    .PREDIV_MUXC4("VCO"),
    .REFCLK_DIV(2),
    .REFCLK_SEL("INTERNAL"),
    .STDBY_ENABLE("DISABLE"),
    .STDBY_VCO_ENA("DISABLE"),
    .SYNC_ENABLE("DISABLE"),
    .VCO_NORESET("DISABLE"))
    pll_inst (
    .daddr(6'b000000),
    .dclk(1'b0),
    .dcs(1'b0),
    .di(8'b00000000),
    .dwe(1'b0),
    .fbclk(clk0_out),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(refclk),
    .reset(reset),
    .stdby(1'b0),
    .clkc({open_n0,open_n1,open_n2,open_n3,clk0_buf}),
    .extlock(extlock));  // al_ip/PLL.v(57)

endmodule 

