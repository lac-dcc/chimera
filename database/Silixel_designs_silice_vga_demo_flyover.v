`define VGA 1
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


module M_vga__vga_driver (
out_vga_hs,
out_vga_vs,
out_active,
out_vblank,
out_vga_x,
out_vga_y,
reset,
out_clock,
clock
);
output  [0:0] out_vga_hs;
output  [0:0] out_vga_vs;
output  [0:0] out_active;
output  [0:0] out_vblank;
output  [9:0] out_vga_x;
output  [9:0] out_vga_y;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [9:0] _w_pix_x;
wire  [9:0] _w_pix_y;
wire  [0:0] _w_active_h;
wire  [0:0] _w_active_v;

reg  [9:0] _d_xcount = 0;
reg  [9:0] _q_xcount = 0;
reg  [9:0] _d_ycount = 0;
reg  [9:0] _q_ycount = 0;
reg  [0:0] _d_vga_hs;
reg  [0:0] _q_vga_hs;
reg  [0:0] _d_vga_vs;
reg  [0:0] _q_vga_vs;
reg  [0:0] _d_active;
reg  [0:0] _q_active;
reg  [0:0] _d_vblank;
reg  [0:0] _q_vblank;
reg  [9:0] _d_vga_x;
reg  [9:0] _q_vga_x;
reg  [9:0] _d_vga_y;
reg  [9:0] _q_vga_y;
assign out_vga_hs = _q_vga_hs;
assign out_vga_vs = _q_vga_vs;
assign out_active = _q_active;
assign out_vblank = _q_vblank;
assign out_vga_x = _q_vga_x;
assign out_vga_y = _q_vga_y;


assign _w_pix_x = (_q_xcount-160);
assign _w_pix_y = (_q_ycount-45);
assign _w_active_h = (_q_xcount>=160&&_q_xcount<800);
assign _w_active_v = (_q_ycount>=45&&_q_ycount<525);

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_xcount = _q_xcount;
_d_ycount = _q_ycount;
_d_vga_hs = _q_vga_hs;
_d_vga_vs = _q_vga_vs;
_d_active = _q_active;
_d_vblank = _q_vblank;
_d_vga_x = _q_vga_x;
_d_vga_y = _q_vga_y;
// _always_pre
_d_active = _w_active_h&&_w_active_v;
_d_vga_hs = ~((_q_xcount>=16&&_q_xcount<112));
_d_vga_vs = ~((_q_ycount>=10&&_q_ycount<12));
_d_vblank = (_q_ycount<45);
// __block_1
_d_vga_x = _w_active_h ? _w_pix_x:0;
_d_vga_y = _w_active_v ? _w_pix_y:0;
if (_q_xcount==799) begin
// __block_2
// __block_4
_d_xcount = 0;
if (_q_ycount==524) begin
// __block_5
// __block_7
_d_ycount = 0;
// __block_8
end else begin
// __block_6
// __block_9
_d_ycount = _q_ycount+1;
// __block_10
end
// __block_11
// __block_12
end else begin
// __block_3
// __block_13
_d_xcount = _q_xcount+1;
// __block_14
end
// __block_15
// __block_16
// _always_post
end

always @(posedge clock) begin
_q_xcount <= _d_xcount;
_q_ycount <= _d_ycount;
_q_vga_hs <= _d_vga_hs;
_q_vga_vs <= _d_vga_vs;
_q_active <= _d_active;
_q_vblank <= _d_vblank;
_q_vga_x <= _d_vga_x;
_q_vga_y <= _d_vga_y;
end

endmodule




module M_mul_cmp16_0__display_div_mc0 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>0);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_0__display_div_mc1 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>0);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_0__display_div_mc2 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>0);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_0__display_div_mc3 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>0);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_0__display_div_mc4 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>0);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_0__display_div_mc5 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>0);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_0__display_div_mc6 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>0);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_0__display_div_mc7 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>0);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_8__display_div_mc8 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>8);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_8__display_div_mc9 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>8);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_8__display_div_mc10 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>8);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_8__display_div_mc11 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>8);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_8__display_div_mc12 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>8);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_8__display_div_mc13 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>8);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_mul_cmp16_8__display_div_mc14 (
in_num,
in_den,
out_beq,
out_clock,
clock
);
input  [15:0] in_num;
input  [15:0] in_den;
output  [0:0] out_beq;
output out_clock;
input clock;
assign out_clock = clock;
reg  [16:0] _t_nk;
reg  [0:0] _t_beq;

assign out_beq = _t_beq;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_nk = (in_num>>8);
_t_beq = (_t_nk>in_den);
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule

module M_div16__display_div (
in_inum,
in_iden,
out_ret,
in_run,
out_done,
reset,
out_clock,
clock
);
input signed [15:0] in_inum;
input signed [15:0] in_iden;
output signed [15:0] out_ret;
input in_run;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [0:0] _w_mc0_beq;
wire  [0:0] _w_mc1_beq;
wire  [0:0] _w_mc2_beq;
wire  [0:0] _w_mc3_beq;
wire  [0:0] _w_mc4_beq;
wire  [0:0] _w_mc5_beq;
wire  [0:0] _w_mc6_beq;
wire  [0:0] _w_mc7_beq;
wire  [0:0] _w_mc8_beq;
wire  [0:0] _w_mc9_beq;
wire  [0:0] _w_mc10_beq;
wire  [0:0] _w_mc11_beq;
wire  [0:0] _w_mc12_beq;
wire  [0:0] _w_mc13_beq;
wire  [0:0] _w_mc14_beq;
wire  [0:0] _c_num_neg;
assign _c_num_neg = 0;
wire  [0:0] _c_den_neg;
assign _c_den_neg = 0;
reg  [15:0] _t_concat;

reg  [15:0] _d_reminder;
reg  [15:0] _q_reminder;
reg  [15:0] _d_num;
reg  [15:0] _q_num;
reg  [15:0] _d_den;
reg  [15:0] _q_den;
reg signed [15:0] _d_ret;
reg signed [15:0] _q_ret;
reg  [2:0] _d_index,_q_index = 7;
assign out_ret = _q_ret;
assign out_done = (_q_index == 7);
M_mul_cmp16_0__display_div_mc0 mc0 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc0_beq),
.clock(clock));
M_mul_cmp16_0__display_div_mc1 mc1 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc1_beq),
.clock(clock));
M_mul_cmp16_0__display_div_mc2 mc2 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc2_beq),
.clock(clock));
M_mul_cmp16_0__display_div_mc3 mc3 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc3_beq),
.clock(clock));
M_mul_cmp16_0__display_div_mc4 mc4 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc4_beq),
.clock(clock));
M_mul_cmp16_0__display_div_mc5 mc5 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc5_beq),
.clock(clock));
M_mul_cmp16_0__display_div_mc6 mc6 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc6_beq),
.clock(clock));
M_mul_cmp16_0__display_div_mc7 mc7 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc7_beq),
.clock(clock));
M_mul_cmp16_8__display_div_mc8 mc8 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc8_beq),
.clock(clock));
M_mul_cmp16_8__display_div_mc9 mc9 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc9_beq),
.clock(clock));
M_mul_cmp16_8__display_div_mc10 mc10 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc10_beq),
.clock(clock));
M_mul_cmp16_8__display_div_mc11 mc11 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc11_beq),
.clock(clock));
M_mul_cmp16_8__display_div_mc12 mc12 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc12_beq),
.clock(clock));
M_mul_cmp16_8__display_div_mc13 mc13 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc13_beq),
.clock(clock));
M_mul_cmp16_8__display_div_mc14 mc14 (
.in_num(_q_reminder),
.in_den(_q_den),
.out_beq(_w_mc14_beq),
.clock(clock));



`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (in_run || out_done));
`endif
always @* begin
_d_reminder = _q_reminder;
_d_num = _q_num;
_d_den = _q_den;
_d_ret = _q_ret;
_d_index = _q_index;
_t_concat = 0;
// _always_pre
(* full_case *)
case (_q_index)
0: begin
// _top
_d_den = in_iden;
_d_num = in_inum;
if (_d_den>_d_num) begin
// __block_1
// __block_3
_d_ret = 0;
_d_index = 3;
end else begin
// __block_2
_d_index = 1;
end
end
3: begin
// done
_d_index = 7;
end
1: begin
// __block_6
if (_q_den==_q_num) begin
// __block_7
// __block_9
_d_ret = 1;
_d_index = 3;
end else begin
// __block_8
_d_index = 2;
end
end
2: begin
// __block_12
if (_q_den==0) begin
// __block_13
// __block_15
if (_c_num_neg^_c_den_neg) begin
// __block_16
// __block_18
_d_ret = 16'b1111111111111111;
// __block_19
end else begin
// __block_17
// __block_20
_d_ret = 16'b0111111111111111;
// __block_21
end
// __block_22
_d_index = 3;
end else begin
// __block_14
_d_index = 4;
end
end
4: begin
// __block_25
_d_reminder = _q_num;
_d_ret = 0;
_d_index = 5;
end
5: begin
// __while__block_26
if (_q_reminder>=_q_den) begin
// __block_27
// __block_29
_t_concat = {!_w_mc14_beq&&_w_mc13_beq,!_w_mc13_beq&&_w_mc12_beq,!_w_mc12_beq&&_w_mc11_beq,!_w_mc11_beq&&_w_mc10_beq,!_w_mc10_beq&&_w_mc9_beq,!_w_mc9_beq&&_w_mc8_beq,!_w_mc8_beq&&_w_mc7_beq,!_w_mc7_beq&&_w_mc6_beq,!_w_mc6_beq&&_w_mc5_beq,!_w_mc5_beq&&_w_mc4_beq,!_w_mc4_beq&&_w_mc3_beq,!_w_mc3_beq&&_w_mc2_beq,!_w_mc2_beq&&_w_mc1_beq,!_w_mc1_beq&&_w_mc0_beq,1'b0};
  case (_t_concat)
  16'b1000000000000000: begin
// __block_31_case
// __block_32
_d_ret = _q_ret+(1<<8);
_d_reminder = _q_reminder-(_q_den<<8);
// __block_33
  end
  16'b0100000000000000: begin
// __block_34_case
// __block_35
_d_ret = _q_ret+(1<<8);
_d_reminder = _q_reminder-(_q_den<<8);
// __block_36
  end
  16'b0010000000000000: begin
// __block_37_case
// __block_38
_d_ret = _q_ret+(1<<8);
_d_reminder = _q_reminder-(_q_den<<8);
// __block_39
  end
  16'b0001000000000000: begin
// __block_40_case
// __block_41
_d_ret = _q_ret+(1<<8);
_d_reminder = _q_reminder-(_q_den<<8);
// __block_42
  end
  16'b0000100000000000: begin
// __block_43_case
// __block_44
_d_ret = _q_ret+(1<<8);
_d_reminder = _q_reminder-(_q_den<<8);
// __block_45
  end
  16'b0000010000000000: begin
// __block_46_case
// __block_47
_d_ret = _q_ret+(1<<8);
_d_reminder = _q_reminder-(_q_den<<8);
// __block_48
  end
  16'b0000001000000000: begin
// __block_49_case
// __block_50
_d_ret = _q_ret+(1<<8);
_d_reminder = _q_reminder-(_q_den<<8);
// __block_51
  end
  16'b0000000100000000: begin
// __block_52_case
// __block_53
_d_ret = _q_ret+(1<<0);
_d_reminder = _q_reminder-(_q_den<<0);
// __block_54
  end
  16'b0000000010000000: begin
// __block_55_case
// __block_56
_d_ret = _q_ret+(1<<0);
_d_reminder = _q_reminder-(_q_den<<0);
// __block_57
  end
  16'b0000000001000000: begin
// __block_58_case
// __block_59
_d_ret = _q_ret+(1<<0);
_d_reminder = _q_reminder-(_q_den<<0);
// __block_60
  end
  16'b0000000000100000: begin
// __block_61_case
// __block_62
_d_ret = _q_ret+(1<<0);
_d_reminder = _q_reminder-(_q_den<<0);
// __block_63
  end
  16'b0000000000010000: begin
// __block_64_case
// __block_65
_d_ret = _q_ret+(1<<0);
_d_reminder = _q_reminder-(_q_den<<0);
// __block_66
  end
  16'b0000000000001000: begin
// __block_67_case
// __block_68
_d_ret = _q_ret+(1<<0);
_d_reminder = _q_reminder-(_q_den<<0);
// __block_69
  end
  16'b0000000000000100: begin
// __block_70_case
// __block_71
_d_ret = _q_ret+(1<<0);
_d_reminder = _q_reminder-(_q_den<<0);
// __block_72
  end
  16'b0000000000000010: begin
// __block_73_case
// __block_74
_d_ret = _q_ret+(1<<0);
_d_reminder = _q_reminder-(_q_den<<0);
// __block_75
  end
  16'b0000000000000000: begin
// __block_76_case
// __block_77
_d_ret = _q_ret+(1<<0);
_d_reminder = _q_reminder-(_q_den<<0);
// __block_78
  end
  default: begin
// __block_79_case
// __block_80
// __block_81
  end
endcase
// __block_30
// __block_82
_d_index = 5;
end else begin
_d_index = 6;
end
end
6: begin
// __block_28
_d_index = 3;
end
7: begin // end of 
end
default: begin 
_d_index = {3{1'bx}};
`ifdef FORMAL
assume(0);
`endif
 end
endcase
// _always_post
end

always @(posedge clock) begin
_q_reminder <= (reset | ~in_run) ? 0 : _d_reminder;
_q_num <= (reset | ~in_run) ? 0 : _d_num;
_q_den <= (reset | ~in_run) ? 0 : _d_den;
_q_ret <= _d_ret;
_q_index <= reset ? 7 : ( ~in_run ? 0 : _d_index);
end

endmodule

module M_frame_display__display (
in_pix_x,
in_pix_y,
in_pix_active,
in_pix_vblank,
out_pix_r,
out_pix_g,
out_pix_b,
out_done,
reset,
out_clock,
clock
);
input  [9:0] in_pix_x;
input  [9:0] in_pix_y;
input  [0:0] in_pix_active;
input  [0:0] in_pix_vblank;
output  [5:0] out_pix_r;
output  [5:0] out_pix_g;
output  [5:0] out_pix_b;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire signed [15:0] _w_div_ret;
wire _w_div_done;
wire  [14:0] _c_maxv;
assign _c_maxv = 22000;
reg  [8:0] _t_offs_y;
reg  [7:0] _t_u;
reg  [7:0] _t_v;
reg  [0:0] _t_floor;
reg  [5:0] _t_pix_r;
reg  [5:0] _t_pix_g;
reg  [5:0] _t_pix_b;

reg  [15:0] _d_cur_inv_y;
reg  [15:0] _q_cur_inv_y;
reg  [15:0] _d_pos_u;
reg  [15:0] _q_pos_u;
reg  [15:0] _d_pos_v;
reg  [15:0] _q_pos_v;
reg  [6:0] _d_lum;
reg  [6:0] _q_lum;
reg signed [15:0] _d_div_inum,_q_div_inum;
reg signed [15:0] _d_div_iden,_q_div_iden;
reg  [2:0] _d_index,_q_index = 6;
reg  _autorun = 0;
reg  _div_run = 0;
assign out_pix_r = _t_pix_r;
assign out_pix_g = _t_pix_g;
assign out_pix_b = _t_pix_b;
assign out_done = (_q_index == 6) & _autorun;
M_div16__display_div div (
.in_inum(_q_div_inum),
.in_iden(_q_div_iden),
.out_ret(_w_div_ret),
.out_done(_w_div_done),
.in_run(_div_run),
.reset(reset),
.clock(clock));



`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (out_done));
`endif
always @* begin
_d_cur_inv_y = _q_cur_inv_y;
_d_pos_u = _q_pos_u;
_d_pos_v = _q_pos_v;
_d_lum = _q_lum;
_d_div_inum = _q_div_inum;
_d_div_iden = _q_div_iden;
_d_index = _q_index;
_div_run = 1;
_t_offs_y = 0;
_t_u = 0;
_t_v = 0;
_t_floor = 0;
// _always_pre
_t_pix_r = 0;
_t_pix_g = 0;
_t_pix_b = 0;
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
_d_index = 3;
end else begin
_d_index = 2;
end
end
3: begin
// __while__block_5
if (in_pix_vblank==0) begin
// __block_6
// __block_8
if (in_pix_active) begin
// __block_9
// __block_11
if (in_pix_y<240) begin
// __block_12
// __block_14
_t_offs_y = 272-in_pix_y;
_t_floor = 0;
// __block_15
end else begin
// __block_13
// __block_16
_t_offs_y = in_pix_y-208;
_t_floor = 1;
// __block_17
end
// __block_18
if (_t_offs_y>=35&&_t_offs_y<200) begin
// __block_19
// __block_21
if (in_pix_x==0) begin
// __block_22
// __block_24
_d_cur_inv_y = _w_div_ret;
if (_d_cur_inv_y[3+:7]<=70) begin
// __block_25
// __block_27
_d_lum = 70-_d_cur_inv_y[3+:7];
if (_d_lum>63) begin
// __block_28
// __block_30
_d_lum = 63;
// __block_31
end else begin
// __block_29
end
// __block_32
// __block_33
end else begin
// __block_26
// __block_34
_d_lum = 0;
// __block_35
end
// __block_36
_d_div_inum = _c_maxv;
_d_div_iden = _t_offs_y;
_div_run = 0;
// __block_37
end else begin
// __block_23
end
// __block_38
_t_u = _q_pos_u+((in_pix_x-320)*_d_cur_inv_y)>>8;
_t_v = _q_pos_v+_d_cur_inv_y[0+:6];
if (_t_u[5+:1]^_t_v[5+:1]) begin
// __block_39
// __block_41
if (_t_u[4+:1]^_t_v[4+:1]) begin
// __block_42
// __block_44
_t_pix_r = _d_lum;
_t_pix_g = _d_lum;
_t_pix_b = _d_lum;
// __block_45
end else begin
// __block_43
// __block_46
_t_pix_r = _d_lum[1+:6];
_t_pix_g = _d_lum[1+:6];
_t_pix_b = _d_lum[1+:6];
// __block_47
end
// __block_48
// __block_49
end else begin
// __block_40
// __block_50
if (_t_u[4+:1]^_t_v[4+:1]) begin
// __block_51
// __block_53
if (_t_floor) begin
// __block_54
// __block_56
_t_pix_g = _d_lum;
// __block_57
end else begin
// __block_55
// __block_58
_t_pix_b = _d_lum;
// __block_59
end
// __block_60
// __block_61
end else begin
// __block_52
// __block_62
if (_t_floor) begin
// __block_63
// __block_65
_t_pix_g = _d_lum[1+:6];
// __block_66
end else begin
// __block_64
// __block_67
_t_pix_b = _d_lum[1+:6];
// __block_68
end
// __block_69
// __block_70
end
// __block_71
// __block_72
end
// __block_73
// __block_74
end else begin
// __block_20
end
// __block_75
// __block_76
end else begin
// __block_10
end
// __block_77
// __block_78
_d_index = 3;
end else begin
_d_index = 4;
end
end
2: begin
// __block_3
_d_index = 6;
end
4: begin
// __block_7
_d_pos_u = _q_pos_u+1024;
_d_pos_v = _q_pos_v+3;
_d_index = 5;
end
5: begin
// __while__block_79
if (in_pix_vblank==1) begin
// __block_80
// __block_82
// __block_83
_d_index = 5;
end else begin
_d_index = 1;
end
end
6: begin // end of 
end
default: begin 
_d_index = {3{1'bx}};
`ifdef FORMAL
assume(0);
`endif
 end
endcase
// _always_post
end

always @(posedge clock) begin
_q_cur_inv_y <= (reset) ? 0 : _d_cur_inv_y;
_q_pos_u <= (reset) ? 0 : _d_pos_u;
_q_pos_v <= (reset) ? 0 : _d_pos_v;
_q_lum <= (reset) ? 0 : _d_lum;
_q_index <= reset ? 6 : ( ~_autorun ? 0 : _d_index);
_autorun <= reset ? 0 : 1;
_q_div_inum <= _d_div_inum;
_q_div_iden <= _d_div_iden;
end

endmodule

module M_main (
out_leds,
out_video_r,
out_video_g,
out_video_b,
out_video_hs,
out_video_vs,
out_video_clock,
in_run,
out_done,
reset,
out_clock,
clock
);
output  [7:0] out_leds;
output  [5:0] out_video_r;
output  [5:0] out_video_g;
output  [5:0] out_video_b;
output  [0:0] out_video_hs;
output  [0:0] out_video_vs;
output  [0:0] out_video_clock;
input in_run;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [0:0] _w_vga_driver_vga_hs;
wire  [0:0] _w_vga_driver_vga_vs;
wire  [0:0] _w_vga_driver_active;
wire  [0:0] _w_vga_driver_vblank;
wire  [9:0] _w_vga_driver_vga_x;
wire  [9:0] _w_vga_driver_vga_y;
wire  [5:0] _w_display_pix_r;
wire  [5:0] _w_display_pix_g;
wire  [5:0] _w_display_pix_b;
wire _w_display_done;

reg  [7:0] _d_frame;
reg  [7:0] _q_frame;
reg  [7:0] _d_leds;
reg  [7:0] _q_leds;
reg  [0:0] _d_video_clock;
reg  [0:0] _q_video_clock;
reg  [2:0] _d_index,_q_index = 7;
reg  _autorun = 0;
assign out_leds = _q_leds;
assign out_video_r = _w_display_pix_r;
assign out_video_g = _w_display_pix_g;
assign out_video_b = _w_display_pix_b;
assign out_video_hs = _w_vga_driver_vga_hs;
assign out_video_vs = _w_vga_driver_vga_vs;
assign out_video_clock = _q_video_clock;
assign out_done = (_q_index == 7) & _autorun;
M_vga__vga_driver vga_driver (
.out_vga_hs(_w_vga_driver_vga_hs),
.out_vga_vs(_w_vga_driver_vga_vs),
.out_active(_w_vga_driver_active),
.out_vblank(_w_vga_driver_vblank),
.out_vga_x(_w_vga_driver_vga_x),
.out_vga_y(_w_vga_driver_vga_y),
.reset(reset),
.clock(clock));
M_frame_display__display display (
.in_pix_x(_w_vga_driver_vga_x),
.in_pix_y(_w_vga_driver_vga_y),
.in_pix_active(_w_vga_driver_active),
.in_pix_vblank(_w_vga_driver_vblank),
.out_pix_r(_w_display_pix_r),
.out_pix_g(_w_display_pix_g),
.out_pix_b(_w_display_pix_b),
.out_done(_w_display_done),
.reset(reset),
.clock(clock));



`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (out_done));
`endif
always @* begin
_d_frame = _q_frame;
_d_leds = _q_leds;
_d_video_clock = _q_video_clock;
_d_index = _q_index;
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
_d_index = 3;
end else begin
_d_index = 2;
end
end
3: begin
// __while__block_5
if (_w_vga_driver_vblank==1) begin
// __block_6
// __block_8
// __block_9
_d_index = 3;
end else begin
_d_index = 4;
end
end
2: begin
// __block_3
_d_index = 7;
end
4: begin
// __block_7
$display("vblank off");
_d_index = 5;
end
5: begin
// __while__block_10
if (_w_vga_driver_vblank==0) begin
// __block_11
// __block_13
// __block_14
_d_index = 5;
end else begin
_d_index = 6;
end
end
6: begin
// __block_12
$display("vblank on");
_d_frame = _q_frame+1;
// __block_15
_d_index = 1;
end
7: begin // end of 
end
default: begin 
_d_index = {3{1'bx}};
`ifdef FORMAL
assume(0);
`endif
 end
endcase
// _always_post
end

always @(posedge clock) begin
_q_frame <= (reset) ? 0 : _d_frame;
_q_leds <= _d_leds;
_q_video_clock <= _d_video_clock;
_q_index <= reset ? 7 : ( ~_autorun ? 0 : _d_index);
_autorun <= reset ? 0 : 1;
end

endmodule

