// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Thu Aug  8 15:19:06 2019

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
  wire clk_vga;  // source/rtl/VGA_Demo.v(19)

  Clk_div u0_PLL (
    .clk(clk_24m),
    .rst_n(rst_n),
    .clk_div(clk_vga));  // source/rtl/VGA_Demo.v(25)
  Driver u1_Driver (
    .clk(clk_vga),
    .lcd_data(lcd_data),
    .rst_n(rst_n),
    .lcd_dclk(vga_clk),
    .lcd_en(vga_de),
    .lcd_hs(vga_hs),
    .lcd_rgb({vga_r,vga_g,vga_b}),
    .lcd_vs(vga_vs),
    .lcd_xpos(lcd_xpos),
    .lcd_ypos(lcd_ypos));  // source/rtl/VGA_Demo.v(34)
  Display u2_Display (
    .clk(clk_vga),
    .lcd_xpos(lcd_xpos),
    .lcd_ypos(lcd_ypos),
    .rst_n(rst_n),
    .lcd_data(lcd_data));  // source/rtl/VGA_Demo.v(51)

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

  not u0 (n0, rst_n);  // source/rtl/Clk_div.v(15)
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
  wire [11:0] n9;
  wire [11:0] vcnt;  // source/rtl/Driver.v(45)
  wire lcd_request;  // source/rtl/Driver.v(46)
  wire n0;
  wire n1;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n15;
  wire n16;
  wire n17;
  wire n18;
  wire n19;
  wire n4;
  wire n5;
  wire n6;

  add_pu12_pu12_o12 add0 (
    .i0(hcnt),
    .i1(12'b000000000001),
    .o(n2));  // source/rtl/Driver.v(59)
  add_pu12_pu12_o12 add1 (
    .i0(vcnt),
    .i1(12'b000000000001),
    .o(n7));  // source/rtl/Driver.v(77)
  eq_w12 eq0 (
    .i0(hcnt),
    .i1(12'b011010010111),
    .o(n5));  // source/rtl/Driver.v(72)
  eq_w12 eq1 (
    .i0(vcnt),
    .i1(12'b010000101001),
    .o(n6));  // source/rtl/Driver.v(74)
  lt_u12_u12 lt0 (
    .ci(1'b0),
    .i0(hcnt),
    .i1(12'b011010010111),
    .o(n1));  // source/rtl/Driver.v(58)
  lt_u12_u12 lt1 (
    .ci(1'b1),
    .i0(hcnt),
    .i1(12'b000001101111),
    .o(n4));  // source/rtl/Driver.v(65)
  lt_u12_u12 lt2 (
    .ci(1'b1),
    .i0(vcnt),
    .i1(12'b000000000010),
    .o(n10));  // source/rtl/Driver.v(81)
  lt_u12_u12 lt3 (
    .ci(1'b1),
    .i0(12'b000101101000),
    .i1(hcnt),
    .o(n11));  // source/rtl/Driver.v(87)
  lt_u12_u12 lt4 (
    .ci(1'b0),
    .i0(hcnt),
    .i1(12'b011001101000),
    .o(n12));  // source/rtl/Driver.v(87)
  lt_u12_u12 lt5 (
    .ci(1'b1),
    .i0(12'b000000101001),
    .i1(vcnt),
    .o(n14));  // source/rtl/Driver.v(88)
  lt_u12_u12 lt6 (
    .ci(1'b0),
    .i0(vcnt),
    .i1(12'b010000101001),
    .o(n15));  // source/rtl/Driver.v(88)
  lt_u12_u12 lt7 (
    .ci(1'b1),
    .i0(12'b000101100111),
    .i1(hcnt),
    .o(n17));  // source/rtl/Driver.v(94)
  lt_u12_u12 lt8 (
    .ci(1'b0),
    .i0(hcnt),
    .i1(12'b011001100111),
    .o(n18));  // source/rtl/Driver.v(94)
  binary_mux_s1_w12 mux0 (
    .i0(12'b000000000000),
    .i1(n2),
    .sel(n1),
    .o(n3));  // source/rtl/Driver.v(61)
  binary_mux_s1_w12 mux1 (
    .i0(n7),
    .i1(12'b000000000000),
    .sel(n6),
    .o(n8));  // source/rtl/Driver.v(77)
  binary_mux_s1_w12 mux2 (
    .i0(vcnt),
    .i1(n8),
    .sel(n5),
    .o(n9));  // source/rtl/Driver.v(78)
  binary_mux_s1_w24 mux3 (
    .i0(24'b000000000000000000000000),
    .i1(lcd_data),
    .sel(lcd_en),
    .o(lcd_rgb));  // source/rtl/Driver.v(91)
  binary_mux_s1_w32 mux4 (
    .i0(32'b00000000000000000000000000000000),
    .i1({n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20[12],n20}),
    .sel(lcd_request),
    .o({open_n0,open_n1,open_n2,open_n3,open_n4,open_n5,open_n6,open_n7,open_n8,open_n9,open_n10,open_n11,open_n12,open_n13,open_n14,open_n15,open_n16,open_n17,open_n18,open_n19,lcd_xpos}));  // source/rtl/Driver.v(98)
  binary_mux_s1_w32 mux5 (
    .i0(32'b00000000000000000000000000000000),
    .i1({n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21[12],n21}),
    .sel(lcd_request),
    .o({open_n20,open_n21,open_n22,open_n23,open_n24,open_n25,open_n26,open_n27,open_n28,open_n29,open_n30,open_n31,open_n32,open_n33,open_n34,open_n35,open_n36,open_n37,open_n38,open_n39,lcd_ypos}));  // source/rtl/Driver.v(99)
  reg_ar_as_w12 reg0 (
    .clk(clk),
    .d(n9),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(12'b000000000000),
    .q(vcnt));  // source/rtl/Driver.v(78)
  reg_ar_as_w12 reg1 (
    .clk(clk),
    .d(n3),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(12'b000000000000),
    .q(hcnt));  // source/rtl/Driver.v(62)
  add_pu13_mu13_o13 sub0 (
    .i0({1'b0,hcnt}),
    .i1(13'b0000101100111),
    .o(n20));  // source/rtl/Driver.v(98)
  add_pu13_mu13_o13 sub1 (
    .i0({1'b0,vcnt}),
    .i1(13'b0000000101001),
    .o(n21));  // source/rtl/Driver.v(99)
  and u10 (lcd_request, n19, n16);  // source/rtl/Driver.v(95)
  not u2 (n0, rst_n);  // source/rtl/Driver.v(54)
  not u3 (lcd_hs, n4);  // source/rtl/Driver.v(65)
  not u4 (lcd_vs, n10);  // source/rtl/Driver.v(81)
  not u5 (lcd_dclk, clk);  // source/rtl/Driver.v(84)
  and u6 (n13, n11, n12);  // source/rtl/Driver.v(87)
  and u7 (n16, n14, n15);  // source/rtl/Driver.v(88)
  and u8 (lcd_en, n13, n16);  // source/rtl/Driver.v(88)
  and u9 (n19, n17, n18);  // source/rtl/Driver.v(94)

endmodule 

module Display  // source/rtl/Display.v(19)
  (
  clk,
  lcd_xpos,
  lcd_ypos,
  rst_n,
  lcd_data
  );

  input clk;  // source/rtl/Display.v(25)
  input [11:0] lcd_xpos;  // source/rtl/Display.v(27)
  input [11:0] lcd_ypos;  // source/rtl/Display.v(28)
  input rst_n;  // source/rtl/Display.v(26)
  output [23:0] lcd_data;  // source/rtl/Display.v(30)

  parameter H_DISP = 1280;
  parameter V_DISP = 1024;
  wire [23:0] n1;
  wire n0;

  mult_u12_u12_o24 mult0 (
    .i0(lcd_xpos),
    .i1(lcd_ypos),
    .o(n1));  // source/rtl/Display.v(93)
  reg_ar_as_w24 reg0 (
    .clk(clk),
    .d(n1),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(24'b000000000000000000000000),
    .q(lcd_data));  // source/rtl/Display.v(93)
  not u1 (n0, rst_n);  // source/rtl/Display.v(90)

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

  EG_LOGIC_BUFG bufg_feedback (
    .i(clk0_buf),
    .o(clk0_out));  // al_ip/PLL.v(34)
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

module add_pu12_pu12_o12
  (
  i0,
  i1,
  o
  );

  input [11:0] i0;
  input [11:0] i1;
  output [11:0] o;



endmodule 

module eq_w12
  (
  i0,
  i1,
  o
  );

  input [11:0] i0;
  input [11:0] i1;
  output o;



endmodule 

module lt_u12_u12
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [11:0] i0;
  input [11:0] i1;
  output o;



endmodule 

module binary_mux_s1_w12
  (
  i0,
  i1,
  sel,
  o
  );

  input [11:0] i0;
  input [11:0] i1;
  input sel;
  output [11:0] o;



endmodule 

module binary_mux_s1_w24
  (
  i0,
  i1,
  sel,
  o
  );

  input [23:0] i0;
  input [23:0] i1;
  input sel;
  output [23:0] o;



endmodule 

module binary_mux_s1_w32
  (
  i0,
  i1,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input sel;
  output [31:0] o;



endmodule 

module reg_ar_as_w12
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [11:0] d;
  input en;
  input [11:0] reset;
  input [11:0] set;
  output [11:0] q;



endmodule 

module add_pu13_mu13_o13
  (
  i0,
  i1,
  o
  );

  input [12:0] i0;
  input [12:0] i1;
  output [12:0] o;



endmodule 

module mult_u12_u12_o24
  (
  i0,
  i1,
  o
  );

  input [11:0] i0;
  input [11:0] i1;
  output [23:0] o;



endmodule 

module reg_ar_as_w24
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [23:0] d;
  input en;
  input [23:0] reset;
  input [23:0] set;
  output [23:0] q;



endmodule 

