// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Fri Jul 26 17:43:03 2019

`timescale 1ns / 1ps
module buttons_led  // sources/rtl/buttons_led.v(15)
  (
  btn,
  clk_24m,
  led
  );

  input [4:0] btn;  // sources/rtl/buttons_led.v(22)
  input clk_24m;  // sources/rtl/buttons_led.v(21)
  output [15:0] led;  // sources/rtl/buttons_led.v(23)

  parameter CNT_20MS = 19'b1110101011000000001;
  parameter N = 5;
  wire [4:0] key_pulse;  // sources/rtl/buttons_led.v(27)
  wire [15:0] led_pad;  // sources/rtl/buttons_led.v(23)
  wire _al_u49_o;
  wire clk_24m_pad;  // sources/rtl/buttons_led.v(21)
  wire mux3_b10_sel_is_2_o;
  wire mux3_b12_sel_is_2_o;
  wire mux3_b3_sel_is_2_o;
  wire mux3_b6_sel_is_2_o;
  wire rst_n;  // sources/rtl/buttons_led.v(26)

  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u30 (
    .ipad(clk_24m),
    .di(clk_24m_pad));  // sources/rtl/buttons_led.v(21)
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
    .opad(led[15]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[14]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[13]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[12]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[11]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[10]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[9]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[8]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[7]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[6]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[5]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[4]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[3]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[2]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[1]));  // sources/rtl/buttons_led.v(23)
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
    .opad(led[0]));  // sources/rtl/buttons_led.v(23)
  // sources/rtl/buttons_led.v(63)
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
    .clk(clk_24m_pad),
    .d({key_pulse[1],led_pad[1]}),
    .sr(rst_n),
    .f({mux3_b3_sel_is_2_o,open_n306}),
    .q({open_n310,led_pad[1]}));  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
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
    .clk(clk_24m_pad),
    .d({key_pulse[2],led_pad[7]}),
    .sr(rst_n),
    .f({mux3_b6_sel_is_2_o,open_n327}),
    .q({open_n331,led_pad[7]}));  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
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
    .clk(clk_24m_pad),
    .d({key_pulse[2],led_pad[4]}),
    .sr(rst_n),
    .f({_al_u49_o,open_n352}),
    .q({open_n356,led_pad[4]}));  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
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
    .clk(clk_24m_pad),
    .d({_al_u49_o,led_pad[11]}),
    .sr(rst_n),
    .f({mux3_b10_sel_is_2_o,open_n374}),
    .q({open_n378,led_pad[11]}));  // sources/rtl/buttons_led.v(63)
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
  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
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
    .clk(clk_24m_pad),
    .d({led_pad[0],led_pad[2]}),
    .sr(rst_n),
    .q({led_pad[0],led_pad[2]}));  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
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
    .clk(clk_24m_pad),
    .d(led_pad[10:9]),
    .sr(rst_n),
    .q(led_pad[10:9]));  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
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
    .clk(clk_24m_pad),
    .d({led_pad[12],led_pad[15]}),
    .sr(rst_n),
    .q({led_pad[12],led_pad[15]}));  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
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
    .clk(clk_24m_pad),
    .d({led_pad[13],led_pad[14]}),
    .sr(rst_n),
    .q({led_pad[13],led_pad[14]}));  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
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
    .clk(clk_24m_pad),
    .d({led_pad[3],led_pad[5]}),
    .sr(rst_n),
    .q({led_pad[3],led_pad[5]}));  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
  // sources/rtl/buttons_led.v(63)
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
    .clk(clk_24m_pad),
    .d({led_pad[6],led_pad[8]}),
    .sr(rst_n),
    .q({led_pad[6],led_pad[8]}));  // sources/rtl/buttons_led.v(63)
  \debounce(N=5)  ux_btn (
    .clk(clk_24m_pad),
    .key(btn),
    .rst_n(rst_n),
    .key_pulse(key_pulse));  // sources/rtl/buttons_led.v(34)
  rst_n ux_rst (
    .clk(clk_24m_pad),
    .rst_n(rst_n));  // sources/rtl/buttons_led.v(42)

endmodule 

module \debounce(N=5)   // sources/rtl/debounce.v(14)
  (
  clk,
  key,
  rst_n,
  key_pulse
  );

  input clk;  // sources/rtl/debounce.v(20)
  input [4:0] key;  // sources/rtl/debounce.v(23)
  input rst_n;  // sources/rtl/debounce.v(21)
  output [4:0] key_pulse;  // sources/rtl/debounce.v(24)

  parameter CNT_20MS = 19'b1110101011000000001;
  parameter N = 5;
  wire [18:0] cnt;  // sources/rtl/debounce.v(27)
  wire [4:0] key_sec;  // sources/rtl/debounce.v(40)
  wire [4:0] key_sec_pre;  // sources/rtl/debounce.v(39)
  wire [18:0] n2;
  wire _al_u10_o;
  wire _al_u5_o;
  wire _al_u6_o;
  wire _al_u7_o;
  wire _al_u8_o;
  wire _al_u9_o;
  wire \add0/c11 ;
  wire \add0/c15 ;
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire n1;

  // sources/rtl/debounce.v(55)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u10|reg0_b2  (
    .b({_al_u8_o,open_n2}),
    .c({_al_u9_o,key_sec[2]}),
    .clk(clk),
    .d({_al_u7_o,key_sec_pre[2]}),
    .mi({open_n7,key_sec[2]}),
    .sr(rst_n),
    .f({_al_u10_o,key_pulse[2]}),
    .q({open_n22,key_sec_pre[2]}));  // sources/rtl/debounce.v(55)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~D*C*~B*A)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~D*C*~B*A)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000000000100000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000000000100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u5|_al_u11  (
    .a({cnt[12],open_n23}),
    .b({cnt[13],_al_u5_o}),
    .c({cnt[14],_al_u6_o}),
    .d({cnt[15],_al_u10_o}),
    .f({_al_u5_o,n1}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*A)"),
    //.LUTG0("(~D*C*~B*A)"),
    .INIT_LUTF0(16'b0000000000100000),
    .INIT_LUTG0(16'b0000000000100000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    _al_u6 (
    .a({open_n48,cnt[0]}),
    .b({open_n49,cnt[1]}),
    .c({open_n50,cnt[10]}),
    .d({open_n53,cnt[11]}),
    .f({open_n71,_al_u6_o}));
  // sources/rtl/debounce.v(36)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B*A))"),
    //.LUT1("(C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111111100000000),
    .INIT_LUT1(16'b0000000000110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u7|reg1_b9  (
    .a({open_n77,_al_u10_o}),
    .b({cnt[8],_al_u5_o}),
    .c({cnt[9],_al_u6_o}),
    .clk(clk),
    .d({cnt[7],n2[9]}),
    .sr(rst_n),
    .f({_al_u7_o,open_n91}),
    .q({open_n95,cnt[9]}));  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B*A))"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111111100000000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u8|reg1_b6  (
    .a({cnt[3],_al_u10_o}),
    .b({cnt[4],_al_u5_o}),
    .c({cnt[5],_al_u6_o}),
    .clk(clk),
    .d({cnt[6],n2[6]}),
    .sr(rst_n),
    .f({_al_u8_o,open_n109}),
    .q({open_n113,cnt[6]}));  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B*A))"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(D*~(C*B*A))"),
    //.LUTG1("(~D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111111100000000),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b0111111100000000),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u9|reg1_b2  (
    .a({cnt[16],_al_u10_o}),
    .b({cnt[17],_al_u5_o}),
    .c({cnt[18],_al_u6_o}),
    .clk(clk),
    .d({cnt[2],n2[2]}),
    .sr(rst_n),
    .f({_al_u9_o,open_n131}),
    .q({open_n135,cnt[2]}));  // sources/rtl/debounce.v(36)
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u31"),
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
    \add0/u11_al_u34  (
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
    //.MACRO("add0/ucin_al_u31"),
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
    \add0/u15_al_u35  (
    .a({cnt[17],cnt[15]}),
    .b({cnt[18],cnt[16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c15 ),
    .f({n2[17],n2[15]}),
    .fx({n2[18],n2[16]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u31"),
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
    \add0/u3_al_u32  (
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
    //.MACRO("add0/ucin_al_u31"),
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
    \add0/u7_al_u33  (
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
    //.MACRO("add0/ucin_al_u31"),
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
    \add0/ucin_al_u31  (
    .a({cnt[1],1'b0}),
    .b({cnt[2],cnt[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n2[1],open_n226}),
    .fco(\add0/c3 ),
    .fx({n2[2],n2[0]}));
  // sources/rtl/debounce.v(55)
  // sources/rtl/debounce.v(55)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b0|reg0_b4  (
    .c({key_sec[0],key_sec[4]}),
    .clk(clk),
    .d({key_sec_pre[0],key_sec_pre[4]}),
    .mi({key_sec[0],key_sec[4]}),
    .sr(rst_n),
    .f({key_pulse[0],key_pulse[4]}),
    .q({key_sec_pre[0],key_sec_pre[4]}));  // sources/rtl/debounce.v(55)
  // sources/rtl/debounce.v(55)
  // sources/rtl/debounce.v(55)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b1|reg0_b3  (
    .c({key_sec[1],key_sec[3]}),
    .clk(clk),
    .d({key_sec_pre[1],key_sec_pre[3]}),
    .mi({key_sec[1],key_sec[3]}),
    .sr(rst_n),
    .f({key_pulse[1],key_pulse[3]}),
    .q({key_sec_pre[1],key_sec_pre[3]}));  // sources/rtl/debounce.v(55)
  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B*A))"),
    //.LUT1("(D*~(C*B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111111100000000),
    .INIT_LUT1(16'b0111111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b0|reg1_b8  (
    .a({_al_u10_o,_al_u10_o}),
    .b({_al_u5_o,_al_u5_o}),
    .c({_al_u6_o,_al_u6_o}),
    .clk(clk),
    .d({n2[0],n2[8]}),
    .sr(rst_n),
    .q({cnt[0],cnt[8]}));  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B*A))"),
    //.LUT1("(D*~(C*B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111111100000000),
    .INIT_LUT1(16'b0111111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b10|reg1_b7  (
    .a({_al_u10_o,_al_u10_o}),
    .b({_al_u5_o,_al_u5_o}),
    .c({_al_u6_o,_al_u6_o}),
    .clk(clk),
    .d({n2[10],n2[7]}),
    .sr(rst_n),
    .q({cnt[10],cnt[7]}));  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B*A))"),
    //.LUT1("(D*~(C*B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111111100000000),
    .INIT_LUT1(16'b0111111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b11|reg1_b5  (
    .a({_al_u10_o,_al_u10_o}),
    .b({_al_u5_o,_al_u5_o}),
    .c({_al_u6_o,_al_u6_o}),
    .clk(clk),
    .d({n2[11],n2[5]}),
    .sr(rst_n),
    .q({cnt[11],cnt[5]}));  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B*A))"),
    //.LUT1("(D*~(C*B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111111100000000),
    .INIT_LUT1(16'b0111111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b12|reg1_b4  (
    .a({_al_u10_o,_al_u10_o}),
    .b({_al_u5_o,_al_u5_o}),
    .c({_al_u6_o,_al_u6_o}),
    .clk(clk),
    .d({n2[12],n2[4]}),
    .sr(rst_n),
    .q({cnt[12],cnt[4]}));  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B*A))"),
    //.LUTF1("(D*~(C*B*A))"),
    //.LUTG0("(D*~(C*B*A))"),
    //.LUTG1("(D*~(C*B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111111100000000),
    .INIT_LUTF1(16'b0111111100000000),
    .INIT_LUTG0(16'b0111111100000000),
    .INIT_LUTG1(16'b0111111100000000),
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
    .a({_al_u10_o,_al_u10_o}),
    .b({_al_u5_o,_al_u5_o}),
    .c({_al_u6_o,_al_u6_o}),
    .clk(clk),
    .d({n2[13],n2[3]}),
    .sr(rst_n),
    .q({cnt[13],cnt[3]}));  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B*A))"),
    //.LUT1("(D*~(C*B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111111100000000),
    .INIT_LUT1(16'b0111111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b14|reg1_b18  (
    .a({_al_u10_o,_al_u10_o}),
    .b({_al_u5_o,_al_u5_o}),
    .c({_al_u6_o,_al_u6_o}),
    .clk(clk),
    .d({n2[14],n2[18]}),
    .sr(rst_n),
    .q({cnt[14],cnt[18]}));  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B*A))"),
    //.LUT1("(D*~(C*B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111111100000000),
    .INIT_LUT1(16'b0111111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b15|reg1_b17  (
    .a({_al_u10_o,_al_u10_o}),
    .b({_al_u5_o,_al_u5_o}),
    .c({_al_u6_o,_al_u6_o}),
    .clk(clk),
    .d({n2[15],n2[17]}),
    .sr(rst_n),
    .q({cnt[15],cnt[17]}));  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  // sources/rtl/debounce.v(36)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B*A))"),
    //.LUTF1("(D*~(C*B*A))"),
    //.LUTG0("(D*~(C*B*A))"),
    //.LUTG1("(D*~(C*B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111111100000000),
    .INIT_LUTF1(16'b0111111100000000),
    .INIT_LUTG0(16'b0111111100000000),
    .INIT_LUTG1(16'b0111111100000000),
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
    .a({_al_u10_o,_al_u10_o}),
    .b({_al_u5_o,_al_u5_o}),
    .c({_al_u6_o,_al_u6_o}),
    .clk(clk),
    .d({n2[1],n2[16]}),
    .sr(rst_n),
    .q({cnt[1],cnt[16]}));  // sources/rtl/debounce.v(36)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("H14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("CE"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("INV"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("SET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    reg2_b0_IN (
    .ce(n1),
    .ipad(key[0]),
    .ipclk(clk),
    .rst(rst_n),
    .diq({open_n426,open_n427,open_n428,key_sec[0]}));  // sources/rtl/debounce.v(47)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("J13"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("CE"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("INV"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("SET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    reg2_b1_IN (
    .ce(n1),
    .ipad(key[1]),
    .ipclk(clk),
    .rst(rst_n),
    .diq({open_n440,open_n441,open_n442,key_sec[1]}));  // sources/rtl/debounce.v(47)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("G11"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("CE"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("INV"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("SET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    reg2_b2_IN (
    .ce(n1),
    .ipad(key[2]),
    .ipclk(clk),
    .rst(rst_n),
    .diq({open_n454,open_n455,open_n456,key_sec[2]}));  // sources/rtl/debounce.v(47)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("G12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("CE"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("INV"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("SET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    reg2_b3_IN (
    .ce(n1),
    .ipad(key[3]),
    .ipclk(clk),
    .rst(rst_n),
    .diq({open_n468,open_n469,open_n470,key_sec[3]}));  // sources/rtl/debounce.v(47)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("L12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("CE"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("INV"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("SET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    reg2_b4_IN (
    .ce(n1),
    .ipad(key[4]),
    .ipclk(clk),
    .rst(rst_n),
    .diq({open_n482,open_n483,open_n484,key_sec[4]}));  // sources/rtl/debounce.v(47)

endmodule 

module rst_n  // sources/rtl/rst.v(14)
  (
  clk,
  rst_n
  );

  input clk;  // sources/rtl/rst.v(16)
  output rst_n;  // sources/rtl/rst.v(17)

  wire [3:0] cnt;  // sources/rtl/rst.v(20)
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
    .a({cnt[0],1'b0}),
    .b({1'b1,open_n0}),
    .clk(clk),
    .sr(n0),
    .fco(\add0/c1 ),
    .q({cnt[0],open_n22}));
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
    .a(cnt[2:1]),
    .b(2'b00),
    .clk(clk),
    .fci(\add0/c1 ),
    .sr(n0),
    .fco(\add0/c3 ),
    .q(cnt[2:1]));
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
    .a({open_n43,cnt[3]}),
    .b({open_n44,1'b0}),
    .clk(clk),
    .fci(\add0/c3 ),
    .sr(n0),
    .q({open_n66,cnt[3]}));
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
    .a({open_n67,cnt[0]}),
    .b({open_n68,cnt[1]}),
    .c({open_n69,cnt[2]}),
    .clk(clk),
    .d({open_n71,cnt[3]}),
    .f({open_n89,n0}),
    .q({open_n93,rst_n}));  // sources/rtl/rst.v(36)

endmodule 

