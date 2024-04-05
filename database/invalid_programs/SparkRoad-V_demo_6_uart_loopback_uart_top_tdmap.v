// Verilog netlist created by TD v4.6.12906
// Thu Aug  8 15:34:41 2019

`timescale 1ns / 1ps
module uart_top  // source/rtl/uart_top.v(15)
  (
  ext_clk_25m,
  ext_rst_n,
  uart_rx,
  uart_tx
  );

  input ext_clk_25m;  // source/rtl/uart_top.v(21)
  input ext_rst_n;  // source/rtl/uart_top.v(22)
  input uart_rx;  // source/rtl/uart_top.v(23)
  output uart_tx;  // source/rtl/uart_top.v(24)

  parameter BPS_SET = 96;
  parameter CLK_PERIORD = 40;
  wire [7:0] rx_data;  // source/rtl/uart_top.v(36)
  wire bps_start1;  // source/rtl/uart_top.v(34)
  wire bps_start2;  // source/rtl/uart_top.v(34)
  wire clk_25m;  // source/rtl/uart_top.v(28)
  wire clk_bps1;  // source/rtl/uart_top.v(35)
  wire clk_bps2;  // source/rtl/uart_top.v(35)
  wire ext_clk_25m_pad;  // source/rtl/uart_top.v(21)
  wire ext_rst_n_pad;  // source/rtl/uart_top.v(22)
  wire n0;
  wire rx_int;  // source/rtl/uart_top.v(37)
  wire sys_rst_n;  // source/rtl/uart_top.v(31)

  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u0 (
    .ipad(ext_clk_25m),
    .di(ext_clk_25m_pad));  // source/rtl/uart_top.v(21)
  EG_PHY_PAD #(
    //.LOCATION("L12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u1 (
    .ipad(ext_rst_n),
    .di(ext_rst_n_pad));  // source/rtl/uart_top.v(22)
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u2 (
    .a(ext_rst_n_pad),
    .o(n0));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  my_uart_rx my_uart_rx (
    .clk(clk_25m),
    .clk_bps(clk_bps1),
    .rst_n(sys_rst_n),
    .uart_rx(uart_rx),
    .bps_start(bps_start1),
    .rx_data(rx_data),
    .rx_int(rx_int));  // source/rtl/uart_top.v(67)
  my_uart_tx my_uart_tx (
    .clk(clk_25m),
    .clk_bps(clk_bps2),
    .rst_n(sys_rst_n),
    .rx_data(rx_data),
    .rx_int(rx_int),
    .bps_start(bps_start2),
    .uart_tx(uart_tx));  // source/rtl/uart_top.v(95)
  speed_setting_1 speed_rx (
    .bps_start(bps_start1),
    .clk(clk_25m),
    .rst_n(sys_rst_n),
    .clk_bps(clk_bps1));  // source/rtl/uart_top.v(57)
  speed_setting speed_tx (
    .bps_start(bps_start2),
    .clk(clk_25m),
    .rst_n(sys_rst_n),
    .clk_bps(clk_bps2));  // source/rtl/uart_top.v(86)
  pll_test u_pll_test (
    .refclk(ext_clk_25m_pad),
    .reset(n0),
    .clk0_out(clk_25m),
    .extlock(sys_rst_n));  // source/rtl/uart_top.v(41)

endmodule 

module my_uart_rx  // source/rtl/my_uart_rx.v(1)
  (
  clk,
  clk_bps,
  rst_n,
  uart_rx,
  bps_start,
  rx_data,
  rx_int
  );

  input clk;  // source/rtl/my_uart_rx.v(3)
  input clk_bps;  // source/rtl/my_uart_rx.v(8)
  input rst_n;  // source/rtl/my_uart_rx.v(4)
  input uart_rx;  // source/rtl/my_uart_rx.v(5)
  output bps_start;  // source/rtl/my_uart_rx.v(9)
  output [7:0] rx_data;  // source/rtl/my_uart_rx.v(6)
  output rx_int;  // source/rtl/my_uart_rx.v(7)

  wire [3:0] n18;
  wire [3:0] n32;
  wire [3:0] num;  // source/rtl/my_uart_rx.v(38)
  wire [7:0] rx_temp_data;  // source/rtl/my_uart_rx.v(64)
  wire _al_n0_en;
  wire _al_u23_o;
  wire _al_u27_o;
  wire _al_u32_o;
  wire \add0/c0 ;
  wire \add0/c1 ;
  wire \add0/c2 ;
  wire \add0/c3 ;
  wire mux6_b0_sel_is_3_o;
  wire mux6_b1_sel_is_3_o;
  wire mux6_b2_sel_is_3_o;
  wire mux6_b3_sel_is_3_o;
  wire mux6_b4_sel_is_3_o;
  wire mux6_b5_sel_is_3_o;
  wire mux6_b6_sel_is_3_o;
  wire mux6_b7_sel_is_3_o;
  wire mux7_b0_sel_is_3_o;
  wire n10;
  wire n14;
  wire n14_d;
  wire n6_lutinv;
  wire neg_uart_rx;  // source/rtl/my_uart_rx.v(14)
  wire uart_rx0;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx1;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx2;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx3;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx_pad;  // source/rtl/my_uart_rx.v(5)

  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u19 (
    .a(n10),
    .b(n14),
    .o(bps_start));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*~A)"),
    .INIT(16'h1000))
    _al_u20 (
    .a(uart_rx0),
    .b(uart_rx1),
    .c(uart_rx2),
    .d(uart_rx3),
    .o(neg_uart_rx));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u21 (
    .a(num[0]),
    .b(num[1]),
    .c(num[2]),
    .d(num[3]),
    .o(n6_lutinv));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u22 (
    .a(neg_uart_rx),
    .b(n6_lutinv),
    .o(_al_n0_en));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u23 (
    .a(clk_bps),
    .b(num[2]),
    .c(num[3]),
    .d(rx_int),
    .o(_al_u23_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u24 (
    .a(_al_u23_o),
    .b(num[0]),
    .c(num[1]),
    .o(mux6_b0_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u25 (
    .a(_al_u23_o),
    .b(num[0]),
    .c(num[1]),
    .o(mux6_b2_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u26 (
    .a(_al_u23_o),
    .b(num[0]),
    .c(num[1]),
    .o(mux6_b1_sel_is_3_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u27 (
    .a(clk_bps),
    .b(num[2]),
    .c(num[3]),
    .d(rx_int),
    .o(_al_u27_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u28 (
    .a(_al_u27_o),
    .b(num[0]),
    .c(num[1]),
    .o(mux6_b6_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u29 (
    .a(_al_u27_o),
    .b(num[0]),
    .c(num[1]),
    .o(mux6_b5_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u30 (
    .a(_al_u27_o),
    .b(num[0]),
    .c(num[1]),
    .o(mux6_b4_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u31 (
    .a(_al_u27_o),
    .b(num[0]),
    .c(num[1]),
    .o(mux6_b3_sel_is_3_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    _al_u32 (
    .a(clk_bps),
    .b(num[2]),
    .c(num[3]),
    .d(rx_int),
    .o(_al_u32_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u33 (
    .a(_al_u32_o),
    .b(num[0]),
    .c(num[1]),
    .o(mux6_b7_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("~(~C*~B*~A)"),
    .INIT(8'hfe))
    _al_u34 (
    .a(neg_uart_rx),
    .b(n6_lutinv),
    .c(n14),
    .o(n14_d));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u35 (
    .a(n6_lutinv),
    .b(clk_bps),
    .c(rx_int),
    .o(mux7_b0_sel_is_3_o));
  AL_MAP_LUT4 #(
    .EQN("((D*~A)*~(C)*~(B)+(D*~A)*C*~(B)+~((D*~A))*C*B+(D*~A)*C*B)"),
    .INIT(16'hd1c0))
    _al_u36 (
    .a(n6_lutinv),
    .b(clk_bps),
    .c(n18[3]),
    .d(num[3]),
    .o(n32[3]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    _al_u37 (
    .a(clk_bps),
    .b(n18[2]),
    .c(num[2]),
    .o(n32[2]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    _al_u38 (
    .a(clk_bps),
    .b(n18[1]),
    .c(num[1]),
    .o(n32[1]));
  AL_MAP_LUT4 #(
    .EQN("((D*~A)*~(C)*~(B)+(D*~A)*C*~(B)+~((D*~A))*C*B+(D*~A)*C*B)"),
    .INIT(16'hd1c0))
    _al_u39 (
    .a(n6_lutinv),
    .b(clk_bps),
    .c(n18[0]),
    .d(num[0]),
    .o(n32[0]));
  EG_PHY_PAD #(
    //.LOCATION("B15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u7 (
    .ipad(uart_rx),
    .di(uart_rx_pad));  // source/rtl/my_uart_rx.v(5)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(num[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n18[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(num[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n18[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(num[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n18[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(num[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({open_n17,n18[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n20}));
  reg_ar_as_w1 bps_start_r_reg (
    .clk(clk),
    .d(neg_uart_rx),
    .en(_al_n0_en),
    .reset(~rst_n),
    .set(1'b0),
    .q(n10));  // source/rtl/my_uart_rx.v(57)
  reg_ar_as_w1 i30 (
    .clk(clk),
    .d(n14_d),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(n14));  // source/rtl/my_uart_rx.v(57)
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(uart_rx_pad),
    .en(mux6_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[0]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(uart_rx_pad),
    .en(mux6_b1_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[1]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(uart_rx_pad),
    .en(mux6_b2_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[2]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(uart_rx_pad),
    .en(mux6_b3_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[3]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk),
    .d(uart_rx_pad),
    .en(mux6_b4_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[4]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk),
    .d(uart_rx_pad),
    .en(mux6_b5_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[5]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk),
    .d(uart_rx_pad),
    .en(mux6_b6_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[6]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk),
    .d(uart_rx_pad),
    .en(mux6_b7_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[7]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk),
    .d(n32[0]),
    .en(rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(num[0]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk),
    .d(n32[1]),
    .en(rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(num[1]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk),
    .d(n32[2]),
    .en(rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(num[2]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk),
    .d(n32[3]),
    .en(rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(num[3]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk),
    .d(rx_temp_data[0]),
    .en(mux7_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_data[0]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk),
    .d(rx_temp_data[1]),
    .en(mux7_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_data[1]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk),
    .d(rx_temp_data[2]),
    .en(mux7_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_data[2]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk),
    .d(rx_temp_data[3]),
    .en(mux7_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_data[3]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg2_b4 (
    .clk(clk),
    .d(rx_temp_data[4]),
    .en(mux7_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_data[4]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg2_b5 (
    .clk(clk),
    .d(rx_temp_data[5]),
    .en(mux7_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_data[5]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg2_b6 (
    .clk(clk),
    .d(rx_temp_data[6]),
    .en(mux7_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_data[6]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg2_b7 (
    .clk(clk),
    .d(rx_temp_data[7]),
    .en(mux7_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_data[7]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 rx_int_reg (
    .clk(clk),
    .d(neg_uart_rx),
    .en(_al_n0_en),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_int));  // source/rtl/my_uart_rx.v(57)
  reg_ar_as_w1 uart_rx0_reg (
    .clk(clk),
    .d(uart_rx_pad),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(uart_rx0));  // source/rtl/my_uart_rx.v(31)
  reg_ar_as_w1 uart_rx1_reg (
    .clk(clk),
    .d(uart_rx0),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(uart_rx1));  // source/rtl/my_uart_rx.v(31)
  reg_ar_as_w1 uart_rx2_reg (
    .clk(clk),
    .d(uart_rx1),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(uart_rx2));  // source/rtl/my_uart_rx.v(31)
  reg_ar_as_w1 uart_rx3_reg (
    .clk(clk),
    .d(uart_rx2),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(uart_rx3));  // source/rtl/my_uart_rx.v(31)

endmodule 

module my_uart_tx  // source/rtl/my_uart_tx.v(1)
  (
  clk,
  clk_bps,
  rst_n,
  rx_data,
  rx_int,
  bps_start,
  uart_tx
  );

  input clk;  // source/rtl/my_uart_tx.v(3)
  input clk_bps;  // source/rtl/my_uart_tx.v(8)
  input rst_n;  // source/rtl/my_uart_tx.v(4)
  input [7:0] rx_data;  // source/rtl/my_uart_tx.v(5)
  input rx_int;  // source/rtl/my_uart_tx.v(6)
  output bps_start;  // source/rtl/my_uart_tx.v(9)
  output uart_tx;  // source/rtl/my_uart_tx.v(7)

  wire [3:0] n11;
  wire [3:0] n14;
  wire [3:0] num;  // source/rtl/my_uart_tx.v(38)
  wire [7:0] tx_data;  // source/rtl/my_uart_tx.v(35)
  wire _al_n0_en;
  wire _al_u3_o;
  wire _al_u4_o;
  wire _al_u5_o;
  wire _al_u6_o;
  wire _al_u7_o;
  wire _al_u8_o;
  wire _al_u9_o;
  wire \add0/c0 ;
  wire \add0/c1 ;
  wire \add0/c2 ;
  wire \add0/c3 ;
  wire n12;
  wire n2_lutinv;
  wire n6;
  wire n8;
  wire n8_d;
  wire neg_rx_int;  // source/rtl/my_uart_tx.v(14)
  wire rx_int0;  // source/rtl/my_uart_tx.v(13)
  wire rx_int1;  // source/rtl/my_uart_tx.v(13)
  wire rx_int2;  // source/rtl/my_uart_tx.v(13)
  wire tx_en;  // source/rtl/my_uart_tx.v(37)
  wire u13_sel_is_3_o;

  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u0 (
    .a(n6),
    .b(n8),
    .o(bps_start));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u1 (
    .a(clk_bps),
    .b(tx_en),
    .o(u13_sel_is_3_o));
  AL_MAP_LUT4 #(
    .EQN("~(~(~B*~A)*~(C)*~(D)+~(~B*~A)*C*~(D)+~(~(~B*~A))*C*D+~(~B*~A)*C*D)"),
    .INIT(16'h0f11))
    _al_u10 (
    .a(_al_u5_o),
    .b(_al_u8_o),
    .c(_al_u9_o),
    .d(num[3]),
    .o(n12));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*~A)"),
    .INIT(16'h0400))
    _al_u11 (
    .a(num[0]),
    .b(num[1]),
    .c(num[2]),
    .d(num[3]),
    .o(n2_lutinv));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u12 (
    .a(neg_rx_int),
    .b(n2_lutinv),
    .o(_al_n0_en));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u13 (
    .a(_al_n0_en),
    .b(n8),
    .o(n8_d));
  AL_MAP_LUT4 #(
    .EQN("((~D*C)*~(B)*~(A)+(~D*C)*B*~(A)+~((~D*C))*B*A+(~D*C)*B*A)"),
    .INIT(16'h88d8))
    _al_u14 (
    .a(clk_bps),
    .b(n11[3]),
    .c(num[3]),
    .d(n2_lutinv),
    .o(n14[3]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    _al_u15 (
    .a(clk_bps),
    .b(n11[2]),
    .c(num[2]),
    .o(n14[2]));
  AL_MAP_LUT4 #(
    .EQN("((D*~A)*~(C)*~(B)+(D*~A)*C*~(B)+~((D*~A))*C*B+(D*~A)*C*B)"),
    .INIT(16'hd1c0))
    _al_u16 (
    .a(n2_lutinv),
    .b(clk_bps),
    .c(n11[1]),
    .d(num[1]),
    .o(n14[1]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    _al_u17 (
    .a(clk_bps),
    .b(n11[0]),
    .c(num[0]),
    .o(n14[0]));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u2 (
    .a(rx_int1),
    .b(rx_int2),
    .o(neg_rx_int));
  AL_MAP_LUT4 #(
    .EQN("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h3500))
    _al_u3 (
    .a(tx_data[5]),
    .b(tx_data[6]),
    .c(num[0]),
    .d(num[1]),
    .o(_al_u3_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h0035))
    _al_u4 (
    .a(tx_data[3]),
    .b(tx_data[4]),
    .c(num[0]),
    .d(num[1]),
    .o(_al_u4_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~(~B*~A))"),
    .INIT(8'he0))
    _al_u5 (
    .a(_al_u3_o),
    .b(_al_u4_o),
    .c(num[2]),
    .o(_al_u5_o));
  AL_MAP_LUT4 #(
    .EQN("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hca00))
    _al_u6 (
    .a(tx_data[1]),
    .b(tx_data[2]),
    .c(num[0]),
    .d(num[1]),
    .o(_al_u6_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(~C*B*A))"),
    .INIT(16'h00f7))
    _al_u7 (
    .a(tx_data[0]),
    .b(num[0]),
    .c(num[1]),
    .d(num[2]),
    .o(_al_u7_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u8 (
    .a(_al_u6_o),
    .b(_al_u7_o),
    .o(_al_u8_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u9 (
    .a(tx_data[7]),
    .b(num[0]),
    .c(num[1]),
    .d(num[2]),
    .o(_al_u9_o));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(num[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n11[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(num[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n11[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(num[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n11[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(num[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({open_n0,n11[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n3}));
  reg_ar_as_w1 bps_start_r_reg (
    .clk(clk),
    .d(neg_rx_int),
    .en(_al_n0_en),
    .reset(~rst_n),
    .set(1'b0),
    .q(n6));  // source/rtl/my_uart_tx.v(58)
  reg_ar_as_w1 i28 (
    .clk(clk),
    .d(n8_d),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(n8));  // source/rtl/my_uart_tx.v(58)
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(rx_data[0]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[0]));  // source/rtl/my_uart_tx.v(58)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(rx_data[1]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[1]));  // source/rtl/my_uart_tx.v(58)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(rx_data[2]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[2]));  // source/rtl/my_uart_tx.v(58)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(rx_data[3]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[3]));  // source/rtl/my_uart_tx.v(58)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk),
    .d(rx_data[4]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[4]));  // source/rtl/my_uart_tx.v(58)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk),
    .d(rx_data[5]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[5]));  // source/rtl/my_uart_tx.v(58)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk),
    .d(rx_data[6]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[6]));  // source/rtl/my_uart_tx.v(58)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk),
    .d(rx_data[7]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[7]));  // source/rtl/my_uart_tx.v(58)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk),
    .d(n14[0]),
    .en(tx_en),
    .reset(~rst_n),
    .set(1'b0),
    .q(num[0]));  // source/rtl/my_uart_tx.v(94)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk),
    .d(n14[1]),
    .en(tx_en),
    .reset(~rst_n),
    .set(1'b0),
    .q(num[1]));  // source/rtl/my_uart_tx.v(94)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk),
    .d(n14[2]),
    .en(tx_en),
    .reset(~rst_n),
    .set(1'b0),
    .q(num[2]));  // source/rtl/my_uart_tx.v(94)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk),
    .d(n14[3]),
    .en(tx_en),
    .reset(~rst_n),
    .set(1'b0),
    .q(num[3]));  // source/rtl/my_uart_tx.v(94)
  reg_ar_as_w1 rx_int0_reg (
    .clk(clk),
    .d(rx_int),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_int0));  // source/rtl/my_uart_tx.v(29)
  reg_ar_as_w1 rx_int1_reg (
    .clk(clk),
    .d(rx_int0),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_int1));  // source/rtl/my_uart_tx.v(29)
  reg_ar_as_w1 rx_int2_reg (
    .clk(clk),
    .d(rx_int1),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_int2));  // source/rtl/my_uart_tx.v(29)
  reg_ar_as_w1 tx_en_reg (
    .clk(clk),
    .d(neg_rx_int),
    .en(_al_n0_en),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_en));  // source/rtl/my_uart_tx.v(58)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("C11"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    uart_tx_r_reg_DO (
    .ce(u13_sel_is_3_o),
    .do({open_n4,open_n5,open_n6,n12}),
    .osclk(clk),
    .rst(rst_n),
    .opad(uart_tx));  // source/rtl/my_uart_tx.v(94)

endmodule 

module speed_setting_1  // source/rtl/speed_setting.v(1)
  (
  bps_start,
  clk,
  rst_n,
  clk_bps
  );

  input bps_start;  // source/rtl/speed_setting.v(9)
  input clk;  // source/rtl/speed_setting.v(7)
  input rst_n;  // source/rtl/speed_setting.v(8)
  output clk_bps;  // source/rtl/speed_setting.v(10)

  parameter BPS_SET = 96;
  parameter CLK_PERIORD = 40;
  wire [12:0] cnt;  // source/rtl/speed_setting.v(16)
  wire [12:0] n4;
  wire [12:0] n5;
  wire _al_u1_o;
  wire _al_u2_o;
  wire _al_u3_o;
  wire _al_u4_o;
  wire _al_u6_o;
  wire _al_u7_o;
  wire _al_u8_o;
  wire \add0/c0 ;
  wire \add0/c1 ;
  wire \add0/c10 ;
  wire \add0/c11 ;
  wire \add0/c12 ;
  wire \add0/c2 ;
  wire \add0/c3 ;
  wire \add0/c4 ;
  wire \add0/c5 ;
  wire \add0/c6 ;
  wire \add0/c7 ;
  wire \add0/c8 ;
  wire \add0/c9 ;
  wire n6;

  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u1 (
    .a(cnt[11]),
    .b(cnt[3]),
    .c(cnt[4]),
    .d(cnt[5]),
    .o(_al_u1_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u10 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[8]),
    .o(n5[8]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u11 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[7]),
    .o(n5[7]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u12 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[6]),
    .o(n5[6]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u13 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[5]),
    .o(n5[5]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u14 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[4]),
    .o(n5[4]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u15 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[3]),
    .o(n5[3]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u16 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[2]),
    .o(n5[2]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u17 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[12]),
    .o(n5[12]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u18 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[11]),
    .o(n5[11]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u19 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[10]),
    .o(n5[10]));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*~A)"),
    .INIT(8'h10))
    _al_u2 (
    .a(cnt[0]),
    .b(cnt[12]),
    .c(cnt[2]),
    .o(_al_u2_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u20 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[1]),
    .o(n5[1]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u21 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[0]),
    .o(n5[0]));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u3 (
    .a(cnt[6]),
    .b(cnt[7]),
    .o(_al_u3_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u4 (
    .a(_al_u2_o),
    .b(_al_u3_o),
    .c(cnt[8]),
    .d(cnt[9]),
    .o(_al_u4_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u5 (
    .a(_al_u4_o),
    .b(_al_u1_o),
    .c(cnt[1]),
    .d(cnt[10]),
    .o(n6));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u6 (
    .a(cnt[11]),
    .b(cnt[3]),
    .c(cnt[4]),
    .d(cnt[5]),
    .o(_al_u6_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u7 (
    .a(_al_u6_o),
    .b(cnt[1]),
    .c(cnt[10]),
    .o(_al_u7_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u8 (
    .a(_al_u2_o),
    .b(_al_u3_o),
    .c(cnt[8]),
    .d(cnt[9]),
    .o(_al_u8_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u9 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[9]),
    .o(n5[9]));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(cnt[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n4[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(cnt[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n4[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u10  (
    .a(cnt[10]),
    .b(1'b0),
    .c(\add0/c10 ),
    .o({\add0/c11 ,n4[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u11  (
    .a(cnt[11]),
    .b(1'b0),
    .c(\add0/c11 ),
    .o({\add0/c12 ,n4[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u12  (
    .a(cnt[12]),
    .b(1'b0),
    .c(\add0/c12 ),
    .o({open_n0,n4[12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(cnt[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n4[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(cnt[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({\add0/c4 ,n4[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u4  (
    .a(cnt[4]),
    .b(1'b0),
    .c(\add0/c4 ),
    .o({\add0/c5 ,n4[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u5  (
    .a(cnt[5]),
    .b(1'b0),
    .c(\add0/c5 ),
    .o({\add0/c6 ,n4[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u6  (
    .a(cnt[6]),
    .b(1'b0),
    .c(\add0/c6 ),
    .o({\add0/c7 ,n4[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u7  (
    .a(cnt[7]),
    .b(1'b0),
    .c(\add0/c7 ),
    .o({\add0/c8 ,n4[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u8  (
    .a(cnt[8]),
    .b(1'b0),
    .c(\add0/c8 ),
    .o({\add0/c9 ,n4[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u9  (
    .a(cnt[9]),
    .b(1'b0),
    .c(\add0/c9 ),
    .o({\add0/c10 ,n4[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n3}));
  reg_ar_as_w1 clk_bps_r_reg (
    .clk(clk),
    .d(n6),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(clk_bps));  // source/rtl/speed_setting.v(37)
  reg_ar_as_w1_1 reg0_b0 (
    .clk(clk),
    .d(n5[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[0]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1_2 reg0_b1 (
    .clk(clk),
    .d(n5[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[1]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1_3 reg0_b10 (
    .clk(clk),
    .d(n5[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[10]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1_4 reg0_b11 (
    .clk(clk),
    .d(n5[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[11]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1_5 reg0_b12 (
    .clk(clk),
    .d(n5[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[12]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1_6 reg0_b2 (
    .clk(clk),
    .d(n5[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[2]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1_7 reg0_b3 (
    .clk(clk),
    .d(n5[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[3]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1_8 reg0_b4 (
    .clk(clk),
    .d(n5[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[4]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1_9 reg0_b5 (
    .clk(clk),
    .d(n5[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[5]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1_10 reg0_b6 (
    .clk(clk),
    .d(n5[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[6]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1_11 reg0_b7 (
    .clk(clk),
    .d(n5[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[7]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1_12 reg0_b8 (
    .clk(clk),
    .d(n5[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[8]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1_13 reg0_b9 (
    .clk(clk),
    .d(n5[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[9]));  // source/rtl/speed_setting.v(27)

endmodule 

module speed_setting  // source/rtl/speed_setting.v(1)
  (
  bps_start,
  clk,
  rst_n,
  clk_bps
  );

  input bps_start;  // source/rtl/speed_setting.v(9)
  input clk;  // source/rtl/speed_setting.v(7)
  input rst_n;  // source/rtl/speed_setting.v(8)
  output clk_bps;  // source/rtl/speed_setting.v(10)

  parameter BPS_SET = 96;
  parameter CLK_PERIORD = 40;
  wire [12:0] cnt;  // source/rtl/speed_setting.v(16)
  wire [12:0] n4;
  wire [12:0] n5;
  wire _al_u1_o;
  wire _al_u2_o;
  wire _al_u3_o;
  wire _al_u4_o;
  wire _al_u6_o;
  wire _al_u7_o;
  wire _al_u8_o;
  wire \add0/c0 ;
  wire \add0/c1 ;
  wire \add0/c10 ;
  wire \add0/c11 ;
  wire \add0/c12 ;
  wire \add0/c2 ;
  wire \add0/c3 ;
  wire \add0/c4 ;
  wire \add0/c5 ;
  wire \add0/c6 ;
  wire \add0/c7 ;
  wire \add0/c8 ;
  wire \add0/c9 ;
  wire n6;

  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u1 (
    .a(cnt[11]),
    .b(cnt[3]),
    .c(cnt[4]),
    .d(cnt[5]),
    .o(_al_u1_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u10 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[8]),
    .o(n5[8]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u11 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[7]),
    .o(n5[7]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u12 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[6]),
    .o(n5[6]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u13 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[5]),
    .o(n5[5]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u14 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[4]),
    .o(n5[4]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u15 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[3]),
    .o(n5[3]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u16 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[2]),
    .o(n5[2]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u17 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[12]),
    .o(n5[12]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u18 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[11]),
    .o(n5[11]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u19 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[10]),
    .o(n5[10]));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*~A)"),
    .INIT(8'h10))
    _al_u2 (
    .a(cnt[0]),
    .b(cnt[12]),
    .c(cnt[2]),
    .o(_al_u2_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u20 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[1]),
    .o(n5[1]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u21 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[0]),
    .o(n5[0]));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u3 (
    .a(cnt[6]),
    .b(cnt[7]),
    .o(_al_u3_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u4 (
    .a(_al_u2_o),
    .b(_al_u3_o),
    .c(cnt[8]),
    .d(cnt[9]),
    .o(_al_u4_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u5 (
    .a(_al_u4_o),
    .b(_al_u1_o),
    .c(cnt[1]),
    .d(cnt[10]),
    .o(n6));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u6 (
    .a(cnt[11]),
    .b(cnt[3]),
    .c(cnt[4]),
    .d(cnt[5]),
    .o(_al_u6_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u7 (
    .a(_al_u6_o),
    .b(cnt[1]),
    .c(cnt[10]),
    .o(_al_u7_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u8 (
    .a(_al_u2_o),
    .b(_al_u3_o),
    .c(cnt[8]),
    .d(cnt[9]),
    .o(_al_u8_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(B*A))"),
    .INIT(16'h7000))
    _al_u9 (
    .a(_al_u7_o),
    .b(_al_u8_o),
    .c(bps_start),
    .d(n4[9]),
    .o(n5[9]));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(cnt[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n4[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(cnt[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n4[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u10  (
    .a(cnt[10]),
    .b(1'b0),
    .c(\add0/c10 ),
    .o({\add0/c11 ,n4[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u11  (
    .a(cnt[11]),
    .b(1'b0),
    .c(\add0/c11 ),
    .o({\add0/c12 ,n4[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u12  (
    .a(cnt[12]),
    .b(1'b0),
    .c(\add0/c12 ),
    .o({open_n0,n4[12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(cnt[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n4[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(cnt[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({\add0/c4 ,n4[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u4  (
    .a(cnt[4]),
    .b(1'b0),
    .c(\add0/c4 ),
    .o({\add0/c5 ,n4[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u5  (
    .a(cnt[5]),
    .b(1'b0),
    .c(\add0/c5 ),
    .o({\add0/c6 ,n4[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u6  (
    .a(cnt[6]),
    .b(1'b0),
    .c(\add0/c6 ),
    .o({\add0/c7 ,n4[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u7  (
    .a(cnt[7]),
    .b(1'b0),
    .c(\add0/c7 ),
    .o({\add0/c8 ,n4[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u8  (
    .a(cnt[8]),
    .b(1'b0),
    .c(\add0/c8 ),
    .o({\add0/c9 ,n4[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u9  (
    .a(cnt[9]),
    .b(1'b0),
    .c(\add0/c9 ),
    .o({\add0/c10 ,n4[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n3}));
  reg_ar_as_w1 clk_bps_r_reg (
    .clk(clk),
    .d(n6),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(clk_bps));  // source/rtl/speed_setting.v(37)
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(n5[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[0]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(n5[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[1]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 reg0_b10 (
    .clk(clk),
    .d(n5[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[10]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 reg0_b11 (
    .clk(clk),
    .d(n5[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[11]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 reg0_b12 (
    .clk(clk),
    .d(n5[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[12]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(n5[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[2]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(n5[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[3]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk),
    .d(n5[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[4]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk),
    .d(n5[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[5]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk),
    .d(n5[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[6]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk),
    .d(n5[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[7]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 reg0_b8 (
    .clk(clk),
    .d(n5[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[8]));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 reg0_b9 (
    .clk(clk),
    .d(n5[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[9]));  // source/rtl/speed_setting.v(27)

endmodule 

module pll_test  // al_ip/pll_test.v(24)
  (
  refclk,
  reset,
  clk0_out,
  clk1_out,
  clk2_out,
  extlock
  );

  input refclk;  // al_ip/pll_test.v(31)
  input reset;  // al_ip/pll_test.v(32)
  output clk0_out;  // al_ip/pll_test.v(34)
  output clk1_out;  // al_ip/pll_test.v(35)
  output clk2_out;  // al_ip/pll_test.v(36)
  output extlock;  // al_ip/pll_test.v(33)

  wire clk0_buf;  // al_ip/pll_test.v(38)

  EG_PHY_GCLK bufg_feedback (
    .clki(clk0_buf),
    .clko(clk0_out));  // al_ip/pll_test.v(40)
  EG_PHY_PLL #(
    .CLKC0_CPHASE(39),
    .CLKC0_DIV(40),
    .CLKC0_DIV2_ENABLE("DISABLE"),
    .CLKC0_ENABLE("ENABLE"),
    .CLKC0_FPHASE(0),
    .CLKC1_CPHASE(19),
    .CLKC1_DIV(20),
    .CLKC1_DIV2_ENABLE("DISABLE"),
    .CLKC1_ENABLE("ENABLE"),
    .CLKC1_FPHASE(0),
    .CLKC2_CPHASE(9),
    .CLKC2_DIV(10),
    .CLKC2_DIV2_ENABLE("DISABLE"),
    .CLKC2_ENABLE("ENABLE"),
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
    .FBCLK_DIV(1),
    .FEEDBK_MODE("NORMAL"),
    .FEEDBK_PATH("CLKC0_EXT"),
    .FIN("25.000"),
    .FREQ_LOCK_ACCURACY(2),
    .GEN_BASIC_CLOCK("DISABLE"),
    .GMC_GAIN(6),
    .GMC_TEST(14),
    .ICP_CURRENT(3),
    .IF_ESCLKSTSW("DISABLE"),
    .INTFB_WAKE("DISABLE"),
    .KVCO(6),
    .LPF_CAPACITOR(3),
    .LPF_RESISTOR(2),
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
    .REFCLK_DIV(1),
    .REFCLK_SEL("INTERNAL"),
    .STDBY_ENABLE("DISABLE"),
    .STDBY_VCO_ENA("DISABLE"),
    .SYNC_ENABLE("DISABLE"),
    .VCO_NORESET("DISABLE"))
    pll_inst (
    .daddr(6'b000000),
    .dclk(1'b0),
    .dcs(1'b0),
    .di(8'b00000000),
    .dwe(1'b0),
    .fbclk(clk0_out),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(refclk),
    .reset(reset),
    .stdby(1'b0),
    .clkc({open_n0,open_n1,clk2_out,clk1_out,clk0_buf}),
    .extlock(extlock));  // al_ip/pll_test.v(71)

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

module reg_ar_as_w1_1
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

module reg_ar_as_w1_2
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

module reg_ar_as_w1_3
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

module reg_ar_as_w1_4
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

module reg_ar_as_w1_5
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

module reg_ar_as_w1_6
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

module reg_ar_as_w1_7
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

module reg_ar_as_w1_8
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

module reg_ar_as_w1_9
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

module reg_ar_as_w1_10
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

module reg_ar_as_w1_11
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

module reg_ar_as_w1_12
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

module reg_ar_as_w1_13
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

