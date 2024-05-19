// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by Tang Dynasty v5.6.59063
// Sat Oct  8 17:30:41 2022

`timescale 1ns / 1ps
module VGA_Demo  // ../../source/rtl/VGA_Demo.v(2)
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

  input clk_24m;  // ../../source/rtl/VGA_Demo.v(4)
  input rst_n;  // ../../source/rtl/VGA_Demo.v(5)
  output [7:0] vga_b;  // ../../source/rtl/VGA_Demo.v(16)
  output vga_clk;  // ../../source/rtl/VGA_Demo.v(8)
  output vga_de;  // ../../source/rtl/VGA_Demo.v(12)
  output [7:0] vga_g;  // ../../source/rtl/VGA_Demo.v(15)
  output vga_hs;  // ../../source/rtl/VGA_Demo.v(9)
  output [7:0] vga_r;  // ../../source/rtl/VGA_Demo.v(14)
  output vga_vs;  // ../../source/rtl/VGA_Demo.v(10)

  wire [11:0] \u1_Driver/hcnt ;  // ../../source/rtl/Driver.v(44)
  wire [11:0] \u1_Driver/hcnt_b ;
  wire [11:0] \u1_Driver/hcnt_b1 ;
  wire [23:0] \u1_Driver/lcd_data ;  // ../../source/rtl/Driver.v(28)
  wire [12:0] \u1_Driver/lcd_xpos_b ;
  wire [12:0] \u1_Driver/lcd_ypos_b ;
  wire [11:0] \u1_Driver/vcnt ;  // ../../source/rtl/Driver.v(45)
  wire [11:0] \u1_Driver/vcnt_b1 ;
  wire [11:0] \u1_Driver/vcnt_b2 ;
  wire [11:0] \u2_Display/lcd_xpos ;  // ../../source/rtl/Display.v(27)
  wire [11:0] \u2_Display/lcd_ypos ;  // ../../source/rtl/Display.v(28)
  wire clk_24m_dup_1;  // ../../source/rtl/VGA_Demo.v(4)
  wire rst_n_dup_1;  // ../../source/rtl/VGA_Demo.v(5)
  wire \vga_b[7]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(16)
  wire \vga_b[6]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(16)
  wire \vga_b[5]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(16)
  wire \vga_b[4]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(16)
  wire \vga_b[3]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(16)
  wire \vga_b[2]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(16)
  wire \vga_b[1]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(16)
  wire \vga_b[0]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(16)
  wire vga_clk_dup_1;  // ../../source/rtl/VGA_Demo.v(8)
  wire \vga_g[7]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(15)
  wire \vga_g[6]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(15)
  wire \vga_g[5]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(15)
  wire \vga_g[4]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(15)
  wire \vga_g[3]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(15)
  wire \vga_g[2]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(15)
  wire \vga_g[1]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(15)
  wire \vga_g[0]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(15)
  wire vga_hs_dup_1;  // ../../source/rtl/VGA_Demo.v(9)
  wire \vga_r[4]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(14)
  wire \vga_r[3]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(14)
  wire \vga_r[2]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(14)
  wire \vga_r[1]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(14)
  wire \vga_r[0]_dup_1 ;  // ../../source/rtl/VGA_Demo.v(14)
  wire vga_vs_dup_1;  // ../../source/rtl/VGA_Demo.v(10)
  wire \u0_PLL/uut/clk0_buf ;  // ../../al_ip/PLL.v(34)
  wire \u0_PLL/uut/reset ;  // ../../al_ip/PLL.v(30)
  wire \u1_Driver/add0_syn_61 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_62 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_63 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_64 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_65 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_66 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_67 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_68 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_69 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_70 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_71 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_72 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add1_syn_57 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/add1_syn_58 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/add1_syn_59 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/add1_syn_60 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/add1_syn_61 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/add1_syn_62 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/add1_syn_63 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/add1_syn_64 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/add1_syn_65 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/add1_syn_66 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/add1_syn_67 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/lt0_syn_6 ;  // ../../source/rtl/Driver.v(65)
  wire \u1_Driver/lt0_syn_8 ;  // ../../source/rtl/Driver.v(65)
  wire \u1_Driver/lt0_syn_10 ;  // ../../source/rtl/Driver.v(65)
  wire \u1_Driver/lt0_syn_12 ;  // ../../source/rtl/Driver.v(65)
  wire \u1_Driver/lt0_syn_14 ;  // ../../source/rtl/Driver.v(65)
  wire \u1_Driver/lt0_syn_16 ;  // ../../source/rtl/Driver.v(65)
  wire \u1_Driver/lt0_syn_18 ;  // ../../source/rtl/Driver.v(65)
  wire \u1_Driver/lt0_syn_20 ;  // ../../source/rtl/Driver.v(65)
  wire \u1_Driver/lt1_syn_3 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_5 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_7 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_9 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_11 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_13 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_15 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_17 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_19 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_21 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_23 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_25 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_27 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt2_syn_6 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt2_syn_8 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt2_syn_10 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt2_syn_12 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt2_syn_14 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt2_syn_16 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt2_syn_18 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt2_syn_20 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt2_syn_22 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_6 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_8 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_10 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_12 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_14 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_16 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_18 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_20 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_22 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt4_syn_3 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_5 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_7 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_9 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_11 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_13 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_15 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_17 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_19 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_21 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_23 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_25 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_27 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_3 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_5 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_7 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_9 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_11 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_13 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_15 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_17 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_19 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_21 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_23 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_25 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_27 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt6_syn_4 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_6 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_8 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_10 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_12 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_14 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_16 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_18 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_20 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_22 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_24 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_26 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_4 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_6 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_8 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_10 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_12 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_14 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_16 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_18 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_20 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_22 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_24 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_26 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt8_syn_4 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_6 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_8 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_10 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_12 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_14 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_16 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_18 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_20 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_22 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_24 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_26 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/sub0_syn_58 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub0_syn_59 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub0_syn_60 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub0_syn_61 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub0_syn_62 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub0_syn_63 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub0_syn_64 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub0_syn_65 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub0_syn_66 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub0_syn_67 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub0_syn_68 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub1_syn_53 ;  // ../../source/rtl/Driver.v(99)
  wire \u1_Driver/sub1_syn_54 ;  // ../../source/rtl/Driver.v(99)
  wire \u1_Driver/sub1_syn_55 ;  // ../../source/rtl/Driver.v(99)
  wire \u1_Driver/sub1_syn_56 ;  // ../../source/rtl/Driver.v(99)
  wire \u1_Driver/sub1_syn_57 ;  // ../../source/rtl/Driver.v(99)
  wire \u1_Driver/sub1_syn_58 ;  // ../../source/rtl/Driver.v(99)
  wire \u1_Driver/sub1_syn_59 ;  // ../../source/rtl/Driver.v(99)
  wire \u1_Driver/sub1_syn_60 ;  // ../../source/rtl/Driver.v(99)
  wire \u1_Driver/sub1_syn_61 ;  // ../../source/rtl/Driver.v(99)
  wire \u1_Driver/sub1_syn_62 ;  // ../../source/rtl/Driver.v(99)
  wire \u1_Driver/vcnt_b1[3]_syn_2 ;
  wire \u1_Driver/vcnt_b1[3]_syn_4 ;
  wire \u1_Driver/clk ;  // ../../source/rtl/Driver.v(26)
  wire \u1_Driver/hcnt_b_n ;
  wire \u1_Driver/lcd_en_n ;
  wire \u1_Driver/lcd_en_n2 ;
  wire \u1_Driver/lcd_en_n3 ;
  wire \u1_Driver/lcd_en_n5 ;
  wire \u1_Driver/lcd_en_n6 ;
  wire \u1_Driver/lcd_hs_n ;
  wire \u1_Driver/lcd_request_n ;
  wire \u1_Driver/lcd_request_n2 ;
  wire \u1_Driver/lcd_request_n3 ;
  wire \u1_Driver/lcd_vs_n ;
  wire \u1_Driver/vcnt_b1_n ;
  wire \u1_Driver/vcnt_b_n ;
  wire \u1_Driver/vcnt_b_n_syn_2 ;
  wire \u1_Driver/vcnt_b_n_syn_4 ;

  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    clk_24m_syn_2 (
    .ipad(clk_24m),
    .di(clk_24m_dup_1));  // ../../source/rtl/VGA_Demo.v(4)
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.LOCATION("G11"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    rst_n_syn_2 (
    .ipad(rst_n),
    .di(rst_n_dup_1));  // ../../source/rtl/VGA_Demo.v(5)
  EG_PHY_GCLK \u0_PLL/uut/bufg_feedback  (
    .clki(\u0_PLL/uut/clk0_buf ),
    .clko(\u1_Driver/clk ));  // ../../al_ip/PLL.v(36)
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
    .GMC_GAIN(0),
    .GMC_TEST(14),
    .ICP_CURRENT(9),
    .IF_ESCLKSTSW("DISABLE"),
    .INTFB_WAKE("DISABLE"),
    .KVCO(2),
    .LPF_CAPACITOR(2),
    .LPF_RESISTOR(8),
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
    .fbclk(\u1_Driver/clk ),
    .load_reg(1'b0),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(clk_24m_dup_1),
    .reset(\u0_PLL/uut/reset ),
    .stdby(1'b0),
    .clkc({open_n81,open_n82,open_n83,open_n84,\u0_PLL/uut/clk0_buf }));  // ../../al_ip/PLL.v(63)
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    \u0_PLL/uut/reset_syn_1  (
    .a(rst_n_dup_1),
    .o(\u0_PLL/uut/reset ));  // ../../al_ip/PLL.v(30)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u1_Driver/add0_syn_11  (
    .a(1'b0),
    .o({\u1_Driver/add0_syn_61 ,open_n97}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add0_syn_12  (
    .a(\u1_Driver/vcnt [0]),
    .b(1'b1),
    .c(\u1_Driver/add0_syn_61 ),
    .o({\u1_Driver/add0_syn_62 ,\u1_Driver/vcnt_b2 [0]}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add0_syn_13  (
    .a(\u1_Driver/vcnt [1]),
    .b(1'b0),
    .c(\u1_Driver/add0_syn_62 ),
    .o({\u1_Driver/add0_syn_63 ,\u1_Driver/vcnt_b2 [1]}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add0_syn_14  (
    .a(\u1_Driver/vcnt [2]),
    .b(1'b0),
    .c(\u1_Driver/add0_syn_63 ),
    .o({\u1_Driver/add0_syn_64 ,\u1_Driver/vcnt_b2 [2]}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add0_syn_15  (
    .a(\u1_Driver/vcnt [3]),
    .b(1'b0),
    .c(\u1_Driver/add0_syn_64 ),
    .o({\u1_Driver/add0_syn_65 ,\u1_Driver/vcnt_b2 [3]}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add0_syn_16  (
    .a(\u1_Driver/vcnt [4]),
    .b(1'b0),
    .c(\u1_Driver/add0_syn_65 ),
    .o({\u1_Driver/add0_syn_66 ,\u1_Driver/vcnt_b2 [4]}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add0_syn_17  (
    .a(\u1_Driver/vcnt [5]),
    .b(1'b0),
    .c(\u1_Driver/add0_syn_66 ),
    .o({\u1_Driver/add0_syn_67 ,\u1_Driver/vcnt_b2 [5]}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add0_syn_18  (
    .a(\u1_Driver/vcnt [6]),
    .b(1'b0),
    .c(\u1_Driver/add0_syn_67 ),
    .o({\u1_Driver/add0_syn_68 ,\u1_Driver/vcnt_b2 [6]}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add0_syn_19  (
    .a(\u1_Driver/vcnt [7]),
    .b(1'b0),
    .c(\u1_Driver/add0_syn_68 ),
    .o({\u1_Driver/add0_syn_69 ,\u1_Driver/vcnt_b2 [7]}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add0_syn_20  (
    .a(\u1_Driver/vcnt [8]),
    .b(1'b0),
    .c(\u1_Driver/add0_syn_69 ),
    .o({\u1_Driver/add0_syn_70 ,\u1_Driver/vcnt_b2 [8]}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add0_syn_21  (
    .a(\u1_Driver/vcnt [9]),
    .b(1'b0),
    .c(\u1_Driver/add0_syn_70 ),
    .o({\u1_Driver/add0_syn_71 ,\u1_Driver/vcnt_b2 [9]}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add0_syn_22  (
    .a(\u1_Driver/vcnt [10]),
    .b(1'b0),
    .c(\u1_Driver/add0_syn_71 ),
    .o({\u1_Driver/add0_syn_72 ,\u1_Driver/vcnt_b2 [10]}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add0_syn_23  (
    .a(\u1_Driver/vcnt [11]),
    .b(1'b0),
    .c(\u1_Driver/add0_syn_72 ),
    .o({open_n98,\u1_Driver/vcnt_b2 [11]}));  // ../../source/rtl/Driver.v(77)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u1_Driver/add1_syn_11  (
    .a(1'b0),
    .o({\u1_Driver/add1_syn_57 ,open_n101}));  // ../../source/rtl/Driver.v(59)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add1_syn_12  (
    .a(\u1_Driver/hcnt [0]),
    .b(1'b1),
    .c(\u1_Driver/add1_syn_57 ),
    .o({\u1_Driver/add1_syn_58 ,\u1_Driver/hcnt_b1 [0]}));  // ../../source/rtl/Driver.v(59)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add1_syn_13  (
    .a(\u1_Driver/hcnt [1]),
    .b(1'b0),
    .c(\u1_Driver/add1_syn_58 ),
    .o({\u1_Driver/add1_syn_59 ,\u1_Driver/hcnt_b1 [1]}));  // ../../source/rtl/Driver.v(59)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add1_syn_14  (
    .a(\u1_Driver/hcnt [2]),
    .b(1'b0),
    .c(\u1_Driver/add1_syn_59 ),
    .o({\u1_Driver/add1_syn_60 ,\u1_Driver/hcnt_b1 [2]}));  // ../../source/rtl/Driver.v(59)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add1_syn_15  (
    .a(\u1_Driver/hcnt [3]),
    .b(1'b0),
    .c(\u1_Driver/add1_syn_60 ),
    .o({\u1_Driver/add1_syn_61 ,\u1_Driver/hcnt_b1 [3]}));  // ../../source/rtl/Driver.v(59)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add1_syn_16  (
    .a(\u1_Driver/hcnt [4]),
    .b(1'b0),
    .c(\u1_Driver/add1_syn_61 ),
    .o({\u1_Driver/add1_syn_62 ,\u1_Driver/hcnt_b1 [4]}));  // ../../source/rtl/Driver.v(59)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add1_syn_17  (
    .a(\u1_Driver/hcnt [5]),
    .b(1'b0),
    .c(\u1_Driver/add1_syn_62 ),
    .o({\u1_Driver/add1_syn_63 ,\u1_Driver/hcnt_b1 [5]}));  // ../../source/rtl/Driver.v(59)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add1_syn_18  (
    .a(\u1_Driver/hcnt [6]),
    .b(1'b0),
    .c(\u1_Driver/add1_syn_63 ),
    .o({\u1_Driver/add1_syn_64 ,\u1_Driver/hcnt_b1 [6]}));  // ../../source/rtl/Driver.v(59)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add1_syn_19  (
    .a(\u1_Driver/hcnt [7]),
    .b(1'b0),
    .c(\u1_Driver/add1_syn_64 ),
    .o({\u1_Driver/add1_syn_65 ,\u1_Driver/hcnt_b1 [7]}));  // ../../source/rtl/Driver.v(59)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add1_syn_20  (
    .a(\u1_Driver/hcnt [8]),
    .b(1'b0),
    .c(\u1_Driver/add1_syn_65 ),
    .o({\u1_Driver/add1_syn_66 ,\u1_Driver/hcnt_b1 [8]}));  // ../../source/rtl/Driver.v(59)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add1_syn_21  (
    .a(\u1_Driver/hcnt [9]),
    .b(1'b0),
    .c(\u1_Driver/add1_syn_66 ),
    .o({\u1_Driver/add1_syn_67 ,\u1_Driver/hcnt_b1 [9]}));  // ../../source/rtl/Driver.v(59)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u1_Driver/add1_syn_22  (
    .a(\u1_Driver/hcnt [10]),
    .b(1'b0),
    .c(\u1_Driver/add1_syn_67 ),
    .o({open_n102,\u1_Driver/hcnt_b1 [10]}));  // ../../source/rtl/Driver.v(59)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u1_Driver/hcnt_b[0]_syn_1  (
    .a(\u1_Driver/hcnt_b1 [0]),
    .b(\u1_Driver/hcnt_b_n ),
    .o(\u1_Driver/hcnt_b [0]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u1_Driver/hcnt_b[10]_syn_1  (
    .a(\u1_Driver/hcnt_b1 [10]),
    .b(\u1_Driver/hcnt_b_n ),
    .o(\u1_Driver/hcnt_b [10]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u1_Driver/hcnt_b[1]_syn_1  (
    .a(\u1_Driver/hcnt_b1 [1]),
    .b(\u1_Driver/hcnt_b_n ),
    .o(\u1_Driver/hcnt_b [1]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u1_Driver/hcnt_b[2]_syn_1  (
    .a(\u1_Driver/hcnt_b1 [2]),
    .b(\u1_Driver/hcnt_b_n ),
    .o(\u1_Driver/hcnt_b [2]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u1_Driver/hcnt_b[3]_syn_1  (
    .a(\u1_Driver/hcnt_b1 [3]),
    .b(\u1_Driver/hcnt_b_n ),
    .o(\u1_Driver/hcnt_b [3]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u1_Driver/hcnt_b[4]_syn_1  (
    .a(\u1_Driver/hcnt_b1 [4]),
    .b(\u1_Driver/hcnt_b_n ),
    .o(\u1_Driver/hcnt_b [4]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u1_Driver/hcnt_b[5]_syn_1  (
    .a(\u1_Driver/hcnt_b1 [5]),
    .b(\u1_Driver/hcnt_b_n ),
    .o(\u1_Driver/hcnt_b [5]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u1_Driver/hcnt_b[6]_syn_1  (
    .a(\u1_Driver/hcnt_b1 [6]),
    .b(\u1_Driver/hcnt_b_n ),
    .o(\u1_Driver/hcnt_b [6]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u1_Driver/hcnt_b[7]_syn_1  (
    .a(\u1_Driver/hcnt_b1 [7]),
    .b(\u1_Driver/hcnt_b_n ),
    .o(\u1_Driver/hcnt_b [7]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u1_Driver/hcnt_b[8]_syn_1  (
    .a(\u1_Driver/hcnt_b1 [8]),
    .b(\u1_Driver/hcnt_b_n ),
    .o(\u1_Driver/hcnt_b [8]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u1_Driver/hcnt_b[9]_syn_1  (
    .a(\u1_Driver/hcnt_b1 [9]),
    .b(\u1_Driver/hcnt_b_n ),
    .o(\u1_Driver/hcnt_b [9]));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt0_syn_11  (
    .a(\u1_Driver/hcnt [7]),
    .b(1'b0),
    .c(\u1_Driver/lt0_syn_12 ),
    .o({\u1_Driver/lt0_syn_14 ,open_n103}));  // ../../source/rtl/Driver.v(65)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt0_syn_13  (
    .a(\u1_Driver/hcnt [8]),
    .b(1'b0),
    .c(\u1_Driver/lt0_syn_14 ),
    .o({\u1_Driver/lt0_syn_16 ,open_n104}));  // ../../source/rtl/Driver.v(65)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt0_syn_15  (
    .a(\u1_Driver/hcnt [9]),
    .b(1'b0),
    .c(\u1_Driver/lt0_syn_16 ),
    .o({\u1_Driver/lt0_syn_18 ,open_n105}));  // ../../source/rtl/Driver.v(65)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt0_syn_17  (
    .a(\u1_Driver/hcnt [10]),
    .b(1'b0),
    .c(\u1_Driver/lt0_syn_18 ),
    .o({\u1_Driver/lt0_syn_20 ,open_n106}));  // ../../source/rtl/Driver.v(65)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt0_syn_19  (
    .a(1'b0),
    .b(1'b1),
    .c(\u1_Driver/lt0_syn_20 ),
    .o({open_n107,\u1_Driver/lcd_hs_n }));  // ../../source/rtl/Driver.v(65)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u1_Driver/lt0_syn_4  (
    .a(1'b1),
    .o({\u1_Driver/lt0_syn_6 ,open_n110}));  // ../../source/rtl/Driver.v(65)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt0_syn_5  (
    .a(\u1_Driver/hcnt [4]),
    .b(1'b0),
    .c(\u1_Driver/lt0_syn_6 ),
    .o({\u1_Driver/lt0_syn_8 ,open_n111}));  // ../../source/rtl/Driver.v(65)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt0_syn_7  (
    .a(\u1_Driver/hcnt [5]),
    .b(1'b1),
    .c(\u1_Driver/lt0_syn_8 ),
    .o({\u1_Driver/lt0_syn_10 ,open_n112}));  // ../../source/rtl/Driver.v(65)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt0_syn_9  (
    .a(\u1_Driver/hcnt [6]),
    .b(1'b1),
    .c(\u1_Driver/lt0_syn_10 ),
    .o({\u1_Driver/lt0_syn_12 ,open_n113}));  // ../../source/rtl/Driver.v(65)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u1_Driver/lt1_syn_1  (
    .a(1'b1),
    .o({\u1_Driver/lt1_syn_3 ,open_n116}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_10  (
    .a(\u1_Driver/vcnt [4]),
    .b(1'b0),
    .c(\u1_Driver/lt1_syn_11 ),
    .o({\u1_Driver/lt1_syn_13 ,open_n117}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_12  (
    .a(\u1_Driver/vcnt [5]),
    .b(1'b0),
    .c(\u1_Driver/lt1_syn_13 ),
    .o({\u1_Driver/lt1_syn_15 ,open_n118}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_14  (
    .a(\u1_Driver/vcnt [6]),
    .b(1'b0),
    .c(\u1_Driver/lt1_syn_15 ),
    .o({\u1_Driver/lt1_syn_17 ,open_n119}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_16  (
    .a(\u1_Driver/vcnt [7]),
    .b(1'b0),
    .c(\u1_Driver/lt1_syn_17 ),
    .o({\u1_Driver/lt1_syn_19 ,open_n120}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_18  (
    .a(\u1_Driver/vcnt [8]),
    .b(1'b0),
    .c(\u1_Driver/lt1_syn_19 ),
    .o({\u1_Driver/lt1_syn_21 ,open_n121}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_2  (
    .a(\u1_Driver/vcnt [0]),
    .b(1'b0),
    .c(\u1_Driver/lt1_syn_3 ),
    .o({\u1_Driver/lt1_syn_5 ,open_n122}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_20  (
    .a(\u1_Driver/vcnt [9]),
    .b(1'b0),
    .c(\u1_Driver/lt1_syn_21 ),
    .o({\u1_Driver/lt1_syn_23 ,open_n123}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_22  (
    .a(\u1_Driver/vcnt [10]),
    .b(1'b0),
    .c(\u1_Driver/lt1_syn_23 ),
    .o({\u1_Driver/lt1_syn_25 ,open_n124}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_24  (
    .a(\u1_Driver/vcnt [11]),
    .b(1'b0),
    .c(\u1_Driver/lt1_syn_25 ),
    .o({\u1_Driver/lt1_syn_27 ,open_n125}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_26  (
    .a(1'b0),
    .b(1'b1),
    .c(\u1_Driver/lt1_syn_27 ),
    .o({open_n126,\u1_Driver/lcd_vs_n }));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_4  (
    .a(\u1_Driver/vcnt [1]),
    .b(1'b1),
    .c(\u1_Driver/lt1_syn_5 ),
    .o({\u1_Driver/lt1_syn_7 ,open_n127}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_6  (
    .a(\u1_Driver/vcnt [2]),
    .b(1'b0),
    .c(\u1_Driver/lt1_syn_7 ),
    .o({\u1_Driver/lt1_syn_9 ,open_n128}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt1_syn_8  (
    .a(\u1_Driver/vcnt [3]),
    .b(1'b0),
    .c(\u1_Driver/lt1_syn_9 ),
    .o({\u1_Driver/lt1_syn_11 ,open_n129}));  // ../../source/rtl/Driver.v(81)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt2_syn_11  (
    .a(1'b1),
    .b(\u1_Driver/hcnt [6]),
    .c(\u1_Driver/lt2_syn_12 ),
    .o({\u1_Driver/lt2_syn_14 ,open_n130}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt2_syn_13  (
    .a(1'b0),
    .b(\u1_Driver/hcnt [7]),
    .c(\u1_Driver/lt2_syn_14 ),
    .o({\u1_Driver/lt2_syn_16 ,open_n131}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt2_syn_15  (
    .a(1'b1),
    .b(\u1_Driver/hcnt [8]),
    .c(\u1_Driver/lt2_syn_16 ),
    .o({\u1_Driver/lt2_syn_18 ,open_n132}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt2_syn_17  (
    .a(1'b0),
    .b(\u1_Driver/hcnt [9]),
    .c(\u1_Driver/lt2_syn_18 ),
    .o({\u1_Driver/lt2_syn_20 ,open_n133}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt2_syn_19  (
    .a(1'b0),
    .b(\u1_Driver/hcnt [10]),
    .c(\u1_Driver/lt2_syn_20 ),
    .o({\u1_Driver/lt2_syn_22 ,open_n134}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt2_syn_21  (
    .a(1'b0),
    .b(1'b1),
    .c(\u1_Driver/lt2_syn_22 ),
    .o({open_n135,\u1_Driver/lcd_en_n2 }));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u1_Driver/lt2_syn_4  (
    .a(1'b1),
    .o({\u1_Driver/lt2_syn_6 ,open_n138}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt2_syn_5  (
    .a(1'b1),
    .b(\u1_Driver/hcnt [3]),
    .c(\u1_Driver/lt2_syn_6 ),
    .o({\u1_Driver/lt2_syn_8 ,open_n139}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt2_syn_7  (
    .a(1'b0),
    .b(\u1_Driver/hcnt [4]),
    .c(\u1_Driver/lt2_syn_8 ),
    .o({\u1_Driver/lt2_syn_10 ,open_n140}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt2_syn_9  (
    .a(1'b1),
    .b(\u1_Driver/hcnt [5]),
    .c(\u1_Driver/lt2_syn_10 ),
    .o({\u1_Driver/lt2_syn_12 ,open_n141}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt3_syn_11  (
    .a(\u1_Driver/hcnt [6]),
    .b(1'b1),
    .c(\u1_Driver/lt3_syn_12 ),
    .o({\u1_Driver/lt3_syn_14 ,open_n142}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt3_syn_13  (
    .a(\u1_Driver/hcnt [7]),
    .b(1'b0),
    .c(\u1_Driver/lt3_syn_14 ),
    .o({\u1_Driver/lt3_syn_16 ,open_n143}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt3_syn_15  (
    .a(\u1_Driver/hcnt [8]),
    .b(1'b0),
    .c(\u1_Driver/lt3_syn_16 ),
    .o({\u1_Driver/lt3_syn_18 ,open_n144}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt3_syn_17  (
    .a(\u1_Driver/hcnt [9]),
    .b(1'b1),
    .c(\u1_Driver/lt3_syn_18 ),
    .o({\u1_Driver/lt3_syn_20 ,open_n145}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt3_syn_19  (
    .a(\u1_Driver/hcnt [10]),
    .b(1'b1),
    .c(\u1_Driver/lt3_syn_20 ),
    .o({\u1_Driver/lt3_syn_22 ,open_n146}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt3_syn_21  (
    .a(1'b0),
    .b(1'b1),
    .c(\u1_Driver/lt3_syn_22 ),
    .o({open_n147,\u1_Driver/lcd_en_n3 }));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u1_Driver/lt3_syn_4  (
    .a(1'b0),
    .o({\u1_Driver/lt3_syn_6 ,open_n150}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt3_syn_5  (
    .a(\u1_Driver/hcnt [3]),
    .b(1'b1),
    .c(\u1_Driver/lt3_syn_6 ),
    .o({\u1_Driver/lt3_syn_8 ,open_n151}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt3_syn_7  (
    .a(\u1_Driver/hcnt [4]),
    .b(1'b0),
    .c(\u1_Driver/lt3_syn_8 ),
    .o({\u1_Driver/lt3_syn_10 ,open_n152}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt3_syn_9  (
    .a(\u1_Driver/hcnt [5]),
    .b(1'b1),
    .c(\u1_Driver/lt3_syn_10 ),
    .o({\u1_Driver/lt3_syn_12 ,open_n153}));  // ../../source/rtl/Driver.v(87)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u1_Driver/lt4_syn_1  (
    .a(1'b1),
    .o({\u1_Driver/lt4_syn_3 ,open_n156}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_10  (
    .a(1'b0),
    .b(\u1_Driver/vcnt [4]),
    .c(\u1_Driver/lt4_syn_11 ),
    .o({\u1_Driver/lt4_syn_13 ,open_n157}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_12  (
    .a(1'b1),
    .b(\u1_Driver/vcnt [5]),
    .c(\u1_Driver/lt4_syn_13 ),
    .o({\u1_Driver/lt4_syn_15 ,open_n158}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_14  (
    .a(1'b0),
    .b(\u1_Driver/vcnt [6]),
    .c(\u1_Driver/lt4_syn_15 ),
    .o({\u1_Driver/lt4_syn_17 ,open_n159}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_16  (
    .a(1'b0),
    .b(\u1_Driver/vcnt [7]),
    .c(\u1_Driver/lt4_syn_17 ),
    .o({\u1_Driver/lt4_syn_19 ,open_n160}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_18  (
    .a(1'b0),
    .b(\u1_Driver/vcnt [8]),
    .c(\u1_Driver/lt4_syn_19 ),
    .o({\u1_Driver/lt4_syn_21 ,open_n161}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_2  (
    .a(1'b1),
    .b(\u1_Driver/vcnt [0]),
    .c(\u1_Driver/lt4_syn_3 ),
    .o({\u1_Driver/lt4_syn_5 ,open_n162}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_20  (
    .a(1'b0),
    .b(\u1_Driver/vcnt [9]),
    .c(\u1_Driver/lt4_syn_21 ),
    .o({\u1_Driver/lt4_syn_23 ,open_n163}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_22  (
    .a(1'b0),
    .b(\u1_Driver/vcnt [10]),
    .c(\u1_Driver/lt4_syn_23 ),
    .o({\u1_Driver/lt4_syn_25 ,open_n164}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_24  (
    .a(1'b0),
    .b(\u1_Driver/vcnt [11]),
    .c(\u1_Driver/lt4_syn_25 ),
    .o({\u1_Driver/lt4_syn_27 ,open_n165}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_26  (
    .a(1'b0),
    .b(1'b1),
    .c(\u1_Driver/lt4_syn_27 ),
    .o({open_n166,\u1_Driver/lcd_en_n5 }));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_4  (
    .a(1'b0),
    .b(\u1_Driver/vcnt [1]),
    .c(\u1_Driver/lt4_syn_5 ),
    .o({\u1_Driver/lt4_syn_7 ,open_n167}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_6  (
    .a(1'b0),
    .b(\u1_Driver/vcnt [2]),
    .c(\u1_Driver/lt4_syn_7 ),
    .o({\u1_Driver/lt4_syn_9 ,open_n168}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt4_syn_8  (
    .a(1'b1),
    .b(\u1_Driver/vcnt [3]),
    .c(\u1_Driver/lt4_syn_9 ),
    .o({\u1_Driver/lt4_syn_11 ,open_n169}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u1_Driver/lt5_syn_1  (
    .a(1'b0),
    .o({\u1_Driver/lt5_syn_3 ,open_n172}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_10  (
    .a(\u1_Driver/vcnt [4]),
    .b(1'b0),
    .c(\u1_Driver/lt5_syn_11 ),
    .o({\u1_Driver/lt5_syn_13 ,open_n173}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_12  (
    .a(\u1_Driver/vcnt [5]),
    .b(1'b1),
    .c(\u1_Driver/lt5_syn_13 ),
    .o({\u1_Driver/lt5_syn_15 ,open_n174}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_14  (
    .a(\u1_Driver/vcnt [6]),
    .b(1'b0),
    .c(\u1_Driver/lt5_syn_15 ),
    .o({\u1_Driver/lt5_syn_17 ,open_n175}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_16  (
    .a(\u1_Driver/vcnt [7]),
    .b(1'b0),
    .c(\u1_Driver/lt5_syn_17 ),
    .o({\u1_Driver/lt5_syn_19 ,open_n176}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_18  (
    .a(\u1_Driver/vcnt [8]),
    .b(1'b0),
    .c(\u1_Driver/lt5_syn_19 ),
    .o({\u1_Driver/lt5_syn_21 ,open_n177}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_2  (
    .a(\u1_Driver/vcnt [0]),
    .b(1'b1),
    .c(\u1_Driver/lt5_syn_3 ),
    .o({\u1_Driver/lt5_syn_5 ,open_n178}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_20  (
    .a(\u1_Driver/vcnt [9]),
    .b(1'b0),
    .c(\u1_Driver/lt5_syn_21 ),
    .o({\u1_Driver/lt5_syn_23 ,open_n179}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_22  (
    .a(\u1_Driver/vcnt [10]),
    .b(1'b1),
    .c(\u1_Driver/lt5_syn_23 ),
    .o({\u1_Driver/lt5_syn_25 ,open_n180}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_24  (
    .a(\u1_Driver/vcnt [11]),
    .b(1'b0),
    .c(\u1_Driver/lt5_syn_25 ),
    .o({\u1_Driver/lt5_syn_27 ,open_n181}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_26  (
    .a(1'b0),
    .b(1'b1),
    .c(\u1_Driver/lt5_syn_27 ),
    .o({open_n182,\u1_Driver/lcd_en_n6 }));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_4  (
    .a(\u1_Driver/vcnt [1]),
    .b(1'b0),
    .c(\u1_Driver/lt5_syn_5 ),
    .o({\u1_Driver/lt5_syn_7 ,open_n183}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_6  (
    .a(\u1_Driver/vcnt [2]),
    .b(1'b0),
    .c(\u1_Driver/lt5_syn_7 ),
    .o({\u1_Driver/lt5_syn_9 ,open_n184}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt5_syn_8  (
    .a(\u1_Driver/vcnt [3]),
    .b(1'b1),
    .c(\u1_Driver/lt5_syn_9 ),
    .o({\u1_Driver/lt5_syn_11 ,open_n185}));  // ../../source/rtl/Driver.v(88)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt6_syn_11  (
    .a(1'b0),
    .b(\u1_Driver/hcnt [4]),
    .c(\u1_Driver/lt6_syn_12 ),
    .o({\u1_Driver/lt6_syn_14 ,open_n186}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt6_syn_13  (
    .a(1'b1),
    .b(\u1_Driver/hcnt [5]),
    .c(\u1_Driver/lt6_syn_14 ),
    .o({\u1_Driver/lt6_syn_16 ,open_n187}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt6_syn_15  (
    .a(1'b1),
    .b(\u1_Driver/hcnt [6]),
    .c(\u1_Driver/lt6_syn_16 ),
    .o({\u1_Driver/lt6_syn_18 ,open_n188}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt6_syn_17  (
    .a(1'b0),
    .b(\u1_Driver/hcnt [7]),
    .c(\u1_Driver/lt6_syn_18 ),
    .o({\u1_Driver/lt6_syn_20 ,open_n189}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt6_syn_19  (
    .a(1'b1),
    .b(\u1_Driver/hcnt [8]),
    .c(\u1_Driver/lt6_syn_20 ),
    .o({\u1_Driver/lt6_syn_22 ,open_n190}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u1_Driver/lt6_syn_2  (
    .a(1'b1),
    .o({\u1_Driver/lt6_syn_4 ,open_n193}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt6_syn_21  (
    .a(1'b0),
    .b(\u1_Driver/hcnt [9]),
    .c(\u1_Driver/lt6_syn_22 ),
    .o({\u1_Driver/lt6_syn_24 ,open_n194}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt6_syn_23  (
    .a(1'b0),
    .b(\u1_Driver/hcnt [10]),
    .c(\u1_Driver/lt6_syn_24 ),
    .o({\u1_Driver/lt6_syn_26 ,open_n195}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt6_syn_25  (
    .a(1'b0),
    .b(1'b1),
    .c(\u1_Driver/lt6_syn_26 ),
    .o({open_n196,\u1_Driver/lcd_request_n2 }));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt6_syn_3  (
    .a(1'b1),
    .b(\u1_Driver/hcnt [0]),
    .c(\u1_Driver/lt6_syn_4 ),
    .o({\u1_Driver/lt6_syn_6 ,open_n197}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt6_syn_5  (
    .a(1'b1),
    .b(\u1_Driver/hcnt [1]),
    .c(\u1_Driver/lt6_syn_6 ),
    .o({\u1_Driver/lt6_syn_8 ,open_n198}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt6_syn_7  (
    .a(1'b1),
    .b(\u1_Driver/hcnt [2]),
    .c(\u1_Driver/lt6_syn_8 ),
    .o({\u1_Driver/lt6_syn_10 ,open_n199}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt6_syn_9  (
    .a(1'b0),
    .b(\u1_Driver/hcnt [3]),
    .c(\u1_Driver/lt6_syn_10 ),
    .o({\u1_Driver/lt6_syn_12 ,open_n200}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt7_syn_11  (
    .a(\u1_Driver/hcnt [4]),
    .b(1'b0),
    .c(\u1_Driver/lt7_syn_12 ),
    .o({\u1_Driver/lt7_syn_14 ,open_n201}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt7_syn_13  (
    .a(\u1_Driver/hcnt [5]),
    .b(1'b1),
    .c(\u1_Driver/lt7_syn_14 ),
    .o({\u1_Driver/lt7_syn_16 ,open_n202}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt7_syn_15  (
    .a(\u1_Driver/hcnt [6]),
    .b(1'b1),
    .c(\u1_Driver/lt7_syn_16 ),
    .o({\u1_Driver/lt7_syn_18 ,open_n203}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt7_syn_17  (
    .a(\u1_Driver/hcnt [7]),
    .b(1'b0),
    .c(\u1_Driver/lt7_syn_18 ),
    .o({\u1_Driver/lt7_syn_20 ,open_n204}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt7_syn_19  (
    .a(\u1_Driver/hcnt [8]),
    .b(1'b0),
    .c(\u1_Driver/lt7_syn_20 ),
    .o({\u1_Driver/lt7_syn_22 ,open_n205}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u1_Driver/lt7_syn_2  (
    .a(1'b0),
    .o({\u1_Driver/lt7_syn_4 ,open_n208}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt7_syn_21  (
    .a(\u1_Driver/hcnt [9]),
    .b(1'b1),
    .c(\u1_Driver/lt7_syn_22 ),
    .o({\u1_Driver/lt7_syn_24 ,open_n209}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt7_syn_23  (
    .a(\u1_Driver/hcnt [10]),
    .b(1'b1),
    .c(\u1_Driver/lt7_syn_24 ),
    .o({\u1_Driver/lt7_syn_26 ,open_n210}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt7_syn_25  (
    .a(1'b0),
    .b(1'b1),
    .c(\u1_Driver/lt7_syn_26 ),
    .o({open_n211,\u1_Driver/lcd_request_n3 }));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt7_syn_3  (
    .a(\u1_Driver/hcnt [0]),
    .b(1'b1),
    .c(\u1_Driver/lt7_syn_4 ),
    .o({\u1_Driver/lt7_syn_6 ,open_n212}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt7_syn_5  (
    .a(\u1_Driver/hcnt [1]),
    .b(1'b1),
    .c(\u1_Driver/lt7_syn_6 ),
    .o({\u1_Driver/lt7_syn_8 ,open_n213}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt7_syn_7  (
    .a(\u1_Driver/hcnt [2]),
    .b(1'b1),
    .c(\u1_Driver/lt7_syn_8 ),
    .o({\u1_Driver/lt7_syn_10 ,open_n214}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt7_syn_9  (
    .a(\u1_Driver/hcnt [3]),
    .b(1'b0),
    .c(\u1_Driver/lt7_syn_10 ),
    .o({\u1_Driver/lt7_syn_12 ,open_n215}));  // ../../source/rtl/Driver.v(94)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt8_syn_11  (
    .a(\u1_Driver/hcnt [4]),
    .b(1'b1),
    .c(\u1_Driver/lt8_syn_12 ),
    .o({\u1_Driver/lt8_syn_14 ,open_n216}));  // ../../source/rtl/Driver.v(58)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt8_syn_13  (
    .a(\u1_Driver/hcnt [5]),
    .b(1'b0),
    .c(\u1_Driver/lt8_syn_14 ),
    .o({\u1_Driver/lt8_syn_16 ,open_n217}));  // ../../source/rtl/Driver.v(58)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt8_syn_15  (
    .a(\u1_Driver/hcnt [6]),
    .b(1'b0),
    .c(\u1_Driver/lt8_syn_16 ),
    .o({\u1_Driver/lt8_syn_18 ,open_n218}));  // ../../source/rtl/Driver.v(58)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt8_syn_17  (
    .a(\u1_Driver/hcnt [7]),
    .b(1'b1),
    .c(\u1_Driver/lt8_syn_18 ),
    .o({\u1_Driver/lt8_syn_20 ,open_n219}));  // ../../source/rtl/Driver.v(58)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt8_syn_19  (
    .a(\u1_Driver/hcnt [8]),
    .b(1'b0),
    .c(\u1_Driver/lt8_syn_20 ),
    .o({\u1_Driver/lt8_syn_22 ,open_n220}));  // ../../source/rtl/Driver.v(58)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u1_Driver/lt8_syn_2  (
    .a(1'b0),
    .o({\u1_Driver/lt8_syn_4 ,open_n223}));  // ../../source/rtl/Driver.v(58)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt8_syn_21  (
    .a(\u1_Driver/hcnt [9]),
    .b(1'b1),
    .c(\u1_Driver/lt8_syn_22 ),
    .o({\u1_Driver/lt8_syn_24 ,open_n224}));  // ../../source/rtl/Driver.v(58)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt8_syn_23  (
    .a(\u1_Driver/hcnt [10]),
    .b(1'b1),
    .c(\u1_Driver/lt8_syn_24 ),
    .o({\u1_Driver/lt8_syn_26 ,open_n225}));  // ../../source/rtl/Driver.v(58)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt8_syn_25  (
    .a(1'b0),
    .b(1'b1),
    .c(\u1_Driver/lt8_syn_26 ),
    .o({open_n226,\u1_Driver/hcnt_b_n }));  // ../../source/rtl/Driver.v(58)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt8_syn_3  (
    .a(\u1_Driver/hcnt [0]),
    .b(1'b1),
    .c(\u1_Driver/lt8_syn_4 ),
    .o({\u1_Driver/lt8_syn_6 ,open_n227}));  // ../../source/rtl/Driver.v(58)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt8_syn_5  (
    .a(\u1_Driver/hcnt [1]),
    .b(1'b1),
    .c(\u1_Driver/lt8_syn_6 ),
    .o({\u1_Driver/lt8_syn_8 ,open_n228}));  // ../../source/rtl/Driver.v(58)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt8_syn_7  (
    .a(\u1_Driver/hcnt [2]),
    .b(1'b1),
    .c(\u1_Driver/lt8_syn_8 ),
    .o({\u1_Driver/lt8_syn_10 ,open_n229}));  // ../../source/rtl/Driver.v(58)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u1_Driver/lt8_syn_9  (
    .a(\u1_Driver/hcnt [3]),
    .b(1'b0),
    .c(\u1_Driver/lt8_syn_10 ),
    .o({\u1_Driver/lt8_syn_12 ,open_n230}));  // ../../source/rtl/Driver.v(58)
  AL_DFF_X \u1_Driver/reg0_syn_10  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [8]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/hcnt [8]));  // ../../source/rtl/Driver.v(54)
  AL_DFF_X \u1_Driver/reg0_syn_11  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [9]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/hcnt [9]));  // ../../source/rtl/Driver.v(54)
  AL_DFF_X \u1_Driver/reg0_syn_12  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [10]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/hcnt [10]));  // ../../source/rtl/Driver.v(54)
  AL_DFF_X \u1_Driver/reg0_syn_2  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/hcnt [0]));  // ../../source/rtl/Driver.v(54)
  AL_DFF_X \u1_Driver/reg0_syn_3  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/hcnt [1]));  // ../../source/rtl/Driver.v(54)
  AL_DFF_X \u1_Driver/reg0_syn_4  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/hcnt [2]));  // ../../source/rtl/Driver.v(54)
  AL_DFF_X \u1_Driver/reg0_syn_5  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/hcnt [3]));  // ../../source/rtl/Driver.v(54)
  AL_DFF_X \u1_Driver/reg0_syn_6  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/hcnt [4]));  // ../../source/rtl/Driver.v(54)
  AL_DFF_X \u1_Driver/reg0_syn_7  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/hcnt [5]));  // ../../source/rtl/Driver.v(54)
  AL_DFF_X \u1_Driver/reg0_syn_8  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [6]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/hcnt [6]));  // ../../source/rtl/Driver.v(54)
  AL_DFF_X \u1_Driver/reg0_syn_9  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [7]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/hcnt [7]));  // ../../source/rtl/Driver.v(54)
  AL_DFF_X \u1_Driver/reg1_syn_10  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [8]),
    .en(\u1_Driver/vcnt_b_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/vcnt [8]));  // ../../source/rtl/Driver.v(70)
  AL_DFF_X \u1_Driver/reg1_syn_11  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [9]),
    .en(\u1_Driver/vcnt_b_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/vcnt [9]));  // ../../source/rtl/Driver.v(70)
  AL_DFF_X \u1_Driver/reg1_syn_12  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b1 [10]),
    .en(\u1_Driver/vcnt_b_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/vcnt [10]));  // ../../source/rtl/Driver.v(70)
  AL_DFF_X \u1_Driver/reg1_syn_13  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [11]),
    .en(\u1_Driver/vcnt_b_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/vcnt [11]));  // ../../source/rtl/Driver.v(70)
  AL_DFF_X \u1_Driver/reg1_syn_2  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b1 [0]),
    .en(\u1_Driver/vcnt_b_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/vcnt [0]));  // ../../source/rtl/Driver.v(70)
  AL_DFF_X \u1_Driver/reg1_syn_3  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b1 [1]),
    .en(\u1_Driver/vcnt_b_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/vcnt [1]));  // ../../source/rtl/Driver.v(70)
  AL_DFF_X \u1_Driver/reg1_syn_4  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [2]),
    .en(\u1_Driver/vcnt_b_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/vcnt [2]));  // ../../source/rtl/Driver.v(70)
  AL_DFF_X \u1_Driver/reg1_syn_5  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b1 [3]),
    .en(\u1_Driver/vcnt_b_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/vcnt [3]));  // ../../source/rtl/Driver.v(70)
  AL_DFF_X \u1_Driver/reg1_syn_6  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [4]),
    .en(\u1_Driver/vcnt_b_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/vcnt [4]));  // ../../source/rtl/Driver.v(70)
  AL_DFF_X \u1_Driver/reg1_syn_7  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b1 [5]),
    .en(\u1_Driver/vcnt_b_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/vcnt [5]));  // ../../source/rtl/Driver.v(70)
  AL_DFF_X \u1_Driver/reg1_syn_8  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [6]),
    .en(\u1_Driver/vcnt_b_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/vcnt [6]));  // ../../source/rtl/Driver.v(70)
  AL_DFF_X \u1_Driver/reg1_syn_9  (
    .ar(~rst_n_dup_1),
    .as(1'b0),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [7]),
    .en(\u1_Driver/vcnt_b_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_Driver/vcnt [7]));  // ../../source/rtl/Driver.v(70)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    \u1_Driver/sub0_syn_12  (
    .a(1'b0),
    .o({\u1_Driver/sub0_syn_58 ,open_n233}));  // ../../source/rtl/Driver.v(98)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub0_syn_13  (
    .a(\u1_Driver/hcnt [0]),
    .b(1'b1),
    .c(\u1_Driver/sub0_syn_58 ),
    .o({\u1_Driver/sub0_syn_59 ,\u1_Driver/lcd_xpos_b [0]}));  // ../../source/rtl/Driver.v(98)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub0_syn_14  (
    .a(\u1_Driver/hcnt [1]),
    .b(1'b1),
    .c(\u1_Driver/sub0_syn_59 ),
    .o({\u1_Driver/sub0_syn_60 ,open_n234}));  // ../../source/rtl/Driver.v(98)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub0_syn_15  (
    .a(\u1_Driver/hcnt [2]),
    .b(1'b1),
    .c(\u1_Driver/sub0_syn_60 ),
    .o({\u1_Driver/sub0_syn_61 ,open_n235}));  // ../../source/rtl/Driver.v(98)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub0_syn_16  (
    .a(\u1_Driver/hcnt [3]),
    .b(1'b0),
    .c(\u1_Driver/sub0_syn_61 ),
    .o({\u1_Driver/sub0_syn_62 ,\u1_Driver/lcd_xpos_b [3]}));  // ../../source/rtl/Driver.v(98)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub0_syn_17  (
    .a(\u1_Driver/hcnt [4]),
    .b(1'b0),
    .c(\u1_Driver/sub0_syn_62 ),
    .o({\u1_Driver/sub0_syn_63 ,\u1_Driver/lcd_xpos_b [4]}));  // ../../source/rtl/Driver.v(98)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub0_syn_18  (
    .a(\u1_Driver/hcnt [5]),
    .b(1'b1),
    .c(\u1_Driver/sub0_syn_63 ),
    .o({\u1_Driver/sub0_syn_64 ,\u1_Driver/lcd_xpos_b [5]}));  // ../../source/rtl/Driver.v(98)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub0_syn_19  (
    .a(\u1_Driver/hcnt [6]),
    .b(1'b1),
    .c(\u1_Driver/sub0_syn_64 ),
    .o({\u1_Driver/sub0_syn_65 ,\u1_Driver/lcd_xpos_b [6]}));  // ../../source/rtl/Driver.v(98)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub0_syn_20  (
    .a(\u1_Driver/hcnt [7]),
    .b(1'b0),
    .c(\u1_Driver/sub0_syn_65 ),
    .o({\u1_Driver/sub0_syn_66 ,\u1_Driver/lcd_xpos_b [7]}));  // ../../source/rtl/Driver.v(98)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub0_syn_21  (
    .a(\u1_Driver/hcnt [8]),
    .b(1'b1),
    .c(\u1_Driver/sub0_syn_66 ),
    .o({\u1_Driver/sub0_syn_67 ,\u1_Driver/lcd_xpos_b [8]}));  // ../../source/rtl/Driver.v(98)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub0_syn_22  (
    .a(\u1_Driver/hcnt [9]),
    .b(1'b0),
    .c(\u1_Driver/sub0_syn_67 ),
    .o({\u1_Driver/sub0_syn_68 ,\u1_Driver/lcd_xpos_b [9]}));  // ../../source/rtl/Driver.v(98)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub0_syn_23  (
    .a(\u1_Driver/hcnt [10]),
    .b(1'b0),
    .c(\u1_Driver/sub0_syn_68 ),
    .o({open_n236,\u1_Driver/lcd_xpos_b [10]}));  // ../../source/rtl/Driver.v(98)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    \u1_Driver/sub1_syn_11  (
    .a(1'b0),
    .o({\u1_Driver/sub1_syn_53 ,open_n239}));  // ../../source/rtl/Driver.v(99)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub1_syn_12  (
    .a(\u1_Driver/vcnt [0]),
    .b(1'b1),
    .c(\u1_Driver/sub1_syn_53 ),
    .o({\u1_Driver/sub1_syn_54 ,\u1_Driver/lcd_ypos_b [0]}));  // ../../source/rtl/Driver.v(99)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub1_syn_13  (
    .a(\u1_Driver/vcnt [1]),
    .b(1'b0),
    .c(\u1_Driver/sub1_syn_54 ),
    .o({\u1_Driver/sub1_syn_55 ,\u1_Driver/lcd_ypos_b [1]}));  // ../../source/rtl/Driver.v(99)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub1_syn_14  (
    .a(\u1_Driver/vcnt [2]),
    .b(1'b0),
    .c(\u1_Driver/sub1_syn_55 ),
    .o({\u1_Driver/sub1_syn_56 ,\u1_Driver/lcd_ypos_b [2]}));  // ../../source/rtl/Driver.v(99)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub1_syn_15  (
    .a(\u1_Driver/vcnt [3]),
    .b(1'b1),
    .c(\u1_Driver/sub1_syn_56 ),
    .o({\u1_Driver/sub1_syn_57 ,\u1_Driver/lcd_ypos_b [3]}));  // ../../source/rtl/Driver.v(99)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub1_syn_16  (
    .a(\u1_Driver/vcnt [4]),
    .b(1'b0),
    .c(\u1_Driver/sub1_syn_57 ),
    .o({\u1_Driver/sub1_syn_58 ,\u1_Driver/lcd_ypos_b [4]}));  // ../../source/rtl/Driver.v(99)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub1_syn_17  (
    .a(\u1_Driver/vcnt [5]),
    .b(1'b1),
    .c(\u1_Driver/sub1_syn_58 ),
    .o({\u1_Driver/sub1_syn_59 ,\u1_Driver/lcd_ypos_b [5]}));  // ../../source/rtl/Driver.v(99)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub1_syn_18  (
    .a(\u1_Driver/vcnt [6]),
    .b(1'b0),
    .c(\u1_Driver/sub1_syn_59 ),
    .o({\u1_Driver/sub1_syn_60 ,\u1_Driver/lcd_ypos_b [6]}));  // ../../source/rtl/Driver.v(99)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub1_syn_19  (
    .a(\u1_Driver/vcnt [7]),
    .b(1'b0),
    .c(\u1_Driver/sub1_syn_60 ),
    .o({\u1_Driver/sub1_syn_61 ,\u1_Driver/lcd_ypos_b [7]}));  // ../../source/rtl/Driver.v(99)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub1_syn_20  (
    .a(\u1_Driver/vcnt [8]),
    .b(1'b0),
    .c(\u1_Driver/sub1_syn_61 ),
    .o({\u1_Driver/sub1_syn_62 ,\u1_Driver/lcd_ypos_b [8]}));  // ../../source/rtl/Driver.v(99)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    \u1_Driver/sub1_syn_21  (
    .a(\u1_Driver/vcnt [9]),
    .b(1'b0),
    .c(\u1_Driver/sub1_syn_62 ),
    .o({open_n240,\u1_Driver/lcd_ypos_b [9]}));  // ../../source/rtl/Driver.v(99)
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \u1_Driver/vcnt_b1[0]_syn_1  (
    .a(\u1_Driver/vcnt_b1_n ),
    .b(\u1_Driver/vcnt_b2 [0]),
    .o(\u1_Driver/vcnt_b1 [0]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \u1_Driver/vcnt_b1[10]_syn_1  (
    .a(\u1_Driver/vcnt_b1_n ),
    .b(\u1_Driver/vcnt_b2 [10]),
    .o(\u1_Driver/vcnt_b1 [10]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \u1_Driver/vcnt_b1[1]_syn_1  (
    .a(\u1_Driver/vcnt_b1_n ),
    .b(\u1_Driver/vcnt_b2 [1]),
    .o(\u1_Driver/vcnt_b1 [1]));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    \u1_Driver/vcnt_b1[3]_syn_1  (
    .a(\u1_Driver/vcnt [0]),
    .b(\u1_Driver/vcnt [1]),
    .c(\u1_Driver/vcnt [2]),
    .d(\u1_Driver/vcnt [3]),
    .o(\u1_Driver/vcnt_b1[3]_syn_2 ));
  AL_MAP_LUT5 #(
    .EQN("(~E*~D*C*~B*A)"),
    .INIT(32'h00000020))
    \u1_Driver/vcnt_b1[3]_syn_3  (
    .a(\u1_Driver/vcnt_b1[3]_syn_2 ),
    .b(\u1_Driver/vcnt [4]),
    .c(\u1_Driver/vcnt [5]),
    .d(\u1_Driver/vcnt [6]),
    .e(\u1_Driver/vcnt [7]),
    .o(\u1_Driver/vcnt_b1[3]_syn_4 ));
  AL_MAP_LUT5 #(
    .EQN("(~E*D*~C*~B*A)"),
    .INIT(32'h00000200))
    \u1_Driver/vcnt_b1[3]_syn_5  (
    .a(\u1_Driver/vcnt_b1[3]_syn_4 ),
    .b(\u1_Driver/vcnt [8]),
    .c(\u1_Driver/vcnt [9]),
    .d(\u1_Driver/vcnt [10]),
    .e(\u1_Driver/vcnt [11]),
    .o(\u1_Driver/vcnt_b1_n ));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \u1_Driver/vcnt_b1[3]_syn_6  (
    .a(\u1_Driver/vcnt_b1_n ),
    .b(\u1_Driver/vcnt_b2 [3]),
    .o(\u1_Driver/vcnt_b1 [3]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \u1_Driver/vcnt_b1[5]_syn_1  (
    .a(\u1_Driver/vcnt_b1_n ),
    .b(\u1_Driver/vcnt_b2 [5]),
    .o(\u1_Driver/vcnt_b1 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    \u1_Driver/vcnt_b_n_syn_1  (
    .a(\u1_Driver/hcnt [0]),
    .b(\u1_Driver/hcnt [1]),
    .c(\u1_Driver/hcnt [2]),
    .d(\u1_Driver/hcnt [3]),
    .o(\u1_Driver/vcnt_b_n_syn_2 ));
  AL_MAP_LUT5 #(
    .EQN("(E*~D*~C*B*A)"),
    .INIT(32'h00080000))
    \u1_Driver/vcnt_b_n_syn_3  (
    .a(\u1_Driver/vcnt_b_n_syn_2 ),
    .b(\u1_Driver/hcnt [4]),
    .c(\u1_Driver/hcnt [5]),
    .d(\u1_Driver/hcnt [6]),
    .e(\u1_Driver/hcnt [7]),
    .o(\u1_Driver/vcnt_b_n_syn_4 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    \u1_Driver/vcnt_b_n_syn_5  (
    .a(\u1_Driver/vcnt_b_n_syn_4 ),
    .b(\u1_Driver/hcnt [8]),
    .c(\u1_Driver/hcnt [9]),
    .d(\u1_Driver/hcnt [10]),
    .o(\u1_Driver/vcnt_b_n ));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_xpos[0]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_xpos_b [0]),
    .o(\u2_Display/lcd_xpos [0]));  // ../../source/rtl/Display.v(27)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_xpos[10]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_xpos_b [10]),
    .o(\u2_Display/lcd_xpos [10]));  // ../../source/rtl/Display.v(27)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_xpos[1]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/hcnt_b1 [1]),
    .o(\u2_Display/lcd_xpos [1]));  // ../../source/rtl/Display.v(27)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_xpos[2]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/hcnt_b1 [2]),
    .o(\u2_Display/lcd_xpos [2]));  // ../../source/rtl/Display.v(27)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_xpos[3]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_xpos_b [3]),
    .o(\u2_Display/lcd_xpos [3]));  // ../../source/rtl/Display.v(27)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_xpos[4]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_xpos_b [4]),
    .o(\u2_Display/lcd_xpos [4]));  // ../../source/rtl/Display.v(27)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_xpos[5]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_xpos_b [5]),
    .o(\u2_Display/lcd_xpos [5]));  // ../../source/rtl/Display.v(27)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_xpos[6]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_xpos_b [6]),
    .o(\u2_Display/lcd_xpos [6]));  // ../../source/rtl/Display.v(27)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_xpos[7]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_xpos_b [7]),
    .o(\u2_Display/lcd_xpos [7]));  // ../../source/rtl/Display.v(27)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_xpos[8]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_xpos_b [8]),
    .o(\u2_Display/lcd_xpos [8]));  // ../../source/rtl/Display.v(27)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_xpos[9]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_xpos_b [9]),
    .o(\u2_Display/lcd_xpos [9]));  // ../../source/rtl/Display.v(27)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_ypos[0]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_ypos_b [0]),
    .o(\u2_Display/lcd_ypos [0]));  // ../../source/rtl/Display.v(28)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_ypos[1]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_ypos_b [1]),
    .o(\u2_Display/lcd_ypos [1]));  // ../../source/rtl/Display.v(28)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_ypos[2]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_ypos_b [2]),
    .o(\u2_Display/lcd_ypos [2]));  // ../../source/rtl/Display.v(28)
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    \u2_Display/lcd_ypos[3]_syn_1  (
    .a(\u1_Driver/lcd_en_n5 ),
    .b(\u1_Driver/lcd_en_n6 ),
    .c(\u1_Driver/lcd_request_n2 ),
    .d(\u1_Driver/lcd_request_n3 ),
    .o(\u1_Driver/lcd_request_n ));  // ../../source/rtl/Display.v(28)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_ypos[3]_syn_2  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_ypos_b [3]),
    .o(\u2_Display/lcd_ypos [3]));  // ../../source/rtl/Display.v(28)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_ypos[4]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_ypos_b [4]),
    .o(\u2_Display/lcd_ypos [4]));  // ../../source/rtl/Display.v(28)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_ypos[5]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_ypos_b [5]),
    .o(\u2_Display/lcd_ypos [5]));  // ../../source/rtl/Display.v(28)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_ypos[6]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_ypos_b [6]),
    .o(\u2_Display/lcd_ypos [6]));  // ../../source/rtl/Display.v(28)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_ypos[7]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_ypos_b [7]),
    .o(\u2_Display/lcd_ypos [7]));  // ../../source/rtl/Display.v(28)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_ypos[8]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_ypos_b [8]),
    .o(\u2_Display/lcd_ypos [8]));  // ../../source/rtl/Display.v(28)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_Display/lcd_ypos[9]_syn_1  (
    .a(\u1_Driver/lcd_request_n ),
    .b(\u1_Driver/lcd_ypos_b [9]),
    .o(\u2_Display/lcd_ypos [9]));  // ../../source/rtl/Display.v(28)
  EG_PHY_MULT18 #(
    .CEPDMUX("1"),
    .CLKMUX("SIG"),
    .INPUTREGA("DISABLE"),
    .INPUTREGB("DISABLE"),
    .MODE("MULT18X18C"),
    .OUTPUTREG("ENABLE"),
    .RSTPDNMUX("SIG"),
    .SIGNEDAMUX("0"),
    .SIGNEDBMUX("0"),
    .SRMODE("ASYNC"))
    \u2_Display/mult0_syn_3  (
    .a({7'b0000000,\u2_Display/lcd_xpos [10:0]}),
    .b({8'b00000000,\u2_Display/lcd_ypos [9:0]}),
    .clk(\u1_Driver/clk ),
    .rstpdn(rst_n_dup_1),
    .p({open_n322,open_n323,open_n324,open_n325,open_n326,open_n327,open_n328,open_n329,open_n330,open_n331,open_n332,open_n333,open_n334,open_n335,open_n336,\u1_Driver/lcd_data [20:0]}));  // ../../source/rtl/Display.v(93)
  EG_PHY_PAD #(
    //.LOCATION("G1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[0]_syn_2  (
    .do({open_n338,open_n339,open_n340,\vga_b[0]_dup_1 }),
    .opad(vga_b[0]));  // ../../source/rtl/VGA_Demo.v(16)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_b[0]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [0]),
    .o(\vga_b[0]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("F1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[1]_syn_2  (
    .do({open_n355,open_n356,open_n357,\vga_b[1]_dup_1 }),
    .opad(vga_b[1]));  // ../../source/rtl/VGA_Demo.v(16)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_b[1]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [1]),
    .o(\vga_b[1]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("F2"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[2]_syn_2  (
    .do({open_n372,open_n373,open_n374,\vga_b[2]_dup_1 }),
    .opad(vga_b[2]));  // ../../source/rtl/VGA_Demo.v(16)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_b[2]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [2]),
    .o(\vga_b[2]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("E1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[3]_syn_2  (
    .do({open_n389,open_n390,open_n391,\vga_b[3]_dup_1 }),
    .opad(vga_b[3]));  // ../../source/rtl/VGA_Demo.v(16)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_b[3]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [3]),
    .o(\vga_b[3]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("G3"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[4]_syn_2  (
    .do({open_n406,open_n407,open_n408,\vga_b[4]_dup_1 }),
    .opad(vga_b[4]));  // ../../source/rtl/VGA_Demo.v(16)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_b[4]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [4]),
    .o(\vga_b[4]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("E2"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[5]_syn_2  (
    .do({open_n423,open_n424,open_n425,\vga_b[5]_dup_1 }),
    .opad(vga_b[5]));  // ../../source/rtl/VGA_Demo.v(16)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_b[5]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [5]),
    .o(\vga_b[5]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("D1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[6]_syn_2  (
    .do({open_n440,open_n441,open_n442,\vga_b[6]_dup_1 }),
    .opad(vga_b[6]));  // ../../source/rtl/VGA_Demo.v(16)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_b[6]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [6]),
    .o(\vga_b[6]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("C1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[7]_syn_2  (
    .do({open_n457,open_n458,open_n459,\vga_b[7]_dup_1 }),
    .opad(vga_b[7]));  // ../../source/rtl/VGA_Demo.v(16)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_b[7]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [7]),
    .o(\vga_b[7]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("H2"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    vga_clk_syn_2 (
    .do({open_n474,open_n475,open_n476,vga_clk_dup_1}),
    .opad(vga_clk));  // ../../source/rtl/VGA_Demo.v(8)
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    vga_clk_syn_3 (
    .a(\u1_Driver/clk ),
    .o(vga_clk_dup_1));  // ../../source/rtl/VGA_Demo.v(8)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    vga_de_syn_1 (
    .do({open_n491,open_n492,open_n493,\u1_Driver/lcd_en_n }),
    .opad(vga_de));  // ../../source/rtl/VGA_Demo.v(12)
  EG_PHY_PAD #(
    //.LOCATION("L1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[0]_syn_2  (
    .do({open_n508,open_n509,open_n510,\vga_g[0]_dup_1 }),
    .opad(vga_g[0]));  // ../../source/rtl/VGA_Demo.v(15)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_g[0]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [8]),
    .o(\vga_g[0]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("K2"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[1]_syn_2  (
    .do({open_n525,open_n526,open_n527,\vga_g[1]_dup_1 }),
    .opad(vga_g[1]));  // ../../source/rtl/VGA_Demo.v(15)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_g[1]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [9]),
    .o(\vga_g[1]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("K1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[2]_syn_2  (
    .do({open_n542,open_n543,open_n544,\vga_g[2]_dup_1 }),
    .opad(vga_g[2]));  // ../../source/rtl/VGA_Demo.v(15)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_g[2]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [10]),
    .o(\vga_g[2]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("J1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[3]_syn_2  (
    .do({open_n559,open_n560,open_n561,\vga_g[3]_dup_1 }),
    .opad(vga_g[3]));  // ../../source/rtl/VGA_Demo.v(15)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_g[3]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [11]),
    .o(\vga_g[3]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("H3"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[4]_syn_2  (
    .do({open_n576,open_n577,open_n578,\vga_g[4]_dup_1 }),
    .opad(vga_g[4]));  // ../../source/rtl/VGA_Demo.v(15)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_g[4]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [12]),
    .o(\vga_g[4]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("J6"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[5]_syn_2  (
    .do({open_n593,open_n594,open_n595,\vga_g[5]_dup_1 }),
    .opad(vga_g[5]));  // ../../source/rtl/VGA_Demo.v(15)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_g[5]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [13]),
    .o(\vga_g[5]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("H1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[6]_syn_2  (
    .do({open_n610,open_n611,open_n612,\vga_g[6]_dup_1 }),
    .opad(vga_g[6]));  // ../../source/rtl/VGA_Demo.v(15)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_g[6]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [14]),
    .o(\vga_g[6]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("H5"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[7]_syn_2  (
    .do({open_n627,open_n628,open_n629,\vga_g[7]_dup_1 }),
    .opad(vga_g[7]));  // ../../source/rtl/VGA_Demo.v(15)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_g[7]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [15]),
    .o(\vga_g[7]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("J3"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    vga_hs_syn_2 (
    .do({open_n644,open_n645,open_n646,vga_hs_dup_1}),
    .opad(vga_hs));  // ../../source/rtl/VGA_Demo.v(9)
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    vga_hs_syn_3 (
    .a(\u1_Driver/lcd_hs_n ),
    .o(vga_hs_dup_1));  // ../../source/rtl/VGA_Demo.v(9)
  EG_PHY_PAD #(
    //.LOCATION("L5"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[0]_syn_2  (
    .do({open_n661,open_n662,open_n663,\vga_r[0]_dup_1 }),
    .opad(vga_r[0]));  // ../../source/rtl/VGA_Demo.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_r[0]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [16]),
    .o(\vga_r[0]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("L3"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[1]_syn_2  (
    .do({open_n678,open_n679,open_n680,\vga_r[1]_dup_1 }),
    .opad(vga_r[1]));  // ../../source/rtl/VGA_Demo.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_r[1]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [17]),
    .o(\vga_r[1]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("M2"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[2]_syn_2  (
    .do({open_n695,open_n696,open_n697,\vga_r[2]_dup_1 }),
    .opad(vga_r[2]));  // ../../source/rtl/VGA_Demo.v(14)
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    \vga_r[2]_syn_3  (
    .a(\u1_Driver/lcd_en_n2 ),
    .b(\u1_Driver/lcd_en_n3 ),
    .c(\u1_Driver/lcd_en_n5 ),
    .d(\u1_Driver/lcd_en_n6 ),
    .o(\u1_Driver/lcd_en_n ));  // ../../source/rtl/VGA_Demo.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_r[2]_syn_4  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [18]),
    .o(\vga_r[2]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("M1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[3]_syn_2  (
    .do({open_n712,open_n713,open_n714,\vga_r[3]_dup_1 }),
    .opad(vga_r[3]));  // ../../source/rtl/VGA_Demo.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_r[3]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [19]),
    .o(\vga_r[3]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("L4"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[4]_syn_2  (
    .do({open_n729,open_n730,open_n731,\vga_r[4]_dup_1 }),
    .opad(vga_r[4]));  // ../../source/rtl/VGA_Demo.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \vga_r[4]_syn_3  (
    .a(\u1_Driver/lcd_en_n ),
    .b(\u1_Driver/lcd_data [20]),
    .o(\vga_r[4]_dup_1 ));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("K5"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[5]_syn_1  (
    .do({open_n746,open_n747,open_n748,1'b0}),
    .opad(vga_r[5]));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("K3"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[6]_syn_1  (
    .do({open_n763,open_n764,open_n765,1'b0}),
    .opad(vga_r[6]));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("K6"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[7]_syn_1  (
    .do({open_n780,open_n781,open_n782,1'b0}),
    .opad(vga_r[7]));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("J4"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    vga_vs_syn_2 (
    .do({open_n797,open_n798,open_n799,vga_vs_dup_1}),
    .opad(vga_vs));  // ../../source/rtl/VGA_Demo.v(10)
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    vga_vs_syn_3 (
    .a(\u1_Driver/lcd_vs_n ),
    .o(vga_vs_dup_1));  // ../../source/rtl/VGA_Demo.v(10)

endmodule 

