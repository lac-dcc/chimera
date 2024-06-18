// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Fri Jul 26 16:32:54 2019

`timescale 1ns / 1ps
module rgb_led  // sources/rtl/rgb_led.v(14)
  (
  clk_24m,
  led_b,
  led_g,
  led_r
  );

  input clk_24m;  // sources/rtl/rgb_led.v(15)
  output led_b;  // sources/rtl/rgb_led.v(18)
  output led_g;  // sources/rtl/rgb_led.v(17)
  output led_r;  // sources/rtl/rgb_led.v(16)

  parameter CNT = 24000000;
  wire [24:0] cnt_time;  // sources/rtl/rgb_led.v(31)
  wire [24:0] n2;
  wire _al_u10_o;
  wire _al_u11_o;
  wire _al_u12_o;
  wire _al_u4_o;
  wire _al_u5_o;
  wire _al_u6_o;
  wire _al_u7_o;
  wire _al_u8_o;
  wire _al_u9_o;
  wire \add0/c11 ;
  wire \add0/c15 ;
  wire \add0/c19 ;
  wire \add0/c23 ;
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire clk_24m_pad;  // sources/rtl/rgb_led.v(15)
  wire led_b_pad;  // sources/rtl/rgb_led.v(18)
  wire led_g_pad;  // sources/rtl/rgb_led.v(17)
  wire led_r_pad;  // sources/rtl/rgb_led.v(16)
  wire n1;
  wire rst_n;  // sources/rtl/rgb_led.v(21)

  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u0 (
    .ipad(clk_24m),
    .di(clk_24m_pad));  // sources/rtl/rgb_led.v(15)
  EG_PHY_PAD #(
    //.LOCATION("N16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u1 (
    .do({open_n18,open_n19,open_n20,led_b_pad}),
    .opad(led_b));  // sources/rtl/rgb_led.v(18)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(B*D))"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(C*~(B*D))"),
    //.LUTG1("(~D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000011110000),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b0011000011110000),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u10|reg0_b20  (
    .a({cnt_time[18],open_n34}),
    .b({cnt_time[19],_al_u12_o}),
    .c({cnt_time[2],n2[20]}),
    .clk(clk_24m_pad),
    .d({cnt_time[20],_al_u7_o}),
    .sr(rst_n),
    .f({_al_u10_o,open_n52}),
    .q({open_n56,cnt_time[20]}));  // sources/rtl/rgb_led.v(40)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(D*~C*~B*~A)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(D*~C*~B*~A)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000000100000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000000100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u11|_al_u7  (
    .a({cnt_time[14],open_n57}),
    .b({cnt_time[15],_al_u5_o}),
    .c({cnt_time[16],_al_u6_o}),
    .d({cnt_time[17],_al_u4_o}),
    .f({_al_u11_o,_al_u7_o}));
  // sources/rtl/rgb_led.v(50)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u12|reg1_b0  (
    .a({_al_u8_o,open_n82}),
    .b({_al_u9_o,open_n83}),
    .c({_al_u10_o,_al_u12_o}),
    .ce(n1),
    .clk(clk_24m_pad),
    .d({_al_u11_o,_al_u7_o}),
    .mi({open_n94,led_g_pad}),
    .sr(rst_n),
    .f({_al_u12_o,n1}),
    .q({open_n98,led_r_pad}));  // sources/rtl/rgb_led.v(50)
  EG_PHY_PAD #(
    //.LOCATION("P16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u2 (
    .do({open_n100,open_n101,open_n102,led_g_pad}),
    .opad(led_g));  // sources/rtl/rgb_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("P15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u3 (
    .do({open_n117,open_n118,open_n119,led_r_pad}),
    .opad(led_r));  // sources/rtl/rgb_led.v(16)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B*D))"),
    //.LUT1("(~C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011110000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u4|reg0_b9  (
    .b({cnt_time[8],_al_u12_o}),
    .c({cnt_time[9],n2[9]}),
    .clk(clk_24m_pad),
    .d({cnt_time[7],_al_u7_o}),
    .sr(rst_n),
    .f({_al_u4_o,open_n148}),
    .q({open_n152,cnt_time[9]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B*D))"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011110000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u5|reg0_b6  (
    .a({cnt_time[3],open_n153}),
    .b({cnt_time[4],_al_u12_o}),
    .c({cnt_time[5],n2[6]}),
    .clk(clk_24m_pad),
    .d({cnt_time[6],_al_u7_o}),
    .sr(rst_n),
    .f({_al_u5_o,open_n167}),
    .q({open_n171,cnt_time[6]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(B*D))"),
    //.LUTF1("(D*~C*B*A)"),
    //.LUTG0("(C*~(B*D))"),
    //.LUTG1("(D*~C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000011110000),
    .INIT_LUTF1(16'b0000100000000000),
    .INIT_LUTG0(16'b0011000011110000),
    .INIT_LUTG1(16'b0000100000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u6|reg0_b24  (
    .a({cnt_time[21],open_n172}),
    .b({cnt_time[22],_al_u12_o}),
    .c({cnt_time[23],n2[24]}),
    .clk(clk_24m_pad),
    .d({cnt_time[24],_al_u7_o}),
    .sr(rst_n),
    .f({_al_u6_o,open_n190}),
    .q({open_n194,cnt_time[24]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B*D))"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011110000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u8|reg0_b1  (
    .b({open_n197,_al_u12_o}),
    .c({cnt_time[1],n2[1]}),
    .clk(clk_24m_pad),
    .d({cnt_time[0],_al_u7_o}),
    .sr(rst_n),
    .f({_al_u8_o,open_n211}),
    .q({open_n215,cnt_time[1]}));  // sources/rtl/rgb_led.v(40)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~B*A)"),
    .INIT_LUT0(16'b0010000000000000),
    .MODE("LOGIC"))
    _al_u9 (
    .a({open_n216,cnt_time[10]}),
    .b({open_n217,cnt_time[11]}),
    .c({open_n218,cnt_time[12]}),
    .d({open_n221,cnt_time[13]}),
    .f({open_n235,_al_u9_o}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u39"),
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
    \add0/u11_al_u42  (
    .a({cnt_time[13],cnt_time[11]}),
    .b({cnt_time[14],cnt_time[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c11 ),
    .f({n2[13],n2[11]}),
    .fco(\add0/c15 ),
    .fx({n2[14],n2[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u39"),
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
    \add0/u15_al_u43  (
    .a({cnt_time[17],cnt_time[15]}),
    .b({cnt_time[18],cnt_time[16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c15 ),
    .f({n2[17],n2[15]}),
    .fco(\add0/c19 ),
    .fx({n2[18],n2[16]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u39"),
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
    \add0/u19_al_u44  (
    .a({cnt_time[21],cnt_time[19]}),
    .b({cnt_time[22],cnt_time[20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c19 ),
    .f({n2[21],n2[19]}),
    .fco(\add0/c23 ),
    .fx({n2[22],n2[20]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u39"),
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
    \add0/u23_al_u45  (
    .a({open_n295,cnt_time[23]}),
    .b({open_n296,cnt_time[24]}),
    .c(2'b00),
    .d({open_n299,1'b0}),
    .e({open_n300,1'b0}),
    .fci(\add0/c23 ),
    .f({open_n315,n2[23]}),
    .fx({open_n317,n2[24]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u39"),
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
    \add0/u3_al_u40  (
    .a({cnt_time[5],cnt_time[3]}),
    .b({cnt_time[6],cnt_time[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n2[5],n2[3]}),
    .fco(\add0/c7 ),
    .fx({n2[6],n2[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u39"),
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
    \add0/u7_al_u41  (
    .a({cnt_time[9],cnt_time[7]}),
    .b({cnt_time[10],cnt_time[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n2[9],n2[7]}),
    .fco(\add0/c11 ),
    .fx({n2[10],n2[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u39"),
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
    \add0/ucin_al_u39  (
    .a({cnt_time[1],1'b0}),
    .b({cnt_time[2],cnt_time[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n2[1],open_n373}),
    .fco(\add0/c3 ),
    .fx({n2[2],n2[0]}));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B*D))"),
    //.LUT1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011110000),
    .INIT_LUT1(16'b0011000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b0|reg0_b8  (
    .b({_al_u12_o,_al_u12_o}),
    .c({n2[0],n2[8]}),
    .clk(clk_24m_pad),
    .d({_al_u7_o,_al_u7_o}),
    .sr(rst_n),
    .q({cnt_time[0],cnt_time[8]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B*D))"),
    //.LUT1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011110000),
    .INIT_LUT1(16'b0011000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b10|reg0_b7  (
    .b({_al_u12_o,_al_u12_o}),
    .c({n2[10],n2[7]}),
    .clk(clk_24m_pad),
    .d({_al_u7_o,_al_u7_o}),
    .sr(rst_n),
    .q({cnt_time[10],cnt_time[7]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B*D))"),
    //.LUT1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011110000),
    .INIT_LUT1(16'b0011000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b11|reg0_b5  (
    .b({_al_u12_o,_al_u12_o}),
    .c({n2[11],n2[5]}),
    .clk(clk_24m_pad),
    .d({_al_u7_o,_al_u7_o}),
    .sr(rst_n),
    .q({cnt_time[11],cnt_time[5]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B*D))"),
    //.LUT1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011110000),
    .INIT_LUT1(16'b0011000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b12|reg0_b4  (
    .b({_al_u12_o,_al_u12_o}),
    .c({n2[12],n2[4]}),
    .clk(clk_24m_pad),
    .d({_al_u7_o,_al_u7_o}),
    .sr(rst_n),
    .q({cnt_time[12],cnt_time[4]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B*D))"),
    //.LUT1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011110000),
    .INIT_LUT1(16'b0011000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b13|reg0_b3  (
    .b({_al_u12_o,_al_u12_o}),
    .c({n2[13],n2[3]}),
    .clk(clk_24m_pad),
    .d({_al_u7_o,_al_u7_o}),
    .sr(rst_n),
    .q({cnt_time[13],cnt_time[3]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(B*D))"),
    //.LUTF1("(C*~(B*D))"),
    //.LUTG0("(C*~(B*D))"),
    //.LUTG1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000011110000),
    .INIT_LUTF1(16'b0011000011110000),
    .INIT_LUTG0(16'b0011000011110000),
    .INIT_LUTG1(16'b0011000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b14|reg0_b23  (
    .b({_al_u12_o,_al_u12_o}),
    .c({n2[14],n2[23]}),
    .clk(clk_24m_pad),
    .d({_al_u7_o,_al_u7_o}),
    .sr(rst_n),
    .q({cnt_time[14],cnt_time[23]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B*D))"),
    //.LUT1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011110000),
    .INIT_LUT1(16'b0011000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b15|reg0_b22  (
    .b({_al_u12_o,_al_u12_o}),
    .c({n2[15],n2[22]}),
    .clk(clk_24m_pad),
    .d({_al_u7_o,_al_u7_o}),
    .sr(rst_n),
    .q({cnt_time[15],cnt_time[22]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B*D))"),
    //.LUT1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011110000),
    .INIT_LUT1(16'b0011000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b16|reg0_b21  (
    .b({_al_u12_o,_al_u12_o}),
    .c({n2[16],n2[21]}),
    .clk(clk_24m_pad),
    .d({_al_u7_o,_al_u7_o}),
    .sr(rst_n),
    .q({cnt_time[16],cnt_time[21]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(B*D))"),
    //.LUTF1("(C*~(B*D))"),
    //.LUTG0("(C*~(B*D))"),
    //.LUTG1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000011110000),
    .INIT_LUTF1(16'b0011000011110000),
    .INIT_LUTG0(16'b0011000011110000),
    .INIT_LUTG1(16'b0011000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b17|reg0_b2  (
    .b({_al_u12_o,_al_u12_o}),
    .c({n2[17],n2[2]}),
    .clk(clk_24m_pad),
    .d({_al_u7_o,_al_u7_o}),
    .sr(rst_n),
    .q({cnt_time[17],cnt_time[2]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(40)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B*D))"),
    //.LUT1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011110000),
    .INIT_LUT1(16'b0011000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b18|reg0_b19  (
    .b({_al_u12_o,_al_u12_o}),
    .c({n2[18],n2[19]}),
    .clk(clk_24m_pad),
    .d({_al_u7_o,_al_u7_o}),
    .sr(rst_n),
    .q({cnt_time[18],cnt_time[19]}));  // sources/rtl/rgb_led.v(40)
  // sources/rtl/rgb_led.v(50)
  // sources/rtl/rgb_led.v(50)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b1|reg1_b2  (
    .ce(n1),
    .clk(clk_24m_pad),
    .mi({led_b_pad,led_r_pad}),
    .sr(rst_n),
    .q({led_g_pad,led_b_pad}));  // sources/rtl/rgb_led.v(50)
  rst_n ux_rst_n (
    .sclk(clk_24m_pad),
    .rst_n(rst_n));  // sources/rtl/rgb_led.v(24)

endmodule 

module rst_n  // sources/rtl/rst.v(9)
  (
  sclk,
  rst_n
  );

  input sclk;  // sources/rtl/rst.v(11)
  output rst_n;  // sources/rtl/rst.v(12)

  wire [3:0] counter;  // sources/rtl/rst.v(15)
  wire \add0/c1 ;
  wire \add0/c3 ;
  wire n0;

  EG_PHY_MSLICE #(
    //.MACRO("reg0_b0|add0/ucin"),
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
    \reg0_b0|add0/ucin  (
    .a({counter[0],1'b0}),
    .b({1'b1,open_n0}),
    .clk(sclk),
    .sr(n0),
    .fco(\add0/c1 ),
    .q({counter[0],open_n22}));
  EG_PHY_MSLICE #(
    //.MACRO("reg0_b0|add0/ucin"),
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
    \reg0_b2|reg0_b1  (
    .a(counter[2:1]),
    .b(2'b00),
    .clk(sclk),
    .fci(\add0/c1 ),
    .sr(n0),
    .fco(\add0/c3 ),
    .q(counter[2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("reg0_b0|add0/ucin"),
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
    reg0_b3_al_u1 (
    .a({open_n43,counter[3]}),
    .b({open_n44,1'b0}),
    .clk(sclk),
    .fci(\add0/c3 ),
    .sr(n0),
    .q({open_n66,counter[3]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTG0("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    rst_n_reg (
    .a({open_n67,counter[0]}),
    .b({open_n68,counter[1]}),
    .c({open_n69,counter[2]}),
    .clk(sclk),
    .d({open_n71,counter[3]}),
    .f({open_n89,n0}),
    .q({open_n93,rst_n}));  // sources/rtl/rst.v(31)

endmodule 

