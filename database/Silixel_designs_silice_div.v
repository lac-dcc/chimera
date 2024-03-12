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


module M_div16__div0 (
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
wire  [16:0] _w_diff;
wire  [15:0] _w_num;
wire  [15:0] _w_den;

reg  [16:0] _d_ac;
reg  [16:0] _q_ac;
reg  [4:0] _d_i;
reg  [4:0] _q_i;
reg signed [15:0] _d_ret;
reg signed [15:0] _q_ret;
reg  [1:0] _d_index,_q_index = 3;
assign out_ret = _q_ret;
assign out_done = (_q_index == 3);


assign _w_diff = _q_ac-_w_den;
assign _w_num = in_inum;
assign _w_den = in_iden;

`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (in_run || out_done));
`endif
always @* begin
_d_ac = _q_ac;
_d_i = _q_i;
_d_ret = _q_ret;
_d_index = _q_index;
// _always_pre
(* full_case *)
case (_q_index)
0: begin
// _top
_d_ac = {{15{1'b0}},_w_num[15+:1]};
_d_ret = {_w_num[0+:15],1'b0};
_d_index = 1;
end
1: begin
// __while__block_1
if (_q_i!=16) begin
// __block_2
// __block_4
if (_w_diff[16+:1]==0) begin
// __block_5
// __block_7
_d_ac = {_w_diff[0+:15],_q_ret[15+:1]};
_d_ret = {_q_ret[0+:15],1'b1};
// __block_8
end else begin
// __block_6
// __block_9
_d_ac = {_q_ac[0+:15],_q_ret[15+:1]};
_d_ret = {_q_ret[0+:15],1'b0};
// __block_10
end
// __block_11
_d_i = _q_i+1;
// __block_12
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
_q_ac <= _d_ac;
_q_i <= (reset | ~in_run) ? 0 : _d_i;
_q_ret <= (reset | ~in_run) ? 0 : _d_ret;
_q_index <= reset ? 3 : ( ~in_run ? 0 : _d_index);
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
wire signed [15:0] _w_div0_ret;
wire _w_div0_done;
wire signed [15:0] _c_num;
assign _c_num = 20043;
wire signed [15:0] _c_den;
assign _c_den = 41;
reg signed [15:0] _t_result;

reg  [7:0] _d_leds;
reg  [7:0] _q_leds;
reg signed [15:0] _d_div0_inum,_q_div0_inum;
reg signed [15:0] _d_div0_iden,_q_div0_iden;
reg  [1:0] _d_index,_q_index = 3;
reg  _autorun = 0;
reg  _div0_run = 0;
assign out_leds = _q_leds;
assign out_done = (_q_index == 3) & _autorun;
M_div16__div0 div0 (
.in_inum(_q_div0_inum),
.in_iden(_q_div0_iden),
.out_ret(_w_div0_ret),
.out_done(_w_div0_done),
.in_run(_div0_run),
.reset(reset),
.clock(clock));



`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (out_done));
`endif
always @* begin
_d_leds = _q_leds;
_d_div0_inum = _q_div0_inum;
_d_div0_iden = _q_div0_iden;
_d_index = _q_index;
_div0_run = 1;
_t_result = 0;
// _always_pre
(* full_case *)
case (_q_index)
0: begin
// _top
_d_div0_inum = _c_num;
_d_div0_iden = _c_den;
_div0_run = 0;
_d_index = 1;
end
1: begin
// __block_1
if (_w_div0_done == 1) begin
_d_index = 2;
end else begin
_d_index = 1;
end
end
2: begin
// __block_2
_t_result = _w_div0_ret;
$display("%d / %d = %d",_c_num,_c_den,_t_result);
_d_leds = _t_result[0+:8];
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
_q_leds <= _d_leds;
_q_index <= reset ? 3 : ( ~_autorun ? 0 : _d_index);
_autorun <= reset ? 0 : 1;
_q_div0_inum <= _d_div0_inum;
_q_div0_iden <= _d_div0_iden;
end

endmodule

