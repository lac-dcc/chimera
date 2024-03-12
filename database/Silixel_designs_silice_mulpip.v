/*

Copyright 2019, (C) Sylvain Lefebvre and contributors
List contributors with: git shortlog -n -s -- <filename>

MIT license

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(header_2_M)

*/
`define BARE 1
`define COLOR_DEPTH       6


module top(
`ifdef VGA
  // VGA
  output out_video_clock,
  output reg [`COLOR_DEPTH-1:0] out_video_r,
  output reg [`COLOR_DEPTH-1:0] out_video_g,
  output reg [`COLOR_DEPTH-1:0] out_video_b,
  output out_video_hs,
  output out_video_vs,
`endif
  // basic
  output [7:0] out_leds,
  input        clock
);

reg [2:0] ready = 3'b111;

always @(posedge clock) begin
  ready <= ready >> 1;
end

wire run_main;
assign run_main = 1'b1;

M_main __main(
  .clock(clock),
  .reset(ready[0]),
  .out_leds(out_leds),
`ifdef VGA
  .out_video_clock(out_video_clock),
  .out_video_r(out_video_r),
  .out_video_g(out_video_g),
  .out_video_b(out_video_b),
  .out_video_hs(out_video_hs),
  .out_video_vs(out_video_vs),
`endif
  .in_run(run_main)
);

endmodule


module M_mulpip16__mul (
in_im0,
in_im1,
out_ret,
out_done,
reset,
out_clock,
clock
);
input signed [15:0] in_im0;
input signed [15:0] in_im1;
output signed [15:0] out_ret;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
reg  [15:0] _t_sum_1_0;
reg  [15:0] _t_sum_2_0;
reg  [15:0] _t_sum_2_1;
reg  [15:0] _t_sum_3_0;
reg  [15:0] _t_sum_3_1;
reg  [15:0] _t_sum_3_2;
reg  [15:0] _t_sum_3_3;
reg  [15:0] _t_sum_4_0;
reg  [15:0] _t_sum_4_1;
reg  [15:0] _t_sum_4_2;
reg  [15:0] _t_sum_4_3;
reg  [15:0] _t_sum_4_4;
reg  [15:0] _t_sum_4_5;
reg  [15:0] _t_sum_4_6;
reg  [15:0] _t_sum_4_7;
reg  [15:0] _t_m0;
reg  [15:0] _t_m1;
reg  [0:0] _t_m0_neg;
reg  [0:0] _t_m1_neg;
reg  [0:0] _t___pip_138_0_m0_neg;
reg  [0:0] _t___pip_138_0_m1_neg;
reg  [15:0] _t___pip_138_3_sum_1_0;
reg  [15:0] _t___pip_138_2_sum_2_0;
reg  [15:0] _t___pip_138_2_sum_2_1;
reg  [15:0] _t___pip_138_1_sum_3_0;
reg  [15:0] _t___pip_138_1_sum_3_1;
reg  [15:0] _t___pip_138_1_sum_3_2;
reg  [15:0] _t___pip_138_1_sum_3_3;
reg  [15:0] _t___pip_138_0_sum_4_0;
reg  [15:0] _t___pip_138_0_sum_4_1;
reg  [15:0] _t___pip_138_0_sum_4_2;
reg  [15:0] _t___pip_138_0_sum_4_3;
reg  [15:0] _t___pip_138_0_sum_4_4;
reg  [15:0] _t___pip_138_0_sum_4_5;
reg  [15:0] _t___pip_138_0_sum_4_6;
reg  [15:0] _t___pip_138_0_sum_4_7;

reg  [0:0] _d___pip_138_1_m0_neg;
reg  [0:0] _q___pip_138_1_m0_neg;
reg  [0:0] _d___pip_138_2_m0_neg;
reg  [0:0] _q___pip_138_2_m0_neg;
reg  [0:0] _d___pip_138_3_m0_neg;
reg  [0:0] _q___pip_138_3_m0_neg;
reg  [0:0] _d___pip_138_4_m0_neg;
reg  [0:0] _q___pip_138_4_m0_neg;
reg  [0:0] _d___pip_138_1_m1_neg;
reg  [0:0] _q___pip_138_1_m1_neg;
reg  [0:0] _d___pip_138_2_m1_neg;
reg  [0:0] _q___pip_138_2_m1_neg;
reg  [0:0] _d___pip_138_3_m1_neg;
reg  [0:0] _q___pip_138_3_m1_neg;
reg  [0:0] _d___pip_138_4_m1_neg;
reg  [0:0] _q___pip_138_4_m1_neg;
reg  [15:0] _d___pip_138_4_sum_1_0;
reg  [15:0] _q___pip_138_4_sum_1_0;
reg  [15:0] _d___pip_138_3_sum_2_0;
reg  [15:0] _q___pip_138_3_sum_2_0;
reg  [15:0] _d___pip_138_3_sum_2_1;
reg  [15:0] _q___pip_138_3_sum_2_1;
reg  [15:0] _d___pip_138_2_sum_3_0;
reg  [15:0] _q___pip_138_2_sum_3_0;
reg  [15:0] _d___pip_138_2_sum_3_1;
reg  [15:0] _q___pip_138_2_sum_3_1;
reg  [15:0] _d___pip_138_2_sum_3_2;
reg  [15:0] _q___pip_138_2_sum_3_2;
reg  [15:0] _d___pip_138_2_sum_3_3;
reg  [15:0] _q___pip_138_2_sum_3_3;
reg  [15:0] _d___pip_138_1_sum_4_0;
reg  [15:0] _q___pip_138_1_sum_4_0;
reg  [15:0] _d___pip_138_1_sum_4_1;
reg  [15:0] _q___pip_138_1_sum_4_1;
reg  [15:0] _d___pip_138_1_sum_4_2;
reg  [15:0] _q___pip_138_1_sum_4_2;
reg  [15:0] _d___pip_138_1_sum_4_3;
reg  [15:0] _q___pip_138_1_sum_4_3;
reg  [15:0] _d___pip_138_1_sum_4_4;
reg  [15:0] _q___pip_138_1_sum_4_4;
reg  [15:0] _d___pip_138_1_sum_4_5;
reg  [15:0] _q___pip_138_1_sum_4_5;
reg  [15:0] _d___pip_138_1_sum_4_6;
reg  [15:0] _q___pip_138_1_sum_4_6;
reg  [15:0] _d___pip_138_1_sum_4_7;
reg  [15:0] _q___pip_138_1_sum_4_7;
reg signed [15:0] _d_ret;
reg signed [15:0] _q_ret;
reg  [1:0] _d_index,_q_index = 3;
reg  _autorun = 0;
assign out_ret = _q_ret;
assign out_done = (_q_index == 3) & _autorun;



`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (out_done));
`endif
always @* begin
_d___pip_138_1_m0_neg = _q___pip_138_1_m0_neg;
_d___pip_138_2_m0_neg = _q___pip_138_2_m0_neg;
_d___pip_138_3_m0_neg = _q___pip_138_3_m0_neg;
_d___pip_138_4_m0_neg = _q___pip_138_4_m0_neg;
_d___pip_138_1_m1_neg = _q___pip_138_1_m1_neg;
_d___pip_138_2_m1_neg = _q___pip_138_2_m1_neg;
_d___pip_138_3_m1_neg = _q___pip_138_3_m1_neg;
_d___pip_138_4_m1_neg = _q___pip_138_4_m1_neg;
_d___pip_138_4_sum_1_0 = _q___pip_138_4_sum_1_0;
_d___pip_138_3_sum_2_0 = _q___pip_138_3_sum_2_0;
_d___pip_138_3_sum_2_1 = _q___pip_138_3_sum_2_1;
_d___pip_138_2_sum_3_0 = _q___pip_138_2_sum_3_0;
_d___pip_138_2_sum_3_1 = _q___pip_138_2_sum_3_1;
_d___pip_138_2_sum_3_2 = _q___pip_138_2_sum_3_2;
_d___pip_138_2_sum_3_3 = _q___pip_138_2_sum_3_3;
_d___pip_138_1_sum_4_0 = _q___pip_138_1_sum_4_0;
_d___pip_138_1_sum_4_1 = _q___pip_138_1_sum_4_1;
_d___pip_138_1_sum_4_2 = _q___pip_138_1_sum_4_2;
_d___pip_138_1_sum_4_3 = _q___pip_138_1_sum_4_3;
_d___pip_138_1_sum_4_4 = _q___pip_138_1_sum_4_4;
_d___pip_138_1_sum_4_5 = _q___pip_138_1_sum_4_5;
_d___pip_138_1_sum_4_6 = _q___pip_138_1_sum_4_6;
_d___pip_138_1_sum_4_7 = _q___pip_138_1_sum_4_7;
_d_ret = _q_ret;
_d_index = _q_index;
_t_sum_1_0 = 0;
_t_sum_2_0 = 0;
_t_sum_2_1 = 0;
_t_sum_3_0 = 0;
_t_sum_3_1 = 0;
_t_sum_3_2 = 0;
_t_sum_3_3 = 0;
_t_sum_4_0 = 0;
_t_sum_4_1 = 0;
_t_sum_4_2 = 0;
_t_sum_4_3 = 0;
_t_sum_4_4 = 0;
_t_sum_4_5 = 0;
_t_sum_4_6 = 0;
_t_sum_4_7 = 0;
_t_m0 = 0;
_t_m1 = 0;
_t_m0_neg = 0;
_t_m1_neg = 0;
_t___pip_138_0_m0_neg = 0;
_t___pip_138_0_m1_neg = 0;
_t___pip_138_3_sum_1_0 = 0;
_t___pip_138_2_sum_2_0 = 0;
_t___pip_138_2_sum_2_1 = 0;
_t___pip_138_1_sum_3_0 = 0;
_t___pip_138_1_sum_3_1 = 0;
_t___pip_138_1_sum_3_2 = 0;
_t___pip_138_1_sum_3_3 = 0;
_t___pip_138_0_sum_4_0 = 0;
_t___pip_138_0_sum_4_1 = 0;
_t___pip_138_0_sum_4_2 = 0;
_t___pip_138_0_sum_4_3 = 0;
_t___pip_138_0_sum_4_4 = 0;
_t___pip_138_0_sum_4_5 = 0;
_t___pip_138_0_sum_4_6 = 0;
_t___pip_138_0_sum_4_7 = 0;
// _always_pre
(* full_case *)
case (_q_index)
0: begin
// _top
_d_index = 1;
end
1: begin
// __while__block_1
if (1) begin
// __block_2
// __block_4
// pipeline
// -------- stage 0
// __stage___block_6
// __block_7
if (in_im0<0) begin
// __block_8
// __block_10
_t_m0_neg = 1;
_t_m0 = -in_im0;
// __block_11
end else begin
// __block_9
// __block_12
_t_m0 = in_im0;
// __block_13
end
// __block_14
if (in_im1<0) begin
// __block_15
// __block_17
_t_m1_neg = 1;
_t_m1 = -in_im1;
// __block_18
end else begin
// __block_16
// __block_19
_t_m1 = in_im1;
// __block_20
end
// __block_21
  case (_t_m1[0+:2])
  2'b00: begin
// __block_23_case
// __block_24
_t_sum_4_0 = 0;
// __block_25
  end
  2'b10: begin
// __block_26_case
// __block_27
_t_sum_4_0 = _t_m0<<1;
// __block_28
  end
  2'b01: begin
// __block_29_case
// __block_30
_t_sum_4_0 = _t_m0<<0;
// __block_31
  end
  2'b11: begin
// __block_32_case
// __block_33
_t_sum_4_0 = (_t_m0<<0)+(_t_m0<<1);
// __block_34
  end
endcase
// __block_22
  case (_t_m1[2+:2])
  2'b00: begin
// __block_36_case
// __block_37
_t_sum_4_1 = 0;
// __block_38
  end
  2'b10: begin
// __block_39_case
// __block_40
_t_sum_4_1 = _t_m0<<3;
// __block_41
  end
  2'b01: begin
// __block_42_case
// __block_43
_t_sum_4_1 = _t_m0<<2;
// __block_44
  end
  2'b11: begin
// __block_45_case
// __block_46
_t_sum_4_1 = (_t_m0<<2)+(_t_m0<<3);
// __block_47
  end
endcase
// __block_35
  case (_t_m1[4+:2])
  2'b00: begin
// __block_49_case
// __block_50
_t_sum_4_2 = 0;
// __block_51
  end
  2'b10: begin
// __block_52_case
// __block_53
_t_sum_4_2 = _t_m0<<5;
// __block_54
  end
  2'b01: begin
// __block_55_case
// __block_56
_t_sum_4_2 = _t_m0<<4;
// __block_57
  end
  2'b11: begin
// __block_58_case
// __block_59
_t_sum_4_2 = (_t_m0<<4)+(_t_m0<<5);
// __block_60
  end
endcase
// __block_48
  case (_t_m1[6+:2])
  2'b00: begin
// __block_62_case
// __block_63
_t_sum_4_3 = 0;
// __block_64
  end
  2'b10: begin
// __block_65_case
// __block_66
_t_sum_4_3 = _t_m0<<7;
// __block_67
  end
  2'b01: begin
// __block_68_case
// __block_69
_t_sum_4_3 = _t_m0<<6;
// __block_70
  end
  2'b11: begin
// __block_71_case
// __block_72
_t_sum_4_3 = (_t_m0<<6)+(_t_m0<<7);
// __block_73
  end
endcase
// __block_61
  case (_t_m1[8+:2])
  2'b00: begin
// __block_75_case
// __block_76
_t_sum_4_4 = 0;
// __block_77
  end
  2'b10: begin
// __block_78_case
// __block_79
_t_sum_4_4 = _t_m0<<9;
// __block_80
  end
  2'b01: begin
// __block_81_case
// __block_82
_t_sum_4_4 = _t_m0<<8;
// __block_83
  end
  2'b11: begin
// __block_84_case
// __block_85
_t_sum_4_4 = (_t_m0<<8)+(_t_m0<<9);
// __block_86
  end
endcase
// __block_74
  case (_t_m1[10+:2])
  2'b00: begin
// __block_88_case
// __block_89
_t_sum_4_5 = 0;
// __block_90
  end
  2'b10: begin
// __block_91_case
// __block_92
_t_sum_4_5 = _t_m0<<11;
// __block_93
  end
  2'b01: begin
// __block_94_case
// __block_95
_t_sum_4_5 = _t_m0<<10;
// __block_96
  end
  2'b11: begin
// __block_97_case
// __block_98
_t_sum_4_5 = (_t_m0<<10)+(_t_m0<<11);
// __block_99
  end
endcase
// __block_87
  case (_t_m1[12+:2])
  2'b00: begin
// __block_101_case
// __block_102
_t_sum_4_6 = 0;
// __block_103
  end
  2'b10: begin
// __block_104_case
// __block_105
_t_sum_4_6 = _t_m0<<13;
// __block_106
  end
  2'b01: begin
// __block_107_case
// __block_108
_t_sum_4_6 = _t_m0<<12;
// __block_109
  end
  2'b11: begin
// __block_110_case
// __block_111
_t_sum_4_6 = (_t_m0<<12)+(_t_m0<<13);
// __block_112
  end
endcase
// __block_100
  case (_t_m1[14+:2])
  2'b00: begin
// __block_114_case
// __block_115
_t_sum_4_7 = 0;
// __block_116
  end
  2'b10: begin
// __block_117_case
// __block_118
_t_sum_4_7 = _t_m0<<15;
// __block_119
  end
  2'b01: begin
// __block_120_case
// __block_121
_t_sum_4_7 = _t_m0<<14;
// __block_122
  end
  2'b11: begin
// __block_123_case
// __block_124
_t_sum_4_7 = (_t_m0<<14)+(_t_m0<<15);
// __block_125
  end
endcase
// __block_113
_t___pip_138_0_m0_neg = _t_m0_neg;
_t___pip_138_0_m1_neg = _t_m1_neg;
_t___pip_138_0_sum_4_0 = _t_sum_4_0;
_t___pip_138_0_sum_4_1 = _t_sum_4_1;
_t___pip_138_0_sum_4_2 = _t_sum_4_2;
_t___pip_138_0_sum_4_3 = _t_sum_4_3;
_t___pip_138_0_sum_4_4 = _t_sum_4_4;
_t___pip_138_0_sum_4_5 = _t_sum_4_5;
_t___pip_138_0_sum_4_6 = _t_sum_4_6;
_t___pip_138_0_sum_4_7 = _t_sum_4_7;
// -------- stage 1
// __stage___block_127
// __block_128
_t_sum_3_0 = _q___pip_138_1_sum_4_0+_q___pip_138_1_sum_4_1;
_t_sum_3_1 = _q___pip_138_1_sum_4_2+_q___pip_138_1_sum_4_3;
_t_sum_3_2 = _q___pip_138_1_sum_4_4+_q___pip_138_1_sum_4_5;
_t_sum_3_3 = _q___pip_138_1_sum_4_6+_q___pip_138_1_sum_4_7;
_t___pip_138_1_sum_3_1 = _t_sum_3_1;
_t___pip_138_1_sum_3_0 = _t_sum_3_0;
_t___pip_138_1_sum_3_2 = _t_sum_3_2;
_t___pip_138_1_sum_3_3 = _t_sum_3_3;
// -------- stage 2
// __stage___block_130
// __block_131
_t_sum_2_0 = _q___pip_138_2_sum_3_0+_q___pip_138_2_sum_3_1;
_t_sum_2_1 = _q___pip_138_2_sum_3_2+_q___pip_138_2_sum_3_3;
_t___pip_138_2_sum_2_0 = _t_sum_2_0;
_t___pip_138_2_sum_2_1 = _t_sum_2_1;
// -------- stage 3
// __stage___block_133
// __block_134
_t_sum_1_0 = _q___pip_138_3_sum_2_0+_q___pip_138_3_sum_2_1;
_t___pip_138_3_sum_1_0 = _t_sum_1_0;
// -------- stage 4
// __stage___block_136
// __block_137
if (_q___pip_138_4_m0_neg^_q___pip_138_4_m1_neg) begin
// __block_138
// __block_140
_d_ret = -_q___pip_138_4_sum_1_0;
// __block_141
end else begin
// __block_139
// __block_142
_d_ret = _q___pip_138_4_sum_1_0;
// __block_143
end
// __block_144
// __block_5
// __block_146
_d_index = 1;
end else begin
_d_index = 2;
end
end
2: begin
// __block_3
_d_index = 3;
end
3: begin // end of 
end
default: begin 
_d_index = {2{1'bx}};
`ifdef FORMAL
assume(0);
`endif
 end
endcase
// _always_post
end

always @(posedge clock) begin
_q___pip_138_1_m0_neg <= _t___pip_138_0_m0_neg;
_q___pip_138_2_m0_neg <= _d___pip_138_1_m0_neg;
_q___pip_138_3_m0_neg <= _d___pip_138_2_m0_neg;
_q___pip_138_4_m0_neg <= _d___pip_138_3_m0_neg;
_q___pip_138_1_m1_neg <= _t___pip_138_0_m1_neg;
_q___pip_138_2_m1_neg <= _d___pip_138_1_m1_neg;
_q___pip_138_3_m1_neg <= _d___pip_138_2_m1_neg;
_q___pip_138_4_m1_neg <= _d___pip_138_3_m1_neg;
_q___pip_138_4_sum_1_0 <= _t___pip_138_3_sum_1_0;
_q___pip_138_3_sum_2_0 <= _t___pip_138_2_sum_2_0;
_q___pip_138_3_sum_2_1 <= _t___pip_138_2_sum_2_1;
_q___pip_138_2_sum_3_0 <= _t___pip_138_1_sum_3_0;
_q___pip_138_2_sum_3_1 <= _t___pip_138_1_sum_3_1;
_q___pip_138_2_sum_3_2 <= _t___pip_138_1_sum_3_2;
_q___pip_138_2_sum_3_3 <= _t___pip_138_1_sum_3_3;
_q___pip_138_1_sum_4_0 <= _t___pip_138_0_sum_4_0;
_q___pip_138_1_sum_4_1 <= _t___pip_138_0_sum_4_1;
_q___pip_138_1_sum_4_2 <= _t___pip_138_0_sum_4_2;
_q___pip_138_1_sum_4_3 <= _t___pip_138_0_sum_4_3;
_q___pip_138_1_sum_4_4 <= _t___pip_138_0_sum_4_4;
_q___pip_138_1_sum_4_5 <= _t___pip_138_0_sum_4_5;
_q___pip_138_1_sum_4_6 <= _t___pip_138_0_sum_4_6;
_q___pip_138_1_sum_4_7 <= _t___pip_138_0_sum_4_7;
_q_ret <= _d_ret;
_q_index <= reset ? 3 : ( ~_autorun ? 0 : _d_index);
_autorun <= reset ? 0 : 1;
end

endmodule

module M_main (
out_leds,
in_run,
out_done,
reset,
out_clock,
clock
);
output  [7:0] out_leds;
input in_run;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire signed [15:0] _w_mul_ret;
wire _w_mul_done;
reg signed [15:0] _t_result;

reg signed [15:0] _d_m0;
reg signed [15:0] _q_m0;
reg signed [15:0] _d_m1;
reg signed [15:0] _q_m1;
reg  [7:0] _d_leds;
reg  [7:0] _q_leds;
reg signed [15:0] _d_mul_im0,_q_mul_im0;
reg signed [15:0] _d_mul_im1,_q_mul_im1;
reg  [3:0] _d_index,_q_index = 13;
reg  _autorun = 0;
assign out_leds = _q_leds;
assign out_done = (_q_index == 13) & _autorun;
M_mulpip16__mul mul (
.in_im0(_d_mul_im0),
.in_im1(_d_mul_im1),
.out_ret(_w_mul_ret),
.out_done(_w_mul_done),
.reset(reset),
.clock(clock));



`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (out_done));
`endif
always @* begin
_d_m0 = _q_m0;
_d_m1 = _q_m1;
_d_leds = _q_leds;
_d_mul_im0 = _q_mul_im0;
_d_mul_im1 = _q_mul_im1;
_d_index = _q_index;
// _always_pre
_t_result = _w_mul_ret;
_d_mul_im0 = _q_m0;
_d_mul_im1 = _q_m1;
_d_leds = _t_result[0+:8];
(* full_case *)
case (_q_index)
0: begin
// _top
_d_m0 = 2;
_d_m1 = 3;
$display("%d * %d = ...",_d_m0,_d_m1);
_d_index = 1;
end
1: begin
// __block_1
_d_m0 = _q_m0+1;
_d_m1 = -_q_m1-1;
$display("%d * %d = ...",_d_m0,_d_m1);
_d_index = 2;
end
2: begin
// __block_2
_d_m0 = _q_m0+1;
_d_m1 = -_q_m1+1;
$display("%d * %d = ...",_d_m0,_d_m1);
_d_index = 3;
end
3: begin
// __block_3
_d_m0 = _q_m0+1;
_d_m1 = -_q_m1-1;
$display("%d * %d = ...",_d_m0,_d_m1);
_d_index = 4;
end
4: begin
// __block_4
_d_m0 = _q_m0+1;
_d_m1 = -_q_m1+1;
$display("%d * %d = ...",_d_m0,_d_m1);
_d_index = 5;
end
5: begin
// __block_5
_d_m0 = _q_m0+1;
_d_m1 = -_q_m1-1;
$display("%d * %d = ...",_d_m0,_d_m1);
_d_index = 6;
end
6: begin
// __block_6
$display("... = %d",_t_result);
_d_index = 7;
end
7: begin
// __block_7
$display("... = %d",_t_result);
_d_index = 8;
end
8: begin
// __block_8
$display("... = %d",_t_result);
_d_index = 9;
end
9: begin
// __block_9
$display("... = %d",_t_result);
_d_index = 10;
end
10: begin
// __block_10
$display("... = %d",_t_result);
_d_index = 11;
end
11: begin
// __block_11
$display("... = %d",_t_result);
_d_index = 12;
end
12: begin
// __block_12
_d_index = 13;
end
13: begin // end of 
end
default: begin 
_d_index = {4{1'bx}};
`ifdef FORMAL
assume(0);
`endif
 end
endcase
// _always_post
end

always @(posedge clock) begin
_q_m0 <= (reset) ? 0 : _d_m0;
_q_m1 <= (reset) ? 0 : _d_m1;
_q_leds <= (reset) ? 0 : _d_leds;
_q_index <= reset ? 13 : ( ~_autorun ? 0 : _d_index);
_autorun <= reset ? 0 : 1;
_q_mul_im0 <= _d_mul_im0;
_q_mul_im1 <= _d_mul_im1;
end

endmodule

