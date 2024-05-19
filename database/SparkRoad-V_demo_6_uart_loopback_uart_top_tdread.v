// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Thu Aug  8 15:34:40 2019

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
  wire n0;
  wire rx_int;  // source/rtl/uart_top.v(37)
  wire sys_rst_n;  // source/rtl/uart_top.v(31)

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
  speed_setting speed_rx (
    .bps_start(bps_start1),
    .clk(clk_25m),
    .rst_n(sys_rst_n),
    .clk_bps(clk_bps1));  // source/rtl/uart_top.v(57)
  speed_setting speed_tx (
    .bps_start(bps_start2),
    .clk(clk_25m),
    .rst_n(sys_rst_n),
    .clk_bps(clk_bps2));  // source/rtl/uart_top.v(86)
  not u0 (n0, ext_rst_n);  // source/rtl/uart_top.v(44)
  pll_test u_pll_test (
    .refclk(ext_clk_25m),
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
  wire [7:0] n28;
  wire [3:0] n30;
  wire [7:0] n31;
  wire [3:0] n32;
  wire [7:0] n33;
  wire [7:0] n34;
  wire [3:0] n35;
  wire [7:0] n36;
  wire [7:0] n37;
  wire [3:0] num;  // source/rtl/my_uart_rx.v(38)
  wire [7:0] rx_data_r;  // source/rtl/my_uart_rx.v(63)
  wire [7:0] rx_temp_data;  // source/rtl/my_uart_rx.v(64)
  wire bps_start_r;  // source/rtl/my_uart_rx.v(37)
  wire n0;
  wire n1;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n15;
  wire n16;
  wire n17;
  wire n19;
  wire n2;
  wire n20;
  wire n21;
  wire n22;
  wire n23;
  wire n24;
  wire n25;
  wire n26;
  wire n27;
  wire n29;
  wire n3;
  wire n38;
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;
  wire neg_uart_rx;  // source/rtl/my_uart_rx.v(14)
  wire uart_rx0;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx1;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx2;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx3;  // source/rtl/my_uart_rx.v(13)

  add_pu4_pu4_o4 add0 (
    .i0(num),
    .i1(4'b0001),
    .o(n18));  // source/rtl/my_uart_rx.v(78)
  AL_DFF bps_start_r_reg (
    .clk(clk),
    .d(n15),
    .reset(n17),
    .set(1'b0),
    .q(n10));  // source/rtl/my_uart_rx.v(57)
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
  AL_DFF i30 (
    .clk(clk),
    .d(n16),
    .reset(n17),
    .set(1'b0),
    .q(n14));  // source/rtl/my_uart_rx.v(57)
  binary_mux_s1_w4 mux0 (
    .i0(num),
    .i1(4'b0000),
    .sel(n6),
    .o(n30));  // source/rtl/my_uart_rx.v(95)
  binary_mux_s1_w8 mux1 (
    .i0(rx_data_r),
    .i1(rx_temp_data),
    .sel(n6),
    .o(n31));  // source/rtl/my_uart_rx.v(95)
  binary_mux_s1_w4 mux2 (
    .i0(n30),
    .i1(n18),
    .sel(clk_bps),
    .o(n32));  // source/rtl/my_uart_rx.v(95)
  binary_mux_s1_w8 mux3 (
    .i0(rx_temp_data),
    .i1(n28),
    .sel(clk_bps),
    .o(n33));  // source/rtl/my_uart_rx.v(95)
  binary_mux_s1_w8 mux4 (
    .i0(n31),
    .i1(rx_data_r),
    .sel(clk_bps),
    .o(n34));  // source/rtl/my_uart_rx.v(95)
  binary_mux_s1_w4 mux5 (
    .i0(num),
    .i1(n32),
    .sel(rx_int),
    .o(n35));  // source/rtl/my_uart_rx.v(96)
  binary_mux_s1_w8 mux6 (
    .i0(rx_temp_data),
    .i1(n33),
    .sel(rx_int),
    .o(n36));  // source/rtl/my_uart_rx.v(96)
  binary_mux_s1_w8 mux7 (
    .i0(rx_data_r),
    .i1(n34),
    .sel(rx_int),
    .o(n37));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n36),
    .reset({n17,n17,n17,n17,n17,n17,n17,n17}),
    .set(8'b00000000),
    .q(rx_temp_data));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w4 reg1 (
    .clk(clk),
    .d(n35),
    .reset({n17,n17,n17,n17}),
    .set(4'b0000),
    .q(num));  // source/rtl/my_uart_rx.v(96)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n37),
    .reset({n17,n17,n17,n17,n17,n17,n17,n17}),
    .set(8'b00000000),
    .q(rx_data_r));  // source/rtl/my_uart_rx.v(96)
  AL_DFF rx_int_reg (
    .clk(clk),
    .d(n9),
    .reset(n17),
    .set(1'b0),
    .q(rx_int));  // source/rtl/my_uart_rx.v(57)
  onehot_mux_s9_w8 sel0 (
    .i0(rx_temp_data),
    .i1({uart_rx,rx_temp_data[6:0]}),
    .i2({rx_temp_data[7],uart_rx,rx_temp_data[5:0]}),
    .i3({rx_temp_data[7:6],uart_rx,rx_temp_data[4:0]}),
    .i4({rx_temp_data[7:5],uart_rx,rx_temp_data[3:0]}),
    .i5({rx_temp_data[7:4],uart_rx,rx_temp_data[2:0]}),
    .i6({rx_temp_data[7:3],uart_rx,rx_temp_data[1:0]}),
    .i7({rx_temp_data[7:2],uart_rx,rx_temp_data[0]}),
    .i8({rx_temp_data[7:1],uart_rx}),
    .sel({n19,n20,n21,n22,n23,n24,n25,n26,n27}),
    .o(n28));  // source/rtl/my_uart_rx.v(89)
  and u10 (neg_uart_rx, n3, n4);  // source/rtl/my_uart_rx.v(34)
  or u11 (n38, n12, n5);  // source/rtl/my_uart_rx.v(89)
  buf u12 (rx_data[4], rx_data_r[4]);  // source/rtl/my_uart_rx.v(99)
  or u13 (n5, n20, n19);  // source/rtl/my_uart_rx.v(89)
  AL_MUX u14 (
    .i0(rx_int),
    .i1(1'b0),
    .sel(n6),
    .o(n7));  // source/rtl/my_uart_rx.v(57)
  buf u15 (rx_data[6], rx_data_r[6]);  // source/rtl/my_uart_rx.v(99)
  AL_MUX u16 (
    .i0(n7),
    .i1(1'b1),
    .sel(neg_uart_rx),
    .o(n9));  // source/rtl/my_uart_rx.v(57)
  or u17 (n12, n22, n21);  // source/rtl/my_uart_rx.v(89)
  or u18 (n13, n29, n0);  // source/rtl/my_uart_rx.v(89)
  or u19 (n11, neg_uart_rx, n6);  // source/rtl/my_uart_rx.v(57)
  not u2 (n27, n8);  // source/rtl/my_uart_rx.v(89)
  buf u20 (rx_data[3], rx_data_r[3]);  // source/rtl/my_uart_rx.v(99)
  or u21 (n0, n24, n23);  // source/rtl/my_uart_rx.v(89)
  buf u22 (rx_data[2], rx_data_r[2]);  // source/rtl/my_uart_rx.v(99)
  AL_MUX u23 (
    .i0(n10),
    .i1(neg_uart_rx),
    .sel(n11),
    .o(n15));  // source/rtl/my_uart_rx.v(57)
  AL_MUX u24 (
    .i0(n14),
    .i1(1'b1),
    .sel(n11),
    .o(n16));  // source/rtl/my_uart_rx.v(57)
  bufif1 u25 (bps_start_r, n10, n14);  // source/rtl/my_uart_rx.v(58)
  buf u26 (bps_start, bps_start_r);  // source/rtl/my_uart_rx.v(60)
  buf u27 (rx_data[7], rx_data_r[7]);  // source/rtl/my_uart_rx.v(99)
  buf u28 (rx_data[1], rx_data_r[1]);  // source/rtl/my_uart_rx.v(99)
  buf u29 (rx_data[0], rx_data_r[0]);  // source/rtl/my_uart_rx.v(99)
  or u3 (n8, n13, n38);  // source/rtl/my_uart_rx.v(89)
  or u30 (n29, n26, n25);  // source/rtl/my_uart_rx.v(89)
  not u4 (n17, rst_n);  // source/rtl/my_uart_rx.v(18)
  buf u5 (rx_data[5], rx_data_r[5]);  // source/rtl/my_uart_rx.v(99)
  and u6 (n1, uart_rx3, uart_rx2);  // source/rtl/my_uart_rx.v(34)
  not u7 (n2, uart_rx1);  // source/rtl/my_uart_rx.v(34)
  and u8 (n3, n1, n2);  // source/rtl/my_uart_rx.v(34)
  not u9 (n4, uart_rx0);  // source/rtl/my_uart_rx.v(34)
  AL_DFF uart_rx0_reg (
    .clk(clk),
    .d(uart_rx),
    .reset(n17),
    .set(1'b0),
    .q(uart_rx0));  // source/rtl/my_uart_rx.v(31)
  AL_DFF uart_rx1_reg (
    .clk(clk),
    .d(uart_rx0),
    .reset(n17),
    .set(1'b0),
    .q(uart_rx1));  // source/rtl/my_uart_rx.v(31)
  AL_DFF uart_rx2_reg (
    .clk(clk),
    .d(uart_rx1),
    .reset(n17),
    .set(1'b0),
    .q(uart_rx2));  // source/rtl/my_uart_rx.v(31)
  AL_DFF uart_rx3_reg (
    .clk(clk),
    .d(uart_rx2),
    .reset(n17),
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
  wire [3:0] n13;
  wire [3:0] n14;
  wire [3:0] n16;
  wire [7:0] n4;
  wire [3:0] num;  // source/rtl/my_uart_tx.v(38)
  wire [7:0] tx_data;  // source/rtl/my_uart_tx.v(35)
  wire bps_start_r;  // source/rtl/my_uart_tx.v(36)
  wire n0;
  wire n1;
  wire n10;
  wire n12;
  wire n15;
  wire n17;
  wire n2;
  wire n3;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;
  wire neg_rx_int;  // source/rtl/my_uart_tx.v(14)
  wire rx_int0;  // source/rtl/my_uart_tx.v(13)
  wire rx_int1;  // source/rtl/my_uart_tx.v(13)
  wire rx_int2;  // source/rtl/my_uart_tx.v(13)
  wire tx_en;  // source/rtl/my_uart_tx.v(37)
  wire uart_tx_r;  // source/rtl/my_uart_tx.v(64)

  add_pu4_pu4_o4 add0 (
    .i0(num),
    .i1(4'b0001),
    .o(n11));  // source/rtl/my_uart_tx.v(77)
  AL_DFF bps_start_r_reg (
    .clk(clk),
    .d(n9),
    .reset(n1),
    .set(1'b0),
    .q(n6));  // source/rtl/my_uart_tx.v(58)
  eq_w4 eq0 (
    .i0(num),
    .i1(4'b1010),
    .o(n2));  // source/rtl/my_uart_tx.v(54)
  AL_DFF i28 (
    .clk(clk),
    .d(n10),
    .reset(n1),
    .set(1'b0),
    .q(n8));  // source/rtl/my_uart_tx.v(58)
  binary_mux_s1_w8 mux0 (
    .i0(tx_data),
    .i1(rx_data),
    .sel(neg_rx_int),
    .o(n4));  // source/rtl/my_uart_tx.v(58)
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
    .o(n12));  // source/rtl/my_uart_tx.v(90)
  binary_mux_s1_w4 mux2 (
    .i0(num),
    .i1(4'b0000),
    .sel(n2),
    .o(n13));  // source/rtl/my_uart_tx.v(93)
  binary_mux_s1_w4 mux3 (
    .i0(n13),
    .i1(n11),
    .sel(clk_bps),
    .o(n14));  // source/rtl/my_uart_tx.v(93)
  binary_mux_s1_w4 mux4 (
    .i0(num),
    .i1(n14),
    .sel(tx_en),
    .o(n16));  // source/rtl/my_uart_tx.v(94)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n4),
    .reset({n1,n1,n1,n1,n1,n1,n1,n1}),
    .set(8'b00000000),
    .q(tx_data));  // source/rtl/my_uart_tx.v(58)
  reg_ar_as_w4 reg1 (
    .clk(clk),
    .d(n16),
    .reset({n1,n1,n1,n1}),
    .set(4'b0000),
    .q(num));  // source/rtl/my_uart_tx.v(94)
  AL_DFF rx_int0_reg (
    .clk(clk),
    .d(rx_int),
    .reset(n1),
    .set(1'b0),
    .q(rx_int0));  // source/rtl/my_uart_tx.v(29)
  AL_DFF rx_int1_reg (
    .clk(clk),
    .d(rx_int0),
    .reset(n1),
    .set(1'b0),
    .q(rx_int1));  // source/rtl/my_uart_tx.v(29)
  AL_DFF rx_int2_reg (
    .clk(clk),
    .d(rx_int1),
    .reset(n1),
    .set(1'b0),
    .q(rx_int2));  // source/rtl/my_uart_tx.v(29)
  AL_DFF tx_en_reg (
    .clk(clk),
    .d(n5),
    .reset(n1),
    .set(1'b0),
    .q(tx_en));  // source/rtl/my_uart_tx.v(58)
  bufif1 u10 (bps_start_r, n6, n8);  // source/rtl/my_uart_tx.v(59)
  buf u11 (bps_start, bps_start_r);  // source/rtl/my_uart_tx.v(61)
  AL_MUX u12 (
    .i0(uart_tx_r),
    .i1(n12),
    .sel(clk_bps),
    .o(n15));  // source/rtl/my_uart_tx.v(93)
  AL_MUX u13 (
    .i0(uart_tx_r),
    .i1(n15),
    .sel(tx_en),
    .o(n17));  // source/rtl/my_uart_tx.v(94)
  buf u14 (uart_tx, uart_tx_r);  // source/rtl/my_uart_tx.v(97)
  not u2 (n1, rst_n);  // source/rtl/my_uart_tx.v(18)
  not u3 (n0, rx_int1);  // source/rtl/my_uart_tx.v(32)
  and u4 (neg_rx_int, n0, rx_int2);  // source/rtl/my_uart_tx.v(32)
  AL_MUX u5 (
    .i0(tx_en),
    .i1(1'b0),
    .sel(n2),
    .o(n3));  // source/rtl/my_uart_tx.v(58)
  AL_MUX u6 (
    .i0(n3),
    .i1(1'b1),
    .sel(neg_rx_int),
    .o(n5));  // source/rtl/my_uart_tx.v(58)
  or u7 (n7, neg_rx_int, n2);  // source/rtl/my_uart_tx.v(58)
  AL_MUX u8 (
    .i0(n6),
    .i1(neg_rx_int),
    .sel(n7),
    .o(n9));  // source/rtl/my_uart_tx.v(58)
  AL_MUX u9 (
    .i0(n8),
    .i1(1'b1),
    .sel(n7),
    .o(n10));  // source/rtl/my_uart_tx.v(58)
  AL_DFF uart_tx_r_reg (
    .clk(clk),
    .d(n17),
    .reset(1'b0),
    .set(n1),
    .q(uart_tx_r));  // source/rtl/my_uart_tx.v(94)

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
  wire clk_bps_r;  // source/rtl/speed_setting.v(17)
  wire n0;
  wire n1;
  wire n2;
  wire n3;
  wire n6;

  add_pu13_pu13_o13 add0 (
    .i0(cnt),
    .i1(13'b0000000000001),
    .o(n4));  // source/rtl/speed_setting.v(27)
  AL_DFF clk_bps_r_reg (
    .clk(clk),
    .d(n6),
    .reset(n0),
    .set(1'b0),
    .q(clk_bps_r));  // source/rtl/speed_setting.v(37)
  eq_w13 eq0 (
    .i0(cnt),
    .i1(13'b0101000101100),
    .o(n1));  // source/rtl/speed_setting.v(24)
  eq_w13 eq1 (
    .i0(cnt),
    .i1(13'b0010100010110),
    .o(n6));  // source/rtl/speed_setting.v(34)
  binary_mux_s1_w13 mux0 (
    .i0(n4),
    .i1(13'b0000000000000),
    .sel(n3),
    .o(n5));  // source/rtl/speed_setting.v(27)
  reg_ar_as_w13 reg0 (
    .clk(clk),
    .d(n5),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(13'b0000000000000),
    .q(cnt));  // source/rtl/speed_setting.v(27)
  not u2 (n0, rst_n);  // source/rtl/speed_setting.v(22)
  not u3 (n2, bps_start);  // source/rtl/speed_setting.v(24)
  or u4 (n3, n1, n2);  // source/rtl/speed_setting.v(24)
  buf u5 (clk_bps, clk_bps_r);  // source/rtl/speed_setting.v(40)

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

module add_pu4_pu4_o4
  (
  i0,
  i1,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  output [3:0] o;



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



endmodule 

module binary_mux_s1_w4
  (
  i0,
  i1,
  sel,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  input sel;
  output [3:0] o;



endmodule 

module binary_mux_s1_w8
  (
  i0,
  i1,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input sel;
  output [7:0] o;



endmodule 

module reg_ar_as_w8
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [7:0] d;
  input en;
  input [7:0] reset;
  input [7:0] set;
  output [7:0] q;



endmodule 

module reg_ar_as_w4
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [3:0] d;
  input en;
  input [3:0] reset;
  input [3:0] set;
  output [3:0] q;



endmodule 

module onehot_mux_s9_w8
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  i8,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input [7:0] i2;
  input [7:0] i3;
  input [7:0] i4;
  input [7:0] i5;
  input [7:0] i6;
  input [7:0] i7;
  input [7:0] i8;
  input [8:0] sel;
  output [7:0] o;



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



endmodule 

module binary_mux_s1_w13
  (
  i0,
  i1,
  sel,
  o
  );

  input [12:0] i0;
  input [12:0] i1;
  input sel;
  output [12:0] o;



endmodule 

module reg_ar_as_w13
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [12:0] d;
  input en;
  input [12:0] reset;
  input [12:0] set;
  output [12:0] q;



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

