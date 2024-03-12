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
  wire [24:0] n3;
  wire _al_u10_o;
  wire _al_u11_o;
  wire _al_u12_o;
  wire _al_u4_o;
  wire _al_u5_o;
  wire _al_u6_o;
  wire _al_u7_o;
  wire _al_u8_o;
  wire _al_u9_o;
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
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u10 (
    .a(cnt_time[18]),
    .b(cnt_time[19]),
    .c(cnt_time[2]),
    .d(cnt_time[20]),
    .o(_al_u10_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u11 (
    .a(cnt_time[14]),
    .b(cnt_time[15]),
    .c(cnt_time[16]),
    .d(cnt_time[17]),
    .o(_al_u11_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u12 (
    .a(_al_u8_o),
    .b(_al_u9_o),
    .c(_al_u10_o),
    .d(_al_u11_o),
    .o(_al_u12_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u13 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .o(n1));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u14 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[9]),
    .o(n3[9]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u15 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[8]),
    .o(n3[8]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u16 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[7]),
    .o(n3[7]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u17 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[6]),
    .o(n3[6]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u18 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[5]),
    .o(n3[5]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u19 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[4]),
    .o(n3[4]));
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
    .do({open_n35,open_n36,open_n37,led_g_pad}),
    .opad(led_g));  // sources/rtl/rgb_led.v(17)
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u20 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[3]),
    .o(n3[3]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u21 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[24]),
    .o(n3[24]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u22 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[23]),
    .o(n3[23]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u23 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[22]),
    .o(n3[22]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u24 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[21]),
    .o(n3[21]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u25 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[20]),
    .o(n3[20]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u26 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[2]),
    .o(n3[2]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u27 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[19]),
    .o(n3[19]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u28 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[18]),
    .o(n3[18]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u29 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[17]),
    .o(n3[17]));
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
    .do({open_n52,open_n53,open_n54,led_r_pad}),
    .opad(led_r));  // sources/rtl/rgb_led.v(16)
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u30 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[16]),
    .o(n3[16]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u31 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[15]),
    .o(n3[15]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u32 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[14]),
    .o(n3[14]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u33 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[13]),
    .o(n3[13]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u34 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[12]),
    .o(n3[12]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u35 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[11]),
    .o(n3[11]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u36 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[10]),
    .o(n3[10]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u37 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[1]),
    .o(n3[1]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u38 (
    .a(_al_u7_o),
    .b(_al_u12_o),
    .c(n2[0]),
    .o(n3[0]));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u4 (
    .a(cnt_time[7]),
    .b(cnt_time[8]),
    .c(cnt_time[9]),
    .o(_al_u4_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u5 (
    .a(cnt_time[3]),
    .b(cnt_time[4]),
    .c(cnt_time[5]),
    .d(cnt_time[6]),
    .o(_al_u5_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u6 (
    .a(cnt_time[21]),
    .b(cnt_time[22]),
    .c(cnt_time[23]),
    .d(cnt_time[24]),
    .o(_al_u6_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u7 (
    .a(_al_u4_o),
    .b(_al_u5_o),
    .c(_al_u6_o),
    .o(_al_u7_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u8 (
    .a(cnt_time[0]),
    .b(cnt_time[1]),
    .o(_al_u8_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    _al_u9 (
    .a(cnt_time[10]),
    .b(cnt_time[11]),
    .c(cnt_time[12]),
    .d(cnt_time[13]),
    .o(_al_u9_o));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(cnt_time[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n2[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(cnt_time[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n2[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u10  (
    .a(cnt_time[10]),
    .b(1'b0),
    .c(\add0/c10 ),
    .o({\add0/c11 ,n2[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u11  (
    .a(cnt_time[11]),
    .b(1'b0),
    .c(\add0/c11 ),
    .o({\add0/c12 ,n2[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u12  (
    .a(cnt_time[12]),
    .b(1'b0),
    .c(\add0/c12 ),
    .o({\add0/c13 ,n2[12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u13  (
    .a(cnt_time[13]),
    .b(1'b0),
    .c(\add0/c13 ),
    .o({\add0/c14 ,n2[13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u14  (
    .a(cnt_time[14]),
    .b(1'b0),
    .c(\add0/c14 ),
    .o({\add0/c15 ,n2[14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u15  (
    .a(cnt_time[15]),
    .b(1'b0),
    .c(\add0/c15 ),
    .o({\add0/c16 ,n2[15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u16  (
    .a(cnt_time[16]),
    .b(1'b0),
    .c(\add0/c16 ),
    .o({\add0/c17 ,n2[16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u17  (
    .a(cnt_time[17]),
    .b(1'b0),
    .c(\add0/c17 ),
    .o({\add0/c18 ,n2[17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u18  (
    .a(cnt_time[18]),
    .b(1'b0),
    .c(\add0/c18 ),
    .o({\add0/c19 ,n2[18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u19  (
    .a(cnt_time[19]),
    .b(1'b0),
    .c(\add0/c19 ),
    .o({\add0/c20 ,n2[19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(cnt_time[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n2[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u20  (
    .a(cnt_time[20]),
    .b(1'b0),
    .c(\add0/c20 ),
    .o({\add0/c21 ,n2[20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u21  (
    .a(cnt_time[21]),
    .b(1'b0),
    .c(\add0/c21 ),
    .o({\add0/c22 ,n2[21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u22  (
    .a(cnt_time[22]),
    .b(1'b0),
    .c(\add0/c22 ),
    .o({\add0/c23 ,n2[22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u23  (
    .a(cnt_time[23]),
    .b(1'b0),
    .c(\add0/c23 ),
    .o({\add0/c24 ,n2[23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u24  (
    .a(cnt_time[24]),
    .b(1'b0),
    .c(\add0/c24 ),
    .o({open_n68,n2[24]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(cnt_time[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({\add0/c4 ,n2[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u4  (
    .a(cnt_time[4]),
    .b(1'b0),
    .c(\add0/c4 ),
    .o({\add0/c5 ,n2[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u5  (
    .a(cnt_time[5]),
    .b(1'b0),
    .c(\add0/c5 ),
    .o({\add0/c6 ,n2[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u6  (
    .a(cnt_time[6]),
    .b(1'b0),
    .c(\add0/c6 ),
    .o({\add0/c7 ,n2[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u7  (
    .a(cnt_time[7]),
    .b(1'b0),
    .c(\add0/c7 ),
    .o({\add0/c8 ,n2[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u8  (
    .a(cnt_time[8]),
    .b(1'b0),
    .c(\add0/c8 ),
    .o({\add0/c9 ,n2[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u9  (
    .a(cnt_time[9]),
    .b(1'b0),
    .c(\add0/c9 ),
    .o({\add0/c10 ,n2[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n71}));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  reg_ar_as_w1 reg0_b0 (
    .clk(clk_24m_pad),
    .d(n3[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[0]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk_24m_pad),
    .d(n3[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[1]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b10 (
    .clk(clk_24m_pad),
    .d(n3[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[10]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b11 (
    .clk(clk_24m_pad),
    .d(n3[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[11]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b12 (
    .clk(clk_24m_pad),
    .d(n3[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[12]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b13 (
    .clk(clk_24m_pad),
    .d(n3[13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[13]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b14 (
    .clk(clk_24m_pad),
    .d(n3[14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[14]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b15 (
    .clk(clk_24m_pad),
    .d(n3[15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[15]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b16 (
    .clk(clk_24m_pad),
    .d(n3[16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[16]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b17 (
    .clk(clk_24m_pad),
    .d(n3[17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[17]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b18 (
    .clk(clk_24m_pad),
    .d(n3[18]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[18]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b19 (
    .clk(clk_24m_pad),
    .d(n3[19]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[19]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk_24m_pad),
    .d(n3[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[2]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b20 (
    .clk(clk_24m_pad),
    .d(n3[20]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[20]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b21 (
    .clk(clk_24m_pad),
    .d(n3[21]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[21]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b22 (
    .clk(clk_24m_pad),
    .d(n3[22]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[22]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b23 (
    .clk(clk_24m_pad),
    .d(n3[23]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[23]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b24 (
    .clk(clk_24m_pad),
    .d(n3[24]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[24]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk_24m_pad),
    .d(n3[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[3]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk_24m_pad),
    .d(n3[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[4]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk_24m_pad),
    .d(n3[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[5]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk_24m_pad),
    .d(n3[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[6]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk_24m_pad),
    .d(n3[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[7]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b8 (
    .clk(clk_24m_pad),
    .d(n3[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[8]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg0_b9 (
    .clk(clk_24m_pad),
    .d(n3[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_time[9]));  // sources/rtl/rgb_led.v(40)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk_24m_pad),
    .d(led_g_pad),
    .en(n1),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_r_pad));  // sources/rtl/rgb_led.v(50)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk_24m_pad),
    .d(led_b_pad),
    .en(n1),
    .reset(~rst_n),
    .set(1'b0),
    .q(led_g_pad));  // sources/rtl/rgb_led.v(50)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk_24m_pad),
    .d(led_r_pad),
    .en(n1),
    .reset(1'b0),
    .set(~rst_n),
    .q(led_b_pad));  // sources/rtl/rgb_led.v(50)
  rst_n ux_rst_n (
    .sclk(clk_24m_pad),
    .rst_n(rst_n));  // sources/rtl/rgb_led.v(24)

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

module rst_n  // sources/rtl/rst.v(9)
  (
  sclk,
  rst_n
  );

  input sclk;  // sources/rtl/rst.v(11)
  output rst_n;  // sources/rtl/rst.v(12)

  wire [3:0] counter;  // sources/rtl/rst.v(15)
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
    .q(counter[0]));  // sources/rtl/rst.v(23)
  reg_ar_ss_w1 reg0_b1 (
    .clk(sclk),
    .d(n1[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(n0),
    .q(counter[1]));  // sources/rtl/rst.v(23)
  reg_ar_ss_w1 reg0_b2 (
    .clk(sclk),
    .d(n1[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(n0),
    .q(counter[2]));  // sources/rtl/rst.v(23)
  reg_ar_ss_w1 reg0_b3 (
    .clk(sclk),
    .d(n1[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(n0),
    .q(counter[3]));  // sources/rtl/rst.v(23)
  reg_ar_as_w1 rst_n_reg (
    .clk(sclk),
    .d(n0),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rst_n));  // sources/rtl/rst.v(31)

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

