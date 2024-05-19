// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.5.12854
// Fri Aug  9 16:25:45 2019

`timescale 1ns / 1ps
module top  // sources/rtl/top.v(22)
  (
  clk,
  key,
  rx,
  led,
  tx,
  vga_clk,
  vga_hs,
  vga_rgb,
  vga_vs
  );

  input clk;  // sources/rtl/top.v(24)
  input [5:0] key;  // sources/rtl/top.v(37)
  input rx;  // sources/rtl/top.v(27)
  output led;  // sources/rtl/top.v(40)
  output tx;  // sources/rtl/top.v(28)
  output vga_clk;  // sources/rtl/top.v(31)
  output vga_hs;  // sources/rtl/top.v(32)
  output [23:0] vga_rgb;  // sources/rtl/top.v(34)
  output vga_vs;  // sources/rtl/top.v(33)

  wire [10:0] axis_x;  // sources/rtl/top.v(80)
  wire [10:0] axis_y;  // sources/rtl/top.v(81)
  wire [7:0] bus_raddr;  // sources/rtl/top.v(73)
  wire [7:0] bus_rdata;  // sources/rtl/top.v(74)
  wire [7:0] bus_waddr;  // sources/rtl/top.v(70)
  wire [7:0] bus_wdata;  // sources/rtl/top.v(71)
  wire [5:0] key_deb;  // sources/rtl/top.v(85)
  wire [7:0] ram_raddr;  // sources/rtl/top.v(65)
  wire [7:0] ram_rdata;  // sources/rtl/top.v(66)
  wire [7:0] ram_waddr;  // sources/rtl/top.v(62)
  wire [7:0] ram_wdata;  // sources/rtl/top.v(63)
  wire [7:0] recv_cmd;  // sources/rtl/top.v(45)
  wire [7:0] recv_data;  // sources/rtl/top.v(46)
  wire [23:0] rom_raddr;  // sources/rtl/top.v(57)
  wire [7:0] rom_rdata;  // sources/rtl/top.v(58)
  wire [23:0] rom_waddr;  // sources/rtl/top.v(54)
  wire [7:0] rom_wdata;  // sources/rtl/top.v(55)
  wire [7:0] send_cmd;  // sources/rtl/top.v(48)
  wire [7:0] send_data;  // sources/rtl/top.v(49)
  wire [7:0] vram_addr;  // sources/rtl/top.v(92)
  wire axis_en;  // sources/rtl/top.v(79)
  wire bus_ren;  // sources/rtl/top.v(72)
  wire bus_wen;  // sources/rtl/top.v(69)
  wire clear;  // sources/rtl/top.v(84)
  wire hsyn;  // sources/rtl/top.v(77)
  wire ram_ren;  // sources/rtl/top.v(64)
  wire ram_wen;  // sources/rtl/top.v(61)
  wire recv_en;  // sources/rtl/top.v(44)
  wire rom_ren;  // sources/rtl/top.v(56)
  wire rom_wen;  // sources/rtl/top.v(53)
  wire send_en;  // sources/rtl/top.v(47)
  wire send_ready;  // sources/rtl/top.v(50)
  wire vram_rdata;  // sources/rtl/top.v(91)
  wire vram_ren;  // sources/rtl/top.v(90)
  wire vram_wdata;  // sources/rtl/top.v(89)
  wire vram_wen;  // sources/rtl/top.v(88)
  wire vsyn;  // sources/rtl/top.v(78)

  bus u_bus (
    .bus_raddr(bus_raddr),
    .bus_ren(bus_ren),
    .bus_waddr(bus_waddr),
    .bus_wdata(bus_wdata),
    .bus_wen(bus_wen),
    .clk(vga_clk),
    .key(key_deb),
    .vram_rdata(vram_rdata),
    .bus_rdata(bus_rdata),
    .clear(clear),
    .led(led),
    .vram_addr(vram_addr),
    .vram_ren(vram_ren),
    .vram_wdata(vram_wdata),
    .vram_wen(vram_wen));  // sources/rtl/top.v(201)
  cpu u_cpu (
    .bus_rdata(bus_rdata),
    .clk(vga_clk),
    .ram_rdata(ram_rdata),
    .recv_cmd(recv_cmd),
    .recv_data(recv_data),
    .recv_en(recv_en),
    .rom_rdata(rom_rdata),
    .send_ready(send_ready),
    .bus_raddr(bus_raddr),
    .bus_ren(bus_ren),
    .bus_waddr(bus_waddr),
    .bus_wdata(bus_wdata),
    .bus_wen(bus_wen),
    .ram_raddr(ram_raddr),
    .ram_ren(ram_ren),
    .ram_waddr(ram_waddr),
    .ram_wdata(ram_wdata),
    .ram_wen(ram_wen),
    .rom_raddr(rom_raddr),
    .rom_ren(rom_ren),
    .rom_waddr(rom_waddr),
    .rom_wdata(rom_wdata),
    .rom_wen(rom_wen),
    .send_cmd(send_cmd),
    .send_data(send_data),
    .send_en(send_en));  // sources/rtl/top.v(163)
  key u_key (
    .clear(clear),
    .clk(vga_clk),
    .key_i(key),
    .key_o(key_deb));  // sources/rtl/top.v(267)
  pll u_pll (
    .refclk(clk),
    .clk0_out(vga_clk));  // sources/rtl/top.v(94)
  \ram(Len=16)  u_ram (
    .clk(vga_clk),
    .ram_raddr(ram_raddr),
    .ram_ren(ram_ren),
    .ram_waddr(ram_waddr),
    .ram_wdata(ram_wdata),
    .ram_wen(ram_wen),
    .ram_rdata(ram_rdata));  // sources/rtl/top.v(148)
  \rom(Len=4096)  u_rom (
    .clk(vga_clk),
    .rom_raddr(rom_raddr),
    .rom_ren(rom_ren),
    .rom_waddr(rom_waddr),
    .rom_wdata(rom_wdata),
    .rom_wen(rom_wen),
    .rom_rdata(rom_rdata));  // sources/rtl/top.v(129)
  \uart(BAUDRATE=921600,CLK_RATE=25200000)  u_uart (
    .clk(vga_clk),
    .rx(rx),
    .send_cmd(send_cmd),
    .send_data(send_data),
    .send_en(send_en),
    .recv_cmd(recv_cmd),
    .recv_data(recv_data),
    .recv_en(recv_en),
    .send_ready(send_ready),
    .tx(tx));  // sources/rtl/top.v(105)
  vga u_vga (
    .clk(vga_clk),
    .axis_en(axis_en),
    .axis_x(axis_x),
    .axis_y(axis_y),
    .hsyn(hsyn),
    .vsyn(vsyn));  // sources/rtl/top.v(229)
  vram u_vram (
    .axis_en(axis_en),
    .axis_x(axis_x),
    .axis_y(axis_y),
    .clk(vga_clk),
    .hs_i(hsyn),
    .vram_addr(vram_addr),
    .vram_ren(vram_ren),
    .vram_wdata(vram_wdata),
    .vram_wen(vram_wen),
    .vs_i(vsyn),
    .hs_o(vga_hs),
    .rgb_o(vga_rgb),
    .vram_rdata(vram_rdata),
    .vs_o(vga_vs));  // sources/rtl/top.v(243)

endmodule 

module bus  // sources/rtl/mcu/bus.v(22)
  (
  bus_raddr,
  bus_ren,
  bus_waddr,
  bus_wdata,
  bus_wen,
  clk,
  key,
  vram_rdata,
  bus_rdata,
  clear,
  led,
  vram_addr,
  vram_ren,
  vram_wdata,
  vram_wen
  );

  input [7:0] bus_raddr;  // sources/rtl/mcu/bus.v(33)
  input bus_ren;  // sources/rtl/mcu/bus.v(32)
  input [7:0] bus_waddr;  // sources/rtl/mcu/bus.v(28)
  input [7:0] bus_wdata;  // sources/rtl/mcu/bus.v(29)
  input bus_wen;  // sources/rtl/mcu/bus.v(27)
  input clk;  // sources/rtl/mcu/bus.v(24)
  input [5:0] key;  // sources/rtl/mcu/bus.v(45)
  input vram_rdata;  // sources/rtl/mcu/bus.v(41)
  output [7:0] bus_rdata;  // sources/rtl/mcu/bus.v(34)
  output clear;  // sources/rtl/mcu/bus.v(46)
  output led;  // sources/rtl/mcu/bus.v(47)
  output [7:0] vram_addr;  // sources/rtl/mcu/bus.v(42)
  output vram_ren;  // sources/rtl/mcu/bus.v(40)
  output vram_wdata;  // sources/rtl/mcu/bus.v(39)
  output vram_wen;  // sources/rtl/mcu/bus.v(38)

  wire [7:0] n15;
  wire [7:0] n16;
  wire [7:0] n6;
  wire [7:0] n9;
  wire n0;
  wire n1;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n17;
  wire n18;
  wire n19;
  wire n2;
  wire n20;
  wire n21;
  wire n22;
  wire n3;
  wire n4;
  wire n5;
  wire n7;
  wire n8;

  AL_DFF clear_reg (
    .clk(clk),
    .d(n18),
    .reset(1'b0),
    .set(1'b0),
    .q(clear));  // sources/rtl/mcu/bus.v(86)
  eq_w8 eq0 (
    .i0(bus_waddr),
    .i1(8'b00000000),
    .o(n0));  // sources/rtl/mcu/bus.v(56)
  eq_w8 eq1 (
    .i0(bus_waddr),
    .i1(8'b00000001),
    .o(n1));  // sources/rtl/mcu/bus.v(57)
  eq_w8 eq2 (
    .i0(bus_waddr),
    .i1(8'b00000010),
    .o(n2));  // sources/rtl/mcu/bus.v(58)
  eq_w8 eq3 (
    .i0(bus_raddr),
    .i1(8'b00000000),
    .o(n11));  // sources/rtl/mcu/bus.v(70)
  eq_w8 eq4 (
    .i0(bus_raddr),
    .i1(8'b00000001),
    .o(n12));  // sources/rtl/mcu/bus.v(71)
  eq_w8 eq5 (
    .i0(bus_raddr),
    .i1(8'b00000010),
    .o(n13));  // sources/rtl/mcu/bus.v(72)
  AL_DFF led_reg (
    .clk(clk),
    .d(n8),
    .reset(1'b0),
    .set(1'b0),
    .q(led));  // sources/rtl/mcu/bus.v(62)
  binary_mux_s1_w8 mux0 (
    .i0(vram_addr),
    .i1(n6),
    .sel(bus_wen),
    .o(n9));  // sources/rtl/mcu/bus.v(61)
  binary_mux_s1_w8 mux1 (
    .i0(bus_rdata),
    .i1(n15),
    .sel(bus_ren),
    .o(n16));  // sources/rtl/mcu/bus.v(77)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n9),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(vram_addr));  // sources/rtl/mcu/bus.v(62)
  reg_ar_as_w8 reg1 (
    .clk(clk),
    .d(n16),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(bus_rdata));  // sources/rtl/mcu/bus.v(78)
  onehot_mux_s4_w8 sel0 (
    .i0(vram_addr),
    .i1(vram_addr),
    .i2(bus_wdata),
    .i3(vram_addr),
    .sel({n0,n1,n2,n3}),
    .o(n6));  // sources/rtl/mcu/bus.v(60)
  onehot_mux_s4_w8 sel1 (
    .i0(8'b00000000),
    .i1({7'b0000000,vram_rdata}),
    .i2({2'b00,key}),
    .i3({7'b0000000,led}),
    .sel({n11,n12,n13,n14}),
    .o(n15));  // sources/rtl/mcu/bus.v(76)
  and u10 (n18, bus_ren, n12);  // sources/rtl/mcu/bus.v(83)
  or u11 (n19, n13, n21);  // sources/rtl/mcu/bus.v(76)
  and u12 (n20, bus_wen, n1);  // sources/rtl/mcu/bus.v(84)
  or u13 (n21, n12, n11);  // sources/rtl/mcu/bus.v(76)
  and u14 (n22, bus_wen, n2);  // sources/rtl/mcu/bus.v(85)
  not u2 (n3, n4);  // sources/rtl/mcu/bus.v(60)
  or u3 (n4, n2, n17);  // sources/rtl/mcu/bus.v(60)
  AL_MUX u4 (
    .i0(led),
    .i1(bus_wdata[0]),
    .sel(n0),
    .o(n5));  // sources/rtl/mcu/bus.v(60)
  AL_MUX u5 (
    .i0(vram_wdata),
    .i1(bus_wdata[0]),
    .sel(n2),
    .o(n7));  // sources/rtl/mcu/bus.v(60)
  AL_MUX u6 (
    .i0(led),
    .i1(n5),
    .sel(bus_wen),
    .o(n8));  // sources/rtl/mcu/bus.v(61)
  AL_MUX u7 (
    .i0(vram_wdata),
    .i1(n7),
    .sel(bus_wen),
    .o(n10));  // sources/rtl/mcu/bus.v(61)
  or u8 (n17, n1, n0);  // sources/rtl/mcu/bus.v(60)
  not u9 (n14, n19);  // sources/rtl/mcu/bus.v(76)
  AL_DFF vram_ren_reg (
    .clk(clk),
    .d(n20),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_ren));  // sources/rtl/mcu/bus.v(86)
  AL_DFF vram_wdata_reg (
    .clk(clk),
    .d(n10),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_wdata));  // sources/rtl/mcu/bus.v(62)
  AL_DFF vram_wen_reg (
    .clk(clk),
    .d(n22),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_wen));  // sources/rtl/mcu/bus.v(86)

endmodule 

module cpu  // sources/rtl/mcu/cpu.v(22)
  (
  bus_rdata,
  clk,
  ram_rdata,
  recv_cmd,
  recv_data,
  recv_en,
  rom_rdata,
  send_ready,
  bus_raddr,
  bus_ren,
  bus_waddr,
  bus_wdata,
  bus_wen,
  ram_raddr,
  ram_ren,
  ram_waddr,
  ram_wdata,
  ram_wen,
  rom_raddr,
  rom_ren,
  rom_waddr,
  rom_wdata,
  rom_wen,
  send_cmd,
  send_data,
  send_en
  );

  input [7:0] bus_rdata;  // sources/rtl/mcu/cpu.v(48)
  input clk;  // sources/rtl/mcu/cpu.v(24)
  input [7:0] ram_rdata;  // sources/rtl/mcu/cpu.v(40)
  input [7:0] recv_cmd;  // sources/rtl/mcu/cpu.v(52)
  input [7:0] recv_data;  // sources/rtl/mcu/cpu.v(53)
  input recv_en;  // sources/rtl/mcu/cpu.v(51)
  input [7:0] rom_rdata;  // sources/rtl/mcu/cpu.v(32)
  input send_ready;  // sources/rtl/mcu/cpu.v(57)
  output [7:0] bus_raddr;  // sources/rtl/mcu/cpu.v(47)
  output bus_ren;  // sources/rtl/mcu/cpu.v(46)
  output [7:0] bus_waddr;  // sources/rtl/mcu/cpu.v(44)
  output [7:0] bus_wdata;  // sources/rtl/mcu/cpu.v(45)
  output bus_wen;  // sources/rtl/mcu/cpu.v(43)
  output [7:0] ram_raddr;  // sources/rtl/mcu/cpu.v(39)
  output ram_ren;  // sources/rtl/mcu/cpu.v(38)
  output [7:0] ram_waddr;  // sources/rtl/mcu/cpu.v(36)
  output [7:0] ram_wdata;  // sources/rtl/mcu/cpu.v(37)
  output ram_wen;  // sources/rtl/mcu/cpu.v(35)
  output [23:0] rom_raddr;  // sources/rtl/mcu/cpu.v(31)
  output rom_ren;  // sources/rtl/mcu/cpu.v(30)
  output [23:0] rom_waddr;  // sources/rtl/mcu/cpu.v(28)
  output [7:0] rom_wdata;  // sources/rtl/mcu/cpu.v(29)
  output rom_wen;  // sources/rtl/mcu/cpu.v(27)
  output [7:0] send_cmd;  // sources/rtl/mcu/cpu.v(55)
  output [7:0] send_data;  // sources/rtl/mcu/cpu.v(56)
  output send_en;  // sources/rtl/mcu/cpu.v(54)

  wire [10:0] alu_cmd;  // sources/rtl/mcu/cpu.v(76)
  wire [7:0] alu_in1;  // sources/rtl/mcu/cpu.v(77)
  wire [7:0] alu_in2;  // sources/rtl/mcu/cpu.v(78)
  wire [8:0] alu_out0;  // sources/rtl/mcu/cpu.v(79)
  wire [15:0] alu_out1;  // sources/rtl/mcu/cpu.v(80)
  wire [7:0] alu_out2;  // sources/rtl/mcu/cpu.v(81)
  wire [7:0] alu_out3;  // sources/rtl/mcu/cpu.v(82)
  wire [7:0] alu_out4;  // sources/rtl/mcu/cpu.v(83)
  wire [15:0] dbg_info;  // sources/rtl/mcu/cpu.v(94)
  wire [7:0] dbg_inst;  // sources/rtl/mcu/cpu.v(91)
  wire [23:0] dbg_rom_raddr;  // sources/rtl/mcu/cpu.v(88)
  wire [7:0] dbg_rom_rdata;  // sources/rtl/mcu/cpu.v(89)
  wire [39:0] decode_cmd;  // sources/rtl/mcu/cpu.v(67)
  wire [7:0] decode_data;  // sources/rtl/mcu/cpu.v(68)
  wire [7:0] inst;  // sources/rtl/mcu/cpu.v(64)
  wire [23:0] pc_wdata;  // sources/rtl/mcu/cpu.v(62)
  wire [3:0] read_abcd;  // sources/rtl/mcu/cpu.v(93)
  wire [23:0] timer_wdata;  // sources/rtl/mcu/cpu.v(72)
  wire dbg_en;  // sources/rtl/mcu/cpu.v(86)
  wire dbg_info_en;  // sources/rtl/mcu/cpu.v(92)
  wire dbg_inst_en;  // sources/rtl/mcu/cpu.v(90)
  wire dbg_rom_ren;  // sources/rtl/mcu/cpu.v(87)
  wire inst_en;  // sources/rtl/mcu/cpu.v(63)
  wire pc_wen;  // sources/rtl/mcu/cpu.v(61)
  wire timer_state;  // sources/rtl/mcu/cpu.v(73)
  wire timer_wen;  // sources/rtl/mcu/cpu.v(71)

  alu u_alu (
    .alu_cmd(alu_cmd),
    .alu_in1(alu_in1),
    .alu_in2(alu_in2),
    .clk(clk),
    .alu_out0(alu_out0),
    .alu_out1(alu_out1),
    .alu_out2(alu_out2),
    .alu_out3(alu_out3),
    .alu_out4(alu_out4));  // sources/rtl/mcu/cpu.v(190)
  debug u_debug (
    .clk(clk),
    .dbg_info(dbg_info),
    .dbg_info_en(dbg_info_en),
    .recv_cmd(recv_cmd),
    .recv_data(recv_data),
    .recv_en(recv_en),
    .rom_rdata(dbg_rom_rdata),
    .send_ready(send_ready),
    .dbg_en(dbg_en),
    .dbg_inst(dbg_inst),
    .dbg_inst_en(dbg_inst_en),
    .read_abcd(read_abcd),
    .rom_raddr(dbg_rom_raddr),
    .rom_ren(dbg_rom_ren),
    .rom_waddr(rom_waddr),
    .rom_wdata(rom_wdata),
    .rom_wen(rom_wen),
    .send_cmd(send_cmd),
    .send_data(send_data),
    .send_en(send_en));  // sources/rtl/mcu/cpu.v(221)
  decode u_decode (
    .clk(clk),
    .inst(inst),
    .inst_en(inst_en),
    .decode_cmd(decode_cmd),
    .decode_data(decode_data));  // sources/rtl/mcu/cpu.v(127)
  execute u_execute (
    .alu_out0(alu_out0),
    .alu_out1(alu_out1),
    .alu_out2(alu_out2),
    .alu_out3(alu_out3),
    .alu_out4(alu_out4),
    .bus_rdata(bus_rdata),
    .clk(clk),
    .decode_cmd(decode_cmd),
    .decode_data(decode_data),
    .ram_rdata(ram_rdata),
    .read_abcd(read_abcd),
    .alu_cmd(alu_cmd),
    .alu_in1(alu_in1),
    .alu_in2(alu_in2),
    .bus_raddr(bus_raddr),
    .bus_ren(bus_ren),
    .bus_waddr(bus_waddr),
    .bus_wdata(bus_wdata),
    .bus_wen(bus_wen),
    .dbg_info(dbg_info),
    .dbg_info_en(dbg_info_en),
    .pc_wdata(pc_wdata),
    .pc_wen(pc_wen),
    .ram_raddr(ram_raddr),
    .ram_ren(ram_ren),
    .ram_waddr(ram_waddr),
    .ram_wdata(ram_wdata),
    .ram_wen(ram_wen),
    .timer_wdata(timer_wdata),
    .timer_wen(timer_wen));  // sources/rtl/mcu/cpu.v(141)
  fetch u_fetch (
    .clk(clk),
    .dbg_en(dbg_en),
    .dbg_inst(dbg_inst),
    .dbg_inst_en(dbg_inst_en),
    .dbg_rom_raddr(dbg_rom_raddr),
    .dbg_rom_ren(dbg_rom_ren),
    .pc_wdata(pc_wdata),
    .pc_wen(pc_wen),
    .rom_rdata(rom_rdata),
    .timer_state(timer_state),
    .dbg_rom_rdata(dbg_rom_rdata),
    .inst(inst),
    .inst_en(inst_en),
    .rom_raddr(rom_raddr),
    .rom_ren(rom_ren));  // sources/rtl/mcu/cpu.v(97)
  timer u_timer (
    .clk(clk),
    .timer_wdata(timer_wdata),
    .timer_wen(timer_wen),
    .timer_state(timer_state));  // sources/rtl/mcu/cpu.v(208)

endmodule 

module key  // sources/rtl/key/key.v(22)
  (
  clear,
  clk,
  key_i,
  key_o
  );

  input clear;  // sources/rtl/key/key.v(27)
  input clk;  // sources/rtl/key/key.v(24)
  input [5:0] key_i;  // sources/rtl/key/key.v(30)
  output [5:0] key_o;  // sources/rtl/key/key.v(31)

  wire [18:0] cnt;  // sources/rtl/key/key.v(34)
  wire [5:0] key_d0;  // sources/rtl/key/key.v(35)
  wire [5:0] key_d1;  // sources/rtl/key/key.v(36)
  wire [5:0] n15;
  wire [5:0] n16;
  wire [18:0] n3;
  wire [5:0] n33;
  wire [5:0] n34;
  wire key_flag;  // sources/rtl/key/key.v(37)
  wire n0;
  wire n1;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n17;
  wire n18;
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
  wire n28;
  wire n29;
  wire n30;
  wire n31;
  wire n32;
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;

  add_pu19_pu19_o19 add0 (
    .i0(cnt),
    .i1(19'b0000000000000000001),
    .o(n3));  // sources/rtl/key/key.v(42)
  AL_DFF key_flag_reg (
    .clk(clk),
    .d(n25),
    .reset(1'b0),
    .set(1'b0),
    .q(key_flag));  // sources/rtl/key/key.v(57)
  binary_mux_s1_w6 mux0 (
    .i0(key_d0),
    .i1(n15),
    .sel(n14),
    .o(n16));  // sources/rtl/key/key.v(49)
  binary_mux_s1_w6 mux1 (
    .i0(key_o),
    .i1(key_d1),
    .sel(key_flag),
    .o(n33));  // sources/rtl/key/key.v(65)
  binary_mux_s1_w6 mux2 (
    .i0(n33),
    .i1(6'b000000),
    .sel(clear),
    .o(n34));  // sources/rtl/key/key.v(65)
  reg_ar_as_w6 reg0 (
    .clk(clk),
    .d(n16),
    .reset(6'b000000),
    .set(6'b000000),
    .q(key_d0));  // sources/rtl/key/key.v(50)
  reg_ar_as_w6 reg1 (
    .clk(clk),
    .d(key_d0),
    .reset(6'b000000),
    .set(6'b000000),
    .q(key_d1));  // sources/rtl/key/key.v(57)
  reg_ar_as_w6 reg2 (
    .clk(clk),
    .d(n34),
    .reset(6'b000000),
    .set(6'b000000),
    .q(key_o));  // sources/rtl/key/key.v(66)
  reg_ar_as_w19 reg3 (
    .clk(clk),
    .d(n3),
    .reset(19'b0000000000000000000),
    .set(19'b0000000000000000000),
    .q(cnt));  // sources/rtl/key/key.v(43)
  or u10 (n24, n1, n13);  // sources/rtl/key/key.v(56)
  or u11 (n11, key_d1[0], n12);  // sources/rtl/key/key.v(56)
  or u12 (n10, key_d1[4], key_d1[5]);  // sources/rtl/key/key.v(56)
  or u13 (n9, key_d1[3], n10);  // sources/rtl/key/key.v(56)
  or u14 (n8, n11, n9);  // sources/rtl/key/key.v(56)
  not u15 (n23, n8);  // sources/rtl/key/key.v(56)
  not u16 (n15[1], key_i[1]);  // sources/rtl/key/key.v(49)
  not u17 (n15[2], key_i[2]);  // sources/rtl/key/key.v(49)
  not u18 (n15[3], key_i[3]);  // sources/rtl/key/key.v(49)
  not u19 (n15[4], key_i[4]);  // sources/rtl/key/key.v(49)
  or u2 (n1, key_d0[0], n2);  // sources/rtl/key/key.v(56)
  not u20 (n15[5], key_i[5]);  // sources/rtl/key/key.v(49)
  and u21 (n18, cnt[2], cnt[3]);  // sources/rtl/key/key.v(48)
  and u22 (n19, n17, n18);  // sources/rtl/key/key.v(48)
  and u23 (n20, cnt[4], cnt[5]);  // sources/rtl/key/key.v(48)
  and u24 (n21, cnt[7], cnt[8]);  // sources/rtl/key/key.v(48)
  and u25 (n22, cnt[6], n21);  // sources/rtl/key/key.v(48)
  and u26 (n26, n20, n22);  // sources/rtl/key/key.v(48)
  and u27 (n27, n19, n26);  // sources/rtl/key/key.v(48)
  and u28 (n28, cnt[9], cnt[10]);  // sources/rtl/key/key.v(48)
  and u29 (n29, cnt[12], cnt[13]);  // sources/rtl/key/key.v(48)
  or u3 (n2, key_d0[1], key_d0[2]);  // sources/rtl/key/key.v(56)
  and u30 (n30, cnt[11], n29);  // sources/rtl/key/key.v(48)
  and u31 (n31, n28, n30);  // sources/rtl/key/key.v(48)
  and u32 (n32, cnt[14], cnt[15]);  // sources/rtl/key/key.v(48)
  and u33 (n7, cnt[17], cnt[18]);  // sources/rtl/key/key.v(48)
  and u34 (n6, cnt[16], n7);  // sources/rtl/key/key.v(48)
  and u35 (n5, n32, n6);  // sources/rtl/key/key.v(48)
  and u36 (n4, n31, n5);  // sources/rtl/key/key.v(48)
  and u37 (n14, n27, n4);  // sources/rtl/key/key.v(48)
  and u4 (n17, cnt[0], cnt[1]);  // sources/rtl/key/key.v(48)
  not u5 (n15[0], key_i[0]);  // sources/rtl/key/key.v(49)
  or u6 (n12, key_d1[1], key_d1[2]);  // sources/rtl/key/key.v(56)
  and u7 (n25, n23, n24);  // sources/rtl/key/key.v(56)
  or u8 (n0, key_d0[4], key_d0[5]);  // sources/rtl/key/key.v(56)
  or u9 (n13, key_d0[3], n0);  // sources/rtl/key/key.v(56)

endmodule 

module pll  // al_ip/pll.v(22)
  (
  refclk,
  clk0_out
  );

  input refclk;  // al_ip/pll.v(25)
  output clk0_out;  // al_ip/pll.v(26)

  wire clk0_buf;  // al_ip/pll.v(28)

  EG_LOGIC_BUFG bufg_feedback (
    .i(clk0_buf),
    .o(clk0_out));  // al_ip/pll.v(30)
  EG_PHY_PLL #(
    .CLKC0_CPHASE(39),
    .CLKC0_DIV(40),
    .CLKC0_DIV2_ENABLE("DISABLE"),
    .CLKC0_ENABLE("ENABLE"),
    .CLKC0_FPHASE(0),
    .CLKC1_CPHASE(1),
    .CLKC1_DIV(1),
    .CLKC1_DIV2_ENABLE("DISABLE"),
    .CLKC1_ENABLE("DISABLE"),
    .CLKC1_FPHASE(0),
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
    .FBCLK_DIV(17),
    .FEEDBK_MODE("NORMAL"),
    .FEEDBK_PATH("CLKC0_EXT"),
    .FIN("24.000"),
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
    .REFCLK_DIV(16),
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
    .clkc({open_n0,open_n1,open_n2,open_n3,clk0_buf}));  // al_ip/pll.v(53)

endmodule 

module \ram(Len=16)   // sources/rtl/mcu/ram.v(22)
  (
  clk,
  ram_raddr,
  ram_ren,
  ram_waddr,
  ram_wdata,
  ram_wen,
  ram_rdata
  );

  input clk;  // sources/rtl/mcu/ram.v(27)
  input [7:0] ram_raddr;  // sources/rtl/mcu/ram.v(36)
  input ram_ren;  // sources/rtl/mcu/ram.v(35)
  input [7:0] ram_waddr;  // sources/rtl/mcu/ram.v(31)
  input [7:0] ram_wdata;  // sources/rtl/mcu/ram.v(32)
  input ram_wen;  // sources/rtl/mcu/ram.v(30)
  output [7:0] ram_rdata;  // sources/rtl/mcu/ram.v(37)

  parameter Len = 16;
  wire [7:0] n5;
  wire [7:0] n6;
  wire n0;
  wire n1;
  wire n2;
  wire n3;
  wire n4;
  wire n7;

  binary_mux_s1_w8 mux0 (
    .i0(ram_rdata),
    .i1(n5),
    .sel(ram_ren),
    .o(n6));  // sources/rtl/mcu/ram.v(53)
  ram_w4x8_r4x8 #(
    .DATA_DEPTH_LEFT("0"),
    .DATA_DEPTH_RIGHT("15"),
    .DATA_WIDTH_LEFT("7"),
    .DATA_WIDTH_RIGHT("0"))
    ram_ram_reg (
    .clk1(clk),
    .ra1(ram_raddr[3:0]),
    .re1(1'b1),
    .wa1(ram_waddr[3:0]),
    .wd1(ram_wdata),
    .we1(n4),
    .rd1(n5));  // sources/rtl/mcu/ram.v(40)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n6),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(ram_rdata));  // sources/rtl/mcu/ram.v(54)
  or u2 (n0, ram_waddr[6], ram_waddr[7]);  // sources/rtl/mcu/ram.v(46)
  or u3 (n1, ram_waddr[4], ram_waddr[5]);  // sources/rtl/mcu/ram.v(46)
  and u4 (n4, n2, n3);  // sources/rtl/mcu/ram.v(46)
  buf u5 (n3, ram_wen);  // sources/rtl/mcu/ram.v(47)
  or u6 (n7, n1, n0);  // sources/rtl/mcu/ram.v(46)
  not u7 (n2, n7);  // sources/rtl/mcu/ram.v(46)

endmodule 

module \rom(Len=4096)   // sources/rtl/mcu/rom.v(22)
  (
  clk,
  rom_raddr,
  rom_ren,
  rom_waddr,
  rom_wdata,
  rom_wen,
  rom_rdata
  );

  input clk;  // sources/rtl/mcu/rom.v(27)
  input [23:0] rom_raddr;  // sources/rtl/mcu/rom.v(36)
  input rom_ren;  // sources/rtl/mcu/rom.v(35)
  input [23:0] rom_waddr;  // sources/rtl/mcu/rom.v(31)
  input [7:0] rom_wdata;  // sources/rtl/mcu/rom.v(32)
  input rom_wen;  // sources/rtl/mcu/rom.v(30)
  output [7:0] rom_rdata;  // sources/rtl/mcu/rom.v(37)

  parameter Len = 4096;
  wire [7:0] n6;
  wire [7:0] n7;
  wire n0;
  wire n1;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n15;
  wire n2;
  wire n3;
  wire n4;
  wire n5;
  wire n8;
  wire n9;

  binary_mux_s1_w8 mux0 (
    .i0(rom_rdata),
    .i1(n6),
    .sel(rom_ren),
    .o(n7));  // sources/rtl/mcu/rom.v(59)
  ram_w12x8_r12x8 #(
    .DATA_DEPTH_LEFT("0"),
    .DATA_DEPTH_RIGHT("4095"),
    .DATA_WIDTH_LEFT("7"),
    .DATA_WIDTH_RIGHT("0"),
    .INIT_VALUE(32768'b0000000100000000000001000000101000011101000000010000000100000100000011000001110100000001000000000000010000000111000111010000000100000000000000100000000000000011110001110000010000000000000011010000000000000000000000000000000000000000000000000000000100000001000001000000011100011101000000010000000000000010000000010000001111110101000001000000000000001101000000000000000000000000000000000000000000000000000001000000000100000001000000000000001000000000000000111100011100001101000000000000000000000000000000000000000000000000000000010000001000000100000001110001110100000001000000000000001000000011000000110100010100000100000000000000110100000000000000000000000000000000000000000000000000000100000011000001110000001000000000010000000000000010000000000000001101111111000011010000000000000000000000000000000000000000000000000000000100000000000001000000110000011101000000010000001100000100000001110001110100000001000000000000001000000010000000110100010100000100000000000000110100000000000000000000000000000000000000000000000000000100000010100001110000000101000000100000000100001111000001000000101000100001000001000000101000011100000001010000001011111111000100110000010000001011001001000000010000001011000111000000100000000001000000000000001000000000000000111010100100001101000000000000000000000000000000000000000000000000000000010000000100000100000011000001110100000001000001110000001010110000000000111100000000001110000000000000000000000000000000000000000000000000000000000000000000000001000000000000001000000000000000110011001000000100000000000000110100000000000000000000000000000000000000000000000000000001000000000000010000000000000111010000000100000001000001000000011000011101000001000000011000011100000010000000000100000000000000100000000100000011010110010000110100000000000000000000000000000000000000000000000000000001000000000000010000000001000111010000010000000110000111000000100000000001000000000000001000000001000000110011000100001101000000000000000000000000000000000000000000000000000001000000000000011100000001010000010000000001000110100000000100000001000001000000001000011010000001000000000000011100000001010000001000000001000011110000010000000000001000010000010000000001000111000000010100000010000000010000111100000100000000010010000100000001000100100000010000000001000111000000011000010010000001000000011000100100000000010000000000000010000000000000001111100111000001000000000000001101000000000000000000000000000000000000000000000000000000011110101000000100000000000001110000000110000100100000010000000110001001000000000100010011000000100011100100000011111000000000111000000000000000000000000000000000000000000000000000000000000000000000000100000000000000100000000000000011110100010000010000000000000011010000000000000000000000000000000000000000000000000000000100000001000001000000011000011101000001000000011000011100000010000000000100000000000000100000000100000011111001100000110100000000000000000000000000000000000000000000000000000001000000000000010000000001000111010000010000000110000111000000100000000001000000000000001000000001000000111011111000001101000000000000000000000000000000000000000000000000000001000000000000011100000001010000001000000001000100000000010000000000001000010000010000000001000111000000010100000010000000010000111100000100000000010010000100000100000000000001110000000101000001000000000100011010000000010000000000000100000000100001101000000001000100100000010000000001000111000000011000010010000001000000011000100100000000010000000000000010000000010000001101110100000001000000000000001101000000000000000000000000000000000000000000000000000001000000000000011100000001010000001000000000000100100000010000000110001001000000000100010011000000100011100100000011111000000000111000000000000000000000000000000000000000000000000000000000000000000000000100000000000000100000000100000011010111100000010000000000000011010000000000000000000000000000000000000000000000000000000100000000000000100000011100000011111011100000010000000000000011010000000000000000000000000000000000000000000000000000000100001000000001000000100100011101000000011011110000000100000000010001101000000001000000010000010000000010000110100000000111001101000001000000000100011010000000010000000100000100000000100001101000000001110011100000010000000001000110100000000100000001000001000000001000011010000000011100111100000100000000010001101000000001000000010000010000000010000110100000000111011111000001000000000100011010000000010000000100000100000000100001101000000001111000010000010000000001000110100000000100000001000001000000001000011010000000010000000000000010000001110000001111101110000001000000000000001101000000000000000000000000000000000000000000000000000000011011001100000100000000000001110100000001000000000000010000000001000111010000000100000001000001000000011000011101000001000000011000011100000010000000000100000000000000100000001000000011111001110000110100000000000000000000000000000000000000000000000000000001000000000000010000000001000111010000010000000110000111000000100000000001000000000000001000000010000000111100111000001101000000000000000000000000000000000000000000000000000001000000000000011100000001010000001000010010000100000000010000000010001000010000010000000010000111000000010100000100000000010001101000000100000000100001101100001001000001000000010000011101000001000000000000011100000001010000010000000001000110100000010000000100000111000000010100000100000000100001101000000100000000000001110000000101000000100000000100010000000001000000000000100001000001000000000100011100000001010000001000000001000011110000010000000001001000010000000100010010000001000000000100011100000001100001001000000100000001100010010000000001000000000000001000000010000000110110101000000100000000000000110100000000000000000000000000000000000000000000000000000100000000000001110000000101000000100001000100010010000001000000011000100100000000010000000000000010000000100000001101010100000001000000000000001101000000000000000000000000000000000000000000000000000000010000000100000100000001100001110100000100000001100001110000001000000000010000000000000010000000110000001100110110000011010000000000000000000000000000000000000000000000000000010000000000000111000000010100000100000000010001101000000001000000010000010000000010000110100000010000000000000111000000010100000010000000000001001100000100000001100010010000000100000001100001110000000110000000010000000100010010000001000000011000100100000001000000000000011100000001010000001000000001000100000000010000000000001000010000000100000000000000100000001000000011111011000000010000000000000011010000000000000000000000000000000000000000000000000000000100000000000000100000011100000011111011100000010000000000000011010000000000000000000000000000000000000000000000000000010000000001000110110000100100000100000001010001110100000100000001010001110000000101000000100000000100010011000001000000011000100100000001000000011000011100000010000000000100000000000000100000010000000011111101100000110100000000000000000000000000000000000000000000000000000001101000100000010000000000000111010000010000000000000111000000010100000100000010010001110000000110000011110000010000001000001000010000010000001000000111000000010100000100000000010001101000000001000000010000010000000010000110100000000100000111000000101011000000000011110000000000111000000000000000000000000000000000000000000000000000000000000000000000010000001010000111000000010100000010000000010000111100000100000010100010000100000100000010100001110000000101000000101111111100010011000001000000101100100100000001000000101100011100000010000000000100000000000000100000001100000011101111010000110100000000000000000000000000000000000000000000000000000001000000010000010000001100000111010000010000000110000111000000100000000001000000000000001000000100000000111111011000001101000000000000000000000000000000000000000000000000000000010000000100000100000000100001110100000100000010000001110000000101000000100001001000010010000001000000011000100100000100110000010000000110000111000000010100000100000001100010010000000100000001100001110000000110000101100000010000000110001001010000010000000110000111000000100000000001000000000000001000000100000000111101110100001101000000000000000000000000000000000000000000000000000001000000100000011100000001010000001000010010000100000000010000000001001000010000010000000001000111000000010100000100000000010001101000000100000000100001101100001001000001000000001000011101000001000000100000011100000001010000010000000001000110100000000100000000000001000000001000011010000001000000100000011100000001010000001000010010000100000000010000001000001000010000010000001000000111000000010100000100000000010001101000000001000000010000010000000010000110100000000100000111000000101011000000000011110000000000111000000000000000000000000000000000000000000000000000000000000000000000010000001010000111000000010100000010000000010000111100000100000010100010000100000100000010100001110000000101000000101111111100010011000001000000101100100100000001000000101100011100000010000000000100000000000000100000010000000011011100010000110100000000000000000000000000000000000000000000000000000001000000010000010000001100000111010000000100010010000001000000100000011100000001100001001000000100000001100010010000000100000001100001110000000101000001000000001000011100000001100001011000000100000001100010010100000100000001100001110000001000000000010000000000000010000001000000001111011101000011010000000000000000000000000000000000000000000000000000000100000111000000101011000000000011110000000000111000000000000000000000000000000000000000000000000000000000000000000000010000001010000111000000010100000010000000010000111100000100000010100010000100000100000010100001110000000101000000101111111100010011000001000000101100100100000001000000101100011100000010000000000100000000000000100000010000000011110100010000110100000000000000000000000000000000000000000000000000000001000000010000010000001100000111010000010000001000000111000000010100000100000000010001101000000001000000000000010000000010000110100000010000000010000111000000011000000001000000010001001000000100000001100010010000000001000000000000001000000011000000111011110100000100000000000000110100000000000000000000000000000000000000000000000000000100000001010001110000000101000000100000001000010011000001000000011000100100000001000000011000011100000010000000000100000000000000100000010100000011000100010000110100000000000000000000000000000000000000000000000000000100000001010001110000000101000000100000010000010011000001000000011000100100000001000000011000011100000010000000000100000000000000100000010100000011001011000000110100000000000000000000000000000000000000000000000000000100000001010001110000000101000000100000100000010011000001000000011000100100000001000000011000011100000010000000000100000000000000100000011000000011011110000000110100000000000000000000000000000000000000000000000000000001110001010000010000000000000111010000000111010111000001000000000100011101000000011110100100000100000000100001110100000001000100000000010000001001000111000000011000010010000001000000011000100100000001000000011000011100000010000000000100000000000000100000011000000011000110100000110100000000000000000000000000000000000000000000000000000100000000000001110000000101000000100000000100010000000001000000001100100001000001000000001100011100000001010000010000000001000110100000010000000010000110110000100100000100000001000001110100000100000000000001110000000101000001000000000100011010000001000000010000011100000001010000010000000010000110100000010000000000000111000000010100000010000000010001000000000100000000000010000100000100000000010001110000000101000000100000000100010000000001000000001100100001000001000000001100011100000001010000010000000001000110100000010000000010000110110000100100000100000001000001110100000100000000010001110000000101000001000000000100011010000001000000010000011100000001010000010000000010000110100000010000000001000111000000010100000010000000010001000000000100000000010010000100000100000000100001110000000101000000100000000100010000000001000000001100100001000001000000001100011100000001010000010000000001000110100000010000000010000110110000100100000100000001000001110100000100000000100001110000000101000001000000000100011010000001000000010000011100000001010000010000000010000110100000010000000010000111000000010100000010000000010001000000000100000000100010000100000100000000100001110000000101000000101101100000010010000001000000011000100100000000010000000000000010000001010000001101100000000001000000000000001101000000000000000000000000000000000000000000000000000000010001000000000100000010010001110000000110000100100000010000000110001001000000010000000110000111000000100000000001000000000000001000000110000000110101001100001101000000000000000000000000000000000000000000000000000000011011010000000100000000010001101000000001000000000000010000000010000110100000000111000110000001000000000100011010000000010000000000000100000000100001101000000001110110000000010000000001000110100000000100000000000001000000001000011010000000010001000000000100000010010001110000000110000100100000010000000110001001000000010000000110000111000000100000000001000000000000001000000110000000110111100000001101000000000000000000000000000000000000000000000000000001000000100100011100000001010000001000000001000011110000010000001001001000010000010000000101000111000000010100000010000100000001001100000100000001100010010000000100000001100001110000001000000000010000000000000010000001100000001110010011000011010000000000000000000000000000000000000000000000000000010000000101000111000000010100000010001000000001001100000100000001100010010000000100000001100001110000001000000000010000000000000010000001110000001111011111000011010000000000000000000000000000000000000000000000000000000110110100000001000000000000011101000000011100011000000100000000010001110100000001110110000000010000000010000111010000010000001001000111000000010100000010000000010001001000000100000001100010010000000100000001100001110000001000000000010000000000000010000001110000001110000001000011010000000000000000000000000000000000000000000000000000010000000000000111000000010100000010000000010000111100000100000000110010000100000100000000110001110000000101000001000000000100011010000001000000001000011011000010010000010000000100000111010000010000000000000111000000010100000100000000010001101000000100000001000001110000000101000001000000001000011010000001000000000000011100000001010000001000000001000011110000010000000000001000010000010000000001000111000000010100000010000000010000111100000100000000110010000100000100000000110001110000000101000001000000000100011010000001000000001000011011000010010000010000000100000111010000010000000001000111000000010100000100000000010001101000000100000001000001110000000101000001000000001000011010000001000000000100011100000001010000001000000001000011110000010000000001001000010000010000000010000111000000010100000010000000010000111100000100000000110010000100000100000000110001110000000101000001000000000100011010000001000000001000011011000010010000010000000100000111010000010000000010000111000000010100000100000000010001101000000100000001000001110000000101000001000000001000011010000001000000001000011100000001010000001000000001000011110000010000000010001000010000000111101001000001000000001000011100000001100001001000000100000001100010010000000001000000000000001000000110000000111100011100000100000000000000110100000000000000000000000000000000000000000000000000000100000010010001110000000101000000100000000100010010000001000000011000100100000001000000011000011100000010000000000100000000000000100000011100000011101110100000110100000000000000000000000000000000000000000000000000000001110001010000010000000001000110100000000100000000000001000000001000011010000000011101011100000100000000010001101000000001000000000000010000000010000110100000000111101001000001000000000100011010000000010000000000000100000000100001101000000100000010010001110000000101000000100000000100010010000001000000011000100100000001000000011000011100000010000000000100000000000000100000011100000011110111110000110100000000000000000000000000000000000000000000000000000100000010010001110000000101000000100000000100010000000001000000100100100001000000010000000000000010000001110000001111101110000001000000000000001101000000000000000000000000000000000000000000000000000001000000011100011100000001010000001000000000000100110000010000000110001001000000010000000110000111000000100000000001000000000000001000001000000000110001100000001101000000000000000000000000000000000000000000000000000000010000000000000010000000000000001100011110000001000000000000001101000000000000000000000000000000000000000000000000000001000000011100011100000001010000001000000001000100110000010000000110001001000000010000000110000111000000100000000001000000000000001000001000000000110100001000001101000000000000000000000000000000000000000000000000000000010000000000000010000000000000001100110010000001000000000000001101000000000000000000000000000000000000000000000000000001000000011100011100000001010000001000000010000100110000010000000110001001000000010000000110000111000000100000000001000000000000001000001000000000110110110000001101000000000000000000000000000000000000000000000000000000010000000000000010000000000000001101010101000001000000000000001101000000000000000000000000000000000000000000000000000001000000011100011100000001010000001000000011000100110000010000000110001001000000010000000110000111000000100000000001000000000000001000001000000000111001011000001101000000000000000000000000000000000000000000000000000000010000000000000010000000000000001101111111000001000000000000001101000000000000000000000000000000000000000000000000000000010000000000000010000010000000001110010110000001000000000000001101000000000000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx))
    ram_rom_reg (
    .clk1(clk),
    .ra1(rom_raddr[11:0]),
    .re1(1'b1),
    .wa1(rom_waddr[11:0]),
    .wd1(rom_wdata),
    .we1(n4),
    .rd1(n6));  // sources/rtl/mcu/rom.v(40)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n7),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(rom_rdata));  // sources/rtl/mcu/rom.v(60)
  or u10 (n13, rom_waddr[18], n12);  // sources/rtl/mcu/rom.v(52)
  or u11 (n14, rom_waddr[22], rom_waddr[23]);  // sources/rtl/mcu/rom.v(52)
  or u12 (n15, rom_waddr[21], n14);  // sources/rtl/mcu/rom.v(52)
  or u13 (n5, n13, n15);  // sources/rtl/mcu/rom.v(52)
  or u14 (n8, n11, n5);  // sources/rtl/mcu/rom.v(52)
  not u15 (n2, n8);  // sources/rtl/mcu/rom.v(52)
  or u2 (n0, rom_waddr[12], n1);  // sources/rtl/mcu/rom.v(52)
  or u3 (n1, rom_waddr[13], rom_waddr[14]);  // sources/rtl/mcu/rom.v(52)
  and u4 (n4, n2, n3);  // sources/rtl/mcu/rom.v(52)
  buf u5 (n3, rom_wen);  // sources/rtl/mcu/rom.v(53)
  or u6 (n9, rom_waddr[16], rom_waddr[17]);  // sources/rtl/mcu/rom.v(52)
  or u7 (n10, rom_waddr[15], n9);  // sources/rtl/mcu/rom.v(52)
  or u8 (n11, n0, n10);  // sources/rtl/mcu/rom.v(52)
  or u9 (n12, rom_waddr[19], rom_waddr[20]);  // sources/rtl/mcu/rom.v(52)

endmodule 

module \uart(BAUDRATE=921600,CLK_RATE=25200000)   // sources/rtl/uart/uart.v(23)
  (
  clk,
  rx,
  send_cmd,
  send_data,
  send_en,
  recv_cmd,
  recv_data,
  recv_en,
  send_ready,
  tx
  );

  input clk;  // sources/rtl/uart/uart.v(29)
  input rx;  // sources/rtl/uart/uart.v(32)
  input [7:0] send_cmd;  // sources/rtl/uart/uart.v(42)
  input [7:0] send_data;  // sources/rtl/uart/uart.v(43)
  input send_en;  // sources/rtl/uart/uart.v(41)
  output [7:0] recv_cmd;  // sources/rtl/uart/uart.v(37)
  output [7:0] recv_data;  // sources/rtl/uart/uart.v(38)
  output recv_en;  // sources/rtl/uart/uart.v(36)
  output send_ready;  // sources/rtl/uart/uart.v(44)
  output tx;  // sources/rtl/uart/uart.v(33)

  parameter BAUDRATE = 921600;
  parameter CLK_RATE = 25200000;
  wire [7:0] rx_data;  // sources/rtl/uart/uart.v(48)
  wire [7:0] tx_data;  // sources/rtl/uart/uart.v(50)
  wire rx_en;  // sources/rtl/uart/uart.v(47)
  wire tx_en;  // sources/rtl/uart/uart.v(49)
  wire tx_ready;  // sources/rtl/uart/uart.v(51)

  \uart_rx(BAUDRATE=921600,CLK_RATE=25200000)  u_uart_rx (
    .clk(clk),
    .rx(rx),
    .rx_data(rx_data),
    .rx_en(rx_en));  // sources/rtl/uart/uart.v(59)
  \uart_tx(BAUDRATE=921600,CLK_RATE=25200000)  u_uart_tx (
    .clk(clk),
    .tx_data(tx_data),
    .tx_en(tx_en),
    .tx(tx),
    .tx_ready(tx_ready));  // sources/rtl/uart/uart.v(73)
  ubus u_ubus (
    .clk(clk),
    .rx_data(rx_data),
    .rx_en(rx_en),
    .send_cmd(send_cmd),
    .send_data(send_data),
    .send_en(send_en),
    .tx_ready(tx_ready),
    .recv_cmd(recv_cmd),
    .recv_data(recv_data),
    .recv_en(recv_en),
    .send_ready(send_ready),
    .tx_data(tx_data),
    .tx_en(tx_en));  // sources/rtl/uart/uart.v(90)

endmodule 

module vga  // sources/rtl/vga/vga.v(31)
  (
  clk,
  axis_en,
  axis_x,
  axis_y,
  hsyn,
  vsyn
  );

  input clk;  // sources/rtl/vga/vga.v(45)
  output axis_en;  // sources/rtl/vga/vga.v(52)
  output [10:0] axis_x;  // sources/rtl/vga/vga.v(53)
  output [10:0] axis_y;  // sources/rtl/vga/vga.v(54)
  output hsyn;  // sources/rtl/vga/vga.v(48)
  output vsyn;  // sources/rtl/vga/vga.v(49)

  parameter A = 96;
  parameter B = 48;
  parameter C = 640;
  parameter D = 16;
  parameter E = 800;
  parameter F = 2;
  parameter G = 33;
  parameter H = 480;
  parameter I = 10;
  parameter K = 525;
  wire [12:0] hsyn_cnt;  // sources/rtl/vga/vga.v(57)
  wire [12:0] n1;
  wire [13:0] n18;
  wire [10:0] n19;
  wire [12:0] n2;
  wire [10:0] n20;
  wire [13:0] n21;
  wire [10:0] n22;
  wire [12:0] n4;
  wire [12:0] n5;
  wire [12:0] n6;
  wire [12:0] vsyn_cnt;  // sources/rtl/vga/vga.v(58)
  wire n0;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n15;
  wire n16;
  wire n17;
  wire n3;
  wire n7;
  wire n8;
  wire n9;

  add_pu13_pu13_o13 add0 (
    .i0(hsyn_cnt),
    .i1(13'b0000000000001),
    .o(n1));  // sources/rtl/vga/vga.v(66)
  add_pu13_pu13_o13 add1 (
    .i0(vsyn_cnt),
    .i1(13'b0000000000001),
    .o(n4));  // sources/rtl/vga/vga.v(77)
  AL_DFF axis_en_reg (
    .clk(clk),
    .d(n17),
    .reset(1'b0),
    .set(1'b0),
    .q(axis_en));  // sources/rtl/vga/vga.v(111)
  eq_w13 eq0 (
    .i0(hsyn_cnt),
    .i1(13'b0001100011111),
    .o(n0));  // sources/rtl/vga/vga.v(63)
  eq_w13 eq1 (
    .i0(vsyn_cnt),
    .i1(13'b0001000001100),
    .o(n3));  // sources/rtl/vga/vga.v(74)
  AL_DFF hsyn_reg (
    .clk(clk),
    .d(n8),
    .reset(1'b0),
    .set(1'b0),
    .q(hsyn));  // sources/rtl/vga/vga.v(88)
  lt_u13_u13 lt0 (
    .ci(1'b0),
    .i0(hsyn_cnt),
    .i1(13'b0000001100000),
    .o(n7));  // sources/rtl/vga/vga.v(84)
  lt_u13_u13 lt1 (
    .ci(1'b0),
    .i0(vsyn_cnt),
    .i1(13'b0000000000010),
    .o(n9));  // sources/rtl/vga/vga.v(93)
  lt_u13_u13 lt2 (
    .ci(1'b1),
    .i0(13'b0000000100011),
    .i1(vsyn_cnt),
    .o(n11));  // sources/rtl/vga/vga.v(102)
  lt_u13_u13 lt3 (
    .ci(1'b0),
    .i0(vsyn_cnt),
    .i1(13'b0001000000011),
    .o(n12));  // sources/rtl/vga/vga.v(102)
  lt_u13_u13 lt4 (
    .ci(1'b1),
    .i0(13'b0000010010000),
    .i1(hsyn_cnt),
    .o(n14));  // sources/rtl/vga/vga.v(104)
  lt_u13_u13 lt5 (
    .ci(1'b0),
    .i0(hsyn_cnt),
    .i1(13'b0001100010000),
    .o(n15));  // sources/rtl/vga/vga.v(104)
  binary_mux_s1_w13 mux0 (
    .i0(n1),
    .i1(13'b0000000000000),
    .sel(n0),
    .o(n2));  // sources/rtl/vga/vga.v(66)
  binary_mux_s1_w13 mux1 (
    .i0(n4),
    .i1(13'b0000000000000),
    .sel(n3),
    .o(n5));  // sources/rtl/vga/vga.v(77)
  binary_mux_s1_w13 mux2 (
    .i0(vsyn_cnt),
    .i1(n5),
    .sel(n0),
    .o(n6));  // sources/rtl/vga/vga.v(78)
  binary_mux_s1_w11 mux3 (
    .i0(11'b00000000000),
    .i1(n18[10:0]),
    .sel(n16),
    .o(n19));  // sources/rtl/vga/vga.v(121)
  binary_mux_s1_w11 mux4 (
    .i0(11'b00000000000),
    .i1(n19),
    .sel(n13),
    .o(n20));  // sources/rtl/vga/vga.v(124)
  binary_mux_s1_w11 mux5 (
    .i0(11'b00000000000),
    .i1(n21[10:0]),
    .sel(n13),
    .o(n22));  // sources/rtl/vga/vga.v(133)
  reg_ar_as_w13 reg0 (
    .clk(clk),
    .d(n6),
    .reset(13'b0000000000000),
    .set(13'b0000000000000),
    .q(vsyn_cnt));  // sources/rtl/vga/vga.v(79)
  reg_ar_as_w11 reg1 (
    .clk(clk),
    .d(n20),
    .reset(11'b00000000000),
    .set(11'b00000000000),
    .q(axis_x));  // sources/rtl/vga/vga.v(125)
  reg_ar_as_w11 reg2 (
    .clk(clk),
    .d(n22),
    .reset(11'b00000000000),
    .set(11'b00000000000),
    .q(axis_y));  // sources/rtl/vga/vga.v(134)
  reg_ar_as_w13 reg3 (
    .clk(clk),
    .d(n2),
    .reset(13'b0000000000000),
    .set(13'b0000000000000),
    .q(hsyn_cnt));  // sources/rtl/vga/vga.v(67)
  add_pu14_mu14_o14 sub0 (
    .i0({1'b0,hsyn_cnt}),
    .i1(14'b00000010010000),
    .o({open_n4,open_n5,open_n6,n18[10:0]}));  // sources/rtl/vga/vga.v(119)
  add_pu14_mu14_o14 sub1 (
    .i0({1'b0,vsyn_cnt}),
    .i1(14'b00000000100011),
    .o({open_n7,open_n8,open_n9,n21[10:0]}));  // sources/rtl/vga/vga.v(131)
  not u2 (n8, n7);  // sources/rtl/vga/vga.v(87)
  not u3 (n10, n9);  // sources/rtl/vga/vga.v(96)
  and u4 (n13, n11, n12);  // sources/rtl/vga/vga.v(102)
  and u5 (n16, n14, n15);  // sources/rtl/vga/vga.v(104)
  AL_MUX u6 (
    .i0(1'b0),
    .i1(n16),
    .sel(n13),
    .o(n17));  // sources/rtl/vga/vga.v(110)
  AL_DFF vsyn_reg (
    .clk(clk),
    .d(n10),
    .reset(1'b0),
    .set(1'b0),
    .q(vsyn));  // sources/rtl/vga/vga.v(97)

endmodule 

module vram  // sources/rtl/vga/vram.v(22)
  (
  axis_en,
  axis_x,
  axis_y,
  clk,
  hs_i,
  vram_addr,
  vram_ren,
  vram_wdata,
  vram_wen,
  vs_i,
  hs_o,
  rgb_o,
  vram_rdata,
  vs_o
  );

  input axis_en;  // sources/rtl/vga/vram.v(36)
  input [10:0] axis_x;  // sources/rtl/vga/vram.v(37)
  input [10:0] axis_y;  // sources/rtl/vga/vram.v(38)
  input clk;  // sources/rtl/vga/vram.v(24)
  input hs_i;  // sources/rtl/vga/vram.v(34)
  input [7:0] vram_addr;  // sources/rtl/vga/vram.v(31)
  input vram_ren;  // sources/rtl/vga/vram.v(29)
  input vram_wdata;  // sources/rtl/vga/vram.v(28)
  input vram_wen;  // sources/rtl/vga/vram.v(27)
  input vs_i;  // sources/rtl/vga/vram.v(35)
  output hs_o;  // sources/rtl/vga/vram.v(41)
  output [23:0] rgb_o;  // sources/rtl/vga/vram.v(43)
  output vram_rdata;  // sources/rtl/vga/vram.v(30)
  output vs_o;  // sources/rtl/vga/vram.v(42)

  wire [10:0] axis_x_d0;  // sources/rtl/vga/vram.v(59)
  wire [10:0] axis_x_d1;  // sources/rtl/vga/vram.v(62)
  wire [10:0] axis_x_d2;  // sources/rtl/vga/vram.v(65)
  wire [10:0] axis_y_d0;  // sources/rtl/vga/vram.v(60)
  wire [10:0] axis_y_d1;  // sources/rtl/vga/vram.v(63)
  wire [10:0] axis_y_d2;  // sources/rtl/vga/vram.v(66)
  wire [7:0] mesh_addr;  // sources/rtl/vga/vram.v(49)
  wire [4:0] mesh_x;  // sources/rtl/vga/vram.v(47)
  wire [4:0] mesh_y;  // sources/rtl/vga/vram.v(48)
  wire [0:0] n1;
  wire [22:0] n26;
  wire [23:0] n27;
  wire [23:0] n28;
  wire [23:0] n29;
  wire [5:0] n3;
  wire [5:0] n4;
  wire [9:0] n5;
  wire [9:0] n6;
  wire [0:0] n7;
  wire axis_en_d0;  // sources/rtl/vga/vram.v(58)
  wire axis_en_d1;  // sources/rtl/vga/vram.v(61)
  wire axis_en_d2;  // sources/rtl/vga/vram.v(64)
  wire hs_i_d0;  // sources/rtl/vga/vram.v(52)
  wire hs_i_d1;  // sources/rtl/vga/vram.v(54)
  wire hs_i_d2;  // sources/rtl/vga/vram.v(56)
  wire n0;
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
  wire n20;
  wire n21;
  wire n22;
  wire n23;
  wire n24;
  wire n25;
  wire n8;
  wire n9;
  wire state;  // sources/rtl/vga/vram.v(46)
  wire vs_i_d0;  // sources/rtl/vga/vram.v(53)
  wire vs_i_d1;  // sources/rtl/vga/vram.v(55)
  wire vs_i_d2;  // sources/rtl/vga/vram.v(57)

  add_pu10_pu10_o10 add0 (
    .i0(n5),
    .i1({5'b00000,mesh_x}),
    .o({open_n0,open_n1,n6[7:0]}));  // sources/rtl/vga/vram.v(87)
  AL_DFF axis_en_d0_reg (
    .clk(clk),
    .d(axis_en),
    .reset(1'b0),
    .set(1'b0),
    .q(axis_en_d0));  // sources/rtl/vga/vram.v(110)
  AL_DFF axis_en_d1_reg (
    .clk(clk),
    .d(axis_en_d0),
    .reset(1'b0),
    .set(1'b0),
    .q(axis_en_d1));  // sources/rtl/vga/vram.v(110)
  AL_DFF axis_en_d2_reg (
    .clk(clk),
    .d(axis_en_d1),
    .reset(1'b0),
    .set(1'b0),
    .q(axis_en_d2));  // sources/rtl/vga/vram.v(110)
  eq_w11 eq0 (
    .i0(axis_x_d2),
    .i1(11'b00000100000),
    .o(n16));  // sources/rtl/vga/vram.v(133)
  eq_w11 eq1 (
    .i0(axis_x_d2),
    .i1(11'b01001100000),
    .o(n17));  // sources/rtl/vga/vram.v(133)
  eq_w11 eq2 (
    .i0(axis_y_d2),
    .i1(11'b00000100000),
    .o(n19));  // sources/rtl/vga/vram.v(133)
  eq_w11 eq3 (
    .i0(axis_y_d2),
    .i1(11'b00111000000),
    .o(n21));  // sources/rtl/vga/vram.v(133)
  eq_w5 eq4 (
    .i0(axis_y_d2[4:0]),
    .i1(5'b00000),
    .o(n23));  // sources/rtl/vga/vram.v(135)
  eq_w5 eq5 (
    .i0(axis_x_d2[4:0]),
    .i1(5'b00000),
    .o(n24));  // sources/rtl/vga/vram.v(135)
  AL_DFF hs_i_d0_reg (
    .clk(clk),
    .d(hs_i),
    .reset(1'b0),
    .set(1'b0),
    .q(hs_i_d0));  // sources/rtl/vga/vram.v(123)
  AL_DFF hs_i_d1_reg (
    .clk(clk),
    .d(hs_i_d0),
    .reset(1'b0),
    .set(1'b0),
    .q(hs_i_d1));  // sources/rtl/vga/vram.v(123)
  AL_DFF hs_i_d2_reg (
    .clk(clk),
    .d(hs_i_d1),
    .reset(1'b0),
    .set(1'b0),
    .q(hs_i_d2));  // sources/rtl/vga/vram.v(123)
  AL_DFF hs_o_reg (
    .clk(n8),
    .d(hs_i_d2),
    .reset(1'b0),
    .set(1'b0),
    .q(hs_o));  // sources/rtl/vga/vram.v(152)
  lt_u11_u11 lt0 (
    .ci(1'b0),
    .i0(axis_x_d2),
    .i1(11'b00000100000),
    .o(n9));  // sources/rtl/vga/vram.v(131)
  lt_u11_u11 lt1 (
    .ci(1'b0),
    .i0(11'b01001100000),
    .i1(axis_x_d2),
    .o(n10));  // sources/rtl/vga/vram.v(131)
  lt_u11_u11 lt2 (
    .ci(1'b0),
    .i0(axis_y_d2),
    .i1(11'b00000100000),
    .o(n12));  // sources/rtl/vga/vram.v(131)
  lt_u11_u11 lt3 (
    .ci(1'b0),
    .i0(11'b00111000000),
    .i1(axis_y_d2),
    .o(n14));  // sources/rtl/vga/vram.v(131)
  mult_u5_u5_o10 mult0 (
    .i0(mesh_y),
    .i1(5'b10010),
    .o(n5));  // sources/rtl/vga/vram.v(87)
  binary_mux_s1_w23 mux0 (
    .i0({1'b0,state,1'b0,state,3'b000,state,1'b0,state,state,1'b0,state,3'b000,state,1'b0,state,4'b0000}),
    .i1(23'b10100000010100001010000),
    .sel(n25),
    .o(n26));  // sources/rtl/vga/vram.v(140)
  binary_mux_s1_w24 mux1 (
    .i0({1'b0,n26}),
    .i1(24'b111100001111000001111000),
    .sel(n22),
    .o(n27));  // sources/rtl/vga/vram.v(140)
  binary_mux_s1_w24 mux2 (
    .i0(n27),
    .i1(24'b000000000000000000000000),
    .sel(n15),
    .o(n28));  // sources/rtl/vga/vram.v(140)
  binary_mux_s1_w24 mux3 (
    .i0(24'b000000000000000000000000),
    .i1(n28),
    .sel(axis_en_d2),
    .o(n29));  // sources/rtl/vga/vram.v(143)
  ram_w8x1_r8x1_r8x1 #(
    .DATA_DEPTH_LEFT("0"),
    .DATA_DEPTH_RIGHT("233"),
    .DATA_WIDTH_LEFT("0"),
    .DATA_WIDTH_RIGHT("0"))
    ram_vga_ram (
    .clk1(clk),
    .ra1(vram_addr),
    .ra2(mesh_addr),
    .re1(1'b1),
    .re2(1'b1),
    .wa1(vram_addr),
    .wd1(vram_wdata),
    .we1(n0),
    .rd1(n1),
    .rd2(n7));  // sources/rtl/vga/vram.v(50)
  reg_ar_as_w5 reg0 (
    .clk(clk),
    .d(n3[4:0]),
    .reset(5'b00000),
    .set(5'b00000),
    .q(mesh_x));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w5 reg1 (
    .clk(clk),
    .d(n4[4:0]),
    .reset(5'b00000),
    .set(5'b00000),
    .q(mesh_y));  // sources/rtl/vga/vram.v(82)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n6[7:0]),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(mesh_addr));  // sources/rtl/vga/vram.v(88)
  reg_ar_as_w11 reg3 (
    .clk(clk),
    .d(axis_x),
    .reset(11'b00000000000),
    .set(11'b00000000000),
    .q(axis_x_d0));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w11 reg4 (
    .clk(clk),
    .d(axis_y),
    .reset(11'b00000000000),
    .set(11'b00000000000),
    .q(axis_y_d0));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w11 reg5 (
    .clk(clk),
    .d(axis_x_d0),
    .reset(11'b00000000000),
    .set(11'b00000000000),
    .q(axis_x_d1));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w11 reg6 (
    .clk(clk),
    .d(axis_y_d0),
    .reset(11'b00000000000),
    .set(11'b00000000000),
    .q(axis_y_d1));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w11 reg7 (
    .clk(clk),
    .d(axis_x_d1),
    .reset(11'b00000000000),
    .set(11'b00000000000),
    .q(axis_x_d2));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w11 reg8 (
    .clk(clk),
    .d(axis_y_d1),
    .reset(11'b00000000000),
    .set(11'b00000000000),
    .q(axis_y_d2));  // sources/rtl/vga/vram.v(110)
  reg_ar_as_w24 reg9 (
    .clk(n8),
    .d(n29),
    .reset(24'b000000000000000000000000),
    .set(24'b000000000000000000000000),
    .q(rgb_o));  // sources/rtl/vga/vram.v(144)
  AL_DFF state_reg (
    .clk(clk),
    .d(n7),
    .reset(1'b0),
    .set(1'b0),
    .q(state));  // sources/rtl/vga/vram.v(94)
  add_pu6_mu6_o6 sub0 (
    .i0({1'b0,axis_x[9:5]}),
    .i1(6'b000001),
    .o({open_n12,n3[4:0]}));  // sources/rtl/vga/vram.v(80)
  add_pu6_mu6_o6 sub1 (
    .i0({1'b0,axis_y[9:5]}),
    .i1(6'b000001),
    .o({open_n13,n4[4:0]}));  // sources/rtl/vga/vram.v(81)
  or u10 (n22, n20, n21);  // sources/rtl/vga/vram.v(133)
  or u11 (n25, n23, n24);  // sources/rtl/vga/vram.v(135)
  AL_MUX u2 (
    .i0(vram_rdata),
    .i1(n1),
    .sel(vram_ren),
    .o(n2));  // sources/rtl/vga/vram.v(74)
  buf u3 (n0, vram_wen);  // sources/rtl/vga/vram.v(75)
  not u4 (n8, clk);  // sources/rtl/vga/vram.v(127)
  or u5 (n11, n9, n10);  // sources/rtl/vga/vram.v(131)
  or u6 (n13, n11, n12);  // sources/rtl/vga/vram.v(131)
  or u7 (n15, n13, n14);  // sources/rtl/vga/vram.v(131)
  or u8 (n18, n16, n17);  // sources/rtl/vga/vram.v(133)
  or u9 (n20, n18, n19);  // sources/rtl/vga/vram.v(133)
  AL_DFF vram_rdata_reg (
    .clk(clk),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(vram_rdata));  // sources/rtl/vga/vram.v(75)
  AL_DFF vs_i_d0_reg (
    .clk(clk),
    .d(vs_i),
    .reset(1'b0),
    .set(1'b0),
    .q(vs_i_d0));  // sources/rtl/vga/vram.v(123)
  AL_DFF vs_i_d1_reg (
    .clk(clk),
    .d(vs_i_d0),
    .reset(1'b0),
    .set(1'b0),
    .q(vs_i_d1));  // sources/rtl/vga/vram.v(123)
  AL_DFF vs_i_d2_reg (
    .clk(clk),
    .d(vs_i_d1),
    .reset(1'b0),
    .set(1'b0),
    .q(vs_i_d2));  // sources/rtl/vga/vram.v(123)
  AL_DFF vs_o_reg (
    .clk(n8),
    .d(vs_i_d2),
    .reset(1'b0),
    .set(1'b0),
    .q(vs_o));  // sources/rtl/vga/vram.v(152)

endmodule 

module eq_w8
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output o;



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

module onehot_mux_s4_w8
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
  input [3:0] sel;
  output [7:0] o;



endmodule 

module alu  // sources/rtl/mcu/alu.v(22)
  (
  alu_cmd,
  alu_in1,
  alu_in2,
  clk,
  alu_out0,
  alu_out1,
  alu_out2,
  alu_out3,
  alu_out4
  );

  input [10:0] alu_cmd;  // sources/rtl/mcu/alu.v(27)
  input [7:0] alu_in1;  // sources/rtl/mcu/alu.v(28)
  input [7:0] alu_in2;  // sources/rtl/mcu/alu.v(29)
  input clk;  // sources/rtl/mcu/alu.v(24)
  output [8:0] alu_out0;  // sources/rtl/mcu/alu.v(32)
  output [15:0] alu_out1;  // sources/rtl/mcu/alu.v(33)
  output [7:0] alu_out2;  // sources/rtl/mcu/alu.v(34)
  output [7:0] alu_out3;  // sources/rtl/mcu/alu.v(35)
  output [7:0] alu_out4;  // sources/rtl/mcu/alu.v(36)

  wire [15:0] n17;
  wire [15:0] n18;
  wire [7:0] n37;
  wire [7:0] n38;
  wire [7:0] n4;
  wire [8:0] n5;
  wire [7:0] n50;
  wire [7:0] n54;
  wire [7:0] n55;
  wire [7:0] n56;
  wire [7:0] n57;
  wire [7:0] n58;
  wire [8:0] n6;
  wire [7:0] n67;
  wire [7:0] n68;
  wire [7:0] n69;
  wire [8:0] n7;
  wire [7:0] n70;
  wire n0;
  wire n1;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n15;
  wire n16;
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
  wire n28;
  wire n29;
  wire n3;
  wire n30;
  wire n31;
  wire n32;
  wire n33;
  wire n34;
  wire n35;
  wire n36;
  wire n39;
  wire n40;
  wire n41;
  wire n42;
  wire n43;
  wire n44;
  wire n45;
  wire n46;
  wire n47;
  wire n48;
  wire n49;
  wire n51;
  wire n52;
  wire n53;
  wire n59;
  wire n60;
  wire n61;
  wire n62;
  wire n63;
  wire n64;
  wire n65;
  wire n66;
  wire n71;
  wire n72;
  wire n73;
  wire n74;
  wire n75;
  wire n76;
  wire n77;
  wire n78;
  wire n79;
  wire n8;
  wire n80;
  wire n81;
  wire n82;
  wire n83;
  wire n84;
  wire n85;
  wire n86;
  wire n87;
  wire n88;
  wire n89;
  wire n9;
  wire n90;
  wire n91;
  wire n92;

  add_pu8_pu8_o9 add0 (
    .i0(alu_in1),
    .i1(alu_in2),
    .o({n3,n4}));  // sources/rtl/mcu/alu.v(43)
  eq_w8 eq0 (
    .i0(alu_in1),
    .i1(alu_in2),
    .o(n36));  // sources/rtl/mcu/alu.v(61)
  lt_u8_u8 lt0 (
    .ci(1'b0),
    .i0(alu_in2),
    .i1(alu_in1),
    .o(n35));  // sources/rtl/mcu/alu.v(59)
  mult_u8_u8_o16 mult0 (
    .i0(alu_in1),
    .i1(alu_in2),
    .o(n17));  // sources/rtl/mcu/alu.v(52)
  binary_mux_s1_w9 mux0 (
    .i0(alu_out0),
    .i1(n5),
    .sel(alu_cmd[1]),
    .o(n6));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w9 mux1 (
    .i0(n6),
    .i1({n3,n4}),
    .sel(alu_cmd[0]),
    .o(n7));  // sources/rtl/mcu/alu.v(45)
  binary_mux_s1_w8 mux10 (
    .i0(n69),
    .i1(n67),
    .sel(alu_cmd[9]),
    .o(n70));  // sources/rtl/mcu/alu.v(83)
  binary_mux_s1_w16 mux2 (
    .i0(alu_out1),
    .i1(n17),
    .sel(alu_cmd[2]),
    .o(n18));  // sources/rtl/mcu/alu.v(52)
  binary_mux_s1_w8 mux3 (
    .i0(alu_out2),
    .i1({7'b0000000,n36}),
    .sel(alu_cmd[4]),
    .o(n37));  // sources/rtl/mcu/alu.v(61)
  binary_mux_s1_w8 mux4 (
    .i0(n37),
    .i1({7'b0000000,n35}),
    .sel(alu_cmd[3]),
    .o(n38));  // sources/rtl/mcu/alu.v(61)
  binary_mux_s1_w8 mux5 (
    .i0(alu_out3),
    .i1(n54),
    .sel(alu_cmd[8]),
    .o(n55));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w8 mux6 (
    .i0(n55),
    .i1({7'b0000000,n53}),
    .sel(alu_cmd[7]),
    .o(n56));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w8 mux7 (
    .i0(n56),
    .i1(n50),
    .sel(alu_cmd[6]),
    .o(n57));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w8 mux8 (
    .i0(n57),
    .i1({7'b0000000,n49}),
    .sel(alu_cmd[5]),
    .o(n58));  // sources/rtl/mcu/alu.v(74)
  binary_mux_s1_w8 mux9 (
    .i0(alu_out4),
    .i1(n68),
    .sel(alu_cmd[10]),
    .o(n69));  // sources/rtl/mcu/alu.v(83)
  reg_ar_as_w16 reg0 (
    .clk(clk),
    .d(n18),
    .reset(16'b0000000000000000),
    .set(16'b0000000000000000),
    .q(alu_out1));  // sources/rtl/mcu/alu.v(53)
  reg_ar_as_w8 reg1 (
    .clk(clk),
    .d(n38),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(alu_out2));  // sources/rtl/mcu/alu.v(62)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n58),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(alu_out3));  // sources/rtl/mcu/alu.v(75)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n70),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(alu_out4));  // sources/rtl/mcu/alu.v(84)
  reg_ar_as_w9 reg4 (
    .clk(clk),
    .d(n7),
    .reset(9'b000000000),
    .set(9'b000000000),
    .q(alu_out0));  // sources/rtl/mcu/alu.v(46)
  add_pu9_mu9_o9 sub0 (
    .i0({1'b0,alu_in1}),
    .i1({1'b0,alu_in2}),
    .o(n5));  // sources/rtl/mcu/alu.v(45)
  AL_MUX u1 (
    .i0(alu_in1[4]),
    .i1(alu_in1[5]),
    .sel(alu_in2[0]),
    .o(n0));  // sources/rtl/mcu/alu.v(83)
  and u10 (n50[0], alu_in1[0], alu_in2[0]);  // sources/rtl/mcu/alu.v(70)
  or u100 (n89, n87, n88);  // sources/rtl/mcu/alu.v(68)
  or u101 (n90, alu_in1[4], alu_in1[5]);  // sources/rtl/mcu/alu.v(68)
  or u102 (n91, alu_in1[6], alu_in1[7]);  // sources/rtl/mcu/alu.v(68)
  or u103 (n92, n90, n91);  // sources/rtl/mcu/alu.v(68)
  or u104 (n47, n89, n92);  // sources/rtl/mcu/alu.v(68)
  or u11 (n54[0], alu_in1[0], alu_in2[0]);  // sources/rtl/mcu/alu.v(74)
  AL_MUX u12 (
    .i0(alu_in1[7]),
    .i1(alu_in1[6]),
    .sel(alu_in2[0]),
    .o(n39));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u13 (
    .i0(alu_in1[5]),
    .i1(alu_in1[6]),
    .sel(alu_in2[0]),
    .o(n78));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u14 (
    .i0(alu_in1[6]),
    .i1(alu_in1[7]),
    .sel(alu_in2[0]),
    .o(n65));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u15 (
    .i0(alu_in1[7]),
    .i1(1'b0),
    .sel(alu_in2[0]),
    .o(n64));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u16 (
    .i0(n52),
    .i1(n2),
    .sel(alu_in2[1]),
    .o(n63));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u17 (
    .i0(n51),
    .i1(n1),
    .sel(alu_in2[1]),
    .o(n62));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u18 (
    .i0(n2),
    .i1(n0),
    .sel(alu_in2[1]),
    .o(n61));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u19 (
    .i0(n1),
    .i1(n78),
    .sel(alu_in2[1]),
    .o(n60));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u2 (
    .i0(alu_in1[3]),
    .i1(alu_in1[4]),
    .sel(alu_in2[0]),
    .o(n1));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u20 (
    .i0(n0),
    .i1(n65),
    .sel(alu_in2[1]),
    .o(n59));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u21 (
    .i0(n78),
    .i1(n64),
    .sel(alu_in2[1]),
    .o(n77));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u22 (
    .i0(n65),
    .i1(1'b0),
    .sel(alu_in2[1]),
    .o(n76));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u23 (
    .i0(n64),
    .i1(1'b0),
    .sel(alu_in2[1]),
    .o(n75));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u24 (
    .i0(n63),
    .i1(n59),
    .sel(alu_in2[2]),
    .o(n74));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u25 (
    .i0(n62),
    .i1(n77),
    .sel(alu_in2[2]),
    .o(n73));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u26 (
    .i0(n61),
    .i1(n76),
    .sel(alu_in2[2]),
    .o(n72));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u27 (
    .i0(n60),
    .i1(n75),
    .sel(alu_in2[2]),
    .o(n71));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u28 (
    .i0(n59),
    .i1(1'b0),
    .sel(alu_in2[2]),
    .o(n66));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u29 (
    .i0(n77),
    .i1(1'b0),
    .sel(alu_in2[2]),
    .o(n46));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u3 (
    .i0(alu_in1[2]),
    .i1(alu_in1[3]),
    .sel(alu_in2[0]),
    .o(n2));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u30 (
    .i0(n76),
    .i1(1'b0),
    .sel(alu_in2[2]),
    .o(n45));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u31 (
    .i0(n75),
    .i1(1'b0),
    .sel(alu_in2[2]),
    .o(n44));  // sources/rtl/mcu/alu.v(83)
  or u32 (n43, alu_in2[3], alu_in2[4]);  // sources/rtl/mcu/alu.v(83)
  or u33 (n42, alu_in2[6], alu_in2[7]);  // sources/rtl/mcu/alu.v(83)
  or u34 (n41, alu_in2[5], n42);  // sources/rtl/mcu/alu.v(83)
  or u35 (n40, n43, n41);  // sources/rtl/mcu/alu.v(83)
  AL_MUX u36 (
    .i0(n74),
    .i1(1'b0),
    .sel(n40),
    .o(n68[0]));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u37 (
    .i0(n73),
    .i1(1'b0),
    .sel(n40),
    .o(n68[1]));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u38 (
    .i0(n72),
    .i1(1'b0),
    .sel(n40),
    .o(n68[2]));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u39 (
    .i0(n71),
    .i1(1'b0),
    .sel(n40),
    .o(n68[3]));  // sources/rtl/mcu/alu.v(83)
  or u4 (n87, alu_in1[0], alu_in1[1]);  // sources/rtl/mcu/alu.v(68)
  AL_MUX u40 (
    .i0(n66),
    .i1(1'b0),
    .sel(n40),
    .o(n68[4]));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u41 (
    .i0(n46),
    .i1(1'b0),
    .sel(n40),
    .o(n68[5]));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u42 (
    .i0(n45),
    .i1(1'b0),
    .sel(n40),
    .o(n68[6]));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u43 (
    .i0(n44),
    .i1(1'b0),
    .sel(n40),
    .o(n68[7]));  // sources/rtl/mcu/alu.v(83)
  AL_MUX u44 (
    .i0(alu_in1[6]),
    .i1(alu_in1[5]),
    .sel(alu_in2[0]),
    .o(n34));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u45 (
    .i0(alu_in1[5]),
    .i1(alu_in1[4]),
    .sel(alu_in2[0]),
    .o(n33));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u46 (
    .i0(alu_in1[4]),
    .i1(alu_in1[3]),
    .sel(alu_in2[0]),
    .o(n32));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u47 (
    .i0(alu_in1[3]),
    .i1(alu_in1[2]),
    .sel(alu_in2[0]),
    .o(n31));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u48 (
    .i0(alu_in1[2]),
    .i1(alu_in1[1]),
    .sel(alu_in2[0]),
    .o(n30));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u49 (
    .i0(alu_in1[1]),
    .i1(alu_in1[0]),
    .sel(alu_in2[0]),
    .o(n29));  // sources/rtl/mcu/alu.v(81)
  and u5 (n49, n47, n48);  // sources/rtl/mcu/alu.v(68)
  AL_MUX u50 (
    .i0(alu_in1[0]),
    .i1(1'b0),
    .sel(alu_in2[0]),
    .o(n28));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u51 (
    .i0(n39),
    .i1(n33),
    .sel(alu_in2[1]),
    .o(n27));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u52 (
    .i0(n34),
    .i1(n32),
    .sel(alu_in2[1]),
    .o(n26));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u53 (
    .i0(n33),
    .i1(n31),
    .sel(alu_in2[1]),
    .o(n25));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u54 (
    .i0(n32),
    .i1(n30),
    .sel(alu_in2[1]),
    .o(n24));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u55 (
    .i0(n31),
    .i1(n29),
    .sel(alu_in2[1]),
    .o(n23));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u56 (
    .i0(n30),
    .i1(n28),
    .sel(alu_in2[1]),
    .o(n22));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u57 (
    .i0(n29),
    .i1(1'b0),
    .sel(alu_in2[1]),
    .o(n21));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u58 (
    .i0(n28),
    .i1(1'b0),
    .sel(alu_in2[1]),
    .o(n20));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u59 (
    .i0(n27),
    .i1(n23),
    .sel(alu_in2[2]),
    .o(n19));  // sources/rtl/mcu/alu.v(81)
  or u6 (n81, alu_in2[0], alu_in2[1]);  // sources/rtl/mcu/alu.v(68)
  AL_MUX u60 (
    .i0(n26),
    .i1(n22),
    .sel(alu_in2[2]),
    .o(n16));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u61 (
    .i0(n25),
    .i1(n21),
    .sel(alu_in2[2]),
    .o(n15));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u62 (
    .i0(n24),
    .i1(n20),
    .sel(alu_in2[2]),
    .o(n14));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u63 (
    .i0(n23),
    .i1(1'b0),
    .sel(alu_in2[2]),
    .o(n13));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u64 (
    .i0(n22),
    .i1(1'b0),
    .sel(alu_in2[2]),
    .o(n12));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u65 (
    .i0(n21),
    .i1(1'b0),
    .sel(alu_in2[2]),
    .o(n11));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u66 (
    .i0(n20),
    .i1(1'b0),
    .sel(alu_in2[2]),
    .o(n10));  // sources/rtl/mcu/alu.v(81)
  or u67 (n9, alu_in2[3], alu_in2[4]);  // sources/rtl/mcu/alu.v(81)
  or u68 (n8, alu_in2[6], alu_in2[7]);  // sources/rtl/mcu/alu.v(81)
  or u69 (n79, alu_in2[5], n8);  // sources/rtl/mcu/alu.v(81)
  AL_MUX u7 (
    .i0(alu_in1[1]),
    .i1(alu_in1[2]),
    .sel(alu_in2[0]),
    .o(n51));  // sources/rtl/mcu/alu.v(83)
  or u70 (n80, n9, n79);  // sources/rtl/mcu/alu.v(81)
  AL_MUX u71 (
    .i0(n19),
    .i1(1'b0),
    .sel(n80),
    .o(n67[7]));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u72 (
    .i0(n16),
    .i1(1'b0),
    .sel(n80),
    .o(n67[6]));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u73 (
    .i0(n15),
    .i1(1'b0),
    .sel(n80),
    .o(n67[5]));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u74 (
    .i0(n14),
    .i1(1'b0),
    .sel(n80),
    .o(n67[4]));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u75 (
    .i0(n13),
    .i1(1'b0),
    .sel(n80),
    .o(n67[3]));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u76 (
    .i0(n12),
    .i1(1'b0),
    .sel(n80),
    .o(n67[2]));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u77 (
    .i0(n11),
    .i1(1'b0),
    .sel(n80),
    .o(n67[1]));  // sources/rtl/mcu/alu.v(81)
  AL_MUX u78 (
    .i0(n10),
    .i1(1'b0),
    .sel(n80),
    .o(n67[0]));  // sources/rtl/mcu/alu.v(81)
  or u79 (n54[1], alu_in1[1], alu_in2[1]);  // sources/rtl/mcu/alu.v(74)
  AL_MUX u8 (
    .i0(alu_in1[0]),
    .i1(alu_in1[1]),
    .sel(alu_in2[0]),
    .o(n52));  // sources/rtl/mcu/alu.v(83)
  or u80 (n54[2], alu_in1[2], alu_in2[2]);  // sources/rtl/mcu/alu.v(74)
  or u81 (n54[3], alu_in1[3], alu_in2[3]);  // sources/rtl/mcu/alu.v(74)
  or u82 (n54[4], alu_in1[4], alu_in2[4]);  // sources/rtl/mcu/alu.v(74)
  or u83 (n54[5], alu_in1[5], alu_in2[5]);  // sources/rtl/mcu/alu.v(74)
  or u84 (n54[6], alu_in1[6], alu_in2[6]);  // sources/rtl/mcu/alu.v(74)
  or u85 (n54[7], alu_in1[7], alu_in2[7]);  // sources/rtl/mcu/alu.v(74)
  and u86 (n50[1], alu_in1[1], alu_in2[1]);  // sources/rtl/mcu/alu.v(70)
  and u87 (n50[2], alu_in1[2], alu_in2[2]);  // sources/rtl/mcu/alu.v(70)
  and u88 (n50[3], alu_in1[3], alu_in2[3]);  // sources/rtl/mcu/alu.v(70)
  and u89 (n50[4], alu_in1[4], alu_in2[4]);  // sources/rtl/mcu/alu.v(70)
  or u9 (n53, n47, n48);  // sources/rtl/mcu/alu.v(72)
  and u90 (n50[5], alu_in1[5], alu_in2[5]);  // sources/rtl/mcu/alu.v(70)
  and u91 (n50[6], alu_in1[6], alu_in2[6]);  // sources/rtl/mcu/alu.v(70)
  and u92 (n50[7], alu_in1[7], alu_in2[7]);  // sources/rtl/mcu/alu.v(70)
  or u93 (n82, alu_in2[2], alu_in2[3]);  // sources/rtl/mcu/alu.v(68)
  or u94 (n83, n81, n82);  // sources/rtl/mcu/alu.v(68)
  or u95 (n84, alu_in2[4], alu_in2[5]);  // sources/rtl/mcu/alu.v(68)
  or u96 (n85, alu_in2[6], alu_in2[7]);  // sources/rtl/mcu/alu.v(68)
  or u97 (n86, n84, n85);  // sources/rtl/mcu/alu.v(68)
  or u98 (n48, n83, n86);  // sources/rtl/mcu/alu.v(68)
  or u99 (n88, alu_in1[2], alu_in1[3]);  // sources/rtl/mcu/alu.v(68)

endmodule 

module debug  // sources/rtl/mcu/debug.v(22)
  (
  clk,
  dbg_info,
  dbg_info_en,
  recv_cmd,
  recv_data,
  recv_en,
  rom_rdata,
  send_ready,
  dbg_en,
  dbg_inst,
  dbg_inst_en,
  read_abcd,
  rom_raddr,
  rom_ren,
  rom_waddr,
  rom_wdata,
  rom_wen,
  send_cmd,
  send_data,
  send_en
  );

  input clk;  // sources/rtl/mcu/debug.v(24)
  input [15:0] dbg_info;  // sources/rtl/mcu/debug.v(44)
  input dbg_info_en;  // sources/rtl/mcu/debug.v(43)
  input [7:0] recv_cmd;  // sources/rtl/mcu/debug.v(48)
  input [7:0] recv_data;  // sources/rtl/mcu/debug.v(49)
  input recv_en;  // sources/rtl/mcu/debug.v(47)
  input [7:0] rom_rdata;  // sources/rtl/mcu/debug.v(34)
  input send_ready;  // sources/rtl/mcu/debug.v(53)
  output dbg_en;  // sources/rtl/mcu/debug.v(37)
  output [7:0] dbg_inst;  // sources/rtl/mcu/debug.v(39)
  output dbg_inst_en;  // sources/rtl/mcu/debug.v(38)
  output [3:0] read_abcd;  // sources/rtl/mcu/debug.v(42)
  output [23:0] rom_raddr;  // sources/rtl/mcu/debug.v(33)
  output rom_ren;  // sources/rtl/mcu/debug.v(32)
  output [23:0] rom_waddr;  // sources/rtl/mcu/debug.v(28)
  output [7:0] rom_wdata;  // sources/rtl/mcu/debug.v(29)
  output rom_wen;  // sources/rtl/mcu/debug.v(27)
  output [7:0] send_cmd;  // sources/rtl/mcu/debug.v(51)
  output [7:0] send_data;  // sources/rtl/mcu/debug.v(52)
  output send_en;  // sources/rtl/mcu/debug.v(50)

  wire [7:0] n10;
  wire [7:0] n11;
  wire [23:0] n13;
  wire [23:0] n14;
  wire [23:0] n15;
  wire [7:0] n18;
  wire [7:0] n19;
  wire [7:0] n20;
  wire [7:0] n21;
  wire [7:0] n3;
  wire [3:0] n4;
  wire [23:0] n7;
  wire [23:0] n8;
  wire [23:0] n9;
  wire clear_rom_addr_cmd;  // sources/rtl/mcu/debug.v(58)
  wire clear_rom_data_cmd;  // sources/rtl/mcu/debug.v(59)
  wire debug_cmd;  // sources/rtl/mcu/debug.v(57)
  wire free_run_cmd;  // sources/rtl/mcu/debug.v(56)
  wire n0;
  wire n1;
  wire n12;
  wire n16;
  wire n17;
  wire n2;
  wire n5;
  wire n6;
  wire read_a_cmd;  // sources/rtl/mcu/debug.v(62)
  wire read_b_cmd;  // sources/rtl/mcu/debug.v(63)
  wire read_c_cmd;  // sources/rtl/mcu/debug.v(64)
  wire read_d_cmd;  // sources/rtl/mcu/debug.v(65)
  wire read_rom_cmd;  // sources/rtl/mcu/debug.v(60)
  wire rom_bk_en;  // sources/rtl/mcu/debug.v(68)
  wire rom_ren_d0;  // sources/rtl/mcu/debug.v(66)
  wire rom_ren_d1;  // sources/rtl/mcu/debug.v(67)
  wire write_rom_cmd;  // sources/rtl/mcu/debug.v(61)

  add_pu24_pu24_o24 add0 (
    .i0(rom_waddr),
    .i1(24'b000000000000000000000001),
    .o(n7));  // sources/rtl/mcu/debug.v(126)
  add_pu24_pu24_o24 add1 (
    .i0(rom_raddr),
    .i1(24'b000000000000000000000001),
    .o(n13));  // sources/rtl/mcu/debug.v(150)
  AL_DFF dbg_en_reg (
    .clk(clk),
    .d(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(dbg_en));  // sources/rtl/mcu/debug.v(92)
  AL_DFF dbg_inst_en_reg (
    .clk(clk),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(dbg_inst_en));  // sources/rtl/mcu/debug.v(100)
  eq_w8 eq0 (
    .i0(recv_cmd),
    .i1(8'b00000000),
    .o(free_run_cmd));  // sources/rtl/mcu/debug.v(73)
  eq_w8 eq1 (
    .i0(recv_cmd),
    .i1(8'b00000001),
    .o(debug_cmd));  // sources/rtl/mcu/debug.v(74)
  eq_w8 eq2 (
    .i0(recv_cmd),
    .i1(8'b00000010),
    .o(clear_rom_addr_cmd));  // sources/rtl/mcu/debug.v(75)
  eq_w8 eq3 (
    .i0(recv_cmd),
    .i1(8'b00000011),
    .o(clear_rom_data_cmd));  // sources/rtl/mcu/debug.v(76)
  eq_w8 eq4 (
    .i0(recv_cmd),
    .i1(8'b00000100),
    .o(read_rom_cmd));  // sources/rtl/mcu/debug.v(77)
  eq_w8 eq5 (
    .i0(recv_cmd),
    .i1(8'b00000101),
    .o(write_rom_cmd));  // sources/rtl/mcu/debug.v(78)
  eq_w8 eq6 (
    .i0(recv_cmd),
    .i1(8'b00000110),
    .o(read_a_cmd));  // sources/rtl/mcu/debug.v(79)
  eq_w8 eq7 (
    .i0(recv_cmd),
    .i1(8'b00000111),
    .o(read_b_cmd));  // sources/rtl/mcu/debug.v(80)
  eq_w8 eq8 (
    .i0(recv_cmd),
    .i1(8'b00001000),
    .o(read_c_cmd));  // sources/rtl/mcu/debug.v(81)
  eq_w8 eq9 (
    .i0(recv_cmd),
    .i1(8'b00001001),
    .o(read_d_cmd));  // sources/rtl/mcu/debug.v(82)
  binary_mux_s1_w8 mux0 (
    .i0(dbg_inst),
    .i1(recv_data),
    .sel(debug_cmd),
    .o(n3));  // sources/rtl/mcu/debug.v(99)
  binary_mux_s1_w24 mux1 (
    .i0(rom_waddr),
    .i1(n7),
    .sel(rom_wen),
    .o(n8));  // sources/rtl/mcu/debug.v(126)
  binary_mux_s1_w8 mux10 (
    .i0(n19),
    .i1(dbg_info[7:0]),
    .sel(dbg_info_en),
    .o(n21));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w24 mux2 (
    .i0(n8),
    .i1(24'b000000000000000000000000),
    .sel(clear_rom_addr_cmd),
    .o(n9));  // sources/rtl/mcu/debug.v(126)
  binary_mux_s1_w8 mux3 (
    .i0(rom_wdata),
    .i1(recv_data),
    .sel(n5),
    .o(n10));  // sources/rtl/mcu/debug.v(135)
  binary_mux_s1_w8 mux4 (
    .i0(n10),
    .i1(8'b00000000),
    .sel(clear_rom_data_cmd),
    .o(n11));  // sources/rtl/mcu/debug.v(135)
  binary_mux_s1_w24 mux5 (
    .i0(rom_raddr),
    .i1(n13),
    .sel(rom_ren),
    .o(n14));  // sources/rtl/mcu/debug.v(150)
  binary_mux_s1_w24 mux6 (
    .i0(n14),
    .i1(24'b000000000000000000000000),
    .sel(clear_rom_addr_cmd),
    .o(n15));  // sources/rtl/mcu/debug.v(150)
  binary_mux_s1_w8 mux7 (
    .i0(send_cmd),
    .i1(8'b00000000),
    .sel(rom_bk_en),
    .o(n18));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w8 mux8 (
    .i0(send_data),
    .i1(rom_rdata),
    .sel(rom_bk_en),
    .o(n19));  // sources/rtl/mcu/debug.v(179)
  binary_mux_s1_w8 mux9 (
    .i0(n18),
    .i1(dbg_info[15:8]),
    .sel(dbg_info_en),
    .o(n20));  // sources/rtl/mcu/debug.v(179)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n3),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(dbg_inst));  // sources/rtl/mcu/debug.v(100)
  reg_ar_as_w4 reg1 (
    .clk(clk),
    .d(n4),
    .reset(4'b0000),
    .set(4'b0000),
    .q(read_abcd));  // sources/rtl/mcu/debug.v(109)
  reg_ar_as_w24 reg2 (
    .clk(clk),
    .d(n9),
    .reset(24'b000000000000000000000000),
    .set(24'b000000000000000000000000),
    .q(rom_waddr));  // sources/rtl/mcu/debug.v(127)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n11),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(rom_wdata));  // sources/rtl/mcu/debug.v(136)
  reg_ar_as_w24 reg4 (
    .clk(clk),
    .d(n15),
    .reset(24'b000000000000000000000000),
    .set(24'b000000000000000000000000),
    .q(rom_raddr));  // sources/rtl/mcu/debug.v(151)
  reg_ar_as_w8 reg5 (
    .clk(clk),
    .d(n20),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(send_cmd));  // sources/rtl/mcu/debug.v(180)
  reg_ar_as_w8 reg6 (
    .clk(clk),
    .d(n21),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(send_data));  // sources/rtl/mcu/debug.v(180)
  AL_DFF rom_bk_en_reg (
    .clk(clk),
    .d(rom_ren_d1),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_bk_en));  // sources/rtl/mcu/debug.v(159)
  AL_DFF rom_ren_d0_reg (
    .clk(clk),
    .d(rom_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_ren_d0));  // sources/rtl/mcu/debug.v(159)
  AL_DFF rom_ren_d1_reg (
    .clk(clk),
    .d(rom_ren_d0),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_ren_d1));  // sources/rtl/mcu/debug.v(159)
  AL_DFF rom_ren_reg (
    .clk(clk),
    .d(n12),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_ren));  // sources/rtl/mcu/debug.v(142)
  AL_DFF rom_wen_reg (
    .clk(clk),
    .d(n6),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_wen));  // sources/rtl/mcu/debug.v(118)
  AL_DFF send_en_reg (
    .clk(clk),
    .d(n17),
    .reset(1'b0),
    .set(1'b0),
    .q(send_en));  // sources/rtl/mcu/debug.v(165)
  and u10 (n4[0], recv_en, read_a_cmd);  // sources/rtl/mcu/debug.v(108)
  and u11 (n12, recv_en, read_rom_cmd);  // sources/rtl/mcu/debug.v(141)
  or u12 (n16, dbg_info_en, rom_bk_en);  // sources/rtl/mcu/debug.v(164)
  and u13 (n17, send_ready, n16);  // sources/rtl/mcu/debug.v(164)
  and u2 (n4[2], recv_en, read_c_cmd);  // sources/rtl/mcu/debug.v(108)
  and u3 (n4[1], recv_en, read_b_cmd);  // sources/rtl/mcu/debug.v(108)
  AL_MUX u4 (
    .i0(dbg_en),
    .i1(1'b1),
    .sel(debug_cmd),
    .o(n0));  // sources/rtl/mcu/debug.v(91)
  AL_MUX u5 (
    .i0(n0),
    .i1(1'b0),
    .sel(free_run_cmd),
    .o(n1));  // sources/rtl/mcu/debug.v(91)
  and u6 (n2, recv_en, debug_cmd);  // sources/rtl/mcu/debug.v(97)
  and u7 (n4[3], recv_en, read_d_cmd);  // sources/rtl/mcu/debug.v(108)
  and u8 (n5, recv_en, write_rom_cmd);  // sources/rtl/mcu/debug.v(117)
  AL_MUX u9 (
    .i0(n5),
    .i1(1'b1),
    .sel(clear_rom_data_cmd),
    .o(n6));  // sources/rtl/mcu/debug.v(117)

endmodule 

module decode  // sources/rtl/mcu/decode.v(24)
  (
  clk,
  inst,
  inst_en,
  decode_cmd,
  decode_data
  );

  input clk;  // sources/rtl/mcu/decode.v(26)
  input [7:0] inst;  // sources/rtl/mcu/decode.v(30)
  input inst_en;  // sources/rtl/mcu/decode.v(29)
  output [39:0] decode_cmd;  // sources/rtl/mcu/decode.v(33)
  output [7:0] decode_data;  // sources/rtl/mcu/decode.v(34)

  wire [7:0] inst_d;  // sources/rtl/mcu/decode.v(37)
  wire [7:0] n0;
  wire [7:0] n11;
  wire dbg_info_cmd;  // sources/rtl/mcu/decode.v(77)
  wire ex_alua_cmd;  // sources/rtl/mcu/decode.v(53)
  wire ex_alub_cmd;  // sources/rtl/mcu/decode.v(54)
  wire ex_aluc_cmd;  // sources/rtl/mcu/decode.v(55)
  wire ex_alud_cmd;  // sources/rtl/mcu/decode.v(56)
  wire ex_alue_cmd;  // sources/rtl/mcu/decode.v(57)
  wire ex_aluf_cmd;  // sources/rtl/mcu/decode.v(58)
  wire ex_alug_cmd;  // sources/rtl/mcu/decode.v(59)
  wire ex_aluh_cmd;  // sources/rtl/mcu/decode.v(60)
  wire ex_alui_cmd;  // sources/rtl/mcu/decode.v(61)
  wire ex_aluj_cmd;  // sources/rtl/mcu/decode.v(62)
  wire ex_aluk_cmd;  // sources/rtl/mcu/decode.v(63)
  wire inst_data;  // sources/rtl/mcu/decode.v(78)
  wire n1;
  wire n10;
  wire n12;
  wire n13;
  wire n14;
  wire n15;
  wire n16;
  wire n17;
  wire n18;
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
  wire n28;
  wire n29;
  wire n3;
  wire n30;
  wire n31;
  wire n32;
  wire n33;
  wire n34;
  wire n35;
  wire n36;
  wire n37;
  wire n38;
  wire n39;
  wire n4;
  wire n40;
  wire n41;
  wire n42;
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
  wire n63;
  wire n64;
  wire n65;
  wire n66;
  wire n67;
  wire n68;
  wire n69;
  wire n7;
  wire n70;
  wire n71;
  wire n72;
  wire n73;
  wire n74;
  wire n75;
  wire n76;
  wire n77;
  wire n78;
  wire n79;
  wire n8;
  wire n80;
  wire n81;
  wire n82;
  wire n83;
  wire n84;
  wire n85;
  wire n86;
  wire n87;
  wire n88;
  wire n89;
  wire n9;
  wire n90;
  wire n91;
  wire n92;
  wire n93;
  wire null_cmd;  // sources/rtl/mcu/decode.v(38)
  wire rd_bus_cmd;  // sources/rtl/mcu/decode.v(65)
  wire rd_ram_cmd;  // sources/rtl/mcu/decode.v(66)
  wire wt_a_bt_cmd;  // sources/rtl/mcu/decode.v(47)
  wire wt_a_cmd;  // sources/rtl/mcu/decode.v(39)
  wire wt_a_rt_cmd;  // sources/rtl/mcu/decode.v(43)
  wire wt_b_bt_cmd;  // sources/rtl/mcu/decode.v(48)
  wire wt_b_cmd;  // sources/rtl/mcu/decode.v(40)
  wire wt_b_rt_cmd;  // sources/rtl/mcu/decode.v(44)
  wire wt_bus_cmd;  // sources/rtl/mcu/decode.v(64)
  wire wt_c_bt_cmd;  // sources/rtl/mcu/decode.v(49)
  wire wt_c_cmd;  // sources/rtl/mcu/decode.v(41)
  wire wt_c_rt_cmd;  // sources/rtl/mcu/decode.v(45)
  wire wt_d_bt_cmd;  // sources/rtl/mcu/decode.v(50)
  wire wt_d_cmd;  // sources/rtl/mcu/decode.v(42)
  wire wt_d_rt_cmd;  // sources/rtl/mcu/decode.v(46)
  wire wt_pc_cmd;  // sources/rtl/mcu/decode.v(51)
  wire wt_ram_a_cmd;  // sources/rtl/mcu/decode.v(67)
  wire wt_ram_alu0_cmd;  // sources/rtl/mcu/decode.v(70)
  wire wt_ram_alu1_cmd;  // sources/rtl/mcu/decode.v(71)
  wire wt_ram_alu2_cmd;  // sources/rtl/mcu/decode.v(72)
  wire wt_ram_alu3_cmd;  // sources/rtl/mcu/decode.v(73)
  wire wt_ram_alu4_cmd;  // sources/rtl/mcu/decode.v(74)
  wire wt_ram_alu5_cmd;  // sources/rtl/mcu/decode.v(75)
  wire wt_ram_alu6_cmd;  // sources/rtl/mcu/decode.v(76)
  wire wt_ram_b_cmd;  // sources/rtl/mcu/decode.v(68)
  wire wt_ram_c_cmd;  // sources/rtl/mcu/decode.v(69)
  wire wt_timer_cmd;  // sources/rtl/mcu/decode.v(52)

  AL_DFF dbg_info_cmd_reg (
    .clk(clk),
    .d(n93),
    .reset(1'b0),
    .set(1'b0),
    .q(dbg_info_cmd));  // sources/rtl/mcu/decode.v(156)
  eq_w8 eq0 (
    .i0(inst),
    .i1(8'b00000001),
    .o(n2));  // sources/rtl/mcu/decode.v(96)
  eq_w8 eq1 (
    .i0(inst),
    .i1(8'b00000010),
    .o(n3));  // sources/rtl/mcu/decode.v(97)
  eq_w8 eq10 (
    .i0(inst),
    .i1(8'b00000110),
    .o(n26));  // sources/rtl/mcu/decode.v(122)
  eq_w8 eq11 (
    .i0(inst),
    .i1(8'b00000111),
    .o(n28));  // sources/rtl/mcu/decode.v(123)
  eq_w8 eq12 (
    .i0(inst),
    .i1(8'b00001000),
    .o(n30));  // sources/rtl/mcu/decode.v(124)
  eq_w8 eq13 (
    .i0(inst),
    .i1(8'b00001001),
    .o(n32));  // sources/rtl/mcu/decode.v(125)
  eq_w8 eq14 (
    .i0(inst),
    .i1(8'b00001010),
    .o(n34));  // sources/rtl/mcu/decode.v(126)
  eq_w8 eq15 (
    .i0(inst),
    .i1(8'b00001011),
    .o(n36));  // sources/rtl/mcu/decode.v(127)
  eq_w8 eq16 (
    .i0(inst),
    .i1(8'b00001100),
    .o(n38));  // sources/rtl/mcu/decode.v(128)
  eq_w8 eq17 (
    .i0(inst),
    .i1(8'b00001101),
    .o(n40));  // sources/rtl/mcu/decode.v(129)
  eq_w8 eq18 (
    .i0(inst),
    .i1(8'b00001110),
    .o(n42));  // sources/rtl/mcu/decode.v(130)
  eq_w8 eq19 (
    .i0(inst),
    .i1(8'b00001111),
    .o(n44));  // sources/rtl/mcu/decode.v(131)
  eq_w8 eq2 (
    .i0(inst),
    .i1(8'b00000011),
    .o(n5));  // sources/rtl/mcu/decode.v(98)
  eq_w8 eq20 (
    .i0(inst),
    .i1(8'b00010000),
    .o(n46));  // sources/rtl/mcu/decode.v(132)
  eq_w8 eq21 (
    .i0(inst),
    .i1(8'b00010001),
    .o(n48));  // sources/rtl/mcu/decode.v(133)
  eq_w8 eq22 (
    .i0(inst),
    .i1(8'b00010010),
    .o(n50));  // sources/rtl/mcu/decode.v(134)
  eq_w8 eq23 (
    .i0(inst),
    .i1(8'b00010011),
    .o(n52));  // sources/rtl/mcu/decode.v(135)
  eq_w8 eq24 (
    .i0(inst),
    .i1(8'b00010100),
    .o(n54));  // sources/rtl/mcu/decode.v(136)
  eq_w8 eq25 (
    .i0(inst),
    .i1(8'b00010101),
    .o(n56));  // sources/rtl/mcu/decode.v(137)
  eq_w8 eq26 (
    .i0(inst),
    .i1(8'b00010110),
    .o(n58));  // sources/rtl/mcu/decode.v(138)
  eq_w8 eq27 (
    .i0(inst),
    .i1(8'b00010111),
    .o(n60));  // sources/rtl/mcu/decode.v(139)
  eq_w8 eq28 (
    .i0(inst),
    .i1(8'b00011000),
    .o(n62));  // sources/rtl/mcu/decode.v(140)
  eq_w8 eq29 (
    .i0(inst),
    .i1(8'b00011001),
    .o(n64));  // sources/rtl/mcu/decode.v(141)
  eq_w8 eq3 (
    .i0(inst),
    .i1(8'b00000100),
    .o(n7));  // sources/rtl/mcu/decode.v(99)
  eq_w8 eq30 (
    .i0(inst),
    .i1(8'b00011010),
    .o(n66));  // sources/rtl/mcu/decode.v(142)
  eq_w8 eq31 (
    .i0(inst),
    .i1(8'b00011011),
    .o(n68));  // sources/rtl/mcu/decode.v(143)
  eq_w8 eq32 (
    .i0(inst),
    .i1(8'b00011100),
    .o(n70));  // sources/rtl/mcu/decode.v(144)
  eq_w8 eq33 (
    .i0(inst),
    .i1(8'b00011101),
    .o(n72));  // sources/rtl/mcu/decode.v(145)
  eq_w8 eq34 (
    .i0(inst),
    .i1(8'b00011110),
    .o(n74));  // sources/rtl/mcu/decode.v(146)
  eq_w8 eq35 (
    .i0(inst),
    .i1(8'b00011111),
    .o(n76));  // sources/rtl/mcu/decode.v(147)
  eq_w8 eq36 (
    .i0(inst),
    .i1(8'b00100000),
    .o(n78));  // sources/rtl/mcu/decode.v(148)
  eq_w8 eq37 (
    .i0(inst),
    .i1(8'b00100001),
    .o(n80));  // sources/rtl/mcu/decode.v(149)
  eq_w8 eq38 (
    .i0(inst),
    .i1(8'b00100010),
    .o(n82));  // sources/rtl/mcu/decode.v(150)
  eq_w8 eq39 (
    .i0(inst),
    .i1(8'b00100011),
    .o(n84));  // sources/rtl/mcu/decode.v(151)
  eq_w8 eq4 (
    .i0(inst),
    .i1(8'b00000000),
    .o(n13));  // sources/rtl/mcu/decode.v(116)
  eq_w8 eq40 (
    .i0(inst),
    .i1(8'b00100100),
    .o(n86));  // sources/rtl/mcu/decode.v(152)
  eq_w8 eq41 (
    .i0(inst),
    .i1(8'b00100101),
    .o(n88));  // sources/rtl/mcu/decode.v(153)
  eq_w8 eq42 (
    .i0(inst),
    .i1(8'b00100110),
    .o(n90));  // sources/rtl/mcu/decode.v(154)
  eq_w8 eq43 (
    .i0(inst),
    .i1(8'b00100111),
    .o(n92));  // sources/rtl/mcu/decode.v(155)
  eq_w8 eq5 (
    .i0(inst_d),
    .i1(8'b00000001),
    .o(n16));  // sources/rtl/mcu/decode.v(117)
  eq_w8 eq6 (
    .i0(inst_d),
    .i1(8'b00000010),
    .o(n18));  // sources/rtl/mcu/decode.v(118)
  eq_w8 eq7 (
    .i0(inst_d),
    .i1(8'b00000011),
    .o(n20));  // sources/rtl/mcu/decode.v(119)
  eq_w8 eq8 (
    .i0(inst_d),
    .i1(8'b00000100),
    .o(n22));  // sources/rtl/mcu/decode.v(120)
  eq_w8 eq9 (
    .i0(inst),
    .i1(8'b00000101),
    .o(n24));  // sources/rtl/mcu/decode.v(121)
  AL_DFF ex_alua_cmd_reg (
    .clk(clk),
    .d(n45),
    .reset(1'b0),
    .set(1'b0),
    .q(ex_alua_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF ex_alub_cmd_reg (
    .clk(clk),
    .d(n47),
    .reset(1'b0),
    .set(1'b0),
    .q(ex_alub_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF ex_aluc_cmd_reg (
    .clk(clk),
    .d(n49),
    .reset(1'b0),
    .set(1'b0),
    .q(ex_aluc_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF ex_alud_cmd_reg (
    .clk(clk),
    .d(n51),
    .reset(1'b0),
    .set(1'b0),
    .q(ex_alud_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF ex_alue_cmd_reg (
    .clk(clk),
    .d(n53),
    .reset(1'b0),
    .set(1'b0),
    .q(ex_alue_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF ex_aluf_cmd_reg (
    .clk(clk),
    .d(n55),
    .reset(1'b0),
    .set(1'b0),
    .q(ex_aluf_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF ex_alug_cmd_reg (
    .clk(clk),
    .d(n57),
    .reset(1'b0),
    .set(1'b0),
    .q(ex_alug_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF ex_aluh_cmd_reg (
    .clk(clk),
    .d(n59),
    .reset(1'b0),
    .set(1'b0),
    .q(ex_aluh_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF ex_alui_cmd_reg (
    .clk(clk),
    .d(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ex_alui_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF ex_aluj_cmd_reg (
    .clk(clk),
    .d(n63),
    .reset(1'b0),
    .set(1'b0),
    .q(ex_aluj_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF ex_aluk_cmd_reg (
    .clk(clk),
    .d(n65),
    .reset(1'b0),
    .set(1'b0),
    .q(ex_aluk_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF inst_data_reg (
    .clk(clk),
    .d(n10),
    .reset(1'b0),
    .set(1'b0),
    .q(inst_data));  // sources/rtl/mcu/decode.v(104)
  binary_mux_s1_w8 mux0 (
    .i0(inst_d),
    .i1(inst),
    .sel(inst_en),
    .o(n0));  // sources/rtl/mcu/decode.v(88)
  binary_mux_s1_w8 mux1 (
    .i0(decode_data),
    .i1(inst),
    .sel(inst_data),
    .o(n11));  // sources/rtl/mcu/decode.v(110)
  AL_DFF null_cmd_reg (
    .clk(clk),
    .d(n14),
    .reset(1'b0),
    .set(1'b0),
    .q(null_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF rd_bus_cmd_reg (
    .clk(clk),
    .d(n69),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_bus_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF rd_ram_cmd_reg (
    .clk(clk),
    .d(n71),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_ram_cmd));  // sources/rtl/mcu/decode.v(156)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n11),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(decode_data));  // sources/rtl/mcu/decode.v(111)
  reg_ar_as_w8 reg1 (
    .clk(clk),
    .d(n0),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(inst_d));  // sources/rtl/mcu/decode.v(89)
  and u10 (n15, inst_data, inst_en);  // sources/rtl/mcu/decode.v(117)
  and u11 (n17, n15, n16);  // sources/rtl/mcu/decode.v(117)
  and u12 (n19, n15, n18);  // sources/rtl/mcu/decode.v(118)
  and u13 (n21, n15, n20);  // sources/rtl/mcu/decode.v(119)
  and u14 (n23, n15, n22);  // sources/rtl/mcu/decode.v(120)
  and u15 (n25, n12, n24);  // sources/rtl/mcu/decode.v(121)
  and u16 (n27, n12, n26);  // sources/rtl/mcu/decode.v(122)
  and u17 (n29, n12, n28);  // sources/rtl/mcu/decode.v(123)
  and u18 (n31, n12, n30);  // sources/rtl/mcu/decode.v(124)
  and u19 (n33, n12, n32);  // sources/rtl/mcu/decode.v(125)
  not u2 (n1, inst_data);  // sources/rtl/mcu/decode.v(96)
  and u20 (n35, n12, n34);  // sources/rtl/mcu/decode.v(126)
  and u21 (n37, n12, n36);  // sources/rtl/mcu/decode.v(127)
  and u22 (n39, n12, n38);  // sources/rtl/mcu/decode.v(128)
  and u23 (n41, n12, n40);  // sources/rtl/mcu/decode.v(129)
  and u24 (n43, n12, n42);  // sources/rtl/mcu/decode.v(130)
  and u25 (n45, n12, n44);  // sources/rtl/mcu/decode.v(131)
  and u26 (n47, n12, n46);  // sources/rtl/mcu/decode.v(132)
  and u27 (n49, n12, n48);  // sources/rtl/mcu/decode.v(133)
  and u28 (n51, n12, n50);  // sources/rtl/mcu/decode.v(134)
  and u29 (n53, n12, n52);  // sources/rtl/mcu/decode.v(135)
  or u3 (n4, n2, n3);  // sources/rtl/mcu/decode.v(97)
  buf u30 (decode_cmd[39], dbg_info_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u31 (decode_cmd[38], wt_ram_alu6_cmd);  // sources/rtl/mcu/decode.v(198)
  and u32 (n55, n12, n54);  // sources/rtl/mcu/decode.v(136)
  buf u33 (decode_cmd[37], wt_ram_alu5_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u34 (decode_cmd[36], wt_ram_alu4_cmd);  // sources/rtl/mcu/decode.v(198)
  and u35 (n57, n12, n56);  // sources/rtl/mcu/decode.v(137)
  buf u36 (decode_cmd[35], wt_ram_alu3_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u37 (decode_cmd[34], wt_ram_alu2_cmd);  // sources/rtl/mcu/decode.v(198)
  and u38 (n59, n12, n58);  // sources/rtl/mcu/decode.v(138)
  buf u39 (decode_cmd[33], wt_ram_alu1_cmd);  // sources/rtl/mcu/decode.v(198)
  or u4 (n6, n4, n5);  // sources/rtl/mcu/decode.v(98)
  buf u40 (decode_cmd[32], wt_ram_alu0_cmd);  // sources/rtl/mcu/decode.v(198)
  and u41 (n61, n12, n60);  // sources/rtl/mcu/decode.v(139)
  buf u42 (decode_cmd[31], wt_ram_c_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u43 (decode_cmd[30], wt_ram_b_cmd);  // sources/rtl/mcu/decode.v(198)
  and u44 (n63, n12, n62);  // sources/rtl/mcu/decode.v(140)
  buf u45 (decode_cmd[29], wt_ram_a_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u46 (decode_cmd[28], rd_ram_cmd);  // sources/rtl/mcu/decode.v(198)
  and u47 (n65, n12, n64);  // sources/rtl/mcu/decode.v(141)
  buf u48 (decode_cmd[27], rd_bus_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u49 (decode_cmd[26], wt_bus_cmd);  // sources/rtl/mcu/decode.v(198)
  or u5 (n8, n6, n7);  // sources/rtl/mcu/decode.v(99)
  and u50 (n67, n12, n66);  // sources/rtl/mcu/decode.v(142)
  buf u51 (decode_cmd[25], ex_aluk_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u52 (decode_cmd[24], ex_aluj_cmd);  // sources/rtl/mcu/decode.v(198)
  and u53 (n69, n12, n68);  // sources/rtl/mcu/decode.v(143)
  buf u54 (decode_cmd[23], ex_alui_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u55 (decode_cmd[22], ex_aluh_cmd);  // sources/rtl/mcu/decode.v(198)
  and u56 (n71, n12, n70);  // sources/rtl/mcu/decode.v(144)
  buf u57 (decode_cmd[21], ex_alug_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u58 (decode_cmd[20], ex_aluf_cmd);  // sources/rtl/mcu/decode.v(198)
  and u59 (n73, n12, n72);  // sources/rtl/mcu/decode.v(145)
  and u6 (n9, n1, n8);  // sources/rtl/mcu/decode.v(99)
  buf u60 (decode_cmd[19], ex_alue_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u61 (decode_cmd[18], ex_alud_cmd);  // sources/rtl/mcu/decode.v(198)
  and u62 (n75, n12, n74);  // sources/rtl/mcu/decode.v(146)
  buf u63 (decode_cmd[17], ex_aluc_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u64 (decode_cmd[16], ex_alub_cmd);  // sources/rtl/mcu/decode.v(198)
  and u65 (n77, n12, n76);  // sources/rtl/mcu/decode.v(147)
  buf u66 (decode_cmd[15], ex_alua_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u67 (decode_cmd[14], wt_timer_cmd);  // sources/rtl/mcu/decode.v(198)
  and u68 (n79, n12, n78);  // sources/rtl/mcu/decode.v(148)
  buf u69 (decode_cmd[13], wt_pc_cmd);  // sources/rtl/mcu/decode.v(198)
  AL_MUX u7 (
    .i0(inst_data),
    .i1(n9),
    .sel(inst_en),
    .o(n10));  // sources/rtl/mcu/decode.v(103)
  buf u70 (decode_cmd[12], wt_d_bt_cmd);  // sources/rtl/mcu/decode.v(198)
  and u71 (n81, n12, n80);  // sources/rtl/mcu/decode.v(149)
  buf u72 (decode_cmd[11], wt_c_bt_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u73 (decode_cmd[10], wt_b_bt_cmd);  // sources/rtl/mcu/decode.v(198)
  and u74 (n83, n12, n82);  // sources/rtl/mcu/decode.v(150)
  buf u75 (decode_cmd[9], wt_a_bt_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u76 (decode_cmd[8], wt_d_rt_cmd);  // sources/rtl/mcu/decode.v(198)
  and u77 (n85, n12, n84);  // sources/rtl/mcu/decode.v(151)
  buf u78 (decode_cmd[7], wt_c_rt_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u79 (decode_cmd[6], wt_b_rt_cmd);  // sources/rtl/mcu/decode.v(198)
  and u8 (n12, n1, inst_en);  // sources/rtl/mcu/decode.v(116)
  and u80 (n87, n12, n86);  // sources/rtl/mcu/decode.v(152)
  buf u81 (decode_cmd[5], wt_a_rt_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u82 (decode_cmd[4], wt_d_cmd);  // sources/rtl/mcu/decode.v(198)
  and u83 (n89, n12, n88);  // sources/rtl/mcu/decode.v(153)
  buf u84 (decode_cmd[3], wt_c_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u85 (decode_cmd[2], wt_b_cmd);  // sources/rtl/mcu/decode.v(198)
  and u86 (n91, n12, n90);  // sources/rtl/mcu/decode.v(154)
  buf u87 (decode_cmd[1], wt_a_cmd);  // sources/rtl/mcu/decode.v(198)
  buf u88 (decode_cmd[0], null_cmd);  // sources/rtl/mcu/decode.v(198)
  and u89 (n93, n12, n92);  // sources/rtl/mcu/decode.v(155)
  and u9 (n14, n12, n13);  // sources/rtl/mcu/decode.v(116)
  AL_DFF wt_a_bt_cmd_reg (
    .clk(clk),
    .d(n33),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_a_bt_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_a_cmd_reg (
    .clk(clk),
    .d(n17),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_a_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_a_rt_cmd_reg (
    .clk(clk),
    .d(n25),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_a_rt_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_b_bt_cmd_reg (
    .clk(clk),
    .d(n35),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_b_bt_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_b_cmd_reg (
    .clk(clk),
    .d(n19),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_b_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_b_rt_cmd_reg (
    .clk(clk),
    .d(n27),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_b_rt_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_bus_cmd_reg (
    .clk(clk),
    .d(n67),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_bus_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_c_bt_cmd_reg (
    .clk(clk),
    .d(n37),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_c_bt_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_c_cmd_reg (
    .clk(clk),
    .d(n21),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_c_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_c_rt_cmd_reg (
    .clk(clk),
    .d(n29),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_c_rt_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_d_bt_cmd_reg (
    .clk(clk),
    .d(n39),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_d_bt_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_d_cmd_reg (
    .clk(clk),
    .d(n23),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_d_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_d_rt_cmd_reg (
    .clk(clk),
    .d(n31),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_d_rt_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_pc_cmd_reg (
    .clk(clk),
    .d(n41),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_pc_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_ram_a_cmd_reg (
    .clk(clk),
    .d(n73),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_ram_a_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_ram_alu0_cmd_reg (
    .clk(clk),
    .d(n79),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_ram_alu0_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_ram_alu1_cmd_reg (
    .clk(clk),
    .d(n81),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_ram_alu1_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_ram_alu2_cmd_reg (
    .clk(clk),
    .d(n83),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_ram_alu2_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_ram_alu3_cmd_reg (
    .clk(clk),
    .d(n85),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_ram_alu3_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_ram_alu4_cmd_reg (
    .clk(clk),
    .d(n87),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_ram_alu4_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_ram_alu5_cmd_reg (
    .clk(clk),
    .d(n89),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_ram_alu5_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_ram_alu6_cmd_reg (
    .clk(clk),
    .d(n91),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_ram_alu6_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_ram_b_cmd_reg (
    .clk(clk),
    .d(n75),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_ram_b_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_ram_c_cmd_reg (
    .clk(clk),
    .d(n77),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_ram_c_cmd));  // sources/rtl/mcu/decode.v(156)
  AL_DFF wt_timer_cmd_reg (
    .clk(clk),
    .d(n43),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_timer_cmd));  // sources/rtl/mcu/decode.v(156)

endmodule 

module execute  // sources/rtl/mcu/execute.v(22)
  (
  alu_out0,
  alu_out1,
  alu_out2,
  alu_out3,
  alu_out4,
  bus_rdata,
  clk,
  decode_cmd,
  decode_data,
  ram_rdata,
  read_abcd,
  alu_cmd,
  alu_in1,
  alu_in2,
  bus_raddr,
  bus_ren,
  bus_waddr,
  bus_wdata,
  bus_wen,
  dbg_info,
  dbg_info_en,
  pc_wdata,
  pc_wen,
  ram_raddr,
  ram_ren,
  ram_waddr,
  ram_wdata,
  ram_wen,
  timer_wdata,
  timer_wen
  );

  input [8:0] alu_out0;  // sources/rtl/mcu/execute.v(50)
  input [15:0] alu_out1;  // sources/rtl/mcu/execute.v(51)
  input [7:0] alu_out2;  // sources/rtl/mcu/execute.v(52)
  input [7:0] alu_out3;  // sources/rtl/mcu/execute.v(53)
  input [7:0] alu_out4;  // sources/rtl/mcu/execute.v(54)
  input [7:0] bus_rdata;  // sources/rtl/mcu/execute.v(44)
  input clk;  // sources/rtl/mcu/execute.v(24)
  input [39:0] decode_cmd;  // sources/rtl/mcu/execute.v(27)
  input [7:0] decode_data;  // sources/rtl/mcu/execute.v(28)
  input [7:0] ram_rdata;  // sources/rtl/mcu/execute.v(36)
  input [3:0] read_abcd;  // sources/rtl/mcu/execute.v(61)
  output [10:0] alu_cmd;  // sources/rtl/mcu/execute.v(47)
  output [7:0] alu_in1;  // sources/rtl/mcu/execute.v(48)
  output [7:0] alu_in2;  // sources/rtl/mcu/execute.v(49)
  output [7:0] bus_raddr;  // sources/rtl/mcu/execute.v(43)
  output bus_ren;  // sources/rtl/mcu/execute.v(42)
  output [7:0] bus_waddr;  // sources/rtl/mcu/execute.v(40)
  output [7:0] bus_wdata;  // sources/rtl/mcu/execute.v(41)
  output bus_wen;  // sources/rtl/mcu/execute.v(39)
  output [15:0] dbg_info;  // sources/rtl/mcu/execute.v(63)
  output dbg_info_en;  // sources/rtl/mcu/execute.v(62)
  output [23:0] pc_wdata;  // sources/rtl/mcu/execute.v(58)
  output pc_wen;  // sources/rtl/mcu/execute.v(57)
  output [7:0] ram_raddr;  // sources/rtl/mcu/execute.v(35)
  output ram_ren;  // sources/rtl/mcu/execute.v(34)
  output [7:0] ram_waddr;  // sources/rtl/mcu/execute.v(32)
  output [7:0] ram_wdata;  // sources/rtl/mcu/execute.v(33)
  output ram_wen;  // sources/rtl/mcu/execute.v(31)
  output [23:0] timer_wdata;  // sources/rtl/mcu/execute.v(67)
  output timer_wen;  // sources/rtl/mcu/execute.v(66)

  wire [7:0] A;  // sources/rtl/mcu/execute.v(70)
  wire [7:0] B;  // sources/rtl/mcu/execute.v(71)
  wire [7:0] C;  // sources/rtl/mcu/execute.v(72)
  wire [7:0] D;  // sources/rtl/mcu/execute.v(73)
  wire [7:0] n1;
  wire [7:0] n15;
  wire [7:0] n16;
  wire [7:0] n17;
  wire [7:0] n2;
  wire [7:0] n27;
  wire [7:0] n28;
  wire [7:0] n29;
  wire [7:0] n3;
  wire [23:0] n32;
  wire [15:0] n35;
  wire [15:0] n36;
  wire [15:0] n37;
  wire [15:0] n38;
  wire [15:0] n39;
  wire [7:0] n4;
  wire [7:0] n42;
  wire [7:0] n43;
  wire [7:0] n44;
  wire [7:0] n45;
  wire [7:0] n46;
  wire [7:0] n47;
  wire [7:0] n48;
  wire [7:0] n49;
  wire [7:0] n5;
  wire [7:0] n50;
  wire [7:0] n51;
  wire [7:0] n52;
  wire [7:0] n6;
  wire [7:0] n7;
  wire [7:0] rom_data;  // sources/rtl/mcu/execute.v(74)
  wire [9:0] wt_ram_cmd;  // sources/rtl/mcu/execute.v(130)
  wire bus_to_a_wen;  // sources/rtl/mcu/execute.v(86)
  wire bus_to_b_wen;  // sources/rtl/mcu/execute.v(87)
  wire bus_to_c_wen;  // sources/rtl/mcu/execute.v(88)
  wire bus_to_d_wen;  // sources/rtl/mcu/execute.v(89)
  wire dbg_info_cmd;  // sources/rtl/mcu/execute.v(129)
  wire dbg_info_en0;  // sources/rtl/mcu/execute.v(77)
  wire n0;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n18;
  wire n19;
  wire n20;
  wire n21;
  wire n22;
  wire n23;
  wire n24;
  wire n25;
  wire n26;
  wire n30;
  wire n31;
  wire n33;
  wire n34;
  wire n40;
  wire n41;
  wire n8;
  wire n9;
  wire pc_wen0;  // sources/rtl/mcu/execute.v(75)
  wire ram_to_a_wen;  // sources/rtl/mcu/execute.v(82)
  wire ram_to_b_wen;  // sources/rtl/mcu/execute.v(83)
  wire ram_to_c_wen;  // sources/rtl/mcu/execute.v(84)
  wire ram_to_d_wen;  // sources/rtl/mcu/execute.v(85)
  wire rd_bus_cmd;  // sources/rtl/mcu/execute.v(117)
  wire rd_ram_cmd;  // sources/rtl/mcu/execute.v(118)
  wire rom_to_a_wen;  // sources/rtl/mcu/execute.v(78)
  wire rom_to_b_wen;  // sources/rtl/mcu/execute.v(79)
  wire rom_to_c_wen;  // sources/rtl/mcu/execute.v(80)
  wire rom_to_d_wen;  // sources/rtl/mcu/execute.v(81)
  wire timer_wen0;  // sources/rtl/mcu/execute.v(76)
  wire wt_a_bt_cmd;  // sources/rtl/mcu/execute.v(99)
  wire wt_a_cmd;  // sources/rtl/mcu/execute.v(91)
  wire wt_a_rt_cmd;  // sources/rtl/mcu/execute.v(95)
  wire wt_b_bt_cmd;  // sources/rtl/mcu/execute.v(100)
  wire wt_b_cmd;  // sources/rtl/mcu/execute.v(92)
  wire wt_b_rt_cmd;  // sources/rtl/mcu/execute.v(96)
  wire wt_bus_cmd;  // sources/rtl/mcu/execute.v(116)
  wire wt_c_bt_cmd;  // sources/rtl/mcu/execute.v(101)
  wire wt_c_cmd;  // sources/rtl/mcu/execute.v(93)
  wire wt_c_rt_cmd;  // sources/rtl/mcu/execute.v(97)
  wire wt_d_bt_cmd;  // sources/rtl/mcu/execute.v(102)
  wire wt_d_cmd;  // sources/rtl/mcu/execute.v(94)
  wire wt_d_rt_cmd;  // sources/rtl/mcu/execute.v(98)
  wire wt_pc_cmd;  // sources/rtl/mcu/execute.v(103)
  wire wt_timer_cmd;  // sources/rtl/mcu/execute.v(104)

  AL_DFF bus_ren_reg (
    .clk(clk),
    .d(rd_bus_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_ren));  // sources/rtl/mcu/execute.v(319)
  AL_DFF bus_to_a_wen_reg (
    .clk(clk),
    .d(wt_a_bt_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_to_a_wen));  // sources/rtl/mcu/execute.v(212)
  AL_DFF bus_to_b_wen_reg (
    .clk(clk),
    .d(wt_b_bt_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_to_b_wen));  // sources/rtl/mcu/execute.v(212)
  AL_DFF bus_to_c_wen_reg (
    .clk(clk),
    .d(wt_c_bt_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_to_c_wen));  // sources/rtl/mcu/execute.v(212)
  AL_DFF bus_to_d_wen_reg (
    .clk(clk),
    .d(wt_d_bt_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_to_d_wen));  // sources/rtl/mcu/execute.v(212)
  AL_DFF bus_wen_reg (
    .clk(clk),
    .d(wt_bus_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_wen));  // sources/rtl/mcu/execute.v(310)
  AL_DFF dbg_info_en0_reg (
    .clk(clk),
    .d(dbg_info_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(dbg_info_en0));  // sources/rtl/mcu/execute.v(336)
  AL_DFF dbg_info_en_reg (
    .clk(clk),
    .d(n34),
    .reset(1'b0),
    .set(1'b0),
    .q(dbg_info_en));  // sources/rtl/mcu/execute.v(336)
  eq_w8 eq0 (
    .i0(ram_raddr),
    .i1(ram_waddr),
    .o(n0));  // sources/rtl/mcu/execute.v(223)
  binary_mux_s1_w8 mux0 (
    .i0(ram_rdata),
    .i1(ram_wdata),
    .sel(n0),
    .o(n1));  // sources/rtl/mcu/execute.v(226)
  binary_mux_s1_w8 mux1 (
    .i0(A),
    .i1(n1),
    .sel(ram_to_a_wen),
    .o(n2));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w8 mux10 (
    .i0(D),
    .i1(n1),
    .sel(ram_to_d_wen),
    .o(n27));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w8 mux11 (
    .i0(n27),
    .i1(bus_rdata),
    .sel(bus_to_d_wen),
    .o(n28));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w8 mux12 (
    .i0(n28),
    .i1(rom_data),
    .sel(rom_to_d_wen),
    .o(n29));  // sources/rtl/mcu/execute.v(275)
  binary_mux_s1_w24 mux13 (
    .i0(pc_wdata),
    .i1({A,B,C}),
    .sel(n30),
    .o(n32));  // sources/rtl/mcu/execute.v(286)
  binary_mux_s1_w16 mux14 (
    .i0(dbg_info),
    .i1({8'b00001001,D}),
    .sel(read_abcd[3]),
    .o(n35));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w16 mux15 (
    .i0(n35),
    .i1({8'b00001000,C}),
    .sel(read_abcd[2]),
    .o(n36));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w16 mux16 (
    .i0(n36),
    .i1({8'b00000111,B}),
    .sel(read_abcd[1]),
    .o(n37));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w16 mux17 (
    .i0(n37),
    .i1({8'b00000110,A}),
    .sel(read_abcd[0]),
    .o(n38));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w16 mux18 (
    .i0(n38),
    .i1({A,B}),
    .sel(dbg_info_en0),
    .o(n39));  // sources/rtl/mcu/execute.v(350)
  binary_mux_s1_w8 mux19 (
    .i0(ram_waddr),
    .i1(D),
    .sel(n40),
    .o(n42));  // sources/rtl/mcu/execute.v(365)
  binary_mux_s1_w8 mux2 (
    .i0(n2),
    .i1(bus_rdata),
    .sel(bus_to_a_wen),
    .o(n3));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w8 mux20 (
    .i0(ram_wdata),
    .i1(alu_out4),
    .sel(wt_ram_cmd[9]),
    .o(n43));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w8 mux21 (
    .i0(n43),
    .i1(alu_out3),
    .sel(wt_ram_cmd[8]),
    .o(n44));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w8 mux22 (
    .i0(n44),
    .i1(alu_out2),
    .sel(wt_ram_cmd[7]),
    .o(n45));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w8 mux23 (
    .i0(n45),
    .i1(alu_out1[7:0]),
    .sel(wt_ram_cmd[6]),
    .o(n46));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w8 mux24 (
    .i0(n46),
    .i1(alu_out1[15:8]),
    .sel(wt_ram_cmd[5]),
    .o(n47));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w8 mux25 (
    .i0(n47),
    .i1(alu_out0[7:0]),
    .sel(wt_ram_cmd[4]),
    .o(n48));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w8 mux26 (
    .i0(n48),
    .i1({7'b0000000,alu_out0[8]}),
    .sel(wt_ram_cmd[3]),
    .o(n49));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w8 mux27 (
    .i0(n49),
    .i1(C),
    .sel(wt_ram_cmd[2]),
    .o(n50));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w8 mux28 (
    .i0(n50),
    .i1(B),
    .sel(wt_ram_cmd[1]),
    .o(n51));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w8 mux29 (
    .i0(n51),
    .i1(A),
    .sel(wt_ram_cmd[0]),
    .o(n52));  // sources/rtl/mcu/execute.v(390)
  binary_mux_s1_w8 mux3 (
    .i0(n3),
    .i1(rom_data),
    .sel(rom_to_a_wen),
    .o(n4));  // sources/rtl/mcu/execute.v(227)
  binary_mux_s1_w8 mux4 (
    .i0(B),
    .i1(n1),
    .sel(ram_to_b_wen),
    .o(n5));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w8 mux5 (
    .i0(n5),
    .i1(bus_rdata),
    .sel(bus_to_b_wen),
    .o(n6));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w8 mux6 (
    .i0(n6),
    .i1(rom_data),
    .sel(rom_to_b_wen),
    .o(n7));  // sources/rtl/mcu/execute.v(243)
  binary_mux_s1_w8 mux7 (
    .i0(C),
    .i1(n1),
    .sel(ram_to_c_wen),
    .o(n15));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w8 mux8 (
    .i0(n15),
    .i1(bus_rdata),
    .sel(bus_to_c_wen),
    .o(n16));  // sources/rtl/mcu/execute.v(259)
  binary_mux_s1_w8 mux9 (
    .i0(n16),
    .i1(rom_data),
    .sel(rom_to_c_wen),
    .o(n17));  // sources/rtl/mcu/execute.v(259)
  AL_DFF pc_wen0_reg (
    .clk(clk),
    .d(wt_pc_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(pc_wen0));  // sources/rtl/mcu/execute.v(287)
  AL_DFF pc_wen_reg (
    .clk(clk),
    .d(n31),
    .reset(1'b0),
    .set(1'b0),
    .q(pc_wen));  // sources/rtl/mcu/execute.v(287)
  AL_DFF ram_ren_reg (
    .clk(clk),
    .d(rd_ram_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_ren));  // sources/rtl/mcu/execute.v(327)
  AL_DFF ram_to_a_wen_reg (
    .clk(clk),
    .d(wt_a_rt_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_to_a_wen));  // sources/rtl/mcu/execute.v(203)
  AL_DFF ram_to_b_wen_reg (
    .clk(clk),
    .d(wt_b_rt_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_to_b_wen));  // sources/rtl/mcu/execute.v(203)
  AL_DFF ram_to_c_wen_reg (
    .clk(clk),
    .d(wt_c_rt_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_to_c_wen));  // sources/rtl/mcu/execute.v(203)
  AL_DFF ram_to_d_wen_reg (
    .clk(clk),
    .d(wt_d_rt_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_to_d_wen));  // sources/rtl/mcu/execute.v(203)
  AL_DFF ram_wen_reg (
    .clk(clk),
    .d(n40),
    .reset(1'b0),
    .set(1'b0),
    .q(ram_wen));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n4),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(A));  // sources/rtl/mcu/execute.v(228)
  reg_ar_as_w8 reg1 (
    .clk(clk),
    .d(n7),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(B));  // sources/rtl/mcu/execute.v(244)
  reg_ar_as_w8 reg10 (
    .clk(clk),
    .d(n52),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(ram_wdata));  // sources/rtl/mcu/execute.v(391)
  reg_ar_as_w8 reg11 (
    .clk(clk),
    .d(decode_data),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(rom_data));  // sources/rtl/mcu/execute.v(185)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n17),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(C));  // sources/rtl/mcu/execute.v(260)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n29),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(D));  // sources/rtl/mcu/execute.v(276)
  reg_ar_as_w24 reg4 (
    .clk(clk),
    .d(n32),
    .reset(24'b000000000000000000000000),
    .set(24'b000000000000000000000000),
    .q(pc_wdata));  // sources/rtl/mcu/execute.v(287)
  reg_ar_as_w24 reg5 (
    .clk(clk),
    .d({A,B,C}),
    .reset(24'b000000000000000000000000),
    .set(24'b000000000000000000000000),
    .q(timer_wdata));  // sources/rtl/mcu/execute.v(295)
  reg_ar_as_w11 reg6 (
    .clk(clk),
    .d(decode_cmd[25:15]),
    .reset(11'b00000000000),
    .set(11'b00000000000),
    .q(alu_cmd));  // sources/rtl/mcu/execute.v(301)
  reg_ar_as_w16 reg7 (
    .clk(clk),
    .d(n39),
    .reset(16'b0000000000000000),
    .set(16'b0000000000000000),
    .q(dbg_info));  // sources/rtl/mcu/execute.v(351)
  reg_ar_as_w10 reg8 (
    .clk(clk),
    .d(decode_cmd[38:29]),
    .reset(10'b0000000000),
    .set(10'b0000000000),
    .q(wt_ram_cmd));  // sources/rtl/mcu/execute.v(359)
  reg_ar_as_w8 reg9 (
    .clk(clk),
    .d(n42),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(ram_waddr));  // sources/rtl/mcu/execute.v(366)
  AL_DFF rom_to_a_wen_reg (
    .clk(clk),
    .d(wt_a_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_to_a_wen));  // sources/rtl/mcu/execute.v(194)
  AL_DFF rom_to_b_wen_reg (
    .clk(clk),
    .d(wt_b_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_to_b_wen));  // sources/rtl/mcu/execute.v(194)
  AL_DFF rom_to_c_wen_reg (
    .clk(clk),
    .d(wt_c_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_to_c_wen));  // sources/rtl/mcu/execute.v(194)
  AL_DFF rom_to_d_wen_reg (
    .clk(clk),
    .d(wt_d_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_to_d_wen));  // sources/rtl/mcu/execute.v(194)
  AL_DFF timer_wen0_reg (
    .clk(clk),
    .d(wt_timer_cmd),
    .reset(1'b0),
    .set(1'b0),
    .q(timer_wen0));  // sources/rtl/mcu/execute.v(295)
  AL_DFF timer_wen_reg (
    .clk(clk),
    .d(timer_wen0),
    .reset(1'b0),
    .set(1'b0),
    .q(timer_wen));  // sources/rtl/mcu/execute.v(295)
  buf u10 (wt_b_rt_cmd, decode_cmd[6]);  // sources/rtl/mcu/execute.v(138)
  buf u11 (wt_c_rt_cmd, decode_cmd[7]);  // sources/rtl/mcu/execute.v(139)
  buf u12 (wt_d_rt_cmd, decode_cmd[8]);  // sources/rtl/mcu/execute.v(140)
  buf u13 (wt_a_bt_cmd, decode_cmd[9]);  // sources/rtl/mcu/execute.v(141)
  buf u14 (wt_b_bt_cmd, decode_cmd[10]);  // sources/rtl/mcu/execute.v(142)
  buf u15 (wt_c_bt_cmd, decode_cmd[11]);  // sources/rtl/mcu/execute.v(143)
  buf u16 (wt_d_bt_cmd, decode_cmd[12]);  // sources/rtl/mcu/execute.v(144)
  buf u17 (wt_pc_cmd, decode_cmd[13]);  // sources/rtl/mcu/execute.v(145)
  buf u18 (wt_timer_cmd, decode_cmd[14]);  // sources/rtl/mcu/execute.v(146)
  buf u19 (bus_wdata[3], A[3]);  // sources/rtl/mcu/execute.v(313)
  buf u2 (bus_wdata[6], A[6]);  // sources/rtl/mcu/execute.v(313)
  buf u20 (bus_wdata[2], A[2]);  // sources/rtl/mcu/execute.v(313)
  buf u21 (bus_wdata[1], A[1]);  // sources/rtl/mcu/execute.v(313)
  buf u22 (bus_raddr[7], D[7]);  // sources/rtl/mcu/execute.v(321)
  buf u23 (bus_raddr[6], D[6]);  // sources/rtl/mcu/execute.v(321)
  buf u24 (bus_raddr[5], D[5]);  // sources/rtl/mcu/execute.v(321)
  buf u25 (bus_raddr[4], D[4]);  // sources/rtl/mcu/execute.v(321)
  buf u26 (bus_raddr[3], D[3]);  // sources/rtl/mcu/execute.v(321)
  buf u27 (bus_raddr[2], D[2]);  // sources/rtl/mcu/execute.v(321)
  buf u28 (bus_raddr[1], D[1]);  // sources/rtl/mcu/execute.v(321)
  buf u29 (ram_raddr[7], D[7]);  // sources/rtl/mcu/execute.v(329)
  buf u3 (bus_wdata[5], A[5]);  // sources/rtl/mcu/execute.v(313)
  buf u30 (wt_bus_cmd, decode_cmd[26]);  // sources/rtl/mcu/execute.v(158)
  buf u31 (rd_bus_cmd, decode_cmd[27]);  // sources/rtl/mcu/execute.v(159)
  buf u32 (rd_ram_cmd, decode_cmd[28]);  // sources/rtl/mcu/execute.v(160)
  buf u33 (ram_raddr[6], D[6]);  // sources/rtl/mcu/execute.v(329)
  buf u34 (ram_raddr[5], D[5]);  // sources/rtl/mcu/execute.v(329)
  buf u35 (ram_raddr[4], D[4]);  // sources/rtl/mcu/execute.v(329)
  buf u36 (ram_raddr[3], D[3]);  // sources/rtl/mcu/execute.v(329)
  buf u37 (ram_raddr[2], D[2]);  // sources/rtl/mcu/execute.v(329)
  buf u38 (ram_raddr[1], D[1]);  // sources/rtl/mcu/execute.v(329)
  or u39 (n33, n19, n18);  // sources/rtl/mcu/execute.v(335)
  buf u4 (bus_wdata[4], A[4]);  // sources/rtl/mcu/execute.v(313)
  or u40 (n18, read_abcd[2], read_abcd[3]);  // sources/rtl/mcu/execute.v(335)
  or u41 (n40, n24, n20);  // sources/rtl/mcu/execute.v(358)
  or u42 (n20, n23, n21);  // sources/rtl/mcu/execute.v(358)
  buf u43 (dbg_info_cmd, decode_cmd[39]);  // sources/rtl/mcu/execute.v(171)
  or u44 (n21, wt_ram_cmd[7], n22);  // sources/rtl/mcu/execute.v(358)
  or u45 (n22, wt_ram_cmd[8], wt_ram_cmd[9]);  // sources/rtl/mcu/execute.v(358)
  or u46 (n23, wt_ram_cmd[5], wt_ram_cmd[6]);  // sources/rtl/mcu/execute.v(358)
  or u47 (n24, n41, n25);  // sources/rtl/mcu/execute.v(358)
  or u48 (n25, wt_ram_cmd[2], n26);  // sources/rtl/mcu/execute.v(358)
  or u49 (n26, wt_ram_cmd[3], wt_ram_cmd[4]);  // sources/rtl/mcu/execute.v(358)
  buf u5 (wt_a_cmd, decode_cmd[1]);  // sources/rtl/mcu/execute.v(133)
  AL_MUX u50 (
    .i0(pc_wen),
    .i1(pc_wen0),
    .sel(n30),
    .o(n31));  // sources/rtl/mcu/execute.v(286)
  or u51 (n14, D[0], D[1]);  // sources/rtl/mcu/execute.v(282)
  buf u52 (alu_in1[0], A[0]);  // sources/rtl/mcu/execute.v(303)
  buf u53 (alu_in2[0], B[0]);  // sources/rtl/mcu/execute.v(304)
  buf u54 (bus_waddr[0], D[0]);  // sources/rtl/mcu/execute.v(312)
  buf u55 (bus_wdata[0], A[0]);  // sources/rtl/mcu/execute.v(313)
  buf u56 (bus_raddr[0], D[0]);  // sources/rtl/mcu/execute.v(321)
  buf u57 (ram_raddr[0], D[0]);  // sources/rtl/mcu/execute.v(329)
  or u58 (n34, dbg_info_en0, n33);  // sources/rtl/mcu/execute.v(335)
  or u59 (n19, read_abcd[0], read_abcd[1]);  // sources/rtl/mcu/execute.v(335)
  buf u6 (wt_b_cmd, decode_cmd[2]);  // sources/rtl/mcu/execute.v(134)
  or u60 (n41, wt_ram_cmd[0], wt_ram_cmd[1]);  // sources/rtl/mcu/execute.v(358)
  buf u61 (bus_wdata[7], A[7]);  // sources/rtl/mcu/execute.v(313)
  buf u62 (bus_waddr[1], D[1]);  // sources/rtl/mcu/execute.v(312)
  buf u63 (bus_waddr[2], D[2]);  // sources/rtl/mcu/execute.v(312)
  buf u64 (bus_waddr[3], D[3]);  // sources/rtl/mcu/execute.v(312)
  buf u65 (bus_waddr[4], D[4]);  // sources/rtl/mcu/execute.v(312)
  buf u66 (bus_waddr[5], D[5]);  // sources/rtl/mcu/execute.v(312)
  buf u67 (bus_waddr[6], D[6]);  // sources/rtl/mcu/execute.v(312)
  buf u68 (bus_waddr[7], D[7]);  // sources/rtl/mcu/execute.v(312)
  buf u69 (alu_in2[1], B[1]);  // sources/rtl/mcu/execute.v(304)
  buf u7 (wt_c_cmd, decode_cmd[3]);  // sources/rtl/mcu/execute.v(135)
  buf u70 (alu_in2[2], B[2]);  // sources/rtl/mcu/execute.v(304)
  buf u71 (alu_in2[3], B[3]);  // sources/rtl/mcu/execute.v(304)
  buf u72 (alu_in2[4], B[4]);  // sources/rtl/mcu/execute.v(304)
  buf u73 (alu_in2[5], B[5]);  // sources/rtl/mcu/execute.v(304)
  buf u74 (alu_in2[6], B[6]);  // sources/rtl/mcu/execute.v(304)
  buf u75 (alu_in2[7], B[7]);  // sources/rtl/mcu/execute.v(304)
  buf u76 (alu_in1[1], A[1]);  // sources/rtl/mcu/execute.v(303)
  buf u77 (alu_in1[2], A[2]);  // sources/rtl/mcu/execute.v(303)
  buf u78 (alu_in1[3], A[3]);  // sources/rtl/mcu/execute.v(303)
  buf u79 (alu_in1[4], A[4]);  // sources/rtl/mcu/execute.v(303)
  buf u8 (wt_d_cmd, decode_cmd[4]);  // sources/rtl/mcu/execute.v(136)
  buf u80 (alu_in1[5], A[5]);  // sources/rtl/mcu/execute.v(303)
  buf u81 (alu_in1[6], A[6]);  // sources/rtl/mcu/execute.v(303)
  buf u82 (alu_in1[7], A[7]);  // sources/rtl/mcu/execute.v(303)
  or u83 (n13, D[2], D[3]);  // sources/rtl/mcu/execute.v(282)
  or u84 (n12, n14, n13);  // sources/rtl/mcu/execute.v(282)
  or u85 (n11, D[4], D[5]);  // sources/rtl/mcu/execute.v(282)
  or u86 (n10, D[6], D[7]);  // sources/rtl/mcu/execute.v(282)
  or u87 (n9, n11, n10);  // sources/rtl/mcu/execute.v(282)
  or u88 (n8, n12, n9);  // sources/rtl/mcu/execute.v(282)
  not u89 (n30, n8);  // sources/rtl/mcu/execute.v(282)
  buf u9 (wt_a_rt_cmd, decode_cmd[5]);  // sources/rtl/mcu/execute.v(137)

endmodule 

module fetch  // sources/rtl/mcu/fetch.v(22)
  (
  clk,
  dbg_en,
  dbg_inst,
  dbg_inst_en,
  dbg_rom_raddr,
  dbg_rom_ren,
  pc_wdata,
  pc_wen,
  rom_rdata,
  timer_state,
  dbg_rom_rdata,
  inst,
  inst_en,
  rom_raddr,
  rom_ren
  );

  input clk;  // sources/rtl/mcu/fetch.v(24)
  input dbg_en;  // sources/rtl/mcu/fetch.v(32)
  input [7:0] dbg_inst;  // sources/rtl/mcu/fetch.v(37)
  input dbg_inst_en;  // sources/rtl/mcu/fetch.v(36)
  input [23:0] dbg_rom_raddr;  // sources/rtl/mcu/fetch.v(34)
  input dbg_rom_ren;  // sources/rtl/mcu/fetch.v(33)
  input [23:0] pc_wdata;  // sources/rtl/mcu/fetch.v(44)
  input pc_wen;  // sources/rtl/mcu/fetch.v(43)
  input [7:0] rom_rdata;  // sources/rtl/mcu/fetch.v(29)
  input timer_state;  // sources/rtl/mcu/fetch.v(40)
  output [7:0] dbg_rom_rdata;  // sources/rtl/mcu/fetch.v(35)
  output [7:0] inst;  // sources/rtl/mcu/fetch.v(48)
  output inst_en;  // sources/rtl/mcu/fetch.v(47)
  output [23:0] rom_raddr;  // sources/rtl/mcu/fetch.v(28)
  output rom_ren;  // sources/rtl/mcu/fetch.v(27)

  wire [23:0] n1;
  wire [7:0] n10;
  wire [7:0] n11;
  wire [23:0] n2;
  wire [23:0] n3;
  wire [23:0] n4;
  wire [23:0] n6;
  wire [23:0] n7;
  wire [7:0] n9;
  wire [23:0] pc;  // sources/rtl/mcu/fetch.v(51)
  wire fetch_en;  // sources/rtl/mcu/fetch.v(52)
  wire n0;
  wire n5;
  wire n8;
  wire rom_bk_en;  // sources/rtl/mcu/fetch.v(53)

  add_pu24_pu24_o24 add0 (
    .i0(pc),
    .i1(24'b000000000000000000000001),
    .o(n1));  // sources/rtl/mcu/fetch.v(74)
  AL_DFF fetch_en_reg (
    .clk(clk),
    .d(n0),
    .reset(1'b0),
    .set(1'b0),
    .q(fetch_en));  // sources/rtl/mcu/fetch.v(64)
  AL_DFF inst_en_reg (
    .clk(clk),
    .d(n8),
    .reset(1'b0),
    .set(1'b0),
    .q(inst_en));  // sources/rtl/mcu/fetch.v(97)
  binary_mux_s1_w24 mux0 (
    .i0(pc),
    .i1(n1),
    .sel(fetch_en),
    .o(n2));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w24 mux1 (
    .i0(n2),
    .i1(pc_wdata),
    .sel(pc_wen),
    .o(n3));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w24 mux2 (
    .i0(n3),
    .i1(24'b000000000000000000000000),
    .sel(dbg_en),
    .o(n4));  // sources/rtl/mcu/fetch.v(74)
  binary_mux_s1_w24 mux3 (
    .i0(rom_raddr),
    .i1(pc),
    .sel(fetch_en),
    .o(n6));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w24 mux4 (
    .i0(n6),
    .i1(dbg_rom_raddr),
    .sel(dbg_rom_ren),
    .o(n7));  // sources/rtl/mcu/fetch.v(89)
  binary_mux_s1_w8 mux5 (
    .i0(inst),
    .i1(rom_rdata),
    .sel(rom_bk_en),
    .o(n9));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w8 mux6 (
    .i0(n9),
    .i1(dbg_inst),
    .sel(dbg_inst_en),
    .o(n10));  // sources/rtl/mcu/fetch.v(105)
  binary_mux_s1_w8 mux7 (
    .i0(dbg_rom_rdata),
    .i1(rom_rdata),
    .sel(dbg_en),
    .o(n11));  // sources/rtl/mcu/fetch.v(112)
  reg_ar_as_w24 reg0 (
    .clk(clk),
    .d(n4),
    .reset(24'b000000000000000000000000),
    .set(24'b000000000000000000000000),
    .q(pc));  // sources/rtl/mcu/fetch.v(75)
  reg_ar_as_w24 reg1 (
    .clk(clk),
    .d(n7),
    .reset(24'b000000000000000000000000),
    .set(24'b000000000000000000000000),
    .q(rom_raddr));  // sources/rtl/mcu/fetch.v(90)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n10),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(inst));  // sources/rtl/mcu/fetch.v(106)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n11),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(dbg_rom_rdata));  // sources/rtl/mcu/fetch.v(113)
  AL_DFF rom_bk_en_reg (
    .clk(clk),
    .d(rom_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_bk_en));  // sources/rtl/mcu/fetch.v(97)
  AL_DFF rom_ren_reg (
    .clk(clk),
    .d(n5),
    .reset(1'b0),
    .set(1'b0),
    .q(rom_ren));  // sources/rtl/mcu/fetch.v(81)
  AL_MUX u2 (
    .i0(timer_state),
    .i1(1'b0),
    .sel(dbg_en),
    .o(n0));  // sources/rtl/mcu/fetch.v(63)
  or u3 (n5, dbg_rom_ren, fetch_en);  // sources/rtl/mcu/fetch.v(80)
  or u4 (n8, dbg_inst_en, rom_bk_en);  // sources/rtl/mcu/fetch.v(96)

endmodule 

module timer  // sources/rtl/mcu/timer.v(22)
  (
  clk,
  timer_wdata,
  timer_wen,
  timer_state
  );

  input clk;  // sources/rtl/mcu/timer.v(24)
  input [23:0] timer_wdata;  // sources/rtl/mcu/timer.v(28)
  input timer_wen;  // sources/rtl/mcu/timer.v(27)
  output timer_state;  // sources/rtl/mcu/timer.v(30)

  wire [23:0] cnt;  // sources/rtl/mcu/timer.v(33)
  wire [24:0] n1;
  wire [23:0] n2;
  wire [23:0] n3;
  wire n0;
  wire n4;

  eq_w24 eq0 (
    .i0(cnt),
    .i1(24'b000000000000000000000000),
    .o(n4));  // sources/rtl/mcu/timer.v(47)
  binary_mux_s1_w24 mux0 (
    .i0(cnt),
    .i1(n1[23:0]),
    .sel(n0),
    .o(n2));  // sources/rtl/mcu/timer.v(41)
  binary_mux_s1_w24 mux1 (
    .i0(n2),
    .i1(timer_wdata),
    .sel(timer_wen),
    .o(n3));  // sources/rtl/mcu/timer.v(41)
  ne_w32 neq0 (
    .i0({8'b00000000,cnt}),
    .i1(32'b00000000000000000000000000000000),
    .o(n0));  // sources/rtl/mcu/timer.v(40)
  reg_ar_as_w24 reg0 (
    .clk(clk),
    .d(n3),
    .reset(24'b000000000000000000000000),
    .set(24'b000000000000000000000000),
    .q(cnt));  // sources/rtl/mcu/timer.v(42)
  add_pu25_mu25_o25 sub0 (
    .i0({1'b0,cnt}),
    .i1(25'b0000000000000000000000001),
    .o({open_n1,n1[23:0]}));  // sources/rtl/mcu/timer.v(41)
  AL_DFF timer_state_reg (
    .clk(clk),
    .d(n4),
    .reset(1'b0),
    .set(1'b0),
    .q(timer_state));  // sources/rtl/mcu/timer.v(48)

endmodule 

module add_pu19_pu19_o19
  (
  i0,
  i1,
  o
  );

  input [18:0] i0;
  input [18:0] i1;
  output [18:0] o;



endmodule 

module binary_mux_s1_w6
  (
  i0,
  i1,
  sel,
  o
  );

  input [5:0] i0;
  input [5:0] i1;
  input sel;
  output [5:0] o;



endmodule 

module reg_ar_as_w6
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [5:0] d;
  input en;
  input [5:0] reset;
  input [5:0] set;
  output [5:0] q;



endmodule 

module reg_ar_as_w19
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [18:0] d;
  input en;
  input [18:0] reset;
  input [18:0] set;
  output [18:0] q;



endmodule 

module ram_w4x8_r4x8
  (
  clk1,
  ra1,
  re1,
  wa1,
  wd1,
  we1,
  rd1
  );

  input clk1;
  input [3:0] ra1;
  input re1;
  input [3:0] wa1;
  input [7:0] wd1;
  input we1;
  output [7:0] rd1;



endmodule 

module ram_w12x8_r12x8
  (
  clk1,
  ra1,
  re1,
  wa1,
  wd1,
  we1,
  rd1
  );

  input clk1;
  input [11:0] ra1;
  input re1;
  input [11:0] wa1;
  input [7:0] wd1;
  input we1;
  output [7:0] rd1;



endmodule 

module \uart_rx(BAUDRATE=921600,CLK_RATE=25200000)   // sources/rtl/uart/uart_rx.v(22)
  (
  clk,
  rx,
  rx_data,
  rx_en
  );

  input clk;  // sources/rtl/uart/uart_rx.v(28)
  input rx;  // sources/rtl/uart/uart_rx.v(31)
  output [7:0] rx_data;  // sources/rtl/uart/uart_rx.v(35)
  output rx_en;  // sources/rtl/uart/uart_rx.v(34)

  parameter BAUDRATE = 921600;
  parameter CLK_RATE = 25200000;
  wire [31:0] clk_cnt;  // sources/rtl/uart/uart_rx.v(43)
  wire [3:0] cnt;  // sources/rtl/uart/uart_rx.v(40)
  wire [7:0] data;  // sources/rtl/uart/uart_rx.v(41)
  wire [3:0] n13;
  wire [3:0] n14;
  wire [3:0] n15;
  wire [7:0] n25;
  wire [7:0] n26;
  wire [7:0] n30;
  wire [31:0] n7;
  wire [31:0] n8;
  wire [31:0] n9;
  wire [1:0] rx_d;  // sources/rtl/uart/uart_rx.v(42)
  wire clk_en;  // sources/rtl/uart/uart_rx.v(39)
  wire n0;
  wire n1;
  wire n10;
  wire n11;
  wire n12;
  wire n16;
  wire n17;
  wire n18;
  wire n19;
  wire n2;
  wire n20;
  wire n21;
  wire n22;
  wire n23;
  wire n24;
  wire n27;
  wire n28;
  wire n29;
  wire n3;
  wire n4;
  wire n5;
  wire n6;
  wire start;  // sources/rtl/uart/uart_rx.v(38)

  add_pu32_pu32_o32 add0 (
    .i0(clk_cnt),
    .i1(32'b00000000000000000000000000000001),
    .o(n7));  // sources/rtl/uart/uart_rx.v(73)
  add_pu4_pu4_o4 add1 (
    .i0(cnt),
    .i1(4'b0001),
    .o(n13));  // sources/rtl/uart/uart_rx.v(88)
  AL_DFF clk_en_reg (
    .clk(clk),
    .d(n5),
    .reset(1'b0),
    .set(1'b0),
    .q(clk_en));  // sources/rtl/uart/uart_rx.v(80)
  eq_w2 eq0 (
    .i0(rx_d),
    .i1(2'b10),
    .o(n0));  // sources/rtl/uart/uart_rx.v(59)
  eq_w4 eq1 (
    .i0(cnt),
    .i1(4'b1001),
    .o(n1));  // sources/rtl/uart/uart_rx.v(61)
  eq_w4 eq10 (
    .i0(cnt),
    .i1(4'b1000),
    .o(n23));  // sources/rtl/uart/uart_rx.v(103)
  eq_w32 eq2 (
    .i0(clk_cnt),
    .i1(32'b00000000000000000000000000011010),
    .o(n5));  // sources/rtl/uart/uart_rx.v(70)
  eq_w4 eq3 (
    .i0(cnt),
    .i1(4'b0001),
    .o(n16));  // sources/rtl/uart/uart_rx.v(96)
  eq_w4 eq4 (
    .i0(cnt),
    .i1(4'b0010),
    .o(n17));  // sources/rtl/uart/uart_rx.v(97)
  eq_w4 eq5 (
    .i0(cnt),
    .i1(4'b0011),
    .o(n18));  // sources/rtl/uart/uart_rx.v(98)
  eq_w4 eq6 (
    .i0(cnt),
    .i1(4'b0100),
    .o(n19));  // sources/rtl/uart/uart_rx.v(99)
  eq_w4 eq7 (
    .i0(cnt),
    .i1(4'b0101),
    .o(n20));  // sources/rtl/uart/uart_rx.v(100)
  eq_w4 eq8 (
    .i0(cnt),
    .i1(4'b0110),
    .o(n21));  // sources/rtl/uart/uart_rx.v(101)
  eq_w4 eq9 (
    .i0(cnt),
    .i1(4'b0111),
    .o(n22));  // sources/rtl/uart/uart_rx.v(102)
  binary_mux_s1_w32 mux0 (
    .i0(n7),
    .i1(32'b00000000000000000000000000000000),
    .sel(n5),
    .o(n8));  // sources/rtl/uart/uart_rx.v(73)
  binary_mux_s1_w32 mux1 (
    .i0(32'b00000000000000000000000000001101),
    .i1(n8),
    .sel(start),
    .o(n9));  // sources/rtl/uart/uart_rx.v(73)
  binary_mux_s1_w4 mux2 (
    .i0(cnt),
    .i1(n13),
    .sel(clk_en),
    .o(n14));  // sources/rtl/uart/uart_rx.v(88)
  binary_mux_s1_w4 mux3 (
    .i0(4'b0000),
    .i1(n14),
    .sel(start),
    .o(n15));  // sources/rtl/uart/uart_rx.v(88)
  binary_mux_s1_w8 mux4 (
    .i0(data),
    .i1(n25),
    .sel(clk_en),
    .o(n26));  // sources/rtl/uart/uart_rx.v(105)
  binary_mux_s1_w8 mux5 (
    .i0(rx_data),
    .i1(data),
    .sel(n1),
    .o(n30));  // sources/rtl/uart/uart_rx.v(117)
  reg_ar_as_w32 reg0 (
    .clk(clk),
    .d(n9),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(clk_cnt));  // sources/rtl/uart/uart_rx.v(74)
  reg_ar_as_w4 reg1 (
    .clk(clk),
    .d(n15),
    .reset(4'b0000),
    .set(4'b0000),
    .q(cnt));  // sources/rtl/uart/uart_rx.v(89)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n26),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(data));  // sources/rtl/uart/uart_rx.v(105)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n30),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(rx_data));  // sources/rtl/uart/uart_rx.v(118)
  reg_ar_as_w2 reg4 (
    .clk(clk),
    .d({rx_d[0],rx}),
    .reset(2'b00),
    .set(2'b00),
    .q(rx_d));  // sources/rtl/uart/uart_rx.v(54)
  AL_DFF rx_en_reg (
    .clk(clk),
    .d(n28),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_en));  // sources/rtl/uart/uart_rx.v(111)
  onehot_mux_s9_w8 sel0 (
    .i0(data),
    .i1({rx,data[6:0]}),
    .i2({data[7],rx,data[5:0]}),
    .i3({data[7:6],rx,data[4:0]}),
    .i4({data[7:5],rx,data[3:0]}),
    .i5({data[7:4],rx,data[2:0]}),
    .i6({data[7:3],rx,data[1:0]}),
    .i7({data[7:2],rx,data[0]}),
    .i8({data[7:1],rx}),
    .sel({n16,n17,n18,n19,n20,n21,n22,n23,n24}),
    .o(n25));  // sources/rtl/uart/uart_rx.v(104)
  AL_DFF start_reg (
    .clk(clk),
    .d(n3),
    .reset(1'b0),
    .set(1'b0),
    .q(start));  // sources/rtl/uart/uart_rx.v(63)
  and u10 (n28, start, n1);  // sources/rtl/uart/uart_rx.v(110)
  or u11 (n29, n23, n22);  // sources/rtl/uart/uart_rx.v(104)
  not u12 (n24, n6);  // sources/rtl/uart/uart_rx.v(104)
  or u2 (n6, n10, n12);  // sources/rtl/uart/uart_rx.v(104)
  or u3 (n12, n11, n4);  // sources/rtl/uart/uart_rx.v(104)
  AL_MUX u4 (
    .i0(start),
    .i1(1'b0),
    .sel(n1),
    .o(n2));  // sources/rtl/uart/uart_rx.v(62)
  AL_MUX u5 (
    .i0(n2),
    .i1(1'b1),
    .sel(n0),
    .o(n3));  // sources/rtl/uart/uart_rx.v(62)
  or u6 (n4, n17, n16);  // sources/rtl/uart/uart_rx.v(104)
  or u7 (n10, n29, n27);  // sources/rtl/uart/uart_rx.v(104)
  or u8 (n11, n19, n18);  // sources/rtl/uart/uart_rx.v(104)
  or u9 (n27, n21, n20);  // sources/rtl/uart/uart_rx.v(104)

endmodule 

module \uart_tx(BAUDRATE=921600,CLK_RATE=25200000)   // sources/rtl/uart/uart_tx.v(22)
  (
  clk,
  tx_data,
  tx_en,
  tx,
  tx_ready
  );

  input clk;  // sources/rtl/uart/uart_tx.v(28)
  input [7:0] tx_data;  // sources/rtl/uart/uart_tx.v(35)
  input tx_en;  // sources/rtl/uart/uart_tx.v(34)
  output tx;  // sources/rtl/uart/uart_tx.v(31)
  output tx_ready;  // sources/rtl/uart/uart_tx.v(36)

  parameter BAUDRATE = 921600;
  parameter CLK_RATE = 25200000;
  wire [31:0] clk_cnt;  // sources/rtl/uart/uart_tx.v(43)
  wire [3:0] cnt;  // sources/rtl/uart/uart_tx.v(41)
  wire [7:0] data;  // sources/rtl/uart/uart_tx.v(42)
  wire [31:0] n1;
  wire [3:0] n10;
  wire [3:0] n11;
  wire [3:0] n12;
  wire [31:0] n2;
  wire [31:0] n3;
  wire [7:0] n9;
  wire clk_en;  // sources/rtl/uart/uart_tx.v(40)
  wire n0;
  wire n13;
  wire n14;
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire start;  // sources/rtl/uart/uart_tx.v(39)

  add_pu32_pu32_o32 add0 (
    .i0(clk_cnt),
    .i1(32'b00000000000000000000000000000001),
    .o(n1));  // sources/rtl/uart/uart_tx.v(58)
  add_pu4_pu4_o4 add1 (
    .i0(cnt),
    .i1(4'b0001),
    .o(n10));  // sources/rtl/uart/uart_tx.v(89)
  AL_DFF clk_en_reg (
    .clk(clk),
    .d(n0),
    .reset(1'b0),
    .set(1'b0),
    .q(clk_en));  // sources/rtl/uart/uart_tx.v(65)
  eq_w32 eq0 (
    .i0(clk_cnt),
    .i1(32'b00000000000000000000000000011010),
    .o(n0));  // sources/rtl/uart/uart_tx.v(55)
  eq_w4 eq1 (
    .i0(cnt),
    .i1(4'b1010),
    .o(n4));  // sources/rtl/uart/uart_tx.v(72)
  binary_mux_s1_w32 mux0 (
    .i0(n1),
    .i1(32'b00000000000000000000000000000000),
    .sel(n0),
    .o(n2));  // sources/rtl/uart/uart_tx.v(58)
  binary_mux_s1_w32 mux1 (
    .i0(32'b00000000000000000000000000000000),
    .i1(n2),
    .sel(start),
    .o(n3));  // sources/rtl/uart/uart_tx.v(58)
  binary_mux_s1_w8 mux2 (
    .i0(data),
    .i1(tx_data),
    .sel(n8),
    .o(n9));  // sources/rtl/uart/uart_tx.v(80)
  binary_mux_s1_w4 mux3 (
    .i0(cnt),
    .i1(n10),
    .sel(clk_en),
    .o(n11));  // sources/rtl/uart/uart_tx.v(89)
  binary_mux_s1_w4 mux4 (
    .i0(4'b0000),
    .i1(n11),
    .sel(start),
    .o(n12));  // sources/rtl/uart/uart_tx.v(89)
  binary_mux_s4_w1 mux5 (
    .i0(1'b1),
    .i1(1'b0),
    .i10(1'b1),
    .i11(tx),
    .i12(tx),
    .i13(tx),
    .i14(tx),
    .i15(tx),
    .i2(data[0]),
    .i3(data[1]),
    .i4(data[2]),
    .i5(data[3]),
    .i6(data[4]),
    .i7(data[5]),
    .i8(data[6]),
    .i9(data[7]),
    .sel(cnt),
    .o(n13));  // sources/rtl/uart/uart_tx.v(107)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n9),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(data));  // sources/rtl/uart/uart_tx.v(81)
  reg_ar_as_w4 reg1 (
    .clk(clk),
    .d(n12),
    .reset(4'b0000),
    .set(4'b0000),
    .q(cnt));  // sources/rtl/uart/uart_tx.v(90)
  reg_ar_as_w32 reg2 (
    .clk(clk),
    .d(n3),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(clk_cnt));  // sources/rtl/uart/uart_tx.v(59)
  AL_DFF start_reg (
    .clk(clk),
    .d(n6),
    .reset(1'b0),
    .set(1'b0),
    .q(start));  // sources/rtl/uart/uart_tx.v(74)
  AL_DFF tx_ready_reg (
    .clk(clk),
    .d(n14),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_ready));  // sources/rtl/uart/uart_tx.v(117)
  AL_DFF tx_reg (
    .clk(clk),
    .d(n13),
    .reset(1'b0),
    .set(1'b0),
    .q(tx));  // sources/rtl/uart/uart_tx.v(108)
  AL_MUX u2 (
    .i0(start),
    .i1(1'b0),
    .sel(n4),
    .o(n5));  // sources/rtl/uart/uart_tx.v(73)
  AL_MUX u3 (
    .i0(n5),
    .i1(1'b1),
    .sel(tx_en),
    .o(n6));  // sources/rtl/uart/uart_tx.v(73)
  not u4 (n7, start);  // sources/rtl/uart/uart_tx.v(79)
  and u5 (n8, tx_en, n7);  // sources/rtl/uart/uart_tx.v(79)
  AL_MUX u6 (
    .i0(n7),
    .i1(1'b0),
    .sel(tx_en),
    .o(n14));  // sources/rtl/uart/uart_tx.v(116)

endmodule 

module ubus  // sources/rtl/uart/ubus.v(22)
  (
  clk,
  rx_data,
  rx_en,
  send_cmd,
  send_data,
  send_en,
  tx_ready,
  recv_cmd,
  recv_data,
  recv_en,
  send_ready,
  tx_data,
  tx_en
  );

  input clk;  // sources/rtl/uart/ubus.v(24)
  input [7:0] rx_data;  // sources/rtl/uart/ubus.v(28)
  input rx_en;  // sources/rtl/uart/ubus.v(27)
  input [7:0] send_cmd;  // sources/rtl/uart/ubus.v(42)
  input [7:0] send_data;  // sources/rtl/uart/ubus.v(43)
  input send_en;  // sources/rtl/uart/ubus.v(41)
  input tx_ready;  // sources/rtl/uart/ubus.v(33)
  output [7:0] recv_cmd;  // sources/rtl/uart/ubus.v(37)
  output [7:0] recv_data;  // sources/rtl/uart/ubus.v(38)
  output recv_en;  // sources/rtl/uart/ubus.v(36)
  output send_ready;  // sources/rtl/uart/ubus.v(44)
  output [7:0] tx_data;  // sources/rtl/uart/ubus.v(32)
  output tx_en;  // sources/rtl/uart/ubus.v(31)

  // localparam HEAD_0 = "A";
  // localparam HEAD_1 = "B";
  // localparam HEAD_2 = "C";
  // localparam HEAD_3 = "D";
  // localparam HEAD_4 = "E";
  // localparam HEAD_5 = "F";
  wire [7:0] n2;
  wire [7:0] n27;
  wire [7:0] n28;
  wire [15:0] n29;
  wire [7:0] n3;
  wire [2:0] n39;
  wire [7:0] n4;
  wire [2:0] n40;
  wire [3:0] n45;
  wire [3:0] n46;
  wire [3:0] n47;
  wire [7:0] n5;
  wire [7:0] n57;
  wire [7:0] n6;
  wire [7:0] n7;
  wire [7:0] n8;
  wire [7:0] n9;
  wire [3:0] send_cnt;  // sources/rtl/uart/ubus.v(74)
  wire [7:0] shift_reg0;  // sources/rtl/uart/ubus.v(57)
  wire [7:0] shift_reg1;  // sources/rtl/uart/ubus.v(58)
  wire [7:0] shift_reg2;  // sources/rtl/uart/ubus.v(59)
  wire [7:0] shift_reg3;  // sources/rtl/uart/ubus.v(60)
  wire [7:0] shift_reg4;  // sources/rtl/uart/ubus.v(61)
  wire [7:0] shift_reg5;  // sources/rtl/uart/ubus.v(62)
  wire [7:0] shift_reg6;  // sources/rtl/uart/ubus.v(63)
  wire [7:0] shift_reg7;  // sources/rtl/uart/ubus.v(64)
  wire [15:0] tx_buffer;  // sources/rtl/uart/ubus.v(76)
  wire [2:0] tx_ready_cnt;  // sources/rtl/uart/ubus.v(77)
  wire frame_head_flag;  // sources/rtl/uart/ubus.v(71)
  wire frame_head_flag0;  // sources/rtl/uart/ubus.v(65)
  wire frame_head_flag1;  // sources/rtl/uart/ubus.v(66)
  wire frame_head_flag2;  // sources/rtl/uart/ubus.v(67)
  wire frame_head_flag3;  // sources/rtl/uart/ubus.v(68)
  wire frame_head_flag4;  // sources/rtl/uart/ubus.v(69)
  wire frame_head_flag5;  // sources/rtl/uart/ubus.v(70)
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
  wire n20;
  wire n21;
  wire n22;
  wire n23;
  wire n24;
  wire n25;
  wire n26;
  wire n30;
  wire n31;
  wire n32;
  wire n33;
  wire n34;
  wire n35;
  wire n36;
  wire n37;
  wire n38;
  wire n41;
  wire n42;
  wire n43;
  wire n44;
  wire n48;
  wire n49;
  wire n50;
  wire n51;
  wire n52;
  wire n53;
  wire n54;
  wire n55;
  wire n56;
  wire n58;
  wire n59;
  wire n60;
  wire rx_en_d;  // sources/rtl/uart/ubus.v(56)
  wire send_finish;  // sources/rtl/uart/ubus.v(73)
  wire send_flag;  // sources/rtl/uart/ubus.v(75)
  wire send_start;  // sources/rtl/uart/ubus.v(72)
  wire tx_ready_flag;  // sources/rtl/uart/ubus.v(78)

  add_pu3_pu3_o3 add0 (
    .i0(tx_ready_cnt),
    .i1(3'b001),
    .o(n39));  // sources/rtl/uart/ubus.v(167)
  add_pu4_pu4_o4 add1 (
    .i0(send_cnt),
    .i1(4'b0001),
    .o(n45));  // sources/rtl/uart/ubus.v(191)
  eq_w8 eq0 (
    .i0(shift_reg2),
    .i1(8'b01000110),
    .o(n10));  // sources/rtl/uart/ubus.v(112)
  eq_w8 eq1 (
    .i0(shift_reg3),
    .i1(8'b01000101),
    .o(n12));  // sources/rtl/uart/ubus.v(113)
  eq_w4 eq10 (
    .i0(send_cnt),
    .i1(4'b0100),
    .o(n51));  // sources/rtl/uart/ubus.v(201)
  eq_w4 eq11 (
    .i0(send_cnt),
    .i1(4'b0101),
    .o(n52));  // sources/rtl/uart/ubus.v(202)
  eq_w4 eq12 (
    .i0(send_cnt),
    .i1(4'b0110),
    .o(n53));  // sources/rtl/uart/ubus.v(203)
  eq_w4 eq13 (
    .i0(send_cnt),
    .i1(4'b0111),
    .o(n54));  // sources/rtl/uart/ubus.v(204)
  eq_w8 eq2 (
    .i0(shift_reg4),
    .i1(8'b01000100),
    .o(n14));  // sources/rtl/uart/ubus.v(114)
  eq_w8 eq3 (
    .i0(shift_reg5),
    .i1(8'b01000011),
    .o(n16));  // sources/rtl/uart/ubus.v(115)
  eq_w8 eq4 (
    .i0(shift_reg6),
    .i1(8'b01000010),
    .o(n18));  // sources/rtl/uart/ubus.v(116)
  eq_w8 eq5 (
    .i0(shift_reg7),
    .i1(8'b01000001),
    .o(n20));  // sources/rtl/uart/ubus.v(117)
  eq_w4 eq6 (
    .i0(send_cnt),
    .i1(4'b1000),
    .o(n34));  // sources/rtl/uart/ubus.v(159)
  eq_w4 eq7 (
    .i0(send_cnt),
    .i1(4'b0001),
    .o(n48));  // sources/rtl/uart/ubus.v(198)
  eq_w4 eq8 (
    .i0(send_cnt),
    .i1(4'b0010),
    .o(n49));  // sources/rtl/uart/ubus.v(199)
  eq_w4 eq9 (
    .i0(send_cnt),
    .i1(4'b0011),
    .o(n50));  // sources/rtl/uart/ubus.v(200)
  AL_DFF frame_head_flag0_reg (
    .clk(clk),
    .d(n11),
    .reset(1'b0),
    .set(1'b0),
    .q(frame_head_flag0));  // sources/rtl/uart/ubus.v(118)
  AL_DFF frame_head_flag1_reg (
    .clk(clk),
    .d(n13),
    .reset(1'b0),
    .set(1'b0),
    .q(frame_head_flag1));  // sources/rtl/uart/ubus.v(118)
  AL_DFF frame_head_flag2_reg (
    .clk(clk),
    .d(n15),
    .reset(1'b0),
    .set(1'b0),
    .q(frame_head_flag2));  // sources/rtl/uart/ubus.v(118)
  AL_DFF frame_head_flag3_reg (
    .clk(clk),
    .d(n17),
    .reset(1'b0),
    .set(1'b0),
    .q(frame_head_flag3));  // sources/rtl/uart/ubus.v(118)
  AL_DFF frame_head_flag4_reg (
    .clk(clk),
    .d(n19),
    .reset(1'b0),
    .set(1'b0),
    .q(frame_head_flag4));  // sources/rtl/uart/ubus.v(118)
  AL_DFF frame_head_flag5_reg (
    .clk(clk),
    .d(n21),
    .reset(1'b0),
    .set(1'b0),
    .q(frame_head_flag5));  // sources/rtl/uart/ubus.v(118)
  AL_DFF frame_head_flag_reg (
    .clk(clk),
    .d(n26),
    .reset(1'b0),
    .set(1'b0),
    .q(frame_head_flag));  // sources/rtl/uart/ubus.v(124)
  binary_mux_s1_w8 mux0 (
    .i0(shift_reg0),
    .i1(rx_data),
    .sel(rx_en),
    .o(n2));  // sources/rtl/uart/ubus.v(100)
  binary_mux_s1_w8 mux1 (
    .i0(shift_reg1),
    .i1(shift_reg0),
    .sel(rx_en),
    .o(n3));  // sources/rtl/uart/ubus.v(100)
  binary_mux_s1_w16 mux10 (
    .i0(tx_buffer),
    .i1({send_cmd,send_data}),
    .sel(send_en),
    .o(n29));  // sources/rtl/uart/ubus.v(142)
  binary_mux_s1_w3 mux11 (
    .i0(3'b000),
    .i1(n39),
    .sel(tx_ready),
    .o(n40));  // sources/rtl/uart/ubus.v(169)
  binary_mux_s1_w4 mux12 (
    .i0(send_cnt),
    .i1(n45),
    .sel(n42),
    .o(n46));  // sources/rtl/uart/ubus.v(191)
  binary_mux_s1_w4 mux13 (
    .i0(n46),
    .i1(4'b0000),
    .sel(send_finish),
    .o(n47));  // sources/rtl/uart/ubus.v(191)
  binary_mux_s1_w8 mux2 (
    .i0(shift_reg2),
    .i1(shift_reg1),
    .sel(rx_en),
    .o(n4));  // sources/rtl/uart/ubus.v(100)
  binary_mux_s1_w8 mux3 (
    .i0(shift_reg3),
    .i1(shift_reg2),
    .sel(rx_en),
    .o(n5));  // sources/rtl/uart/ubus.v(100)
  binary_mux_s1_w8 mux4 (
    .i0(shift_reg4),
    .i1(shift_reg3),
    .sel(rx_en),
    .o(n6));  // sources/rtl/uart/ubus.v(100)
  binary_mux_s1_w8 mux5 (
    .i0(shift_reg5),
    .i1(shift_reg4),
    .sel(rx_en),
    .o(n7));  // sources/rtl/uart/ubus.v(100)
  binary_mux_s1_w8 mux6 (
    .i0(shift_reg6),
    .i1(shift_reg5),
    .sel(rx_en),
    .o(n8));  // sources/rtl/uart/ubus.v(100)
  binary_mux_s1_w8 mux7 (
    .i0(shift_reg7),
    .i1(shift_reg6),
    .sel(rx_en),
    .o(n9));  // sources/rtl/uart/ubus.v(100)
  binary_mux_s1_w8 mux8 (
    .i0(recv_cmd),
    .i1(shift_reg1),
    .sel(frame_head_flag),
    .o(n27));  // sources/rtl/uart/ubus.v(134)
  binary_mux_s1_w8 mux9 (
    .i0(recv_data),
    .i1(shift_reg0),
    .sel(frame_head_flag),
    .o(n28));  // sources/rtl/uart/ubus.v(134)
  AL_DFF recv_en_reg (
    .clk(clk),
    .d(frame_head_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_en));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n3),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(shift_reg1));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w8 reg1 (
    .clk(clk),
    .d(n4),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(shift_reg2));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w3 reg10 (
    .clk(clk),
    .d(n40),
    .reset(3'b000),
    .set(3'b000),
    .q(tx_ready_cnt));  // sources/rtl/uart/ubus.v(170)
  reg_ar_as_w4 reg11 (
    .clk(clk),
    .d(n47),
    .reset(4'b0000),
    .set(4'b0000),
    .q(send_cnt));  // sources/rtl/uart/ubus.v(192)
  reg_ar_as_w8 reg12 (
    .clk(clk),
    .d(n57),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(tx_data));  // sources/rtl/uart/ubus.v(207)
  reg_ar_as_w8 reg13 (
    .clk(clk),
    .d(n2),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(shift_reg0));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n5),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(shift_reg3));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n6),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(shift_reg4));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w8 reg4 (
    .clk(clk),
    .d(n7),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(shift_reg5));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w8 reg5 (
    .clk(clk),
    .d(n8),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(shift_reg6));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w8 reg6 (
    .clk(clk),
    .d(n9),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(shift_reg7));  // sources/rtl/uart/ubus.v(101)
  reg_ar_as_w8 reg7 (
    .clk(clk),
    .d(n27),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(recv_cmd));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w8 reg8 (
    .clk(clk),
    .d(n28),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(recv_data));  // sources/rtl/uart/ubus.v(135)
  reg_ar_as_w16 reg9 (
    .clk(clk),
    .d(n29),
    .reset(16'b0000000000000000),
    .set(16'b0000000000000000),
    .q(tx_buffer));  // sources/rtl/uart/ubus.v(143)
  AL_DFF rx_en_d_reg (
    .clk(clk),
    .d(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_en_d));  // sources/rtl/uart/ubus.v(107)
  onehot_mux_s9_w8 sel0 (
    .i0(tx_data),
    .i1(tx_buffer[7:0]),
    .i2(tx_buffer[15:8]),
    .i3(8'b01000110),
    .i4(8'b01000101),
    .i5(8'b01000100),
    .i6(8'b01000011),
    .i7(8'b01000010),
    .i8(8'b01000001),
    .sel({n48,n49,n50,n51,n52,n53,n54,n34,n56}),
    .o(n57));  // sources/rtl/uart/ubus.v(206)
  AL_DFF send_finish_reg (
    .clk(clk),
    .d(n37),
    .reset(1'b0),
    .set(1'b0),
    .q(send_finish));  // sources/rtl/uart/ubus.v(161)
  AL_DFF send_flag_reg (
    .clk(clk),
    .d(n42),
    .reset(1'b0),
    .set(1'b0),
    .q(send_flag));  // sources/rtl/uart/ubus.v(183)
  AL_DFF send_ready_reg (
    .clk(clk),
    .d(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(send_ready));  // sources/rtl/uart/ubus.v(216)
  AL_DFF send_start_reg (
    .clk(clk),
    .d(n33),
    .reset(1'b0),
    .set(1'b0),
    .q(send_start));  // sources/rtl/uart/ubus.v(152)
  AL_DFF tx_en_reg (
    .clk(clk),
    .d(send_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_en));  // sources/rtl/uart/ubus.v(183)
  AL_DFF tx_ready_flag_reg (
    .clk(clk),
    .d(n41),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_ready_flag));  // sources/rtl/uart/ubus.v(176)
  and u10 (n22, frame_head_flag0, frame_head_flag1);  // sources/rtl/uart/ubus.v(123)
  and u11 (n23, n22, frame_head_flag2);  // sources/rtl/uart/ubus.v(123)
  and u12 (n24, n23, frame_head_flag3);  // sources/rtl/uart/ubus.v(123)
  and u13 (n25, n24, frame_head_flag4);  // sources/rtl/uart/ubus.v(123)
  and u14 (n26, n25, frame_head_flag5);  // sources/rtl/uart/ubus.v(123)
  AL_MUX u15 (
    .i0(send_start),
    .i1(1'b0),
    .sel(send_finish),
    .o(n32));  // sources/rtl/uart/ubus.v(151)
  AL_MUX u16 (
    .i0(n32),
    .i1(1'b1),
    .sel(send_en),
    .o(n33));  // sources/rtl/uart/ubus.v(151)
  and u17 (n35, tx_en, n34);  // sources/rtl/uart/ubus.v(159)
  AL_MUX u18 (
    .i0(send_finish),
    .i1(1'b1),
    .sel(n35),
    .o(n36));  // sources/rtl/uart/ubus.v(160)
  AL_MUX u19 (
    .i0(n36),
    .i1(1'b0),
    .sel(send_en),
    .o(n37));  // sources/rtl/uart/ubus.v(160)
  or u2 (n38, n51, n50);  // sources/rtl/uart/ubus.v(206)
  and u20 (n42, send_start, tx_ready_flag);  // sources/rtl/uart/ubus.v(181)
  or u21 (n43, n53, n52);  // sources/rtl/uart/ubus.v(206)
  or u22 (n55, n34, n54);  // sources/rtl/uart/ubus.v(206)
  and u23 (n30, tx_ready_cnt[1], tx_ready_cnt[2]);  // sources/rtl/uart/ubus.v(175)
  and u24 (n58, tx_ready_flag, send_finish);  // sources/rtl/uart/ubus.v(214)
  AL_MUX u25 (
    .i0(send_ready),
    .i1(1'b1),
    .sel(n58),
    .o(n59));  // sources/rtl/uart/ubus.v(215)
  AL_MUX u26 (
    .i0(n59),
    .i1(1'b0),
    .sel(send_en),
    .o(n60));  // sources/rtl/uart/ubus.v(215)
  or u27 (n1, n49, n48);  // sources/rtl/uart/ubus.v(206)
  or u28 (n0, n38, n1);  // sources/rtl/uart/ubus.v(206)
  or u29 (n31, n44, n0);  // sources/rtl/uart/ubus.v(206)
  or u3 (n44, n55, n43);  // sources/rtl/uart/ubus.v(206)
  not u30 (n56, n31);  // sources/rtl/uart/ubus.v(206)
  and u31 (n41, tx_ready_cnt[0], n30);  // sources/rtl/uart/ubus.v(175)
  and u4 (n11, rx_en_d, n10);  // sources/rtl/uart/ubus.v(112)
  and u5 (n13, rx_en_d, n12);  // sources/rtl/uart/ubus.v(113)
  and u6 (n15, rx_en_d, n14);  // sources/rtl/uart/ubus.v(114)
  and u7 (n17, rx_en_d, n16);  // sources/rtl/uart/ubus.v(115)
  and u8 (n19, rx_en_d, n18);  // sources/rtl/uart/ubus.v(116)
  and u9 (n21, rx_en_d, n20);  // sources/rtl/uart/ubus.v(117)

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

module lt_u13_u13
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
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

module add_pu14_mu14_o14
  (
  i0,
  i1,
  o
  );

  input [13:0] i0;
  input [13:0] i1;
  output [13:0] o;



endmodule 

module add_pu10_pu10_o10
  (
  i0,
  i1,
  o
  );

  input [9:0] i0;
  input [9:0] i1;
  output [9:0] o;



endmodule 

module eq_w11
  (
  i0,
  i1,
  o
  );

  input [10:0] i0;
  input [10:0] i1;
  output o;



endmodule 

module eq_w5
  (
  i0,
  i1,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  output o;



endmodule 

module lt_u11_u11
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [10:0] i0;
  input [10:0] i1;
  output o;



endmodule 

module mult_u5_u5_o10
  (
  i0,
  i1,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  output [9:0] o;



endmodule 

module binary_mux_s1_w23
  (
  i0,
  i1,
  sel,
  o
  );

  input [22:0] i0;
  input [22:0] i1;
  input sel;
  output [22:0] o;



endmodule 

module binary_mux_s1_w24
  (
  i0,
  i1,
  sel,
  o
  );

  input [23:0] i0;
  input [23:0] i1;
  input sel;
  output [23:0] o;



endmodule 

module ram_w8x1_r8x1_r8x1
  (
  clk1,
  ra1,
  ra2,
  re1,
  re2,
  wa1,
  wd1,
  we1,
  rd1,
  rd2
  );

  input clk1;
  input [7:0] ra1;
  input [7:0] ra2;
  input re1;
  input re2;
  input [7:0] wa1;
  input wd1;
  input we1;
  output rd1;
  output rd2;



endmodule 

module reg_ar_as_w5
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [4:0] d;
  input en;
  input [4:0] reset;
  input [4:0] set;
  output [4:0] q;



endmodule 

module reg_ar_as_w24
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [23:0] d;
  input en;
  input [23:0] reset;
  input [23:0] set;
  output [23:0] q;



endmodule 

module add_pu6_mu6_o6
  (
  i0,
  i1,
  o
  );

  input [5:0] i0;
  input [5:0] i1;
  output [5:0] o;



endmodule 

module add_pu8_pu8_o9
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output [8:0] o;



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



endmodule 

module mult_u8_u8_o16
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output [15:0] o;



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

module add_pu9_mu9_o9
  (
  i0,
  i1,
  o
  );

  input [8:0] i0;
  input [8:0] i1;
  output [8:0] o;



endmodule 

module add_pu24_pu24_o24
  (
  i0,
  i1,
  o
  );

  input [23:0] i0;
  input [23:0] i1;
  output [23:0] o;



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

module reg_ar_as_w10
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [9:0] d;
  input en;
  input [9:0] reset;
  input [9:0] set;
  output [9:0] q;



endmodule 

module eq_w24
  (
  i0,
  i1,
  o
  );

  input [23:0] i0;
  input [23:0] i1;
  output o;



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

module add_pu25_mu25_o25
  (
  i0,
  i1,
  o
  );

  input [24:0] i0;
  input [24:0] i1;
  output [24:0] o;



endmodule 

module add_pu32_pu32_o32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output [31:0] o;



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

module eq_w32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
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

