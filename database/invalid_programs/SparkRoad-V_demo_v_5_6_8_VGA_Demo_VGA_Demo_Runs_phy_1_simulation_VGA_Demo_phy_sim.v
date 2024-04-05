// Verilog netlist created by TD v4.6.12906
// Thu Aug  8 15:19:12 2019

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
  wire [11:0] \u1_Driver/hcnt ;  // source/rtl/Driver.v(44)
  wire [11:0] \u1_Driver/n2 ;
  wire [12:0] \u1_Driver/n20 ;
  wire [12:0] \u1_Driver/n21 ;
  wire [11:0] \u1_Driver/n7 ;
  wire [11:0] \u1_Driver/vcnt ;  // source/rtl/Driver.v(45)
  wire [7:0] vga_b_pad;  // source/rtl/VGA_Demo.v(16)
  wire [7:0] vga_g_pad;  // source/rtl/VGA_Demo.v(15)
  wire [7:0] vga_r_pad;  // source/rtl/VGA_Demo.v(14)
  wire clk_24m_pad;  // source/rtl/VGA_Demo.v(4)
  wire clk_vga;  // source/rtl/VGA_Demo.v(19)
  wire rst_n_pad;  // source/rtl/VGA_Demo.v(5)
  wire \u0_PLL/n0 ;
  wire \u0_PLL/uut/clk0_buf ;  // al_ip/PLL.v(32)
  wire \u1_Driver/_al_u61_o ;
  wire \u1_Driver/_al_u62_o ;
  wire \u1_Driver/_al_u64_o ;
  wire \u1_Driver/_al_u65_o ;
  wire \u1_Driver/add0/c11 ;
  wire \u1_Driver/add0/c3 ;
  wire \u1_Driver/add0/c7 ;
  wire \u1_Driver/add1/c11 ;
  wire \u1_Driver/add1/c3 ;
  wire \u1_Driver/add1/c7 ;
  wire \u1_Driver/lt0_c1 ;
  wire \u1_Driver/lt0_c11 ;
  wire \u1_Driver/lt0_c3 ;
  wire \u1_Driver/lt0_c5 ;
  wire \u1_Driver/lt0_c7 ;
  wire \u1_Driver/lt0_c9 ;
  wire \u1_Driver/lt1_c1 ;
  wire \u1_Driver/lt1_c11 ;
  wire \u1_Driver/lt1_c3 ;
  wire \u1_Driver/lt1_c5 ;
  wire \u1_Driver/lt1_c7 ;
  wire \u1_Driver/lt1_c9 ;
  wire \u1_Driver/lt2_c1 ;
  wire \u1_Driver/lt2_c11 ;
  wire \u1_Driver/lt2_c3 ;
  wire \u1_Driver/lt2_c5 ;
  wire \u1_Driver/lt2_c7 ;
  wire \u1_Driver/lt2_c9 ;
  wire \u1_Driver/lt3_c1 ;
  wire \u1_Driver/lt3_c11 ;
  wire \u1_Driver/lt3_c3 ;
  wire \u1_Driver/lt3_c5 ;
  wire \u1_Driver/lt3_c7 ;
  wire \u1_Driver/lt3_c9 ;
  wire \u1_Driver/lt4_c1 ;
  wire \u1_Driver/lt4_c11 ;
  wire \u1_Driver/lt4_c3 ;
  wire \u1_Driver/lt4_c5 ;
  wire \u1_Driver/lt4_c7 ;
  wire \u1_Driver/lt4_c9 ;
  wire \u1_Driver/lt5_c1 ;
  wire \u1_Driver/lt5_c11 ;
  wire \u1_Driver/lt5_c3 ;
  wire \u1_Driver/lt5_c5 ;
  wire \u1_Driver/lt5_c7 ;
  wire \u1_Driver/lt5_c9 ;
  wire \u1_Driver/lt6_c1 ;
  wire \u1_Driver/lt6_c11 ;
  wire \u1_Driver/lt6_c3 ;
  wire \u1_Driver/lt6_c5 ;
  wire \u1_Driver/lt6_c7 ;
  wire \u1_Driver/lt6_c9 ;
  wire \u1_Driver/lt7_c1 ;
  wire \u1_Driver/lt7_c11 ;
  wire \u1_Driver/lt7_c3 ;
  wire \u1_Driver/lt7_c5 ;
  wire \u1_Driver/lt7_c7 ;
  wire \u1_Driver/lt7_c9 ;
  wire \u1_Driver/lt8_c1 ;
  wire \u1_Driver/lt8_c11 ;
  wire \u1_Driver/lt8_c3 ;
  wire \u1_Driver/lt8_c5 ;
  wire \u1_Driver/lt8_c7 ;
  wire \u1_Driver/lt8_c9 ;
  wire \u1_Driver/n1 ;
  wire \u1_Driver/n10 ;
  wire \u1_Driver/n11 ;
  wire \u1_Driver/n12 ;
  wire \u1_Driver/n14 ;
  wire \u1_Driver/n15 ;
  wire \u1_Driver/n17 ;
  wire \u1_Driver/n18 ;
  wire \u1_Driver/n4 ;
  wire \u1_Driver/n5 ;
  wire \u1_Driver/n6_lutinv ;
  wire \u1_Driver/sub0/c11 ;
  wire \u1_Driver/sub0/c3 ;
  wire \u1_Driver/sub0/c7 ;
  wire \u1_Driver/sub1/c11 ;
  wire \u1_Driver/sub1/c3 ;
  wire \u1_Driver/sub1/c7 ;
  wire vga_clk_pad;  // source/rtl/VGA_Demo.v(8)
  wire vga_de_pad;  // source/rtl/VGA_Demo.v(12)
  wire vga_hs_pad;  // source/rtl/VGA_Demo.v(9)
  wire vga_vs_pad;  // source/rtl/VGA_Demo.v(10)

  initial $sdf_annotate("VGA_Demo.sdf");
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
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG0("0"),
    .INIT_LUTF0(16'b1111111111111111),
    .INIT_LUTG0(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    \u0_PLL/_al_u0  (
    .e({open_n567,rst_n_pad}),
    .f({open_n583,\u0_PLL/n0 }));
  EG_PHY_GCLK \u0_PLL/uut/bufg_feedback  (
    .clki(\u0_PLL/uut/clk0_buf ),
    .clko(clk_vga));  // al_ip/PLL.v(34)
  EG_PHY_PLL #(
    //.RID("0X0100"),
    //.WID("0X0100"),
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
    \u0_PLL/uut/pll_inst  (
    .daddr(6'b000000),
    .dclk(1'b0),
    .dcs(1'b0),
    .di(8'b00000000),
    .dwe(1'b0),
    .fbclk(clk_vga),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(clk_24m_pad),
    .reset(\u0_PLL/n0 ),
    .stdby(1'b0),
    .clkc({open_n589,open_n590,open_n591,open_n592,\u0_PLL/uut/clk0_buf }));  // al_ip/PLL.v(57)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("(B*D)"),
    //.LUTG0("~A*B*C*D+A*B*C*D"),
    //.LUTG1("(B*D)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b1100110000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1100110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u13|_al_u12  (
    .b({lcd_data[9],\u1_Driver/n12 }),
    .c({open_n605,\u1_Driver/n14 }),
    .d({vga_de_pad,\u1_Driver/n15 }),
    .e({open_n608,\u1_Driver/n11 }),
    .f({vga_g_pad[1],vga_de_pad}));
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~A*B*~C*~D+A*B*~C*~D+~A*B*C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG1("~A*~B*D*~C+A*~B*D*~C+~A*B*D*~C+A*B*D*~C+~A*~B*D*C+A*~B*D*C+~A*B*D*C+A*B*D*C"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1100110011001100),
    .INIT_LUTG1(16'b1111111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u14|_al_u36  (
    .b({open_n631,lcd_data[0]}),
    .d({vga_de_pad,open_n636}),
    .e({lcd_data[8],vga_de_pad}),
    .f({vga_g_pad[0],vga_b_pad[0]}));
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("A*~B*~C*~D+A*B*~C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    //.LUTG1("~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1010101010101010),
    .INIT_LUTG1(16'b1111000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u15|_al_u35  (
    .a({open_n657,lcd_data[1]}),
    .c({lcd_data[7],open_n660}),
    .e({vga_de_pad,vga_de_pad}),
    .f({vga_b_pad[7],vga_b_pad[1]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*A)"),
    //.LUTF1("0"),
    //.LUTG0("(B*A)"),
    //.LUTG1("~D*~B*~C*A+D*~B*~C*A+~D*B*~C*A+D*B*~C*A+~D*~B*C*A+D*~B*C*A+~D*B*C*A+D*B*C*A"),
    .INIT_LUTF0(16'b1000100010001000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000100010001000),
    .INIT_LUTG1(16'b1010101010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u16|_al_u34  (
    .a({vga_de_pad,vga_de_pad}),
    .b({open_n685,lcd_data[10]}),
    .e({lcd_data[6],open_n692}),
    .f({vga_b_pad[6],vga_g_pad[2]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*A)"),
    //.LUTF1("0"),
    //.LUTG0("(B*A)"),
    //.LUTG1("~C*~B*A*~D+C*~B*A*~D+~C*B*A*~D+C*B*A*~D+~C*~B*A*D+C*~B*A*D+~C*B*A*D+C*B*A*D"),
    .INIT_LUTF0(16'b1000100010001000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000100010001000),
    .INIT_LUTG1(16'b1010101010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u17|_al_u33  (
    .a({vga_de_pad,vga_de_pad}),
    .b({open_n713,lcd_data[11]}),
    .e({lcd_data[5],open_n720}),
    .f({vga_b_pad[5],vga_g_pad[3]}));
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~A*B*~C*~D+A*B*~C*~D+~A*B*C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG1("~A*~D*~C*B+A*~D*~C*B+~A*D*~C*B+A*D*~C*B+~A*~D*C*B+A*~D*C*B+~A*D*C*B+A*D*C*B"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1100110011001100),
    .INIT_LUTG1(16'b1100110011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u18|_al_u32  (
    .b({vga_de_pad,lcd_data[12]}),
    .e({lcd_data[4],vga_de_pad}),
    .f({vga_b_pad[4],vga_g_pad[4]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*A)"),
    //.LUTF1("0"),
    //.LUTG0("(B*A)"),
    //.LUTG1("~C*~B*A*~D+C*~B*A*~D+~C*B*A*~D+C*B*A*~D+~C*~B*A*D+C*~B*A*D+~C*B*A*D+C*B*A*D"),
    .INIT_LUTF0(16'b1000100010001000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000100010001000),
    .INIT_LUTG1(16'b1010101010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u19|_al_u31  (
    .a({vga_de_pad,vga_de_pad}),
    .b({open_n769,lcd_data[13]}),
    .e({lcd_data[3],open_n776}),
    .f({vga_b_pad[3],vga_g_pad[5]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*B)"),
    //.LUTF1("(A*B)"),
    //.LUTG0("(A*B)"),
    //.LUTG1("(A*B)"),
    .INIT_LUTF0(16'b1000100010001000),
    .INIT_LUTF1(16'b1000100010001000),
    .INIT_LUTG0(16'b1000100010001000),
    .INIT_LUTG1(16'b1000100010001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u20|_al_u30  (
    .a({lcd_data[23],lcd_data[14]}),
    .b({vga_de_pad,vga_de_pad}),
    .f({vga_r_pad[7],vga_g_pad[6]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*B)"),
    //.LUTF1("(A*B)"),
    //.LUTG0("(A*B)"),
    //.LUTG1("(A*B)"),
    .INIT_LUTF0(16'b1000100010001000),
    .INIT_LUTF1(16'b1000100010001000),
    .INIT_LUTG0(16'b1000100010001000),
    .INIT_LUTG1(16'b1000100010001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u21|_al_u29  (
    .a({lcd_data[22],lcd_data[15]}),
    .b({vga_de_pad,vga_de_pad}),
    .f({vga_r_pad[6],vga_g_pad[7]}));
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("(C*D)"),
    //.LUTG0("~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u22|_al_u28  (
    .c({lcd_data[21],open_n857}),
    .d({vga_de_pad,vga_de_pad}),
    .e({open_n860,lcd_data[16]}),
    .f({vga_r_pad[5],vga_r_pad[0]}));
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~A*B*~C*~D+A*B*~C*~D+~A*B*C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG1("~A*~B*D*~C+A*~B*D*~C+~A*B*D*~C+A*B*D*~C+~A*~B*D*C+A*~B*D*C+~A*B*D*C+A*B*D*C"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1100110011001100),
    .INIT_LUTG1(16'b1111111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u23|_al_u27  (
    .b({open_n883,lcd_data[17]}),
    .d({vga_de_pad,open_n888}),
    .e({lcd_data[20],vga_de_pad}),
    .f({vga_r_pad[4],vga_r_pad[1]}));
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG1("A*~B*~C*~D+A*B*~C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1111111100000000),
    .INIT_LUTG1(16'b1010101010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u24|_al_u26  (
    .a({lcd_data[2],open_n909}),
    .d({open_n916,vga_de_pad}),
    .e({vga_de_pad,lcd_data[18]}),
    .f({vga_b_pad[2],vga_r_pad[2]}));
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
    \u1_Driver/_al_u37|_al_u60  (
    .a({\u1_Driver/n14 ,\u1_Driver/n14 }),
    .b({\u1_Driver/n15 ,\u1_Driver/n15 }),
    .c({\u1_Driver/n17 ,\u1_Driver/n17 }),
    .d({\u1_Driver/n18 ,\u1_Driver/n18 }),
    .e({\u1_Driver/n21 [9],\u1_Driver/n20 [0]}),
    .f({lcd_ypos[9],lcd_xpos[0]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*C*D*A*B)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*C*D*A*B)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u38|_al_u59  (
    .a({\u1_Driver/n15 ,\u1_Driver/n14 }),
    .b({\u1_Driver/n14 ,\u1_Driver/n15 }),
    .c({\u1_Driver/n18 ,\u1_Driver/n17 }),
    .d({\u1_Driver/n17 ,\u1_Driver/n18 }),
    .e({\u1_Driver/n21 [8],\u1_Driver/n20 [1]}),
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
    \u1_Driver/_al_u39|_al_u58  (
    .a({\u1_Driver/n14 ,\u1_Driver/n14 }),
    .b({\u1_Driver/n15 ,\u1_Driver/n15 }),
    .c({\u1_Driver/n17 ,\u1_Driver/n17 }),
    .d({\u1_Driver/n18 ,\u1_Driver/n18 }),
    .e({\u1_Driver/n21 [7],\u1_Driver/n20 [10]}),
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
    \u1_Driver/_al_u40|_al_u57  (
    .a({\u1_Driver/n14 ,\u1_Driver/n14 }),
    .b({\u1_Driver/n15 ,\u1_Driver/n15 }),
    .c({\u1_Driver/n17 ,\u1_Driver/n17 }),
    .d({\u1_Driver/n18 ,\u1_Driver/n18 }),
    .e({\u1_Driver/n21 [6],\u1_Driver/n20 [11]}),
    .f({lcd_ypos[6],lcd_xpos[11]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*C*D*A*B)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*C*D*A*B)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u41|_al_u56  (
    .a({\u1_Driver/n15 ,\u1_Driver/n14 }),
    .b({\u1_Driver/n14 ,\u1_Driver/n15 }),
    .c({\u1_Driver/n18 ,\u1_Driver/n17 }),
    .d({\u1_Driver/n17 ,\u1_Driver/n18 }),
    .e({\u1_Driver/n21 [5],\u1_Driver/n20 [2]}),
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
    \u1_Driver/_al_u42|_al_u55  (
    .a({\u1_Driver/n14 ,\u1_Driver/n14 }),
    .b({\u1_Driver/n15 ,\u1_Driver/n15 }),
    .c({\u1_Driver/n17 ,\u1_Driver/n17 }),
    .d({\u1_Driver/n18 ,\u1_Driver/n18 }),
    .e({\u1_Driver/n21 [4],\u1_Driver/n20 [3]}),
    .f({lcd_ypos[4],lcd_xpos[3]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*A*B)"),
    //.LUTF1("(0*D*C*A*B)"),
    //.LUTG0("(1*D*C*A*B)"),
    //.LUTG1("(1*D*C*A*B)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u43|_al_u54  (
    .a({\u1_Driver/n15 ,\u1_Driver/n15 }),
    .b({\u1_Driver/n14 ,\u1_Driver/n14 }),
    .c({\u1_Driver/n17 ,\u1_Driver/n17 }),
    .d({\u1_Driver/n18 ,\u1_Driver/n18 }),
    .e({\u1_Driver/n21 [3],\u1_Driver/n20 [4]}),
    .f({lcd_ypos[3],lcd_xpos[4]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*C*D*A*B)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*C*D*A*B)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u44|_al_u53  (
    .a({\u1_Driver/n15 ,\u1_Driver/n14 }),
    .b({\u1_Driver/n14 ,\u1_Driver/n15 }),
    .c({\u1_Driver/n18 ,\u1_Driver/n17 }),
    .d({\u1_Driver/n17 ,\u1_Driver/n18 }),
    .e({\u1_Driver/n21 [2],\u1_Driver/n20 [5]}),
    .f({lcd_ypos[2],lcd_xpos[5]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*C*D*A*B)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*C*D*A*B)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u45|_al_u52  (
    .a({\u1_Driver/n15 ,\u1_Driver/n14 }),
    .b({\u1_Driver/n14 ,\u1_Driver/n15 }),
    .c({\u1_Driver/n18 ,\u1_Driver/n17 }),
    .d({\u1_Driver/n17 ,\u1_Driver/n18 }),
    .e({\u1_Driver/n21 [11],\u1_Driver/n20 [6]}),
    .f({lcd_ypos[11],lcd_xpos[6]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("(0*C*D*A*B)"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("(1*C*D*A*B)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u46|_al_u51  (
    .a({\u1_Driver/n15 ,\u1_Driver/n14 }),
    .b({\u1_Driver/n14 ,\u1_Driver/n15 }),
    .c({\u1_Driver/n18 ,\u1_Driver/n17 }),
    .d({\u1_Driver/n17 ,\u1_Driver/n18 }),
    .e({\u1_Driver/n21 [10],\u1_Driver/n20 [7]}),
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
    \u1_Driver/_al_u47|_al_u50  (
    .a({\u1_Driver/n14 ,\u1_Driver/n14 }),
    .b({\u1_Driver/n15 ,\u1_Driver/n15 }),
    .c({\u1_Driver/n17 ,\u1_Driver/n17 }),
    .d({\u1_Driver/n18 ,\u1_Driver/n18 }),
    .e({\u1_Driver/n21 [1],\u1_Driver/n20 [8]}),
    .f({lcd_ypos[1],lcd_xpos[8]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*B*C*D*A)"),
    //.LUTF1("(0*B*C*D*A)"),
    //.LUTG0("(1*B*C*D*A)"),
    //.LUTG1("(1*B*C*D*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u48|_al_u49  (
    .a({\u1_Driver/n14 ,\u1_Driver/n14 }),
    .b({\u1_Driver/n18 ,\u1_Driver/n18 }),
    .c({\u1_Driver/n17 ,\u1_Driver/n17 }),
    .d({\u1_Driver/n15 ,\u1_Driver/n15 }),
    .e({\u1_Driver/n21 [0],\u1_Driver/n20 [9]}),
    .f({lcd_ypos[0],lcd_xpos[9]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*~A*C*~B*D)"),
    //.LUTF1("(~0*B*~A*C*D)"),
    //.LUTG0("(1*~A*C*~B*D)"),
    //.LUTG1("(~1*B*~A*C*D)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0100000000000000),
    .INIT_LUTG0(16'b0001000000000000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u62|_al_u63  (
    .a({\u1_Driver/hcnt [3],\u1_Driver/hcnt [8]}),
    .b({\u1_Driver/hcnt [4],\u1_Driver/hcnt [6]}),
    .c({\u1_Driver/hcnt [2],\u1_Driver/hcnt [7]}),
    .d({\u1_Driver/_al_u61_o ,\u1_Driver/_al_u62_o }),
    .e({\u1_Driver/hcnt [5],\u1_Driver/hcnt [9]}),
    .f({\u1_Driver/_al_u62_o ,\u1_Driver/n5 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~0*~A*~C*~B*D)"),
    //.LUTF1("(0*~B*A*~C*D)"),
    //.LUTG0("(~1*~A*~C*~B*D)"),
    //.LUTG1("(1*~B*A*~C*D)"),
    .INIT_LUTF0(16'b0000000100000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b0000001000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u65|_al_u66  (
    .a({\u1_Driver/vcnt [3],\u1_Driver/vcnt [8]}),
    .b({\u1_Driver/vcnt [4],\u1_Driver/vcnt [6]}),
    .c({\u1_Driver/vcnt [2],\u1_Driver/vcnt [7]}),
    .d({\u1_Driver/_al_u64_o ,\u1_Driver/_al_u65_o }),
    .e({\u1_Driver/vcnt [5],\u1_Driver/vcnt [9]}),
    .f({\u1_Driver/_al_u65_o ,\u1_Driver/n6_lutinv }));
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("(~D)"),
    //.LUTG0("~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG1("(~D)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b1111111100000000),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u79|_al_u25  (
    .d({clk_vga,vga_de_pad}),
    .e({open_n1253,lcd_data[19]}),
    .f({vga_clk_pad,vga_r_pad[3]}));
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("(~B)"),
    //.LUTG0("C*B*~A*~D+C*B*A*~D"),
    //.LUTG1("(~B)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0011001100110011),
    .INIT_LUTG0(16'b0000000011000000),
    .INIT_LUTG1(16'b0011001100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u80|_al_u61  (
    .b({\u1_Driver/n4 ,\u1_Driver/hcnt [1]}),
    .c({open_n1276,\u1_Driver/hcnt [0]}),
    .d({open_n1279,\u1_Driver/hcnt [11]}),
    .e({open_n1280,\u1_Driver/hcnt [10]}),
    .f({vga_hs_pad,\u1_Driver/_al_u61_o }));
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("(~A)"),
    //.LUTG0("A*~D*~B*~C+A*~D*B*~C"),
    //.LUTG1("(~A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0101010101010101),
    .INIT_LUTG0(16'b0000000000001010),
    .INIT_LUTG1(16'b0101010101010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/_al_u81|_al_u64  (
    .a({\u1_Driver/n10 ,\u1_Driver/vcnt [0]}),
    .c({open_n1303,\u1_Driver/vcnt [11]}),
    .d({open_n1306,\u1_Driver/vcnt [1]}),
    .e({open_n1307,\u1_Driver/vcnt [10]}),
    .f({vga_vs_pad,\u1_Driver/_al_u64_o }));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add0/ucin_al_u82"),
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
    \u1_Driver/add0/u11_al_u85  (
    .a({open_n1328,\u1_Driver/hcnt [11]}),
    .c(2'b00),
    .d({open_n1333,1'b0}),
    .fci(\u1_Driver/add0/c11 ),
    .f({open_n1350,\u1_Driver/n2 [11]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add0/ucin_al_u82"),
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
    \u1_Driver/add0/u3_al_u83  (
    .a({\u1_Driver/hcnt [5],\u1_Driver/hcnt [3]}),
    .b({\u1_Driver/hcnt [6],\u1_Driver/hcnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u1_Driver/add0/c3 ),
    .f({\u1_Driver/n2 [5],\u1_Driver/n2 [3]}),
    .fco(\u1_Driver/add0/c7 ),
    .fx({\u1_Driver/n2 [6],\u1_Driver/n2 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add0/ucin_al_u82"),
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
    \u1_Driver/add0/u7_al_u84  (
    .a({\u1_Driver/hcnt [9],\u1_Driver/hcnt [7]}),
    .b({\u1_Driver/hcnt [10],\u1_Driver/hcnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u1_Driver/add0/c7 ),
    .f({\u1_Driver/n2 [9],\u1_Driver/n2 [7]}),
    .fco(\u1_Driver/add0/c11 ),
    .fx({\u1_Driver/n2 [10],\u1_Driver/n2 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add0/ucin_al_u82"),
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
    \u1_Driver/add0/ucin_al_u82  (
    .a({\u1_Driver/hcnt [1],1'b0}),
    .b({\u1_Driver/hcnt [2],\u1_Driver/hcnt [0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({\u1_Driver/n2 [1],open_n1409}),
    .fco(\u1_Driver/add0/c3 ),
    .fx({\u1_Driver/n2 [2],\u1_Driver/n2 [0]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add1/ucin_al_u86"),
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
    \u1_Driver/add1/u11_al_u89  (
    .a({open_n1412,\u1_Driver/vcnt [11]}),
    .c(2'b00),
    .d({open_n1417,1'b0}),
    .fci(\u1_Driver/add1/c11 ),
    .f({open_n1434,\u1_Driver/n7 [11]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add1/ucin_al_u86"),
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
    \u1_Driver/add1/u3_al_u87  (
    .a({\u1_Driver/vcnt [5],\u1_Driver/vcnt [3]}),
    .b({\u1_Driver/vcnt [6],\u1_Driver/vcnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u1_Driver/add1/c3 ),
    .f({\u1_Driver/n7 [5],\u1_Driver/n7 [3]}),
    .fco(\u1_Driver/add1/c7 ),
    .fx({\u1_Driver/n7 [6],\u1_Driver/n7 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add1/ucin_al_u86"),
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
    \u1_Driver/add1/u7_al_u88  (
    .a({\u1_Driver/vcnt [9],\u1_Driver/vcnt [7]}),
    .b({\u1_Driver/vcnt [10],\u1_Driver/vcnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u1_Driver/add1/c7 ),
    .f({\u1_Driver/n7 [9],\u1_Driver/n7 [7]}),
    .fco(\u1_Driver/add1/c11 ),
    .fx({\u1_Driver/n7 [10],\u1_Driver/n7 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add1/ucin_al_u86"),
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
    \u1_Driver/add1/ucin_al_u86  (
    .a({\u1_Driver/vcnt [1],1'b0}),
    .b({\u1_Driver/vcnt [2],\u1_Driver/vcnt [0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({\u1_Driver/n7 [1],open_n1493}),
    .fco(\u1_Driver/add1/c3 ),
    .fx({\u1_Driver/n7 [2],\u1_Driver/n7 [0]}));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_0|lt0_cin  (
    .a({\u1_Driver/hcnt [0],1'b0}),
    .b({1'b1,open_n1496}),
    .fco(\u1_Driver/lt0_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_0|lt0_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_10|lt0_9  (
    .a(\u1_Driver/hcnt [10:9]),
    .b(2'b11),
    .fci(\u1_Driver/lt0_c9 ),
    .fco(\u1_Driver/lt0_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_2|lt0_1  (
    .a(\u1_Driver/hcnt [2:1]),
    .b(2'b11),
    .fci(\u1_Driver/lt0_c1 ),
    .fco(\u1_Driver/lt0_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_0|lt0_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_4|lt0_3  (
    .a(\u1_Driver/hcnt [4:3]),
    .b(2'b10),
    .fci(\u1_Driver/lt0_c3 ),
    .fco(\u1_Driver/lt0_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_0|lt0_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_6|lt0_5  (
    .a(\u1_Driver/hcnt [6:5]),
    .b(2'b00),
    .fci(\u1_Driver/lt0_c5 ),
    .fco(\u1_Driver/lt0_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_0|lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_8|lt0_7  (
    .a(\u1_Driver/hcnt [8:7]),
    .b(2'b01),
    .fci(\u1_Driver/lt0_c7 ),
    .fco(\u1_Driver/lt0_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_0|lt0_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_cout|lt0_11  (
    .a({1'b0,\u1_Driver/hcnt [11]}),
    .b(2'b10),
    .fci(\u1_Driver/lt0_c11 ),
    .f({\u1_Driver/n1 ,open_n1660}));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_0|lt1_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_0|lt1_cin  (
    .a({\u1_Driver/hcnt [0],1'b1}),
    .b({1'b1,open_n1666}),
    .fco(\u1_Driver/lt1_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_0|lt1_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_10|lt1_9  (
    .a(\u1_Driver/hcnt [10:9]),
    .b(2'b00),
    .fci(\u1_Driver/lt1_c9 ),
    .fco(\u1_Driver/lt1_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_0|lt1_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_2|lt1_1  (
    .a(\u1_Driver/hcnt [2:1]),
    .b(2'b11),
    .fci(\u1_Driver/lt1_c1 ),
    .fco(\u1_Driver/lt1_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_0|lt1_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_4|lt1_3  (
    .a(\u1_Driver/hcnt [4:3]),
    .b(2'b01),
    .fci(\u1_Driver/lt1_c3 ),
    .fco(\u1_Driver/lt1_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_0|lt1_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_6|lt1_5  (
    .a(\u1_Driver/hcnt [6:5]),
    .b(2'b11),
    .fci(\u1_Driver/lt1_c5 ),
    .fco(\u1_Driver/lt1_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_0|lt1_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_8|lt1_7  (
    .a(\u1_Driver/hcnt [8:7]),
    .b(2'b00),
    .fci(\u1_Driver/lt1_c7 ),
    .fco(\u1_Driver/lt1_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_0|lt1_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_cout|lt1_11  (
    .a({1'b0,\u1_Driver/hcnt [11]}),
    .b(2'b10),
    .fci(\u1_Driver/lt1_c11 ),
    .f({\u1_Driver/n4 ,open_n1830}));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_0|lt2_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_0|lt2_cin  (
    .a({\u1_Driver/vcnt [0],1'b1}),
    .b({1'b0,open_n1836}),
    .fco(\u1_Driver/lt2_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_0|lt2_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_10|lt2_9  (
    .a(\u1_Driver/vcnt [10:9]),
    .b(2'b00),
    .fci(\u1_Driver/lt2_c9 ),
    .fco(\u1_Driver/lt2_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_0|lt2_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_2|lt2_1  (
    .a(\u1_Driver/vcnt [2:1]),
    .b(2'b01),
    .fci(\u1_Driver/lt2_c1 ),
    .fco(\u1_Driver/lt2_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_0|lt2_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_4|lt2_3  (
    .a(\u1_Driver/vcnt [4:3]),
    .b(2'b00),
    .fci(\u1_Driver/lt2_c3 ),
    .fco(\u1_Driver/lt2_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_0|lt2_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_6|lt2_5  (
    .a(\u1_Driver/vcnt [6:5]),
    .b(2'b00),
    .fci(\u1_Driver/lt2_c5 ),
    .fco(\u1_Driver/lt2_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_0|lt2_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_8|lt2_7  (
    .a(\u1_Driver/vcnt [8:7]),
    .b(2'b00),
    .fci(\u1_Driver/lt2_c7 ),
    .fco(\u1_Driver/lt2_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_0|lt2_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_cout|lt2_11  (
    .a({1'b0,\u1_Driver/vcnt [11]}),
    .b(2'b10),
    .fci(\u1_Driver/lt2_c11 ),
    .f({\u1_Driver/n10 ,open_n2000}));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_0|lt3_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_0|lt3_cin  (
    .a(2'b01),
    .b({\u1_Driver/hcnt [0],open_n2006}),
    .fco(\u1_Driver/lt3_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_0|lt3_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_10|lt3_9  (
    .a(2'b00),
    .b(\u1_Driver/hcnt [10:9]),
    .fci(\u1_Driver/lt3_c9 ),
    .fco(\u1_Driver/lt3_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_0|lt3_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_2|lt3_1  (
    .a(2'b00),
    .b(\u1_Driver/hcnt [2:1]),
    .fci(\u1_Driver/lt3_c1 ),
    .fco(\u1_Driver/lt3_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_0|lt3_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_4|lt3_3  (
    .a(2'b01),
    .b(\u1_Driver/hcnt [4:3]),
    .fci(\u1_Driver/lt3_c3 ),
    .fco(\u1_Driver/lt3_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_0|lt3_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_6|lt3_5  (
    .a(2'b11),
    .b(\u1_Driver/hcnt [6:5]),
    .fci(\u1_Driver/lt3_c5 ),
    .fco(\u1_Driver/lt3_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_0|lt3_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_8|lt3_7  (
    .a(2'b10),
    .b(\u1_Driver/hcnt [8:7]),
    .fci(\u1_Driver/lt3_c7 ),
    .fco(\u1_Driver/lt3_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_0|lt3_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_cout|lt3_11  (
    .a(2'b00),
    .b({1'b1,\u1_Driver/hcnt [11]}),
    .fci(\u1_Driver/lt3_c11 ),
    .f({\u1_Driver/n11 ,open_n2170}));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_0|lt4_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_0|lt4_cin  (
    .a({\u1_Driver/hcnt [0],1'b0}),
    .b({1'b0,open_n2176}),
    .fco(\u1_Driver/lt4_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_0|lt4_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_10|lt4_9  (
    .a(\u1_Driver/hcnt [10:9]),
    .b(2'b11),
    .fci(\u1_Driver/lt4_c9 ),
    .fco(\u1_Driver/lt4_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_0|lt4_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_2|lt4_1  (
    .a(\u1_Driver/hcnt [2:1]),
    .b(2'b00),
    .fci(\u1_Driver/lt4_c1 ),
    .fco(\u1_Driver/lt4_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_0|lt4_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_4|lt4_3  (
    .a(\u1_Driver/hcnt [4:3]),
    .b(2'b01),
    .fci(\u1_Driver/lt4_c3 ),
    .fco(\u1_Driver/lt4_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_0|lt4_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_6|lt4_5  (
    .a(\u1_Driver/hcnt [6:5]),
    .b(2'b11),
    .fci(\u1_Driver/lt4_c5 ),
    .fco(\u1_Driver/lt4_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_0|lt4_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_8|lt4_7  (
    .a(\u1_Driver/hcnt [8:7]),
    .b(2'b00),
    .fci(\u1_Driver/lt4_c7 ),
    .fco(\u1_Driver/lt4_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_0|lt4_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_cout|lt4_11  (
    .a({1'b0,\u1_Driver/hcnt [11]}),
    .b(2'b10),
    .fci(\u1_Driver/lt4_c11 ),
    .f({\u1_Driver/n12 ,open_n2340}));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_0|lt5_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_0|lt5_cin  (
    .a(2'b11),
    .b({\u1_Driver/vcnt [0],open_n2346}),
    .fco(\u1_Driver/lt5_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_0|lt5_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_10|lt5_9  (
    .a(2'b00),
    .b(\u1_Driver/vcnt [10:9]),
    .fci(\u1_Driver/lt5_c9 ),
    .fco(\u1_Driver/lt5_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_0|lt5_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_2|lt5_1  (
    .a(2'b00),
    .b(\u1_Driver/vcnt [2:1]),
    .fci(\u1_Driver/lt5_c1 ),
    .fco(\u1_Driver/lt5_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_0|lt5_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_4|lt5_3  (
    .a(2'b01),
    .b(\u1_Driver/vcnt [4:3]),
    .fci(\u1_Driver/lt5_c3 ),
    .fco(\u1_Driver/lt5_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_0|lt5_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_6|lt5_5  (
    .a(2'b01),
    .b(\u1_Driver/vcnt [6:5]),
    .fci(\u1_Driver/lt5_c5 ),
    .fco(\u1_Driver/lt5_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_0|lt5_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_8|lt5_7  (
    .a(2'b00),
    .b(\u1_Driver/vcnt [8:7]),
    .fci(\u1_Driver/lt5_c7 ),
    .fco(\u1_Driver/lt5_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_0|lt5_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_cout|lt5_11  (
    .a(2'b00),
    .b({1'b1,\u1_Driver/vcnt [11]}),
    .fci(\u1_Driver/lt5_c11 ),
    .f({\u1_Driver/n14 ,open_n2510}));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_0|lt6_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_0|lt6_cin  (
    .a({\u1_Driver/vcnt [0],1'b0}),
    .b({1'b1,open_n2516}),
    .fco(\u1_Driver/lt6_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_0|lt6_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_10|lt6_9  (
    .a(\u1_Driver/vcnt [10:9]),
    .b(2'b10),
    .fci(\u1_Driver/lt6_c9 ),
    .fco(\u1_Driver/lt6_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_0|lt6_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_2|lt6_1  (
    .a(\u1_Driver/vcnt [2:1]),
    .b(2'b00),
    .fci(\u1_Driver/lt6_c1 ),
    .fco(\u1_Driver/lt6_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_0|lt6_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_4|lt6_3  (
    .a(\u1_Driver/vcnt [4:3]),
    .b(2'b01),
    .fci(\u1_Driver/lt6_c3 ),
    .fco(\u1_Driver/lt6_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_0|lt6_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_6|lt6_5  (
    .a(\u1_Driver/vcnt [6:5]),
    .b(2'b01),
    .fci(\u1_Driver/lt6_c5 ),
    .fco(\u1_Driver/lt6_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_0|lt6_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_8|lt6_7  (
    .a(\u1_Driver/vcnt [8:7]),
    .b(2'b00),
    .fci(\u1_Driver/lt6_c7 ),
    .fco(\u1_Driver/lt6_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_0|lt6_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_cout|lt6_11  (
    .a({1'b0,\u1_Driver/vcnt [11]}),
    .b(2'b10),
    .fci(\u1_Driver/lt6_c11 ),
    .f({\u1_Driver/n15 ,open_n2680}));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_0|lt7_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_0|lt7_cin  (
    .a(2'b11),
    .b({\u1_Driver/hcnt [0],open_n2686}),
    .fco(\u1_Driver/lt7_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_0|lt7_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_10|lt7_9  (
    .a(2'b00),
    .b(\u1_Driver/hcnt [10:9]),
    .fci(\u1_Driver/lt7_c9 ),
    .fco(\u1_Driver/lt7_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_0|lt7_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_2|lt7_1  (
    .a(2'b11),
    .b(\u1_Driver/hcnt [2:1]),
    .fci(\u1_Driver/lt7_c1 ),
    .fco(\u1_Driver/lt7_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_0|lt7_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_4|lt7_3  (
    .a(2'b00),
    .b(\u1_Driver/hcnt [4:3]),
    .fci(\u1_Driver/lt7_c3 ),
    .fco(\u1_Driver/lt7_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_0|lt7_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_6|lt7_5  (
    .a(2'b11),
    .b(\u1_Driver/hcnt [6:5]),
    .fci(\u1_Driver/lt7_c5 ),
    .fco(\u1_Driver/lt7_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_0|lt7_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_8|lt7_7  (
    .a(2'b10),
    .b(\u1_Driver/hcnt [8:7]),
    .fci(\u1_Driver/lt7_c7 ),
    .fco(\u1_Driver/lt7_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_0|lt7_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_cout|lt7_11  (
    .a(2'b00),
    .b({1'b1,\u1_Driver/hcnt [11]}),
    .fci(\u1_Driver/lt7_c11 ),
    .f({\u1_Driver/n17 ,open_n2850}));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_0|lt8_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_0|lt8_cin  (
    .a({\u1_Driver/hcnt [0],1'b0}),
    .b({1'b1,open_n2856}),
    .fco(\u1_Driver/lt8_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_0|lt8_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_10|lt8_9  (
    .a(\u1_Driver/hcnt [10:9]),
    .b(2'b11),
    .fci(\u1_Driver/lt8_c9 ),
    .fco(\u1_Driver/lt8_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_0|lt8_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_2|lt8_1  (
    .a(\u1_Driver/hcnt [2:1]),
    .b(2'b11),
    .fci(\u1_Driver/lt8_c1 ),
    .fco(\u1_Driver/lt8_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_0|lt8_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_4|lt8_3  (
    .a(\u1_Driver/hcnt [4:3]),
    .b(2'b00),
    .fci(\u1_Driver/lt8_c3 ),
    .fco(\u1_Driver/lt8_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_0|lt8_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_6|lt8_5  (
    .a(\u1_Driver/hcnt [6:5]),
    .b(2'b11),
    .fci(\u1_Driver/lt8_c5 ),
    .fco(\u1_Driver/lt8_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_0|lt8_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_8|lt8_7  (
    .a(\u1_Driver/hcnt [8:7]),
    .b(2'b00),
    .fci(\u1_Driver/lt8_c7 ),
    .fco(\u1_Driver/lt8_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_0|lt8_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_cout|lt8_11  (
    .a({1'b0,\u1_Driver/hcnt [11]}),
    .b(2'b10),
    .fci(\u1_Driver/lt8_c11 ),
    .f({\u1_Driver/n18 ,open_n3020}));
  // NOFILE(0)
  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("(B*~D)"),
    //.LUTG0("~A*~D*~C*~B+A*~D*~C*~B+~A*D*~C*~B+A*D*~C*~B+~A*~D*C*~B+A*~D*C*~B+~A*D*C*~B+A*D*C*~B"),
    //.LUTG1("(B*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000011001100),
    .INIT_LUTG0(16'b0011001100110011),
    .INIT_LUTG1(16'b0000000011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_b0|reg0_b9  (
    .b({\u1_Driver/n7 [0],\u1_Driver/n6_lutinv }),
    .ce(\u1_Driver/n5 ),
    .clk(clk_vga),
    .d({\u1_Driver/n6_lutinv ,open_n3030}),
    .e({open_n3031,\u1_Driver/n7 [9]}),
    .sr(rst_n_pad),
    .q({\u1_Driver/vcnt [0],\u1_Driver/vcnt [9]}));
  // NOFILE(0)
  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~A)"),
    //.LUTF1("(A*~C)"),
    //.LUTG0("(C*~A)"),
    //.LUTG1("(A*~C)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0101000001010000),
    .INIT_LUTF1(16'b0000101000001010),
    .INIT_LUTG0(16'b0101000001010000),
    .INIT_LUTG1(16'b0000101000001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_b10|reg0_b8  (
    .a({\u1_Driver/n7 [10],\u1_Driver/n6_lutinv }),
    .c({\u1_Driver/n6_lutinv ,\u1_Driver/n7 [8]}),
    .ce(\u1_Driver/n5 ),
    .clk(clk_vga),
    .sr(rst_n_pad),
    .q({\u1_Driver/vcnt [10],\u1_Driver/vcnt [8]}));
  // NOFILE(0)
  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~A*~D*~C*~B+A*~D*~C*~B+~A*D*~C*~B+A*D*~C*~B+~A*~D*C*~B+A*~D*C*~B+~A*D*C*~B+A*D*C*~B"),
    //.LUTG1("~A*~D*~C*~B+A*~D*~C*~B+~A*D*~C*~B+A*D*~C*~B+~A*~D*C*~B+A*~D*C*~B+~A*D*C*~B+A*D*C*~B"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0011001100110011),
    .INIT_LUTG1(16'b0011001100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_b11|reg0_b7  (
    .b({\u1_Driver/n6_lutinv ,\u1_Driver/n6_lutinv }),
    .ce(\u1_Driver/n5 ),
    .clk(clk_vga),
    .e({\u1_Driver/n7 [11],\u1_Driver/n7 [7]}),
    .sr(rst_n_pad),
    .q({\u1_Driver/vcnt [11],\u1_Driver/vcnt [7]}));
  // NOFILE(0)
  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~C)"),
    //.LUTF1("0"),
    //.LUTG0("(A*~C)"),
    //.LUTG1("~C*~B*~A*~D+C*~B*~A*~D+~C*B*~A*~D+C*B*~A*~D+~C*~B*~A*D+C*~B*~A*D+~C*B*~A*D+C*B*~A*D"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000101000001010),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0000101000001010),
    .INIT_LUTG1(16'b0101010101010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_b1|reg0_b6  (
    .a({\u1_Driver/n6_lutinv ,\u1_Driver/n7 [6]}),
    .c({open_n3103,\u1_Driver/n6_lutinv }),
    .ce(\u1_Driver/n5 ),
    .clk(clk_vga),
    .e({\u1_Driver/n7 [1],open_n3106}),
    .sr(rst_n_pad),
    .q({\u1_Driver/vcnt [1],\u1_Driver/vcnt [6]}));
  // NOFILE(0)
  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~A)"),
    //.LUTF1("(C*~A)"),
    //.LUTG0("(C*~A)"),
    //.LUTG1("(C*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0101000001010000),
    .INIT_LUTF1(16'b0101000001010000),
    .INIT_LUTG0(16'b0101000001010000),
    .INIT_LUTG1(16'b0101000001010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_b2|reg0_b5  (
    .a({\u1_Driver/n6_lutinv ,\u1_Driver/n6_lutinv }),
    .c({\u1_Driver/n7 [2],\u1_Driver/n7 [5]}),
    .ce(\u1_Driver/n5 ),
    .clk(clk_vga),
    .sr(rst_n_pad),
    .q({\u1_Driver/vcnt [2],\u1_Driver/vcnt [5]}));
  // NOFILE(0)
  // source/rtl/Driver.v(78)
  // source/rtl/Driver.v(78)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTF1("A*~B*~C*~D+A*B*~C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    //.LUTG0("0"),
    //.LUTG1("0"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b1010101010101010),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_b3|reg0_b4  (
    .a({\u1_Driver/n7 [3],open_n3151}),
    .c({open_n3154,\u1_Driver/n7 [4]}),
    .ce(\u1_Driver/n5 ),
    .clk(clk_vga),
    .e({\u1_Driver/n6_lutinv ,\u1_Driver/n6_lutinv }),
    .sr(rst_n_pad),
    .q({\u1_Driver/vcnt [3],\u1_Driver/vcnt [4]}));
  // NOFILE(0)
  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(A*D)"),
    //.LUTF1("(A*B)"),
    //.LUTG0("(A*D)"),
    //.LUTG1("(A*B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101000000000),
    .INIT_LUTF1(16'b1000100010001000),
    .INIT_LUTG0(16'b1010101000000000),
    .INIT_LUTG1(16'b1000100010001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_b0|reg1_b9  (
    .a({\u1_Driver/n1 ,\u1_Driver/n1 }),
    .b({\u1_Driver/n2 [0],open_n3176}),
    .clk(clk_vga),
    .d({open_n3180,\u1_Driver/n2 [9]}),
    .sr(rst_n_pad),
    .q({\u1_Driver/hcnt [0],\u1_Driver/hcnt [9]}));
  // NOFILE(0)
  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~C*~B*A*~D+C*~B*A*~D+~C*B*A*~D+C*B*A*~D+~C*~B*A*D+C*~B*A*D+~C*B*A*D+C*B*A*D"),
    //.LUTG1("A*~B*~C*~D+A*B*~C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1010101010101010),
    .INIT_LUTG1(16'b1010101010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_b10|reg1_b8  (
    .a({\u1_Driver/n2 [10],\u1_Driver/n1 }),
    .clk(clk_vga),
    .e({\u1_Driver/n1 ,\u1_Driver/n2 [8]}),
    .sr(rst_n_pad),
    .q({\u1_Driver/hcnt [10],\u1_Driver/hcnt [8]}));
  // NOFILE(0)
  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("(C*B)"),
    //.LUTG0("~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG1("(C*B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b1100000011000000),
    .INIT_LUTG0(16'b1111000011110000),
    .INIT_LUTG1(16'b1100000011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_b11|reg1_b7  (
    .b({\u1_Driver/n2 [11],open_n3230}),
    .c({\u1_Driver/n1 ,\u1_Driver/n1 }),
    .clk(clk_vga),
    .e({open_n3234,\u1_Driver/n2 [7]}),
    .sr(rst_n_pad),
    .q({\u1_Driver/hcnt [11],\u1_Driver/hcnt [7]}));
  // NOFILE(0)
  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("0"),
    //.LUTG0("(C*D)"),
    //.LUTG1("~A*~B*~D*C+A*~B*~D*C+~A*B*~D*C+A*B*~D*C+~A*~B*D*C+A*~B*D*C+~A*B*D*C+A*B*D*C"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_b1|reg1_b6  (
    .c({\u1_Driver/n1 ,\u1_Driver/n1 }),
    .clk(clk_vga),
    .d({open_n3259,\u1_Driver/n2 [6]}),
    .e({\u1_Driver/n2 [1],open_n3260}),
    .sr(rst_n_pad),
    .q({\u1_Driver/hcnt [1],\u1_Driver/hcnt [6]}));
  // NOFILE(0)
  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("(D*B)"),
    //.LUTG0("~A*~B*D*~C+A*~B*D*~C+~A*B*D*~C+A*B*D*~C+~A*~B*D*C+A*~B*D*C+~A*B*D*C+A*B*D*C"),
    //.LUTG1("(D*B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b1100110000000000),
    .INIT_LUTG0(16'b1111111100000000),
    .INIT_LUTG1(16'b1100110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_b2|reg1_b5  (
    .b({\u1_Driver/n2 [2],open_n3282}),
    .clk(clk_vga),
    .d({\u1_Driver/n1 ,\u1_Driver/n1 }),
    .e({open_n3286,\u1_Driver/n2 [5]}),
    .sr(rst_n_pad),
    .q({\u1_Driver/hcnt [2],\u1_Driver/hcnt [5]}));
  // NOFILE(0)
  // source/rtl/Driver.v(62)
  // source/rtl/Driver.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("(D*A)"),
    //.LUTG0("~A*~B*D*~C+A*~B*D*~C+~A*B*D*~C+A*B*D*~C+~A*~B*D*C+A*~B*D*C+~A*B*D*C+A*B*D*C"),
    //.LUTG1("(D*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b1010101000000000),
    .INIT_LUTG0(16'b1111111100000000),
    .INIT_LUTG1(16'b1010101000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_b3|reg1_b4  (
    .a({\u1_Driver/n2 [3],open_n3306}),
    .clk(clk_vga),
    .d({\u1_Driver/n1 ,\u1_Driver/n1 }),
    .e({open_n3312,\u1_Driver/n2 [4]}),
    .sr(rst_n_pad),
    .q({\u1_Driver/hcnt [3],\u1_Driver/hcnt [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub0/ucin_al_u90"),
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
    \u1_Driver/sub0/u11_al_u93  (
    .a({open_n3332,\u1_Driver/hcnt [11]}),
    .c(2'b11),
    .d({open_n3337,1'b0}),
    .fci(\u1_Driver/sub0/c11 ),
    .f({open_n3354,\u1_Driver/n20 [11]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub0/ucin_al_u90"),
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
    \u1_Driver/sub0/u3_al_u91  (
    .a({\u1_Driver/hcnt [5],\u1_Driver/hcnt [3]}),
    .b({\u1_Driver/hcnt [6],\u1_Driver/hcnt [4]}),
    .c(2'b11),
    .d(2'b10),
    .e(2'b10),
    .fci(\u1_Driver/sub0/c3 ),
    .f({\u1_Driver/n20 [5],\u1_Driver/n20 [3]}),
    .fco(\u1_Driver/sub0/c7 ),
    .fx({\u1_Driver/n20 [6],\u1_Driver/n20 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub0/ucin_al_u90"),
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
    \u1_Driver/sub0/u7_al_u92  (
    .a({\u1_Driver/hcnt [9],\u1_Driver/hcnt [7]}),
    .b({\u1_Driver/hcnt [10],\u1_Driver/hcnt [8]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b01),
    .fci(\u1_Driver/sub0/c7 ),
    .f({\u1_Driver/n20 [9],\u1_Driver/n20 [7]}),
    .fco(\u1_Driver/sub0/c11 ),
    .fx({\u1_Driver/n20 [10],\u1_Driver/n20 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub0/ucin_al_u90"),
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
    \u1_Driver/sub0/ucin_al_u90  (
    .a({\u1_Driver/hcnt [1],1'b0}),
    .b({\u1_Driver/hcnt [2],\u1_Driver/hcnt [0]}),
    .c(2'b11),
    .d(2'b11),
    .e(2'b11),
    .f({\u1_Driver/n20 [1],open_n3413}),
    .fco(\u1_Driver/sub0/c3 ),
    .fx({\u1_Driver/n20 [2],\u1_Driver/n20 [0]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub1/ucin_al_u94"),
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
    \u1_Driver/sub1/u11_al_u97  (
    .a({open_n3416,\u1_Driver/vcnt [11]}),
    .c(2'b11),
    .d({open_n3421,1'b0}),
    .fci(\u1_Driver/sub1/c11 ),
    .f({open_n3438,\u1_Driver/n21 [11]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub1/ucin_al_u94"),
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
    \u1_Driver/sub1/u3_al_u95  (
    .a({\u1_Driver/vcnt [5],\u1_Driver/vcnt [3]}),
    .b({\u1_Driver/vcnt [6],\u1_Driver/vcnt [4]}),
    .c(2'b11),
    .d(2'b11),
    .e(2'b00),
    .fci(\u1_Driver/sub1/c3 ),
    .f({\u1_Driver/n21 [5],\u1_Driver/n21 [3]}),
    .fco(\u1_Driver/sub1/c7 ),
    .fx({\u1_Driver/n21 [6],\u1_Driver/n21 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub1/ucin_al_u94"),
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
    \u1_Driver/sub1/u7_al_u96  (
    .a({\u1_Driver/vcnt [9],\u1_Driver/vcnt [7]}),
    .b({\u1_Driver/vcnt [10],\u1_Driver/vcnt [8]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b00),
    .fci(\u1_Driver/sub1/c7 ),
    .f({\u1_Driver/n21 [9],\u1_Driver/n21 [7]}),
    .fco(\u1_Driver/sub1/c11 ),
    .fx({\u1_Driver/n21 [10],\u1_Driver/n21 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub1/ucin_al_u94"),
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
    \u1_Driver/sub1/ucin_al_u94  (
    .a({\u1_Driver/vcnt [1],1'b0}),
    .b({\u1_Driver/vcnt [2],\u1_Driver/vcnt [0]}),
    .c(2'b11),
    .d(2'b01),
    .e(2'b01),
    .f({\u1_Driver/n21 [1],open_n3497}),
    .fco(\u1_Driver/sub1/c3 ),
    .fx({\u1_Driver/n21 [2],\u1_Driver/n21 [0]}));
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
    .p({open_n3581,open_n3582,open_n3583,open_n3584,open_n3585,open_n3586,open_n3587,open_n3588,open_n3589,open_n3590,open_n3591,open_n3592,lcd_data}));

endmodule 

