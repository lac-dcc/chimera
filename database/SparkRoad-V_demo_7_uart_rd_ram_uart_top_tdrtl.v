// Verilog netlist created by TD v4.6.12906
// Thu Aug  8 15:33:19 2019

`timescale 1ns / 1ps
module uart_top  // source/rtl/uart_top.v(18)
  (
  ext_clk_25m,
  ext_rst_n,
  uart_rx,
  led,
  uart_tx
  );

  input ext_clk_25m;  // source/rtl/uart_top.v(24)
  input ext_rst_n;  // source/rtl/uart_top.v(25)
  input uart_rx;  // source/rtl/uart_top.v(26)
  output led;  // source/rtl/uart_top.v(28)
  output uart_tx;  // source/rtl/uart_top.v(27)

  parameter BPS_SET = 96;
  parameter CLK_PERIORD = 40;
  wire [7:0] ram_output;  // source/rtl/uart_top.v(45)
  wire [7:0] rx_data;  // source/rtl/uart_top.v(40)
  wire bps_start1;  // source/rtl/uart_top.v(38)
  wire bps_start2;  // source/rtl/uart_top.v(38)
  wire clk_25m;  // source/rtl/uart_top.v(32)
  wire clk_bps1;  // source/rtl/uart_top.v(39)
  wire clk_bps2;  // source/rtl/uart_top.v(39)
  wire n0;
  wire ram_rw_ce;  // source/rtl/uart_top.v(44)
  wire rx_int;  // source/rtl/uart_top.v(41)
  wire sys_rst_n;  // source/rtl/uart_top.v(35)

  my_uart_rx my_uart_rx (
    .clk(clk_25m),
    .clk_bps(clk_bps1),
    .rst_n(sys_rst_n),
    .uart_rx(uart_rx),
    .bps_start(bps_start1),
    .rx_data(rx_data),
    .rx_int(rx_int));  // source/rtl/uart_top.v(78)
  my_uart_tx my_uart_tx (
    .clk(clk_25m),
    .clk_bps(clk_bps2),
    .rst_n(sys_rst_n),
    .rx_data(ram_output),
    .rx_int(ram_rw_ce),
    .bps_start(bps_start2),
    .uart_tx(uart_tx));  // source/rtl/uart_top.v(120)
  speed_setting_1 speed_rx (
    .bps_start(bps_start1),
    .clk(clk_25m),
    .rst_n(sys_rst_n),
    .clk_bps(clk_bps1));  // source/rtl/uart_top.v(68)
  speed_setting speed_tx (
    .bps_start(bps_start2),
    .clk(clk_25m),
    .rst_n(sys_rst_n),
    .clk_bps(clk_bps2));  // source/rtl/uart_top.v(111)
  not u0 (n0, ext_rst_n);  // source/rtl/uart_top.v(52)
  pll_test u_pll_test (
    .refclk(ext_clk_25m),
    .reset(n0),
    .clk0_out(clk_25m),
    .extlock(sys_rst_n));  // source/rtl/uart_top.v(49)
  ram_rw_control u_ram_rw_control (
    .clk_25m(clk_25m),
    .rx_data(rx_data),
    .rx_int(rx_int),
    .sys_rst_n(sys_rst_n),
    .led(led),
    .ram_output(ram_output),
    .ram_rw_ce(ram_rw_ce));  // source/rtl/uart_top.v(92)

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
  wire [3:0] n30;
  wire [3:0] n32;
  wire [3:0] num;  // source/rtl/my_uart_rx.v(38)
  wire [7:0] rx_temp_data;  // source/rtl/my_uart_rx.v(64)
  wire clk_bps_neg;
  wire mux3_b0_sel_is_3_o;
  wire mux3_b1_sel_is_3_o;
  wire mux3_b2_sel_is_3_o;
  wire mux3_b3_sel_is_3_o;
  wire mux3_b4_sel_is_3_o;
  wire mux3_b5_sel_is_3_o;
  wire mux3_b6_sel_is_3_o;
  wire mux3_b7_sel_is_3_o;
  wire mux4_b0_sel_is_2_o;
  wire mux6_b0_sel_is_3_o;
  wire mux6_b1_sel_is_3_o;
  wire mux6_b2_sel_is_3_o;
  wire mux6_b3_sel_is_3_o;
  wire mux6_b4_sel_is_3_o;
  wire mux6_b5_sel_is_3_o;
  wire mux6_b6_sel_is_3_o;
  wire mux6_b7_sel_is_3_o;
  wire mux7_b0_sel_is_3_o;
  wire n1;
  wire n10;
  wire n11;
  wire n14;
  wire n19;
  wire n2;
  wire n20;
  wire n21;
  wire n22;
  wire n23;
  wire n24;
  wire n25;
  wire n26;
  wire n3;
  wire n4;
  wire n6;
  wire neg_uart_rx;  // source/rtl/my_uart_rx.v(14)
  wire uart_rx0;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx1;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx2;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx3;  // source/rtl/my_uart_rx.v(13)

  add_pu4_pu4_o4 add0 (
    .i0(num),
    .i1(4'b0001),
    .o(n18));  // source/rtl/my_uart_rx.v(78)
  reg_ar_as_w1 bps_start_r_reg (
    .clk(clk),
    .d(neg_uart_rx),
    .en(n11),
    .reset(~rst_n),
    .set(1'b0),
    .q(n10));  // source/rtl/my_uart_rx.v(57)
  not clk_bps_inv (clk_bps_neg, clk_bps);
  eq_w4 eq0 (
    .i0(num),
    .i1(4'b1001),
    .o(n6));  // source/rtl/my_uart_rx.v(53)
  eq_w4 eq1 (
    .i0(num),
    .i1(4'b0001),
    .o(n19));  // source/rtl/my_uart_rx.v(80)
  eq_w4 eq2 (
    .i0(num),
    .i1(4'b0010),
    .o(n20));  // source/rtl/my_uart_rx.v(81)
  eq_w4 eq3 (
    .i0(num),
    .i1(4'b0011),
    .o(n21));  // source/rtl/my_uart_rx.v(82)
  eq_w4 eq4 (
    .i0(num),
    .i1(4'b0100),
    .o(n22));  // source/rtl/my_uart_rx.v(83)
  eq_w4 eq5 (
    .i0(num),
    .i1(4'b0101),
    .o(n23));  // source/rtl/my_uart_rx.v(84)
  eq_w4 eq6 (
    .i0(num),
    .i1(4'b0110),
    .o(n24));  // source/rtl/my_uart_rx.v(85)
  eq_w4 eq7 (
    .i0(num),
    .i1(4'b0111),
    .o(n25));  // source/rtl/my_uart_rx.v(86)
  eq_w4 eq8 (
    .i0(num),
    .i1(4'b1000),
    .o(n26));  // source/rtl/my_uart_rx.v(87)
  reg_ar_ss_w1 i30 (
    .clk(clk),
    .d(n14),
    .en(1'b1),
    .reset(~rst_n),
    .set(n11),
    .q(n14));  // source/rtl/my_uart_rx.v(57)
  binary_mux_s1_w1 mux0_b0 (
    .i0(num[0]),
    .i1(1'b0),
    .sel(n6),
    .o(n30[0]));  // source/rtl/my_uart_rx.v(95)
  binary_mux_s1_w1 mux0_b1 (
    .i0(num[1]),
    .i1(1'b0),
    .sel(n6),
    .o(n30[1]));  // source/rtl/my_uart_rx.v(95)
  binary_mux_s1_w1 mux0_b2 (
    .i0(num[2]),
    .i1(1'b0),
    .sel(n6),
    .o(n30[2]));  // source/rtl/my_uart_rx.v(95)
  binary_mux_s1_w1 mux0_b3 (
    .i0(num[3]),
    .i1(1'b0),
    .sel(n6),
    .o(n30[3]));  // source/rtl/my_uart_rx.v(95)
  binary_mux_s1_w1 mux2_b0 (
    .i0(n30[0]),
    .i1(n18[0]),
    .sel(clk_bps),
    .o(n32[0]));  // source/rtl/my_uart_rx.v(95)
  binary_mux_s1_w1 mux2_b1 (
    .i0(n30[1]),
    .i1(n18[1]),
    .sel(clk_bps),
    .o(n32[1]));  // source/rtl/my_uart_rx.v(95)
  binary_mux_s1_w1 mux2_b2 (
    .i0(n30[2]),
    .i1(n18[2]),
    .sel(clk_bps),
    .o(n32[2]));  // source/rtl/my_uart_rx.v(95)
  binary_mux_s1_w1 mux2_b3 (
    .i0(n30[3]),
    .i1(n18[3]),
    .sel(clk_bps),
    .o(n32[3]));  // source/rtl/my_uart_rx.v(95)
  and mux3_b0_sel_is_3 (mux3_b0_sel_is_3_o, clk_bps, n19);
  and mux3_b1_sel_is_3 (mux3_b1_sel_is_3_o, clk_bps, n20);
  and mux3_b2_sel_is_3 (mux3_b2_sel_is_3_o, clk_bps, n21);
  and mux3_b3_sel_is_3 (mux3_b3_sel_is_3_o, clk_bps, n22);
  and mux3_b4_sel_is_3 (mux3_b4_sel_is_3_o, clk_bps, n23);
  and mux3_b5_sel_is_3 (mux3_b5_sel_is_3_o, clk_bps, n24);
  and mux3_b6_sel_is_3 (mux3_b6_sel_is_3_o, clk_bps, n25);
  and mux3_b7_sel_is_3 (mux3_b7_sel_is_3_o, clk_bps, n26);
  and mux4_b0_sel_is_2 (mux4_b0_sel_is_2_o, clk_bps_neg, n6);
  and mux6_b0_sel_is_3 (mux6_b0_sel_is_3_o, rx_int, mux3_b0_sel_is_3_o);
  and mux6_b1_sel_is_3 (mux6_b1_sel_is_3_o, rx_int, mux3_b1_sel_is_3_o);
  and mux6_b2_sel_is_3 (mux6_b2_sel_is_3_o, rx_int, mux3_b2_sel_is_3_o);
  and mux6_b3_sel_is_3 (mux6_b3_sel_is_3_o, rx_int, mux3_b3_sel_is_3_o);
  and mux6_b4_sel_is_3 (mux6_b4_sel_is_3_o, rx_int, mux3_b4_sel_is_3_o);
  and mux6_b5_sel_is_3 (mux6_b5_sel_is_3_o, rx_int, mux3_b5_sel_is_3_o);
  and mux6_b6_sel_is_3 (mux6_b6_sel_is_3_o, rx_int, mux3_b6_sel_is_3_o);
  and mux6_b7_sel_is_3 (mux6_b7_sel_is_3_o, rx_int, mux3_b7_sel_is_3_o);
  and mux7_b0_sel_is_3 (mux7_b0_sel_is_3_o, rx_int, mux4_b0_sel_is_2_o);
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(uart_rx),
    .en(mux6_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[0]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(uart_rx),
    .en(mux6_b1_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[1]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(uart_rx),
    .en(mux6_b2_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[2]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(uart_rx),
    .en(mux6_b3_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[3]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk),
    .d(uart_rx),
    .en(mux6_b4_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[4]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk),
    .d(uart_rx),
    .en(mux6_b5_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[5]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk),
    .d(uart_rx),
    .en(mux6_b6_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_temp_data[6]));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk),
    .d(uart_rx),
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
  reg_ar_ss_w1 rx_int_reg (
    .clk(clk),
    .d(1'b0),
    .en(n6),
    .reset(~rst_n),
    .set(neg_uart_rx),
    .q(rx_int));  // source/rtl/my_uart_rx.v(57)
  and u10 (neg_uart_rx, n3, n4);  // source/rtl/my_uart_rx.v(34)
  or u19 (n11, neg_uart_rx, n6);  // source/rtl/my_uart_rx.v(57)
  and u25_and (bps_start, n10, n14);
  and u6 (n1, uart_rx3, uart_rx2);  // source/rtl/my_uart_rx.v(34)
  not u7 (n2, uart_rx1);  // source/rtl/my_uart_rx.v(34)
  and u8 (n3, n1, n2);  // source/rtl/my_uart_rx.v(34)
  not u9 (n4, uart_rx0);  // source/rtl/my_uart_rx.v(34)
  reg_ar_as_w1 uart_rx0_reg (
    .clk(clk),
    .d(uart_rx),
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

module my_uart_tx  // source/rtl/my_uart_tx.v(3)
  (
  clk,
  clk_bps,
  rst_n,
  rx_data,
  rx_int,
  bps_start,
  uart_tx
  );

  input clk;  // source/rtl/my_uart_tx.v(5)
  input clk_bps;  // source/rtl/my_uart_tx.v(10)
  input rst_n;  // source/rtl/my_uart_tx.v(6)
  input [7:0] rx_data;  // source/rtl/my_uart_tx.v(7)
  input rx_int;  // source/rtl/my_uart_tx.v(8)
  output bps_start;  // source/rtl/my_uart_tx.v(11)
  output uart_tx;  // source/rtl/my_uart_tx.v(9)

  wire [3:0] n11;
  wire [3:0] n13;
  wire [3:0] n14;
  wire [3:0] num;  // source/rtl/my_uart_tx.v(38)
  wire [7:0] tx_data;  // source/rtl/my_uart_tx.v(35)
  wire n0;
  wire n12;
  wire n2;
  wire n6;
  wire n7;
  wire n8;
  wire neg_rx_int;  // source/rtl/my_uart_tx.v(16)
  wire rx_int0;  // source/rtl/my_uart_tx.v(15)
  wire rx_int1;  // source/rtl/my_uart_tx.v(15)
  wire rx_int2;  // source/rtl/my_uart_tx.v(15)
  wire tx_en;  // source/rtl/my_uart_tx.v(37)
  wire u13_sel_is_3_o;

  add_pu4_pu4_o4 add0 (
    .i0(num),
    .i1(4'b0001),
    .o(n11));  // source/rtl/my_uart_tx.v(74)
  reg_ar_as_w1 bps_start_r_reg (
    .clk(clk),
    .d(neg_rx_int),
    .en(n7),
    .reset(~rst_n),
    .set(1'b0),
    .q(n6));  // source/rtl/my_uart_tx.v(57)
  eq_w4 eq0 (
    .i0(num),
    .i1(4'b1010),
    .o(n2));  // source/rtl/my_uart_tx.v(53)
  reg_ar_ss_w1 i28 (
    .clk(clk),
    .d(n8),
    .en(1'b1),
    .reset(~rst_n),
    .set(n7),
    .q(n8));  // source/rtl/my_uart_tx.v(57)
  binary_mux_s4_w1 mux1 (
    .i0(1'b0),
    .i1(tx_data[0]),
    .i10(1'b1),
    .i11(1'b1),
    .i12(1'b1),
    .i13(1'b1),
    .i14(1'b1),
    .i15(1'b1),
    .i2(tx_data[1]),
    .i3(tx_data[2]),
    .i4(tx_data[3]),
    .i5(tx_data[4]),
    .i6(tx_data[5]),
    .i7(tx_data[6]),
    .i8(tx_data[7]),
    .i9(1'b1),
    .sel(num),
    .o(n12));  // source/rtl/my_uart_tx.v(87)
  binary_mux_s1_w1 mux2_b0 (
    .i0(num[0]),
    .i1(1'b0),
    .sel(n2),
    .o(n13[0]));  // source/rtl/my_uart_tx.v(90)
  binary_mux_s1_w1 mux2_b1 (
    .i0(num[1]),
    .i1(1'b0),
    .sel(n2),
    .o(n13[1]));  // source/rtl/my_uart_tx.v(90)
  binary_mux_s1_w1 mux2_b2 (
    .i0(num[2]),
    .i1(1'b0),
    .sel(n2),
    .o(n13[2]));  // source/rtl/my_uart_tx.v(90)
  binary_mux_s1_w1 mux2_b3 (
    .i0(num[3]),
    .i1(1'b0),
    .sel(n2),
    .o(n13[3]));  // source/rtl/my_uart_tx.v(90)
  binary_mux_s1_w1 mux3_b0 (
    .i0(n13[0]),
    .i1(n11[0]),
    .sel(clk_bps),
    .o(n14[0]));  // source/rtl/my_uart_tx.v(90)
  binary_mux_s1_w1 mux3_b1 (
    .i0(n13[1]),
    .i1(n11[1]),
    .sel(clk_bps),
    .o(n14[1]));  // source/rtl/my_uart_tx.v(90)
  binary_mux_s1_w1 mux3_b2 (
    .i0(n13[2]),
    .i1(n11[2]),
    .sel(clk_bps),
    .o(n14[2]));  // source/rtl/my_uart_tx.v(90)
  binary_mux_s1_w1 mux3_b3 (
    .i0(n13[3]),
    .i1(n11[3]),
    .sel(clk_bps),
    .o(n14[3]));  // source/rtl/my_uart_tx.v(90)
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(rx_data[0]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[0]));  // source/rtl/my_uart_tx.v(57)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(rx_data[1]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[1]));  // source/rtl/my_uart_tx.v(57)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(rx_data[2]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[2]));  // source/rtl/my_uart_tx.v(57)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(rx_data[3]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[3]));  // source/rtl/my_uart_tx.v(57)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk),
    .d(rx_data[4]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[4]));  // source/rtl/my_uart_tx.v(57)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk),
    .d(rx_data[5]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[5]));  // source/rtl/my_uart_tx.v(57)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk),
    .d(rx_data[6]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[6]));  // source/rtl/my_uart_tx.v(57)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk),
    .d(rx_data[7]),
    .en(neg_rx_int),
    .reset(~rst_n),
    .set(1'b0),
    .q(tx_data[7]));  // source/rtl/my_uart_tx.v(57)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk),
    .d(n14[0]),
    .en(tx_en),
    .reset(~rst_n),
    .set(1'b0),
    .q(num[0]));  // source/rtl/my_uart_tx.v(91)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk),
    .d(n14[1]),
    .en(tx_en),
    .reset(~rst_n),
    .set(1'b0),
    .q(num[1]));  // source/rtl/my_uart_tx.v(91)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk),
    .d(n14[2]),
    .en(tx_en),
    .reset(~rst_n),
    .set(1'b0),
    .q(num[2]));  // source/rtl/my_uart_tx.v(91)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk),
    .d(n14[3]),
    .en(tx_en),
    .reset(~rst_n),
    .set(1'b0),
    .q(num[3]));  // source/rtl/my_uart_tx.v(91)
  reg_ar_as_w1 rx_int0_reg (
    .clk(clk),
    .d(rx_int),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_int0));  // source/rtl/my_uart_tx.v(30)
  reg_ar_as_w1 rx_int1_reg (
    .clk(clk),
    .d(rx_int0),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_int1));  // source/rtl/my_uart_tx.v(30)
  reg_ar_as_w1 rx_int2_reg (
    .clk(clk),
    .d(rx_int1),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rx_int2));  // source/rtl/my_uart_tx.v(30)
  reg_ar_ss_w1 tx_en_reg (
    .clk(clk),
    .d(1'b0),
    .en(n2),
    .reset(~rst_n),
    .set(neg_rx_int),
    .q(tx_en));  // source/rtl/my_uart_tx.v(57)
  and u10_and (bps_start, n6, n8);
  and u13_sel_is_3 (u13_sel_is_3_o, tx_en, clk_bps);
  not u3 (n0, rx_int1);  // source/rtl/my_uart_tx.v(32)
  and u4 (neg_rx_int, n0, rx_int2);  // source/rtl/my_uart_tx.v(32)
  or u7 (n7, neg_rx_int, n2);  // source/rtl/my_uart_tx.v(57)
  reg_ar_as_w1 uart_tx_r_reg (
    .clk(clk),
    .d(n12),
    .en(u13_sel_is_3_o),
    .reset(1'b0),
    .set(~rst_n),
    .q(uart_tx));  // source/rtl/my_uart_tx.v(91)

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
  wire n1;
  wire n2;
  wire n3;
  wire n6;

  add_pu13_pu13_o13_1 add0 (
    .i0(cnt),
    .i1(13'b0000000000001),
    .o(n4));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 clk_bps_r_reg (
    .clk(clk),
    .d(n6),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(clk_bps));  // source/rtl/speed_setting.v(37)
  eq_w13_1 eq0 (
    .i0(cnt),
    .i1(13'b0101000101100),
    .o(n1));  // source/rtl/speed_setting.v(24)
  eq_w13_2 eq1 (
    .i0(cnt),
    .i1(13'b0010100010110),
    .o(n6));  // source/rtl/speed_setting.v(34)
  binary_mux_s1_w1_1 mux0_b0 (
    .i0(n4[0]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[0]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1_2 mux0_b1 (
    .i0(n4[1]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[1]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1_3 mux0_b10 (
    .i0(n4[10]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[10]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1_4 mux0_b11 (
    .i0(n4[11]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[11]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1_5 mux0_b12 (
    .i0(n4[12]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[12]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1_6 mux0_b2 (
    .i0(n4[2]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[2]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1_7 mux0_b3 (
    .i0(n4[3]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[3]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1_8 mux0_b4 (
    .i0(n4[4]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[4]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1_9 mux0_b5 (
    .i0(n4[5]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[5]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1_10 mux0_b6 (
    .i0(n4[6]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[6]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1_11 mux0_b7 (
    .i0(n4[7]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[7]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1_12 mux0_b8 (
    .i0(n4[8]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[8]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1_13 mux0_b9 (
    .i0(n4[9]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[9]));  // source/rtl/speed_setting.v(27)
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
  not u3 (n2, bps_start);  // source/rtl/speed_setting.v(24)
  or u4 (n3, n1, n2);  // source/rtl/speed_setting.v(24)

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
  wire n1;
  wire n2;
  wire n3;
  wire n6;

  add_pu13_pu13_o13 add0 (
    .i0(cnt),
    .i1(13'b0000000000001),
    .o(n4));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w1 clk_bps_r_reg (
    .clk(clk),
    .d(n6),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(clk_bps));  // source/rtl/speed_setting.v(37)
  eq_w13 eq0 (
    .i0(cnt),
    .i1(13'b0101000101100),
    .o(n1));  // source/rtl/speed_setting.v(24)
  eq_w13 eq1 (
    .i0(cnt),
    .i1(13'b0010100010110),
    .o(n6));  // source/rtl/speed_setting.v(34)
  binary_mux_s1_w1 mux0_b0 (
    .i0(n4[0]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[0]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1 mux0_b1 (
    .i0(n4[1]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[1]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1 mux0_b10 (
    .i0(n4[10]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[10]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1 mux0_b11 (
    .i0(n4[11]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[11]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1 mux0_b12 (
    .i0(n4[12]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[12]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1 mux0_b2 (
    .i0(n4[2]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[2]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1 mux0_b3 (
    .i0(n4[3]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[3]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1 mux0_b4 (
    .i0(n4[4]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[4]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1 mux0_b5 (
    .i0(n4[5]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[5]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1 mux0_b6 (
    .i0(n4[6]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[6]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1 mux0_b7 (
    .i0(n4[7]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[7]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1 mux0_b8 (
    .i0(n4[8]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[8]));  // source/rtl/speed_setting.v(27)
  binary_mux_s1_w1 mux0_b9 (
    .i0(n4[9]),
    .i1(1'b0),
    .sel(n3),
    .o(n5[9]));  // source/rtl/speed_setting.v(27)
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
  not u3 (n2, bps_start);  // source/rtl/speed_setting.v(24)
  or u4 (n3, n1, n2);  // source/rtl/speed_setting.v(24)

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

  EG_LOGIC_BUFG bufg_feedback (
    .i(clk0_buf),
    .o(clk0_out));  // al_ip/pll_test.v(40)
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

module ram_rw_control  // source/rtl/ram_rw_control.v(1)
  (
  clk_25m,
  rx_data,
  rx_int,
  sys_rst_n,
  led,
  ram_output,
  ram_rw_ce
  );

  input clk_25m;  // source/rtl/ram_rw_control.v(3)
  input [7:0] rx_data;  // source/rtl/ram_rw_control.v(6)
  input rx_int;  // source/rtl/ram_rw_control.v(5)
  input sys_rst_n;  // source/rtl/ram_rw_control.v(4)
  output led;  // source/rtl/ram_rw_control.v(9)
  output [7:0] ram_output;  // source/rtl/ram_rw_control.v(8)
  output ram_rw_ce;  // source/rtl/ram_rw_control.v(7)

  wire [7:0] n3;
  wire [7:0] n4;
  wire [7:0] n8;
  wire [7:0] ram_input;  // source/rtl/ram_rw_control.v(18)
  wire [7:0] ram_re_addr;  // source/rtl/ram_rw_control.v(19)
  wire [7:0] ram_wr_addr;  // source/rtl/ram_rw_control.v(19)
  wire n0;
  wire n2;
  wire neg_rx_int;  // source/rtl/ram_rw_control.v(15)
  wire rx_int0;  // source/rtl/ram_rw_control.v(14)
  wire rx_int1;  // source/rtl/ram_rw_control.v(14)
  wire rx_int2;  // source/rtl/ram_rw_control.v(14)

  reg_sr_as_w1 LED_FLAG_reg (
    .clk(clk_25m),
    .d(led),
    .en(1'b1),
    .reset(~n2),
    .set(~sys_rst_n),
    .q(led));  // source/rtl/ram_rw_control.v(66)
  add_pu8_pu8_o8 add0 (
    .i0(ram_wr_addr),
    .i1(8'b00000001),
    .o(n3));  // source/rtl/ram_rw_control.v(58)
  add_pu8_pu8_o8 add1 (
    .i0(ram_input),
    .i1(8'b00000001),
    .o(n4));  // source/rtl/ram_rw_control.v(59)
  lt_u8_u8 lt0 (
    .ci(1'b0),
    .i0(ram_wr_addr),
    .i1(8'b11111111),
    .o(n2));  // source/rtl/ram_rw_control.v(56)
  binary_mux_s1_w1 mux2_b0 (
    .i0(1'b0),
    .i1(rx_data[0]),
    .sel(neg_rx_int),
    .o(n8[0]));  // source/rtl/ram_rw_control.v(86)
  binary_mux_s1_w1 mux2_b1 (
    .i0(1'b0),
    .i1(rx_data[1]),
    .sel(neg_rx_int),
    .o(n8[1]));  // source/rtl/ram_rw_control.v(86)
  binary_mux_s1_w1 mux2_b2 (
    .i0(1'b0),
    .i1(rx_data[2]),
    .sel(neg_rx_int),
    .o(n8[2]));  // source/rtl/ram_rw_control.v(86)
  binary_mux_s1_w1 mux2_b3 (
    .i0(1'b0),
    .i1(rx_data[3]),
    .sel(neg_rx_int),
    .o(n8[3]));  // source/rtl/ram_rw_control.v(86)
  binary_mux_s1_w1 mux2_b4 (
    .i0(1'b0),
    .i1(rx_data[4]),
    .sel(neg_rx_int),
    .o(n8[4]));  // source/rtl/ram_rw_control.v(86)
  binary_mux_s1_w1 mux2_b5 (
    .i0(1'b0),
    .i1(rx_data[5]),
    .sel(neg_rx_int),
    .o(n8[5]));  // source/rtl/ram_rw_control.v(86)
  binary_mux_s1_w1 mux2_b6 (
    .i0(1'b0),
    .i1(rx_data[6]),
    .sel(neg_rx_int),
    .o(n8[6]));  // source/rtl/ram_rw_control.v(86)
  binary_mux_s1_w1 mux2_b7 (
    .i0(1'b0),
    .i1(rx_data[7]),
    .sel(neg_rx_int),
    .o(n8[7]));  // source/rtl/ram_rw_control.v(86)
  reg_ar_as_w1 ram_rw_ce_r_reg (
    .clk(clk_25m),
    .d(neg_rx_int),
    .en(1'b1),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_rw_ce));  // source/rtl/ram_rw_control.v(86)
  reg_ar_as_w1 reg0_b0 (
    .clk(clk_25m),
    .d(n3[0]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_wr_addr[0]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk_25m),
    .d(n3[1]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_wr_addr[1]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk_25m),
    .d(n3[2]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_wr_addr[2]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk_25m),
    .d(n3[3]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_wr_addr[3]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk_25m),
    .d(n3[4]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_wr_addr[4]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk_25m),
    .d(n3[5]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_wr_addr[5]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk_25m),
    .d(n3[6]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_wr_addr[6]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk_25m),
    .d(n3[7]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_wr_addr[7]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk_25m),
    .d(n4[0]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_input[0]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk_25m),
    .d(n4[1]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_input[1]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk_25m),
    .d(n4[2]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_input[2]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk_25m),
    .d(n4[3]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_input[3]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg1_b4 (
    .clk(clk_25m),
    .d(n4[4]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_input[4]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg1_b5 (
    .clk(clk_25m),
    .d(n4[5]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_input[5]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg1_b6 (
    .clk(clk_25m),
    .d(n4[6]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_input[6]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg1_b7 (
    .clk(clk_25m),
    .d(n4[7]),
    .en(n2),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_input[7]));  // source/rtl/ram_rw_control.v(66)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk_25m),
    .d(n8[0]),
    .en(1'b1),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_re_addr[0]));  // source/rtl/ram_rw_control.v(86)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk_25m),
    .d(n8[1]),
    .en(1'b1),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_re_addr[1]));  // source/rtl/ram_rw_control.v(86)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk_25m),
    .d(n8[2]),
    .en(1'b1),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_re_addr[2]));  // source/rtl/ram_rw_control.v(86)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk_25m),
    .d(n8[3]),
    .en(1'b1),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_re_addr[3]));  // source/rtl/ram_rw_control.v(86)
  reg_ar_as_w1 reg2_b4 (
    .clk(clk_25m),
    .d(n8[4]),
    .en(1'b1),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_re_addr[4]));  // source/rtl/ram_rw_control.v(86)
  reg_ar_as_w1 reg2_b5 (
    .clk(clk_25m),
    .d(n8[5]),
    .en(1'b1),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_re_addr[5]));  // source/rtl/ram_rw_control.v(86)
  reg_ar_as_w1 reg2_b6 (
    .clk(clk_25m),
    .d(n8[6]),
    .en(1'b1),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_re_addr[6]));  // source/rtl/ram_rw_control.v(86)
  reg_ar_as_w1 reg2_b7 (
    .clk(clk_25m),
    .d(n8[7]),
    .en(1'b1),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(ram_re_addr[7]));  // source/rtl/ram_rw_control.v(86)
  reg_ar_as_w1 rx_int0_reg (
    .clk(clk_25m),
    .d(rx_int),
    .en(1'b1),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(rx_int0));  // source/rtl/ram_rw_control.v(39)
  reg_ar_as_w1 rx_int1_reg (
    .clk(clk_25m),
    .d(rx_int0),
    .en(1'b1),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(rx_int1));  // source/rtl/ram_rw_control.v(39)
  reg_ar_as_w1 rx_int2_reg (
    .clk(clk_25m),
    .d(rx_int1),
    .en(1'b1),
    .reset(~sys_rst_n),
    .set(1'b0),
    .q(rx_int2));  // source/rtl/ram_rw_control.v(39)
  not u3 (n0, rx_int1);  // source/rtl/ram_rw_control.v(42)
  and u4 (neg_rx_int, n0, rx_int2);  // source/rtl/ram_rw_control.v(42)
  EG_LOGIC_BRAM #(
    //.FORCE_KEEP("OFF"),
    //.INIT_FILE("NONE"),
    .ADDR_WIDTH_A(8),
    .ADDR_WIDTH_B(8),
    .BYTE_A(1),
    .BYTE_B(1),
    .BYTE_ENABLE(0),
    .DATA_DEPTH_A(256),
    .DATA_DEPTH_B(256),
    .DATA_WIDTH_A(8),
    .DATA_WIDTH_B(8),
    .DEBUGGABLE("NO"),
    .FILL_ALL("NONE"),
    .IMPLEMENT("9K"),
    .MODE("PDPW"),
    .PACKABLE("NO"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uut_Double_RAM/inst  (
    .addra(ram_wr_addr),
    .addrb(ram_re_addr),
    .bea(1'b0),
    .beb(1'b0),
    .cea(1'b1),
    .ceb(ram_rw_ce),
    .clka(clk_25m),
    .clkb(clk_25m),
    .dia(ram_input),
    .dib(8'b00000000),
    .ocea(1'b0),
    .oceb(1'b0),
    .rsta(1'b0),
    .rstb(1'b0),
    .wea(1'b1),
    .web(1'b0),
    .dob(ram_output));  // al_ip/Double_RAM_uut.v(46)

endmodule 

module add_pu4_pu4_o4
  (
  i0,
  i1,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  output [3:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_a3;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_b3;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_cout3;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;
  wire net_sum3;

  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));

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

module eq_w4
  (
  i0,
  i1,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  output o;

  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;

  not none_diff (o, \or_or_xor_i0[0]_i1[0_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \xor_i0[3]_i1[3]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);

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

module binary_mux_s1_w1
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s4_w1
  (
  i0,
  i1,
  i10,
  i11,
  i12,
  i13,
  i14,
  i15,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  i8,
  i9,
  sel,
  o
  );

  input i0;
  input i1;
  input i10;
  input i11;
  input i12;
  input i13;
  input i14;
  input i15;
  input i2;
  input i3;
  input i4;
  input i5;
  input i6;
  input i7;
  input i8;
  input i9;
  input [3:0] sel;
  output o;

  wire  B0_0;
  wire  B0_1;
  wire  B0_2;
  wire  B0_3;
  wire  B0_4;
  wire  B0_5;
  wire  B0_6;
  wire  B0_7;
  wire  B1_0;
  wire  B1_1;
  wire  B1_2;
  wire  B1_3;
  wire  B2_0;
  wire  B2_1;

  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel[0]),
    .o(B0_0));
  AL_MUX al_mux_b0_0_1 (
    .i0(i2),
    .i1(i3),
    .sel(sel[0]),
    .o(B0_1));
  AL_MUX al_mux_b0_0_2 (
    .i0(i4),
    .i1(i5),
    .sel(sel[0]),
    .o(B0_2));
  AL_MUX al_mux_b0_0_3 (
    .i0(i6),
    .i1(i7),
    .sel(sel[0]),
    .o(B0_3));
  AL_MUX al_mux_b0_0_4 (
    .i0(i8),
    .i1(i9),
    .sel(sel[0]),
    .o(B0_4));
  AL_MUX al_mux_b0_0_5 (
    .i0(i10),
    .i1(i11),
    .sel(sel[0]),
    .o(B0_5));
  AL_MUX al_mux_b0_0_6 (
    .i0(i12),
    .i1(i13),
    .sel(sel[0]),
    .o(B0_6));
  AL_MUX al_mux_b0_0_7 (
    .i0(i14),
    .i1(i15),
    .sel(sel[0]),
    .o(B0_7));
  AL_MUX al_mux_b0_1_0 (
    .i0(B0_0),
    .i1(B0_1),
    .sel(sel[1]),
    .o(B1_0));
  AL_MUX al_mux_b0_1_1 (
    .i0(B0_2),
    .i1(B0_3),
    .sel(sel[1]),
    .o(B1_1));
  AL_MUX al_mux_b0_1_2 (
    .i0(B0_4),
    .i1(B0_5),
    .sel(sel[1]),
    .o(B1_2));
  AL_MUX al_mux_b0_1_3 (
    .i0(B0_6),
    .i1(B0_7),
    .sel(sel[1]),
    .o(B1_3));
  AL_MUX al_mux_b0_2_0 (
    .i0(B1_0),
    .i1(B1_1),
    .sel(sel[2]),
    .o(B2_0));
  AL_MUX al_mux_b0_2_1 (
    .i0(B1_2),
    .i1(B1_3),
    .sel(sel[2]),
    .o(B2_1));
  AL_MUX al_mux_b0_3_0 (
    .i0(B2_0),
    .i1(B2_1),
    .sel(sel[3]),
    .o(o));

endmodule 

module add_pu13_pu13_o13_1
  (
  i0,
  i1,
  o
  );

  input [12:0] i0;
  input [12:0] i1;
  output [12:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a12;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_a9;
  wire net_b0;
  wire net_b1;
  wire net_b10;
  wire net_b11;
  wire net_b12;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_b9;
  wire net_cout0;
  wire net_cout1;
  wire net_cout10;
  wire net_cout11;
  wire net_cout12;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_cout9;
  wire net_sum0;
  wire net_sum1;
  wire net_sum10;
  wire net_sum11;
  wire net_sum12;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a12 = i0[12];
  assign net_a11 = i0[11];
  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b12 = i1[12];
  assign net_b11 = i1[11];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[12] = net_sum12;
  assign o[11] = net_sum11;
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_10 (
    .a(net_a10),
    .b(net_b10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD comp_11 (
    .a(net_a11),
    .b(net_b11),
    .c(net_cout10),
    .cout(net_cout11),
    .sum(net_sum11));
  AL_FADD comp_12 (
    .a(net_a12),
    .b(net_b12),
    .c(net_cout11),
    .cout(net_cout12),
    .sum(net_sum12));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD comp_8 (
    .a(net_a8),
    .b(net_b8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD comp_9 (
    .a(net_a9),
    .b(net_b9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));

endmodule 

module eq_w13_1
  (
  i0,
  i1,
  o
  );

  input [12:0] i0;
  input [12:0] i1;
  output o;

  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[6]_i1[6_o ;
  wire \or_or_xor_i0[9]_i1[9_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[11]_i1[11]_o ;
  wire \or_xor_i0[1]_i1[1]_o_o ;
  wire \or_xor_i0[3]_i1[3]_o_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \or_xor_i0[7]_i1[7]_o_o ;
  wire \or_xor_i0[9]_i1[9]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[10]_i1[10]_o ;
  wire \xor_i0[11]_i1[11]_o ;
  wire \xor_i0[12]_i1[12]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, \or_or_or_xor_i0[0]_i_o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[6]_i1[6_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[3]_i1[3]_o_o );
  or \or_or_xor_i0[6]_i1[6  (\or_or_xor_i0[6]_i1[6_o , \or_xor_i0[6]_i1[6]_o_o , \or_or_xor_i0[9]_i1[9_o );
  or \or_or_xor_i0[9]_i1[9  (\or_or_xor_i0[9]_i1[9_o , \or_xor_i0[9]_i1[9]_o_o , \or_xor_i0[11]_i1[11]_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \or_xor_i0[1]_i1[1]_o_o );
  or \or_xor_i0[11]_i1[11]  (\or_xor_i0[11]_i1[11]_o , \xor_i0[11]_i1[11]_o , \xor_i0[12]_i1[12]_o );
  or \or_xor_i0[1]_i1[1]_o  (\or_xor_i0[1]_i1[1]_o_o , \xor_i0[1]_i1[1]_o , \xor_i0[2]_i1[2]_o );
  or \or_xor_i0[3]_i1[3]_o  (\or_xor_i0[3]_i1[3]_o_o , \xor_i0[3]_i1[3]_o , \or_xor_i0[4]_i1[4]_o_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \or_xor_i0[7]_i1[7]_o_o );
  or \or_xor_i0[7]_i1[7]_o  (\or_xor_i0[7]_i1[7]_o_o , \xor_i0[7]_i1[7]_o , \xor_i0[8]_i1[8]_o );
  or \or_xor_i0[9]_i1[9]_o  (\or_xor_i0[9]_i1[9]_o_o , \xor_i0[9]_i1[9]_o , \xor_i0[10]_i1[10]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (\xor_i0[10]_i1[10]_o , i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (\xor_i0[11]_i1[11]_o , i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (\xor_i0[12]_i1[12]_o , i0[12], i1[12]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (\xor_i0[8]_i1[8]_o , i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (\xor_i0[9]_i1[9]_o , i0[9], i1[9]);

endmodule 

module eq_w13_2
  (
  i0,
  i1,
  o
  );

  input [12:0] i0;
  input [12:0] i1;
  output o;

  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[6]_i1[6_o ;
  wire \or_or_xor_i0[9]_i1[9_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[11]_i1[11]_o ;
  wire \or_xor_i0[1]_i1[1]_o_o ;
  wire \or_xor_i0[3]_i1[3]_o_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \or_xor_i0[7]_i1[7]_o_o ;
  wire \or_xor_i0[9]_i1[9]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[10]_i1[10]_o ;
  wire \xor_i0[11]_i1[11]_o ;
  wire \xor_i0[12]_i1[12]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, \or_or_or_xor_i0[0]_i_o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[6]_i1[6_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[3]_i1[3]_o_o );
  or \or_or_xor_i0[6]_i1[6  (\or_or_xor_i0[6]_i1[6_o , \or_xor_i0[6]_i1[6]_o_o , \or_or_xor_i0[9]_i1[9_o );
  or \or_or_xor_i0[9]_i1[9  (\or_or_xor_i0[9]_i1[9_o , \or_xor_i0[9]_i1[9]_o_o , \or_xor_i0[11]_i1[11]_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \or_xor_i0[1]_i1[1]_o_o );
  or \or_xor_i0[11]_i1[11]  (\or_xor_i0[11]_i1[11]_o , \xor_i0[11]_i1[11]_o , \xor_i0[12]_i1[12]_o );
  or \or_xor_i0[1]_i1[1]_o  (\or_xor_i0[1]_i1[1]_o_o , \xor_i0[1]_i1[1]_o , \xor_i0[2]_i1[2]_o );
  or \or_xor_i0[3]_i1[3]_o  (\or_xor_i0[3]_i1[3]_o_o , \xor_i0[3]_i1[3]_o , \or_xor_i0[4]_i1[4]_o_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \or_xor_i0[7]_i1[7]_o_o );
  or \or_xor_i0[7]_i1[7]_o  (\or_xor_i0[7]_i1[7]_o_o , \xor_i0[7]_i1[7]_o , \xor_i0[8]_i1[8]_o );
  or \or_xor_i0[9]_i1[9]_o  (\or_xor_i0[9]_i1[9]_o_o , \xor_i0[9]_i1[9]_o , \xor_i0[10]_i1[10]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (\xor_i0[10]_i1[10]_o , i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (\xor_i0[11]_i1[11]_o , i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (\xor_i0[12]_i1[12]_o , i0[12], i1[12]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (\xor_i0[8]_i1[8]_o , i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (\xor_i0[9]_i1[9]_o , i0[9], i1[9]);

endmodule 

module binary_mux_s1_w1_1
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s1_w1_2
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s1_w1_3
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s1_w1_4
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s1_w1_5
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s1_w1_6
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s1_w1_7
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s1_w1_8
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s1_w1_9
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s1_w1_10
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s1_w1_11
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s1_w1_12
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module binary_mux_s1_w1_13
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0_0 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

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

module add_pu13_pu13_o13
  (
  i0,
  i1,
  o
  );

  input [12:0] i0;
  input [12:0] i1;
  output [12:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a12;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_a9;
  wire net_b0;
  wire net_b1;
  wire net_b10;
  wire net_b11;
  wire net_b12;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_b9;
  wire net_cout0;
  wire net_cout1;
  wire net_cout10;
  wire net_cout11;
  wire net_cout12;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_cout9;
  wire net_sum0;
  wire net_sum1;
  wire net_sum10;
  wire net_sum11;
  wire net_sum12;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a12 = i0[12];
  assign net_a11 = i0[11];
  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b12 = i1[12];
  assign net_b11 = i1[11];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[12] = net_sum12;
  assign o[11] = net_sum11;
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_10 (
    .a(net_a10),
    .b(net_b10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD comp_11 (
    .a(net_a11),
    .b(net_b11),
    .c(net_cout10),
    .cout(net_cout11),
    .sum(net_sum11));
  AL_FADD comp_12 (
    .a(net_a12),
    .b(net_b12),
    .c(net_cout11),
    .cout(net_cout12),
    .sum(net_sum12));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD comp_8 (
    .a(net_a8),
    .b(net_b8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD comp_9 (
    .a(net_a9),
    .b(net_b9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));

endmodule 

module eq_w13
  (
  i0,
  i1,
  o
  );

  input [12:0] i0;
  input [12:0] i1;
  output o;

  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[6]_i1[6_o ;
  wire \or_or_xor_i0[9]_i1[9_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[11]_i1[11]_o ;
  wire \or_xor_i0[1]_i1[1]_o_o ;
  wire \or_xor_i0[3]_i1[3]_o_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \or_xor_i0[7]_i1[7]_o_o ;
  wire \or_xor_i0[9]_i1[9]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[10]_i1[10]_o ;
  wire \xor_i0[11]_i1[11]_o ;
  wire \xor_i0[12]_i1[12]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, \or_or_or_xor_i0[0]_i_o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[6]_i1[6_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[3]_i1[3]_o_o );
  or \or_or_xor_i0[6]_i1[6  (\or_or_xor_i0[6]_i1[6_o , \or_xor_i0[6]_i1[6]_o_o , \or_or_xor_i0[9]_i1[9_o );
  or \or_or_xor_i0[9]_i1[9  (\or_or_xor_i0[9]_i1[9_o , \or_xor_i0[9]_i1[9]_o_o , \or_xor_i0[11]_i1[11]_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \or_xor_i0[1]_i1[1]_o_o );
  or \or_xor_i0[11]_i1[11]  (\or_xor_i0[11]_i1[11]_o , \xor_i0[11]_i1[11]_o , \xor_i0[12]_i1[12]_o );
  or \or_xor_i0[1]_i1[1]_o  (\or_xor_i0[1]_i1[1]_o_o , \xor_i0[1]_i1[1]_o , \xor_i0[2]_i1[2]_o );
  or \or_xor_i0[3]_i1[3]_o  (\or_xor_i0[3]_i1[3]_o_o , \xor_i0[3]_i1[3]_o , \or_xor_i0[4]_i1[4]_o_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \or_xor_i0[7]_i1[7]_o_o );
  or \or_xor_i0[7]_i1[7]_o  (\or_xor_i0[7]_i1[7]_o_o , \xor_i0[7]_i1[7]_o , \xor_i0[8]_i1[8]_o );
  or \or_xor_i0[9]_i1[9]_o  (\or_xor_i0[9]_i1[9]_o_o , \xor_i0[9]_i1[9]_o , \xor_i0[10]_i1[10]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (\xor_i0[10]_i1[10]_o , i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (\xor_i0[11]_i1[11]_o , i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (\xor_i0[12]_i1[12]_o , i0[12], i1[12]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (\xor_i0[8]_i1[8]_o , i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (\xor_i0[9]_i1[9]_o , i0[9], i1[9]);

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

module add_pu8_pu8_o8
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output [7:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;

  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD comp_1 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_4 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD comp_5 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD comp_6 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD comp_7 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));

endmodule 

module lt_u8_u8
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [7:0] i0;
  input [7:0] i1;
  output o;

  wire [7:0] diff;
  wire diff_6_7;
  wire less_6_7;
  wire \less_6_7_inst/diff_0 ;
  wire \less_6_7_inst/diff_1 ;
  wire \less_6_7_inst/o_0 ;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;

  or any_diff_6_7 (diff_6_7, diff[6], diff[7]);
  xor diff_0 (diff[0], i0[0], i1[0]);
  xor diff_1 (diff[1], i0[1], i1[1]);
  xor diff_2 (diff[2], i0[2], i1[2]);
  xor diff_3 (diff[3], i0[3], i1[3]);
  xor diff_4 (diff[4], i0[4], i1[4]);
  xor diff_5 (diff[5], i0[5], i1[5]);
  xor diff_6 (diff[6], i0[6], i1[6]);
  xor diff_7 (diff[7], i0[7], i1[7]);
  AL_MUX \less_6_7_inst/mux_0  (
    .i0(1'b0),
    .i1(i1[6]),
    .sel(\less_6_7_inst/diff_0 ),
    .o(\less_6_7_inst/o_0 ));
  AL_MUX \less_6_7_inst/mux_1  (
    .i0(\less_6_7_inst/o_0 ),
    .i1(i1[7]),
    .sel(\less_6_7_inst/diff_1 ),
    .o(less_6_7));
  xor \less_6_7_inst/xor_0  (\less_6_7_inst/diff_0 , i0[6], i1[6]);
  xor \less_6_7_inst/xor_1  (\less_6_7_inst/diff_1 , i0[7], i1[7]);
  AL_MUX mux_0 (
    .i0(ci),
    .i1(i1[0]),
    .sel(diff[0]),
    .o(o_0));
  AL_MUX mux_1 (
    .i0(o_0),
    .i1(i1[1]),
    .sel(diff[1]),
    .o(o_1));
  AL_MUX mux_2 (
    .i0(o_1),
    .i1(i1[2]),
    .sel(diff[2]),
    .o(o_2));
  AL_MUX mux_3 (
    .i0(o_2),
    .i1(i1[3]),
    .sel(diff[3]),
    .o(o_3));
  AL_MUX mux_4 (
    .i0(o_3),
    .i1(i1[4]),
    .sel(diff[4]),
    .o(o_4));
  AL_MUX mux_5 (
    .i0(o_4),
    .i1(i1[5]),
    .sel(diff[5]),
    .o(o_5));
  AL_MUX mux_6 (
    .i0(o_5),
    .i1(less_6_7),
    .sel(diff_6_7),
    .o(o));

endmodule 

module AL_FADD
  (
  input a,
  input b,
  input c,
  output sum,
  output cout
  );

  wire prop;
  wire not_prop;
  wire sel_i0;
  wire sel_i1;

  xor u0 (prop, a, b);
  xor u1 (sum, prop, c);
  not u2 (not_prop, prop);
  and u3 (sel_i1, prop, c);
  and u4 (sel_i0, not_prop, a);
  or  u5 (cout, sel_i0, sel_i1);

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

