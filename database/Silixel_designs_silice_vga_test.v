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


module M_frame_display__display (
in_pix_x,
in_pix_y,
in_pix_active,
in_pix_vblank,
out_pix_red,
out_pix_green,
out_pix_blue,
out_done,
reset,
out_clock,
clock
);
input  [9:0] in_pix_x;
input  [9:0] in_pix_y;
input  [0:0] in_pix_active;
input  [0:0] in_pix_vblank;
output  [5:0] out_pix_red;
output  [5:0] out_pix_green;
output  [5:0] out_pix_blue;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
reg  [5:0] _t_pix_red;
reg  [5:0] _t_pix_green;
reg  [5:0] _t_pix_blue;

reg  [2:0] _d_index,_q_index = 5;
reg  _autorun = 0;
assign out_pix_red = _t_pix_red;
assign out_pix_green = _t_pix_green;
assign out_pix_blue = _t_pix_blue;
assign out_done = (_q_index == 5) & _autorun;



`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (out_done));
`endif
always @* begin
_d_index = _q_index;
// _always_pre
_t_pix_red = 0;
_t_pix_green = 0;
_t_pix_blue = 0;
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
_t_pix_blue = in_pix_x[4+:6];
_t_pix_green = in_pix_y[4+:6];
_t_pix_red = in_pix_x[1+:6];
// __block_12
end else begin
// __block_10
end
// __block_13
// __block_14
_d_index = 3;
end else begin
_d_index = 4;
end
end
2: begin
// __block_3
_d_index = 5;
end
4: begin
// __while__block_15
if (in_pix_vblank==1) begin
// __block_16
// __block_18
// __block_19
_d_index = 4;
end else begin
_d_index = 1;
end
end
5: begin // end of 
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
_q_index <= reset ? 5 : ( ~_autorun ? 0 : _d_index);
_autorun <= reset ? 0 : 1;
end

endmodule

module M_main (
out_leds,
out_video_clock,
out_video_r,
out_video_g,
out_video_b,
out_video_hs,
out_video_vs,
in_run,
out_done,
reset,
out_clock,
clock
);
output  [7:0] out_leds;
output  [0:0] out_video_clock;
output  [5:0] out_video_r;
output  [5:0] out_video_g;
output  [5:0] out_video_b;
output  [0:0] out_video_hs;
output  [0:0] out_video_vs;
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
wire  [5:0] _w_display_pix_red;
wire  [5:0] _w_display_pix_green;
wire  [5:0] _w_display_pix_blue;
wire _w_display_done;
reg  [7:0] _t_leds;

reg  [7:0] _d_frame;
reg  [7:0] _q_frame;
reg  [0:0] _d_video_clock;
reg  [0:0] _q_video_clock;
reg  [2:0] _d_index,_q_index = 7;
reg  _autorun = 0;
assign out_leds = _t_leds;
assign out_video_clock = _q_video_clock;
assign out_video_r = _w_display_pix_red;
assign out_video_g = _w_display_pix_green;
assign out_video_b = _w_display_pix_blue;
assign out_video_hs = _w_vga_driver_vga_hs;
assign out_video_vs = _w_vga_driver_vga_vs;
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
.out_pix_red(_w_display_pix_red),
.out_pix_green(_w_display_pix_green),
.out_pix_blue(_w_display_pix_blue),
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
_d_video_clock = _q_video_clock;
_d_index = _q_index;
_t_leds = 0;
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
_q_video_clock <= _d_video_clock;
_q_index <= reset ? 7 : ( ~_autorun ? 0 : _d_index);
_autorun <= reset ? 0 : 1;
end

endmodule

