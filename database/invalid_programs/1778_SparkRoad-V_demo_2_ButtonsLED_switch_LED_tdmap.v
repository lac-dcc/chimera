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
  wire [2:0] n1;
  wire [2:0] n2;
  wire [2:0] n3;
  wire [2:0] n4;
  wire [3:0] n5;
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
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u47 (
    .a(key_pulse[1]),
    .b(key_pulse[0]),
    .o(mux3_b3_sel_is_2_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u48 (
    .a(key_pulse[2]),
    .b(key_pulse[1]),
    .c(key_pulse[0]),
    .o(mux3_b6_sel_is_2_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    _al_u49 (
    .a(key_pulse[2]),
    .b(key_pulse[1]),
    .c(key_pulse[0]),
    .o(_al_u49_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u50 (
    .a(_al_u49_o),
    .b(key_pulse[3]),
    .o(mux3_b10_sel_is_2_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u51 (
    .a(_al_u49_o),
    .b(key_pulse[4]),
    .c(key_pulse[3]),
    .o(mux3_b12_sel_is_2_o));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u52 (
    .a(led_pad[0]),
    .o(n1[0]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u53 (
    .a(led_pad[1]),
    .o(n1[1]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u54 (
    .a(led_pad[10]),
    .o(n4[1]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u55 (
    .a(led_pad[11]),
    .o(n4[2]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u56 (
    .a(led_pad[12]),
    .o(n5[0]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u57 (
    .a(led_pad[13]),
    .o(n5[1]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u58 (
    .a(led_pad[14]),
    .o(n5[2]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u59 (
    .a(led_pad[15]),
    .o(n5[3]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u60 (
    .a(led_pad[2]),
    .o(n1[2]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u61 (
    .a(led_pad[3]),
    .o(n2[0]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u62 (
    .a(led_pad[4]),
    .o(n2[1]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u63 (
    .a(led_pad[5]),
    .o(n2[2]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u64 (
    .a(led_pad[6]),
    .o(n3[0]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u65 (
    .a(led_pad[7]),
    .o(n3[1]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u66 (
    .a(led_pad[8]),
    .o(n3[2]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u67 (
    .a(led_pad[9]),
    .o(n4[0]));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  reg_ar_as_w1 reg0_b0 (
    .clk(clk_24M_pad),
    .d(n1[0]),
    .en(key_pulse[0]),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[0]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk_24M_pad),
    .d(n1[1]),
    .en(key_pulse[0]),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[1]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b10 (
    .clk(clk_24M_pad),
    .d(n4[1]),
    .en(mux3_b10_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[10]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b11 (
    .clk(clk_24M_pad),
    .d(n4[2]),
    .en(mux3_b10_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[11]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b12 (
    .clk(clk_24M_pad),
    .d(n5[0]),
    .en(mux3_b12_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[12]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b13 (
    .clk(clk_24M_pad),
    .d(n5[1]),
    .en(mux3_b12_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[13]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b14 (
    .clk(clk_24M_pad),
    .d(n5[2]),
    .en(mux3_b12_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[14]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b15 (
    .clk(clk_24M_pad),
    .d(n5[3]),
    .en(mux3_b12_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[15]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk_24M_pad),
    .d(n1[2]),
    .en(key_pulse[0]),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[2]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk_24M_pad),
    .d(n2[0]),
    .en(mux3_b3_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[3]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk_24M_pad),
    .d(n2[1]),
    .en(mux3_b3_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[4]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk_24M_pad),
    .d(n2[2]),
    .en(mux3_b3_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[5]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk_24M_pad),
    .d(n3[0]),
    .en(mux3_b6_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[6]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk_24M_pad),
    .d(n3[1]),
    .en(mux3_b6_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[7]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b8 (
    .clk(clk_24M_pad),
    .d(n3[2]),
    .en(mux3_b6_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[8]));  // Buttons_LED.v(54)
  reg_ar_as_w1 reg0_b9 (
    .clk(clk_24M_pad),
    .d(n4[0]),
    .en(mux3_b10_sel_is_2_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_pad[9]));  // Buttons_LED.v(54)
  \debounce(N=5)  ux_btn (
    .clk(clk_24M_pad),
    .key(btn),
    .rst(rst_n),
    .key_pulse(key_pulse));  // Buttons_LED.v(25)
  rst_int ux_rst (
    .sclk(clk_24M_pad),
    .rst_n(rst_n));  // Buttons_LED.v(32)

endmodule 

module reg_ar_as_w1
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

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(enout),
    .reset(reset),
    .set(set),
    .q(q));

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
  wire [18:0] n4;
  wire _al_u10_o;
  wire _al_u11_o;
  wire _al_u12_o;
  wire _al_u32_o;
  wire _al_u33_o;
  wire _al_u34_o;
  wire _al_u35_o;
  wire _al_u36_o;
  wire _al_u37_o;
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
  wire \add0/c2 ;
  wire \add0/c3 ;
  wire \add0/c4 ;
  wire \add0/c5 ;
  wire \add0/c6 ;
  wire \add0/c7 ;
  wire \add0/c8 ;
  wire \add0/c9 ;
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
  AL_MAP_LUT4 #(
    .EQN("(~(~D*B)*~(~C*A))"),
    .INIT(16'hf531))
    _al_u10 (
    .a(key_rst_pre[1]),
    .b(key_rst_pre[3]),
    .c(key_rst[1]),
    .d(key_rst[3]),
    .o(_al_u10_o));
  AL_MAP_LUT4 #(
    .EQN("(~(~D*B)*~(~C*A))"),
    .INIT(16'hf531))
    _al_u11 (
    .a(key_rst_pre[0]),
    .b(key_rst_pre[2]),
    .c(key_rst[0]),
    .d(key_rst[2]),
    .o(_al_u11_o));
  AL_MAP_LUT4 #(
    .EQN("(B*A*~(~D*C))"),
    .INIT(16'h8808))
    _al_u12 (
    .a(_al_u10_o),
    .b(_al_u11_o),
    .c(key_rst_pre[4]),
    .d(key_rst[4]),
    .o(_al_u12_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u13 (
    .a(_al_u12_o),
    .b(n3[9]),
    .o(n4[9]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u14 (
    .a(_al_u12_o),
    .b(n3[8]),
    .o(n4[8]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u15 (
    .a(_al_u12_o),
    .b(n3[7]),
    .o(n4[7]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u16 (
    .a(_al_u12_o),
    .b(n3[6]),
    .o(n4[6]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u17 (
    .a(_al_u12_o),
    .b(n3[5]),
    .o(n4[5]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u18 (
    .a(_al_u12_o),
    .b(n3[4]),
    .o(n4[4]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u19 (
    .a(_al_u12_o),
    .b(n3[3]),
    .o(n4[3]));
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
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u20 (
    .a(_al_u12_o),
    .b(n3[2]),
    .o(n4[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u21 (
    .a(_al_u12_o),
    .b(n3[18]),
    .o(n4[18]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u22 (
    .a(_al_u12_o),
    .b(n3[17]),
    .o(n4[17]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u23 (
    .a(_al_u12_o),
    .b(n3[16]),
    .o(n4[16]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u24 (
    .a(_al_u12_o),
    .b(n3[15]),
    .o(n4[15]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u25 (
    .a(_al_u12_o),
    .b(n3[14]),
    .o(n4[14]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u26 (
    .a(_al_u12_o),
    .b(n3[13]),
    .o(n4[13]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u27 (
    .a(_al_u12_o),
    .b(n3[12]),
    .o(n4[12]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u28 (
    .a(_al_u12_o),
    .b(n3[11]),
    .o(n4[11]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u29 (
    .a(_al_u12_o),
    .b(n3[10]),
    .o(n4[10]));
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
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u30 (
    .a(_al_u12_o),
    .b(n3[1]),
    .o(n4[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u31 (
    .a(_al_u12_o),
    .b(n3[0]),
    .o(n4[0]));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    _al_u32 (
    .a(cnt[12]),
    .b(cnt[13]),
    .c(cnt[14]),
    .d(cnt[15]),
    .o(_al_u32_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    _al_u33 (
    .a(cnt[0]),
    .b(cnt[1]),
    .c(cnt[10]),
    .d(cnt[11]),
    .o(_al_u33_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*~A)"),
    .INIT(8'h10))
    _al_u34 (
    .a(cnt[7]),
    .b(cnt[8]),
    .c(cnt[9]),
    .o(_al_u34_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u35 (
    .a(cnt[3]),
    .b(cnt[4]),
    .c(cnt[5]),
    .d(cnt[6]),
    .o(_al_u35_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u36 (
    .a(cnt[16]),
    .b(cnt[17]),
    .c(cnt[18]),
    .d(cnt[2]),
    .o(_al_u36_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u37 (
    .a(_al_u34_o),
    .b(_al_u35_o),
    .c(_al_u36_o),
    .o(_al_u37_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u38 (
    .a(_al_u37_o),
    .b(_al_u32_o),
    .c(_al_u33_o),
    .o(n6));
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
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u5 (
    .a(key_sec[0]),
    .b(key_sec_pre[0]),
    .o(key_pulse[0]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u6 (
    .a(key_sec[1]),
    .b(key_sec_pre[1]),
    .o(key_pulse[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u7 (
    .a(key_sec[2]),
    .b(key_sec_pre[2]),
    .o(key_pulse[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u8 (
    .a(key_sec[3]),
    .b(key_sec_pre[3]),
    .o(key_pulse[3]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u9 (
    .a(key_sec[4]),
    .b(key_sec_pre[4]),
    .o(key_pulse[4]));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(cnt[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n3[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(cnt[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n3[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u10  (
    .a(cnt[10]),
    .b(1'b0),
    .c(\add0/c10 ),
    .o({\add0/c11 ,n3[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u11  (
    .a(cnt[11]),
    .b(1'b0),
    .c(\add0/c11 ),
    .o({\add0/c12 ,n3[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u12  (
    .a(cnt[12]),
    .b(1'b0),
    .c(\add0/c12 ),
    .o({\add0/c13 ,n3[12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u13  (
    .a(cnt[13]),
    .b(1'b0),
    .c(\add0/c13 ),
    .o({\add0/c14 ,n3[13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u14  (
    .a(cnt[14]),
    .b(1'b0),
    .c(\add0/c14 ),
    .o({\add0/c15 ,n3[14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u15  (
    .a(cnt[15]),
    .b(1'b0),
    .c(\add0/c15 ),
    .o({\add0/c16 ,n3[15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u16  (
    .a(cnt[16]),
    .b(1'b0),
    .c(\add0/c16 ),
    .o({\add0/c17 ,n3[16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u17  (
    .a(cnt[17]),
    .b(1'b0),
    .c(\add0/c17 ),
    .o({\add0/c18 ,n3[17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u18  (
    .a(cnt[18]),
    .b(1'b0),
    .c(\add0/c18 ),
    .o({open_n85,n3[18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(cnt[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n3[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(cnt[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({\add0/c4 ,n3[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u4  (
    .a(cnt[4]),
    .b(1'b0),
    .c(\add0/c4 ),
    .o({\add0/c5 ,n3[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u5  (
    .a(cnt[5]),
    .b(1'b0),
    .c(\add0/c5 ),
    .o({\add0/c6 ,n3[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u6  (
    .a(cnt[6]),
    .b(1'b0),
    .c(\add0/c6 ),
    .o({\add0/c7 ,n3[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u7  (
    .a(cnt[7]),
    .b(1'b0),
    .c(\add0/c7 ),
    .o({\add0/c8 ,n3[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u8  (
    .a(cnt[8]),
    .b(1'b0),
    .c(\add0/c8 ),
    .o({\add0/c9 ,n3[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u9  (
    .a(cnt[9]),
    .b(1'b0),
    .c(\add0/c9 ),
    .o({\add0/c10 ,n3[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n88}));
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(key_rst[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst_pre[0]));  // debounce.v(27)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(key_rst[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst_pre[1]));  // debounce.v(27)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(key_rst[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst_pre[2]));  // debounce.v(27)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(key_rst[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst_pre[3]));  // debounce.v(27)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk),
    .d(key_rst[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst_pre[4]));  // debounce.v(27)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk),
    .d(n4[0]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[0]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk),
    .d(n4[1]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[1]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b10 (
    .clk(clk),
    .d(n4[10]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[10]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b11 (
    .clk(clk),
    .d(n4[11]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[11]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b12 (
    .clk(clk),
    .d(n4[12]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[12]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b13 (
    .clk(clk),
    .d(n4[13]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[13]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b14 (
    .clk(clk),
    .d(n4[14]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[14]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b15 (
    .clk(clk),
    .d(n4[15]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[15]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b16 (
    .clk(clk),
    .d(n4[16]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[16]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b17 (
    .clk(clk),
    .d(n4[17]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[17]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b18 (
    .clk(clk),
    .d(n4[18]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[18]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk),
    .d(n4[2]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[2]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk),
    .d(n4[3]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[3]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b4 (
    .clk(clk),
    .d(n4[4]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[4]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b5 (
    .clk(clk),
    .d(n4[5]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[5]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b6 (
    .clk(clk),
    .d(n4[6]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[6]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b7 (
    .clk(clk),
    .d(n4[7]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[7]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b8 (
    .clk(clk),
    .d(n4[8]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[8]));  // debounce.v(42)
  reg_ar_as_w1 reg1_b9 (
    .clk(clk),
    .d(n4[9]),
    .en(1'b1),
    .reset(~rst),
    .set(1'b0),
    .q(cnt[9]));  // debounce.v(42)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk),
    .d(key_pad[0]),
    .en(n6),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec[0]));  // debounce.v(55)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk),
    .d(key_pad[1]),
    .en(n6),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec[1]));  // debounce.v(55)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk),
    .d(key_pad[2]),
    .en(n6),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec[2]));  // debounce.v(55)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk),
    .d(key_pad[3]),
    .en(n6),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec[3]));  // debounce.v(55)
  reg_ar_as_w1 reg2_b4 (
    .clk(clk),
    .d(key_pad[4]),
    .en(n6),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec[4]));  // debounce.v(55)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk),
    .d(key_sec[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec_pre[0]));  // debounce.v(62)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk),
    .d(key_sec[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec_pre[1]));  // debounce.v(62)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk),
    .d(key_sec[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec_pre[2]));  // debounce.v(62)
  reg_ar_as_w1 reg3_b3 (
    .clk(clk),
    .d(key_sec[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec_pre[3]));  // debounce.v(62)
  reg_ar_as_w1 reg3_b4 (
    .clk(clk),
    .d(key_sec[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_sec_pre[4]));  // debounce.v(62)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk),
    .d(key_pad[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst[0]));  // debounce.v(27)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk),
    .d(key_pad[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst[1]));  // debounce.v(27)
  reg_ar_as_w1 reg4_b2 (
    .clk(clk),
    .d(key_pad[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst[2]));  // debounce.v(27)
  reg_ar_as_w1 reg4_b3 (
    .clk(clk),
    .d(key_pad[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst[3]));  // debounce.v(27)
  reg_ar_as_w1 reg4_b4 (
    .clk(clk),
    .d(key_pad[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst),
    .q(key_rst[4]));  // debounce.v(27)

endmodule 

module rst_int  // rst.v(9)
  (
  sclk,
  rst_n
  );

  input sclk;  // rst.v(11)
  output rst_n;  // rst.v(12)

  wire [3:0] counter;  // rst.v(15)
  wire [3:0] n1;
  wire \add0/c0 ;
  wire \add0/c1 ;
  wire \add0/c2 ;
  wire \add0/c3 ;
  wire n0;

  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u0 (
    .a(counter[0]),
    .b(counter[1]),
    .c(counter[2]),
    .d(counter[3]),
    .o(n0));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(counter[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n1[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(counter[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n1[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(counter[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n1[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(counter[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({open_n0,n1[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n3}));
  reg_ar_ss_w1 reg0_b0 (
    .clk(sclk),
    .d(n1[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(n0),
    .q(counter[0]));  // rst.v(23)
  reg_ar_ss_w1 reg0_b1 (
    .clk(sclk),
    .d(n1[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(n0),
    .q(counter[1]));  // rst.v(23)
  reg_ar_ss_w1 reg0_b2 (
    .clk(sclk),
    .d(n1[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(n0),
    .q(counter[2]));  // rst.v(23)
  reg_ar_ss_w1 reg0_b3 (
    .clk(sclk),
    .d(n1[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(n0),
    .q(counter[3]));  // rst.v(23)
  reg_ar_as_w1 rst_n_reg (
    .clk(sclk),
    .d(n0),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rst_n));  // rst.v(31)

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

