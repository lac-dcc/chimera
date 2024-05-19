// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by Tang Dynasty v5.6.59063
// Sat Oct  8 17:29:22 2022

`timescale 1ns / 1ps
module uart_top  // ../../source/rtl/uart_top.v(18)
  (
  ext_clk_25m,
  ext_rst_n,
  uart_rx,
  led,
  uart_tx
  );

  input ext_clk_25m;  // ../../source/rtl/uart_top.v(24)
  input ext_rst_n;  // ../../source/rtl/uart_top.v(25)
  input uart_rx;  // ../../source/rtl/uart_top.v(26)
  output led;  // ../../source/rtl/uart_top.v(28)
  output uart_tx;  // ../../source/rtl/uart_top.v(27)

  parameter BPS_SET = 96;
  parameter CLK_PERIORD = 40;
  wire [3:0] \my_uart_rx/num ;  // ../../source/rtl/my_uart_rx.v(38)
  wire [3:0] \my_uart_rx/num_b1 ;
  wire [3:0] \my_uart_rx/num_b2 ;
  wire [3:0] \my_uart_rx/num_b3 ;
  wire [7:0] \my_uart_rx/rx_data_r ;  // ../../source/rtl/my_uart_rx.v(63)
  wire [7:0] \my_uart_rx/rx_temp_data ;  // ../../source/rtl/my_uart_rx.v(64)
  wire [3:0] \my_uart_tx/num ;  // ../../source/rtl/my_uart_tx.v(38)
  wire [3:0] \my_uart_tx/num_b1 ;
  wire [3:0] \my_uart_tx/num_b2 ;
  wire [3:0] \my_uart_tx/num_b3 ;
  wire [7:0] \my_uart_tx/rx_data ;  // ../../source/rtl/my_uart_tx.v(7)
  wire [7:0] \my_uart_tx/tx_data ;  // ../../source/rtl/my_uart_tx.v(35)
  wire [12:0] \speed_rx/cnt ;  // ../../source/rtl/speed_setting.v(16)
  wire [12:0] \speed_rx/cnt_b ;
  wire [12:0] \speed_rx/cnt_b1 ;
  wire [12:0] \speed_tx/cnt ;  // ../../source/rtl/speed_setting.v(16)
  wire [12:0] \speed_tx/cnt_b ;
  wire [12:0] \speed_tx/cnt_b1 ;
  wire [7:0] \u_ram_rw_control/ram_input ;  // ../../source/rtl/ram_rw_control.v(18)
  wire [7:0] \u_ram_rw_control/ram_re_addr_b ;
  wire [7:0] \u_ram_rw_control/ram_wr_addr_b1 ;
  wire [7:0] \u_ram_rw_control/uut_Double_RAM/addrb ;  // ../../al_ip/Double_RAM_uut.v(36)
  wire sys_rst_n;  // ../../source/rtl/uart_top.v(35)
  wire \my_uart_rx/mux3_syn_11 ;  // ../../source/rtl/my_uart_rx.v(76)
  wire \my_uart_rx/mux3_syn_15 ;  // ../../source/rtl/my_uart_rx.v(76)
  wire \my_uart_rx/mux3_syn_19 ;  // ../../source/rtl/my_uart_rx.v(76)
  wire \my_uart_rx/mux3_syn_23 ;  // ../../source/rtl/my_uart_rx.v(76)
  wire \my_uart_rx/mux3_syn_27 ;  // ../../source/rtl/my_uart_rx.v(76)
  wire \my_uart_rx/mux3_syn_31 ;  // ../../source/rtl/my_uart_rx.v(76)
  wire \my_uart_rx/mux3_syn_35 ;  // ../../source/rtl/my_uart_rx.v(76)
  wire \my_uart_rx/mux3_syn_39 ;  // ../../source/rtl/my_uart_rx.v(76)
  wire \my_uart_rx/mux4_syn_11 ;  // ../../source/rtl/my_uart_rx.v(76)
  wire \my_uart_rx/mux5_syn_11 ;  // ../../source/rtl/my_uart_rx.v(74)
  wire \my_uart_rx/mux6_syn_11 ;  // ../../source/rtl/my_uart_rx.v(74)
  wire \my_uart_rx/mux6_syn_15 ;  // ../../source/rtl/my_uart_rx.v(74)
  wire \my_uart_rx/mux6_syn_19 ;  // ../../source/rtl/my_uart_rx.v(74)
  wire \my_uart_rx/mux6_syn_23 ;  // ../../source/rtl/my_uart_rx.v(74)
  wire \my_uart_rx/mux6_syn_27 ;  // ../../source/rtl/my_uart_rx.v(74)
  wire \my_uart_rx/mux6_syn_31 ;  // ../../source/rtl/my_uart_rx.v(74)
  wire \my_uart_rx/mux6_syn_35 ;  // ../../source/rtl/my_uart_rx.v(74)
  wire \my_uart_rx/mux6_syn_39 ;  // ../../source/rtl/my_uart_rx.v(74)
  wire \my_uart_rx/mux7_syn_11 ;  // ../../source/rtl/my_uart_rx.v(74)
  wire \my_uart_rx/sel0_syn_139 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_143 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_147 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_151 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_155 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_159 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_163 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_167 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_171 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_175 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_179 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_183 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_187 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_191 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_195 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_203 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_207 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_215 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_219 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_223 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_227 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/sel0_syn_231 ;  // ../../source/rtl/my_uart_rx.v(79)
  wire \my_uart_rx/num[3]_syn_11 ;  // ../../source/rtl/my_uart_rx.v(38)
  wire \my_uart_rx/num[3]_syn_28 ;  // ../../source/rtl/my_uart_rx.v(38)
  wire \my_uart_rx/num[3]_syn_32 ;  // ../../source/rtl/my_uart_rx.v(38)
  wire \my_uart_rx/num[2]_syn_2 ;  // ../../source/rtl/my_uart_rx.v(38)
  wire \my_uart_rx/num[1]_syn_2 ;  // ../../source/rtl/my_uart_rx.v(38)
  wire \my_uart_rx/num[0]_syn_2 ;  // ../../source/rtl/my_uart_rx.v(38)
  wire \my_uart_rx/bps_start_r ;  // ../../source/rtl/my_uart_rx.v(37)
  wire \my_uart_rx/bps_start_r_n ;
  wire \my_uart_rx/bps_start_r_n2 ;
  wire \my_uart_rx/bps_start_r_n3 ;
  wire \my_uart_rx/bps_start_r_n5 ;
  wire \my_uart_rx/neg_uart_rx ;  // ../../source/rtl/my_uart_rx.v(14)
  wire \my_uart_rx/neg_uart_rx_n ;
  wire \my_uart_rx/neg_uart_rx_n1 ;
  wire \my_uart_rx/neg_uart_rx_n2 ;
  wire \my_uart_rx/neg_uart_rx_n3 ;
  wire \my_uart_rx/rx_temp_data_b2_n ;
  wire \my_uart_rx/rx_temp_data_b2_n1 ;
  wire \my_uart_rx/rx_temp_data_b2_n2 ;
  wire \my_uart_rx/rx_temp_data_b2_n3 ;
  wire \my_uart_rx/rx_temp_data_b2_n4 ;
  wire \my_uart_rx/rx_temp_data_b2_n5 ;
  wire \my_uart_rx/rx_temp_data_b2_n7 ;
  wire \my_uart_rx/uart_rx0 ;  // ../../source/rtl/my_uart_rx.v(13)
  wire \my_uart_rx/uart_rx1 ;  // ../../source/rtl/my_uart_rx.v(13)
  wire \my_uart_rx/uart_rx2 ;  // ../../source/rtl/my_uart_rx.v(13)
  wire \my_uart_rx/uart_rx3 ;  // ../../source/rtl/my_uart_rx.v(13)
  wire \my_uart_tx/mux4_syn_11 ;  // ../../source/rtl/my_uart_tx.v(70)
  wire \my_uart_tx/bps_start_r ;  // ../../source/rtl/my_uart_tx.v(36)
  wire \my_uart_tx/bps_start_r_n ;
  wire \my_uart_tx/bps_start_r_n2 ;
  wire \my_uart_tx/bps_start_r_n3 ;
  wire \my_uart_tx/bps_start_r_n5 ;
  wire \my_uart_tx/neg_rx_int ;  // ../../source/rtl/my_uart_tx.v(16)
  wire \my_uart_tx/neg_rx_int_n ;
  wire \my_uart_tx/rx_int0 ;  // ../../source/rtl/my_uart_tx.v(15)
  wire \my_uart_tx/rx_int1 ;  // ../../source/rtl/my_uart_tx.v(15)
  wire \my_uart_tx/rx_int2 ;  // ../../source/rtl/my_uart_tx.v(15)
  wire \my_uart_tx/uart_tx_r_n2 ;
  wire \speed_rx/clk_bps_r ;  // ../../source/rtl/speed_setting.v(17)
  wire \speed_rx/clk_bps_r_syn_2 ;  // ../../source/rtl/speed_setting.v(17)
  wire \speed_rx/clk_bps_r_n ;
  wire \speed_rx/cnt_b_n ;
  wire \speed_rx/cnt_b_n1 ;
  wire \speed_rx/cnt_b_n2 ;
  wire \speed_tx/clk_bps_r ;  // ../../source/rtl/speed_setting.v(17)
  wire \speed_tx/clk_bps_r_n ;
  wire \speed_tx/cnt_b_n ;
  wire \speed_tx/cnt_b_n1 ;
  wire \speed_tx/cnt_b_n2 ;
  wire \u_pll_test/clk0_buf ;  // ../../al_ip/pll_test.v(40)
  wire \u_pll_test/reset ;  // ../../al_ip/pll_test.v(34)
  wire \u_ram_rw_control/LED_FLAG_n1 ;
  wire \u_ram_rw_control/neg_rx_int ;  // ../../source/rtl/ram_rw_control.v(15)
  wire \u_ram_rw_control/neg_rx_int_n ;
  wire \u_ram_rw_control/ram_rw_ce_r ;  // ../../source/rtl/ram_rw_control.v(20)
  wire \u_ram_rw_control/rx_int0 ;  // ../../source/rtl/ram_rw_control.v(14)
  wire \u_ram_rw_control/rx_int1 ;  // ../../source/rtl/ram_rw_control.v(14)
  wire \u_ram_rw_control/rx_int2 ;  // ../../source/rtl/ram_rw_control.v(14)
  wire \u_ram_rw_control/uut_Double_RAM/clkb ;  // ../../al_ip/Double_RAM_uut.v(40)

  not clk_100m_i (\u_pll_test/reset , ext_rst_n);  // ../../source/rtl/uart_top.v(52)
  add_pu4_pu4_o4 \my_uart_rx/add0  (
    .i0(\my_uart_rx/num ),
    .i1(4'b0001),
    .o(\my_uart_rx/num_b3 ));  // ../../source/rtl/my_uart_rx.v(78)
  or \my_uart_rx/bps_start_r_i2  (\my_uart_rx/bps_start_r_n2 , \my_uart_rx/neg_uart_rx , \my_uart_rx/bps_start_r_n3 );  // ../../source/rtl/my_uart_rx.v(48)
  and \my_uart_rx/bps_start_r_i_syn_1  (\my_uart_rx/bps_start_r , \my_uart_rx/bps_start_r_n , \my_uart_rx/bps_start_r_n5 );  // ../../source/rtl/my_uart_rx.v(41)
  AL_DFF_0 \my_uart_rx/bps_start_r_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/neg_uart_rx ),
    .en(\my_uart_rx/bps_start_r_n2 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/bps_start_r_n ));  // ../../source/rtl/my_uart_rx.v(43)
  eq_w4 \my_uart_rx/eq0  (
    .i0(\my_uart_rx/num ),
    .i1(4'b1001),
    .o(\my_uart_rx/bps_start_r_n3 ));  // ../../source/rtl/my_uart_rx.v(53)
  eq_w4 \my_uart_rx/eq1  (
    .i0(\my_uart_rx/num ),
    .i1(4'b0001),
    .o(\my_uart_rx/rx_temp_data_b2_n ));  // ../../source/rtl/my_uart_rx.v(80)
  eq_w4 \my_uart_rx/eq2  (
    .i0(\my_uart_rx/num ),
    .i1(4'b0010),
    .o(\my_uart_rx/rx_temp_data_b2_n1 ));  // ../../source/rtl/my_uart_rx.v(81)
  eq_w4 \my_uart_rx/eq3  (
    .i0(\my_uart_rx/num ),
    .i1(4'b0011),
    .o(\my_uart_rx/rx_temp_data_b2_n2 ));  // ../../source/rtl/my_uart_rx.v(82)
  eq_w4 \my_uart_rx/eq4  (
    .i0(\my_uart_rx/num ),
    .i1(4'b0100),
    .o(\my_uart_rx/rx_temp_data_b2_n3 ));  // ../../source/rtl/my_uart_rx.v(83)
  eq_w4 \my_uart_rx/eq5  (
    .i0(\my_uart_rx/num ),
    .i1(4'b0101),
    .o(\my_uart_rx/rx_temp_data_b2_n4 ));  // ../../source/rtl/my_uart_rx.v(84)
  eq_w4 \my_uart_rx/eq6  (
    .i0(\my_uart_rx/num ),
    .i1(4'b0110),
    .o(\my_uart_rx/rx_temp_data_b2_n5 ));  // ../../source/rtl/my_uart_rx.v(85)
  eq_w4 \my_uart_rx/eq8  (
    .i0(\my_uart_rx/num ),
    .i1(4'b1000),
    .o(\my_uart_rx/rx_temp_data_b2_n7 ));  // ../../source/rtl/my_uart_rx.v(87)
  AL_DFF_0 \my_uart_rx/i27_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(1'b1),
    .en(\my_uart_rx/bps_start_r_n2 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/bps_start_r_n5 ));  // ../../source/rtl/my_uart_rx.v(43)
  binary_mux_s1_w1 \my_uart_rx/mux0_syn_1  (
    .i0(\my_uart_rx/num [0]),
    .i1(1'b0),
    .sel(\my_uart_rx/bps_start_r_n3 ),
    .o(\my_uart_rx/num_b2 [0]));  // ../../source/rtl/my_uart_rx.v(91)
  binary_mux_s1_w1 \my_uart_rx/mux0_syn_4  (
    .i0(\my_uart_rx/num [3]),
    .i1(1'b0),
    .sel(\my_uart_rx/bps_start_r_n3 ),
    .o(\my_uart_rx/num_b2 [3]));  // ../../source/rtl/my_uart_rx.v(91)
  binary_mux_s1_w1 \my_uart_rx/mux2_syn_1  (
    .i0(\my_uart_rx/num_b2 [0]),
    .i1(\my_uart_rx/num_b3 [0]),
    .sel(\speed_rx/clk_bps_r ),
    .o(\my_uart_rx/num_b1 [0]));  // ../../source/rtl/my_uart_rx.v(76)
  binary_mux_s1_w1 \my_uart_rx/mux2_syn_4  (
    .i0(\my_uart_rx/num_b2 [3]),
    .i1(\my_uart_rx/num_b3 [3]),
    .sel(\speed_rx/clk_bps_r ),
    .o(\my_uart_rx/num_b1 [3]));  // ../../source/rtl/my_uart_rx.v(76)
  and \my_uart_rx/mux3_syn_10  (\my_uart_rx/mux3_syn_11 , \speed_rx/clk_bps_r , \my_uart_rx/sel0_syn_147 );  // ../../source/rtl/my_uart_rx.v(76)
  and \my_uart_rx/mux3_syn_14  (\my_uart_rx/mux3_syn_15 , \speed_rx/clk_bps_r , \my_uart_rx/sel0_syn_159 );  // ../../source/rtl/my_uart_rx.v(76)
  and \my_uart_rx/mux3_syn_18  (\my_uart_rx/mux3_syn_19 , \speed_rx/clk_bps_r , \my_uart_rx/sel0_syn_171 );  // ../../source/rtl/my_uart_rx.v(76)
  and \my_uart_rx/mux3_syn_22  (\my_uart_rx/mux3_syn_23 , \speed_rx/clk_bps_r , \my_uart_rx/sel0_syn_183 );  // ../../source/rtl/my_uart_rx.v(76)
  and \my_uart_rx/mux3_syn_26  (\my_uart_rx/mux3_syn_27 , \speed_rx/clk_bps_r , \my_uart_rx/sel0_syn_195 );  // ../../source/rtl/my_uart_rx.v(76)
  and \my_uart_rx/mux3_syn_30  (\my_uart_rx/mux3_syn_31 , \speed_rx/clk_bps_r , \my_uart_rx/sel0_syn_207 );  // ../../source/rtl/my_uart_rx.v(76)
  and \my_uart_rx/mux3_syn_34  (\my_uart_rx/mux3_syn_35 , \speed_rx/clk_bps_r , \my_uart_rx/sel0_syn_219 );  // ../../source/rtl/my_uart_rx.v(76)
  and \my_uart_rx/mux3_syn_38  (\my_uart_rx/mux3_syn_39 , \speed_rx/clk_bps_r , \my_uart_rx/sel0_syn_231 );  // ../../source/rtl/my_uart_rx.v(76)
  and \my_uart_rx/mux4_syn_10  (\my_uart_rx/mux4_syn_11 , \speed_rx/clk_bps_r_syn_2 , \my_uart_rx/bps_start_r_n3 );  // ../../source/rtl/my_uart_rx.v(76)
  and \my_uart_rx/mux5_syn_10  (\my_uart_rx/mux5_syn_11 , \my_uart_rx/bps_start_r_n , \speed_rx/clk_bps_r );  // ../../source/rtl/my_uart_rx.v(74)
  and \my_uart_rx/mux6_syn_10  (\my_uart_rx/mux6_syn_11 , \my_uart_rx/bps_start_r_n , \my_uart_rx/mux3_syn_11 );  // ../../source/rtl/my_uart_rx.v(74)
  and \my_uart_rx/mux6_syn_14  (\my_uart_rx/mux6_syn_15 , \my_uart_rx/bps_start_r_n , \my_uart_rx/mux3_syn_15 );  // ../../source/rtl/my_uart_rx.v(74)
  and \my_uart_rx/mux6_syn_18  (\my_uart_rx/mux6_syn_19 , \my_uart_rx/bps_start_r_n , \my_uart_rx/mux3_syn_19 );  // ../../source/rtl/my_uart_rx.v(74)
  and \my_uart_rx/mux6_syn_22  (\my_uart_rx/mux6_syn_23 , \my_uart_rx/bps_start_r_n , \my_uart_rx/mux3_syn_23 );  // ../../source/rtl/my_uart_rx.v(74)
  and \my_uart_rx/mux6_syn_26  (\my_uart_rx/mux6_syn_27 , \my_uart_rx/bps_start_r_n , \my_uart_rx/mux3_syn_27 );  // ../../source/rtl/my_uart_rx.v(74)
  and \my_uart_rx/mux6_syn_30  (\my_uart_rx/mux6_syn_31 , \my_uart_rx/bps_start_r_n , \my_uart_rx/mux3_syn_31 );  // ../../source/rtl/my_uart_rx.v(74)
  and \my_uart_rx/mux6_syn_34  (\my_uart_rx/mux6_syn_35 , \my_uart_rx/bps_start_r_n , \my_uart_rx/mux3_syn_35 );  // ../../source/rtl/my_uart_rx.v(74)
  and \my_uart_rx/mux6_syn_38  (\my_uart_rx/mux6_syn_39 , \my_uart_rx/bps_start_r_n , \my_uart_rx/mux3_syn_39 );  // ../../source/rtl/my_uart_rx.v(74)
  and \my_uart_rx/mux7_syn_10  (\my_uart_rx/mux7_syn_11 , \my_uart_rx/bps_start_r_n , \my_uart_rx/mux4_syn_11 );  // ../../source/rtl/my_uart_rx.v(74)
  and \my_uart_rx/neg_uart_rx_i  (\my_uart_rx/neg_uart_rx , \my_uart_rx/neg_uart_rx_n , \my_uart_rx/neg_uart_rx_n3 );  // ../../source/rtl/my_uart_rx.v(34)
  and \my_uart_rx/neg_uart_rx_i1  (\my_uart_rx/neg_uart_rx_n , \my_uart_rx/neg_uart_rx_n1 , \my_uart_rx/neg_uart_rx_n2 );  // ../../source/rtl/my_uart_rx.v(34)
  and \my_uart_rx/neg_uart_rx_i2  (\my_uart_rx/neg_uart_rx_n1 , \my_uart_rx/uart_rx3 , \my_uart_rx/uart_rx2 );  // ../../source/rtl/my_uart_rx.v(34)
  not \my_uart_rx/neg_uart_rx_i3  (\my_uart_rx/neg_uart_rx_n2 , \my_uart_rx/uart_rx1 );  // ../../source/rtl/my_uart_rx.v(34)
  not \my_uart_rx/neg_uart_rx_i4  (\my_uart_rx/neg_uart_rx_n3 , \my_uart_rx/uart_rx0 );  // ../../source/rtl/my_uart_rx.v(34)
  not \my_uart_rx/num[0]_syn_1  (\my_uart_rx/num[0]_syn_2 , \my_uart_rx/num [0]);  // ../../source/rtl/my_uart_rx.v(38)
  not \my_uart_rx/num[1]_syn_1  (\my_uart_rx/num[1]_syn_2 , \my_uart_rx/num [1]);  // ../../source/rtl/my_uart_rx.v(38)
  not \my_uart_rx/num[2]_syn_1  (\my_uart_rx/num[2]_syn_2 , \my_uart_rx/num [2]);  // ../../source/rtl/my_uart_rx.v(38)
  not \my_uart_rx/num[3]_syn_10  (\my_uart_rx/num[3]_syn_11 , \my_uart_rx/num [3]);  // ../../source/rtl/my_uart_rx.v(38)
  and \my_uart_rx/num[3]_syn_25  (\my_uart_rx/num[3]_syn_28 , \my_uart_rx/num[3]_syn_11 , \my_uart_rx/num [2], \my_uart_rx/num [1], \my_uart_rx/num [0]);  // ../../source/rtl/my_uart_rx.v(38)
  or \my_uart_rx/num[3]_syn_31  (\my_uart_rx/num[3]_syn_32 , \my_uart_rx/rx_temp_data_b2_n , \my_uart_rx/rx_temp_data_b2_n1 , \my_uart_rx/rx_temp_data_b2_n2 , \my_uart_rx/rx_temp_data_b2_n3 , \my_uart_rx/rx_temp_data_b2_n4 , \my_uart_rx/rx_temp_data_b2_n5 , \my_uart_rx/num[3]_syn_28 , \my_uart_rx/rx_temp_data_b2_n7 );  // ../../source/rtl/my_uart_rx.v(38)
  AL_DFF_0 \my_uart_rx/reg0_syn_6  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/num_b1 [0]),
    .en(\my_uart_rx/bps_start_r_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/num [0]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg0_syn_7  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/num_b3 [1]),
    .en(\my_uart_rx/mux5_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/num [1]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg0_syn_8  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/num_b3 [2]),
    .en(\my_uart_rx/mux5_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/num [2]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg0_syn_9  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/num_b1 [3]),
    .en(\my_uart_rx/bps_start_r_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/num [3]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg1_syn_10  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/rx_temp_data [0]),
    .en(\my_uart_rx/mux7_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_data_r [0]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg1_syn_11  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/rx_temp_data [1]),
    .en(\my_uart_rx/mux7_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_data_r [1]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg1_syn_12  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/rx_temp_data [2]),
    .en(\my_uart_rx/mux7_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_data_r [2]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg1_syn_13  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/rx_temp_data [3]),
    .en(\my_uart_rx/mux7_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_data_r [3]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg1_syn_14  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/rx_temp_data [4]),
    .en(\my_uart_rx/mux7_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_data_r [4]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg1_syn_15  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/rx_temp_data [5]),
    .en(\my_uart_rx/mux7_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_data_r [5]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg1_syn_16  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/rx_temp_data [6]),
    .en(\my_uart_rx/mux7_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_data_r [6]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg1_syn_17  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/rx_temp_data [7]),
    .en(\my_uart_rx/mux7_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_data_r [7]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg2_syn_10  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(uart_rx),
    .en(\my_uart_rx/mux6_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_temp_data [0]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg2_syn_11  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(uart_rx),
    .en(\my_uart_rx/mux6_syn_15 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_temp_data [1]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg2_syn_12  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(uart_rx),
    .en(\my_uart_rx/mux6_syn_19 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_temp_data [2]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg2_syn_13  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(uart_rx),
    .en(\my_uart_rx/mux6_syn_23 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_temp_data [3]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg2_syn_14  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(uart_rx),
    .en(\my_uart_rx/mux6_syn_27 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_temp_data [4]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg2_syn_15  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(uart_rx),
    .en(\my_uart_rx/mux6_syn_31 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_temp_data [5]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg2_syn_16  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(uart_rx),
    .en(\my_uart_rx/mux6_syn_35 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_temp_data [6]));  // ../../source/rtl/my_uart_rx.v(68)
  AL_DFF_0 \my_uart_rx/reg2_syn_17  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(uart_rx),
    .en(\my_uart_rx/mux6_syn_39 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/rx_temp_data [7]));  // ../../source/rtl/my_uart_rx.v(68)
  and \my_uart_rx/sel0_syn_138  (\my_uart_rx/sel0_syn_139 , \my_uart_rx/num[1]_syn_2 , \my_uart_rx/num[3]_syn_11 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_142  (\my_uart_rx/sel0_syn_143 , \my_uart_rx/num[2]_syn_2 , \my_uart_rx/sel0_syn_139 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_146  (\my_uart_rx/sel0_syn_147 , \my_uart_rx/num[3]_syn_32 , \my_uart_rx/sel0_syn_143 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_150  (\my_uart_rx/sel0_syn_151 , \my_uart_rx/num [1], \my_uart_rx/num[0]_syn_2 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_154  (\my_uart_rx/sel0_syn_155 , \my_uart_rx/num[2]_syn_2 , \my_uart_rx/sel0_syn_151 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_158  (\my_uart_rx/sel0_syn_159 , \my_uart_rx/num[3]_syn_32 , \my_uart_rx/sel0_syn_155 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_162  (\my_uart_rx/sel0_syn_163 , \my_uart_rx/num [1], \my_uart_rx/num [0]);  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_166  (\my_uart_rx/sel0_syn_167 , \my_uart_rx/num[2]_syn_2 , \my_uart_rx/sel0_syn_163 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_170  (\my_uart_rx/sel0_syn_171 , \my_uart_rx/num[3]_syn_32 , \my_uart_rx/sel0_syn_167 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_174  (\my_uart_rx/sel0_syn_175 , \my_uart_rx/num[1]_syn_2 , \my_uart_rx/num[0]_syn_2 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_178  (\my_uart_rx/sel0_syn_179 , \my_uart_rx/num [2], \my_uart_rx/sel0_syn_175 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_182  (\my_uart_rx/sel0_syn_183 , \my_uart_rx/num[3]_syn_32 , \my_uart_rx/sel0_syn_179 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_186  (\my_uart_rx/sel0_syn_187 , \my_uart_rx/num[1]_syn_2 , \my_uart_rx/num [0]);  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_190  (\my_uart_rx/sel0_syn_191 , \my_uart_rx/num [2], \my_uart_rx/sel0_syn_187 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_194  (\my_uart_rx/sel0_syn_195 , \my_uart_rx/num[3]_syn_32 , \my_uart_rx/sel0_syn_191 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_202  (\my_uart_rx/sel0_syn_203 , \my_uart_rx/num [2], \my_uart_rx/sel0_syn_151 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_206  (\my_uart_rx/sel0_syn_207 , \my_uart_rx/num[3]_syn_32 , \my_uart_rx/sel0_syn_203 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_214  (\my_uart_rx/sel0_syn_215 , \my_uart_rx/num [2], \my_uart_rx/sel0_syn_163 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_218  (\my_uart_rx/sel0_syn_219 , \my_uart_rx/num[3]_syn_32 , \my_uart_rx/sel0_syn_215 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_222  (\my_uart_rx/sel0_syn_223 , \my_uart_rx/num[1]_syn_2 , \my_uart_rx/num [3]);  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_226  (\my_uart_rx/sel0_syn_227 , \my_uart_rx/num[2]_syn_2 , \my_uart_rx/sel0_syn_223 );  // ../../source/rtl/my_uart_rx.v(79)
  and \my_uart_rx/sel0_syn_230  (\my_uart_rx/sel0_syn_231 , \my_uart_rx/num[3]_syn_32 , \my_uart_rx/sel0_syn_227 );  // ../../source/rtl/my_uart_rx.v(79)
  AL_DFF_0 \my_uart_rx/uart_rx0_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(uart_rx),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/uart_rx0 ));  // ../../source/rtl/my_uart_rx.v(18)
  AL_DFF_0 \my_uart_rx/uart_rx1_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/uart_rx0 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/uart_rx1 ));  // ../../source/rtl/my_uart_rx.v(18)
  AL_DFF_0 \my_uart_rx/uart_rx2_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/uart_rx1 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/uart_rx2 ));  // ../../source/rtl/my_uart_rx.v(18)
  AL_DFF_0 \my_uart_rx/uart_rx3_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/uart_rx2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_rx/uart_rx3 ));  // ../../source/rtl/my_uart_rx.v(18)
  add_pu4_pu4_o4 \my_uart_tx/add0  (
    .i0(\my_uart_tx/num ),
    .i1(4'b0001),
    .o(\my_uart_tx/num_b3 ));  // ../../source/rtl/my_uart_tx.v(74)
  or \my_uart_tx/bps_start_r_i2  (\my_uart_tx/bps_start_r_n2 , \my_uart_tx/neg_rx_int , \my_uart_tx/bps_start_r_n3 );  // ../../source/rtl/my_uart_tx.v(47)
  and \my_uart_tx/bps_start_r_i_syn_1  (\my_uart_tx/bps_start_r , \my_uart_tx/bps_start_r_n , \my_uart_tx/bps_start_r_n5 );  // ../../source/rtl/my_uart_tx.v(40)
  AL_DFF_0 \my_uart_tx/bps_start_r_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/neg_rx_int ),
    .en(\my_uart_tx/bps_start_r_n2 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/bps_start_r_n ));  // ../../source/rtl/my_uart_tx.v(41)
  eq_w4 \my_uart_tx/eq0  (
    .i0(\my_uart_tx/num ),
    .i1(4'b1010),
    .o(\my_uart_tx/bps_start_r_n3 ));  // ../../source/rtl/my_uart_tx.v(53)
  AL_DFF_0 \my_uart_tx/i25_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(1'b1),
    .en(\my_uart_tx/bps_start_r_n2 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/bps_start_r_n5 ));  // ../../source/rtl/my_uart_tx.v(41)
  binary_mux_s4_w1 \my_uart_tx/mux0  (
    .i0(1'b0),
    .i1(\my_uart_tx/tx_data [0]),
    .i10(1'b1),
    .i11(1'b1),
    .i12(1'b1),
    .i13(1'b1),
    .i14(1'b1),
    .i15(1'b1),
    .i2(\my_uart_tx/tx_data [1]),
    .i3(\my_uart_tx/tx_data [2]),
    .i4(\my_uart_tx/tx_data [3]),
    .i5(\my_uart_tx/tx_data [4]),
    .i6(\my_uart_tx/tx_data [5]),
    .i7(\my_uart_tx/tx_data [6]),
    .i8(\my_uart_tx/tx_data [7]),
    .i9(1'b1),
    .sel(\my_uart_tx/num ),
    .o(\my_uart_tx/uart_tx_r_n2 ));  // ../../source/rtl/my_uart_tx.v(75)
  binary_mux_s1_w1 \my_uart_tx/mux2_syn_2  (
    .i0(\my_uart_tx/num [1]),
    .i1(1'b0),
    .sel(\my_uart_tx/bps_start_r_n3 ),
    .o(\my_uart_tx/num_b2 [1]));  // ../../source/rtl/my_uart_tx.v(89)
  binary_mux_s1_w1 \my_uart_tx/mux2_syn_4  (
    .i0(\my_uart_tx/num [3]),
    .i1(1'b0),
    .sel(\my_uart_tx/bps_start_r_n3 ),
    .o(\my_uart_tx/num_b2 [3]));  // ../../source/rtl/my_uart_tx.v(89)
  binary_mux_s1_w1 \my_uart_tx/mux3_syn_2  (
    .i0(\my_uart_tx/num_b2 [1]),
    .i1(\my_uart_tx/num_b3 [1]),
    .sel(\speed_tx/clk_bps_r ),
    .o(\my_uart_tx/num_b1 [1]));  // ../../source/rtl/my_uart_tx.v(72)
  binary_mux_s1_w1 \my_uart_tx/mux3_syn_4  (
    .i0(\my_uart_tx/num_b2 [3]),
    .i1(\my_uart_tx/num_b3 [3]),
    .sel(\speed_tx/clk_bps_r ),
    .o(\my_uart_tx/num_b1 [3]));  // ../../source/rtl/my_uart_tx.v(72)
  and \my_uart_tx/mux4_syn_10  (\my_uart_tx/mux4_syn_11 , \my_uart_tx/bps_start_r_n , \speed_tx/clk_bps_r );  // ../../source/rtl/my_uart_tx.v(70)
  and \my_uart_tx/neg_rx_int_i  (\my_uart_tx/neg_rx_int , \my_uart_tx/neg_rx_int_n , \my_uart_tx/rx_int2 );  // ../../source/rtl/my_uart_tx.v(32)
  not \my_uart_tx/neg_rx_int_i1  (\my_uart_tx/neg_rx_int_n , \my_uart_tx/rx_int1 );  // ../../source/rtl/my_uart_tx.v(32)
  AL_DFF_0 \my_uart_tx/reg0_syn_6  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/num_b3 [0]),
    .en(\my_uart_tx/mux4_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/num [0]));  // ../../source/rtl/my_uart_tx.v(65)
  AL_DFF_0 \my_uart_tx/reg0_syn_7  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/num_b1 [1]),
    .en(\my_uart_tx/bps_start_r_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/num [1]));  // ../../source/rtl/my_uart_tx.v(65)
  AL_DFF_0 \my_uart_tx/reg0_syn_8  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/num_b3 [2]),
    .en(\my_uart_tx/mux4_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/num [2]));  // ../../source/rtl/my_uart_tx.v(65)
  AL_DFF_0 \my_uart_tx/reg0_syn_9  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/num_b1 [3]),
    .en(\my_uart_tx/bps_start_r_n ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/num [3]));  // ../../source/rtl/my_uart_tx.v(65)
  AL_DFF_0 \my_uart_tx/reg1_syn_10  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/rx_data [0]),
    .en(\my_uart_tx/neg_rx_int ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/tx_data [0]));  // ../../source/rtl/my_uart_tx.v(41)
  AL_DFF_0 \my_uart_tx/reg1_syn_11  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/rx_data [1]),
    .en(\my_uart_tx/neg_rx_int ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/tx_data [1]));  // ../../source/rtl/my_uart_tx.v(41)
  AL_DFF_0 \my_uart_tx/reg1_syn_12  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/rx_data [2]),
    .en(\my_uart_tx/neg_rx_int ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/tx_data [2]));  // ../../source/rtl/my_uart_tx.v(41)
  AL_DFF_0 \my_uart_tx/reg1_syn_13  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/rx_data [3]),
    .en(\my_uart_tx/neg_rx_int ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/tx_data [3]));  // ../../source/rtl/my_uart_tx.v(41)
  AL_DFF_0 \my_uart_tx/reg1_syn_14  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/rx_data [4]),
    .en(\my_uart_tx/neg_rx_int ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/tx_data [4]));  // ../../source/rtl/my_uart_tx.v(41)
  AL_DFF_0 \my_uart_tx/reg1_syn_15  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/rx_data [5]),
    .en(\my_uart_tx/neg_rx_int ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/tx_data [5]));  // ../../source/rtl/my_uart_tx.v(41)
  AL_DFF_0 \my_uart_tx/reg1_syn_16  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/rx_data [6]),
    .en(\my_uart_tx/neg_rx_int ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/tx_data [6]));  // ../../source/rtl/my_uart_tx.v(41)
  AL_DFF_0 \my_uart_tx/reg1_syn_17  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/rx_data [7]),
    .en(\my_uart_tx/neg_rx_int ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/tx_data [7]));  // ../../source/rtl/my_uart_tx.v(41)
  AL_DFF_0 \my_uart_tx/rx_int0_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_rw_ce_r ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/rx_int0 ));  // ../../source/rtl/my_uart_tx.v(19)
  AL_DFF_0 \my_uart_tx/rx_int1_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/rx_int0 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/rx_int1 ));  // ../../source/rtl/my_uart_tx.v(19)
  AL_DFF_0 \my_uart_tx/rx_int2_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/rx_int1 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\my_uart_tx/rx_int2 ));  // ../../source/rtl/my_uart_tx.v(19)
  AL_DFF_X \my_uart_tx/uart_tx_r_reg  (
    .ar(1'b0),
    .as(~sys_rst_n),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_tx/uart_tx_r_n2 ),
    .en(\my_uart_tx/mux4_syn_11 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(uart_tx));  // ../../source/rtl/my_uart_tx.v(65)
  add_pu13_pu13_o13 \speed_rx/add0  (
    .i0(\speed_rx/cnt ),
    .i1(13'b0000000000001),
    .o(\speed_rx/cnt_b1 ));  // ../../source/rtl/speed_setting.v(27)
  AL_DFF_0 \speed_rx/clk_bps_r_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/clk_bps_r_n ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/clk_bps_r ));  // ../../source/rtl/speed_setting.v(32)
  not \speed_rx/clk_bps_r_syn_1  (\speed_rx/clk_bps_r_syn_2 , \speed_rx/clk_bps_r );  // ../../source/rtl/speed_setting.v(17)
  or \speed_rx/cnt_b_i  (\speed_rx/cnt_b_n , \speed_rx/cnt_b_n1 , \speed_rx/cnt_b_n2 );  // ../../source/rtl/speed_setting.v(24)
  not \speed_rx/cnt_b_i1  (\speed_rx/cnt_b_n2 , \my_uart_rx/bps_start_r );  // ../../source/rtl/speed_setting.v(24)
  eq_w13 \speed_rx/eq0  (
    .i0(\speed_rx/cnt ),
    .i1(13'b0010100010110),
    .o(\speed_rx/clk_bps_r_n ));  // ../../source/rtl/speed_setting.v(34)
  eq_w13 \speed_rx/eq1  (
    .i0(\speed_rx/cnt ),
    .i1(13'b0101000101100),
    .o(\speed_rx/cnt_b_n1 ));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_1  (
    .i0(\speed_rx/cnt_b1 [0]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [0]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_10  (
    .i0(\speed_rx/cnt_b1 [9]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [9]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_11  (
    .i0(\speed_rx/cnt_b1 [10]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [10]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_12  (
    .i0(\speed_rx/cnt_b1 [11]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [11]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_13  (
    .i0(\speed_rx/cnt_b1 [12]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [12]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_2  (
    .i0(\speed_rx/cnt_b1 [1]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [1]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_3  (
    .i0(\speed_rx/cnt_b1 [2]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [2]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_4  (
    .i0(\speed_rx/cnt_b1 [3]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [3]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_5  (
    .i0(\speed_rx/cnt_b1 [4]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [4]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_6  (
    .i0(\speed_rx/cnt_b1 [5]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [5]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_7  (
    .i0(\speed_rx/cnt_b1 [6]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [6]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_8  (
    .i0(\speed_rx/cnt_b1 [7]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [7]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_rx/mux0_syn_9  (
    .i0(\speed_rx/cnt_b1 [8]),
    .i1(1'b0),
    .sel(\speed_rx/cnt_b_n ),
    .o(\speed_rx/cnt_b [8]));  // ../../source/rtl/speed_setting.v(24)
  AL_DFF_0 \speed_rx/reg0_syn_15  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [0]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_rx/reg0_syn_16  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [1]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_rx/reg0_syn_17  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [2]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_rx/reg0_syn_18  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [3]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_rx/reg0_syn_19  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [4]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_rx/reg0_syn_20  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [5]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_rx/reg0_syn_21  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [6]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [6]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_rx/reg0_syn_22  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [7]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [7]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_rx/reg0_syn_23  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [8]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [8]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_rx/reg0_syn_24  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [9]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [9]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_rx/reg0_syn_25  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [10]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [10]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_rx/reg0_syn_26  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [11]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [11]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_rx/reg0_syn_27  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_rx/cnt_b [12]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_rx/cnt [12]));  // ../../source/rtl/speed_setting.v(22)
  add_pu13_pu13_o13 \speed_tx/add0  (
    .i0(\speed_tx/cnt ),
    .i1(13'b0000000000001),
    .o(\speed_tx/cnt_b1 ));  // ../../source/rtl/speed_setting.v(27)
  AL_DFF_0 \speed_tx/clk_bps_r_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/clk_bps_r_n ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/clk_bps_r ));  // ../../source/rtl/speed_setting.v(32)
  or \speed_tx/cnt_b_i  (\speed_tx/cnt_b_n , \speed_tx/cnt_b_n1 , \speed_tx/cnt_b_n2 );  // ../../source/rtl/speed_setting.v(24)
  not \speed_tx/cnt_b_i1  (\speed_tx/cnt_b_n2 , \my_uart_tx/bps_start_r );  // ../../source/rtl/speed_setting.v(24)
  eq_w13 \speed_tx/eq0  (
    .i0(\speed_tx/cnt ),
    .i1(13'b0010100010110),
    .o(\speed_tx/clk_bps_r_n ));  // ../../source/rtl/speed_setting.v(34)
  eq_w13 \speed_tx/eq1  (
    .i0(\speed_tx/cnt ),
    .i1(13'b0101000101100),
    .o(\speed_tx/cnt_b_n1 ));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_1  (
    .i0(\speed_tx/cnt_b1 [0]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [0]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_10  (
    .i0(\speed_tx/cnt_b1 [9]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [9]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_11  (
    .i0(\speed_tx/cnt_b1 [10]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [10]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_12  (
    .i0(\speed_tx/cnt_b1 [11]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [11]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_13  (
    .i0(\speed_tx/cnt_b1 [12]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [12]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_2  (
    .i0(\speed_tx/cnt_b1 [1]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [1]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_3  (
    .i0(\speed_tx/cnt_b1 [2]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [2]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_4  (
    .i0(\speed_tx/cnt_b1 [3]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [3]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_5  (
    .i0(\speed_tx/cnt_b1 [4]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [4]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_6  (
    .i0(\speed_tx/cnt_b1 [5]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [5]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_7  (
    .i0(\speed_tx/cnt_b1 [6]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [6]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_8  (
    .i0(\speed_tx/cnt_b1 [7]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [7]));  // ../../source/rtl/speed_setting.v(24)
  binary_mux_s1_w1 \speed_tx/mux0_syn_9  (
    .i0(\speed_tx/cnt_b1 [8]),
    .i1(1'b0),
    .sel(\speed_tx/cnt_b_n ),
    .o(\speed_tx/cnt_b [8]));  // ../../source/rtl/speed_setting.v(24)
  AL_DFF_0 \speed_tx/reg0_syn_15  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [0]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_tx/reg0_syn_16  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [1]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_tx/reg0_syn_17  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [2]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_tx/reg0_syn_18  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [3]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_tx/reg0_syn_19  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [4]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_tx/reg0_syn_20  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [5]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_tx/reg0_syn_21  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [6]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [6]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_tx/reg0_syn_22  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [7]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [7]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_tx/reg0_syn_23  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [8]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [8]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_tx/reg0_syn_24  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [9]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [9]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_tx/reg0_syn_25  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [10]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [10]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_tx/reg0_syn_26  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [11]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [11]));  // ../../source/rtl/speed_setting.v(22)
  AL_DFF_0 \speed_tx/reg0_syn_27  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\speed_tx/cnt_b [12]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\speed_tx/cnt [12]));  // ../../source/rtl/speed_setting.v(22)
  EG_LOGIC_BUFG \u_pll_test/bufg_feedback  (
    .i(\u_pll_test/clk0_buf ),
    .o(\u_ram_rw_control/uut_Double_RAM/clkb ));  // ../../al_ip/pll_test.v(42)
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
    .GMC_GAIN(2),
    .GMC_TEST(14),
    .ICP_CURRENT(9),
    .IF_ESCLKSTSW("DISABLE"),
    .INTFB_WAKE("DISABLE"),
    .KVCO(2),
    .LPF_CAPACITOR(1),
    .LPF_RESISTOR(8),
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
    \u_pll_test/pll_inst  (
    .daddr(6'b000000),
    .dclk(1'b0),
    .dcs(1'b0),
    .di(8'b00000000),
    .dwe(1'b0),
    .fbclk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .load_reg(1'b0),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(ext_clk_25m),
    .reset(\u_pll_test/reset ),
    .stdby(1'b0),
    .clkc({open_n0,open_n1,open_n2,open_n3,\u_pll_test/clk0_buf }),
    .extlock(sys_rst_n));  // ../../al_ip/pll_test.v(77)
  AL_DFF_X \u_ram_rw_control/LED_FLAG_reg  (
    .ar(1'b0),
    .as(~sys_rst_n),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(1'b0),
    .en(~\u_ram_rw_control/LED_FLAG_n1 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(led));  // ../../source/rtl/ram_rw_control.v(50)
  add_pu8_pu8_o8 \u_ram_rw_control/add0  (
    .i0(\u_ram_rw_control/ram_input ),
    .i1(8'b00000001),
    .o(\u_ram_rw_control/ram_wr_addr_b1 ));  // ../../source/rtl/ram_rw_control.v(58)
  lt_u8_u8 \u_ram_rw_control/lt0  (
    .ci(1'b0),
    .i0(\u_ram_rw_control/ram_input ),
    .i1(8'b11111111),
    .o(\u_ram_rw_control/LED_FLAG_n1 ));  // ../../source/rtl/ram_rw_control.v(56)
  binary_mux_s1_w1 \u_ram_rw_control/mux2_syn_1  (
    .i0(1'b0),
    .i1(\my_uart_rx/rx_data_r [0]),
    .sel(\u_ram_rw_control/neg_rx_int ),
    .o(\u_ram_rw_control/ram_re_addr_b [0]));  // ../../source/rtl/ram_rw_control.v(77)
  binary_mux_s1_w1 \u_ram_rw_control/mux2_syn_2  (
    .i0(1'b0),
    .i1(\my_uart_rx/rx_data_r [1]),
    .sel(\u_ram_rw_control/neg_rx_int ),
    .o(\u_ram_rw_control/ram_re_addr_b [1]));  // ../../source/rtl/ram_rw_control.v(77)
  binary_mux_s1_w1 \u_ram_rw_control/mux2_syn_3  (
    .i0(1'b0),
    .i1(\my_uart_rx/rx_data_r [2]),
    .sel(\u_ram_rw_control/neg_rx_int ),
    .o(\u_ram_rw_control/ram_re_addr_b [2]));  // ../../source/rtl/ram_rw_control.v(77)
  binary_mux_s1_w1 \u_ram_rw_control/mux2_syn_4  (
    .i0(1'b0),
    .i1(\my_uart_rx/rx_data_r [3]),
    .sel(\u_ram_rw_control/neg_rx_int ),
    .o(\u_ram_rw_control/ram_re_addr_b [3]));  // ../../source/rtl/ram_rw_control.v(77)
  binary_mux_s1_w1 \u_ram_rw_control/mux2_syn_5  (
    .i0(1'b0),
    .i1(\my_uart_rx/rx_data_r [4]),
    .sel(\u_ram_rw_control/neg_rx_int ),
    .o(\u_ram_rw_control/ram_re_addr_b [4]));  // ../../source/rtl/ram_rw_control.v(77)
  binary_mux_s1_w1 \u_ram_rw_control/mux2_syn_6  (
    .i0(1'b0),
    .i1(\my_uart_rx/rx_data_r [5]),
    .sel(\u_ram_rw_control/neg_rx_int ),
    .o(\u_ram_rw_control/ram_re_addr_b [5]));  // ../../source/rtl/ram_rw_control.v(77)
  binary_mux_s1_w1 \u_ram_rw_control/mux2_syn_7  (
    .i0(1'b0),
    .i1(\my_uart_rx/rx_data_r [6]),
    .sel(\u_ram_rw_control/neg_rx_int ),
    .o(\u_ram_rw_control/ram_re_addr_b [6]));  // ../../source/rtl/ram_rw_control.v(77)
  binary_mux_s1_w1 \u_ram_rw_control/mux2_syn_8  (
    .i0(1'b0),
    .i1(\my_uart_rx/rx_data_r [7]),
    .sel(\u_ram_rw_control/neg_rx_int ),
    .o(\u_ram_rw_control/ram_re_addr_b [7]));  // ../../source/rtl/ram_rw_control.v(77)
  and \u_ram_rw_control/neg_rx_int_i  (\u_ram_rw_control/neg_rx_int , \u_ram_rw_control/neg_rx_int_n , \u_ram_rw_control/rx_int2 );  // ../../source/rtl/ram_rw_control.v(42)
  not \u_ram_rw_control/neg_rx_int_i1  (\u_ram_rw_control/neg_rx_int_n , \u_ram_rw_control/rx_int1 );  // ../../source/rtl/ram_rw_control.v(42)
  AL_DFF_0 \u_ram_rw_control/ram_rw_ce_r_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/neg_rx_int ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/ram_rw_ce_r ));  // ../../source/rtl/ram_rw_control.v(72)
  AL_DFF_0 \u_ram_rw_control/reg0_syn_10  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_wr_addr_b1 [0]),
    .en(\u_ram_rw_control/LED_FLAG_n1 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/ram_input [0]));  // ../../source/rtl/ram_rw_control.v(50)
  AL_DFF_0 \u_ram_rw_control/reg0_syn_11  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_wr_addr_b1 [1]),
    .en(\u_ram_rw_control/LED_FLAG_n1 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/ram_input [1]));  // ../../source/rtl/ram_rw_control.v(50)
  AL_DFF_0 \u_ram_rw_control/reg0_syn_12  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_wr_addr_b1 [2]),
    .en(\u_ram_rw_control/LED_FLAG_n1 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/ram_input [2]));  // ../../source/rtl/ram_rw_control.v(50)
  AL_DFF_0 \u_ram_rw_control/reg0_syn_13  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_wr_addr_b1 [3]),
    .en(\u_ram_rw_control/LED_FLAG_n1 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/ram_input [3]));  // ../../source/rtl/ram_rw_control.v(50)
  AL_DFF_0 \u_ram_rw_control/reg0_syn_14  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_wr_addr_b1 [4]),
    .en(\u_ram_rw_control/LED_FLAG_n1 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/ram_input [4]));  // ../../source/rtl/ram_rw_control.v(50)
  AL_DFF_0 \u_ram_rw_control/reg0_syn_15  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_wr_addr_b1 [5]),
    .en(\u_ram_rw_control/LED_FLAG_n1 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/ram_input [5]));  // ../../source/rtl/ram_rw_control.v(50)
  AL_DFF_0 \u_ram_rw_control/reg0_syn_16  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_wr_addr_b1 [6]),
    .en(\u_ram_rw_control/LED_FLAG_n1 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/ram_input [6]));  // ../../source/rtl/ram_rw_control.v(50)
  AL_DFF_0 \u_ram_rw_control/reg0_syn_17  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_wr_addr_b1 [7]),
    .en(\u_ram_rw_control/LED_FLAG_n1 ),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/ram_input [7]));  // ../../source/rtl/ram_rw_control.v(50)
  AL_DFF_0 \u_ram_rw_control/reg1_syn_10  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_re_addr_b [0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/uut_Double_RAM/addrb [0]));  // ../../source/rtl/ram_rw_control.v(72)
  AL_DFF_0 \u_ram_rw_control/reg1_syn_11  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_re_addr_b [1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/uut_Double_RAM/addrb [1]));  // ../../source/rtl/ram_rw_control.v(72)
  AL_DFF_0 \u_ram_rw_control/reg1_syn_12  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_re_addr_b [2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/uut_Double_RAM/addrb [2]));  // ../../source/rtl/ram_rw_control.v(72)
  AL_DFF_0 \u_ram_rw_control/reg1_syn_13  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_re_addr_b [3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/uut_Double_RAM/addrb [3]));  // ../../source/rtl/ram_rw_control.v(72)
  AL_DFF_0 \u_ram_rw_control/reg1_syn_14  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_re_addr_b [4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/uut_Double_RAM/addrb [4]));  // ../../source/rtl/ram_rw_control.v(72)
  AL_DFF_0 \u_ram_rw_control/reg1_syn_15  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_re_addr_b [5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/uut_Double_RAM/addrb [5]));  // ../../source/rtl/ram_rw_control.v(72)
  AL_DFF_0 \u_ram_rw_control/reg1_syn_16  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_re_addr_b [6]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/uut_Double_RAM/addrb [6]));  // ../../source/rtl/ram_rw_control.v(72)
  AL_DFF_0 \u_ram_rw_control/reg1_syn_17  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/ram_re_addr_b [7]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/uut_Double_RAM/addrb [7]));  // ../../source/rtl/ram_rw_control.v(72)
  AL_DFF_0 \u_ram_rw_control/rx_int0_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\my_uart_rx/bps_start_r_n ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/rx_int0 ));  // ../../source/rtl/ram_rw_control.v(28)
  AL_DFF_0 \u_ram_rw_control/rx_int1_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/rx_int0 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/rx_int1 ));  // ../../source/rtl/ram_rw_control.v(28)
  AL_DFF_0 \u_ram_rw_control/rx_int2_reg_syn_2  (
    .ar(~sys_rst_n),
    .as(1'b0),
    .clk(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .d(\u_ram_rw_control/rx_int1 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u_ram_rw_control/rx_int2 ));  // ../../source/rtl/ram_rw_control.v(28)
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
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_ram_rw_control/uut_Double_RAM/inst  (
    .addra(\u_ram_rw_control/ram_input ),
    .addrb(\u_ram_rw_control/uut_Double_RAM/addrb ),
    .bea(1'b0),
    .beb(1'b0),
    .cea(1'b1),
    .ceb(\u_ram_rw_control/ram_rw_ce_r ),
    .clka(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .clkb(\u_ram_rw_control/uut_Double_RAM/clkb ),
    .dia(\u_ram_rw_control/ram_input ),
    .dib(8'b00000000),
    .ocea(1'b0),
    .oceb(1'b0),
    .rsta(1'b0),
    .rstb(1'b0),
    .wea(1'b1),
    .web(1'b0),
    .dob(\my_uart_tx/rx_data ));  // ../../al_ip/Double_RAM_uut.v(61)

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
  wire net_b0;
  wire net_sum0;
  wire net_cout0;
  wire net_a1;
  wire net_b1;
  wire net_sum1;
  wire net_cout1;
  wire net_a2;
  wire net_b2;
  wire net_sum2;
  wire net_cout2;
  wire net_a3;
  wire net_b3;
  wire net_sum3;
  wire net_cout3;

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
  AL_FADD al_31 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_32 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_33 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_34 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));

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

  wire i0_syn_5;
  wire i0_syn_7;
  wire i0_syn_9;
  wire i0_syn_11;
  wire i0_syn_13;
  wire i0_syn_15;
  wire i0_syn_17;

  not al_35 (o, i0_syn_17);
  xor i0_syn_10 (i0_syn_11, i0[3], i1[3]);
  or i0_syn_12 (i0_syn_13, i0_syn_5, i0_syn_7);
  or i0_syn_14 (i0_syn_15, i0_syn_9, i0_syn_11);
  or i0_syn_16 (i0_syn_17, i0_syn_13, i0_syn_15);
  xor i0_syn_4 (i0_syn_5, i0[0], i1[0]);
  xor i0_syn_6 (i0_syn_7, i0[1], i1[1]);
  xor i0_syn_8 (i0_syn_9, i0[2], i1[2]);

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


  AL_MUX al_36 (
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

  wire  al_37;
  wire  al_38;
  wire  al_39;
  wire  al_40;
  wire  al_41;
  wire  al_42;
  wire  al_43;
  wire  al_44;
  wire  al_45;
  wire  al_46;
  wire  al_47;
  wire  al_48;
  wire  al_49;
  wire  al_50;

  AL_MUX al_51 (
    .i0(al_37),
    .i1(al_38),
    .sel(sel[3]),
    .o(o));
  AL_MUX al_52 (
    .i0(al_39),
    .i1(al_40),
    .sel(sel[2]),
    .o(al_37));
  AL_MUX al_53 (
    .i0(al_41),
    .i1(al_42),
    .sel(sel[2]),
    .o(al_38));
  AL_MUX al_54 (
    .i0(al_43),
    .i1(al_44),
    .sel(sel[1]),
    .o(al_39));
  AL_MUX al_55 (
    .i0(al_45),
    .i1(al_46),
    .sel(sel[1]),
    .o(al_40));
  AL_MUX al_56 (
    .i0(al_47),
    .i1(al_48),
    .sel(sel[1]),
    .o(al_41));
  AL_MUX al_57 (
    .i0(al_49),
    .i1(al_50),
    .sel(sel[1]),
    .o(al_42));
  AL_MUX al_58 (
    .i0(i0),
    .i1(i1),
    .sel(sel[0]),
    .o(al_43));
  AL_MUX al_59 (
    .i0(i2),
    .i1(i3),
    .sel(sel[0]),
    .o(al_44));
  AL_MUX al_60 (
    .i0(i4),
    .i1(i5),
    .sel(sel[0]),
    .o(al_45));
  AL_MUX al_61 (
    .i0(i6),
    .i1(i7),
    .sel(sel[0]),
    .o(al_46));
  AL_MUX al_62 (
    .i0(i8),
    .i1(i9),
    .sel(sel[0]),
    .o(al_47));
  AL_MUX al_63 (
    .i0(i10),
    .i1(i11),
    .sel(sel[0]),
    .o(al_48));
  AL_MUX al_64 (
    .i0(i12),
    .i1(i13),
    .sel(sel[0]),
    .o(al_49));
  AL_MUX al_65 (
    .i0(i14),
    .i1(i15),
    .sel(sel[0]),
    .o(al_50));

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
  wire net_b0;
  wire net_sum0;
  wire net_cout0;
  wire net_a1;
  wire net_b1;
  wire net_sum1;
  wire net_cout1;
  wire net_a2;
  wire net_b2;
  wire net_sum2;
  wire net_cout2;
  wire net_a3;
  wire net_b3;
  wire net_sum3;
  wire net_cout3;
  wire net_a4;
  wire net_b4;
  wire net_sum4;
  wire net_cout4;
  wire net_a5;
  wire net_b5;
  wire net_sum5;
  wire net_cout5;
  wire net_a6;
  wire net_b6;
  wire net_sum6;
  wire net_cout6;
  wire net_a7;
  wire net_b7;
  wire net_sum7;
  wire net_cout7;
  wire net_a8;
  wire net_b8;
  wire net_sum8;
  wire net_cout8;
  wire net_a9;
  wire net_b9;
  wire net_sum9;
  wire net_cout9;
  wire net_a10;
  wire net_b10;
  wire net_sum10;
  wire net_cout10;
  wire net_a11;
  wire net_b11;
  wire net_sum11;
  wire net_cout11;
  wire net_a12;
  wire net_b12;
  wire net_sum12;
  wire net_cout12;

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
  AL_FADD al_66 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_67 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_68 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_69 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD al_70 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD al_71 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD al_72 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD al_73 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD al_74 (
    .a(net_a8),
    .b(net_b8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD al_75 (
    .a(net_a9),
    .b(net_b9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));
  AL_FADD al_76 (
    .a(net_a10),
    .b(net_b10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD al_77 (
    .a(net_a11),
    .b(net_b11),
    .c(net_cout10),
    .cout(net_cout11),
    .sum(net_sum11));
  AL_FADD al_78 (
    .a(net_a12),
    .b(net_b12),
    .c(net_cout11),
    .cout(net_cout12),
    .sum(net_sum12));

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

  wire i0_syn_19;
  wire i0_syn_21;
  wire i0_syn_23;
  wire i0_syn_25;
  wire i0_syn_27;
  wire i0_syn_29;
  wire i0_syn_31;
  wire i0_syn_33;
  wire i0_syn_35;
  wire i0_syn_37;
  wire i0_syn_39;
  wire i0_syn_41;
  wire i0_syn_43;
  wire i0_syn_45;
  wire i0_syn_47;
  wire i0_syn_49;
  wire i0_syn_51;
  wire i0_syn_53;
  wire i0_syn_55;
  wire i0_syn_57;
  wire i0_syn_59;
  wire i0_syn_61;
  wire i0_syn_63;
  wire i0_syn_65;
  wire i0_syn_67;

  not al_79 (o, i0_syn_67);
  xor i0_syn_18 (i0_syn_19, i0[0], i1[0]);
  xor i0_syn_20 (i0_syn_21, i0[1], i1[1]);
  xor i0_syn_22 (i0_syn_23, i0[2], i1[2]);
  xor i0_syn_24 (i0_syn_25, i0[3], i1[3]);
  xor i0_syn_26 (i0_syn_27, i0[4], i1[4]);
  xor i0_syn_28 (i0_syn_29, i0[5], i1[5]);
  xor i0_syn_30 (i0_syn_31, i0[6], i1[6]);
  xor i0_syn_32 (i0_syn_33, i0[7], i1[7]);
  xor i0_syn_34 (i0_syn_35, i0[8], i1[8]);
  xor i0_syn_36 (i0_syn_37, i0[9], i1[9]);
  xor i0_syn_38 (i0_syn_39, i0[10], i1[10]);
  xor i0_syn_40 (i0_syn_41, i0[11], i1[11]);
  xor i0_syn_42 (i0_syn_43, i0[12], i1[12]);
  or i0_syn_44 (i0_syn_45, i0_syn_21, i0_syn_23);
  or i0_syn_46 (i0_syn_47, i0_syn_19, i0_syn_45);
  or i0_syn_48 (i0_syn_49, i0_syn_27, i0_syn_29);
  or i0_syn_50 (i0_syn_51, i0_syn_25, i0_syn_49);
  or i0_syn_52 (i0_syn_53, i0_syn_47, i0_syn_51);
  or i0_syn_54 (i0_syn_55, i0_syn_33, i0_syn_35);
  or i0_syn_56 (i0_syn_57, i0_syn_31, i0_syn_55);
  or i0_syn_58 (i0_syn_59, i0_syn_37, i0_syn_39);
  or i0_syn_60 (i0_syn_61, i0_syn_41, i0_syn_43);
  or i0_syn_62 (i0_syn_63, i0_syn_59, i0_syn_61);
  or i0_syn_64 (i0_syn_65, i0_syn_57, i0_syn_63);
  or i0_syn_66 (i0_syn_67, i0_syn_53, i0_syn_65);

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
  wire net_b0;
  wire net_sum0;
  wire net_cout0;
  wire net_a1;
  wire net_b1;
  wire net_sum1;
  wire net_cout1;
  wire net_a2;
  wire net_b2;
  wire net_sum2;
  wire net_cout2;
  wire net_a3;
  wire net_b3;
  wire net_sum3;
  wire net_cout3;
  wire net_a4;
  wire net_b4;
  wire net_sum4;
  wire net_cout4;
  wire net_a5;
  wire net_b5;
  wire net_sum5;
  wire net_cout5;
  wire net_a6;
  wire net_b6;
  wire net_sum6;
  wire net_cout6;
  wire net_a7;
  wire net_b7;
  wire net_sum7;
  wire net_cout7;

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
  AL_FADD al_80 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_81 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_82 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_83 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD al_84 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD al_85 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD al_86 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD al_87 (
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

  wire [7:0] al_88;
  wire diff_6_7;
  wire less_6_7;
  wire less_6_7_syn_7;
  wire less_6_7_syn_10;
  wire less_6_7_syn_11;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;

  xor al_100 (al_88[4], i0[4], i1[4]);
  xor al_101 (al_88[5], i0[5], i1[5]);
  xor al_102 (al_88[6], i0[6], i1[6]);
  xor al_103 (al_88[7], i0[7], i1[7]);
  or al_104 (diff_6_7, al_88[6], al_88[7]);
  AL_MUX al_109 (
    .i0(ci),
    .i1(i1[0]),
    .sel(al_88[0]),
    .o(o_0));
  AL_MUX al_110 (
    .i0(o_0),
    .i1(i1[1]),
    .sel(al_88[1]),
    .o(o_1));
  AL_MUX al_111 (
    .i0(o_1),
    .i1(i1[2]),
    .sel(al_88[2]),
    .o(o_2));
  AL_MUX al_112 (
    .i0(o_2),
    .i1(i1[3]),
    .sel(al_88[3]),
    .o(o_3));
  AL_MUX al_113 (
    .i0(o_3),
    .i1(i1[4]),
    .sel(al_88[4]),
    .o(o_4));
  AL_MUX al_114 (
    .i0(o_4),
    .i1(i1[5]),
    .sel(al_88[5]),
    .o(o_5));
  AL_MUX al_115 (
    .i0(o_5),
    .i1(less_6_7),
    .sel(diff_6_7),
    .o(o));
  xor al_96 (al_88[0], i0[0], i1[0]);
  xor al_97 (al_88[1], i0[1], i1[1]);
  xor al_98 (al_88[2], i0[2], i1[2]);
  xor al_99 (al_88[3], i0[3], i1[3]);
  xor less_6_7_syn_2 (less_6_7_syn_7, i0[6], i1[6]);
  AL_MUX less_6_7_syn_3 (
    .i0(1'b0),
    .i1(i1[6]),
    .sel(less_6_7_syn_7),
    .o(less_6_7_syn_10));
  xor less_6_7_syn_4 (less_6_7_syn_11, i0[7], i1[7]);
  AL_MUX less_6_7_syn_5 (
    .i0(less_6_7_syn_10),
    .i1(i1[7]),
    .sel(less_6_7_syn_11),
    .o(less_6_7));

endmodule 

