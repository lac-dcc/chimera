// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Thu Aug  8 16:54:13 2019

`timescale 1ns / 1ps
module running_led  // sources/rtl/running_led.v(14)
  (
  clk_24m,
  led
  );

  input clk_24m;  // sources/rtl/running_led.v(16)
  output [15:0] led;  // sources/rtl/running_led.v(17)

  parameter CNT = 25'b0101101110001101100000000;
  wire [24:0] cnt_time;  // sources/rtl/running_led.v(37)
  wire [15:0] led_pad;  // sources/rtl/running_led.v(17)
  wire [24:0] n1;
  wire _al_u34_o;
  wire _al_u35_o;
  wire _al_u36_o;
  wire _al_u37_o;
  wire _al_u39_o;
  wire _al_u40_o;
  wire _al_u41_o;
  wire _al_u42_o;
  wire _al_u43_o;
  wire _al_u44_o;
  wire _al_u45_o;
  wire _al_u46_o;
  wire \add0/c11 ;
  wire \add0/c15 ;
  wire \add0/c19 ;
  wire \add0/c23 ;
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire clk_24m_pad;  // sources/rtl/running_led.v(16)
  wire flag;  // sources/rtl/running_led.v(38)
  wire n0;
  wire n5;

  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u0 (
    .ipad(clk_24m),
    .di(clk_24m_pad));  // sources/rtl/running_led.v(16)
  EG_PHY_PAD #(
    //.LOCATION("T13"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u1 (
    .do({open_n18,open_n19,open_n20,led_pad[15]}),
    .opad(led[15]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("N5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u10 (
    .do({open_n35,open_n36,open_n37,led_pad[6]}),
    .opad(led[6]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("P4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u11 (
    .do({open_n52,open_n53,open_n54,led_pad[5]}),
    .opad(led[5]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("M5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u12 (
    .do({open_n69,open_n70,open_n71,led_pad[4]}),
    .opad(led[4]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("N4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u13 (
    .do({open_n86,open_n87,open_n88,led_pad[3]}),
    .opad(led[3]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("N3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u14 (
    .do({open_n103,open_n104,open_n105,led_pad[2]}),
    .opad(led[2]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("M4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u15 (
    .do({open_n120,open_n121,open_n122,led_pad[1]}),
    .opad(led[1]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("M3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u16 (
    .do({open_n137,open_n138,open_n139,led_pad[0]}),
    .opad(led[0]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("T12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u2 (
    .do({open_n154,open_n155,open_n156,led_pad[14]}),
    .opad(led[14]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("R12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u3 (
    .do({open_n171,open_n172,open_n173,led_pad[13]}),
    .opad(led[13]));  // sources/rtl/running_led.v(17)
  // sources/rtl/running_led.v(84)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011001100),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b1111000011001100),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u34|reg0_b13  (
    .a({led_pad[12],open_n187}),
    .b(led_pad[13:12]),
    .c({led_pad[14],led_pad[14]}),
    .ce(n0),
    .clk(clk_24m_pad),
    .d({led_pad[15],flag}),
    .sr(n5),
    .f({_al_u34_o,open_n204}),
    .q({open_n208,led_pad[13]}));  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000011001100),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u35|reg0_b2  (
    .a({led_pad[0],open_n209}),
    .b({led_pad[1],led_pad[1]}),
    .c({led_pad[10],led_pad[3]}),
    .ce(n0),
    .clk(clk_24m_pad),
    .d({led_pad[11],flag}),
    .sr(n5),
    .f({_al_u35_o,open_n222}),
    .q({open_n226,led_pad[2]}));  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000011001100),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u36|reg0_b8  (
    .a({led_pad[6],open_n227}),
    .b({led_pad[7],led_pad[7]}),
    .c({led_pad[8],led_pad[9]}),
    .ce(n0),
    .clk(clk_24m_pad),
    .d({led_pad[9],flag}),
    .sr(n5),
    .f({_al_u36_o,open_n240}),
    .q({open_n244,led_pad[8]}));  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000011001100),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u37|reg0_b3  (
    .a({led_pad[2],open_n245}),
    .b(led_pad[3:2]),
    .c({led_pad[4],led_pad[4]}),
    .ce(n0),
    .clk(clk_24m_pad),
    .d({led_pad[5],flag}),
    .sr(n5),
    .f({_al_u37_o,open_n258}),
    .q({open_n262,led_pad[3]}));  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(57)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*~D)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111100001111),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u38|flag_reg  (
    .a({_al_u34_o,open_n263}),
    .b({_al_u35_o,open_n264}),
    .c({_al_u36_o,led_pad[15]}),
    .clk(clk_24m_pad),
    .d({_al_u37_o,flag}),
    .sr(led_pad[0]),
    .f({n5,open_n278}),
    .q({open_n282,flag}));  // sources/rtl/running_led.v(57)
  EG_PHY_PAD #(
    //.LOCATION("M7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u4 (
    .do({open_n284,open_n285,open_n286,led_pad[12]}),
    .opad(led[12]));  // sources/rtl/running_led.v(17)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTG0("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    _al_u42 (
    .c({open_n304,cnt_time[1]}),
    .d({open_n307,cnt_time[0]}),
    .f({open_n325,_al_u42_o}));
  // sources/rtl/running_led.v(47)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*~B*A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(D*C*~B*A)"),
    //.LUTG1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0010000000000000),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b0010000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u46|reg1_b18  (
    .a({_al_u42_o,cnt_time[18]}),
    .b({_al_u43_o,cnt_time[19]}),
    .c({_al_u44_o,cnt_time[2]}),
    .clk(clk_24m_pad),
    .d({_al_u45_o,cnt_time[20]}),
    .mi({open_n335,n1[18]}),
    .sr(n0),
    .f({_al_u46_o,_al_u44_o}),
    .q({open_n350,cnt_time[18]}));  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u47|reg1_b3  (
    .a({_al_u46_o,cnt_time[3]}),
    .b({_al_u39_o,cnt_time[4]}),
    .c({_al_u40_o,cnt_time[5]}),
    .clk(clk_24m_pad),
    .d({_al_u41_o,cnt_time[6]}),
    .mi({open_n362,n1[3]}),
    .sr(n0),
    .f({n0,_al_u40_o}),
    .q({open_n366,cnt_time[3]}));  // sources/rtl/running_led.v(47)
  EG_PHY_PAD #(
    //.LOCATION("T9"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u5 (
    .do({open_n368,open_n369,open_n370,led_pad[11]}),
    .opad(led[11]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("T8"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u6 (
    .do({open_n385,open_n386,open_n387,led_pad[10]}),
    .opad(led[10]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("T7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u7 (
    .do({open_n402,open_n403,open_n404,led_pad[9]}),
    .opad(led[9]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("R7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u8 (
    .do({open_n419,open_n420,open_n421,led_pad[8]}),
    .opad(led[8]));  // sources/rtl/running_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("P5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u9 (
    .do({open_n436,open_n437,open_n438,led_pad[7]}),
    .opad(led[7]));  // sources/rtl/running_led.v(17)
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u48"),
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
    \add0/u11_al_u51  (
    .a({cnt_time[13],cnt_time[11]}),
    .b({cnt_time[14],cnt_time[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c11 ),
    .f({n1[13],n1[11]}),
    .fco(\add0/c15 ),
    .fx({n1[14],n1[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u48"),
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
    \add0/u15_al_u52  (
    .a({cnt_time[17],cnt_time[15]}),
    .b({cnt_time[18],cnt_time[16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c15 ),
    .f({n1[17],n1[15]}),
    .fco(\add0/c19 ),
    .fx({n1[18],n1[16]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u48"),
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
    \add0/u19_al_u53  (
    .a({cnt_time[21],cnt_time[19]}),
    .b({cnt_time[22],cnt_time[20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c19 ),
    .f({n1[21],n1[19]}),
    .fco(\add0/c23 ),
    .fx({n1[22],n1[20]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u48"),
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
    \add0/u23_al_u54  (
    .a({open_n506,cnt_time[23]}),
    .b({open_n507,cnt_time[24]}),
    .c(2'b00),
    .d({open_n510,1'b0}),
    .e({open_n511,1'b0}),
    .fci(\add0/c23 ),
    .f({open_n526,n1[23]}),
    .fx({open_n528,n1[24]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u48"),
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
    \add0/u3_al_u49  (
    .a({cnt_time[5],cnt_time[3]}),
    .b({cnt_time[6],cnt_time[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n1[5],n1[3]}),
    .fco(\add0/c7 ),
    .fx({n1[6],n1[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u48"),
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
    \add0/u7_al_u50  (
    .a({cnt_time[9],cnt_time[7]}),
    .b({cnt_time[10],cnt_time[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n1[9],n1[7]}),
    .fco(\add0/c11 ),
    .fx({n1[10],n1[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u48"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
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
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \add0/ucin_al_u48  (
    .a({cnt_time[1],1'b0}),
    .b({cnt_time[2],cnt_time[0]}),
    .c(2'b00),
    .clk(clk_24m_pad),
    .d(2'b01),
    .e(2'b01),
    .mi(n1[1:0]),
    .sr(n0),
    .f({n1[1],open_n580}),
    .fco(\add0/c3 ),
    .fx({n1[2],n1[0]}),
    .q(cnt_time[1:0]));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    //.LUT1("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110011110000),
    .INIT_LUT1(16'b1100110011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg0_b10|reg0_b9  (
    .b(led_pad[11:10]),
    .c(led_pad[9:8]),
    .ce(n0),
    .clk(clk_24m_pad),
    .d({flag,flag}),
    .sr(n5),
    .q(led_pad[10:9]));  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011001100),
    .INIT_LUTF1(16'b1111000011001100),
    .INIT_LUTG0(16'b1111000011001100),
    .INIT_LUTG1(16'b1111000011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg0_b11|reg0_b12  (
    .b({led_pad[10],led_pad[11]}),
    .c({led_pad[12],led_pad[13]}),
    .ce(n0),
    .clk(clk_24m_pad),
    .d({flag,flag}),
    .sr(n5),
    .q({led_pad[11],led_pad[12]}));  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    //.LUT1("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110011110000),
    .INIT_LUT1(16'b1111000011001100),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg0_b14|reg0_b15  (
    .b({led_pad[13],led_pad[0]}),
    .c(led_pad[15:14]),
    .ce(n0),
    .clk(clk_24m_pad),
    .d({flag,flag}),
    .sr(n5),
    .q({led_pad[14],led_pad[15]}));  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    //.LUT1("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110011110000),
    .INIT_LUT1(16'b1111000011001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg0_b1|reg0_b0  (
    .b({led_pad[0],led_pad[1]}),
    .c({led_pad[2],led_pad[15]}),
    .ce(n0),
    .clk(clk_24m_pad),
    .d({flag,flag}),
    .sr(n5),
    .q(led_pad[1:0]));  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000011001100),
    .INIT_LUT1(16'b1111000011001100),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg0_b4|reg0_b5  (
    .b({led_pad[3],led_pad[4]}),
    .c({led_pad[5],led_pad[6]}),
    .ce(n0),
    .clk(clk_24m_pad),
    .d({flag,flag}),
    .sr(n5),
    .q({led_pad[4],led_pad[5]}));  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000011001100),
    .INIT_LUT1(16'b1111000011001100),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg0_b6|reg0_b7  (
    .b({led_pad[5],led_pad[6]}),
    .c({led_pad[7],led_pad[8]}),
    .ce(n0),
    .clk(clk_24m_pad),
    .d({flag,flag}),
    .sr(n5),
    .q({led_pad[6],led_pad[7]}));  // sources/rtl/running_led.v(84)
  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*A)"),
    //.LUT1("(~D*C*B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000100000),
    .INIT_LUT1(16'b0000000001000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg1_b10|reg1_b21  (
    .a({cnt_time[10],cnt_time[21]}),
    .b({cnt_time[11],cnt_time[22]}),
    .c({cnt_time[12],cnt_time[23]}),
    .clk(clk_24m_pad),
    .d({cnt_time[13],cnt_time[24]}),
    .mi({n1[10],n1[21]}),
    .sr(n0),
    .f({_al_u43_o,_al_u41_o}),
    .q({cnt_time[10],cnt_time[21]}));  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg1_b11|reg1_b9  (
    .clk(clk_24m_pad),
    .mi({n1[11],n1[9]}),
    .sr(n0),
    .q({cnt_time[11],cnt_time[9]}));  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg1_b12|reg1_b8  (
    .clk(clk_24m_pad),
    .mi({n1[12],n1[8]}),
    .sr(n0),
    .q({cnt_time[12],cnt_time[8]}));  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg1_b13|reg1_b6  (
    .clk(clk_24m_pad),
    .mi({n1[13],n1[6]}),
    .sr(n0),
    .q({cnt_time[13],cnt_time[6]}));  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg1_b15|reg1_b5  (
    .clk(clk_24m_pad),
    .mi({n1[15],n1[5]}),
    .sr(n0),
    .q({cnt_time[15],cnt_time[5]}));  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg1_b16|reg1_b4  (
    .clk(clk_24m_pad),
    .mi({n1[16],n1[4]}),
    .sr(n0),
    .q({cnt_time[16],cnt_time[4]}));  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg1_b17|reg1_b24  (
    .clk(clk_24m_pad),
    .mi({n1[17],n1[24]}),
    .sr(n0),
    .q({cnt_time[17],cnt_time[24]}));  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg1_b19|reg1_b23  (
    .clk(clk_24m_pad),
    .mi({n1[19],n1[23]}),
    .sr(n0),
    .q({cnt_time[19],cnt_time[23]}));  // sources/rtl/running_led.v(47)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    reg1_b2 (
    .clk(clk_24m_pad),
    .mi({open_n959,n1[2]}),
    .sr(n0),
    .q({open_n965,cnt_time[2]}));  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg1_b20|reg1_b22  (
    .clk(clk_24m_pad),
    .mi({n1[20],n1[22]}),
    .sr(n0),
    .q({cnt_time[20],cnt_time[22]}));  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  // sources/rtl/running_led.v(47)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*~B*~A)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(D*C*~B*~A)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0001000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg1_b7|reg1_b14  (
    .a({open_n994,cnt_time[14]}),
    .b({cnt_time[8],cnt_time[15]}),
    .c({cnt_time[9],cnt_time[16]}),
    .clk(clk_24m_pad),
    .d({cnt_time[7],cnt_time[17]}),
    .mi({n1[7],n1[14]}),
    .sr(n0),
    .f({_al_u39_o,_al_u45_o}),
    .q({cnt_time[7],cnt_time[14]}));  // sources/rtl/running_led.v(47)

endmodule 

