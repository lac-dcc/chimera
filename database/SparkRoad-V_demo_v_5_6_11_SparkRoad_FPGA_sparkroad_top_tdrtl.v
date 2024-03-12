// Verilog netlist created by TD v4.6.12906
// Fri Aug  9 20:06:11 2019

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
  wire [17:0] \u_tube_dri/cnt_w ;  // src/rtl/tube/tube_dri.v(33)
  wire [17:0] \u_tube_dri/n1 ;
  wire [3:0] \u_tube_dri/n2 ;
  wire [3:0] \u_tube_dri/sm_seg_num ;  // src/rtl/tube/tube_dri.v(36)
  wire [3:0] \u_tube_dri/ux_rst/cnt ;  // src/rtl/tube/rst.v(20)
  wire [3:0] \u_tube_dri/ux_rst/n1 ;
  wire busy;  // src/rtl/top.v(45)
  wire start;  // src/rtl/top.v(36)
  wire \u_tube_dri/cnt_w[16]_neg ;
  wire \u_tube_dri/cnt_w[17]_neg ;
  wire \u_tube_dri/mux1_b0_sel_is_0_o ;
  wire \u_tube_dri/mux1_b1_sel_is_1_o ;
  wire \u_tube_dri/mux1_b2_sel_is_2_o ;
  wire \u_tube_dri/mux1_b3_sel_is_3_o ;
  wire \u_tube_dri/mux2_b2_sel_is_2_o ;
  wire \u_tube_dri/rst_n ;  // src/rtl/tube/tube_dri.v(30)
  wire \u_tube_dri/sm_seg_num[0]_neg ;
  wire \u_tube_dri/sm_seg_num[2]_neg ;
  wire \u_tube_dri/sm_seg_num[3]_neg ;
  wire \u_tube_dri/ux_rst/n0 ;

  assign tube[7] = 1'b1;
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
  add_pu18_pu18_o18 \u_tube_dri/add0  (
    .i0(\u_tube_dri/cnt_w ),
    .i1(18'b000000000000000001),
    .o(\u_tube_dri/n1 ));  // src/rtl/tube/tube_dri.v(61)
  not \u_tube_dri/cnt_w[16]_inv  (\u_tube_dri/cnt_w[16]_neg , \u_tube_dri/cnt_w [16]);
  not \u_tube_dri/cnt_w[17]_inv  (\u_tube_dri/cnt_w[17]_neg , \u_tube_dri/cnt_w [17]);
  binary_mux_s2_w1 \u_tube_dri/mux0_b0  (
    .i0(sm_bit1_num[0]),
    .i1(sm_bit2_num[0]),
    .i2(sm_bit3_num[0]),
    .i3(sm_bit4_num[0]),
    .sel(\u_tube_dri/cnt_w [17:16]),
    .o(\u_tube_dri/n2 [0]));  // src/rtl/tube/tube_dri.v(75)
  binary_mux_s2_w1 \u_tube_dri/mux0_b1  (
    .i0(sm_bit1_num[1]),
    .i1(sm_bit2_num[1]),
    .i2(sm_bit3_num[1]),
    .i3(sm_bit4_num[1]),
    .sel(\u_tube_dri/cnt_w [17:16]),
    .o(\u_tube_dri/n2 [1]));  // src/rtl/tube/tube_dri.v(75)
  binary_mux_s2_w1 \u_tube_dri/mux0_b2  (
    .i0(sm_bit1_num[2]),
    .i1(sm_bit2_num[2]),
    .i2(sm_bit3_num[2]),
    .i3(sm_bit4_num[2]),
    .sel(\u_tube_dri/cnt_w [17:16]),
    .o(\u_tube_dri/n2 [2]));  // src/rtl/tube/tube_dri.v(75)
  binary_mux_s2_w1 \u_tube_dri/mux0_b3  (
    .i0(sm_bit1_num[3]),
    .i1(sm_bit2_num[3]),
    .i2(sm_bit3_num[3]),
    .i3(sm_bit4_num[3]),
    .sel(\u_tube_dri/cnt_w [17:16]),
    .o(\u_tube_dri/n2 [3]));  // src/rtl/tube/tube_dri.v(75)
  and \u_tube_dri/mux1_b0_sel_is_0  (\u_tube_dri/mux1_b0_sel_is_0_o , \u_tube_dri/cnt_w[16]_neg , \u_tube_dri/cnt_w[17]_neg );
  and \u_tube_dri/mux1_b1_sel_is_1  (\u_tube_dri/mux1_b1_sel_is_1_o , \u_tube_dri/cnt_w [16], \u_tube_dri/cnt_w[17]_neg );
  and \u_tube_dri/mux1_b2_sel_is_2  (\u_tube_dri/mux1_b2_sel_is_2_o , \u_tube_dri/cnt_w[16]_neg , \u_tube_dri/cnt_w [17]);
  and \u_tube_dri/mux1_b3_sel_is_3  (\u_tube_dri/mux1_b3_sel_is_3_o , \u_tube_dri/cnt_w [16], \u_tube_dri/cnt_w [17]);
  binary_mux_s4_w1 \u_tube_dri/mux2_b0  (
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
    .sel(\u_tube_dri/sm_seg_num ),
    .o(tube[0]));  // src/rtl/tube/tube_dri.v(118)
  binary_mux_s4_w1 \u_tube_dri/mux2_b1  (
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
    .sel(\u_tube_dri/sm_seg_num ),
    .o(tube[1]));  // src/rtl/tube/tube_dri.v(118)
  AL_MUX \u_tube_dri/mux2_b2  (
    .i0(1'b0),
    .i1(1'b1),
    .sel(\u_tube_dri/mux2_b2_sel_is_2_o ),
    .o(tube[2]));
  and \u_tube_dri/mux2_b2_sel_is_2  (\u_tube_dri/mux2_b2_sel_is_2_o , \u_tube_dri/sm_seg_num[0]_neg , \u_tube_dri/sm_seg_num [1], \u_tube_dri/sm_seg_num[2]_neg , \u_tube_dri/sm_seg_num[3]_neg );
  binary_mux_s4_w1 \u_tube_dri/mux2_b3  (
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
    .sel(\u_tube_dri/sm_seg_num ),
    .o(tube[3]));  // src/rtl/tube/tube_dri.v(118)
  binary_mux_s4_w1 \u_tube_dri/mux2_b4  (
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
    .sel(\u_tube_dri/sm_seg_num ),
    .o(tube[4]));  // src/rtl/tube/tube_dri.v(118)
  binary_mux_s4_w1 \u_tube_dri/mux2_b5  (
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
    .sel(\u_tube_dri/sm_seg_num ),
    .o(tube[5]));  // src/rtl/tube/tube_dri.v(118)
  binary_mux_s4_w1 \u_tube_dri/mux2_b6  (
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
    .sel(\u_tube_dri/sm_seg_num ),
    .o(tube[6]));  // src/rtl/tube/tube_dri.v(118)
  reg_ar_as_w1 \u_tube_dri/reg0_b0  (
    .clk(sclk),
    .d(\u_tube_dri/n2 [0]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/sm_seg_num [0]));  // src/rtl/tube/tube_dri.v(76)
  reg_ar_as_w1 \u_tube_dri/reg0_b1  (
    .clk(sclk),
    .d(\u_tube_dri/n2 [1]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/sm_seg_num [1]));  // src/rtl/tube/tube_dri.v(76)
  reg_ar_as_w1 \u_tube_dri/reg0_b2  (
    .clk(sclk),
    .d(\u_tube_dri/n2 [2]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/sm_seg_num [2]));  // src/rtl/tube/tube_dri.v(76)
  reg_ar_as_w1 \u_tube_dri/reg0_b3  (
    .clk(sclk),
    .d(\u_tube_dri/n2 [3]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/sm_seg_num [3]));  // src/rtl/tube/tube_dri.v(76)
  reg_ar_as_w1 \u_tube_dri/reg1_b0  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [0]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [0]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b1  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [1]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [1]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b10  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [10]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [10]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b11  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [11]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [11]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b12  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [12]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [12]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b13  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [13]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [13]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b14  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [14]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [14]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b15  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [15]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [15]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b16  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [16]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [16]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b17  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [17]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [17]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b2  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [2]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [2]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b3  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [3]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [3]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b4  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [4]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [4]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b5  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [5]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [5]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b6  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [6]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [6]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b7  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [7]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [7]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b8  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [8]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [8]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b9  (
    .clk(sclk),
    .d(\u_tube_dri/n1 [9]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [9]));  // src/rtl/tube/tube_dri.v(61)
  reg_sr_as_w1 \u_tube_dri/reg2_b0  (
    .clk(sclk),
    .d(1'b1),
    .en(1'b1),
    .reset(\u_tube_dri/mux1_b0_sel_is_0_o ),
    .set(~\u_tube_dri/rst_n ),
    .q(tube_sel[0]));  // src/rtl/tube/tube_dri.v(91)
  reg_sr_as_w1 \u_tube_dri/reg2_b1  (
    .clk(sclk),
    .d(1'b1),
    .en(1'b1),
    .reset(\u_tube_dri/mux1_b1_sel_is_1_o ),
    .set(~\u_tube_dri/rst_n ),
    .q(tube_sel[1]));  // src/rtl/tube/tube_dri.v(91)
  reg_sr_as_w1 \u_tube_dri/reg2_b2  (
    .clk(sclk),
    .d(1'b1),
    .en(1'b1),
    .reset(\u_tube_dri/mux1_b2_sel_is_2_o ),
    .set(~\u_tube_dri/rst_n ),
    .q(tube_sel[2]));  // src/rtl/tube/tube_dri.v(91)
  reg_sr_as_w1 \u_tube_dri/reg2_b3  (
    .clk(sclk),
    .d(1'b1),
    .en(1'b1),
    .reset(\u_tube_dri/mux1_b3_sel_is_3_o ),
    .set(~\u_tube_dri/rst_n ),
    .q(tube_sel[3]));  // src/rtl/tube/tube_dri.v(91)
  not \u_tube_dri/sm_seg_num[0]_inv  (\u_tube_dri/sm_seg_num[0]_neg , \u_tube_dri/sm_seg_num [0]);
  not \u_tube_dri/sm_seg_num[2]_inv  (\u_tube_dri/sm_seg_num[2]_neg , \u_tube_dri/sm_seg_num [2]);
  not \u_tube_dri/sm_seg_num[3]_inv  (\u_tube_dri/sm_seg_num[3]_neg , \u_tube_dri/sm_seg_num [3]);
  add_pu4_pu4_o4 \u_tube_dri/ux_rst/add0  (
    .i0(\u_tube_dri/ux_rst/cnt ),
    .i1(4'b0001),
    .o(\u_tube_dri/ux_rst/n1 ));  // src/rtl/tube/rst.v(27)
  eq_w4 \u_tube_dri/ux_rst/eq0  (
    .i0(\u_tube_dri/ux_rst/cnt ),
    .i1(4'b1111),
    .o(\u_tube_dri/ux_rst/n0 ));  // src/rtl/tube/rst.v(24)
  reg_ar_ss_w1 \u_tube_dri/ux_rst/reg0_b0  (
    .clk(sclk),
    .d(\u_tube_dri/ux_rst/n1 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(\u_tube_dri/ux_rst/n0 ),
    .q(\u_tube_dri/ux_rst/cnt [0]));  // src/rtl/tube/rst.v(28)
  reg_ar_ss_w1 \u_tube_dri/ux_rst/reg0_b1  (
    .clk(sclk),
    .d(\u_tube_dri/ux_rst/n1 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(\u_tube_dri/ux_rst/n0 ),
    .q(\u_tube_dri/ux_rst/cnt [1]));  // src/rtl/tube/rst.v(28)
  reg_ar_ss_w1 \u_tube_dri/ux_rst/reg0_b2  (
    .clk(sclk),
    .d(\u_tube_dri/ux_rst/n1 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(\u_tube_dri/ux_rst/n0 ),
    .q(\u_tube_dri/ux_rst/cnt [2]));  // src/rtl/tube/rst.v(28)
  reg_ar_ss_w1 \u_tube_dri/ux_rst/reg0_b3  (
    .clk(sclk),
    .d(\u_tube_dri/ux_rst/n1 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(\u_tube_dri/ux_rst/n0 ),
    .q(\u_tube_dri/ux_rst/cnt [3]));  // src/rtl/tube/rst.v(28)
  reg_ar_as_w1 \u_tube_dri/ux_rst/rst_n_reg  (
    .clk(sclk),
    .d(\u_tube_dri/ux_rst/n0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_tube_dri/rst_n ));  // src/rtl/tube/rst.v(36)
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

  wire [9:0] \u_flash_erase/cnt ;  // src/rtl/flash/flash_erase.v(36)
  wire [6:0] \u_flash_erase/cycle_cnt ;  // src/rtl/flash/flash_erase.v(37)
  wire [9:0] \u_flash_erase/n0 ;
  wire [2:0] \u_flash_erase/phase_cnt ;  // src/rtl/flash/flash_erase.v(38)
  wire [7:0] \u_flash_erase/tx_reg ;  // src/rtl/flash/flash_erase.v(39)
  wire [9:0] \u_flash_id/cnt ;  // src/rtl/flash/flash_id.v(37)
  wire [6:0] \u_flash_id/cycle_cnt ;  // src/rtl/flash/flash_id.v(38)
  wire [9:0] \u_flash_id/n0 ;
  wire [2:0] \u_flash_id/phase_cnt ;  // src/rtl/flash/flash_id.v(39)
  wire [7:0] \u_flash_id/rx_reg ;  // src/rtl/flash/flash_id.v(41)
  wire [31:0] \u_flash_id/tx_reg ;  // src/rtl/flash/flash_id.v(40)
  wire [9:0] \u_flash_read/cnt ;  // src/rtl/flash/flash_read.v(41)
  wire [6:0] \u_flash_read/cycle_cnt ;  // src/rtl/flash/flash_read.v(42)
  wire [9:0] \u_flash_read/n0 ;
  wire [31:0] \u_flash_read/n3 ;
  wire [31:0] \u_flash_read/n4 ;
  wire [2:0] \u_flash_read/phase_cnt ;  // src/rtl/flash/flash_read.v(43)
  wire [7:0] \u_flash_read/rx_reg ;  // src/rtl/flash/flash_read.v(45)
  wire [31:0] \u_flash_read/tx_reg ;  // src/rtl/flash/flash_read.v(44)
  wire [9:0] \u_flash_sector_erase/cnt ;  // src/rtl/flash/flash_sector_erase.v(39)
  wire [6:0] \u_flash_sector_erase/cycle_cnt ;  // src/rtl/flash/flash_sector_erase.v(40)
  wire [9:0] \u_flash_sector_erase/n0 ;
  wire [31:0] \u_flash_sector_erase/n3 ;
  wire [31:0] \u_flash_sector_erase/n4 ;
  wire [2:0] \u_flash_sector_erase/phase_cnt ;  // src/rtl/flash/flash_sector_erase.v(41)
  wire [31:0] \u_flash_sector_erase/tx_reg ;  // src/rtl/flash/flash_sector_erase.v(42)
  wire [31:0] \u_flash_wait_free/cnt ;  // src/rtl/flash/flash_wait_free.v(36)
  wire [28:0] \u_flash_wait_free/cycle_cnt ;  // src/rtl/flash/flash_wait_free.v(37)
  wire [31:0] \u_flash_wait_free/n0 ;
  wire [2:0] \u_flash_wait_free/phase_cnt ;  // src/rtl/flash/flash_wait_free.v(38)
  wire [7:0] \u_flash_wait_free/rx_reg ;  // src/rtl/flash/flash_wait_free.v(40)
  wire [7:0] \u_flash_wait_free/tx_reg ;  // src/rtl/flash/flash_wait_free.v(39)
  wire [9:0] \u_flash_write/cnt ;  // src/rtl/flash/flash_write.v(40)
  wire [6:0] \u_flash_write/cycle_cnt ;  // src/rtl/flash/flash_write.v(41)
  wire [9:0] \u_flash_write/n0 ;
  wire [39:0] \u_flash_write/n3 ;
  wire [39:0] \u_flash_write/n4 ;
  wire [2:0] \u_flash_write/phase_cnt ;  // src/rtl/flash/flash_write.v(42)
  wire [39:0] \u_flash_write/tx_reg ;  // src/rtl/flash/flash_write.v(43)
  wire [9:0] \u_flash_write_enable/cnt ;  // src/rtl/flash/flash_write_enable.v(36)
  wire [6:0] \u_flash_write_enable/cycle_cnt ;  // src/rtl/flash/flash_write_enable.v(37)
  wire [9:0] \u_flash_write_enable/n0 ;
  wire [2:0] \u_flash_write_enable/phase_cnt ;  // src/rtl/flash/flash_write_enable.v(38)
  wire [7:0] \u_flash_write_enable/tx_reg ;  // src/rtl/flash/flash_write_enable.v(39)
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
  wire fls_sdi_frd;  // src/rtl/flash/flash_dri.v(88)
  wire fls_sdi_id;  // src/rtl/flash/flash_dri.v(89)
  wire fls_sdi_rd;  // src/rtl/flash/flash_dri.v(87)
  wire fls_sdi_wfree;  // src/rtl/flash/flash_dri.v(83)
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
  wire n2;
  wire n20;
  wire n21;
  wire n22;
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
  wire \u_flash_erase/n2 ;
  wire \u_flash_erase/n5 ;
  wire \u_flash_erase/n6 ;
  wire \u_flash_erase/sft_wen ;  // src/rtl/flash/flash_erase.v(40)
  wire \u_flash_id/byte_flag ;  // src/rtl/flash/flash_id.v(44)
  wire \u_flash_id/n10 ;
  wire \u_flash_id/n11 ;
  wire \u_flash_id/n12 ;
  wire \u_flash_id/n13 ;
  wire \u_flash_id/n14 ;
  wire \u_flash_id/n17 ;
  wire \u_flash_id/n2 ;
  wire \u_flash_id/n5 ;
  wire \u_flash_id/n6 ;
  wire \u_flash_id/n7 ;
  wire \u_flash_id/n8 ;
  wire \u_flash_id/n9 ;
  wire \u_flash_id/sft_ren ;  // src/rtl/flash/flash_id.v(43)
  wire \u_flash_id/sft_wen ;  // src/rtl/flash/flash_id.v(42)
  wire \u_flash_read/byte_flag ;  // src/rtl/flash/flash_read.v(48)
  wire \u_flash_read/n10 ;
  wire \u_flash_read/n11 ;
  wire \u_flash_read/n12 ;
  wire \u_flash_read/n15 ;
  wire \u_flash_read/n2 ;
  wire \u_flash_read/n5 ;
  wire \u_flash_read/n6 ;
  wire \u_flash_read/n7 ;
  wire \u_flash_read/n8 ;
  wire \u_flash_read/n9 ;
  wire \u_flash_read/sft_ren ;  // src/rtl/flash/flash_read.v(47)
  wire \u_flash_read/sft_wen ;  // src/rtl/flash/flash_read.v(46)
  wire \u_flash_sector_erase/n2 ;
  wire \u_flash_sector_erase/n5 ;
  wire \u_flash_sector_erase/n6 ;
  wire \u_flash_sector_erase/sft_wen ;  // src/rtl/flash/flash_sector_erase.v(43)
  wire \u_flash_wait_free/byte_flag ;  // src/rtl/flash/flash_wait_free.v(43)
  wire \u_flash_wait_free/fls_busy ;  // src/rtl/flash/flash_wait_free.v(44)
  wire \u_flash_wait_free/n10 ;
  wire \u_flash_wait_free/n11 ;
  wire \u_flash_wait_free/n12 ;
  wire \u_flash_wait_free/n16 ;
  wire \u_flash_wait_free/n17 ;
  wire \u_flash_wait_free/n18 ;
  wire \u_flash_wait_free/n2 ;
  wire \u_flash_wait_free/n5 ;
  wire \u_flash_wait_free/n6 ;
  wire \u_flash_wait_free/n7 ;
  wire \u_flash_wait_free/n8 ;
  wire \u_flash_wait_free/n9 ;
  wire \u_flash_wait_free/sft_ren ;  // src/rtl/flash/flash_wait_free.v(42)
  wire \u_flash_wait_free/sft_wen ;  // src/rtl/flash/flash_wait_free.v(41)
  wire \u_flash_write/n2 ;
  wire \u_flash_write/n5 ;
  wire \u_flash_write/n6 ;
  wire \u_flash_write/sft_wen ;  // src/rtl/flash/flash_write.v(44)
  wire \u_flash_write_enable/n2 ;
  wire \u_flash_write_enable/n5 ;
  wire \u_flash_write_enable/n6 ;
  wire \u_flash_write_enable/sft_wen ;  // src/rtl/flash/flash_write_enable.v(40)

  reg_ar_as_w1 busy_reg (
    .clk(clk),
    .d(n33),
    .en(1'b1),
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
  reg_ar_as_w1 fls_ncs_reg (
    .clk(clk),
    .d(n25),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs));  // src/rtl/flash/flash_dri.v(311)
  reg_ar_as_w1 fls_sck_reg (
    .clk(clk),
    .d(n24),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck));  // src/rtl/flash/flash_dri.v(296)
  reg_ar_as_w1 fls_sdi_frd_reg (
    .clk(clk),
    .d(n21),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_frd));  // src/rtl/flash/flash_dri.v(281)
  reg_ar_as_w1 fls_sdi_id_reg (
    .clk(clk),
    .d(n22),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_id));  // src/rtl/flash/flash_dri.v(281)
  reg_ar_as_w1 fls_sdi_rd_reg (
    .clk(clk),
    .d(n20),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_rd));  // src/rtl/flash/flash_dri.v(281)
  reg_ar_as_w1 fls_sdi_wfree_reg (
    .clk(clk),
    .d(n16),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_wfree));  // src/rtl/flash/flash_dri.v(281)
  reg_ar_as_w1 fls_sdo_reg (
    .clk(clk),
    .d(n26),
    .en(1'b1),
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
  reg_ar_as_w1 start_erase_reg (
    .clk(clk),
    .d(n5),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_erase));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_frd_reg (
    .clk(clk),
    .d(n11),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_frd));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_id_reg (
    .clk(clk),
    .d(n13),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_id));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_rd_reg (
    .clk(clk),
    .d(n9),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_rd));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_sector_reg (
    .clk(clk),
    .d(n15),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_sector));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_wen_reg (
    .clk(clk),
    .d(n3),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_wen));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_wfree_reg (
    .clk(clk),
    .d(n1),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_wfree));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_wr_reg (
    .clk(clk),
    .d(n7),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_wr));  // src/rtl/flash/flash_dri.v(268)
  and u10 (n16, fls_sdi, n0);  // src/rtl/flash/flash_dri.v(273)
  and u14 (n20, fls_sdi, n8);  // src/rtl/flash/flash_dri.v(277)
  and u15 (n21, fls_sdi, n10);  // src/rtl/flash/flash_dri.v(278)
  and u16 (n22, fls_sdi, n12);  // src/rtl/flash/flash_dri.v(279)
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
  add_pu10_pu10_o10 \u_flash_erase/add0  (
    .i0(\u_flash_erase/cnt ),
    .i1(10'b0000000001),
    .o(\u_flash_erase/n0 ));  // src/rtl/flash/flash_erase.v(54)
  reg_ar_ss_w1 \u_flash_erase/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_erase/n6 ),
    .reset(1'b0),
    .set(start_erase),
    .q(busy_erase));  // src/rtl/flash/flash_erase.v(120)
  eq_w3 \u_flash_erase/eq0  (
    .i0({fls_sck_erase,\u_flash_erase/phase_cnt [1:0]}),
    .i1(3'b110),
    .o(\u_flash_erase/n5 ));  // src/rtl/flash/flash_erase.v(98)
  eq_w7 \u_flash_erase/eq1  (
    .i0(\u_flash_erase/cycle_cnt ),
    .i1(7'b0001000),
    .o(\u_flash_erase/n6 ));  // src/rtl/flash/flash_erase.v(118)
  reg_ar_as_w1 \u_flash_erase/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_erase/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_erase));  // src/rtl/flash/flash_erase.v(84)
  reg_ar_as_w1 \u_flash_erase/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_erase/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_erase));  // src/rtl/flash/flash_erase.v(75)
  reg_ar_as_w1 \u_flash_erase/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_erase));  // src/rtl/flash/flash_erase.v(111)
  reg_ar_as_w1 \u_flash_erase/reg0_b0  (
    .clk(clk),
    .d(\u_flash_erase/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [0]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg0_b1  (
    .clk(clk),
    .d(\u_flash_erase/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [1]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg0_b2  (
    .clk(clk),
    .d(\u_flash_erase/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [2]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg0_b3  (
    .clk(clk),
    .d(\u_flash_erase/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [3]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg0_b4  (
    .clk(clk),
    .d(\u_flash_erase/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [4]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg0_b5  (
    .clk(clk),
    .d(\u_flash_erase/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [5]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg0_b6  (
    .clk(clk),
    .d(\u_flash_erase/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [6]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg1_b0  (
    .clk(clk),
    .d(\u_flash_erase/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/phase_cnt [0]));  // src/rtl/flash/flash_erase.v(69)
  reg_ar_as_w1 \u_flash_erase/reg1_b1  (
    .clk(clk),
    .d(\u_flash_erase/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/phase_cnt [1]));  // src/rtl/flash/flash_erase.v(69)
  reg_ar_ss_w1 \u_flash_erase/reg2_b0  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_erase/sft_wen ),
    .reset(1'b0),
    .set(start_erase),
    .q(\u_flash_erase/tx_reg [0]));  // src/rtl/flash/flash_erase.v(93)
  reg_ar_ss_w1 \u_flash_erase/reg2_b1  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [0]),
    .en(\u_flash_erase/sft_wen ),
    .reset(1'b0),
    .set(start_erase),
    .q(\u_flash_erase/tx_reg [1]));  // src/rtl/flash/flash_erase.v(93)
  reg_ar_ss_w1 \u_flash_erase/reg2_b2  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [1]),
    .en(\u_flash_erase/sft_wen ),
    .reset(1'b0),
    .set(start_erase),
    .q(\u_flash_erase/tx_reg [2]));  // src/rtl/flash/flash_erase.v(93)
  reg_sr_as_w1 \u_flash_erase/reg2_b3  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [2]),
    .en(\u_flash_erase/sft_wen ),
    .reset(start_erase),
    .set(1'b0),
    .q(\u_flash_erase/tx_reg [3]));  // src/rtl/flash/flash_erase.v(93)
  reg_sr_as_w1 \u_flash_erase/reg2_b4  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [3]),
    .en(\u_flash_erase/sft_wen ),
    .reset(start_erase),
    .set(1'b0),
    .q(\u_flash_erase/tx_reg [4]));  // src/rtl/flash/flash_erase.v(93)
  reg_sr_as_w1 \u_flash_erase/reg2_b5  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [4]),
    .en(\u_flash_erase/sft_wen ),
    .reset(start_erase),
    .set(1'b0),
    .q(\u_flash_erase/tx_reg [5]));  // src/rtl/flash/flash_erase.v(93)
  reg_ar_ss_w1 \u_flash_erase/reg2_b6  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [5]),
    .en(\u_flash_erase/sft_wen ),
    .reset(1'b0),
    .set(start_erase),
    .q(\u_flash_erase/tx_reg [6]));  // src/rtl/flash/flash_erase.v(93)
  reg_ar_ss_w1 \u_flash_erase/reg2_b7  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [6]),
    .en(\u_flash_erase/sft_wen ),
    .reset(1'b0),
    .set(start_erase),
    .q(\u_flash_erase/tx_reg [7]));  // src/rtl/flash/flash_erase.v(93)
  reg_sr_as_w1 \u_flash_erase/reg3_b0  (
    .clk(clk),
    .d(\u_flash_erase/n0 [0]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [0]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b1  (
    .clk(clk),
    .d(\u_flash_erase/n0 [1]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [1]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b2  (
    .clk(clk),
    .d(\u_flash_erase/n0 [2]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [2]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b3  (
    .clk(clk),
    .d(\u_flash_erase/n0 [3]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [3]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b4  (
    .clk(clk),
    .d(\u_flash_erase/n0 [4]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [4]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b5  (
    .clk(clk),
    .d(\u_flash_erase/n0 [5]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [5]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b6  (
    .clk(clk),
    .d(\u_flash_erase/n0 [6]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [6]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b7  (
    .clk(clk),
    .d(\u_flash_erase/n0 [7]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [7]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b8  (
    .clk(clk),
    .d(\u_flash_erase/n0 [8]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [8]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b9  (
    .clk(clk),
    .d(\u_flash_erase/n0 [9]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [9]));  // src/rtl/flash/flash_erase.v(57)
  reg_ar_as_w1 \u_flash_erase/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_erase/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/sft_wen ));  // src/rtl/flash/flash_erase.v(99)
  not \u_flash_erase/u2  (\u_flash_erase/n2 , busy_erase);  // src/rtl/flash/flash_erase.v(83)
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
  add_pu10_pu10_o10 \u_flash_id/add0  (
    .i0(\u_flash_id/cnt ),
    .i1(10'b0000000001),
    .o(\u_flash_id/n0 ));  // src/rtl/flash/flash_id.v(58)
  reg_ar_ss_w1 \u_flash_id/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_id/n17 ),
    .reset(1'b0),
    .set(start_id),
    .q(busy_id));  // src/rtl/flash/flash_id.v(144)
  reg_ar_as_w1 \u_flash_id/byte_flag_reg  (
    .clk(clk),
    .d(\u_flash_id/n14 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/byte_flag ));  // src/rtl/flash/flash_id.v(115)
  eq_w3 \u_flash_id/eq0  (
    .i0({fls_sck_id,\u_flash_id/phase_cnt [1:0]}),
    .i1(3'b110),
    .o(\u_flash_id/n5 ));  // src/rtl/flash/flash_id.v(102)
  eq_w3 \u_flash_id/eq1  (
    .i0({fls_sck_id,\u_flash_id/phase_cnt [1:0]}),
    .i1(3'b011),
    .o(\u_flash_id/n6 ));  // src/rtl/flash/flash_id.v(108)
  eq_w3 \u_flash_id/eq2  (
    .i0(\u_flash_id/cycle_cnt [2:0]),
    .i1(3'b111),
    .o(\u_flash_id/n11 ));  // src/rtl/flash/flash_id.v(114)
  eq_w3 \u_flash_id/eq3  (
    .i0({fls_sck_id,\u_flash_id/phase_cnt [1:0]}),
    .i1(3'b101),
    .o(\u_flash_id/n13 ));  // src/rtl/flash/flash_id.v(114)
  eq_w7 \u_flash_id/eq4  (
    .i0(\u_flash_id/cycle_cnt ),
    .i1(7'b0110000),
    .o(\u_flash_id/n17 ));  // src/rtl/flash/flash_id.v(142)
  reg_ar_as_w1 \u_flash_id/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_id/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_id));  // src/rtl/flash/flash_id.v(88)
  reg_ar_as_w1 \u_flash_id/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_id/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_id));  // src/rtl/flash/flash_id.v(79)
  reg_ar_as_w1 \u_flash_id/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_id/tx_reg [31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_id));  // src/rtl/flash/flash_id.v(121)
  lt_u7_u7 \u_flash_id/lt0  (
    .ci(1'b0),
    .i0(7'b0011111),
    .i1(\u_flash_id/cycle_cnt ),
    .o(\u_flash_id/n7 ));  // src/rtl/flash/flash_id.v(108)
  lt_u7_u7 \u_flash_id/lt1  (
    .ci(1'b0),
    .i0(\u_flash_id/cycle_cnt ),
    .i1(7'b0110000),
    .o(\u_flash_id/n9 ));  // src/rtl/flash/flash_id.v(108)
  reg_ar_as_w1 \u_flash_id/reg0_b0  (
    .clk(clk),
    .d(\u_flash_id/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [0]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg0_b1  (
    .clk(clk),
    .d(\u_flash_id/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [1]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg0_b2  (
    .clk(clk),
    .d(\u_flash_id/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [2]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg0_b3  (
    .clk(clk),
    .d(\u_flash_id/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [3]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg0_b4  (
    .clk(clk),
    .d(\u_flash_id/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [4]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg0_b5  (
    .clk(clk),
    .d(\u_flash_id/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [5]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg0_b6  (
    .clk(clk),
    .d(\u_flash_id/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [6]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg1_b0  (
    .clk(clk),
    .d(\u_flash_id/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/phase_cnt [0]));  // src/rtl/flash/flash_id.v(73)
  reg_ar_as_w1 \u_flash_id/reg1_b1  (
    .clk(clk),
    .d(\u_flash_id/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/phase_cnt [1]));  // src/rtl/flash/flash_id.v(73)
  reg_ar_ss_w1 \u_flash_id/reg2_b28  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_id/sft_wen ),
    .reset(1'b0),
    .set(start_id),
    .q(\u_flash_id/tx_reg [28]));  // src/rtl/flash/flash_id.v(97)
  reg_sr_as_w1 \u_flash_id/reg2_b29  (
    .clk(clk),
    .d(\u_flash_id/tx_reg [28]),
    .en(\u_flash_id/sft_wen ),
    .reset(start_id),
    .set(1'b0),
    .q(\u_flash_id/tx_reg [29]));  // src/rtl/flash/flash_id.v(97)
  reg_sr_as_w1 \u_flash_id/reg2_b30  (
    .clk(clk),
    .d(\u_flash_id/tx_reg [29]),
    .en(\u_flash_id/sft_wen ),
    .reset(start_id),
    .set(1'b0),
    .q(\u_flash_id/tx_reg [30]));  // src/rtl/flash/flash_id.v(97)
  reg_ar_ss_w1 \u_flash_id/reg2_b31  (
    .clk(clk),
    .d(\u_flash_id/tx_reg [30]),
    .en(\u_flash_id/sft_wen ),
    .reset(1'b0),
    .set(start_id),
    .q(\u_flash_id/tx_reg [31]));  // src/rtl/flash/flash_id.v(97)
  reg_ar_as_w1 \u_flash_id/reg3_b0  (
    .clk(clk),
    .d(fls_sdi_id),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [0]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b1  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [0]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [1]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b2  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [1]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [2]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b3  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [2]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [3]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b4  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [3]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [4]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b5  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [4]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [5]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b6  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [5]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [6]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b7  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [6]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [7]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg4_b0  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [0]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[0]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b1  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [1]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[1]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b10  (
    .clk(clk),
    .d(id[2]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[10]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b11  (
    .clk(clk),
    .d(id[3]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[11]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b12  (
    .clk(clk),
    .d(id[4]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[12]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b13  (
    .clk(clk),
    .d(id[5]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[13]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b14  (
    .clk(clk),
    .d(id[6]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[14]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b15  (
    .clk(clk),
    .d(id[7]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[15]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b2  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [2]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[2]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b3  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [3]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[3]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b4  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [4]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[4]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b5  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [5]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[5]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b6  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [6]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[6]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b7  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [7]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[7]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b8  (
    .clk(clk),
    .d(id[0]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[8]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b9  (
    .clk(clk),
    .d(id[1]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[9]));  // src/rtl/flash/flash_id.v(135)
  reg_sr_as_w1 \u_flash_id/reg5_b0  (
    .clk(clk),
    .d(\u_flash_id/n0 [0]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [0]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b1  (
    .clk(clk),
    .d(\u_flash_id/n0 [1]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [1]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b2  (
    .clk(clk),
    .d(\u_flash_id/n0 [2]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [2]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b3  (
    .clk(clk),
    .d(\u_flash_id/n0 [3]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [3]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b4  (
    .clk(clk),
    .d(\u_flash_id/n0 [4]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [4]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b5  (
    .clk(clk),
    .d(\u_flash_id/n0 [5]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [5]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b6  (
    .clk(clk),
    .d(\u_flash_id/n0 [6]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [6]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b7  (
    .clk(clk),
    .d(\u_flash_id/n0 [7]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [7]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b8  (
    .clk(clk),
    .d(\u_flash_id/n0 [8]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [8]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b9  (
    .clk(clk),
    .d(\u_flash_id/n0 [9]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [9]));  // src/rtl/flash/flash_id.v(61)
  reg_ar_as_w1 \u_flash_id/sft_ren_reg  (
    .clk(clk),
    .d(\u_flash_id/n10 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/sft_ren ));  // src/rtl/flash/flash_id.v(109)
  reg_ar_as_w1 \u_flash_id/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_id/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/sft_wen ));  // src/rtl/flash/flash_id.v(103)
  not \u_flash_id/u2  (\u_flash_id/n2 , busy_id);  // src/rtl/flash/flash_id.v(87)
  and \u_flash_id/u3  (\u_flash_id/n8 , \u_flash_id/n6 , \u_flash_id/n7 );  // src/rtl/flash/flash_id.v(108)
  and \u_flash_id/u4  (\u_flash_id/n10 , \u_flash_id/n8 , \u_flash_id/n9 );  // src/rtl/flash/flash_id.v(108)
  and \u_flash_id/u5  (\u_flash_id/n12 , \u_flash_id/n7 , \u_flash_id/n11 );  // src/rtl/flash/flash_id.v(114)
  and \u_flash_id/u6  (\u_flash_id/n14 , \u_flash_id/n12 , \u_flash_id/n13 );  // src/rtl/flash/flash_id.v(114)
  add_pu10_pu10_o10 \u_flash_read/add0  (
    .i0(\u_flash_read/cnt ),
    .i1(10'b0000000001),
    .o(\u_flash_read/n0 ));  // src/rtl/flash/flash_read.v(62)
  reg_ar_ss_w1 \u_flash_read/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_read/n15 ),
    .reset(1'b0),
    .set(start_rd),
    .q(busy_rd));  // src/rtl/flash/flash_read.v(154)
  reg_ar_as_w1 \u_flash_read/byte_flag_reg  (
    .clk(clk),
    .d(\u_flash_read/n12 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/byte_flag ));  // src/rtl/flash/flash_read.v(119)
  eq_w3 \u_flash_read/eq0  (
    .i0({fls_sck_rd,\u_flash_read/phase_cnt [1:0]}),
    .i1(3'b110),
    .o(\u_flash_read/n5 ));  // src/rtl/flash/flash_read.v(106)
  eq_w3 \u_flash_read/eq1  (
    .i0({fls_sck_rd,\u_flash_read/phase_cnt [1:0]}),
    .i1(3'b011),
    .o(\u_flash_read/n6 ));  // src/rtl/flash/flash_read.v(112)
  eq_w3 \u_flash_read/eq2  (
    .i0(\u_flash_read/cycle_cnt [2:0]),
    .i1(3'b111),
    .o(\u_flash_read/n9 ));  // src/rtl/flash/flash_read.v(118)
  eq_w3 \u_flash_read/eq3  (
    .i0({fls_sck_rd,\u_flash_read/phase_cnt [1:0]}),
    .i1(3'b101),
    .o(\u_flash_read/n11 ));  // src/rtl/flash/flash_read.v(118)
  eq_w7 \u_flash_read/eq4  (
    .i0(\u_flash_read/cycle_cnt ),
    .i1(7'b0101000),
    .o(\u_flash_read/n15 ));  // src/rtl/flash/flash_read.v(152)
  reg_ar_as_w1 \u_flash_read/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_read/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_rd));  // src/rtl/flash/flash_read.v(92)
  reg_ar_as_w1 \u_flash_read/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_read/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_rd));  // src/rtl/flash/flash_read.v(83)
  reg_ar_as_w1 \u_flash_read/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_rd));  // src/rtl/flash/flash_read.v(125)
  lt_u7_u7 \u_flash_read/lt0  (
    .ci(1'b0),
    .i0(7'b0011111),
    .i1(\u_flash_read/cycle_cnt ),
    .o(\u_flash_read/n7 ));  // src/rtl/flash/flash_read.v(112)
  binary_mux_s1_w1 \u_flash_read/mux1_b0  (
    .i0(\u_flash_read/tx_reg [0]),
    .i1(1'b0),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [0]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b1  (
    .i0(\u_flash_read/tx_reg [1]),
    .i1(\u_flash_read/tx_reg [0]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [1]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b10  (
    .i0(\u_flash_read/tx_reg [10]),
    .i1(\u_flash_read/tx_reg [9]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [10]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b11  (
    .i0(\u_flash_read/tx_reg [11]),
    .i1(\u_flash_read/tx_reg [10]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [11]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b12  (
    .i0(\u_flash_read/tx_reg [12]),
    .i1(\u_flash_read/tx_reg [11]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [12]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b13  (
    .i0(\u_flash_read/tx_reg [13]),
    .i1(\u_flash_read/tx_reg [12]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [13]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b14  (
    .i0(\u_flash_read/tx_reg [14]),
    .i1(\u_flash_read/tx_reg [13]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [14]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b15  (
    .i0(\u_flash_read/tx_reg [15]),
    .i1(\u_flash_read/tx_reg [14]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [15]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b16  (
    .i0(\u_flash_read/tx_reg [16]),
    .i1(\u_flash_read/tx_reg [15]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [16]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b17  (
    .i0(\u_flash_read/tx_reg [17]),
    .i1(\u_flash_read/tx_reg [16]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [17]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b18  (
    .i0(\u_flash_read/tx_reg [18]),
    .i1(\u_flash_read/tx_reg [17]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [18]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b19  (
    .i0(\u_flash_read/tx_reg [19]),
    .i1(\u_flash_read/tx_reg [18]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [19]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b2  (
    .i0(\u_flash_read/tx_reg [2]),
    .i1(\u_flash_read/tx_reg [1]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [2]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b20  (
    .i0(\u_flash_read/tx_reg [20]),
    .i1(\u_flash_read/tx_reg [19]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [20]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b21  (
    .i0(\u_flash_read/tx_reg [21]),
    .i1(\u_flash_read/tx_reg [20]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [21]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b22  (
    .i0(\u_flash_read/tx_reg [22]),
    .i1(\u_flash_read/tx_reg [21]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [22]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b23  (
    .i0(\u_flash_read/tx_reg [23]),
    .i1(\u_flash_read/tx_reg [22]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [23]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b3  (
    .i0(\u_flash_read/tx_reg [3]),
    .i1(\u_flash_read/tx_reg [2]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [3]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b4  (
    .i0(\u_flash_read/tx_reg [4]),
    .i1(\u_flash_read/tx_reg [3]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [4]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b5  (
    .i0(\u_flash_read/tx_reg [5]),
    .i1(\u_flash_read/tx_reg [4]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [5]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b6  (
    .i0(\u_flash_read/tx_reg [6]),
    .i1(\u_flash_read/tx_reg [5]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [6]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b7  (
    .i0(\u_flash_read/tx_reg [7]),
    .i1(\u_flash_read/tx_reg [6]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [7]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b8  (
    .i0(\u_flash_read/tx_reg [8]),
    .i1(\u_flash_read/tx_reg [7]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [8]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux1_b9  (
    .i0(\u_flash_read/tx_reg [9]),
    .i1(\u_flash_read/tx_reg [8]),
    .sel(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n3 [9]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b0  (
    .i0(\u_flash_read/n3 [0]),
    .i1(fls_addr[0]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [0]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b1  (
    .i0(\u_flash_read/n3 [1]),
    .i1(fls_addr[1]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [1]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b10  (
    .i0(\u_flash_read/n3 [10]),
    .i1(fls_addr[10]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [10]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b11  (
    .i0(\u_flash_read/n3 [11]),
    .i1(fls_addr[11]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [11]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b12  (
    .i0(\u_flash_read/n3 [12]),
    .i1(fls_addr[12]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [12]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b13  (
    .i0(\u_flash_read/n3 [13]),
    .i1(fls_addr[13]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [13]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b14  (
    .i0(\u_flash_read/n3 [14]),
    .i1(fls_addr[14]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [14]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b15  (
    .i0(\u_flash_read/n3 [15]),
    .i1(fls_addr[15]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [15]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b16  (
    .i0(\u_flash_read/n3 [16]),
    .i1(fls_addr[16]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [16]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b17  (
    .i0(\u_flash_read/n3 [17]),
    .i1(fls_addr[17]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [17]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b18  (
    .i0(\u_flash_read/n3 [18]),
    .i1(fls_addr[18]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [18]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b19  (
    .i0(\u_flash_read/n3 [19]),
    .i1(fls_addr[19]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [19]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b2  (
    .i0(\u_flash_read/n3 [2]),
    .i1(fls_addr[2]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [2]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b20  (
    .i0(\u_flash_read/n3 [20]),
    .i1(fls_addr[20]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [20]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b21  (
    .i0(\u_flash_read/n3 [21]),
    .i1(fls_addr[21]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [21]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b22  (
    .i0(\u_flash_read/n3 [22]),
    .i1(fls_addr[22]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [22]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b23  (
    .i0(\u_flash_read/n3 [23]),
    .i1(fls_addr[23]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [23]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b3  (
    .i0(\u_flash_read/n3 [3]),
    .i1(fls_addr[3]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [3]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b4  (
    .i0(\u_flash_read/n3 [4]),
    .i1(fls_addr[4]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [4]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b5  (
    .i0(\u_flash_read/n3 [5]),
    .i1(fls_addr[5]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [5]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b6  (
    .i0(\u_flash_read/n3 [6]),
    .i1(fls_addr[6]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [6]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b7  (
    .i0(\u_flash_read/n3 [7]),
    .i1(fls_addr[7]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [7]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b8  (
    .i0(\u_flash_read/n3 [8]),
    .i1(fls_addr[8]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [8]));  // src/rtl/flash/flash_read.v(100)
  binary_mux_s1_w1 \u_flash_read/mux2_b9  (
    .i0(\u_flash_read/n3 [9]),
    .i1(fls_addr[9]),
    .sel(start_rd),
    .o(\u_flash_read/n4 [9]));  // src/rtl/flash/flash_read.v(100)
  reg_ar_as_w1 \u_flash_read/reg0_b0  (
    .clk(clk),
    .d(\u_flash_read/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [0]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg0_b1  (
    .clk(clk),
    .d(\u_flash_read/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [1]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg0_b2  (
    .clk(clk),
    .d(\u_flash_read/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [2]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg0_b3  (
    .clk(clk),
    .d(\u_flash_read/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [3]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg0_b4  (
    .clk(clk),
    .d(\u_flash_read/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [4]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg0_b5  (
    .clk(clk),
    .d(\u_flash_read/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [5]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg0_b6  (
    .clk(clk),
    .d(\u_flash_read/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [6]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg1_b0  (
    .clk(clk),
    .d(\u_flash_read/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/phase_cnt [0]));  // src/rtl/flash/flash_read.v(77)
  reg_ar_as_w1 \u_flash_read/reg1_b1  (
    .clk(clk),
    .d(\u_flash_read/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/phase_cnt [1]));  // src/rtl/flash/flash_read.v(77)
  reg_ar_as_w1 \u_flash_read/reg2_b0  (
    .clk(clk),
    .d(\u_flash_read/n4 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [0]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b1  (
    .clk(clk),
    .d(\u_flash_read/n4 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [1]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b10  (
    .clk(clk),
    .d(\u_flash_read/n4 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [10]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b11  (
    .clk(clk),
    .d(\u_flash_read/n4 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [11]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b12  (
    .clk(clk),
    .d(\u_flash_read/n4 [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [12]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b13  (
    .clk(clk),
    .d(\u_flash_read/n4 [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [13]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b14  (
    .clk(clk),
    .d(\u_flash_read/n4 [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [14]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b15  (
    .clk(clk),
    .d(\u_flash_read/n4 [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [15]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b16  (
    .clk(clk),
    .d(\u_flash_read/n4 [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [16]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b17  (
    .clk(clk),
    .d(\u_flash_read/n4 [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [17]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b18  (
    .clk(clk),
    .d(\u_flash_read/n4 [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [18]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b19  (
    .clk(clk),
    .d(\u_flash_read/n4 [19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [19]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b2  (
    .clk(clk),
    .d(\u_flash_read/n4 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [2]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b20  (
    .clk(clk),
    .d(\u_flash_read/n4 [20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [20]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b21  (
    .clk(clk),
    .d(\u_flash_read/n4 [21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [21]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b22  (
    .clk(clk),
    .d(\u_flash_read/n4 [22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [22]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b23  (
    .clk(clk),
    .d(\u_flash_read/n4 [23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [23]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_ss_w1 \u_flash_read/reg2_b24  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [23]),
    .en(\u_flash_read/sft_wen ),
    .reset(1'b0),
    .set(start_rd),
    .q(\u_flash_read/tx_reg [24]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_ss_w1 \u_flash_read/reg2_b25  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [24]),
    .en(\u_flash_read/sft_wen ),
    .reset(1'b0),
    .set(start_rd),
    .q(\u_flash_read/tx_reg [25]));  // src/rtl/flash/flash_read.v(101)
  reg_sr_as_w1 \u_flash_read/reg2_b26  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [25]),
    .en(\u_flash_read/sft_wen ),
    .reset(start_rd),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [26]));  // src/rtl/flash/flash_read.v(101)
  reg_sr_as_w1 \u_flash_read/reg2_b27  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [26]),
    .en(\u_flash_read/sft_wen ),
    .reset(start_rd),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [27]));  // src/rtl/flash/flash_read.v(101)
  reg_sr_as_w1 \u_flash_read/reg2_b28  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [27]),
    .en(\u_flash_read/sft_wen ),
    .reset(start_rd),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [28]));  // src/rtl/flash/flash_read.v(101)
  reg_sr_as_w1 \u_flash_read/reg2_b29  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [28]),
    .en(\u_flash_read/sft_wen ),
    .reset(start_rd),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [29]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b3  (
    .clk(clk),
    .d(\u_flash_read/n4 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [3]));  // src/rtl/flash/flash_read.v(101)
  reg_sr_as_w1 \u_flash_read/reg2_b30  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [29]),
    .en(\u_flash_read/sft_wen ),
    .reset(start_rd),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [30]));  // src/rtl/flash/flash_read.v(101)
  reg_sr_as_w1 \u_flash_read/reg2_b31  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [30]),
    .en(\u_flash_read/sft_wen ),
    .reset(start_rd),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [31]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b4  (
    .clk(clk),
    .d(\u_flash_read/n4 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [4]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b5  (
    .clk(clk),
    .d(\u_flash_read/n4 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [5]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b6  (
    .clk(clk),
    .d(\u_flash_read/n4 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [6]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b7  (
    .clk(clk),
    .d(\u_flash_read/n4 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [7]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b8  (
    .clk(clk),
    .d(\u_flash_read/n4 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [8]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b9  (
    .clk(clk),
    .d(\u_flash_read/n4 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [9]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg3_b0  (
    .clk(clk),
    .d(fls_sdi_rd),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [0]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b1  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [0]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [1]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b2  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [1]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [2]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b3  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [2]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [3]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b4  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [3]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [4]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b5  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [4]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [5]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b6  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [5]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [6]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b7  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [6]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [7]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg4_b0  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [0]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[0]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b1  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [1]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[1]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b2  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [2]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[2]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b3  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [3]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[3]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b4  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [4]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[4]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b5  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [5]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[5]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b6  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [6]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[6]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b7  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [7]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[7]));  // src/rtl/flash/flash_read.v(145)
  reg_sr_as_w1 \u_flash_read/reg5_b0  (
    .clk(clk),
    .d(\u_flash_read/n0 [0]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [0]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b1  (
    .clk(clk),
    .d(\u_flash_read/n0 [1]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [1]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b2  (
    .clk(clk),
    .d(\u_flash_read/n0 [2]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [2]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b3  (
    .clk(clk),
    .d(\u_flash_read/n0 [3]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [3]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b4  (
    .clk(clk),
    .d(\u_flash_read/n0 [4]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [4]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b5  (
    .clk(clk),
    .d(\u_flash_read/n0 [5]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [5]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b6  (
    .clk(clk),
    .d(\u_flash_read/n0 [6]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [6]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b7  (
    .clk(clk),
    .d(\u_flash_read/n0 [7]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [7]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b8  (
    .clk(clk),
    .d(\u_flash_read/n0 [8]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [8]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b9  (
    .clk(clk),
    .d(\u_flash_read/n0 [9]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [9]));  // src/rtl/flash/flash_read.v(65)
  reg_ar_as_w1 \u_flash_read/sft_ren_reg  (
    .clk(clk),
    .d(\u_flash_read/n8 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/sft_ren ));  // src/rtl/flash/flash_read.v(113)
  reg_ar_as_w1 \u_flash_read/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_read/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/sft_wen ));  // src/rtl/flash/flash_read.v(107)
  not \u_flash_read/u2  (\u_flash_read/n2 , busy_rd);  // src/rtl/flash/flash_read.v(91)
  and \u_flash_read/u3  (\u_flash_read/n8 , \u_flash_read/n6 , \u_flash_read/n7 );  // src/rtl/flash/flash_read.v(112)
  and \u_flash_read/u4  (\u_flash_read/n10 , \u_flash_read/n7 , \u_flash_read/n9 );  // src/rtl/flash/flash_read.v(118)
  and \u_flash_read/u5  (\u_flash_read/n12 , \u_flash_read/n10 , \u_flash_read/n11 );  // src/rtl/flash/flash_read.v(118)
  add_pu10_pu10_o10 \u_flash_sector_erase/add0  (
    .i0(\u_flash_sector_erase/cnt ),
    .i1(10'b0000000001),
    .o(\u_flash_sector_erase/n0 ));  // src/rtl/flash/flash_sector_erase.v(56)
  reg_ar_ss_w1 \u_flash_sector_erase/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_sector_erase/n6 ),
    .reset(1'b0),
    .set(start_sector),
    .q(busy_sector));  // src/rtl/flash/flash_sector_erase.v(116)
  eq_w3 \u_flash_sector_erase/eq0  (
    .i0({fls_sck_sector,\u_flash_sector_erase/phase_cnt [1:0]}),
    .i1(3'b110),
    .o(\u_flash_sector_erase/n5 ));  // src/rtl/flash/flash_sector_erase.v(100)
  eq_w7 \u_flash_sector_erase/eq1  (
    .i0(\u_flash_sector_erase/cycle_cnt ),
    .i1(7'b0100000),
    .o(\u_flash_sector_erase/n6 ));  // src/rtl/flash/flash_sector_erase.v(114)
  reg_ar_as_w1 \u_flash_sector_erase/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_sector_erase/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_sector));  // src/rtl/flash/flash_sector_erase.v(86)
  reg_ar_as_w1 \u_flash_sector_erase/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_sector));  // src/rtl/flash/flash_sector_erase.v(77)
  reg_ar_as_w1 \u_flash_sector_erase/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_sector));  // src/rtl/flash/flash_sector_erase.v(107)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b0  (
    .i0(\u_flash_sector_erase/tx_reg [0]),
    .i1(1'b0),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [0]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b1  (
    .i0(\u_flash_sector_erase/tx_reg [1]),
    .i1(\u_flash_sector_erase/tx_reg [0]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [1]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b10  (
    .i0(\u_flash_sector_erase/tx_reg [10]),
    .i1(\u_flash_sector_erase/tx_reg [9]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [10]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b11  (
    .i0(\u_flash_sector_erase/tx_reg [11]),
    .i1(\u_flash_sector_erase/tx_reg [10]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [11]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b12  (
    .i0(\u_flash_sector_erase/tx_reg [12]),
    .i1(\u_flash_sector_erase/tx_reg [11]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [12]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b13  (
    .i0(\u_flash_sector_erase/tx_reg [13]),
    .i1(\u_flash_sector_erase/tx_reg [12]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [13]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b14  (
    .i0(\u_flash_sector_erase/tx_reg [14]),
    .i1(\u_flash_sector_erase/tx_reg [13]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [14]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b15  (
    .i0(\u_flash_sector_erase/tx_reg [15]),
    .i1(\u_flash_sector_erase/tx_reg [14]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [15]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b16  (
    .i0(\u_flash_sector_erase/tx_reg [16]),
    .i1(\u_flash_sector_erase/tx_reg [15]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [16]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b17  (
    .i0(\u_flash_sector_erase/tx_reg [17]),
    .i1(\u_flash_sector_erase/tx_reg [16]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [17]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b18  (
    .i0(\u_flash_sector_erase/tx_reg [18]),
    .i1(\u_flash_sector_erase/tx_reg [17]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [18]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b19  (
    .i0(\u_flash_sector_erase/tx_reg [19]),
    .i1(\u_flash_sector_erase/tx_reg [18]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [19]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b2  (
    .i0(\u_flash_sector_erase/tx_reg [2]),
    .i1(\u_flash_sector_erase/tx_reg [1]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [2]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b20  (
    .i0(\u_flash_sector_erase/tx_reg [20]),
    .i1(\u_flash_sector_erase/tx_reg [19]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [20]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b21  (
    .i0(\u_flash_sector_erase/tx_reg [21]),
    .i1(\u_flash_sector_erase/tx_reg [20]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [21]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b22  (
    .i0(\u_flash_sector_erase/tx_reg [22]),
    .i1(\u_flash_sector_erase/tx_reg [21]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [22]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b23  (
    .i0(\u_flash_sector_erase/tx_reg [23]),
    .i1(\u_flash_sector_erase/tx_reg [22]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [23]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b3  (
    .i0(\u_flash_sector_erase/tx_reg [3]),
    .i1(\u_flash_sector_erase/tx_reg [2]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [3]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b4  (
    .i0(\u_flash_sector_erase/tx_reg [4]),
    .i1(\u_flash_sector_erase/tx_reg [3]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [4]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b5  (
    .i0(\u_flash_sector_erase/tx_reg [5]),
    .i1(\u_flash_sector_erase/tx_reg [4]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [5]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b6  (
    .i0(\u_flash_sector_erase/tx_reg [6]),
    .i1(\u_flash_sector_erase/tx_reg [5]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [6]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b7  (
    .i0(\u_flash_sector_erase/tx_reg [7]),
    .i1(\u_flash_sector_erase/tx_reg [6]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [7]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b8  (
    .i0(\u_flash_sector_erase/tx_reg [8]),
    .i1(\u_flash_sector_erase/tx_reg [7]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [8]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux1_b9  (
    .i0(\u_flash_sector_erase/tx_reg [9]),
    .i1(\u_flash_sector_erase/tx_reg [8]),
    .sel(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n3 [9]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b0  (
    .i0(\u_flash_sector_erase/n3 [0]),
    .i1(fls_addr[0]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [0]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b1  (
    .i0(\u_flash_sector_erase/n3 [1]),
    .i1(fls_addr[1]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [1]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b10  (
    .i0(\u_flash_sector_erase/n3 [10]),
    .i1(fls_addr[10]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [10]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b11  (
    .i0(\u_flash_sector_erase/n3 [11]),
    .i1(fls_addr[11]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [11]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b12  (
    .i0(\u_flash_sector_erase/n3 [12]),
    .i1(fls_addr[12]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [12]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b13  (
    .i0(\u_flash_sector_erase/n3 [13]),
    .i1(fls_addr[13]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [13]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b14  (
    .i0(\u_flash_sector_erase/n3 [14]),
    .i1(fls_addr[14]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [14]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b15  (
    .i0(\u_flash_sector_erase/n3 [15]),
    .i1(fls_addr[15]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [15]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b16  (
    .i0(\u_flash_sector_erase/n3 [16]),
    .i1(fls_addr[16]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [16]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b17  (
    .i0(\u_flash_sector_erase/n3 [17]),
    .i1(fls_addr[17]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [17]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b18  (
    .i0(\u_flash_sector_erase/n3 [18]),
    .i1(fls_addr[18]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [18]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b19  (
    .i0(\u_flash_sector_erase/n3 [19]),
    .i1(fls_addr[19]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [19]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b2  (
    .i0(\u_flash_sector_erase/n3 [2]),
    .i1(fls_addr[2]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [2]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b20  (
    .i0(\u_flash_sector_erase/n3 [20]),
    .i1(fls_addr[20]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [20]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b21  (
    .i0(\u_flash_sector_erase/n3 [21]),
    .i1(fls_addr[21]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [21]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b22  (
    .i0(\u_flash_sector_erase/n3 [22]),
    .i1(fls_addr[22]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [22]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b23  (
    .i0(\u_flash_sector_erase/n3 [23]),
    .i1(fls_addr[23]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [23]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b3  (
    .i0(\u_flash_sector_erase/n3 [3]),
    .i1(fls_addr[3]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [3]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b4  (
    .i0(\u_flash_sector_erase/n3 [4]),
    .i1(fls_addr[4]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [4]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b5  (
    .i0(\u_flash_sector_erase/n3 [5]),
    .i1(fls_addr[5]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [5]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b6  (
    .i0(\u_flash_sector_erase/n3 [6]),
    .i1(fls_addr[6]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [6]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b7  (
    .i0(\u_flash_sector_erase/n3 [7]),
    .i1(fls_addr[7]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [7]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b8  (
    .i0(\u_flash_sector_erase/n3 [8]),
    .i1(fls_addr[8]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [8]));  // src/rtl/flash/flash_sector_erase.v(94)
  binary_mux_s1_w1 \u_flash_sector_erase/mux2_b9  (
    .i0(\u_flash_sector_erase/n3 [9]),
    .i1(fls_addr[9]),
    .sel(start_sector),
    .o(\u_flash_sector_erase/n4 [9]));  // src/rtl/flash/flash_sector_erase.v(94)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b0  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [0]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b1  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [1]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b2  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [2]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b3  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [3]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b4  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [4]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b5  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [5]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b6  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [6]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg1_b0  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/phase_cnt [0]));  // src/rtl/flash/flash_sector_erase.v(71)
  reg_ar_as_w1 \u_flash_sector_erase/reg1_b1  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/phase_cnt [1]));  // src/rtl/flash/flash_sector_erase.v(71)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b0  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [0]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b1  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [1]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b10  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [10]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b11  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [11]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b12  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [12]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b13  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [13]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b14  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [14]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b15  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [15]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b16  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [16]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b17  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [17]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b18  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [18]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b19  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [19]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b2  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [2]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b20  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [20]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b21  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [21]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b22  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [22]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b23  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [23]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b24  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [23]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [24]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b25  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [24]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [25]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b26  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [25]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [26]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b27  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [26]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [27]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b28  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [27]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [28]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_ss_w1 \u_flash_sector_erase/reg2_b29  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [28]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(1'b0),
    .set(start_sector),
    .q(\u_flash_sector_erase/tx_reg [29]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b3  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [3]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b30  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [29]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [30]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b31  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [30]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [31]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b4  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [4]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b5  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [5]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b6  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [6]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b7  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [7]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b8  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [8]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b9  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [9]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b0  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [0]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [0]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b1  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [1]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [1]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b2  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [2]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [2]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b3  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [3]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [3]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b4  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [4]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [4]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b5  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [5]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [5]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b6  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [6]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [6]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b7  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [7]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [7]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b8  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [8]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [8]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b9  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [9]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [9]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_ar_as_w1 \u_flash_sector_erase/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_sector_erase/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/sft_wen ));  // src/rtl/flash/flash_sector_erase.v(101)
  not \u_flash_sector_erase/u2  (\u_flash_sector_erase/n2 , busy_sector);  // src/rtl/flash/flash_sector_erase.v(85)
  add_pu32_pu32_o32 \u_flash_wait_free/add0  (
    .i0(\u_flash_wait_free/cnt ),
    .i1(32'b00000000000000000000000000000001),
    .o(\u_flash_wait_free/n0 ));  // src/rtl/flash/flash_wait_free.v(59)
  reg_ar_ss_w1 \u_flash_wait_free/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_wait_free/n18 ),
    .reset(1'b0),
    .set(start_wfree),
    .q(busy_wfree));  // src/rtl/flash/flash_wait_free.v(147)
  reg_ar_as_w1 \u_flash_wait_free/byte_flag_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/n12 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/byte_flag ));  // src/rtl/flash/flash_wait_free.v(116)
  eq_w3 \u_flash_wait_free/eq0  (
    .i0({fls_sck_wfree,\u_flash_wait_free/phase_cnt [1:0]}),
    .i1(3'b110),
    .o(\u_flash_wait_free/n5 ));  // src/rtl/flash/flash_wait_free.v(103)
  eq_w3 \u_flash_wait_free/eq1  (
    .i0({fls_sck_wfree,\u_flash_wait_free/phase_cnt [1:0]}),
    .i1(3'b011),
    .o(\u_flash_wait_free/n6 ));  // src/rtl/flash/flash_wait_free.v(109)
  eq_w3 \u_flash_wait_free/eq2  (
    .i0(\u_flash_wait_free/cycle_cnt [2:0]),
    .i1(3'b111),
    .o(\u_flash_wait_free/n9 ));  // src/rtl/flash/flash_wait_free.v(115)
  eq_w3 \u_flash_wait_free/eq3  (
    .i0({fls_sck_wfree,\u_flash_wait_free/phase_cnt [1:0]}),
    .i1(3'b101),
    .o(\u_flash_wait_free/n11 ));  // src/rtl/flash/flash_wait_free.v(115)
  eq_w1 \u_flash_wait_free/eq4  (
    .i0(\u_flash_wait_free/fls_busy ),
    .i1(1'b0),
    .o(\u_flash_wait_free/n16 ));  // src/rtl/flash/flash_wait_free.v(145)
  eq_w3 \u_flash_wait_free/eq5  (
    .i0({fls_sck_wfree,\u_flash_wait_free/phase_cnt [1:0]}),
    .i1(3'b000),
    .o(\u_flash_wait_free/n17 ));  // src/rtl/flash/flash_wait_free.v(145)
  reg_ar_ss_w1 \u_flash_wait_free/fls_busy_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/rx_reg [0]),
    .en(\u_flash_wait_free/byte_flag ),
    .reset(1'b0),
    .set(start_wfree),
    .q(\u_flash_wait_free/fls_busy ));  // src/rtl/flash/flash_wait_free.v(138)
  reg_ar_as_w1 \u_flash_wait_free/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_wfree));  // src/rtl/flash/flash_wait_free.v(89)
  reg_ar_as_w1 \u_flash_wait_free/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_wfree));  // src/rtl/flash/flash_wait_free.v(80)
  reg_ar_as_w1 \u_flash_wait_free/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_wfree));  // src/rtl/flash/flash_wait_free.v(122)
  lt_u29_u29 \u_flash_wait_free/lt0  (
    .ci(1'b0),
    .i0(29'b00000000000000000000000000111),
    .i1(\u_flash_wait_free/cycle_cnt ),
    .o(\u_flash_wait_free/n7 ));  // src/rtl/flash/flash_wait_free.v(109)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b0  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [0]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b1  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [1]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b10  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [10]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b11  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [11]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b12  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [12]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b13  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [13]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b14  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [14]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b15  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [15]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b16  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [16]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b17  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [17]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b18  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [18]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b19  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [19]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b2  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [2]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b20  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [20]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b21  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [24]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [21]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b22  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [25]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [22]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b23  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [26]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [23]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b24  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [27]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [24]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b25  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [28]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [25]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b26  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [29]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [26]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b27  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [30]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [27]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b28  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [28]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b3  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [3]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b4  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [4]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b5  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [5]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b6  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [6]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b7  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [7]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b8  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [8]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b9  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [9]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg1_b0  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/phase_cnt [0]));  // src/rtl/flash/flash_wait_free.v(74)
  reg_ar_as_w1 \u_flash_wait_free/reg1_b1  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/phase_cnt [1]));  // src/rtl/flash/flash_wait_free.v(74)
  reg_ar_ss_w1 \u_flash_wait_free/reg2_b0  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(1'b0),
    .set(start_wfree),
    .q(\u_flash_wait_free/tx_reg [0]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_sr_as_w1 \u_flash_wait_free/reg2_b1  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [0]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(start_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/tx_reg [1]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_ar_ss_w1 \u_flash_wait_free/reg2_b2  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [1]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(1'b0),
    .set(start_wfree),
    .q(\u_flash_wait_free/tx_reg [2]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_sr_as_w1 \u_flash_wait_free/reg2_b3  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [2]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(start_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/tx_reg [3]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_sr_as_w1 \u_flash_wait_free/reg2_b4  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [3]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(start_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/tx_reg [4]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_sr_as_w1 \u_flash_wait_free/reg2_b5  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [4]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(start_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/tx_reg [5]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_sr_as_w1 \u_flash_wait_free/reg2_b6  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [5]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(start_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/tx_reg [6]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_sr_as_w1 \u_flash_wait_free/reg2_b7  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [6]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(start_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/tx_reg [7]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_ar_as_w1 \u_flash_wait_free/reg3_b0  (
    .clk(clk),
    .d(fls_sdi_wfree),
    .en(\u_flash_wait_free/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/rx_reg [0]));  // src/rtl/flash/flash_wait_free.v(129)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b0  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [0]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [0]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b1  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [1]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [1]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b10  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [10]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [10]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b11  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [11]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [11]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b12  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [12]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [12]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b13  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [13]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [13]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b14  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [14]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [14]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b15  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [15]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [15]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b16  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [16]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [16]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b17  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [17]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [17]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b18  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [18]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [18]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b19  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [19]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [19]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b2  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [2]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [2]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b20  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [20]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [20]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b21  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [21]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [21]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b22  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [22]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [22]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b23  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [23]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [23]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b24  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [24]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [24]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b25  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [25]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [25]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b26  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [26]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [26]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b27  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [27]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [27]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b28  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [28]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [28]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b29  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [29]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [29]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b3  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [3]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [3]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b30  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [30]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [30]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b31  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [31]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [31]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b4  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [4]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [4]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b5  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [5]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [5]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b6  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [6]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [6]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b7  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [7]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [7]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b8  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [8]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [8]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b9  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [9]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [9]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_ar_as_w1 \u_flash_wait_free/sft_ren_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/n8 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/sft_ren ));  // src/rtl/flash/flash_wait_free.v(110)
  reg_ar_as_w1 \u_flash_wait_free/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/sft_wen ));  // src/rtl/flash/flash_wait_free.v(104)
  not \u_flash_wait_free/u2  (\u_flash_wait_free/n2 , busy_wfree);  // src/rtl/flash/flash_wait_free.v(88)
  and \u_flash_wait_free/u3  (\u_flash_wait_free/n8 , \u_flash_wait_free/n6 , \u_flash_wait_free/n7 );  // src/rtl/flash/flash_wait_free.v(109)
  and \u_flash_wait_free/u4  (\u_flash_wait_free/n10 , \u_flash_wait_free/n7 , \u_flash_wait_free/n9 );  // src/rtl/flash/flash_wait_free.v(115)
  and \u_flash_wait_free/u5  (\u_flash_wait_free/n12 , \u_flash_wait_free/n10 , \u_flash_wait_free/n11 );  // src/rtl/flash/flash_wait_free.v(115)
  and \u_flash_wait_free/u8  (\u_flash_wait_free/n18 , \u_flash_wait_free/n16 , \u_flash_wait_free/n17 );  // src/rtl/flash/flash_wait_free.v(145)
  add_pu10_pu10_o10 \u_flash_write/add0  (
    .i0(\u_flash_write/cnt ),
    .i1(10'b0000000001),
    .o(\u_flash_write/n0 ));  // src/rtl/flash/flash_write.v(58)
  reg_ar_ss_w1 \u_flash_write/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_write/n6 ),
    .reset(1'b0),
    .set(start_wr),
    .q(busy_wr));  // src/rtl/flash/flash_write.v(124)
  eq_w3 \u_flash_write/eq0  (
    .i0({fls_sck_wr,\u_flash_write/phase_cnt [1:0]}),
    .i1(3'b110),
    .o(\u_flash_write/n5 ));  // src/rtl/flash/flash_write.v(102)
  eq_w7 \u_flash_write/eq1  (
    .i0(\u_flash_write/cycle_cnt ),
    .i1(7'b0101000),
    .o(\u_flash_write/n6 ));  // src/rtl/flash/flash_write.v(122)
  reg_ar_as_w1 \u_flash_write/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_write/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_wr));  // src/rtl/flash/flash_write.v(88)
  reg_ar_as_w1 \u_flash_write/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_write/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_wr));  // src/rtl/flash/flash_write.v(79)
  reg_ar_as_w1 \u_flash_write/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [39]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_wr));  // src/rtl/flash/flash_write.v(115)
  binary_mux_s1_w1 \u_flash_write/mux1_b0  (
    .i0(\u_flash_write/tx_reg [0]),
    .i1(1'b0),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [0]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b1  (
    .i0(\u_flash_write/tx_reg [1]),
    .i1(\u_flash_write/tx_reg [0]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [1]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b10  (
    .i0(\u_flash_write/tx_reg [10]),
    .i1(\u_flash_write/tx_reg [9]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [10]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b11  (
    .i0(\u_flash_write/tx_reg [11]),
    .i1(\u_flash_write/tx_reg [10]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [11]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b12  (
    .i0(\u_flash_write/tx_reg [12]),
    .i1(\u_flash_write/tx_reg [11]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [12]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b13  (
    .i0(\u_flash_write/tx_reg [13]),
    .i1(\u_flash_write/tx_reg [12]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [13]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b14  (
    .i0(\u_flash_write/tx_reg [14]),
    .i1(\u_flash_write/tx_reg [13]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [14]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b15  (
    .i0(\u_flash_write/tx_reg [15]),
    .i1(\u_flash_write/tx_reg [14]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [15]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b16  (
    .i0(\u_flash_write/tx_reg [16]),
    .i1(\u_flash_write/tx_reg [15]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [16]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b17  (
    .i0(\u_flash_write/tx_reg [17]),
    .i1(\u_flash_write/tx_reg [16]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [17]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b18  (
    .i0(\u_flash_write/tx_reg [18]),
    .i1(\u_flash_write/tx_reg [17]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [18]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b19  (
    .i0(\u_flash_write/tx_reg [19]),
    .i1(\u_flash_write/tx_reg [18]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [19]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b2  (
    .i0(\u_flash_write/tx_reg [2]),
    .i1(\u_flash_write/tx_reg [1]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [2]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b20  (
    .i0(\u_flash_write/tx_reg [20]),
    .i1(\u_flash_write/tx_reg [19]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [20]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b21  (
    .i0(\u_flash_write/tx_reg [21]),
    .i1(\u_flash_write/tx_reg [20]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [21]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b22  (
    .i0(\u_flash_write/tx_reg [22]),
    .i1(\u_flash_write/tx_reg [21]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [22]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b23  (
    .i0(\u_flash_write/tx_reg [23]),
    .i1(\u_flash_write/tx_reg [22]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [23]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b24  (
    .i0(\u_flash_write/tx_reg [24]),
    .i1(\u_flash_write/tx_reg [23]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [24]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b25  (
    .i0(\u_flash_write/tx_reg [25]),
    .i1(\u_flash_write/tx_reg [24]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [25]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b26  (
    .i0(\u_flash_write/tx_reg [26]),
    .i1(\u_flash_write/tx_reg [25]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [26]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b27  (
    .i0(\u_flash_write/tx_reg [27]),
    .i1(\u_flash_write/tx_reg [26]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [27]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b28  (
    .i0(\u_flash_write/tx_reg [28]),
    .i1(\u_flash_write/tx_reg [27]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [28]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b29  (
    .i0(\u_flash_write/tx_reg [29]),
    .i1(\u_flash_write/tx_reg [28]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [29]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b3  (
    .i0(\u_flash_write/tx_reg [3]),
    .i1(\u_flash_write/tx_reg [2]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [3]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b30  (
    .i0(\u_flash_write/tx_reg [30]),
    .i1(\u_flash_write/tx_reg [29]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [30]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b31  (
    .i0(\u_flash_write/tx_reg [31]),
    .i1(\u_flash_write/tx_reg [30]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [31]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b4  (
    .i0(\u_flash_write/tx_reg [4]),
    .i1(\u_flash_write/tx_reg [3]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [4]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b5  (
    .i0(\u_flash_write/tx_reg [5]),
    .i1(\u_flash_write/tx_reg [4]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [5]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b6  (
    .i0(\u_flash_write/tx_reg [6]),
    .i1(\u_flash_write/tx_reg [5]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [6]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b7  (
    .i0(\u_flash_write/tx_reg [7]),
    .i1(\u_flash_write/tx_reg [6]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [7]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b8  (
    .i0(\u_flash_write/tx_reg [8]),
    .i1(\u_flash_write/tx_reg [7]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [8]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux1_b9  (
    .i0(\u_flash_write/tx_reg [9]),
    .i1(\u_flash_write/tx_reg [8]),
    .sel(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n3 [9]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b0  (
    .i0(\u_flash_write/n3 [0]),
    .i1(fls_write[0]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [0]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b1  (
    .i0(\u_flash_write/n3 [1]),
    .i1(fls_write[1]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [1]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b10  (
    .i0(\u_flash_write/n3 [10]),
    .i1(fls_addr[2]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [10]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b11  (
    .i0(\u_flash_write/n3 [11]),
    .i1(fls_addr[3]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [11]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b12  (
    .i0(\u_flash_write/n3 [12]),
    .i1(fls_addr[4]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [12]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b13  (
    .i0(\u_flash_write/n3 [13]),
    .i1(fls_addr[5]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [13]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b14  (
    .i0(\u_flash_write/n3 [14]),
    .i1(fls_addr[6]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [14]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b15  (
    .i0(\u_flash_write/n3 [15]),
    .i1(fls_addr[7]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [15]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b16  (
    .i0(\u_flash_write/n3 [16]),
    .i1(fls_addr[8]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [16]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b17  (
    .i0(\u_flash_write/n3 [17]),
    .i1(fls_addr[9]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [17]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b18  (
    .i0(\u_flash_write/n3 [18]),
    .i1(fls_addr[10]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [18]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b19  (
    .i0(\u_flash_write/n3 [19]),
    .i1(fls_addr[11]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [19]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b2  (
    .i0(\u_flash_write/n3 [2]),
    .i1(fls_write[2]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [2]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b20  (
    .i0(\u_flash_write/n3 [20]),
    .i1(fls_addr[12]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [20]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b21  (
    .i0(\u_flash_write/n3 [21]),
    .i1(fls_addr[13]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [21]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b22  (
    .i0(\u_flash_write/n3 [22]),
    .i1(fls_addr[14]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [22]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b23  (
    .i0(\u_flash_write/n3 [23]),
    .i1(fls_addr[15]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [23]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b24  (
    .i0(\u_flash_write/n3 [24]),
    .i1(fls_addr[16]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [24]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b25  (
    .i0(\u_flash_write/n3 [25]),
    .i1(fls_addr[17]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [25]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b26  (
    .i0(\u_flash_write/n3 [26]),
    .i1(fls_addr[18]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [26]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b27  (
    .i0(\u_flash_write/n3 [27]),
    .i1(fls_addr[19]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [27]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b28  (
    .i0(\u_flash_write/n3 [28]),
    .i1(fls_addr[20]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [28]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b29  (
    .i0(\u_flash_write/n3 [29]),
    .i1(fls_addr[21]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [29]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b3  (
    .i0(\u_flash_write/n3 [3]),
    .i1(fls_write[3]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [3]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b30  (
    .i0(\u_flash_write/n3 [30]),
    .i1(fls_addr[22]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [30]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b31  (
    .i0(\u_flash_write/n3 [31]),
    .i1(fls_addr[23]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [31]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b4  (
    .i0(\u_flash_write/n3 [4]),
    .i1(fls_write[4]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [4]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b5  (
    .i0(\u_flash_write/n3 [5]),
    .i1(fls_write[5]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [5]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b6  (
    .i0(\u_flash_write/n3 [6]),
    .i1(fls_write[6]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [6]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b7  (
    .i0(\u_flash_write/n3 [7]),
    .i1(fls_write[7]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [7]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b8  (
    .i0(\u_flash_write/n3 [8]),
    .i1(fls_addr[0]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [8]));  // src/rtl/flash/flash_write.v(96)
  binary_mux_s1_w1 \u_flash_write/mux2_b9  (
    .i0(\u_flash_write/n3 [9]),
    .i1(fls_addr[1]),
    .sel(start_wr),
    .o(\u_flash_write/n4 [9]));  // src/rtl/flash/flash_write.v(96)
  reg_ar_as_w1 \u_flash_write/reg0_b0  (
    .clk(clk),
    .d(\u_flash_write/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [0]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg0_b1  (
    .clk(clk),
    .d(\u_flash_write/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [1]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg0_b2  (
    .clk(clk),
    .d(\u_flash_write/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [2]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg0_b3  (
    .clk(clk),
    .d(\u_flash_write/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [3]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg0_b4  (
    .clk(clk),
    .d(\u_flash_write/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [4]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg0_b5  (
    .clk(clk),
    .d(\u_flash_write/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [5]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg0_b6  (
    .clk(clk),
    .d(\u_flash_write/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [6]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg1_b0  (
    .clk(clk),
    .d(\u_flash_write/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/phase_cnt [0]));  // src/rtl/flash/flash_write.v(73)
  reg_ar_as_w1 \u_flash_write/reg1_b1  (
    .clk(clk),
    .d(\u_flash_write/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/phase_cnt [1]));  // src/rtl/flash/flash_write.v(73)
  reg_ar_as_w1 \u_flash_write/reg2_b0  (
    .clk(clk),
    .d(\u_flash_write/n4 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [0]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b1  (
    .clk(clk),
    .d(\u_flash_write/n4 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [1]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b10  (
    .clk(clk),
    .d(\u_flash_write/n4 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [10]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b11  (
    .clk(clk),
    .d(\u_flash_write/n4 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [11]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b12  (
    .clk(clk),
    .d(\u_flash_write/n4 [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [12]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b13  (
    .clk(clk),
    .d(\u_flash_write/n4 [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [13]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b14  (
    .clk(clk),
    .d(\u_flash_write/n4 [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [14]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b15  (
    .clk(clk),
    .d(\u_flash_write/n4 [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [15]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b16  (
    .clk(clk),
    .d(\u_flash_write/n4 [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [16]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b17  (
    .clk(clk),
    .d(\u_flash_write/n4 [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [17]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b18  (
    .clk(clk),
    .d(\u_flash_write/n4 [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [18]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b19  (
    .clk(clk),
    .d(\u_flash_write/n4 [19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [19]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b2  (
    .clk(clk),
    .d(\u_flash_write/n4 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [2]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b20  (
    .clk(clk),
    .d(\u_flash_write/n4 [20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [20]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b21  (
    .clk(clk),
    .d(\u_flash_write/n4 [21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [21]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b22  (
    .clk(clk),
    .d(\u_flash_write/n4 [22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [22]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b23  (
    .clk(clk),
    .d(\u_flash_write/n4 [23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [23]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b24  (
    .clk(clk),
    .d(\u_flash_write/n4 [24]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [24]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b25  (
    .clk(clk),
    .d(\u_flash_write/n4 [25]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [25]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b26  (
    .clk(clk),
    .d(\u_flash_write/n4 [26]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [26]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b27  (
    .clk(clk),
    .d(\u_flash_write/n4 [27]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [27]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b28  (
    .clk(clk),
    .d(\u_flash_write/n4 [28]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [28]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b29  (
    .clk(clk),
    .d(\u_flash_write/n4 [29]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [29]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b3  (
    .clk(clk),
    .d(\u_flash_write/n4 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [3]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b30  (
    .clk(clk),
    .d(\u_flash_write/n4 [30]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [30]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b31  (
    .clk(clk),
    .d(\u_flash_write/n4 [31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [31]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b32  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [31]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [32]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_ss_w1 \u_flash_write/reg2_b33  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [32]),
    .en(\u_flash_write/sft_wen ),
    .reset(1'b0),
    .set(start_wr),
    .q(\u_flash_write/tx_reg [33]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b34  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [33]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [34]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b35  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [34]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [35]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b36  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [35]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [36]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b37  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [36]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [37]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b38  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [37]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [38]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b39  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [38]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [39]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b4  (
    .clk(clk),
    .d(\u_flash_write/n4 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [4]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b5  (
    .clk(clk),
    .d(\u_flash_write/n4 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [5]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b6  (
    .clk(clk),
    .d(\u_flash_write/n4 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [6]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b7  (
    .clk(clk),
    .d(\u_flash_write/n4 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [7]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b8  (
    .clk(clk),
    .d(\u_flash_write/n4 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [8]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b9  (
    .clk(clk),
    .d(\u_flash_write/n4 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [9]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg3_b0  (
    .clk(clk),
    .d(\u_flash_write/n0 [0]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [0]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b1  (
    .clk(clk),
    .d(\u_flash_write/n0 [1]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [1]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b2  (
    .clk(clk),
    .d(\u_flash_write/n0 [2]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [2]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b3  (
    .clk(clk),
    .d(\u_flash_write/n0 [3]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [3]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b4  (
    .clk(clk),
    .d(\u_flash_write/n0 [4]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [4]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b5  (
    .clk(clk),
    .d(\u_flash_write/n0 [5]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [5]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b6  (
    .clk(clk),
    .d(\u_flash_write/n0 [6]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [6]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b7  (
    .clk(clk),
    .d(\u_flash_write/n0 [7]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [7]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b8  (
    .clk(clk),
    .d(\u_flash_write/n0 [8]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [8]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b9  (
    .clk(clk),
    .d(\u_flash_write/n0 [9]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [9]));  // src/rtl/flash/flash_write.v(61)
  reg_ar_as_w1 \u_flash_write/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_write/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/sft_wen ));  // src/rtl/flash/flash_write.v(103)
  not \u_flash_write/u2  (\u_flash_write/n2 , busy_wr);  // src/rtl/flash/flash_write.v(87)
  add_pu10_pu10_o10 \u_flash_write_enable/add0  (
    .i0(\u_flash_write_enable/cnt ),
    .i1(10'b0000000001),
    .o(\u_flash_write_enable/n0 ));  // src/rtl/flash/flash_write_enable.v(54)
  reg_ar_ss_w1 \u_flash_write_enable/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_write_enable/n6 ),
    .reset(1'b0),
    .set(start_wen),
    .q(busy_wen));  // src/rtl/flash/flash_write_enable.v(120)
  eq_w3 \u_flash_write_enable/eq0  (
    .i0({fls_sck_wen,\u_flash_write_enable/phase_cnt [1:0]}),
    .i1(3'b110),
    .o(\u_flash_write_enable/n5 ));  // src/rtl/flash/flash_write_enable.v(98)
  eq_w7 \u_flash_write_enable/eq1  (
    .i0(\u_flash_write_enable/cycle_cnt ),
    .i1(7'b0001000),
    .o(\u_flash_write_enable/n6 ));  // src/rtl/flash/flash_write_enable.v(118)
  reg_ar_as_w1 \u_flash_write_enable/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_write_enable/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_wen));  // src/rtl/flash/flash_write_enable.v(84)
  reg_ar_as_w1 \u_flash_write_enable/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_wen));  // src/rtl/flash/flash_write_enable.v(75)
  reg_ar_as_w1 \u_flash_write_enable/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_wen));  // src/rtl/flash/flash_write_enable.v(111)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b0  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [0]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b1  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [1]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b2  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [2]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b3  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [3]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b4  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [4]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b5  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [5]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b6  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [6]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg1_b0  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/phase_cnt [0]));  // src/rtl/flash/flash_write_enable.v(69)
  reg_ar_as_w1 \u_flash_write_enable/reg1_b1  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/phase_cnt [1]));  // src/rtl/flash/flash_write_enable.v(69)
  reg_ar_ss_w1 \u_flash_write_enable/reg2_b1  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(1'b0),
    .set(start_wen),
    .q(\u_flash_write_enable/tx_reg [1]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_ar_ss_w1 \u_flash_write_enable/reg2_b2  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [1]),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(1'b0),
    .set(start_wen),
    .q(\u_flash_write_enable/tx_reg [2]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_sr_as_w1 \u_flash_write_enable/reg2_b3  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [2]),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(start_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/tx_reg [3]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_sr_as_w1 \u_flash_write_enable/reg2_b4  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [3]),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(start_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/tx_reg [4]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_sr_as_w1 \u_flash_write_enable/reg2_b5  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [4]),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(start_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/tx_reg [5]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_sr_as_w1 \u_flash_write_enable/reg2_b6  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [5]),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(start_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/tx_reg [6]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_sr_as_w1 \u_flash_write_enable/reg2_b7  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [6]),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(start_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/tx_reg [7]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b0  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [0]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [0]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b1  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [1]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [1]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b2  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [2]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [2]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b3  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [3]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [3]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b4  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [4]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [4]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b5  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [5]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [5]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b6  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [6]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [6]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b7  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [7]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [7]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b8  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [8]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [8]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b9  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [9]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [9]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_ar_as_w1 \u_flash_write_enable/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_write_enable/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/sft_wen ));  // src/rtl/flash/flash_write_enable.v(99)
  not \u_flash_write_enable/u2  (\u_flash_write_enable/n2 , busy_wen);  // src/rtl/flash/flash_write_enable.v(83)

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
  wire [31:0] \u_uart_tx/clk_cnt ;  // src/rtl/uart/uart_tx.v(29)
  wire [3:0] \u_uart_tx/cnt ;  // src/rtl/uart/uart_tx.v(27)
  wire [7:0] \u_uart_tx/data ;  // src/rtl/uart/uart_tx.v(28)
  wire [31:0] \u_uart_tx/n1 ;
  wire [3:0] \u_uart_tx/n10 ;
  wire [31:0] ubus_raddr;  // src/rtl/uart/uart.v(50)
  wire [31:0] ubus_rdata;  // src/rtl/uart/uart.v(52)
  wire [31:0] ubus_waddr;  // src/rtl/uart/uart.v(47)
  wire [31:0] ubus_wdata;  // src/rtl/uart/uart.v(48)
  wire rx_en;  // src/rtl/uart/uart.v(41)
  wire tx_en;  // src/rtl/uart/uart.v(43)
  wire tx_ready;  // src/rtl/uart/uart.v(45)
  wire \u_uart_tx/clk_en ;  // src/rtl/uart/uart_tx.v(26)
  wire \u_uart_tx/mux1_b0_sel_is_1_o ;
  wire \u_uart_tx/n0 ;
  wire \u_uart_tx/n0_neg ;
  wire \u_uart_tx/n13 ;
  wire \u_uart_tx/n4 ;
  wire \u_uart_tx/n7 ;
  wire \u_uart_tx/n8 ;
  wire \u_uart_tx/start ;  // src/rtl/uart/uart_tx.v(25)
  wire ubus_bken;  // src/rtl/uart/uart.v(51)
  wire ubus_ren;  // src/rtl/uart/uart.v(49)
  wire ubus_wen;  // src/rtl/uart/uart.v(46)

  \uart_rx(CLK_RATE=24000000)  u_uart_rx (
    .clk(clk),
    .rx(rx),
    .rx_data(rx_data),
    .rx_en(rx_en));  // src/rtl/uart/uart.v(60)
  add_pu32_pu32_o32 \u_uart_tx/add0  (
    .i0(\u_uart_tx/clk_cnt ),
    .i1(32'b00000000000000000000000000000001),
    .o(\u_uart_tx/n1 ));  // src/rtl/uart/uart_tx.v(40)
  add_pu4_pu4_o4 \u_uart_tx/add1  (
    .i0(\u_uart_tx/cnt ),
    .i1(4'b0001),
    .o(\u_uart_tx/n10 ));  // src/rtl/uart/uart_tx.v(71)
  reg_ar_as_w1 \u_uart_tx/clk_en_reg  (
    .clk(clk),
    .d(\u_uart_tx/n0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/clk_en ));  // src/rtl/uart/uart_tx.v(47)
  eq_w32 \u_uart_tx/eq0  (
    .i0(\u_uart_tx/clk_cnt ),
    .i1(32'b00000000000000000000000011001111),
    .o(\u_uart_tx/n0 ));  // src/rtl/uart/uart_tx.v(37)
  eq_w4 \u_uart_tx/eq1  (
    .i0(\u_uart_tx/cnt ),
    .i1(4'b1010),
    .o(\u_uart_tx/n4 ));  // src/rtl/uart/uart_tx.v(54)
  and \u_uart_tx/mux1_b0_sel_is_1  (\u_uart_tx/mux1_b0_sel_is_1_o , \u_uart_tx/start , \u_uart_tx/n0_neg );
  binary_mux_s4_w1 \u_uart_tx/mux5  (
    .i0(1'b1),
    .i1(1'b0),
    .i10(1'b1),
    .i11(tx),
    .i12(tx),
    .i13(tx),
    .i14(tx),
    .i15(tx),
    .i2(\u_uart_tx/data [0]),
    .i3(\u_uart_tx/data [1]),
    .i4(\u_uart_tx/data [2]),
    .i5(\u_uart_tx/data [3]),
    .i6(\u_uart_tx/data [4]),
    .i7(\u_uart_tx/data [5]),
    .i8(\u_uart_tx/data [6]),
    .i9(\u_uart_tx/data [7]),
    .sel(\u_uart_tx/cnt ),
    .o(\u_uart_tx/n13 ));  // src/rtl/uart/uart_tx.v(89)
  not \u_uart_tx/n0_inv  (\u_uart_tx/n0_neg , \u_uart_tx/n0 );
  reg_ar_as_w1 \u_uart_tx/reg0_b0  (
    .clk(clk),
    .d(tx_data[0]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [0]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b1  (
    .clk(clk),
    .d(tx_data[1]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [1]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b2  (
    .clk(clk),
    .d(tx_data[2]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [2]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b3  (
    .clk(clk),
    .d(tx_data[3]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [3]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b4  (
    .clk(clk),
    .d(tx_data[4]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [4]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b5  (
    .clk(clk),
    .d(tx_data[5]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [5]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b6  (
    .clk(clk),
    .d(tx_data[6]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [6]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b7  (
    .clk(clk),
    .d(tx_data[7]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [7]));  // src/rtl/uart/uart_tx.v(63)
  reg_sr_as_w1 \u_uart_tx/reg1_b0  (
    .clk(clk),
    .d(\u_uart_tx/n10 [0]),
    .en(\u_uart_tx/clk_en ),
    .reset(~\u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart_tx/cnt [0]));  // src/rtl/uart/uart_tx.v(72)
  reg_sr_as_w1 \u_uart_tx/reg1_b1  (
    .clk(clk),
    .d(\u_uart_tx/n10 [1]),
    .en(\u_uart_tx/clk_en ),
    .reset(~\u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart_tx/cnt [1]));  // src/rtl/uart/uart_tx.v(72)
  reg_sr_as_w1 \u_uart_tx/reg1_b2  (
    .clk(clk),
    .d(\u_uart_tx/n10 [2]),
    .en(\u_uart_tx/clk_en ),
    .reset(~\u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart_tx/cnt [2]));  // src/rtl/uart/uart_tx.v(72)
  reg_sr_as_w1 \u_uart_tx/reg1_b3  (
    .clk(clk),
    .d(\u_uart_tx/n10 [3]),
    .en(\u_uart_tx/clk_en ),
    .reset(~\u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart_tx/cnt [3]));  // src/rtl/uart/uart_tx.v(72)
  reg_sr_as_w1 \u_uart_tx/reg2_b0  (
    .clk(clk),
    .d(\u_uart_tx/n1 [0]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [0]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b1  (
    .clk(clk),
    .d(\u_uart_tx/n1 [1]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [1]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b10  (
    .clk(clk),
    .d(\u_uart_tx/n1 [10]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [10]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b11  (
    .clk(clk),
    .d(\u_uart_tx/n1 [11]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [11]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b12  (
    .clk(clk),
    .d(\u_uart_tx/n1 [12]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [12]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b13  (
    .clk(clk),
    .d(\u_uart_tx/n1 [13]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [13]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b14  (
    .clk(clk),
    .d(\u_uart_tx/n1 [14]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [14]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b15  (
    .clk(clk),
    .d(\u_uart_tx/n1 [15]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [15]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b16  (
    .clk(clk),
    .d(\u_uart_tx/n1 [16]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [16]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b17  (
    .clk(clk),
    .d(\u_uart_tx/n1 [17]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [17]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b18  (
    .clk(clk),
    .d(\u_uart_tx/n1 [18]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [18]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b19  (
    .clk(clk),
    .d(\u_uart_tx/n1 [19]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [19]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b2  (
    .clk(clk),
    .d(\u_uart_tx/n1 [2]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [2]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b20  (
    .clk(clk),
    .d(\u_uart_tx/n1 [20]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [20]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b21  (
    .clk(clk),
    .d(\u_uart_tx/n1 [21]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [21]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b22  (
    .clk(clk),
    .d(\u_uart_tx/n1 [22]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [22]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b23  (
    .clk(clk),
    .d(\u_uart_tx/n1 [23]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [23]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b24  (
    .clk(clk),
    .d(\u_uart_tx/n1 [24]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [24]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b25  (
    .clk(clk),
    .d(\u_uart_tx/n1 [25]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [25]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b26  (
    .clk(clk),
    .d(\u_uart_tx/n1 [26]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [26]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b27  (
    .clk(clk),
    .d(\u_uart_tx/n1 [27]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [27]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b28  (
    .clk(clk),
    .d(\u_uart_tx/n1 [28]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [28]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b29  (
    .clk(clk),
    .d(\u_uart_tx/n1 [29]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [29]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b3  (
    .clk(clk),
    .d(\u_uart_tx/n1 [3]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [3]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b30  (
    .clk(clk),
    .d(\u_uart_tx/n1 [30]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [30]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b31  (
    .clk(clk),
    .d(\u_uart_tx/n1 [31]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [31]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b4  (
    .clk(clk),
    .d(\u_uart_tx/n1 [4]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [4]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b5  (
    .clk(clk),
    .d(\u_uart_tx/n1 [5]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [5]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b6  (
    .clk(clk),
    .d(\u_uart_tx/n1 [6]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [6]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b7  (
    .clk(clk),
    .d(\u_uart_tx/n1 [7]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [7]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b8  (
    .clk(clk),
    .d(\u_uart_tx/n1 [8]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [8]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b9  (
    .clk(clk),
    .d(\u_uart_tx/n1 [9]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [9]));  // src/rtl/uart/uart_tx.v(41)
  reg_ar_ss_w1 \u_uart_tx/start_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_uart_tx/n4 ),
    .reset(1'b0),
    .set(tx_en),
    .q(\u_uart_tx/start ));  // src/rtl/uart/uart_tx.v(56)
  reg_sr_as_w1 \u_uart_tx/tx_ready_reg  (
    .clk(clk),
    .d(\u_uart_tx/n7 ),
    .en(1'b1),
    .reset(tx_en),
    .set(1'b0),
    .q(tx_ready));  // src/rtl/uart/uart_tx.v(99)
  reg_ar_as_w1 \u_uart_tx/tx_reg  (
    .clk(clk),
    .d(\u_uart_tx/n13 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx));  // src/rtl/uart/uart_tx.v(90)
  not \u_uart_tx/u4  (\u_uart_tx/n7 , \u_uart_tx/start );  // src/rtl/uart/uart_tx.v(61)
  and \u_uart_tx/u5  (\u_uart_tx/n8 , tx_en, \u_uart_tx/n7 );  // src/rtl/uart/uart_tx.v(61)
  ubus u_ubus (
    .busy(busy),
    .clk(clk),
    .fls_read(fls_read),
    .id(id),
    .ubus_raddr(ubus_raddr),
    .ubus_ren(ubus_ren),
    .ubus_waddr(ubus_waddr),
    .ubus_wdata({open_n0,open_n1,open_n2,open_n3,open_n4,open_n5,open_n6,open_n7,ubus_wdata[23:0]}),
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
    .ubus_wdata({open_n8,open_n9,open_n10,open_n11,open_n12,open_n13,open_n14,open_n15,ubus_wdata[23:0]}),
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

module add_pu10_pu10_o10
  (
  i0,
  i1,
  o
  );

  input [9:0] i0;
  input [9:0] i1;
  output [9:0] o;

  wire net_a0;
  wire net_a1;
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
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

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

module eq_w7
  (
  i0,
  i1,
  o
  );

  input [6:0] i0;
  input [6:0] i1;
  output o;

  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[3]_i1[3_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[1]_i1[1]_o_o ;
  wire \or_xor_i0[3]_i1[3]_o_o ;
  wire \or_xor_i0[5]_i1[5]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;

  not none_diff (o, \or_or_xor_i0[0]_i1[0_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_or_xor_i0[3]_i1[3_o );
  or \or_or_xor_i0[3]_i1[3  (\or_or_xor_i0[3]_i1[3_o , \or_xor_i0[3]_i1[3]_o_o , \or_xor_i0[5]_i1[5]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \or_xor_i0[1]_i1[1]_o_o );
  or \or_xor_i0[1]_i1[1]_o  (\or_xor_i0[1]_i1[1]_o_o , \xor_i0[1]_i1[1]_o , \xor_i0[2]_i1[2]_o );
  or \or_xor_i0[3]_i1[3]_o  (\or_xor_i0[3]_i1[3]_o_o , \xor_i0[3]_i1[3]_o , \xor_i0[4]_i1[4]_o );
  or \or_xor_i0[5]_i1[5]_o  (\or_xor_i0[5]_i1[5]_o_o , \xor_i0[5]_i1[5]_o , \xor_i0[6]_i1[6]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);

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
  wire [23:0] n15;
  wire [2:0] phase_cnt;  // src/rtl/flash/flash_fast_read.v(43)
  wire [7:0] rx_reg;  // src/rtl/flash/flash_fast_read.v(45)
  wire [31:0] tx_reg;  // src/rtl/flash/flash_fast_read.v(44)
  wire byte_flag;  // src/rtl/flash/flash_fast_read.v(48)
  wire n10;
  wire n11;
  wire n12;
  wire n18;
  wire n2;
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
  reg_ar_ss_w1 busy_reg (
    .clk(clk),
    .d(1'b0),
    .en(n18),
    .reset(1'b0),
    .set(start),
    .q(busy));  // src/rtl/flash/flash_fast_read.v(163)
  reg_ar_as_w1 byte_flag_reg (
    .clk(clk),
    .d(n12),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(byte_flag));  // src/rtl/flash/flash_fast_read.v(119)
  reg_ar_as_w1 dout_en_reg (
    .clk(clk),
    .d(byte_flag),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(dout_en));  // src/rtl/flash/flash_fast_read.v(138)
  eq_w3 eq0 (
    .i0({fls_sck,phase_cnt[1:0]}),
    .i1(3'b110),
    .o(n5));  // src/rtl/flash/flash_fast_read.v(106)
  eq_w3 eq1 (
    .i0({fls_sck,phase_cnt[1:0]}),
    .i1(3'b011),
    .o(n6));  // src/rtl/flash/flash_fast_read.v(112)
  eq_w3 eq2 (
    .i0(cycle_cnt[2:0]),
    .i1(3'b111),
    .o(n9));  // src/rtl/flash/flash_fast_read.v(118)
  eq_w3 eq3 (
    .i0({fls_sck,phase_cnt[1:0]}),
    .i1(3'b101),
    .o(n11));  // src/rtl/flash/flash_fast_read.v(118)
  eq_w29 eq4 (
    .i0(cycle_cnt),
    .i1(29'b01000000000000000000000101000),
    .o(n18));  // src/rtl/flash/flash_fast_read.v(161)
  reg_ar_as_w1 fls_ncs_reg (
    .clk(clk),
    .d(n2),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs));  // src/rtl/flash/flash_fast_read.v(92)
  reg_ar_as_w1 fls_sck_reg (
    .clk(clk),
    .d(cnt[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck));  // src/rtl/flash/flash_fast_read.v(83)
  reg_ar_as_w1 fls_sdo_reg (
    .clk(clk),
    .d(tx_reg[31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo));  // src/rtl/flash/flash_fast_read.v(125)
  lt_u29_u29 lt0 (
    .ci(1'b0),
    .i0(29'b00000000000000000000000100111),
    .i1(cycle_cnt),
    .o(n7));  // src/rtl/flash/flash_fast_read.v(112)
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(cnt[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[0]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(cnt[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[1]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b10 (
    .clk(clk),
    .d(cnt[13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[10]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b11 (
    .clk(clk),
    .d(cnt[14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[11]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b12 (
    .clk(clk),
    .d(cnt[15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[12]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b13 (
    .clk(clk),
    .d(cnt[16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[13]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b14 (
    .clk(clk),
    .d(cnt[17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[14]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b15 (
    .clk(clk),
    .d(cnt[18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[15]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b16 (
    .clk(clk),
    .d(cnt[19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[16]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b17 (
    .clk(clk),
    .d(cnt[20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[17]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b18 (
    .clk(clk),
    .d(cnt[21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[18]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b19 (
    .clk(clk),
    .d(cnt[22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[19]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(cnt[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[2]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b20 (
    .clk(clk),
    .d(cnt[23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[20]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b21 (
    .clk(clk),
    .d(cnt[24]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[21]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b22 (
    .clk(clk),
    .d(cnt[25]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[22]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b23 (
    .clk(clk),
    .d(cnt[26]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[23]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b24 (
    .clk(clk),
    .d(cnt[27]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[24]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b25 (
    .clk(clk),
    .d(cnt[28]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[25]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b26 (
    .clk(clk),
    .d(cnt[29]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[26]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b27 (
    .clk(clk),
    .d(cnt[30]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[27]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b28 (
    .clk(clk),
    .d(cnt[31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[28]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(cnt[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[3]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk),
    .d(cnt[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[4]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk),
    .d(cnt[8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[5]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk),
    .d(cnt[9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[6]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk),
    .d(cnt[10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[7]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b8 (
    .clk(clk),
    .d(cnt[11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[8]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b9 (
    .clk(clk),
    .d(cnt[12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[9]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk),
    .d(cnt[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(phase_cnt[0]));  // src/rtl/flash/flash_fast_read.v(77)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk),
    .d(cnt[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(phase_cnt[1]));  // src/rtl/flash/flash_fast_read.v(77)
  reg_ar_ss_w1 reg2_b24 (
    .clk(clk),
    .d(1'b0),
    .en(sft_wen),
    .reset(1'b0),
    .set(start),
    .q(tx_reg[24]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_ar_ss_w1 reg2_b25 (
    .clk(clk),
    .d(tx_reg[24]),
    .en(sft_wen),
    .reset(1'b0),
    .set(start),
    .q(tx_reg[25]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_sr_as_w1 reg2_b26 (
    .clk(clk),
    .d(tx_reg[25]),
    .en(sft_wen),
    .reset(start),
    .set(1'b0),
    .q(tx_reg[26]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_ar_ss_w1 reg2_b27 (
    .clk(clk),
    .d(tx_reg[26]),
    .en(sft_wen),
    .reset(1'b0),
    .set(start),
    .q(tx_reg[27]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_sr_as_w1 reg2_b28 (
    .clk(clk),
    .d(tx_reg[27]),
    .en(sft_wen),
    .reset(start),
    .set(1'b0),
    .q(tx_reg[28]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_sr_as_w1 reg2_b29 (
    .clk(clk),
    .d(tx_reg[28]),
    .en(sft_wen),
    .reset(start),
    .set(1'b0),
    .q(tx_reg[29]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_sr_as_w1 reg2_b30 (
    .clk(clk),
    .d(tx_reg[29]),
    .en(sft_wen),
    .reset(start),
    .set(1'b0),
    .q(tx_reg[30]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_sr_as_w1 reg2_b31 (
    .clk(clk),
    .d(tx_reg[30]),
    .en(sft_wen),
    .reset(start),
    .set(1'b0),
    .q(tx_reg[31]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk),
    .d(fls_sdi),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[0]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk),
    .d(rx_reg[0]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[1]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk),
    .d(rx_reg[1]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[2]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b3 (
    .clk(clk),
    .d(rx_reg[2]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[3]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b4 (
    .clk(clk),
    .d(rx_reg[3]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[4]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b5 (
    .clk(clk),
    .d(rx_reg[4]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[5]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b6 (
    .clk(clk),
    .d(rx_reg[5]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[6]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b7 (
    .clk(clk),
    .d(rx_reg[6]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[7]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk),
    .d(rx_reg[0]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[0]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk),
    .d(rx_reg[1]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[1]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b2 (
    .clk(clk),
    .d(rx_reg[2]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[2]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b3 (
    .clk(clk),
    .d(rx_reg[3]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[3]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b4 (
    .clk(clk),
    .d(rx_reg[4]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[4]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b5 (
    .clk(clk),
    .d(rx_reg[5]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[5]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b6 (
    .clk(clk),
    .d(rx_reg[6]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[6]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b7 (
    .clk(clk),
    .d(rx_reg[7]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[7]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_ss_w1 reg5_b0 (
    .clk(clk),
    .d(n15[0]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[0]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b1 (
    .clk(clk),
    .d(n15[1]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[1]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b10 (
    .clk(clk),
    .d(n15[10]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[10]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b11 (
    .clk(clk),
    .d(n15[11]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[11]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b12 (
    .clk(clk),
    .d(n15[12]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[12]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b13 (
    .clk(clk),
    .d(n15[13]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[13]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b14 (
    .clk(clk),
    .d(n15[14]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[14]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b15 (
    .clk(clk),
    .d(n15[15]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[15]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b16 (
    .clk(clk),
    .d(n15[16]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[16]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b17 (
    .clk(clk),
    .d(n15[17]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[17]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b18 (
    .clk(clk),
    .d(n15[18]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[18]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b19 (
    .clk(clk),
    .d(n15[19]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[19]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b2 (
    .clk(clk),
    .d(n15[2]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[2]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b20 (
    .clk(clk),
    .d(n15[20]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[20]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b21 (
    .clk(clk),
    .d(n15[21]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[21]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b22 (
    .clk(clk),
    .d(n15[22]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[22]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b23 (
    .clk(clk),
    .d(n15[23]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[23]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b3 (
    .clk(clk),
    .d(n15[3]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[3]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b4 (
    .clk(clk),
    .d(n15[4]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[4]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b5 (
    .clk(clk),
    .d(n15[5]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[5]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b6 (
    .clk(clk),
    .d(n15[6]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[6]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b7 (
    .clk(clk),
    .d(n15[7]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[7]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b8 (
    .clk(clk),
    .d(n15[8]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[8]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b9 (
    .clk(clk),
    .d(n15[9]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[9]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_sr_as_w1 reg6_b0 (
    .clk(clk),
    .d(n0[0]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[0]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b1 (
    .clk(clk),
    .d(n0[1]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[1]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b10 (
    .clk(clk),
    .d(n0[10]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[10]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b11 (
    .clk(clk),
    .d(n0[11]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[11]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b12 (
    .clk(clk),
    .d(n0[12]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[12]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b13 (
    .clk(clk),
    .d(n0[13]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[13]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b14 (
    .clk(clk),
    .d(n0[14]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[14]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b15 (
    .clk(clk),
    .d(n0[15]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[15]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b16 (
    .clk(clk),
    .d(n0[16]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[16]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b17 (
    .clk(clk),
    .d(n0[17]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[17]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b18 (
    .clk(clk),
    .d(n0[18]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[18]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b19 (
    .clk(clk),
    .d(n0[19]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[19]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b2 (
    .clk(clk),
    .d(n0[2]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[2]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b20 (
    .clk(clk),
    .d(n0[20]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[20]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b21 (
    .clk(clk),
    .d(n0[21]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[21]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b22 (
    .clk(clk),
    .d(n0[22]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[22]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b23 (
    .clk(clk),
    .d(n0[23]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[23]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b24 (
    .clk(clk),
    .d(n0[24]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[24]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b25 (
    .clk(clk),
    .d(n0[25]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[25]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b26 (
    .clk(clk),
    .d(n0[26]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[26]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b27 (
    .clk(clk),
    .d(n0[27]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[27]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b28 (
    .clk(clk),
    .d(n0[28]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[28]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b29 (
    .clk(clk),
    .d(n0[29]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[29]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b3 (
    .clk(clk),
    .d(n0[3]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[3]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b30 (
    .clk(clk),
    .d(n0[30]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[30]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b31 (
    .clk(clk),
    .d(n0[31]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[31]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b4 (
    .clk(clk),
    .d(n0[4]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[4]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b5 (
    .clk(clk),
    .d(n0[5]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[5]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b6 (
    .clk(clk),
    .d(n0[6]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[6]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b7 (
    .clk(clk),
    .d(n0[7]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[7]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b8 (
    .clk(clk),
    .d(n0[8]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[8]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b9 (
    .clk(clk),
    .d(n0[9]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[9]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_ar_as_w1 sft_ren_reg (
    .clk(clk),
    .d(n8),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_ren));  // src/rtl/flash/flash_fast_read.v(113)
  reg_ar_as_w1 sft_wen_reg (
    .clk(clk),
    .d(n5),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_wen));  // src/rtl/flash/flash_fast_read.v(107)
  not u2 (n2, busy);  // src/rtl/flash/flash_fast_read.v(91)
  and u3 (n8, n6, n7);  // src/rtl/flash/flash_fast_read.v(112)
  and u4 (n10, n7, n9);  // src/rtl/flash/flash_fast_read.v(118)
  and u5 (n12, n10, n11);  // src/rtl/flash/flash_fast_read.v(118)

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

  wire a_0;
  wire a_1;
  wire a_2;
  wire a_3;
  wire a_4;
  wire a_5;
  wire a_6;
  wire b_0;
  wire b_1;
  wire b_2;
  wire b_3;
  wire b_4;
  wire b_5;
  wire b_6;
  wire diff_0;
  wire diff_1;
  wire diff_2;
  wire diff_3;
  wire diff_4;
  wire diff_5;
  wire diff_6;
  wire net_cin;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;
  wire o_6;

  assign net_cin = ci;
  assign a_6 = i0[6];
  assign a_5 = i0[5];
  assign a_4 = i0[4];
  assign a_3 = i0[3];
  assign a_2 = i0[2];
  assign a_1 = i0[1];
  assign a_0 = i0[0];
  assign b_6 = i1[6];
  assign b_5 = i1[5];
  assign b_4 = i1[4];
  assign b_3 = i1[3];
  assign b_2 = i1[2];
  assign b_1 = i1[1];
  assign b_0 = i1[0];
  assign o = o_6;
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
  AL_MUX mux_3 (
    .i0(o_2),
    .i1(b_3),
    .sel(diff_3),
    .o(o_3));
  AL_MUX mux_4 (
    .i0(o_3),
    .i1(b_4),
    .sel(diff_4),
    .o(o_4));
  AL_MUX mux_5 (
    .i0(o_4),
    .i1(b_5),
    .sel(diff_5),
    .o(o_5));
  AL_MUX mux_6 (
    .i0(o_5),
    .i1(b_6),
    .sel(diff_6),
    .o(o_6));
  xor xor_0 (diff_0, a_0, b_0);
  xor xor_1 (diff_1, a_1, b_1);
  xor xor_2 (diff_2, a_2, b_2);
  xor xor_3 (diff_3, a_3, b_3);
  xor xor_4 (diff_4, a_4, b_4);
  xor xor_5 (diff_5, a_5, b_5);
  xor xor_6 (diff_6, a_6, b_6);

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

module add_pu32_pu32_o32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output [31:0] o;

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
  wire net_a25;
  wire net_a26;
  wire net_a27;
  wire net_a28;
  wire net_a29;
  wire net_a3;
  wire net_a30;
  wire net_a31;
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
  wire net_b25;
  wire net_b26;
  wire net_b27;
  wire net_b28;
  wire net_b29;
  wire net_b3;
  wire net_b30;
  wire net_b31;
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
  wire net_cout25;
  wire net_cout26;
  wire net_cout27;
  wire net_cout28;
  wire net_cout29;
  wire net_cout3;
  wire net_cout30;
  wire net_cout31;
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
  wire net_sum25;
  wire net_sum26;
  wire net_sum27;
  wire net_sum28;
  wire net_sum29;
  wire net_sum3;
  wire net_sum30;
  wire net_sum31;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a31 = i0[31];
  assign net_a30 = i0[30];
  assign net_a29 = i0[29];
  assign net_a28 = i0[28];
  assign net_a27 = i0[27];
  assign net_a26 = i0[26];
  assign net_a25 = i0[25];
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
  assign net_b31 = i1[31];
  assign net_b30 = i1[30];
  assign net_b29 = i1[29];
  assign net_b28 = i1[28];
  assign net_b27 = i1[27];
  assign net_b26 = i1[26];
  assign net_b25 = i1[25];
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
  assign o[31] = net_sum31;
  assign o[30] = net_sum30;
  assign o[29] = net_sum29;
  assign o[28] = net_sum28;
  assign o[27] = net_sum27;
  assign o[26] = net_sum26;
  assign o[25] = net_sum25;
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
  AL_FADD comp_25 (
    .a(net_a25),
    .b(net_b25),
    .c(net_cout24),
    .cout(net_cout25),
    .sum(net_sum25));
  AL_FADD comp_26 (
    .a(net_a26),
    .b(net_b26),
    .c(net_cout25),
    .cout(net_cout26),
    .sum(net_sum26));
  AL_FADD comp_27 (
    .a(net_a27),
    .b(net_b27),
    .c(net_cout26),
    .cout(net_cout27),
    .sum(net_sum27));
  AL_FADD comp_28 (
    .a(net_a28),
    .b(net_b28),
    .c(net_cout27),
    .cout(net_cout28),
    .sum(net_sum28));
  AL_FADD comp_29 (
    .a(net_a29),
    .b(net_b29),
    .c(net_cout28),
    .cout(net_cout29),
    .sum(net_sum29));
  AL_FADD comp_3 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD comp_30 (
    .a(net_a30),
    .b(net_b30),
    .c(net_cout29),
    .cout(net_cout30),
    .sum(net_sum30));
  AL_FADD comp_31 (
    .a(net_a31),
    .b(net_b31),
    .c(net_cout30),
    .cout(net_cout31),
    .sum(net_sum31));
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

module eq_w1
  (
  i0,
  i1,
  o
  );

  input i0;
  input i1;
  output o;

  wire xor_i0_i1_o;

  not none_diff (o, xor_i0_i1_o);
  xor xor_i0_i1 (xor_i0_i1_o, i0, i1);

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

  wire [28:0] diff;
  wire diff_12_18;
  wire diff_19_26;
  wire diff_27_28;
  wire diff_6_11;
  wire less_12_18;
  wire \less_12_18_inst/diff_0 ;
  wire \less_12_18_inst/diff_1 ;
  wire \less_12_18_inst/diff_2 ;
  wire \less_12_18_inst/diff_3 ;
  wire \less_12_18_inst/diff_4 ;
  wire \less_12_18_inst/diff_5 ;
  wire \less_12_18_inst/diff_6 ;
  wire \less_12_18_inst/o_0 ;
  wire \less_12_18_inst/o_1 ;
  wire \less_12_18_inst/o_2 ;
  wire \less_12_18_inst/o_3 ;
  wire \less_12_18_inst/o_4 ;
  wire \less_12_18_inst/o_5 ;
  wire less_19_26;
  wire \less_19_26_inst/diff_0 ;
  wire \less_19_26_inst/diff_1 ;
  wire \less_19_26_inst/diff_2 ;
  wire \less_19_26_inst/diff_3 ;
  wire \less_19_26_inst/diff_4 ;
  wire \less_19_26_inst/diff_5 ;
  wire \less_19_26_inst/diff_6 ;
  wire \less_19_26_inst/diff_7 ;
  wire \less_19_26_inst/o_0 ;
  wire \less_19_26_inst/o_1 ;
  wire \less_19_26_inst/o_2 ;
  wire \less_19_26_inst/o_3 ;
  wire \less_19_26_inst/o_4 ;
  wire \less_19_26_inst/o_5 ;
  wire \less_19_26_inst/o_6 ;
  wire less_27_28;
  wire \less_27_28_inst/diff_0 ;
  wire \less_27_28_inst/diff_1 ;
  wire \less_27_28_inst/o_0 ;
  wire less_6_11;
  wire \less_6_11_inst/diff_0 ;
  wire \less_6_11_inst/diff_1 ;
  wire \less_6_11_inst/diff_2 ;
  wire \less_6_11_inst/diff_3 ;
  wire \less_6_11_inst/diff_4 ;
  wire \less_6_11_inst/diff_5 ;
  wire \less_6_11_inst/o_0 ;
  wire \less_6_11_inst/o_1 ;
  wire \less_6_11_inst/o_2 ;
  wire \less_6_11_inst/o_3 ;
  wire \less_6_11_inst/o_4 ;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;
  wire o_6;
  wire o_7;
  wire o_8;

  or any_diff_12_18 (diff_12_18, diff[12], diff[13], diff[14], diff[15], diff[16], diff[17], diff[18]);
  or any_diff_19_26 (diff_19_26, diff[19], diff[20], diff[21], diff[22], diff[23], diff[24], diff[25], diff[26]);
  or any_diff_27_28 (diff_27_28, diff[27], diff[28]);
  or any_diff_6_11 (diff_6_11, diff[6], diff[7], diff[8], diff[9], diff[10], diff[11]);
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
  xor diff_3 (diff[3], i0[3], i1[3]);
  xor diff_4 (diff[4], i0[4], i1[4]);
  xor diff_5 (diff[5], i0[5], i1[5]);
  xor diff_6 (diff[6], i0[6], i1[6]);
  xor diff_7 (diff[7], i0[7], i1[7]);
  xor diff_8 (diff[8], i0[8], i1[8]);
  xor diff_9 (diff[9], i0[9], i1[9]);
  AL_MUX \less_12_18_inst/mux_0  (
    .i0(1'b0),
    .i1(i1[12]),
    .sel(\less_12_18_inst/diff_0 ),
    .o(\less_12_18_inst/o_0 ));
  AL_MUX \less_12_18_inst/mux_1  (
    .i0(\less_12_18_inst/o_0 ),
    .i1(i1[13]),
    .sel(\less_12_18_inst/diff_1 ),
    .o(\less_12_18_inst/o_1 ));
  AL_MUX \less_12_18_inst/mux_2  (
    .i0(\less_12_18_inst/o_1 ),
    .i1(i1[14]),
    .sel(\less_12_18_inst/diff_2 ),
    .o(\less_12_18_inst/o_2 ));
  AL_MUX \less_12_18_inst/mux_3  (
    .i0(\less_12_18_inst/o_2 ),
    .i1(i1[15]),
    .sel(\less_12_18_inst/diff_3 ),
    .o(\less_12_18_inst/o_3 ));
  AL_MUX \less_12_18_inst/mux_4  (
    .i0(\less_12_18_inst/o_3 ),
    .i1(i1[16]),
    .sel(\less_12_18_inst/diff_4 ),
    .o(\less_12_18_inst/o_4 ));
  AL_MUX \less_12_18_inst/mux_5  (
    .i0(\less_12_18_inst/o_4 ),
    .i1(i1[17]),
    .sel(\less_12_18_inst/diff_5 ),
    .o(\less_12_18_inst/o_5 ));
  AL_MUX \less_12_18_inst/mux_6  (
    .i0(\less_12_18_inst/o_5 ),
    .i1(i1[18]),
    .sel(\less_12_18_inst/diff_6 ),
    .o(less_12_18));
  xor \less_12_18_inst/xor_0  (\less_12_18_inst/diff_0 , i0[12], i1[12]);
  xor \less_12_18_inst/xor_1  (\less_12_18_inst/diff_1 , i0[13], i1[13]);
  xor \less_12_18_inst/xor_2  (\less_12_18_inst/diff_2 , i0[14], i1[14]);
  xor \less_12_18_inst/xor_3  (\less_12_18_inst/diff_3 , i0[15], i1[15]);
  xor \less_12_18_inst/xor_4  (\less_12_18_inst/diff_4 , i0[16], i1[16]);
  xor \less_12_18_inst/xor_5  (\less_12_18_inst/diff_5 , i0[17], i1[17]);
  xor \less_12_18_inst/xor_6  (\less_12_18_inst/diff_6 , i0[18], i1[18]);
  AL_MUX \less_19_26_inst/mux_0  (
    .i0(1'b0),
    .i1(i1[19]),
    .sel(\less_19_26_inst/diff_0 ),
    .o(\less_19_26_inst/o_0 ));
  AL_MUX \less_19_26_inst/mux_1  (
    .i0(\less_19_26_inst/o_0 ),
    .i1(i1[20]),
    .sel(\less_19_26_inst/diff_1 ),
    .o(\less_19_26_inst/o_1 ));
  AL_MUX \less_19_26_inst/mux_2  (
    .i0(\less_19_26_inst/o_1 ),
    .i1(i1[21]),
    .sel(\less_19_26_inst/diff_2 ),
    .o(\less_19_26_inst/o_2 ));
  AL_MUX \less_19_26_inst/mux_3  (
    .i0(\less_19_26_inst/o_2 ),
    .i1(i1[22]),
    .sel(\less_19_26_inst/diff_3 ),
    .o(\less_19_26_inst/o_3 ));
  AL_MUX \less_19_26_inst/mux_4  (
    .i0(\less_19_26_inst/o_3 ),
    .i1(i1[23]),
    .sel(\less_19_26_inst/diff_4 ),
    .o(\less_19_26_inst/o_4 ));
  AL_MUX \less_19_26_inst/mux_5  (
    .i0(\less_19_26_inst/o_4 ),
    .i1(i1[24]),
    .sel(\less_19_26_inst/diff_5 ),
    .o(\less_19_26_inst/o_5 ));
  AL_MUX \less_19_26_inst/mux_6  (
    .i0(\less_19_26_inst/o_5 ),
    .i1(i1[25]),
    .sel(\less_19_26_inst/diff_6 ),
    .o(\less_19_26_inst/o_6 ));
  AL_MUX \less_19_26_inst/mux_7  (
    .i0(\less_19_26_inst/o_6 ),
    .i1(i1[26]),
    .sel(\less_19_26_inst/diff_7 ),
    .o(less_19_26));
  xor \less_19_26_inst/xor_0  (\less_19_26_inst/diff_0 , i0[19], i1[19]);
  xor \less_19_26_inst/xor_1  (\less_19_26_inst/diff_1 , i0[20], i1[20]);
  xor \less_19_26_inst/xor_2  (\less_19_26_inst/diff_2 , i0[21], i1[21]);
  xor \less_19_26_inst/xor_3  (\less_19_26_inst/diff_3 , i0[22], i1[22]);
  xor \less_19_26_inst/xor_4  (\less_19_26_inst/diff_4 , i0[23], i1[23]);
  xor \less_19_26_inst/xor_5  (\less_19_26_inst/diff_5 , i0[24], i1[24]);
  xor \less_19_26_inst/xor_6  (\less_19_26_inst/diff_6 , i0[25], i1[25]);
  xor \less_19_26_inst/xor_7  (\less_19_26_inst/diff_7 , i0[26], i1[26]);
  AL_MUX \less_27_28_inst/mux_0  (
    .i0(1'b0),
    .i1(i1[27]),
    .sel(\less_27_28_inst/diff_0 ),
    .o(\less_27_28_inst/o_0 ));
  AL_MUX \less_27_28_inst/mux_1  (
    .i0(\less_27_28_inst/o_0 ),
    .i1(i1[28]),
    .sel(\less_27_28_inst/diff_1 ),
    .o(less_27_28));
  xor \less_27_28_inst/xor_0  (\less_27_28_inst/diff_0 , i0[27], i1[27]);
  xor \less_27_28_inst/xor_1  (\less_27_28_inst/diff_1 , i0[28], i1[28]);
  AL_MUX \less_6_11_inst/mux_0  (
    .i0(1'b0),
    .i1(i1[6]),
    .sel(\less_6_11_inst/diff_0 ),
    .o(\less_6_11_inst/o_0 ));
  AL_MUX \less_6_11_inst/mux_1  (
    .i0(\less_6_11_inst/o_0 ),
    .i1(i1[7]),
    .sel(\less_6_11_inst/diff_1 ),
    .o(\less_6_11_inst/o_1 ));
  AL_MUX \less_6_11_inst/mux_2  (
    .i0(\less_6_11_inst/o_1 ),
    .i1(i1[8]),
    .sel(\less_6_11_inst/diff_2 ),
    .o(\less_6_11_inst/o_2 ));
  AL_MUX \less_6_11_inst/mux_3  (
    .i0(\less_6_11_inst/o_2 ),
    .i1(i1[9]),
    .sel(\less_6_11_inst/diff_3 ),
    .o(\less_6_11_inst/o_3 ));
  AL_MUX \less_6_11_inst/mux_4  (
    .i0(\less_6_11_inst/o_3 ),
    .i1(i1[10]),
    .sel(\less_6_11_inst/diff_4 ),
    .o(\less_6_11_inst/o_4 ));
  AL_MUX \less_6_11_inst/mux_5  (
    .i0(\less_6_11_inst/o_4 ),
    .i1(i1[11]),
    .sel(\less_6_11_inst/diff_5 ),
    .o(less_6_11));
  xor \less_6_11_inst/xor_0  (\less_6_11_inst/diff_0 , i0[6], i1[6]);
  xor \less_6_11_inst/xor_1  (\less_6_11_inst/diff_1 , i0[7], i1[7]);
  xor \less_6_11_inst/xor_2  (\less_6_11_inst/diff_2 , i0[8], i1[8]);
  xor \less_6_11_inst/xor_3  (\less_6_11_inst/diff_3 , i0[9], i1[9]);
  xor \less_6_11_inst/xor_4  (\less_6_11_inst/diff_4 , i0[10], i1[10]);
  xor \less_6_11_inst/xor_5  (\less_6_11_inst/diff_5 , i0[11], i1[11]);
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
    .i1(less_6_11),
    .sel(diff_6_11),
    .o(o_6));
  AL_MUX mux_7 (
    .i0(o_6),
    .i1(less_12_18),
    .sel(diff_12_18),
    .o(o_7));
  AL_MUX mux_8 (
    .i0(o_7),
    .i1(less_19_26),
    .sel(diff_19_26),
    .o(o_8));
  AL_MUX mux_9 (
    .i0(o_8),
    .i1(less_27_28),
    .sel(diff_27_28),
    .o(o));

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
  wire [31:0] n7;
  wire [31:0] n8;
  wire [1:0] rx_d;  // src/rtl/uart/uart_rx.v(28)
  wire clk_en;  // src/rtl/uart/uart_rx.v(25)
  wire mux1_b0_sel_is_1_o;
  wire mux4_b0_sel_is_3_o;
  wire mux4_b1_sel_is_3_o;
  wire mux4_b2_sel_is_3_o;
  wire mux4_b3_sel_is_3_o;
  wire mux4_b4_sel_is_3_o;
  wire mux4_b5_sel_is_3_o;
  wire mux4_b6_sel_is_3_o;
  wire mux4_b7_sel_is_3_o;
  wire n0;
  wire n1;
  wire n16;
  wire n17;
  wire n18;
  wire n19;
  wire n20;
  wire n21;
  wire n22;
  wire n23;
  wire n28;
  wire n5;
  wire n5_neg;
  wire start;  // src/rtl/uart/uart_rx.v(24)

  add_pu32_pu32_o32 add0 (
    .i0(clk_cnt),
    .i1(32'b00000000000000000000000000000001),
    .o(n7));  // src/rtl/uart/uart_rx.v(54)
  add_pu4_pu4_o4 add1 (
    .i0(cnt),
    .i1(4'b0001),
    .o(n13));  // src/rtl/uart/uart_rx.v(69)
  reg_ar_as_w1 clk_en_reg (
    .clk(clk),
    .d(n5),
    .en(1'b1),
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
  binary_mux_s1_w1 mux0_b3 (
    .i0(n7[3]),
    .i1(1'b0),
    .sel(n5),
    .o(n8[3]));  // src/rtl/uart/uart_rx.v(54)
  binary_mux_s1_w1 mux0_b5 (
    .i0(n7[5]),
    .i1(1'b0),
    .sel(n5),
    .o(n8[5]));  // src/rtl/uart/uart_rx.v(54)
  binary_mux_s1_w1 mux0_b6 (
    .i0(n7[6]),
    .i1(1'b0),
    .sel(n5),
    .o(n8[6]));  // src/rtl/uart/uart_rx.v(54)
  and mux1_b0_sel_is_1 (mux1_b0_sel_is_1_o, start, n5_neg);
  and mux4_b0_sel_is_3 (mux4_b0_sel_is_3_o, clk_en, n16);
  and mux4_b1_sel_is_3 (mux4_b1_sel_is_3_o, clk_en, n17);
  and mux4_b2_sel_is_3 (mux4_b2_sel_is_3_o, clk_en, n18);
  and mux4_b3_sel_is_3 (mux4_b3_sel_is_3_o, clk_en, n19);
  and mux4_b4_sel_is_3 (mux4_b4_sel_is_3_o, clk_en, n20);
  and mux4_b5_sel_is_3 (mux4_b5_sel_is_3_o, clk_en, n21);
  and mux4_b6_sel_is_3 (mux4_b6_sel_is_3_o, clk_en, n22);
  and mux4_b7_sel_is_3 (mux4_b7_sel_is_3_o, clk_en, n23);
  not n5_inv (n5_neg, n5);
  reg_sr_as_w1 reg0_b0 (
    .clk(clk),
    .d(n7[0]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[0]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b1 (
    .clk(clk),
    .d(n7[1]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[1]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b10 (
    .clk(clk),
    .d(n7[10]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[10]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b11 (
    .clk(clk),
    .d(n7[11]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[11]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b12 (
    .clk(clk),
    .d(n7[12]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[12]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b13 (
    .clk(clk),
    .d(n7[13]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[13]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b14 (
    .clk(clk),
    .d(n7[14]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[14]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b15 (
    .clk(clk),
    .d(n7[15]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[15]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b16 (
    .clk(clk),
    .d(n7[16]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[16]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b17 (
    .clk(clk),
    .d(n7[17]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[17]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b18 (
    .clk(clk),
    .d(n7[18]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[18]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b19 (
    .clk(clk),
    .d(n7[19]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[19]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b2 (
    .clk(clk),
    .d(n7[2]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[2]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b20 (
    .clk(clk),
    .d(n7[20]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[20]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b21 (
    .clk(clk),
    .d(n7[21]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[21]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b22 (
    .clk(clk),
    .d(n7[22]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[22]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b23 (
    .clk(clk),
    .d(n7[23]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[23]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b24 (
    .clk(clk),
    .d(n7[24]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[24]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b25 (
    .clk(clk),
    .d(n7[25]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[25]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b26 (
    .clk(clk),
    .d(n7[26]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[26]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b27 (
    .clk(clk),
    .d(n7[27]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[27]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b28 (
    .clk(clk),
    .d(n7[28]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[28]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b29 (
    .clk(clk),
    .d(n7[29]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[29]));  // src/rtl/uart/uart_rx.v(55)
  reg_ar_ss_w1 reg0_b3 (
    .clk(clk),
    .d(n8[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(~start),
    .q(clk_cnt[3]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b30 (
    .clk(clk),
    .d(n7[30]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[30]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b31 (
    .clk(clk),
    .d(n7[31]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[31]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b4 (
    .clk(clk),
    .d(n7[4]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[4]));  // src/rtl/uart/uart_rx.v(55)
  reg_ar_ss_w1 reg0_b5 (
    .clk(clk),
    .d(n8[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(~start),
    .q(clk_cnt[5]));  // src/rtl/uart/uart_rx.v(55)
  reg_ar_ss_w1 reg0_b6 (
    .clk(clk),
    .d(n8[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(~start),
    .q(clk_cnt[6]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b7 (
    .clk(clk),
    .d(n7[7]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[7]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b8 (
    .clk(clk),
    .d(n7[8]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[8]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b9 (
    .clk(clk),
    .d(n7[9]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[9]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg1_b0 (
    .clk(clk),
    .d(n13[0]),
    .en(clk_en),
    .reset(~start),
    .set(1'b0),
    .q(cnt[0]));  // src/rtl/uart/uart_rx.v(70)
  reg_sr_as_w1 reg1_b1 (
    .clk(clk),
    .d(n13[1]),
    .en(clk_en),
    .reset(~start),
    .set(1'b0),
    .q(cnt[1]));  // src/rtl/uart/uart_rx.v(70)
  reg_sr_as_w1 reg1_b2 (
    .clk(clk),
    .d(n13[2]),
    .en(clk_en),
    .reset(~start),
    .set(1'b0),
    .q(cnt[2]));  // src/rtl/uart/uart_rx.v(70)
  reg_sr_as_w1 reg1_b3 (
    .clk(clk),
    .d(n13[3]),
    .en(clk_en),
    .reset(~start),
    .set(1'b0),
    .q(cnt[3]));  // src/rtl/uart/uart_rx.v(70)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk),
    .d(rx),
    .en(mux4_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[0]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk),
    .d(rx),
    .en(mux4_b1_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[1]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk),
    .d(rx),
    .en(mux4_b2_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[2]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk),
    .d(rx),
    .en(mux4_b3_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[3]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b4 (
    .clk(clk),
    .d(rx),
    .en(mux4_b4_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[4]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b5 (
    .clk(clk),
    .d(rx),
    .en(mux4_b5_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[5]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b6 (
    .clk(clk),
    .d(rx),
    .en(mux4_b6_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[6]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b7 (
    .clk(clk),
    .d(rx),
    .en(mux4_b7_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[7]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk),
    .d(data[0]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[0]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk),
    .d(data[1]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[1]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk),
    .d(data[2]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[2]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b3 (
    .clk(clk),
    .d(data[3]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[3]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b4 (
    .clk(clk),
    .d(data[4]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[4]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b5 (
    .clk(clk),
    .d(data[5]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[5]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b6 (
    .clk(clk),
    .d(data[6]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[6]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b7 (
    .clk(clk),
    .d(data[7]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[7]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk),
    .d(rx),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_d[0]));  // src/rtl/uart/uart_rx.v(35)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk),
    .d(rx_d[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_d[1]));  // src/rtl/uart/uart_rx.v(35)
  reg_ar_as_w1 rx_en_reg (
    .clk(clk),
    .d(n28),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_en));  // src/rtl/uart/uart_rx.v(92)
  reg_ar_ss_w1 start_reg (
    .clk(clk),
    .d(1'b0),
    .en(n1),
    .reset(1'b0),
    .set(n0),
    .q(start));  // src/rtl/uart/uart_rx.v(44)
  and u10 (n28, start, n1);  // src/rtl/uart/uart_rx.v(91)

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

  wire or_or_or_or_or_xor_i_o;
  wire \or_or_or_or_xor_i0[0_o ;
  wire \or_or_or_or_xor_i0[1_o ;
  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_or_xor_i0[16]__o ;
  wire \or_or_or_xor_i0[24]__o ;
  wire \or_or_or_xor_i0[8]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[12]_i1[_o ;
  wire \or_or_xor_i0[16]_i1[_o ;
  wire \or_or_xor_i0[20]_i1[_o ;
  wire \or_or_xor_i0[24]_i1[_o ;
  wire \or_or_xor_i0[28]_i1[_o ;
  wire \or_or_xor_i0[4]_i1[4_o ;
  wire \or_or_xor_i0[8]_i1[8_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[10]_i1[10]_o ;
  wire \or_xor_i0[12]_i1[12]_o ;
  wire \or_xor_i0[14]_i1[14]_o ;
  wire \or_xor_i0[16]_i1[16]_o ;
  wire \or_xor_i0[18]_i1[18]_o ;
  wire \or_xor_i0[20]_i1[20]_o ;
  wire \or_xor_i0[22]_i1[22]_o ;
  wire \or_xor_i0[24]_i1[24]_o ;
  wire \or_xor_i0[26]_i1[26]_o ;
  wire \or_xor_i0[28]_i1[28]_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \or_xor_i0[30]_i1[30]_o ;
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
  wire \xor_i0[25]_i1[25]_o ;
  wire \xor_i0[26]_i1[26]_o ;
  wire \xor_i0[27]_i1[27]_o ;
  wire \xor_i0[28]_i1[28]_o ;
  wire \xor_i0[29]_i1[29]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[30]_i1[30]_o ;
  wire \xor_i0[31]_i1[31]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, or_or_or_or_or_xor_i_o);
  or or_or_or_or_or_xor_i (or_or_or_or_or_xor_i_o, \or_or_or_or_xor_i0[0_o , \or_or_or_or_xor_i0[1_o );
  or \or_or_or_or_xor_i0[0  (\or_or_or_or_xor_i0[0_o , \or_or_or_xor_i0[0]_i_o , \or_or_or_xor_i0[8]_i_o );
  or \or_or_or_or_xor_i0[1  (\or_or_or_or_xor_i0[1_o , \or_or_or_xor_i0[16]__o , \or_or_or_xor_i0[24]__o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[4]_i1[4_o );
  or \or_or_or_xor_i0[16]_  (\or_or_or_xor_i0[16]__o , \or_or_xor_i0[16]_i1[_o , \or_or_xor_i0[20]_i1[_o );
  or \or_or_or_xor_i0[24]_  (\or_or_or_xor_i0[24]__o , \or_or_xor_i0[24]_i1[_o , \or_or_xor_i0[28]_i1[_o );
  or \or_or_or_xor_i0[8]_i  (\or_or_or_xor_i0[8]_i_o , \or_or_xor_i0[8]_i1[8_o , \or_or_xor_i0[12]_i1[_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_or_xor_i0[12]_i1[  (\or_or_xor_i0[12]_i1[_o , \or_xor_i0[12]_i1[12]_o , \or_xor_i0[14]_i1[14]_o );
  or \or_or_xor_i0[16]_i1[  (\or_or_xor_i0[16]_i1[_o , \or_xor_i0[16]_i1[16]_o , \or_xor_i0[18]_i1[18]_o );
  or \or_or_xor_i0[20]_i1[  (\or_or_xor_i0[20]_i1[_o , \or_xor_i0[20]_i1[20]_o , \or_xor_i0[22]_i1[22]_o );
  or \or_or_xor_i0[24]_i1[  (\or_or_xor_i0[24]_i1[_o , \or_xor_i0[24]_i1[24]_o , \or_xor_i0[26]_i1[26]_o );
  or \or_or_xor_i0[28]_i1[  (\or_or_xor_i0[28]_i1[_o , \or_xor_i0[28]_i1[28]_o , \or_xor_i0[30]_i1[30]_o );
  or \or_or_xor_i0[4]_i1[4  (\or_or_xor_i0[4]_i1[4_o , \or_xor_i0[4]_i1[4]_o_o , \or_xor_i0[6]_i1[6]_o_o );
  or \or_or_xor_i0[8]_i1[8  (\or_or_xor_i0[8]_i1[8_o , \or_xor_i0[8]_i1[8]_o_o , \or_xor_i0[10]_i1[10]_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[10]_i1[10]  (\or_xor_i0[10]_i1[10]_o , \xor_i0[10]_i1[10]_o , \xor_i0[11]_i1[11]_o );
  or \or_xor_i0[12]_i1[12]  (\or_xor_i0[12]_i1[12]_o , \xor_i0[12]_i1[12]_o , \xor_i0[13]_i1[13]_o );
  or \or_xor_i0[14]_i1[14]  (\or_xor_i0[14]_i1[14]_o , \xor_i0[14]_i1[14]_o , \xor_i0[15]_i1[15]_o );
  or \or_xor_i0[16]_i1[16]  (\or_xor_i0[16]_i1[16]_o , \xor_i0[16]_i1[16]_o , \xor_i0[17]_i1[17]_o );
  or \or_xor_i0[18]_i1[18]  (\or_xor_i0[18]_i1[18]_o , \xor_i0[18]_i1[18]_o , \xor_i0[19]_i1[19]_o );
  or \or_xor_i0[20]_i1[20]  (\or_xor_i0[20]_i1[20]_o , \xor_i0[20]_i1[20]_o , \xor_i0[21]_i1[21]_o );
  or \or_xor_i0[22]_i1[22]  (\or_xor_i0[22]_i1[22]_o , \xor_i0[22]_i1[22]_o , \xor_i0[23]_i1[23]_o );
  or \or_xor_i0[24]_i1[24]  (\or_xor_i0[24]_i1[24]_o , \xor_i0[24]_i1[24]_o , \xor_i0[25]_i1[25]_o );
  or \or_xor_i0[26]_i1[26]  (\or_xor_i0[26]_i1[26]_o , \xor_i0[26]_i1[26]_o , \xor_i0[27]_i1[27]_o );
  or \or_xor_i0[28]_i1[28]  (\or_xor_i0[28]_i1[28]_o , \xor_i0[28]_i1[28]_o , \xor_i0[29]_i1[29]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \xor_i0[3]_i1[3]_o );
  or \or_xor_i0[30]_i1[30]  (\or_xor_i0[30]_i1[30]_o , \xor_i0[30]_i1[30]_o , \xor_i0[31]_i1[31]_o );
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
  xor \xor_i0[25]_i1[25]  (\xor_i0[25]_i1[25]_o , i0[25], i1[25]);
  xor \xor_i0[26]_i1[26]  (\xor_i0[26]_i1[26]_o , i0[26], i1[26]);
  xor \xor_i0[27]_i1[27]  (\xor_i0[27]_i1[27]_o , i0[27], i1[27]);
  xor \xor_i0[28]_i1[28]  (\xor_i0[28]_i1[28]_o , i0[28], i1[28]);
  xor \xor_i0[29]_i1[29]  (\xor_i0[29]_i1[29]_o , i0[29], i1[29]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[30]_i1[30]  (\xor_i0[30]_i1[30]_o , i0[30], i1[30]);
  xor \xor_i0[31]_i1[31]  (\xor_i0[31]_i1[31]_o , i0[31], i1[31]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (\xor_i0[8]_i1[8]_o , i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (\xor_i0[9]_i1[9]_o , i0[9], i1[9]);

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
  wire [31:0] n26;
  wire [31:0] n40;
  wire  \sel8_b0/B0 ;
  wire  \sel8_b0/B1 ;
  wire  \sel8_b0/B2 ;
  wire  \sel8_b0/B3 ;
  wire  \sel8_b0/B4 ;
  wire  \sel8_b1/B0 ;
  wire  \sel8_b1/B2 ;
  wire  \sel8_b1/B3 ;
  wire  \sel8_b1/B4 ;
  wire  \sel8_b10/B0 ;
  wire  \sel8_b10/B2 ;
  wire  \sel8_b10/B4 ;
  wire  \sel8_b11/B0 ;
  wire  \sel8_b11/B2 ;
  wire  \sel8_b11/B4 ;
  wire  \sel8_b12/B0 ;
  wire  \sel8_b12/B2 ;
  wire  \sel8_b12/B4 ;
  wire  \sel8_b13/B0 ;
  wire  \sel8_b13/B2 ;
  wire  \sel8_b13/B4 ;
  wire  \sel8_b14/B0 ;
  wire  \sel8_b14/B2 ;
  wire  \sel8_b14/B4 ;
  wire  \sel8_b15/B0 ;
  wire  \sel8_b15/B2 ;
  wire  \sel8_b15/B4 ;
  wire  \sel8_b16/B0 ;
  wire  \sel8_b17/B0 ;
  wire  \sel8_b18/B0 ;
  wire  \sel8_b19/B0 ;
  wire  \sel8_b2/B0 ;
  wire  \sel8_b2/B2 ;
  wire  \sel8_b2/B3 ;
  wire  \sel8_b2/B4 ;
  wire  \sel8_b20/B0 ;
  wire  \sel8_b21/B0 ;
  wire  \sel8_b22/B0 ;
  wire  \sel8_b23/B0 ;
  wire  \sel8_b24/B0 ;
  wire  \sel8_b25/B0 ;
  wire  \sel8_b26/B0 ;
  wire  \sel8_b27/B0 ;
  wire  \sel8_b28/B0 ;
  wire  \sel8_b29/B0 ;
  wire  \sel8_b3/B0 ;
  wire  \sel8_b3/B2 ;
  wire  \sel8_b3/B3 ;
  wire  \sel8_b3/B4 ;
  wire  \sel8_b30/B0 ;
  wire  \sel8_b31/B0 ;
  wire  \sel8_b4/B0 ;
  wire  \sel8_b4/B2 ;
  wire  \sel8_b4/B3 ;
  wire  \sel8_b4/B4 ;
  wire  \sel8_b5/B0 ;
  wire  \sel8_b5/B2 ;
  wire  \sel8_b5/B3 ;
  wire  \sel8_b5/B4 ;
  wire  \sel8_b6/B0 ;
  wire  \sel8_b6/B2 ;
  wire  \sel8_b6/B3 ;
  wire  \sel8_b6/B4 ;
  wire  \sel8_b7/B0 ;
  wire  \sel8_b7/B2 ;
  wire  \sel8_b7/B3 ;
  wire  \sel8_b7/B4 ;
  wire  \sel8_b8/B0 ;
  wire  \sel8_b8/B2 ;
  wire  \sel8_b8/B4 ;
  wire  \sel8_b9/B0 ;
  wire  \sel8_b9/B2 ;
  wire  \sel8_b9/B4 ;
  wire mux0_b0_sel_is_3_o;
  wire mux1_b0_sel_is_3_o;
  wire mux5_b0_sel_is_3_o;
  wire mux6_b0_sel_is_3_o;
  wire mux7_b0_sel_is_3_o;
  wire n1;
  wire n2;
  wire n3;
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
  wire \sel8_b0/or_B0_B1_o ;
  wire \sel8_b0/or_B2_or_B3_B4_o_o ;
  wire \sel8_b0/or_B3_B4_o ;
  wire \sel8_b1/or_B2_or_B3_B4_o_o ;
  wire \sel8_b1/or_B3_B4_o ;
  wire \sel8_b10/or_B2_or_B3_B4_o_o ;
  wire \sel8_b11/or_B2_or_B3_B4_o_o ;
  wire \sel8_b12/or_B2_or_B3_B4_o_o ;
  wire \sel8_b13/or_B2_or_B3_B4_o_o ;
  wire \sel8_b14/or_B2_or_B3_B4_o_o ;
  wire \sel8_b15/or_B2_or_B3_B4_o_o ;
  wire \sel8_b2/or_B2_or_B3_B4_o_o ;
  wire \sel8_b2/or_B3_B4_o ;
  wire \sel8_b3/or_B2_or_B3_B4_o_o ;
  wire \sel8_b3/or_B3_B4_o ;
  wire \sel8_b4/or_B2_or_B3_B4_o_o ;
  wire \sel8_b4/or_B3_B4_o ;
  wire \sel8_b5/or_B2_or_B3_B4_o_o ;
  wire \sel8_b5/or_B3_B4_o ;
  wire \sel8_b6/or_B2_or_B3_B4_o_o ;
  wire \sel8_b6/or_B3_B4_o ;
  wire \sel8_b7/or_B2_or_B3_B4_o_o ;
  wire \sel8_b7/or_B3_B4_o ;
  wire \sel8_b8/or_B2_or_B3_B4_o_o ;
  wire \sel8_b9/or_B2_or_B3_B4_o_o ;

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
  and mux0_b0_sel_is_3 (mux0_b0_sel_is_3_o, ubus_wen, n1);
  and mux1_b0_sel_is_3 (mux1_b0_sel_is_3_o, ubus_wen, n2);
  and mux5_b0_sel_is_3 (mux5_b0_sel_is_3_o, ubus_wen, n4);
  and mux6_b0_sel_is_3 (mux6_b0_sel_is_3_o, ubus_wen, n5);
  and mux7_b0_sel_is_3 (mux7_b0_sel_is_3_o, ubus_wen, n6);
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(ubus_wdata[0]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit1[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(ubus_wdata[1]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit1[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(ubus_wdata[2]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit1[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(ubus_wdata[3]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit1[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk),
    .d(ubus_wdata[4]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit2[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk),
    .d(ubus_wdata[5]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit2[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk),
    .d(ubus_wdata[6]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit2[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk),
    .d(ubus_wdata[7]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit2[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk),
    .d(ubus_wdata[8]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit3[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk),
    .d(ubus_wdata[9]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit3[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk),
    .d(ubus_wdata[10]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit3[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk),
    .d(ubus_wdata[11]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit3[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk),
    .d(ubus_wdata[12]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit4[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk),
    .d(ubus_wdata[13]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit4[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk),
    .d(ubus_wdata[14]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit4[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg3_b3 (
    .clk(clk),
    .d(ubus_wdata[15]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit4[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk),
    .d(ubus_wdata[0]),
    .en(mux5_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(mod_sel[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk),
    .d(ubus_wdata[1]),
    .en(mux5_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(mod_sel[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg4_b2 (
    .clk(clk),
    .d(ubus_wdata[2]),
    .en(mux5_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(mod_sel[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b0 (
    .clk(clk),
    .d(ubus_wdata[0]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b1 (
    .clk(clk),
    .d(ubus_wdata[1]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b10 (
    .clk(clk),
    .d(ubus_wdata[10]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[10]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b11 (
    .clk(clk),
    .d(ubus_wdata[11]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[11]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b12 (
    .clk(clk),
    .d(ubus_wdata[12]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[12]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b13 (
    .clk(clk),
    .d(ubus_wdata[13]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[13]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b14 (
    .clk(clk),
    .d(ubus_wdata[14]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[14]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b15 (
    .clk(clk),
    .d(ubus_wdata[15]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[15]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b16 (
    .clk(clk),
    .d(ubus_wdata[16]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[16]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b17 (
    .clk(clk),
    .d(ubus_wdata[17]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[17]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b18 (
    .clk(clk),
    .d(ubus_wdata[18]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[18]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b19 (
    .clk(clk),
    .d(ubus_wdata[19]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[19]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b2 (
    .clk(clk),
    .d(ubus_wdata[2]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b20 (
    .clk(clk),
    .d(ubus_wdata[20]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[20]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b21 (
    .clk(clk),
    .d(ubus_wdata[21]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[21]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b22 (
    .clk(clk),
    .d(ubus_wdata[22]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[22]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b23 (
    .clk(clk),
    .d(ubus_wdata[23]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[23]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b3 (
    .clk(clk),
    .d(ubus_wdata[3]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b4 (
    .clk(clk),
    .d(ubus_wdata[4]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[4]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b5 (
    .clk(clk),
    .d(ubus_wdata[5]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[5]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b6 (
    .clk(clk),
    .d(ubus_wdata[6]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[6]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b7 (
    .clk(clk),
    .d(ubus_wdata[7]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[7]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b8 (
    .clk(clk),
    .d(ubus_wdata[8]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[8]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b9 (
    .clk(clk),
    .d(ubus_wdata[9]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[9]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b0 (
    .clk(clk),
    .d(ubus_wdata[0]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b1 (
    .clk(clk),
    .d(ubus_wdata[1]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b2 (
    .clk(clk),
    .d(ubus_wdata[2]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b3 (
    .clk(clk),
    .d(ubus_wdata[3]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b4 (
    .clk(clk),
    .d(ubus_wdata[4]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[4]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b5 (
    .clk(clk),
    .d(ubus_wdata[5]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[5]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b6 (
    .clk(clk),
    .d(ubus_wdata[6]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[6]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b7 (
    .clk(clk),
    .d(ubus_wdata[7]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[7]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg7_b0 (
    .clk(clk),
    .d(n40[0]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[0]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b1 (
    .clk(clk),
    .d(n40[1]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[1]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b10 (
    .clk(clk),
    .d(n40[10]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[10]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b11 (
    .clk(clk),
    .d(n40[11]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[11]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b12 (
    .clk(clk),
    .d(n40[12]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[12]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b13 (
    .clk(clk),
    .d(n40[13]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[13]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b14 (
    .clk(clk),
    .d(n40[14]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[14]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b15 (
    .clk(clk),
    .d(n40[15]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[15]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b16 (
    .clk(clk),
    .d(n40[16]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[16]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b17 (
    .clk(clk),
    .d(n40[17]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[17]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b18 (
    .clk(clk),
    .d(n40[18]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[18]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b19 (
    .clk(clk),
    .d(n40[19]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[19]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b2 (
    .clk(clk),
    .d(n40[2]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[2]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b20 (
    .clk(clk),
    .d(n40[20]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[20]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b21 (
    .clk(clk),
    .d(n40[21]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[21]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b22 (
    .clk(clk),
    .d(n40[22]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[22]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b23 (
    .clk(clk),
    .d(n40[23]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[23]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b24 (
    .clk(clk),
    .d(n40[24]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[24]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b25 (
    .clk(clk),
    .d(n40[25]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[25]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b26 (
    .clk(clk),
    .d(n40[26]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[26]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b27 (
    .clk(clk),
    .d(n40[27]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[27]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b28 (
    .clk(clk),
    .d(n40[28]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[28]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b29 (
    .clk(clk),
    .d(n40[29]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[29]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b3 (
    .clk(clk),
    .d(n40[3]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[3]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b30 (
    .clk(clk),
    .d(n40[30]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[30]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b31 (
    .clk(clk),
    .d(n40[31]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[31]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b4 (
    .clk(clk),
    .d(n40[4]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[4]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b5 (
    .clk(clk),
    .d(n40[5]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[5]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b6 (
    .clk(clk),
    .d(n40[6]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[6]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b7 (
    .clk(clk),
    .d(n40[7]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[7]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b8 (
    .clk(clk),
    .d(n40[8]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[8]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b9 (
    .clk(clk),
    .d(n40[9]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[9]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg8_b0 (
    .clk(clk),
    .d(n0[0]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b1 (
    .clk(clk),
    .d(n0[1]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b10 (
    .clk(clk),
    .d(n0[10]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[10]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b11 (
    .clk(clk),
    .d(n0[11]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[11]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b12 (
    .clk(clk),
    .d(n0[12]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[12]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b13 (
    .clk(clk),
    .d(n0[13]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[13]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b14 (
    .clk(clk),
    .d(n0[14]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[14]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b15 (
    .clk(clk),
    .d(n0[15]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[15]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b2 (
    .clk(clk),
    .d(n0[2]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b3 (
    .clk(clk),
    .d(n0[3]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b4 (
    .clk(clk),
    .d(n0[4]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[4]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b5 (
    .clk(clk),
    .d(n0[5]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[5]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b6 (
    .clk(clk),
    .d(n0[6]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[6]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b7 (
    .clk(clk),
    .d(n0[7]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[7]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b8 (
    .clk(clk),
    .d(n0[8]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[8]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b9 (
    .clk(clk),
    .d(n0[9]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led[9]));  // src/rtl/uart/ubus.v(64)
  and \sel8_b0/and_b0_0  (\sel8_b0/B0 , ubus_rdata[0], n39);
  and \sel8_b0/and_b0_1  (\sel8_b0/B1 , busy, n38);
  and \sel8_b0/and_b0_2  (\sel8_b0/B2 , id[0], n37);
  and \sel8_b0/and_b0_3  (\sel8_b0/B3 , fls_read[0], n36);
  and \sel8_b0/and_b0_4  (\sel8_b0/B4 , n26[0], n35);
  or \sel8_b0/or_B0_B1  (\sel8_b0/or_B0_B1_o , \sel8_b0/B0 , \sel8_b0/B1 );
  or \sel8_b0/or_B2_or_B3_B4_o  (\sel8_b0/or_B2_or_B3_B4_o_o , \sel8_b0/B2 , \sel8_b0/or_B3_B4_o );
  or \sel8_b0/or_B3_B4  (\sel8_b0/or_B3_B4_o , \sel8_b0/B3 , \sel8_b0/B4 );
  or \sel8_b0/or_or_B0_B1_o_or_B2_  (n40[0], \sel8_b0/or_B0_B1_o , \sel8_b0/or_B2_or_B3_B4_o_o );
  and \sel8_b1/and_b0_0  (\sel8_b1/B0 , ubus_rdata[1], n39);
  and \sel8_b1/and_b0_2  (\sel8_b1/B2 , id[1], n37);
  and \sel8_b1/and_b0_3  (\sel8_b1/B3 , fls_read[1], n36);
  and \sel8_b1/and_b0_4  (\sel8_b1/B4 , n26[1], n35);
  or \sel8_b1/or_B2_or_B3_B4_o  (\sel8_b1/or_B2_or_B3_B4_o_o , \sel8_b1/B2 , \sel8_b1/or_B3_B4_o );
  or \sel8_b1/or_B3_B4  (\sel8_b1/or_B3_B4_o , \sel8_b1/B3 , \sel8_b1/B4 );
  or \sel8_b1/or_or_B0_B1_o_or_B2_  (n40[1], \sel8_b1/B0 , \sel8_b1/or_B2_or_B3_B4_o_o );
  and \sel8_b10/and_b0_0  (\sel8_b10/B0 , ubus_rdata[10], n39);
  and \sel8_b10/and_b0_2  (\sel8_b10/B2 , id[10], n37);
  and \sel8_b10/and_b0_4  (\sel8_b10/B4 , n26[10], n35);
  or \sel8_b10/or_B2_or_B3_B4_o  (\sel8_b10/or_B2_or_B3_B4_o_o , \sel8_b10/B2 , \sel8_b10/B4 );
  or \sel8_b10/or_or_B0_B1_o_or_B2_  (n40[10], \sel8_b10/B0 , \sel8_b10/or_B2_or_B3_B4_o_o );
  and \sel8_b11/and_b0_0  (\sel8_b11/B0 , ubus_rdata[11], n39);
  and \sel8_b11/and_b0_2  (\sel8_b11/B2 , id[11], n37);
  and \sel8_b11/and_b0_4  (\sel8_b11/B4 , n26[11], n35);
  or \sel8_b11/or_B2_or_B3_B4_o  (\sel8_b11/or_B2_or_B3_B4_o_o , \sel8_b11/B2 , \sel8_b11/B4 );
  or \sel8_b11/or_or_B0_B1_o_or_B2_  (n40[11], \sel8_b11/B0 , \sel8_b11/or_B2_or_B3_B4_o_o );
  and \sel8_b12/and_b0_0  (\sel8_b12/B0 , ubus_rdata[12], n39);
  and \sel8_b12/and_b0_2  (\sel8_b12/B2 , id[12], n37);
  and \sel8_b12/and_b0_4  (\sel8_b12/B4 , n26[12], n35);
  or \sel8_b12/or_B2_or_B3_B4_o  (\sel8_b12/or_B2_or_B3_B4_o_o , \sel8_b12/B2 , \sel8_b12/B4 );
  or \sel8_b12/or_or_B0_B1_o_or_B2_  (n40[12], \sel8_b12/B0 , \sel8_b12/or_B2_or_B3_B4_o_o );
  and \sel8_b13/and_b0_0  (\sel8_b13/B0 , ubus_rdata[13], n39);
  and \sel8_b13/and_b0_2  (\sel8_b13/B2 , id[13], n37);
  and \sel8_b13/and_b0_4  (\sel8_b13/B4 , n26[13], n35);
  or \sel8_b13/or_B2_or_B3_B4_o  (\sel8_b13/or_B2_or_B3_B4_o_o , \sel8_b13/B2 , \sel8_b13/B4 );
  or \sel8_b13/or_or_B0_B1_o_or_B2_  (n40[13], \sel8_b13/B0 , \sel8_b13/or_B2_or_B3_B4_o_o );
  and \sel8_b14/and_b0_0  (\sel8_b14/B0 , ubus_rdata[14], n39);
  and \sel8_b14/and_b0_2  (\sel8_b14/B2 , id[14], n37);
  and \sel8_b14/and_b0_4  (\sel8_b14/B4 , n26[14], n35);
  or \sel8_b14/or_B2_or_B3_B4_o  (\sel8_b14/or_B2_or_B3_B4_o_o , \sel8_b14/B2 , \sel8_b14/B4 );
  or \sel8_b14/or_or_B0_B1_o_or_B2_  (n40[14], \sel8_b14/B0 , \sel8_b14/or_B2_or_B3_B4_o_o );
  and \sel8_b15/and_b0_0  (\sel8_b15/B0 , ubus_rdata[15], n39);
  and \sel8_b15/and_b0_2  (\sel8_b15/B2 , id[15], n37);
  and \sel8_b15/and_b0_4  (\sel8_b15/B4 , n26[15], n35);
  or \sel8_b15/or_B2_or_B3_B4_o  (\sel8_b15/or_B2_or_B3_B4_o_o , \sel8_b15/B2 , \sel8_b15/B4 );
  or \sel8_b15/or_or_B0_B1_o_or_B2_  (n40[15], \sel8_b15/B0 , \sel8_b15/or_B2_or_B3_B4_o_o );
  and \sel8_b16/and_b0_0  (\sel8_b16/B0 , ubus_rdata[16], n39);
  or \sel8_b16/or_or_B0_B1_o_or_B2_  (n40[16], \sel8_b16/B0 , n35);
  and \sel8_b17/and_b0_0  (\sel8_b17/B0 , ubus_rdata[17], n39);
  or \sel8_b17/or_or_B0_B1_o_or_B2_  (n40[17], \sel8_b17/B0 , n35);
  and \sel8_b18/and_b0_0  (\sel8_b18/B0 , ubus_rdata[18], n39);
  or \sel8_b18/or_or_B0_B1_o_or_B2_  (n40[18], \sel8_b18/B0 , n35);
  and \sel8_b19/and_b0_0  (\sel8_b19/B0 , ubus_rdata[19], n39);
  or \sel8_b19/or_or_B0_B1_o_or_B2_  (n40[19], \sel8_b19/B0 , n35);
  and \sel8_b2/and_b0_0  (\sel8_b2/B0 , ubus_rdata[2], n39);
  and \sel8_b2/and_b0_2  (\sel8_b2/B2 , id[2], n37);
  and \sel8_b2/and_b0_3  (\sel8_b2/B3 , fls_read[2], n36);
  and \sel8_b2/and_b0_4  (\sel8_b2/B4 , n26[2], n35);
  or \sel8_b2/or_B2_or_B3_B4_o  (\sel8_b2/or_B2_or_B3_B4_o_o , \sel8_b2/B2 , \sel8_b2/or_B3_B4_o );
  or \sel8_b2/or_B3_B4  (\sel8_b2/or_B3_B4_o , \sel8_b2/B3 , \sel8_b2/B4 );
  or \sel8_b2/or_or_B0_B1_o_or_B2_  (n40[2], \sel8_b2/B0 , \sel8_b2/or_B2_or_B3_B4_o_o );
  and \sel8_b20/and_b0_0  (\sel8_b20/B0 , ubus_rdata[20], n39);
  or \sel8_b20/or_or_B0_B1_o_or_B2_  (n40[20], \sel8_b20/B0 , n35);
  and \sel8_b21/and_b0_0  (\sel8_b21/B0 , ubus_rdata[21], n39);
  or \sel8_b21/or_or_B0_B1_o_or_B2_  (n40[21], \sel8_b21/B0 , n35);
  and \sel8_b22/and_b0_0  (\sel8_b22/B0 , ubus_rdata[22], n39);
  or \sel8_b22/or_or_B0_B1_o_or_B2_  (n40[22], \sel8_b22/B0 , n35);
  and \sel8_b23/and_b0_0  (\sel8_b23/B0 , ubus_rdata[23], n39);
  or \sel8_b23/or_or_B0_B1_o_or_B2_  (n40[23], \sel8_b23/B0 , n35);
  and \sel8_b24/and_b0_0  (\sel8_b24/B0 , ubus_rdata[24], n39);
  or \sel8_b24/or_or_B0_B1_o_or_B2_  (n40[24], \sel8_b24/B0 , n35);
  and \sel8_b25/and_b0_0  (\sel8_b25/B0 , ubus_rdata[25], n39);
  or \sel8_b25/or_or_B0_B1_o_or_B2_  (n40[25], \sel8_b25/B0 , n35);
  and \sel8_b26/and_b0_0  (\sel8_b26/B0 , ubus_rdata[26], n39);
  or \sel8_b26/or_or_B0_B1_o_or_B2_  (n40[26], \sel8_b26/B0 , n35);
  and \sel8_b27/and_b0_0  (\sel8_b27/B0 , ubus_rdata[27], n39);
  or \sel8_b27/or_or_B0_B1_o_or_B2_  (n40[27], \sel8_b27/B0 , n35);
  and \sel8_b28/and_b0_0  (\sel8_b28/B0 , ubus_rdata[28], n39);
  or \sel8_b28/or_or_B0_B1_o_or_B2_  (n40[28], \sel8_b28/B0 , n35);
  and \sel8_b29/and_b0_0  (\sel8_b29/B0 , ubus_rdata[29], n39);
  or \sel8_b29/or_or_B0_B1_o_or_B2_  (n40[29], \sel8_b29/B0 , n35);
  and \sel8_b3/and_b0_0  (\sel8_b3/B0 , ubus_rdata[3], n39);
  and \sel8_b3/and_b0_2  (\sel8_b3/B2 , id[3], n37);
  and \sel8_b3/and_b0_3  (\sel8_b3/B3 , fls_read[3], n36);
  and \sel8_b3/and_b0_4  (\sel8_b3/B4 , n26[3], n35);
  or \sel8_b3/or_B2_or_B3_B4_o  (\sel8_b3/or_B2_or_B3_B4_o_o , \sel8_b3/B2 , \sel8_b3/or_B3_B4_o );
  or \sel8_b3/or_B3_B4  (\sel8_b3/or_B3_B4_o , \sel8_b3/B3 , \sel8_b3/B4 );
  or \sel8_b3/or_or_B0_B1_o_or_B2_  (n40[3], \sel8_b3/B0 , \sel8_b3/or_B2_or_B3_B4_o_o );
  and \sel8_b30/and_b0_0  (\sel8_b30/B0 , ubus_rdata[30], n39);
  or \sel8_b30/or_or_B0_B1_o_or_B2_  (n40[30], \sel8_b30/B0 , n35);
  and \sel8_b31/and_b0_0  (\sel8_b31/B0 , ubus_rdata[31], n39);
  or \sel8_b31/or_or_B0_B1_o_or_B2_  (n40[31], \sel8_b31/B0 , n35);
  and \sel8_b4/and_b0_0  (\sel8_b4/B0 , ubus_rdata[4], n39);
  and \sel8_b4/and_b0_2  (\sel8_b4/B2 , id[4], n37);
  and \sel8_b4/and_b0_3  (\sel8_b4/B3 , fls_read[4], n36);
  and \sel8_b4/and_b0_4  (\sel8_b4/B4 , n26[4], n35);
  or \sel8_b4/or_B2_or_B3_B4_o  (\sel8_b4/or_B2_or_B3_B4_o_o , \sel8_b4/B2 , \sel8_b4/or_B3_B4_o );
  or \sel8_b4/or_B3_B4  (\sel8_b4/or_B3_B4_o , \sel8_b4/B3 , \sel8_b4/B4 );
  or \sel8_b4/or_or_B0_B1_o_or_B2_  (n40[4], \sel8_b4/B0 , \sel8_b4/or_B2_or_B3_B4_o_o );
  and \sel8_b5/and_b0_0  (\sel8_b5/B0 , ubus_rdata[5], n39);
  and \sel8_b5/and_b0_2  (\sel8_b5/B2 , id[5], n37);
  and \sel8_b5/and_b0_3  (\sel8_b5/B3 , fls_read[5], n36);
  and \sel8_b5/and_b0_4  (\sel8_b5/B4 , n26[5], n35);
  or \sel8_b5/or_B2_or_B3_B4_o  (\sel8_b5/or_B2_or_B3_B4_o_o , \sel8_b5/B2 , \sel8_b5/or_B3_B4_o );
  or \sel8_b5/or_B3_B4  (\sel8_b5/or_B3_B4_o , \sel8_b5/B3 , \sel8_b5/B4 );
  or \sel8_b5/or_or_B0_B1_o_or_B2_  (n40[5], \sel8_b5/B0 , \sel8_b5/or_B2_or_B3_B4_o_o );
  and \sel8_b6/and_b0_0  (\sel8_b6/B0 , ubus_rdata[6], n39);
  and \sel8_b6/and_b0_2  (\sel8_b6/B2 , id[6], n37);
  and \sel8_b6/and_b0_3  (\sel8_b6/B3 , fls_read[6], n36);
  and \sel8_b6/and_b0_4  (\sel8_b6/B4 , n26[6], n35);
  or \sel8_b6/or_B2_or_B3_B4_o  (\sel8_b6/or_B2_or_B3_B4_o_o , \sel8_b6/B2 , \sel8_b6/or_B3_B4_o );
  or \sel8_b6/or_B3_B4  (\sel8_b6/or_B3_B4_o , \sel8_b6/B3 , \sel8_b6/B4 );
  or \sel8_b6/or_or_B0_B1_o_or_B2_  (n40[6], \sel8_b6/B0 , \sel8_b6/or_B2_or_B3_B4_o_o );
  and \sel8_b7/and_b0_0  (\sel8_b7/B0 , ubus_rdata[7], n39);
  and \sel8_b7/and_b0_2  (\sel8_b7/B2 , id[7], n37);
  and \sel8_b7/and_b0_3  (\sel8_b7/B3 , fls_read[7], n36);
  and \sel8_b7/and_b0_4  (\sel8_b7/B4 , n26[7], n35);
  or \sel8_b7/or_B2_or_B3_B4_o  (\sel8_b7/or_B2_or_B3_B4_o_o , \sel8_b7/B2 , \sel8_b7/or_B3_B4_o );
  or \sel8_b7/or_B3_B4  (\sel8_b7/or_B3_B4_o , \sel8_b7/B3 , \sel8_b7/B4 );
  or \sel8_b7/or_or_B0_B1_o_or_B2_  (n40[7], \sel8_b7/B0 , \sel8_b7/or_B2_or_B3_B4_o_o );
  and \sel8_b8/and_b0_0  (\sel8_b8/B0 , ubus_rdata[8], n39);
  and \sel8_b8/and_b0_2  (\sel8_b8/B2 , id[8], n37);
  and \sel8_b8/and_b0_4  (\sel8_b8/B4 , n26[8], n35);
  or \sel8_b8/or_B2_or_B3_B4_o  (\sel8_b8/or_B2_or_B3_B4_o_o , \sel8_b8/B2 , \sel8_b8/B4 );
  or \sel8_b8/or_or_B0_B1_o_or_B2_  (n40[8], \sel8_b8/B0 , \sel8_b8/or_B2_or_B3_B4_o_o );
  and \sel8_b9/and_b0_0  (\sel8_b9/B0 , ubus_rdata[9], n39);
  and \sel8_b9/and_b0_2  (\sel8_b9/B2 , id[9], n37);
  and \sel8_b9/and_b0_4  (\sel8_b9/B4 , n26[9], n35);
  or \sel8_b9/or_B2_or_B3_B4_o  (\sel8_b9/or_B2_or_B3_B4_o_o , \sel8_b9/B2 , \sel8_b9/B4 );
  or \sel8_b9/or_or_B0_B1_o_or_B2_  (n40[9], \sel8_b9/B0 , \sel8_b9/or_B2_or_B3_B4_o_o );
  reg_sr_as_w1 start_reg (
    .clk(clk),
    .d(ubus_wdata[0]),
    .en(n3),
    .reset(~ubus_wen),
    .set(1'b0),
    .q(start));  // src/rtl/uart/ubus.v(64)
  or u10 (n32, n34, n33);  // src/rtl/uart/ubus.v(78)
  not u11 (n39, n32);  // src/rtl/uart/ubus.v(78)
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
  or u8 (n34, n38, n37);  // src/rtl/uart/ubus.v(78)
  reg_ar_as_w1 ubus_bken_reg (
    .clk(clk),
    .d(ubus_ren),
    .en(1'b1),
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
  wire [31:0] n4;
  wire [2:0] n54;
  wire [2:0] n78;
  wire [3:0] n83;
  wire [7:0] n88;
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
  wire auto_rst_neg;
  wire mux12_b0_sel_is_2_o;
  wire mux1_b0_sel_is_0_o;
  wire mux21_b0_sel_is_0_o;
  wire n0;
  wire n1;
  wire n17;
  wire n18;
  wire n19;
  wire n1_neg;
  wire n2;
  wire n20;
  wire n21;
  wire n22;
  wire n29;
  wire n2_neg;
  wire n3;
  wire n30;
  wire n31;
  wire n32;
  wire n33;
  wire n34;
  wire n35;
  wire n36;
  wire n43;
  wire n48;
  wire n52;
  wire n53;
  wire n58;
  wire n59;
  wire n60;
  wire n61;
  wire n62;
  wire n64;
  wire n7;
  wire n72;
  wire n73;
  wire n74;
  wire n75;
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
  wire send_finish_neg;
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
  not auto_rst_inv (auto_rst_neg, auto_rst);
  reg_ar_as_w1 auto_rst_reg (
    .clk(clk),
    .d(n2),
    .en(1'b1),
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
  and mux12_b0_sel_is_2 (mux12_b0_sel_is_2_o, auto_rst_neg, recv_state);
  and mux1_b0_sel_is_0 (mux1_b0_sel_is_0_o, n1_neg, n2_neg);
  and mux21_b0_sel_is_0 (mux21_b0_sel_is_0_o, auto_rst_neg, send_finish_neg);
  binary_mux_s4_w1 mux22_b0 (
    .i0(tx_data[0]),
    .i1(1'b1),
    .i10(tx_buffer0[24]),
    .i11(tx_buffer1[0]),
    .i12(tx_buffer1[8]),
    .i13(tx_buffer1[16]),
    .i14(tx_buffer1[24]),
    .i15(tx_data[0]),
    .i2(1'b0),
    .i3(1'b1),
    .i4(1'b0),
    .i5(1'b1),
    .i6(1'b0),
    .i7(tx_buffer0[0]),
    .i8(tx_buffer0[8]),
    .i9(tx_buffer0[16]),
    .sel(send_cnt),
    .o(n88[0]));  // src/rtl/uart/uprotocol.v(322)
  binary_mux_s4_w1 mux22_b1 (
    .i0(tx_data[1]),
    .i1(1'b0),
    .i10(tx_buffer0[25]),
    .i11(tx_buffer1[1]),
    .i12(tx_buffer1[9]),
    .i13(tx_buffer1[17]),
    .i14(tx_buffer1[25]),
    .i15(tx_data[1]),
    .i2(1'b1),
    .i3(1'b1),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b1),
    .i7(tx_buffer0[1]),
    .i8(tx_buffer0[9]),
    .i9(tx_buffer0[17]),
    .sel(send_cnt),
    .o(n88[1]));  // src/rtl/uart/uprotocol.v(322)
  binary_mux_s4_w1 mux22_b2 (
    .i0(tx_data[2]),
    .i1(1'b0),
    .i10(tx_buffer0[26]),
    .i11(tx_buffer1[2]),
    .i12(tx_buffer1[10]),
    .i13(tx_buffer1[18]),
    .i14(tx_buffer1[26]),
    .i15(tx_data[2]),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b1),
    .i5(1'b1),
    .i6(1'b1),
    .i7(tx_buffer0[2]),
    .i8(tx_buffer0[10]),
    .i9(tx_buffer0[18]),
    .sel(send_cnt),
    .o(n88[2]));  // src/rtl/uart/uprotocol.v(322)
  binary_mux_s4_w1 mux22_b3 (
    .i0(tx_data[3]),
    .i1(1'b0),
    .i10(tx_buffer0[27]),
    .i11(tx_buffer1[3]),
    .i12(tx_buffer1[11]),
    .i13(tx_buffer1[19]),
    .i14(tx_buffer1[27]),
    .i15(tx_data[3]),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b0),
    .i7(tx_buffer0[3]),
    .i8(tx_buffer0[11]),
    .i9(tx_buffer0[19]),
    .sel(send_cnt),
    .o(n88[3]));  // src/rtl/uart/uprotocol.v(322)
  binary_mux_s4_w1 mux22_b4 (
    .i0(tx_data[4]),
    .i1(1'b0),
    .i10(tx_buffer0[28]),
    .i11(tx_buffer1[4]),
    .i12(tx_buffer1[12]),
    .i13(tx_buffer1[20]),
    .i14(tx_buffer1[28]),
    .i15(tx_data[4]),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b0),
    .i7(tx_buffer0[4]),
    .i8(tx_buffer0[12]),
    .i9(tx_buffer0[20]),
    .sel(send_cnt),
    .o(n88[4]));  // src/rtl/uart/uprotocol.v(322)
  binary_mux_s4_w1 mux22_b5 (
    .i0(tx_data[5]),
    .i1(1'b0),
    .i10(tx_buffer0[29]),
    .i11(tx_buffer1[5]),
    .i12(tx_buffer1[13]),
    .i13(tx_buffer1[21]),
    .i14(tx_buffer1[29]),
    .i15(tx_data[5]),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b0),
    .i7(tx_buffer0[5]),
    .i8(tx_buffer0[13]),
    .i9(tx_buffer0[21]),
    .sel(send_cnt),
    .o(n88[5]));  // src/rtl/uart/uprotocol.v(322)
  binary_mux_s4_w1 mux22_b6 (
    .i0(tx_data[6]),
    .i1(1'b1),
    .i10(tx_buffer0[30]),
    .i11(tx_buffer1[6]),
    .i12(tx_buffer1[14]),
    .i13(tx_buffer1[22]),
    .i14(tx_buffer1[30]),
    .i15(tx_data[6]),
    .i2(1'b1),
    .i3(1'b1),
    .i4(1'b1),
    .i5(1'b1),
    .i6(1'b1),
    .i7(tx_buffer0[6]),
    .i8(tx_buffer0[14]),
    .i9(tx_buffer0[22]),
    .sel(send_cnt),
    .o(n88[6]));  // src/rtl/uart/uprotocol.v(322)
  binary_mux_s4_w1 mux22_b7 (
    .i0(tx_data[7]),
    .i1(1'b0),
    .i10(tx_buffer0[31]),
    .i11(tx_buffer1[7]),
    .i12(tx_buffer1[15]),
    .i13(tx_buffer1[23]),
    .i14(tx_buffer1[31]),
    .i15(tx_data[7]),
    .i2(1'b0),
    .i3(1'b0),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b0),
    .i7(tx_buffer0[7]),
    .i8(tx_buffer0[15]),
    .i9(tx_buffer0[23]),
    .sel(send_cnt),
    .o(n88[7]));  // src/rtl/uart/uprotocol.v(322)
  not n1_inv (n1_neg, n1);
  not n2_inv (n2_neg, n2);
  reg_ar_as_w1 rd_flag0_reg (
    .clk(clk),
    .d(n31),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag0));  // src/rtl/uart/uprotocol.v(157)
  reg_ar_as_w1 rd_flag1_reg (
    .clk(clk),
    .d(n32),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag1));  // src/rtl/uart/uprotocol.v(157)
  reg_ar_as_w1 rd_flag2_reg (
    .clk(clk),
    .d(n33),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag2));  // src/rtl/uart/uprotocol.v(157)
  reg_ar_as_w1 rd_flag3_reg (
    .clk(clk),
    .d(n34),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag3));  // src/rtl/uart/uprotocol.v(157)
  reg_ar_as_w1 rd_flag4_reg (
    .clk(clk),
    .d(n35),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag4));  // src/rtl/uart/uprotocol.v(157)
  reg_ar_as_w1 rd_flag5_reg (
    .clk(clk),
    .d(n36),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag5));  // src/rtl/uart/uprotocol.v(157)
  reg_ar_as_w1 rd_flag_reg (
    .clk(clk),
    .d(n43),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag));  // src/rtl/uart/uprotocol.v(163)
  reg_sr_ss_w1 rd_mode_reg (
    .clk(clk),
    .d(rd_mode),
    .en(1'b1),
    .reset(recv_flag),
    .set(rd_flag),
    .q(rd_mode));  // src/rtl/uart/uprotocol.v(172)
  reg_ar_as_w1 recv_flag_reg (
    .clk(clk),
    .d(n59),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_flag));  // src/rtl/uart/uprotocol.v(209)
  reg_sr_ss_w1 recv_state_reg (
    .clk(clk),
    .d(1'b0),
    .en(recv_flag),
    .reset(auto_rst),
    .set(n48),
    .q(recv_state));  // src/rtl/uart/uprotocol.v(192)
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(rx_data[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(rx_data[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(rx_data[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(rx_data[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk),
    .d(rx_data[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk),
    .d(rx_data[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk),
    .d(rx_data[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk),
    .d(rx_data[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg10_b0 (
    .clk(clk),
    .d(reg7_al_b7[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[0]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b1 (
    .clk(clk),
    .d(reg7_al_b7[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[1]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b10 (
    .clk(clk),
    .d(reg6_al_b6[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[10]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b11 (
    .clk(clk),
    .d(reg6_al_b6[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[11]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b12 (
    .clk(clk),
    .d(reg6_al_b6[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[12]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b13 (
    .clk(clk),
    .d(reg6_al_b6[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[13]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b14 (
    .clk(clk),
    .d(reg6_al_b6[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[14]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b15 (
    .clk(clk),
    .d(reg6_al_b6[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[15]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b16 (
    .clk(clk),
    .d(reg5_al_b5[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[16]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b17 (
    .clk(clk),
    .d(reg5_al_b5[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[17]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b18 (
    .clk(clk),
    .d(reg5_al_b5[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[18]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b19 (
    .clk(clk),
    .d(reg5_al_b5[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[19]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b2 (
    .clk(clk),
    .d(reg7_al_b7[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[2]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b20 (
    .clk(clk),
    .d(reg5_al_b5[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[20]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b21 (
    .clk(clk),
    .d(reg5_al_b5[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[21]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b22 (
    .clk(clk),
    .d(reg5_al_b5[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[22]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b23 (
    .clk(clk),
    .d(reg5_al_b5[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[23]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b24 (
    .clk(clk),
    .d(reg4_al_b4[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[24]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b25 (
    .clk(clk),
    .d(reg4_al_b4[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[25]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b26 (
    .clk(clk),
    .d(reg4_al_b4[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[26]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b27 (
    .clk(clk),
    .d(reg4_al_b4[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[27]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b28 (
    .clk(clk),
    .d(reg4_al_b4[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[28]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b29 (
    .clk(clk),
    .d(reg4_al_b4[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[29]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b3 (
    .clk(clk),
    .d(reg7_al_b7[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[3]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b30 (
    .clk(clk),
    .d(reg4_al_b4[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[30]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b31 (
    .clk(clk),
    .d(reg4_al_b4[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[31]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b4 (
    .clk(clk),
    .d(reg7_al_b7[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[4]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b5 (
    .clk(clk),
    .d(reg7_al_b7[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[5]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b6 (
    .clk(clk),
    .d(reg7_al_b7[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[6]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b7 (
    .clk(clk),
    .d(reg7_al_b7[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[7]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b8 (
    .clk(clk),
    .d(reg6_al_b6[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[8]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b9 (
    .clk(clk),
    .d(reg6_al_b6[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[9]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b0 (
    .clk(clk),
    .d(reg3_al_b3[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[0]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b1 (
    .clk(clk),
    .d(reg3_al_b3[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[1]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b10 (
    .clk(clk),
    .d(reg2_al_b2[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[10]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b11 (
    .clk(clk),
    .d(reg2_al_b2[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[11]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b12 (
    .clk(clk),
    .d(reg2_al_b2[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[12]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b13 (
    .clk(clk),
    .d(reg2_al_b2[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[13]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b14 (
    .clk(clk),
    .d(reg2_al_b2[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[14]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b15 (
    .clk(clk),
    .d(reg2_al_b2[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[15]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b16 (
    .clk(clk),
    .d(reg1_al_b1[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[16]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b17 (
    .clk(clk),
    .d(reg1_al_b1[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[17]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b18 (
    .clk(clk),
    .d(reg1_al_b1[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[18]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b19 (
    .clk(clk),
    .d(reg1_al_b1[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[19]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b2 (
    .clk(clk),
    .d(reg3_al_b3[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[2]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b20 (
    .clk(clk),
    .d(reg1_al_b1[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[20]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b21 (
    .clk(clk),
    .d(reg1_al_b1[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[21]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b22 (
    .clk(clk),
    .d(reg1_al_b1[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[22]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b23 (
    .clk(clk),
    .d(reg1_al_b1[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[23]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b24 (
    .clk(clk),
    .d(reg0_al_b0[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[24]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b25 (
    .clk(clk),
    .d(reg0_al_b0[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[25]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b26 (
    .clk(clk),
    .d(reg0_al_b0[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[26]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b27 (
    .clk(clk),
    .d(reg0_al_b0[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[27]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b28 (
    .clk(clk),
    .d(reg0_al_b0[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[28]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b29 (
    .clk(clk),
    .d(reg0_al_b0[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[29]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b3 (
    .clk(clk),
    .d(reg3_al_b3[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[3]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b30 (
    .clk(clk),
    .d(reg0_al_b0[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[30]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b31 (
    .clk(clk),
    .d(reg0_al_b0[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[31]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b4 (
    .clk(clk),
    .d(reg3_al_b3[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[4]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b5 (
    .clk(clk),
    .d(reg3_al_b3[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[5]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b6 (
    .clk(clk),
    .d(reg3_al_b3[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[6]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b7 (
    .clk(clk),
    .d(reg3_al_b3[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[7]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b8 (
    .clk(clk),
    .d(reg2_al_b2[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[8]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b9 (
    .clk(clk),
    .d(reg2_al_b2[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[9]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg12_b0 (
    .clk(clk),
    .d(ubus_raddr[0]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[0]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b1 (
    .clk(clk),
    .d(ubus_raddr[1]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[1]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b10 (
    .clk(clk),
    .d(ubus_raddr[10]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[10]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b11 (
    .clk(clk),
    .d(ubus_raddr[11]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[11]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b12 (
    .clk(clk),
    .d(ubus_raddr[12]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[12]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b13 (
    .clk(clk),
    .d(ubus_raddr[13]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[13]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b14 (
    .clk(clk),
    .d(ubus_raddr[14]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[14]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b15 (
    .clk(clk),
    .d(ubus_raddr[15]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[15]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b16 (
    .clk(clk),
    .d(ubus_raddr[16]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[16]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b17 (
    .clk(clk),
    .d(ubus_raddr[17]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[17]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b18 (
    .clk(clk),
    .d(ubus_raddr[18]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[18]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b19 (
    .clk(clk),
    .d(ubus_raddr[19]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[19]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b2 (
    .clk(clk),
    .d(ubus_raddr[2]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[2]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b20 (
    .clk(clk),
    .d(ubus_raddr[20]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[20]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b21 (
    .clk(clk),
    .d(ubus_raddr[21]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[21]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b22 (
    .clk(clk),
    .d(ubus_raddr[22]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[22]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b23 (
    .clk(clk),
    .d(ubus_raddr[23]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[23]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b24 (
    .clk(clk),
    .d(ubus_raddr[24]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[24]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b25 (
    .clk(clk),
    .d(ubus_raddr[25]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[25]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b26 (
    .clk(clk),
    .d(ubus_raddr[26]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[26]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b27 (
    .clk(clk),
    .d(ubus_raddr[27]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[27]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b28 (
    .clk(clk),
    .d(ubus_raddr[28]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[28]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b29 (
    .clk(clk),
    .d(ubus_raddr[29]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[29]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b3 (
    .clk(clk),
    .d(ubus_raddr[3]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[3]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b30 (
    .clk(clk),
    .d(ubus_raddr[30]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[30]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b31 (
    .clk(clk),
    .d(ubus_raddr[31]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[31]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b4 (
    .clk(clk),
    .d(ubus_raddr[4]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[4]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b5 (
    .clk(clk),
    .d(ubus_raddr[5]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[5]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b6 (
    .clk(clk),
    .d(ubus_raddr[6]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[6]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b7 (
    .clk(clk),
    .d(ubus_raddr[7]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[7]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b8 (
    .clk(clk),
    .d(ubus_raddr[8]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[8]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b9 (
    .clk(clk),
    .d(ubus_raddr[9]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[9]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b0 (
    .clk(clk),
    .d(ubus_rdata[0]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[0]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b1 (
    .clk(clk),
    .d(ubus_rdata[1]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[1]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b10 (
    .clk(clk),
    .d(ubus_rdata[10]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[10]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b11 (
    .clk(clk),
    .d(ubus_rdata[11]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[11]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b12 (
    .clk(clk),
    .d(ubus_rdata[12]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[12]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b13 (
    .clk(clk),
    .d(ubus_rdata[13]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[13]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b14 (
    .clk(clk),
    .d(ubus_rdata[14]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[14]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b15 (
    .clk(clk),
    .d(ubus_rdata[15]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[15]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b16 (
    .clk(clk),
    .d(ubus_rdata[16]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[16]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b17 (
    .clk(clk),
    .d(ubus_rdata[17]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[17]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b18 (
    .clk(clk),
    .d(ubus_rdata[18]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[18]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b19 (
    .clk(clk),
    .d(ubus_rdata[19]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[19]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b2 (
    .clk(clk),
    .d(ubus_rdata[2]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[2]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b20 (
    .clk(clk),
    .d(ubus_rdata[20]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[20]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b21 (
    .clk(clk),
    .d(ubus_rdata[21]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[21]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b22 (
    .clk(clk),
    .d(ubus_rdata[22]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[22]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b23 (
    .clk(clk),
    .d(ubus_rdata[23]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[23]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b24 (
    .clk(clk),
    .d(ubus_rdata[24]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[24]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b25 (
    .clk(clk),
    .d(ubus_rdata[25]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[25]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b26 (
    .clk(clk),
    .d(ubus_rdata[26]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[26]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b27 (
    .clk(clk),
    .d(ubus_rdata[27]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[27]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b28 (
    .clk(clk),
    .d(ubus_rdata[28]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[28]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b29 (
    .clk(clk),
    .d(ubus_rdata[29]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[29]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b3 (
    .clk(clk),
    .d(ubus_rdata[3]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[3]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b30 (
    .clk(clk),
    .d(ubus_rdata[30]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[30]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b31 (
    .clk(clk),
    .d(ubus_rdata[31]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[31]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b4 (
    .clk(clk),
    .d(ubus_rdata[4]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[4]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b5 (
    .clk(clk),
    .d(ubus_rdata[5]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[5]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b6 (
    .clk(clk),
    .d(ubus_rdata[6]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[6]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b7 (
    .clk(clk),
    .d(ubus_rdata[7]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[7]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b8 (
    .clk(clk),
    .d(ubus_rdata[8]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[8]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b9 (
    .clk(clk),
    .d(ubus_rdata[9]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[9]));  // src/rtl/uart/uprotocol.v(247)
  reg_sr_as_w1 reg14_b0 (
    .clk(clk),
    .d(n78[0]),
    .en(1'b1),
    .reset(~tx_ready),
    .set(1'b0),
    .q(tx_ready_cnt[0]));  // src/rtl/uart/uprotocol.v(278)
  reg_sr_as_w1 reg14_b1 (
    .clk(clk),
    .d(n78[1]),
    .en(1'b1),
    .reset(~tx_ready),
    .set(1'b0),
    .q(tx_ready_cnt[1]));  // src/rtl/uart/uprotocol.v(278)
  reg_sr_as_w1 reg14_b2 (
    .clk(clk),
    .d(n78[2]),
    .en(1'b1),
    .reset(~tx_ready),
    .set(1'b0),
    .q(tx_ready_cnt[2]));  // src/rtl/uart/uprotocol.v(278)
  reg_sr_as_w1 reg15_b0 (
    .clk(clk),
    .d(n83[0]),
    .en(n81),
    .reset(~mux21_b0_sel_is_0_o),
    .set(1'b0),
    .q(send_cnt[0]));  // src/rtl/uart/uprotocol.v(295)
  reg_sr_as_w1 reg15_b1 (
    .clk(clk),
    .d(n83[1]),
    .en(n81),
    .reset(~mux21_b0_sel_is_0_o),
    .set(1'b0),
    .q(send_cnt[1]));  // src/rtl/uart/uprotocol.v(295)
  reg_sr_as_w1 reg15_b2 (
    .clk(clk),
    .d(n83[2]),
    .en(n81),
    .reset(~mux21_b0_sel_is_0_o),
    .set(1'b0),
    .q(send_cnt[2]));  // src/rtl/uart/uprotocol.v(295)
  reg_sr_as_w1 reg15_b3 (
    .clk(clk),
    .d(n83[3]),
    .en(n81),
    .reset(~mux21_b0_sel_is_0_o),
    .set(1'b0),
    .q(send_cnt[3]));  // src/rtl/uart/uprotocol.v(295)
  reg_ar_as_w1 reg16_b0 (
    .clk(clk),
    .d(n88[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[0]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b1 (
    .clk(clk),
    .d(n88[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[1]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b2 (
    .clk(clk),
    .d(n88[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[2]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b3 (
    .clk(clk),
    .d(n88[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[3]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b4 (
    .clk(clk),
    .d(n88[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[4]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b5 (
    .clk(clk),
    .d(n88[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[5]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b6 (
    .clk(clk),
    .d(n88[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[6]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b7 (
    .clk(clk),
    .d(n88[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[7]));  // src/rtl/uart/uprotocol.v(323)
  reg_sr_as_w1 reg17_b0 (
    .clk(clk),
    .d(n4[0]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[0]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b1 (
    .clk(clk),
    .d(n4[1]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[1]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b10 (
    .clk(clk),
    .d(n4[10]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[10]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b11 (
    .clk(clk),
    .d(n4[11]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[11]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b12 (
    .clk(clk),
    .d(n4[12]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[12]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b13 (
    .clk(clk),
    .d(n4[13]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[13]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b14 (
    .clk(clk),
    .d(n4[14]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[14]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b15 (
    .clk(clk),
    .d(n4[15]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[15]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b16 (
    .clk(clk),
    .d(n4[16]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[16]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b17 (
    .clk(clk),
    .d(n4[17]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[17]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b18 (
    .clk(clk),
    .d(n4[18]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[18]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b19 (
    .clk(clk),
    .d(n4[19]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[19]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b2 (
    .clk(clk),
    .d(n4[2]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[2]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b20 (
    .clk(clk),
    .d(n4[20]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[20]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b21 (
    .clk(clk),
    .d(n4[21]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[21]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b22 (
    .clk(clk),
    .d(n4[22]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[22]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b23 (
    .clk(clk),
    .d(n4[23]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[23]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b24 (
    .clk(clk),
    .d(n4[24]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[24]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b25 (
    .clk(clk),
    .d(n4[25]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[25]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b26 (
    .clk(clk),
    .d(n4[26]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[26]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b27 (
    .clk(clk),
    .d(n4[27]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[27]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b28 (
    .clk(clk),
    .d(n4[28]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[28]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b29 (
    .clk(clk),
    .d(n4[29]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[29]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b3 (
    .clk(clk),
    .d(n4[3]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[3]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b30 (
    .clk(clk),
    .d(n4[30]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[30]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b31 (
    .clk(clk),
    .d(n4[31]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[31]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b4 (
    .clk(clk),
    .d(n4[4]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[4]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b5 (
    .clk(clk),
    .d(n4[5]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[5]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b6 (
    .clk(clk),
    .d(n4[6]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[6]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b7 (
    .clk(clk),
    .d(n4[7]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[7]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b8 (
    .clk(clk),
    .d(n4[8]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[8]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b9 (
    .clk(clk),
    .d(n4[9]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[9]));  // src/rtl/uart/uprotocol.v(99)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk),
    .d(reg0_al_b0[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk),
    .d(reg0_al_b0[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk),
    .d(reg0_al_b0[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk),
    .d(reg0_al_b0[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b4 (
    .clk(clk),
    .d(reg0_al_b0[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b5 (
    .clk(clk),
    .d(reg0_al_b0[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b6 (
    .clk(clk),
    .d(reg0_al_b0[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b7 (
    .clk(clk),
    .d(reg0_al_b0[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk),
    .d(reg1_al_b1[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk),
    .d(reg1_al_b1[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk),
    .d(reg1_al_b1[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk),
    .d(reg1_al_b1[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b4 (
    .clk(clk),
    .d(reg1_al_b1[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b5 (
    .clk(clk),
    .d(reg1_al_b1[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b6 (
    .clk(clk),
    .d(reg1_al_b1[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b7 (
    .clk(clk),
    .d(reg1_al_b1[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk),
    .d(reg2_al_b2[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk),
    .d(reg2_al_b2[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk),
    .d(reg2_al_b2[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b3 (
    .clk(clk),
    .d(reg2_al_b2[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b4 (
    .clk(clk),
    .d(reg2_al_b2[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b5 (
    .clk(clk),
    .d(reg2_al_b2[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b6 (
    .clk(clk),
    .d(reg2_al_b2[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b7 (
    .clk(clk),
    .d(reg2_al_b2[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk),
    .d(reg3_al_b3[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk),
    .d(reg3_al_b3[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b2 (
    .clk(clk),
    .d(reg3_al_b3[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b3 (
    .clk(clk),
    .d(reg3_al_b3[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b4 (
    .clk(clk),
    .d(reg3_al_b3[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b5 (
    .clk(clk),
    .d(reg3_al_b3[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b6 (
    .clk(clk),
    .d(reg3_al_b3[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b7 (
    .clk(clk),
    .d(reg3_al_b3[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b0 (
    .clk(clk),
    .d(reg4_al_b4[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b1 (
    .clk(clk),
    .d(reg4_al_b4[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b2 (
    .clk(clk),
    .d(reg4_al_b4[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b3 (
    .clk(clk),
    .d(reg4_al_b4[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b4 (
    .clk(clk),
    .d(reg4_al_b4[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b5 (
    .clk(clk),
    .d(reg4_al_b4[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b6 (
    .clk(clk),
    .d(reg4_al_b4[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b7 (
    .clk(clk),
    .d(reg4_al_b4[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b0 (
    .clk(clk),
    .d(reg5_al_b5[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b1 (
    .clk(clk),
    .d(reg5_al_b5[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b2 (
    .clk(clk),
    .d(reg5_al_b5[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b3 (
    .clk(clk),
    .d(reg5_al_b5[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b4 (
    .clk(clk),
    .d(reg5_al_b5[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b5 (
    .clk(clk),
    .d(reg5_al_b5[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b6 (
    .clk(clk),
    .d(reg5_al_b5[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b7 (
    .clk(clk),
    .d(reg5_al_b5[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b0 (
    .clk(clk),
    .d(reg6_al_b6[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b1 (
    .clk(clk),
    .d(reg6_al_b6[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b2 (
    .clk(clk),
    .d(reg6_al_b6[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b3 (
    .clk(clk),
    .d(reg6_al_b6[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b4 (
    .clk(clk),
    .d(reg6_al_b6[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b5 (
    .clk(clk),
    .d(reg6_al_b6[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b6 (
    .clk(clk),
    .d(reg6_al_b6[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b7 (
    .clk(clk),
    .d(reg6_al_b6[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_sr_as_w1 reg8_b0 (
    .clk(clk),
    .d(n54[0]),
    .en(rx_en),
    .reset(~mux12_b0_sel_is_2_o),
    .set(1'b0),
    .q(recv_cnt[0]));  // src/rtl/uart/uprotocol.v(203)
  reg_sr_as_w1 reg8_b1 (
    .clk(clk),
    .d(n54[1]),
    .en(rx_en),
    .reset(~mux12_b0_sel_is_2_o),
    .set(1'b0),
    .q(recv_cnt[1]));  // src/rtl/uart/uprotocol.v(203)
  reg_sr_as_w1 reg8_b2 (
    .clk(clk),
    .d(n54[2]),
    .en(rx_en),
    .reset(~mux12_b0_sel_is_2_o),
    .set(1'b0),
    .q(recv_cnt[2]));  // src/rtl/uart/uprotocol.v(203)
  reg_ar_as_w1 reg9_b0 (
    .clk(clk),
    .d(reg7_al_b7[0]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[0]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b1 (
    .clk(clk),
    .d(reg7_al_b7[1]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[1]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b10 (
    .clk(clk),
    .d(reg6_al_b6[2]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[10]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b11 (
    .clk(clk),
    .d(reg6_al_b6[3]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[11]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b12 (
    .clk(clk),
    .d(reg6_al_b6[4]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[12]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b13 (
    .clk(clk),
    .d(reg6_al_b6[5]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[13]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b14 (
    .clk(clk),
    .d(reg6_al_b6[6]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[14]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b15 (
    .clk(clk),
    .d(reg6_al_b6[7]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[15]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b16 (
    .clk(clk),
    .d(reg5_al_b5[0]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[16]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b17 (
    .clk(clk),
    .d(reg5_al_b5[1]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[17]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b18 (
    .clk(clk),
    .d(reg5_al_b5[2]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[18]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b19 (
    .clk(clk),
    .d(reg5_al_b5[3]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[19]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b2 (
    .clk(clk),
    .d(reg7_al_b7[2]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[2]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b20 (
    .clk(clk),
    .d(reg5_al_b5[4]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[20]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b21 (
    .clk(clk),
    .d(reg5_al_b5[5]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[21]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b22 (
    .clk(clk),
    .d(reg5_al_b5[6]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[22]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b23 (
    .clk(clk),
    .d(reg5_al_b5[7]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[23]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b24 (
    .clk(clk),
    .d(reg4_al_b4[0]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[24]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b25 (
    .clk(clk),
    .d(reg4_al_b4[1]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[25]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b26 (
    .clk(clk),
    .d(reg4_al_b4[2]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[26]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b27 (
    .clk(clk),
    .d(reg4_al_b4[3]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[27]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b28 (
    .clk(clk),
    .d(reg4_al_b4[4]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[28]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b29 (
    .clk(clk),
    .d(reg4_al_b4[5]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[29]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b3 (
    .clk(clk),
    .d(reg7_al_b7[3]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[3]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b30 (
    .clk(clk),
    .d(reg4_al_b4[6]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[30]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b31 (
    .clk(clk),
    .d(reg4_al_b4[7]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[31]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b4 (
    .clk(clk),
    .d(reg7_al_b7[4]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[4]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b5 (
    .clk(clk),
    .d(reg7_al_b7[5]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[5]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b6 (
    .clk(clk),
    .d(reg7_al_b7[6]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[6]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b7 (
    .clk(clk),
    .d(reg7_al_b7[7]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[7]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b8 (
    .clk(clk),
    .d(reg6_al_b6[0]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[8]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b9 (
    .clk(clk),
    .d(reg6_al_b6[1]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[9]));  // src/rtl/uart/uprotocol.v(223)
  not send_finish_inv (send_finish_neg, send_finish);
  reg_ar_ss_w1 send_finish_reg (
    .clk(clk),
    .d(n75),
    .en(1'b1),
    .reset(1'b0),
    .set(auto_rst),
    .q(send_finish));  // src/rtl/uart/uprotocol.v(269)
  reg_ar_as_w1 send_flag_reg (
    .clk(clk),
    .d(n81),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_flag));  // src/rtl/uart/uprotocol.v(302)
  reg_sr_ss_w1 send_start_reg (
    .clk(clk),
    .d(1'b0),
    .en(send_finish),
    .reset(auto_rst),
    .set(ubus_bken),
    .q(send_start));  // src/rtl/uart/uprotocol.v(258)
  reg_ar_as_w1 tx_en_reg (
    .clk(clk),
    .d(send_flag),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_en));  // src/rtl/uart/uprotocol.v(302)
  reg_ar_as_w1 tx_ready_flag_reg (
    .clk(clk),
    .d(n80),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_ready_flag));  // src/rtl/uart/uprotocol.v(284)
  and u13 (n30, rd_flag2, rd_flag1);  // src/rtl/uart/uprotocol.v(162)
  and u2 (n77, wt_flag5, n82);  // src/rtl/uart/uprotocol.v(142)
  and u20 (n82, wt_flag4, wt_flag3);  // src/rtl/uart/uprotocol.v(142)
  or u25 (n48, wt_flag, rd_flag);  // src/rtl/uart/uprotocol.v(188)
  and u29 (n52, n30, n7);  // src/rtl/uart/uprotocol.v(162)
  and u3 (n43, n62, n52);  // src/rtl/uart/uprotocol.v(162)
  and u30 (n59, rx_en, n58);  // src/rtl/uart/uprotocol.v(208)
  and u31 (n60, recv_flag, rd_mode);  // src/rtl/uart/uprotocol.v(214)
  and u32 (n61, recv_flag, wt_mode);  // src/rtl/uart/uprotocol.v(215)
  and u33 (n62, rd_flag5, n64);  // src/rtl/uart/uprotocol.v(162)
  and u34 (n80, tx_ready_cnt[0], n87);  // src/rtl/uart/uprotocol.v(283)
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
  and u42 (n64, rd_flag4, rd_flag3);  // src/rtl/uart/uprotocol.v(162)
  and u43 (n81, send_start, tx_ready_flag);  // src/rtl/uart/uprotocol.v(293)
  and u44 (n87, tx_ready_cnt[1], tx_ready_cnt[2]);  // src/rtl/uart/uprotocol.v(283)
  and u45 (n53, wt_flag2, wt_flag1);  // src/rtl/uart/uprotocol.v(142)
  and u46 (n3, wt_flag0, rx_en);  // src/rtl/uart/uprotocol.v(142)
  and u47 (n0, n53, n3);  // src/rtl/uart/uprotocol.v(142)
  and u48 (n29, n77, n0);  // src/rtl/uart/uprotocol.v(142)
  and u5 (n7, rd_flag0, rx_en);  // src/rtl/uart/uprotocol.v(162)
  reg_ar_as_w1 ubus_ren_reg (
    .clk(clk),
    .d(n60),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_ren));  // src/rtl/uart/uprotocol.v(216)
  reg_ar_as_w1 ubus_wen_reg (
    .clk(clk),
    .d(n61),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wen));  // src/rtl/uart/uprotocol.v(216)
  reg_ar_as_w1 wt_flag0_reg (
    .clk(clk),
    .d(n17),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag0));  // src/rtl/uart/uprotocol.v(137)
  reg_ar_as_w1 wt_flag1_reg (
    .clk(clk),
    .d(n18),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag1));  // src/rtl/uart/uprotocol.v(137)
  reg_ar_as_w1 wt_flag2_reg (
    .clk(clk),
    .d(n19),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag2));  // src/rtl/uart/uprotocol.v(137)
  reg_ar_as_w1 wt_flag3_reg (
    .clk(clk),
    .d(n20),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag3));  // src/rtl/uart/uprotocol.v(137)
  reg_ar_as_w1 wt_flag4_reg (
    .clk(clk),
    .d(n21),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag4));  // src/rtl/uart/uprotocol.v(137)
  reg_ar_as_w1 wt_flag5_reg (
    .clk(clk),
    .d(n22),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag5));  // src/rtl/uart/uprotocol.v(137)
  reg_ar_as_w1 wt_flag_reg (
    .clk(clk),
    .d(n29),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag));  // src/rtl/uart/uprotocol.v(143)
  reg_sr_ss_w1 wt_mode_reg (
    .clk(clk),
    .d(wt_mode),
    .en(1'b1),
    .reset(recv_flag),
    .set(wt_flag),
    .q(wt_mode));  // src/rtl/uart/uprotocol.v(181)

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
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

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

module eq_w29
  (
  i0,
  i1,
  o
  );

  input [28:0] i0;
  input [28:0] i1;
  output o;

  wire \or_or_or_or_xor_i0[0_o ;
  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_or_xor_i0[14]__o ;
  wire \or_or_or_xor_i0[21]__o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[10]_i1[_o ;
  wire \or_or_xor_i0[14]_i1[_o ;
  wire \or_or_xor_i0[17]_i1[_o ;
  wire \or_or_xor_i0[21]_i1[_o ;
  wire \or_or_xor_i0[25]_i1[_o ;
  wire \or_or_xor_i0[3]_i1[3_o ;
  wire \or_or_xor_i0[7]_i1[7_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[10]_i1[10]_o ;
  wire \or_xor_i0[12]_i1[12]_o ;
  wire \or_xor_i0[14]_i1[14]_o ;
  wire \or_xor_i0[15]_i1[15]_o ;
  wire \or_xor_i0[17]_i1[17]_o ;
  wire \or_xor_i0[19]_i1[19]_o ;
  wire \or_xor_i0[1]_i1[1]_o_o ;
  wire \or_xor_i0[21]_i1[21]_o ;
  wire \or_xor_i0[23]_i1[23]_o ;
  wire \or_xor_i0[25]_i1[25]_o ;
  wire \or_xor_i0[27]_i1[27]_o ;
  wire \or_xor_i0[3]_i1[3]_o_o ;
  wire \or_xor_i0[5]_i1[5]_o_o ;
  wire \or_xor_i0[7]_i1[7]_o_o ;
  wire \or_xor_i0[8]_i1[8]_o_o ;
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
  wire \xor_i0[25]_i1[25]_o ;
  wire \xor_i0[26]_i1[26]_o ;
  wire \xor_i0[27]_i1[27]_o ;
  wire \xor_i0[28]_i1[28]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;
  wire \xor_i0[8]_i1[8]_o ;
  wire \xor_i0[9]_i1[9]_o ;

  not none_diff (o, \or_or_or_or_xor_i0[0_o );
  or \or_or_or_or_xor_i0[0  (\or_or_or_or_xor_i0[0_o , \or_or_or_xor_i0[0]_i_o , \or_or_or_xor_i0[14]__o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[7]_i1[7_o );
  or \or_or_or_xor_i0[14]_  (\or_or_or_xor_i0[14]__o , \or_or_xor_i0[14]_i1[_o , \or_or_or_xor_i0[21]__o );
  or \or_or_or_xor_i0[21]_  (\or_or_or_xor_i0[21]__o , \or_or_xor_i0[21]_i1[_o , \or_or_xor_i0[25]_i1[_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_or_xor_i0[3]_i1[3_o );
  or \or_or_xor_i0[10]_i1[  (\or_or_xor_i0[10]_i1[_o , \or_xor_i0[10]_i1[10]_o , \or_xor_i0[12]_i1[12]_o );
  or \or_or_xor_i0[14]_i1[  (\or_or_xor_i0[14]_i1[_o , \or_xor_i0[14]_i1[14]_o , \or_or_xor_i0[17]_i1[_o );
  or \or_or_xor_i0[17]_i1[  (\or_or_xor_i0[17]_i1[_o , \or_xor_i0[17]_i1[17]_o , \or_xor_i0[19]_i1[19]_o );
  or \or_or_xor_i0[21]_i1[  (\or_or_xor_i0[21]_i1[_o , \or_xor_i0[21]_i1[21]_o , \or_xor_i0[23]_i1[23]_o );
  or \or_or_xor_i0[25]_i1[  (\or_or_xor_i0[25]_i1[_o , \or_xor_i0[25]_i1[25]_o , \or_xor_i0[27]_i1[27]_o );
  or \or_or_xor_i0[3]_i1[3  (\or_or_xor_i0[3]_i1[3_o , \or_xor_i0[3]_i1[3]_o_o , \or_xor_i0[5]_i1[5]_o_o );
  or \or_or_xor_i0[7]_i1[7  (\or_or_xor_i0[7]_i1[7_o , \or_xor_i0[7]_i1[7]_o_o , \or_or_xor_i0[10]_i1[_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \or_xor_i0[1]_i1[1]_o_o );
  or \or_xor_i0[10]_i1[10]  (\or_xor_i0[10]_i1[10]_o , \xor_i0[10]_i1[10]_o , \xor_i0[11]_i1[11]_o );
  or \or_xor_i0[12]_i1[12]  (\or_xor_i0[12]_i1[12]_o , \xor_i0[12]_i1[12]_o , \xor_i0[13]_i1[13]_o );
  or \or_xor_i0[14]_i1[14]  (\or_xor_i0[14]_i1[14]_o , \xor_i0[14]_i1[14]_o , \or_xor_i0[15]_i1[15]_o );
  or \or_xor_i0[15]_i1[15]  (\or_xor_i0[15]_i1[15]_o , \xor_i0[15]_i1[15]_o , \xor_i0[16]_i1[16]_o );
  or \or_xor_i0[17]_i1[17]  (\or_xor_i0[17]_i1[17]_o , \xor_i0[17]_i1[17]_o , \xor_i0[18]_i1[18]_o );
  or \or_xor_i0[19]_i1[19]  (\or_xor_i0[19]_i1[19]_o , \xor_i0[19]_i1[19]_o , \xor_i0[20]_i1[20]_o );
  or \or_xor_i0[1]_i1[1]_o  (\or_xor_i0[1]_i1[1]_o_o , \xor_i0[1]_i1[1]_o , \xor_i0[2]_i1[2]_o );
  or \or_xor_i0[21]_i1[21]  (\or_xor_i0[21]_i1[21]_o , \xor_i0[21]_i1[21]_o , \xor_i0[22]_i1[22]_o );
  or \or_xor_i0[23]_i1[23]  (\or_xor_i0[23]_i1[23]_o , \xor_i0[23]_i1[23]_o , \xor_i0[24]_i1[24]_o );
  or \or_xor_i0[25]_i1[25]  (\or_xor_i0[25]_i1[25]_o , \xor_i0[25]_i1[25]_o , \xor_i0[26]_i1[26]_o );
  or \or_xor_i0[27]_i1[27]  (\or_xor_i0[27]_i1[27]_o , \xor_i0[27]_i1[27]_o , \xor_i0[28]_i1[28]_o );
  or \or_xor_i0[3]_i1[3]_o  (\or_xor_i0[3]_i1[3]_o_o , \xor_i0[3]_i1[3]_o , \xor_i0[4]_i1[4]_o );
  or \or_xor_i0[5]_i1[5]_o  (\or_xor_i0[5]_i1[5]_o_o , \xor_i0[5]_i1[5]_o , \xor_i0[6]_i1[6]_o );
  or \or_xor_i0[7]_i1[7]_o  (\or_xor_i0[7]_i1[7]_o_o , \xor_i0[7]_i1[7]_o , \or_xor_i0[8]_i1[8]_o_o );
  or \or_xor_i0[8]_i1[8]_o  (\or_xor_i0[8]_i1[8]_o_o , \xor_i0[8]_i1[8]_o , \xor_i0[9]_i1[9]_o );
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
  xor \xor_i0[25]_i1[25]  (\xor_i0[25]_i1[25]_o , i0[25], i1[25]);
  xor \xor_i0[26]_i1[26]  (\xor_i0[26]_i1[26]_o , i0[26], i1[26]);
  xor \xor_i0[27]_i1[27]  (\xor_i0[27]_i1[27]_o , i0[27], i1[27]);
  xor \xor_i0[28]_i1[28]  (\xor_i0[28]_i1[28]_o , i0[28], i1[28]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);
  xor \xor_i0[8]_i1[8]  (\xor_i0[8]_i1[8]_o , i0[8], i1[8]);
  xor \xor_i0[9]_i1[9]  (\xor_i0[9]_i1[9]_o , i0[9], i1[9]);

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

module eq_w8
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output o;

  wire \or_or_or_xor_i0[0]_i_o ;
  wire \or_or_xor_i0[0]_i1[0_o ;
  wire \or_or_xor_i0[4]_i1[4_o ;
  wire \or_xor_i0[0]_i1[0]_o_o ;
  wire \or_xor_i0[2]_i1[2]_o_o ;
  wire \or_xor_i0[4]_i1[4]_o_o ;
  wire \or_xor_i0[6]_i1[6]_o_o ;
  wire \xor_i0[0]_i1[0]_o ;
  wire \xor_i0[1]_i1[1]_o ;
  wire \xor_i0[2]_i1[2]_o ;
  wire \xor_i0[3]_i1[3]_o ;
  wire \xor_i0[4]_i1[4]_o ;
  wire \xor_i0[5]_i1[5]_o ;
  wire \xor_i0[6]_i1[6]_o ;
  wire \xor_i0[7]_i1[7]_o ;

  not none_diff (o, \or_or_or_xor_i0[0]_i_o );
  or \or_or_or_xor_i0[0]_i  (\or_or_or_xor_i0[0]_i_o , \or_or_xor_i0[0]_i1[0_o , \or_or_xor_i0[4]_i1[4_o );
  or \or_or_xor_i0[0]_i1[0  (\or_or_xor_i0[0]_i1[0_o , \or_xor_i0[0]_i1[0]_o_o , \or_xor_i0[2]_i1[2]_o_o );
  or \or_or_xor_i0[4]_i1[4  (\or_or_xor_i0[4]_i1[4_o , \or_xor_i0[4]_i1[4]_o_o , \or_xor_i0[6]_i1[6]_o_o );
  or \or_xor_i0[0]_i1[0]_o  (\or_xor_i0[0]_i1[0]_o_o , \xor_i0[0]_i1[0]_o , \xor_i0[1]_i1[1]_o );
  or \or_xor_i0[2]_i1[2]_o  (\or_xor_i0[2]_i1[2]_o_o , \xor_i0[2]_i1[2]_o , \xor_i0[3]_i1[3]_o );
  or \or_xor_i0[4]_i1[4]_o  (\or_xor_i0[4]_i1[4]_o_o , \xor_i0[4]_i1[4]_o , \xor_i0[5]_i1[5]_o );
  or \or_xor_i0[6]_i1[6]_o  (\or_xor_i0[6]_i1[6]_o_o , \xor_i0[6]_i1[6]_o , \xor_i0[7]_i1[7]_o );
  xor \xor_i0[0]_i1[0]  (\xor_i0[0]_i1[0]_o , i0[0], i1[0]);
  xor \xor_i0[1]_i1[1]  (\xor_i0[1]_i1[1]_o , i0[1], i1[1]);
  xor \xor_i0[2]_i1[2]  (\xor_i0[2]_i1[2]_o , i0[2], i1[2]);
  xor \xor_i0[3]_i1[3]  (\xor_i0[3]_i1[3]_o , i0[3], i1[3]);
  xor \xor_i0[4]_i1[4]  (\xor_i0[4]_i1[4]_o , i0[4], i1[4]);
  xor \xor_i0[5]_i1[5]  (\xor_i0[5]_i1[5]_o , i0[5], i1[5]);
  xor \xor_i0[6]_i1[6]  (\xor_i0[6]_i1[6]_o , i0[6], i1[6]);
  xor \xor_i0[7]_i1[7]  (\xor_i0[7]_i1[7]_o , i0[7], i1[7]);

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

