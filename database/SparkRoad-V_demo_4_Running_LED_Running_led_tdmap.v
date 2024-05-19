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
  wire [15:0] n6;
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
  wire \add0/c0 ;
  wire \add0/c1 ;
  wire \add0/c10 ;
  wire \add0/c11 ;
  wire \add0/c12 ;
  wire \add0/c13 ;
  wire \add0/c14 ;
  wire \add0/c15 ;
  wire \add0/c16 ;
  wire \add0/c17 ;
  wire \add0/c18 ;
  wire \add0/c19 ;
  wire \add0/c2 ;
  wire \add0/c20 ;
  wire \add0/c21 ;
  wire \add0/c22 ;
  wire \add0/c23 ;
  wire \add0/c24 ;
  wire \add0/c3 ;
  wire \add0/c4 ;
  wire \add0/c5 ;
  wire \add0/c6 ;
  wire \add0/c7 ;
  wire \add0/c8 ;
  wire \add0/c9 ;
  wire clk_24m_pad;  // sources/rtl/running_led.v(16)
  wire flag;  // sources/rtl/running_led.v(38)
  wire flag_d;
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
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    _al_u17 (
    .a(flag),
    .b(led_pad[10]),
    .c(led_pad[12]),
    .o(n6[11]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    _al_u18 (
    .a(flag),
    .b(led_pad[11]),
    .c(led_pad[13]),
    .o(n6[12]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    _al_u19 (
    .a(flag),
    .b(led_pad[0]),
    .c(led_pad[14]),
    .o(n6[15]));
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
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    _al_u20 (
    .a(flag),
    .b(led_pad[12]),
    .c(led_pad[14]),
    .o(n6[13]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    _al_u21 (
    .a(flag),
    .b(led_pad[13]),
    .c(led_pad[15]),
    .o(n6[14]));
  AL_MAP_LUT2 #(
    .EQN("~(B*~A)"),
    .INIT(4'hb))
    _al_u22 (
    .a(flag),
    .b(led_pad[15]),
    .o(flag_d));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    _al_u23 (
    .a(flag),
    .b(led_pad[1]),
    .c(led_pad[15]),
    .o(n6[0]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    _al_u24 (
    .a(flag),
    .b(led_pad[0]),
    .c(led_pad[2]),
    .o(n6[1]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    _al_u25 (
    .a(flag),
    .b(led_pad[1]),
    .c(led_pad[3]),
    .o(n6[2]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    _al_u26 (
    .a(flag),
    .b(led_pad[2]),
    .c(led_pad[4]),
    .o(n6[3]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    _al_u27 (
    .a(flag),
    .b(led_pad[3]),
    .c(led_pad[5]),
    .o(n6[4]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    _al_u28 (
    .a(flag),
    .b(led_pad[4]),
    .c(led_pad[6]),
    .o(n6[5]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    _al_u29 (
    .a(flag),
    .b(led_pad[5]),
    .c(led_pad[7]),
    .o(n6[6]));
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
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    _al_u30 (
    .a(flag),
    .b(led_pad[10]),
    .c(led_pad[8]),
    .o(n6[9]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    _al_u31 (
    .a(flag),
    .b(led_pad[6]),
    .c(led_pad[8]),
    .o(n6[7]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    _al_u32 (
    .a(flag),
    .b(led_pad[7]),
    .c(led_pad[9]),
    .o(n6[8]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    _al_u33 (
    .a(flag),
    .b(led_pad[11]),
    .c(led_pad[9]),
    .o(n6[10]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u34 (
    .a(led_pad[12]),
    .b(led_pad[13]),
    .c(led_pad[14]),
    .d(led_pad[15]),
    .o(_al_u34_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u35 (
    .a(led_pad[0]),
    .b(led_pad[1]),
    .c(led_pad[10]),
    .d(led_pad[11]),
    .o(_al_u35_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u36 (
    .a(led_pad[6]),
    .b(led_pad[7]),
    .c(led_pad[8]),
    .d(led_pad[9]),
    .o(_al_u36_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u37 (
    .a(led_pad[2]),
    .b(led_pad[3]),
    .c(led_pad[4]),
    .d(led_pad[5]),
    .o(_al_u37_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u38 (
    .a(_al_u34_o),
    .b(_al_u35_o),
    .c(_al_u36_o),
    .d(_al_u37_o),
    .o(n5));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u39 (
    .a(cnt_time[7]),
    .b(cnt_time[8]),
    .c(cnt_time[9]),
    .o(_al_u39_o));
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
    .do({open_n188,open_n189,open_n190,led_pad[12]}),
    .opad(led[12]));  // sources/rtl/running_led.v(17)
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u40 (
    .a(cnt_time[3]),
    .b(cnt_time[4]),
    .c(cnt_time[5]),
    .d(cnt_time[6]),
    .o(_al_u40_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    _al_u41 (
    .a(cnt_time[21]),
    .b(cnt_time[22]),
    .c(cnt_time[23]),
    .d(cnt_time[24]),
    .o(_al_u41_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u42 (
    .a(cnt_time[0]),
    .b(cnt_time[1]),
    .o(_al_u42_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*~A)"),
    .INIT(16'h0040))
    _al_u43 (
    .a(cnt_time[10]),
    .b(cnt_time[11]),
    .c(cnt_time[12]),
    .d(cnt_time[13]),
    .o(_al_u43_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    _al_u44 (
    .a(cnt_time[18]),
    .b(cnt_time[19]),
    .c(cnt_time[2]),
    .d(cnt_time[20]),
    .o(_al_u44_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*~A)"),
    .INIT(16'h1000))
    _al_u45 (
    .a(cnt_time[14]),
    .b(cnt_time[15]),
    .c(cnt_time[16]),
    .d(cnt_time[17]),
    .o(_al_u45_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u46 (
    .a(_al_u42_o),
    .b(_al_u43_o),
    .c(_al_u44_o),
    .d(_al_u45_o),
    .o(_al_u46_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u47 (
    .a(_al_u46_o),
    .b(_al_u39_o),
    .c(_al_u40_o),
    .d(_al_u41_o),
    .o(n0));
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
    .do({open_n205,open_n206,open_n207,led_pad[11]}),
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
    .do({open_n222,open_n223,open_n224,led_pad[10]}),
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
    .do({open_n239,open_n240,open_n241,led_pad[9]}),
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
    .do({open_n256,open_n257,open_n258,led_pad[8]}),
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
    .do({open_n273,open_n274,open_n275,led_pad[7]}),
    .opad(led[7]));  // sources/rtl/running_led.v(17)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(cnt_time[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n1[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(cnt_time[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n1[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u10  (
    .a(cnt_time[10]),
    .b(1'b0),
    .c(\add0/c10 ),
    .o({\add0/c11 ,n1[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u11  (
    .a(cnt_time[11]),
    .b(1'b0),
    .c(\add0/c11 ),
    .o({\add0/c12 ,n1[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u12  (
    .a(cnt_time[12]),
    .b(1'b0),
    .c(\add0/c12 ),
    .o({\add0/c13 ,n1[12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u13  (
    .a(cnt_time[13]),
    .b(1'b0),
    .c(\add0/c13 ),
    .o({\add0/c14 ,n1[13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u14  (
    .a(cnt_time[14]),
    .b(1'b0),
    .c(\add0/c14 ),
    .o({\add0/c15 ,n1[14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u15  (
    .a(cnt_time[15]),
    .b(1'b0),
    .c(\add0/c15 ),
    .o({\add0/c16 ,n1[15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u16  (
    .a(cnt_time[16]),
    .b(1'b0),
    .c(\add0/c16 ),
    .o({\add0/c17 ,n1[16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u17  (
    .a(cnt_time[17]),
    .b(1'b0),
    .c(\add0/c17 ),
    .o({\add0/c18 ,n1[17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u18  (
    .a(cnt_time[18]),
    .b(1'b0),
    .c(\add0/c18 ),
    .o({\add0/c19 ,n1[18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u19  (
    .a(cnt_time[19]),
    .b(1'b0),
    .c(\add0/c19 ),
    .o({\add0/c20 ,n1[19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(cnt_time[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n1[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u20  (
    .a(cnt_time[20]),
    .b(1'b0),
    .c(\add0/c20 ),
    .o({\add0/c21 ,n1[20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u21  (
    .a(cnt_time[21]),
    .b(1'b0),
    .c(\add0/c21 ),
    .o({\add0/c22 ,n1[21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u22  (
    .a(cnt_time[22]),
    .b(1'b0),
    .c(\add0/c22 ),
    .o({\add0/c23 ,n1[22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u23  (
    .a(cnt_time[23]),
    .b(1'b0),
    .c(\add0/c23 ),
    .o({\add0/c24 ,n1[23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u24  (
    .a(cnt_time[24]),
    .b(1'b0),
    .c(\add0/c24 ),
    .o({open_n289,n1[24]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(cnt_time[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({\add0/c4 ,n1[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u4  (
    .a(cnt_time[4]),
    .b(1'b0),
    .c(\add0/c4 ),
    .o({\add0/c5 ,n1[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u5  (
    .a(cnt_time[5]),
    .b(1'b0),
    .c(\add0/c5 ),
    .o({\add0/c6 ,n1[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u6  (
    .a(cnt_time[6]),
    .b(1'b0),
    .c(\add0/c6 ),
    .o({\add0/c7 ,n1[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u7  (
    .a(cnt_time[7]),
    .b(1'b0),
    .c(\add0/c7 ),
    .o({\add0/c8 ,n1[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u8  (
    .a(cnt_time[8]),
    .b(1'b0),
    .c(\add0/c8 ),
    .o({\add0/c9 ,n1[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u9  (
    .a(cnt_time[9]),
    .b(1'b0),
    .c(\add0/c9 ),
    .o({\add0/c10 ,n1[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n292}));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  reg_sr_as_w1 flag_reg (
    .clk(clk_24m_pad),
    .d(flag_d),
    .en(1'b1),
    .reset(~led_pad[0]),
    .set(1'b0),
    .q(flag));  // sources/rtl/running_led.v(57)
  reg_sr_as_w1 reg0_b0 (
    .clk(clk_24m_pad),
    .d(n6[0]),
    .en(n0),
    .reset(n5),
    .set(1'b0),
    .q(led_pad[0]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b1 (
    .clk(clk_24m_pad),
    .d(n6[1]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[1]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b10 (
    .clk(clk_24m_pad),
    .d(n6[10]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[10]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b11 (
    .clk(clk_24m_pad),
    .d(n6[11]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[11]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b12 (
    .clk(clk_24m_pad),
    .d(n6[12]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[12]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b13 (
    .clk(clk_24m_pad),
    .d(n6[13]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[13]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b14 (
    .clk(clk_24m_pad),
    .d(n6[14]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[14]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b15 (
    .clk(clk_24m_pad),
    .d(n6[15]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[15]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b2 (
    .clk(clk_24m_pad),
    .d(n6[2]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[2]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b3 (
    .clk(clk_24m_pad),
    .d(n6[3]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[3]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b4 (
    .clk(clk_24m_pad),
    .d(n6[4]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[4]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b5 (
    .clk(clk_24m_pad),
    .d(n6[5]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[5]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b6 (
    .clk(clk_24m_pad),
    .d(n6[6]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[6]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b7 (
    .clk(clk_24m_pad),
    .d(n6[7]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[7]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b8 (
    .clk(clk_24m_pad),
    .d(n6[8]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[8]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b9 (
    .clk(clk_24m_pad),
    .d(n6[9]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led_pad[9]));  // sources/rtl/running_led.v(84)
  reg_sr_as_w1 reg1_b0 (
    .clk(clk_24m_pad),
    .d(n1[0]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[0]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b1 (
    .clk(clk_24m_pad),
    .d(n1[1]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[1]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b10 (
    .clk(clk_24m_pad),
    .d(n1[10]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[10]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b11 (
    .clk(clk_24m_pad),
    .d(n1[11]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[11]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b12 (
    .clk(clk_24m_pad),
    .d(n1[12]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[12]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b13 (
    .clk(clk_24m_pad),
    .d(n1[13]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[13]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b14 (
    .clk(clk_24m_pad),
    .d(n1[14]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[14]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b15 (
    .clk(clk_24m_pad),
    .d(n1[15]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[15]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b16 (
    .clk(clk_24m_pad),
    .d(n1[16]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[16]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b17 (
    .clk(clk_24m_pad),
    .d(n1[17]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[17]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b18 (
    .clk(clk_24m_pad),
    .d(n1[18]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[18]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b19 (
    .clk(clk_24m_pad),
    .d(n1[19]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[19]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b2 (
    .clk(clk_24m_pad),
    .d(n1[2]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[2]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b20 (
    .clk(clk_24m_pad),
    .d(n1[20]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[20]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b21 (
    .clk(clk_24m_pad),
    .d(n1[21]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[21]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b22 (
    .clk(clk_24m_pad),
    .d(n1[22]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[22]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b23 (
    .clk(clk_24m_pad),
    .d(n1[23]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[23]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b24 (
    .clk(clk_24m_pad),
    .d(n1[24]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[24]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b3 (
    .clk(clk_24m_pad),
    .d(n1[3]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[3]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b4 (
    .clk(clk_24m_pad),
    .d(n1[4]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[4]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b5 (
    .clk(clk_24m_pad),
    .d(n1[5]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[5]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b6 (
    .clk(clk_24m_pad),
    .d(n1[6]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[6]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b7 (
    .clk(clk_24m_pad),
    .d(n1[7]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[7]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b8 (
    .clk(clk_24m_pad),
    .d(n1[8]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[8]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b9 (
    .clk(clk_24m_pad),
    .d(n1[9]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[9]));  // sources/rtl/running_led.v(47)

endmodule 

module reg_sr_as_w1
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
  wire resetout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset0 (
    .i0(enout),
    .i1(1'b0),
    .sel(reset),
    .o(resetout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(resetout),
    .reset(1'b0),
    .set(set),
    .q(q));

endmodule 

module reg_ar_ss_w1
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
  wire setout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(setout),
    .reset(reset),
    .set(1'b0),
    .q(q));
  AL_MUX u_set0 (
    .i0(enout),
    .i1(1'b1),
    .sel(set),
    .o(setout));

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

