// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

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

  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u0 (
    .a(rst_n),
    .o(n0));
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
  wire [11:0] n3;
  wire [11:0] n7;
  wire [11:0] n8;
  wire [11:0] vcnt;  // source/rtl/Driver.v(45)
  wire _al_u61_o;
  wire _al_u62_o;
  wire _al_u64_o;
  wire _al_u65_o;
  wire \add0/c0 ;
  wire \add0/c1 ;
  wire \add0/c10 ;
  wire \add0/c11 ;
  wire \add0/c2 ;
  wire \add0/c3 ;
  wire \add0/c4 ;
  wire \add0/c5 ;
  wire \add0/c6 ;
  wire \add0/c7 ;
  wire \add0/c8 ;
  wire \add0/c9 ;
  wire \add1/c0 ;
  wire \add1/c1 ;
  wire \add1/c10 ;
  wire \add1/c11 ;
  wire \add1/c2 ;
  wire \add1/c3 ;
  wire \add1/c4 ;
  wire \add1/c5 ;
  wire \add1/c6 ;
  wire \add1/c7 ;
  wire \add1/c8 ;
  wire \add1/c9 ;
  wire lt0_c0;
  wire lt0_c1;
  wire lt0_c10;
  wire lt0_c11;
  wire lt0_c12;
  wire lt0_c2;
  wire lt0_c3;
  wire lt0_c4;
  wire lt0_c5;
  wire lt0_c6;
  wire lt0_c7;
  wire lt0_c8;
  wire lt0_c9;
  wire lt1_c0;
  wire lt1_c1;
  wire lt1_c10;
  wire lt1_c11;
  wire lt1_c12;
  wire lt1_c2;
  wire lt1_c3;
  wire lt1_c4;
  wire lt1_c5;
  wire lt1_c6;
  wire lt1_c7;
  wire lt1_c8;
  wire lt1_c9;
  wire lt2_c0;
  wire lt2_c1;
  wire lt2_c10;
  wire lt2_c11;
  wire lt2_c12;
  wire lt2_c2;
  wire lt2_c3;
  wire lt2_c4;
  wire lt2_c5;
  wire lt2_c6;
  wire lt2_c7;
  wire lt2_c8;
  wire lt2_c9;
  wire lt3_c0;
  wire lt3_c1;
  wire lt3_c10;
  wire lt3_c11;
  wire lt3_c12;
  wire lt3_c2;
  wire lt3_c3;
  wire lt3_c4;
  wire lt3_c5;
  wire lt3_c6;
  wire lt3_c7;
  wire lt3_c8;
  wire lt3_c9;
  wire lt4_c0;
  wire lt4_c1;
  wire lt4_c10;
  wire lt4_c11;
  wire lt4_c12;
  wire lt4_c2;
  wire lt4_c3;
  wire lt4_c4;
  wire lt4_c5;
  wire lt4_c6;
  wire lt4_c7;
  wire lt4_c8;
  wire lt4_c9;
  wire lt5_c0;
  wire lt5_c1;
  wire lt5_c10;
  wire lt5_c11;
  wire lt5_c12;
  wire lt5_c2;
  wire lt5_c3;
  wire lt5_c4;
  wire lt5_c5;
  wire lt5_c6;
  wire lt5_c7;
  wire lt5_c8;
  wire lt5_c9;
  wire lt6_c0;
  wire lt6_c1;
  wire lt6_c10;
  wire lt6_c11;
  wire lt6_c12;
  wire lt6_c2;
  wire lt6_c3;
  wire lt6_c4;
  wire lt6_c5;
  wire lt6_c6;
  wire lt6_c7;
  wire lt6_c8;
  wire lt6_c9;
  wire lt7_c0;
  wire lt7_c1;
  wire lt7_c10;
  wire lt7_c11;
  wire lt7_c12;
  wire lt7_c2;
  wire lt7_c3;
  wire lt7_c4;
  wire lt7_c5;
  wire lt7_c6;
  wire lt7_c7;
  wire lt7_c8;
  wire lt7_c9;
  wire lt8_c0;
  wire lt8_c1;
  wire lt8_c10;
  wire lt8_c11;
  wire lt8_c12;
  wire lt8_c2;
  wire lt8_c3;
  wire lt8_c4;
  wire lt8_c5;
  wire lt8_c6;
  wire lt8_c7;
  wire lt8_c8;
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
  wire \sub0/c0 ;
  wire \sub0/c1 ;
  wire \sub0/c10 ;
  wire \sub0/c11 ;
  wire \sub0/c2 ;
  wire \sub0/c3 ;
  wire \sub0/c4 ;
  wire \sub0/c5 ;
  wire \sub0/c6 ;
  wire \sub0/c7 ;
  wire \sub0/c8 ;
  wire \sub0/c9 ;
  wire \sub1/c0 ;
  wire \sub1/c1 ;
  wire \sub1/c10 ;
  wire \sub1/c11 ;
  wire \sub1/c2 ;
  wire \sub1/c3 ;
  wire \sub1/c4 ;
  wire \sub1/c5 ;
  wire \sub1/c6 ;
  wire \sub1/c7 ;
  wire \sub1/c8 ;
  wire \sub1/c9 ;

  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u0 (
    .a(n2[9]),
    .b(n1),
    .o(n3[9]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u1 (
    .a(n2[8]),
    .b(n1),
    .o(n3[8]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u10 (
    .a(n2[1]),
    .b(n1),
    .o(n3[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u11 (
    .a(n2[0]),
    .b(n1),
    .o(n3[0]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u12 (
    .a(n11),
    .b(n12),
    .c(n14),
    .d(n15),
    .o(lcd_en));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u13 (
    .a(lcd_en),
    .b(lcd_data[9]),
    .o(lcd_rgb[9]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u14 (
    .a(lcd_en),
    .b(lcd_data[8]),
    .o(lcd_rgb[8]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u15 (
    .a(lcd_en),
    .b(lcd_data[7]),
    .o(lcd_rgb[7]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u16 (
    .a(lcd_en),
    .b(lcd_data[6]),
    .o(lcd_rgb[6]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u17 (
    .a(lcd_en),
    .b(lcd_data[5]),
    .o(lcd_rgb[5]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u18 (
    .a(lcd_en),
    .b(lcd_data[4]),
    .o(lcd_rgb[4]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u19 (
    .a(lcd_en),
    .b(lcd_data[3]),
    .o(lcd_rgb[3]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u2 (
    .a(n2[7]),
    .b(n1),
    .o(n3[7]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u20 (
    .a(lcd_en),
    .b(lcd_data[23]),
    .o(lcd_rgb[23]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u21 (
    .a(lcd_en),
    .b(lcd_data[22]),
    .o(lcd_rgb[22]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u22 (
    .a(lcd_en),
    .b(lcd_data[21]),
    .o(lcd_rgb[21]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u23 (
    .a(lcd_en),
    .b(lcd_data[20]),
    .o(lcd_rgb[20]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u24 (
    .a(lcd_en),
    .b(lcd_data[2]),
    .o(lcd_rgb[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u25 (
    .a(lcd_en),
    .b(lcd_data[19]),
    .o(lcd_rgb[19]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u26 (
    .a(lcd_en),
    .b(lcd_data[18]),
    .o(lcd_rgb[18]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u27 (
    .a(lcd_en),
    .b(lcd_data[17]),
    .o(lcd_rgb[17]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u28 (
    .a(lcd_en),
    .b(lcd_data[16]),
    .o(lcd_rgb[16]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u29 (
    .a(lcd_en),
    .b(lcd_data[15]),
    .o(lcd_rgb[15]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u3 (
    .a(n2[6]),
    .b(n1),
    .o(n3[6]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u30 (
    .a(lcd_en),
    .b(lcd_data[14]),
    .o(lcd_rgb[14]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u31 (
    .a(lcd_en),
    .b(lcd_data[13]),
    .o(lcd_rgb[13]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u32 (
    .a(lcd_en),
    .b(lcd_data[12]),
    .o(lcd_rgb[12]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u33 (
    .a(lcd_en),
    .b(lcd_data[11]),
    .o(lcd_rgb[11]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u34 (
    .a(lcd_en),
    .b(lcd_data[10]),
    .o(lcd_rgb[10]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u35 (
    .a(lcd_en),
    .b(lcd_data[1]),
    .o(lcd_rgb[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u36 (
    .a(lcd_en),
    .b(lcd_data[0]),
    .o(lcd_rgb[0]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u37 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n21[9]),
    .o(lcd_ypos[9]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u38 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n21[8]),
    .o(lcd_ypos[8]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u39 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n21[7]),
    .o(lcd_ypos[7]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u4 (
    .a(n2[5]),
    .b(n1),
    .o(n3[5]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u40 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n21[6]),
    .o(lcd_ypos[6]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u41 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n21[5]),
    .o(lcd_ypos[5]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u42 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n21[4]),
    .o(lcd_ypos[4]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u43 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n21[3]),
    .o(lcd_ypos[3]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u44 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n21[2]),
    .o(lcd_ypos[2]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u45 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n21[11]),
    .o(lcd_ypos[11]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u46 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n21[10]),
    .o(lcd_ypos[10]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u47 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n21[1]),
    .o(lcd_ypos[1]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u48 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n21[0]),
    .o(lcd_ypos[0]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u49 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n20[9]),
    .o(lcd_xpos[9]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u5 (
    .a(n2[4]),
    .b(n1),
    .o(n3[4]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u50 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n20[8]),
    .o(lcd_xpos[8]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u51 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n20[7]),
    .o(lcd_xpos[7]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u52 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n20[6]),
    .o(lcd_xpos[6]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u53 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n20[5]),
    .o(lcd_xpos[5]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u54 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n20[4]),
    .o(lcd_xpos[4]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u55 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n20[3]),
    .o(lcd_xpos[3]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u56 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n20[2]),
    .o(lcd_xpos[2]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u57 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n20[11]),
    .o(lcd_xpos[11]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u58 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n20[10]),
    .o(lcd_xpos[10]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u59 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n20[1]),
    .o(lcd_xpos[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u6 (
    .a(n2[3]),
    .b(n1),
    .o(n3[3]));
  AL_MAP_LUT5 #(
    .EQN("(E*D*C*B*A)"),
    .INIT(32'h80000000))
    _al_u60 (
    .a(n14),
    .b(n15),
    .c(n17),
    .d(n18),
    .e(n20[0]),
    .o(lcd_xpos[0]));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u61 (
    .a(hcnt[0]),
    .b(hcnt[1]),
    .c(hcnt[10]),
    .d(hcnt[11]),
    .o(_al_u61_o));
  AL_MAP_LUT5 #(
    .EQN("(~E*D*~C*B*A)"),
    .INIT(32'h00000800))
    _al_u62 (
    .a(_al_u61_o),
    .b(hcnt[2]),
    .c(hcnt[3]),
    .d(hcnt[4]),
    .e(hcnt[5]),
    .o(_al_u62_o));
  AL_MAP_LUT5 #(
    .EQN("(E*~D*C*~B*A)"),
    .INIT(32'h00200000))
    _al_u63 (
    .a(_al_u62_o),
    .b(hcnt[6]),
    .c(hcnt[7]),
    .d(hcnt[8]),
    .e(hcnt[9]),
    .o(n5));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    _al_u64 (
    .a(vcnt[0]),
    .b(vcnt[1]),
    .c(vcnt[10]),
    .d(vcnt[11]),
    .o(_al_u64_o));
  AL_MAP_LUT5 #(
    .EQN("(E*~D*C*~B*A)"),
    .INIT(32'h00200000))
    _al_u65 (
    .a(_al_u64_o),
    .b(vcnt[2]),
    .c(vcnt[3]),
    .d(vcnt[4]),
    .e(vcnt[5]),
    .o(_al_u65_o));
  AL_MAP_LUT5 #(
    .EQN("(~E*~D*~C*~B*A)"),
    .INIT(32'h00000002))
    _al_u66 (
    .a(_al_u65_o),
    .b(vcnt[6]),
    .c(vcnt[7]),
    .d(vcnt[8]),
    .e(vcnt[9]),
    .o(n6_lutinv));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u67 (
    .a(n6_lutinv),
    .b(n7[9]),
    .o(n8[9]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u68 (
    .a(n6_lutinv),
    .b(n7[8]),
    .o(n8[8]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u69 (
    .a(n6_lutinv),
    .b(n7[7]),
    .o(n8[7]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u7 (
    .a(n2[2]),
    .b(n1),
    .o(n3[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u70 (
    .a(n6_lutinv),
    .b(n7[6]),
    .o(n8[6]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u71 (
    .a(n6_lutinv),
    .b(n7[5]),
    .o(n8[5]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u72 (
    .a(n6_lutinv),
    .b(n7[4]),
    .o(n8[4]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u73 (
    .a(n6_lutinv),
    .b(n7[3]),
    .o(n8[3]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u74 (
    .a(n6_lutinv),
    .b(n7[2]),
    .o(n8[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u75 (
    .a(n6_lutinv),
    .b(n7[11]),
    .o(n8[11]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u76 (
    .a(n6_lutinv),
    .b(n7[10]),
    .o(n8[10]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u77 (
    .a(n6_lutinv),
    .b(n7[1]),
    .o(n8[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u78 (
    .a(n6_lutinv),
    .b(n7[0]),
    .o(n8[0]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u79 (
    .a(clk),
    .o(lcd_dclk));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u8 (
    .a(n2[11]),
    .b(n1),
    .o(n3[11]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u80 (
    .a(n4),
    .o(lcd_hs));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u81 (
    .a(n10),
    .o(lcd_vs));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u9 (
    .a(n2[10]),
    .b(n1),
    .o(n3[10]));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(hcnt[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n2[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(hcnt[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n2[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u10  (
    .a(hcnt[10]),
    .b(1'b0),
    .c(\add0/c10 ),
    .o({\add0/c11 ,n2[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u11  (
    .a(hcnt[11]),
    .b(1'b0),
    .c(\add0/c11 ),
    .o({open_n0,n2[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(hcnt[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n2[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(hcnt[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({\add0/c4 ,n2[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u4  (
    .a(hcnt[4]),
    .b(1'b0),
    .c(\add0/c4 ),
    .o({\add0/c5 ,n2[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u5  (
    .a(hcnt[5]),
    .b(1'b0),
    .c(\add0/c5 ),
    .o({\add0/c6 ,n2[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u6  (
    .a(hcnt[6]),
    .b(1'b0),
    .c(\add0/c6 ),
    .o({\add0/c7 ,n2[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u7  (
    .a(hcnt[7]),
    .b(1'b0),
    .c(\add0/c7 ),
    .o({\add0/c8 ,n2[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u8  (
    .a(hcnt[8]),
    .b(1'b0),
    .c(\add0/c8 ),
    .o({\add0/c9 ,n2[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u9  (
    .a(hcnt[9]),
    .b(1'b0),
    .c(\add0/c9 ),
    .o({\add0/c10 ,n2[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n3}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u0  (
    .a(vcnt[0]),
    .b(1'b1),
    .c(\add1/c0 ),
    .o({\add1/c1 ,n7[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u1  (
    .a(vcnt[1]),
    .b(1'b0),
    .c(\add1/c1 ),
    .o({\add1/c2 ,n7[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u10  (
    .a(vcnt[10]),
    .b(1'b0),
    .c(\add1/c10 ),
    .o({\add1/c11 ,n7[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u11  (
    .a(vcnt[11]),
    .b(1'b0),
    .c(\add1/c11 ),
    .o({open_n4,n7[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u2  (
    .a(vcnt[2]),
    .b(1'b0),
    .c(\add1/c2 ),
    .o({\add1/c3 ,n7[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u3  (
    .a(vcnt[3]),
    .b(1'b0),
    .c(\add1/c3 ),
    .o({\add1/c4 ,n7[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u4  (
    .a(vcnt[4]),
    .b(1'b0),
    .c(\add1/c4 ),
    .o({\add1/c5 ,n7[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u5  (
    .a(vcnt[5]),
    .b(1'b0),
    .c(\add1/c5 ),
    .o({\add1/c6 ,n7[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u6  (
    .a(vcnt[6]),
    .b(1'b0),
    .c(\add1/c6 ),
    .o({\add1/c7 ,n7[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u7  (
    .a(vcnt[7]),
    .b(1'b0),
    .c(\add1/c7 ),
    .o({\add1/c8 ,n7[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u8  (
    .a(vcnt[8]),
    .b(1'b0),
    .c(\add1/c8 ),
    .o({\add1/c9 ,n7[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u9  (
    .a(vcnt[9]),
    .b(1'b0),
    .c(\add1/c9 ),
    .o({\add1/c10 ,n7[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add1/ucin  (
    .a(1'b0),
    .o({\add1/c0 ,open_n7}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_0 (
    .a(hcnt[0]),
    .b(1'b1),
    .c(lt0_c0),
    .o({lt0_c1,open_n8}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_1 (
    .a(hcnt[1]),
    .b(1'b1),
    .c(lt0_c1),
    .o({lt0_c2,open_n9}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_10 (
    .a(hcnt[10]),
    .b(1'b1),
    .c(lt0_c10),
    .o({lt0_c11,open_n10}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_11 (
    .a(hcnt[11]),
    .b(1'b0),
    .c(lt0_c11),
    .o({lt0_c12,open_n11}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_2 (
    .a(hcnt[2]),
    .b(1'b1),
    .c(lt0_c2),
    .o({lt0_c3,open_n12}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_3 (
    .a(hcnt[3]),
    .b(1'b0),
    .c(lt0_c3),
    .o({lt0_c4,open_n13}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_4 (
    .a(hcnt[4]),
    .b(1'b1),
    .c(lt0_c4),
    .o({lt0_c5,open_n14}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_5 (
    .a(hcnt[5]),
    .b(1'b0),
    .c(lt0_c5),
    .o({lt0_c6,open_n15}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_6 (
    .a(hcnt[6]),
    .b(1'b0),
    .c(lt0_c6),
    .o({lt0_c7,open_n16}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_7 (
    .a(hcnt[7]),
    .b(1'b1),
    .c(lt0_c7),
    .o({lt0_c8,open_n17}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_8 (
    .a(hcnt[8]),
    .b(1'b0),
    .c(lt0_c8),
    .o({lt0_c9,open_n18}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_9 (
    .a(hcnt[9]),
    .b(1'b1),
    .c(lt0_c9),
    .o({lt0_c10,open_n19}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    lt0_cin (
    .a(1'b0),
    .o({lt0_c0,open_n22}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_cout (
    .a(1'b0),
    .b(1'b1),
    .c(lt0_c12),
    .o({open_n23,n1}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_0 (
    .a(hcnt[0]),
    .b(1'b1),
    .c(lt1_c0),
    .o({lt1_c1,open_n24}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_1 (
    .a(hcnt[1]),
    .b(1'b1),
    .c(lt1_c1),
    .o({lt1_c2,open_n25}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_10 (
    .a(hcnt[10]),
    .b(1'b0),
    .c(lt1_c10),
    .o({lt1_c11,open_n26}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_11 (
    .a(hcnt[11]),
    .b(1'b0),
    .c(lt1_c11),
    .o({lt1_c12,open_n27}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_2 (
    .a(hcnt[2]),
    .b(1'b1),
    .c(lt1_c2),
    .o({lt1_c3,open_n28}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_3 (
    .a(hcnt[3]),
    .b(1'b1),
    .c(lt1_c3),
    .o({lt1_c4,open_n29}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_4 (
    .a(hcnt[4]),
    .b(1'b0),
    .c(lt1_c4),
    .o({lt1_c5,open_n30}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_5 (
    .a(hcnt[5]),
    .b(1'b1),
    .c(lt1_c5),
    .o({lt1_c6,open_n31}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_6 (
    .a(hcnt[6]),
    .b(1'b1),
    .c(lt1_c6),
    .o({lt1_c7,open_n32}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_7 (
    .a(hcnt[7]),
    .b(1'b0),
    .c(lt1_c7),
    .o({lt1_c8,open_n33}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_8 (
    .a(hcnt[8]),
    .b(1'b0),
    .c(lt1_c8),
    .o({lt1_c9,open_n34}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_9 (
    .a(hcnt[9]),
    .b(1'b0),
    .c(lt1_c9),
    .o({lt1_c10,open_n35}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    lt1_cin (
    .a(1'b1),
    .o({lt1_c0,open_n38}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt1_cout (
    .a(1'b0),
    .b(1'b1),
    .c(lt1_c12),
    .o({open_n39,n4}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_0 (
    .a(vcnt[0]),
    .b(1'b0),
    .c(lt2_c0),
    .o({lt2_c1,open_n40}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_1 (
    .a(vcnt[1]),
    .b(1'b1),
    .c(lt2_c1),
    .o({lt2_c2,open_n41}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_10 (
    .a(vcnt[10]),
    .b(1'b0),
    .c(lt2_c10),
    .o({lt2_c11,open_n42}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_11 (
    .a(vcnt[11]),
    .b(1'b0),
    .c(lt2_c11),
    .o({lt2_c12,open_n43}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_2 (
    .a(vcnt[2]),
    .b(1'b0),
    .c(lt2_c2),
    .o({lt2_c3,open_n44}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_3 (
    .a(vcnt[3]),
    .b(1'b0),
    .c(lt2_c3),
    .o({lt2_c4,open_n45}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_4 (
    .a(vcnt[4]),
    .b(1'b0),
    .c(lt2_c4),
    .o({lt2_c5,open_n46}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_5 (
    .a(vcnt[5]),
    .b(1'b0),
    .c(lt2_c5),
    .o({lt2_c6,open_n47}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_6 (
    .a(vcnt[6]),
    .b(1'b0),
    .c(lt2_c6),
    .o({lt2_c7,open_n48}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_7 (
    .a(vcnt[7]),
    .b(1'b0),
    .c(lt2_c7),
    .o({lt2_c8,open_n49}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_8 (
    .a(vcnt[8]),
    .b(1'b0),
    .c(lt2_c8),
    .o({lt2_c9,open_n50}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_9 (
    .a(vcnt[9]),
    .b(1'b0),
    .c(lt2_c9),
    .o({lt2_c10,open_n51}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    lt2_cin (
    .a(1'b1),
    .o({lt2_c0,open_n54}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt2_cout (
    .a(1'b0),
    .b(1'b1),
    .c(lt2_c12),
    .o({open_n55,n10}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_0 (
    .a(1'b0),
    .b(hcnt[0]),
    .c(lt3_c0),
    .o({lt3_c1,open_n56}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_1 (
    .a(1'b0),
    .b(hcnt[1]),
    .c(lt3_c1),
    .o({lt3_c2,open_n57}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_10 (
    .a(1'b0),
    .b(hcnt[10]),
    .c(lt3_c10),
    .o({lt3_c11,open_n58}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_11 (
    .a(1'b0),
    .b(hcnt[11]),
    .c(lt3_c11),
    .o({lt3_c12,open_n59}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_2 (
    .a(1'b0),
    .b(hcnt[2]),
    .c(lt3_c2),
    .o({lt3_c3,open_n60}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_3 (
    .a(1'b1),
    .b(hcnt[3]),
    .c(lt3_c3),
    .o({lt3_c4,open_n61}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_4 (
    .a(1'b0),
    .b(hcnt[4]),
    .c(lt3_c4),
    .o({lt3_c5,open_n62}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_5 (
    .a(1'b1),
    .b(hcnt[5]),
    .c(lt3_c5),
    .o({lt3_c6,open_n63}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_6 (
    .a(1'b1),
    .b(hcnt[6]),
    .c(lt3_c6),
    .o({lt3_c7,open_n64}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_7 (
    .a(1'b0),
    .b(hcnt[7]),
    .c(lt3_c7),
    .o({lt3_c8,open_n65}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_8 (
    .a(1'b1),
    .b(hcnt[8]),
    .c(lt3_c8),
    .o({lt3_c9,open_n66}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_9 (
    .a(1'b0),
    .b(hcnt[9]),
    .c(lt3_c9),
    .o({lt3_c10,open_n67}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    lt3_cin (
    .a(1'b1),
    .o({lt3_c0,open_n70}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt3_cout (
    .a(1'b0),
    .b(1'b1),
    .c(lt3_c12),
    .o({open_n71,n11}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_0 (
    .a(hcnt[0]),
    .b(1'b0),
    .c(lt4_c0),
    .o({lt4_c1,open_n72}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_1 (
    .a(hcnt[1]),
    .b(1'b0),
    .c(lt4_c1),
    .o({lt4_c2,open_n73}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_10 (
    .a(hcnt[10]),
    .b(1'b1),
    .c(lt4_c10),
    .o({lt4_c11,open_n74}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_11 (
    .a(hcnt[11]),
    .b(1'b0),
    .c(lt4_c11),
    .o({lt4_c12,open_n75}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_2 (
    .a(hcnt[2]),
    .b(1'b0),
    .c(lt4_c2),
    .o({lt4_c3,open_n76}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_3 (
    .a(hcnt[3]),
    .b(1'b1),
    .c(lt4_c3),
    .o({lt4_c4,open_n77}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_4 (
    .a(hcnt[4]),
    .b(1'b0),
    .c(lt4_c4),
    .o({lt4_c5,open_n78}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_5 (
    .a(hcnt[5]),
    .b(1'b1),
    .c(lt4_c5),
    .o({lt4_c6,open_n79}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_6 (
    .a(hcnt[6]),
    .b(1'b1),
    .c(lt4_c6),
    .o({lt4_c7,open_n80}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_7 (
    .a(hcnt[7]),
    .b(1'b0),
    .c(lt4_c7),
    .o({lt4_c8,open_n81}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_8 (
    .a(hcnt[8]),
    .b(1'b0),
    .c(lt4_c8),
    .o({lt4_c9,open_n82}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_9 (
    .a(hcnt[9]),
    .b(1'b1),
    .c(lt4_c9),
    .o({lt4_c10,open_n83}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    lt4_cin (
    .a(1'b0),
    .o({lt4_c0,open_n86}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt4_cout (
    .a(1'b0),
    .b(1'b1),
    .c(lt4_c12),
    .o({open_n87,n12}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_0 (
    .a(1'b1),
    .b(vcnt[0]),
    .c(lt5_c0),
    .o({lt5_c1,open_n88}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_1 (
    .a(1'b0),
    .b(vcnt[1]),
    .c(lt5_c1),
    .o({lt5_c2,open_n89}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_10 (
    .a(1'b0),
    .b(vcnt[10]),
    .c(lt5_c10),
    .o({lt5_c11,open_n90}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_11 (
    .a(1'b0),
    .b(vcnt[11]),
    .c(lt5_c11),
    .o({lt5_c12,open_n91}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_2 (
    .a(1'b0),
    .b(vcnt[2]),
    .c(lt5_c2),
    .o({lt5_c3,open_n92}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_3 (
    .a(1'b1),
    .b(vcnt[3]),
    .c(lt5_c3),
    .o({lt5_c4,open_n93}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_4 (
    .a(1'b0),
    .b(vcnt[4]),
    .c(lt5_c4),
    .o({lt5_c5,open_n94}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_5 (
    .a(1'b1),
    .b(vcnt[5]),
    .c(lt5_c5),
    .o({lt5_c6,open_n95}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_6 (
    .a(1'b0),
    .b(vcnt[6]),
    .c(lt5_c6),
    .o({lt5_c7,open_n96}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_7 (
    .a(1'b0),
    .b(vcnt[7]),
    .c(lt5_c7),
    .o({lt5_c8,open_n97}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_8 (
    .a(1'b0),
    .b(vcnt[8]),
    .c(lt5_c8),
    .o({lt5_c9,open_n98}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_9 (
    .a(1'b0),
    .b(vcnt[9]),
    .c(lt5_c9),
    .o({lt5_c10,open_n99}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    lt5_cin (
    .a(1'b1),
    .o({lt5_c0,open_n102}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt5_cout (
    .a(1'b0),
    .b(1'b1),
    .c(lt5_c12),
    .o({open_n103,n14}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_0 (
    .a(vcnt[0]),
    .b(1'b1),
    .c(lt6_c0),
    .o({lt6_c1,open_n104}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_1 (
    .a(vcnt[1]),
    .b(1'b0),
    .c(lt6_c1),
    .o({lt6_c2,open_n105}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_10 (
    .a(vcnt[10]),
    .b(1'b1),
    .c(lt6_c10),
    .o({lt6_c11,open_n106}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_11 (
    .a(vcnt[11]),
    .b(1'b0),
    .c(lt6_c11),
    .o({lt6_c12,open_n107}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_2 (
    .a(vcnt[2]),
    .b(1'b0),
    .c(lt6_c2),
    .o({lt6_c3,open_n108}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_3 (
    .a(vcnt[3]),
    .b(1'b1),
    .c(lt6_c3),
    .o({lt6_c4,open_n109}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_4 (
    .a(vcnt[4]),
    .b(1'b0),
    .c(lt6_c4),
    .o({lt6_c5,open_n110}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_5 (
    .a(vcnt[5]),
    .b(1'b1),
    .c(lt6_c5),
    .o({lt6_c6,open_n111}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_6 (
    .a(vcnt[6]),
    .b(1'b0),
    .c(lt6_c6),
    .o({lt6_c7,open_n112}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_7 (
    .a(vcnt[7]),
    .b(1'b0),
    .c(lt6_c7),
    .o({lt6_c8,open_n113}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_8 (
    .a(vcnt[8]),
    .b(1'b0),
    .c(lt6_c8),
    .o({lt6_c9,open_n114}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_9 (
    .a(vcnt[9]),
    .b(1'b0),
    .c(lt6_c9),
    .o({lt6_c10,open_n115}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    lt6_cin (
    .a(1'b0),
    .o({lt6_c0,open_n118}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt6_cout (
    .a(1'b0),
    .b(1'b1),
    .c(lt6_c12),
    .o({open_n119,n15}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_0 (
    .a(1'b1),
    .b(hcnt[0]),
    .c(lt7_c0),
    .o({lt7_c1,open_n120}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_1 (
    .a(1'b1),
    .b(hcnt[1]),
    .c(lt7_c1),
    .o({lt7_c2,open_n121}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_10 (
    .a(1'b0),
    .b(hcnt[10]),
    .c(lt7_c10),
    .o({lt7_c11,open_n122}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_11 (
    .a(1'b0),
    .b(hcnt[11]),
    .c(lt7_c11),
    .o({lt7_c12,open_n123}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_2 (
    .a(1'b1),
    .b(hcnt[2]),
    .c(lt7_c2),
    .o({lt7_c3,open_n124}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_3 (
    .a(1'b0),
    .b(hcnt[3]),
    .c(lt7_c3),
    .o({lt7_c4,open_n125}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_4 (
    .a(1'b0),
    .b(hcnt[4]),
    .c(lt7_c4),
    .o({lt7_c5,open_n126}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_5 (
    .a(1'b1),
    .b(hcnt[5]),
    .c(lt7_c5),
    .o({lt7_c6,open_n127}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_6 (
    .a(1'b1),
    .b(hcnt[6]),
    .c(lt7_c6),
    .o({lt7_c7,open_n128}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_7 (
    .a(1'b0),
    .b(hcnt[7]),
    .c(lt7_c7),
    .o({lt7_c8,open_n129}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_8 (
    .a(1'b1),
    .b(hcnt[8]),
    .c(lt7_c8),
    .o({lt7_c9,open_n130}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_9 (
    .a(1'b0),
    .b(hcnt[9]),
    .c(lt7_c9),
    .o({lt7_c10,open_n131}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    lt7_cin (
    .a(1'b1),
    .o({lt7_c0,open_n134}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt7_cout (
    .a(1'b0),
    .b(1'b1),
    .c(lt7_c12),
    .o({open_n135,n17}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_0 (
    .a(hcnt[0]),
    .b(1'b1),
    .c(lt8_c0),
    .o({lt8_c1,open_n136}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_1 (
    .a(hcnt[1]),
    .b(1'b1),
    .c(lt8_c1),
    .o({lt8_c2,open_n137}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_10 (
    .a(hcnt[10]),
    .b(1'b1),
    .c(lt8_c10),
    .o({lt8_c11,open_n138}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_11 (
    .a(hcnt[11]),
    .b(1'b0),
    .c(lt8_c11),
    .o({lt8_c12,open_n139}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_2 (
    .a(hcnt[2]),
    .b(1'b1),
    .c(lt8_c2),
    .o({lt8_c3,open_n140}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_3 (
    .a(hcnt[3]),
    .b(1'b0),
    .c(lt8_c3),
    .o({lt8_c4,open_n141}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_4 (
    .a(hcnt[4]),
    .b(1'b0),
    .c(lt8_c4),
    .o({lt8_c5,open_n142}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_5 (
    .a(hcnt[5]),
    .b(1'b1),
    .c(lt8_c5),
    .o({lt8_c6,open_n143}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_6 (
    .a(hcnt[6]),
    .b(1'b1),
    .c(lt8_c6),
    .o({lt8_c7,open_n144}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_7 (
    .a(hcnt[7]),
    .b(1'b0),
    .c(lt8_c7),
    .o({lt8_c8,open_n145}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_8 (
    .a(hcnt[8]),
    .b(1'b0),
    .c(lt8_c8),
    .o({lt8_c9,open_n146}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_9 (
    .a(hcnt[9]),
    .b(1'b1),
    .c(lt8_c9),
    .o({lt8_c10,open_n147}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    lt8_cin (
    .a(1'b0),
    .o({lt8_c0,open_n150}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt8_cout (
    .a(1'b0),
    .b(1'b1),
    .c(lt8_c12),
    .o({open_n151,n18}));
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(n8[0]),
    .en(n5),
    .reset(~rst_n),
    .set(1'b0),
    .q(vcnt[0]));  // source/rtl/Driver.v(78)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(n8[1]),
    .en(n5),
    .reset(~rst_n),
    .set(1'b0),
    .q(vcnt[1]));  // source/rtl/Driver.v(78)
  reg_ar_as_w1 reg0_b10 (
    .clk(clk),
    .d(n8[10]),
    .en(n5),
    .reset(~rst_n),
    .set(1'b0),
    .q(vcnt[10]));  // source/rtl/Driver.v(78)
  reg_ar_as_w1 reg0_b11 (
    .clk(clk),
    .d(n8[11]),
    .en(n5),
    .reset(~rst_n),
    .set(1'b0),
    .q(vcnt[11]));  // source/rtl/Driver.v(78)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(n8[2]),
    .en(n5),
    .reset(~rst_n),
    .set(1'b0),
    .q(vcnt[2]));  // source/rtl/Driver.v(78)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(n8[3]),
    .en(n5),
    .reset(~rst_n),
    .set(1'b0),
    .q(vcnt[3]));  // source/rtl/Driver.v(78)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk),
    .d(n8[4]),
    .en(n5),
    .reset(~rst_n),
    .set(1'b0),
    .q(vcnt[4]));  // source/rtl/Driver.v(78)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk),
    .d(n8[5]),
    .en(n5),
    .reset(~rst_n),
    .set(1'b0),
    .q(vcnt[5]));  // source/rtl/Driver.v(78)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk),
    .d(n8[6]),
    .en(n5),
    .reset(~rst_n),
    .set(1'b0),
    .q(vcnt[6]));  // source/rtl/Driver.v(78)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk),
    .d(n8[7]),
    .en(n5),
    .reset(~rst_n),
    .set(1'b0),
    .q(vcnt[7]));  // source/rtl/Driver.v(78)
  reg_ar_as_w1 reg0_b8 (
    .clk(clk),
    .d(n8[8]),
    .en(n5),
    .reset(~rst_n),
    .set(1'b0),
    .q(vcnt[8]));  // source/rtl/Driver.v(78)
  reg_ar_as_w1 reg0_b9 (
    .clk(clk),
    .d(n8[9]),
    .en(n5),
    .reset(~rst_n),
    .set(1'b0),
    .q(vcnt[9]));  // source/rtl/Driver.v(78)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk),
    .d(n3[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(hcnt[0]));  // source/rtl/Driver.v(62)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk),
    .d(n3[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(hcnt[1]));  // source/rtl/Driver.v(62)
  reg_ar_as_w1 reg1_b10 (
    .clk(clk),
    .d(n3[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(hcnt[10]));  // source/rtl/Driver.v(62)
  reg_ar_as_w1 reg1_b11 (
    .clk(clk),
    .d(n3[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(hcnt[11]));  // source/rtl/Driver.v(62)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk),
    .d(n3[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(hcnt[2]));  // source/rtl/Driver.v(62)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk),
    .d(n3[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(hcnt[3]));  // source/rtl/Driver.v(62)
  reg_ar_as_w1 reg1_b4 (
    .clk(clk),
    .d(n3[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(hcnt[4]));  // source/rtl/Driver.v(62)
  reg_ar_as_w1 reg1_b5 (
    .clk(clk),
    .d(n3[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(hcnt[5]));  // source/rtl/Driver.v(62)
  reg_ar_as_w1 reg1_b6 (
    .clk(clk),
    .d(n3[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(hcnt[6]));  // source/rtl/Driver.v(62)
  reg_ar_as_w1 reg1_b7 (
    .clk(clk),
    .d(n3[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(hcnt[7]));  // source/rtl/Driver.v(62)
  reg_ar_as_w1 reg1_b8 (
    .clk(clk),
    .d(n3[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(hcnt[8]));  // source/rtl/Driver.v(62)
  reg_ar_as_w1 reg1_b9 (
    .clk(clk),
    .d(n3[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(hcnt[9]));  // source/rtl/Driver.v(62)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub0/u0  (
    .a(hcnt[0]),
    .b(1'b1),
    .c(\sub0/c0 ),
    .o({\sub0/c1 ,n20[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub0/u1  (
    .a(hcnt[1]),
    .b(1'b1),
    .c(\sub0/c1 ),
    .o({\sub0/c2 ,n20[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub0/u10  (
    .a(hcnt[10]),
    .b(1'b0),
    .c(\sub0/c10 ),
    .o({\sub0/c11 ,n20[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub0/u11  (
    .a(hcnt[11]),
    .b(1'b0),
    .c(\sub0/c11 ),
    .o({open_n152,n20[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub0/u2  (
    .a(hcnt[2]),
    .b(1'b1),
    .c(\sub0/c2 ),
    .o({\sub0/c3 ,n20[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub0/u3  (
    .a(hcnt[3]),
    .b(1'b0),
    .c(\sub0/c3 ),
    .o({\sub0/c4 ,n20[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub0/u4  (
    .a(hcnt[4]),
    .b(1'b0),
    .c(\sub0/c4 ),
    .o({\sub0/c5 ,n20[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub0/u5  (
    .a(hcnt[5]),
    .b(1'b1),
    .c(\sub0/c5 ),
    .o({\sub0/c6 ,n20[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub0/u6  (
    .a(hcnt[6]),
    .b(1'b1),
    .c(\sub0/c6 ),
    .o({\sub0/c7 ,n20[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub0/u7  (
    .a(hcnt[7]),
    .b(1'b0),
    .c(\sub0/c7 ),
    .o({\sub0/c8 ,n20[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub0/u8  (
    .a(hcnt[8]),
    .b(1'b1),
    .c(\sub0/c8 ),
    .o({\sub0/c9 ,n20[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub0/u9  (
    .a(hcnt[9]),
    .b(1'b0),
    .c(\sub0/c9 ),
    .o({\sub0/c10 ,n20[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    \sub0/ucin  (
    .a(1'b0),
    .o({\sub0/c0 ,open_n155}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub1/u0  (
    .a(vcnt[0]),
    .b(1'b1),
    .c(\sub1/c0 ),
    .o({\sub1/c1 ,n21[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub1/u1  (
    .a(vcnt[1]),
    .b(1'b0),
    .c(\sub1/c1 ),
    .o({\sub1/c2 ,n21[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub1/u10  (
    .a(vcnt[10]),
    .b(1'b0),
    .c(\sub1/c10 ),
    .o({\sub1/c11 ,n21[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub1/u11  (
    .a(vcnt[11]),
    .b(1'b0),
    .c(\sub1/c11 ),
    .o({open_n156,n21[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub1/u2  (
    .a(vcnt[2]),
    .b(1'b0),
    .c(\sub1/c2 ),
    .o({\sub1/c3 ,n21[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub1/u3  (
    .a(vcnt[3]),
    .b(1'b1),
    .c(\sub1/c3 ),
    .o({\sub1/c4 ,n21[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub1/u4  (
    .a(vcnt[4]),
    .b(1'b0),
    .c(\sub1/c4 ),
    .o({\sub1/c5 ,n21[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub1/u5  (
    .a(vcnt[5]),
    .b(1'b1),
    .c(\sub1/c5 ),
    .o({\sub1/c6 ,n21[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub1/u6  (
    .a(vcnt[6]),
    .b(1'b0),
    .c(\sub1/c6 ),
    .o({\sub1/c7 ,n21[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub1/u7  (
    .a(vcnt[7]),
    .b(1'b0),
    .c(\sub1/c7 ),
    .o({\sub1/c8 ,n21[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub1/u8  (
    .a(vcnt[8]),
    .b(1'b0),
    .c(\sub1/c8 ),
    .o({\sub1/c9 ,n21[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \sub1/u9  (
    .a(vcnt[9]),
    .b(1'b0),
    .c(\sub1/c9 ),
    .o({\sub1/c10 ,n21[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    \sub1/ucin  (
    .a(1'b0),
    .o({\sub1/c0 ,open_n159}));

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

