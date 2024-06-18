// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Tue Jul 23 19:11:32 2019

`timescale 1ns / 1ps
module switch_LED  // Buttons_LED.v(15)
  (
  btn,
  clk_24M,
  led
  );

  input [4:0] btn;  // Buttons_LED.v(17)
  input clk_24M;  // Buttons_LED.v(16)
  output [15:0] led;  // Buttons_LED.v(18)

  wire [4:0] key_pulse;  // Buttons_LED.v(22)
  wire [15:0] led_pad;  // Buttons_LED.v(18)
  wire _al_u49_o;
  wire clk_24M_pad;  // Buttons_LED.v(16)
  wire mux3_b10_sel_is_2_o;
  wire mux3_b12_sel_is_2_o;
  wire mux3_b3_sel_is_2_o;
  wire mux3_b6_sel_is_2_o;
  wire rst_n;  // Buttons_LED.v(21)

  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u30 (
    .ipad(clk_24M),
    .di(clk_24M_pad));  // Buttons_LED.v(16)
  EG_PHY_PAD #(
    //.LOCATION("T13"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u31 (
    .do({open_n18,open_n19,open_n20,led_pad[15]}),
    .opad(led[15]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("T12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u32 (
    .do({open_n35,open_n36,open_n37,led_pad[14]}),
    .opad(led[14]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("R12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u33 (
    .do({open_n52,open_n53,open_n54,led_pad[13]}),
    .opad(led[13]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("M7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u34 (
    .do({open_n69,open_n70,open_n71,led_pad[12]}),
    .opad(led[12]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("T9"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u35 (
    .do({open_n86,open_n87,open_n88,led_pad[11]}),
    .opad(led[11]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("T8"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u36 (
    .do({open_n103,open_n104,open_n105,led_pad[10]}),
    .opad(led[10]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("T7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u37 (
    .do({open_n120,open_n121,open_n122,led_pad[9]}),
    .opad(led[9]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("R7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u38 (
    .do({open_n137,open_n138,open_n139,led_pad[8]}),
    .opad(led[8]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("P5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u39 (
    .do({open_n154,open_n155,open_n156,led_pad[7]}),
    .opad(led[7]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("N5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u40 (
    .do({open_n171,open_n172,open_n173,led_pad[6]}),
    .opad(led[6]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("P4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u41 (
    .do({open_n188,open_n189,open_n190,led_pad[5]}),
    .opad(led[5]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("M5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u42 (
    .do({open_n205,open_n206,open_n207,led_pad[4]}),
    .opad(led[4]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("N4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u43 (
    .do({open_n222,open_n223,open_n224,led_pad[3]}),
    .opad(led[3]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("N3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u44 (
    .do({open_n239,open_n240,open_n241,led_pad[2]}),
    .opad(led[2]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("M4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u45 (
    .do({open_n256,open_n257,open_n258,led_pad[1]}),
    .opad(led[1]));  // Buttons_LED.v(18)
  EG_PHY_PAD #(
    //.LOCATION("M3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u46 (
    .do({open_n273,open_n274,open_n275,led_pad[0]}),
    .opad(led[0]));  // Buttons_LED.v(18)
  // Buttons_LED.v(54)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u47|reg0_b1  (
    .c({key_pulse[0],open_n293}),
    .ce(key_pulse[0]),
    .clk(clk_24M_pad),
    .d({key_pulse[1],led_pad[1]}),
    .sr(rst_n),
    .f({mux3_b3_sel_is_2_o,open_n306}),
    .q({open_n310,led_pad[1]}));  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u48|reg0_b7  (
    .b({key_pulse[1],open_n313}),
    .c({key_pulse[0],open_n314}),
    .ce(mux3_b6_sel_is_2_o),
    .clk(clk_24M_pad),
    .d({key_pulse[2],led_pad[7]}),
    .sr(rst_n),
    .f({mux3_b6_sel_is_2_o,open_n327}),
    .q({open_n331,led_pad[7]}));  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~C*~B*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u49|reg0_b4  (
    .b({key_pulse[1],open_n334}),
    .c({key_pulse[0],open_n335}),
    .ce(mux3_b3_sel_is_2_o),
    .clk(clk_24M_pad),
    .d({key_pulse[2],led_pad[4]}),
    .sr(rst_n),
    .f({_al_u49_o,open_n352}),
    .q({open_n356,led_pad[4]}));  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u50|reg0_b11  (
    .c({key_pulse[3],open_n361}),
    .ce(mux3_b10_sel_is_2_o),
    .clk(clk_24M_pad),
    .d({_al_u49_o,led_pad[11]}),
    .sr(rst_n),
    .f({mux3_b10_sel_is_2_o,open_n374}),
    .q({open_n378,led_pad[11]}));  // Buttons_LED.v(54)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .MODE("LOGIC"))
    _al_u51 (
    .b({open_n381,key_pulse[4]}),
    .c({open_n382,key_pulse[3]}),
    .d({open_n385,_al_u49_o}),
    .f({open_n399,mux3_b12_sel_is_2_o}));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b0|reg0_b2  (
    .ce(key_pulse[0]),
    .clk(clk_24M_pad),
    .d({led_pad[0],led_pad[2]}),
    .sr(rst_n),
    .q({led_pad[0],led_pad[2]}));  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b10|reg0_b9  (
    .ce(mux3_b10_sel_is_2_o),
    .clk(clk_24M_pad),
    .d(led_pad[10:9]),
    .sr(rst_n),
    .q(led_pad[10:9]));  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000000011111111),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b12|reg0_b15  (
    .ce(mux3_b12_sel_is_2_o),
    .clk(clk_24M_pad),
    .d({led_pad[12],led_pad[15]}),
    .sr(rst_n),
    .q({led_pad[12],led_pad[15]}));  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b13|reg0_b14  (
    .ce(mux3_b12_sel_is_2_o),
    .clk(clk_24M_pad),
    .d({led_pad[13],led_pad[14]}),
    .sr(rst_n),
    .q({led_pad[13],led_pad[14]}));  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b3|reg0_b5  (
    .ce(mux3_b3_sel_is_2_o),
    .clk(clk_24M_pad),
    .d({led_pad[3],led_pad[5]}),
    .sr(rst_n),
    .q({led_pad[3],led_pad[5]}));  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  // Buttons_LED.v(54)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000000011111111),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b6|reg0_b8  (
    .ce(mux3_b6_sel_is_2_o),
    .clk(clk_24M_pad),
    .d({led_pad[6],led_pad[8]}),
    .sr(rst_n),
    .q({led_pad[6],led_pad[8]}));  // Buttons_LED.v(54)
  \debounce(N=5)  ux_btn (
    .clk(clk_24M_pad),
    .key(btn),
    .rst(rst_n),
    .key_pulse(key_pulse));  // Buttons_LED.v(25)
  rst_int ux_rst (
    .sclk(clk_24M_pad),
    .rst_n(rst_n));  // Buttons_LED.v(32)

endmodule 

module \debounce(N=5)   // debounce.v(2)
  (
  clk,
  key,
  rst,
  key_pulse
  );

  input clk;  // debounce.v(7)
  input [4:0] key;  // debounce.v(9)
  input rst;  // debounce.v(8)
  output [4:0] key_pulse;  // debounce.v(10)

  parameter N = 5;
  wire [18:0] cnt;  // debounce.v(32)
  wire [4:0] key_pad;  // debounce.v(9)
  wire [4:0] key_rst;  // debounce.v(13)
  wire [4:0] key_rst_pre;  // debounce.v(12)
  wire [4:0] key_sec;  // debounce.v(46)
  wire [4:0] key_sec_pre;  // debounce.v(45)
  wire [18:0] n3;
  wire _al_u10_o;
  wire _al_u11_o;
  wire _al_u12_o;
  wire _al_u32_o;
  wire _al_u33_o;
  wire _al_u34_o;
  wire _al_u35_o;
  wire _al_u36_o;
  wire _al_u37_o;
  wire \add0/c11 ;
  wire \add0/c15 ;
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire n6;

  EG_PHY_PAD #(
    //.LOCATION("L12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u0 (
    .ipad(key[4]),
    .di(key_pad[4]));  // debounce.v(9)
  EG_PHY_PAD #(
    //.LOCATION("G12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u1 (
    .ipad(key[3]),
    .di(key_pad[3]));  // debounce.v(9)
  EG_PHY_PAD #(
    //.LOCATION("G11"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u2 (
    .ipad(key[2]),
    .di(key_pad[2]));  // debounce.v(9)
  EG_PHY_PAD #(
    //.LOCATION("J13"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u3 (
    .ipad(key[1]),
    .di(key_pad[1]));  // debounce.v(9)
  // debounce.v(55)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(~D*C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000000000100000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u32|reg2_b0  (
    .a({cnt[12],open_n68}),
    .b({cnt[13],_al_u32_o}),
    .c({cnt[14],_al_u33_o}),
    .ce(n6),
    .clk(clk),
    .d({cnt[15],_al_u37_o}),
    .mi({open_n79,key_pad[0]}),
    .sr(rst),
    .f({_al_u32_o,n6}),
    .q({open_n83,key_sec[0]}));  // debounce.v(55)
  // debounce.v(42)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u34|reg1_b9  (
    .b({cnt[8],open_n86}),
    .c({cnt[9],n3[9]}),
    .clk(clk),
    .d({cnt[7],_al_u12_o}),
    .sr(rst),
    .f({_al_u34_o,open_n100}),
    .q({open_n104,cnt[9]}));  // debounce.v(42)
  // debounce.v(42)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u35|reg1_b6  (
    .a({cnt[3],open_n105}),
    .b({cnt[4],open_n106}),
    .c({cnt[5],n3[6]}),
    .clk(clk),
    .d({cnt[6],_al_u12_o}),
    .sr(rst),
    .f({_al_u35_o,open_n120}),
    .q({open_n124,cnt[6]}));  // debounce.v(42)
  // debounce.v(42)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u36|reg1_b2  (
    .a({cnt[16],open_n125}),
    .b({cnt[17],open_n126}),
    .c({cnt[18],n3[2]}),
    .clk(clk),
    .d({cnt[2],_al_u12_o}),
    .sr(rst),
    .f({_al_u36_o,open_n140}),
    .q({open_n144,cnt[2]}));  // debounce.v(42)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*A)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~D*C*~B*A)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000000000100000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000000000100000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u37|_al_u33  (
    .a({open_n145,cnt[0]}),
    .b({_al_u35_o,cnt[1]}),
    .c({_al_u36_o,cnt[10]}),
    .d({_al_u34_o,cnt[11]}),
    .f({_al_u37_o,_al_u33_o}));
  EG_PHY_PAD #(
    //.LOCATION("H14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u4 (
    .ipad(key[0]),
    .di(key_pad[0]));  // debounce.v(9)
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
    .a({cnt[13],cnt[11]}),
    .b({cnt[14],cnt[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c11 ),
    .f({n3[13],n3[11]}),
    .fco(\add0/c15 ),
    .fx({n3[14],n3[12]}));
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
    .a({cnt[17],cnt[15]}),
    .b({cnt[18],cnt[16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c15 ),
    .f({n3[17],n3[15]}),
    .fx({n3[18],n3[16]}));
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
    .a({cnt[5],cnt[3]}),
    .b({cnt[6],cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n3[5],n3[3]}),
    .fco(\add0/c7 ),
    .fx({n3[6],n3[4]}));
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
    .a({cnt[9],cnt[7]}),
    .b({cnt[10],cnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n3[9],n3[7]}),
    .fco(\add0/c11 ),
    .fx({n3[10],n3[8]}));
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
    .a({cnt[1],1'b0}),
    .b({cnt[2],cnt[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n3[1],open_n277}),
    .fco(\add0/c3 ),
    .fx({n3[2],n3[0]}));
  // debounce.v(27)
  // debounce.v(27)
  EG_PHY_MSLICE #(
    //.LUT0("(B*A*~(~D*C))"),
    //.LUT1("(~(~D*B)*~(~C*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000100000001000),
    .INIT_LUT1(16'b1111010100110001),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b0|reg0_b4  (
    .a({key_rst_pre[0],_al_u10_o}),
    .b({key_rst_pre[2],_al_u11_o}),
    .c({key_rst[0],key_rst_pre[4]}),
    .clk(clk),
    .d({key_rst[2],key_rst[4]}),
    .mi({key_rst[0],key_rst[4]}),
    .sr(rst),
    .f({_al_u11_o,_al_u12_o}),
    .q({key_rst_pre[0],key_rst_pre[4]}));  // debounce.v(27)
  // debounce.v(27)
  // debounce.v(27)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b2|reg4_b4  (
    .clk(clk),
    .mi({key_rst[2],key_pad[4]}),
    .sr(rst),
    .q({key_rst_pre[2],key_rst[4]}));  // debounce.v(27)
  // debounce.v(27)
  // debounce.v(27)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b3|reg4_b3  (
    .clk(clk),
    .mi({key_rst[3],key_pad[3]}),
    .sr(rst),
    .q({key_rst_pre[3],key_rst[3]}));  // debounce.v(27)
  // debounce.v(42)
  // debounce.v(42)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b0|reg1_b8  (
    .c({n3[0],n3[8]}),
    .clk(clk),
    .d({_al_u12_o,_al_u12_o}),
    .sr(rst),
    .q({cnt[0],cnt[8]}));  // debounce.v(42)
  // debounce.v(42)
  // debounce.v(42)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b10|reg1_b7  (
    .c({n3[10],n3[7]}),
    .clk(clk),
    .d({_al_u12_o,_al_u12_o}),
    .sr(rst),
    .q({cnt[10],cnt[7]}));  // debounce.v(42)
  // debounce.v(42)
  // debounce.v(42)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b11|reg1_b5  (
    .c({n3[11],n3[5]}),
    .clk(clk),
    .d({_al_u12_o,_al_u12_o}),
    .sr(rst),
    .q({cnt[11],cnt[5]}));  // debounce.v(42)
  // debounce.v(42)
  // debounce.v(42)
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
    \reg1_b12|reg1_b4  (
    .c({n3[12],n3[4]}),
    .clk(clk),
    .d({_al_u12_o,_al_u12_o}),
    .sr(rst),
    .q({cnt[12],cnt[4]}));  // debounce.v(42)
  // debounce.v(42)
  // debounce.v(42)
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
    \reg1_b13|reg1_b3  (
    .c({n3[13],n3[3]}),
    .clk(clk),
    .d({_al_u12_o,_al_u12_o}),
    .sr(rst),
    .q({cnt[13],cnt[3]}));  // debounce.v(42)
  // debounce.v(42)
  // debounce.v(42)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b14|reg1_b18  (
    .c({n3[14],n3[18]}),
    .clk(clk),
    .d({_al_u12_o,_al_u12_o}),
    .sr(rst),
    .q({cnt[14],cnt[18]}));  // debounce.v(42)
  // debounce.v(42)
  // debounce.v(42)
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
    \reg1_b15|reg1_b17  (
    .c({n3[15],n3[17]}),
    .clk(clk),
    .d({_al_u12_o,_al_u12_o}),
    .sr(rst),
    .q({cnt[15],cnt[17]}));  // debounce.v(42)
  // debounce.v(42)
  // debounce.v(42)
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
    \reg1_b1|reg1_b16  (
    .c({n3[1],n3[16]}),
    .clk(clk),
    .d({_al_u12_o,_al_u12_o}),
    .sr(rst),
    .q({cnt[1],cnt[16]}));  // debounce.v(42)
  // debounce.v(55)
  // debounce.v(55)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b1|reg2_b4  (
    .c({key_sec_pre[1],key_sec_pre[4]}),
    .ce(n6),
    .clk(clk),
    .d({key_sec[1],key_sec[4]}),
    .mi({key_pad[1],key_pad[4]}),
    .sr(rst),
    .f({key_pulse[1],key_pulse[4]}),
    .q({key_sec[1],key_sec[4]}));  // debounce.v(55)
  // debounce.v(55)
  // debounce.v(55)
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
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b2|reg2_b3  (
    .c({key_sec_pre[2],key_sec_pre[3]}),
    .ce(n6),
    .clk(clk),
    .d({key_sec[2],key_sec[3]}),
    .mi({key_pad[2],key_pad[3]}),
    .sr(rst),
    .f({key_pulse[2],key_pulse[3]}),
    .q({key_sec[2],key_sec[3]}));  // debounce.v(55)
  // debounce.v(27)
  // debounce.v(62)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(~D*B)*~(~C*A))"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(~(~D*B)*~(~C*A))"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111010100110001),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b1111010100110001),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg3_b0|reg0_b1  (
    .a({open_n572,key_rst_pre[1]}),
    .b({open_n573,key_rst_pre[3]}),
    .c({key_sec_pre[0],key_rst[1]}),
    .clk(clk),
    .d({key_sec[0],key_rst[3]}),
    .mi({key_sec[0],key_rst[1]}),
    .sr(rst),
    .f({key_pulse[0],_al_u10_o}),
    .q({key_sec_pre[0],key_rst_pre[1]}));  // debounce.v(27)
  // debounce.v(27)
  // debounce.v(62)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg3_b1|reg4_b2  (
    .clk(clk),
    .mi({key_sec[1],key_pad[2]}),
    .sr(rst),
    .q({key_sec_pre[1],key_rst[2]}));  // debounce.v(27)
  // debounce.v(27)
  // debounce.v(62)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg3_b2|reg4_b1  (
    .clk(clk),
    .mi({key_sec[2],key_pad[1]}),
    .sr(rst),
    .q({key_sec_pre[2],key_rst[1]}));  // debounce.v(27)
  // debounce.v(27)
  // debounce.v(62)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg3_b3|reg4_b0  (
    .clk(clk),
    .mi({key_sec[3],key_pad[0]}),
    .sr(rst),
    .q({key_sec_pre[3],key_rst[0]}));  // debounce.v(27)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg3_b4 (
    .clk(clk),
    .mi({open_n691,key_sec[4]}),
    .sr(rst),
    .q({open_n697,key_sec_pre[4]}));  // debounce.v(62)

endmodule 

module rst_int  // rst.v(9)
  (
  sclk,
  rst_n
  );

  input sclk;  // rst.v(11)
  output rst_n;  // rst.v(12)

  wire [3:0] counter;  // rst.v(15)
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
    .q({open_n93,rst_n}));  // rst.v(31)

endmodule 

