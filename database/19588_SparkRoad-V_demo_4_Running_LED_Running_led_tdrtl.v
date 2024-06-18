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
  wire [24:0] n1;
  wire [15:0] n6;
  wire flag;  // sources/rtl/running_led.v(38)
  wire n0;
  wire n5;

  add_pu25_pu25_o25 add0 (
    .i0(cnt_time),
    .i1(25'b0000000000000000000000001),
    .o(n1));  // sources/rtl/running_led.v(46)
  eq_w25 eq0 (
    .i0(cnt_time),
    .i1(25'b0101101110001101011111111),
    .o(n0));  // sources/rtl/running_led.v(43)
  eq_w16 eq1 (
    .i0(led),
    .i1(16'b0000000000000000),
    .o(n5));  // sources/rtl/running_led.v(73)
  reg_sr_ss_w1 flag_reg (
    .clk(clk_24m),
    .d(flag),
    .en(1'b1),
    .reset(~led[0]),
    .set(~led[15]),
    .q(flag));  // sources/rtl/running_led.v(57)
  binary_mux_s1_w1 mux1_b0 (
    .i0(led[15]),
    .i1(led[1]),
    .sel(flag),
    .o(n6[0]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b1 (
    .i0(led[0]),
    .i1(led[2]),
    .sel(flag),
    .o(n6[1]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b10 (
    .i0(led[9]),
    .i1(led[11]),
    .sel(flag),
    .o(n6[10]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b11 (
    .i0(led[10]),
    .i1(led[12]),
    .sel(flag),
    .o(n6[11]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b12 (
    .i0(led[11]),
    .i1(led[13]),
    .sel(flag),
    .o(n6[12]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b13 (
    .i0(led[12]),
    .i1(led[14]),
    .sel(flag),
    .o(n6[13]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b14 (
    .i0(led[13]),
    .i1(led[15]),
    .sel(flag),
    .o(n6[14]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b15 (
    .i0(led[14]),
    .i1(led[0]),
    .sel(flag),
    .o(n6[15]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b2 (
    .i0(led[1]),
    .i1(led[3]),
    .sel(flag),
    .o(n6[2]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b3 (
    .i0(led[2]),
    .i1(led[4]),
    .sel(flag),
    .o(n6[3]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b4 (
    .i0(led[3]),
    .i1(led[5]),
    .sel(flag),
    .o(n6[4]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b5 (
    .i0(led[4]),
    .i1(led[6]),
    .sel(flag),
    .o(n6[5]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b6 (
    .i0(led[5]),
    .i1(led[7]),
    .sel(flag),
    .o(n6[6]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b7 (
    .i0(led[6]),
    .i1(led[8]),
    .sel(flag),
    .o(n6[7]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b8 (
    .i0(led[7]),
    .i1(led[9]),
    .sel(flag),
    .o(n6[8]));  // sources/rtl/running_led.v(80)
  binary_mux_s1_w1 mux1_b9 (
    .i0(led[8]),
    .i1(led[10]),
    .sel(flag),
    .o(n6[9]));  // sources/rtl/running_led.v(80)
  reg_sr_as_w1 reg0_b0 (
    .clk(clk_24m),
    .d(n6[0]),
    .en(n0),
    .reset(n5),
    .set(1'b0),
    .q(led[0]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b1 (
    .clk(clk_24m),
    .d(n6[1]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[1]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b10 (
    .clk(clk_24m),
    .d(n6[10]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[10]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b11 (
    .clk(clk_24m),
    .d(n6[11]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[11]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b12 (
    .clk(clk_24m),
    .d(n6[12]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[12]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b13 (
    .clk(clk_24m),
    .d(n6[13]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[13]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b14 (
    .clk(clk_24m),
    .d(n6[14]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[14]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b15 (
    .clk(clk_24m),
    .d(n6[15]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[15]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b2 (
    .clk(clk_24m),
    .d(n6[2]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[2]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b3 (
    .clk(clk_24m),
    .d(n6[3]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[3]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b4 (
    .clk(clk_24m),
    .d(n6[4]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[4]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b5 (
    .clk(clk_24m),
    .d(n6[5]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[5]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b6 (
    .clk(clk_24m),
    .d(n6[6]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[6]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b7 (
    .clk(clk_24m),
    .d(n6[7]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[7]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b8 (
    .clk(clk_24m),
    .d(n6[8]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[8]));  // sources/rtl/running_led.v(84)
  reg_ar_ss_w1 reg0_b9 (
    .clk(clk_24m),
    .d(n6[9]),
    .en(n0),
    .reset(1'b0),
    .set(n5),
    .q(led[9]));  // sources/rtl/running_led.v(84)
  reg_sr_as_w1 reg1_b0 (
    .clk(clk_24m),
    .d(n1[0]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[0]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b1 (
    .clk(clk_24m),
    .d(n1[1]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[1]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b10 (
    .clk(clk_24m),
    .d(n1[10]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[10]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b11 (
    .clk(clk_24m),
    .d(n1[11]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[11]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b12 (
    .clk(clk_24m),
    .d(n1[12]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[12]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b13 (
    .clk(clk_24m),
    .d(n1[13]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[13]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b14 (
    .clk(clk_24m),
    .d(n1[14]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[14]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b15 (
    .clk(clk_24m),
    .d(n1[15]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[15]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b16 (
    .clk(clk_24m),
    .d(n1[16]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[16]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b17 (
    .clk(clk_24m),
    .d(n1[17]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[17]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b18 (
    .clk(clk_24m),
    .d(n1[18]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[18]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b19 (
    .clk(clk_24m),
    .d(n1[19]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[19]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b2 (
    .clk(clk_24m),
    .d(n1[2]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[2]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b20 (
    .clk(clk_24m),
    .d(n1[20]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[20]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b21 (
    .clk(clk_24m),
    .d(n1[21]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[21]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b22 (
    .clk(clk_24m),
    .d(n1[22]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[22]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b23 (
    .clk(clk_24m),
    .d(n1[23]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[23]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b24 (
    .clk(clk_24m),
    .d(n1[24]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[24]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b3 (
    .clk(clk_24m),
    .d(n1[3]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[3]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b4 (
    .clk(clk_24m),
    .d(n1[4]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[4]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b5 (
    .clk(clk_24m),
    .d(n1[5]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[5]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b6 (
    .clk(clk_24m),
    .d(n1[6]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[6]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b7 (
    .clk(clk_24m),
    .d(n1[7]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[7]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b8 (
    .clk(clk_24m),
    .d(n1[8]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[8]));  // sources/rtl/running_led.v(47)
  reg_sr_as_w1 reg1_b9 (
    .clk(clk_24m),
    .d(n1[9]),
    .en(1'b1),
    .reset(n0),
    .set(1'b0),
    .q(cnt_time[9]));  // sources/rtl/running_led.v(47)

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

module reg_sr_ss_w1
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
  wire setout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset0 (
    .i0(setout),
    .i1(1'b0),
    .sel(reset),
    .o(resetout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(resetout),
    .reset(1'b0),
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

