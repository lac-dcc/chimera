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
  wire \u1_Driver/add0_syn_64 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_68 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add0_syn_72 ;  // ../../source/rtl/Driver.v(77)
  wire \u1_Driver/add1_syn_60 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/add1_syn_64 ;  // ../../source/rtl/Driver.v(59)
  wire \u1_Driver/lt0_syn_8 ;  // ../../source/rtl/Driver.v(65)
  wire \u1_Driver/lt0_syn_12 ;  // ../../source/rtl/Driver.v(65)
  wire \u1_Driver/lt0_syn_16 ;  // ../../source/rtl/Driver.v(65)
  wire \u1_Driver/lt0_syn_20 ;  // ../../source/rtl/Driver.v(65)
  wire \u1_Driver/lt1_syn_5 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_9 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_13 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_17 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_21 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt1_syn_25 ;  // ../../source/rtl/Driver.v(81)
  wire \u1_Driver/lt2_syn_8 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt2_syn_12 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt2_syn_16 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt2_syn_20 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_8 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_12 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_16 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt3_syn_20 ;  // ../../source/rtl/Driver.v(87)
  wire \u1_Driver/lt4_syn_5 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_9 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_13 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_17 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_21 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt4_syn_25 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_5 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_9 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_13 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_17 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_21 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt5_syn_25 ;  // ../../source/rtl/Driver.v(88)
  wire \u1_Driver/lt6_syn_6 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_10 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_14 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_18 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_22 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt6_syn_26 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_6 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_10 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_14 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_18 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_22 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt7_syn_26 ;  // ../../source/rtl/Driver.v(94)
  wire \u1_Driver/lt8_syn_6 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_10 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_14 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_18 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_22 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/lt8_syn_26 ;  // ../../source/rtl/Driver.v(58)
  wire \u1_Driver/sub0_syn_61 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub0_syn_65 ;  // ../../source/rtl/Driver.v(98)
  wire \u1_Driver/sub1_syn_56 ;  // ../../source/rtl/Driver.v(99)
  wire \u1_Driver/sub1_syn_60 ;  // ../../source/rtl/Driver.v(99)
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
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add0_syn_74"),
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
    \u1_Driver/add0_syn_74  (
    .a({\u1_Driver/vcnt [1],1'b0}),
    .b({\u1_Driver/vcnt [2],\u1_Driver/vcnt [0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({\u1_Driver/vcnt_b2 [1],open_n112}),
    .fco(\u1_Driver/add0_syn_64 ),
    .fx({\u1_Driver/vcnt_b2 [2],\u1_Driver/vcnt_b2 [0]}));  // ../../source/rtl/Driver.v(77)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add0_syn_74"),
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
    \u1_Driver/add0_syn_75  (
    .a({\u1_Driver/vcnt [5],\u1_Driver/vcnt [3]}),
    .b({\u1_Driver/vcnt [6],\u1_Driver/vcnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u1_Driver/add0_syn_64 ),
    .f({\u1_Driver/vcnt_b2 [5],\u1_Driver/vcnt_b2 [3]}),
    .fco(\u1_Driver/add0_syn_68 ),
    .fx({\u1_Driver/vcnt_b2 [6],\u1_Driver/vcnt_b2 [4]}));  // ../../source/rtl/Driver.v(77)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add0_syn_74"),
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
    \u1_Driver/add0_syn_76  (
    .a({\u1_Driver/vcnt [9],\u1_Driver/vcnt [7]}),
    .b({\u1_Driver/vcnt [10],\u1_Driver/vcnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u1_Driver/add0_syn_68 ),
    .f({\u1_Driver/vcnt_b2 [9],\u1_Driver/vcnt_b2 [7]}),
    .fco(\u1_Driver/add0_syn_72 ),
    .fx({\u1_Driver/vcnt_b2 [10],\u1_Driver/vcnt_b2 [8]}));  // ../../source/rtl/Driver.v(77)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add0_syn_74"),
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
    \u1_Driver/add0_syn_77  (
    .a({open_n151,\u1_Driver/vcnt [11]}),
    .c(2'b00),
    .d({open_n156,1'b0}),
    .fci(\u1_Driver/add0_syn_72 ),
    .f({open_n173,\u1_Driver/vcnt_b2 [11]}));  // ../../source/rtl/Driver.v(77)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add1_syn_69"),
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
    \u1_Driver/add1_syn_69  (
    .a({\u1_Driver/hcnt [1],1'b0}),
    .b({\u1_Driver/hcnt [2],\u1_Driver/hcnt [0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({\u1_Driver/hcnt_b1 [1],open_n196}),
    .fco(\u1_Driver/add1_syn_60 ),
    .fx({\u1_Driver/hcnt_b1 [2],\u1_Driver/hcnt_b1 [0]}));  // ../../source/rtl/Driver.v(59)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add1_syn_69"),
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
    \u1_Driver/add1_syn_70  (
    .a({\u1_Driver/hcnt [5],\u1_Driver/hcnt [3]}),
    .b({\u1_Driver/hcnt [6],\u1_Driver/hcnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u1_Driver/add1_syn_60 ),
    .f({\u1_Driver/hcnt_b1 [5],\u1_Driver/hcnt_b1 [3]}),
    .fco(\u1_Driver/add1_syn_64 ),
    .fx({\u1_Driver/hcnt_b1 [6],\u1_Driver/hcnt_b1 [4]}));  // ../../source/rtl/Driver.v(59)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add1_syn_69"),
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
    \u1_Driver/add1_syn_71  (
    .a({\u1_Driver/hcnt [9],\u1_Driver/hcnt [7]}),
    .b({\u1_Driver/hcnt [10],\u1_Driver/hcnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u1_Driver/add1_syn_64 ),
    .f({\u1_Driver/hcnt_b1 [9],\u1_Driver/hcnt_b1 [7]}),
    .fx({\u1_Driver/hcnt_b1 [10],\u1_Driver/hcnt_b1 [8]}));  // ../../source/rtl/Driver.v(59)
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
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_syn_41"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_syn_41  (
    .a({\u1_Driver/hcnt [4],1'b1}),
    .b({1'b0,open_n236}),
    .fco(\u1_Driver/lt0_syn_8 ));  // ../../source/rtl/Driver.v(65)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_syn_41"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_syn_44  (
    .a(\u1_Driver/hcnt [6:5]),
    .b(2'b11),
    .fci(\u1_Driver/lt0_syn_8 ),
    .fco(\u1_Driver/lt0_syn_12 ));  // ../../source/rtl/Driver.v(65)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_syn_41"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_syn_47  (
    .a(\u1_Driver/hcnt [8:7]),
    .b(2'b00),
    .fci(\u1_Driver/lt0_syn_12 ),
    .fco(\u1_Driver/lt0_syn_16 ));  // ../../source/rtl/Driver.v(65)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_syn_41"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_syn_50  (
    .a(\u1_Driver/hcnt [10:9]),
    .b(2'b00),
    .fci(\u1_Driver/lt0_syn_16 ),
    .fco(\u1_Driver/lt0_syn_20 ));  // ../../source/rtl/Driver.v(65)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_syn_41"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_syn_52  (
    .a({open_n334,1'b0}),
    .b({open_n335,1'b1}),
    .fci(\u1_Driver/lt0_syn_20 ),
    .f({open_n354,\u1_Driver/lcd_hs_n }));  // ../../source/rtl/Driver.v(65)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_syn_58"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_syn_58  (
    .a({\u1_Driver/vcnt [0],1'b1}),
    .b({1'b0,open_n360}),
    .fco(\u1_Driver/lt1_syn_5 ));  // ../../source/rtl/Driver.v(81)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_syn_58"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_syn_61  (
    .a(\u1_Driver/vcnt [2:1]),
    .b(2'b01),
    .fci(\u1_Driver/lt1_syn_5 ),
    .fco(\u1_Driver/lt1_syn_9 ));  // ../../source/rtl/Driver.v(81)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_syn_58"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_syn_64  (
    .a(\u1_Driver/vcnt [4:3]),
    .b(2'b00),
    .fci(\u1_Driver/lt1_syn_9 ),
    .fco(\u1_Driver/lt1_syn_13 ));  // ../../source/rtl/Driver.v(81)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_syn_58"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_syn_67  (
    .a(\u1_Driver/vcnt [6:5]),
    .b(2'b00),
    .fci(\u1_Driver/lt1_syn_13 ),
    .fco(\u1_Driver/lt1_syn_17 ));  // ../../source/rtl/Driver.v(81)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_syn_58"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_syn_70  (
    .a(\u1_Driver/vcnt [8:7]),
    .b(2'b00),
    .fci(\u1_Driver/lt1_syn_17 ),
    .fco(\u1_Driver/lt1_syn_21 ));  // ../../source/rtl/Driver.v(81)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_syn_58"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_syn_73  (
    .a(\u1_Driver/vcnt [10:9]),
    .b(2'b00),
    .fci(\u1_Driver/lt1_syn_21 ),
    .fco(\u1_Driver/lt1_syn_25 ));  // ../../source/rtl/Driver.v(81)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_syn_58"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_syn_76  (
    .a({1'b0,\u1_Driver/vcnt [11]}),
    .b(2'b10),
    .fci(\u1_Driver/lt1_syn_25 ),
    .f({\u1_Driver/lcd_vs_n ,open_n524}));  // ../../source/rtl/Driver.v(81)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_syn_45"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_syn_45  (
    .a(2'b11),
    .b({\u1_Driver/hcnt [3],open_n530}),
    .fco(\u1_Driver/lt2_syn_8 ));  // ../../source/rtl/Driver.v(87)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_syn_45"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_syn_48  (
    .a(2'b10),
    .b(\u1_Driver/hcnt [5:4]),
    .fci(\u1_Driver/lt2_syn_8 ),
    .fco(\u1_Driver/lt2_syn_12 ));  // ../../source/rtl/Driver.v(87)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_syn_45"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_syn_51  (
    .a(2'b01),
    .b(\u1_Driver/hcnt [7:6]),
    .fci(\u1_Driver/lt2_syn_12 ),
    .fco(\u1_Driver/lt2_syn_16 ));  // ../../source/rtl/Driver.v(87)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_syn_45"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_syn_54  (
    .a(2'b01),
    .b(\u1_Driver/hcnt [9:8]),
    .fci(\u1_Driver/lt2_syn_16 ),
    .fco(\u1_Driver/lt2_syn_20 ));  // ../../source/rtl/Driver.v(87)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_syn_45"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_syn_57  (
    .a(2'b00),
    .b({1'b1,\u1_Driver/hcnt [10]}),
    .fci(\u1_Driver/lt2_syn_20 ),
    .f({\u1_Driver/lcd_en_n2 ,open_n646}));  // ../../source/rtl/Driver.v(87)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_syn_45"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_syn_45  (
    .a({\u1_Driver/hcnt [3],1'b0}),
    .b({1'b1,open_n652}),
    .fco(\u1_Driver/lt3_syn_8 ));  // ../../source/rtl/Driver.v(87)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_syn_45"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_syn_48  (
    .a(\u1_Driver/hcnt [5:4]),
    .b(2'b10),
    .fci(\u1_Driver/lt3_syn_8 ),
    .fco(\u1_Driver/lt3_syn_12 ));  // ../../source/rtl/Driver.v(87)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_syn_45"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_syn_51  (
    .a(\u1_Driver/hcnt [7:6]),
    .b(2'b01),
    .fci(\u1_Driver/lt3_syn_12 ),
    .fco(\u1_Driver/lt3_syn_16 ));  // ../../source/rtl/Driver.v(87)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_syn_45"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_syn_54  (
    .a(\u1_Driver/hcnt [9:8]),
    .b(2'b10),
    .fci(\u1_Driver/lt3_syn_16 ),
    .fco(\u1_Driver/lt3_syn_20 ));  // ../../source/rtl/Driver.v(87)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_syn_45"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_syn_57  (
    .a({1'b0,\u1_Driver/hcnt [10]}),
    .b(2'b11),
    .fci(\u1_Driver/lt3_syn_20 ),
    .f({\u1_Driver/lcd_en_n3 ,open_n768}));  // ../../source/rtl/Driver.v(87)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_syn_58"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_syn_58  (
    .a(2'b11),
    .b({\u1_Driver/vcnt [0],open_n774}),
    .fco(\u1_Driver/lt4_syn_5 ));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_syn_58"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_syn_61  (
    .a(2'b00),
    .b(\u1_Driver/vcnt [2:1]),
    .fci(\u1_Driver/lt4_syn_5 ),
    .fco(\u1_Driver/lt4_syn_9 ));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_syn_58"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_syn_64  (
    .a(2'b01),
    .b(\u1_Driver/vcnt [4:3]),
    .fci(\u1_Driver/lt4_syn_9 ),
    .fco(\u1_Driver/lt4_syn_13 ));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_syn_58"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_syn_67  (
    .a(2'b01),
    .b(\u1_Driver/vcnt [6:5]),
    .fci(\u1_Driver/lt4_syn_13 ),
    .fco(\u1_Driver/lt4_syn_17 ));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_syn_58"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_syn_70  (
    .a(2'b00),
    .b(\u1_Driver/vcnt [8:7]),
    .fci(\u1_Driver/lt4_syn_17 ),
    .fco(\u1_Driver/lt4_syn_21 ));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_syn_58"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_syn_73  (
    .a(2'b00),
    .b(\u1_Driver/vcnt [10:9]),
    .fci(\u1_Driver/lt4_syn_21 ),
    .fco(\u1_Driver/lt4_syn_25 ));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_syn_58"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_syn_76  (
    .a(2'b00),
    .b({1'b1,\u1_Driver/vcnt [11]}),
    .fci(\u1_Driver/lt4_syn_25 ),
    .f({\u1_Driver/lcd_en_n5 ,open_n938}));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_syn_58"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_syn_58  (
    .a({\u1_Driver/vcnt [0],1'b0}),
    .b({1'b1,open_n944}),
    .fco(\u1_Driver/lt5_syn_5 ));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_syn_58"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_syn_61  (
    .a(\u1_Driver/vcnt [2:1]),
    .b(2'b00),
    .fci(\u1_Driver/lt5_syn_5 ),
    .fco(\u1_Driver/lt5_syn_9 ));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_syn_58"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_syn_64  (
    .a(\u1_Driver/vcnt [4:3]),
    .b(2'b01),
    .fci(\u1_Driver/lt5_syn_9 ),
    .fco(\u1_Driver/lt5_syn_13 ));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_syn_58"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_syn_67  (
    .a(\u1_Driver/vcnt [6:5]),
    .b(2'b01),
    .fci(\u1_Driver/lt5_syn_13 ),
    .fco(\u1_Driver/lt5_syn_17 ));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_syn_58"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_syn_70  (
    .a(\u1_Driver/vcnt [8:7]),
    .b(2'b00),
    .fci(\u1_Driver/lt5_syn_17 ),
    .fco(\u1_Driver/lt5_syn_21 ));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_syn_58"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_syn_73  (
    .a(\u1_Driver/vcnt [10:9]),
    .b(2'b10),
    .fci(\u1_Driver/lt5_syn_21 ),
    .fco(\u1_Driver/lt5_syn_25 ));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_syn_58"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_syn_76  (
    .a({1'b0,\u1_Driver/vcnt [11]}),
    .b(2'b10),
    .fci(\u1_Driver/lt5_syn_25 ),
    .f({\u1_Driver/lcd_en_n6 ,open_n1108}));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_syn_55"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_syn_55  (
    .a(2'b11),
    .b({\u1_Driver/hcnt [0],open_n1114}),
    .fco(\u1_Driver/lt6_syn_6 ));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_syn_55"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_syn_58  (
    .a(2'b11),
    .b(\u1_Driver/hcnt [2:1]),
    .fci(\u1_Driver/lt6_syn_6 ),
    .fco(\u1_Driver/lt6_syn_10 ));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_syn_55"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_syn_61  (
    .a(2'b00),
    .b(\u1_Driver/hcnt [4:3]),
    .fci(\u1_Driver/lt6_syn_10 ),
    .fco(\u1_Driver/lt6_syn_14 ));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_syn_55"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_syn_64  (
    .a(2'b11),
    .b(\u1_Driver/hcnt [6:5]),
    .fci(\u1_Driver/lt6_syn_14 ),
    .fco(\u1_Driver/lt6_syn_18 ));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_syn_55"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_syn_67  (
    .a(2'b10),
    .b(\u1_Driver/hcnt [8:7]),
    .fci(\u1_Driver/lt6_syn_18 ),
    .fco(\u1_Driver/lt6_syn_22 ));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_syn_55"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_syn_70  (
    .a(2'b00),
    .b(\u1_Driver/hcnt [10:9]),
    .fci(\u1_Driver/lt6_syn_22 ),
    .fco(\u1_Driver/lt6_syn_26 ));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_syn_55"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_syn_72  (
    .a({open_n1260,1'b0}),
    .b({open_n1261,1'b1}),
    .fci(\u1_Driver/lt6_syn_26 ),
    .f({open_n1280,\u1_Driver/lcd_request_n2 }));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_syn_55"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_syn_55  (
    .a({\u1_Driver/hcnt [0],1'b0}),
    .b({1'b1,open_n1286}),
    .fco(\u1_Driver/lt7_syn_6 ));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_syn_55"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_syn_58  (
    .a(\u1_Driver/hcnt [2:1]),
    .b(2'b11),
    .fci(\u1_Driver/lt7_syn_6 ),
    .fco(\u1_Driver/lt7_syn_10 ));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_syn_55"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_syn_61  (
    .a(\u1_Driver/hcnt [4:3]),
    .b(2'b00),
    .fci(\u1_Driver/lt7_syn_10 ),
    .fco(\u1_Driver/lt7_syn_14 ));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_syn_55"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_syn_64  (
    .a(\u1_Driver/hcnt [6:5]),
    .b(2'b11),
    .fci(\u1_Driver/lt7_syn_14 ),
    .fco(\u1_Driver/lt7_syn_18 ));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_syn_55"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_syn_67  (
    .a(\u1_Driver/hcnt [8:7]),
    .b(2'b00),
    .fci(\u1_Driver/lt7_syn_18 ),
    .fco(\u1_Driver/lt7_syn_22 ));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_syn_55"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_syn_70  (
    .a(\u1_Driver/hcnt [10:9]),
    .b(2'b11),
    .fci(\u1_Driver/lt7_syn_22 ),
    .fco(\u1_Driver/lt7_syn_26 ));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_syn_55"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_syn_72  (
    .a({open_n1432,1'b0}),
    .b({open_n1433,1'b1}),
    .fci(\u1_Driver/lt7_syn_26 ),
    .f({open_n1452,\u1_Driver/lcd_request_n3 }));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_syn_55"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_syn_55  (
    .a({\u1_Driver/hcnt [0],1'b0}),
    .b({1'b1,open_n1458}),
    .fco(\u1_Driver/lt8_syn_6 ));  // ../../source/rtl/Driver.v(58)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_syn_55"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_syn_58  (
    .a(\u1_Driver/hcnt [2:1]),
    .b(2'b11),
    .fci(\u1_Driver/lt8_syn_6 ),
    .fco(\u1_Driver/lt8_syn_10 ));  // ../../source/rtl/Driver.v(58)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_syn_55"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_syn_61  (
    .a(\u1_Driver/hcnt [4:3]),
    .b(2'b10),
    .fci(\u1_Driver/lt8_syn_10 ),
    .fco(\u1_Driver/lt8_syn_14 ));  // ../../source/rtl/Driver.v(58)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_syn_55"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_syn_64  (
    .a(\u1_Driver/hcnt [6:5]),
    .b(2'b00),
    .fci(\u1_Driver/lt8_syn_14 ),
    .fco(\u1_Driver/lt8_syn_18 ));  // ../../source/rtl/Driver.v(58)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_syn_55"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_syn_67  (
    .a(\u1_Driver/hcnt [8:7]),
    .b(2'b01),
    .fci(\u1_Driver/lt8_syn_18 ),
    .fco(\u1_Driver/lt8_syn_22 ));  // ../../source/rtl/Driver.v(58)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_syn_55"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_syn_70  (
    .a(\u1_Driver/hcnt [10:9]),
    .b(2'b11),
    .fci(\u1_Driver/lt8_syn_22 ),
    .fco(\u1_Driver/lt8_syn_26 ));  // ../../source/rtl/Driver.v(58)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_syn_55"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_syn_72  (
    .a({open_n1604,1'b0}),
    .b({open_n1605,1'b1}),
    .fci(\u1_Driver/lt8_syn_26 ),
    .f({open_n1624,\u1_Driver/hcnt_b_n }));  // ../../source/rtl/Driver.v(58)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_syn_15  (
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [0]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [0]));  // ../../source/rtl/Driver.v(54)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_syn_17  (
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [1]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [1]));  // ../../source/rtl/Driver.v(54)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_syn_19  (
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [2]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [2]));  // ../../source/rtl/Driver.v(54)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_syn_21  (
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [3]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [3]));  // ../../source/rtl/Driver.v(54)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_syn_23  (
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [4]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [4]));  // ../../source/rtl/Driver.v(54)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_syn_25  (
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [5]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [5]));  // ../../source/rtl/Driver.v(54)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_syn_27  (
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [6]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [6]));  // ../../source/rtl/Driver.v(54)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_syn_29  (
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [7]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [7]));  // ../../source/rtl/Driver.v(54)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_syn_31  (
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [8]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [8]));  // ../../source/rtl/Driver.v(54)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_syn_33  (
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [9]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [9]));  // ../../source/rtl/Driver.v(54)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg0_syn_35  (
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b [10]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [10]));  // ../../source/rtl/Driver.v(54)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_15  (
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b1 [0]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/vcnt [0]));  // ../../source/rtl/Driver.v(70)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_17  (
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b1 [1]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/vcnt [1]));  // ../../source/rtl/Driver.v(70)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_19  (
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [2]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/vcnt [2]));  // ../../source/rtl/Driver.v(70)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_21  (
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b1 [3]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/vcnt [3]));  // ../../source/rtl/Driver.v(70)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_23  (
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [4]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/vcnt [4]));  // ../../source/rtl/Driver.v(70)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_25  (
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b1 [5]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/vcnt [5]));  // ../../source/rtl/Driver.v(70)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_27  (
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [6]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/vcnt [6]));  // ../../source/rtl/Driver.v(70)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_29  (
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [7]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/vcnt [7]));  // ../../source/rtl/Driver.v(70)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_31  (
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [8]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/vcnt [8]));  // ../../source/rtl/Driver.v(70)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_33  (
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [9]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/vcnt [9]));  // ../../source/rtl/Driver.v(70)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_35  (
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b1 [10]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/vcnt [10]));  // ../../source/rtl/Driver.v(70)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_37  (
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/vcnt_b2 [11]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/vcnt [11]));  // ../../source/rtl/Driver.v(70)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub0_syn_70"),
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
    \u1_Driver/sub0_syn_70  (
    .a({\u1_Driver/hcnt [1],1'b0}),
    .b({\u1_Driver/hcnt [2],\u1_Driver/hcnt [0]}),
    .c(2'b11),
    .d(2'b11),
    .e(2'b11),
    .fco(\u1_Driver/sub0_syn_61 ),
    .fx({open_n1660,\u1_Driver/lcd_xpos_b [0]}));  // ../../source/rtl/Driver.v(98)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub0_syn_70"),
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
    \u1_Driver/sub0_syn_71  (
    .a({\u1_Driver/hcnt [5],\u1_Driver/hcnt [3]}),
    .b({\u1_Driver/hcnt [6],\u1_Driver/hcnt [4]}),
    .c(2'b11),
    .d(2'b10),
    .e(2'b10),
    .fci(\u1_Driver/sub0_syn_61 ),
    .f({\u1_Driver/lcd_xpos_b [5],\u1_Driver/lcd_xpos_b [3]}),
    .fco(\u1_Driver/sub0_syn_65 ),
    .fx({\u1_Driver/lcd_xpos_b [6],\u1_Driver/lcd_xpos_b [4]}));  // ../../source/rtl/Driver.v(98)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub0_syn_70"),
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
    \u1_Driver/sub0_syn_72  (
    .a({\u1_Driver/hcnt [9],\u1_Driver/hcnt [7]}),
    .b({\u1_Driver/hcnt [10],\u1_Driver/hcnt [8]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b01),
    .fci(\u1_Driver/sub0_syn_65 ),
    .f({\u1_Driver/lcd_xpos_b [9],\u1_Driver/lcd_xpos_b [7]}),
    .fx({\u1_Driver/lcd_xpos_b [10],\u1_Driver/lcd_xpos_b [8]}));  // ../../source/rtl/Driver.v(98)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub1_syn_64"),
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
    \u1_Driver/sub1_syn_64  (
    .a({\u1_Driver/vcnt [1],1'b0}),
    .b({\u1_Driver/vcnt [2],\u1_Driver/vcnt [0]}),
    .c(2'b11),
    .d(2'b01),
    .e(2'b01),
    .f({\u1_Driver/lcd_ypos_b [1],open_n1717}),
    .fco(\u1_Driver/sub1_syn_56 ),
    .fx({\u1_Driver/lcd_ypos_b [2],\u1_Driver/lcd_ypos_b [0]}));  // ../../source/rtl/Driver.v(99)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub1_syn_64"),
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
    \u1_Driver/sub1_syn_65  (
    .a({\u1_Driver/vcnt [5],\u1_Driver/vcnt [3]}),
    .b({\u1_Driver/vcnt [6],\u1_Driver/vcnt [4]}),
    .c(2'b11),
    .d(2'b11),
    .e(2'b00),
    .fci(\u1_Driver/sub1_syn_56 ),
    .f({\u1_Driver/lcd_ypos_b [5],\u1_Driver/lcd_ypos_b [3]}),
    .fco(\u1_Driver/sub1_syn_60 ),
    .fx({\u1_Driver/lcd_ypos_b [6],\u1_Driver/lcd_ypos_b [4]}));  // ../../source/rtl/Driver.v(99)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/sub1_syn_64"),
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
    \u1_Driver/sub1_syn_66  (
    .a({\u1_Driver/vcnt [9],\u1_Driver/vcnt [7]}),
    .b({open_n1738,\u1_Driver/vcnt [8]}),
    .c(2'b11),
    .d(2'b00),
    .e({open_n1741,1'b0}),
    .fci(\u1_Driver/sub1_syn_60 ),
    .f({\u1_Driver/lcd_ypos_b [9],\u1_Driver/lcd_ypos_b [7]}),
    .fx({open_n1757,\u1_Driver/lcd_ypos_b [8]}));  // ../../source/rtl/Driver.v(99)
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
    .p({open_n1841,open_n1842,open_n1843,open_n1844,open_n1845,open_n1846,open_n1847,open_n1848,open_n1849,open_n1850,open_n1851,open_n1852,open_n1853,open_n1854,open_n1855,\u1_Driver/lcd_data [20:0]}));  // ../../source/rtl/Display.v(93)
  EG_PHY_PAD #(
    //.LOCATION("G1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[0]_syn_2  (
    .do({open_n1857,open_n1858,open_n1859,\vga_b[0]_dup_1 }),
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
    .do({open_n1874,open_n1875,open_n1876,\vga_b[1]_dup_1 }),
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
    .do({open_n1891,open_n1892,open_n1893,\vga_b[2]_dup_1 }),
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
    .do({open_n1908,open_n1909,open_n1910,\vga_b[3]_dup_1 }),
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
    .do({open_n1925,open_n1926,open_n1927,\vga_b[4]_dup_1 }),
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
    .do({open_n1942,open_n1943,open_n1944,\vga_b[5]_dup_1 }),
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
    .do({open_n1959,open_n1960,open_n1961,\vga_b[6]_dup_1 }),
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
    .do({open_n1976,open_n1977,open_n1978,\vga_b[7]_dup_1 }),
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
    .do({open_n1993,open_n1994,open_n1995,vga_clk_dup_1}),
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
    .do({open_n2010,open_n2011,open_n2012,\u1_Driver/lcd_en_n }),
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
    .do({open_n2027,open_n2028,open_n2029,\vga_g[0]_dup_1 }),
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
    .do({open_n2044,open_n2045,open_n2046,\vga_g[1]_dup_1 }),
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
    .do({open_n2061,open_n2062,open_n2063,\vga_g[2]_dup_1 }),
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
    .do({open_n2078,open_n2079,open_n2080,\vga_g[3]_dup_1 }),
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
    .do({open_n2095,open_n2096,open_n2097,\vga_g[4]_dup_1 }),
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
    .do({open_n2112,open_n2113,open_n2114,\vga_g[5]_dup_1 }),
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
    .do({open_n2129,open_n2130,open_n2131,\vga_g[6]_dup_1 }),
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
    .do({open_n2146,open_n2147,open_n2148,\vga_g[7]_dup_1 }),
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
    .do({open_n2163,open_n2164,open_n2165,vga_hs_dup_1}),
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
    .do({open_n2180,open_n2181,open_n2182,\vga_r[0]_dup_1 }),
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
    .do({open_n2197,open_n2198,open_n2199,\vga_r[1]_dup_1 }),
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
    .do({open_n2214,open_n2215,open_n2216,\vga_r[2]_dup_1 }),
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
    .do({open_n2231,open_n2232,open_n2233,\vga_r[3]_dup_1 }),
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
    .do({open_n2248,open_n2249,open_n2250,\vga_r[4]_dup_1 }),
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
    .do({open_n2265,open_n2266,open_n2267,1'b0}),
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
    .do({open_n2282,open_n2283,open_n2284,1'b0}),
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
    .do({open_n2299,open_n2300,open_n2301,1'b0}),
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
    .do({open_n2316,open_n2317,open_n2318,vga_vs_dup_1}),
    .opad(vga_vs));  // ../../source/rtl/VGA_Demo.v(10)
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    vga_vs_syn_3 (
    .a(\u1_Driver/lcd_vs_n ),
    .o(vga_vs_dup_1));  // ../../source/rtl/VGA_Demo.v(10)

endmodule 

