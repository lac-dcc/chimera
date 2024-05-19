// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Fri Aug  9 19:34:33 2019

`timescale 1ns / 1ps
module sdram_control  // ../sdram_control.v(1)
  (
  CLKIN,
  rst_n,
  sm_bit,
  sm_seg,
  test_error_led,
  test_io
  );

  input CLKIN;  // ../sdram_control.v(2)
  input rst_n;  // ../sdram_control.v(3)
  output [3:0] sm_bit;  // ../sdram_control.v(7)
  output [7:0] sm_seg;  // ../sdram_control.v(6)
  output test_error_led;  // ../sdram_control.v(5)
  output test_io;  // ../sdram_control.v(4)

  parameter mode_register = 11'b00000110111;
  parameter reg1_register = 13'b0000100101111;
  parameter reg2_register = 12'b110000110101;
  wire [1:0] SD_BA;  // ../sdram_control.v(35)
  wire [31:0] SD_DQ;  // ../sdram_control.v(40)
  wire [10:0] SD_SA;  // ../sdram_control.v(34)
  wire [8:0] burst_cnt;  // ../sdram_control.v(12)
  wire [8:0] burst_cnt1;  // ../sdram_control.v(13)
  wire [7:0] datacnt;  // ../sdram_control.v(23)
  wire [15:0] error_cnt;  // ../sdram_control.v(25)
  wire [7:0] fifo_q;  // ../sdram_control.v(22)
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
  wire [20:0] rd_addr;  // ../sdram_control.v(15)
  wire [1:0] rd_state;  // ../sdram_control.v(16)
  wire [1:0] reset_step;  // ../sdram_control.v(11)
  wire [20:0] sd_addr;  // ../sdram_control.v(21)
  wire [2:0] sd_cmd;  // ../sdram_control.v(19)
  wire [31:0] sd_dq_int;  // ../sdram_control.v(31)
  wire [2:0] sd_state;  // ../sdram_control.v(10)
  wire [20:0] wr_addr;  // ../sdram_control.v(14)
  wire [1:0] wr_state;  // ../sdram_control.v(17)
  wire SD_CAS_N;  // ../sdram_control.v(38)
  wire SD_CLK;  // ../sdram_control.v(41)
  wire SD_CS_N;  // ../sdram_control.v(36)
  wire SD_RAS_N;  // ../sdram_control.v(37)
  wire SD_WE_N;  // ../sdram_control.v(39)
  wire clk_200m;  // ../sdram_control.v(29)
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
  wire \rd_state[0]_neg ;
  wire \rd_state[1]_neg ;
  wire sd_clk_int;  // ../sdram_control.v(30)
  wire sd_cmd_ack;  // ../sdram_control.v(20)
  wire sel8_b0_sel_is_3_o;
  wire test_error_tmp;  // ../sdram_control.v(24)
  wire u23_sel_is_3_o;
  wire u26_sel_is_2_o;
  wire \u_sys_pll/clk0_buf ;  // al_ip/pll1.v(31)
  wire \wr_state[0]_neg ;
  wire \wr_state[1]_neg ;

  assign sm_seg[7] = 1'b1;
  EG_LOGIC_ODDR #(
    .ASYNCRST("ENABLE"))
    ODDR_0 (
    .clk(sd_clk_int),
    .d0(1'b0),
    .d1(1'b1),
    .rst(1'b0),
    .q(SD_CLK));  // ../sdram_control.v(91)
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
  add_pu16_pu16_o16 add0 (
    .i0(error_cnt),
    .i1(16'b0000000000000001),
    .o(n1));  // ../sdram_control.v(118)
  add_pu2_pu2_o2 add1 (
    .i0(reset_step),
    .i1(2'b01),
    .o(n8));  // ../sdram_control.v(160)
  add_pu8_pu8_o8 add10 (
    .i0(datacnt),
    .i1(8'b00000001),
    .o(n65));  // ../sdram_control.v(269)
  add_pu3_pu3_o3 add2 (
    .i0(sd_state),
    .i1(3'b001),
    .o(n14));  // ../sdram_control.v(184)
  add_pu2_pu2_o2 add3 (
    .i0(wr_state),
    .i1(2'b01),
    .o(n25));  // ../sdram_control.v(201)
  add_pu9_pu9_o9 add4 (
    .i0(burst_cnt),
    .i1(9'b000000001),
    .o(n29));  // ../sdram_control.v(211)
  add_pu8_pu8_o8 add5 (
    .i0(fifo_q),
    .i1(8'b00000001),
    .o(n34));  // ../sdram_control.v(216)
  add_pu13_pu13_o13 add6 (
    .i0(wr_addr[20:8]),
    .i1(13'b0000000000001),
    .o(n36));  // ../sdram_control.v(225)
  add_pu2_pu2_o2 add7 (
    .i0(rd_state),
    .i1(2'b01),
    .o(n49));  // ../sdram_control.v(243)
  add_pu9_pu9_o9 add8 (
    .i0(burst_cnt1),
    .i1(9'b000000001),
    .o(n52));  // ../sdram_control.v(249)
  add_pu13_pu13_o13 add9 (
    .i0(rd_addr[20:8]),
    .i1(13'b0000000000001),
    .o(n54));  // ../sdram_control.v(259)
  eq_w16 eq0 (
    .i0(error_cnt),
    .i1(16'b1111111111111111),
    .o(n3));  // ../sdram_control.v(120)
  eq_w9 eq1 (
    .i0(burst_cnt),
    .i1(9'b011111111),
    .o(n28));  // ../sdram_control.v(206)
  eq_w9 eq2 (
    .i0(burst_cnt),
    .i1(9'b011111101),
    .o(n32));  // ../sdram_control.v(213)
  eq_w13 eq3 (
    .i0(wr_addr[20:8]),
    .i1(13'b1111111111111),
    .o(n35));  // ../sdram_control.v(220)
  eq_w13 eq4 (
    .i0(rd_addr[20:8]),
    .i1(13'b1111111111111),
    .o(n53));  // ../sdram_control.v(254)
  eq_w9 eq5 (
    .i0(burst_cnt1),
    .i1(9'b011111111),
    .o(n61));  // ../sdram_control.v(262)
  eq_w3 eq6 (
    .i0(sd_state),
    .i1(3'b000),
    .o(n80));  // ../sdram_control.v(146)
  eq_w3 eq7 (
    .i0(sd_state),
    .i1(3'b001),
    .o(n81));  // ../sdram_control.v(192)
  eq_w3 eq8 (
    .i0(sd_state),
    .i1(3'b010),
    .o(n82));  // ../sdram_control.v(234)
  lt_u9_u9 lt0 (
    .ci(1'b0),
    .i0(burst_cnt1),
    .i1(9'b100000100),
    .o(n51));  // ../sdram_control.v(248)
  lt_u9_u9 lt1 (
    .ci(1'b0),
    .i0(9'b000000110),
    .i1(burst_cnt1),
    .o(n64));  // ../sdram_control.v(268)
  lt_u9_u9 lt2 (
    .ci(1'b0),
    .i0(burst_cnt1),
    .i1(9'b011111010),
    .o(n68));  // ../sdram_control.v(271)
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
    .o(n24[1]));  // ../sdram_control.v(190)
  binary_mux_s2_w1 mux11_b10 (
    .i0(n7[10]),
    .i1(n10[10]),
    .i2(n7[10]),
    .i3(sd_addr[10]),
    .sel(reset_step),
    .o(n24[10]));  // ../sdram_control.v(190)
  binary_mux_s2_w1 mux11_b11 (
    .i0(n7[11]),
    .i1(n10[11]),
    .i2(n7[11]),
    .i3(sd_addr[11]),
    .sel(reset_step),
    .o(n24[11]));  // ../sdram_control.v(190)
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
    .o(n24[3]));  // ../sdram_control.v(190)
  binary_mux_s2_w1 mux11_b4 (
    .i0(n10[4]),
    .i1(n10[4]),
    .i2(n13[4]),
    .i3(sd_addr[4]),
    .sel(reset_step),
    .o(n24[4]));  // ../sdram_control.v(190)
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
    .o(n24[8]));  // ../sdram_control.v(190)
  AL_MUX mux11_b9 (
    .i0(sd_addr[9]),
    .i1(1'b0),
    .sel(mux11_b0_sel_is_2_o),
    .o(n24[9]));
  binary_mux_s1_w1 mux12_b0 (
    .i0(sd_cmd[0]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n27[0]));  // ../sdram_control.v(203)
  binary_mux_s1_w1 mux12_b1 (
    .i0(sd_cmd[1]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n27[1]));  // ../sdram_control.v(203)
  binary_mux_s1_w1 mux12_b2 (
    .i0(sd_cmd[2]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n27[2]));  // ../sdram_control.v(203)
  binary_mux_s1_w1 mux13_b0 (
    .i0(n29[0]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[0]));  // ../sdram_control.v(212)
  binary_mux_s1_w1 mux13_b1 (
    .i0(n29[1]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[1]));  // ../sdram_control.v(212)
  binary_mux_s1_w1 mux13_b2 (
    .i0(n29[2]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[2]));  // ../sdram_control.v(212)
  binary_mux_s1_w1 mux13_b3 (
    .i0(n29[3]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[3]));  // ../sdram_control.v(212)
  binary_mux_s1_w1 mux13_b4 (
    .i0(n29[4]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[4]));  // ../sdram_control.v(212)
  binary_mux_s1_w1 mux13_b5 (
    .i0(n29[5]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[5]));  // ../sdram_control.v(212)
  binary_mux_s1_w1 mux13_b6 (
    .i0(n29[6]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[6]));  // ../sdram_control.v(212)
  binary_mux_s1_w1 mux13_b7 (
    .i0(n29[7]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[7]));  // ../sdram_control.v(212)
  binary_mux_s1_w1 mux13_b8 (
    .i0(n29[8]),
    .i1(1'b0),
    .sel(n28),
    .o(n30[8]));  // ../sdram_control.v(212)
  binary_mux_s1_w1 mux14_b0 (
    .i0(wr_state[0]),
    .i1(1'b1),
    .sel(n28),
    .o(n31[0]));  // ../sdram_control.v(212)
  binary_mux_s1_w1 mux14_b1 (
    .i0(wr_state[1]),
    .i1(1'b1),
    .sel(n28),
    .o(n31[1]));  // ../sdram_control.v(212)
  binary_mux_s1_w1 mux15_b0 (
    .i0(sd_cmd[0]),
    .i1(1'b0),
    .sel(n32),
    .o(n33[0]));  // ../sdram_control.v(215)
  binary_mux_s1_w1 mux15_b1 (
    .i0(sd_cmd[1]),
    .i1(1'b0),
    .sel(n32),
    .o(n33[1]));  // ../sdram_control.v(215)
  binary_mux_s1_w1 mux15_b2 (
    .i0(sd_cmd[2]),
    .i1(1'b1),
    .sel(n32),
    .o(n33[2]));  // ../sdram_control.v(215)
  binary_mux_s1_w1 mux16_b10 (
    .i0(n36[2]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[10]));  // ../sdram_control.v(226)
  binary_mux_s1_w1 mux16_b11 (
    .i0(n36[3]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[11]));  // ../sdram_control.v(226)
  binary_mux_s1_w1 mux16_b12 (
    .i0(n36[4]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[12]));  // ../sdram_control.v(226)
  binary_mux_s1_w1 mux16_b13 (
    .i0(n36[5]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[13]));  // ../sdram_control.v(226)
  binary_mux_s1_w1 mux16_b14 (
    .i0(n36[6]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[14]));  // ../sdram_control.v(226)
  binary_mux_s1_w1 mux16_b15 (
    .i0(n36[7]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[15]));  // ../sdram_control.v(226)
  binary_mux_s1_w1 mux16_b16 (
    .i0(n36[8]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[16]));  // ../sdram_control.v(226)
  binary_mux_s1_w1 mux16_b17 (
    .i0(n36[9]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[17]));  // ../sdram_control.v(226)
  binary_mux_s1_w1 mux16_b18 (
    .i0(n36[10]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[18]));  // ../sdram_control.v(226)
  binary_mux_s1_w1 mux16_b19 (
    .i0(n36[11]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[19]));  // ../sdram_control.v(226)
  binary_mux_s1_w1 mux16_b20 (
    .i0(n36[12]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[20]));  // ../sdram_control.v(226)
  binary_mux_s1_w1 mux16_b8 (
    .i0(n36[0]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[8]));  // ../sdram_control.v(226)
  binary_mux_s1_w1 mux16_b9 (
    .i0(n36[1]),
    .i1(1'b0),
    .sel(n35),
    .o(n37[9]));  // ../sdram_control.v(226)
  and mux18_b0_sel_is_3 (mux18_b0_sel_is_3_o, sd_cmd_ack, n35);
  binary_mux_s1_w1 mux1_b0 (
    .i0(wr_state[0]),
    .i1(n25[0]),
    .sel(sd_cmd_ack),
    .o(n26[0]));  // ../sdram_control.v(228)
  binary_mux_s1_w1 mux1_b1 (
    .i0(wr_state[1]),
    .i1(n25[1]),
    .sel(sd_cmd_ack),
    .o(n26[1]));  // ../sdram_control.v(228)
  binary_mux_s1_w1 mux1_b2 (
    .i0(wr_state[0]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n41[0]));  // ../sdram_control.v(228)
  binary_mux_s1_w1 mux1_b3 (
    .i0(wr_state[1]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n41[1]));  // ../sdram_control.v(228)
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
    .o(n44[0]));  // ../sdram_control.v(231)
  binary_mux_s2_w1 mux22_b1 (
    .i0(1'b0),
    .i1(n26[1]),
    .i2(n31[1]),
    .i3(n41[1]),
    .sel(wr_state),
    .o(n44[1]));  // ../sdram_control.v(231)
  binary_mux_s2_w1 mux23_b0 (
    .i0(fifo_q[0]),
    .i1(fifo_q[0]),
    .i2(n34[0]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[0]));  // ../sdram_control.v(231)
  binary_mux_s2_w1 mux23_b1 (
    .i0(fifo_q[1]),
    .i1(fifo_q[1]),
    .i2(n34[1]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[1]));  // ../sdram_control.v(231)
  binary_mux_s2_w1 mux23_b2 (
    .i0(fifo_q[2]),
    .i1(fifo_q[2]),
    .i2(n34[2]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[2]));  // ../sdram_control.v(231)
  binary_mux_s2_w1 mux23_b3 (
    .i0(fifo_q[3]),
    .i1(fifo_q[3]),
    .i2(n34[3]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[3]));  // ../sdram_control.v(231)
  binary_mux_s2_w1 mux23_b4 (
    .i0(fifo_q[4]),
    .i1(fifo_q[4]),
    .i2(n34[4]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[4]));  // ../sdram_control.v(231)
  binary_mux_s2_w1 mux23_b5 (
    .i0(fifo_q[5]),
    .i1(fifo_q[5]),
    .i2(n34[5]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[5]));  // ../sdram_control.v(231)
  binary_mux_s2_w1 mux23_b6 (
    .i0(fifo_q[6]),
    .i1(fifo_q[6]),
    .i2(n34[6]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[6]));  // ../sdram_control.v(231)
  binary_mux_s2_w1 mux23_b7 (
    .i0(fifo_q[7]),
    .i1(fifo_q[7]),
    .i2(n34[7]),
    .i3(1'b0),
    .sel(wr_state),
    .o(n45[7]));  // ../sdram_control.v(231)
  and mux24_b0_sel_is_2 (mux24_b0_sel_is_2_o, \wr_state[0]_neg , wr_state[1]);
  binary_mux_s2_w1 mux25_b0 (
    .i0(1'b0),
    .i1(n27[0]),
    .i2(n33[0]),
    .i3(sd_cmd[0]),
    .sel(wr_state),
    .o(n47[0]));  // ../sdram_control.v(231)
  binary_mux_s2_w1 mux25_b1 (
    .i0(1'b1),
    .i1(n27[1]),
    .i2(n33[1]),
    .i3(sd_cmd[1]),
    .sel(wr_state),
    .o(n47[1]));  // ../sdram_control.v(231)
  binary_mux_s2_w1 mux25_b2 (
    .i0(1'b0),
    .i1(n27[2]),
    .i2(n33[2]),
    .i3(sd_cmd[2]),
    .sel(wr_state),
    .o(n47[2]));  // ../sdram_control.v(231)
  AL_MUX mux26_b0 (
    .i0(sd_addr[0]),
    .i1(wr_addr[0]),
    .sel(mux26_b0_sel_is_0_o),
    .o(n48[0]));
  and mux26_b0_sel_is_0 (mux26_b0_sel_is_0_o, \wr_state[0]_neg , \wr_state[1]_neg );
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
    .o(n50[0]));  // ../sdram_control.v(245)
  binary_mux_s1_w1 mux27_b1 (
    .i0(rd_state[1]),
    .i1(n49[1]),
    .sel(sd_cmd_ack),
    .o(n50[1]));  // ../sdram_control.v(245)
  binary_mux_s1_w1 mux28_b10 (
    .i0(n54[2]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[10]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux28_b11 (
    .i0(n54[3]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[11]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux28_b12 (
    .i0(n54[4]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[12]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux28_b13 (
    .i0(n54[5]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[13]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux28_b14 (
    .i0(n54[6]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[14]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux28_b15 (
    .i0(n54[7]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[15]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux28_b16 (
    .i0(n54[8]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[16]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux28_b17 (
    .i0(n54[9]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[17]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux28_b18 (
    .i0(n54[10]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[18]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux28_b19 (
    .i0(n54[11]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[19]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux28_b20 (
    .i0(n54[12]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[20]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux28_b8 (
    .i0(n54[0]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[8]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux28_b9 (
    .i0(n54[1]),
    .i1(1'b0),
    .sel(n53),
    .o(n55[9]));  // ../sdram_control.v(260)
  binary_mux_s1_w1 mux2_b1 (
    .i0(sd_addr[1]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n7[1]));  // ../sdram_control.v(176)
  binary_mux_s1_w1 mux2_b10 (
    .i0(sd_addr[10]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n7[10]));  // ../sdram_control.v(176)
  binary_mux_s1_w1 mux2_b11 (
    .i0(sd_addr[11]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n7[11]));  // ../sdram_control.v(176)
  binary_mux_s1_w1 mux2_b22 (
    .i0(sd_addr[1]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n10[1]));  // ../sdram_control.v(176)
  binary_mux_s1_w1 mux2_b24 (
    .i0(sd_addr[3]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n10[3]));  // ../sdram_control.v(176)
  binary_mux_s1_w1 mux2_b25 (
    .i0(sd_addr[4]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n10[4]));  // ../sdram_control.v(176)
  binary_mux_s1_w1 mux2_b29 (
    .i0(sd_addr[8]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n10[8]));  // ../sdram_control.v(176)
  binary_mux_s1_w1 mux2_b31 (
    .i0(sd_addr[10]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n10[10]));  // ../sdram_control.v(176)
  binary_mux_s1_w1 mux2_b32 (
    .i0(sd_addr[11]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n10[11]));  // ../sdram_control.v(176)
  binary_mux_s1_w1 mux2_b45 (
    .i0(sd_addr[3]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n13[3]));  // ../sdram_control.v(176)
  binary_mux_s1_w1 mux2_b46 (
    .i0(sd_addr[4]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n13[4]));  // ../sdram_control.v(176)
  binary_mux_s1_w1 mux2_b50 (
    .i0(sd_addr[8]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n13[8]));  // ../sdram_control.v(176)
  binary_mux_s1_w1 mux30_b0 (
    .i0(1'b0),
    .i1(n52[0]),
    .sel(n51),
    .o(n57[0]));  // ../sdram_control.v(261)
  binary_mux_s1_w1 mux30_b1 (
    .i0(1'b0),
    .i1(n52[1]),
    .sel(n51),
    .o(n57[1]));  // ../sdram_control.v(261)
  binary_mux_s1_w1 mux30_b2 (
    .i0(1'b0),
    .i1(n52[2]),
    .sel(n51),
    .o(n57[2]));  // ../sdram_control.v(261)
  binary_mux_s1_w1 mux30_b3 (
    .i0(1'b0),
    .i1(n52[3]),
    .sel(n51),
    .o(n57[3]));  // ../sdram_control.v(261)
  binary_mux_s1_w1 mux30_b4 (
    .i0(1'b0),
    .i1(n52[4]),
    .sel(n51),
    .o(n57[4]));  // ../sdram_control.v(261)
  binary_mux_s1_w1 mux30_b5 (
    .i0(1'b0),
    .i1(n52[5]),
    .sel(n51),
    .o(n57[5]));  // ../sdram_control.v(261)
  binary_mux_s1_w1 mux30_b6 (
    .i0(1'b0),
    .i1(n52[6]),
    .sel(n51),
    .o(n57[6]));  // ../sdram_control.v(261)
  binary_mux_s1_w1 mux30_b7 (
    .i0(1'b0),
    .i1(n52[7]),
    .sel(n51),
    .o(n57[7]));  // ../sdram_control.v(261)
  binary_mux_s1_w1 mux30_b8 (
    .i0(1'b0),
    .i1(n52[8]),
    .sel(n51),
    .o(n57[8]));  // ../sdram_control.v(261)
  binary_mux_s1_w1 mux31_b0 (
    .i0(1'b1),
    .i1(rd_state[0]),
    .sel(n51),
    .o(n58[0]));  // ../sdram_control.v(261)
  binary_mux_s1_w1 mux31_b1 (
    .i0(1'b1),
    .i1(rd_state[1]),
    .sel(n51),
    .o(n58[1]));  // ../sdram_control.v(261)
  and mux32_b0_sel_is_2 (mux32_b0_sel_is_2_o, n51_neg, n53);
  binary_mux_s1_w1 mux34_b0 (
    .i0(n27[0]),
    .i1(1'b0),
    .sel(n61),
    .o(n63[0]));  // ../sdram_control.v(267)
  binary_mux_s1_w1 mux34_b1 (
    .i0(n27[1]),
    .i1(1'b0),
    .sel(n61),
    .o(n63[1]));  // ../sdram_control.v(267)
  binary_mux_s1_w1 mux34_b2 (
    .i0(n27[2]),
    .i1(1'b1),
    .sel(n61),
    .o(n63[2]));  // ../sdram_control.v(267)
  binary_mux_s1_w1 mux35_b0 (
    .i0(datacnt[0]),
    .i1(n65[0]),
    .sel(n64),
    .o(n66[0]));  // ../sdram_control.v(270)
  binary_mux_s1_w1 mux35_b1 (
    .i0(datacnt[1]),
    .i1(n65[1]),
    .sel(n64),
    .o(n66[1]));  // ../sdram_control.v(270)
  binary_mux_s1_w1 mux35_b2 (
    .i0(datacnt[2]),
    .i1(n65[2]),
    .sel(n64),
    .o(n66[2]));  // ../sdram_control.v(270)
  binary_mux_s1_w1 mux35_b3 (
    .i0(datacnt[3]),
    .i1(n65[3]),
    .sel(n64),
    .o(n66[3]));  // ../sdram_control.v(270)
  binary_mux_s1_w1 mux35_b4 (
    .i0(datacnt[4]),
    .i1(n65[4]),
    .sel(n64),
    .o(n66[4]));  // ../sdram_control.v(270)
  binary_mux_s1_w1 mux35_b5 (
    .i0(datacnt[5]),
    .i1(n65[5]),
    .sel(n64),
    .o(n66[5]));  // ../sdram_control.v(270)
  binary_mux_s1_w1 mux35_b6 (
    .i0(datacnt[6]),
    .i1(n65[6]),
    .sel(n64),
    .o(n66[6]));  // ../sdram_control.v(270)
  binary_mux_s1_w1 mux35_b7 (
    .i0(datacnt[7]),
    .i1(n65[7]),
    .sel(n64),
    .o(n66[7]));  // ../sdram_control.v(270)
  binary_mux_s2_w1 mux36_b0 (
    .i0(burst_cnt1[0]),
    .i1(burst_cnt1[0]),
    .i2(n57[0]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[0]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux36_b1 (
    .i0(burst_cnt1[1]),
    .i1(burst_cnt1[1]),
    .i2(n57[1]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[1]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux36_b2 (
    .i0(burst_cnt1[2]),
    .i1(burst_cnt1[2]),
    .i2(n57[2]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[2]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux36_b3 (
    .i0(burst_cnt1[3]),
    .i1(burst_cnt1[3]),
    .i2(n57[3]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[3]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux36_b4 (
    .i0(burst_cnt1[4]),
    .i1(burst_cnt1[4]),
    .i2(n57[4]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[4]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux36_b5 (
    .i0(burst_cnt1[5]),
    .i1(burst_cnt1[5]),
    .i2(n57[5]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[5]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux36_b6 (
    .i0(burst_cnt1[6]),
    .i1(burst_cnt1[6]),
    .i2(n57[6]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[6]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux36_b7 (
    .i0(burst_cnt1[7]),
    .i1(burst_cnt1[7]),
    .i2(n57[7]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[7]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux36_b8 (
    .i0(burst_cnt1[8]),
    .i1(burst_cnt1[8]),
    .i2(n57[8]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n72[8]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux37_b0 (
    .i0(1'b1),
    .i1(n50[0]),
    .i2(n58[0]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n73[0]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux37_b1 (
    .i0(1'b0),
    .i1(n50[1]),
    .i2(n58[1]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n73[1]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux38_b0 (
    .i0(1'b1),
    .i1(n27[0]),
    .i2(n63[0]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n74[0]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux38_b1 (
    .i0(1'b0),
    .i1(n27[1]),
    .i2(n63[1]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n74[1]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux38_b2 (
    .i0(1'b0),
    .i1(n27[2]),
    .i2(n63[2]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n74[2]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux39_b0 (
    .i0(datacnt[0]),
    .i1(datacnt[0]),
    .i2(n66[0]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[0]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux39_b1 (
    .i0(datacnt[1]),
    .i1(datacnt[1]),
    .i2(n66[1]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[1]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux39_b2 (
    .i0(datacnt[2]),
    .i1(datacnt[2]),
    .i2(n66[2]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[2]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux39_b3 (
    .i0(datacnt[3]),
    .i1(datacnt[3]),
    .i2(n66[3]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[3]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux39_b4 (
    .i0(datacnt[4]),
    .i1(datacnt[4]),
    .i2(n66[4]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[4]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux39_b5 (
    .i0(datacnt[5]),
    .i1(datacnt[5]),
    .i2(n66[5]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[5]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux39_b6 (
    .i0(datacnt[6]),
    .i1(datacnt[6]),
    .i2(n66[6]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[6]));  // ../sdram_control.v(286)
  binary_mux_s2_w1 mux39_b7 (
    .i0(datacnt[7]),
    .i1(datacnt[7]),
    .i2(n66[7]),
    .i3(1'b0),
    .sel(rd_state),
    .o(n75[7]));  // ../sdram_control.v(286)
  AL_MUX mux40_b0 (
    .i0(rd_addr[0]),
    .i1(1'b0),
    .sel(mux40_b0_sel_is_6_o),
    .o(n76[0]));
  and mux40_b0_sel_is_6 (mux40_b0_sel_is_6_o, \rd_state[0]_neg , rd_state[1], mux32_b0_sel_is_2_o);
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
  and mux40_b10_sel_is_2 (mux40_b10_sel_is_2_o, \rd_state[0]_neg , rd_state[1], n51_neg);
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
  and mux42_sel_is_6 (mux42_sel_is_6_o, \rd_state[0]_neg , rd_state[1], n69);
  AL_MUX mux43_b0 (
    .i0(sd_addr[0]),
    .i1(rd_addr[0]),
    .sel(mux43_b0_sel_is_0_o),
    .o(n79[0]));
  and mux43_b0_sel_is_0 (mux43_b0_sel_is_0_o, \rd_state[0]_neg , \rd_state[1]_neg );
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
    .o(n6[0]));  // ../sdram_control.v(188)
  binary_mux_s1_w1 mux45_b1 (
    .i0(reset_step[1]),
    .i1(1'b1),
    .sel(sd_cmd_ack),
    .o(n6[1]));  // ../sdram_control.v(188)
  binary_mux_s1_w1 mux45_b2 (
    .i0(reset_step[0]),
    .i1(n8[0]),
    .sel(sd_cmd_ack),
    .o(n9[0]));  // ../sdram_control.v(188)
  binary_mux_s1_w1 mux45_b3 (
    .i0(reset_step[1]),
    .i1(n8[1]),
    .sel(sd_cmd_ack),
    .o(n9[1]));  // ../sdram_control.v(188)
  binary_mux_s1_w1 mux45_b7 (
    .i0(reset_step[1]),
    .i1(1'b0),
    .sel(sd_cmd_ack),
    .o(n15[1]));  // ../sdram_control.v(188)
  binary_mux_s2_w1 mux6_b0 (
    .i0(n6[0]),
    .i1(n9[0]),
    .i2(n9[0]),
    .i3(n6[0]),
    .sel(reset_step),
    .o(n19[0]));  // ../sdram_control.v(190)
  binary_mux_s2_w1 mux6_b1 (
    .i0(n6[1]),
    .i1(n9[1]),
    .i2(n9[1]),
    .i3(n15[1]),
    .sel(reset_step),
    .o(n19[1]));  // ../sdram_control.v(190)
  binary_mux_s2_w1 mux7_b0 (
    .i0(sd_cmd_ack),
    .i1(1'b1),
    .i2(n12[0]),
    .i3(1'b0),
    .sel(reset_step),
    .o(n20[0]));  // ../sdram_control.v(190)
  binary_mux_s2_w1 mux7_b1 (
    .i0(1'b0),
    .i1(sd_cmd_ack),
    .i2(sd_cmd_ack),
    .i3(n12[0]),
    .sel(reset_step),
    .o(n20[1]));  // ../sdram_control.v(190)
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
    .o(n70));  // ../sdram_control.v(272)
  not \rd_state[0]_inv  (\rd_state[0]_neg , rd_state[0]);
  not \rd_state[1]_inv  (\rd_state[1]_neg , rd_state[1]);
  reg_ar_as_w1 reg0_b0 (
    .clk(clk_200m),
    .d(n19[0]),
    .en(n80),
    .reset(~rst_n),
    .set(1'b0),
    .q(reset_step[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk_200m),
    .d(n19[1]),
    .en(n80),
    .reset(~rst_n),
    .set(1'b0),
    .q(reset_step[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg10_b0 (
    .clk(clk_200m),
    .d(n75[0]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg10_b1 (
    .clk(clk_200m),
    .d(n75[1]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg10_b2 (
    .clk(clk_200m),
    .d(n75[2]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[2]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg10_b3 (
    .clk(clk_200m),
    .d(n75[3]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[3]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg10_b4 (
    .clk(clk_200m),
    .d(n75[4]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[4]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg10_b5 (
    .clk(clk_200m),
    .d(n75[5]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[5]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg10_b6 (
    .clk(clk_200m),
    .d(n75[6]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[6]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg10_b7 (
    .clk(clk_200m),
    .d(n75[7]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(datacnt[7]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b0 (
    .clk(clk_200m),
    .d(SD_DQ[0]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b1 (
    .clk(clk_200m),
    .d(SD_DQ[1]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b10 (
    .clk(clk_200m),
    .d(SD_DQ[10]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[10]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b11 (
    .clk(clk_200m),
    .d(SD_DQ[11]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[11]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b12 (
    .clk(clk_200m),
    .d(SD_DQ[12]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[12]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b13 (
    .clk(clk_200m),
    .d(SD_DQ[13]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[13]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b14 (
    .clk(clk_200m),
    .d(SD_DQ[14]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[14]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b15 (
    .clk(clk_200m),
    .d(SD_DQ[15]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[15]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b16 (
    .clk(clk_200m),
    .d(SD_DQ[16]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[16]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b17 (
    .clk(clk_200m),
    .d(SD_DQ[17]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[17]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b18 (
    .clk(clk_200m),
    .d(SD_DQ[18]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[18]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b19 (
    .clk(clk_200m),
    .d(SD_DQ[19]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[19]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b2 (
    .clk(clk_200m),
    .d(SD_DQ[2]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[2]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b20 (
    .clk(clk_200m),
    .d(SD_DQ[20]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[20]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b21 (
    .clk(clk_200m),
    .d(SD_DQ[21]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[21]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b22 (
    .clk(clk_200m),
    .d(SD_DQ[22]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[22]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b23 (
    .clk(clk_200m),
    .d(SD_DQ[23]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[23]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b24 (
    .clk(clk_200m),
    .d(SD_DQ[24]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[24]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b25 (
    .clk(clk_200m),
    .d(SD_DQ[25]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[25]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b26 (
    .clk(clk_200m),
    .d(SD_DQ[26]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[26]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b27 (
    .clk(clk_200m),
    .d(SD_DQ[27]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[27]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b28 (
    .clk(clk_200m),
    .d(SD_DQ[28]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[28]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b29 (
    .clk(clk_200m),
    .d(SD_DQ[29]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[29]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b3 (
    .clk(clk_200m),
    .d(SD_DQ[3]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[3]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b30 (
    .clk(clk_200m),
    .d(SD_DQ[30]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[30]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b31 (
    .clk(clk_200m),
    .d(SD_DQ[31]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[31]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b4 (
    .clk(clk_200m),
    .d(SD_DQ[4]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[4]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b5 (
    .clk(clk_200m),
    .d(SD_DQ[5]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[5]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b6 (
    .clk(clk_200m),
    .d(SD_DQ[6]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[6]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b7 (
    .clk(clk_200m),
    .d(SD_DQ[7]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[7]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b8 (
    .clk(clk_200m),
    .d(SD_DQ[8]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[8]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg11_b9 (
    .clk(clk_200m),
    .d(SD_DQ[9]),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sd_dq_int[9]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg12_b0 (
    .clk(clk_200m),
    .d(n1[0]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[0]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b1 (
    .clk(clk_200m),
    .d(n1[1]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[1]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b10 (
    .clk(clk_200m),
    .d(n1[10]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[10]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b11 (
    .clk(clk_200m),
    .d(n1[11]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[11]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b12 (
    .clk(clk_200m),
    .d(n1[12]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[12]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b13 (
    .clk(clk_200m),
    .d(n1[13]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[13]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b14 (
    .clk(clk_200m),
    .d(n1[14]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[14]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b15 (
    .clk(clk_200m),
    .d(n1[15]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[15]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b2 (
    .clk(clk_200m),
    .d(n1[2]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[2]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b3 (
    .clk(clk_200m),
    .d(n1[3]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[3]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b4 (
    .clk(clk_200m),
    .d(n1[4]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[4]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b5 (
    .clk(clk_200m),
    .d(n1[5]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[5]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b6 (
    .clk(clk_200m),
    .d(n1[6]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[6]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b7 (
    .clk(clk_200m),
    .d(n1[7]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[7]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b8 (
    .clk(clk_200m),
    .d(n1[8]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[8]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg12_b9 (
    .clk(clk_200m),
    .d(n1[9]),
    .en(test_error_tmp),
    .reset(~rst_n),
    .set(1'b0),
    .q(error_cnt[9]));  // ../sdram_control.v(123)
  reg_ar_as_w1 reg13_b0 (
    .clk(clk_200m),
    .d(n86[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_cmd[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg13_b1 (
    .clk(clk_200m),
    .d(n86[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_cmd[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg13_b2 (
    .clk(clk_200m),
    .d(n86[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(~rst_n),
    .q(sd_cmd[2]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk_200m),
    .d(n30[0]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk_200m),
    .d(n30[1]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk_200m),
    .d(n30[2]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[2]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk_200m),
    .d(n30[3]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[3]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg1_b4 (
    .clk(clk_200m),
    .d(n30[4]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[4]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg1_b5 (
    .clk(clk_200m),
    .d(n30[5]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[5]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg1_b6 (
    .clk(clk_200m),
    .d(n30[6]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[6]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg1_b7 (
    .clk(clk_200m),
    .d(n30[7]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[7]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg1_b8 (
    .clk(clk_200m),
    .d(n30[8]),
    .en(sel8_b0_sel_is_3_o),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt[8]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk_200m),
    .d(n72[0]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk_200m),
    .d(n72[1]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk_200m),
    .d(n72[2]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[2]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk_200m),
    .d(n72[3]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[3]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg2_b4 (
    .clk(clk_200m),
    .d(n72[4]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[4]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg2_b5 (
    .clk(clk_200m),
    .d(n72[5]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[5]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg2_b6 (
    .clk(clk_200m),
    .d(n72[6]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[6]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg2_b7 (
    .clk(clk_200m),
    .d(n72[7]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[7]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg2_b8 (
    .clk(clk_200m),
    .d(n72[8]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(burst_cnt1[8]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk_200m),
    .d(n89[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_state[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk_200m),
    .d(n89[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_state[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk_200m),
    .d(n89[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_state[2]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk_200m),
    .d(n44[0]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_state[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk_200m),
    .d(n44[1]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_state[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg5_b0 (
    .clk(clk_200m),
    .d(n73[0]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_state[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg5_b1 (
    .clk(clk_200m),
    .d(n73[1]),
    .en(n82),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_state[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b0 (
    .clk(clk_200m),
    .d(n90[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b1 (
    .clk(clk_200m),
    .d(n90[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b10 (
    .clk(clk_200m),
    .d(n90[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[10]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b11 (
    .clk(clk_200m),
    .d(n90[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[11]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b12 (
    .clk(clk_200m),
    .d(n90[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[12]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b13 (
    .clk(clk_200m),
    .d(n90[13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[13]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b14 (
    .clk(clk_200m),
    .d(n90[14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[14]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b15 (
    .clk(clk_200m),
    .d(n90[15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[15]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b16 (
    .clk(clk_200m),
    .d(n90[16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[16]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b17 (
    .clk(clk_200m),
    .d(n90[17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[17]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b18 (
    .clk(clk_200m),
    .d(n90[18]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[18]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b19 (
    .clk(clk_200m),
    .d(n90[19]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[19]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b2 (
    .clk(clk_200m),
    .d(n90[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[2]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b20 (
    .clk(clk_200m),
    .d(n90[20]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[20]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b3 (
    .clk(clk_200m),
    .d(n90[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[3]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b4 (
    .clk(clk_200m),
    .d(n90[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[4]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b5 (
    .clk(clk_200m),
    .d(n90[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[5]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b6 (
    .clk(clk_200m),
    .d(n90[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[6]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b7 (
    .clk(clk_200m),
    .d(n90[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[7]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b8 (
    .clk(clk_200m),
    .d(n90[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[8]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg6_b9 (
    .clk(clk_200m),
    .d(n90[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sd_addr[9]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b0 (
    .clk(clk_200m),
    .d(n88[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b1 (
    .clk(clk_200m),
    .d(n88[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b10 (
    .clk(clk_200m),
    .d(n88[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[10]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b11 (
    .clk(clk_200m),
    .d(n88[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[11]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b12 (
    .clk(clk_200m),
    .d(n88[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[12]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b13 (
    .clk(clk_200m),
    .d(n88[13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[13]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b14 (
    .clk(clk_200m),
    .d(n88[14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[14]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b15 (
    .clk(clk_200m),
    .d(n88[15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[15]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b16 (
    .clk(clk_200m),
    .d(n88[16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[16]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b17 (
    .clk(clk_200m),
    .d(n88[17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[17]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b18 (
    .clk(clk_200m),
    .d(n88[18]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[18]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b19 (
    .clk(clk_200m),
    .d(n88[19]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[19]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b2 (
    .clk(clk_200m),
    .d(n88[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[2]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b20 (
    .clk(clk_200m),
    .d(n88[20]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[20]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b3 (
    .clk(clk_200m),
    .d(n88[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[3]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b4 (
    .clk(clk_200m),
    .d(n88[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[4]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b5 (
    .clk(clk_200m),
    .d(n88[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[5]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b6 (
    .clk(clk_200m),
    .d(n88[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[6]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b7 (
    .clk(clk_200m),
    .d(n88[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[7]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b8 (
    .clk(clk_200m),
    .d(n88[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[8]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg7_b9 (
    .clk(clk_200m),
    .d(n88[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(wr_addr[9]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b0 (
    .clk(clk_200m),
    .d(n87[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b1 (
    .clk(clk_200m),
    .d(n87[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b10 (
    .clk(clk_200m),
    .d(n87[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[10]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b11 (
    .clk(clk_200m),
    .d(n87[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[11]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b12 (
    .clk(clk_200m),
    .d(n87[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[12]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b13 (
    .clk(clk_200m),
    .d(n87[13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[13]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b14 (
    .clk(clk_200m),
    .d(n87[14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[14]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b15 (
    .clk(clk_200m),
    .d(n87[15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[15]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b16 (
    .clk(clk_200m),
    .d(n87[16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[16]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b17 (
    .clk(clk_200m),
    .d(n87[17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[17]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b18 (
    .clk(clk_200m),
    .d(n87[18]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[18]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b19 (
    .clk(clk_200m),
    .d(n87[19]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[19]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b2 (
    .clk(clk_200m),
    .d(n87[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[2]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b20 (
    .clk(clk_200m),
    .d(n87[20]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[20]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b3 (
    .clk(clk_200m),
    .d(n87[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[3]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b4 (
    .clk(clk_200m),
    .d(n87[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[4]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b5 (
    .clk(clk_200m),
    .d(n87[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[5]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b6 (
    .clk(clk_200m),
    .d(n87[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[6]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b7 (
    .clk(clk_200m),
    .d(n87[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[7]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b8 (
    .clk(clk_200m),
    .d(n87[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[8]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg8_b9 (
    .clk(clk_200m),
    .d(n87[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(rd_addr[9]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg9_b0 (
    .clk(clk_200m),
    .d(n45[0]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[0]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg9_b1 (
    .clk(clk_200m),
    .d(n45[1]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[1]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg9_b2 (
    .clk(clk_200m),
    .d(n45[2]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[2]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg9_b3 (
    .clk(clk_200m),
    .d(n45[3]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[3]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg9_b4 (
    .clk(clk_200m),
    .d(n45[4]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[4]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg9_b5 (
    .clk(clk_200m),
    .d(n45[5]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[5]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg9_b6 (
    .clk(clk_200m),
    .d(n45[6]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[6]));  // ../sdram_control.v(291)
  reg_ar_as_w1 reg9_b7 (
    .clk(clk_200m),
    .d(n45[7]),
    .en(n81),
    .reset(~rst_n),
    .set(1'b0),
    .q(fifo_q[7]));  // ../sdram_control.v(291)
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
    .o(n86[0]));  // ../sdram_control.v(290)
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
    .o(n86[1]));  // ../sdram_control.v(290)
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
    .o(n86[2]));  // ../sdram_control.v(290)
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
    .o(n87[0]));  // ../sdram_control.v(290)
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
    .o(n87[1]));  // ../sdram_control.v(290)
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
    .o(n87[10]));  // ../sdram_control.v(290)
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
    .o(n87[11]));  // ../sdram_control.v(290)
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
    .o(n87[12]));  // ../sdram_control.v(290)
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
    .o(n87[13]));  // ../sdram_control.v(290)
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
    .o(n87[14]));  // ../sdram_control.v(290)
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
    .o(n87[15]));  // ../sdram_control.v(290)
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
    .o(n87[16]));  // ../sdram_control.v(290)
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
    .o(n87[17]));  // ../sdram_control.v(290)
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
    .o(n87[18]));  // ../sdram_control.v(290)
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
    .o(n87[19]));  // ../sdram_control.v(290)
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
    .o(n87[2]));  // ../sdram_control.v(290)
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
    .o(n87[20]));  // ../sdram_control.v(290)
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
    .o(n87[3]));  // ../sdram_control.v(290)
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
    .o(n87[4]));  // ../sdram_control.v(290)
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
    .o(n87[5]));  // ../sdram_control.v(290)
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
    .o(n87[6]));  // ../sdram_control.v(290)
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
    .o(n87[7]));  // ../sdram_control.v(290)
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
    .o(n87[8]));  // ../sdram_control.v(290)
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
    .o(n87[9]));  // ../sdram_control.v(290)
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
    .o(n88[0]));  // ../sdram_control.v(290)
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
    .o(n88[1]));  // ../sdram_control.v(290)
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
    .o(n88[10]));  // ../sdram_control.v(290)
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
    .o(n88[11]));  // ../sdram_control.v(290)
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
    .o(n88[12]));  // ../sdram_control.v(290)
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
    .o(n88[13]));  // ../sdram_control.v(290)
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
    .o(n88[14]));  // ../sdram_control.v(290)
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
    .o(n88[15]));  // ../sdram_control.v(290)
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
    .o(n88[16]));  // ../sdram_control.v(290)
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
    .o(n88[17]));  // ../sdram_control.v(290)
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
    .o(n88[18]));  // ../sdram_control.v(290)
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
    .o(n88[19]));  // ../sdram_control.v(290)
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
    .o(n88[2]));  // ../sdram_control.v(290)
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
    .o(n88[20]));  // ../sdram_control.v(290)
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
    .o(n88[3]));  // ../sdram_control.v(290)
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
    .o(n88[4]));  // ../sdram_control.v(290)
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
    .o(n88[5]));  // ../sdram_control.v(290)
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
    .o(n88[6]));  // ../sdram_control.v(290)
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
    .o(n88[7]));  // ../sdram_control.v(290)
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
    .o(n88[8]));  // ../sdram_control.v(290)
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
    .o(n88[9]));  // ../sdram_control.v(290)
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
    .o(n89[0]));  // ../sdram_control.v(290)
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
    .o(n89[1]));  // ../sdram_control.v(290)
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
    .o(n89[2]));  // ../sdram_control.v(290)
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
    .o(n90[0]));  // ../sdram_control.v(290)
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
    .o(n90[1]));  // ../sdram_control.v(290)
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
    .o(n90[10]));  // ../sdram_control.v(290)
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
    .o(n90[11]));  // ../sdram_control.v(290)
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
    .o(n90[12]));  // ../sdram_control.v(290)
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
    .o(n90[13]));  // ../sdram_control.v(290)
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
    .o(n90[14]));  // ../sdram_control.v(290)
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
    .o(n90[15]));  // ../sdram_control.v(290)
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
    .o(n90[16]));  // ../sdram_control.v(290)
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
    .o(n90[17]));  // ../sdram_control.v(290)
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
    .o(n90[18]));  // ../sdram_control.v(290)
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
    .o(n90[19]));  // ../sdram_control.v(290)
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
    .o(n90[2]));  // ../sdram_control.v(290)
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
    .o(n90[20]));  // ../sdram_control.v(290)
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
    .o(n90[3]));  // ../sdram_control.v(290)
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
    .o(n90[4]));  // ../sdram_control.v(290)
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
    .o(n90[5]));  // ../sdram_control.v(290)
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
    .o(n90[6]));  // ../sdram_control.v(290)
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
    .o(n90[7]));  // ../sdram_control.v(290)
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
    .o(n90[8]));  // ../sdram_control.v(290)
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
    .o(n90[9]));  // ../sdram_control.v(290)
  and sel8_b0_sel_is_3 (sel8_b0_sel_is_3_o, n81, mux24_b0_sel_is_2_o);
  reg_ar_ss_w1 test_error_reg (
    .clk(clk_200m),
    .d(test_error_led),
    .en(1'b1),
    .reset(~rst_n),
    .set(n3),
    .q(test_error_led));  // ../sdram_control.v(123)
  reg_ar_as_w1 test_error_tmp_reg (
    .clk(clk_200m),
    .d(n70),
    .en(u26_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(test_error_tmp));  // ../sdram_control.v(291)
  reg_ar_as_w1 test_io_reg (
    .clk(clk_200m),
    .d(test_error_tmp),
    .en(~n5),
    .reset(1'b0),
    .set(1'b0),
    .q(test_io));  // ../sdram_control.v(291)
  and u20 (n69, n64, n68);  // ../sdram_control.v(271)
  and u23_sel_is_3 (u23_sel_is_3_o, n82, mux42_sel_is_6_o);
  and u26_sel_is_2 (u26_sel_is_2_o, rst_n, u23_sel_is_3_o);
  not u3 (n12[0], sd_cmd_ack);  // ../sdram_control.v(188)
  not u7 (n5, rst_n);  // ../sdram_control.v(112)
  sdr_sdram u_sdram (
    .ADDR(sd_addr),
    .CLK(clk_200m),
    .CMD(sd_cmd),
    .DATAIN({fifo_q,fifo_q,fifo_q,fifo_q}),
    .RESET_N(rst_n),
    .BA(SD_BA),
    .CAS_N(SD_CAS_N),
    .CMDACK(sd_cmd_ack),
    .CS_N(SD_CS_N),
    .RAS_N(SD_RAS_N),
    .SA(SD_SA),
    .WE_N(SD_WE_N),
    .DQ(SD_DQ));  // ../sdram_control.v(66)
  EG_LOGIC_BUFG \u_sys_pll/bufg_feedback  (
    .i(\u_sys_pll/clk0_buf ),
    .o(clk_200m));  // al_ip/pll1.v(33)
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
    .clkc({open_n33,open_n34,open_n35,sd_clk_int,\u_sys_pll/clk0_buf }));  // al_ip/pll1.v(60)
  \seg4(CNT_TIME=24000000)  ux_seg (
    .clk_24m(CLKIN),
    .rst_n(rst_n),
    .sm_bit_num({fifo_q,fifo_q,fifo_q,fifo_q}),
    .sm_bit(sm_bit),
    .sm_seg({open_n46,sm_seg[6:0]}));  // ../sdram_control.v(54)
  not \wr_state[0]_inv  (\wr_state[0]_neg , wr_state[0]);
  not \wr_state[1]_inv  (\wr_state[1]_neg , wr_state[1]);

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

  wire \or_or_or_or_xor_i0[0_o ;
  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_or_xor_i0[8]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[12]_i1[_o ;
  wire \or_or_xor_i0[4]_i1[4_o ;
  wire \or_or_xor_i0[8]_i1[8_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[10]_i1[10]_o ;
  wire \or_xor_i0[12]_i1[12]_o ;
  wire \or_xor_i0[14]_i1[14]_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \or_xor_i0[8]_i1[8]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[10]_i1[10]_o ;
  wire \xor_i0[11]_i1[11]_o ;
  wire \xor_i0[12]_i1[12]_o ;
  wire \xor_i0[13]_i1[13]_o ;
  wire \xor_i0[14]_i1[14]_o ;
  wire \xor_i0[15]_i1[15]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, \or_or_or_or_xor_i0[0_o );
  or \or_or_or_or_xor_i0[0  (\or_or_or_or_xor_i0[0_o , \or_or_or_xor_i0[0]_i_o , \or_or_or_xor_i0[8]_i_o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[4]_i1[4_o );
  or \or_or_or_xor_i0[8]_i  (\or_or_or_xor_i0[8]_i_o , \or_or_xor_i0[8]_i1[8_o , \or_or_xor_i0[12]_i1[_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_or_xor_i0[12]_i1[  (\or_or_xor_i0[12]_i1[_o , \or_xor_i0[12]_i1[12]_o , \or_xor_i0[14]_i1[14]_o );
  or \or_or_xor_i0[4]_i1[4  (\or_or_xor_i0[4]_i1[4_o , \or_xor_i0[4]_i1[4]_o_o , \or_xor_i0[6]_i1[6]_o_o );
  or \or_or_xor_i0[8]_i1[8  (\or_or_xor_i0[8]_i1[8_o , \or_xor_i0[8]_i1[8]_o_o , \or_xor_i0[10]_i1[10]_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[10]_i1[10]  (\or_xor_i0[10]_i1[10]_o , \xor_i0[10]_i1[10]_o , \xor_i0[11]_i1[11]_o );
  or \or_xor_i0[12]_i1[12]  (\or_xor_i0[12]_i1[12]_o , \xor_i0[12]_i1[12]_o , \xor_i0[13]_i1[13]_o );
  or \or_xor_i0[14]_i1[14]  (\or_xor_i0[14]_i1[14]_o , \xor_i0[14]_i1[14]_o , \xor_i0[15]_i1[15]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \xor_i0[3]_i1[3]_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \xor_i0[7]_i1[7]_o );
  or \or_xor_i0[8]_i1[8]_o  (\or_xor_i0[8]_i1[8]_o_o , \xor_i0[8]_i1[8]_o , \xor_i0[9]_i1[9]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (\xor_i0[10]_i1[10]_o , i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (\xor_i0[11]_i1[11]_o , i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (\xor_i0[12]_i1[12]_o , i0[12], i1[12]);
  xor \xor_i0[13]_i1[13]  (\xor_i0[13]_i1[13]_o , i0[13], i1[13]);
  xor \xor_i0[14]_i1[14]  (\xor_i0[14]_i1[14]_o , i0[14], i1[14]);
  xor \xor_i0[15]_i1[15]  (\xor_i0[15]_i1[15]_o , i0[15], i1[15]);
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

module eq_w9
  (
  i0,
  i1,
  o
  );

  input [8:0] i0;
  input [8:0] i1;
  output o;

  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[4]_i1[4_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \or_xor_i0[7]_i1[7]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;

  not none_diff (o, \or_or_or_xor_i0[0]_i_o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[4]_i1[4_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_or_xor_i0[4]_i1[4  (\or_or_xor_i0[4]_i1[4_o , \or_xor_i0[4]_i1[4]_o_o , \or_xor_i0[6]_i1[6]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \xor_i0[3]_i1[3]_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \or_xor_i0[7]_i1[7]_o_o );
  or \or_xor_i0[7]_i1[7]_o  (\or_xor_i0[7]_i1[7]_o_o , \xor_i0[7]_i1[7]_o , \xor_i0[8]_i1[8]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (\xor_i0[8]_i1[8]_o , i0[8], i1[8]);

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

module eq_w3
  (
  i0,
  i1,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  output o;

  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[1]_i1[1]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;

  not none_diff (o, \or_xor_i0[0]_i1[0]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \or_xor_i0[1]_i1[1]_o_o );
  or \or_xor_i0[1]_i1[1]_o  (\or_xor_i0[1]_i1[1]_o_o , \xor_i0[1]_i1[1]_o , \xor_i0[2]_i1[2]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);

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

module sdr_sdram  // ../sdr_sdram.v(3)
  (
  ADDR,
  CLK,
  CMD,
  DATAIN,
  RESET_N,
  BA,
  CAS_N,
  CKE,
  CMDACK,
  CS_N,
  DATAOUT,
  RAS_N,
  SA,
  WE_N,
  DQ
  );

  input [20:0] ADDR;  // ../sdr_sdram.v(16)
  input CLK;  // ../sdr_sdram.v(14)
  input [2:0] CMD;  // ../sdr_sdram.v(17)
  input [31:0] DATAIN;  // ../sdr_sdram.v(19)
  input RESET_N;  // ../sdr_sdram.v(15)
  output [1:0] BA;  // ../sdr_sdram.v(24)
  output CAS_N;  // ../sdr_sdram.v(32)
  output CKE;  // ../sdr_sdram.v(28)
  output CMDACK;  // ../sdr_sdram.v(18)
  output CS_N;  // ../sdr_sdram.v(26)
  output [31:0] DATAOUT;  // ../sdr_sdram.v(20)
  output RAS_N;  // ../sdr_sdram.v(30)
  output [10:0] SA;  // ../sdr_sdram.v(22)
  output WE_N;  // ../sdr_sdram.v(34)
  inout [31:0] DQ;  // ../sdr_sdram.v(36)

  parameter ASIZE = 21;
  parameter BANKSIZE = 2;
  parameter BANKSTART = 19;
  parameter COLSIZE = 8;
  parameter COLSTART = 0;
  parameter DSIZE = 32;
  parameter ROWSIZE = 11;
  parameter ROWSTART = 8;
  wire [31:0] DQIN;  // ../sdr_sdram.v(46)
  wire [31:0] DQOUT;  // ../sdr_sdram.v(48)
  wire [1:0] IBA;  // ../sdr_sdram.v(40)
  wire [10:0] ISA;  // ../sdr_sdram.v(39)
  wire [20:0] saddr;  // ../sdr_sdram.v(50)
  wire [1:0] sc_rc;  // ../sdr_sdram.v(52)
  wire [7:0] \ux_command/command_delay ;  // ../Command.v(67)
  wire [3:0] \ux_command/n33 ;
  wire [3:0] \ux_command/n34 ;
  wire [3:0] \ux_command/n36 ;
  wire [3:0] \ux_command/n38 ;
  wire [10:0] \ux_command/n39 ;
  wire [1:0] \ux_command/n41 ;
  wire [1:0] \ux_command/n42 ;
  wire [3:0] \ux_command/rp_shift ;  // ../Command.v(73)
  wire [3:0] \ux_command/rw_shift ;  // ../Command.v(68)
  wire [31:0] \ux_data_path/DIN1 ;  // ../sdr_data_path.v(30)
  wire ICAS_N;  // ../sdr_sdram.v(44)
  wire ICKE;  // ../sdr_sdram.v(42)
  wire ICS_N;  // ../sdr_sdram.v(41)
  wire IRAS_N;  // ../sdr_sdram.v(43)
  wire IWE_N;  // ../sdr_sdram.v(45)
  wire cm_ack;  // ../sdr_sdram.v(62)
  wire load_mode;  // ../sdr_sdram.v(56)
  wire oe;  // ../sdr_sdram.v(61)
  wire precharge;  // ../sdr_sdram.v(60)
  wire reada;  // ../sdr_sdram.v(58)
  wire \ux_command/bankclose ;  // ../Command.v(78)
  wire \ux_command/command_done ;  // ../Command.v(66)
  wire \ux_command/do_load_mode ;  // ../Command.v(65)
  wire \ux_command/do_load_mode_neg ;
  wire \ux_command/do_precharge ;  // ../Command.v(64)
  wire \ux_command/do_reada ;  // ../Command.v(61)
  wire \ux_command/do_rw ;  // ../Command.v(71)
  wire \ux_command/do_writea ;  // ../Command.v(62)
  wire \ux_command/n0 ;
  wire \ux_command/n1 ;
  wire \ux_command/n10 ;
  wire \ux_command/n11 ;
  wire \ux_command/n12 ;
  wire \ux_command/n13 ;
  wire \ux_command/n14 ;
  wire \ux_command/n16 ;
  wire \ux_command/n17 ;
  wire \ux_command/n17_neg ;
  wire \ux_command/n18 ;
  wire \ux_command/n19 ;
  wire \ux_command/n2 ;
  wire \ux_command/n23 ;
  wire \ux_command/n24 ;
  wire \ux_command/n26 ;
  wire \ux_command/n27 ;
  wire \ux_command/n3 ;
  wire \ux_command/n30 ;
  wire \ux_command/n31 ;
  wire \ux_command/n32 ;
  wire \ux_command/n35 ;
  wire \ux_command/n37 ;
  wire \ux_command/n4 ;
  wire \ux_command/n40 ;
  wire \ux_command/n43 ;
  wire \ux_command/n44 ;
  wire \ux_command/n44_neg ;
  wire \ux_command/n45 ;
  wire \ux_command/n45_neg ;
  wire \ux_command/n46 ;
  wire \ux_command/n49 ;
  wire \ux_command/n5 ;
  wire \ux_command/n50 ;
  wire \ux_command/n52 ;
  wire \ux_command/n54 ;
  wire \ux_command/n57 ;
  wire \ux_command/n58 ;
  wire \ux_command/n59 ;
  wire \ux_command/n6 ;
  wire \ux_command/n61 ;
  wire \ux_command/n7 ;
  wire \ux_command/n8 ;
  wire \ux_command/n9 ;
  wire \ux_command/oe1 ;  // ../Command.v(72)
  wire \ux_command/rp_done ;  // ../Command.v(74)
  wire \ux_command/rw_flag ;  // ../Command.v(70)
  wire \ux_command/u60_sel_is_2_o ;
  wire \ux_command/u64_sel_is_0_o ;
  wire \ux_command/u69_sel_is_0_o ;
  wire \ux_command/u70_sel_is_2_o ;
  wire \ux_control/LOAD_REG1 ;  // ../control_interface.v(49)
  wire \ux_control/LOAD_REG2 ;  // ../control_interface.v(50)
  wire \ux_control/n10 ;
  wire \ux_control/n11 ;
  wire \ux_control/n17 ;
  wire \ux_control/n18 ;
  wire \ux_control/n19 ;
  wire \ux_control/n2 ;
  wire \ux_control/n20 ;
  wire \ux_control/n3 ;
  wire \ux_control/n4 ;
  wire \ux_control/n5 ;
  wire \ux_control/n6 ;
  wire \ux_control/n7 ;
  wire \ux_control/n8 ;
  wire \ux_control/n9 ;
  wire writea;  // ../sdr_sdram.v(59)

  reg_ar_as_w1 CAS_N_reg (
    .clk(CLK),
    .d(ICAS_N),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(CAS_N));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 CKE_reg (
    .clk(CLK),
    .d(ICKE),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(CKE));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 CS_N_reg (
    .clk(CLK),
    .d(ICS_N),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(CS_N));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 RAS_N_reg (
    .clk(CLK),
    .d(IRAS_N),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(RAS_N));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 WE_N_reg (
    .clk(CLK),
    .d(IWE_N),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(WE_N));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg0_b0 (
    .clk(CLK),
    .d(IBA[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(BA[0]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg0_b1 (
    .clk(CLK),
    .d(IBA[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(BA[1]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b0 (
    .clk(CLK),
    .d(DQ[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[0]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b1 (
    .clk(CLK),
    .d(DQ[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[1]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b10 (
    .clk(CLK),
    .d(DQ[10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[10]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b11 (
    .clk(CLK),
    .d(DQ[11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[11]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b12 (
    .clk(CLK),
    .d(DQ[12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[12]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b13 (
    .clk(CLK),
    .d(DQ[13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[13]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b14 (
    .clk(CLK),
    .d(DQ[14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[14]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b15 (
    .clk(CLK),
    .d(DQ[15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[15]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b16 (
    .clk(CLK),
    .d(DQ[16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[16]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b17 (
    .clk(CLK),
    .d(DQ[17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[17]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b18 (
    .clk(CLK),
    .d(DQ[18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[18]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b19 (
    .clk(CLK),
    .d(DQ[19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[19]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b2 (
    .clk(CLK),
    .d(DQ[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[2]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b20 (
    .clk(CLK),
    .d(DQ[20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[20]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b21 (
    .clk(CLK),
    .d(DQ[21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[21]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b22 (
    .clk(CLK),
    .d(DQ[22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[22]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b23 (
    .clk(CLK),
    .d(DQ[23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[23]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b24 (
    .clk(CLK),
    .d(DQ[24]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[24]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b25 (
    .clk(CLK),
    .d(DQ[25]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[25]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b26 (
    .clk(CLK),
    .d(DQ[26]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[26]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b27 (
    .clk(CLK),
    .d(DQ[27]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[27]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b28 (
    .clk(CLK),
    .d(DQ[28]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[28]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b29 (
    .clk(CLK),
    .d(DQ[29]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[29]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b3 (
    .clk(CLK),
    .d(DQ[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[3]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b30 (
    .clk(CLK),
    .d(DQ[30]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[30]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b31 (
    .clk(CLK),
    .d(DQ[31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[31]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b4 (
    .clk(CLK),
    .d(DQ[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[4]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b5 (
    .clk(CLK),
    .d(DQ[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[5]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b6 (
    .clk(CLK),
    .d(DQ[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[6]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b7 (
    .clk(CLK),
    .d(DQ[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[7]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b8 (
    .clk(CLK),
    .d(DQ[8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[8]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg1_b9 (
    .clk(CLK),
    .d(DQ[9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DQIN[9]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b0 (
    .clk(CLK),
    .d(DQIN[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[0]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b1 (
    .clk(CLK),
    .d(DQIN[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[1]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b10 (
    .clk(CLK),
    .d(DQIN[10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[10]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b11 (
    .clk(CLK),
    .d(DQIN[11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[11]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b12 (
    .clk(CLK),
    .d(DQIN[12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[12]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b13 (
    .clk(CLK),
    .d(DQIN[13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[13]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b14 (
    .clk(CLK),
    .d(DQIN[14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[14]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b15 (
    .clk(CLK),
    .d(DQIN[15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[15]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b16 (
    .clk(CLK),
    .d(DQIN[16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[16]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b17 (
    .clk(CLK),
    .d(DQIN[17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[17]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b18 (
    .clk(CLK),
    .d(DQIN[18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[18]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b19 (
    .clk(CLK),
    .d(DQIN[19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[19]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b2 (
    .clk(CLK),
    .d(DQIN[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[2]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b20 (
    .clk(CLK),
    .d(DQIN[20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[20]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b21 (
    .clk(CLK),
    .d(DQIN[21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[21]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b22 (
    .clk(CLK),
    .d(DQIN[22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[22]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b23 (
    .clk(CLK),
    .d(DQIN[23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[23]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b24 (
    .clk(CLK),
    .d(DQIN[24]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[24]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b25 (
    .clk(CLK),
    .d(DQIN[25]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[25]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b26 (
    .clk(CLK),
    .d(DQIN[26]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[26]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b27 (
    .clk(CLK),
    .d(DQIN[27]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[27]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b28 (
    .clk(CLK),
    .d(DQIN[28]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[28]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b29 (
    .clk(CLK),
    .d(DQIN[29]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[29]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b3 (
    .clk(CLK),
    .d(DQIN[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[3]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b30 (
    .clk(CLK),
    .d(DQIN[30]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[30]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b31 (
    .clk(CLK),
    .d(DQIN[31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[31]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b4 (
    .clk(CLK),
    .d(DQIN[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[4]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b5 (
    .clk(CLK),
    .d(DQIN[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[5]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b6 (
    .clk(CLK),
    .d(DQIN[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[6]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b7 (
    .clk(CLK),
    .d(DQIN[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[7]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b8 (
    .clk(CLK),
    .d(DQIN[8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[8]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg2_b9 (
    .clk(CLK),
    .d(DQIN[9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(DATAOUT[9]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg3_b0 (
    .clk(CLK),
    .d(ISA[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SA[0]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg3_b1 (
    .clk(CLK),
    .d(ISA[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SA[1]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg3_b10 (
    .clk(CLK),
    .d(ISA[10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SA[10]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg3_b2 (
    .clk(CLK),
    .d(ISA[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SA[2]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg3_b3 (
    .clk(CLK),
    .d(ISA[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SA[3]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg3_b4 (
    .clk(CLK),
    .d(ISA[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SA[4]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg3_b5 (
    .clk(CLK),
    .d(ISA[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SA[5]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg3_b6 (
    .clk(CLK),
    .d(ISA[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SA[6]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg3_b7 (
    .clk(CLK),
    .d(ISA[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SA[7]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg3_b8 (
    .clk(CLK),
    .d(ISA[8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SA[8]));  // ../sdr_sdram.v(88)
  reg_ar_as_w1 reg3_b9 (
    .clk(CLK),
    .d(ISA[9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(SA[9]));  // ../sdr_sdram.v(88)
  bufif1 u1 (DQ[31], DQOUT[31], oe);  // ../sdr_sdram.v(90)
  bufif1 u10 (DQ[22], DQOUT[22], oe);  // ../sdr_sdram.v(90)
  bufif1 u11 (DQ[21], DQOUT[21], oe);  // ../sdr_sdram.v(90)
  bufif1 u12 (DQ[20], DQOUT[20], oe);  // ../sdr_sdram.v(90)
  bufif1 u13 (DQ[19], DQOUT[19], oe);  // ../sdr_sdram.v(90)
  bufif1 u14 (DQ[18], DQOUT[18], oe);  // ../sdr_sdram.v(90)
  bufif1 u15 (DQ[17], DQOUT[17], oe);  // ../sdr_sdram.v(90)
  bufif1 u16 (DQ[16], DQOUT[16], oe);  // ../sdr_sdram.v(90)
  bufif1 u17 (DQ[15], DQOUT[15], oe);  // ../sdr_sdram.v(90)
  bufif1 u18 (DQ[14], DQOUT[14], oe);  // ../sdr_sdram.v(90)
  bufif1 u19 (DQ[13], DQOUT[13], oe);  // ../sdr_sdram.v(90)
  bufif1 u2 (DQ[30], DQOUT[30], oe);  // ../sdr_sdram.v(90)
  bufif1 u20 (DQ[12], DQOUT[12], oe);  // ../sdr_sdram.v(90)
  bufif1 u21 (DQ[11], DQOUT[11], oe);  // ../sdr_sdram.v(90)
  bufif1 u22 (DQ[10], DQOUT[10], oe);  // ../sdr_sdram.v(90)
  bufif1 u23 (DQ[9], DQOUT[9], oe);  // ../sdr_sdram.v(90)
  bufif1 u24 (DQ[8], DQOUT[8], oe);  // ../sdr_sdram.v(90)
  bufif1 u25 (DQ[7], DQOUT[7], oe);  // ../sdr_sdram.v(90)
  bufif1 u26 (DQ[6], DQOUT[6], oe);  // ../sdr_sdram.v(90)
  bufif1 u27 (DQ[5], DQOUT[5], oe);  // ../sdr_sdram.v(90)
  bufif1 u28 (DQ[4], DQOUT[4], oe);  // ../sdr_sdram.v(90)
  bufif1 u29 (DQ[3], DQOUT[3], oe);  // ../sdr_sdram.v(90)
  bufif1 u3 (DQ[29], DQOUT[29], oe);  // ../sdr_sdram.v(90)
  bufif1 u30 (DQ[2], DQOUT[2], oe);  // ../sdr_sdram.v(90)
  bufif1 u31 (DQ[1], DQOUT[1], oe);  // ../sdr_sdram.v(90)
  bufif1 u32 (DQ[0], DQOUT[0], oe);  // ../sdr_sdram.v(90)
  bufif1 u4 (DQ[28], DQOUT[28], oe);  // ../sdr_sdram.v(90)
  bufif1 u5 (DQ[27], DQOUT[27], oe);  // ../sdr_sdram.v(90)
  bufif1 u6 (DQ[26], DQOUT[26], oe);  // ../sdr_sdram.v(90)
  bufif1 u7 (DQ[25], DQOUT[25], oe);  // ../sdr_sdram.v(90)
  bufif1 u8 (DQ[24], DQOUT[24], oe);  // ../sdr_sdram.v(90)
  bufif1 u9 (DQ[23], DQOUT[23], oe);  // ../sdr_sdram.v(90)
  reg_ar_as_w1 \ux_command/CAS_N_reg  (
    .clk(CLK),
    .d(\ux_command/n59 ),
    .en(1'b1),
    .reset(1'b0),
    .set(~RESET_N),
    .q(ICAS_N));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/CKE_reg  (
    .clk(CLK),
    .d(1'b1),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(ICKE));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/CM_ACK_reg  (
    .clk(CLK),
    .d(\ux_command/n19 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(cm_ack));  // ../Command.v(212)
  reg_ar_as_w1 \ux_command/CS_N_reg  (
    .clk(CLK),
    .d(1'b0),
    .en(1'b1),
    .reset(1'b0),
    .set(~RESET_N),
    .q(ICS_N));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/OE_reg  (
    .clk(CLK),
    .d(\ux_command/oe1 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(oe));  // ../Command.v(170)
  reg_ar_as_w1 \ux_command/RAS_N_reg  (
    .clk(CLK),
    .d(\ux_command/n58 ),
    .en(1'b1),
    .reset(1'b0),
    .set(~RESET_N),
    .q(IRAS_N));  // ../Command.v(284)
  reg_sr_as_w1 \ux_command/WE_N_reg  (
    .clk(CLK),
    .d(\ux_command/n50 ),
    .en(1'b1),
    .reset(~\ux_command/u70_sel_is_2_o ),
    .set(~RESET_N),
    .q(IWE_N));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/bankclose_reg  (
    .clk(CLK),
    .d(\ux_command/n61 ),
    .en(~\ux_command/n0 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\ux_command/bankclose ));  // ../Command.v(284)
  reg_ar_ss_w1 \ux_command/command_done_reg  (
    .clk(CLK),
    .d(\ux_command/command_delay [0]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(\ux_command/n19 ),
    .q(\ux_command/command_done ));  // ../Command.v(154)
  not \ux_command/do_load_mode_inv  (\ux_command/do_load_mode_neg , \ux_command/do_load_mode );
  reg_ar_as_w1 \ux_command/do_load_mode_reg  (
    .clk(CLK),
    .d(\ux_command/n16 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_command/do_load_mode ));  // ../Command.v(154)
  reg_ar_as_w1 \ux_command/do_precharge_reg  (
    .clk(CLK),
    .d(\ux_command/n13 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_command/do_precharge ));  // ../Command.v(154)
  reg_ar_as_w1 \ux_command/do_reada_reg  (
    .clk(CLK),
    .d(\ux_command/n6 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_command/do_reada ));  // ../Command.v(154)
  reg_ar_as_w1 \ux_command/do_rw_reg  (
    .clk(CLK),
    .d(\ux_command/n37 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_command/do_rw ));  // ../Command.v(196)
  reg_ar_as_w1 \ux_command/do_writea_reg  (
    .clk(CLK),
    .d(\ux_command/n10 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_command/do_writea ));  // ../Command.v(154)
  eq_w2 \ux_command/eq0  (
    .i0(sc_rc),
    .i1(2'b01),
    .o(\ux_command/n30 ));  // ../Command.v(183)
  eq_w2 \ux_command/eq1  (
    .i0(sc_rc),
    .i1(2'b10),
    .o(\ux_command/n31 ));  // ../Command.v(185)
  eq_w2 \ux_command/eq2  (
    .i0(sc_rc),
    .i1(2'b11),
    .o(\ux_command/n32 ));  // ../Command.v(187)
  binary_mux_s1_w1 \ux_command/mux2_b0  (
    .i0(\ux_command/rw_shift [0]),
    .i1(1'b0),
    .sel(\ux_command/n32 ),
    .o(\ux_command/n33 [0]));  // ../Command.v(188)
  binary_mux_s1_w1 \ux_command/mux2_b1  (
    .i0(\ux_command/rw_shift [1]),
    .i1(1'b1),
    .sel(\ux_command/n32 ),
    .o(\ux_command/n33 [1]));  // ../Command.v(188)
  binary_mux_s1_w1 \ux_command/mux3_b0  (
    .i0(\ux_command/n33 [0]),
    .i1(1'b1),
    .sel(\ux_command/n31 ),
    .o(\ux_command/n34 [0]));  // ../Command.v(188)
  binary_mux_s1_w1 \ux_command/mux3_b1  (
    .i0(\ux_command/n33 [1]),
    .i1(1'b0),
    .sel(\ux_command/n31 ),
    .o(\ux_command/n34 [1]));  // ../Command.v(188)
  binary_mux_s1_w1 \ux_command/mux4_b0  (
    .i0(\ux_command/n34 [0]),
    .i1(\ux_command/rw_shift [0]),
    .sel(\ux_command/n30 ),
    .o(\ux_command/n36 [0]));  // ../Command.v(188)
  binary_mux_s1_w1 \ux_command/mux4_b1  (
    .i0(\ux_command/n34 [1]),
    .i1(\ux_command/rw_shift [1]),
    .sel(\ux_command/n30 ),
    .o(\ux_command/n36 [1]));  // ../Command.v(188)
  binary_mux_s1_w1 \ux_command/mux5_b0  (
    .i0(\ux_command/rw_shift [1]),
    .i1(\ux_command/n36 [0]),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n38 [0]));  // ../Command.v(195)
  binary_mux_s1_w1 \ux_command/mux5_b1  (
    .i0(1'b0),
    .i1(\ux_command/n36 [1]),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n38 [1]));  // ../Command.v(195)
  binary_mux_s1_w1 \ux_command/mux6_b0  (
    .i0(saddr[0]),
    .i1(saddr[8]),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n39 [0]));  // ../Command.v(235)
  binary_mux_s1_w1 \ux_command/mux6_b1  (
    .i0(saddr[1]),
    .i1(saddr[9]),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n39 [1]));  // ../Command.v(235)
  binary_mux_s1_w1 \ux_command/mux6_b10  (
    .i0(ISA[10]),
    .i1(saddr[18]),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n39 [10]));  // ../Command.v(235)
  binary_mux_s1_w1 \ux_command/mux6_b2  (
    .i0(saddr[2]),
    .i1(saddr[10]),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n39 [2]));  // ../Command.v(235)
  binary_mux_s1_w1 \ux_command/mux6_b3  (
    .i0(saddr[3]),
    .i1(saddr[11]),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n39 [3]));  // ../Command.v(235)
  binary_mux_s1_w1 \ux_command/mux6_b4  (
    .i0(saddr[4]),
    .i1(saddr[12]),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n39 [4]));  // ../Command.v(235)
  binary_mux_s1_w1 \ux_command/mux6_b5  (
    .i0(saddr[5]),
    .i1(saddr[13]),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n39 [5]));  // ../Command.v(235)
  binary_mux_s1_w1 \ux_command/mux6_b6  (
    .i0(saddr[6]),
    .i1(saddr[14]),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n39 [6]));  // ../Command.v(235)
  binary_mux_s1_w1 \ux_command/mux6_b7  (
    .i0(saddr[7]),
    .i1(saddr[15]),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n39 [7]));  // ../Command.v(235)
  binary_mux_s1_w1 \ux_command/mux6_b9  (
    .i0(ISA[9]),
    .i1(saddr[17]),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n39 [9]));  // ../Command.v(235)
  binary_mux_s1_w1 \ux_command/mux7_b0  (
    .i0(saddr[19]),
    .i1(1'b0),
    .sel(\ux_command/do_load_mode ),
    .o(\ux_command/n42 [0]));  // ../Command.v(245)
  binary_mux_s1_w1 \ux_command/mux7_b1  (
    .i0(saddr[20]),
    .i1(1'b0),
    .sel(\ux_command/do_load_mode ),
    .o(\ux_command/n42 [1]));  // ../Command.v(245)
  binary_mux_s1_w1 \ux_command/mux8_b0  (
    .i0(\ux_command/n39 [9]),
    .i1(saddr[9]),
    .sel(\ux_command/do_load_mode ),
    .o(\ux_command/n41 [0]));  // ../Command.v(241)
  not \ux_command/n17_inv  (\ux_command/n17_neg , \ux_command/n17 );
  not \ux_command/n44_inv  (\ux_command/n44_neg , \ux_command/n44 );
  not \ux_command/n45_inv  (\ux_command/n45_neg , \ux_command/n45 );
  reg_ar_ss_w1 \ux_command/oe1_reg  (
    .clk(CLK),
    .d(1'b0),
    .en(\ux_command/n27 ),
    .reset(~RESET_N),
    .set(\ux_command/do_writea ),
    .q(\ux_command/oe1 ));  // ../Command.v(170)
  reg_ar_ss_w1 \ux_command/reg0_b0  (
    .clk(CLK),
    .d(\ux_command/command_delay [1]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(\ux_command/n19 ),
    .q(\ux_command/command_delay [0]));  // ../Command.v(154)
  reg_ar_ss_w1 \ux_command/reg0_b1  (
    .clk(CLK),
    .d(\ux_command/command_delay [2]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(\ux_command/n19 ),
    .q(\ux_command/command_delay [1]));  // ../Command.v(154)
  reg_ar_ss_w1 \ux_command/reg0_b2  (
    .clk(CLK),
    .d(\ux_command/command_delay [3]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(\ux_command/n19 ),
    .q(\ux_command/command_delay [2]));  // ../Command.v(154)
  reg_ar_ss_w1 \ux_command/reg0_b3  (
    .clk(CLK),
    .d(\ux_command/command_delay [4]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(\ux_command/n19 ),
    .q(\ux_command/command_delay [3]));  // ../Command.v(154)
  reg_ar_ss_w1 \ux_command/reg0_b4  (
    .clk(CLK),
    .d(\ux_command/command_delay [5]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(\ux_command/n19 ),
    .q(\ux_command/command_delay [4]));  // ../Command.v(154)
  reg_ar_ss_w1 \ux_command/reg0_b5  (
    .clk(CLK),
    .d(\ux_command/command_delay [6]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(\ux_command/n19 ),
    .q(\ux_command/command_delay [5]));  // ../Command.v(154)
  reg_ar_ss_w1 \ux_command/reg0_b6  (
    .clk(CLK),
    .d(cm_ack),
    .en(1'b1),
    .reset(~RESET_N),
    .set(\ux_command/n19 ),
    .q(\ux_command/command_delay [6]));  // ../Command.v(154)
  reg_ar_ss_w1 \ux_command/reg1_b0  (
    .clk(CLK),
    .d(\ux_command/rp_shift [1]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(\ux_command/n24 ),
    .q(\ux_command/rp_shift [0]));  // ../Command.v(154)
  reg_ar_ss_w1 \ux_command/reg1_b1  (
    .clk(CLK),
    .d(\ux_command/rp_shift [2]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(\ux_command/n24 ),
    .q(\ux_command/rp_shift [1]));  // ../Command.v(154)
  reg_ar_ss_w1 \ux_command/reg1_b2  (
    .clk(CLK),
    .d(\ux_command/rp_shift [3]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(\ux_command/n24 ),
    .q(\ux_command/rp_shift [2]));  // ../Command.v(154)
  reg_ar_as_w1 \ux_command/reg1_b3  (
    .clk(CLK),
    .d(\ux_command/n24 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_command/rp_shift [3]));  // ../Command.v(154)
  reg_ar_as_w1 \ux_command/reg2_b0  (
    .clk(CLK),
    .d(\ux_command/n38 [0]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_command/rw_shift [0]));  // ../Command.v(196)
  reg_ar_as_w1 \ux_command/reg2_b1  (
    .clk(CLK),
    .d(\ux_command/n38 [1]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_command/rw_shift [1]));  // ../Command.v(196)
  reg_ar_as_w1 \ux_command/reg3_b0  (
    .clk(CLK),
    .d(\ux_command/n39 [0]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(ISA[0]));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/reg3_b1  (
    .clk(CLK),
    .d(\ux_command/n39 [1]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(ISA[1]));  // ../Command.v(284)
  reg_ar_ss_w1 \ux_command/reg3_b10  (
    .clk(CLK),
    .d(\ux_command/n40 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(\ux_command/do_load_mode ),
    .q(ISA[10]));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/reg3_b2  (
    .clk(CLK),
    .d(\ux_command/n39 [2]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(ISA[2]));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/reg3_b3  (
    .clk(CLK),
    .d(\ux_command/n39 [3]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(ISA[3]));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/reg3_b4  (
    .clk(CLK),
    .d(\ux_command/n39 [4]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(ISA[4]));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/reg3_b5  (
    .clk(CLK),
    .d(\ux_command/n39 [5]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(ISA[5]));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/reg3_b6  (
    .clk(CLK),
    .d(\ux_command/n39 [6]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(ISA[6]));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/reg3_b7  (
    .clk(CLK),
    .d(\ux_command/n39 [7]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(ISA[7]));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/reg3_b8  (
    .clk(CLK),
    .d(saddr[16]),
    .en(\ux_command/n17 ),
    .reset(~RESET_N),
    .set(1'b0),
    .q(ISA[8]));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/reg3_b9  (
    .clk(CLK),
    .d(\ux_command/n41 [0]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(ISA[9]));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/reg4_b0  (
    .clk(CLK),
    .d(\ux_command/n42 [0]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(IBA[0]));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/reg4_b1  (
    .clk(CLK),
    .d(\ux_command/n42 [1]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(IBA[1]));  // ../Command.v(284)
  reg_ar_as_w1 \ux_command/rp_done_reg  (
    .clk(CLK),
    .d(\ux_command/n26 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_command/rp_done ));  // ../Command.v(154)
  reg_ar_as_w1 \ux_command/rw_flag_reg  (
    .clk(CLK),
    .d(\ux_command/do_reada ),
    .en(\ux_command/n19 ),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_command/rw_flag ));  // ../Command.v(154)
  and \ux_command/u10  (\ux_command/n6 , \ux_command/n4 , \ux_command/n5 );  // ../Command.v(103)
  and \ux_command/u12  (\ux_command/n7 , writea, \ux_command/n1 );  // ../Command.v(108)
  not \ux_command/u13  (\ux_command/n8 , \ux_command/do_writea );  // ../Command.v(108)
  and \ux_command/u14  (\ux_command/n9 , \ux_command/n7 , \ux_command/n8 );  // ../Command.v(108)
  and \ux_command/u16  (\ux_command/n10 , \ux_command/n9 , \ux_command/n5 );  // ../Command.v(108)
  and \ux_command/u18  (\ux_command/n11 , precharge, \ux_command/n1 );  // ../Command.v(119)
  not \ux_command/u19  (\ux_command/n12 , \ux_command/do_precharge );  // ../Command.v(119)
  and \ux_command/u20  (\ux_command/n13 , \ux_command/n11 , \ux_command/n12 );  // ../Command.v(119)
  and \ux_command/u22  (\ux_command/n14 , load_mode, \ux_command/n1 );  // ../Command.v(124)
  and \ux_command/u24  (\ux_command/n16 , \ux_command/n14 , \ux_command/do_load_mode_neg );  // ../Command.v(124)
  or \ux_command/u25  (\ux_command/n17 , \ux_command/do_reada , \ux_command/do_writea );  // ../Command.v(129)
  or \ux_command/u26  (\ux_command/n18 , \ux_command/n17 , \ux_command/do_precharge );  // ../Command.v(129)
  or \ux_command/u27  (\ux_command/n19 , \ux_command/n18 , \ux_command/do_load_mode );  // ../Command.v(129)
  not \ux_command/u30  (\ux_command/n23 , \ux_command/command_delay [0]);  // ../Command.v(143)
  and \ux_command/u31  (\ux_command/n24 , \ux_command/n23 , \ux_command/command_done );  // ../Command.v(143)
  AL_MUX \ux_command/u32  (
    .i0(\ux_command/rp_shift [0]),
    .i1(1'b0),
    .sel(\ux_command/n24 ),
    .o(\ux_command/n26 ));  // ../Command.v(153)
  or \ux_command/u35  (\ux_command/n27 , \ux_command/do_precharge , \ux_command/do_reada );  // ../Command.v(167)
  not \ux_command/u4  (\ux_command/n0 , RESET_N);  // ../Command.v(88)
  AL_MUX \ux_command/u40  (
    .i0(\ux_command/do_rw ),
    .i1(1'b1),
    .sel(\ux_command/n30 ),
    .o(\ux_command/n35 ));  // ../Command.v(188)
  AL_MUX \ux_command/u41  (
    .i0(\ux_command/rw_shift [0]),
    .i1(\ux_command/n35 ),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n37 ));  // ../Command.v(195)
  AL_MUX \ux_command/u48  (
    .i0(\ux_command/n39 [10]),
    .i1(1'b0),
    .sel(\ux_command/bankclose ),
    .o(\ux_command/n40 ));  // ../Command.v(237)
  or \ux_command/u49  (\ux_command/n43 , \ux_command/oe1 , \ux_command/rw_flag );  // ../Command.v(247)
  not \ux_command/u5  (\ux_command/n1 , \ux_command/command_done );  // ../Command.v(103)
  and \ux_command/u50  (\ux_command/n44 , \ux_command/do_precharge , \ux_command/n43 );  // ../Command.v(247)
  or \ux_command/u51  (\ux_command/n45 , \ux_command/do_precharge , \ux_command/bankclose );  // ../Command.v(253)
  not \ux_command/u56  (\ux_command/n46 , \ux_command/do_rw );  // ../Command.v(283)
  AL_MUX \ux_command/u59  (
    .i0(\ux_command/n46 ),
    .i1(1'b1),
    .sel(\ux_command/n17 ),
    .o(\ux_command/n49 ));  // ../Command.v(283)
  and \ux_command/u6  (\ux_command/n2 , reada, \ux_command/n1 );  // ../Command.v(103)
  AL_MUX \ux_command/u60  (
    .i0(1'b1),
    .i1(\ux_command/rw_flag ),
    .sel(\ux_command/u60_sel_is_2_o ),
    .o(\ux_command/n50 ));
  and \ux_command/u60_sel_is_2  (\ux_command/u60_sel_is_2_o , \ux_command/n17_neg , \ux_command/do_rw );
  AL_MUX \ux_command/u62  (
    .i0(\ux_command/n49 ),
    .i1(1'b0),
    .sel(\ux_command/do_load_mode ),
    .o(\ux_command/n52 ));  // ../Command.v(283)
  AL_MUX \ux_command/u64  (
    .i0(1'b0),
    .i1(\ux_command/n17_neg ),
    .sel(\ux_command/u64_sel_is_0_o ),
    .o(\ux_command/n54 ));
  and \ux_command/u64_sel_is_0  (\ux_command/u64_sel_is_0_o , \ux_command/n45_neg , \ux_command/do_load_mode_neg );
  AL_MUX \ux_command/u67  (
    .i0(\ux_command/bankclose ),
    .i1(1'b0),
    .sel(\ux_command/n45 ),
    .o(\ux_command/n57 ));  // ../Command.v(283)
  AL_MUX \ux_command/u68  (
    .i0(\ux_command/n54 ),
    .i1(1'b1),
    .sel(\ux_command/n44 ),
    .o(\ux_command/n58 ));  // ../Command.v(283)
  AL_MUX \ux_command/u69  (
    .i0(1'b1),
    .i1(\ux_command/n52 ),
    .sel(\ux_command/u69_sel_is_0_o ),
    .o(\ux_command/n59 ));
  and \ux_command/u69_sel_is_0  (\ux_command/u69_sel_is_0_o , \ux_command/n44_neg , \ux_command/n45_neg );
  not \ux_command/u7  (\ux_command/n3 , \ux_command/do_reada );  // ../Command.v(103)
  and \ux_command/u70_sel_is_2  (\ux_command/u70_sel_is_2_o , \ux_command/n44_neg , \ux_command/u64_sel_is_0_o );
  AL_MUX \ux_command/u71  (
    .i0(\ux_command/n57 ),
    .i1(1'b1),
    .sel(\ux_command/n44 ),
    .o(\ux_command/n61 ));  // ../Command.v(283)
  and \ux_command/u8  (\ux_command/n4 , \ux_command/n2 , \ux_command/n3 );  // ../Command.v(103)
  not \ux_command/u9  (\ux_command/n5 , \ux_command/rp_done );  // ../Command.v(103)
  reg_ar_as_w1 \ux_control/CMD_ACK_int_reg  (
    .clk(CLK),
    .d(\ux_control/n20 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(CMDACK));  // ../control_interface.v(146)
  reg_ar_as_w1 \ux_control/LOAD_MODE_reg  (
    .clk(CLK),
    .d(\ux_control/n5 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(load_mode));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/LOAD_REG1_reg  (
    .clk(CLK),
    .d(\ux_control/n8 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_control/LOAD_REG1 ));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/LOAD_REG2_reg  (
    .clk(CLK),
    .d(\ux_control/n11 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_control/LOAD_REG2 ));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/PRECHARGE_reg  (
    .clk(CLK),
    .d(\ux_control/n4 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(precharge));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/READA_reg  (
    .clk(CLK),
    .d(\ux_control/n2 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(reada));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/WRITEA_reg  (
    .clk(CLK),
    .d(\ux_control/n3 ),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(writea));  // ../control_interface.v(107)
  eq_w3 \ux_control/eq1  (
    .i0(CMD),
    .i1(3'b001),
    .o(\ux_control/n2 ));  // ../control_interface.v(77)
  eq_w3 \ux_control/eq2  (
    .i0(CMD),
    .i1(3'b010),
    .o(\ux_control/n3 ));  // ../control_interface.v(82)
  eq_w3 \ux_control/eq3  (
    .i0(CMD),
    .i1(3'b100),
    .o(\ux_control/n4 ));  // ../control_interface.v(88)
  eq_w3 \ux_control/eq4  (
    .i0(CMD),
    .i1(3'b101),
    .o(\ux_control/n5 ));  // ../control_interface.v(93)
  eq_w3 \ux_control/eq5  (
    .i0(CMD),
    .i1(3'b110),
    .o(\ux_control/n6 ));  // ../control_interface.v(98)
  eq_w3 \ux_control/eq6  (
    .i0(CMD),
    .i1(3'b111),
    .o(\ux_control/n9 ));  // ../control_interface.v(103)
  reg_ar_as_w1 \ux_control/reg0_b0  (
    .clk(CLK),
    .d(ADDR[0]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[0]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b1  (
    .clk(CLK),
    .d(ADDR[1]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[1]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b10  (
    .clk(CLK),
    .d(ADDR[10]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[10]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b11  (
    .clk(CLK),
    .d(ADDR[11]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[11]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b12  (
    .clk(CLK),
    .d(ADDR[12]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[12]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b13  (
    .clk(CLK),
    .d(ADDR[13]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[13]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b14  (
    .clk(CLK),
    .d(ADDR[14]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[14]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b15  (
    .clk(CLK),
    .d(ADDR[15]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[15]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b16  (
    .clk(CLK),
    .d(ADDR[16]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[16]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b17  (
    .clk(CLK),
    .d(ADDR[17]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[17]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b18  (
    .clk(CLK),
    .d(ADDR[18]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[18]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b19  (
    .clk(CLK),
    .d(ADDR[19]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[19]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b2  (
    .clk(CLK),
    .d(ADDR[2]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[2]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b20  (
    .clk(CLK),
    .d(ADDR[20]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[20]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b3  (
    .clk(CLK),
    .d(ADDR[3]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[3]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b4  (
    .clk(CLK),
    .d(ADDR[4]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[4]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b5  (
    .clk(CLK),
    .d(ADDR[5]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[5]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b6  (
    .clk(CLK),
    .d(ADDR[6]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[6]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b7  (
    .clk(CLK),
    .d(ADDR[7]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[7]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b8  (
    .clk(CLK),
    .d(ADDR[8]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[8]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg0_b9  (
    .clk(CLK),
    .d(ADDR[9]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(saddr[9]));  // ../control_interface.v(107)
  reg_ar_as_w1 \ux_control/reg2_b0  (
    .clk(CLK),
    .d(saddr[2]),
    .en(\ux_control/LOAD_REG1 ),
    .reset(~RESET_N),
    .set(1'b0),
    .q(sc_rc[0]));  // ../control_interface.v(130)
  reg_ar_as_w1 \ux_control/reg2_b1  (
    .clk(CLK),
    .d(saddr[3]),
    .en(\ux_control/LOAD_REG1 ),
    .reset(~RESET_N),
    .set(1'b0),
    .q(sc_rc[1]));  // ../control_interface.v(130)
  or \ux_control/u19  (\ux_control/n17 , cm_ack, \ux_control/LOAD_REG1 );  // ../control_interface.v(142)
  or \ux_control/u21  (\ux_control/n18 , \ux_control/n17 , \ux_control/LOAD_REG2 );  // ../control_interface.v(142)
  not \ux_control/u22  (\ux_control/n19 , CMDACK);  // ../control_interface.v(142)
  and \ux_control/u23  (\ux_control/n20 , \ux_control/n18 , \ux_control/n19 );  // ../control_interface.v(142)
  not \ux_control/u6  (\ux_control/n7 , \ux_control/LOAD_REG1 );  // ../control_interface.v(98)
  and \ux_control/u7  (\ux_control/n8 , \ux_control/n6 , \ux_control/n7 );  // ../control_interface.v(98)
  not \ux_control/u8  (\ux_control/n10 , \ux_control/LOAD_REG2 );  // ../control_interface.v(103)
  and \ux_control/u9  (\ux_control/n11 , \ux_control/n9 , \ux_control/n10 );  // ../control_interface.v(103)
  reg_ar_as_w1 \ux_data_path/reg0_b0  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [0]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[0]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b1  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [1]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[1]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b10  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [10]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[10]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b11  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [11]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[11]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b12  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [12]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[12]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b13  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [13]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[13]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b14  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [14]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[14]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b15  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [15]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[15]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b16  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [16]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[16]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b17  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [17]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[17]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b18  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [18]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[18]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b19  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [19]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[19]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b2  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [2]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[2]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b20  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [20]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[20]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b21  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [21]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[21]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b22  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [22]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[22]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b23  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [23]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[23]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b24  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [24]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[24]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b25  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [25]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[25]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b26  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [26]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[26]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b27  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [27]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[27]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b28  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [28]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[28]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b29  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [29]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[29]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b3  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [3]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[3]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b30  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [30]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[30]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b31  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [31]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[31]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b4  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [4]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[4]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b5  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [5]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[5]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b6  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [6]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[6]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b7  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [7]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[7]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b8  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [8]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[8]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg0_b9  (
    .clk(CLK),
    .d(\ux_data_path/DIN1 [9]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(DQOUT[9]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b0  (
    .clk(CLK),
    .d(DATAIN[0]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [0]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b1  (
    .clk(CLK),
    .d(DATAIN[1]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [1]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b10  (
    .clk(CLK),
    .d(DATAIN[10]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [10]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b11  (
    .clk(CLK),
    .d(DATAIN[11]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [11]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b12  (
    .clk(CLK),
    .d(DATAIN[12]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [12]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b13  (
    .clk(CLK),
    .d(DATAIN[13]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [13]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b14  (
    .clk(CLK),
    .d(DATAIN[14]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [14]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b15  (
    .clk(CLK),
    .d(DATAIN[15]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [15]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b16  (
    .clk(CLK),
    .d(DATAIN[16]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [16]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b17  (
    .clk(CLK),
    .d(DATAIN[17]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [17]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b18  (
    .clk(CLK),
    .d(DATAIN[18]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [18]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b19  (
    .clk(CLK),
    .d(DATAIN[19]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [19]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b2  (
    .clk(CLK),
    .d(DATAIN[2]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [2]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b20  (
    .clk(CLK),
    .d(DATAIN[20]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [20]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b21  (
    .clk(CLK),
    .d(DATAIN[21]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [21]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b22  (
    .clk(CLK),
    .d(DATAIN[22]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [22]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b23  (
    .clk(CLK),
    .d(DATAIN[23]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [23]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b24  (
    .clk(CLK),
    .d(DATAIN[24]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [24]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b25  (
    .clk(CLK),
    .d(DATAIN[25]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [25]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b26  (
    .clk(CLK),
    .d(DATAIN[26]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [26]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b27  (
    .clk(CLK),
    .d(DATAIN[27]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [27]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b28  (
    .clk(CLK),
    .d(DATAIN[28]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [28]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b29  (
    .clk(CLK),
    .d(DATAIN[29]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [29]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b3  (
    .clk(CLK),
    .d(DATAIN[3]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [3]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b30  (
    .clk(CLK),
    .d(DATAIN[30]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [30]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b31  (
    .clk(CLK),
    .d(DATAIN[31]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [31]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b4  (
    .clk(CLK),
    .d(DATAIN[4]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [4]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b5  (
    .clk(CLK),
    .d(DATAIN[5]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [5]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b6  (
    .clk(CLK),
    .d(DATAIN[6]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [6]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b7  (
    .clk(CLK),
    .d(DATAIN[7]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [7]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b8  (
    .clk(CLK),
    .d(DATAIN[8]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [8]));  // ../sdr_data_path.v(44)
  reg_ar_as_w1 \ux_data_path/reg1_b9  (
    .clk(CLK),
    .d(DATAIN[9]),
    .en(1'b1),
    .reset(~RESET_N),
    .set(1'b0),
    .q(\ux_data_path/DIN1 [9]));  // ../sdr_data_path.v(44)

endmodule 

module \seg4(CNT_TIME=24000000)   // seg_4.v(14)
  (
  clk_24m,
  rst_n,
  sm_bit_num,
  sm_bit,
  sm_seg
  );

  input clk_24m;  // seg_4.v(19)
  input rst_n;  // seg_4.v(20)
  input [31:0] sm_bit_num;  // seg_4.v(21)
  output [3:0] sm_bit;  // seg_4.v(23)
  output [7:0] sm_seg;  // seg_4.v(22)

  parameter CNT_TIME = 24000000;
  // localparam S0 = 4'b0000;
  // localparam S1 = 4'b0001;
  // localparam S2 = 4'b0010;
  // localparam S3 = 4'b0011;
  // localparam S4 = 4'b0100;
  // localparam S5 = 4'b0101;
  // localparam S6 = 4'b0110;
  // localparam S7 = 4'b0111;
  // localparam S8 = 4'b1000;
  // localparam S9 = 4'b1001;
  wire [24:0] cnt;  // seg_4.v(27)
  wire [17:0] cnt_w;  // seg_4.v(33)
  wire [17:0] n13;
  wire [17:0] n14;
  wire [3:0] n15;
  wire [24:0] n2;
  wire [24:0] n3;
  wire [3:0] sm_bit1_num;  // seg_4.v(28)
  wire [3:0] sm_bit2_num;  // seg_4.v(29)
  wire [3:0] sm_bit3_num;  // seg_4.v(30)
  wire [3:0] sm_bit4_num;  // seg_4.v(31)
  wire [3:0] sm_seg_num;  // seg_4.v(36)
  wire \cnt_w[16]_neg ;
  wire \cnt_w[17]_neg ;
  wire mux11_b0_sel_is_0_o;
  wire mux11_b1_sel_is_1_o;
  wire mux11_b2_sel_is_2_o;
  wire mux11_b3_sel_is_3_o;
  wire mux12_b2_sel_is_2_o;
  wire mux5_b0_sel_is_2_o;
  wire n1;
  wire n12;
  wire \sm_seg_num[0]_neg ;
  wire \sm_seg_num[2]_neg ;
  wire \sm_seg_num[3]_neg ;

  assign sm_seg[7] = 1'b1;
  add_pu25_pu25_o25 add0 (
    .i0(cnt),
    .i1(25'b0000000000000000000000001),
    .o(n2));  // seg_4.v(63)
  add_pu18_pu18_o18 add1 (
    .i0(cnt_w),
    .i1(18'b000000000000000001),
    .o(n13));  // seg_4.v(76)
  not \cnt_w[16]_inv  (\cnt_w[16]_neg , cnt_w[16]);
  not \cnt_w[17]_inv  (\cnt_w[17]_neg , cnt_w[17]);
  eq_w25 eq0 (
    .i0(cnt),
    .i1(25'b1011011100011011000000000),
    .o(n1));  // seg_4.v(54)
  eq_w18 eq1 (
    .i0(cnt_w),
    .i1(18'b111111111111111111),
    .o(n12));  // seg_4.v(73)
  binary_mux_s1_w1 mux0_b0 (
    .i0(n2[0]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[0]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b1 (
    .i0(n2[1]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[1]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b10 (
    .i0(n2[10]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[10]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b11 (
    .i0(n2[11]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[11]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b12 (
    .i0(n2[12]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[12]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b13 (
    .i0(n2[13]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[13]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b14 (
    .i0(n2[14]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[14]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b15 (
    .i0(n2[15]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[15]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b16 (
    .i0(n2[16]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[16]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b17 (
    .i0(n2[17]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[17]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b18 (
    .i0(n2[18]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[18]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b19 (
    .i0(n2[19]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[19]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b2 (
    .i0(n2[2]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[2]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b20 (
    .i0(n2[20]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[20]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b21 (
    .i0(n2[21]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[21]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b22 (
    .i0(n2[22]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[22]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b23 (
    .i0(n2[23]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[23]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b24 (
    .i0(n2[24]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[24]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b3 (
    .i0(n2[3]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[3]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b4 (
    .i0(n2[4]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[4]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b5 (
    .i0(n2[5]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[5]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b6 (
    .i0(n2[6]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[6]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b7 (
    .i0(n2[7]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[7]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b8 (
    .i0(n2[8]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[8]));  // seg_4.v(63)
  binary_mux_s1_w1 mux0_b9 (
    .i0(n2[9]),
    .i1(1'b0),
    .sel(n1),
    .o(n3[9]));  // seg_4.v(63)
  binary_mux_s2_w1 mux10_b0 (
    .i0(sm_bit1_num[0]),
    .i1(sm_bit2_num[0]),
    .i2(sm_bit3_num[0]),
    .i3(sm_bit4_num[0]),
    .sel(cnt_w[17:16]),
    .o(n15[0]));  // seg_4.v(90)
  binary_mux_s2_w1 mux10_b1 (
    .i0(sm_bit1_num[1]),
    .i1(sm_bit2_num[1]),
    .i2(sm_bit3_num[1]),
    .i3(sm_bit4_num[1]),
    .sel(cnt_w[17:16]),
    .o(n15[1]));  // seg_4.v(90)
  binary_mux_s2_w1 mux10_b2 (
    .i0(sm_bit1_num[2]),
    .i1(sm_bit2_num[2]),
    .i2(sm_bit3_num[2]),
    .i3(sm_bit4_num[2]),
    .sel(cnt_w[17:16]),
    .o(n15[2]));  // seg_4.v(90)
  binary_mux_s2_w1 mux10_b3 (
    .i0(sm_bit1_num[3]),
    .i1(sm_bit2_num[3]),
    .i2(sm_bit3_num[3]),
    .i3(sm_bit4_num[3]),
    .sel(cnt_w[17:16]),
    .o(n15[3]));  // seg_4.v(90)
  and mux11_b0_sel_is_0 (mux11_b0_sel_is_0_o, \cnt_w[16]_neg , \cnt_w[17]_neg );
  and mux11_b1_sel_is_1 (mux11_b1_sel_is_1_o, cnt_w[16], \cnt_w[17]_neg );
  and mux11_b2_sel_is_2 (mux11_b2_sel_is_2_o, \cnt_w[16]_neg , cnt_w[17]);
  and mux11_b3_sel_is_3 (mux11_b3_sel_is_3_o, cnt_w[16], cnt_w[17]);
  binary_mux_s4_w1 mux12_b0 (
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
    .sel(sm_seg_num),
    .o(sm_seg[0]));  // seg_4.v(133)
  binary_mux_s4_w1 mux12_b1 (
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
    .sel(sm_seg_num),
    .o(sm_seg[1]));  // seg_4.v(133)
  AL_MUX mux12_b2 (
    .i0(1'b0),
    .i1(1'b1),
    .sel(mux12_b2_sel_is_2_o),
    .o(sm_seg[2]));
  and mux12_b2_sel_is_2 (mux12_b2_sel_is_2_o, \sm_seg_num[0]_neg , sm_seg_num[1], \sm_seg_num[2]_neg , \sm_seg_num[3]_neg );
  binary_mux_s4_w1 mux12_b3 (
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
    .sel(sm_seg_num),
    .o(sm_seg[3]));  // seg_4.v(133)
  binary_mux_s4_w1 mux12_b4 (
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
    .sel(sm_seg_num),
    .o(sm_seg[4]));  // seg_4.v(133)
  binary_mux_s4_w1 mux12_b5 (
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
    .sel(sm_seg_num),
    .o(sm_seg[5]));  // seg_4.v(133)
  binary_mux_s4_w1 mux12_b6 (
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
    .sel(sm_seg_num),
    .o(sm_seg[6]));  // seg_4.v(133)
  and mux5_b0_sel_is_2 (mux5_b0_sel_is_2_o, rst_n, n1);
  binary_mux_s1_w1 mux9_b0 (
    .i0(n13[0]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[0]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b1 (
    .i0(n13[1]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[1]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b10 (
    .i0(n13[10]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[10]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b11 (
    .i0(n13[11]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[11]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b12 (
    .i0(n13[12]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[12]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b13 (
    .i0(n13[13]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[13]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b14 (
    .i0(n13[14]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[14]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b15 (
    .i0(n13[15]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[15]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b16 (
    .i0(n13[16]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[16]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b17 (
    .i0(n13[17]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[17]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b2 (
    .i0(n13[2]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[2]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b3 (
    .i0(n13[3]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[3]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b4 (
    .i0(n13[4]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[4]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b5 (
    .i0(n13[5]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[5]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b6 (
    .i0(n13[6]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[6]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b7 (
    .i0(n13[7]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[7]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b8 (
    .i0(n13[8]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[8]));  // seg_4.v(76)
  binary_mux_s1_w1 mux9_b9 (
    .i0(n13[9]),
    .i1(1'b0),
    .sel(n12),
    .o(n14[9]));  // seg_4.v(76)
  reg_ar_as_w1 reg0_b0 (
    .clk(clk_24m),
    .d(sm_bit_num[0]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit1_num[0]));  // seg_4.v(63)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk_24m),
    .d(sm_bit_num[1]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit1_num[1]));  // seg_4.v(63)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk_24m),
    .d(sm_bit_num[2]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit1_num[2]));  // seg_4.v(63)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk_24m),
    .d(sm_bit_num[3]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit1_num[3]));  // seg_4.v(63)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk_24m),
    .d(sm_bit_num[4]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit2_num[0]));  // seg_4.v(63)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk_24m),
    .d(sm_bit_num[5]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit2_num[1]));  // seg_4.v(63)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk_24m),
    .d(sm_bit_num[6]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit2_num[2]));  // seg_4.v(63)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk_24m),
    .d(sm_bit_num[7]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit2_num[3]));  // seg_4.v(63)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk_24m),
    .d(sm_bit_num[8]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit3_num[0]));  // seg_4.v(63)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk_24m),
    .d(sm_bit_num[9]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit3_num[1]));  // seg_4.v(63)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk_24m),
    .d(sm_bit_num[10]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit3_num[2]));  // seg_4.v(63)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk_24m),
    .d(sm_bit_num[11]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit3_num[3]));  // seg_4.v(63)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk_24m),
    .d(sm_bit_num[12]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit4_num[0]));  // seg_4.v(63)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk_24m),
    .d(sm_bit_num[13]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit4_num[1]));  // seg_4.v(63)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk_24m),
    .d(sm_bit_num[14]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit4_num[2]));  // seg_4.v(63)
  reg_ar_as_w1 reg3_b3 (
    .clk(clk_24m),
    .d(sm_bit_num[15]),
    .en(mux5_b0_sel_is_2_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit4_num[3]));  // seg_4.v(63)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk_24m),
    .d(n14[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[0]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk_24m),
    .d(n14[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[1]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b10 (
    .clk(clk_24m),
    .d(n14[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[10]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b11 (
    .clk(clk_24m),
    .d(n14[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[11]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b12 (
    .clk(clk_24m),
    .d(n14[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[12]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b13 (
    .clk(clk_24m),
    .d(n14[13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[13]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b14 (
    .clk(clk_24m),
    .d(n14[14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[14]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b15 (
    .clk(clk_24m),
    .d(n14[15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[15]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b16 (
    .clk(clk_24m),
    .d(n14[16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[16]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b17 (
    .clk(clk_24m),
    .d(n14[17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[17]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b2 (
    .clk(clk_24m),
    .d(n14[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[2]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b3 (
    .clk(clk_24m),
    .d(n14[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[3]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b4 (
    .clk(clk_24m),
    .d(n14[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[4]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b5 (
    .clk(clk_24m),
    .d(n14[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[5]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b6 (
    .clk(clk_24m),
    .d(n14[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[6]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b7 (
    .clk(clk_24m),
    .d(n14[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[7]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b8 (
    .clk(clk_24m),
    .d(n14[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[8]));  // seg_4.v(76)
  reg_ar_as_w1 reg4_b9 (
    .clk(clk_24m),
    .d(n14[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt_w[9]));  // seg_4.v(76)
  reg_ar_as_w1 reg5_b0 (
    .clk(clk_24m),
    .d(n15[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_seg_num[0]));  // seg_4.v(91)
  reg_ar_as_w1 reg5_b1 (
    .clk(clk_24m),
    .d(n15[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_seg_num[1]));  // seg_4.v(91)
  reg_ar_as_w1 reg5_b2 (
    .clk(clk_24m),
    .d(n15[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_seg_num[2]));  // seg_4.v(91)
  reg_ar_as_w1 reg5_b3 (
    .clk(clk_24m),
    .d(n15[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(sm_seg_num[3]));  // seg_4.v(91)
  reg_ar_as_w1 reg6_b0 (
    .clk(clk_24m),
    .d(n3[0]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[0]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b1 (
    .clk(clk_24m),
    .d(n3[1]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[1]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b10 (
    .clk(clk_24m),
    .d(n3[10]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[10]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b11 (
    .clk(clk_24m),
    .d(n3[11]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[11]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b12 (
    .clk(clk_24m),
    .d(n3[12]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[12]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b13 (
    .clk(clk_24m),
    .d(n3[13]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[13]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b14 (
    .clk(clk_24m),
    .d(n3[14]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[14]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b15 (
    .clk(clk_24m),
    .d(n3[15]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[15]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b16 (
    .clk(clk_24m),
    .d(n3[16]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[16]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b17 (
    .clk(clk_24m),
    .d(n3[17]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[17]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b18 (
    .clk(clk_24m),
    .d(n3[18]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[18]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b19 (
    .clk(clk_24m),
    .d(n3[19]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[19]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b2 (
    .clk(clk_24m),
    .d(n3[2]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[2]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b20 (
    .clk(clk_24m),
    .d(n3[20]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[20]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b21 (
    .clk(clk_24m),
    .d(n3[21]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[21]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b22 (
    .clk(clk_24m),
    .d(n3[22]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[22]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b23 (
    .clk(clk_24m),
    .d(n3[23]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[23]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b24 (
    .clk(clk_24m),
    .d(n3[24]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[24]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b3 (
    .clk(clk_24m),
    .d(n3[3]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[3]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b4 (
    .clk(clk_24m),
    .d(n3[4]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[4]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b5 (
    .clk(clk_24m),
    .d(n3[5]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[5]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b6 (
    .clk(clk_24m),
    .d(n3[6]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[6]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b7 (
    .clk(clk_24m),
    .d(n3[7]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[7]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b8 (
    .clk(clk_24m),
    .d(n3[8]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[8]));  // seg_4.v(63)
  reg_ar_as_w1 reg6_b9 (
    .clk(clk_24m),
    .d(n3[9]),
    .en(1'b1),
    .reset(~rst_n),
    .set(1'b0),
    .q(cnt[9]));  // seg_4.v(63)
  reg_sr_as_w1 reg7_b0 (
    .clk(clk_24m),
    .d(1'b1),
    .en(1'b1),
    .reset(mux11_b0_sel_is_0_o),
    .set(~rst_n),
    .q(sm_bit[0]));  // seg_4.v(106)
  reg_sr_as_w1 reg7_b1 (
    .clk(clk_24m),
    .d(1'b1),
    .en(1'b1),
    .reset(mux11_b1_sel_is_1_o),
    .set(~rst_n),
    .q(sm_bit[1]));  // seg_4.v(106)
  reg_sr_as_w1 reg7_b2 (
    .clk(clk_24m),
    .d(1'b1),
    .en(1'b1),
    .reset(mux11_b2_sel_is_2_o),
    .set(~rst_n),
    .q(sm_bit[2]));  // seg_4.v(106)
  reg_sr_as_w1 reg7_b3 (
    .clk(clk_24m),
    .d(1'b1),
    .en(1'b1),
    .reset(mux11_b3_sel_is_3_o),
    .set(~rst_n),
    .q(sm_bit[3]));  // seg_4.v(106)
  not \sm_seg_num[0]_inv  (\sm_seg_num[0]_neg , sm_seg_num[0]);
  not \sm_seg_num[2]_inv  (\sm_seg_num[2]_neg , sm_seg_num[2]);
  not \sm_seg_num[3]_inv  (\sm_seg_num[3]_neg , sm_seg_num[3]);

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

  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[1]_i1[1]_o ;

  not none_diff (o, \or_xor_i0[0]_i1[0]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);

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

  wire \or_or_or_or_xor_i0[0_o ;
  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_or_xor_i0[12]__o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[12]_i1[_o ;
  wire \or_or_xor_i0[18]_i1[_o ;
  wire \or_or_xor_i0[21]_i1[_o ;
  wire \or_or_xor_i0[6]_i1[6_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[10]_i1[10]_o ;
  wire \or_xor_i0[12]_i1[12]_o ;
  wire \or_xor_i0[13]_i1[13]_o ;
  wire \or_xor_i0[15]_i1[15]_o ;
  wire \or_xor_i0[16]_i1[16]_o ;
  wire \or_xor_i0[18]_i1[18]_o ;
  wire \or_xor_i0[19]_i1[19]_o ;
  wire \or_xor_i0[1]_i1[1]_o_o ;
  wire \or_xor_i0[21]_i1[21]_o ;
  wire \or_xor_i0[23]_i1[23]_o ;
  wire \or_xor_i0[3]_i1[3]_o_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \or_xor_i0[7]_i1[7]_o_o ;
  wire \or_xor_i0[9]_i1[9]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[10]_i1[10]_o ;
  wire \xor_i0[11]_i1[11]_o ;
  wire \xor_i0[12]_i1[12]_o ;
  wire \xor_i0[13]_i1[13]_o ;
  wire \xor_i0[14]_i1[14]_o ;
  wire \xor_i0[15]_i1[15]_o ;
  wire \xor_i0[16]_i1[16]_o ;
  wire \xor_i0[17]_i1[17]_o ;
  wire \xor_i0[18]_i1[18]_o ;
  wire \xor_i0[19]_i1[19]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[20]_i1[20]_o ;
  wire \xor_i0[21]_i1[21]_o ;
  wire \xor_i0[22]_i1[22]_o ;
  wire \xor_i0[23]_i1[23]_o ;
  wire \xor_i0[24]_i1[24]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, \or_or_or_or_xor_i0[0_o );
  or \or_or_or_or_xor_i0[0  (\or_or_or_or_xor_i0[0_o , \or_or_or_xor_i0[0]_i_o , \or_or_or_xor_i0[12]__o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[6]_i1[6_o );
  or \or_or_or_xor_i0[12]_  (\or_or_or_xor_i0[12]__o , \or_or_xor_i0[12]_i1[_o , \or_or_xor_i0[18]_i1[_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[3]_i1[3]_o_o );
  or \or_or_xor_i0[12]_i1[  (\or_or_xor_i0[12]_i1[_o , \or_xor_i0[12]_i1[12]_o , \or_xor_i0[15]_i1[15]_o );
  or \or_or_xor_i0[18]_i1[  (\or_or_xor_i0[18]_i1[_o , \or_xor_i0[18]_i1[18]_o , \or_or_xor_i0[21]_i1[_o );
  or \or_or_xor_i0[21]_i1[  (\or_or_xor_i0[21]_i1[_o , \or_xor_i0[21]_i1[21]_o , \or_xor_i0[23]_i1[23]_o );
  or \or_or_xor_i0[6]_i1[6  (\or_or_xor_i0[6]_i1[6_o , \or_xor_i0[6]_i1[6]_o_o , \or_xor_i0[9]_i1[9]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \or_xor_i0[1]_i1[1]_o_o );
  or \or_xor_i0[10]_i1[10]  (\or_xor_i0[10]_i1[10]_o , \xor_i0[10]_i1[10]_o , \xor_i0[11]_i1[11]_o );
  or \or_xor_i0[12]_i1[12]  (\or_xor_i0[12]_i1[12]_o , \xor_i0[12]_i1[12]_o , \or_xor_i0[13]_i1[13]_o );
  or \or_xor_i0[13]_i1[13]  (\or_xor_i0[13]_i1[13]_o , \xor_i0[13]_i1[13]_o , \xor_i0[14]_i1[14]_o );
  or \or_xor_i0[15]_i1[15]  (\or_xor_i0[15]_i1[15]_o , \xor_i0[15]_i1[15]_o , \or_xor_i0[16]_i1[16]_o );
  or \or_xor_i0[16]_i1[16]  (\or_xor_i0[16]_i1[16]_o , \xor_i0[16]_i1[16]_o , \xor_i0[17]_i1[17]_o );
  or \or_xor_i0[18]_i1[18]  (\or_xor_i0[18]_i1[18]_o , \xor_i0[18]_i1[18]_o , \or_xor_i0[19]_i1[19]_o );
  or \or_xor_i0[19]_i1[19]  (\or_xor_i0[19]_i1[19]_o , \xor_i0[19]_i1[19]_o , \xor_i0[20]_i1[20]_o );
  or \or_xor_i0[1]_i1[1]_o  (\or_xor_i0[1]_i1[1]_o_o , \xor_i0[1]_i1[1]_o , \xor_i0[2]_i1[2]_o );
  or \or_xor_i0[21]_i1[21]  (\or_xor_i0[21]_i1[21]_o , \xor_i0[21]_i1[21]_o , \xor_i0[22]_i1[22]_o );
  or \or_xor_i0[23]_i1[23]  (\or_xor_i0[23]_i1[23]_o , \xor_i0[23]_i1[23]_o , \xor_i0[24]_i1[24]_o );
  or \or_xor_i0[3]_i1[3]_o  (\or_xor_i0[3]_i1[3]_o_o , \xor_i0[3]_i1[3]_o , \or_xor_i0[4]_i1[4]_o_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \or_xor_i0[7]_i1[7]_o_o );
  or \or_xor_i0[7]_i1[7]_o  (\or_xor_i0[7]_i1[7]_o_o , \xor_i0[7]_i1[7]_o , \xor_i0[8]_i1[8]_o );
  or \or_xor_i0[9]_i1[9]_o  (\or_xor_i0[9]_i1[9]_o_o , \xor_i0[9]_i1[9]_o , \or_xor_i0[10]_i1[10]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (\xor_i0[10]_i1[10]_o , i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (\xor_i0[11]_i1[11]_o , i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (\xor_i0[12]_i1[12]_o , i0[12], i1[12]);
  xor \xor_i0[13]_i1[13]  (\xor_i0[13]_i1[13]_o , i0[13], i1[13]);
  xor \xor_i0[14]_i1[14]  (\xor_i0[14]_i1[14]_o , i0[14], i1[14]);
  xor \xor_i0[15]_i1[15]  (\xor_i0[15]_i1[15]_o , i0[15], i1[15]);
  xor \xor_i0[16]_i1[16]  (\xor_i0[16]_i1[16]_o , i0[16], i1[16]);
  xor \xor_i0[17]_i1[17]  (\xor_i0[17]_i1[17]_o , i0[17], i1[17]);
  xor \xor_i0[18]_i1[18]  (\xor_i0[18]_i1[18]_o , i0[18], i1[18]);
  xor \xor_i0[19]_i1[19]  (\xor_i0[19]_i1[19]_o , i0[19], i1[19]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[20]_i1[20]  (\xor_i0[20]_i1[20]_o , i0[20], i1[20]);
  xor \xor_i0[21]_i1[21]  (\xor_i0[21]_i1[21]_o , i0[21], i1[21]);
  xor \xor_i0[22]_i1[22]  (\xor_i0[22]_i1[22]_o , i0[22], i1[22]);
  xor \xor_i0[23]_i1[23]  (\xor_i0[23]_i1[23]_o , i0[23], i1[23]);
  xor \xor_i0[24]_i1[24]  (\xor_i0[24]_i1[24]_o , i0[24], i1[24]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (\xor_i0[8]_i1[8]_o , i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (\xor_i0[9]_i1[9]_o , i0[9], i1[9]);

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

  wire \or_or_or_or_xor_i0[0_o ;
  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_or_xor_i0[9]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[13]_i1[_o ;
  wire \or_or_xor_i0[4]_i1[4_o ;
  wire \or_or_xor_i0[9]_i1[9_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[11]_i1[11]_o ;
  wire \or_xor_i0[13]_i1[13]_o ;
  wire \or_xor_i0[15]_i1[15]_o ;
  wire \or_xor_i0[16]_i1[16]_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \or_xor_i0[7]_i1[7]_o_o ;
  wire \or_xor_i0[9]_i1[9]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[10]_i1[10]_o ;
  wire \xor_i0[11]_i1[11]_o ;
  wire \xor_i0[12]_i1[12]_o ;
  wire \xor_i0[13]_i1[13]_o ;
  wire \xor_i0[14]_i1[14]_o ;
  wire \xor_i0[15]_i1[15]_o ;
  wire \xor_i0[16]_i1[16]_o ;
  wire \xor_i0[17]_i1[17]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, \or_or_or_or_xor_i0[0_o );
  or \or_or_or_or_xor_i0[0  (\or_or_or_or_xor_i0[0_o , \or_or_or_xor_i0[0]_i_o , \or_or_or_xor_i0[9]_i_o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[4]_i1[4_o );
  or \or_or_or_xor_i0[9]_i  (\or_or_or_xor_i0[9]_i_o , \or_or_xor_i0[9]_i1[9_o , \or_or_xor_i0[13]_i1[_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_or_xor_i0[13]_i1[  (\or_or_xor_i0[13]_i1[_o , \or_xor_i0[13]_i1[13]_o , \or_xor_i0[15]_i1[15]_o );
  or \or_or_xor_i0[4]_i1[4  (\or_or_xor_i0[4]_i1[4_o , \or_xor_i0[4]_i1[4]_o_o , \or_xor_i0[6]_i1[6]_o_o );
  or \or_or_xor_i0[9]_i1[9  (\or_or_xor_i0[9]_i1[9_o , \or_xor_i0[9]_i1[9]_o_o , \or_xor_i0[11]_i1[11]_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[11]_i1[11]  (\or_xor_i0[11]_i1[11]_o , \xor_i0[11]_i1[11]_o , \xor_i0[12]_i1[12]_o );
  or \or_xor_i0[13]_i1[13]  (\or_xor_i0[13]_i1[13]_o , \xor_i0[13]_i1[13]_o , \xor_i0[14]_i1[14]_o );
  or \or_xor_i0[15]_i1[15]  (\or_xor_i0[15]_i1[15]_o , \xor_i0[15]_i1[15]_o , \or_xor_i0[16]_i1[16]_o );
  or \or_xor_i0[16]_i1[16]  (\or_xor_i0[16]_i1[16]_o , \xor_i0[16]_i1[16]_o , \xor_i0[17]_i1[17]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \xor_i0[3]_i1[3]_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \or_xor_i0[7]_i1[7]_o_o );
  or \or_xor_i0[7]_i1[7]_o  (\or_xor_i0[7]_i1[7]_o_o , \xor_i0[7]_i1[7]_o , \xor_i0[8]_i1[8]_o );
  or \or_xor_i0[9]_i1[9]_o  (\or_xor_i0[9]_i1[9]_o_o , \xor_i0[9]_i1[9]_o , \xor_i0[10]_i1[10]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[10]_i1[10]  (\xor_i0[10]_i1[10]_o , i0[10], i1[10]);
  xor \xor_i0[11]_i1[11]  (\xor_i0[11]_i1[11]_o , i0[11], i1[11]);
  xor \xor_i0[12]_i1[12]  (\xor_i0[12]_i1[12]_o , i0[12], i1[12]);
  xor \xor_i0[13]_i1[13]  (\xor_i0[13]_i1[13]_o , i0[13], i1[13]);
  xor \xor_i0[14]_i1[14]  (\xor_i0[14]_i1[14]_o , i0[14], i1[14]);
  xor \xor_i0[15]_i1[15]  (\xor_i0[15]_i1[15]_o , i0[15], i1[15]);
  xor \xor_i0[16]_i1[16]  (\xor_i0[16]_i1[16]_o , i0[16], i1[16]);
  xor \xor_i0[17]_i1[17]  (\xor_i0[17]_i1[17]_o , i0[17], i1[17]);
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

