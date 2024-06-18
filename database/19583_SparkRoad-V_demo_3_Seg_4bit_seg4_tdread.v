// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Fri Jul 26 18:02:11 2019

`timescale 1ns / 1ps
module seg4  // sources/rtl/seg_4.v(14)
  (
  clk_24m,
  sm_bit,
  sm_seg
  );

  input clk_24m;  // sources/rtl/seg_4.v(19)
  output [3:0] sm_bit;  // sources/rtl/seg_4.v(21)
  output [7:0] sm_seg;  // sources/rtl/seg_4.v(20)

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
  wire [24:0] cnt;  // sources/rtl/seg_4.v(25)
  wire [17:0] cnt_w;  // sources/rtl/seg_4.v(32)
  wire [3:0] n10;
  wire [3:0] n11;
  wire [3:0] n12;
  wire [3:0] n17;
  wire [3:0] n18;
  wire [3:0] n19;
  wire [24:0] n2;
  wire [3:0] n25;
  wire [3:0] n26;
  wire [3:0] n27;
  wire [17:0] n29;
  wire [24:0] n3;
  wire [17:0] n30;
  wire [3:0] n31;
  wire [3:0] n32;
  wire [3:0] n5;
  wire [3:0] n6;
  wire [3:0] n7;
  wire [3:0] sm_bit1_num;  // sources/rtl/seg_4.v(27)
  wire [3:0] sm_bit2_num;  // sources/rtl/seg_4.v(28)
  wire [3:0] sm_bit3_num;  // sources/rtl/seg_4.v(29)
  wire [3:0] sm_bit4_num;  // sources/rtl/seg_4.v(30)
  wire [3:0] sm_bit_reg;  // sources/rtl/seg_4.v(34)
  wire [3:0] sm_seg_num;  // sources/rtl/seg_4.v(35)
  wire [7:0] sm_seg_reg;  // sources/rtl/seg_4.v(36)
  wire n0;
  wire n1;
  wire n13;
  wire n14;
  wire n15;
  wire n16;
  wire n20;
  wire n21;
  wire n22;
  wire n23;
  wire n24;
  wire n28;
  wire n4;
  wire n8;
  wire n9;
  wire rst_n;  // sources/rtl/seg_4.v(24)

  add_pu25_pu25_o25 add0 (
    .i0(cnt),
    .i1(25'b0000000000000000000000001),
    .o(n2));  // sources/rtl/seg_4.v(62)
  add_pu4_pu4_o4 add1 (
    .i0(sm_bit1_num),
    .i1(4'b0001),
    .o(n5));  // sources/rtl/seg_4.v(74)
  add_pu4_pu4_o4 add2 (
    .i0(sm_bit2_num),
    .i1(4'b0001),
    .o(n10));  // sources/rtl/seg_4.v(89)
  add_pu4_pu4_o4 add3 (
    .i0(sm_bit3_num),
    .i1(4'b0001),
    .o(n17));  // sources/rtl/seg_4.v(104)
  add_pu4_pu4_o4 add4 (
    .i0(sm_bit4_num),
    .i1(4'b0001),
    .o(n25));  // sources/rtl/seg_4.v(119)
  add_pu18_pu18_o18 add5 (
    .i0(cnt_w),
    .i1(18'b000000000000000001),
    .o(n29));  // sources/rtl/seg_4.v(133)
  eq_w25 eq0 (
    .i0(cnt),
    .i1(25'b0001001001001111100000000),
    .o(n1));  // sources/rtl/seg_4.v(59)
  eq_w4 eq1 (
    .i0(sm_bit1_num),
    .i1(4'b1001),
    .o(n4));  // sources/rtl/seg_4.v(71)
  eq_w4 eq2 (
    .i0(sm_bit2_num),
    .i1(4'b1010),
    .o(n9));  // sources/rtl/seg_4.v(86)
  eq_w4 eq3 (
    .i0(sm_bit2_num),
    .i1(4'b1001),
    .o(n13));  // sources/rtl/seg_4.v(99)
  eq_w4 eq4 (
    .i0(sm_bit3_num),
    .i1(4'b1010),
    .o(n16));  // sources/rtl/seg_4.v(101)
  eq_w4 eq5 (
    .i0(sm_bit3_num),
    .i1(4'b1001),
    .o(n20));  // sources/rtl/seg_4.v(114)
  eq_w4 eq6 (
    .i0(sm_bit4_num),
    .i1(4'b1010),
    .o(n24));  // sources/rtl/seg_4.v(116)
  eq_w18 eq7 (
    .i0(cnt_w),
    .i1(18'b111111111111111111),
    .o(n28));  // sources/rtl/seg_4.v(129)
  binary_mux_s1_w25 mux0 (
    .i0(n2),
    .i1(25'b0000000000000000000000000),
    .sel(n1),
    .o(n3));  // sources/rtl/seg_4.v(62)
  binary_mux_s1_w4 mux1 (
    .i0(n5),
    .i1(4'b0000),
    .sel(n4),
    .o(n6));  // sources/rtl/seg_4.v(74)
  binary_mux_s2_w4 mux10 (
    .i0(sm_bit1_num),
    .i1(sm_bit2_num),
    .i2(sm_bit3_num),
    .i3(sm_bit4_num),
    .sel(cnt_w[17:16]),
    .o(n31));  // sources/rtl/seg_4.v(147)
  binary_mux_s2_w4 mux11 (
    .i0(4'b1110),
    .i1(4'b1101),
    .i2(4'b1011),
    .i3(4'b0111),
    .sel(cnt_w[17:16]),
    .o(n32));  // sources/rtl/seg_4.v(162)
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
    .o(sm_seg_reg));  // sources/rtl/seg_4.v(190)
  binary_mux_s1_w4 mux2 (
    .i0(sm_bit1_num),
    .i1(n6),
    .sel(n1),
    .o(n7));  // sources/rtl/seg_4.v(77)
  binary_mux_s1_w4 mux3 (
    .i0(n10),
    .i1(4'b0000),
    .sel(n9),
    .o(n11));  // sources/rtl/seg_4.v(89)
  binary_mux_s1_w4 mux4 (
    .i0(sm_bit2_num),
    .i1(n11),
    .sel(n8),
    .o(n12));  // sources/rtl/seg_4.v(92)
  binary_mux_s1_w4 mux5 (
    .i0(n17),
    .i1(4'b0000),
    .sel(n16),
    .o(n18));  // sources/rtl/seg_4.v(104)
  binary_mux_s1_w4 mux6 (
    .i0(sm_bit3_num),
    .i1(n18),
    .sel(n15),
    .o(n19));  // sources/rtl/seg_4.v(107)
  binary_mux_s1_w4 mux7 (
    .i0(n25),
    .i1(4'b0000),
    .sel(n24),
    .o(n26));  // sources/rtl/seg_4.v(119)
  binary_mux_s1_w4 mux8 (
    .i0(sm_bit4_num),
    .i1(n26),
    .sel(n23),
    .o(n27));  // sources/rtl/seg_4.v(122)
  binary_mux_s1_w18 mux9 (
    .i0(n29),
    .i1(18'b000000000000000000),
    .sel(n28),
    .o(n30));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w4 reg0 (
    .clk(clk_24m),
    .d(n7),
    .reset({n0,n0,n0,n0}),
    .set(4'b0000),
    .q(sm_bit1_num));  // sources/rtl/seg_4.v(77)
  reg_ar_as_w4 reg1 (
    .clk(clk_24m),
    .d(n12),
    .reset({n0,n0,n0,n0}),
    .set(4'b0000),
    .q(sm_bit2_num));  // sources/rtl/seg_4.v(92)
  reg_ar_as_w4 reg2 (
    .clk(clk_24m),
    .d(n19),
    .reset({n0,n0,n0,n0}),
    .set(4'b0000),
    .q(sm_bit3_num));  // sources/rtl/seg_4.v(107)
  reg_ar_as_w4 reg3 (
    .clk(clk_24m),
    .d(n27),
    .reset({n0,n0,n0,n0}),
    .set(4'b0000),
    .q(sm_bit4_num));  // sources/rtl/seg_4.v(122)
  reg_ar_as_w18 reg4 (
    .clk(clk_24m),
    .d(n30),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(18'b000000000000000000),
    .q(cnt_w));  // sources/rtl/seg_4.v(133)
  reg_ar_as_w4 reg5 (
    .clk(clk_24m),
    .d(n31),
    .reset({n0,n0,n0,n0}),
    .set(4'b0000),
    .q(sm_seg_num));  // sources/rtl/seg_4.v(148)
  reg_ar_as_w25 reg6 (
    .clk(clk_24m),
    .d(n3),
    .reset({n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0,n0}),
    .set(25'b0000000000000000000000000),
    .q(cnt));  // sources/rtl/seg_4.v(62)
  reg_ar_as_w4 reg7 (
    .clk(clk_24m),
    .d(n32),
    .reset(4'b0000),
    .set({n0,n0,n0,n0}),
    .q(sm_bit_reg));  // sources/rtl/seg_4.v(163)
  buf u10 (sm_seg[3], sm_seg_reg[3]);  // sources/rtl/seg_4.v(193)
  and u11 (n21, n1, n20);  // sources/rtl/seg_4.v(114)
  buf u12 (sm_seg[2], sm_seg_reg[2]);  // sources/rtl/seg_4.v(193)
  and u13 (n22, n21, n13);  // sources/rtl/seg_4.v(114)
  buf u14 (sm_seg[1], sm_seg_reg[1]);  // sources/rtl/seg_4.v(193)
  and u15 (n23, n22, n4);  // sources/rtl/seg_4.v(114)
  buf u16 (sm_bit[3], sm_bit_reg[3]);  // sources/rtl/seg_4.v(194)
  buf u17 (sm_bit[2], sm_bit_reg[2]);  // sources/rtl/seg_4.v(194)
  buf u18 (sm_bit[1], sm_bit_reg[1]);  // sources/rtl/seg_4.v(194)
  buf u19 (sm_bit[0], sm_bit_reg[0]);  // sources/rtl/seg_4.v(194)
  not u2 (n0, rst_n);  // sources/rtl/seg_4.v(57)
  buf u20 (sm_seg[0], sm_seg_reg[0]);  // sources/rtl/seg_4.v(193)
  and u3 (n8, n1, n4);  // sources/rtl/seg_4.v(84)
  buf u4 (sm_seg[7], sm_seg_reg[7]);  // sources/rtl/seg_4.v(193)
  buf u5 (sm_seg[6], sm_seg_reg[6]);  // sources/rtl/seg_4.v(193)
  and u6 (n14, n1, n13);  // sources/rtl/seg_4.v(99)
  buf u7 (sm_seg[5], sm_seg_reg[5]);  // sources/rtl/seg_4.v(193)
  and u8 (n15, n14, n4);  // sources/rtl/seg_4.v(99)
  buf u9 (sm_seg[4], sm_seg_reg[4]);  // sources/rtl/seg_4.v(193)
  rst_n ux_rst (
    .clk(clk_24m),
    .rst_n(rst_n));  // sources/rtl/seg_4.v(49)

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

module rst_n  // sources/rtl/rst.v(14)
  (
  clk,
  rst_n
  );

  input clk;  // sources/rtl/rst.v(16)
  output rst_n;  // sources/rtl/rst.v(17)

  wire [3:0] cnt;  // sources/rtl/rst.v(20)
  wire [3:0] n1;
  wire [3:0] n2;
  wire n0;

  add_pu4_pu4_o4 add0 (
    .i0(cnt),
    .i1(4'b0001),
    .o(n1));  // sources/rtl/rst.v(27)
  eq_w4 eq0 (
    .i0(cnt),
    .i1(4'b1111),
    .o(n0));  // sources/rtl/rst.v(24)
  binary_mux_s1_w4 mux0 (
    .i0(n1),
    .i1(4'b1111),
    .sel(n0),
    .o(n2));  // sources/rtl/rst.v(27)
  reg_ar_as_w4 reg0 (
    .clk(clk),
    .d(n2),
    .reset(4'b0000),
    .set(4'b0000),
    .q(cnt));  // sources/rtl/rst.v(28)
  AL_DFF rst_n_reg (
    .clk(clk),
    .d(n0),
    .reset(1'b0),
    .set(1'b0),
    .q(rst_n));  // sources/rtl/rst.v(36)

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

