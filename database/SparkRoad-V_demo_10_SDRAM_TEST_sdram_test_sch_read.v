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
  wire [1:0] n11;
  wire [1:0] n12;
  wire [20:0] n13;
  wire [2:0] n14;
  wire [1:0] n15;
  wire [20:0] n16;
  wire [20:0] n17;
  wire [2:0] n18;
  wire [1:0] n19;
  wire [15:0] n2;
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
  wire [2:0] n38;
  wire [20:0] n39;
  wire [2:0] n40;
  wire [1:0] n41;
  wire [20:0] n42;
  wire [2:0] n43;
  wire [1:0] n44;
  wire [7:0] n45;
  wire [8:0] n46;
  wire [2:0] n47;
  wire [20:0] n48;
  wire [1:0] n49;
  wire [1:0] n50;
  wire [8:0] n52;
  wire [12:0] n54;
  wire [20:0] n55;
  wire [2:0] n56;
  wire [8:0] n57;
  wire [1:0] n58;
  wire [20:0] n59;
  wire [1:0] n6;
  wire [2:0] n60;
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
  wire [1:0] n85;
  wire [2:0] n86;
  wire [20:0] n87;
  wire [20:0] n88;
  wire [2:0] n89;
  wire [1:0] n9;
  wire [20:0] n90;
  wire [1:0] n91;
  wire [7:0] n92;
  wire [8:0] n93;
  wire [8:0] n94;
  wire [1:0] n95;
  wire [7:0] n96;
  wire [31:0] n98;
  wire [20:0] rd_addr;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(15)
  wire [1:0] rd_state;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(16)
  wire [1:0] reset_step;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(11)
  wire [20:0] sd_addr;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(21)
  wire [2:0] sd_cmd;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(19)
  wire [31:0] sd_dataout;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(26)
  wire [31:0] sd_dq_int;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(31)
  wire [2:0] sd_state;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(10)
  wire [3:0] sm_bit_reg;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(49)
  wire [7:0] sm_seg_reg;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(50)
  wire [20:0] wr_addr;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(14)
  wire [1:0] wr_state;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(17)
  wire SD_CAS_N;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(38)
  wire SD_CLK;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(41)
  wire SD_CS_N;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(36)
  wire SD_RAS_N;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(37)
  wire SD_WE_N;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(39)
  wire clk_200m;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(29)
  wire n0;
  wire n100;
  wire n28;
  wire n3;
  wire n32;
  wire n35;
  wire n4;
  wire n5;
  wire n51;
  wire n53;
  wire n61;
  wire n62;
  wire n64;
  wire n67;
  wire n68;
  wire n69;
  wire n70;
  wire n71;
  wire n78;
  wire n80;
  wire n81;
  wire n82;
  wire n83;
  wire n84;
  wire n97;
  wire n99;
  wire sd_clk_int;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(30)
  wire sd_cmd_ack;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(20)
  wire test_error;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(44)
  wire test_error_tmp;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(24)

  EG_LOGIC_ODDR #(
    .ASYNCRST("ENABLE"))
    ODDR_0 (
    .clk(sd_clk_int),
    .d0(1'b0),
    .d1(1'b1),
    .rst(1'b0),
    .q(SD_CLK));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(99)
  SDRAM U_EG_SDRAM_2M_32 (
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
    .dq(SD_DQ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(102)
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
  eq_w3 eq9 (
    .i0(sd_state),
    .i1(3'b011),
    .o(n83));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(296)
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
  binary_mux_s1_w16 mux0 (
    .i0(error_cnt),
    .i1(n1),
    .sel(test_error_tmp),
    .o(n2));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(127)
  binary_mux_s1_w4 mux1 (
    .i0({wr_state,wr_state}),
    .i1({2'b00,n25}),
    .sel(sd_cmd_ack),
    .o({n41,n26}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(236)
  binary_mux_s2_w3 mux10 (
    .i0(sd_state),
    .i1(sd_state),
    .i2(sd_state),
    .i3(n18),
    .sel(reset_step),
    .o(n23));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  binary_mux_s2_w21 mux11 (
    .i0(n7),
    .i1(n10),
    .i2(n13),
    .i3(sd_addr),
    .sel(reset_step),
    .o(n24));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  binary_mux_s1_w3 mux12 (
    .i0(sd_cmd),
    .i1(3'b000),
    .sel(sd_cmd_ack),
    .o(n27));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(211)
  binary_mux_s1_w9 mux13 (
    .i0(n29),
    .i1(9'b000000000),
    .sel(n28),
    .o(n30));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w2 mux14 (
    .i0(wr_state),
    .i1(2'b11),
    .sel(n28),
    .o(n31));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(220)
  binary_mux_s1_w3 mux15 (
    .i0(sd_cmd),
    .i1(3'b100),
    .sel(n32),
    .o(n33));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(223)
  binary_mux_s1_w21 mux16 (
    .i0({n36,wr_addr[7:0]}),
    .i1(21'b000000000000000000000),
    .sel(n35),
    .o(n37));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w3 mux17 (
    .i0(sd_state),
    .i1(n14),
    .sel(n35),
    .o(n38));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(234)
  binary_mux_s1_w21 mux18 (
    .i0(wr_addr),
    .i1(n37),
    .sel(sd_cmd_ack),
    .o(n39));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(236)
  binary_mux_s1_w3 mux19 (
    .i0(sd_state),
    .i1(n38),
    .sel(sd_cmd_ack),
    .o(n40));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(236)
  binary_mux_s1_w63 mux2 (
    .i0({sd_addr,sd_addr,sd_addr}),
    .i1(63'b000000000000100101111000000000110000110101000000000000000110111),
    .sel(sd_cmd_ack),
    .o({n13,n10,n7}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(184)
  binary_mux_s2_w21 mux20 (
    .i0(wr_addr),
    .i1(wr_addr),
    .i2(wr_addr),
    .i3(n39),
    .sel(wr_state),
    .o(n42));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w3 mux21 (
    .i0(sd_state),
    .i1(sd_state),
    .i2(sd_state),
    .i3(n40),
    .sel(wr_state),
    .o(n43));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w2 mux22 (
    .i0(2'b01),
    .i1(n26),
    .i2(n31),
    .i3(n41),
    .sel(wr_state),
    .o(n44));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w8 mux23 (
    .i0(fifo_q),
    .i1(fifo_q),
    .i2(n34),
    .i3(8'b00000000),
    .sel(wr_state),
    .o(n45));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w9 mux24 (
    .i0(burst_cnt),
    .i1(burst_cnt),
    .i2(n30),
    .i3(burst_cnt),
    .sel(wr_state),
    .o(n46));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w3 mux25 (
    .i0(3'b010),
    .i1(n27),
    .i2(n33),
    .i3(sd_cmd),
    .sel(wr_state),
    .o(n47));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s2_w21 mux26 (
    .i0(wr_addr),
    .i1(sd_addr),
    .i2(sd_addr),
    .i3(sd_addr),
    .sel(wr_state),
    .o(n48));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(239)
  binary_mux_s1_w2 mux27 (
    .i0(rd_state),
    .i1(n49),
    .sel(sd_cmd_ack),
    .o(n50));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(253)
  binary_mux_s1_w21 mux28 (
    .i0({n54,rd_addr[7:0]}),
    .i1(21'b000000000000000000000),
    .sel(n53),
    .o(n55));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w3 mux29 (
    .i0(sd_state),
    .i1(3'b001),
    .sel(n53),
    .o(n56));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(268)
  binary_mux_s1_w21 mux3 (
    .i0(rd_addr),
    .i1(21'b000000000000000000000),
    .sel(sd_cmd_ack),
    .o(n16));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(196)
  binary_mux_s1_w9 mux30 (
    .i0(9'b000000000),
    .i1(n52),
    .sel(n51),
    .o(n57));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w2 mux31 (
    .i0(2'b11),
    .i1(rd_state),
    .sel(n51),
    .o(n58));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w21 mux32 (
    .i0(n55),
    .i1(rd_addr),
    .sel(n51),
    .o(n59));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w3 mux33 (
    .i0(n56),
    .i1(sd_state),
    .sel(n51),
    .o(n60));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(269)
  binary_mux_s1_w3 mux34 (
    .i0(n27),
    .i1(3'b100),
    .sel(n61),
    .o(n63));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(275)
  binary_mux_s1_w8 mux35 (
    .i0(datacnt),
    .i1(n65),
    .sel(n64),
    .o(n66));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(278)
  binary_mux_s2_w9 mux36 (
    .i0(burst_cnt1),
    .i1(burst_cnt1),
    .i2(n57),
    .i3(9'b000000000),
    .sel(rd_state),
    .o(n72));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w2 mux37 (
    .i0(2'b01),
    .i1(n50),
    .i2(n58),
    .i3(2'b00),
    .sel(rd_state),
    .o(n73));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w3 mux38 (
    .i0(3'b001),
    .i1(n27),
    .i2(n63),
    .i3(3'b000),
    .sel(rd_state),
    .o(n74));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w8 mux39 (
    .i0(datacnt),
    .i1(datacnt),
    .i2(n66),
    .i3(8'b00000000),
    .sel(rd_state),
    .o(n75));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s1_w21 mux4 (
    .i0(wr_addr),
    .i1(21'b000000000000000000000),
    .sel(sd_cmd_ack),
    .o(n17));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(196)
  binary_mux_s2_w21 mux40 (
    .i0(rd_addr),
    .i1(rd_addr),
    .i2(n59),
    .i3(rd_addr),
    .sel(rd_state),
    .o(n76));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w3 mux41 (
    .i0(sd_state),
    .i1(sd_state),
    .i2(n60),
    .i3(sd_state),
    .sel(rd_state),
    .o(n77));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w1 mux42 (
    .i0(test_error_tmp),
    .i1(test_error_tmp),
    .i2(n71),
    .i3(test_error_tmp),
    .sel(rd_state),
    .o(n78));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s2_w21 mux43 (
    .i0(rd_addr),
    .i1(sd_addr),
    .i2(sd_addr),
    .i3(sd_addr),
    .sel(rd_state),
    .o(n79));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(294)
  binary_mux_s1_w32 mux44 (
    .i0(SD_DQ),
    .i1(sd_dq_int),
    .sel(n5),
    .o(n98));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  binary_mux_s1_w8 mux45 (
    .i0({reset_step,reset_step,reset_step,reset_step}),
    .i1({2'b00,n8,n8,2'b10}),
    .sel(sd_cmd_ack),
    .o({n15,n11,n9,n6}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(196)
  binary_mux_s1_w3 mux5 (
    .i0(sd_state),
    .i1(n14),
    .sel(sd_cmd_ack),
    .o(n18));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(196)
  binary_mux_s2_w2 mux6 (
    .i0(n6),
    .i1(n9),
    .i2(n11),
    .i3(n15),
    .sel(reset_step),
    .o(n19));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  binary_mux_s2_w3 mux7 (
    .i0({2'b10,sd_cmd_ack}),
    .i1({1'b1,sd_cmd_ack,1'b1}),
    .i2({1'b1,sd_cmd_ack,n12[0]}),
    .i3({n12[0],n12[0],1'b0}),
    .sel(reset_step),
    .o(n20));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  binary_mux_s2_w21 mux8 (
    .i0(rd_addr),
    .i1(rd_addr),
    .i2(rd_addr),
    .i3(n16),
    .sel(reset_step),
    .o(n21));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  binary_mux_s2_w21 mux9 (
    .i0(wr_addr),
    .i1(wr_addr),
    .i2(wr_addr),
    .i3(n17),
    .sel(reset_step),
    .o(n22));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(198)
  ne_w32 neq0 (
    .i0(sd_dq_int),
    .i1({datacnt,datacnt,datacnt,datacnt}),
    .o(n70));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(280)
  reg_ar_as_w2 reg0 (
    .clk(clk_200m),
    .d(n85),
    .reset({n5,n5}),
    .set(2'b00),
    .q(reset_step));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w9 reg1 (
    .clk(clk_200m),
    .d(n93),
    .reset({n5,n5,n5,n5,n5,n5,n5,n5,n5}),
    .set(9'b000000000),
    .q(burst_cnt));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w8 reg10 (
    .clk(clk_200m),
    .d(n96),
    .reset({n5,n5,n5,n5,n5,n5,n5,n5}),
    .set(8'b00000000),
    .q(datacnt));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w32 reg11 (
    .clk(clk_200m),
    .d(n98),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(sd_dq_int));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w16 reg12 (
    .clk(clk_200m),
    .d(n2),
    .reset({n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5}),
    .set(16'b0000000000000000),
    .q(error_cnt));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  reg_ar_as_w3 reg13 (
    .clk(clk_200m),
    .d(n86),
    .reset({1'b0,n5,n5}),
    .set({n5,2'b00}),
    .q(sd_cmd));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w9 reg2 (
    .clk(clk_200m),
    .d(n94),
    .reset({n5,n5,n5,n5,n5,n5,n5,n5,n5}),
    .set(9'b000000000),
    .q(burst_cnt1));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w3 reg3 (
    .clk(clk_200m),
    .d(n89),
    .reset({n5,n5,n5}),
    .set(3'b000),
    .q(sd_state));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w2 reg4 (
    .clk(clk_200m),
    .d(n91),
    .reset({n5,n5}),
    .set(2'b00),
    .q(wr_state));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w2 reg5 (
    .clk(clk_200m),
    .d(n95),
    .reset({n5,n5}),
    .set(2'b00),
    .q(rd_state));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w21 reg6 (
    .clk(clk_200m),
    .d(n90),
    .reset({n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5}),
    .set(21'b000000000000000000000),
    .q(sd_addr));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w21 reg7 (
    .clk(clk_200m),
    .d(n88),
    .reset({n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5}),
    .set(21'b000000000000000000000),
    .q(wr_addr));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w21 reg8 (
    .clk(clk_200m),
    .d(n87),
    .reset({n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5,n5}),
    .set(21'b000000000000000000000),
    .q(rd_addr));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  reg_ar_as_w8 reg9 (
    .clk(clk_200m),
    .d(n92),
    .reset({n5,n5,n5,n5,n5,n5,n5,n5}),
    .set(8'b00000000),
    .q(fifo_q));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  onehot_mux_s5_w2 sel0 (
    .i0(reset_step),
    .i1(reset_step),
    .i2(reset_step),
    .i3(reset_step),
    .i4(n19),
    .sel({n80,n81,n82,n83,n84}),
    .o(n85));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  onehot_mux_s5_w3 sel1 (
    .i0(sd_cmd),
    .i1(sd_cmd),
    .i2(n74),
    .i3(n47),
    .i4(n20),
    .sel({n80,n81,n82,n83,n84}),
    .o(n86));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  onehot_mux_s5_w2 sel10 (
    .i0(rd_state),
    .i1(rd_state),
    .i2(n73),
    .i3(rd_state),
    .i4(rd_state),
    .sel({n80,n81,n82,n83,n84}),
    .o(n95));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  onehot_mux_s5_w8 sel11 (
    .i0(datacnt),
    .i1(datacnt),
    .i2(n75),
    .i3(datacnt),
    .i4(datacnt),
    .sel({n80,n81,n82,n83,n84}),
    .o(n96));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  onehot_mux_s5_w21 sel2 (
    .i0(rd_addr),
    .i1(rd_addr),
    .i2(n76),
    .i3(rd_addr),
    .i4(n21),
    .sel({n80,n81,n82,n83,n84}),
    .o(n87));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  onehot_mux_s5_w21 sel3 (
    .i0(wr_addr),
    .i1(wr_addr),
    .i2(wr_addr),
    .i3(n42),
    .i4(n22),
    .sel({n80,n81,n82,n83,n84}),
    .o(n88));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  onehot_mux_s5_w3 sel4 (
    .i0(sd_state),
    .i1(sd_state),
    .i2(n77),
    .i3(n43),
    .i4(n23),
    .sel({n80,n81,n82,n83,n84}),
    .o(n89));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  onehot_mux_s5_w21 sel5 (
    .i0(sd_addr),
    .i1(sd_addr),
    .i2(n79),
    .i3(n48),
    .i4(n24),
    .sel({n80,n81,n82,n83,n84}),
    .o(n90));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  onehot_mux_s5_w2 sel6 (
    .i0(wr_state),
    .i1(wr_state),
    .i2(wr_state),
    .i3(n44),
    .i4(wr_state),
    .sel({n80,n81,n82,n83,n84}),
    .o(n91));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  onehot_mux_s5_w8 sel7 (
    .i0(fifo_q),
    .i1(fifo_q),
    .i2(fifo_q),
    .i3(n45),
    .i4(fifo_q),
    .sel({n80,n81,n82,n83,n84}),
    .o(n92));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  onehot_mux_s5_w9 sel8 (
    .i0(burst_cnt),
    .i1(burst_cnt),
    .i2(burst_cnt),
    .i3(n46),
    .i4(burst_cnt),
    .sel({n80,n81,n82,n83,n84}),
    .o(n93));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  onehot_mux_s5_w9 sel9 (
    .i0(burst_cnt1),
    .i1(burst_cnt1),
    .i2(n72),
    .i3(burst_cnt1),
    .i4(burst_cnt1),
    .sel({n80,n81,n82,n83,n84}),
    .o(n94));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  AL_DFF test_error_reg (
    .clk(clk_200m),
    .d(n4),
    .reset(n5),
    .set(1'b0),
    .q(test_error));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  AL_DFF test_error_tmp_reg (
    .clk(clk_200m),
    .d(n100),
    .reset(1'b0),
    .set(1'b0),
    .q(test_error_tmp));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  AL_DFF test_io_reg (
    .clk(clk_200m),
    .d(n99),
    .reset(1'b0),
    .set(1'b0),
    .q(test_io));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  buf u10 (sm_bit[3], sm_bit_reg[3]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(66)
  buf u11 (sm_seg[7], sm_seg_reg[7]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(65)
  buf u12 (sm_seg[6], sm_seg_reg[6]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(65)
  buf u13 (sm_bit[2], sm_bit_reg[2]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(66)
  buf u14 (sm_seg[5], sm_seg_reg[5]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(65)
  buf u15 (sm_bit[1], sm_bit_reg[1]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(66)
  buf u16 (sm_seg[3], sm_seg_reg[3]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(65)
  not u17 (n84, n62);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  or u18 (n62, n0, n67);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  or u19 (n67, n81, n80);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  buf u2 (sm_seg[4], sm_seg_reg[4]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(65)
  and u20 (n69, n64, n68);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(279)
  AL_MUX u21 (
    .i0(test_error_tmp),
    .i1(n70),
    .sel(n69),
    .o(n71));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(286)
  buf u22 (sm_bit[0], sm_bit_reg[0]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(66)
  AL_MUX u23 (
    .i0(test_error_tmp),
    .i1(n78),
    .sel(n82),
    .o(n97));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  or u24 (n0, n83, n82);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(298)
  AL_MUX u25 (
    .i0(test_error_tmp),
    .i1(test_io),
    .sel(n5),
    .o(n99));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  AL_MUX u26 (
    .i0(n97),
    .i1(test_error_tmp),
    .sel(n5),
    .o(n100));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  bin2bcd u2_al_u0 (
    .b(sd_dataout[7:0]),
    .p(bcdnum));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(68)
  not u3 (n12[0], sd_cmd_ack);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(196)
  buf u4 (test_error_led, test_error);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(46)
  buf u5 (sm_seg[0], sm_seg_reg[0]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(65)
  buf u6 (sm_seg[2], sm_seg_reg[2]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(65)
  not u7 (n5, rst_n);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(120)
  AL_MUX u8 (
    .i0(test_error),
    .i1(1'b1),
    .sel(n3),
    .o(n4));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(130)
  buf u9 (sm_seg[1], sm_seg_reg[1]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(65)
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
    .DATAOUT({open_n15,open_n16,open_n17,open_n18,open_n19,open_n20,open_n21,open_n22,open_n23,open_n24,open_n25,open_n26,open_n27,open_n28,open_n29,open_n30,open_n31,open_n32,open_n33,open_n34,open_n35,open_n36,open_n37,open_n38,sd_dataout[7:0]}),
    .RAS_N(SD_RAS_N),
    .SA(SD_SA),
    .WE_N(SD_WE_N),
    .DQ(SD_DQ));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(74)
  pll1 u_sys_pll (
    .refclk(CLKIN),
    .clk0_out(clk_200m),
    .clk1_out(sd_clk_int));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(92)
  \seg4(CNT_TIME=12000000)  ux_seg (
    .clk_24m(CLKIN),
    .rst_n(rst_n),
    .sm_bit_num({22'b0000000000000000000000,bcdnum}),
    .sm_bit(sm_bit_reg),
    .sm_seg(sm_seg_reg));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(56)

endmodule 

module SDRAM  // al_ip/SDRAM.v(14)
  (
  addr,
  ba,
  cas_n,
  cke,
  clk,
  cs_n,
  dm0,
  dm1,
  dm2,
  dm3,
  ras_n,
  we_n,
  dq
  );

  input [10:0] addr;  // al_ip/SDRAM.v(19)
  input [1:0] ba;  // al_ip/SDRAM.v(20)
  input cas_n;  // al_ip/SDRAM.v(17)
  input cke;  // al_ip/SDRAM.v(27)
  input clk;  // al_ip/SDRAM.v(15)
  input cs_n;  // al_ip/SDRAM.v(22)
  input dm0;  // al_ip/SDRAM.v(23)
  input dm1;  // al_ip/SDRAM.v(24)
  input dm2;  // al_ip/SDRAM.v(25)
  input dm3;  // al_ip/SDRAM.v(26)
  input ras_n;  // al_ip/SDRAM.v(16)
  input we_n;  // al_ip/SDRAM.v(18)
  inout [31:0] dq;  // al_ip/SDRAM.v(21)


  EG_PHY_SDRAM_2M_32 sdram (
    .addr(addr),
    .ba(ba),
    .cas_n(cas_n),
    .cke(cke),
    .clk(clk),
    .cs_n(cs_n),
    .dm0(dm0),
    .dm1(dm1),
    .dm2(dm2),
    .dm3(dm3),
    .ras_n(ras_n),
    .we_n(we_n),
    .dq(dq));  // al_ip/SDRAM.v(29)

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

module eq_w16
  (
  i0,
  i1,
  o
  );

  input [15:0] i0;
  input [15:0] i1;
  output o;



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

module eq_w3
  (
  i0,
  i1,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  output o;



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



endmodule 

module binary_mux_s1_w16
  (
  i0,
  i1,
  sel,
  o
  );

  input [15:0] i0;
  input [15:0] i1;
  input sel;
  output [15:0] o;



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

module binary_mux_s2_w3
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  input [2:0] i2;
  input [2:0] i3;
  input [1:0] sel;
  output [2:0] o;



endmodule 

module binary_mux_s2_w21
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [20:0] i0;
  input [20:0] i1;
  input [20:0] i2;
  input [20:0] i3;
  input [1:0] sel;
  output [20:0] o;



endmodule 

module binary_mux_s1_w3
  (
  i0,
  i1,
  sel,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  input sel;
  output [2:0] o;



endmodule 

module binary_mux_s1_w9
  (
  i0,
  i1,
  sel,
  o
  );

  input [8:0] i0;
  input [8:0] i1;
  input sel;
  output [8:0] o;



endmodule 

module binary_mux_s1_w2
  (
  i0,
  i1,
  sel,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  input sel;
  output [1:0] o;



endmodule 

module binary_mux_s1_w21
  (
  i0,
  i1,
  sel,
  o
  );

  input [20:0] i0;
  input [20:0] i1;
  input sel;
  output [20:0] o;



endmodule 

module binary_mux_s1_w63
  (
  i0,
  i1,
  sel,
  o
  );

  input [62:0] i0;
  input [62:0] i1;
  input sel;
  output [62:0] o;



endmodule 

module binary_mux_s2_w2
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  input [1:0] i2;
  input [1:0] i3;
  input [1:0] sel;
  output [1:0] o;



endmodule 

module binary_mux_s2_w8
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input [7:0] i2;
  input [7:0] i3;
  input [1:0] sel;
  output [7:0] o;



endmodule 

module binary_mux_s2_w9
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [8:0] i0;
  input [8:0] i1;
  input [8:0] i2;
  input [8:0] i3;
  input [1:0] sel;
  output [8:0] o;



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



endmodule 

module binary_mux_s1_w32
  (
  i0,
  i1,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input sel;
  output [31:0] o;



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



endmodule 

module reg_ar_as_w2
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [1:0] d;
  input en;
  input [1:0] reset;
  input [1:0] set;
  output [1:0] q;



endmodule 

module reg_ar_as_w9
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [8:0] d;
  input en;
  input [8:0] reset;
  input [8:0] set;
  output [8:0] q;



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

module reg_ar_as_w32
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [31:0] d;
  input en;
  input [31:0] reset;
  input [31:0] set;
  output [31:0] q;



endmodule 

module reg_ar_as_w16
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [15:0] d;
  input en;
  input [15:0] reset;
  input [15:0] set;
  output [15:0] q;



endmodule 

module reg_ar_as_w3
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [2:0] d;
  input en;
  input [2:0] reset;
  input [2:0] set;
  output [2:0] q;



endmodule 

module reg_ar_as_w21
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [20:0] d;
  input en;
  input [20:0] reset;
  input [20:0] set;
  output [20:0] q;



endmodule 

module onehot_mux_s5_w2
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  sel,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  input [1:0] i2;
  input [1:0] i3;
  input [1:0] i4;
  input [4:0] sel;
  output [1:0] o;



endmodule 

module onehot_mux_s5_w3
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  sel,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  input [2:0] i2;
  input [2:0] i3;
  input [2:0] i4;
  input [4:0] sel;
  output [2:0] o;



endmodule 

module onehot_mux_s5_w8
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input [7:0] i2;
  input [7:0] i3;
  input [7:0] i4;
  input [4:0] sel;
  output [7:0] o;



endmodule 

module onehot_mux_s5_w21
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  sel,
  o
  );

  input [20:0] i0;
  input [20:0] i1;
  input [20:0] i2;
  input [20:0] i3;
  input [20:0] i4;
  input [4:0] sel;
  output [20:0] o;



endmodule 

module onehot_mux_s5_w9
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  sel,
  o
  );

  input [8:0] i0;
  input [8:0] i1;
  input [8:0] i2;
  input [8:0] i3;
  input [8:0] i4;
  input [4:0] sel;
  output [8:0] o;



endmodule 

module bin2bcd  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(142)
  (
  b,
  p
  );

  input [7:0] b;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(143)
  output [9:0] p;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(144)

  wire [3:0] n14;
  wire [1:0] n17;
  wire [3:0] n19;
  wire [2:0] n2;
  wire [2:0] n21;
  wire [2:0] n24;
  wire [2:0] n25;
  wire [3:0] n27;
  wire [3:0] n29;
  wire [3:0] n8;
  wire [17:0] z;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(146)
  wire n0;
  wire n1;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n15;
  wire n16;
  wire n18;
  wire n20;
  wire n22;
  wire n23;
  wire n26;
  wire n28;
  wire n3;
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  wire n9;

  add_pu3_pu3_o4 add0 (
    .i0(b[7:5]),
    .i1(3'b011),
    .o({n1,n2}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  add_pu4_pu4_o4 add1 (
    .i0({n4,n5,n6,b[4]}),
    .i1(4'b0011),
    .o(n8));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  add_pu4_pu4_o4 add2 (
    .i0({n10,n11,n12,b[3]}),
    .i1(4'b0011),
    .o(n14));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  add_pu4_pu4_o4 add3 (
    .i0({n16,n17,b[2]}),
    .i1(4'b0011),
    .o(n19));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  add_pu3_pu3_o4 add4 (
    .i0({n3,n9,n15}),
    .i1(3'b011),
    .o({n23,n24}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  add_pu4_pu4_o4 add5 (
    .i0({n21,b[1]}),
    .i1(4'b0011),
    .o(n27));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  add_pu4_pu4_o4 add6 (
    .i0({n25,n20}),
    .i1(4'b0011),
    .o(n29));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  lt_u3_u3 lt0 (
    .ci(1'b0),
    .i0(3'b100),
    .i1(b[7:5]),
    .o(n0));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(156)
  lt_u4_u4 lt1 (
    .ci(1'b0),
    .i0(4'b0100),
    .i1({n4,n5,n6,b[4]}),
    .o(n7));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(156)
  lt_u4_u4 lt2 (
    .ci(1'b0),
    .i0(4'b0100),
    .i1({n10,n11,n12,b[3]}),
    .o(n13));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(156)
  lt_u4_u4 lt3 (
    .ci(1'b0),
    .i0(4'b0100),
    .i1({n16,n17,b[2]}),
    .o(n18));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(156)
  lt_u3_u3 lt4 (
    .ci(1'b0),
    .i0(3'b100),
    .i1({n3,n9,n15}),
    .o(n22));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(158)
  lt_u4_u4 lt5 (
    .ci(1'b0),
    .i0(4'b0100),
    .i1({n21,b[1]}),
    .o(n26));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(156)
  lt_u4_u4 lt6 (
    .ci(1'b0),
    .i0(4'b0100),
    .i1({n25,n20}),
    .o(n28));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(158)
  binary_mux_s1_w2 mux0 (
    .i0({n12,b[3]}),
    .i1(n14[1:0]),
    .sel(n13),
    .o(n17));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  binary_mux_s1_w4 mux1 (
    .i0({n21,b[1]}),
    .i1(n27),
    .sel(n26),
    .o(z[12:9]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  binary_mux_s1_w3 mux2 (
    .i0({n17,b[2]}),
    .i1(n19[2:0]),
    .sel(n18),
    .o(n21));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  binary_mux_s1_w3 mux3 (
    .i0({n3,n9,n15}),
    .i1(n24),
    .sel(n22),
    .o(n25));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  binary_mux_s1_w4 mux4 (
    .i0({n25,n20}),
    .i1(n29),
    .sel(n28),
    .o(z[16:13]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  AL_MUX u10 (
    .i0(n6),
    .i1(n8[1]),
    .sel(n7),
    .o(n11));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX u11 (
    .i0(b[4]),
    .i1(n8[0]),
    .sel(n7),
    .o(n12));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX u12 (
    .i0(n10),
    .i1(n14[3]),
    .sel(n13),
    .o(n15));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX u13 (
    .i0(n11),
    .i1(n14[2]),
    .sel(n13),
    .o(n16));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  buf u14 (p[1], z[9]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(163)
  AL_MUX u15 (
    .i0(n16),
    .i1(n19[3]),
    .sel(n18),
    .o(n20));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX u16 (
    .i0(1'b0),
    .i1(n23),
    .sel(n22),
    .o(z[17]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(159)
  buf u17 (p[0], b[0]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(163)
  buf u18 (p[4], z[12]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(163)
  buf u19 (p[5], z[13]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(163)
  buf u2 (p[3], z[11]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(163)
  buf u20 (p[6], z[14]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(163)
  buf u21 (p[7], z[15]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(163)
  buf u22 (p[8], z[16]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(163)
  buf u23 (p[9], z[17]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(163)
  buf u3 (p[2], z[10]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(163)
  AL_MUX u4 (
    .i0(1'b0),
    .i1(n1),
    .sel(n0),
    .o(n3));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX u5 (
    .i0(b[7]),
    .i1(n2[2]),
    .sel(n0),
    .o(n4));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX u6 (
    .i0(b[6]),
    .i1(n2[1]),
    .sel(n0),
    .o(n5));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX u7 (
    .i0(b[5]),
    .i1(n2[0]),
    .sel(n0),
    .o(n6));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX u8 (
    .i0(n4),
    .i1(n8[3]),
    .sel(n7),
    .o(n9));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)
  AL_MUX u9 (
    .i0(n5),
    .i1(n8[2]),
    .sel(n7),
    .o(n10));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(157)

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
  wire [31:0] IDATAOUT;  // ../sdr_sdram.v(47)
  wire [10:0] ISA;  // ../sdr_sdram.v(39)
  wire [20:0] saddr;  // ../sdr_sdram.v(50)
  wire [3:0] sc_bl;  // ../sdr_sdram.v(55)
  wire [1:0] sc_cl;  // ../sdr_sdram.v(51)
  wire [1:0] sc_rc;  // ../sdr_sdram.v(52)
  wire [3:0] sc_rrd;  // ../sdr_sdram.v(53)
  wire ICAS_N;  // ../sdr_sdram.v(44)
  wire ICKE;  // ../sdr_sdram.v(42)
  wire ICS_N;  // ../sdr_sdram.v(41)
  wire IRAS_N;  // ../sdr_sdram.v(43)
  wire IWE_N;  // ../sdr_sdram.v(45)
  wire cm_ack;  // ../sdr_sdram.v(62)
  wire load_mode;  // ../sdr_sdram.v(56)
  wire nop;  // ../sdr_sdram.v(57)
  wire oe;  // ../sdr_sdram.v(61)
  wire precharge;  // ../sdr_sdram.v(60)
  wire reada;  // ../sdr_sdram.v(58)
  wire sc_pm;  // ../sdr_sdram.v(54)
  wire writea;  // ../sdr_sdram.v(59)

  AL_DFF CAS_N_reg (
    .clk(CLK),
    .d(ICAS_N),
    .reset(1'b0),
    .set(1'b0),
    .q(CAS_N));  // ../sdr_sdram.v(88)
  AL_DFF CKE_reg (
    .clk(CLK),
    .d(ICKE),
    .reset(1'b0),
    .set(1'b0),
    .q(CKE));  // ../sdr_sdram.v(88)
  AL_DFF CS_N_reg (
    .clk(CLK),
    .d(ICS_N),
    .reset(1'b0),
    .set(1'b0),
    .q(CS_N));  // ../sdr_sdram.v(88)
  AL_DFF RAS_N_reg (
    .clk(CLK),
    .d(IRAS_N),
    .reset(1'b0),
    .set(1'b0),
    .q(RAS_N));  // ../sdr_sdram.v(88)
  AL_DFF WE_N_reg (
    .clk(CLK),
    .d(IWE_N),
    .reset(1'b0),
    .set(1'b0),
    .q(WE_N));  // ../sdr_sdram.v(88)
  reg_ar_as_w2 reg0 (
    .clk(CLK),
    .d(IBA),
    .reset(2'b00),
    .set(2'b00),
    .q(BA));  // ../sdr_sdram.v(88)
  reg_ar_as_w32 reg1 (
    .clk(CLK),
    .d(DQ),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(DQIN));  // ../sdr_sdram.v(88)
  reg_ar_as_w32 reg2 (
    .clk(CLK),
    .d(IDATAOUT),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(DATAOUT));  // ../sdr_sdram.v(88)
  reg_ar_as_w11 reg3 (
    .clk(CLK),
    .d(ISA),
    .reset(11'b00000000000),
    .set(11'b00000000000),
    .q(SA));  // ../sdr_sdram.v(88)
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
  command ux_command (
    .CLK(CLK),
    .LOAD_MODE(load_mode),
    .NOP(nop),
    .PRECHARGE(precharge),
    .READA(reada),
    .RESET_N(RESET_N),
    .SADDR(saddr),
    .SC_BL(sc_bl),
    .SC_CL(sc_cl),
    .SC_PM(sc_pm),
    .SC_RC(sc_rc),
    .SC_RRD(sc_rrd),
    .WRITEA(writea),
    .BA(IBA),
    .CAS_N(ICAS_N),
    .CKE(ICKE),
    .CM_ACK(cm_ack),
    .CS_N(ICS_N),
    .OE(oe),
    .RAS_N(IRAS_N),
    .SA(ISA),
    .WE_N(IWE_N));  // ../sdr_sdram.v(70)
  control_interface ux_control (
    .ADDR(ADDR),
    .CLK(CLK),
    .CMD(CMD),
    .CM_ACK(cm_ack),
    .RESET_N(RESET_N),
    .CMD_ACK(CMDACK),
    .LOAD_MODE(load_mode),
    .NOP(nop),
    .PRECHARGE(precharge),
    .READA(reada),
    .SADDR(saddr),
    .SC_BL(sc_bl),
    .SC_CL(sc_cl),
    .SC_PM(sc_pm),
    .SC_RC(sc_rc),
    .SC_RRD(sc_rrd),
    .WRITEA(writea));  // ../sdr_sdram.v(67)
  sdr_data_path ux_data_path (
    .CLK(CLK),
    .DATAIN(DATAIN),
    .DQIN(DQIN),
    .OE(oe),
    .RESET_N(RESET_N),
    .DATAOUT(IDATAOUT),
    .DQOUT(DQOUT));  // ../sdr_sdram.v(73)

endmodule 

module pll1  // al_ip/pll1.v(23)
  (
  refclk,
  clk0_out,
  clk1_out
  );

  input refclk;  // al_ip/pll1.v(27)
  output clk0_out;  // al_ip/pll1.v(28)
  output clk1_out;  // al_ip/pll1.v(29)

  wire clk0_buf;  // al_ip/pll1.v(31)

  EG_LOGIC_BUFG bufg_feedback (
    .i(clk0_buf),
    .o(clk0_out));  // al_ip/pll1.v(33)
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
    .reset(1'b0),
    .stdby(1'b0),
    .clkc({open_n0,open_n1,open_n2,clk1_out,clk0_buf}));  // al_ip/pll1.v(60)

endmodule 

module \seg4(CNT_TIME=12000000)   // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(14)
  (
  clk_24m,
  rst_n,
  sm_bit_num,
  sm_bit,
  sm_seg
  );

  input clk_24m;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(19)
  input rst_n;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(20)
  input [31:0] sm_bit_num;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(21)
  output [3:0] sm_bit;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(23)
  output [7:0] sm_seg;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(22)

  parameter CNT_TIME = 12000000;
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
  wire [24:0] cnt;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(27)
  wire [17:0] cnt_w;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(33)
  wire [3:0] n10;
  wire [3:0] n11;
  wire [17:0] n13;
  wire [17:0] n14;
  wire [3:0] n15;
  wire [3:0] n16;
  wire [24:0] n2;
  wire [24:0] n3;
  wire [3:0] n4;
  wire [3:0] n5;
  wire [3:0] n6;
  wire [3:0] n7;
  wire [3:0] n8;
  wire [3:0] n9;
  wire [3:0] sm_bit1_num;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(28)
  wire [3:0] sm_bit2_num;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(29)
  wire [3:0] sm_bit3_num;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(30)
  wire [3:0] sm_bit4_num;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(31)
  wire [3:0] sm_bit_reg;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(35)
  wire [3:0] sm_seg_num;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(36)
  wire [7:0] sm_seg_reg;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(37)
  wire n0;
  wire n1;
  wire n12;

  add_pu25_pu25_o25 add0 (
    .i0(cnt),
    .i1(25'b0000000000000000000000001),
    .o(n2));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  add_pu18_pu18_o18 add1 (
    .i0(cnt_w),
    .i1(18'b000000000000000001),
    .o(n13));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  eq_w25 eq0 (
    .i0(cnt),
    .i1(25'b0101101110001101100000000),
    .o(n1));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(54)
  eq_w18 eq1 (
    .i0(cnt_w),
    .i1(18'b111111111111111111),
    .o(n12));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(73)
  binary_mux_s1_w25 mux0 (
    .i0(n2),
    .i1(25'b0000000000000000000000000),
    .sel(n1),
    .o(n3));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w4 mux1 (
    .i0(sm_bit1_num),
    .i1(sm_bit_num[3:0]),
    .sel(n1),
    .o(n4));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s2_w4 mux10 (
    .i0(sm_bit1_num),
    .i1(sm_bit2_num),
    .i2(sm_bit3_num),
    .i3(sm_bit4_num),
    .sel(cnt_w[17:16]),
    .o(n15));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(90)
  binary_mux_s2_w4 mux11 (
    .i0(4'b1110),
    .i1(4'b1101),
    .i2(4'b1011),
    .i3(4'b0111),
    .sel(cnt_w[17:16]),
    .o(n16));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(105)
  binary_mux_s4_w8 mux12 (
    .i0(8'b11000000),
    .i1(8'b11111001),
    .i10(8'b11000000),
    .i11(8'b11000000),
    .i12(8'b11000000),
    .i13(8'b11000000),
    .i14(8'b11000000),
    .i15(8'b11000000),
    .i2(8'b10100100),
    .i3(8'b10110000),
    .i4(8'b10011001),
    .i5(8'b10010010),
    .i6(8'b10000010),
    .i7(8'b11111000),
    .i8(8'b10000000),
    .i9(8'b10010000),
    .sel(sm_seg_num),
    .o(sm_seg_reg));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(133)
  binary_mux_s1_w4 mux2 (
    .i0(sm_bit2_num),
    .i1(sm_bit_num[7:4]),
    .sel(n1),
    .o(n5));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w4 mux3 (
    .i0(sm_bit3_num),
    .i1(sm_bit_num[11:8]),
    .sel(n1),
    .o(n6));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w4 mux4 (
    .i0(sm_bit4_num),
    .i1(sm_bit_num[15:12]),
    .sel(n1),
    .o(n7));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w4 mux5 (
    .i0(n4),
    .i1(sm_bit1_num),
    .sel(n0),
    .o(n8));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w4 mux6 (
    .i0(n5),
    .i1(sm_bit2_num),
    .sel(n0),
    .o(n9));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w4 mux7 (
    .i0(n6),
    .i1(sm_bit3_num),
    .sel(n0),
    .o(n10));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w4 mux8 (
    .i0(n7),
    .i1(sm_bit4_num),
    .sel(n0),
    .o(n11));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  binary_mux_s1_w18 mux9 (
    .i0(n13),
    .i1(18'b000000000000000000),
    .sel(n12),
    .o(n14));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w4 reg0 (
    .clk(clk_24m),
    .d(n8),
    .reset(4'b0000),
    .set(4'b0000),
    .q(sm_bit1_num));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w4 reg1 (
    .clk(clk_24m),
    .d(n9),
    .reset(4'b0000),
    .set(4'b0000),
    .q(sm_bit2_num));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w4 reg2 (
    .clk(clk_24m),
    .d(n10),
    .reset(4'b0000),
    .set(4'b0000),
    .q(sm_bit3_num));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w4 reg3 (
    .clk(clk_24m),
    .d(n11),
    .reset(4'b0000),
    .set(4'b0000),
    .q(sm_bit4_num));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w18 reg4 (
    .clk(clk_24m),
    .d(n14),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(18'b000000000000000000),
    .q(cnt_w));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  reg_ar_as_w4 reg5 (
    .clk(clk_24m),
    .d(n15),
    .reset({n0,n0,n0,n0}),
    .set(4'b0000),
    .q(sm_seg_num));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(91)
  reg_ar_as_w25 reg6 (
    .clk(clk_24m),
    .d(n3),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(25'b0000000000000000000000000),
    .q(cnt));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  reg_ar_as_w4 reg7 (
    .clk(clk_24m),
    .d(n16),
    .reset(4'b0000),
    .set({n0,n0,n0,n0}),
    .q(sm_bit_reg));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(106)
  buf u10 (sm_bit[1], sm_bit_reg[1]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(137)
  buf u11 (sm_seg[1], sm_seg_reg[1]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(136)
  buf u12 (sm_bit[0], sm_bit_reg[0]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(137)
  buf u13 (sm_seg[7], sm_seg_reg[7]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(136)
  buf u14 (sm_seg[0], sm_seg_reg[0]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(136)
  buf u2 (sm_seg[6], sm_seg_reg[6]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(136)
  buf u3 (sm_seg[5], sm_seg_reg[5]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(136)
  buf u4 (sm_seg[4], sm_seg_reg[4]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(136)
  not u5 (n0, rst_n);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(52)
  buf u6 (sm_seg[3], sm_seg_reg[3]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(136)
  buf u7 (sm_bit[3], sm_bit_reg[3]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(137)
  buf u8 (sm_seg[2], sm_seg_reg[2]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(136)
  buf u9 (sm_bit[2], sm_bit_reg[2]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(137)

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



endmodule 

module reg_ar_as_w11
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [10:0] d;
  input en;
  input [10:0] reset;
  input [10:0] set;
  output [10:0] q;



endmodule 

module command  // ../Command.v(4)
  (
  CLK,
  LOAD_MODE,
  NOP,
  PRECHARGE,
  READA,
  RESET_N,
  SADDR,
  SC_BL,
  SC_CL,
  SC_PM,
  SC_RC,
  SC_RRD,
  WRITEA,
  BA,
  CAS_N,
  CKE,
  CM_ACK,
  CS_N,
  OE,
  RAS_N,
  SA,
  WE_N
  );

  input CLK;  // ../Command.v(15)
  input LOAD_MODE;  // ../Command.v(22)
  input NOP;  // ../Command.v(18)
  input PRECHARGE;  // ../Command.v(21)
  input READA;  // ../Command.v(19)
  input RESET_N;  // ../Command.v(16)
  input [20:0] SADDR;  // ../Command.v(17)
  input [3:0] SC_BL;  // ../Command.v(27)
  input [1:0] SC_CL;  // ../Command.v(23)
  input SC_PM;  // ../Command.v(26)
  input [1:0] SC_RC;  // ../Command.v(24)
  input [3:0] SC_RRD;  // ../Command.v(25)
  input WRITEA;  // ../Command.v(20)
  output [1:0] BA;  // ../Command.v(34)
  output CAS_N;  // ../Command.v(42)
  output CKE;  // ../Command.v(38)
  output CM_ACK;  // ../Command.v(28)
  output CS_N;  // ../Command.v(36)
  output OE;  // ../Command.v(30)
  output RAS_N;  // ../Command.v(40)
  output [10:0] SA;  // ../Command.v(32)
  output WE_N;  // ../Command.v(44)

  parameter ASIZE = 21;
  parameter BANKSIZE = 2;
  parameter BANKSTART = 19;
  parameter COLSIZE = 8;
  parameter COLSTART = 0;
  parameter DSIZE = 32;
  parameter ROWSIZE = 11;
  parameter ROWSTART = 8;
  wire [1:0] bankaddr;  // ../Command.v(64)
  wire [7:0] coladdr;  // ../Command.v(63)
  wire [7:0] command_delay;  // ../Command.v(54)
  wire [7:0] n20;
  wire [3:0] n25;
  wire [3:0] n33;
  wire [3:0] n34;
  wire [3:0] n36;
  wire [3:0] n38;
  wire [10:0] n39;
  wire [1:0] n41;
  wire [1:0] n42;
  wire [10:0] rowaddr;  // ../Command.v(62)
  wire [3:0] rp_shift;  // ../Command.v(60)
  wire [3:0] rw_shift;  // ../Command.v(55)
  wire bankclose;  // ../Command.v(65)
  wire command_done;  // ../Command.v(53)
  wire do_load_mode;  // ../Command.v(52)
  wire do_precharge;  // ../Command.v(51)
  wire do_reada;  // ../Command.v(48)
  wire do_rw;  // ../Command.v(58)
  wire do_writea;  // ../Command.v(49)
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
  wire n18;
  wire n19;
  wire n2;
  wire n21;
  wire n22;
  wire n23;
  wire n24;
  wire n26;
  wire n27;
  wire n28;
  wire n29;
  wire n3;
  wire n30;
  wire n31;
  wire n32;
  wire n35;
  wire n37;
  wire n4;
  wire n40;
  wire n43;
  wire n44;
  wire n45;
  wire n46;
  wire n47;
  wire n48;
  wire n49;
  wire n5;
  wire n50;
  wire n51;
  wire n52;
  wire n53;
  wire n54;
  wire n55;
  wire n56;
  wire n57;
  wire n58;
  wire n59;
  wire n6;
  wire n60;
  wire n61;
  wire n62;
  wire n7;
  wire n8;
  wire n9;
  wire oe1;  // ../Command.v(59)
  wire rp_done;  // ../Command.v(61)
  wire rw_flag;  // ../Command.v(57)

  AL_DFF CAS_N_reg (
    .clk(CLK),
    .d(n59),
    .reset(1'b0),
    .set(n0),
    .q(CAS_N));  // ../Command.v(271)
  AL_DFF CKE_reg (
    .clk(CLK),
    .d(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(CKE));  // ../Command.v(271)
  AL_DFF CM_ACK_reg (
    .clk(CLK),
    .d(n19),
    .reset(n0),
    .set(1'b0),
    .q(CM_ACK));  // ../Command.v(199)
  AL_DFF CS_N_reg (
    .clk(CLK),
    .d(1'b0),
    .reset(1'b0),
    .set(n0),
    .q(CS_N));  // ../Command.v(271)
  AL_DFF OE_reg (
    .clk(CLK),
    .d(oe1),
    .reset(n0),
    .set(1'b0),
    .q(OE));  // ../Command.v(157)
  AL_DFF RAS_N_reg (
    .clk(CLK),
    .d(n58),
    .reset(1'b0),
    .set(n0),
    .q(RAS_N));  // ../Command.v(271)
  AL_DFF WE_N_reg (
    .clk(CLK),
    .d(n60),
    .reset(1'b0),
    .set(n0),
    .q(WE_N));  // ../Command.v(271)
  AL_DFF bankclose_reg (
    .clk(CLK),
    .d(n62),
    .reset(1'b0),
    .set(1'b0),
    .q(bankclose));  // ../Command.v(271)
  AL_DFF command_done_reg (
    .clk(CLK),
    .d(n21),
    .reset(n0),
    .set(1'b0),
    .q(command_done));  // ../Command.v(141)
  AL_DFF do_load_mode_reg (
    .clk(CLK),
    .d(n16),
    .reset(n0),
    .set(1'b0),
    .q(do_load_mode));  // ../Command.v(141)
  AL_DFF do_precharge_reg (
    .clk(CLK),
    .d(n13),
    .reset(n0),
    .set(1'b0),
    .q(do_precharge));  // ../Command.v(141)
  AL_DFF do_reada_reg (
    .clk(CLK),
    .d(n6),
    .reset(n0),
    .set(1'b0),
    .q(do_reada));  // ../Command.v(141)
  AL_DFF do_rw_reg (
    .clk(CLK),
    .d(n37),
    .reset(n0),
    .set(1'b0),
    .q(do_rw));  // ../Command.v(183)
  AL_DFF do_writea_reg (
    .clk(CLK),
    .d(n10),
    .reset(n0),
    .set(1'b0),
    .q(do_writea));  // ../Command.v(141)
  eq_w2 eq0 (
    .i0(SC_RC),
    .i1(2'b01),
    .o(n30));  // ../Command.v(170)
  eq_w2 eq1 (
    .i0(SC_RC),
    .i1(2'b10),
    .o(n31));  // ../Command.v(172)
  eq_w2 eq2 (
    .i0(SC_RC),
    .i1(2'b11),
    .o(n32));  // ../Command.v(174)
  binary_mux_s1_w8 mux0 (
    .i0({1'b0,command_delay[7:1]}),
    .i1(8'b11111111),
    .sel(n19),
    .o(n20));  // ../Command.v(128)
  binary_mux_s1_w4 mux1 (
    .i0({1'b0,rp_shift[3:1]}),
    .i1(4'b1111),
    .sel(n24),
    .o(n25));  // ../Command.v(140)
  binary_mux_s1_w4 mux2 (
    .i0(rw_shift),
    .i1(4'b0010),
    .sel(n32),
    .o(n33));  // ../Command.v(175)
  binary_mux_s1_w4 mux3 (
    .i0(n33),
    .i1(4'b0001),
    .sel(n31),
    .o(n34));  // ../Command.v(175)
  binary_mux_s1_w4 mux4 (
    .i0(n34),
    .i1(rw_shift),
    .sel(n30),
    .o(n36));  // ../Command.v(175)
  binary_mux_s1_w4 mux5 (
    .i0({1'b0,rw_shift[3:1]}),
    .i1(n36),
    .sel(n17),
    .o(n38));  // ../Command.v(182)
  binary_mux_s1_w11 mux6 (
    .i0({SA[10:8],coladdr}),
    .i1(rowaddr),
    .sel(n17),
    .o(n39));  // ../Command.v(222)
  binary_mux_s1_w2 mux7 (
    .i0(bankaddr),
    .i1(2'b00),
    .sel(do_load_mode),
    .o(n42));  // ../Command.v(232)
  binary_mux_s1_w2 mux8 (
    .i0({n40,n39[9]}),
    .i1({1'b1,SADDR[9]}),
    .sel(do_load_mode),
    .o(n41));  // ../Command.v(228)
  AL_DFF oe1_reg (
    .clk(CLK),
    .d(n29),
    .reset(n0),
    .set(1'b0),
    .q(oe1));  // ../Command.v(157)
  reg_ar_as_w8 reg0 (
    .clk(CLK),
    .d(n20),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(8'b00000000),
    .q(command_delay));  // ../Command.v(141)
  reg_ar_as_w4 reg1 (
    .clk(CLK),
    .d(n25),
    .reset({n0,n0,n0,n0}),
    .set(4'b0000),
    .q(rp_shift));  // ../Command.v(141)
  reg_ar_as_w4 reg2 (
    .clk(CLK),
    .d(n38),
    .reset({n0,n0,n0,n0}),
    .set(4'b0000),
    .q(rw_shift));  // ../Command.v(183)
  reg_ar_as_w11 reg3 (
    .clk(CLK),
    .d({n41,n39[8:0]}),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(11'b00000000000),
    .q(SA));  // ../Command.v(271)
  reg_ar_as_w2 reg4 (
    .clk(CLK),
    .d(n42),
    .reset({n0,n0}),
    .set(2'b00),
    .q(BA));  // ../Command.v(271)
  AL_DFF rp_done_reg (
    .clk(CLK),
    .d(n26),
    .reset(n0),
    .set(1'b0),
    .q(rp_done));  // ../Command.v(141)
  AL_DFF rw_flag_reg (
    .clk(CLK),
    .d(n22),
    .reset(n0),
    .set(1'b0),
    .q(rw_flag));  // ../Command.v(141)
  and u10 (n6, n4, n5);  // ../Command.v(90)
  buf u11 (rowaddr[7], SADDR[15]);  // ../Command.v(69)
  and u12 (n7, WRITEA, n1);  // ../Command.v(95)
  not u13 (n8, do_writea);  // ../Command.v(95)
  and u14 (n9, n7, n8);  // ../Command.v(95)
  buf u15 (rowaddr[6], SADDR[14]);  // ../Command.v(69)
  and u16 (n10, n9, n5);  // ../Command.v(95)
  buf u17 (rowaddr[5], SADDR[13]);  // ../Command.v(69)
  and u18 (n11, PRECHARGE, n1);  // ../Command.v(106)
  not u19 (n12, do_precharge);  // ../Command.v(106)
  buf u2 (rowaddr[0], SADDR[8]);  // ../Command.v(69)
  and u20 (n13, n11, n12);  // ../Command.v(106)
  buf u21 (rowaddr[4], SADDR[12]);  // ../Command.v(69)
  and u22 (n14, LOAD_MODE, n1);  // ../Command.v(111)
  not u23 (n15, do_load_mode);  // ../Command.v(111)
  and u24 (n16, n14, n15);  // ../Command.v(111)
  or u25 (n17, do_reada, do_writea);  // ../Command.v(116)
  or u26 (n18, n17, do_precharge);  // ../Command.v(116)
  or u27 (n19, n18, do_load_mode);  // ../Command.v(116)
  AL_MUX u28 (
    .i0(command_delay[0]),
    .i1(1'b1),
    .sel(n19),
    .o(n21));  // ../Command.v(128)
  AL_MUX u29 (
    .i0(rw_flag),
    .i1(do_reada),
    .sel(n19),
    .o(n22));  // ../Command.v(128)
  buf u3 (coladdr[0], SADDR[0]);  // ../Command.v(70)
  not u30 (n23, command_delay[0]);  // ../Command.v(130)
  and u31 (n24, n23, command_done);  // ../Command.v(130)
  AL_MUX u32 (
    .i0(rp_shift[0]),
    .i1(1'b0),
    .sel(n24),
    .o(n26));  // ../Command.v(140)
  buf u33 (rowaddr[3], SADDR[11]);  // ../Command.v(69)
  buf u34 (rowaddr[2], SADDR[10]);  // ../Command.v(69)
  or u35 (n27, do_precharge, do_reada);  // ../Command.v(154)
  AL_MUX u36 (
    .i0(oe1),
    .i1(1'b0),
    .sel(n27),
    .o(n28));  // ../Command.v(155)
  AL_MUX u37 (
    .i0(n28),
    .i1(1'b1),
    .sel(do_writea),
    .o(n29));  // ../Command.v(155)
  buf u38 (rowaddr[1], SADDR[9]);  // ../Command.v(69)
  buf u39 (coladdr[7], SADDR[7]);  // ../Command.v(70)
  not u4 (n0, RESET_N);  // ../Command.v(75)
  AL_MUX u40 (
    .i0(do_rw),
    .i1(1'b1),
    .sel(n30),
    .o(n35));  // ../Command.v(175)
  AL_MUX u41 (
    .i0(rw_shift[0]),
    .i1(n35),
    .sel(n17),
    .o(n37));  // ../Command.v(182)
  buf u42 (coladdr[6], SADDR[6]);  // ../Command.v(70)
  buf u43 (coladdr[5], SADDR[5]);  // ../Command.v(70)
  buf u44 (coladdr[4], SADDR[4]);  // ../Command.v(70)
  buf u45 (coladdr[3], SADDR[3]);  // ../Command.v(70)
  buf u46 (coladdr[2], SADDR[2]);  // ../Command.v(70)
  buf u47 (coladdr[1], SADDR[1]);  // ../Command.v(70)
  AL_MUX u48 (
    .i0(n39[10]),
    .i1(1'b0),
    .sel(bankclose),
    .o(n40));  // ../Command.v(224)
  or u49 (n43, oe1, rw_flag);  // ../Command.v(234)
  not u5 (n1, command_done);  // ../Command.v(90)
  and u50 (n44, do_precharge, n43);  // ../Command.v(234)
  or u51 (n45, do_precharge, bankclose);  // ../Command.v(240)
  buf u52 (rowaddr[10], SADDR[18]);  // ../Command.v(69)
  buf u53 (rowaddr[9], SADDR[17]);  // ../Command.v(69)
  buf u54 (bankaddr[1], SADDR[20]);  // ../Command.v(71)
  buf u55 (rowaddr[8], SADDR[16]);  // ../Command.v(69)
  not u56 (n46, do_rw);  // ../Command.v(270)
  AL_MUX u57 (
    .i0(1'b1),
    .i1(rw_flag),
    .sel(do_rw),
    .o(n47));  // ../Command.v(270)
  not u58 (n48, n17);  // ../Command.v(270)
  AL_MUX u59 (
    .i0(n46),
    .i1(1'b1),
    .sel(n17),
    .o(n49));  // ../Command.v(270)
  and u6 (n2, READA, n1);  // ../Command.v(90)
  AL_MUX u60 (
    .i0(n47),
    .i1(1'b1),
    .sel(n17),
    .o(n50));  // ../Command.v(270)
  AL_MUX u61 (
    .i0(n48),
    .i1(1'b0),
    .sel(do_load_mode),
    .o(n51));  // ../Command.v(270)
  AL_MUX u62 (
    .i0(n49),
    .i1(1'b0),
    .sel(do_load_mode),
    .o(n52));  // ../Command.v(270)
  AL_MUX u63 (
    .i0(n50),
    .i1(1'b0),
    .sel(do_load_mode),
    .o(n53));  // ../Command.v(270)
  AL_MUX u64 (
    .i0(n51),
    .i1(1'b0),
    .sel(n45),
    .o(n54));  // ../Command.v(270)
  AL_MUX u65 (
    .i0(n52),
    .i1(1'b1),
    .sel(n45),
    .o(n55));  // ../Command.v(270)
  AL_MUX u66 (
    .i0(n53),
    .i1(1'b0),
    .sel(n45),
    .o(n56));  // ../Command.v(270)
  AL_MUX u67 (
    .i0(bankclose),
    .i1(1'b0),
    .sel(n45),
    .o(n57));  // ../Command.v(270)
  AL_MUX u68 (
    .i0(n54),
    .i1(1'b1),
    .sel(n44),
    .o(n58));  // ../Command.v(270)
  AL_MUX u69 (
    .i0(n55),
    .i1(1'b1),
    .sel(n44),
    .o(n59));  // ../Command.v(270)
  not u7 (n3, do_reada);  // ../Command.v(90)
  AL_MUX u70 (
    .i0(n56),
    .i1(1'b0),
    .sel(n44),
    .o(n60));  // ../Command.v(270)
  AL_MUX u71 (
    .i0(n57),
    .i1(1'b1),
    .sel(n44),
    .o(n61));  // ../Command.v(270)
  buf u72 (bankaddr[0], SADDR[19]);  // ../Command.v(71)
  AL_MUX u73 (
    .i0(n61),
    .i1(bankclose),
    .sel(n0),
    .o(n62));  // ../Command.v(271)
  and u8 (n4, n2, n3);  // ../Command.v(90)
  not u9 (n5, rp_done);  // ../Command.v(90)

endmodule 

module control_interface  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(4)
  (
  ADDR,
  CLK,
  CMD,
  CM_ACK,
  RESET_N,
  CMD_ACK,
  LOAD_MODE,
  NOP,
  PRECHARGE,
  READA,
  SADDR,
  SC_BL,
  SC_CL,
  SC_PM,
  SC_RC,
  SC_RRD,
  WRITEA
  );

  input [20:0] ADDR;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(11)
  input CLK;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(8)
  input [2:0] CMD;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(10)
  input CM_ACK;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(12)
  input RESET_N;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(9)
  output CMD_ACK;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(33)
  output LOAD_MODE;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(21)
  output NOP;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(13)
  output PRECHARGE;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(19)
  output READA;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(15)
  output [20:0] SADDR;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(23)
  output [3:0] SC_BL;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(32)
  output [1:0] SC_CL;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(24)
  output SC_PM;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(30)
  output [1:0] SC_RC;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(26)
  output [3:0] SC_RRD;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(28)
  output WRITEA;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(17)

  parameter ASIZE = 21;
  wire [20:0] SADDR_int;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(38)
  wire [3:0] SC_BL_int;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(40)
  wire [1:0] n12;
  wire [1:0] n13;
  wire [3:0] n14;
  wire [3:0] n16;
  wire CMD_ACK_int;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(39)
  wire LOAD_REG1;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(36)
  wire LOAD_REG2;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(37)
  wire n0;
  wire n1;
  wire n10;
  wire n11;
  wire n15;
  wire n17;
  wire n18;
  wire n19;
  wire n2;
  wire n20;
  wire n3;
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;

  AL_DFF CMD_ACK_int_reg (
    .clk(CLK),
    .d(n20),
    .reset(n0),
    .set(1'b0),
    .q(CMD_ACK_int));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(133)
  AL_DFF LOAD_MODE_reg (
    .clk(CLK),
    .d(n5),
    .reset(n0),
    .set(1'b0),
    .q(LOAD_MODE));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  AL_DFF LOAD_REG1_reg (
    .clk(CLK),
    .d(n8),
    .reset(n0),
    .set(1'b0),
    .q(LOAD_REG1));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  AL_DFF LOAD_REG2_reg (
    .clk(CLK),
    .d(n11),
    .reset(n0),
    .set(1'b0),
    .q(LOAD_REG2));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  AL_DFF NOP_reg (
    .clk(CLK),
    .d(n1),
    .reset(n0),
    .set(1'b0),
    .q(NOP));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  AL_DFF PRECHARGE_reg (
    .clk(CLK),
    .d(n4),
    .reset(n0),
    .set(1'b0),
    .q(PRECHARGE));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  AL_DFF READA_reg (
    .clk(CLK),
    .d(n2),
    .reset(n0),
    .set(1'b0),
    .q(READA));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  AL_DFF SC_PM_reg (
    .clk(CLK),
    .d(n15),
    .reset(n0),
    .set(1'b0),
    .q(SC_PM));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(117)
  AL_DFF WRITEA_reg (
    .clk(CLK),
    .d(n3),
    .reset(n0),
    .set(1'b0),
    .q(WRITEA));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  eq_w3 eq0 (
    .i0(CMD),
    .i1(3'b000),
    .o(n1));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(59)
  eq_w3 eq1 (
    .i0(CMD),
    .i1(3'b001),
    .o(n2));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(64)
  eq_w3 eq2 (
    .i0(CMD),
    .i1(3'b010),
    .o(n3));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(69)
  eq_w3 eq3 (
    .i0(CMD),
    .i1(3'b100),
    .o(n4));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(75)
  eq_w3 eq4 (
    .i0(CMD),
    .i1(3'b101),
    .o(n5));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(80)
  eq_w3 eq5 (
    .i0(CMD),
    .i1(3'b110),
    .o(n6));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(85)
  eq_w3 eq6 (
    .i0(CMD),
    .i1(3'b111),
    .o(n9));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(90)
  binary_mux_s1_w2 mux0 (
    .i0(SC_CL),
    .i1(SADDR_int[1:0]),
    .sel(LOAD_REG1),
    .o(n12));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(116)
  binary_mux_s1_w2 mux1 (
    .i0(SC_RC),
    .i1(SADDR_int[3:2]),
    .sel(LOAD_REG1),
    .o(n13));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(116)
  binary_mux_s1_w4 mux2 (
    .i0(SC_RRD),
    .i1(SADDR_int[7:4]),
    .sel(LOAD_REG1),
    .o(n14));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(116)
  binary_mux_s1_w4 mux3 (
    .i0(SC_BL_int),
    .i1(SADDR_int[12:9]),
    .sel(LOAD_REG1),
    .o(n16));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(116)
  reg_ar_as_w21 reg0 (
    .clk(CLK),
    .d(ADDR),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(21'b000000000000000000000),
    .q(SADDR_int));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  reg_ar_as_w2 reg1 (
    .clk(CLK),
    .d(n12),
    .reset({n0,n0}),
    .set(2'b00),
    .q(SC_CL));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(117)
  reg_ar_as_w2 reg2 (
    .clk(CLK),
    .d(n13),
    .reset({n0,n0}),
    .set(2'b00),
    .q(SC_RC));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(117)
  reg_ar_as_w4 reg3 (
    .clk(CLK),
    .d(n14),
    .reset({n0,n0,n0,n0}),
    .set(4'b0000),
    .q(SC_RRD));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(117)
  reg_ar_as_w4 reg4 (
    .clk(CLK),
    .d(n16),
    .reset({n0,n0,n0,n0}),
    .set(4'b0000),
    .q(SC_BL_int));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(117)
  buf u10 (SADDR[4], SADDR_int[4]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u11 (SC_BL[1], SC_BL_int[1]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(120)
  buf u12 (SADDR[3], SADDR_int[3]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  AL_MUX u13 (
    .i0(SC_PM),
    .i1(SADDR_int[8]),
    .sel(LOAD_REG1),
    .o(n15));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(116)
  buf u14 (SADDR[0], SADDR_int[0]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u15 (SADDR[2], SADDR_int[2]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u16 (SC_BL[0], SC_BL_int[0]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(120)
  buf u17 (SADDR[1], SADDR_int[1]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u18 (SC_BL[3], SC_BL_int[3]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(120)
  or u19 (n17, CM_ACK, LOAD_REG1);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(129)
  buf u2 (SADDR[7], SADDR_int[7]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u20 (SC_BL[2], SC_BL_int[2]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(120)
  or u21 (n18, n17, LOAD_REG2);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(129)
  not u22 (n19, CMD_ACK_int);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(129)
  and u23 (n20, n18, n19);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(129)
  buf u24 (SADDR[8], SADDR_int[8]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u25 (CMD_ACK, CMD_ACK_int);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(135)
  buf u26 (SADDR[9], SADDR_int[9]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u27 (SADDR[10], SADDR_int[10]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u28 (SADDR[11], SADDR_int[11]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u29 (SADDR[12], SADDR_int[12]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u3 (SADDR[6], SADDR_int[6]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u30 (SADDR[13], SADDR_int[13]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u31 (SADDR[14], SADDR_int[14]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u32 (SADDR[15], SADDR_int[15]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u33 (SADDR[16], SADDR_int[16]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u34 (SADDR[17], SADDR_int[17]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u35 (SADDR[18], SADDR_int[18]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u36 (SADDR[19], SADDR_int[19]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u37 (SADDR[20], SADDR_int[20]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  buf u4 (SADDR[5], SADDR_int[5]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(119)
  not u5 (n0, RESET_N);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(44)
  not u6 (n7, LOAD_REG1);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(85)
  and u7 (n8, n6, n7);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(85)
  not u8 (n10, LOAD_REG2);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(90)
  and u9 (n11, n9, n10);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(90)

endmodule 

module sdr_data_path  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(3)
  (
  CLK,
  DATAIN,
  DQIN,
  OE,
  RESET_N,
  DATAOUT,
  DQOUT
  );

  input CLK;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(7)
  input [31:0] DATAIN;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(10)
  input [31:0] DQIN;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(12)
  input OE;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(9)
  input RESET_N;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(8)
  output [31:0] DATAOUT;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(11)
  output [31:0] DQOUT;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(13)

  parameter DSIZE = 32;
  wire [31:0] DIN1;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(16)
  wire [31:0] DIN2;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(17)
  wire n0;

  reg_ar_as_w32 reg0 (
    .clk(CLK),
    .d(DIN1),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(32'b00000000000000000000000000000000),
    .q(DIN2));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  reg_ar_as_w32 reg1 (
    .clk(CLK),
    .d(DATAIN),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(32'b00000000000000000000000000000000),
    .q(DIN1));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  buf u1 (DQOUT[3], DIN2[3]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u10 (DQOUT[7], DIN2[7]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u11 (DQOUT[8], DIN2[8]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u12 (DQOUT[9], DIN2[9]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u13 (DQOUT[10], DIN2[10]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u14 (DQOUT[11], DIN2[11]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u15 (DQOUT[12], DIN2[12]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u16 (DQOUT[13], DIN2[13]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u17 (DQOUT[14], DIN2[14]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u18 (DQOUT[15], DIN2[15]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u19 (DQOUT[16], DIN2[16]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u2 (DQOUT[2], DIN2[2]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u20 (DQOUT[17], DIN2[17]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u21 (DQOUT[18], DIN2[18]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u22 (DQOUT[19], DIN2[19]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u23 (DQOUT[20], DIN2[20]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u24 (DQOUT[21], DIN2[21]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u25 (DQOUT[22], DIN2[22]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u26 (DQOUT[23], DIN2[23]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u27 (DQOUT[24], DIN2[24]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u28 (DQOUT[25], DIN2[25]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u29 (DQOUT[26], DIN2[26]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u3 (DQOUT[1], DIN2[1]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u30 (DQOUT[27], DIN2[27]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u31 (DQOUT[28], DIN2[28]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u32 (DQOUT[29], DIN2[29]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u33 (DQOUT[30], DIN2[30]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u34 (DQOUT[31], DIN2[31]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u35 (DATAOUT[1], DQIN[1]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u36 (DATAOUT[2], DQIN[2]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u37 (DATAOUT[3], DQIN[3]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u38 (DATAOUT[4], DQIN[4]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u39 (DATAOUT[5], DQIN[5]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u4 (DQOUT[0], DIN2[0]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u40 (DATAOUT[6], DQIN[6]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u41 (DATAOUT[7], DQIN[7]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u42 (DATAOUT[8], DQIN[8]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u43 (DATAOUT[9], DQIN[9]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u44 (DATAOUT[10], DQIN[10]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u45 (DATAOUT[11], DQIN[11]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u46 (DATAOUT[12], DQIN[12]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u47 (DATAOUT[13], DQIN[13]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u48 (DATAOUT[14], DQIN[14]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u49 (DATAOUT[15], DQIN[15]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  not u5 (n0, RESET_N);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(21)
  buf u50 (DATAOUT[16], DQIN[16]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u51 (DATAOUT[17], DQIN[17]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u52 (DATAOUT[18], DQIN[18]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u53 (DATAOUT[19], DQIN[19]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u54 (DATAOUT[20], DQIN[20]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u55 (DATAOUT[21], DQIN[21]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u56 (DATAOUT[22], DQIN[22]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u57 (DATAOUT[23], DQIN[23]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u58 (DATAOUT[24], DQIN[24]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u59 (DATAOUT[25], DQIN[25]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u6 (DQOUT[4], DIN2[4]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u60 (DATAOUT[26], DQIN[26]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u61 (DATAOUT[27], DQIN[27]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u62 (DATAOUT[28], DQIN[28]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u63 (DATAOUT[29], DQIN[29]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u64 (DATAOUT[30], DQIN[30]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u65 (DATAOUT[31], DQIN[31]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u7 (DATAOUT[0], DQIN[0]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(32)
  buf u8 (DQOUT[5], DIN2[5]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)
  buf u9 (DQOUT[6], DIN2[6]);  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(33)

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



endmodule 

module binary_mux_s1_w25
  (
  i0,
  i1,
  sel,
  o
  );

  input [24:0] i0;
  input [24:0] i1;
  input sel;
  output [24:0] o;



endmodule 

module binary_mux_s2_w4
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  input [3:0] i2;
  input [3:0] i3;
  input [1:0] sel;
  output [3:0] o;



endmodule 

module binary_mux_s4_w8
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

  input [7:0] i0;
  input [7:0] i1;
  input [7:0] i10;
  input [7:0] i11;
  input [7:0] i12;
  input [7:0] i13;
  input [7:0] i14;
  input [7:0] i15;
  input [7:0] i2;
  input [7:0] i3;
  input [7:0] i4;
  input [7:0] i5;
  input [7:0] i6;
  input [7:0] i7;
  input [7:0] i8;
  input [7:0] i9;
  input [3:0] sel;
  output [7:0] o;



endmodule 

module binary_mux_s1_w18
  (
  i0,
  i1,
  sel,
  o
  );

  input [17:0] i0;
  input [17:0] i1;
  input sel;
  output [17:0] o;



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

module reg_ar_as_w18
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [17:0] d;
  input en;
  input [17:0] reset;
  input [17:0] set;
  output [17:0] q;



endmodule 

module reg_ar_as_w25
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [24:0] d;
  input en;
  input [24:0] reset;
  input [24:0] set;
  output [24:0] q;



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



endmodule 

module binary_mux_s1_w11
  (
  i0,
  i1,
  sel,
  o
  );

  input [10:0] i0;
  input [10:0] i1;
  input sel;
  output [10:0] o;



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

