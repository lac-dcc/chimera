// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.3.949
// Fri Aug  9 19:51:28 2019

`timescale 1ns / 1ps
module sdram_control  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(1)
  (
  CLKIN,
  rst_n,
  sm_bit,
  sm_seg,
  test_error_led,
  test_io
  );

  input CLKIN;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(2)
  input rst_n;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(3)
  output [3:0] sm_bit;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(7)
  output [7:0] sm_seg;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(6)
  output test_error_led;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(5)
  output test_io;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(4)

  parameter mode_register = 11'b00000110111;
  parameter reg1_register = 13'b0000100101111;
  parameter reg2_register = 12'b110000110101;
  wire [1:0] SD_BA;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(35)
  wire [31:0] SD_DQ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(40)
  wire [10:0] SD_SA;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(34)
  wire [9:0] bcdnum;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(48)
  wire [8:0] burst_cnt;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(12)
  wire [8:0] burst_cnt1;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(13)
  wire [7:0] datacnt;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(23)
  wire [15:0] error_cnt;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(25)
  wire [7:0] fifo_q;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(22)
  wire [15:0] n1;
  wire [20:0] n10;
  wire [1:0] n12;
  wire [20:0] n13;
  wire [2:0] n14;
  wire [1:0] n15;
  wire [1:0] n19;
  wire [2:0] n20;
  wire [20:0] n21;
  wire [20:0] n22;
  wire [2:0] n23;
  wire [20:0] n24;
  wire [1:0] n25;
  wire [1:0] n26;
  wire [2:0] n27;
  wire [8:0] n29;
  wire [8:0] n30;
  wire [1:0] n31;
  wire [2:0] n33;
  wire [7:0] n34;
  wire [12:0] n36;
  wire [20:0] n37;
  wire [1:0] n41;
  wire [20:0] n42;
  wire [2:0] n43;
  wire [1:0] n44;
  wire [7:0] n45;
  wire [2:0] n47;
  wire [20:0] n48;
  wire [1:0] n49;
  wire [1:0] n50;
  wire [8:0] n52;
  wire [12:0] n54;
  wire [20:0] n55;
  wire [8:0] n57;
  wire [1:0] n58;
  wire [1:0] n6;
  wire [2:0] n63;
  wire [7:0] n65;
  wire [7:0] n66;
  wire [20:0] n7;
  wire [8:0] n72;
  wire [1:0] n73;
  wire [2:0] n74;
  wire [7:0] n75;
  wire [20:0] n76;
  wire [2:0] n77;
  wire [20:0] n79;
  wire [1:0] n8;
  wire [2:0] n86;
  wire [20:0] n87;
  wire [20:0] n88;
  wire [2:0] n89;
  wire [1:0] n9;
  wire [20:0] n90;
  wire [20:0] rd_addr;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(15)
  wire [1:0] rd_state;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(16)
  wire [1:0] reset_step;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(11)
  wire [20:0] sd_addr;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(21)
  wire [2:0] sd_cmd;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(19)
  wire [31:0] sd_dataout;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(26)
  wire [31:0] sd_dq_int;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(31)
  wire [2:0] sd_state;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(10)
  wire [3:0] \u2_al_u0/n14 ;
  wire [1:0] \u2_al_u0/n17 ;
  wire [3:0] \u2_al_u0/n19 ;
  wire [2:0] \u2_al_u0/n2 ;
  wire [2:0] \u2_al_u0/n21 ;
  wire [2:0] \u2_al_u0/n24 ;
  wire [2:0] \u2_al_u0/n25 ;
  wire [3:0] \u2_al_u0/n27 ;
  wire [3:0] \u2_al_u0/n29 ;
  wire [3:0] \u2_al_u0/n8 ;
  wire [31:0] \u_sdram/DQIN ;  // ../sdr_sdram.v(46)
  wire [31:0] \u_sdram/DQOUT ;  // ../sdr_sdram.v(48)
  wire [1:0] \u_sdram/IBA ;  // ../sdr_sdram.v(40)
  wire [10:0] \u_sdram/ISA ;  // ../sdr_sdram.v(39)
  wire [20:0] \u_sdram/saddr ;  // ../sdr_sdram.v(50)
  wire [1:0] \u_sdram/sc_rc ;  // ../sdr_sdram.v(52)
  wire [7:0] \u_sdram/ux_command/command_delay ;  // ../Command.v(54)
  wire [3:0] \u_sdram/ux_command/n33 ;
  wire [3:0] \u_sdram/ux_command/n34 ;
  wire [3:0] \u_sdram/ux_command/n36 ;
  wire [3:0] \u_sdram/ux_command/n38 ;
  wire [10:0] \u_sdram/ux_command/n39 ;
  wire [1:0] \u_sdram/ux_command/n41 ;
  wire [1:0] \u_sdram/ux_command/n42 ;
  wire [3:0] \u_sdram/ux_command/rp_shift ;  // ../Command.v(60)
  wire [3:0] \u_sdram/ux_command/rw_shift ;  // ../Command.v(55)
  wire [31:0] \u_sdram/ux_data_path/DIN1 ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(16)
  wire [24:0] \ux_seg/cnt ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(27)
  wire [17:0] \ux_seg/cnt_w ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(33)
  wire [17:0] \ux_seg/n13 ;
  wire [17:0] \ux_seg/n14 ;
  wire [3:0] \ux_seg/n15 ;
  wire [24:0] \ux_seg/n2 ;
  wire [24:0] \ux_seg/n3 ;
  wire [3:0] \ux_seg/sm_bit1_num ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(28)
  wire [3:0] \ux_seg/sm_bit2_num ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(29)
  wire [3:0] \ux_seg/sm_bit3_num ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(30)
  wire [3:0] \ux_seg/sm_seg_num ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(36)
  wire [20:0] wr_addr;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(14)
  wire [1:0] wr_state;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(17)
  wire SD_CAS_N;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(38)
  wire SD_CLK;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(41)
  wire SD_CS_N;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(36)
  wire SD_RAS_N;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(37)
  wire SD_WE_N;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(39)
  wire clk_200m;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(29)
  wire clk_200m_keep;
  wire mux10_b0_sel_is_7_o;
  wire mux11_b0_sel_is_2_o;
  wire mux11_b0_sel_is_3_o;
  wire mux11_b0_sel_is_3_o_neg;
  wire mux18_b0_sel_is_3_o;
  wire mux20_b0_sel_is_7_o;
  wire mux20_b10_sel_is_7_o;
  wire mux24_b0_sel_is_2_o;
  wire mux26_b0_sel_is_0_o;
  wire mux32_b0_sel_is_2_o;
  wire mux40_b0_sel_is_6_o;
  wire mux40_b10_sel_is_2_o;
  wire mux42_sel_is_6_o;
  wire mux43_b0_sel_is_0_o;
  wire n28;
  wire n3;
  wire n32;
  wire n35;
  wire n5;
  wire n51;
  wire n51_neg;
  wire n53;
  wire n61;
  wire n64;
  wire n68;
  wire n69;
  wire n70;
  wire n80;
  wire n81;
  wire n82;
  wire rd_state$0$_neg;
  wire rd_state$1$_neg;
  wire sd_clk_int;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(30)
  wire sd_clk_int_keep;
  wire sd_cmd_ack;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(20)
  wire sel8_b0_sel_is_3_o;
  wire test_error_tmp;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(24)
  wire u23_sel_is_3_o;
  wire u26_sel_is_2_o;
  wire \u2_al_u0/n0 ;
  wire \u2_al_u0/n1 ;
  wire \u2_al_u0/n10 ;
  wire \u2_al_u0/n11 ;
  wire \u2_al_u0/n12 ;
  wire \u2_al_u0/n13 ;
  wire \u2_al_u0/n15 ;
  wire \u2_al_u0/n16 ;
  wire \u2_al_u0/n18 ;
  wire \u2_al_u0/n20 ;
  wire \u2_al_u0/n22 ;
  wire \u2_al_u0/n23 ;
  wire \u2_al_u0/n26 ;
  wire \u2_al_u0/n28 ;
  wire \u2_al_u0/n3 ;
  wire \u2_al_u0/n4 ;
  wire \u2_al_u0/n5 ;
  wire \u2_al_u0/n6 ;
  wire \u2_al_u0/n7 ;
  wire \u2_al_u0/n9 ;
  wire \u_sdram/ICAS_N ;  // ../sdr_sdram.v(44)
  wire \u_sdram/ICS_N ;  // ../sdr_sdram.v(41)
  wire \u_sdram/IRAS_N ;  // ../sdr_sdram.v(43)
  wire \u_sdram/IWE_N ;  // ../sdr_sdram.v(45)
  wire \u_sdram/cm_ack ;  // ../sdr_sdram.v(62)
  wire \u_sdram/load_mode ;  // ../sdr_sdram.v(56)
  wire \u_sdram/oe ;  // ../sdr_sdram.v(61)
  wire \u_sdram/precharge ;  // ../sdr_sdram.v(60)
  wire \u_sdram/reada ;  // ../sdr_sdram.v(58)
  wire \u_sdram/ux_command/bankclose ;  // ../Command.v(65)
  wire \u_sdram/ux_command/command_done ;  // ../Command.v(53)
  wire \u_sdram/ux_command/do_load_mode ;  // ../Command.v(52)
  wire \u_sdram/ux_command/do_load_mode_neg ;
  wire \u_sdram/ux_command/do_precharge ;  // ../Command.v(51)
  wire \u_sdram/ux_command/do_reada ;  // ../Command.v(48)
  wire \u_sdram/ux_command/do_rw ;  // ../Command.v(58)
  wire \u_sdram/ux_command/do_writea ;  // ../Command.v(49)
  wire \u_sdram/ux_command/n1 ;
  wire \u_sdram/ux_command/n10 ;
  wire \u_sdram/ux_command/n11 ;
  wire \u_sdram/ux_command/n12 ;
  wire \u_sdram/ux_command/n13 ;
  wire \u_sdram/ux_command/n14 ;
  wire \u_sdram/ux_command/n16 ;
  wire \u_sdram/ux_command/n17 ;
  wire \u_sdram/ux_command/n17_neg ;
  wire \u_sdram/ux_command/n18 ;
  wire \u_sdram/ux_command/n19 ;
  wire \u_sdram/ux_command/n2 ;
  wire \u_sdram/ux_command/n23 ;
  wire \u_sdram/ux_command/n24 ;
  wire \u_sdram/ux_command/n26 ;
  wire \u_sdram/ux_command/n27 ;
  wire \u_sdram/ux_command/n3 ;
  wire \u_sdram/ux_command/n30 ;
  wire \u_sdram/ux_command/n31 ;
  wire \u_sdram/ux_command/n32 ;
  wire \u_sdram/ux_command/n35 ;
  wire \u_sdram/ux_command/n37 ;
  wire \u_sdram/ux_command/n4 ;
  wire \u_sdram/ux_command/n40 ;
  wire \u_sdram/ux_command/n43 ;
  wire \u_sdram/ux_command/n44 ;
  wire \u_sdram/ux_command/n44_neg ;
  wire \u_sdram/ux_command/n45 ;
  wire \u_sdram/ux_command/n45_neg ;
  wire \u_sdram/ux_command/n46 ;
  wire \u_sdram/ux_command/n49 ;
  wire \u_sdram/ux_command/n5 ;
  wire \u_sdram/ux_command/n50 ;
  wire \u_sdram/ux_command/n52 ;
  wire \u_sdram/ux_command/n54 ;
  wire \u_sdram/ux_command/n57 ;
  wire \u_sdram/ux_command/n58 ;
  wire \u_sdram/ux_command/n59 ;
  wire \u_sdram/ux_command/n6 ;
  wire \u_sdram/ux_command/n61 ;
  wire \u_sdram/ux_command/n7 ;
  wire \u_sdram/ux_command/n8 ;
  wire \u_sdram/ux_command/n9 ;
  wire \u_sdram/ux_command/oe1 ;  // ../Command.v(59)
  wire \u_sdram/ux_command/rp_done ;  // ../Command.v(61)
  wire \u_sdram/ux_command/rw_flag ;  // ../Command.v(57)
  wire \u_sdram/ux_command/u60_sel_is_2_o ;
  wire \u_sdram/ux_command/u64_sel_is_0_o ;
  wire \u_sdram/ux_command/u69_sel_is_0_o ;
  wire \u_sdram/ux_command/u70_sel_is_2_o ;
  wire \u_sdram/ux_control/LOAD_REG1 ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(36)
  wire \u_sdram/ux_control/LOAD_REG2 ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(37)
  wire \u_sdram/ux_control/n10 ;
  wire \u_sdram/ux_control/n11 ;
  wire \u_sdram/ux_control/n17 ;
  wire \u_sdram/ux_control/n18 ;
  wire \u_sdram/ux_control/n2 ;
  wire \u_sdram/ux_control/n20 ;
  wire \u_sdram/ux_control/n3 ;
  wire \u_sdram/ux_control/n4 ;
  wire \u_sdram/ux_control/n5 ;
  wire \u_sdram/ux_control/n6 ;
  wire \u_sdram/ux_control/n7 ;
  wire \u_sdram/ux_control/n8 ;
  wire \u_sdram/ux_control/n9 ;
  wire \u_sdram/writea ;  // ../sdr_sdram.v(59)
  wire \u_sys_pll/clk0_buf ;  // al_ip/pll1.v(31)
  wire \ux_seg/cnt_w$16$_neg ;
  wire \ux_seg/cnt_w$17$_neg ;
  wire \ux_seg/mux11_b0_sel_is_0_o ;
  wire \ux_seg/mux11_b1_sel_is_1_o ;
  wire \ux_seg/mux11_b2_sel_is_2_o ;
  wire \ux_seg/mux11_b3_sel_is_3_o ;
  wire \ux_seg/mux12_b2_sel_is_2_o ;
  wire \ux_seg/mux5_b0_sel_is_2_o ;
  wire \ux_seg/n1 ;
  wire \ux_seg/n12 ;
  wire \ux_seg/sm_seg_num$0$_neg ;
  wire \ux_seg/sm_seg_num$2$_neg ;
  wire \ux_seg/sm_seg_num$3$_neg ;
  wire wr_state$0$_neg;
  wire wr_state$1$_neg;

  assign sm_seg[7] = 1'b1;
  EG_LOGIC_ODDR #(
    .ASYNCRST("ENABLE"))
    ODDR_0 (
    .clk(sd_clk_int),
    .d0(1'b0),
    .d1(1'b1),
    .rst(1'b0),
    .q(SD_CLK));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(99)
  EG_PHY_SDRAM_2M_32 \U_EG_SDRAM_2M_32/sdram  (
    .addr(SD_SA),
    .ba(SD_BA),
    .cas_n(SD_CAS_N),
    .cke(1'b1),
    .clk(SD_CLK),
    .cs_n(SD_CS_N),
    .dm0(1'b0),
    .dm1(1'b0),
    .dm2(1'b0),
    .dm3(1'b0),
    .ras_n(SD_RAS_N),
    .we_n(SD_WE_N),
    .dq(SD_DQ));  // al_ip/SDRAM.v(29)
  AL_BUFKEEP #(
    .KEEP("OUT"))
    _bufkeep_clk_200m (
    .i(clk_200m_keep),
    .o(clk_200m));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(29)
  AL_BUFKEEP #(
    .KEEP("OUT"))
    _bufkeep_sd_clk_int (
    .i(sd_clk_int_keep),
    .o(sd_clk_int));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(30)
  add_pu16_pu16_o16 add0 (
    .i0(error_cnt),
    .i1(16'b0000000000000001),
    .o(n1));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(126)
  add_pu2_pu2_o2 add1 (
    .i0(reset_step),
    .i1(2'b01),
    .o(n8));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(168)
  add_pu8_pu8_o8 add10 (
    .i0(datacnt),
    .i1(8'b00000001),
    .o(n65));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(277)
  add_pu3_pu3_o3 add2 (
    .i0(sd_state),
    .i1(3'b001),
    .o(n14));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(192)
  add_pu2_pu2_o2 add3 (
    .i0(wr_state),
    .i1(2'b01),
    .o(n25));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(209)
  add_pu9_pu9_o9 add4 (
    .i0(burst_cnt),
    .i1(9'b000000001),
    .o(n29));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(219)
  add_pu8_pu8_o8 add5 (
    .i0(fifo_q),
    .i1(8'b00000001),
    .o(n34));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(224)
  add_pu13_pu13_o13 add6 (
    .i0(wr_addr[20:8]),
    .i1(13'b0000000000001),
    .o(n36));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(233)
  add_pu2_pu2_o2 add7 (
    .i0(rd_state),
    .i1(2'b01),
    .o(n49));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(251)
  add_pu9_pu9_o9 add8 (
    .i0(burst_cnt1),
    .i1(9'b000000001),
    .o(n52));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(257)
  add_pu13_pu13_o13 add9 (
    .i0(rd_addr[20:8]),
    .i1(13'b0000000000001),
    .o(n54));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(267)
  eq_w16 eq0 (
    .i0(error_cnt),
    .i1(16'b1111111111111111),
    .o(n3));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(128)
  eq_w9 eq1 (
    .i0(burst_cnt),
    .i1(9'b011111111),
    .o(n28));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(214)
  eq_w9 eq2 (
    .i0(burst_cnt),
    .i1(9'b011111101),
    .o(n32));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(221)
  eq_w13 eq3 (
    .i0(wr_addr[20:8]),
    .i1(13'b1111111111111),
    .o(n35));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(228)
  eq_w13 eq4 (
    .i0(rd_addr[20:8]),
    .i1(13'b1111111111111),
    .o(n53));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(262)
  eq_w9 eq5 (
    .i0(burst_cnt1),
    .i1(9'b011111111),
    .o(n61));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(270)
  eq_w3 eq6 (
    .i0(sd_state),
    .i1(3'b000),
    .o(n80));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(154)
  eq_w3 eq7 (
    .i0(sd_state),
    .i1(3'b001),
    .o(n81));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(200)
  eq_w3 eq8 (
    .i0(sd_state),
    .i1(3'b010),
    .o(n82));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(242)
  lt_u9_u9 lt0 (
    .ci(1'b0),
    .i0(burst_cnt1),
    .i1(9'b100000100),
    .o(n51));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(256)
  lt_u9_u9 lt1 (
    .ci(1'b0),
    .i0(9'b000000110),
    .i1(burst_cnt1),
    .o(n64));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(276)
  lt_u9_u9 lt2 (
    .ci(1'b0),
    .i0(burst_cnt1),
    .i1(9'b011111010),
    .o(n68));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(279)
  AL_MUX mux10_b0 (
    .i0(sd_state[0]),
    .i1(n14[0]),
    .sel(mux10_b0_sel_is_7_o),
    .o(n23[0]));
  and mux10_b0_sel_is_7 (mux10_b0_sel_is_7_o, reset_step[0], reset_step[1], sd_cmd_ack);
  AL_MUX mux10_b1 (
    .i0(sd_state[1]),
    .i1(n14[1]),
    .sel(mux10_b0_sel_is_7_o),
    .o(n23[1]));
  AL_MUX mux10_b2 (
    .i0(sd_state[2]),
    .i1(n14[2]),
    .sel(mux10_b0_sel_is_7_o),
    .o(n23[2]));
  AL_MUX mux11_b0 (
    .i0(sd_addr[0]),
    .i1(1'b1),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[0]));
  and mux11_b0_sel_is_2 (mux11_b0_sel_is_2_o, mux11_b0_sel_is_3_o_neg, sd_cmd_ack);
  and mux11_b0_sel_is_3 (mux11_b0_sel_is_3_o, reset_step[0], reset_step[1]);
  not mux11_b0_sel_is_3_o_inv (mux11_b0_sel_is_3_o_neg, mux11_b0_sel_is_3_o);
  binary_mux_s2_w1 mux11_b1 (
    .i0(n7[1]),
    .i1(n10[1]),
    .i2(n7[1]),
    .i3(sd_addr[1]),
    .sel(reset_step),
    .o(n24[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  binary_mux_s2_w1 mux11_b10 (
    .i0(n7[10]),
    .i1(n10[10]),
    .i2(n7[10]),
    .i3(sd_addr[10]),
    .sel(reset_step),
    .o(n24[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  binary_mux_s2_w1 mux11_b11 (
    .i0(n7[11]),
    .i1(n10[11]),
    .i2(n7[11]),
    .i3(sd_addr[11]),
    .sel(reset_step),
    .o(n24[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  AL_MUX mux11_b12 (
    .i0(sd_addr[12]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[12]));
  AL_MUX mux11_b13 (
    .i0(sd_addr[13]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[13]));
  AL_MUX mux11_b14 (
    .i0(sd_addr[14]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[14]));
  AL_MUX mux11_b15 (
    .i0(sd_addr[15]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[15]));
  AL_MUX mux11_b16 (
    .i0(sd_addr[16]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[16]));
  AL_MUX mux11_b17 (
    .i0(sd_addr[17]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[17]));
  AL_MUX mux11_b18 (
    .i0(sd_addr[18]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[18]));
  AL_MUX mux11_b19 (
    .i0(sd_addr[19]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[19]));
  AL_MUX mux11_b2 (
    .i0(sd_addr[2]),
    .i1(1'b1),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[2]));
  AL_MUX mux11_b20 (
    .i0(sd_addr[20]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[20]));
  binary_mux_s2_w1 mux11_b3 (
    .i0(n10[3]),
    .i1(n10[3]),
    .i2(n13[3]),
    .i3(sd_addr[3]),
    .sel(reset_step),
    .o(n24[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  binary_mux_s2_w1 mux11_b4 (
    .i0(n10[4]),
    .i1(n10[4]),
    .i2(n13[4]),
    .i3(sd_addr[4]),
    .sel(reset_step),
    .o(n24[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  AL_MUX mux11_b5 (
    .i0(sd_addr[5]),
    .i1(1'b1),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[5]));
  AL_MUX mux11_b6 (
    .i0(sd_addr[6]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[6]));
  AL_MUX mux11_b7 (
    .i0(sd_addr[7]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[7]));
  binary_mux_s2_w1 mux11_b8 (
    .i0(n10[8]),
    .i1(n10[8]),
    .i2(n13[8]),
    .i3(sd_addr[8]),
    .sel(reset_step),
    .o(n24[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  AL_MUX mux11_b9 (
    .i0(sd_addr[9]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[9]));
  binary_mux_s1_w1 mux12_b0 (
    .i0(sd_cmd[0]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n27[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(211)
  binary_mux_s1_w1 mux12_b1 (
    .i0(sd_cmd[1]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n27[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(211)
  binary_mux_s1_w1 mux12_b2 (
    .i0(sd_cmd[2]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n27[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(211)
  binary_mux_s1_w1 mux13_b0 (
    .i0(n29[0]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w1 mux13_b1 (
    .i0(n29[1]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w1 mux13_b2 (
    .i0(n29[2]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w1 mux13_b3 (
    .i0(n29[3]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w1 mux13_b4 (
    .i0(n29[4]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w1 mux13_b5 (
    .i0(n29[5]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w1 mux13_b6 (
    .i0(n29[6]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w1 mux13_b7 (
    .i0(n29[7]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w1 mux13_b8 (
    .i0(n29[8]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w1 mux14_b0 (
    .i0(wr_state[0]),
    .i1(1'b1),
    .sel(n28),
    .o(n31[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w1 mux14_b1 (
    .i0(wr_state[1]),
    .i1(1'b1),
    .sel(n28),
    .o(n31[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w1 mux15_b0 (
    .i0(sd_cmd[0]),
    .i1(1'b0),
    .sel(n32),
    .o(n33[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(223)
  binary_mux_s1_w1 mux15_b1 (
    .i0(sd_cmd[1]),
    .i1(1'b0),
    .sel(n32),
    .o(n33[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(223)
  binary_mux_s1_w1 mux15_b2 (
    .i0(sd_cmd[2]),
    .i1(1'b1),
    .sel(n32),
    .o(n33[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(223)
  binary_mux_s1_w1 mux16_b10 (
    .i0(n36[2]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w1 mux16_b11 (
    .i0(n36[3]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w1 mux16_b12 (
    .i0(n36[4]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w1 mux16_b13 (
    .i0(n36[5]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w1 mux16_b14 (
    .i0(n36[6]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w1 mux16_b15 (
    .i0(n36[7]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w1 mux16_b16 (
    .i0(n36[8]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w1 mux16_b17 (
    .i0(n36[9]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w1 mux16_b18 (
    .i0(n36[10]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[18]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w1 mux16_b19 (
    .i0(n36[11]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[19]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w1 mux16_b20 (
    .i0(n36[12]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[20]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w1 mux16_b8 (
    .i0(n36[0]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w1 mux16_b9 (
    .i0(n36[1]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  and mux18_b0_sel_is_3 (mux18_b0_sel_is_3_o, sd_cmd_ack, n35);
  binary_mux_s1_w1 mux1_b0 (
    .i0(wr_state[0]),
    .i1(n25[0]),
    .sel(sd_cmd_ack),
    .o(n26[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(236)
  binary_mux_s1_w1 mux1_b1 (
    .i0(wr_state[1]),
    .i1(n25[1]),
    .sel(sd_cmd_ack),
    .o(n26[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(236)
  binary_mux_s1_w1 mux1_b2 (
    .i0(wr_state[0]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n41[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(236)
  binary_mux_s1_w1 mux1_b3 (
    .i0(wr_state[1]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n41[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(236)
  AL_MUX mux20_b0 (
    .i0(wr_addr[0]),
    .i1(1'b0),
    .sel(mux20_b0_sel_is_7_o),
    .o(n42[0]));
  and mux20_b0_sel_is_7 (mux20_b0_sel_is_7_o, wr_state[0], wr_state[1], mux18_b0_sel_is_3_o);
  AL_MUX mux20_b1 (
    .i0(wr_addr[1]),
    .i1(1'b0),
    .sel(mux20_b0_sel_is_7_o),
    .o(n42[1]));
  AL_MUX mux20_b10 (
    .i0(wr_addr[10]),
    .i1(n37[10]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[10]));
  and mux20_b10_sel_is_7 (mux20_b10_sel_is_7_o, wr_state[0], wr_state[1], sd_cmd_ack);
  AL_MUX mux20_b11 (
    .i0(wr_addr[11]),
    .i1(n37[11]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[11]));
  AL_MUX mux20_b12 (
    .i0(wr_addr[12]),
    .i1(n37[12]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[12]));
  AL_MUX mux20_b13 (
    .i0(wr_addr[13]),
    .i1(n37[13]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[13]));
  AL_MUX mux20_b14 (
    .i0(wr_addr[14]),
    .i1(n37[14]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[14]));
  AL_MUX mux20_b15 (
    .i0(wr_addr[15]),
    .i1(n37[15]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[15]));
  AL_MUX mux20_b16 (
    .i0(wr_addr[16]),
    .i1(n37[16]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[16]));
  AL_MUX mux20_b17 (
    .i0(wr_addr[17]),
    .i1(n37[17]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[17]));
  AL_MUX mux20_b18 (
    .i0(wr_addr[18]),
    .i1(n37[18]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[18]));
  AL_MUX mux20_b19 (
    .i0(wr_addr[19]),
    .i1(n37[19]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[19]));
  AL_MUX mux20_b2 (
    .i0(wr_addr[2]),
    .i1(1'b0),
    .sel(mux20_b0_sel_is_7_o),
    .o(n42[2]));
  AL_MUX mux20_b20 (
    .i0(wr_addr[20]),
    .i1(n37[20]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[20]));
  AL_MUX mux20_b3 (
    .i0(wr_addr[3]),
    .i1(1'b0),
    .sel(mux20_b0_sel_is_7_o),
    .o(n42[3]));
  AL_MUX mux20_b4 (
    .i0(wr_addr[4]),
    .i1(1'b0),
    .sel(mux20_b0_sel_is_7_o),
    .o(n42[4]));
  AL_MUX mux20_b5 (
    .i0(wr_addr[5]),
    .i1(1'b0),
    .sel(mux20_b0_sel_is_7_o),
    .o(n42[5]));
  AL_MUX mux20_b6 (
    .i0(wr_addr[6]),
    .i1(1'b0),
    .sel(mux20_b0_sel_is_7_o),
    .o(n42[6]));
  AL_MUX mux20_b7 (
    .i0(wr_addr[7]),
    .i1(1'b0),
    .sel(mux20_b0_sel_is_7_o),
    .o(n42[7]));
  AL_MUX mux20_b8 (
    .i0(wr_addr[8]),
    .i1(n37[8]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[8]));
  AL_MUX mux20_b9 (
    .i0(wr_addr[9]),
    .i1(n37[9]),
    .sel(mux20_b10_sel_is_7_o),
    .o(n42[9]));
  AL_MUX mux21_b0 (
    .i0(sd_state[0]),
    .i1(n14[0]),
    .sel(mux20_b0_sel_is_7_o),
    .o(n43[0]));
  AL_MUX mux21_b1 (
    .i0(sd_state[1]),
    .i1(n14[1]),
    .sel(mux20_b0_sel_is_7_o),
    .o(n43[1]));
  AL_MUX mux21_b2 (
    .i0(sd_state[2]),
    .i1(n14[2]),
    .sel(mux20_b0_sel_is_7_o),
    .o(n43[2]));
  binary_mux_s2_w1 mux22_b0 (
    .i0(1'b1),
    .i1(n26[0]),
    .i2(n31[0]),
    .i3(n41[0]),
    .sel(wr_state),
    .o(n44[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w1 mux22_b1 (
    .i0(1'b0),
    .i1(n26[1]),
    .i2(n31[1]),
    .i3(n41[1]),
    .sel(wr_state),
    .o(n44[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w1 mux23_b0 (
    .i0(fifo_q[0]),
    .i1(fifo_q[0]),
    .i2(n34[0]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w1 mux23_b1 (
    .i0(fifo_q[1]),
    .i1(fifo_q[1]),
    .i2(n34[1]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w1 mux23_b2 (
    .i0(fifo_q[2]),
    .i1(fifo_q[2]),
    .i2(n34[2]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w1 mux23_b3 (
    .i0(fifo_q[3]),
    .i1(fifo_q[3]),
    .i2(n34[3]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w1 mux23_b4 (
    .i0(fifo_q[4]),
    .i1(fifo_q[4]),
    .i2(n34[4]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w1 mux23_b5 (
    .i0(fifo_q[5]),
    .i1(fifo_q[5]),
    .i2(n34[5]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w1 mux23_b6 (
    .i0(fifo_q[6]),
    .i1(fifo_q[6]),
    .i2(n34[6]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w1 mux23_b7 (
    .i0(fifo_q[7]),
    .i1(fifo_q[7]),
    .i2(n34[7]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  and mux24_b0_sel_is_2 (mux24_b0_sel_is_2_o, wr_state$0$_neg, wr_state[1]);
  binary_mux_s2_w1 mux25_b0 (
    .i0(1'b0),
    .i1(n27[0]),
    .i2(n33[0]),
    .i3(sd_cmd[0]),
    .sel(wr_state),
    .o(n47[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w1 mux25_b1 (
    .i0(1'b1),
    .i1(n27[1]),
    .i2(n33[1]),
    .i3(sd_cmd[1]),
    .sel(wr_state),
    .o(n47[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w1 mux25_b2 (
    .i0(1'b0),
    .i1(n27[2]),
    .i2(n33[2]),
    .i3(sd_cmd[2]),
    .sel(wr_state),
    .o(n47[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  AL_MUX mux26_b0 (
    .i0(sd_addr[0]),
    .i1(wr_addr[0]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[0]));
  and mux26_b0_sel_is_0 (mux26_b0_sel_is_0_o, wr_state$0$_neg, wr_state$1$_neg);
  AL_MUX mux26_b1 (
    .i0(sd_addr[1]),
    .i1(wr_addr[1]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[1]));
  AL_MUX mux26_b10 (
    .i0(sd_addr[10]),
    .i1(wr_addr[10]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[10]));
  AL_MUX mux26_b11 (
    .i0(sd_addr[11]),
    .i1(wr_addr[11]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[11]));
  AL_MUX mux26_b12 (
    .i0(sd_addr[12]),
    .i1(wr_addr[12]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[12]));
  AL_MUX mux26_b13 (
    .i0(sd_addr[13]),
    .i1(wr_addr[13]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[13]));
  AL_MUX mux26_b14 (
    .i0(sd_addr[14]),
    .i1(wr_addr[14]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[14]));
  AL_MUX mux26_b15 (
    .i0(sd_addr[15]),
    .i1(wr_addr[15]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[15]));
  AL_MUX mux26_b16 (
    .i0(sd_addr[16]),
    .i1(wr_addr[16]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[16]));
  AL_MUX mux26_b17 (
    .i0(sd_addr[17]),
    .i1(wr_addr[17]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[17]));
  AL_MUX mux26_b18 (
    .i0(sd_addr[18]),
    .i1(wr_addr[18]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[18]));
  AL_MUX mux26_b19 (
    .i0(sd_addr[19]),
    .i1(wr_addr[19]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[19]));
  AL_MUX mux26_b2 (
    .i0(sd_addr[2]),
    .i1(wr_addr[2]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[2]));
  AL_MUX mux26_b20 (
    .i0(sd_addr[20]),
    .i1(wr_addr[20]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[20]));
  AL_MUX mux26_b3 (
    .i0(sd_addr[3]),
    .i1(wr_addr[3]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[3]));
  AL_MUX mux26_b4 (
    .i0(sd_addr[4]),
    .i1(wr_addr[4]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[4]));
  AL_MUX mux26_b5 (
    .i0(sd_addr[5]),
    .i1(wr_addr[5]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[5]));
  AL_MUX mux26_b6 (
    .i0(sd_addr[6]),
    .i1(wr_addr[6]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[6]));
  AL_MUX mux26_b7 (
    .i0(sd_addr[7]),
    .i1(wr_addr[7]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[7]));
  AL_MUX mux26_b8 (
    .i0(sd_addr[8]),
    .i1(wr_addr[8]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[8]));
  AL_MUX mux26_b9 (
    .i0(sd_addr[9]),
    .i1(wr_addr[9]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[9]));
  binary_mux_s1_w1 mux27_b0 (
    .i0(rd_state[0]),
    .i1(n49[0]),
    .sel(sd_cmd_ack),
    .o(n50[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(253)
  binary_mux_s1_w1 mux27_b1 (
    .i0(rd_state[1]),
    .i1(n49[1]),
    .sel(sd_cmd_ack),
    .o(n50[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(253)
  binary_mux_s1_w1 mux28_b10 (
    .i0(n54[2]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux28_b11 (
    .i0(n54[3]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux28_b12 (
    .i0(n54[4]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux28_b13 (
    .i0(n54[5]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux28_b14 (
    .i0(n54[6]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux28_b15 (
    .i0(n54[7]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux28_b16 (
    .i0(n54[8]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux28_b17 (
    .i0(n54[9]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux28_b18 (
    .i0(n54[10]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[18]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux28_b19 (
    .i0(n54[11]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[19]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux28_b20 (
    .i0(n54[12]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[20]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux28_b8 (
    .i0(n54[0]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux28_b9 (
    .i0(n54[1]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w1 mux2_b1 (
    .i0(sd_addr[1]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n7[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s1_w1 mux2_b10 (
    .i0(sd_addr[10]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n7[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s1_w1 mux2_b11 (
    .i0(sd_addr[11]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n7[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s1_w1 mux2_b22 (
    .i0(sd_addr[1]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n10[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s1_w1 mux2_b24 (
    .i0(sd_addr[3]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n10[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s1_w1 mux2_b25 (
    .i0(sd_addr[4]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n10[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s1_w1 mux2_b29 (
    .i0(sd_addr[8]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n10[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s1_w1 mux2_b31 (
    .i0(sd_addr[10]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n10[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s1_w1 mux2_b32 (
    .i0(sd_addr[11]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n10[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s1_w1 mux2_b45 (
    .i0(sd_addr[3]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n13[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s1_w1 mux2_b46 (
    .i0(sd_addr[4]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n13[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s1_w1 mux2_b50 (
    .i0(sd_addr[8]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n13[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s1_w1 mux30_b0 (
    .i0(1'b0),
    .i1(n52[0]),
    .sel(n51),
    .o(n57[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w1 mux30_b1 (
    .i0(1'b0),
    .i1(n52[1]),
    .sel(n51),
    .o(n57[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w1 mux30_b2 (
    .i0(1'b0),
    .i1(n52[2]),
    .sel(n51),
    .o(n57[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w1 mux30_b3 (
    .i0(1'b0),
    .i1(n52[3]),
    .sel(n51),
    .o(n57[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w1 mux30_b4 (
    .i0(1'b0),
    .i1(n52[4]),
    .sel(n51),
    .o(n57[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w1 mux30_b5 (
    .i0(1'b0),
    .i1(n52[5]),
    .sel(n51),
    .o(n57[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w1 mux30_b6 (
    .i0(1'b0),
    .i1(n52[6]),
    .sel(n51),
    .o(n57[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w1 mux30_b7 (
    .i0(1'b0),
    .i1(n52[7]),
    .sel(n51),
    .o(n57[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w1 mux30_b8 (
    .i0(1'b0),
    .i1(n52[8]),
    .sel(n51),
    .o(n57[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w1 mux31_b0 (
    .i0(1'b1),
    .i1(rd_state[0]),
    .sel(n51),
    .o(n58[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w1 mux31_b1 (
    .i0(1'b1),
    .i1(rd_state[1]),
    .sel(n51),
    .o(n58[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  and mux32_b0_sel_is_2 (mux32_b0_sel_is_2_o, n51_neg, n53);
  binary_mux_s1_w1 mux34_b0 (
    .i0(n27[0]),
    .i1(1'b0),
    .sel(n61),
    .o(n63[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(275)
  binary_mux_s1_w1 mux34_b1 (
    .i0(n27[1]),
    .i1(1'b0),
    .sel(n61),
    .o(n63[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(275)
  binary_mux_s1_w1 mux34_b2 (
    .i0(n27[2]),
    .i1(1'b1),
    .sel(n61),
    .o(n63[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(275)
  binary_mux_s1_w1 mux35_b0 (
    .i0(datacnt[0]),
    .i1(n65[0]),
    .sel(n64),
    .o(n66[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(278)
  binary_mux_s1_w1 mux35_b1 (
    .i0(datacnt[1]),
    .i1(n65[1]),
    .sel(n64),
    .o(n66[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(278)
  binary_mux_s1_w1 mux35_b2 (
    .i0(datacnt[2]),
    .i1(n65[2]),
    .sel(n64),
    .o(n66[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(278)
  binary_mux_s1_w1 mux35_b3 (
    .i0(datacnt[3]),
    .i1(n65[3]),
    .sel(n64),
    .o(n66[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(278)
  binary_mux_s1_w1 mux35_b4 (
    .i0(datacnt[4]),
    .i1(n65[4]),
    .sel(n64),
    .o(n66[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(278)
  binary_mux_s1_w1 mux35_b5 (
    .i0(datacnt[5]),
    .i1(n65[5]),
    .sel(n64),
    .o(n66[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(278)
  binary_mux_s1_w1 mux35_b6 (
    .i0(datacnt[6]),
    .i1(n65[6]),
    .sel(n64),
    .o(n66[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(278)
  binary_mux_s1_w1 mux35_b7 (
    .i0(datacnt[7]),
    .i1(n65[7]),
    .sel(n64),
    .o(n66[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(278)
  binary_mux_s2_w1 mux36_b0 (
    .i0(burst_cnt1[0]),
    .i1(burst_cnt1[0]),
    .i2(n57[0]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux36_b1 (
    .i0(burst_cnt1[1]),
    .i1(burst_cnt1[1]),
    .i2(n57[1]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux36_b2 (
    .i0(burst_cnt1[2]),
    .i1(burst_cnt1[2]),
    .i2(n57[2]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux36_b3 (
    .i0(burst_cnt1[3]),
    .i1(burst_cnt1[3]),
    .i2(n57[3]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux36_b4 (
    .i0(burst_cnt1[4]),
    .i1(burst_cnt1[4]),
    .i2(n57[4]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux36_b5 (
    .i0(burst_cnt1[5]),
    .i1(burst_cnt1[5]),
    .i2(n57[5]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux36_b6 (
    .i0(burst_cnt1[6]),
    .i1(burst_cnt1[6]),
    .i2(n57[6]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux36_b7 (
    .i0(burst_cnt1[7]),
    .i1(burst_cnt1[7]),
    .i2(n57[7]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux36_b8 (
    .i0(burst_cnt1[8]),
    .i1(burst_cnt1[8]),
    .i2(n57[8]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux37_b0 (
    .i0(1'b1),
    .i1(n50[0]),
    .i2(n58[0]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n73[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux37_b1 (
    .i0(1'b0),
    .i1(n50[1]),
    .i2(n58[1]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n73[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux38_b0 (
    .i0(1'b1),
    .i1(n27[0]),
    .i2(n63[0]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n74[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux38_b1 (
    .i0(1'b0),
    .i1(n27[1]),
    .i2(n63[1]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n74[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux38_b2 (
    .i0(1'b0),
    .i1(n27[2]),
    .i2(n63[2]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n74[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux39_b0 (
    .i0(datacnt[0]),
    .i1(datacnt[0]),
    .i2(n66[0]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux39_b1 (
    .i0(datacnt[1]),
    .i1(datacnt[1]),
    .i2(n66[1]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux39_b2 (
    .i0(datacnt[2]),
    .i1(datacnt[2]),
    .i2(n66[2]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux39_b3 (
    .i0(datacnt[3]),
    .i1(datacnt[3]),
    .i2(n66[3]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux39_b4 (
    .i0(datacnt[4]),
    .i1(datacnt[4]),
    .i2(n66[4]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux39_b5 (
    .i0(datacnt[5]),
    .i1(datacnt[5]),
    .i2(n66[5]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux39_b6 (
    .i0(datacnt[6]),
    .i1(datacnt[6]),
    .i2(n66[6]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux39_b7 (
    .i0(datacnt[7]),
    .i1(datacnt[7]),
    .i2(n66[7]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  AL_MUX mux40_b0 (
    .i0(rd_addr[0]),
    .i1(1'b0),
    .sel(mux40_b0_sel_is_6_o),
    .o(n76[0]));
  and mux40_b0_sel_is_6 (mux40_b0_sel_is_6_o, rd_state$0$_neg, rd_state[1], mux32_b0_sel_is_2_o);
  AL_MUX mux40_b1 (
    .i0(rd_addr[1]),
    .i1(1'b0),
    .sel(mux40_b0_sel_is_6_o),
    .o(n76[1]));
  AL_MUX mux40_b10 (
    .i0(rd_addr[10]),
    .i1(n55[10]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[10]));
  and mux40_b10_sel_is_2 (mux40_b10_sel_is_2_o, rd_state$0$_neg, rd_state[1], n51_neg);
  AL_MUX mux40_b11 (
    .i0(rd_addr[11]),
    .i1(n55[11]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[11]));
  AL_MUX mux40_b12 (
    .i0(rd_addr[12]),
    .i1(n55[12]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[12]));
  AL_MUX mux40_b13 (
    .i0(rd_addr[13]),
    .i1(n55[13]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[13]));
  AL_MUX mux40_b14 (
    .i0(rd_addr[14]),
    .i1(n55[14]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[14]));
  AL_MUX mux40_b15 (
    .i0(rd_addr[15]),
    .i1(n55[15]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[15]));
  AL_MUX mux40_b16 (
    .i0(rd_addr[16]),
    .i1(n55[16]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[16]));
  AL_MUX mux40_b17 (
    .i0(rd_addr[17]),
    .i1(n55[17]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[17]));
  AL_MUX mux40_b18 (
    .i0(rd_addr[18]),
    .i1(n55[18]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[18]));
  AL_MUX mux40_b19 (
    .i0(rd_addr[19]),
    .i1(n55[19]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[19]));
  AL_MUX mux40_b2 (
    .i0(rd_addr[2]),
    .i1(1'b0),
    .sel(mux40_b0_sel_is_6_o),
    .o(n76[2]));
  AL_MUX mux40_b20 (
    .i0(rd_addr[20]),
    .i1(n55[20]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[20]));
  AL_MUX mux40_b3 (
    .i0(rd_addr[3]),
    .i1(1'b0),
    .sel(mux40_b0_sel_is_6_o),
    .o(n76[3]));
  AL_MUX mux40_b4 (
    .i0(rd_addr[4]),
    .i1(1'b0),
    .sel(mux40_b0_sel_is_6_o),
    .o(n76[4]));
  AL_MUX mux40_b5 (
    .i0(rd_addr[5]),
    .i1(1'b0),
    .sel(mux40_b0_sel_is_6_o),
    .o(n76[5]));
  AL_MUX mux40_b6 (
    .i0(rd_addr[6]),
    .i1(1'b0),
    .sel(mux40_b0_sel_is_6_o),
    .o(n76[6]));
  AL_MUX mux40_b7 (
    .i0(rd_addr[7]),
    .i1(1'b0),
    .sel(mux40_b0_sel_is_6_o),
    .o(n76[7]));
  AL_MUX mux40_b8 (
    .i0(rd_addr[8]),
    .i1(n55[8]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[8]));
  AL_MUX mux40_b9 (
    .i0(rd_addr[9]),
    .i1(n55[9]),
    .sel(mux40_b10_sel_is_2_o),
    .o(n76[9]));
  AL_MUX mux41_b0 (
    .i0(sd_state[0]),
    .i1(1'b1),
    .sel(mux40_b0_sel_is_6_o),
    .o(n77[0]));
  AL_MUX mux41_b1 (
    .i0(sd_state[1]),
    .i1(1'b0),
    .sel(mux40_b0_sel_is_6_o),
    .o(n77[1]));
  AL_MUX mux41_b2 (
    .i0(sd_state[2]),
    .i1(1'b0),
    .sel(mux40_b0_sel_is_6_o),
    .o(n77[2]));
  and mux42_sel_is_6 (mux42_sel_is_6_o, rd_state$0$_neg, rd_state[1], n69);
  AL_MUX mux43_b0 (
    .i0(sd_addr[0]),
    .i1(rd_addr[0]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[0]));
  and mux43_b0_sel_is_0 (mux43_b0_sel_is_0_o, rd_state$0$_neg, rd_state$1$_neg);
  AL_MUX mux43_b1 (
    .i0(sd_addr[1]),
    .i1(rd_addr[1]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[1]));
  AL_MUX mux43_b10 (
    .i0(sd_addr[10]),
    .i1(rd_addr[10]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[10]));
  AL_MUX mux43_b11 (
    .i0(sd_addr[11]),
    .i1(rd_addr[11]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[11]));
  AL_MUX mux43_b12 (
    .i0(sd_addr[12]),
    .i1(rd_addr[12]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[12]));
  AL_MUX mux43_b13 (
    .i0(sd_addr[13]),
    .i1(rd_addr[13]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[13]));
  AL_MUX mux43_b14 (
    .i0(sd_addr[14]),
    .i1(rd_addr[14]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[14]));
  AL_MUX mux43_b15 (
    .i0(sd_addr[15]),
    .i1(rd_addr[15]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[15]));
  AL_MUX mux43_b16 (
    .i0(sd_addr[16]),
    .i1(rd_addr[16]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[16]));
  AL_MUX mux43_b17 (
    .i0(sd_addr[17]),
    .i1(rd_addr[17]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[17]));
  AL_MUX mux43_b18 (
    .i0(sd_addr[18]),
    .i1(rd_addr[18]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[18]));
  AL_MUX mux43_b19 (
    .i0(sd_addr[19]),
    .i1(rd_addr[19]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[19]));
  AL_MUX mux43_b2 (
    .i0(sd_addr[2]),
    .i1(rd_addr[2]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[2]));
  AL_MUX mux43_b20 (
    .i0(sd_addr[20]),
    .i1(rd_addr[20]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[20]));
  AL_MUX mux43_b3 (
    .i0(sd_addr[3]),
    .i1(rd_addr[3]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[3]));
  AL_MUX mux43_b4 (
    .i0(sd_addr[4]),
    .i1(rd_addr[4]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[4]));
  AL_MUX mux43_b5 (
    .i0(sd_addr[5]),
    .i1(rd_addr[5]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[5]));
  AL_MUX mux43_b6 (
    .i0(sd_addr[6]),
    .i1(rd_addr[6]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[6]));
  AL_MUX mux43_b7 (
    .i0(sd_addr[7]),
    .i1(rd_addr[7]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[7]));
  AL_MUX mux43_b8 (
    .i0(sd_addr[8]),
    .i1(rd_addr[8]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[8]));
  AL_MUX mux43_b9 (
    .i0(sd_addr[9]),
    .i1(rd_addr[9]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[9]));
  binary_mux_s1_w1 mux45_b0 (
    .i0(reset_step[0]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n6[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(196)
  binary_mux_s1_w1 mux45_b1 (
    .i0(reset_step[1]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n6[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(196)
  binary_mux_s1_w1 mux45_b2 (
    .i0(reset_step[0]),
    .i1(n8[0]),
    .sel(sd_cmd_ack),
    .o(n9[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(196)
  binary_mux_s1_w1 mux45_b3 (
    .i0(reset_step[1]),
    .i1(n8[1]),
    .sel(sd_cmd_ack),
    .o(n9[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(196)
  binary_mux_s1_w1 mux45_b7 (
    .i0(reset_step[1]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n15[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(196)
  binary_mux_s2_w1 mux6_b0 (
    .i0(n6[0]),
    .i1(n9[0]),
    .i2(n9[0]),
    .i3(n6[0]),
    .sel(reset_step),
    .o(n19[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  binary_mux_s2_w1 mux6_b1 (
    .i0(n6[1]),
    .i1(n9[1]),
    .i2(n9[1]),
    .i3(n15[1]),
    .sel(reset_step),
    .o(n19[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  binary_mux_s2_w1 mux7_b0 (
    .i0(sd_cmd_ack),
    .i1(1'b1),
    .i2(n12[0]),
    .i3(1'b0),
    .sel(reset_step),
    .o(n20[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  binary_mux_s2_w1 mux7_b1 (
    .i0(1'b0),
    .i1(sd_cmd_ack),
    .i2(sd_cmd_ack),
    .i3(n12[0]),
    .sel(reset_step),
    .o(n20[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  AL_MUX mux7_b2 (
    .i0(1'b1),
    .i1(n12[0]),
    .sel(mux11_b0_sel_is_3_o),
    .o(n20[2]));
  AL_MUX mux8_b0 (
    .i0(rd_addr[0]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[0]));
  AL_MUX mux8_b1 (
    .i0(rd_addr[1]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[1]));
  AL_MUX mux8_b10 (
    .i0(rd_addr[10]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[10]));
  AL_MUX mux8_b11 (
    .i0(rd_addr[11]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[11]));
  AL_MUX mux8_b12 (
    .i0(rd_addr[12]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[12]));
  AL_MUX mux8_b13 (
    .i0(rd_addr[13]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[13]));
  AL_MUX mux8_b14 (
    .i0(rd_addr[14]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[14]));
  AL_MUX mux8_b15 (
    .i0(rd_addr[15]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[15]));
  AL_MUX mux8_b16 (
    .i0(rd_addr[16]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[16]));
  AL_MUX mux8_b17 (
    .i0(rd_addr[17]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[17]));
  AL_MUX mux8_b18 (
    .i0(rd_addr[18]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[18]));
  AL_MUX mux8_b19 (
    .i0(rd_addr[19]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[19]));
  AL_MUX mux8_b2 (
    .i0(rd_addr[2]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[2]));
  AL_MUX mux8_b20 (
    .i0(rd_addr[20]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[20]));
  AL_MUX mux8_b3 (
    .i0(rd_addr[3]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[3]));
  AL_MUX mux8_b4 (
    .i0(rd_addr[4]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[4]));
  AL_MUX mux8_b5 (
    .i0(rd_addr[5]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[5]));
  AL_MUX mux8_b6 (
    .i0(rd_addr[6]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[6]));
  AL_MUX mux8_b7 (
    .i0(rd_addr[7]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[7]));
  AL_MUX mux8_b8 (
    .i0(rd_addr[8]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[8]));
  AL_MUX mux8_b9 (
    .i0(rd_addr[9]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n21[9]));
  AL_MUX mux9_b0 (
    .i0(wr_addr[0]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[0]));
  AL_MUX mux9_b1 (
    .i0(wr_addr[1]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[1]));
  AL_MUX mux9_b10 (
    .i0(wr_addr[10]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[10]));
  AL_MUX mux9_b11 (
    .i0(wr_addr[11]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[11]));
  AL_MUX mux9_b12 (
    .i0(wr_addr[12]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[12]));
  AL_MUX mux9_b13 (
    .i0(wr_addr[13]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[13]));
  AL_MUX mux9_b14 (
    .i0(wr_addr[14]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[14]));
  AL_MUX mux9_b15 (
    .i0(wr_addr[15]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[15]));
  AL_MUX mux9_b16 (
    .i0(wr_addr[16]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[16]));
  AL_MUX mux9_b17 (
    .i0(wr_addr[17]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[17]));
  AL_MUX mux9_b18 (
    .i0(wr_addr[18]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[18]));
  AL_MUX mux9_b19 (
    .i0(wr_addr[19]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[19]));
  AL_MUX mux9_b2 (
    .i0(wr_addr[2]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[2]));
  AL_MUX mux9_b20 (
    .i0(wr_addr[20]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[20]));
  AL_MUX mux9_b3 (
    .i0(wr_addr[3]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[3]));
  AL_MUX mux9_b4 (
    .i0(wr_addr[4]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[4]));
  AL_MUX mux9_b5 (
    .i0(wr_addr[5]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[5]));
  AL_MUX mux9_b6 (
    .i0(wr_addr[6]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[6]));
  AL_MUX mux9_b7 (
    .i0(wr_addr[7]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[7]));
  AL_MUX mux9_b8 (
    .i0(wr_addr[8]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[8]));
  AL_MUX mux9_b9 (
    .i0(wr_addr[9]),
    .i1(1'b0),
    .sel(mux10_b0_sel_is_7_o),
    .o(n22[9]));
  not n51_inv (n51_neg, n51);
  ne_w32 neq0 (
    .i0(sd_dq_int),
    .i1({datacnt,datacnt,datacnt,datacnt}),
    .o(n70));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(280)
  not \rd_state[0]_inv  (rd_state$0$_neg, rd_state[0]);
  not \rd_state[1]_inv  (rd_state$1$_neg, rd_state[1]);
  reg_ar_as_w1 reg0_b0 (
    .clk(clk_200m),
    .d(n19[0]),
    .en(n80),
    .reset(~rst_n),
    .set(1'b0),
    .q(reset_step[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk_200m),
    .d(n19[1]),
    .en(n80),
    .reset(~rst_n),
    .set(1'b0),
    .q(reset_step[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg10_b0 (
    .clk(clk_200m),
    .d(n75[0]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg10_b1 (
    .clk(clk_200m),
    .d(n75[1]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg10_b2 (
    .clk(clk_200m),
    .d(n75[2]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg10_b3 (
    .clk(clk_200m),
    .d(n75[3]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg10_b4 (
    .clk(clk_200m),
    .d(n75[4]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg10_b5 (
    .clk(clk_200m),
    .d(n75[5]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg10_b6 (
    .clk(clk_200m),
    .d(n75[6]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg10_b7 (
    .clk(clk_200m),
    .d(n75[7]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b0 (
    .clk(clk_200m),
    .d(SD_DQ[0]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b1 (
    .clk(clk_200m),
    .d(SD_DQ[1]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b10 (
    .clk(clk_200m),
    .d(SD_DQ[10]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b11 (
    .clk(clk_200m),
    .d(SD_DQ[11]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b12 (
    .clk(clk_200m),
    .d(SD_DQ[12]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b13 (
    .clk(clk_200m),
    .d(SD_DQ[13]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b14 (
    .clk(clk_200m),
    .d(SD_DQ[14]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b15 (
    .clk(clk_200m),
    .d(SD_DQ[15]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b16 (
    .clk(clk_200m),
    .d(SD_DQ[16]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b17 (
    .clk(clk_200m),
    .d(SD_DQ[17]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b18 (
    .clk(clk_200m),
    .d(SD_DQ[18]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[18]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b19 (
    .clk(clk_200m),
    .d(SD_DQ[19]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[19]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b2 (
    .clk(clk_200m),
    .d(SD_DQ[2]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b20 (
    .clk(clk_200m),
    .d(SD_DQ[20]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[20]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b21 (
    .clk(clk_200m),
    .d(SD_DQ[21]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[21]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b22 (
    .clk(clk_200m),
    .d(SD_DQ[22]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[22]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b23 (
    .clk(clk_200m),
    .d(SD_DQ[23]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[23]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b24 (
    .clk(clk_200m),
    .d(SD_DQ[24]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[24]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b25 (
    .clk(clk_200m),
    .d(SD_DQ[25]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[25]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b26 (
    .clk(clk_200m),
    .d(SD_DQ[26]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[26]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b27 (
    .clk(clk_200m),
    .d(SD_DQ[27]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[27]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b28 (
    .clk(clk_200m),
    .d(SD_DQ[28]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[28]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b29 (
    .clk(clk_200m),
    .d(SD_DQ[29]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[29]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b3 (
    .clk(clk_200m),
    .d(SD_DQ[3]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b30 (
    .clk(clk_200m),
    .d(SD_DQ[30]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[30]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b31 (
    .clk(clk_200m),
    .d(SD_DQ[31]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[31]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b4 (
    .clk(clk_200m),
    .d(SD_DQ[4]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b5 (
    .clk(clk_200m),
    .d(SD_DQ[5]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b6 (
    .clk(clk_200m),
    .d(SD_DQ[6]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b7 (
    .clk(clk_200m),
    .d(SD_DQ[7]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b8 (
    .clk(clk_200m),
    .d(SD_DQ[8]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg11_b9 (
    .clk(clk_200m),
    .d(SD_DQ[9]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg12_b0 (
    .clk(clk_200m),
    .d(n1[0]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b1 (
    .clk(clk_200m),
    .d(n1[1]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b10 (
    .clk(clk_200m),
    .d(n1[10]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b11 (
    .clk(clk_200m),
    .d(n1[11]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b12 (
    .clk(clk_200m),
    .d(n1[12]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b13 (
    .clk(clk_200m),
    .d(n1[13]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b14 (
    .clk(clk_200m),
    .d(n1[14]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b15 (
    .clk(clk_200m),
    .d(n1[15]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b2 (
    .clk(clk_200m),
    .d(n1[2]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b3 (
    .clk(clk_200m),
    .d(n1[3]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b4 (
    .clk(clk_200m),
    .d(n1[4]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b5 (
    .clk(clk_200m),
    .d(n1[5]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b6 (
    .clk(clk_200m),
    .d(n1[6]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b7 (
    .clk(clk_200m),
    .d(n1[7]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b8 (
    .clk(clk_200m),
    .d(n1[8]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg12_b9 (
    .clk(clk_200m),
    .d(n1[9]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 reg13_b0 (
    .clk(clk_200m),
    .d(n86[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_cmd[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg13_b1 (
    .clk(clk_200m),
    .d(n86[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_cmd[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg13_b2 (
    .clk(clk_200m),
    .d(n86[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst_n),
    .q(sd_cmd[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk_200m),
    .d(n30[0]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk_200m),
    .d(n30[1]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk_200m),
    .d(n30[2]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk_200m),
    .d(n30[3]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg1_b4 (
    .clk(clk_200m),
    .d(n30[4]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg1_b5 (
    .clk(clk_200m),
    .d(n30[5]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg1_b6 (
    .clk(clk_200m),
    .d(n30[6]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg1_b7 (
    .clk(clk_200m),
    .d(n30[7]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg1_b8 (
    .clk(clk_200m),
    .d(n30[8]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk_200m),
    .d(n72[0]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk_200m),
    .d(n72[1]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk_200m),
    .d(n72[2]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk_200m),
    .d(n72[3]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg2_b4 (
    .clk(clk_200m),
    .d(n72[4]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg2_b5 (
    .clk(clk_200m),
    .d(n72[5]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg2_b6 (
    .clk(clk_200m),
    .d(n72[6]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg2_b7 (
    .clk(clk_200m),
    .d(n72[7]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg2_b8 (
    .clk(clk_200m),
    .d(n72[8]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk_200m),
    .d(n89[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_state[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk_200m),
    .d(n89[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_state[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk_200m),
    .d(n89[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_state[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk_200m),
    .d(n44[0]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_state[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk_200m),
    .d(n44[1]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_state[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg5_b0 (
    .clk(clk_200m),
    .d(n73[0]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_state[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg5_b1 (
    .clk(clk_200m),
    .d(n73[1]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_state[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b0 (
    .clk(clk_200m),
    .d(n90[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b1 (
    .clk(clk_200m),
    .d(n90[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b10 (
    .clk(clk_200m),
    .d(n90[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b11 (
    .clk(clk_200m),
    .d(n90[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b12 (
    .clk(clk_200m),
    .d(n90[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b13 (
    .clk(clk_200m),
    .d(n90[13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b14 (
    .clk(clk_200m),
    .d(n90[14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b15 (
    .clk(clk_200m),
    .d(n90[15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b16 (
    .clk(clk_200m),
    .d(n90[16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b17 (
    .clk(clk_200m),
    .d(n90[17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b18 (
    .clk(clk_200m),
    .d(n90[18]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[18]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b19 (
    .clk(clk_200m),
    .d(n90[19]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[19]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b2 (
    .clk(clk_200m),
    .d(n90[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b20 (
    .clk(clk_200m),
    .d(n90[20]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[20]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b3 (
    .clk(clk_200m),
    .d(n90[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b4 (
    .clk(clk_200m),
    .d(n90[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b5 (
    .clk(clk_200m),
    .d(n90[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b6 (
    .clk(clk_200m),
    .d(n90[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b7 (
    .clk(clk_200m),
    .d(n90[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b8 (
    .clk(clk_200m),
    .d(n90[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg6_b9 (
    .clk(clk_200m),
    .d(n90[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b0 (
    .clk(clk_200m),
    .d(n88[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b1 (
    .clk(clk_200m),
    .d(n88[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b10 (
    .clk(clk_200m),
    .d(n88[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b11 (
    .clk(clk_200m),
    .d(n88[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b12 (
    .clk(clk_200m),
    .d(n88[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b13 (
    .clk(clk_200m),
    .d(n88[13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b14 (
    .clk(clk_200m),
    .d(n88[14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b15 (
    .clk(clk_200m),
    .d(n88[15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b16 (
    .clk(clk_200m),
    .d(n88[16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b17 (
    .clk(clk_200m),
    .d(n88[17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b18 (
    .clk(clk_200m),
    .d(n88[18]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[18]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b19 (
    .clk(clk_200m),
    .d(n88[19]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[19]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b2 (
    .clk(clk_200m),
    .d(n88[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b20 (
    .clk(clk_200m),
    .d(n88[20]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[20]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b3 (
    .clk(clk_200m),
    .d(n88[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b4 (
    .clk(clk_200m),
    .d(n88[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b5 (
    .clk(clk_200m),
    .d(n88[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b6 (
    .clk(clk_200m),
    .d(n88[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b7 (
    .clk(clk_200m),
    .d(n88[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b8 (
    .clk(clk_200m),
    .d(n88[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg7_b9 (
    .clk(clk_200m),
    .d(n88[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b0 (
    .clk(clk_200m),
    .d(n87[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b1 (
    .clk(clk_200m),
    .d(n87[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b10 (
    .clk(clk_200m),
    .d(n87[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b11 (
    .clk(clk_200m),
    .d(n87[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b12 (
    .clk(clk_200m),
    .d(n87[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b13 (
    .clk(clk_200m),
    .d(n87[13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b14 (
    .clk(clk_200m),
    .d(n87[14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b15 (
    .clk(clk_200m),
    .d(n87[15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b16 (
    .clk(clk_200m),
    .d(n87[16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b17 (
    .clk(clk_200m),
    .d(n87[17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b18 (
    .clk(clk_200m),
    .d(n87[18]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[18]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b19 (
    .clk(clk_200m),
    .d(n87[19]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[19]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b2 (
    .clk(clk_200m),
    .d(n87[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b20 (
    .clk(clk_200m),
    .d(n87[20]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[20]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b3 (
    .clk(clk_200m),
    .d(n87[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b4 (
    .clk(clk_200m),
    .d(n87[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b5 (
    .clk(clk_200m),
    .d(n87[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b6 (
    .clk(clk_200m),
    .d(n87[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b7 (
    .clk(clk_200m),
    .d(n87[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b8 (
    .clk(clk_200m),
    .d(n87[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg8_b9 (
    .clk(clk_200m),
    .d(n87[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg9_b0 (
    .clk(clk_200m),
    .d(n45[0]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg9_b1 (
    .clk(clk_200m),
    .d(n45[1]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg9_b2 (
    .clk(clk_200m),
    .d(n45[2]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg9_b3 (
    .clk(clk_200m),
    .d(n45[3]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg9_b4 (
    .clk(clk_200m),
    .d(n45[4]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg9_b5 (
    .clk(clk_200m),
    .d(n45[5]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg9_b6 (
    .clk(clk_200m),
    .d(n45[6]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 reg9_b7 (
    .clk(clk_200m),
    .d(n45[7]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  binary_mux_s3_w1 sel1_b0 (
    .i0(n20[0]),
    .i1(n47[0]),
    .i2(n74[0]),
    .i3(sd_cmd[0]),
    .i4(sd_cmd[0]),
    .i5(sd_cmd[0]),
    .i6(sd_cmd[0]),
    .i7(sd_cmd[0]),
    .sel(sd_state),
    .o(n86[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel1_b1 (
    .i0(n20[1]),
    .i1(n47[1]),
    .i2(n74[1]),
    .i3(sd_cmd[1]),
    .i4(sd_cmd[1]),
    .i5(sd_cmd[1]),
    .i6(sd_cmd[1]),
    .i7(sd_cmd[1]),
    .sel(sd_state),
    .o(n86[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel1_b2 (
    .i0(n20[2]),
    .i1(n47[2]),
    .i2(n74[2]),
    .i3(sd_cmd[2]),
    .i4(sd_cmd[2]),
    .i5(sd_cmd[2]),
    .i6(sd_cmd[2]),
    .i7(sd_cmd[2]),
    .sel(sd_state),
    .o(n86[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b0 (
    .i0(n21[0]),
    .i1(rd_addr[0]),
    .i2(n76[0]),
    .i3(rd_addr[0]),
    .i4(rd_addr[0]),
    .i5(rd_addr[0]),
    .i6(rd_addr[0]),
    .i7(rd_addr[0]),
    .sel(sd_state),
    .o(n87[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b1 (
    .i0(n21[1]),
    .i1(rd_addr[1]),
    .i2(n76[1]),
    .i3(rd_addr[1]),
    .i4(rd_addr[1]),
    .i5(rd_addr[1]),
    .i6(rd_addr[1]),
    .i7(rd_addr[1]),
    .sel(sd_state),
    .o(n87[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b10 (
    .i0(n21[10]),
    .i1(rd_addr[10]),
    .i2(n76[10]),
    .i3(rd_addr[10]),
    .i4(rd_addr[10]),
    .i5(rd_addr[10]),
    .i6(rd_addr[10]),
    .i7(rd_addr[10]),
    .sel(sd_state),
    .o(n87[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b11 (
    .i0(n21[11]),
    .i1(rd_addr[11]),
    .i2(n76[11]),
    .i3(rd_addr[11]),
    .i4(rd_addr[11]),
    .i5(rd_addr[11]),
    .i6(rd_addr[11]),
    .i7(rd_addr[11]),
    .sel(sd_state),
    .o(n87[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b12 (
    .i0(n21[12]),
    .i1(rd_addr[12]),
    .i2(n76[12]),
    .i3(rd_addr[12]),
    .i4(rd_addr[12]),
    .i5(rd_addr[12]),
    .i6(rd_addr[12]),
    .i7(rd_addr[12]),
    .sel(sd_state),
    .o(n87[12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b13 (
    .i0(n21[13]),
    .i1(rd_addr[13]),
    .i2(n76[13]),
    .i3(rd_addr[13]),
    .i4(rd_addr[13]),
    .i5(rd_addr[13]),
    .i6(rd_addr[13]),
    .i7(rd_addr[13]),
    .sel(sd_state),
    .o(n87[13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b14 (
    .i0(n21[14]),
    .i1(rd_addr[14]),
    .i2(n76[14]),
    .i3(rd_addr[14]),
    .i4(rd_addr[14]),
    .i5(rd_addr[14]),
    .i6(rd_addr[14]),
    .i7(rd_addr[14]),
    .sel(sd_state),
    .o(n87[14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b15 (
    .i0(n21[15]),
    .i1(rd_addr[15]),
    .i2(n76[15]),
    .i3(rd_addr[15]),
    .i4(rd_addr[15]),
    .i5(rd_addr[15]),
    .i6(rd_addr[15]),
    .i7(rd_addr[15]),
    .sel(sd_state),
    .o(n87[15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b16 (
    .i0(n21[16]),
    .i1(rd_addr[16]),
    .i2(n76[16]),
    .i3(rd_addr[16]),
    .i4(rd_addr[16]),
    .i5(rd_addr[16]),
    .i6(rd_addr[16]),
    .i7(rd_addr[16]),
    .sel(sd_state),
    .o(n87[16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b17 (
    .i0(n21[17]),
    .i1(rd_addr[17]),
    .i2(n76[17]),
    .i3(rd_addr[17]),
    .i4(rd_addr[17]),
    .i5(rd_addr[17]),
    .i6(rd_addr[17]),
    .i7(rd_addr[17]),
    .sel(sd_state),
    .o(n87[17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b18 (
    .i0(n21[18]),
    .i1(rd_addr[18]),
    .i2(n76[18]),
    .i3(rd_addr[18]),
    .i4(rd_addr[18]),
    .i5(rd_addr[18]),
    .i6(rd_addr[18]),
    .i7(rd_addr[18]),
    .sel(sd_state),
    .o(n87[18]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b19 (
    .i0(n21[19]),
    .i1(rd_addr[19]),
    .i2(n76[19]),
    .i3(rd_addr[19]),
    .i4(rd_addr[19]),
    .i5(rd_addr[19]),
    .i6(rd_addr[19]),
    .i7(rd_addr[19]),
    .sel(sd_state),
    .o(n87[19]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b2 (
    .i0(n21[2]),
    .i1(rd_addr[2]),
    .i2(n76[2]),
    .i3(rd_addr[2]),
    .i4(rd_addr[2]),
    .i5(rd_addr[2]),
    .i6(rd_addr[2]),
    .i7(rd_addr[2]),
    .sel(sd_state),
    .o(n87[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b20 (
    .i0(n21[20]),
    .i1(rd_addr[20]),
    .i2(n76[20]),
    .i3(rd_addr[20]),
    .i4(rd_addr[20]),
    .i5(rd_addr[20]),
    .i6(rd_addr[20]),
    .i7(rd_addr[20]),
    .sel(sd_state),
    .o(n87[20]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b3 (
    .i0(n21[3]),
    .i1(rd_addr[3]),
    .i2(n76[3]),
    .i3(rd_addr[3]),
    .i4(rd_addr[3]),
    .i5(rd_addr[3]),
    .i6(rd_addr[3]),
    .i7(rd_addr[3]),
    .sel(sd_state),
    .o(n87[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b4 (
    .i0(n21[4]),
    .i1(rd_addr[4]),
    .i2(n76[4]),
    .i3(rd_addr[4]),
    .i4(rd_addr[4]),
    .i5(rd_addr[4]),
    .i6(rd_addr[4]),
    .i7(rd_addr[4]),
    .sel(sd_state),
    .o(n87[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b5 (
    .i0(n21[5]),
    .i1(rd_addr[5]),
    .i2(n76[5]),
    .i3(rd_addr[5]),
    .i4(rd_addr[5]),
    .i5(rd_addr[5]),
    .i6(rd_addr[5]),
    .i7(rd_addr[5]),
    .sel(sd_state),
    .o(n87[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b6 (
    .i0(n21[6]),
    .i1(rd_addr[6]),
    .i2(n76[6]),
    .i3(rd_addr[6]),
    .i4(rd_addr[6]),
    .i5(rd_addr[6]),
    .i6(rd_addr[6]),
    .i7(rd_addr[6]),
    .sel(sd_state),
    .o(n87[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b7 (
    .i0(n21[7]),
    .i1(rd_addr[7]),
    .i2(n76[7]),
    .i3(rd_addr[7]),
    .i4(rd_addr[7]),
    .i5(rd_addr[7]),
    .i6(rd_addr[7]),
    .i7(rd_addr[7]),
    .sel(sd_state),
    .o(n87[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b8 (
    .i0(n21[8]),
    .i1(rd_addr[8]),
    .i2(n76[8]),
    .i3(rd_addr[8]),
    .i4(rd_addr[8]),
    .i5(rd_addr[8]),
    .i6(rd_addr[8]),
    .i7(rd_addr[8]),
    .sel(sd_state),
    .o(n87[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel2_b9 (
    .i0(n21[9]),
    .i1(rd_addr[9]),
    .i2(n76[9]),
    .i3(rd_addr[9]),
    .i4(rd_addr[9]),
    .i5(rd_addr[9]),
    .i6(rd_addr[9]),
    .i7(rd_addr[9]),
    .sel(sd_state),
    .o(n87[9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b0 (
    .i0(n22[0]),
    .i1(n42[0]),
    .i2(wr_addr[0]),
    .i3(wr_addr[0]),
    .i4(wr_addr[0]),
    .i5(wr_addr[0]),
    .i6(wr_addr[0]),
    .i7(wr_addr[0]),
    .sel(sd_state),
    .o(n88[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b1 (
    .i0(n22[1]),
    .i1(n42[1]),
    .i2(wr_addr[1]),
    .i3(wr_addr[1]),
    .i4(wr_addr[1]),
    .i5(wr_addr[1]),
    .i6(wr_addr[1]),
    .i7(wr_addr[1]),
    .sel(sd_state),
    .o(n88[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b10 (
    .i0(n22[10]),
    .i1(n42[10]),
    .i2(wr_addr[10]),
    .i3(wr_addr[10]),
    .i4(wr_addr[10]),
    .i5(wr_addr[10]),
    .i6(wr_addr[10]),
    .i7(wr_addr[10]),
    .sel(sd_state),
    .o(n88[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b11 (
    .i0(n22[11]),
    .i1(n42[11]),
    .i2(wr_addr[11]),
    .i3(wr_addr[11]),
    .i4(wr_addr[11]),
    .i5(wr_addr[11]),
    .i6(wr_addr[11]),
    .i7(wr_addr[11]),
    .sel(sd_state),
    .o(n88[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b12 (
    .i0(n22[12]),
    .i1(n42[12]),
    .i2(wr_addr[12]),
    .i3(wr_addr[12]),
    .i4(wr_addr[12]),
    .i5(wr_addr[12]),
    .i6(wr_addr[12]),
    .i7(wr_addr[12]),
    .sel(sd_state),
    .o(n88[12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b13 (
    .i0(n22[13]),
    .i1(n42[13]),
    .i2(wr_addr[13]),
    .i3(wr_addr[13]),
    .i4(wr_addr[13]),
    .i5(wr_addr[13]),
    .i6(wr_addr[13]),
    .i7(wr_addr[13]),
    .sel(sd_state),
    .o(n88[13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b14 (
    .i0(n22[14]),
    .i1(n42[14]),
    .i2(wr_addr[14]),
    .i3(wr_addr[14]),
    .i4(wr_addr[14]),
    .i5(wr_addr[14]),
    .i6(wr_addr[14]),
    .i7(wr_addr[14]),
    .sel(sd_state),
    .o(n88[14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b15 (
    .i0(n22[15]),
    .i1(n42[15]),
    .i2(wr_addr[15]),
    .i3(wr_addr[15]),
    .i4(wr_addr[15]),
    .i5(wr_addr[15]),
    .i6(wr_addr[15]),
    .i7(wr_addr[15]),
    .sel(sd_state),
    .o(n88[15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b16 (
    .i0(n22[16]),
    .i1(n42[16]),
    .i2(wr_addr[16]),
    .i3(wr_addr[16]),
    .i4(wr_addr[16]),
    .i5(wr_addr[16]),
    .i6(wr_addr[16]),
    .i7(wr_addr[16]),
    .sel(sd_state),
    .o(n88[16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b17 (
    .i0(n22[17]),
    .i1(n42[17]),
    .i2(wr_addr[17]),
    .i3(wr_addr[17]),
    .i4(wr_addr[17]),
    .i5(wr_addr[17]),
    .i6(wr_addr[17]),
    .i7(wr_addr[17]),
    .sel(sd_state),
    .o(n88[17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b18 (
    .i0(n22[18]),
    .i1(n42[18]),
    .i2(wr_addr[18]),
    .i3(wr_addr[18]),
    .i4(wr_addr[18]),
    .i5(wr_addr[18]),
    .i6(wr_addr[18]),
    .i7(wr_addr[18]),
    .sel(sd_state),
    .o(n88[18]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b19 (
    .i0(n22[19]),
    .i1(n42[19]),
    .i2(wr_addr[19]),
    .i3(wr_addr[19]),
    .i4(wr_addr[19]),
    .i5(wr_addr[19]),
    .i6(wr_addr[19]),
    .i7(wr_addr[19]),
    .sel(sd_state),
    .o(n88[19]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b2 (
    .i0(n22[2]),
    .i1(n42[2]),
    .i2(wr_addr[2]),
    .i3(wr_addr[2]),
    .i4(wr_addr[2]),
    .i5(wr_addr[2]),
    .i6(wr_addr[2]),
    .i7(wr_addr[2]),
    .sel(sd_state),
    .o(n88[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b20 (
    .i0(n22[20]),
    .i1(n42[20]),
    .i2(wr_addr[20]),
    .i3(wr_addr[20]),
    .i4(wr_addr[20]),
    .i5(wr_addr[20]),
    .i6(wr_addr[20]),
    .i7(wr_addr[20]),
    .sel(sd_state),
    .o(n88[20]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b3 (
    .i0(n22[3]),
    .i1(n42[3]),
    .i2(wr_addr[3]),
    .i3(wr_addr[3]),
    .i4(wr_addr[3]),
    .i5(wr_addr[3]),
    .i6(wr_addr[3]),
    .i7(wr_addr[3]),
    .sel(sd_state),
    .o(n88[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b4 (
    .i0(n22[4]),
    .i1(n42[4]),
    .i2(wr_addr[4]),
    .i3(wr_addr[4]),
    .i4(wr_addr[4]),
    .i5(wr_addr[4]),
    .i6(wr_addr[4]),
    .i7(wr_addr[4]),
    .sel(sd_state),
    .o(n88[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b5 (
    .i0(n22[5]),
    .i1(n42[5]),
    .i2(wr_addr[5]),
    .i3(wr_addr[5]),
    .i4(wr_addr[5]),
    .i5(wr_addr[5]),
    .i6(wr_addr[5]),
    .i7(wr_addr[5]),
    .sel(sd_state),
    .o(n88[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b6 (
    .i0(n22[6]),
    .i1(n42[6]),
    .i2(wr_addr[6]),
    .i3(wr_addr[6]),
    .i4(wr_addr[6]),
    .i5(wr_addr[6]),
    .i6(wr_addr[6]),
    .i7(wr_addr[6]),
    .sel(sd_state),
    .o(n88[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b7 (
    .i0(n22[7]),
    .i1(n42[7]),
    .i2(wr_addr[7]),
    .i3(wr_addr[7]),
    .i4(wr_addr[7]),
    .i5(wr_addr[7]),
    .i6(wr_addr[7]),
    .i7(wr_addr[7]),
    .sel(sd_state),
    .o(n88[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b8 (
    .i0(n22[8]),
    .i1(n42[8]),
    .i2(wr_addr[8]),
    .i3(wr_addr[8]),
    .i4(wr_addr[8]),
    .i5(wr_addr[8]),
    .i6(wr_addr[8]),
    .i7(wr_addr[8]),
    .sel(sd_state),
    .o(n88[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel3_b9 (
    .i0(n22[9]),
    .i1(n42[9]),
    .i2(wr_addr[9]),
    .i3(wr_addr[9]),
    .i4(wr_addr[9]),
    .i5(wr_addr[9]),
    .i6(wr_addr[9]),
    .i7(wr_addr[9]),
    .sel(sd_state),
    .o(n88[9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel4_b0 (
    .i0(n23[0]),
    .i1(n43[0]),
    .i2(n77[0]),
    .i3(sd_state[0]),
    .i4(sd_state[0]),
    .i5(sd_state[0]),
    .i6(sd_state[0]),
    .i7(sd_state[0]),
    .sel(sd_state),
    .o(n89[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel4_b1 (
    .i0(n23[1]),
    .i1(n43[1]),
    .i2(n77[1]),
    .i3(sd_state[1]),
    .i4(sd_state[1]),
    .i5(sd_state[1]),
    .i6(sd_state[1]),
    .i7(sd_state[1]),
    .sel(sd_state),
    .o(n89[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel4_b2 (
    .i0(n23[2]),
    .i1(n43[2]),
    .i2(n77[2]),
    .i3(sd_state[2]),
    .i4(sd_state[2]),
    .i5(sd_state[2]),
    .i6(sd_state[2]),
    .i7(sd_state[2]),
    .sel(sd_state),
    .o(n89[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b0 (
    .i0(n24[0]),
    .i1(n48[0]),
    .i2(n79[0]),
    .i3(sd_addr[0]),
    .i4(sd_addr[0]),
    .i5(sd_addr[0]),
    .i6(sd_addr[0]),
    .i7(sd_addr[0]),
    .sel(sd_state),
    .o(n90[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b1 (
    .i0(n24[1]),
    .i1(n48[1]),
    .i2(n79[1]),
    .i3(sd_addr[1]),
    .i4(sd_addr[1]),
    .i5(sd_addr[1]),
    .i6(sd_addr[1]),
    .i7(sd_addr[1]),
    .sel(sd_state),
    .o(n90[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b10 (
    .i0(n24[10]),
    .i1(n48[10]),
    .i2(n79[10]),
    .i3(sd_addr[10]),
    .i4(sd_addr[10]),
    .i5(sd_addr[10]),
    .i6(sd_addr[10]),
    .i7(sd_addr[10]),
    .sel(sd_state),
    .o(n90[10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b11 (
    .i0(n24[11]),
    .i1(n48[11]),
    .i2(n79[11]),
    .i3(sd_addr[11]),
    .i4(sd_addr[11]),
    .i5(sd_addr[11]),
    .i6(sd_addr[11]),
    .i7(sd_addr[11]),
    .sel(sd_state),
    .o(n90[11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b12 (
    .i0(n24[12]),
    .i1(n48[12]),
    .i2(n79[12]),
    .i3(sd_addr[12]),
    .i4(sd_addr[12]),
    .i5(sd_addr[12]),
    .i6(sd_addr[12]),
    .i7(sd_addr[12]),
    .sel(sd_state),
    .o(n90[12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b13 (
    .i0(n24[13]),
    .i1(n48[13]),
    .i2(n79[13]),
    .i3(sd_addr[13]),
    .i4(sd_addr[13]),
    .i5(sd_addr[13]),
    .i6(sd_addr[13]),
    .i7(sd_addr[13]),
    .sel(sd_state),
    .o(n90[13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b14 (
    .i0(n24[14]),
    .i1(n48[14]),
    .i2(n79[14]),
    .i3(sd_addr[14]),
    .i4(sd_addr[14]),
    .i5(sd_addr[14]),
    .i6(sd_addr[14]),
    .i7(sd_addr[14]),
    .sel(sd_state),
    .o(n90[14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b15 (
    .i0(n24[15]),
    .i1(n48[15]),
    .i2(n79[15]),
    .i3(sd_addr[15]),
    .i4(sd_addr[15]),
    .i5(sd_addr[15]),
    .i6(sd_addr[15]),
    .i7(sd_addr[15]),
    .sel(sd_state),
    .o(n90[15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b16 (
    .i0(n24[16]),
    .i1(n48[16]),
    .i2(n79[16]),
    .i3(sd_addr[16]),
    .i4(sd_addr[16]),
    .i5(sd_addr[16]),
    .i6(sd_addr[16]),
    .i7(sd_addr[16]),
    .sel(sd_state),
    .o(n90[16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b17 (
    .i0(n24[17]),
    .i1(n48[17]),
    .i2(n79[17]),
    .i3(sd_addr[17]),
    .i4(sd_addr[17]),
    .i5(sd_addr[17]),
    .i6(sd_addr[17]),
    .i7(sd_addr[17]),
    .sel(sd_state),
    .o(n90[17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b18 (
    .i0(n24[18]),
    .i1(n48[18]),
    .i2(n79[18]),
    .i3(sd_addr[18]),
    .i4(sd_addr[18]),
    .i5(sd_addr[18]),
    .i6(sd_addr[18]),
    .i7(sd_addr[18]),
    .sel(sd_state),
    .o(n90[18]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b19 (
    .i0(n24[19]),
    .i1(n48[19]),
    .i2(n79[19]),
    .i3(sd_addr[19]),
    .i4(sd_addr[19]),
    .i5(sd_addr[19]),
    .i6(sd_addr[19]),
    .i7(sd_addr[19]),
    .sel(sd_state),
    .o(n90[19]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b2 (
    .i0(n24[2]),
    .i1(n48[2]),
    .i2(n79[2]),
    .i3(sd_addr[2]),
    .i4(sd_addr[2]),
    .i5(sd_addr[2]),
    .i6(sd_addr[2]),
    .i7(sd_addr[2]),
    .sel(sd_state),
    .o(n90[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b20 (
    .i0(n24[20]),
    .i1(n48[20]),
    .i2(n79[20]),
    .i3(sd_addr[20]),
    .i4(sd_addr[20]),
    .i5(sd_addr[20]),
    .i6(sd_addr[20]),
    .i7(sd_addr[20]),
    .sel(sd_state),
    .o(n90[20]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b3 (
    .i0(n24[3]),
    .i1(n48[3]),
    .i2(n79[3]),
    .i3(sd_addr[3]),
    .i4(sd_addr[3]),
    .i5(sd_addr[3]),
    .i6(sd_addr[3]),
    .i7(sd_addr[3]),
    .sel(sd_state),
    .o(n90[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b4 (
    .i0(n24[4]),
    .i1(n48[4]),
    .i2(n79[4]),
    .i3(sd_addr[4]),
    .i4(sd_addr[4]),
    .i5(sd_addr[4]),
    .i6(sd_addr[4]),
    .i7(sd_addr[4]),
    .sel(sd_state),
    .o(n90[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b5 (
    .i0(n24[5]),
    .i1(n48[5]),
    .i2(n79[5]),
    .i3(sd_addr[5]),
    .i4(sd_addr[5]),
    .i5(sd_addr[5]),
    .i6(sd_addr[5]),
    .i7(sd_addr[5]),
    .sel(sd_state),
    .o(n90[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b6 (
    .i0(n24[6]),
    .i1(n48[6]),
    .i2(n79[6]),
    .i3(sd_addr[6]),
    .i4(sd_addr[6]),
    .i5(sd_addr[6]),
    .i6(sd_addr[6]),
    .i7(sd_addr[6]),
    .sel(sd_state),
    .o(n90[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b7 (
    .i0(n24[7]),
    .i1(n48[7]),
    .i2(n79[7]),
    .i3(sd_addr[7]),
    .i4(sd_addr[7]),
    .i5(sd_addr[7]),
    .i6(sd_addr[7]),
    .i7(sd_addr[7]),
    .sel(sd_state),
    .o(n90[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b8 (
    .i0(n24[8]),
    .i1(n48[8]),
    .i2(n79[8]),
    .i3(sd_addr[8]),
    .i4(sd_addr[8]),
    .i5(sd_addr[8]),
    .i6(sd_addr[8]),
    .i7(sd_addr[8]),
    .sel(sd_state),
    .o(n90[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  binary_mux_s3_w1 sel5_b9 (
    .i0(n24[9]),
    .i1(n48[9]),
    .i2(n79[9]),
    .i3(sd_addr[9]),
    .i4(sd_addr[9]),
    .i5(sd_addr[9]),
    .i6(sd_addr[9]),
    .i7(sd_addr[9]),
    .sel(sd_state),
    .o(n90[9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  and sel8_b0_sel_is_3 (sel8_b0_sel_is_3_o, n81, mux24_b0_sel_is_2_o);
  reg_ar_ss_w1 test_error_reg (
    .clk(clk_200m),
    .d(test_error_led),
    .en(1'b1),
    .reset(~rst_n),
    .set(n3),
    .q(test_error_led));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w1 test_error_tmp_reg (
    .clk(clk_200m),
    .d(n70),
    .en(u26_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(test_error_tmp));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w1 test_io_reg (
    .clk(clk_200m),
    .d(test_error_tmp),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(test_io));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  and u20 (n69, n64, n68);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(279)
  and u23_sel_is_3 (u23_sel_is_3_o, n82, mux42_sel_is_6_o);
  and u26_sel_is_2 (u26_sel_is_2_o, rst_n, u23_sel_is_3_o);
  add_pu3_pu3_o4 \u2_al_u0/add0  (
    .i0(sd_dataout[7:5]),
    .i1(3'b011),
    .o({\u2_al_u0/n1 ,\u2_al_u0/n2 }));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  add_pu4_pu4_o4 \u2_al_u0/add1  (
    .i0({\u2_al_u0/n4 ,\u2_al_u0/n5 ,\u2_al_u0/n6 ,sd_dataout[4]}),
    .i1(4'b0011),
    .o(\u2_al_u0/n8 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  add_pu4_pu4_o4 \u2_al_u0/add2  (
    .i0({\u2_al_u0/n10 ,\u2_al_u0/n11 ,\u2_al_u0/n12 ,sd_dataout[3]}),
    .i1(4'b0011),
    .o(\u2_al_u0/n14 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  add_pu4_pu4_o4 \u2_al_u0/add3  (
    .i0({\u2_al_u0/n16 ,\u2_al_u0/n17 ,sd_dataout[2]}),
    .i1(4'b0011),
    .o(\u2_al_u0/n19 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  add_pu3_pu3_o4 \u2_al_u0/add4  (
    .i0({\u2_al_u0/n3 ,\u2_al_u0/n9 ,\u2_al_u0/n15 }),
    .i1(3'b011),
    .o({\u2_al_u0/n23 ,\u2_al_u0/n24 }));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  add_pu4_pu4_o4 \u2_al_u0/add5  (
    .i0({\u2_al_u0/n21 ,sd_dataout[1]}),
    .i1(4'b0011),
    .o(\u2_al_u0/n27 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  add_pu4_pu4_o4 \u2_al_u0/add6  (
    .i0({\u2_al_u0/n25 ,\u2_al_u0/n20 }),
    .i1(4'b0011),
    .o(\u2_al_u0/n29 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  lt_u3_u3 \u2_al_u0/lt0  (
    .ci(1'b0),
    .i0(3'b100),
    .i1(sd_dataout[7:5]),
    .o(\u2_al_u0/n0 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(156)
  lt_u4_u4 \u2_al_u0/lt1  (
    .ci(1'b0),
    .i0(4'b0100),
    .i1({\u2_al_u0/n4 ,\u2_al_u0/n5 ,\u2_al_u0/n6 ,sd_dataout[4]}),
    .o(\u2_al_u0/n7 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(156)
  lt_u4_u4 \u2_al_u0/lt2  (
    .ci(1'b0),
    .i0(4'b0100),
    .i1({\u2_al_u0/n10 ,\u2_al_u0/n11 ,\u2_al_u0/n12 ,sd_dataout[3]}),
    .o(\u2_al_u0/n13 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(156)
  lt_u4_u4 \u2_al_u0/lt3  (
    .ci(1'b0),
    .i0(4'b0100),
    .i1({\u2_al_u0/n16 ,\u2_al_u0/n17 ,sd_dataout[2]}),
    .o(\u2_al_u0/n18 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(156)
  lt_u3_u3 \u2_al_u0/lt4  (
    .ci(1'b0),
    .i0(3'b100),
    .i1({\u2_al_u0/n3 ,\u2_al_u0/n9 ,\u2_al_u0/n15 }),
    .o(\u2_al_u0/n22 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(158)
  lt_u4_u4 \u2_al_u0/lt5  (
    .ci(1'b0),
    .i0(4'b0100),
    .i1({\u2_al_u0/n21 ,sd_dataout[1]}),
    .o(\u2_al_u0/n26 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(156)
  lt_u4_u4 \u2_al_u0/lt6  (
    .ci(1'b0),
    .i0(4'b0100),
    .i1({\u2_al_u0/n25 ,\u2_al_u0/n20 }),
    .o(\u2_al_u0/n28 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(158)
  binary_mux_s1_w1 \u2_al_u0/mux0_b0  (
    .i0(sd_dataout[3]),
    .i1(\u2_al_u0/n14 [0]),
    .sel(\u2_al_u0/n13 ),
    .o(\u2_al_u0/n17 [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  binary_mux_s1_w1 \u2_al_u0/mux0_b1  (
    .i0(\u2_al_u0/n12 ),
    .i1(\u2_al_u0/n14 [1]),
    .sel(\u2_al_u0/n13 ),
    .o(\u2_al_u0/n17 [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  binary_mux_s1_w1 \u2_al_u0/mux1_b0  (
    .i0(sd_dataout[1]),
    .i1(\u2_al_u0/n27 [0]),
    .sel(\u2_al_u0/n26 ),
    .o(bcdnum[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  binary_mux_s1_w1 \u2_al_u0/mux1_b1  (
    .i0(\u2_al_u0/n21 [0]),
    .i1(\u2_al_u0/n27 [1]),
    .sel(\u2_al_u0/n26 ),
    .o(bcdnum[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  binary_mux_s1_w1 \u2_al_u0/mux1_b2  (
    .i0(\u2_al_u0/n21 [1]),
    .i1(\u2_al_u0/n27 [2]),
    .sel(\u2_al_u0/n26 ),
    .o(bcdnum[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  binary_mux_s1_w1 \u2_al_u0/mux1_b3  (
    .i0(\u2_al_u0/n21 [2]),
    .i1(\u2_al_u0/n27 [3]),
    .sel(\u2_al_u0/n26 ),
    .o(bcdnum[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  binary_mux_s1_w1 \u2_al_u0/mux2_b0  (
    .i0(sd_dataout[2]),
    .i1(\u2_al_u0/n19 [0]),
    .sel(\u2_al_u0/n18 ),
    .o(\u2_al_u0/n21 [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  binary_mux_s1_w1 \u2_al_u0/mux2_b1  (
    .i0(\u2_al_u0/n17 [0]),
    .i1(\u2_al_u0/n19 [1]),
    .sel(\u2_al_u0/n18 ),
    .o(\u2_al_u0/n21 [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  binary_mux_s1_w1 \u2_al_u0/mux2_b2  (
    .i0(\u2_al_u0/n17 [1]),
    .i1(\u2_al_u0/n19 [2]),
    .sel(\u2_al_u0/n18 ),
    .o(\u2_al_u0/n21 [2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  binary_mux_s1_w1 \u2_al_u0/mux3_b0  (
    .i0(\u2_al_u0/n15 ),
    .i1(\u2_al_u0/n24 [0]),
    .sel(\u2_al_u0/n22 ),
    .o(\u2_al_u0/n25 [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  binary_mux_s1_w1 \u2_al_u0/mux3_b1  (
    .i0(\u2_al_u0/n9 ),
    .i1(\u2_al_u0/n24 [1]),
    .sel(\u2_al_u0/n22 ),
    .o(\u2_al_u0/n25 [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  binary_mux_s1_w1 \u2_al_u0/mux3_b2  (
    .i0(\u2_al_u0/n3 ),
    .i1(\u2_al_u0/n24 [2]),
    .sel(\u2_al_u0/n22 ),
    .o(\u2_al_u0/n25 [2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  binary_mux_s1_w1 \u2_al_u0/mux4_b0  (
    .i0(\u2_al_u0/n20 ),
    .i1(\u2_al_u0/n29 [0]),
    .sel(\u2_al_u0/n28 ),
    .o(bcdnum[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  binary_mux_s1_w1 \u2_al_u0/mux4_b1  (
    .i0(\u2_al_u0/n25 [0]),
    .i1(\u2_al_u0/n29 [1]),
    .sel(\u2_al_u0/n28 ),
    .o(bcdnum[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  binary_mux_s1_w1 \u2_al_u0/mux4_b2  (
    .i0(\u2_al_u0/n25 [1]),
    .i1(\u2_al_u0/n29 [2]),
    .sel(\u2_al_u0/n28 ),
    .o(bcdnum[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  binary_mux_s1_w1 \u2_al_u0/mux4_b3  (
    .i0(\u2_al_u0/n25 [2]),
    .i1(\u2_al_u0/n29 [3]),
    .sel(\u2_al_u0/n28 ),
    .o(bcdnum[8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  AL_MUX \u2_al_u0/u10  (
    .i0(\u2_al_u0/n6 ),
    .i1(\u2_al_u0/n8 [1]),
    .sel(\u2_al_u0/n7 ),
    .o(\u2_al_u0/n11 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX \u2_al_u0/u11  (
    .i0(sd_dataout[4]),
    .i1(\u2_al_u0/n8 [0]),
    .sel(\u2_al_u0/n7 ),
    .o(\u2_al_u0/n12 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX \u2_al_u0/u12  (
    .i0(\u2_al_u0/n10 ),
    .i1(\u2_al_u0/n14 [3]),
    .sel(\u2_al_u0/n13 ),
    .o(\u2_al_u0/n15 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX \u2_al_u0/u13  (
    .i0(\u2_al_u0/n11 ),
    .i1(\u2_al_u0/n14 [2]),
    .sel(\u2_al_u0/n13 ),
    .o(\u2_al_u0/n16 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX \u2_al_u0/u15  (
    .i0(\u2_al_u0/n16 ),
    .i1(\u2_al_u0/n19 [3]),
    .sel(\u2_al_u0/n18 ),
    .o(\u2_al_u0/n20 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX \u2_al_u0/u16  (
    .i0(1'b0),
    .i1(\u2_al_u0/n23 ),
    .sel(\u2_al_u0/n22 ),
    .o(bcdnum[9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  AL_MUX \u2_al_u0/u4  (
    .i0(1'b0),
    .i1(\u2_al_u0/n1 ),
    .sel(\u2_al_u0/n0 ),
    .o(\u2_al_u0/n3 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX \u2_al_u0/u5  (
    .i0(sd_dataout[7]),
    .i1(\u2_al_u0/n2 [2]),
    .sel(\u2_al_u0/n0 ),
    .o(\u2_al_u0/n4 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX \u2_al_u0/u6  (
    .i0(sd_dataout[6]),
    .i1(\u2_al_u0/n2 [1]),
    .sel(\u2_al_u0/n0 ),
    .o(\u2_al_u0/n5 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX \u2_al_u0/u7  (
    .i0(sd_dataout[5]),
    .i1(\u2_al_u0/n2 [0]),
    .sel(\u2_al_u0/n0 ),
    .o(\u2_al_u0/n6 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX \u2_al_u0/u8  (
    .i0(\u2_al_u0/n4 ),
    .i1(\u2_al_u0/n8 [3]),
    .sel(\u2_al_u0/n7 ),
    .o(\u2_al_u0/n9 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX \u2_al_u0/u9  (
    .i0(\u2_al_u0/n5 ),
    .i1(\u2_al_u0/n8 [2]),
    .sel(\u2_al_u0/n7 ),
    .o(\u2_al_u0/n10 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  not u3 (n12[0], sd_cmd_ack);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(196)
  not u7 (n5, rst_n);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(120)
  reg_ar_as_w1 \u_sdram/CAS_N_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ICAS_N ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_CAS_N));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/CS_N_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ICS_N ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_CS_N));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/RAS_N_reg  (
    .clk(clk_200m),
    .d(\u_sdram/IRAS_N ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_RAS_N));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/WE_N_reg  (
    .clk(clk_200m),
    .d(\u_sdram/IWE_N ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_WE_N));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg0_b0  (
    .clk(clk_200m),
    .d(\u_sdram/IBA [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_BA[0]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg0_b1  (
    .clk(clk_200m),
    .d(\u_sdram/IBA [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_BA[1]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg1_b0  (
    .clk(clk_200m),
    .d(SD_DQ[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_sdram/DQIN [0]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg1_b1  (
    .clk(clk_200m),
    .d(SD_DQ[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_sdram/DQIN [1]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg1_b2  (
    .clk(clk_200m),
    .d(SD_DQ[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_sdram/DQIN [2]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg1_b3  (
    .clk(clk_200m),
    .d(SD_DQ[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_sdram/DQIN [3]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg1_b4  (
    .clk(clk_200m),
    .d(SD_DQ[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_sdram/DQIN [4]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg1_b5  (
    .clk(clk_200m),
    .d(SD_DQ[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_sdram/DQIN [5]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg1_b6  (
    .clk(clk_200m),
    .d(SD_DQ[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_sdram/DQIN [6]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg1_b7  (
    .clk(clk_200m),
    .d(SD_DQ[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_sdram/DQIN [7]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg2_b0  (
    .clk(clk_200m),
    .d(\u_sdram/DQIN [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dataout[0]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg2_b1  (
    .clk(clk_200m),
    .d(\u_sdram/DQIN [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dataout[1]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg2_b2  (
    .clk(clk_200m),
    .d(\u_sdram/DQIN [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dataout[2]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg2_b3  (
    .clk(clk_200m),
    .d(\u_sdram/DQIN [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dataout[3]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg2_b4  (
    .clk(clk_200m),
    .d(\u_sdram/DQIN [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dataout[4]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg2_b5  (
    .clk(clk_200m),
    .d(\u_sdram/DQIN [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dataout[5]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg2_b6  (
    .clk(clk_200m),
    .d(\u_sdram/DQIN [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dataout[6]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg2_b7  (
    .clk(clk_200m),
    .d(\u_sdram/DQIN [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dataout[7]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg3_b0  (
    .clk(clk_200m),
    .d(\u_sdram/ISA [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_SA[0]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg3_b1  (
    .clk(clk_200m),
    .d(\u_sdram/ISA [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_SA[1]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg3_b10  (
    .clk(clk_200m),
    .d(\u_sdram/ISA [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_SA[10]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg3_b2  (
    .clk(clk_200m),
    .d(\u_sdram/ISA [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_SA[2]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg3_b3  (
    .clk(clk_200m),
    .d(\u_sdram/ISA [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_SA[3]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg3_b4  (
    .clk(clk_200m),
    .d(\u_sdram/ISA [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_SA[4]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg3_b5  (
    .clk(clk_200m),
    .d(\u_sdram/ISA [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_SA[5]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg3_b6  (
    .clk(clk_200m),
    .d(\u_sdram/ISA [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_SA[6]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg3_b7  (
    .clk(clk_200m),
    .d(\u_sdram/ISA [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_SA[7]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg3_b8  (
    .clk(clk_200m),
    .d(\u_sdram/ISA [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_SA[8]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 \u_sdram/reg3_b9  (
    .clk(clk_200m),
    .d(\u_sdram/ISA [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SD_SA[9]));  // ../sdr_sdram.v(88)
  bufif1 \u_sdram/u1  (SD_DQ[31], \u_sdram/DQOUT [15], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u10  (SD_DQ[22], \u_sdram/DQOUT [14], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u11  (SD_DQ[21], \u_sdram/DQOUT [13], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u12  (SD_DQ[20], \u_sdram/DQOUT [12], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u13  (SD_DQ[19], \u_sdram/DQOUT [11], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u14  (SD_DQ[18], \u_sdram/DQOUT [10], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u15  (SD_DQ[17], \u_sdram/DQOUT [1], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u16  (SD_DQ[16], \u_sdram/DQOUT [0], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u17  (SD_DQ[15], \u_sdram/DQOUT [15], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u18  (SD_DQ[14], \u_sdram/DQOUT [14], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u19  (SD_DQ[13], \u_sdram/DQOUT [13], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u2  (SD_DQ[30], \u_sdram/DQOUT [14], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u20  (SD_DQ[12], \u_sdram/DQOUT [12], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u21  (SD_DQ[11], \u_sdram/DQOUT [11], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u22  (SD_DQ[10], \u_sdram/DQOUT [10], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u23  (SD_DQ[9], \u_sdram/DQOUT [1], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u24  (SD_DQ[8], \u_sdram/DQOUT [0], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u25  (SD_DQ[7], \u_sdram/DQOUT [15], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u26  (SD_DQ[6], \u_sdram/DQOUT [14], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u27  (SD_DQ[5], \u_sdram/DQOUT [13], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u28  (SD_DQ[4], \u_sdram/DQOUT [12], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u29  (SD_DQ[3], \u_sdram/DQOUT [11], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u3  (SD_DQ[29], \u_sdram/DQOUT [13], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u30  (SD_DQ[2], \u_sdram/DQOUT [10], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u31  (SD_DQ[1], \u_sdram/DQOUT [1], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u32  (SD_DQ[0], \u_sdram/DQOUT [0], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u4  (SD_DQ[28], \u_sdram/DQOUT [12], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u5  (SD_DQ[27], \u_sdram/DQOUT [11], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u6  (SD_DQ[26], \u_sdram/DQOUT [10], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u7  (SD_DQ[25], \u_sdram/DQOUT [1], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u8  (SD_DQ[24], \u_sdram/DQOUT [0], \u_sdram/oe );  // ../sdr_sdram.v(90)
  bufif1 \u_sdram/u9  (SD_DQ[23], \u_sdram/DQOUT [15], \u_sdram/oe );  // ../sdr_sdram.v(90)
  reg_ar_as_w1 \u_sdram/ux_command/CAS_N_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n59 ),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst_n),
    .q(\u_sdram/ICAS_N ));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/CM_ACK_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n19 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/cm_ack ));  // ../Command.v(199)
  reg_ar_as_w1 \u_sdram/ux_command/CS_N_reg  (
    .clk(clk_200m),
    .d(1'b0),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst_n),
    .q(\u_sdram/ICS_N ));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/OE_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/oe1 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/oe ));  // ../Command.v(157)
  reg_ar_as_w1 \u_sdram/ux_command/RAS_N_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n58 ),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst_n),
    .q(\u_sdram/IRAS_N ));  // ../Command.v(271)
  reg_sr_as_w1 \u_sdram/ux_command/WE_N_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n50 ),
    .en(1'b1),
    .reset(~\u_sdram/ux_command/u70_sel_is_2_o ),
    .set(~rst_n),
    .q(\u_sdram/IWE_N ));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/bankclose_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n61 ),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_sdram/ux_command/bankclose ));  // ../Command.v(271)
  reg_ar_ss_w1 \u_sdram/ux_command/command_done_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/command_delay [0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/n19 ),
    .q(\u_sdram/ux_command/command_done ));  // ../Command.v(141)
  not \u_sdram/ux_command/do_load_mode_inv  (\u_sdram/ux_command/do_load_mode_neg , \u_sdram/ux_command/do_load_mode );
  reg_ar_as_w1 \u_sdram/ux_command/do_load_mode_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n16 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_command/do_load_mode ));  // ../Command.v(141)
  reg_ar_as_w1 \u_sdram/ux_command/do_precharge_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n13 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_command/do_precharge ));  // ../Command.v(141)
  reg_ar_as_w1 \u_sdram/ux_command/do_reada_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n6 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_command/do_reada ));  // ../Command.v(141)
  reg_ar_as_w1 \u_sdram/ux_command/do_rw_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n37 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_command/do_rw ));  // ../Command.v(183)
  reg_ar_as_w1 \u_sdram/ux_command/do_writea_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n10 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_command/do_writea ));  // ../Command.v(141)
  eq_w2 \u_sdram/ux_command/eq0  (
    .i0(\u_sdram/sc_rc ),
    .i1(2'b01),
    .o(\u_sdram/ux_command/n30 ));  // ../Command.v(170)
  eq_w2 \u_sdram/ux_command/eq1  (
    .i0(\u_sdram/sc_rc ),
    .i1(2'b10),
    .o(\u_sdram/ux_command/n31 ));  // ../Command.v(172)
  eq_w2 \u_sdram/ux_command/eq2  (
    .i0(\u_sdram/sc_rc ),
    .i1(2'b11),
    .o(\u_sdram/ux_command/n32 ));  // ../Command.v(174)
  binary_mux_s1_w1 \u_sdram/ux_command/mux2_b0  (
    .i0(\u_sdram/ux_command/rw_shift [0]),
    .i1(1'b0),
    .sel(\u_sdram/ux_command/n32 ),
    .o(\u_sdram/ux_command/n33 [0]));  // ../Command.v(175)
  binary_mux_s1_w1 \u_sdram/ux_command/mux2_b1  (
    .i0(\u_sdram/ux_command/rw_shift [1]),
    .i1(1'b1),
    .sel(\u_sdram/ux_command/n32 ),
    .o(\u_sdram/ux_command/n33 [1]));  // ../Command.v(175)
  binary_mux_s1_w1 \u_sdram/ux_command/mux3_b0  (
    .i0(\u_sdram/ux_command/n33 [0]),
    .i1(1'b1),
    .sel(\u_sdram/ux_command/n31 ),
    .o(\u_sdram/ux_command/n34 [0]));  // ../Command.v(175)
  binary_mux_s1_w1 \u_sdram/ux_command/mux3_b1  (
    .i0(\u_sdram/ux_command/n33 [1]),
    .i1(1'b0),
    .sel(\u_sdram/ux_command/n31 ),
    .o(\u_sdram/ux_command/n34 [1]));  // ../Command.v(175)
  binary_mux_s1_w1 \u_sdram/ux_command/mux4_b0  (
    .i0(\u_sdram/ux_command/n34 [0]),
    .i1(\u_sdram/ux_command/rw_shift [0]),
    .sel(\u_sdram/ux_command/n30 ),
    .o(\u_sdram/ux_command/n36 [0]));  // ../Command.v(175)
  binary_mux_s1_w1 \u_sdram/ux_command/mux4_b1  (
    .i0(\u_sdram/ux_command/n34 [1]),
    .i1(\u_sdram/ux_command/rw_shift [1]),
    .sel(\u_sdram/ux_command/n30 ),
    .o(\u_sdram/ux_command/n36 [1]));  // ../Command.v(175)
  binary_mux_s1_w1 \u_sdram/ux_command/mux5_b0  (
    .i0(\u_sdram/ux_command/rw_shift [1]),
    .i1(\u_sdram/ux_command/n36 [0]),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n38 [0]));  // ../Command.v(182)
  binary_mux_s1_w1 \u_sdram/ux_command/mux5_b1  (
    .i0(1'b0),
    .i1(\u_sdram/ux_command/n36 [1]),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n38 [1]));  // ../Command.v(182)
  binary_mux_s1_w1 \u_sdram/ux_command/mux6_b0  (
    .i0(\u_sdram/saddr [0]),
    .i1(\u_sdram/saddr [8]),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n39 [0]));  // ../Command.v(222)
  binary_mux_s1_w1 \u_sdram/ux_command/mux6_b1  (
    .i0(\u_sdram/saddr [1]),
    .i1(\u_sdram/saddr [9]),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n39 [1]));  // ../Command.v(222)
  binary_mux_s1_w1 \u_sdram/ux_command/mux6_b10  (
    .i0(\u_sdram/ISA [10]),
    .i1(\u_sdram/saddr [18]),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n39 [10]));  // ../Command.v(222)
  binary_mux_s1_w1 \u_sdram/ux_command/mux6_b2  (
    .i0(\u_sdram/saddr [2]),
    .i1(\u_sdram/saddr [10]),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n39 [2]));  // ../Command.v(222)
  binary_mux_s1_w1 \u_sdram/ux_command/mux6_b3  (
    .i0(\u_sdram/saddr [3]),
    .i1(\u_sdram/saddr [11]),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n39 [3]));  // ../Command.v(222)
  binary_mux_s1_w1 \u_sdram/ux_command/mux6_b4  (
    .i0(\u_sdram/saddr [4]),
    .i1(\u_sdram/saddr [12]),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n39 [4]));  // ../Command.v(222)
  binary_mux_s1_w1 \u_sdram/ux_command/mux6_b5  (
    .i0(\u_sdram/saddr [5]),
    .i1(\u_sdram/saddr [13]),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n39 [5]));  // ../Command.v(222)
  binary_mux_s1_w1 \u_sdram/ux_command/mux6_b6  (
    .i0(\u_sdram/saddr [6]),
    .i1(\u_sdram/saddr [14]),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n39 [6]));  // ../Command.v(222)
  binary_mux_s1_w1 \u_sdram/ux_command/mux6_b7  (
    .i0(\u_sdram/saddr [7]),
    .i1(\u_sdram/saddr [15]),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n39 [7]));  // ../Command.v(222)
  binary_mux_s1_w1 \u_sdram/ux_command/mux6_b9  (
    .i0(\u_sdram/ISA [9]),
    .i1(\u_sdram/saddr [17]),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n39 [9]));  // ../Command.v(222)
  binary_mux_s1_w1 \u_sdram/ux_command/mux7_b0  (
    .i0(\u_sdram/saddr [19]),
    .i1(1'b0),
    .sel(\u_sdram/ux_command/do_load_mode ),
    .o(\u_sdram/ux_command/n42 [0]));  // ../Command.v(232)
  binary_mux_s1_w1 \u_sdram/ux_command/mux7_b1  (
    .i0(\u_sdram/saddr [20]),
    .i1(1'b0),
    .sel(\u_sdram/ux_command/do_load_mode ),
    .o(\u_sdram/ux_command/n42 [1]));  // ../Command.v(232)
  binary_mux_s1_w1 \u_sdram/ux_command/mux8_b0  (
    .i0(\u_sdram/ux_command/n39 [9]),
    .i1(\u_sdram/saddr [9]),
    .sel(\u_sdram/ux_command/do_load_mode ),
    .o(\u_sdram/ux_command/n41 [0]));  // ../Command.v(228)
  not \u_sdram/ux_command/n17_inv  (\u_sdram/ux_command/n17_neg , \u_sdram/ux_command/n17 );
  not \u_sdram/ux_command/n44_inv  (\u_sdram/ux_command/n44_neg , \u_sdram/ux_command/n44 );
  not \u_sdram/ux_command/n45_inv  (\u_sdram/ux_command/n45_neg , \u_sdram/ux_command/n45 );
  reg_ar_ss_w1 \u_sdram/ux_command/oe1_reg  (
    .clk(clk_200m),
    .d(1'b0),
    .en(\u_sdram/ux_command/n27 ),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/do_writea ),
    .q(\u_sdram/ux_command/oe1 ));  // ../Command.v(157)
  reg_ar_ss_w1 \u_sdram/ux_command/reg0_b0  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/command_delay [1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/n19 ),
    .q(\u_sdram/ux_command/command_delay [0]));  // ../Command.v(141)
  reg_ar_ss_w1 \u_sdram/ux_command/reg0_b1  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/command_delay [2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/n19 ),
    .q(\u_sdram/ux_command/command_delay [1]));  // ../Command.v(141)
  reg_ar_ss_w1 \u_sdram/ux_command/reg0_b2  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/command_delay [3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/n19 ),
    .q(\u_sdram/ux_command/command_delay [2]));  // ../Command.v(141)
  reg_ar_ss_w1 \u_sdram/ux_command/reg0_b3  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/command_delay [4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/n19 ),
    .q(\u_sdram/ux_command/command_delay [3]));  // ../Command.v(141)
  reg_ar_ss_w1 \u_sdram/ux_command/reg0_b4  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/command_delay [5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/n19 ),
    .q(\u_sdram/ux_command/command_delay [4]));  // ../Command.v(141)
  reg_ar_ss_w1 \u_sdram/ux_command/reg0_b5  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/command_delay [6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/n19 ),
    .q(\u_sdram/ux_command/command_delay [5]));  // ../Command.v(141)
  reg_ar_ss_w1 \u_sdram/ux_command/reg0_b6  (
    .clk(clk_200m),
    .d(\u_sdram/cm_ack ),
    .en(1'b1),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/n19 ),
    .q(\u_sdram/ux_command/command_delay [6]));  // ../Command.v(141)
  reg_ar_ss_w1 \u_sdram/ux_command/reg1_b0  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/rp_shift [1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/n24 ),
    .q(\u_sdram/ux_command/rp_shift [0]));  // ../Command.v(141)
  reg_ar_ss_w1 \u_sdram/ux_command/reg1_b1  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/rp_shift [2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/n24 ),
    .q(\u_sdram/ux_command/rp_shift [1]));  // ../Command.v(141)
  reg_ar_ss_w1 \u_sdram/ux_command/reg1_b2  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/rp_shift [3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/n24 ),
    .q(\u_sdram/ux_command/rp_shift [2]));  // ../Command.v(141)
  reg_ar_as_w1 \u_sdram/ux_command/reg1_b3  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n24 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_command/rp_shift [3]));  // ../Command.v(141)
  reg_ar_as_w1 \u_sdram/ux_command/reg2_b0  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n38 [0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_command/rw_shift [0]));  // ../Command.v(183)
  reg_ar_as_w1 \u_sdram/ux_command/reg2_b1  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n38 [1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_command/rw_shift [1]));  // ../Command.v(183)
  reg_ar_as_w1 \u_sdram/ux_command/reg3_b0  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n39 [0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ISA [0]));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/reg3_b1  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n39 [1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ISA [1]));  // ../Command.v(271)
  reg_ar_ss_w1 \u_sdram/ux_command/reg3_b10  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n40 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(\u_sdram/ux_command/do_load_mode ),
    .q(\u_sdram/ISA [10]));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/reg3_b2  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n39 [2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ISA [2]));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/reg3_b3  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n39 [3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ISA [3]));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/reg3_b4  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n39 [4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ISA [4]));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/reg3_b5  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n39 [5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ISA [5]));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/reg3_b6  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n39 [6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ISA [6]));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/reg3_b7  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n39 [7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ISA [7]));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/reg3_b8  (
    .clk(clk_200m),
    .d(\u_sdram/saddr [16]),
    .en(\u_sdram/ux_command/n17 ),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ISA [8]));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/reg3_b9  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n41 [0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ISA [9]));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/reg4_b0  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n42 [0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/IBA [0]));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/reg4_b1  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n42 [1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/IBA [1]));  // ../Command.v(271)
  reg_ar_as_w1 \u_sdram/ux_command/rp_done_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/n26 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_command/rp_done ));  // ../Command.v(141)
  reg_ar_as_w1 \u_sdram/ux_command/rw_flag_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_command/do_reada ),
    .en(\u_sdram/ux_command/n19 ),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_command/rw_flag ));  // ../Command.v(141)
  and \u_sdram/ux_command/u10  (\u_sdram/ux_command/n6 , \u_sdram/ux_command/n4 , \u_sdram/ux_command/n5 );  // ../Command.v(90)
  and \u_sdram/ux_command/u12  (\u_sdram/ux_command/n7 , \u_sdram/writea , \u_sdram/ux_command/n1 );  // ../Command.v(95)
  not \u_sdram/ux_command/u13  (\u_sdram/ux_command/n8 , \u_sdram/ux_command/do_writea );  // ../Command.v(95)
  and \u_sdram/ux_command/u14  (\u_sdram/ux_command/n9 , \u_sdram/ux_command/n7 , \u_sdram/ux_command/n8 );  // ../Command.v(95)
  and \u_sdram/ux_command/u16  (\u_sdram/ux_command/n10 , \u_sdram/ux_command/n9 , \u_sdram/ux_command/n5 );  // ../Command.v(95)
  and \u_sdram/ux_command/u18  (\u_sdram/ux_command/n11 , \u_sdram/precharge , \u_sdram/ux_command/n1 );  // ../Command.v(106)
  not \u_sdram/ux_command/u19  (\u_sdram/ux_command/n12 , \u_sdram/ux_command/do_precharge );  // ../Command.v(106)
  and \u_sdram/ux_command/u20  (\u_sdram/ux_command/n13 , \u_sdram/ux_command/n11 , \u_sdram/ux_command/n12 );  // ../Command.v(106)
  and \u_sdram/ux_command/u22  (\u_sdram/ux_command/n14 , \u_sdram/load_mode , \u_sdram/ux_command/n1 );  // ../Command.v(111)
  and \u_sdram/ux_command/u24  (\u_sdram/ux_command/n16 , \u_sdram/ux_command/n14 , \u_sdram/ux_command/do_load_mode_neg );  // ../Command.v(111)
  or \u_sdram/ux_command/u25  (\u_sdram/ux_command/n17 , \u_sdram/ux_command/do_reada , \u_sdram/ux_command/do_writea );  // ../Command.v(116)
  or \u_sdram/ux_command/u26  (\u_sdram/ux_command/n18 , \u_sdram/ux_command/n17 , \u_sdram/ux_command/do_precharge );  // ../Command.v(116)
  or \u_sdram/ux_command/u27  (\u_sdram/ux_command/n19 , \u_sdram/ux_command/n18 , \u_sdram/ux_command/do_load_mode );  // ../Command.v(116)
  not \u_sdram/ux_command/u30  (\u_sdram/ux_command/n23 , \u_sdram/ux_command/command_delay [0]);  // ../Command.v(130)
  and \u_sdram/ux_command/u31  (\u_sdram/ux_command/n24 , \u_sdram/ux_command/n23 , \u_sdram/ux_command/command_done );  // ../Command.v(130)
  AL_MUX \u_sdram/ux_command/u32  (
    .i0(\u_sdram/ux_command/rp_shift [0]),
    .i1(1'b0),
    .sel(\u_sdram/ux_command/n24 ),
    .o(\u_sdram/ux_command/n26 ));  // ../Command.v(140)
  or \u_sdram/ux_command/u35  (\u_sdram/ux_command/n27 , \u_sdram/ux_command/do_precharge , \u_sdram/ux_command/do_reada );  // ../Command.v(154)
  AL_MUX \u_sdram/ux_command/u40  (
    .i0(\u_sdram/ux_command/do_rw ),
    .i1(1'b1),
    .sel(\u_sdram/ux_command/n30 ),
    .o(\u_sdram/ux_command/n35 ));  // ../Command.v(175)
  AL_MUX \u_sdram/ux_command/u41  (
    .i0(\u_sdram/ux_command/rw_shift [0]),
    .i1(\u_sdram/ux_command/n35 ),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n37 ));  // ../Command.v(182)
  AL_MUX \u_sdram/ux_command/u48  (
    .i0(\u_sdram/ux_command/n39 [10]),
    .i1(1'b0),
    .sel(\u_sdram/ux_command/bankclose ),
    .o(\u_sdram/ux_command/n40 ));  // ../Command.v(224)
  or \u_sdram/ux_command/u49  (\u_sdram/ux_command/n43 , \u_sdram/ux_command/oe1 , \u_sdram/ux_command/rw_flag );  // ../Command.v(234)
  not \u_sdram/ux_command/u5  (\u_sdram/ux_command/n1 , \u_sdram/ux_command/command_done );  // ../Command.v(90)
  and \u_sdram/ux_command/u50  (\u_sdram/ux_command/n44 , \u_sdram/ux_command/do_precharge , \u_sdram/ux_command/n43 );  // ../Command.v(234)
  or \u_sdram/ux_command/u51  (\u_sdram/ux_command/n45 , \u_sdram/ux_command/do_precharge , \u_sdram/ux_command/bankclose );  // ../Command.v(240)
  not \u_sdram/ux_command/u56  (\u_sdram/ux_command/n46 , \u_sdram/ux_command/do_rw );  // ../Command.v(270)
  AL_MUX \u_sdram/ux_command/u59  (
    .i0(\u_sdram/ux_command/n46 ),
    .i1(1'b1),
    .sel(\u_sdram/ux_command/n17 ),
    .o(\u_sdram/ux_command/n49 ));  // ../Command.v(270)
  and \u_sdram/ux_command/u6  (\u_sdram/ux_command/n2 , \u_sdram/reada , \u_sdram/ux_command/n1 );  // ../Command.v(90)
  AL_MUX \u_sdram/ux_command/u60  (
    .i0(1'b1),
    .i1(\u_sdram/ux_command/rw_flag ),
    .sel(\u_sdram/ux_command/u60_sel_is_2_o ),
    .o(\u_sdram/ux_command/n50 ));
  and \u_sdram/ux_command/u60_sel_is_2  (\u_sdram/ux_command/u60_sel_is_2_o , \u_sdram/ux_command/n17_neg , \u_sdram/ux_command/do_rw );
  AL_MUX \u_sdram/ux_command/u62  (
    .i0(\u_sdram/ux_command/n49 ),
    .i1(1'b0),
    .sel(\u_sdram/ux_command/do_load_mode ),
    .o(\u_sdram/ux_command/n52 ));  // ../Command.v(270)
  AL_MUX \u_sdram/ux_command/u64  (
    .i0(1'b0),
    .i1(\u_sdram/ux_command/n17_neg ),
    .sel(\u_sdram/ux_command/u64_sel_is_0_o ),
    .o(\u_sdram/ux_command/n54 ));
  and \u_sdram/ux_command/u64_sel_is_0  (\u_sdram/ux_command/u64_sel_is_0_o , \u_sdram/ux_command/n45_neg , \u_sdram/ux_command/do_load_mode_neg );
  AL_MUX \u_sdram/ux_command/u67  (
    .i0(\u_sdram/ux_command/bankclose ),
    .i1(1'b0),
    .sel(\u_sdram/ux_command/n45 ),
    .o(\u_sdram/ux_command/n57 ));  // ../Command.v(270)
  AL_MUX \u_sdram/ux_command/u68  (
    .i0(\u_sdram/ux_command/n54 ),
    .i1(1'b1),
    .sel(\u_sdram/ux_command/n44 ),
    .o(\u_sdram/ux_command/n58 ));  // ../Command.v(270)
  AL_MUX \u_sdram/ux_command/u69  (
    .i0(1'b1),
    .i1(\u_sdram/ux_command/n52 ),
    .sel(\u_sdram/ux_command/u69_sel_is_0_o ),
    .o(\u_sdram/ux_command/n59 ));
  and \u_sdram/ux_command/u69_sel_is_0  (\u_sdram/ux_command/u69_sel_is_0_o , \u_sdram/ux_command/n44_neg , \u_sdram/ux_command/n45_neg );
  not \u_sdram/ux_command/u7  (\u_sdram/ux_command/n3 , \u_sdram/ux_command/do_reada );  // ../Command.v(90)
  and \u_sdram/ux_command/u70_sel_is_2  (\u_sdram/ux_command/u70_sel_is_2_o , \u_sdram/ux_command/n44_neg , \u_sdram/ux_command/u64_sel_is_0_o );
  AL_MUX \u_sdram/ux_command/u71  (
    .i0(\u_sdram/ux_command/n57 ),
    .i1(1'b1),
    .sel(\u_sdram/ux_command/n44 ),
    .o(\u_sdram/ux_command/n61 ));  // ../Command.v(270)
  and \u_sdram/ux_command/u8  (\u_sdram/ux_command/n4 , \u_sdram/ux_command/n2 , \u_sdram/ux_command/n3 );  // ../Command.v(90)
  not \u_sdram/ux_command/u9  (\u_sdram/ux_command/n5 , \u_sdram/ux_command/rp_done );  // ../Command.v(90)
  reg_ar_as_w1 \u_sdram/ux_control/CMD_ACK_int_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_control/n20 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_cmd_ack));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(133)
  reg_ar_as_w1 \u_sdram/ux_control/LOAD_MODE_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_control/n5 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/load_mode ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/LOAD_REG1_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_control/n8 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_control/LOAD_REG1 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/LOAD_REG2_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_control/n11 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_control/LOAD_REG2 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/PRECHARGE_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_control/n4 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/precharge ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/READA_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_control/n2 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/reada ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/WRITEA_reg  (
    .clk(clk_200m),
    .d(\u_sdram/ux_control/n3 ),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/writea ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  eq_w3 \u_sdram/ux_control/eq1  (
    .i0(sd_cmd),
    .i1(3'b001),
    .o(\u_sdram/ux_control/n2 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(64)
  eq_w3 \u_sdram/ux_control/eq2  (
    .i0(sd_cmd),
    .i1(3'b010),
    .o(\u_sdram/ux_control/n3 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(69)
  eq_w3 \u_sdram/ux_control/eq3  (
    .i0(sd_cmd),
    .i1(3'b100),
    .o(\u_sdram/ux_control/n4 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(75)
  eq_w3 \u_sdram/ux_control/eq4  (
    .i0(sd_cmd),
    .i1(3'b101),
    .o(\u_sdram/ux_control/n5 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(80)
  eq_w3 \u_sdram/ux_control/eq5  (
    .i0(sd_cmd),
    .i1(3'b110),
    .o(\u_sdram/ux_control/n6 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(85)
  eq_w3 \u_sdram/ux_control/eq6  (
    .i0(sd_cmd),
    .i1(3'b111),
    .o(\u_sdram/ux_control/n9 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(90)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b0  (
    .clk(clk_200m),
    .d(sd_addr[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b1  (
    .clk(clk_200m),
    .d(sd_addr[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b10  (
    .clk(clk_200m),
    .d(sd_addr[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b11  (
    .clk(clk_200m),
    .d(sd_addr[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b12  (
    .clk(clk_200m),
    .d(sd_addr[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b13  (
    .clk(clk_200m),
    .d(sd_addr[13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b14  (
    .clk(clk_200m),
    .d(sd_addr[14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b15  (
    .clk(clk_200m),
    .d(sd_addr[15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b16  (
    .clk(clk_200m),
    .d(sd_addr[16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b17  (
    .clk(clk_200m),
    .d(sd_addr[17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b18  (
    .clk(clk_200m),
    .d(sd_addr[18]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [18]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b19  (
    .clk(clk_200m),
    .d(sd_addr[19]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [19]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b2  (
    .clk(clk_200m),
    .d(sd_addr[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b20  (
    .clk(clk_200m),
    .d(sd_addr[20]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [20]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b3  (
    .clk(clk_200m),
    .d(sd_addr[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b4  (
    .clk(clk_200m),
    .d(sd_addr[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b5  (
    .clk(clk_200m),
    .d(sd_addr[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b6  (
    .clk(clk_200m),
    .d(sd_addr[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b7  (
    .clk(clk_200m),
    .d(sd_addr[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b8  (
    .clk(clk_200m),
    .d(sd_addr[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg0_b9  (
    .clk(clk_200m),
    .d(sd_addr[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/saddr [9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w1 \u_sdram/ux_control/reg2_b0  (
    .clk(clk_200m),
    .d(\u_sdram/saddr [2]),
    .en(\u_sdram/ux_control/LOAD_REG1 ),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/sc_rc [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(117)
  reg_ar_as_w1 \u_sdram/ux_control/reg2_b1  (
    .clk(clk_200m),
    .d(\u_sdram/saddr [3]),
    .en(\u_sdram/ux_control/LOAD_REG1 ),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/sc_rc [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(117)
  or \u_sdram/ux_control/u19  (\u_sdram/ux_control/n17 , \u_sdram/cm_ack , \u_sdram/ux_control/LOAD_REG1 );  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(129)
  or \u_sdram/ux_control/u21  (\u_sdram/ux_control/n18 , \u_sdram/ux_control/n17 , \u_sdram/ux_control/LOAD_REG2 );  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(129)
  and \u_sdram/ux_control/u23  (\u_sdram/ux_control/n20 , \u_sdram/ux_control/n18 , n12[0]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(129)
  not \u_sdram/ux_control/u6  (\u_sdram/ux_control/n7 , \u_sdram/ux_control/LOAD_REG1 );  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(85)
  and \u_sdram/ux_control/u7  (\u_sdram/ux_control/n8 , \u_sdram/ux_control/n6 , \u_sdram/ux_control/n7 );  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(85)
  not \u_sdram/ux_control/u8  (\u_sdram/ux_control/n10 , \u_sdram/ux_control/LOAD_REG2 );  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(90)
  and \u_sdram/ux_control/u9  (\u_sdram/ux_control/n11 , \u_sdram/ux_control/n9 , \u_sdram/ux_control/n10 );  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(90)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg0_b0  (
    .clk(clk_200m),
    .d(\u_sdram/ux_data_path/DIN1 [0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/DQOUT [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg0_b1  (
    .clk(clk_200m),
    .d(\u_sdram/ux_data_path/DIN1 [1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/DQOUT [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg0_b10  (
    .clk(clk_200m),
    .d(\u_sdram/ux_data_path/DIN1 [10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/DQOUT [10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg0_b11  (
    .clk(clk_200m),
    .d(\u_sdram/ux_data_path/DIN1 [11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/DQOUT [11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg0_b12  (
    .clk(clk_200m),
    .d(\u_sdram/ux_data_path/DIN1 [12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/DQOUT [12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg0_b13  (
    .clk(clk_200m),
    .d(\u_sdram/ux_data_path/DIN1 [13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/DQOUT [13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg0_b14  (
    .clk(clk_200m),
    .d(\u_sdram/ux_data_path/DIN1 [14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/DQOUT [14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg0_b15  (
    .clk(clk_200m),
    .d(\u_sdram/ux_data_path/DIN1 [15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/DQOUT [15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg1_b0  (
    .clk(clk_200m),
    .d(fifo_q[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_data_path/DIN1 [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg1_b1  (
    .clk(clk_200m),
    .d(fifo_q[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_data_path/DIN1 [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg1_b10  (
    .clk(clk_200m),
    .d(fifo_q[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_data_path/DIN1 [10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg1_b11  (
    .clk(clk_200m),
    .d(fifo_q[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_data_path/DIN1 [11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg1_b12  (
    .clk(clk_200m),
    .d(fifo_q[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_data_path/DIN1 [12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg1_b13  (
    .clk(clk_200m),
    .d(fifo_q[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_data_path/DIN1 [13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg1_b14  (
    .clk(clk_200m),
    .d(fifo_q[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_data_path/DIN1 [14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w1 \u_sdram/ux_data_path/reg1_b15  (
    .clk(clk_200m),
    .d(fifo_q[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\u_sdram/ux_data_path/DIN1 [15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  EG_LOGIC_BUFG \u_sys_pll/bufg_feedback  (
    .i(\u_sys_pll/clk0_buf ),
    .o(clk_200m_keep));  // al_ip/pll1.v(33)
  EG_PHY_PLL #(
    .CLKC0_CPHASE(4),
    .CLKC0_DIV(5),
    .CLKC0_DIV2_ENABLE("DISABLE"),
    .CLKC0_ENABLE("ENABLE"),
    .CLKC0_FPHASE(0),
    .CLKC1_CPHASE(5),
    .CLKC1_DIV(5),
    .CLKC1_DIV2_ENABLE("DISABLE"),
    .CLKC1_ENABLE("ENABLE"),
    .CLKC1_FPHASE(2),
    .CLKC2_CPHASE(1),
    .CLKC2_DIV(1),
    .CLKC2_DIV2_ENABLE("DISABLE"),
    .CLKC2_ENABLE("DISABLE"),
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
    .FBCLK_DIV(8),
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
    .PLLRST_ENA("DISABLE"),
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
    \u_sys_pll/pll_inst  (
    .daddr(6'b000000),
    .dclk(1'b0),
    .dcs(1'b0),
    .di(8'b00000000),
    .dwe(1'b0),
    .fbclk(clk_200m),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(CLKIN),
    .reset(1'b0),
    .stdby(1'b0),
    .clkc({open_n0,open_n1,open_n2,sd_clk_int_keep,\u_sys_pll/clk0_buf }));  // al_ip/pll1.v(60)
  add_pu25_pu25_o25 \ux_seg/add0  (
    .i0(\ux_seg/cnt ),
    .i1(25'b0000000000000000000000001),
    .o(\ux_seg/n2 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  add_pu18_pu18_o18 \ux_seg/add1  (
    .i0(\ux_seg/cnt_w ),
    .i1(18'b000000000000000001),
    .o(\ux_seg/n13 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  not \ux_seg/cnt_w[16]_inv  (\ux_seg/cnt_w$16$_neg , \ux_seg/cnt_w [16]);
  not \ux_seg/cnt_w[17]_inv  (\ux_seg/cnt_w$17$_neg , \ux_seg/cnt_w [17]);
  eq_w25 \ux_seg/eq0  (
    .i0(\ux_seg/cnt ),
    .i1(25'b0101101110001101100000000),
    .o(\ux_seg/n1 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(54)
  eq_w18 \ux_seg/eq1  (
    .i0(\ux_seg/cnt_w ),
    .i1(18'b111111111111111111),
    .o(\ux_seg/n12 ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(73)
  binary_mux_s1_w1 \ux_seg/mux0_b0  (
    .i0(\ux_seg/n2 [0]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b1  (
    .i0(\ux_seg/n2 [1]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b10  (
    .i0(\ux_seg/n2 [10]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b11  (
    .i0(\ux_seg/n2 [11]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b12  (
    .i0(\ux_seg/n2 [12]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b13  (
    .i0(\ux_seg/n2 [13]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b14  (
    .i0(\ux_seg/n2 [14]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b15  (
    .i0(\ux_seg/n2 [15]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b16  (
    .i0(\ux_seg/n2 [16]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b17  (
    .i0(\ux_seg/n2 [17]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b18  (
    .i0(\ux_seg/n2 [18]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [18]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b19  (
    .i0(\ux_seg/n2 [19]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [19]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b2  (
    .i0(\ux_seg/n2 [2]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b20  (
    .i0(\ux_seg/n2 [20]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [20]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b21  (
    .i0(\ux_seg/n2 [21]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [21]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b22  (
    .i0(\ux_seg/n2 [22]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [22]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b23  (
    .i0(\ux_seg/n2 [23]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [23]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b24  (
    .i0(\ux_seg/n2 [24]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [24]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b3  (
    .i0(\ux_seg/n2 [3]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b4  (
    .i0(\ux_seg/n2 [4]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b5  (
    .i0(\ux_seg/n2 [5]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b6  (
    .i0(\ux_seg/n2 [6]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b7  (
    .i0(\ux_seg/n2 [7]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b8  (
    .i0(\ux_seg/n2 [8]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w1 \ux_seg/mux0_b9  (
    .i0(\ux_seg/n2 [9]),
    .i1(1'b0),
    .sel(\ux_seg/n1 ),
    .o(\ux_seg/n3 [9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s2_w1 \ux_seg/mux10_b0  (
    .i0(\ux_seg/sm_bit1_num [0]),
    .i1(\ux_seg/sm_bit2_num [0]),
    .i2(\ux_seg/sm_bit3_num [0]),
    .i3(1'b0),
    .sel(\ux_seg/cnt_w [17:16]),
    .o(\ux_seg/n15 [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(90)
  binary_mux_s2_w1 \ux_seg/mux10_b1  (
    .i0(\ux_seg/sm_bit1_num [1]),
    .i1(\ux_seg/sm_bit2_num [1]),
    .i2(\ux_seg/sm_bit3_num [1]),
    .i3(1'b0),
    .sel(\ux_seg/cnt_w [17:16]),
    .o(\ux_seg/n15 [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(90)
  binary_mux_s2_w1 \ux_seg/mux10_b2  (
    .i0(\ux_seg/sm_bit1_num [2]),
    .i1(\ux_seg/sm_bit2_num [2]),
    .i2(1'b0),
    .i3(1'b0),
    .sel(\ux_seg/cnt_w [17:16]),
    .o(\ux_seg/n15 [2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(90)
  binary_mux_s2_w1 \ux_seg/mux10_b3  (
    .i0(\ux_seg/sm_bit1_num [3]),
    .i1(\ux_seg/sm_bit2_num [3]),
    .i2(1'b0),
    .i3(1'b0),
    .sel(\ux_seg/cnt_w [17:16]),
    .o(\ux_seg/n15 [3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(90)
  and \ux_seg/mux11_b0_sel_is_0  (\ux_seg/mux11_b0_sel_is_0_o , \ux_seg/cnt_w$16$_neg , \ux_seg/cnt_w$17$_neg );
  and \ux_seg/mux11_b1_sel_is_1  (\ux_seg/mux11_b1_sel_is_1_o , \ux_seg/cnt_w [16], \ux_seg/cnt_w$17$_neg );
  and \ux_seg/mux11_b2_sel_is_2  (\ux_seg/mux11_b2_sel_is_2_o , \ux_seg/cnt_w$16$_neg , \ux_seg/cnt_w [17]);
  and \ux_seg/mux11_b3_sel_is_3  (\ux_seg/mux11_b3_sel_is_3_o , \ux_seg/cnt_w [16], \ux_seg/cnt_w [17]);
  binary_mux_s4_w1 \ux_seg/mux12_b0  (
    .i0(1'b0),
    .i1(1'b1),
    .i10(1'b0),
    .i11(1'b0),
    .i12(1'b0),
    .i13(1'b0),
    .i14(1'b0),
    .i15(1'b0),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b1),
    .i5(1'b0),
    .i6(1'b0),
    .i7(1'b0),
    .i8(1'b0),
    .i9(1'b0),
    .sel(\ux_seg/sm_seg_num ),
    .o(sm_seg[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(133)
  binary_mux_s4_w1 \ux_seg/mux12_b1  (
    .i0(1'b0),
    .i1(1'b0),
    .i10(1'b0),
    .i11(1'b0),
    .i12(1'b0),
    .i13(1'b0),
    .i14(1'b0),
    .i15(1'b0),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b0),
    .i5(1'b1),
    .i6(1'b1),
    .i7(1'b0),
    .i8(1'b0),
    .i9(1'b0),
    .sel(\ux_seg/sm_seg_num ),
    .o(sm_seg[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(133)
  AL_MUX \ux_seg/mux12_b2  (
    .i0(1'b0),
    .i1(1'b1),
    .sel(\ux_seg/mux12_b2_sel_is_2_o ),
    .o(sm_seg[2]));
  and \ux_seg/mux12_b2_sel_is_2  (\ux_seg/mux12_b2_sel_is_2_o , \ux_seg/sm_seg_num$0$_neg , \ux_seg/sm_seg_num [1], \ux_seg/sm_seg_num$2$_neg , \ux_seg/sm_seg_num$3$_neg );
  binary_mux_s4_w1 \ux_seg/mux12_b3  (
    .i0(1'b0),
    .i1(1'b1),
    .i10(1'b0),
    .i11(1'b0),
    .i12(1'b0),
    .i13(1'b0),
    .i14(1'b0),
    .i15(1'b0),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b1),
    .i5(1'b0),
    .i6(1'b0),
    .i7(1'b1),
    .i8(1'b0),
    .i9(1'b0),
    .sel(\ux_seg/sm_seg_num ),
    .o(sm_seg[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(133)
  binary_mux_s4_w1 \ux_seg/mux12_b4  (
    .i0(1'b0),
    .i1(1'b1),
    .i10(1'b0),
    .i11(1'b0),
    .i12(1'b0),
    .i13(1'b0),
    .i14(1'b0),
    .i15(1'b0),
    .i2(1'b0),
    .i3(1'b1),
    .i4(1'b1),
    .i5(1'b1),
    .i6(1'b0),
    .i7(1'b1),
    .i8(1'b0),
    .i9(1'b1),
    .sel(\ux_seg/sm_seg_num ),
    .o(sm_seg[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(133)
  binary_mux_s4_w1 \ux_seg/mux12_b5  (
    .i0(1'b0),
    .i1(1'b1),
    .i10(1'b0),
    .i11(1'b0),
    .i12(1'b0),
    .i13(1'b0),
    .i14(1'b0),
    .i15(1'b0),
    .i2(1'b1),
    .i3(1'b1),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b0),
    .i7(1'b1),
    .i8(1'b0),
    .i9(1'b0),
    .sel(\ux_seg/sm_seg_num ),
    .o(sm_seg[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(133)
  binary_mux_s4_w1 \ux_seg/mux12_b6  (
    .i0(1'b1),
    .i1(1'b1),
    .i10(1'b1),
    .i11(1'b1),
    .i12(1'b1),
    .i13(1'b1),
    .i14(1'b1),
    .i15(1'b1),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b0),
    .i7(1'b1),
    .i8(1'b0),
    .i9(1'b0),
    .sel(\ux_seg/sm_seg_num ),
    .o(sm_seg[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(133)
  and \ux_seg/mux5_b0_sel_is_2  (\ux_seg/mux5_b0_sel_is_2_o , rst_n, \ux_seg/n1 );
  binary_mux_s1_w1 \ux_seg/mux9_b0  (
    .i0(\ux_seg/n13 [0]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b1  (
    .i0(\ux_seg/n13 [1]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b10  (
    .i0(\ux_seg/n13 [10]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b11  (
    .i0(\ux_seg/n13 [11]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b12  (
    .i0(\ux_seg/n13 [12]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b13  (
    .i0(\ux_seg/n13 [13]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b14  (
    .i0(\ux_seg/n13 [14]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b15  (
    .i0(\ux_seg/n13 [15]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b16  (
    .i0(\ux_seg/n13 [16]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b17  (
    .i0(\ux_seg/n13 [17]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b2  (
    .i0(\ux_seg/n13 [2]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b3  (
    .i0(\ux_seg/n13 [3]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b4  (
    .i0(\ux_seg/n13 [4]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b5  (
    .i0(\ux_seg/n13 [5]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b6  (
    .i0(\ux_seg/n13 [6]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b7  (
    .i0(\ux_seg/n13 [7]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b8  (
    .i0(\ux_seg/n13 [8]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  binary_mux_s1_w1 \ux_seg/mux9_b9  (
    .i0(\ux_seg/n13 [9]),
    .i1(1'b0),
    .sel(\ux_seg/n12 ),
    .o(\ux_seg/n14 [9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg0_b0  (
    .clk(CLKIN),
    .d(sd_dataout[0]),
    .en(\ux_seg/mux5_b0_sel_is_2_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\ux_seg/sm_bit1_num [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg0_b1  (
    .clk(CLKIN),
    .d(bcdnum[1]),
    .en(\ux_seg/mux5_b0_sel_is_2_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\ux_seg/sm_bit1_num [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg0_b2  (
    .clk(CLKIN),
    .d(bcdnum[2]),
    .en(\ux_seg/mux5_b0_sel_is_2_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\ux_seg/sm_bit1_num [2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg0_b3  (
    .clk(CLKIN),
    .d(bcdnum[3]),
    .en(\ux_seg/mux5_b0_sel_is_2_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\ux_seg/sm_bit1_num [3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg1_b0  (
    .clk(CLKIN),
    .d(bcdnum[4]),
    .en(\ux_seg/mux5_b0_sel_is_2_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\ux_seg/sm_bit2_num [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg1_b1  (
    .clk(CLKIN),
    .d(bcdnum[5]),
    .en(\ux_seg/mux5_b0_sel_is_2_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\ux_seg/sm_bit2_num [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg1_b2  (
    .clk(CLKIN),
    .d(bcdnum[6]),
    .en(\ux_seg/mux5_b0_sel_is_2_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\ux_seg/sm_bit2_num [2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg1_b3  (
    .clk(CLKIN),
    .d(bcdnum[7]),
    .en(\ux_seg/mux5_b0_sel_is_2_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\ux_seg/sm_bit2_num [3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg2_b0  (
    .clk(CLKIN),
    .d(bcdnum[8]),
    .en(\ux_seg/mux5_b0_sel_is_2_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\ux_seg/sm_bit3_num [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg2_b1  (
    .clk(CLKIN),
    .d(bcdnum[9]),
    .en(\ux_seg/mux5_b0_sel_is_2_o ),
    .reset(1'b0),
    .set(1'b0),
    .q(\ux_seg/sm_bit3_num [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg4_b0  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b1  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b10  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b11  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b12  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b13  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b14  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b15  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b16  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b17  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b2  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b3  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b4  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b5  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b6  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b7  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b8  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg4_b9  (
    .clk(CLKIN),
    .d(\ux_seg/n14 [9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt_w [9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w1 \ux_seg/reg5_b0  (
    .clk(CLKIN),
    .d(\ux_seg/n15 [0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/sm_seg_num [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(91)
  reg_ar_as_w1 \ux_seg/reg5_b1  (
    .clk(CLKIN),
    .d(\ux_seg/n15 [1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/sm_seg_num [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(91)
  reg_ar_as_w1 \ux_seg/reg5_b2  (
    .clk(CLKIN),
    .d(\ux_seg/n15 [2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/sm_seg_num [2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(91)
  reg_ar_as_w1 \ux_seg/reg5_b3  (
    .clk(CLKIN),
    .d(\ux_seg/n15 [3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/sm_seg_num [3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(91)
  reg_ar_as_w1 \ux_seg/reg6_b0  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b1  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b10  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [10]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b11  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [11]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b12  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [12]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b13  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b14  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [14]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b15  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [15]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b16  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [16]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b17  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b18  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [18]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [18]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b19  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [19]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [19]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b2  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b20  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [20]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [20]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b21  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [21]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [21]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b22  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [22]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [22]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b23  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [23]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [23]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b24  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [24]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [24]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b3  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b4  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b5  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b6  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b7  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b8  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [8]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w1 \ux_seg/reg6_b9  (
    .clk(CLKIN),
    .d(\ux_seg/n3 [9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(\ux_seg/cnt [9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_sr_as_w1 \ux_seg/reg7_b0  (
    .clk(CLKIN),
    .d(1'b1),
    .en(1'b1),
    .reset(\ux_seg/mux11_b0_sel_is_0_o ),
    .set(~rst_n),
    .q(sm_bit[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(106)
  reg_sr_as_w1 \ux_seg/reg7_b1  (
    .clk(CLKIN),
    .d(1'b1),
    .en(1'b1),
    .reset(\ux_seg/mux11_b1_sel_is_1_o ),
    .set(~rst_n),
    .q(sm_bit[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(106)
  reg_sr_as_w1 \ux_seg/reg7_b2  (
    .clk(CLKIN),
    .d(1'b1),
    .en(1'b1),
    .reset(\ux_seg/mux11_b2_sel_is_2_o ),
    .set(~rst_n),
    .q(sm_bit[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(106)
  reg_sr_as_w1 \ux_seg/reg7_b3  (
    .clk(CLKIN),
    .d(1'b1),
    .en(1'b1),
    .reset(\ux_seg/mux11_b3_sel_is_3_o ),
    .set(~rst_n),
    .q(sm_bit[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(106)
  not \ux_seg/sm_seg_num[0]_inv  (\ux_seg/sm_seg_num$0$_neg , \ux_seg/sm_seg_num [0]);
  not \ux_seg/sm_seg_num[2]_inv  (\ux_seg/sm_seg_num$2$_neg , \ux_seg/sm_seg_num [2]);
  not \ux_seg/sm_seg_num[3]_inv  (\ux_seg/sm_seg_num$3$_neg , \ux_seg/sm_seg_num [3]);
  not \wr_state[0]_inv  (wr_state$0$_neg, wr_state[0]);
  not \wr_state[1]_inv  (wr_state$1$_neg, wr_state[1]);

endmodule 

module AL_BUFKEEP
  (
  i,
  o
  );

  input i;
  output o;

  parameter KEEP = "OUT";

  buf u1 (o, i);

endmodule 

module add_pu16_pu16_o16
  (
  i0,
  i1,
  o
  );

  input [15:0] i0;
  input [15:0] i1;
  output [15:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a12;
  wire net_a13;
  wire net_a14;
  wire net_a15;
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
  wire net_b13;
  wire net_b14;
  wire net_b15;
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
  wire net_cout13;
  wire net_cout14;
  wire net_cout15;
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
  wire net_sum13;
  wire net_sum14;
  wire net_sum15;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a15 = i0[15];
  assign net_a14 = i0[14];
  assign net_a13 = i0[13];
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
  assign net_b15 = i1[15];
  assign net_b14 = i1[14];
  assign net_b13 = i1[13];
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
  assign o[15] = net_sum15;
  assign o[14] = net_sum14;
  assign o[13] = net_sum13;
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
  AL_FADD comp_13 (
    .a(net_a13),
    .b(net_b13),
    .c(net_cout12),
    .cout(net_cout13),
    .sum(net_sum13));
  AL_FADD comp_14 (
    .a(net_a14),
    .b(net_b14),
    .c(net_cout13),
    .cout(net_cout14),
    .sum(net_sum14));
  AL_FADD comp_15 (
    .a(net_a15),
    .b(net_b15),
    .c(net_cout14),
    .cout(net_cout15),
    .sum(net_sum15));
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

module add_pu2_pu2_o2
  (
  i0,
  i1,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  output [1:0] o;

  wire net_a0;
  wire net_a1;
  wire net_b0;
  wire net_b1;
  wire net_cout0;
  wire net_cout1;
  wire net_sum0;
  wire net_sum1;

  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
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

module add_pu3_pu3_o3
  (
  i0,
  i1,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  output [2:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;

  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
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

endmodule 

module add_pu9_pu9_o9
  (
  i0,
  i1,
  o
  );

  input [8:0] i0;
  input [8:0] i1;
  output [8:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;

  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
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

module eq_w16
  (
  i0,
  i1,
  o
  );

  input [15:0] i0;
  input [15:0] i1;
  output o;

  wire or_or_or_or_xor_i0$0_o;
  wire or_or_or_xor_i0$0$_i_o;
  wire or_or_or_xor_i0$8$_i_o;
  wire or_or_xor_i0$0$_i1$0_o;
  wire or_or_xor_i0$12$_i1$_o;
  wire or_or_xor_i0$4$_i1$4_o;
  wire or_or_xor_i0$8$_i1$8_o;
  wire or_xor_i0$0$_i1$0$_o_o;
  wire or_xor_i0$10$_i1$10$_o;
  wire or_xor_i0$12$_i1$12$_o;
  wire or_xor_i0$14$_i1$14$_o;
  wire or_xor_i0$2$_i1$2$_o_o;
  wire or_xor_i0$4$_i1$4$_o_o;
  wire or_xor_i0$6$_i1$6$_o_o;
  wire or_xor_i0$8$_i1$8$_o_o;
  wire xor_i0$0$_i1$0$_o;
  wire xor_i0$1$_i1$1$_o;
  wire xor_i0$10$_i1$10$_o;
  wire xor_i0$11$_i1$11$_o;
  wire xor_i0$12$_i1$12$_o;
  wire xor_i0$13$_i1$13$_o;
  wire xor_i0$14$_i1$14$_o;
  wire xor_i0$15$_i1$15$_o;
  wire xor_i0$2$_i1$2$_o;
  wire xor_i0$3$_i1$3$_o;
  wire xor_i0$4$_i1$4$_o;
  wire xor_i0$5$_i1$5$_o;
  wire xor_i0$6$_i1$6$_o;
  wire xor_i0$7$_i1$7$_o;
  wire xor_i0$8$_i1$8$_o;
  wire xor_i0$9$_i1$9$_o;

  not none_diff (o, or_or_or_or_xor_i0$0_o);
  or or_or_or_or_xor_i0$0 (or_or_or_or_xor_i0$0_o, or_or_or_xor_i0$0$_i_o, or_or_or_xor_i0$8$_i_o);
  or or_or_or_xor_i0$0$_i (or_or_or_xor_i0$0$_i_o, or_or_xor_i0$0$_i1$0_o, or_or_xor_i0$4$_i1$4_o);
  or or_or_or_xor_i0$8$_i (or_or_or_xor_i0$8$_i_o, or_or_xor_i0$8$_i1$8_o, or_or_xor_i0$12$_i1$_o);
  or or_or_xor_i0$0$_i1$0 (or_or_xor_i0$0$_i1$0_o, or_xor_i0$0$_i1$0$_o_o, or_xor_i0$2$_i1$2$_o_o);
  or or_or_xor_i0$12$_i1$ (or_or_xor_i0$12$_i1$_o, or_xor_i0$12$_i1$12$_o, or_xor_i0$14$_i1$14$_o);
  or or_or_xor_i0$4$_i1$4 (or_or_xor_i0$4$_i1$4_o, or_xor_i0$4$_i1$4$_o_o, or_xor_i0$6$_i1$6$_o_o);
  or or_or_xor_i0$8$_i1$8 (or_or_xor_i0$8$_i1$8_o, or_xor_i0$8$_i1$8$_o_o, or_xor_i0$10$_i1$10$_o);
  or or_xor_i0$0$_i1$0$_o (or_xor_i0$0$_i1$0$_o_o, xor_i0$0$_i1$0$_o, xor_i0$1$_i1$1$_o);
  or or_xor_i0$10$_i1$10$ (or_xor_i0$10$_i1$10$_o, xor_i0$10$_i1$10$_o, xor_i0$11$_i1$11$_o);
  or or_xor_i0$12$_i1$12$ (or_xor_i0$12$_i1$12$_o, xor_i0$12$_i1$12$_o, xor_i0$13$_i1$13$_o);
  or or_xor_i0$14$_i1$14$ (or_xor_i0$14$_i1$14$_o, xor_i0$14$_i1$14$_o, xor_i0$15$_i1$15$_o);
  or or_xor_i0$2$_i1$2$_o (or_xor_i0$2$_i1$2$_o_o, xor_i0$2$_i1$2$_o, xor_i0$3$_i1$3$_o);
  or or_xor_i0$4$_i1$4$_o (or_xor_i0$4$_i1$4$_o_o, xor_i0$4$_i1$4$_o, xor_i0$5$_i1$5$_o);
  or or_xor_i0$6$_i1$6$_o (or_xor_i0$6$_i1$6$_o_o, xor_i0$6$_i1$6$_o, xor_i0$7$_i1$7$_o);
  or or_xor_i0$8$_i1$8$_o (or_xor_i0$8$_i1$8$_o_o, xor_i0$8$_i1$8$_o, xor_i0$9$_i1$9$_o);
  xor \xor_i0[0]_i1[0]  (xor_i0$0$_i1$0$_o, i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (xor_i0$10$_i1$10$_o, i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (xor_i0$11$_i1$11$_o, i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (xor_i0$12$_i1$12$_o, i0[12], i1[12]);
  xor \xor_i0[13]_i1[13]  (xor_i0$13$_i1$13$_o, i0[13], i1[13]);
  xor \xor_i0[14]_i1[14]  (xor_i0$14$_i1$14$_o, i0[14], i1[14]);
  xor \xor_i0[15]_i1[15]  (xor_i0$15$_i1$15$_o, i0[15], i1[15]);
  xor \xor_i0[1]_i1[1]  (xor_i0$1$_i1$1$_o, i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (xor_i0$2$_i1$2$_o, i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (xor_i0$3$_i1$3$_o, i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (xor_i0$4$_i1$4$_o, i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (xor_i0$5$_i1$5$_o, i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (xor_i0$6$_i1$6$_o, i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (xor_i0$7$_i1$7$_o, i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (xor_i0$8$_i1$8$_o, i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (xor_i0$9$_i1$9$_o, i0[9], i1[9]);

endmodule 

module eq_w9
  (
  i0,
  i1,
  o
  );

  input [8:0] i0;
  input [8:0] i1;
  output o;

  wire or_or_or_xor_i0$0$_i_o;
  wire or_or_xor_i0$0$_i1$0_o;
  wire or_or_xor_i0$4$_i1$4_o;
  wire or_xor_i0$0$_i1$0$_o_o;
  wire or_xor_i0$2$_i1$2$_o_o;
  wire or_xor_i0$4$_i1$4$_o_o;
  wire or_xor_i0$6$_i1$6$_o_o;
  wire or_xor_i0$7$_i1$7$_o_o;
  wire xor_i0$0$_i1$0$_o;
  wire xor_i0$1$_i1$1$_o;
  wire xor_i0$2$_i1$2$_o;
  wire xor_i0$3$_i1$3$_o;
  wire xor_i0$4$_i1$4$_o;
  wire xor_i0$5$_i1$5$_o;
  wire xor_i0$6$_i1$6$_o;
  wire xor_i0$7$_i1$7$_o;
  wire xor_i0$8$_i1$8$_o;

  not none_diff (o, or_or_or_xor_i0$0$_i_o);
  or or_or_or_xor_i0$0$_i (or_or_or_xor_i0$0$_i_o, or_or_xor_i0$0$_i1$0_o, or_or_xor_i0$4$_i1$4_o);
  or or_or_xor_i0$0$_i1$0 (or_or_xor_i0$0$_i1$0_o, or_xor_i0$0$_i1$0$_o_o, or_xor_i0$2$_i1$2$_o_o);
  or or_or_xor_i0$4$_i1$4 (or_or_xor_i0$4$_i1$4_o, or_xor_i0$4$_i1$4$_o_o, or_xor_i0$6$_i1$6$_o_o);
  or or_xor_i0$0$_i1$0$_o (or_xor_i0$0$_i1$0$_o_o, xor_i0$0$_i1$0$_o, xor_i0$1$_i1$1$_o);
  or or_xor_i0$2$_i1$2$_o (or_xor_i0$2$_i1$2$_o_o, xor_i0$2$_i1$2$_o, xor_i0$3$_i1$3$_o);
  or or_xor_i0$4$_i1$4$_o (or_xor_i0$4$_i1$4$_o_o, xor_i0$4$_i1$4$_o, xor_i0$5$_i1$5$_o);
  or or_xor_i0$6$_i1$6$_o (or_xor_i0$6$_i1$6$_o_o, xor_i0$6$_i1$6$_o, or_xor_i0$7$_i1$7$_o_o);
  or or_xor_i0$7$_i1$7$_o (or_xor_i0$7$_i1$7$_o_o, xor_i0$7$_i1$7$_o, xor_i0$8$_i1$8$_o);
  xor \xor_i0[0]_i1[0]  (xor_i0$0$_i1$0$_o, i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (xor_i0$1$_i1$1$_o, i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (xor_i0$2$_i1$2$_o, i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (xor_i0$3$_i1$3$_o, i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (xor_i0$4$_i1$4$_o, i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (xor_i0$5$_i1$5$_o, i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (xor_i0$6$_i1$6$_o, i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (xor_i0$7$_i1$7$_o, i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (xor_i0$8$_i1$8$_o, i0[8], i1[8]);

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

  wire or_or_or_xor_i0$0$_i_o;
  wire or_or_xor_i0$0$_i1$0_o;
  wire or_or_xor_i0$6$_i1$6_o;
  wire or_or_xor_i0$9$_i1$9_o;
  wire or_xor_i0$0$_i1$0$_o_o;
  wire or_xor_i0$1$_i1$1$_o_o;
  wire or_xor_i0$11$_i1$11$_o;
  wire or_xor_i0$3$_i1$3$_o_o;
  wire or_xor_i0$4$_i1$4$_o_o;
  wire or_xor_i0$6$_i1$6$_o_o;
  wire or_xor_i0$7$_i1$7$_o_o;
  wire or_xor_i0$9$_i1$9$_o_o;
  wire xor_i0$0$_i1$0$_o;
  wire xor_i0$1$_i1$1$_o;
  wire xor_i0$10$_i1$10$_o;
  wire xor_i0$11$_i1$11$_o;
  wire xor_i0$12$_i1$12$_o;
  wire xor_i0$2$_i1$2$_o;
  wire xor_i0$3$_i1$3$_o;
  wire xor_i0$4$_i1$4$_o;
  wire xor_i0$5$_i1$5$_o;
  wire xor_i0$6$_i1$6$_o;
  wire xor_i0$7$_i1$7$_o;
  wire xor_i0$8$_i1$8$_o;
  wire xor_i0$9$_i1$9$_o;

  not none_diff (o, or_or_or_xor_i0$0$_i_o);
  or or_or_or_xor_i0$0$_i (or_or_or_xor_i0$0$_i_o, or_or_xor_i0$0$_i1$0_o, or_or_xor_i0$6$_i1$6_o);
  or or_or_xor_i0$0$_i1$0 (or_or_xor_i0$0$_i1$0_o, or_xor_i0$0$_i1$0$_o_o, or_xor_i0$3$_i1$3$_o_o);
  or or_or_xor_i0$6$_i1$6 (or_or_xor_i0$6$_i1$6_o, or_xor_i0$6$_i1$6$_o_o, or_or_xor_i0$9$_i1$9_o);
  or or_or_xor_i0$9$_i1$9 (or_or_xor_i0$9$_i1$9_o, or_xor_i0$9$_i1$9$_o_o, or_xor_i0$11$_i1$11$_o);
  or or_xor_i0$0$_i1$0$_o (or_xor_i0$0$_i1$0$_o_o, xor_i0$0$_i1$0$_o, or_xor_i0$1$_i1$1$_o_o);
  or or_xor_i0$1$_i1$1$_o (or_xor_i0$1$_i1$1$_o_o, xor_i0$1$_i1$1$_o, xor_i0$2$_i1$2$_o);
  or or_xor_i0$11$_i1$11$ (or_xor_i0$11$_i1$11$_o, xor_i0$11$_i1$11$_o, xor_i0$12$_i1$12$_o);
  or or_xor_i0$3$_i1$3$_o (or_xor_i0$3$_i1$3$_o_o, xor_i0$3$_i1$3$_o, or_xor_i0$4$_i1$4$_o_o);
  or or_xor_i0$4$_i1$4$_o (or_xor_i0$4$_i1$4$_o_o, xor_i0$4$_i1$4$_o, xor_i0$5$_i1$5$_o);
  or or_xor_i0$6$_i1$6$_o (or_xor_i0$6$_i1$6$_o_o, xor_i0$6$_i1$6$_o, or_xor_i0$7$_i1$7$_o_o);
  or or_xor_i0$7$_i1$7$_o (or_xor_i0$7$_i1$7$_o_o, xor_i0$7$_i1$7$_o, xor_i0$8$_i1$8$_o);
  or or_xor_i0$9$_i1$9$_o (or_xor_i0$9$_i1$9$_o_o, xor_i0$9$_i1$9$_o, xor_i0$10$_i1$10$_o);
  xor \xor_i0[0]_i1[0]  (xor_i0$0$_i1$0$_o, i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (xor_i0$10$_i1$10$_o, i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (xor_i0$11$_i1$11$_o, i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (xor_i0$12$_i1$12$_o, i0[12], i1[12]);
  xor \xor_i0[1]_i1[1]  (xor_i0$1$_i1$1$_o, i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (xor_i0$2$_i1$2$_o, i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (xor_i0$3$_i1$3$_o, i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (xor_i0$4$_i1$4$_o, i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (xor_i0$5$_i1$5$_o, i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (xor_i0$6$_i1$6$_o, i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (xor_i0$7$_i1$7$_o, i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (xor_i0$8$_i1$8$_o, i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (xor_i0$9$_i1$9$_o, i0[9], i1[9]);

endmodule 

module eq_w3
  (
  i0,
  i1,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  output o;

  wire or_xor_i0$0$_i1$0$_o_o;
  wire or_xor_i0$1$_i1$1$_o_o;
  wire xor_i0$0$_i1$0$_o;
  wire xor_i0$1$_i1$1$_o;
  wire xor_i0$2$_i1$2$_o;

  not none_diff (o, or_xor_i0$0$_i1$0$_o_o);
  or or_xor_i0$0$_i1$0$_o (or_xor_i0$0$_i1$0$_o_o, xor_i0$0$_i1$0$_o, or_xor_i0$1$_i1$1$_o_o);
  or or_xor_i0$1$_i1$1$_o (or_xor_i0$1$_i1$1$_o_o, xor_i0$1$_i1$1$_o, xor_i0$2$_i1$2$_o);
  xor \xor_i0[0]_i1[0]  (xor_i0$0$_i1$0$_o, i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (xor_i0$1$_i1$1$_o, i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (xor_i0$2$_i1$2$_o, i0[2], i1[2]);

endmodule 

module lt_u9_u9
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [8:0] i0;
  input [8:0] i1;
  output o;

  wire [8:0] diff;
  wire diff_6_8;
  wire less_6_8;
  wire \less_6_8_inst/diff_0 ;
  wire \less_6_8_inst/diff_1 ;
  wire \less_6_8_inst/diff_2 ;
  wire \less_6_8_inst/o_0 ;
  wire \less_6_8_inst/o_1 ;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;

  or any_diff_6_8 (diff_6_8, diff[6], diff[7], diff[8]);
  xor diff_0 (diff[0], i0[0], i1[0]);
  xor diff_1 (diff[1], i0[1], i1[1]);
  xor diff_2 (diff[2], i0[2], i1[2]);
  xor diff_3 (diff[3], i0[3], i1[3]);
  xor diff_4 (diff[4], i0[4], i1[4]);
  xor diff_5 (diff[5], i0[5], i1[5]);
  xor diff_6 (diff[6], i0[6], i1[6]);
  xor diff_7 (diff[7], i0[7], i1[7]);
  xor diff_8 (diff[8], i0[8], i1[8]);
  AL_MUX \less_6_8_inst/mux_0  (
    .i0(1'b0),
    .i1(i1[6]),
    .sel(\less_6_8_inst/diff_0 ),
    .o(\less_6_8_inst/o_0 ));
  AL_MUX \less_6_8_inst/mux_1  (
    .i0(\less_6_8_inst/o_0 ),
    .i1(i1[7]),
    .sel(\less_6_8_inst/diff_1 ),
    .o(\less_6_8_inst/o_1 ));
  AL_MUX \less_6_8_inst/mux_2  (
    .i0(\less_6_8_inst/o_1 ),
    .i1(i1[8]),
    .sel(\less_6_8_inst/diff_2 ),
    .o(less_6_8));
  xor \less_6_8_inst/xor_0  (\less_6_8_inst/diff_0 , i0[6], i1[6]);
  xor \less_6_8_inst/xor_1  (\less_6_8_inst/diff_1 , i0[7], i1[7]);
  xor \less_6_8_inst/xor_2  (\less_6_8_inst/diff_2 , i0[8], i1[8]);
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
    .i1(less_6_8),
    .sel(diff_6_8),
    .o(o));

endmodule 

module binary_mux_s2_w1
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input i0;
  input i1;
  input i2;
  input i3;
  input [1:0] sel;
  output o;

  wire  B0_0;
  wire  B0_1;

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
  AL_MUX al_mux_b0_1_0 (
    .i0(B0_0),
    .i1(B0_1),
    .sel(sel[1]),
    .o(o));

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

module ne_w32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output o;

  wire [31:0] diff;

  or any_diff (o, diff[0], diff[1], diff[2], diff[3], diff[4], diff[5], diff[6], diff[7], diff[8], diff[9], diff[10], diff[11], diff[12], diff[13], diff[14], diff[15], diff[16], diff[17], diff[18], diff[19], diff[20], diff[21], diff[22], diff[23], diff[24], diff[25], diff[26], diff[27], diff[28], diff[29], diff[30], diff[31]);
  xor diff_0 (diff[0], i0[0], i1[0]);
  xor diff_1 (diff[1], i0[1], i1[1]);
  xor diff_10 (diff[10], i0[10], i1[10]);
  xor diff_11 (diff[11], i0[11], i1[11]);
  xor diff_12 (diff[12], i0[12], i1[12]);
  xor diff_13 (diff[13], i0[13], i1[13]);
  xor diff_14 (diff[14], i0[14], i1[14]);
  xor diff_15 (diff[15], i0[15], i1[15]);
  xor diff_16 (diff[16], i0[16], i1[16]);
  xor diff_17 (diff[17], i0[17], i1[17]);
  xor diff_18 (diff[18], i0[18], i1[18]);
  xor diff_19 (diff[19], i0[19], i1[19]);
  xor diff_2 (diff[2], i0[2], i1[2]);
  xor diff_20 (diff[20], i0[20], i1[20]);
  xor diff_21 (diff[21], i0[21], i1[21]);
  xor diff_22 (diff[22], i0[22], i1[22]);
  xor diff_23 (diff[23], i0[23], i1[23]);
  xor diff_24 (diff[24], i0[24], i1[24]);
  xor diff_25 (diff[25], i0[25], i1[25]);
  xor diff_26 (diff[26], i0[26], i1[26]);
  xor diff_27 (diff[27], i0[27], i1[27]);
  xor diff_28 (diff[28], i0[28], i1[28]);
  xor diff_29 (diff[29], i0[29], i1[29]);
  xor diff_3 (diff[3], i0[3], i1[3]);
  xor diff_30 (diff[30], i0[30], i1[30]);
  xor diff_31 (diff[31], i0[31], i1[31]);
  xor diff_4 (diff[4], i0[4], i1[4]);
  xor diff_5 (diff[5], i0[5], i1[5]);
  xor diff_6 (diff[6], i0[6], i1[6]);
  xor diff_7 (diff[7], i0[7], i1[7]);
  xor diff_8 (diff[8], i0[8], i1[8]);
  xor diff_9 (diff[9], i0[9], i1[9]);

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

module binary_mux_s3_w1
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  sel,
  o
  );

  input i0;
  input i1;
  input i2;
  input i3;
  input i4;
  input i5;
  input i6;
  input i7;
  input [2:0] sel;
  output o;

  wire  B0_0;
  wire  B0_1;
  wire  B0_2;
  wire  B0_3;
  wire  B1_0;
  wire  B1_1;

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
  AL_MUX al_mux_b0_2_0 (
    .i0(B1_0),
    .i1(B1_1),
    .sel(sel[2]),
    .o(o));

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

module add_pu3_pu3_o4
  (
  i0,
  i1,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  output [3:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;

  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[3] = net_cout2;
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

module lt_u3_u3
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [2:0] i0;
  input [2:0] i1;
  output o;

  wire a_0;
  wire a_1;
  wire a_2;
  wire b_0;
  wire b_1;
  wire b_2;
  wire diff_0;
  wire diff_1;
  wire diff_2;
  wire net_cin;
  wire o_0;
  wire o_1;
  wire o_2;

  assign net_cin = ci;
  assign a_2 = i0[2];
  assign a_1 = i0[1];
  assign a_0 = i0[0];
  assign b_2 = i1[2];
  assign b_1 = i1[1];
  assign b_0 = i1[0];
  assign o = o_2;
  AL_MUX mux_0 (
    .i0(net_cin),
    .i1(b_0),
    .sel(diff_0),
    .o(o_0));
  AL_MUX mux_1 (
    .i0(o_0),
    .i1(b_1),
    .sel(diff_1),
    .o(o_1));
  AL_MUX mux_2 (
    .i0(o_1),
    .i1(b_2),
    .sel(diff_2),
    .o(o_2));
  xor xor_0 (diff_0, a_0, b_0);
  xor xor_1 (diff_1, a_1, b_1);
  xor xor_2 (diff_2, a_2, b_2);

endmodule 

module lt_u4_u4
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [3:0] i0;
  input [3:0] i1;
  output o;

  wire [3:0] diff;
  wire o_0;
  wire o_1;
  wire o_2;

  xor diff_0 (diff[0], i0[0], i1[0]);
  xor diff_1 (diff[1], i0[1], i1[1]);
  xor diff_2 (diff[2], i0[2], i1[2]);
  xor diff_3 (diff[3], i0[3], i1[3]);
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
    .o(o));

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

module eq_w2
  (
  i0,
  i1,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  output o;

  wire or_xor_i0$0$_i1$0$_o_o;
  wire xor_i0$0$_i1$0$_o;
  wire xor_i0$1$_i1$1$_o;

  not none_diff (o, or_xor_i0$0$_i1$0$_o_o);
  or or_xor_i0$0$_i1$0$_o (or_xor_i0$0$_i1$0$_o_o, xor_i0$0$_i1$0$_o, xor_i0$1$_i1$1$_o);
  xor \xor_i0[0]_i1[0]  (xor_i0$0$_i1$0$_o, i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (xor_i0$1$_i1$1$_o, i0[1], i1[1]);

endmodule 

module add_pu25_pu25_o25
  (
  i0,
  i1,
  o
  );

  input [24:0] i0;
  input [24:0] i1;
  output [24:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a12;
  wire net_a13;
  wire net_a14;
  wire net_a15;
  wire net_a16;
  wire net_a17;
  wire net_a18;
  wire net_a19;
  wire net_a2;
  wire net_a20;
  wire net_a21;
  wire net_a22;
  wire net_a23;
  wire net_a24;
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
  wire net_b13;
  wire net_b14;
  wire net_b15;
  wire net_b16;
  wire net_b17;
  wire net_b18;
  wire net_b19;
  wire net_b2;
  wire net_b20;
  wire net_b21;
  wire net_b22;
  wire net_b23;
  wire net_b24;
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
  wire net_cout13;
  wire net_cout14;
  wire net_cout15;
  wire net_cout16;
  wire net_cout17;
  wire net_cout18;
  wire net_cout19;
  wire net_cout2;
  wire net_cout20;
  wire net_cout21;
  wire net_cout22;
  wire net_cout23;
  wire net_cout24;
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
  wire net_sum13;
  wire net_sum14;
  wire net_sum15;
  wire net_sum16;
  wire net_sum17;
  wire net_sum18;
  wire net_sum19;
  wire net_sum2;
  wire net_sum20;
  wire net_sum21;
  wire net_sum22;
  wire net_sum23;
  wire net_sum24;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a24 = i0[24];
  assign net_a23 = i0[23];
  assign net_a22 = i0[22];
  assign net_a21 = i0[21];
  assign net_a20 = i0[20];
  assign net_a19 = i0[19];
  assign net_a18 = i0[18];
  assign net_a17 = i0[17];
  assign net_a16 = i0[16];
  assign net_a15 = i0[15];
  assign net_a14 = i0[14];
  assign net_a13 = i0[13];
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
  assign net_b24 = i1[24];
  assign net_b23 = i1[23];
  assign net_b22 = i1[22];
  assign net_b21 = i1[21];
  assign net_b20 = i1[20];
  assign net_b19 = i1[19];
  assign net_b18 = i1[18];
  assign net_b17 = i1[17];
  assign net_b16 = i1[16];
  assign net_b15 = i1[15];
  assign net_b14 = i1[14];
  assign net_b13 = i1[13];
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
  assign o[24] = net_sum24;
  assign o[23] = net_sum23;
  assign o[22] = net_sum22;
  assign o[21] = net_sum21;
  assign o[20] = net_sum20;
  assign o[19] = net_sum19;
  assign o[18] = net_sum18;
  assign o[17] = net_sum17;
  assign o[16] = net_sum16;
  assign o[15] = net_sum15;
  assign o[14] = net_sum14;
  assign o[13] = net_sum13;
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
  AL_FADD comp_13 (
    .a(net_a13),
    .b(net_b13),
    .c(net_cout12),
    .cout(net_cout13),
    .sum(net_sum13));
  AL_FADD comp_14 (
    .a(net_a14),
    .b(net_b14),
    .c(net_cout13),
    .cout(net_cout14),
    .sum(net_sum14));
  AL_FADD comp_15 (
    .a(net_a15),
    .b(net_b15),
    .c(net_cout14),
    .cout(net_cout15),
    .sum(net_sum15));
  AL_FADD comp_16 (
    .a(net_a16),
    .b(net_b16),
    .c(net_cout15),
    .cout(net_cout16),
    .sum(net_sum16));
  AL_FADD comp_17 (
    .a(net_a17),
    .b(net_b17),
    .c(net_cout16),
    .cout(net_cout17),
    .sum(net_sum17));
  AL_FADD comp_18 (
    .a(net_a18),
    .b(net_b18),
    .c(net_cout17),
    .cout(net_cout18),
    .sum(net_sum18));
  AL_FADD comp_19 (
    .a(net_a19),
    .b(net_b19),
    .c(net_cout18),
    .cout(net_cout19),
    .sum(net_sum19));
  AL_FADD comp_2 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD comp_20 (
    .a(net_a20),
    .b(net_b20),
    .c(net_cout19),
    .cout(net_cout20),
    .sum(net_sum20));
  AL_FADD comp_21 (
    .a(net_a21),
    .b(net_b21),
    .c(net_cout20),
    .cout(net_cout21),
    .sum(net_sum21));
  AL_FADD comp_22 (
    .a(net_a22),
    .b(net_b22),
    .c(net_cout21),
    .cout(net_cout22),
    .sum(net_sum22));
  AL_FADD comp_23 (
    .a(net_a23),
    .b(net_b23),
    .c(net_cout22),
    .cout(net_cout23),
    .sum(net_sum23));
  AL_FADD comp_24 (
    .a(net_a24),
    .b(net_b24),
    .c(net_cout23),
    .cout(net_cout24),
    .sum(net_sum24));
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

module add_pu18_pu18_o18
  (
  i0,
  i1,
  o
  );

  input [17:0] i0;
  input [17:0] i1;
  output [17:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a12;
  wire net_a13;
  wire net_a14;
  wire net_a15;
  wire net_a16;
  wire net_a17;
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
  wire net_b13;
  wire net_b14;
  wire net_b15;
  wire net_b16;
  wire net_b17;
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
  wire net_cout13;
  wire net_cout14;
  wire net_cout15;
  wire net_cout16;
  wire net_cout17;
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
  wire net_sum13;
  wire net_sum14;
  wire net_sum15;
  wire net_sum16;
  wire net_sum17;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a17 = i0[17];
  assign net_a16 = i0[16];
  assign net_a15 = i0[15];
  assign net_a14 = i0[14];
  assign net_a13 = i0[13];
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
  assign net_b17 = i1[17];
  assign net_b16 = i1[16];
  assign net_b15 = i1[15];
  assign net_b14 = i1[14];
  assign net_b13 = i1[13];
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
  assign o[17] = net_sum17;
  assign o[16] = net_sum16;
  assign o[15] = net_sum15;
  assign o[14] = net_sum14;
  assign o[13] = net_sum13;
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
  AL_FADD comp_13 (
    .a(net_a13),
    .b(net_b13),
    .c(net_cout12),
    .cout(net_cout13),
    .sum(net_sum13));
  AL_FADD comp_14 (
    .a(net_a14),
    .b(net_b14),
    .c(net_cout13),
    .cout(net_cout14),
    .sum(net_sum14));
  AL_FADD comp_15 (
    .a(net_a15),
    .b(net_b15),
    .c(net_cout14),
    .cout(net_cout15),
    .sum(net_sum15));
  AL_FADD comp_16 (
    .a(net_a16),
    .b(net_b16),
    .c(net_cout15),
    .cout(net_cout16),
    .sum(net_sum16));
  AL_FADD comp_17 (
    .a(net_a17),
    .b(net_b17),
    .c(net_cout16),
    .cout(net_cout17),
    .sum(net_sum17));
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

module eq_w25
  (
  i0,
  i1,
  o
  );

  input [24:0] i0;
  input [24:0] i1;
  output o;

  wire or_or_or_or_xor_i0$0_o;
  wire or_or_or_xor_i0$0$_i_o;
  wire or_or_or_xor_i0$12$__o;
  wire or_or_xor_i0$0$_i1$0_o;
  wire or_or_xor_i0$12$_i1$_o;
  wire or_or_xor_i0$18$_i1$_o;
  wire or_or_xor_i0$21$_i1$_o;
  wire or_or_xor_i0$6$_i1$6_o;
  wire or_xor_i0$0$_i1$0$_o_o;
  wire or_xor_i0$1$_i1$1$_o_o;
  wire or_xor_i0$10$_i1$10$_o;
  wire or_xor_i0$12$_i1$12$_o;
  wire or_xor_i0$13$_i1$13$_o;
  wire or_xor_i0$15$_i1$15$_o;
  wire or_xor_i0$16$_i1$16$_o;
  wire or_xor_i0$18$_i1$18$_o;
  wire or_xor_i0$19$_i1$19$_o;
  wire or_xor_i0$21$_i1$21$_o;
  wire or_xor_i0$23$_i1$23$_o;
  wire or_xor_i0$3$_i1$3$_o_o;
  wire or_xor_i0$4$_i1$4$_o_o;
  wire or_xor_i0$6$_i1$6$_o_o;
  wire or_xor_i0$7$_i1$7$_o_o;
  wire or_xor_i0$9$_i1$9$_o_o;
  wire xor_i0$0$_i1$0$_o;
  wire xor_i0$1$_i1$1$_o;
  wire xor_i0$10$_i1$10$_o;
  wire xor_i0$11$_i1$11$_o;
  wire xor_i0$12$_i1$12$_o;
  wire xor_i0$13$_i1$13$_o;
  wire xor_i0$14$_i1$14$_o;
  wire xor_i0$15$_i1$15$_o;
  wire xor_i0$16$_i1$16$_o;
  wire xor_i0$17$_i1$17$_o;
  wire xor_i0$18$_i1$18$_o;
  wire xor_i0$19$_i1$19$_o;
  wire xor_i0$2$_i1$2$_o;
  wire xor_i0$20$_i1$20$_o;
  wire xor_i0$21$_i1$21$_o;
  wire xor_i0$22$_i1$22$_o;
  wire xor_i0$23$_i1$23$_o;
  wire xor_i0$24$_i1$24$_o;
  wire xor_i0$3$_i1$3$_o;
  wire xor_i0$4$_i1$4$_o;
  wire xor_i0$5$_i1$5$_o;
  wire xor_i0$6$_i1$6$_o;
  wire xor_i0$7$_i1$7$_o;
  wire xor_i0$8$_i1$8$_o;
  wire xor_i0$9$_i1$9$_o;

  not none_diff (o, or_or_or_or_xor_i0$0_o);
  or or_or_or_or_xor_i0$0 (or_or_or_or_xor_i0$0_o, or_or_or_xor_i0$0$_i_o, or_or_or_xor_i0$12$__o);
  or or_or_or_xor_i0$0$_i (or_or_or_xor_i0$0$_i_o, or_or_xor_i0$0$_i1$0_o, or_or_xor_i0$6$_i1$6_o);
  or or_or_or_xor_i0$12$_ (or_or_or_xor_i0$12$__o, or_or_xor_i0$12$_i1$_o, or_or_xor_i0$18$_i1$_o);
  or or_or_xor_i0$0$_i1$0 (or_or_xor_i0$0$_i1$0_o, or_xor_i0$0$_i1$0$_o_o, or_xor_i0$3$_i1$3$_o_o);
  or or_or_xor_i0$12$_i1$ (or_or_xor_i0$12$_i1$_o, or_xor_i0$12$_i1$12$_o, or_xor_i0$15$_i1$15$_o);
  or or_or_xor_i0$18$_i1$ (or_or_xor_i0$18$_i1$_o, or_xor_i0$18$_i1$18$_o, or_or_xor_i0$21$_i1$_o);
  or or_or_xor_i0$21$_i1$ (or_or_xor_i0$21$_i1$_o, or_xor_i0$21$_i1$21$_o, or_xor_i0$23$_i1$23$_o);
  or or_or_xor_i0$6$_i1$6 (or_or_xor_i0$6$_i1$6_o, or_xor_i0$6$_i1$6$_o_o, or_xor_i0$9$_i1$9$_o_o);
  or or_xor_i0$0$_i1$0$_o (or_xor_i0$0$_i1$0$_o_o, xor_i0$0$_i1$0$_o, or_xor_i0$1$_i1$1$_o_o);
  or or_xor_i0$1$_i1$1$_o (or_xor_i0$1$_i1$1$_o_o, xor_i0$1$_i1$1$_o, xor_i0$2$_i1$2$_o);
  or or_xor_i0$10$_i1$10$ (or_xor_i0$10$_i1$10$_o, xor_i0$10$_i1$10$_o, xor_i0$11$_i1$11$_o);
  or or_xor_i0$12$_i1$12$ (or_xor_i0$12$_i1$12$_o, xor_i0$12$_i1$12$_o, or_xor_i0$13$_i1$13$_o);
  or or_xor_i0$13$_i1$13$ (or_xor_i0$13$_i1$13$_o, xor_i0$13$_i1$13$_o, xor_i0$14$_i1$14$_o);
  or or_xor_i0$15$_i1$15$ (or_xor_i0$15$_i1$15$_o, xor_i0$15$_i1$15$_o, or_xor_i0$16$_i1$16$_o);
  or or_xor_i0$16$_i1$16$ (or_xor_i0$16$_i1$16$_o, xor_i0$16$_i1$16$_o, xor_i0$17$_i1$17$_o);
  or or_xor_i0$18$_i1$18$ (or_xor_i0$18$_i1$18$_o, xor_i0$18$_i1$18$_o, or_xor_i0$19$_i1$19$_o);
  or or_xor_i0$19$_i1$19$ (or_xor_i0$19$_i1$19$_o, xor_i0$19$_i1$19$_o, xor_i0$20$_i1$20$_o);
  or or_xor_i0$21$_i1$21$ (or_xor_i0$21$_i1$21$_o, xor_i0$21$_i1$21$_o, xor_i0$22$_i1$22$_o);
  or or_xor_i0$23$_i1$23$ (or_xor_i0$23$_i1$23$_o, xor_i0$23$_i1$23$_o, xor_i0$24$_i1$24$_o);
  or or_xor_i0$3$_i1$3$_o (or_xor_i0$3$_i1$3$_o_o, xor_i0$3$_i1$3$_o, or_xor_i0$4$_i1$4$_o_o);
  or or_xor_i0$4$_i1$4$_o (or_xor_i0$4$_i1$4$_o_o, xor_i0$4$_i1$4$_o, xor_i0$5$_i1$5$_o);
  or or_xor_i0$6$_i1$6$_o (or_xor_i0$6$_i1$6$_o_o, xor_i0$6$_i1$6$_o, or_xor_i0$7$_i1$7$_o_o);
  or or_xor_i0$7$_i1$7$_o (or_xor_i0$7$_i1$7$_o_o, xor_i0$7$_i1$7$_o, xor_i0$8$_i1$8$_o);
  or or_xor_i0$9$_i1$9$_o (or_xor_i0$9$_i1$9$_o_o, xor_i0$9$_i1$9$_o, or_xor_i0$10$_i1$10$_o);
  xor \xor_i0[0]_i1[0]  (xor_i0$0$_i1$0$_o, i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (xor_i0$10$_i1$10$_o, i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (xor_i0$11$_i1$11$_o, i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (xor_i0$12$_i1$12$_o, i0[12], i1[12]);
  xor \xor_i0[13]_i1[13]  (xor_i0$13$_i1$13$_o, i0[13], i1[13]);
  xor \xor_i0[14]_i1[14]  (xor_i0$14$_i1$14$_o, i0[14], i1[14]);
  xor \xor_i0[15]_i1[15]  (xor_i0$15$_i1$15$_o, i0[15], i1[15]);
  xor \xor_i0[16]_i1[16]  (xor_i0$16$_i1$16$_o, i0[16], i1[16]);
  xor \xor_i0[17]_i1[17]  (xor_i0$17$_i1$17$_o, i0[17], i1[17]);
  xor \xor_i0[18]_i1[18]  (xor_i0$18$_i1$18$_o, i0[18], i1[18]);
  xor \xor_i0[19]_i1[19]  (xor_i0$19$_i1$19$_o, i0[19], i1[19]);
  xor \xor_i0[1]_i1[1]  (xor_i0$1$_i1$1$_o, i0[1], i1[1]);
  xor \xor_i0[20]_i1[20]  (xor_i0$20$_i1$20$_o, i0[20], i1[20]);
  xor \xor_i0[21]_i1[21]  (xor_i0$21$_i1$21$_o, i0[21], i1[21]);
  xor \xor_i0[22]_i1[22]  (xor_i0$22$_i1$22$_o, i0[22], i1[22]);
  xor \xor_i0[23]_i1[23]  (xor_i0$23$_i1$23$_o, i0[23], i1[23]);
  xor \xor_i0[24]_i1[24]  (xor_i0$24$_i1$24$_o, i0[24], i1[24]);
  xor \xor_i0[2]_i1[2]  (xor_i0$2$_i1$2$_o, i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (xor_i0$3$_i1$3$_o, i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (xor_i0$4$_i1$4$_o, i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (xor_i0$5$_i1$5$_o, i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (xor_i0$6$_i1$6$_o, i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (xor_i0$7$_i1$7$_o, i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (xor_i0$8$_i1$8$_o, i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (xor_i0$9$_i1$9$_o, i0[9], i1[9]);

endmodule 

module eq_w18
  (
  i0,
  i1,
  o
  );

  input [17:0] i0;
  input [17:0] i1;
  output o;

  wire or_or_or_or_xor_i0$0_o;
  wire or_or_or_xor_i0$0$_i_o;
  wire or_or_or_xor_i0$9$_i_o;
  wire or_or_xor_i0$0$_i1$0_o;
  wire or_or_xor_i0$13$_i1$_o;
  wire or_or_xor_i0$4$_i1$4_o;
  wire or_or_xor_i0$9$_i1$9_o;
  wire or_xor_i0$0$_i1$0$_o_o;
  wire or_xor_i0$11$_i1$11$_o;
  wire or_xor_i0$13$_i1$13$_o;
  wire or_xor_i0$15$_i1$15$_o;
  wire or_xor_i0$16$_i1$16$_o;
  wire or_xor_i0$2$_i1$2$_o_o;
  wire or_xor_i0$4$_i1$4$_o_o;
  wire or_xor_i0$6$_i1$6$_o_o;
  wire or_xor_i0$7$_i1$7$_o_o;
  wire or_xor_i0$9$_i1$9$_o_o;
  wire xor_i0$0$_i1$0$_o;
  wire xor_i0$1$_i1$1$_o;
  wire xor_i0$10$_i1$10$_o;
  wire xor_i0$11$_i1$11$_o;
  wire xor_i0$12$_i1$12$_o;
  wire xor_i0$13$_i1$13$_o;
  wire xor_i0$14$_i1$14$_o;
  wire xor_i0$15$_i1$15$_o;
  wire xor_i0$16$_i1$16$_o;
  wire xor_i0$17$_i1$17$_o;
  wire xor_i0$2$_i1$2$_o;
  wire xor_i0$3$_i1$3$_o;
  wire xor_i0$4$_i1$4$_o;
  wire xor_i0$5$_i1$5$_o;
  wire xor_i0$6$_i1$6$_o;
  wire xor_i0$7$_i1$7$_o;
  wire xor_i0$8$_i1$8$_o;
  wire xor_i0$9$_i1$9$_o;

  not none_diff (o, or_or_or_or_xor_i0$0_o);
  or or_or_or_or_xor_i0$0 (or_or_or_or_xor_i0$0_o, or_or_or_xor_i0$0$_i_o, or_or_or_xor_i0$9$_i_o);
  or or_or_or_xor_i0$0$_i (or_or_or_xor_i0$0$_i_o, or_or_xor_i0$0$_i1$0_o, or_or_xor_i0$4$_i1$4_o);
  or or_or_or_xor_i0$9$_i (or_or_or_xor_i0$9$_i_o, or_or_xor_i0$9$_i1$9_o, or_or_xor_i0$13$_i1$_o);
  or or_or_xor_i0$0$_i1$0 (or_or_xor_i0$0$_i1$0_o, or_xor_i0$0$_i1$0$_o_o, or_xor_i0$2$_i1$2$_o_o);
  or or_or_xor_i0$13$_i1$ (or_or_xor_i0$13$_i1$_o, or_xor_i0$13$_i1$13$_o, or_xor_i0$15$_i1$15$_o);
  or or_or_xor_i0$4$_i1$4 (or_or_xor_i0$4$_i1$4_o, or_xor_i0$4$_i1$4$_o_o, or_xor_i0$6$_i1$6$_o_o);
  or or_or_xor_i0$9$_i1$9 (or_or_xor_i0$9$_i1$9_o, or_xor_i0$9$_i1$9$_o_o, or_xor_i0$11$_i1$11$_o);
  or or_xor_i0$0$_i1$0$_o (or_xor_i0$0$_i1$0$_o_o, xor_i0$0$_i1$0$_o, xor_i0$1$_i1$1$_o);
  or or_xor_i0$11$_i1$11$ (or_xor_i0$11$_i1$11$_o, xor_i0$11$_i1$11$_o, xor_i0$12$_i1$12$_o);
  or or_xor_i0$13$_i1$13$ (or_xor_i0$13$_i1$13$_o, xor_i0$13$_i1$13$_o, xor_i0$14$_i1$14$_o);
  or or_xor_i0$15$_i1$15$ (or_xor_i0$15$_i1$15$_o, xor_i0$15$_i1$15$_o, or_xor_i0$16$_i1$16$_o);
  or or_xor_i0$16$_i1$16$ (or_xor_i0$16$_i1$16$_o, xor_i0$16$_i1$16$_o, xor_i0$17$_i1$17$_o);
  or or_xor_i0$2$_i1$2$_o (or_xor_i0$2$_i1$2$_o_o, xor_i0$2$_i1$2$_o, xor_i0$3$_i1$3$_o);
  or or_xor_i0$4$_i1$4$_o (or_xor_i0$4$_i1$4$_o_o, xor_i0$4$_i1$4$_o, xor_i0$5$_i1$5$_o);
  or or_xor_i0$6$_i1$6$_o (or_xor_i0$6$_i1$6$_o_o, xor_i0$6$_i1$6$_o, or_xor_i0$7$_i1$7$_o_o);
  or or_xor_i0$7$_i1$7$_o (or_xor_i0$7$_i1$7$_o_o, xor_i0$7$_i1$7$_o, xor_i0$8$_i1$8$_o);
  or or_xor_i0$9$_i1$9$_o (or_xor_i0$9$_i1$9$_o_o, xor_i0$9$_i1$9$_o, xor_i0$10$_i1$10$_o);
  xor \xor_i0[0]_i1[0]  (xor_i0$0$_i1$0$_o, i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (xor_i0$10$_i1$10$_o, i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (xor_i0$11$_i1$11$_o, i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (xor_i0$12$_i1$12$_o, i0[12], i1[12]);
  xor \xor_i0[13]_i1[13]  (xor_i0$13$_i1$13$_o, i0[13], i1[13]);
  xor \xor_i0[14]_i1[14]  (xor_i0$14$_i1$14$_o, i0[14], i1[14]);
  xor \xor_i0[15]_i1[15]  (xor_i0$15$_i1$15$_o, i0[15], i1[15]);
  xor \xor_i0[16]_i1[16]  (xor_i0$16$_i1$16$_o, i0[16], i1[16]);
  xor \xor_i0[17]_i1[17]  (xor_i0$17$_i1$17$_o, i0[17], i1[17]);
  xor \xor_i0[1]_i1[1]  (xor_i0$1$_i1$1$_o, i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (xor_i0$2$_i1$2$_o, i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (xor_i0$3$_i1$3$_o, i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (xor_i0$4$_i1$4$_o, i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (xor_i0$5$_i1$5$_o, i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (xor_i0$6$_i1$6$_o, i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (xor_i0$7$_i1$7$_o, i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (xor_i0$8$_i1$8$_o, i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (xor_i0$9$_i1$9$_o, i0[9], i1[9]);

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

