// Verilog netlist created by Tang Dynasty v5.6.59063
// Sat Oct  8 17:30:53 2022

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
  wire [11:0] \u1_Driver/hcnt_b1 ;
  wire [23:0] \u1_Driver/lcd_data ;  // ../../source/rtl/Driver.v(28)
  wire [12:0] \u1_Driver/lcd_xpos_b ;
  wire [12:0] \u1_Driver/lcd_ypos_b ;
  wire [11:0] \u1_Driver/vcnt ;  // ../../source/rtl/Driver.v(45)
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

  initial $sdf_annotate("VGA_Demo.sdf");
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
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTG0("(~D)"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    \u0_PLL/uut/reset_syn_5  (
    .d({open_n103,rst_n_dup_1}),
    .f({open_n121,\u0_PLL/uut/reset }));  // ../../al_ip/PLL.v(30)
  EG_PHY_LSLICE #(
    //.MACRO("u1_Driver/add0_syn_74"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/add0_syn_74  (
    .a({\u1_Driver/vcnt [1],1'b0}),
    .b({\u1_Driver/vcnt [2],\u1_Driver/vcnt [0]}),
    .c(2'b00),
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(2'b01),
    .e(2'b01),
    .mi(\u1_Driver/vcnt_b2 [7:6]),
    .sr(rst_n_dup_1),
    .f({\u1_Driver/vcnt_b2 [1],open_n139}),
    .fco(\u1_Driver/add0_syn_64 ),
    .fx({\u1_Driver/vcnt_b2 [2],\u1_Driver/vcnt_b2 [0]}),
    .q(\u1_Driver/vcnt [7:6]));  // ../../source/rtl/Driver.v(77)
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
    .a({open_n176,\u1_Driver/vcnt [11]}),
    .c(2'b00),
    .d({open_n181,1'b0}),
    .fci(\u1_Driver/add0_syn_72 ),
    .f({open_n198,\u1_Driver/vcnt_b2 [11]}));  // ../../source/rtl/Driver.v(77)
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
    .f({\u1_Driver/hcnt_b1 [1],open_n221}),
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
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt0_syn_41"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt0_syn_41  (
    .a({\u1_Driver/hcnt [4],1'b1}),
    .b({1'b0,open_n261}),
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
    .a({open_n359,1'b0}),
    .b({open_n360,1'b1}),
    .fci(\u1_Driver/lt0_syn_20 ),
    .f({open_n379,\u1_Driver/lcd_hs_n }));  // ../../source/rtl/Driver.v(65)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt1_syn_58"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt1_syn_58  (
    .a({\u1_Driver/vcnt [0],1'b1}),
    .b({1'b0,open_n385}),
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
    .f({\u1_Driver/lcd_vs_n ,open_n549}));  // ../../source/rtl/Driver.v(81)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt2_syn_45"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt2_syn_45  (
    .a(2'b11),
    .b({\u1_Driver/hcnt [3],open_n555}),
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
    .f({\u1_Driver/lcd_en_n2 ,open_n671}));  // ../../source/rtl/Driver.v(87)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt3_syn_45"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt3_syn_45  (
    .a({\u1_Driver/hcnt [3],1'b0}),
    .b({1'b1,open_n677}),
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
    .f({\u1_Driver/lcd_en_n3 ,open_n793}));  // ../../source/rtl/Driver.v(87)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt4_syn_58"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt4_syn_58  (
    .a(2'b11),
    .b({\u1_Driver/vcnt [0],open_n799}),
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
    .f({\u1_Driver/lcd_en_n5 ,open_n963}));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt5_syn_58"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt5_syn_58  (
    .a({\u1_Driver/vcnt [0],1'b0}),
    .b({1'b1,open_n969}),
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
    .f({\u1_Driver/lcd_en_n6 ,open_n1133}));  // ../../source/rtl/Driver.v(88)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt6_syn_55"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt6_syn_55  (
    .a(2'b11),
    .b({\u1_Driver/hcnt [0],open_n1139}),
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
    .a({open_n1285,1'b0}),
    .b({open_n1286,1'b1}),
    .fci(\u1_Driver/lt6_syn_26 ),
    .f({open_n1305,\u1_Driver/lcd_request_n2 }));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt7_syn_55"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt7_syn_55  (
    .a({\u1_Driver/hcnt [0],1'b0}),
    .b({1'b1,open_n1311}),
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
    .a({open_n1457,1'b0}),
    .b({open_n1458,1'b1}),
    .fci(\u1_Driver/lt7_syn_26 ),
    .f({open_n1477,\u1_Driver/lcd_request_n3 }));  // ../../source/rtl/Driver.v(94)
  EG_PHY_MSLICE #(
    //.MACRO("u1_Driver/lt8_syn_55"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u1_Driver/lt8_syn_55  (
    .a({\u1_Driver/hcnt [0],1'b0}),
    .b({1'b1,open_n1483}),
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
    .a({open_n1629,1'b0}),
    .b({open_n1630,1'b1}),
    .fci(\u1_Driver/lt8_syn_26 ),
    .f({open_n1649,\u1_Driver/hcnt_b_n }));  // ../../source/rtl/Driver.v(58)
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
    \u1_Driver/reg0_syn_60  (
    .c({\u1_Driver/hcnt_b_n ,\u1_Driver/hcnt_b_n }),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b1 [5:4]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [5:4]));  // ../../source/rtl/Driver.v(54)
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
    \u1_Driver/reg0_syn_63  (
    .c({\u1_Driver/hcnt_b_n ,\u1_Driver/hcnt_b_n }),
    .clk(\u1_Driver/clk ),
    .d({\u1_Driver/hcnt_b1 [3],\u1_Driver/hcnt_b1 [6]}),
    .sr(rst_n_dup_1),
    .q({\u1_Driver/hcnt [3],\u1_Driver/hcnt [6]}));  // ../../source/rtl/Driver.v(54)
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
    \u1_Driver/reg0_syn_66  (
    .c({\u1_Driver/hcnt_b_n ,\u1_Driver/hcnt_b_n }),
    .clk(\u1_Driver/clk ),
    .d({\u1_Driver/hcnt_b1 [10],\u1_Driver/hcnt_b1 [7]}),
    .sr(rst_n_dup_1),
    .q({\u1_Driver/hcnt [10],\u1_Driver/hcnt [7]}));  // ../../source/rtl/Driver.v(54)
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
    \u1_Driver/reg0_syn_69  (
    .c({\u1_Driver/hcnt_b_n ,\u1_Driver/hcnt_b_n }),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b1 [9:8]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [9:8]));  // ../../source/rtl/Driver.v(54)
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
    \u1_Driver/reg0_syn_72  (
    .c({\u1_Driver/hcnt_b_n ,\u1_Driver/hcnt_b_n }),
    .clk(\u1_Driver/clk ),
    .d(\u1_Driver/hcnt_b1 [2:1]),
    .sr(rst_n_dup_1),
    .q(\u1_Driver/hcnt [2:1]));  // ../../source/rtl/Driver.v(54)
  EG_PHY_LSLICE #(
    //.LUTF0("(~0*D*~C*~B*A)"),
    //.LUTF1("(~0*~D*C*~B*A)"),
    //.LUTG0("(~1*D*~C*~B*A)"),
    //.LUTG1("(~1*~D*C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001000000000),
    .INIT_LUTF1(16'b0000000000100000),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_56  (
    .a({\u1_Driver/vcnt_b1[3]_syn_2 ,\u1_Driver/vcnt_b1[3]_syn_4 }),
    .b({\u1_Driver/vcnt [4],\u1_Driver/vcnt [8]}),
    .c({\u1_Driver/vcnt [5],\u1_Driver/vcnt [9]}),
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d({\u1_Driver/vcnt [6],\u1_Driver/vcnt [10]}),
    .e({\u1_Driver/vcnt [7],\u1_Driver/vcnt [11]}),
    .mi({\u1_Driver/vcnt_b2 [4],\u1_Driver/vcnt_b2 [8]}),
    .sr(rst_n_dup_1),
    .f({\u1_Driver/vcnt_b1[3]_syn_4 ,\u1_Driver/vcnt_b1_n }),
    .q({\u1_Driver/vcnt [4],\u1_Driver/vcnt [8]}));  // ../../source/rtl/Driver.v(70)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*~B*A)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(D*~C*~B*A)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000001000000000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000001000000000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/reg1_syn_59  (
    .a({open_n1800,\u1_Driver/vcnt [0]}),
    .b({open_n1801,\u1_Driver/vcnt [1]}),
    .c({\u1_Driver/vcnt_b2 [1],\u1_Driver/vcnt [2]}),
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d({\u1_Driver/vcnt_b1_n ,\u1_Driver/vcnt [3]}),
    .mi({open_n1805,\u1_Driver/vcnt_b2 [2]}),
    .sr(rst_n_dup_1),
    .f({open_n1817,\u1_Driver/vcnt_b1[3]_syn_2 }),
    .q({\u1_Driver/vcnt [1],\u1_Driver/vcnt [2]}));  // ../../source/rtl/Driver.v(70)
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
    \u1_Driver/reg1_syn_62  (
    .c({\u1_Driver/vcnt_b2 [5],\u1_Driver/vcnt_b2 [0]}),
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d({\u1_Driver/vcnt_b1_n ,\u1_Driver/vcnt_b1_n }),
    .sr(rst_n_dup_1),
    .q({\u1_Driver/vcnt [5],\u1_Driver/vcnt [0]}));  // ../../source/rtl/Driver.v(70)
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
    \u1_Driver/reg1_syn_65  (
    .c({\u1_Driver/vcnt_b2 [10],\u1_Driver/vcnt_b2 [3]}),
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d({\u1_Driver/vcnt_b1_n ,\u1_Driver/vcnt_b1_n }),
    .sr(rst_n_dup_1),
    .q({\u1_Driver/vcnt [10],\u1_Driver/vcnt [3]}));  // ../../source/rtl/Driver.v(70)
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
    .fx({open_n1890,\u1_Driver/lcd_xpos_b [0]}));  // ../../source/rtl/Driver.v(98)
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
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h0005),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u1_Driver/sub1_syn_64  (
    .a({\u1_Driver/vcnt [1],1'b0}),
    .b({\u1_Driver/vcnt [2],\u1_Driver/vcnt [0]}),
    .c(2'b11),
    .ce(\u1_Driver/vcnt_b_n ),
    .clk(\u1_Driver/clk ),
    .d(2'b01),
    .e(2'b01),
    .mi({\u1_Driver/vcnt_b2 [11],\u1_Driver/vcnt_b2 [9]}),
    .sr(rst_n_dup_1),
    .f({\u1_Driver/lcd_ypos_b [1],open_n1942}),
    .fco(\u1_Driver/sub1_syn_56 ),
    .fx({\u1_Driver/lcd_ypos_b [2],\u1_Driver/lcd_ypos_b [0]}),
    .q({\u1_Driver/vcnt [11],\u1_Driver/vcnt [9]}));  // ../../source/rtl/Driver.v(99)
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
    .b({open_n1961,\u1_Driver/vcnt [8]}),
    .c(2'b11),
    .d(2'b00),
    .e({open_n1964,1'b0}),
    .fci(\u1_Driver/sub1_syn_60 ),
    .f({\u1_Driver/lcd_ypos_b [9],\u1_Driver/lcd_ypos_b [7]}),
    .fx({open_n1980,\u1_Driver/lcd_ypos_b [8]}));  // ../../source/rtl/Driver.v(99)
  EG_PHY_LSLICE #(
    //.LUTF0("(0*~D*~C*B*A)"),
    //.LUTF1("(D*C*~B*A)"),
    //.LUTG0("(1*~D*~C*B*A)"),
    //.LUTG1("(D*C*~B*A)"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0010000000000000),
    .INIT_LUTG0(16'b0000000000001000),
    .INIT_LUTG1(16'b0010000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u1_Driver/vcnt_b_n_syn_14  (
    .a({\u1_Driver/vcnt_b_n_syn_4 ,\u1_Driver/vcnt_b_n_syn_2 }),
    .b({\u1_Driver/hcnt [8],\u1_Driver/hcnt [4]}),
    .c({\u1_Driver/hcnt [9],\u1_Driver/hcnt [5]}),
    .d({\u1_Driver/hcnt [10],\u1_Driver/hcnt [6]}),
    .e({open_n1985,\u1_Driver/hcnt [7]}),
    .f({\u1_Driver/vcnt_b_n ,\u1_Driver/vcnt_b_n_syn_4 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTG0("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    \u2_Display/lcd_xpos[0]_syn_5  (
    .c({open_n2010,\u1_Driver/lcd_xpos_b [0]}),
    .d({open_n2013,\u1_Driver/lcd_request_n }),
    .f({open_n2031,\u2_Display/lcd_xpos [0]}));  // ../../source/rtl/Display.v(27)
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
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u2_Display/lcd_xpos[10]_syn_5  (
    .c({\u1_Driver/lcd_xpos_b [10],\u1_Driver/hcnt_b_n }),
    .clk(\u1_Driver/clk ),
    .d({\u1_Driver/lcd_request_n ,\u1_Driver/hcnt_b1 [0]}),
    .sr(rst_n_dup_1),
    .f({\u2_Display/lcd_xpos [10],open_n2058}),
    .q({open_n2062,\u1_Driver/hcnt [0]}));  // ../../source/rtl/Display.v(27)
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
    \u2_Display/lcd_xpos[3]_syn_5  (
    .c({\u1_Driver/lcd_xpos_b [3],\u1_Driver/lcd_xpos_b [4]}),
    .d({\u1_Driver/lcd_request_n ,\u1_Driver/lcd_request_n }),
    .f({\u2_Display/lcd_xpos [3],\u2_Display/lcd_xpos [4]}));  // ../../source/rtl/Display.v(27)
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
    \u2_Display/lcd_xpos[5]_syn_5  (
    .c({\u1_Driver/lcd_xpos_b [5],\u1_Driver/hcnt_b1 [1]}),
    .d({\u1_Driver/lcd_request_n ,\u1_Driver/lcd_request_n }),
    .f({\u2_Display/lcd_xpos [5],\u2_Display/lcd_xpos [1]}));  // ../../source/rtl/Display.v(27)
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
    \u2_Display/lcd_xpos[6]_syn_5  (
    .c({\u1_Driver/lcd_xpos_b [6],\u1_Driver/hcnt_b1 [2]}),
    .d({\u1_Driver/lcd_request_n ,\u1_Driver/lcd_request_n }),
    .f({\u2_Display/lcd_xpos [6],\u2_Display/lcd_xpos [2]}));  // ../../source/rtl/Display.v(27)
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
    \u2_Display/lcd_xpos[7]_syn_5  (
    .c({\u1_Driver/lcd_xpos_b [7],\u1_Driver/lcd_xpos_b [8]}),
    .d({\u1_Driver/lcd_request_n ,\u1_Driver/lcd_request_n }),
    .f({\u2_Display/lcd_xpos [7],\u2_Display/lcd_xpos [8]}));  // ../../source/rtl/Display.v(27)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u2_Display/lcd_xpos[9]_syn_5  (
    .a({open_n2175,\u1_Driver/hcnt [0]}),
    .b({open_n2176,\u1_Driver/hcnt [1]}),
    .c({\u1_Driver/lcd_xpos_b [9],\u1_Driver/hcnt [2]}),
    .d({\u1_Driver/lcd_request_n ,\u1_Driver/hcnt [3]}),
    .f({\u2_Display/lcd_xpos [9],\u1_Driver/vcnt_b_n_syn_2 }));  // ../../source/rtl/Display.v(27)
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
    \u2_Display/lcd_ypos[0]_syn_5  (
    .c({\u1_Driver/lcd_ypos_b [0],\u1_Driver/lcd_ypos_b [1]}),
    .d({\u1_Driver/lcd_request_n ,\u1_Driver/lcd_request_n }),
    .f({\u2_Display/lcd_ypos [0],\u2_Display/lcd_ypos [1]}));  // ../../source/rtl/Display.v(28)
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
    \u2_Display/lcd_ypos[2]_syn_5  (
    .c({\u1_Driver/lcd_ypos_b [2],\u1_Driver/lcd_ypos_b [3]}),
    .d({\u1_Driver/lcd_request_n ,\u1_Driver/lcd_request_n }),
    .f({\u2_Display/lcd_ypos [2],\u2_Display/lcd_ypos [3]}));  // ../../source/rtl/Display.v(28)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(D*C*B*A)"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u2_Display/lcd_ypos[3]_syn_8  (
    .a({\u1_Driver/lcd_en_n5 ,\u1_Driver/lcd_en_n2 }),
    .b({\u1_Driver/lcd_en_n6 ,\u1_Driver/lcd_en_n3 }),
    .c({\u1_Driver/lcd_request_n2 ,\u1_Driver/lcd_en_n5 }),
    .d({\u1_Driver/lcd_request_n3 ,\u1_Driver/lcd_en_n6 }),
    .f({\u1_Driver/lcd_request_n ,\u1_Driver/lcd_en_n }));  // ../../source/rtl/Display.v(28)
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
    \u2_Display/lcd_ypos[4]_syn_5  (
    .c({\u1_Driver/lcd_ypos_b [4],\u1_Driver/lcd_ypos_b [5]}),
    .d({\u1_Driver/lcd_request_n ,\u1_Driver/lcd_request_n }),
    .f({\u2_Display/lcd_ypos [4],\u2_Display/lcd_ypos [5]}));  // ../../source/rtl/Display.v(28)
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
    \u2_Display/lcd_ypos[6]_syn_5  (
    .c({\u1_Driver/lcd_ypos_b [6],\u1_Driver/lcd_ypos_b [7]}),
    .d({\u1_Driver/lcd_request_n ,\u1_Driver/lcd_request_n }),
    .f({\u2_Display/lcd_ypos [6],\u2_Display/lcd_ypos [7]}));  // ../../source/rtl/Display.v(28)
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
    \u2_Display/lcd_ypos[8]_syn_5  (
    .c({\u1_Driver/lcd_ypos_b [8],\u1_Driver/lcd_ypos_b [9]}),
    .d({\u1_Driver/lcd_request_n ,\u1_Driver/lcd_request_n }),
    .f({\u2_Display/lcd_ypos [8],\u2_Display/lcd_ypos [9]}));  // ../../source/rtl/Display.v(28)
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
    .p({open_n2446,open_n2447,open_n2448,open_n2449,open_n2450,open_n2451,open_n2452,open_n2453,open_n2454,open_n2455,open_n2456,open_n2457,open_n2458,open_n2459,open_n2460,\u1_Driver/lcd_data [20:0]}));  // ../../source/rtl/Display.v(93)
  EG_PHY_PAD #(
    //.LOCATION("G1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[0]_syn_2  (
    .do({open_n2462,open_n2463,open_n2464,\vga_b[0]_dup_1 }),
    .opad(vga_b[0]));  // ../../source/rtl/VGA_Demo.v(16)
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
    \vga_b[0]_syn_7  (
    .c({\u1_Driver/lcd_data [0],\u1_Driver/lcd_data [4]}),
    .d({\u1_Driver/lcd_en_n ,\u1_Driver/lcd_en_n }),
    .f({\vga_b[0]_dup_1 ,\vga_b[4]_dup_1 }));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("F1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[1]_syn_2  (
    .do({open_n2507,open_n2508,open_n2509,\vga_b[1]_dup_1 }),
    .opad(vga_b[1]));  // ../../source/rtl/VGA_Demo.v(16)
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
    \vga_b[1]_syn_7  (
    .c({\u1_Driver/lcd_data [1],\u1_Driver/lcd_data [2]}),
    .d({\u1_Driver/lcd_en_n ,\u1_Driver/lcd_en_n }),
    .f({\vga_b[1]_dup_1 ,\vga_b[2]_dup_1 }));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("F2"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[2]_syn_2  (
    .do({open_n2552,open_n2553,open_n2554,\vga_b[2]_dup_1 }),
    .opad(vga_b[2]));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("E1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[3]_syn_2  (
    .do({open_n2569,open_n2570,open_n2571,\vga_b[3]_dup_1 }),
    .opad(vga_b[3]));  // ../../source/rtl/VGA_Demo.v(16)
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
    \vga_b[3]_syn_7  (
    .c({\u1_Driver/lcd_data [3],\u1_Driver/lcd_data [5]}),
    .d({\u1_Driver/lcd_en_n ,\u1_Driver/lcd_en_n }),
    .f({\vga_b[3]_dup_1 ,\vga_b[5]_dup_1 }));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("G3"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[4]_syn_2  (
    .do({open_n2614,open_n2615,open_n2616,\vga_b[4]_dup_1 }),
    .opad(vga_b[4]));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("E2"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[5]_syn_2  (
    .do({open_n2631,open_n2632,open_n2633,\vga_b[5]_dup_1 }),
    .opad(vga_b[5]));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("D1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[6]_syn_2  (
    .do({open_n2648,open_n2649,open_n2650,\vga_b[6]_dup_1 }),
    .opad(vga_b[6]));  // ../../source/rtl/VGA_Demo.v(16)
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
    \vga_b[6]_syn_7  (
    .c({\u1_Driver/lcd_data [6],\u1_Driver/lcd_data [7]}),
    .d({\u1_Driver/lcd_en_n ,\u1_Driver/lcd_en_n }),
    .f({\vga_b[6]_dup_1 ,\vga_b[7]_dup_1 }));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("C1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_b[7]_syn_2  (
    .do({open_n2693,open_n2694,open_n2695,\vga_b[7]_dup_1 }),
    .opad(vga_b[7]));  // ../../source/rtl/VGA_Demo.v(16)
  EG_PHY_PAD #(
    //.LOCATION("H2"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    vga_clk_syn_2 (
    .do({open_n2710,open_n2711,open_n2712,vga_clk_dup_1}),
    .opad(vga_clk));  // ../../source/rtl/VGA_Demo.v(8)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTG0("(~D)"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    vga_clk_syn_7 (
    .d({open_n2734,\u1_Driver/clk }),
    .f({open_n2752,vga_clk_dup_1}));  // ../../source/rtl/VGA_Demo.v(8)
  EG_PHY_PAD #(
    //.LOCATION("H16"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    vga_de_syn_1 (
    .do({open_n2759,open_n2760,open_n2761,\u1_Driver/lcd_en_n }),
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
    .do({open_n2776,open_n2777,open_n2778,\vga_g[0]_dup_1 }),
    .opad(vga_g[0]));  // ../../source/rtl/VGA_Demo.v(15)
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
    \vga_g[0]_syn_7  (
    .c({\u1_Driver/lcd_data [8],\u1_Driver/lcd_data [12]}),
    .d({\u1_Driver/lcd_en_n ,\u1_Driver/lcd_en_n }),
    .f({\vga_g[0]_dup_1 ,\vga_g[4]_dup_1 }));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("K2"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[1]_syn_2  (
    .do({open_n2821,open_n2822,open_n2823,\vga_g[1]_dup_1 }),
    .opad(vga_g[1]));  // ../../source/rtl/VGA_Demo.v(15)
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
    \vga_g[1]_syn_7  (
    .c({\u1_Driver/lcd_data [9],\u1_Driver/lcd_data [19]}),
    .d({\u1_Driver/lcd_en_n ,\u1_Driver/lcd_en_n }),
    .f({\vga_g[1]_dup_1 ,\vga_r[3]_dup_1 }));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("K1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[2]_syn_2  (
    .do({open_n2866,open_n2867,open_n2868,\vga_g[2]_dup_1 }),
    .opad(vga_g[2]));  // ../../source/rtl/VGA_Demo.v(15)
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
    \vga_g[2]_syn_7  (
    .c({\u1_Driver/lcd_data [10],\u1_Driver/lcd_data [11]}),
    .d({\u1_Driver/lcd_en_n ,\u1_Driver/lcd_en_n }),
    .f({\vga_g[2]_dup_1 ,\vga_g[3]_dup_1 }));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("J1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[3]_syn_2  (
    .do({open_n2911,open_n2912,open_n2913,\vga_g[3]_dup_1 }),
    .opad(vga_g[3]));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("H3"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[4]_syn_2  (
    .do({open_n2928,open_n2929,open_n2930,\vga_g[4]_dup_1 }),
    .opad(vga_g[4]));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("J6"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[5]_syn_2  (
    .do({open_n2945,open_n2946,open_n2947,\vga_g[5]_dup_1 }),
    .opad(vga_g[5]));  // ../../source/rtl/VGA_Demo.v(15)
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
    \vga_g[5]_syn_7  (
    .c({\u1_Driver/lcd_data [13],\u1_Driver/lcd_data [20]}),
    .d({\u1_Driver/lcd_en_n ,\u1_Driver/lcd_en_n }),
    .f({\vga_g[5]_dup_1 ,\vga_r[4]_dup_1 }));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("H1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[6]_syn_2  (
    .do({open_n2990,open_n2991,open_n2992,\vga_g[6]_dup_1 }),
    .opad(vga_g[6]));  // ../../source/rtl/VGA_Demo.v(15)
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
    \vga_g[6]_syn_7  (
    .c({\u1_Driver/lcd_data [14],\u1_Driver/lcd_data [15]}),
    .d({\u1_Driver/lcd_en_n ,\u1_Driver/lcd_en_n }),
    .f({\vga_g[6]_dup_1 ,\vga_g[7]_dup_1 }));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("H5"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_g[7]_syn_2  (
    .do({open_n3035,open_n3036,open_n3037,\vga_g[7]_dup_1 }),
    .opad(vga_g[7]));  // ../../source/rtl/VGA_Demo.v(15)
  EG_PHY_PAD #(
    //.LOCATION("J3"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    vga_hs_syn_2 (
    .do({open_n3052,open_n3053,open_n3054,vga_hs_dup_1}),
    .opad(vga_hs));  // ../../source/rtl/VGA_Demo.v(9)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTG0("(~D)"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    vga_hs_syn_7 (
    .d({open_n3076,\u1_Driver/lcd_hs_n }),
    .f({open_n3094,vga_hs_dup_1}));  // ../../source/rtl/VGA_Demo.v(9)
  EG_PHY_PAD #(
    //.LOCATION("L5"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[0]_syn_2  (
    .do({open_n3101,open_n3102,open_n3103,\vga_r[0]_dup_1 }),
    .opad(vga_r[0]));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTG0("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    \vga_r[0]_syn_7  (
    .c({open_n3121,\u1_Driver/lcd_data [16]}),
    .d({open_n3124,\u1_Driver/lcd_en_n }),
    .f({open_n3142,\vga_r[0]_dup_1 }));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("L3"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[1]_syn_2  (
    .do({open_n3149,open_n3150,open_n3151,\vga_r[1]_dup_1 }),
    .opad(vga_r[1]));  // ../../source/rtl/VGA_Demo.v(14)
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
    \vga_r[1]_syn_7  (
    .c({\u1_Driver/lcd_data [17],\u1_Driver/lcd_data [18]}),
    .d({\u1_Driver/lcd_en_n ,\u1_Driver/lcd_en_n }),
    .f({\vga_r[1]_dup_1 ,\vga_r[2]_dup_1 }));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("M2"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[2]_syn_2  (
    .do({open_n3194,open_n3195,open_n3196,\vga_r[2]_dup_1 }),
    .opad(vga_r[2]));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("M1"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[3]_syn_2  (
    .do({open_n3211,open_n3212,open_n3213,\vga_r[3]_dup_1 }),
    .opad(vga_r[3]));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("L4"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[4]_syn_2  (
    .do({open_n3228,open_n3229,open_n3230,\vga_r[4]_dup_1 }),
    .opad(vga_r[4]));  // ../../source/rtl/VGA_Demo.v(14)
  EG_PHY_PAD #(
    //.LOCATION("K5"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \vga_r[5]_syn_1  (
    .do({open_n3245,open_n3246,open_n3247,1'b0}),
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
    .do({open_n3262,open_n3263,open_n3264,1'b0}),
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
    .do({open_n3279,open_n3280,open_n3281,1'b0}),
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
    .do({open_n3296,open_n3297,open_n3298,vga_vs_dup_1}),
    .opad(vga_vs));  // ../../source/rtl/VGA_Demo.v(10)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTG0("(~D)"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    vga_vs_syn_7 (
    .d({open_n3320,\u1_Driver/lcd_vs_n }),
    .f({open_n3338,vga_vs_dup_1}));  // ../../source/rtl/VGA_Demo.v(10)

endmodule 

