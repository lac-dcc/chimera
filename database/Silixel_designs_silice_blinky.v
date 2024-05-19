// This program was cloned from: https://github.com/sylefeb/Silixel
// License: BSD 3-Clause "New" or "Revised" License

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

reg  [7:0] _d_cnt;
reg  [7:0] _q_cnt;
reg  [7:0] _d_leds;
reg  [7:0] _q_leds;
reg  [1:0] _d_index,_q_index = 3;
reg  _autorun = 0;
assign out_leds = _q_leds;
assign out_done = (_q_index == 3) & _autorun;



`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (out_done));
`endif
always @* begin
_d_cnt = _q_cnt;
_d_leds = _q_leds;
_d_index = _q_index;
// _always_pre
_d_leds = _q_cnt[(8)-(8)+:8];
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
_d_cnt = _q_cnt+1;
// __block_5
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
_q_cnt <= (reset) ? 0 : _d_cnt;
_q_leds <= _d_leds;
_q_index <= reset ? 3 : ( ~_autorun ? 0 : _d_index);
_autorun <= reset ? 0 : 1;
end

endmodule

