// Verilog netlist created by TD v4.6.12906
// Fri Aug  9 20:06:10 2019

`timescale 1ns / 1ps
module top  // src/rtl/top.v(1)
  (
  flash_sdi,
  key,
  rxd,
  sclk,
  flash_cs,
  flash_sck,
  flash_sdo,
  led,
  tube,
  tube_sel,
  txd
  );

  input flash_sdi;  // src/rtl/top.v(15)
  input key;  // src/rtl/top.v(5)
  input rxd;  // src/rtl/top.v(8)
  input sclk;  // src/rtl/top.v(3)
  output flash_cs;  // src/rtl/top.v(13)
  output flash_sck;  // src/rtl/top.v(12)
  output flash_sdo;  // src/rtl/top.v(14)
  output [15:0] led;  // src/rtl/top.v(22)
  output [7:0] tube;  // src/rtl/top.v(18)
  output [3:0] tube_sel;  // src/rtl/top.v(19)
  output txd;  // src/rtl/top.v(9)

  wire [23:0] fls_addr;  // src/rtl/top.v(38)
  wire [7:0] fls_read;  // src/rtl/top.v(40)
  wire [7:0] fls_write;  // src/rtl/top.v(39)
  wire [15:0] id;  // src/rtl/top.v(44)
  wire [2:0] mod_sel;  // src/rtl/top.v(37)
  wire [3:0] sm_bit1_num;  // src/rtl/top.v(47)
  wire [3:0] sm_bit2_num;  // src/rtl/top.v(48)
  wire [3:0] sm_bit3_num;  // src/rtl/top.v(49)
  wire [3:0] sm_bit4_num;  // src/rtl/top.v(50)
  wire busy;  // src/rtl/top.v(45)
  wire start;  // src/rtl/top.v(36)

  flash_dri u_flash_dri (
    .clk(sclk),
    .fls_addr(fls_addr),
    .fls_sdi(flash_sdi),
    .fls_write(fls_write),
    .mod_sel(mod_sel),
    .start(start),
    .busy(busy),
    .fls_ncs(flash_cs),
    .fls_read(fls_read),
    .fls_sck(flash_sck),
    .fls_sdo(flash_sdo),
    .id(id));  // src/rtl/top.v(84)
  tube_dri u_tube_dri (
    .clk_24m(sclk),
    .sm_bit1_num(sm_bit1_num),
    .sm_bit2_num(sm_bit2_num),
    .sm_bit3_num(sm_bit3_num),
    .sm_bit4_num(sm_bit4_num),
    .sm_bit(tube_sel),
    .sm_seg(tube));  // src/rtl/top.v(114)
  \uart(CLK_RATE=24000000)  u_uart (
    .busy(busy),
    .clk(sclk),
    .fls_read(fls_read),
    .id(id),
    .rx(rxd),
    .fls_addr(fls_addr),
    .fls_write(fls_write),
    .led(led),
    .mod_sel(mod_sel),
    .sm_bit1(sm_bit1_num),
    .sm_bit2(sm_bit2_num),
    .sm_bit3(sm_bit3_num),
    .sm_bit4(sm_bit4_num),
    .start(start),
    .tx(txd));  // src/rtl/top.v(57)

endmodule 

module flash_dri  // src/rtl/flash/flash_dri.v(22)
  (
  clk,
  fls_addr,
  fls_sdi,
  fls_write,
  mod_sel,
  start,
  busy,
  fls_ncs,
  fls_read,
  fls_sck,
  fls_sdo,
  frd_addr,
  frd_data,
  frd_en,
  id
  );

  input clk;  // src/rtl/flash/flash_dri.v(24)
  input [23:0] fls_addr;  // src/rtl/flash/flash_dri.v(37)
  input fls_sdi;  // src/rtl/flash/flash_dri.v(30)
  input [7:0] fls_write;  // src/rtl/flash/flash_dri.v(38)
  input [2:0] mod_sel;  // src/rtl/flash/flash_dri.v(34)
  input start;  // src/rtl/flash/flash_dri.v(33)
  output busy;  // src/rtl/flash/flash_dri.v(48)
  output fls_ncs;  // src/rtl/flash/flash_dri.v(28)
  output [7:0] fls_read;  // src/rtl/flash/flash_dri.v(39)
  output fls_sck;  // src/rtl/flash/flash_dri.v(27)
  output fls_sdo;  // src/rtl/flash/flash_dri.v(29)
  output [23:0] frd_addr;  // src/rtl/flash/flash_dri.v(43)
  output [7:0] frd_data;  // src/rtl/flash/flash_dri.v(44)
  output frd_en;  // src/rtl/flash/flash_dri.v(42)
  output [15:0] id;  // src/rtl/flash/flash_dri.v(47)

  wire busy_erase;  // src/rtl/flash/flash_dri.v(104)
  wire busy_frd;  // src/rtl/flash/flash_dri.v(108)
  wire busy_id;  // src/rtl/flash/flash_dri.v(109)
  wire busy_rd;  // src/rtl/flash/flash_dri.v(107)
  wire busy_sector;  // src/rtl/flash/flash_dri.v(105)
  wire busy_wen;  // src/rtl/flash/flash_dri.v(102)
  wire busy_wfree;  // src/rtl/flash/flash_dri.v(103)
  wire busy_wr;  // src/rtl/flash/flash_dri.v(106)
  wire fls_ncs_erase;  // src/rtl/flash/flash_dri.v(64)
  wire fls_ncs_frd;  // src/rtl/flash/flash_dri.v(68)
  wire fls_ncs_id;  // src/rtl/flash/flash_dri.v(69)
  wire fls_ncs_rd;  // src/rtl/flash/flash_dri.v(67)
  wire fls_ncs_sector;  // src/rtl/flash/flash_dri.v(65)
  wire fls_ncs_wen;  // src/rtl/flash/flash_dri.v(62)
  wire fls_ncs_wfree;  // src/rtl/flash/flash_dri.v(63)
  wire fls_ncs_wr;  // src/rtl/flash/flash_dri.v(66)
  wire fls_sck_erase;  // src/rtl/flash/flash_dri.v(54)
  wire fls_sck_frd;  // src/rtl/flash/flash_dri.v(58)
  wire fls_sck_id;  // src/rtl/flash/flash_dri.v(59)
  wire fls_sck_rd;  // src/rtl/flash/flash_dri.v(57)
  wire fls_sck_sector;  // src/rtl/flash/flash_dri.v(55)
  wire fls_sck_wen;  // src/rtl/flash/flash_dri.v(52)
  wire fls_sck_wfree;  // src/rtl/flash/flash_dri.v(53)
  wire fls_sck_wr;  // src/rtl/flash/flash_dri.v(56)
  wire fls_sdi_erase;  // src/rtl/flash/flash_dri.v(84)
  wire fls_sdi_frd;  // src/rtl/flash/flash_dri.v(88)
  wire fls_sdi_id;  // src/rtl/flash/flash_dri.v(89)
  wire fls_sdi_rd;  // src/rtl/flash/flash_dri.v(87)
  wire fls_sdi_sector;  // src/rtl/flash/flash_dri.v(85)
  wire fls_sdi_wen;  // src/rtl/flash/flash_dri.v(82)
  wire fls_sdi_wfree;  // src/rtl/flash/flash_dri.v(83)
  wire fls_sdi_wr;  // src/rtl/flash/flash_dri.v(86)
  wire fls_sdo_erase;  // src/rtl/flash/flash_dri.v(74)
  wire fls_sdo_frd;  // src/rtl/flash/flash_dri.v(78)
  wire fls_sdo_id;  // src/rtl/flash/flash_dri.v(79)
  wire fls_sdo_rd;  // src/rtl/flash/flash_dri.v(77)
  wire fls_sdo_sector;  // src/rtl/flash/flash_dri.v(75)
  wire fls_sdo_wen;  // src/rtl/flash/flash_dri.v(72)
  wire fls_sdo_wfree;  // src/rtl/flash/flash_dri.v(73)
  wire fls_sdo_wr;  // src/rtl/flash/flash_dri.v(76)
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
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;
  wire start_erase;  // src/rtl/flash/flash_dri.v(94)
  wire start_frd;  // src/rtl/flash/flash_dri.v(98)
  wire start_id;  // src/rtl/flash/flash_dri.v(99)
  wire start_rd;  // src/rtl/flash/flash_dri.v(97)
  wire start_sector;  // src/rtl/flash/flash_dri.v(95)
  wire start_wen;  // src/rtl/flash/flash_dri.v(92)
  wire start_wfree;  // src/rtl/flash/flash_dri.v(93)
  wire start_wr;  // src/rtl/flash/flash_dri.v(96)

  AL_DFF busy_reg (
    .clk(clk),
    .d(n33),
    .reset(1'b0),
    .set(1'b0),
    .q(busy));  // src/rtl/flash/flash_dri.v(332)
  eq_w3 eq0 (
    .i0(mod_sel),
    .i1(3'b000),
    .o(n0));  // src/rtl/flash/flash_dri.v(260)
  eq_w3 eq1 (
    .i0(mod_sel),
    .i1(3'b001),
    .o(n2));  // src/rtl/flash/flash_dri.v(261)
  eq_w3 eq2 (
    .i0(mod_sel),
    .i1(3'b010),
    .o(n4));  // src/rtl/flash/flash_dri.v(262)
  eq_w3 eq3 (
    .i0(mod_sel),
    .i1(3'b011),
    .o(n6));  // src/rtl/flash/flash_dri.v(263)
  eq_w3 eq4 (
    .i0(mod_sel),
    .i1(3'b100),
    .o(n8));  // src/rtl/flash/flash_dri.v(264)
  eq_w3 eq5 (
    .i0(mod_sel),
    .i1(3'b101),
    .o(n10));  // src/rtl/flash/flash_dri.v(265)
  eq_w3 eq6 (
    .i0(mod_sel),
    .i1(3'b110),
    .o(n12));  // src/rtl/flash/flash_dri.v(266)
  eq_w3 eq7 (
    .i0(mod_sel),
    .i1(3'b111),
    .o(n14));  // src/rtl/flash/flash_dri.v(267)
  AL_DFF fls_ncs_reg (
    .clk(clk),
    .d(n25),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs));  // src/rtl/flash/flash_dri.v(311)
  AL_DFF fls_sck_reg (
    .clk(clk),
    .d(n24),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck));  // src/rtl/flash/flash_dri.v(296)
  AL_DFF fls_sdi_erase_reg (
    .clk(clk),
    .d(n18),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_erase));  // src/rtl/flash/flash_dri.v(281)
  AL_DFF fls_sdi_frd_reg (
    .clk(clk),
    .d(n21),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_frd));  // src/rtl/flash/flash_dri.v(281)
  AL_DFF fls_sdi_id_reg (
    .clk(clk),
    .d(n22),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_id));  // src/rtl/flash/flash_dri.v(281)
  AL_DFF fls_sdi_rd_reg (
    .clk(clk),
    .d(n20),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_rd));  // src/rtl/flash/flash_dri.v(281)
  AL_DFF fls_sdi_sector_reg (
    .clk(clk),
    .d(n23),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_sector));  // src/rtl/flash/flash_dri.v(281)
  AL_DFF fls_sdi_wen_reg (
    .clk(clk),
    .d(n17),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_wen));  // src/rtl/flash/flash_dri.v(281)
  AL_DFF fls_sdi_wfree_reg (
    .clk(clk),
    .d(n16),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_wfree));  // src/rtl/flash/flash_dri.v(281)
  AL_DFF fls_sdi_wr_reg (
    .clk(clk),
    .d(n19),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_wr));  // src/rtl/flash/flash_dri.v(281)
  AL_DFF fls_sdo_reg (
    .clk(clk),
    .d(n26),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo));  // src/rtl/flash/flash_dri.v(326)
  binary_mux_s3_w1 mux0 (
    .i0(fls_sck_wfree),
    .i1(fls_sck_wen),
    .i2(fls_sck_erase),
    .i3(fls_sck_wr),
    .i4(fls_sck_rd),
    .i5(fls_sck_frd),
    .i6(fls_sck_id),
    .i7(fls_sck_sector),
    .sel(mod_sel),
    .o(n24));  // src/rtl/flash/flash_dri.v(295)
  binary_mux_s3_w1 mux1 (
    .i0(fls_ncs_wfree),
    .i1(fls_ncs_wen),
    .i2(fls_ncs_erase),
    .i3(fls_ncs_wr),
    .i4(fls_ncs_rd),
    .i5(fls_ncs_frd),
    .i6(fls_ncs_id),
    .i7(fls_ncs_sector),
    .sel(mod_sel),
    .o(n25));  // src/rtl/flash/flash_dri.v(310)
  binary_mux_s3_w1 mux2 (
    .i0(fls_sdo_wfree),
    .i1(fls_sdo_wen),
    .i2(fls_sdo_erase),
    .i3(fls_sdo_wr),
    .i4(fls_sdo_rd),
    .i5(fls_sdo_frd),
    .i6(fls_sdo_id),
    .i7(fls_sdo_sector),
    .sel(mod_sel),
    .o(n26));  // src/rtl/flash/flash_dri.v(325)
  AL_DFF start_erase_reg (
    .clk(clk),
    .d(n5),
    .reset(1'b0),
    .set(1'b0),
    .q(start_erase));  // src/rtl/flash/flash_dri.v(268)
  AL_DFF start_frd_reg (
    .clk(clk),
    .d(n11),
    .reset(1'b0),
    .set(1'b0),
    .q(start_frd));  // src/rtl/flash/flash_dri.v(268)
  AL_DFF start_id_reg (
    .clk(clk),
    .d(n13),
    .reset(1'b0),
    .set(1'b0),
    .q(start_id));  // src/rtl/flash/flash_dri.v(268)
  AL_DFF start_rd_reg (
    .clk(clk),
    .d(n9),
    .reset(1'b0),
    .set(1'b0),
    .q(start_rd));  // src/rtl/flash/flash_dri.v(268)
  AL_DFF start_sector_reg (
    .clk(clk),
    .d(n15),
    .reset(1'b0),
    .set(1'b0),
    .q(start_sector));  // src/rtl/flash/flash_dri.v(268)
  AL_DFF start_wen_reg (
    .clk(clk),
    .d(n3),
    .reset(1'b0),
    .set(1'b0),
    .q(start_wen));  // src/rtl/flash/flash_dri.v(268)
  AL_DFF start_wfree_reg (
    .clk(clk),
    .d(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_wfree));  // src/rtl/flash/flash_dri.v(268)
  AL_DFF start_wr_reg (
    .clk(clk),
    .d(n7),
    .reset(1'b0),
    .set(1'b0),
    .q(start_wr));  // src/rtl/flash/flash_dri.v(268)
  and u10 (n16, fls_sdi, n0);  // src/rtl/flash/flash_dri.v(273)
  and u11 (n17, fls_sdi, n2);  // src/rtl/flash/flash_dri.v(274)
  and u12 (n18, fls_sdi, n4);  // src/rtl/flash/flash_dri.v(275)
  and u13 (n19, fls_sdi, n6);  // src/rtl/flash/flash_dri.v(276)
  and u14 (n20, fls_sdi, n8);  // src/rtl/flash/flash_dri.v(277)
  and u15 (n21, fls_sdi, n10);  // src/rtl/flash/flash_dri.v(278)
  and u16 (n22, fls_sdi, n12);  // src/rtl/flash/flash_dri.v(279)
  and u17 (n23, fls_sdi, n14);  // src/rtl/flash/flash_dri.v(280)
  or u18 (n27, busy_wfree, busy_wen);  // src/rtl/flash/flash_dri.v(331)
  or u19 (n28, n27, busy_erase);  // src/rtl/flash/flash_dri.v(331)
  and u2 (n1, start, n0);  // src/rtl/flash/flash_dri.v(260)
  or u20 (n29, n28, busy_wr);  // src/rtl/flash/flash_dri.v(331)
  or u21 (n30, n29, busy_rd);  // src/rtl/flash/flash_dri.v(331)
  or u22 (n31, n30, busy_frd);  // src/rtl/flash/flash_dri.v(331)
  or u23 (n32, n31, busy_id);  // src/rtl/flash/flash_dri.v(331)
  or u24 (n33, n32, busy_sector);  // src/rtl/flash/flash_dri.v(331)
  and u3 (n3, start, n2);  // src/rtl/flash/flash_dri.v(261)
  and u4 (n5, start, n4);  // src/rtl/flash/flash_dri.v(262)
  and u5 (n7, start, n6);  // src/rtl/flash/flash_dri.v(263)
  and u6 (n9, start, n8);  // src/rtl/flash/flash_dri.v(264)
  and u7 (n11, start, n10);  // src/rtl/flash/flash_dri.v(265)
  and u8 (n13, start, n12);  // src/rtl/flash/flash_dri.v(266)
  and u9 (n15, start, n14);  // src/rtl/flash/flash_dri.v(267)
  flash_erase u_flash_erase (
    .clk(clk),
    .fls_sdi(fls_sdi_erase),
    .start(start_erase),
    .busy(busy_erase),
    .fls_ncs(fls_ncs_erase),
    .fls_sck(fls_sck_erase),
    .fls_sdo(fls_sdo_erase));  // src/rtl/flash/flash_dri.v(143)
  flash_fast_read u_flash_fast_read (
    .clk(clk),
    .fls_sdi(fls_sdi_frd),
    .start(start_frd),
    .addr(frd_addr),
    .busy(busy_frd),
    .dout(frd_data),
    .dout_en(frd_en),
    .fls_ncs(fls_ncs_frd),
    .fls_sck(fls_sck_frd),
    .fls_sdo(fls_sdo_frd));  // src/rtl/flash/flash_dri.v(214)
  flash_id u_flash_id (
    .clk(clk),
    .fls_sdi(fls_sdi_id),
    .start(start_id),
    .busy(busy_id),
    .fls_id(id),
    .fls_ncs(fls_ncs_id),
    .fls_sck(fls_sck_id),
    .fls_sdo(fls_sdo_id));  // src/rtl/flash/flash_dri.v(241)
  flash_read u_flash_read (
    .addr(fls_addr),
    .clk(clk),
    .fls_sdi(fls_sdi_rd),
    .start(start_rd),
    .busy(busy_rd),
    .dout(fls_read),
    .fls_ncs(fls_ncs_rd),
    .fls_sck(fls_sck_rd),
    .fls_sdo(fls_sdo_rd));  // src/rtl/flash/flash_dri.v(195)
  flash_sector_erase u_flash_sector_erase (
    .addr(fls_addr),
    .clk(clk),
    .fls_sdi(fls_sdi_sector),
    .start(start_sector),
    .busy(busy_sector),
    .fls_ncs(fls_ncs_sector),
    .fls_sck(fls_sck_sector),
    .fls_sdo(fls_sdo_sector));  // src/rtl/flash/flash_dri.v(158)
  flash_wait_free u_flash_wait_free (
    .clk(clk),
    .fls_sdi(fls_sdi_wfree),
    .start(start_wfree),
    .busy(busy_wfree),
    .fls_ncs(fls_ncs_wfree),
    .fls_sck(fls_sck_wfree),
    .fls_sdo(fls_sdo_wfree));  // src/rtl/flash/flash_dri.v(128)
  flash_write u_flash_write (
    .addr(fls_addr),
    .clk(clk),
    .din(fls_write),
    .fls_sdi(fls_sdi_wr),
    .start(start_wr),
    .busy(busy_wr),
    .fls_ncs(fls_ncs_wr),
    .fls_sck(fls_sck_wr),
    .fls_sdo(fls_sdo_wr));  // src/rtl/flash/flash_dri.v(176)
  flash_write_enable u_flash_write_enable (
    .clk(clk),
    .fls_sdi(fls_sdi_wen),
    .start(start_wen),
    .busy(busy_wen),
    .fls_ncs(fls_ncs_wen),
    .fls_sck(fls_sck_wen),
    .fls_sdo(fls_sdo_wen));  // src/rtl/flash/flash_dri.v(113)

endmodule 

module tube_dri  // src/rtl/tube/tube_dri.v(14)
  (
  clk_24m,
  sm_bit1_num,
  sm_bit2_num,
  sm_bit3_num,
  sm_bit4_num,
  sm_bit,
  sm_seg
  );

  input clk_24m;  // src/rtl/tube/tube_dri.v(19)
  input [3:0] sm_bit1_num;  // src/rtl/tube/tube_dri.v(24)
  input [3:0] sm_bit2_num;  // src/rtl/tube/tube_dri.v(25)
  input [3:0] sm_bit3_num;  // src/rtl/tube/tube_dri.v(26)
  input [3:0] sm_bit4_num;  // src/rtl/tube/tube_dri.v(27)
  output [3:0] sm_bit;  // src/rtl/tube/tube_dri.v(22)
  output [7:0] sm_seg;  // src/rtl/tube/tube_dri.v(21)

  parameter CNT_TIME = 2400000;
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
  wire [17:0] cnt_w;  // src/rtl/tube/tube_dri.v(33)
  wire [17:0] n1;
  wire [3:0] n2;
  wire [3:0] n3;
  wire [3:0] sm_bit_reg;  // src/rtl/tube/tube_dri.v(35)
  wire [3:0] sm_seg_num;  // src/rtl/tube/tube_dri.v(36)
  wire [7:0] sm_seg_reg;  // src/rtl/tube/tube_dri.v(37)
  wire n0;
  wire rst_n;  // src/rtl/tube/tube_dri.v(30)

  add_pu18_pu18_o18 add0 (
    .i0(cnt_w),
    .i1(18'b000000000000000001),
    .o(n1));  // src/rtl/tube/tube_dri.v(61)
  binary_mux_s2_w4 mux0 (
    .i0(sm_bit1_num),
    .i1(sm_bit2_num),
    .i2(sm_bit3_num),
    .i3(sm_bit4_num),
    .sel(cnt_w[17:16]),
    .o(n2));  // src/rtl/tube/tube_dri.v(75)
  binary_mux_s2_w4 mux1 (
    .i0(4'b1110),
    .i1(4'b1101),
    .i2(4'b1011),
    .i3(4'b0111),
    .sel(cnt_w[17:16]),
    .o(n3));  // src/rtl/tube/tube_dri.v(90)
  binary_mux_s4_w8 mux2 (
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
    .o(sm_seg_reg));  // src/rtl/tube/tube_dri.v(118)
  reg_ar_as_w4 reg0 (
    .clk(clk_24m),
    .d(n2),
    .reset({n0,n0,n0,n0}),
    .set(4'b0000),
    .q(sm_seg_num));  // src/rtl/tube/tube_dri.v(76)
  reg_ar_as_w18 reg1 (
    .clk(clk_24m),
    .d(n1),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(18'b000000000000000000),
    .q(cnt_w));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w4 reg2 (
    .clk(clk_24m),
    .d(n3),
    .reset(4'b0000),
    .set({n0,n0,n0,n0}),
    .q(sm_bit_reg));  // src/rtl/tube/tube_dri.v(91)
  buf u10 (sm_bit[0], sm_bit_reg[0]);  // src/rtl/tube/tube_dri.v(122)
  buf u11 (sm_seg[5], sm_seg_reg[5]);  // src/rtl/tube/tube_dri.v(121)
  buf u12 (sm_seg[0], sm_seg_reg[0]);  // src/rtl/tube/tube_dri.v(121)
  buf u13 (sm_seg[6], sm_seg_reg[6]);  // src/rtl/tube/tube_dri.v(121)
  buf u14 (sm_seg[7], sm_seg_reg[7]);  // src/rtl/tube/tube_dri.v(121)
  buf u2 (sm_seg[4], sm_seg_reg[4]);  // src/rtl/tube/tube_dri.v(121)
  buf u3 (sm_seg[3], sm_seg_reg[3]);  // src/rtl/tube/tube_dri.v(121)
  buf u4 (sm_seg[2], sm_seg_reg[2]);  // src/rtl/tube/tube_dri.v(121)
  not u5 (n0, rst_n);  // src/rtl/tube/tube_dri.v(58)
  buf u6 (sm_seg[1], sm_seg_reg[1]);  // src/rtl/tube/tube_dri.v(121)
  buf u7 (sm_bit[2], sm_bit_reg[2]);  // src/rtl/tube/tube_dri.v(122)
  buf u8 (sm_bit[1], sm_bit_reg[1]);  // src/rtl/tube/tube_dri.v(122)
  buf u9 (sm_bit[3], sm_bit_reg[3]);  // src/rtl/tube/tube_dri.v(122)
  rst_n ux_rst (
    .clk(clk_24m),
    .rst_n(rst_n));  // src/rtl/tube/tube_dri.v(50)

endmodule 

module \uart(CLK_RATE=24000000)   // src/rtl/uart/uart.v(10)
  (
  busy,
  clk,
  fls_read,
  id,
  rx,
  fls_addr,
  fls_write,
  led,
  mod_sel,
  sm_bit1,
  sm_bit2,
  sm_bit3,
  sm_bit4,
  start,
  tx
  );

  input busy;  // src/rtl/uart/uart.v(38)
  input clk;  // src/rtl/uart/uart.v(16)
  input [7:0] fls_read;  // src/rtl/uart/uart.v(36)
  input [15:0] id;  // src/rtl/uart/uart.v(37)
  input rx;  // src/rtl/uart/uart.v(19)
  output [23:0] fls_addr;  // src/rtl/uart/uart.v(34)
  output [7:0] fls_write;  // src/rtl/uart/uart.v(35)
  output [15:0] led;  // src/rtl/uart/uart.v(29)
  output [2:0] mod_sel;  // src/rtl/uart/uart.v(33)
  output [3:0] sm_bit1;  // src/rtl/uart/uart.v(23)
  output [3:0] sm_bit2;  // src/rtl/uart/uart.v(24)
  output [3:0] sm_bit3;  // src/rtl/uart/uart.v(25)
  output [3:0] sm_bit4;  // src/rtl/uart/uart.v(26)
  output start;  // src/rtl/uart/uart.v(32)
  output tx;  // src/rtl/uart/uart.v(20)

  parameter BAUDRATE = 115200;
  parameter CLK_RATE = 24000000;
  wire [7:0] rx_data;  // src/rtl/uart/uart.v(42)
  wire [7:0] tx_data;  // src/rtl/uart/uart.v(44)
  wire [31:0] ubus_raddr;  // src/rtl/uart/uart.v(50)
  wire [31:0] ubus_rdata;  // src/rtl/uart/uart.v(52)
  wire [31:0] ubus_waddr;  // src/rtl/uart/uart.v(47)
  wire [31:0] ubus_wdata;  // src/rtl/uart/uart.v(48)
  wire rx_en;  // src/rtl/uart/uart.v(41)
  wire tx_en;  // src/rtl/uart/uart.v(43)
  wire tx_ready;  // src/rtl/uart/uart.v(45)
  wire ubus_bken;  // src/rtl/uart/uart.v(51)
  wire ubus_ren;  // src/rtl/uart/uart.v(49)
  wire ubus_wen;  // src/rtl/uart/uart.v(46)

  \uart_rx(CLK_RATE=24000000)  u_uart_rx (
    .clk(clk),
    .rx(rx),
    .rx_data(rx_data),
    .rx_en(rx_en));  // src/rtl/uart/uart.v(60)
  \uart_tx(CLK_RATE=24000000)  u_uart_tx (
    .clk(clk),
    .tx_data(tx_data),
    .tx_en(tx_en),
    .tx(tx),
    .tx_ready(tx_ready));  // src/rtl/uart/uart.v(74)
  ubus u_ubus (
    .busy(busy),
    .clk(clk),
    .fls_read(fls_read),
    .id(id),
    .ubus_raddr(ubus_raddr),
    .ubus_ren(ubus_ren),
    .ubus_waddr(ubus_waddr),
    .ubus_wdata(ubus_wdata),
    .ubus_wen(ubus_wen),
    .fls_addr(fls_addr),
    .fls_write(fls_write),
    .led(led),
    .mod_sel(mod_sel),
    .sm_bit1(sm_bit1),
    .sm_bit2(sm_bit2),
    .sm_bit3(sm_bit3),
    .sm_bit4(sm_bit4),
    .start(start),
    .ubus_bken(ubus_bken),
    .ubus_rdata(ubus_rdata));  // src/rtl/uart/uart.v(117)
  uprotocol u_uprotocol (
    .clk(clk),
    .rx_data(rx_data),
    .rx_en(rx_en),
    .tx_ready(tx_ready),
    .ubus_bken(ubus_bken),
    .ubus_rdata(ubus_rdata),
    .tx_data(tx_data),
    .tx_en(tx_en),
    .ubus_raddr(ubus_raddr),
    .ubus_ren(ubus_ren),
    .ubus_waddr(ubus_waddr),
    .ubus_wdata(ubus_wdata),
    .ubus_wen(ubus_wen));  // src/rtl/uart/uart.v(91)

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



endmodule 

module flash_erase  // src/rtl/flash/flash_erase.v(22)
  (
  clk,
  fls_sdi,
  start,
  busy,
  fls_ncs,
  fls_sck,
  fls_sdo
  );

  input clk;  // src/rtl/flash/flash_erase.v(24)
  input fls_sdi;  // src/rtl/flash/flash_erase.v(30)
  input start;  // src/rtl/flash/flash_erase.v(32)
  output busy;  // src/rtl/flash/flash_erase.v(33)
  output fls_ncs;  // src/rtl/flash/flash_erase.v(28)
  output fls_sck;  // src/rtl/flash/flash_erase.v(27)
  output fls_sdo;  // src/rtl/flash/flash_erase.v(29)

  wire [9:0] cnt;  // src/rtl/flash/flash_erase.v(36)
  wire [6:0] cycle_cnt;  // src/rtl/flash/flash_erase.v(37)
  wire [9:0] n0;
  wire [9:0] n1;
  wire [7:0] n3;
  wire [7:0] n4;
  wire [2:0] phase_cnt;  // src/rtl/flash/flash_erase.v(38)
  wire [7:0] tx_reg;  // src/rtl/flash/flash_erase.v(39)
  wire n2;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire sft_wen;  // src/rtl/flash/flash_erase.v(40)

  add_pu10_pu10_o10 add0 (
    .i0(cnt),
    .i1(10'b0000000001),
    .o(n0));  // src/rtl/flash/flash_erase.v(54)
  AL_DFF busy_reg (
    .clk(clk),
    .d(n8),
    .reset(1'b0),
    .set(1'b0),
    .q(busy));  // src/rtl/flash/flash_erase.v(120)
  eq_w3 eq0 (
    .i0(phase_cnt),
    .i1(3'b110),
    .o(n5));  // src/rtl/flash/flash_erase.v(98)
  eq_w7 eq1 (
    .i0(cycle_cnt),
    .i1(7'b0001000),
    .o(n6));  // src/rtl/flash/flash_erase.v(118)
  AL_DFF fls_ncs_reg (
    .clk(clk),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs));  // src/rtl/flash/flash_erase.v(84)
  AL_DFF fls_sck_reg (
    .clk(clk),
    .d(cnt[2]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck));  // src/rtl/flash/flash_erase.v(75)
  AL_DFF fls_sdo_reg (
    .clk(clk),
    .d(tx_reg[7]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo));  // src/rtl/flash/flash_erase.v(111)
  binary_mux_s1_w10 mux0 (
    .i0(10'b0000000000),
    .i1(n0),
    .sel(busy),
    .o(n1));  // src/rtl/flash/flash_erase.v(56)
  binary_mux_s1_w8 mux1 (
    .i0(tx_reg),
    .i1({tx_reg[6:0],1'b0}),
    .sel(sft_wen),
    .o(n3));  // src/rtl/flash/flash_erase.v(92)
  binary_mux_s1_w8 mux2 (
    .i0(n3),
    .i1(8'b11000111),
    .sel(start),
    .o(n4));  // src/rtl/flash/flash_erase.v(92)
  reg_ar_as_w7 reg0 (
    .clk(clk),
    .d(cnt[9:3]),
    .reset(7'b0000000),
    .set(7'b0000000),
    .q(cycle_cnt));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w3 reg1 (
    .clk(clk),
    .d(cnt[2:0]),
    .reset(3'b000),
    .set(3'b000),
    .q(phase_cnt));  // src/rtl/flash/flash_erase.v(69)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n4),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(tx_reg));  // src/rtl/flash/flash_erase.v(93)
  reg_ar_as_w10 reg3 (
    .clk(clk),
    .d(n1),
    .reset(10'b0000000000),
    .set(10'b0000000000),
    .q(cnt));  // src/rtl/flash/flash_erase.v(57)
  AL_DFF sft_wen_reg (
    .clk(clk),
    .d(n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_wen));  // src/rtl/flash/flash_erase.v(99)
  not u2 (n2, busy);  // src/rtl/flash/flash_erase.v(83)
  AL_MUX u3 (
    .i0(busy),
    .i1(1'b0),
    .sel(n6),
    .o(n7));  // src/rtl/flash/flash_erase.v(119)
  AL_MUX u4 (
    .i0(n7),
    .i1(1'b1),
    .sel(start),
    .o(n8));  // src/rtl/flash/flash_erase.v(119)

endmodule 

module flash_fast_read  // src/rtl/flash/flash_fast_read.v(22)
  (
  clk,
  fls_sdi,
  start,
  addr,
  busy,
  dout,
  dout_en,
  fls_ncs,
  fls_sck,
  fls_sdo
  );

  input clk;  // src/rtl/flash/flash_fast_read.v(24)
  input fls_sdi;  // src/rtl/flash/flash_fast_read.v(30)
  input start;  // src/rtl/flash/flash_fast_read.v(33)
  output [23:0] addr;  // src/rtl/flash/flash_fast_read.v(35)
  output busy;  // src/rtl/flash/flash_fast_read.v(38)
  output [7:0] dout;  // src/rtl/flash/flash_fast_read.v(36)
  output dout_en;  // src/rtl/flash/flash_fast_read.v(34)
  output fls_ncs;  // src/rtl/flash/flash_fast_read.v(28)
  output fls_sck;  // src/rtl/flash/flash_fast_read.v(27)
  output fls_sdo;  // src/rtl/flash/flash_fast_read.v(29)

  wire [31:0] cnt;  // src/rtl/flash/flash_fast_read.v(41)
  wire [28:0] cycle_cnt;  // src/rtl/flash/flash_fast_read.v(42)
  wire [31:0] n0;
  wire [31:0] n1;
  wire [7:0] n13;
  wire [7:0] n14;
  wire [23:0] n15;
  wire [23:0] n16;
  wire [23:0] n17;
  wire [31:0] n3;
  wire [31:0] n4;
  wire [2:0] phase_cnt;  // src/rtl/flash/flash_fast_read.v(43)
  wire [7:0] rx_reg;  // src/rtl/flash/flash_fast_read.v(45)
  wire [31:0] tx_reg;  // src/rtl/flash/flash_fast_read.v(44)
  wire byte_flag;  // src/rtl/flash/flash_fast_read.v(48)
  wire n10;
  wire n11;
  wire n12;
  wire n18;
  wire n19;
  wire n2;
  wire n20;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;
  wire sft_ren;  // src/rtl/flash/flash_fast_read.v(47)
  wire sft_wen;  // src/rtl/flash/flash_fast_read.v(46)

  add_pu32_pu32_o32 add0 (
    .i0(cnt),
    .i1(32'b00000000000000000000000000000001),
    .o(n0));  // src/rtl/flash/flash_fast_read.v(62)
  add_pu24_pu24_o24 add1 (
    .i0(addr),
    .i1(24'b000000000000000000000001),
    .o(n15));  // src/rtl/flash/flash_fast_read.v(153)
  AL_DFF busy_reg (
    .clk(clk),
    .d(n20),
    .reset(1'b0),
    .set(1'b0),
    .q(busy));  // src/rtl/flash/flash_fast_read.v(163)
  AL_DFF byte_flag_reg (
    .clk(clk),
    .d(n12),
    .reset(1'b0),
    .set(1'b0),
    .q(byte_flag));  // src/rtl/flash/flash_fast_read.v(119)
  AL_DFF dout_en_reg (
    .clk(clk),
    .d(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout_en));  // src/rtl/flash/flash_fast_read.v(138)
  eq_w3 eq0 (
    .i0(phase_cnt),
    .i1(3'b110),
    .o(n5));  // src/rtl/flash/flash_fast_read.v(106)
  eq_w3 eq1 (
    .i0(phase_cnt),
    .i1(3'b011),
    .o(n6));  // src/rtl/flash/flash_fast_read.v(112)
  eq_w3 eq2 (
    .i0(cycle_cnt[2:0]),
    .i1(3'b111),
    .o(n9));  // src/rtl/flash/flash_fast_read.v(118)
  eq_w3 eq3 (
    .i0(phase_cnt),
    .i1(3'b101),
    .o(n11));  // src/rtl/flash/flash_fast_read.v(118)
  eq_w29 eq4 (
    .i0(cycle_cnt),
    .i1(29'b01000000000000000000000101000),
    .o(n18));  // src/rtl/flash/flash_fast_read.v(161)
  AL_DFF fls_ncs_reg (
    .clk(clk),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs));  // src/rtl/flash/flash_fast_read.v(92)
  AL_DFF fls_sck_reg (
    .clk(clk),
    .d(cnt[2]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck));  // src/rtl/flash/flash_fast_read.v(83)
  AL_DFF fls_sdo_reg (
    .clk(clk),
    .d(tx_reg[31]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo));  // src/rtl/flash/flash_fast_read.v(125)
  lt_u29_u29 lt0 (
    .ci(1'b0),
    .i0(29'b00000000000000000000000100111),
    .i1(cycle_cnt),
    .o(n7));  // src/rtl/flash/flash_fast_read.v(112)
  binary_mux_s1_w32 mux0 (
    .i0(32'b00000000000000000000000000000000),
    .i1(n0),
    .sel(busy),
    .o(n1));  // src/rtl/flash/flash_fast_read.v(64)
  binary_mux_s1_w32 mux1 (
    .i0(tx_reg),
    .i1({tx_reg[30:0],1'b0}),
    .sel(sft_wen),
    .o(n3));  // src/rtl/flash/flash_fast_read.v(100)
  binary_mux_s1_w32 mux2 (
    .i0(n3),
    .i1(32'b00001011000000000000000000000000),
    .sel(start),
    .o(n4));  // src/rtl/flash/flash_fast_read.v(100)
  binary_mux_s1_w8 mux3 (
    .i0(rx_reg),
    .i1({rx_reg[6:0],fls_sdi}),
    .sel(sft_ren),
    .o(n13));  // src/rtl/flash/flash_fast_read.v(131)
  binary_mux_s1_w8 mux4 (
    .i0(dout),
    .i1(rx_reg),
    .sel(byte_flag),
    .o(n14));  // src/rtl/flash/flash_fast_read.v(144)
  binary_mux_s1_w24 mux5 (
    .i0(addr),
    .i1(n15),
    .sel(byte_flag),
    .o(n16));  // src/rtl/flash/flash_fast_read.v(153)
  binary_mux_s1_w24 mux6 (
    .i0(n16),
    .i1(24'b111111111111111111111111),
    .sel(start),
    .o(n17));  // src/rtl/flash/flash_fast_read.v(153)
  reg_ar_as_w29 reg0 (
    .clk(clk),
    .d(cnt[31:3]),
    .reset(29'b00000000000000000000000000000),
    .set(29'b00000000000000000000000000000),
    .q(cycle_cnt));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w3 reg1 (
    .clk(clk),
    .d(cnt[2:0]),
    .reset(3'b000),
    .set(3'b000),
    .q(phase_cnt));  // src/rtl/flash/flash_fast_read.v(77)
  reg_ar_as_w32 reg2 (
    .clk(clk),
    .d(n4),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(tx_reg));  // src/rtl/flash/flash_fast_read.v(101)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n13),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(rx_reg));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w8 reg4 (
    .clk(clk),
    .d(n14),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(dout));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w24 reg5 (
    .clk(clk),
    .d(n17),
    .reset(24'b000000000000000000000000),
    .set(24'b000000000000000000000000),
    .q(addr));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_as_w32 reg6 (
    .clk(clk),
    .d(n1),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(cnt));  // src/rtl/flash/flash_fast_read.v(65)
  AL_DFF sft_ren_reg (
    .clk(clk),
    .d(n8),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_ren));  // src/rtl/flash/flash_fast_read.v(113)
  AL_DFF sft_wen_reg (
    .clk(clk),
    .d(n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_wen));  // src/rtl/flash/flash_fast_read.v(107)
  not u2 (n2, busy);  // src/rtl/flash/flash_fast_read.v(91)
  and u3 (n8, n6, n7);  // src/rtl/flash/flash_fast_read.v(112)
  and u4 (n10, n7, n9);  // src/rtl/flash/flash_fast_read.v(118)
  and u5 (n12, n10, n11);  // src/rtl/flash/flash_fast_read.v(118)
  AL_MUX u6 (
    .i0(busy),
    .i1(1'b0),
    .sel(n18),
    .o(n19));  // src/rtl/flash/flash_fast_read.v(162)
  AL_MUX u7 (
    .i0(n19),
    .i1(1'b1),
    .sel(start),
    .o(n20));  // src/rtl/flash/flash_fast_read.v(162)

endmodule 

module flash_id  // src/rtl/flash/flash_id.v(22)
  (
  clk,
  fls_sdi,
  start,
  busy,
  fls_id,
  fls_ncs,
  fls_sck,
  fls_sdo
  );

  input clk;  // src/rtl/flash/flash_id.v(24)
  input fls_sdi;  // src/rtl/flash/flash_id.v(30)
  input start;  // src/rtl/flash/flash_id.v(32)
  output busy;  // src/rtl/flash/flash_id.v(34)
  output [15:0] fls_id;  // src/rtl/flash/flash_id.v(33)
  output fls_ncs;  // src/rtl/flash/flash_id.v(28)
  output fls_sck;  // src/rtl/flash/flash_id.v(27)
  output fls_sdo;  // src/rtl/flash/flash_id.v(29)

  wire [9:0] cnt;  // src/rtl/flash/flash_id.v(37)
  wire [6:0] cycle_cnt;  // src/rtl/flash/flash_id.v(38)
  wire [9:0] n0;
  wire [9:0] n1;
  wire [7:0] n15;
  wire [15:0] n16;
  wire [31:0] n3;
  wire [31:0] n4;
  wire [2:0] phase_cnt;  // src/rtl/flash/flash_id.v(39)
  wire [7:0] rx_reg;  // src/rtl/flash/flash_id.v(41)
  wire [31:0] tx_reg;  // src/rtl/flash/flash_id.v(40)
  wire byte_flag;  // src/rtl/flash/flash_id.v(44)
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n17;
  wire n18;
  wire n19;
  wire n2;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;
  wire sft_ren;  // src/rtl/flash/flash_id.v(43)
  wire sft_wen;  // src/rtl/flash/flash_id.v(42)

  add_pu10_pu10_o10 add0 (
    .i0(cnt),
    .i1(10'b0000000001),
    .o(n0));  // src/rtl/flash/flash_id.v(58)
  AL_DFF busy_reg (
    .clk(clk),
    .d(n19),
    .reset(1'b0),
    .set(1'b0),
    .q(busy));  // src/rtl/flash/flash_id.v(144)
  AL_DFF byte_flag_reg (
    .clk(clk),
    .d(n14),
    .reset(1'b0),
    .set(1'b0),
    .q(byte_flag));  // src/rtl/flash/flash_id.v(115)
  eq_w3 eq0 (
    .i0(phase_cnt),
    .i1(3'b110),
    .o(n5));  // src/rtl/flash/flash_id.v(102)
  eq_w3 eq1 (
    .i0(phase_cnt),
    .i1(3'b011),
    .o(n6));  // src/rtl/flash/flash_id.v(108)
  eq_w3 eq2 (
    .i0(cycle_cnt[2:0]),
    .i1(3'b111),
    .o(n11));  // src/rtl/flash/flash_id.v(114)
  eq_w3 eq3 (
    .i0(phase_cnt),
    .i1(3'b101),
    .o(n13));  // src/rtl/flash/flash_id.v(114)
  eq_w7 eq4 (
    .i0(cycle_cnt),
    .i1(7'b0110000),
    .o(n17));  // src/rtl/flash/flash_id.v(142)
  AL_DFF fls_ncs_reg (
    .clk(clk),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs));  // src/rtl/flash/flash_id.v(88)
  AL_DFF fls_sck_reg (
    .clk(clk),
    .d(cnt[2]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck));  // src/rtl/flash/flash_id.v(79)
  AL_DFF fls_sdo_reg (
    .clk(clk),
    .d(tx_reg[31]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo));  // src/rtl/flash/flash_id.v(121)
  lt_u7_u7 lt0 (
    .ci(1'b0),
    .i0(7'b0011111),
    .i1(cycle_cnt),
    .o(n7));  // src/rtl/flash/flash_id.v(108)
  lt_u7_u7 lt1 (
    .ci(1'b0),
    .i0(cycle_cnt),
    .i1(7'b0110000),
    .o(n9));  // src/rtl/flash/flash_id.v(108)
  binary_mux_s1_w10 mux0 (
    .i0(10'b0000000000),
    .i1(n0),
    .sel(busy),
    .o(n1));  // src/rtl/flash/flash_id.v(60)
  binary_mux_s1_w32 mux1 (
    .i0(tx_reg),
    .i1({tx_reg[30:0],1'b0}),
    .sel(sft_wen),
    .o(n3));  // src/rtl/flash/flash_id.v(96)
  binary_mux_s1_w32 mux2 (
    .i0(n3),
    .i1(32'b10010000000000000000000000000000),
    .sel(start),
    .o(n4));  // src/rtl/flash/flash_id.v(96)
  binary_mux_s1_w8 mux3 (
    .i0(rx_reg),
    .i1({rx_reg[6:0],fls_sdi}),
    .sel(sft_ren),
    .o(n15));  // src/rtl/flash/flash_id.v(127)
  binary_mux_s1_w16 mux4 (
    .i0(fls_id),
    .i1({fls_id[7:0],rx_reg}),
    .sel(byte_flag),
    .o(n16));  // src/rtl/flash/flash_id.v(134)
  reg_ar_as_w7 reg0 (
    .clk(clk),
    .d(cnt[9:3]),
    .reset(7'b0000000),
    .set(7'b0000000),
    .q(cycle_cnt));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w3 reg1 (
    .clk(clk),
    .d(cnt[2:0]),
    .reset(3'b000),
    .set(3'b000),
    .q(phase_cnt));  // src/rtl/flash/flash_id.v(73)
  reg_ar_as_w32 reg2 (
    .clk(clk),
    .d(n4),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(tx_reg));  // src/rtl/flash/flash_id.v(97)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n15),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(rx_reg));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w16 reg4 (
    .clk(clk),
    .d(n16),
    .reset(16'b0000000000000000),
    .set(16'b0000000000000000),
    .q(fls_id));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w10 reg5 (
    .clk(clk),
    .d(n1),
    .reset(10'b0000000000),
    .set(10'b0000000000),
    .q(cnt));  // src/rtl/flash/flash_id.v(61)
  AL_DFF sft_ren_reg (
    .clk(clk),
    .d(n10),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_ren));  // src/rtl/flash/flash_id.v(109)
  AL_DFF sft_wen_reg (
    .clk(clk),
    .d(n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_wen));  // src/rtl/flash/flash_id.v(103)
  not u2 (n2, busy);  // src/rtl/flash/flash_id.v(87)
  and u3 (n8, n6, n7);  // src/rtl/flash/flash_id.v(108)
  and u4 (n10, n8, n9);  // src/rtl/flash/flash_id.v(108)
  and u5 (n12, n7, n11);  // src/rtl/flash/flash_id.v(114)
  and u6 (n14, n12, n13);  // src/rtl/flash/flash_id.v(114)
  AL_MUX u7 (
    .i0(busy),
    .i1(1'b0),
    .sel(n17),
    .o(n18));  // src/rtl/flash/flash_id.v(143)
  AL_MUX u8 (
    .i0(n18),
    .i1(1'b1),
    .sel(start),
    .o(n19));  // src/rtl/flash/flash_id.v(143)

endmodule 

module flash_read  // src/rtl/flash/flash_read.v(22)
  (
  addr,
  clk,
  fls_sdi,
  start,
  busy,
  dout,
  dout_en,
  fls_ncs,
  fls_sck,
  fls_sdo
  );

  input [23:0] addr;  // src/rtl/flash/flash_read.v(34)
  input clk;  // src/rtl/flash/flash_read.v(24)
  input fls_sdi;  // src/rtl/flash/flash_read.v(30)
  input start;  // src/rtl/flash/flash_read.v(33)
  output busy;  // src/rtl/flash/flash_read.v(38)
  output [7:0] dout;  // src/rtl/flash/flash_read.v(36)
  output dout_en;  // src/rtl/flash/flash_read.v(35)
  output fls_ncs;  // src/rtl/flash/flash_read.v(28)
  output fls_sck;  // src/rtl/flash/flash_read.v(27)
  output fls_sdo;  // src/rtl/flash/flash_read.v(29)

  wire [9:0] cnt;  // src/rtl/flash/flash_read.v(41)
  wire [6:0] cycle_cnt;  // src/rtl/flash/flash_read.v(42)
  wire [9:0] n0;
  wire [9:0] n1;
  wire [7:0] n13;
  wire [7:0] n14;
  wire [31:0] n3;
  wire [31:0] n4;
  wire [2:0] phase_cnt;  // src/rtl/flash/flash_read.v(43)
  wire [7:0] rx_reg;  // src/rtl/flash/flash_read.v(45)
  wire [31:0] tx_reg;  // src/rtl/flash/flash_read.v(44)
  wire byte_flag;  // src/rtl/flash/flash_read.v(48)
  wire n10;
  wire n11;
  wire n12;
  wire n15;
  wire n16;
  wire n17;
  wire n2;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;
  wire sft_ren;  // src/rtl/flash/flash_read.v(47)
  wire sft_wen;  // src/rtl/flash/flash_read.v(46)

  add_pu10_pu10_o10 add0 (
    .i0(cnt),
    .i1(10'b0000000001),
    .o(n0));  // src/rtl/flash/flash_read.v(62)
  AL_DFF busy_reg (
    .clk(clk),
    .d(n17),
    .reset(1'b0),
    .set(1'b0),
    .q(busy));  // src/rtl/flash/flash_read.v(154)
  AL_DFF byte_flag_reg (
    .clk(clk),
    .d(n12),
    .reset(1'b0),
    .set(1'b0),
    .q(byte_flag));  // src/rtl/flash/flash_read.v(119)
  AL_DFF dout_en_reg (
    .clk(clk),
    .d(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout_en));  // src/rtl/flash/flash_read.v(138)
  eq_w3 eq0 (
    .i0(phase_cnt),
    .i1(3'b110),
    .o(n5));  // src/rtl/flash/flash_read.v(106)
  eq_w3 eq1 (
    .i0(phase_cnt),
    .i1(3'b011),
    .o(n6));  // src/rtl/flash/flash_read.v(112)
  eq_w3 eq2 (
    .i0(cycle_cnt[2:0]),
    .i1(3'b111),
    .o(n9));  // src/rtl/flash/flash_read.v(118)
  eq_w3 eq3 (
    .i0(phase_cnt),
    .i1(3'b101),
    .o(n11));  // src/rtl/flash/flash_read.v(118)
  eq_w7 eq4 (
    .i0(cycle_cnt),
    .i1(7'b0101000),
    .o(n15));  // src/rtl/flash/flash_read.v(152)
  AL_DFF fls_ncs_reg (
    .clk(clk),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs));  // src/rtl/flash/flash_read.v(92)
  AL_DFF fls_sck_reg (
    .clk(clk),
    .d(cnt[2]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck));  // src/rtl/flash/flash_read.v(83)
  AL_DFF fls_sdo_reg (
    .clk(clk),
    .d(tx_reg[31]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo));  // src/rtl/flash/flash_read.v(125)
  lt_u7_u7 lt0 (
    .ci(1'b0),
    .i0(7'b0011111),
    .i1(cycle_cnt),
    .o(n7));  // src/rtl/flash/flash_read.v(112)
  binary_mux_s1_w10 mux0 (
    .i0(10'b0000000000),
    .i1(n0),
    .sel(busy),
    .o(n1));  // src/rtl/flash/flash_read.v(64)
  binary_mux_s1_w32 mux1 (
    .i0(tx_reg),
    .i1({tx_reg[30:0],1'b0}),
    .sel(sft_wen),
    .o(n3));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w32 mux2 (
    .i0(n3),
    .i1({8'b00000011,addr}),
    .sel(start),
    .o(n4));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w8 mux3 (
    .i0(rx_reg),
    .i1({rx_reg[6:0],fls_sdi}),
    .sel(sft_ren),
    .o(n13));  // src/rtl/flash/flash_read.v(131)
  binary_mux_s1_w8 mux4 (
    .i0(dout),
    .i1(rx_reg),
    .sel(byte_flag),
    .o(n14));  // src/rtl/flash/flash_read.v(144)
  reg_ar_as_w7 reg0 (
    .clk(clk),
    .d(cnt[9:3]),
    .reset(7'b0000000),
    .set(7'b0000000),
    .q(cycle_cnt));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w3 reg1 (
    .clk(clk),
    .d(cnt[2:0]),
    .reset(3'b000),
    .set(3'b000),
    .q(phase_cnt));  // src/rtl/flash/flash_read.v(77)
  reg_ar_as_w32 reg2 (
    .clk(clk),
    .d(n4),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(tx_reg));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n13),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(rx_reg));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w8 reg4 (
    .clk(clk),
    .d(n14),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(dout));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w10 reg5 (
    .clk(clk),
    .d(n1),
    .reset(10'b0000000000),
    .set(10'b0000000000),
    .q(cnt));  // src/rtl/flash/flash_read.v(65)
  AL_DFF sft_ren_reg (
    .clk(clk),
    .d(n8),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_ren));  // src/rtl/flash/flash_read.v(113)
  AL_DFF sft_wen_reg (
    .clk(clk),
    .d(n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_wen));  // src/rtl/flash/flash_read.v(107)
  not u2 (n2, busy);  // src/rtl/flash/flash_read.v(91)
  and u3 (n8, n6, n7);  // src/rtl/flash/flash_read.v(112)
  and u4 (n10, n7, n9);  // src/rtl/flash/flash_read.v(118)
  and u5 (n12, n10, n11);  // src/rtl/flash/flash_read.v(118)
  AL_MUX u6 (
    .i0(busy),
    .i1(1'b0),
    .sel(n15),
    .o(n16));  // src/rtl/flash/flash_read.v(153)
  AL_MUX u7 (
    .i0(n16),
    .i1(1'b1),
    .sel(start),
    .o(n17));  // src/rtl/flash/flash_read.v(153)

endmodule 

module flash_sector_erase  // src/rtl/flash/flash_sector_erase.v(22)
  (
  addr,
  clk,
  fls_sdi,
  start,
  busy,
  fls_ncs,
  fls_sck,
  fls_sdo
  );

  input [23:0] addr;  // src/rtl/flash/flash_sector_erase.v(34)
  input clk;  // src/rtl/flash/flash_sector_erase.v(24)
  input fls_sdi;  // src/rtl/flash/flash_sector_erase.v(30)
  input start;  // src/rtl/flash/flash_sector_erase.v(33)
  output busy;  // src/rtl/flash/flash_sector_erase.v(36)
  output fls_ncs;  // src/rtl/flash/flash_sector_erase.v(28)
  output fls_sck;  // src/rtl/flash/flash_sector_erase.v(27)
  output fls_sdo;  // src/rtl/flash/flash_sector_erase.v(29)

  wire [9:0] cnt;  // src/rtl/flash/flash_sector_erase.v(39)
  wire [6:0] cycle_cnt;  // src/rtl/flash/flash_sector_erase.v(40)
  wire [9:0] n0;
  wire [9:0] n1;
  wire [31:0] n3;
  wire [31:0] n4;
  wire [2:0] phase_cnt;  // src/rtl/flash/flash_sector_erase.v(41)
  wire [31:0] tx_reg;  // src/rtl/flash/flash_sector_erase.v(42)
  wire n2;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire sft_wen;  // src/rtl/flash/flash_sector_erase.v(43)

  add_pu10_pu10_o10 add0 (
    .i0(cnt),
    .i1(10'b0000000001),
    .o(n0));  // src/rtl/flash/flash_sector_erase.v(56)
  AL_DFF busy_reg (
    .clk(clk),
    .d(n8),
    .reset(1'b0),
    .set(1'b0),
    .q(busy));  // src/rtl/flash/flash_sector_erase.v(116)
  eq_w3 eq0 (
    .i0(phase_cnt),
    .i1(3'b110),
    .o(n5));  // src/rtl/flash/flash_sector_erase.v(100)
  eq_w7 eq1 (
    .i0(cycle_cnt),
    .i1(7'b0100000),
    .o(n6));  // src/rtl/flash/flash_sector_erase.v(114)
  AL_DFF fls_ncs_reg (
    .clk(clk),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs));  // src/rtl/flash/flash_sector_erase.v(86)
  AL_DFF fls_sck_reg (
    .clk(clk),
    .d(cnt[2]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck));  // src/rtl/flash/flash_sector_erase.v(77)
  AL_DFF fls_sdo_reg (
    .clk(clk),
    .d(tx_reg[31]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo));  // src/rtl/flash/flash_sector_erase.v(107)
  binary_mux_s1_w10 mux0 (
    .i0(10'b0000000000),
    .i1(n0),
    .sel(busy),
    .o(n1));  // src/rtl/flash/flash_sector_erase.v(58)
  binary_mux_s1_w32 mux1 (
    .i0(tx_reg),
    .i1({tx_reg[30:0],1'b0}),
    .sel(sft_wen),
    .o(n3));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w32 mux2 (
    .i0(n3),
    .i1({8'b00100000,addr}),
    .sel(start),
    .o(n4));  // src/rtl/flash/flash_sector_erase.v(94)
  reg_ar_as_w7 reg0 (
    .clk(clk),
    .d(cnt[9:3]),
    .reset(7'b0000000),
    .set(7'b0000000),
    .q(cycle_cnt));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w3 reg1 (
    .clk(clk),
    .d(cnt[2:0]),
    .reset(3'b000),
    .set(3'b000),
    .q(phase_cnt));  // src/rtl/flash/flash_sector_erase.v(71)
  reg_ar_as_w32 reg2 (
    .clk(clk),
    .d(n4),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(tx_reg));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w10 reg3 (
    .clk(clk),
    .d(n1),
    .reset(10'b0000000000),
    .set(10'b0000000000),
    .q(cnt));  // src/rtl/flash/flash_sector_erase.v(59)
  AL_DFF sft_wen_reg (
    .clk(clk),
    .d(n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_wen));  // src/rtl/flash/flash_sector_erase.v(101)
  not u2 (n2, busy);  // src/rtl/flash/flash_sector_erase.v(85)
  AL_MUX u3 (
    .i0(busy),
    .i1(1'b0),
    .sel(n6),
    .o(n7));  // src/rtl/flash/flash_sector_erase.v(115)
  AL_MUX u4 (
    .i0(n7),
    .i1(1'b1),
    .sel(start),
    .o(n8));  // src/rtl/flash/flash_sector_erase.v(115)

endmodule 

module flash_wait_free  // src/rtl/flash/flash_wait_free.v(22)
  (
  clk,
  fls_sdi,
  start,
  busy,
  fls_ncs,
  fls_sck,
  fls_sdo
  );

  input clk;  // src/rtl/flash/flash_wait_free.v(24)
  input fls_sdi;  // src/rtl/flash/flash_wait_free.v(30)
  input start;  // src/rtl/flash/flash_wait_free.v(32)
  output busy;  // src/rtl/flash/flash_wait_free.v(33)
  output fls_ncs;  // src/rtl/flash/flash_wait_free.v(28)
  output fls_sck;  // src/rtl/flash/flash_wait_free.v(27)
  output fls_sdo;  // src/rtl/flash/flash_wait_free.v(29)

  wire [31:0] cnt;  // src/rtl/flash/flash_wait_free.v(36)
  wire [28:0] cycle_cnt;  // src/rtl/flash/flash_wait_free.v(37)
  wire [31:0] n0;
  wire [31:0] n1;
  wire [7:0] n13;
  wire [7:0] n3;
  wire [7:0] n4;
  wire [2:0] phase_cnt;  // src/rtl/flash/flash_wait_free.v(38)
  wire [7:0] rx_reg;  // src/rtl/flash/flash_wait_free.v(40)
  wire [7:0] tx_reg;  // src/rtl/flash/flash_wait_free.v(39)
  wire byte_flag;  // src/rtl/flash/flash_wait_free.v(43)
  wire fls_busy;  // src/rtl/flash/flash_wait_free.v(44)
  wire n10;
  wire n11;
  wire n12;
  wire n14;
  wire n15;
  wire n16;
  wire n17;
  wire n18;
  wire n19;
  wire n2;
  wire n20;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;
  wire sft_ren;  // src/rtl/flash/flash_wait_free.v(42)
  wire sft_wen;  // src/rtl/flash/flash_wait_free.v(41)

  add_pu32_pu32_o32 add0 (
    .i0(cnt),
    .i1(32'b00000000000000000000000000000001),
    .o(n0));  // src/rtl/flash/flash_wait_free.v(59)
  AL_DFF busy_reg (
    .clk(clk),
    .d(n20),
    .reset(1'b0),
    .set(1'b0),
    .q(busy));  // src/rtl/flash/flash_wait_free.v(147)
  AL_DFF byte_flag_reg (
    .clk(clk),
    .d(n12),
    .reset(1'b0),
    .set(1'b0),
    .q(byte_flag));  // src/rtl/flash/flash_wait_free.v(116)
  eq_w3 eq0 (
    .i0(phase_cnt),
    .i1(3'b110),
    .o(n5));  // src/rtl/flash/flash_wait_free.v(103)
  eq_w3 eq1 (
    .i0(phase_cnt),
    .i1(3'b011),
    .o(n6));  // src/rtl/flash/flash_wait_free.v(109)
  eq_w3 eq2 (
    .i0(cycle_cnt[2:0]),
    .i1(3'b111),
    .o(n9));  // src/rtl/flash/flash_wait_free.v(115)
  eq_w3 eq3 (
    .i0(phase_cnt),
    .i1(3'b101),
    .o(n11));  // src/rtl/flash/flash_wait_free.v(115)
  eq_w1 eq4 (
    .i0(fls_busy),
    .i1(1'b0),
    .o(n16));  // src/rtl/flash/flash_wait_free.v(145)
  eq_w3 eq5 (
    .i0(phase_cnt),
    .i1(3'b000),
    .o(n17));  // src/rtl/flash/flash_wait_free.v(145)
  AL_DFF fls_busy_reg (
    .clk(clk),
    .d(n15),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_busy));  // src/rtl/flash/flash_wait_free.v(138)
  AL_DFF fls_ncs_reg (
    .clk(clk),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs));  // src/rtl/flash/flash_wait_free.v(89)
  AL_DFF fls_sck_reg (
    .clk(clk),
    .d(cnt[2]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck));  // src/rtl/flash/flash_wait_free.v(80)
  AL_DFF fls_sdo_reg (
    .clk(clk),
    .d(tx_reg[7]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo));  // src/rtl/flash/flash_wait_free.v(122)
  lt_u29_u29 lt0 (
    .ci(1'b0),
    .i0(29'b00000000000000000000000000111),
    .i1(cycle_cnt),
    .o(n7));  // src/rtl/flash/flash_wait_free.v(109)
  binary_mux_s1_w32 mux0 (
    .i0(32'b00000000000000000000000000000000),
    .i1(n0),
    .sel(busy),
    .o(n1));  // src/rtl/flash/flash_wait_free.v(61)
  binary_mux_s1_w8 mux1 (
    .i0(tx_reg),
    .i1({tx_reg[6:0],1'b0}),
    .sel(sft_wen),
    .o(n3));  // src/rtl/flash/flash_wait_free.v(97)
  binary_mux_s1_w8 mux2 (
    .i0(n3),
    .i1(8'b00000101),
    .sel(start),
    .o(n4));  // src/rtl/flash/flash_wait_free.v(97)
  binary_mux_s1_w8 mux3 (
    .i0(rx_reg),
    .i1({rx_reg[6:0],fls_sdi}),
    .sel(sft_ren),
    .o(n13));  // src/rtl/flash/flash_wait_free.v(128)
  reg_ar_as_w29 reg0 (
    .clk(clk),
    .d(cnt[31:3]),
    .reset(29'b00000000000000000000000000000),
    .set(29'b00000000000000000000000000000),
    .q(cycle_cnt));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w3 reg1 (
    .clk(clk),
    .d(cnt[2:0]),
    .reset(3'b000),
    .set(3'b000),
    .q(phase_cnt));  // src/rtl/flash/flash_wait_free.v(74)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n4),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(tx_reg));  // src/rtl/flash/flash_wait_free.v(98)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n13),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(rx_reg));  // src/rtl/flash/flash_wait_free.v(129)
  reg_ar_as_w32 reg4 (
    .clk(clk),
    .d(n1),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(cnt));  // src/rtl/flash/flash_wait_free.v(62)
  AL_DFF sft_ren_reg (
    .clk(clk),
    .d(n8),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_ren));  // src/rtl/flash/flash_wait_free.v(110)
  AL_DFF sft_wen_reg (
    .clk(clk),
    .d(n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_wen));  // src/rtl/flash/flash_wait_free.v(104)
  AL_MUX u10 (
    .i0(n19),
    .i1(1'b1),
    .sel(start),
    .o(n20));  // src/rtl/flash/flash_wait_free.v(146)
  not u2 (n2, busy);  // src/rtl/flash/flash_wait_free.v(88)
  and u3 (n8, n6, n7);  // src/rtl/flash/flash_wait_free.v(109)
  and u4 (n10, n7, n9);  // src/rtl/flash/flash_wait_free.v(115)
  and u5 (n12, n10, n11);  // src/rtl/flash/flash_wait_free.v(115)
  AL_MUX u6 (
    .i0(fls_busy),
    .i1(rx_reg[0]),
    .sel(byte_flag),
    .o(n14));  // src/rtl/flash/flash_wait_free.v(137)
  AL_MUX u7 (
    .i0(n14),
    .i1(1'b1),
    .sel(start),
    .o(n15));  // src/rtl/flash/flash_wait_free.v(137)
  and u8 (n18, n16, n17);  // src/rtl/flash/flash_wait_free.v(145)
  AL_MUX u9 (
    .i0(busy),
    .i1(1'b0),
    .sel(n18),
    .o(n19));  // src/rtl/flash/flash_wait_free.v(146)

endmodule 

module flash_write  // src/rtl/flash/flash_write.v(22)
  (
  addr,
  clk,
  din,
  fls_sdi,
  start,
  busy,
  fls_ncs,
  fls_sck,
  fls_sdo
  );

  input [23:0] addr;  // src/rtl/flash/flash_write.v(34)
  input clk;  // src/rtl/flash/flash_write.v(24)
  input [7:0] din;  // src/rtl/flash/flash_write.v(35)
  input fls_sdi;  // src/rtl/flash/flash_write.v(30)
  input start;  // src/rtl/flash/flash_write.v(33)
  output busy;  // src/rtl/flash/flash_write.v(37)
  output fls_ncs;  // src/rtl/flash/flash_write.v(28)
  output fls_sck;  // src/rtl/flash/flash_write.v(27)
  output fls_sdo;  // src/rtl/flash/flash_write.v(29)

  wire [9:0] cnt;  // src/rtl/flash/flash_write.v(40)
  wire [6:0] cycle_cnt;  // src/rtl/flash/flash_write.v(41)
  wire [9:0] n0;
  wire [9:0] n1;
  wire [39:0] n3;
  wire [39:0] n4;
  wire [2:0] phase_cnt;  // src/rtl/flash/flash_write.v(42)
  wire [39:0] tx_reg;  // src/rtl/flash/flash_write.v(43)
  wire n2;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire sft_wen;  // src/rtl/flash/flash_write.v(44)

  add_pu10_pu10_o10 add0 (
    .i0(cnt),
    .i1(10'b0000000001),
    .o(n0));  // src/rtl/flash/flash_write.v(58)
  AL_DFF busy_reg (
    .clk(clk),
    .d(n8),
    .reset(1'b0),
    .set(1'b0),
    .q(busy));  // src/rtl/flash/flash_write.v(124)
  eq_w3 eq0 (
    .i0(phase_cnt),
    .i1(3'b110),
    .o(n5));  // src/rtl/flash/flash_write.v(102)
  eq_w7 eq1 (
    .i0(cycle_cnt),
    .i1(7'b0101000),
    .o(n6));  // src/rtl/flash/flash_write.v(122)
  AL_DFF fls_ncs_reg (
    .clk(clk),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs));  // src/rtl/flash/flash_write.v(88)
  AL_DFF fls_sck_reg (
    .clk(clk),
    .d(cnt[2]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck));  // src/rtl/flash/flash_write.v(79)
  AL_DFF fls_sdo_reg (
    .clk(clk),
    .d(tx_reg[39]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo));  // src/rtl/flash/flash_write.v(115)
  binary_mux_s1_w10 mux0 (
    .i0(10'b0000000000),
    .i1(n0),
    .sel(busy),
    .o(n1));  // src/rtl/flash/flash_write.v(60)
  binary_mux_s1_w40 mux1 (
    .i0(tx_reg),
    .i1({tx_reg[38:0],1'b0}),
    .sel(sft_wen),
    .o(n3));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w40 mux2 (
    .i0(n3),
    .i1({8'b00000010,addr,din}),
    .sel(start),
    .o(n4));  // src/rtl/flash/flash_write.v(96)
  reg_ar_as_w7 reg0 (
    .clk(clk),
    .d(cnt[9:3]),
    .reset(7'b0000000),
    .set(7'b0000000),
    .q(cycle_cnt));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w3 reg1 (
    .clk(clk),
    .d(cnt[2:0]),
    .reset(3'b000),
    .set(3'b000),
    .q(phase_cnt));  // src/rtl/flash/flash_write.v(73)
  reg_ar_as_w40 reg2 (
    .clk(clk),
    .d(n4),
    .reset(40'b0000000000000000000000000000000000000000),
    .set(40'b0000000000000000000000000000000000000000),
    .q(tx_reg));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w10 reg3 (
    .clk(clk),
    .d(n1),
    .reset(10'b0000000000),
    .set(10'b0000000000),
    .q(cnt));  // src/rtl/flash/flash_write.v(61)
  AL_DFF sft_wen_reg (
    .clk(clk),
    .d(n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_wen));  // src/rtl/flash/flash_write.v(103)
  not u2 (n2, busy);  // src/rtl/flash/flash_write.v(87)
  AL_MUX u3 (
    .i0(busy),
    .i1(1'b0),
    .sel(n6),
    .o(n7));  // src/rtl/flash/flash_write.v(123)
  AL_MUX u4 (
    .i0(n7),
    .i1(1'b1),
    .sel(start),
    .o(n8));  // src/rtl/flash/flash_write.v(123)

endmodule 

module flash_write_enable  // src/rtl/flash/flash_write_enable.v(22)
  (
  clk,
  fls_sdi,
  start,
  busy,
  fls_ncs,
  fls_sck,
  fls_sdo
  );

  input clk;  // src/rtl/flash/flash_write_enable.v(24)
  input fls_sdi;  // src/rtl/flash/flash_write_enable.v(30)
  input start;  // src/rtl/flash/flash_write_enable.v(32)
  output busy;  // src/rtl/flash/flash_write_enable.v(33)
  output fls_ncs;  // src/rtl/flash/flash_write_enable.v(28)
  output fls_sck;  // src/rtl/flash/flash_write_enable.v(27)
  output fls_sdo;  // src/rtl/flash/flash_write_enable.v(29)

  wire [9:0] cnt;  // src/rtl/flash/flash_write_enable.v(36)
  wire [6:0] cycle_cnt;  // src/rtl/flash/flash_write_enable.v(37)
  wire [9:0] n0;
  wire [9:0] n1;
  wire [7:0] n3;
  wire [7:0] n4;
  wire [2:0] phase_cnt;  // src/rtl/flash/flash_write_enable.v(38)
  wire [7:0] tx_reg;  // src/rtl/flash/flash_write_enable.v(39)
  wire n2;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire sft_wen;  // src/rtl/flash/flash_write_enable.v(40)

  add_pu10_pu10_o10 add0 (
    .i0(cnt),
    .i1(10'b0000000001),
    .o(n0));  // src/rtl/flash/flash_write_enable.v(54)
  AL_DFF busy_reg (
    .clk(clk),
    .d(n8),
    .reset(1'b0),
    .set(1'b0),
    .q(busy));  // src/rtl/flash/flash_write_enable.v(120)
  eq_w3 eq0 (
    .i0(phase_cnt),
    .i1(3'b110),
    .o(n5));  // src/rtl/flash/flash_write_enable.v(98)
  eq_w7 eq1 (
    .i0(cycle_cnt),
    .i1(7'b0001000),
    .o(n6));  // src/rtl/flash/flash_write_enable.v(118)
  AL_DFF fls_ncs_reg (
    .clk(clk),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs));  // src/rtl/flash/flash_write_enable.v(84)
  AL_DFF fls_sck_reg (
    .clk(clk),
    .d(cnt[2]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck));  // src/rtl/flash/flash_write_enable.v(75)
  AL_DFF fls_sdo_reg (
    .clk(clk),
    .d(tx_reg[7]),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo));  // src/rtl/flash/flash_write_enable.v(111)
  binary_mux_s1_w10 mux0 (
    .i0(10'b0000000000),
    .i1(n0),
    .sel(busy),
    .o(n1));  // src/rtl/flash/flash_write_enable.v(56)
  binary_mux_s1_w8 mux1 (
    .i0(tx_reg),
    .i1({tx_reg[6:0],1'b0}),
    .sel(sft_wen),
    .o(n3));  // src/rtl/flash/flash_write_enable.v(92)
  binary_mux_s1_w8 mux2 (
    .i0(n3),
    .i1(8'b00000110),
    .sel(start),
    .o(n4));  // src/rtl/flash/flash_write_enable.v(92)
  reg_ar_as_w7 reg0 (
    .clk(clk),
    .d(cnt[9:3]),
    .reset(7'b0000000),
    .set(7'b0000000),
    .q(cycle_cnt));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w3 reg1 (
    .clk(clk),
    .d(cnt[2:0]),
    .reset(3'b000),
    .set(3'b000),
    .q(phase_cnt));  // src/rtl/flash/flash_write_enable.v(69)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n4),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(tx_reg));  // src/rtl/flash/flash_write_enable.v(93)
  reg_ar_as_w10 reg3 (
    .clk(clk),
    .d(n1),
    .reset(10'b0000000000),
    .set(10'b0000000000),
    .q(cnt));  // src/rtl/flash/flash_write_enable.v(57)
  AL_DFF sft_wen_reg (
    .clk(clk),
    .d(n5),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_wen));  // src/rtl/flash/flash_write_enable.v(99)
  not u2 (n2, busy);  // src/rtl/flash/flash_write_enable.v(83)
  AL_MUX u3 (
    .i0(busy),
    .i1(1'b0),
    .sel(n6),
    .o(n7));  // src/rtl/flash/flash_write_enable.v(119)
  AL_MUX u4 (
    .i0(n7),
    .i1(1'b1),
    .sel(start),
    .o(n8));  // src/rtl/flash/flash_write_enable.v(119)

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

module rst_n  // src/rtl/tube/rst.v(14)
  (
  clk,
  rst_n
  );

  input clk;  // src/rtl/tube/rst.v(16)
  output rst_n;  // src/rtl/tube/rst.v(17)

  wire [3:0] cnt;  // src/rtl/tube/rst.v(20)
  wire [3:0] n1;
  wire [3:0] n2;
  wire n0;

  add_pu4_pu4_o4 add0 (
    .i0(cnt),
    .i1(4'b0001),
    .o(n1));  // src/rtl/tube/rst.v(27)
  eq_w4 eq0 (
    .i0(cnt),
    .i1(4'b1111),
    .o(n0));  // src/rtl/tube/rst.v(24)
  binary_mux_s1_w4 mux0 (
    .i0(n1),
    .i1(4'b1111),
    .sel(n0),
    .o(n2));  // src/rtl/tube/rst.v(27)
  reg_ar_as_w4 reg0 (
    .clk(clk),
    .d(n2),
    .reset(4'b0000),
    .set(4'b0000),
    .q(cnt));  // src/rtl/tube/rst.v(28)
  AL_DFF rst_n_reg (
    .clk(clk),
    .d(n0),
    .reset(1'b0),
    .set(1'b0),
    .q(rst_n));  // src/rtl/tube/rst.v(36)

endmodule 

module \uart_rx(CLK_RATE=24000000)   // src/rtl/uart/uart_rx.v(8)
  (
  clk,
  rx,
  rx_data,
  rx_en
  );

  input clk;  // src/rtl/uart/uart_rx.v(14)
  input rx;  // src/rtl/uart/uart_rx.v(17)
  output [7:0] rx_data;  // src/rtl/uart/uart_rx.v(21)
  output rx_en;  // src/rtl/uart/uart_rx.v(20)

  parameter BAUDRATE = 115200;
  parameter CLK_RATE = 24000000;
  wire [31:0] clk_cnt;  // src/rtl/uart/uart_rx.v(29)
  wire [3:0] cnt;  // src/rtl/uart/uart_rx.v(26)
  wire [7:0] data;  // src/rtl/uart/uart_rx.v(27)
  wire [3:0] n13;
  wire [3:0] n14;
  wire [3:0] n15;
  wire [7:0] n25;
  wire [7:0] n26;
  wire [7:0] n30;
  wire [31:0] n7;
  wire [31:0] n8;
  wire [31:0] n9;
  wire [1:0] rx_d;  // src/rtl/uart/uart_rx.v(28)
  wire clk_en;  // src/rtl/uart/uart_rx.v(25)
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
  wire start;  // src/rtl/uart/uart_rx.v(24)

  add_pu32_pu32_o32 add0 (
    .i0(clk_cnt),
    .i1(32'b00000000000000000000000000000001),
    .o(n7));  // src/rtl/uart/uart_rx.v(54)
  add_pu4_pu4_o4 add1 (
    .i0(cnt),
    .i1(4'b0001),
    .o(n13));  // src/rtl/uart/uart_rx.v(69)
  AL_DFF clk_en_reg (
    .clk(clk),
    .d(n5),
    .reset(1'b0),
    .set(1'b0),
    .q(clk_en));  // src/rtl/uart/uart_rx.v(61)
  eq_w2 eq0 (
    .i0(rx_d),
    .i1(2'b10),
    .o(n0));  // src/rtl/uart/uart_rx.v(40)
  eq_w4 eq1 (
    .i0(cnt),
    .i1(4'b1001),
    .o(n1));  // src/rtl/uart/uart_rx.v(42)
  eq_w4 eq10 (
    .i0(cnt),
    .i1(4'b1000),
    .o(n23));  // src/rtl/uart/uart_rx.v(84)
  eq_w32 eq2 (
    .i0(clk_cnt),
    .i1(32'b00000000000000000000000011001111),
    .o(n5));  // src/rtl/uart/uart_rx.v(51)
  eq_w4 eq3 (
    .i0(cnt),
    .i1(4'b0001),
    .o(n16));  // src/rtl/uart/uart_rx.v(77)
  eq_w4 eq4 (
    .i0(cnt),
    .i1(4'b0010),
    .o(n17));  // src/rtl/uart/uart_rx.v(78)
  eq_w4 eq5 (
    .i0(cnt),
    .i1(4'b0011),
    .o(n18));  // src/rtl/uart/uart_rx.v(79)
  eq_w4 eq6 (
    .i0(cnt),
    .i1(4'b0100),
    .o(n19));  // src/rtl/uart/uart_rx.v(80)
  eq_w4 eq7 (
    .i0(cnt),
    .i1(4'b0101),
    .o(n20));  // src/rtl/uart/uart_rx.v(81)
  eq_w4 eq8 (
    .i0(cnt),
    .i1(4'b0110),
    .o(n21));  // src/rtl/uart/uart_rx.v(82)
  eq_w4 eq9 (
    .i0(cnt),
    .i1(4'b0111),
    .o(n22));  // src/rtl/uart/uart_rx.v(83)
  binary_mux_s1_w32 mux0 (
    .i0(n7),
    .i1(32'b00000000000000000000000000000000),
    .sel(n5),
    .o(n8));  // src/rtl/uart/uart_rx.v(54)
  binary_mux_s1_w32 mux1 (
    .i0(32'b00000000000000000000000001101000),
    .i1(n8),
    .sel(start),
    .o(n9));  // src/rtl/uart/uart_rx.v(54)
  binary_mux_s1_w4 mux2 (
    .i0(cnt),
    .i1(n13),
    .sel(clk_en),
    .o(n14));  // src/rtl/uart/uart_rx.v(69)
  binary_mux_s1_w4 mux3 (
    .i0(4'b0000),
    .i1(n14),
    .sel(start),
    .o(n15));  // src/rtl/uart/uart_rx.v(69)
  binary_mux_s1_w8 mux4 (
    .i0(data),
    .i1(n25),
    .sel(clk_en),
    .o(n26));  // src/rtl/uart/uart_rx.v(86)
  binary_mux_s1_w8 mux5 (
    .i0(rx_data),
    .i1(data),
    .sel(n1),
    .o(n30));  // src/rtl/uart/uart_rx.v(98)
  reg_ar_as_w32 reg0 (
    .clk(clk),
    .d(n9),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(clk_cnt));  // src/rtl/uart/uart_rx.v(55)
  reg_ar_as_w4 reg1 (
    .clk(clk),
    .d(n15),
    .reset(4'b0000),
    .set(4'b0000),
    .q(cnt));  // src/rtl/uart/uart_rx.v(70)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n26),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(data));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n30),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(rx_data));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w2 reg4 (
    .clk(clk),
    .d({rx_d[0],rx}),
    .reset(2'b00),
    .set(2'b00),
    .q(rx_d));  // src/rtl/uart/uart_rx.v(35)
  AL_DFF rx_en_reg (
    .clk(clk),
    .d(n28),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_en));  // src/rtl/uart/uart_rx.v(92)
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
    .o(n25));  // src/rtl/uart/uart_rx.v(85)
  AL_DFF start_reg (
    .clk(clk),
    .d(n3),
    .reset(1'b0),
    .set(1'b0),
    .q(start));  // src/rtl/uart/uart_rx.v(44)
  and u10 (n28, start, n1);  // src/rtl/uart/uart_rx.v(91)
  or u11 (n29, n23, n22);  // src/rtl/uart/uart_rx.v(85)
  not u12 (n24, n6);  // src/rtl/uart/uart_rx.v(85)
  or u2 (n6, n10, n12);  // src/rtl/uart/uart_rx.v(85)
  or u3 (n12, n11, n4);  // src/rtl/uart/uart_rx.v(85)
  AL_MUX u4 (
    .i0(start),
    .i1(1'b0),
    .sel(n1),
    .o(n2));  // src/rtl/uart/uart_rx.v(43)
  AL_MUX u5 (
    .i0(n2),
    .i1(1'b1),
    .sel(n0),
    .o(n3));  // src/rtl/uart/uart_rx.v(43)
  or u6 (n4, n17, n16);  // src/rtl/uart/uart_rx.v(85)
  or u7 (n10, n29, n27);  // src/rtl/uart/uart_rx.v(85)
  or u8 (n11, n19, n18);  // src/rtl/uart/uart_rx.v(85)
  or u9 (n27, n21, n20);  // src/rtl/uart/uart_rx.v(85)

endmodule 

module \uart_tx(CLK_RATE=24000000)   // src/rtl/uart/uart_tx.v(8)
  (
  clk,
  tx_data,
  tx_en,
  tx,
  tx_ready
  );

  input clk;  // src/rtl/uart/uart_tx.v(14)
  input [7:0] tx_data;  // src/rtl/uart/uart_tx.v(21)
  input tx_en;  // src/rtl/uart/uart_tx.v(20)
  output tx;  // src/rtl/uart/uart_tx.v(17)
  output tx_ready;  // src/rtl/uart/uart_tx.v(22)

  parameter BAUDRATE = 115200;
  parameter CLK_RATE = 24000000;
  wire [31:0] clk_cnt;  // src/rtl/uart/uart_tx.v(29)
  wire [3:0] cnt;  // src/rtl/uart/uart_tx.v(27)
  wire [7:0] data;  // src/rtl/uart/uart_tx.v(28)
  wire [31:0] n1;
  wire [3:0] n10;
  wire [3:0] n11;
  wire [3:0] n12;
  wire [31:0] n2;
  wire [31:0] n3;
  wire [7:0] n9;
  wire clk_en;  // src/rtl/uart/uart_tx.v(26)
  wire n0;
  wire n13;
  wire n14;
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire start;  // src/rtl/uart/uart_tx.v(25)

  add_pu32_pu32_o32 add0 (
    .i0(clk_cnt),
    .i1(32'b00000000000000000000000000000001),
    .o(n1));  // src/rtl/uart/uart_tx.v(40)
  add_pu4_pu4_o4 add1 (
    .i0(cnt),
    .i1(4'b0001),
    .o(n10));  // src/rtl/uart/uart_tx.v(71)
  AL_DFF clk_en_reg (
    .clk(clk),
    .d(n0),
    .reset(1'b0),
    .set(1'b0),
    .q(clk_en));  // src/rtl/uart/uart_tx.v(47)
  eq_w32 eq0 (
    .i0(clk_cnt),
    .i1(32'b00000000000000000000000011001111),
    .o(n0));  // src/rtl/uart/uart_tx.v(37)
  eq_w4 eq1 (
    .i0(cnt),
    .i1(4'b1010),
    .o(n4));  // src/rtl/uart/uart_tx.v(54)
  binary_mux_s1_w32 mux0 (
    .i0(n1),
    .i1(32'b00000000000000000000000000000000),
    .sel(n0),
    .o(n2));  // src/rtl/uart/uart_tx.v(40)
  binary_mux_s1_w32 mux1 (
    .i0(32'b00000000000000000000000000000000),
    .i1(n2),
    .sel(start),
    .o(n3));  // src/rtl/uart/uart_tx.v(40)
  binary_mux_s1_w8 mux2 (
    .i0(data),
    .i1(tx_data),
    .sel(n8),
    .o(n9));  // src/rtl/uart/uart_tx.v(62)
  binary_mux_s1_w4 mux3 (
    .i0(cnt),
    .i1(n10),
    .sel(clk_en),
    .o(n11));  // src/rtl/uart/uart_tx.v(71)
  binary_mux_s1_w4 mux4 (
    .i0(4'b0000),
    .i1(n11),
    .sel(start),
    .o(n12));  // src/rtl/uart/uart_tx.v(71)
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
    .o(n13));  // src/rtl/uart/uart_tx.v(89)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n9),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(data));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w4 reg1 (
    .clk(clk),
    .d(n12),
    .reset(4'b0000),
    .set(4'b0000),
    .q(cnt));  // src/rtl/uart/uart_tx.v(72)
  reg_ar_as_w32 reg2 (
    .clk(clk),
    .d(n3),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(clk_cnt));  // src/rtl/uart/uart_tx.v(41)
  AL_DFF start_reg (
    .clk(clk),
    .d(n6),
    .reset(1'b0),
    .set(1'b0),
    .q(start));  // src/rtl/uart/uart_tx.v(56)
  AL_DFF tx_ready_reg (
    .clk(clk),
    .d(n14),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_ready));  // src/rtl/uart/uart_tx.v(99)
  AL_DFF tx_reg (
    .clk(clk),
    .d(n13),
    .reset(1'b0),
    .set(1'b0),
    .q(tx));  // src/rtl/uart/uart_tx.v(90)
  AL_MUX u2 (
    .i0(start),
    .i1(1'b0),
    .sel(n4),
    .o(n5));  // src/rtl/uart/uart_tx.v(55)
  AL_MUX u3 (
    .i0(n5),
    .i1(1'b1),
    .sel(tx_en),
    .o(n6));  // src/rtl/uart/uart_tx.v(55)
  not u4 (n7, start);  // src/rtl/uart/uart_tx.v(61)
  and u5 (n8, tx_en, n7);  // src/rtl/uart/uart_tx.v(61)
  AL_MUX u6 (
    .i0(n7),
    .i1(1'b0),
    .sel(tx_en),
    .o(n14));  // src/rtl/uart/uart_tx.v(98)

endmodule 

module ubus  // src/rtl/uart/ubus.v(8)
  (
  busy,
  clk,
  fls_read,
  id,
  ubus_raddr,
  ubus_ren,
  ubus_waddr,
  ubus_wdata,
  ubus_wen,
  fls_addr,
  fls_write,
  led,
  mod_sel,
  sm_bit1,
  sm_bit2,
  sm_bit3,
  sm_bit4,
  start,
  ubus_bken,
  ubus_rdata
  );

  input busy;  // src/rtl/uart/ubus.v(41)
  input clk;  // src/rtl/uart/ubus.v(10)
  input [7:0] fls_read;  // src/rtl/uart/ubus.v(39)
  input [15:0] id;  // src/rtl/uart/ubus.v(40)
  input [31:0] ubus_raddr;  // src/rtl/uart/ubus.v(19)
  input ubus_ren;  // src/rtl/uart/ubus.v(18)
  input [31:0] ubus_waddr;  // src/rtl/uart/ubus.v(14)
  input [31:0] ubus_wdata;  // src/rtl/uart/ubus.v(15)
  input ubus_wen;  // src/rtl/uart/ubus.v(13)
  output [23:0] fls_addr;  // src/rtl/uart/ubus.v(37)
  output [7:0] fls_write;  // src/rtl/uart/ubus.v(38)
  output [15:0] led;  // src/rtl/uart/ubus.v(26)
  output [2:0] mod_sel;  // src/rtl/uart/ubus.v(36)
  output [3:0] sm_bit1;  // src/rtl/uart/ubus.v(29)
  output [3:0] sm_bit2;  // src/rtl/uart/ubus.v(30)
  output [3:0] sm_bit3;  // src/rtl/uart/ubus.v(31)
  output [3:0] sm_bit4;  // src/rtl/uart/ubus.v(32)
  output start;  // src/rtl/uart/ubus.v(35)
  output ubus_bken;  // src/rtl/uart/ubus.v(20)
  output [31:0] ubus_rdata;  // src/rtl/uart/ubus.v(21)

  wire [31:0] n0;
  wire [3:0] n10;
  wire [3:0] n11;
  wire [3:0] n12;
  wire [2:0] n14;
  wire [23:0] n15;
  wire [7:0] n16;
  wire [15:0] n17;
  wire [3:0] n18;
  wire [3:0] n19;
  wire [3:0] n20;
  wire [3:0] n21;
  wire [2:0] n23;
  wire [23:0] n24;
  wire [7:0] n25;
  wire [31:0] n26;
  wire [31:0] n40;
  wire [31:0] n41;
  wire [15:0] n8;
  wire [3:0] n9;
  wire n1;
  wire n13;
  wire n2;
  wire n22;
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
  wire n5;
  wire n6;
  wire n7;

  eq_w32 eq0 (
    .i0(ubus_waddr),
    .i1(32'b00000000000000000000000000000000),
    .o(n1));  // src/rtl/uart/ubus.v(52)
  eq_w32 eq1 (
    .i0(ubus_waddr),
    .i1(32'b00000000000000000000000000000001),
    .o(n2));  // src/rtl/uart/ubus.v(53)
  eq_w32 eq2 (
    .i0(ubus_waddr),
    .i1(32'b00000000000000000000000000000010),
    .o(n3));  // src/rtl/uart/ubus.v(54)
  eq_w32 eq3 (
    .i0(ubus_waddr),
    .i1(32'b00000000000000000000000000000011),
    .o(n4));  // src/rtl/uart/ubus.v(55)
  eq_w32 eq4 (
    .i0(ubus_waddr),
    .i1(32'b00000000000000000000000000000100),
    .o(n5));  // src/rtl/uart/ubus.v(56)
  eq_w32 eq5 (
    .i0(ubus_waddr),
    .i1(32'b00000000000000000000000000000101),
    .o(n6));  // src/rtl/uart/ubus.v(57)
  eq_w32 eq6 (
    .i0(ubus_raddr),
    .i1(32'b00000000000000000000000000000000),
    .o(n35));  // src/rtl/uart/ubus.v(72)
  eq_w32 eq7 (
    .i0(ubus_raddr),
    .i1(32'b00000000000000000000000000000110),
    .o(n36));  // src/rtl/uart/ubus.v(74)
  eq_w32 eq8 (
    .i0(ubus_raddr),
    .i1(32'b00000000000000000000000000000111),
    .o(n37));  // src/rtl/uart/ubus.v(75)
  eq_w32 eq9 (
    .i0(ubus_raddr),
    .i1(32'b00000000000000000000000000001000),
    .o(n38));  // src/rtl/uart/ubus.v(76)
  binary_mux_s1_w16 mux0 (
    .i0(led),
    .i1(n8),
    .sel(ubus_wen),
    .o(n17));  // src/rtl/uart/ubus.v(63)
  binary_mux_s1_w4 mux1 (
    .i0(sm_bit1),
    .i1(n9),
    .sel(ubus_wen),
    .o(n18));  // src/rtl/uart/ubus.v(63)
  binary_mux_s1_w4 mux2 (
    .i0(sm_bit2),
    .i1(n10),
    .sel(ubus_wen),
    .o(n19));  // src/rtl/uart/ubus.v(63)
  binary_mux_s1_w4 mux3 (
    .i0(sm_bit3),
    .i1(n11),
    .sel(ubus_wen),
    .o(n20));  // src/rtl/uart/ubus.v(63)
  binary_mux_s1_w4 mux4 (
    .i0(sm_bit4),
    .i1(n12),
    .sel(ubus_wen),
    .o(n21));  // src/rtl/uart/ubus.v(63)
  binary_mux_s1_w3 mux5 (
    .i0(mod_sel),
    .i1(n14),
    .sel(ubus_wen),
    .o(n23));  // src/rtl/uart/ubus.v(63)
  binary_mux_s1_w24 mux6 (
    .i0(fls_addr),
    .i1(n15),
    .sel(ubus_wen),
    .o(n24));  // src/rtl/uart/ubus.v(63)
  binary_mux_s1_w8 mux7 (
    .i0(fls_write),
    .i1(n16),
    .sel(ubus_wen),
    .o(n25));  // src/rtl/uart/ubus.v(63)
  binary_mux_s1_w32 mux8 (
    .i0(ubus_rdata),
    .i1(n40),
    .sel(ubus_ren),
    .o(n41));  // src/rtl/uart/ubus.v(79)
  reg_ar_as_w4 reg0 (
    .clk(clk),
    .d(n18),
    .reset(4'b0000),
    .set(4'b0000),
    .q(sm_bit1));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w4 reg1 (
    .clk(clk),
    .d(n19),
    .reset(4'b0000),
    .set(4'b0000),
    .q(sm_bit2));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w4 reg2 (
    .clk(clk),
    .d(n20),
    .reset(4'b0000),
    .set(4'b0000),
    .q(sm_bit3));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w4 reg3 (
    .clk(clk),
    .d(n21),
    .reset(4'b0000),
    .set(4'b0000),
    .q(sm_bit4));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w3 reg4 (
    .clk(clk),
    .d(n23),
    .reset(3'b000),
    .set(3'b000),
    .q(mod_sel));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w24 reg5 (
    .clk(clk),
    .d(n24),
    .reset(24'b000000000000000000000000),
    .set(24'b000000000000000000000000),
    .q(fls_addr));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w8 reg6 (
    .clk(clk),
    .d(n25),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(fls_write));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w32 reg7 (
    .clk(clk),
    .d(n41),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(ubus_rdata));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w16 reg8 (
    .clk(clk),
    .d(n17),
    .reset(16'b0000000000000000),
    .set(16'b0000000000000000),
    .q(led));  // src/rtl/uart/ubus.v(64)
  onehot_mux_s7_w16 sel0 (
    .i0(led),
    .i1(led),
    .i2(led),
    .i3(led),
    .i4(led),
    .i5(led),
    .i6(n0[15:0]),
    .sel({n1,n2,n3,n4,n5,n6,n7}),
    .o(n8));  // src/rtl/uart/ubus.v(60)
  onehot_mux_s7_w4 sel1 (
    .i0(sm_bit1),
    .i1(sm_bit1),
    .i2(sm_bit1),
    .i3(sm_bit1),
    .i4(sm_bit1),
    .i5(ubus_wdata[3:0]),
    .i6(sm_bit1),
    .sel({n1,n2,n3,n4,n5,n6,n7}),
    .o(n9));  // src/rtl/uart/ubus.v(60)
  onehot_mux_s7_w4 sel2 (
    .i0(sm_bit2),
    .i1(sm_bit2),
    .i2(sm_bit2),
    .i3(sm_bit2),
    .i4(sm_bit2),
    .i5(ubus_wdata[7:4]),
    .i6(sm_bit2),
    .sel({n1,n2,n3,n4,n5,n6,n7}),
    .o(n10));  // src/rtl/uart/ubus.v(60)
  onehot_mux_s7_w4 sel3 (
    .i0(sm_bit3),
    .i1(sm_bit3),
    .i2(sm_bit3),
    .i3(sm_bit3),
    .i4(sm_bit3),
    .i5(ubus_wdata[11:8]),
    .i6(sm_bit3),
    .sel({n1,n2,n3,n4,n5,n6,n7}),
    .o(n11));  // src/rtl/uart/ubus.v(60)
  onehot_mux_s7_w4 sel4 (
    .i0(sm_bit4),
    .i1(sm_bit4),
    .i2(sm_bit4),
    .i3(sm_bit4),
    .i4(sm_bit4),
    .i5(ubus_wdata[15:12]),
    .i6(sm_bit4),
    .sel({n1,n2,n3,n4,n5,n6,n7}),
    .o(n12));  // src/rtl/uart/ubus.v(60)
  onehot_mux_s7_w3 sel5 (
    .i0(mod_sel),
    .i1(mod_sel),
    .i2(mod_sel),
    .i3(ubus_wdata[2:0]),
    .i4(mod_sel),
    .i5(mod_sel),
    .i6(mod_sel),
    .sel({n1,n2,n3,n4,n5,n6,n7}),
    .o(n14));  // src/rtl/uart/ubus.v(60)
  onehot_mux_s7_w24 sel6 (
    .i0(fls_addr),
    .i1(fls_addr),
    .i2(ubus_wdata[23:0]),
    .i3(fls_addr),
    .i4(fls_addr),
    .i5(fls_addr),
    .i6(fls_addr),
    .sel({n1,n2,n3,n4,n5,n6,n7}),
    .o(n15));  // src/rtl/uart/ubus.v(60)
  onehot_mux_s7_w8 sel7 (
    .i0(fls_write),
    .i1(ubus_wdata[7:0]),
    .i2(fls_write),
    .i3(fls_write),
    .i4(fls_write),
    .i5(fls_write),
    .i6(fls_write),
    .sel({n1,n2,n3,n4,n5,n6,n7}),
    .o(n16));  // src/rtl/uart/ubus.v(60)
  onehot_mux_s5_w32 sel8 (
    .i0(ubus_rdata),
    .i1({31'b0000000000000000000000000000000,busy}),
    .i2({16'b0000000000000000,id}),
    .i3({24'b000000000000000000000000,fls_read}),
    .i4({16'b1111111111111111,n26[15:0]}),
    .sel({n35,n36,n37,n38,n39}),
    .o(n40));  // src/rtl/uart/ubus.v(78)
  AL_DFF start_reg (
    .clk(clk),
    .d(n22),
    .reset(1'b0),
    .set(1'b0),
    .q(start));  // src/rtl/uart/ubus.v(64)
  or u10 (n32, n34, n33);  // src/rtl/uart/ubus.v(78)
  not u11 (n39, n32);  // src/rtl/uart/ubus.v(78)
  or u12 (n30, n6, n31);  // src/rtl/uart/ubus.v(60)
  or u13 (n29, n2, n1);  // src/rtl/uart/ubus.v(60)
  or u14 (n28, n3, n29);  // src/rtl/uart/ubus.v(60)
  or u15 (n27, n30, n28);  // src/rtl/uart/ubus.v(60)
  not u16 (n7, n27);  // src/rtl/uart/ubus.v(60)
  not u17 (n26[1], led[1]);  // src/rtl/uart/ubus.v(72)
  not u18 (n26[2], led[2]);  // src/rtl/uart/ubus.v(72)
  not u19 (n26[3], led[3]);  // src/rtl/uart/ubus.v(72)
  or u2 (n33, n36, n35);  // src/rtl/uart/ubus.v(78)
  not u20 (n26[4], led[4]);  // src/rtl/uart/ubus.v(72)
  not u21 (n26[5], led[5]);  // src/rtl/uart/ubus.v(72)
  not u22 (n26[6], led[6]);  // src/rtl/uart/ubus.v(72)
  not u23 (n26[7], led[7]);  // src/rtl/uart/ubus.v(72)
  not u24 (n26[8], led[8]);  // src/rtl/uart/ubus.v(72)
  not u25 (n26[9], led[9]);  // src/rtl/uart/ubus.v(72)
  not u26 (n26[10], led[10]);  // src/rtl/uart/ubus.v(72)
  not u27 (n26[11], led[11]);  // src/rtl/uart/ubus.v(72)
  not u28 (n26[12], led[12]);  // src/rtl/uart/ubus.v(72)
  not u29 (n26[13], led[13]);  // src/rtl/uart/ubus.v(72)
  not u30 (n26[14], led[14]);  // src/rtl/uart/ubus.v(72)
  not u31 (n26[15], led[15]);  // src/rtl/uart/ubus.v(72)
  not u32 (n0[1], ubus_wdata[1]);  // src/rtl/uart/ubus.v(52)
  not u33 (n0[2], ubus_wdata[2]);  // src/rtl/uart/ubus.v(52)
  not u34 (n0[3], ubus_wdata[3]);  // src/rtl/uart/ubus.v(52)
  not u35 (n0[4], ubus_wdata[4]);  // src/rtl/uart/ubus.v(52)
  not u36 (n0[5], ubus_wdata[5]);  // src/rtl/uart/ubus.v(52)
  not u37 (n0[6], ubus_wdata[6]);  // src/rtl/uart/ubus.v(52)
  not u38 (n0[7], ubus_wdata[7]);  // src/rtl/uart/ubus.v(52)
  not u39 (n0[8], ubus_wdata[8]);  // src/rtl/uart/ubus.v(52)
  not u4 (n0[0], ubus_wdata[0]);  // src/rtl/uart/ubus.v(52)
  not u40 (n0[9], ubus_wdata[9]);  // src/rtl/uart/ubus.v(52)
  not u41 (n0[10], ubus_wdata[10]);  // src/rtl/uart/ubus.v(52)
  not u42 (n0[11], ubus_wdata[11]);  // src/rtl/uart/ubus.v(52)
  not u43 (n0[12], ubus_wdata[12]);  // src/rtl/uart/ubus.v(52)
  not u44 (n0[13], ubus_wdata[13]);  // src/rtl/uart/ubus.v(52)
  not u45 (n0[14], ubus_wdata[14]);  // src/rtl/uart/ubus.v(52)
  not u46 (n0[15], ubus_wdata[15]);  // src/rtl/uart/ubus.v(52)
  not u5 (n26[0], led[0]);  // src/rtl/uart/ubus.v(72)
  AL_MUX u6 (
    .i0(start),
    .i1(ubus_wdata[0]),
    .sel(n3),
    .o(n13));  // src/rtl/uart/ubus.v(60)
  AL_MUX u7 (
    .i0(1'b0),
    .i1(n13),
    .sel(ubus_wen),
    .o(n22));  // src/rtl/uart/ubus.v(63)
  or u8 (n34, n38, n37);  // src/rtl/uart/ubus.v(78)
  or u9 (n31, n5, n4);  // src/rtl/uart/ubus.v(60)
  AL_DFF ubus_bken_reg (
    .clk(clk),
    .d(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_bken));  // src/rtl/uart/ubus.v(86)

endmodule 

module uprotocol  // src/rtl/uart/uprotocol.v(13)
  (
  clk,
  rx_data,
  rx_en,
  tx_ready,
  ubus_bken,
  ubus_rdata,
  tx_data,
  tx_en,
  ubus_raddr,
  ubus_ren,
  ubus_waddr,
  ubus_wdata,
  ubus_wen
  );

  input clk;  // src/rtl/uart/uprotocol.v(18)
  input [7:0] rx_data;  // src/rtl/uart/uprotocol.v(22)
  input rx_en;  // src/rtl/uart/uprotocol.v(21)
  input tx_ready;  // src/rtl/uart/uprotocol.v(27)
  input ubus_bken;  // src/rtl/uart/uprotocol.v(37)
  input [31:0] ubus_rdata;  // src/rtl/uart/uprotocol.v(38)
  output [7:0] tx_data;  // src/rtl/uart/uprotocol.v(26)
  output tx_en;  // src/rtl/uart/uprotocol.v(25)
  output [31:0] ubus_raddr;  // src/rtl/uart/uprotocol.v(36)
  output ubus_ren;  // src/rtl/uart/uprotocol.v(35)
  output [31:0] ubus_waddr;  // src/rtl/uart/uprotocol.v(31)
  output [31:0] ubus_wdata;  // src/rtl/uart/uprotocol.v(32)
  output ubus_wen;  // src/rtl/uart/uprotocol.v(30)

  parameter CLK_RATE = 50000000;
  // localparam HEAD_0 = "A";
  // localparam HEAD_1 = "B";
  // localparam HEAD_2 = "C";
  // localparam HEAD_3 = "D";
  // localparam HEAD_4 = "E";
  // localparam HEAD_5 = "F";
  wire [31:0] auto_rst_cnt;  // src/rtl/uart/uprotocol.v(51)
  wire [7:0] n10;
  wire [7:0] n11;
  wire [7:0] n12;
  wire [7:0] n13;
  wire [7:0] n14;
  wire [7:0] n15;
  wire [31:0] n4;
  wire [31:0] n5;
  wire [2:0] n54;
  wire [2:0] n55;
  wire [2:0] n56;
  wire [2:0] n57;
  wire [31:0] n6;
  wire [31:0] n63;
  wire [31:0] n65;
  wire [31:0] n66;
  wire [31:0] n67;
  wire [31:0] n68;
  wire [2:0] n78;
  wire [2:0] n79;
  wire [7:0] n8;
  wire [3:0] n83;
  wire [3:0] n84;
  wire [3:0] n85;
  wire [3:0] n86;
  wire [7:0] n88;
  wire [7:0] n9;
  wire [2:0] recv_cnt;  // src/rtl/uart/uprotocol.v(77)
  wire [7:0] reg0_al_b0;  // src/rtl/uart/uprotocol.v(52)
  wire [7:0] reg1_al_b1;  // src/rtl/uart/uprotocol.v(53)
  wire [7:0] reg2_al_b2;  // src/rtl/uart/uprotocol.v(54)
  wire [7:0] reg3_al_b3;  // src/rtl/uart/uprotocol.v(55)
  wire [7:0] reg4_al_b4;  // src/rtl/uart/uprotocol.v(56)
  wire [7:0] reg5_al_b5;  // src/rtl/uart/uprotocol.v(57)
  wire [7:0] reg6_al_b6;  // src/rtl/uart/uprotocol.v(58)
  wire [7:0] reg7_al_b7;  // src/rtl/uart/uprotocol.v(59)
  wire [3:0] send_cnt;  // src/rtl/uart/uprotocol.v(84)
  wire [31:0] tx_buffer0;  // src/rtl/uart/uprotocol.v(85)
  wire [31:0] tx_buffer1;  // src/rtl/uart/uprotocol.v(86)
  wire [2:0] tx_ready_cnt;  // src/rtl/uart/uprotocol.v(83)
  wire auto_rst;  // src/rtl/uart/uprotocol.v(50)
  wire n0;
  wire n1;
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
  wire n50;
  wire n51;
  wire n52;
  wire n53;
  wire n58;
  wire n59;
  wire n60;
  wire n61;
  wire n62;
  wire n64;
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
  wire n80;
  wire n81;
  wire n82;
  wire n87;
  wire rd_flag;  // src/rtl/uart/uprotocol.v(69)
  wire rd_flag0;  // src/rtl/uart/uprotocol.v(70)
  wire rd_flag1;  // src/rtl/uart/uprotocol.v(71)
  wire rd_flag2;  // src/rtl/uart/uprotocol.v(72)
  wire rd_flag3;  // src/rtl/uart/uprotocol.v(73)
  wire rd_flag4;  // src/rtl/uart/uprotocol.v(74)
  wire rd_flag5;  // src/rtl/uart/uprotocol.v(75)
  wire rd_mode;  // src/rtl/uart/uprotocol.v(60)
  wire recv_flag;  // src/rtl/uart/uprotocol.v(78)
  wire recv_state;  // src/rtl/uart/uprotocol.v(76)
  wire send_finish;  // src/rtl/uart/uprotocol.v(80)
  wire send_flag;  // src/rtl/uart/uprotocol.v(81)
  wire send_start;  // src/rtl/uart/uprotocol.v(79)
  wire tx_ready_flag;  // src/rtl/uart/uprotocol.v(82)
  wire wt_flag;  // src/rtl/uart/uprotocol.v(62)
  wire wt_flag0;  // src/rtl/uart/uprotocol.v(63)
  wire wt_flag1;  // src/rtl/uart/uprotocol.v(64)
  wire wt_flag2;  // src/rtl/uart/uprotocol.v(65)
  wire wt_flag3;  // src/rtl/uart/uprotocol.v(66)
  wire wt_flag4;  // src/rtl/uart/uprotocol.v(67)
  wire wt_flag5;  // src/rtl/uart/uprotocol.v(68)
  wire wt_mode;  // src/rtl/uart/uprotocol.v(61)

  add_pu32_pu32_o32 add0 (
    .i0(auto_rst_cnt),
    .i1(32'b00000000000000000000000000000001),
    .o(n4));  // src/rtl/uart/uprotocol.v(98)
  add_pu3_pu3_o3 add1 (
    .i0(recv_cnt),
    .i1(3'b001),
    .o(n54));  // src/rtl/uart/uprotocol.v(202)
  add_pu3_pu3_o3 add2 (
    .i0(tx_ready_cnt),
    .i1(3'b001),
    .o(n78));  // src/rtl/uart/uprotocol.v(275)
  add_pu4_pu4_o4 add3 (
    .i0(send_cnt),
    .i1(4'b0001),
    .o(n83));  // src/rtl/uart/uprotocol.v(294)
  AL_DFF auto_rst_reg (
    .clk(clk),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(auto_rst));  // src/rtl/uart/uprotocol.v(105)
  eq_w32 eq0 (
    .i0(auto_rst_cnt),
    .i1(32'b00000010111110101111000001111111),
    .o(n2));  // src/rtl/uart/uprotocol.v(95)
  eq_w8 eq1 (
    .i0(reg5_al_b5),
    .i1(8'b01000001),
    .o(n17));  // src/rtl/uart/uprotocol.v(130)
  eq_w8 eq10 (
    .i0(reg2_al_b2),
    .i1(8'b01000011),
    .o(n34));  // src/rtl/uart/uprotocol.v(153)
  eq_w8 eq11 (
    .i0(reg1_al_b1),
    .i1(8'b01000010),
    .o(n35));  // src/rtl/uart/uprotocol.v(154)
  eq_w8 eq12 (
    .i0(reg0_al_b0),
    .i1(8'b01000001),
    .o(n36));  // src/rtl/uart/uprotocol.v(155)
  eq_w3 eq13 (
    .i0(recv_cnt),
    .i1(3'b110),
    .o(n58));  // src/rtl/uart/uprotocol.v(208)
  eq_w4 eq14 (
    .i0(send_cnt),
    .i1(4'b1110),
    .o(n72));  // src/rtl/uart/uprotocol.v(267)
  eq_w8 eq2 (
    .i0(reg4_al_b4),
    .i1(8'b01000010),
    .o(n18));  // src/rtl/uart/uprotocol.v(131)
  eq_w8 eq3 (
    .i0(reg3_al_b3),
    .i1(8'b01000011),
    .o(n19));  // src/rtl/uart/uprotocol.v(132)
  eq_w8 eq4 (
    .i0(reg2_al_b2),
    .i1(8'b01000100),
    .o(n20));  // src/rtl/uart/uprotocol.v(133)
  eq_w8 eq5 (
    .i0(reg1_al_b1),
    .i1(8'b01000101),
    .o(n21));  // src/rtl/uart/uprotocol.v(134)
  eq_w8 eq6 (
    .i0(reg0_al_b0),
    .i1(8'b01000110),
    .o(n22));  // src/rtl/uart/uprotocol.v(135)
  eq_w8 eq7 (
    .i0(reg5_al_b5),
    .i1(8'b01000110),
    .o(n31));  // src/rtl/uart/uprotocol.v(150)
  eq_w8 eq8 (
    .i0(reg4_al_b4),
    .i1(8'b01000101),
    .o(n32));  // src/rtl/uart/uprotocol.v(151)
  eq_w8 eq9 (
    .i0(reg3_al_b3),
    .i1(8'b01000100),
    .o(n33));  // src/rtl/uart/uprotocol.v(152)
  binary_mux_s1_w32 mux0 (
    .i0(n4),
    .i1(32'b00000000000000000000000000000000),
    .sel(n2),
    .o(n5));  // src/rtl/uart/uprotocol.v(98)
  binary_mux_s1_w32 mux1 (
    .i0(n5),
    .i1(32'b00000000000000000000000000000000),
    .sel(n1),
    .o(n6));  // src/rtl/uart/uprotocol.v(98)
  binary_mux_s1_w3 mux10 (
    .i0(recv_cnt),
    .i1(n54),
    .sel(rx_en),
    .o(n55));  // src/rtl/uart/uprotocol.v(202)
  binary_mux_s1_w3 mux11 (
    .i0(3'b000),
    .i1(n55),
    .sel(recv_state),
    .o(n56));  // src/rtl/uart/uprotocol.v(202)
  binary_mux_s1_w3 mux12 (
    .i0(n56),
    .i1(3'b000),
    .sel(auto_rst),
    .o(n57));  // src/rtl/uart/uprotocol.v(202)
  binary_mux_s1_w32 mux13 (
    .i0(ubus_raddr),
    .i1({reg4_al_b4,reg5_al_b5,reg6_al_b6,reg7_al_b7}),
    .sel(n60),
    .o(n63));  // src/rtl/uart/uprotocol.v(222)
  binary_mux_s1_w32 mux14 (
    .i0(ubus_waddr),
    .i1({reg4_al_b4,reg5_al_b5,reg6_al_b6,reg7_al_b7}),
    .sel(n61),
    .o(n65));  // src/rtl/uart/uprotocol.v(232)
  binary_mux_s1_w32 mux15 (
    .i0(ubus_wdata),
    .i1({reg0_al_b0,reg1_al_b1,reg2_al_b2,reg3_al_b3}),
    .sel(n61),
    .o(n66));  // src/rtl/uart/uprotocol.v(232)
  binary_mux_s1_w32 mux16 (
    .i0(tx_buffer0),
    .i1(ubus_raddr),
    .sel(ubus_ren),
    .o(n67));  // src/rtl/uart/uprotocol.v(242)
  binary_mux_s1_w32 mux17 (
    .i0(tx_buffer1),
    .i1(ubus_rdata),
    .sel(ubus_bken),
    .o(n68));  // src/rtl/uart/uprotocol.v(246)
  binary_mux_s1_w3 mux18 (
    .i0(3'b000),
    .i1(n78),
    .sel(tx_ready),
    .o(n79));  // src/rtl/uart/uprotocol.v(277)
  binary_mux_s1_w4 mux19 (
    .i0(send_cnt),
    .i1(n83),
    .sel(n81),
    .o(n84));  // src/rtl/uart/uprotocol.v(294)
  binary_mux_s1_w8 mux2 (
    .i0(reg0_al_b0),
    .i1(rx_data),
    .sel(rx_en),
    .o(n8));  // src/rtl/uart/uprotocol.v(122)
  binary_mux_s1_w4 mux20 (
    .i0(n84),
    .i1(4'b0000),
    .sel(send_finish),
    .o(n85));  // src/rtl/uart/uprotocol.v(294)
  binary_mux_s1_w4 mux21 (
    .i0(n85),
    .i1(4'b0000),
    .sel(auto_rst),
    .o(n86));  // src/rtl/uart/uprotocol.v(294)
  binary_mux_s4_w8 mux22 (
    .i0(tx_data),
    .i1(8'b01000001),
    .i10(tx_buffer0[31:24]),
    .i11(tx_buffer1[7:0]),
    .i12(tx_buffer1[15:8]),
    .i13(tx_buffer1[23:16]),
    .i14(tx_buffer1[31:24]),
    .i15(tx_data),
    .i2(8'b01000010),
    .i3(8'b01000011),
    .i4(8'b01000100),
    .i5(8'b01000101),
    .i6(8'b01000110),
    .i7(tx_buffer0[7:0]),
    .i8(tx_buffer0[15:8]),
    .i9(tx_buffer0[23:16]),
    .sel(send_cnt),
    .o(n88));  // src/rtl/uart/uprotocol.v(322)
  binary_mux_s1_w8 mux3 (
    .i0(reg1_al_b1),
    .i1(reg0_al_b0),
    .sel(rx_en),
    .o(n9));  // src/rtl/uart/uprotocol.v(122)
  binary_mux_s1_w8 mux4 (
    .i0(reg2_al_b2),
    .i1(reg1_al_b1),
    .sel(rx_en),
    .o(n10));  // src/rtl/uart/uprotocol.v(122)
  binary_mux_s1_w8 mux5 (
    .i0(reg3_al_b3),
    .i1(reg2_al_b2),
    .sel(rx_en),
    .o(n11));  // src/rtl/uart/uprotocol.v(122)
  binary_mux_s1_w8 mux6 (
    .i0(reg4_al_b4),
    .i1(reg3_al_b3),
    .sel(rx_en),
    .o(n12));  // src/rtl/uart/uprotocol.v(122)
  binary_mux_s1_w8 mux7 (
    .i0(reg5_al_b5),
    .i1(reg4_al_b4),
    .sel(rx_en),
    .o(n13));  // src/rtl/uart/uprotocol.v(122)
  binary_mux_s1_w8 mux8 (
    .i0(reg6_al_b6),
    .i1(reg5_al_b5),
    .sel(rx_en),
    .o(n14));  // src/rtl/uart/uprotocol.v(122)
  binary_mux_s1_w8 mux9 (
    .i0(reg7_al_b7),
    .i1(reg6_al_b6),
    .sel(rx_en),
    .o(n15));  // src/rtl/uart/uprotocol.v(122)
  AL_DFF rd_flag0_reg (
    .clk(clk),
    .d(n37),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag0));  // src/rtl/uart/uprotocol.v(157)
  AL_DFF rd_flag1_reg (
    .clk(clk),
    .d(n38),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag1));  // src/rtl/uart/uprotocol.v(157)
  AL_DFF rd_flag2_reg (
    .clk(clk),
    .d(n39),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag2));  // src/rtl/uart/uprotocol.v(157)
  AL_DFF rd_flag3_reg (
    .clk(clk),
    .d(n40),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag3));  // src/rtl/uart/uprotocol.v(157)
  AL_DFF rd_flag4_reg (
    .clk(clk),
    .d(n41),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag4));  // src/rtl/uart/uprotocol.v(157)
  AL_DFF rd_flag5_reg (
    .clk(clk),
    .d(n42),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag5));  // src/rtl/uart/uprotocol.v(157)
  AL_DFF rd_flag_reg (
    .clk(clk),
    .d(n43),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag));  // src/rtl/uart/uprotocol.v(163)
  AL_DFF rd_mode_reg (
    .clk(clk),
    .d(n45),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_mode));  // src/rtl/uart/uprotocol.v(172)
  AL_DFF recv_flag_reg (
    .clk(clk),
    .d(n59),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_flag));  // src/rtl/uart/uprotocol.v(209)
  AL_DFF recv_state_reg (
    .clk(clk),
    .d(n51),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_state));  // src/rtl/uart/uprotocol.v(192)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n8),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(reg0_al_b0));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w8 reg1 (
    .clk(clk),
    .d(n9),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(reg1_al_b1));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w32 reg10 (
    .clk(clk),
    .d(n65),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(ubus_waddr));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w32 reg11 (
    .clk(clk),
    .d(n66),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(ubus_wdata));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w32 reg12 (
    .clk(clk),
    .d(n67),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(tx_buffer0));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w32 reg13 (
    .clk(clk),
    .d(n68),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(tx_buffer1));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w3 reg14 (
    .clk(clk),
    .d(n79),
    .reset(3'b000),
    .set(3'b000),
    .q(tx_ready_cnt));  // src/rtl/uart/uprotocol.v(278)
  reg_ar_as_w4 reg15 (
    .clk(clk),
    .d(n86),
    .reset(4'b0000),
    .set(4'b0000),
    .q(send_cnt));  // src/rtl/uart/uprotocol.v(295)
  reg_ar_as_w8 reg16 (
    .clk(clk),
    .d(n88),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(tx_data));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w32 reg17 (
    .clk(clk),
    .d(n6),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(auto_rst_cnt));  // src/rtl/uart/uprotocol.v(99)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n10),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(reg2_al_b2));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n11),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(reg3_al_b3));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w8 reg4 (
    .clk(clk),
    .d(n12),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(reg4_al_b4));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w8 reg5 (
    .clk(clk),
    .d(n13),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(reg5_al_b5));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w8 reg6 (
    .clk(clk),
    .d(n14),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(reg6_al_b6));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w8 reg7 (
    .clk(clk),
    .d(n15),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(reg7_al_b7));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w3 reg8 (
    .clk(clk),
    .d(n57),
    .reset(3'b000),
    .set(3'b000),
    .q(recv_cnt));  // src/rtl/uart/uprotocol.v(203)
  reg_ar_as_w32 reg9 (
    .clk(clk),
    .d(n63),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(ubus_raddr));  // src/rtl/uart/uprotocol.v(223)
  AL_DFF send_finish_reg (
    .clk(clk),
    .d(n76),
    .reset(1'b0),
    .set(1'b0),
    .q(send_finish));  // src/rtl/uart/uprotocol.v(269)
  AL_DFF send_flag_reg (
    .clk(clk),
    .d(n81),
    .reset(1'b0),
    .set(1'b0),
    .q(send_flag));  // src/rtl/uart/uprotocol.v(302)
  AL_DFF send_start_reg (
    .clk(clk),
    .d(n71),
    .reset(1'b0),
    .set(1'b0),
    .q(send_start));  // src/rtl/uart/uprotocol.v(258)
  AL_DFF tx_en_reg (
    .clk(clk),
    .d(send_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_en));  // src/rtl/uart/uprotocol.v(302)
  AL_DFF tx_ready_flag_reg (
    .clk(clk),
    .d(n80),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_ready_flag));  // src/rtl/uart/uprotocol.v(284)
  AL_MUX u10 (
    .i0(wt_flag3),
    .i1(n20),
    .sel(n16),
    .o(n26));  // src/rtl/uart/uprotocol.v(136)
  AL_MUX u11 (
    .i0(wt_flag4),
    .i1(n21),
    .sel(n16),
    .o(n27));  // src/rtl/uart/uprotocol.v(136)
  AL_MUX u12 (
    .i0(wt_flag5),
    .i1(n22),
    .sel(n16),
    .o(n28));  // src/rtl/uart/uprotocol.v(136)
  and u13 (n30, rd_flag2, rd_flag1);  // src/rtl/uart/uprotocol.v(162)
  AL_MUX u14 (
    .i0(rd_flag0),
    .i1(n31),
    .sel(n16),
    .o(n37));  // src/rtl/uart/uprotocol.v(156)
  AL_MUX u15 (
    .i0(rd_flag1),
    .i1(n32),
    .sel(n16),
    .o(n38));  // src/rtl/uart/uprotocol.v(156)
  AL_MUX u16 (
    .i0(rd_flag2),
    .i1(n33),
    .sel(n16),
    .o(n39));  // src/rtl/uart/uprotocol.v(156)
  AL_MUX u17 (
    .i0(rd_flag3),
    .i1(n34),
    .sel(n16),
    .o(n40));  // src/rtl/uart/uprotocol.v(156)
  AL_MUX u18 (
    .i0(rd_flag4),
    .i1(n35),
    .sel(n16),
    .o(n41));  // src/rtl/uart/uprotocol.v(156)
  AL_MUX u19 (
    .i0(rd_flag5),
    .i1(n36),
    .sel(n16),
    .o(n42));  // src/rtl/uart/uprotocol.v(156)
  and u2 (n77, wt_flag5, n82);  // src/rtl/uart/uprotocol.v(142)
  and u20 (n82, wt_flag4, wt_flag3);  // src/rtl/uart/uprotocol.v(142)
  AL_MUX u21 (
    .i0(rd_mode),
    .i1(1'b1),
    .sel(rd_flag),
    .o(n44));  // src/rtl/uart/uprotocol.v(171)
  AL_MUX u22 (
    .i0(n44),
    .i1(1'b0),
    .sel(recv_flag),
    .o(n45));  // src/rtl/uart/uprotocol.v(171)
  AL_MUX u23 (
    .i0(wt_mode),
    .i1(1'b1),
    .sel(wt_flag),
    .o(n46));  // src/rtl/uart/uprotocol.v(180)
  AL_MUX u24 (
    .i0(n46),
    .i1(1'b0),
    .sel(recv_flag),
    .o(n47));  // src/rtl/uart/uprotocol.v(180)
  or u25 (n48, wt_flag, rd_flag);  // src/rtl/uart/uprotocol.v(188)
  AL_MUX u26 (
    .i0(recv_state),
    .i1(1'b0),
    .sel(recv_flag),
    .o(n49));  // src/rtl/uart/uprotocol.v(191)
  AL_MUX u27 (
    .i0(n49),
    .i1(1'b1),
    .sel(n48),
    .o(n50));  // src/rtl/uart/uprotocol.v(191)
  AL_MUX u28 (
    .i0(n50),
    .i1(1'b0),
    .sel(auto_rst),
    .o(n51));  // src/rtl/uart/uprotocol.v(191)
  and u29 (n52, n30, n7);  // src/rtl/uart/uprotocol.v(162)
  and u3 (n43, n62, n52);  // src/rtl/uart/uprotocol.v(162)
  and u30 (n59, rx_en, n58);  // src/rtl/uart/uprotocol.v(208)
  and u31 (n60, recv_flag, rd_mode);  // src/rtl/uart/uprotocol.v(214)
  and u32 (n61, recv_flag, wt_mode);  // src/rtl/uart/uprotocol.v(215)
  and u33 (n62, rd_flag5, n64);  // src/rtl/uart/uprotocol.v(162)
  and u34 (n80, tx_ready_cnt[0], n87);  // src/rtl/uart/uprotocol.v(283)
  AL_MUX u35 (
    .i0(send_start),
    .i1(1'b0),
    .sel(send_finish),
    .o(n69));  // src/rtl/uart/uprotocol.v(257)
  AL_MUX u36 (
    .i0(n69),
    .i1(1'b1),
    .sel(ubus_bken),
    .o(n70));  // src/rtl/uart/uprotocol.v(257)
  AL_MUX u37 (
    .i0(n70),
    .i1(1'b0),
    .sel(auto_rst),
    .o(n71));  // src/rtl/uart/uprotocol.v(257)
  and u38 (n73, tx_en, n72);  // src/rtl/uart/uprotocol.v(267)
  AL_MUX u39 (
    .i0(send_finish),
    .i1(1'b1),
    .sel(n73),
    .o(n74));  // src/rtl/uart/uprotocol.v(268)
  or u4 (n1, rx_en, tx_en);  // src/rtl/uart/uprotocol.v(93)
  AL_MUX u40 (
    .i0(n74),
    .i1(1'b0),
    .sel(ubus_ren),
    .o(n75));  // src/rtl/uart/uprotocol.v(268)
  AL_MUX u41 (
    .i0(n75),
    .i1(1'b1),
    .sel(auto_rst),
    .o(n76));  // src/rtl/uart/uprotocol.v(268)
  and u42 (n64, rd_flag4, rd_flag3);  // src/rtl/uart/uprotocol.v(162)
  and u43 (n81, send_start, tx_ready_flag);  // src/rtl/uart/uprotocol.v(293)
  and u44 (n87, tx_ready_cnt[1], tx_ready_cnt[2]);  // src/rtl/uart/uprotocol.v(283)
  and u45 (n53, wt_flag2, wt_flag1);  // src/rtl/uart/uprotocol.v(142)
  and u46 (n3, wt_flag0, rx_en);  // src/rtl/uart/uprotocol.v(142)
  and u47 (n0, n53, n3);  // src/rtl/uart/uprotocol.v(142)
  and u48 (n29, n77, n0);  // src/rtl/uart/uprotocol.v(142)
  and u5 (n7, rd_flag0, rx_en);  // src/rtl/uart/uprotocol.v(162)
  not u6 (n16, recv_state);  // src/rtl/uart/uprotocol.v(128)
  AL_MUX u7 (
    .i0(wt_flag0),
    .i1(n17),
    .sel(n16),
    .o(n23));  // src/rtl/uart/uprotocol.v(136)
  AL_MUX u8 (
    .i0(wt_flag1),
    .i1(n18),
    .sel(n16),
    .o(n24));  // src/rtl/uart/uprotocol.v(136)
  AL_MUX u9 (
    .i0(wt_flag2),
    .i1(n19),
    .sel(n16),
    .o(n25));  // src/rtl/uart/uprotocol.v(136)
  AL_DFF ubus_ren_reg (
    .clk(clk),
    .d(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_ren));  // src/rtl/uart/uprotocol.v(216)
  AL_DFF ubus_wen_reg (
    .clk(clk),
    .d(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wen));  // src/rtl/uart/uprotocol.v(216)
  AL_DFF wt_flag0_reg (
    .clk(clk),
    .d(n23),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag0));  // src/rtl/uart/uprotocol.v(137)
  AL_DFF wt_flag1_reg (
    .clk(clk),
    .d(n24),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag1));  // src/rtl/uart/uprotocol.v(137)
  AL_DFF wt_flag2_reg (
    .clk(clk),
    .d(n25),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag2));  // src/rtl/uart/uprotocol.v(137)
  AL_DFF wt_flag3_reg (
    .clk(clk),
    .d(n26),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag3));  // src/rtl/uart/uprotocol.v(137)
  AL_DFF wt_flag4_reg (
    .clk(clk),
    .d(n27),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag4));  // src/rtl/uart/uprotocol.v(137)
  AL_DFF wt_flag5_reg (
    .clk(clk),
    .d(n28),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag5));  // src/rtl/uart/uprotocol.v(137)
  AL_DFF wt_flag_reg (
    .clk(clk),
    .d(n29),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag));  // src/rtl/uart/uprotocol.v(143)
  AL_DFF wt_mode_reg (
    .clk(clk),
    .d(n47),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_mode));  // src/rtl/uart/uprotocol.v(181)

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

module eq_w7
  (
  i0,
  i1,
  o
  );

  input [6:0] i0;
  input [6:0] i1;
  output o;



endmodule 

module binary_mux_s1_w10
  (
  i0,
  i1,
  sel,
  o
  );

  input [9:0] i0;
  input [9:0] i1;
  input sel;
  output [9:0] o;



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

module reg_ar_as_w7
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [6:0] d;
  input en;
  input [6:0] reset;
  input [6:0] set;
  output [6:0] q;



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

module eq_w29
  (
  i0,
  i1,
  o
  );

  input [28:0] i0;
  input [28:0] i1;
  output o;



endmodule 

module lt_u29_u29
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [28:0] i0;
  input [28:0] i1;
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

module reg_ar_as_w29
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [28:0] d;
  input en;
  input [28:0] reset;
  input [28:0] set;
  output [28:0] q;



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

module lt_u7_u7
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [6:0] i0;
  input [6:0] i1;
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

module eq_w1
  (
  i0,
  i1,
  o
  );

  input i0;
  input i1;
  output o;



endmodule 

module binary_mux_s1_w40
  (
  i0,
  i1,
  sel,
  o
  );

  input [39:0] i0;
  input [39:0] i1;
  input sel;
  output [39:0] o;



endmodule 

module reg_ar_as_w40
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [39:0] d;
  input en;
  input [39:0] reset;
  input [39:0] set;
  output [39:0] q;



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

module onehot_mux_s7_w16
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  sel,
  o
  );

  input [15:0] i0;
  input [15:0] i1;
  input [15:0] i2;
  input [15:0] i3;
  input [15:0] i4;
  input [15:0] i5;
  input [15:0] i6;
  input [6:0] sel;
  output [15:0] o;



endmodule 

module onehot_mux_s7_w4
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  sel,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  input [3:0] i2;
  input [3:0] i3;
  input [3:0] i4;
  input [3:0] i5;
  input [3:0] i6;
  input [6:0] sel;
  output [3:0] o;



endmodule 

module onehot_mux_s7_w3
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  sel,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  input [2:0] i2;
  input [2:0] i3;
  input [2:0] i4;
  input [2:0] i5;
  input [2:0] i6;
  input [6:0] sel;
  output [2:0] o;



endmodule 

module onehot_mux_s7_w24
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  sel,
  o
  );

  input [23:0] i0;
  input [23:0] i1;
  input [23:0] i2;
  input [23:0] i3;
  input [23:0] i4;
  input [23:0] i5;
  input [23:0] i6;
  input [6:0] sel;
  output [23:0] o;



endmodule 

module onehot_mux_s7_w8
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
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
  input [6:0] sel;
  output [7:0] o;



endmodule 

module onehot_mux_s5_w32
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input [31:0] i2;
  input [31:0] i3;
  input [31:0] i4;
  input [4:0] sel;
  output [31:0] o;



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

