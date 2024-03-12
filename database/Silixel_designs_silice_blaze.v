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

module passthrough(
	input  inv,
  output outv);
  
assign outv = inv;

endmodule


// SL 2019, MIT license
module M_main__mem_palette(
input                  [1-1:0] in_palette_wenable,
input       [24-1:0]    in_palette_wdata,
input                  [4-1:0]    in_palette_addr,
output reg  [24-1:0]    out_palette_rdata,
input                                      clock
);
reg  [24-1:0] buffer[16-1:0];
always @(posedge clock) begin
  if (in_palette_wenable) begin
    buffer[in_palette_addr] <= in_palette_wdata;
  end
  out_palette_rdata <= buffer[in_palette_addr];
end
initial begin
 buffer[0] = 2642532;
 buffer[1] = 3561840;
 buffer[2] = 3367800;
 buffer[3] = 4089985;
 buffer[4] = 3829643;
 buffer[5] = 4028823;
 buffer[6] = 4293540;
 buffer[7] = 4951471;
 buffer[8] = 5216193;
 buffer[9] = 5744590;
 buffer[10] = 6338277;
 buffer[11] = 6668536;
 buffer[12] = 7459325;
 buffer[13] = 10214399;
 buffer[14] = 12577535;
 buffer[15] = 0;
end

endmodule



module M_edge_walk__gpu_raster_e0 (
in_y,
in_x0,
in_y0,
in_x1,
in_y1,
in_interp,
in_prepare,
out_xi,
out_intersects,
reset,
out_clock,
clock
);
input  [9:0] in_y;
input  [9:0] in_x0;
input  [9:0] in_y0;
input  [9:0] in_x1;
input  [9:0] in_y1;
input signed [23:0] in_interp;
input  [1:0] in_prepare;
output  [9:0] out_xi;
output  [0:0] out_intersects;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [0:0] _w_in_edge;

reg  [15:0] _d_cycle;
reg  [15:0] _q_cycle;
reg signed [9:0] _d_last_y;
reg signed [9:0] _q_last_y;
reg signed [19:0] _d_xi_full;
reg signed [19:0] _q_xi_full;
reg  [9:0] _d_xi;
reg  [9:0] _q_xi;
reg  [0:0] _d_intersects;
reg  [0:0] _q_intersects;
assign out_xi = _q_xi;
assign out_intersects = _q_intersects;


assign _w_in_edge = ((in_y0<=in_y&&in_y1>=in_y)||(in_y1<=in_y&&in_y0>=in_y))&&(in_y0!=in_y1);

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_cycle = _q_cycle;
_d_last_y = _q_last_y;
_d_xi_full = _q_xi_full;
_d_xi = _q_xi;
_d_intersects = _q_intersects;
// _always_pre
_d_intersects = _w_in_edge;
// __block_1
_d_cycle = _q_cycle+1;
if (in_prepare[1+:1]) begin
// __block_2
// __block_4
_d_last_y = $signed(in_y0)-1;
_d_xi_full = in_x0<<10;
// __block_5
end else begin
// __block_3
// __block_6
if ($signed(in_y)==_q_last_y+$signed(1)) begin
// __block_7
// __block_9
_d_xi = (in_y==in_y1) ? in_x1:(_q_xi_full>>10);
_d_xi_full = (_q_xi_full+in_interp);
_d_last_y = in_y;
// __block_10
end else begin
// __block_8
end
// __block_11
// __block_12
end
// __block_13
// __block_14
// _always_post
end

always @(posedge clock) begin
_q_cycle <= (reset) ? 0 : _d_cycle;
_q_last_y <= _d_last_y;
_q_xi_full <= _d_xi_full;
_q_xi <= _d_xi;
_q_intersects <= _d_intersects;
end

endmodule


module M_edge_walk__gpu_raster_e1 (
in_y,
in_x0,
in_y0,
in_x1,
in_y1,
in_interp,
in_prepare,
out_xi,
out_intersects,
reset,
out_clock,
clock
);
input  [9:0] in_y;
input  [9:0] in_x0;
input  [9:0] in_y0;
input  [9:0] in_x1;
input  [9:0] in_y1;
input signed [23:0] in_interp;
input  [1:0] in_prepare;
output  [9:0] out_xi;
output  [0:0] out_intersects;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [0:0] _w_in_edge;

reg  [15:0] _d_cycle;
reg  [15:0] _q_cycle;
reg signed [9:0] _d_last_y;
reg signed [9:0] _q_last_y;
reg signed [19:0] _d_xi_full;
reg signed [19:0] _q_xi_full;
reg  [9:0] _d_xi;
reg  [9:0] _q_xi;
reg  [0:0] _d_intersects;
reg  [0:0] _q_intersects;
assign out_xi = _q_xi;
assign out_intersects = _q_intersects;


assign _w_in_edge = ((in_y0<=in_y&&in_y1>=in_y)||(in_y1<=in_y&&in_y0>=in_y))&&(in_y0!=in_y1);

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_cycle = _q_cycle;
_d_last_y = _q_last_y;
_d_xi_full = _q_xi_full;
_d_xi = _q_xi;
_d_intersects = _q_intersects;
// _always_pre
_d_intersects = _w_in_edge;
// __block_1
_d_cycle = _q_cycle+1;
if (in_prepare[1+:1]) begin
// __block_2
// __block_4
_d_last_y = $signed(in_y0)-1;
_d_xi_full = in_x0<<10;
// __block_5
end else begin
// __block_3
// __block_6
if ($signed(in_y)==_q_last_y+$signed(1)) begin
// __block_7
// __block_9
_d_xi = (in_y==in_y1) ? in_x1:(_q_xi_full>>10);
_d_xi_full = (_q_xi_full+in_interp);
_d_last_y = in_y;
// __block_10
end else begin
// __block_8
end
// __block_11
// __block_12
end
// __block_13
// __block_14
// _always_post
end

always @(posedge clock) begin
_q_cycle <= (reset) ? 0 : _d_cycle;
_q_last_y <= _d_last_y;
_q_xi_full <= _d_xi_full;
_q_xi <= _d_xi;
_q_intersects <= _d_intersects;
end

endmodule


module M_edge_walk__gpu_raster_e2 (
in_y,
in_x0,
in_y0,
in_x1,
in_y1,
in_interp,
in_prepare,
out_xi,
out_intersects,
reset,
out_clock,
clock
);
input  [9:0] in_y;
input  [9:0] in_x0;
input  [9:0] in_y0;
input  [9:0] in_x1;
input  [9:0] in_y1;
input signed [23:0] in_interp;
input  [1:0] in_prepare;
output  [9:0] out_xi;
output  [0:0] out_intersects;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [0:0] _w_in_edge;

reg  [15:0] _d_cycle;
reg  [15:0] _q_cycle;
reg signed [9:0] _d_last_y;
reg signed [9:0] _q_last_y;
reg signed [19:0] _d_xi_full;
reg signed [19:0] _q_xi_full;
reg  [9:0] _d_xi;
reg  [9:0] _q_xi;
reg  [0:0] _d_intersects;
reg  [0:0] _q_intersects;
assign out_xi = _q_xi;
assign out_intersects = _q_intersects;


assign _w_in_edge = ((in_y0<=in_y&&in_y1>=in_y)||(in_y1<=in_y&&in_y0>=in_y))&&(in_y0!=in_y1);

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_cycle = _q_cycle;
_d_last_y = _q_last_y;
_d_xi_full = _q_xi_full;
_d_xi = _q_xi;
_d_intersects = _q_intersects;
// _always_pre
_d_intersects = _w_in_edge;
// __block_1
_d_cycle = _q_cycle+1;
if (in_prepare[1+:1]) begin
// __block_2
// __block_4
_d_last_y = $signed(in_y0)-1;
_d_xi_full = in_x0<<10;
// __block_5
end else begin
// __block_3
// __block_6
if ($signed(in_y)==_q_last_y+$signed(1)) begin
// __block_7
// __block_9
_d_xi = (in_y==in_y1) ? in_x1:(_q_xi_full>>10);
_d_xi_full = (_q_xi_full+in_interp);
_d_last_y = in_y;
// __block_10
end else begin
// __block_8
end
// __block_11
// __block_12
end
// __block_13
// __block_14
// _always_post
end

always @(posedge clock) begin
_q_cycle <= (reset) ? 0 : _d_cycle;
_q_last_y <= _d_last_y;
_q_xi_full <= _d_xi_full;
_q_xi <= _d_xi;
_q_intersects <= _d_intersects;
end

endmodule


module M_ram_writer_blaze__gpu_raster_writer (
in_sd_data_out,
in_sd_done,
in_fbuffer,
in_start,
in_end,
in_next,
in_color,
in_x,
in_y,
out_sd_addr,
out_sd_rw,
out_sd_data_in,
out_sd_in_valid,
out_sd_wmask,
out_done,
reset,
out_clock,
clock
);
input  [32-1:0] in_sd_data_out;
input  [1-1:0] in_sd_done;
input  [0:0] in_fbuffer;
input  [0:0] in_start;
input  [0:0] in_end;
input  [0:0] in_next;
input  [3:0] in_color;
input  [9:0] in_x;
input  [9:0] in_y;
output  [14-1:0] out_sd_addr;
output  [1-1:0] out_sd_rw;
output  [32-1:0] out_sd_data_in;
output  [1-1:0] out_sd_in_valid;
output  [8-1:0] out_sd_wmask;
output  [0:0] out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [13:0] _w_addr;

reg  [14-1:0] _d_sd_addr;
reg  [14-1:0] _q_sd_addr;
reg  [1-1:0] _d_sd_rw;
reg  [1-1:0] _q_sd_rw;
reg  [32-1:0] _d_sd_data_in;
reg  [32-1:0] _q_sd_data_in;
reg  [1-1:0] _d_sd_in_valid;
reg  [1-1:0] _q_sd_in_valid;
reg  [8-1:0] _d_sd_wmask;
reg  [8-1:0] _q_sd_wmask;
reg  [0:0] _d_done;
reg  [0:0] _q_done;
assign out_sd_addr = _q_sd_addr;
assign out_sd_rw = _q_sd_rw;
assign out_sd_data_in = _q_sd_data_in;
assign out_sd_in_valid = _q_sd_in_valid;
assign out_sd_wmask = _q_sd_wmask;
assign out_done = _q_done;


assign _w_addr = in_x[3+:7]+(in_y<<5)+(in_y<<3)+(~in_fbuffer ? 0:8000);

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_sd_addr = _q_sd_addr;
_d_sd_rw = _q_sd_rw;
_d_sd_data_in = _q_sd_data_in;
_d_sd_in_valid = _q_sd_in_valid;
_d_sd_wmask = _q_sd_wmask;
_d_done = _q_done;
// _always_pre
// __block_1
_d_sd_rw = 1;
_d_sd_data_in[{in_x[0+:3],2'b00}+:4] = in_color;
if (in_start|in_x[0+:3]==3'b000) begin
// __block_2
// __block_4
_d_sd_wmask = in_start ? 8'b00000000:8'b0000001;
// __block_5
end else begin
// __block_3
// __block_6
_d_sd_wmask[in_x[0+:3]+:1] = in_next ? 1:_q_sd_wmask[in_x[0+:3]+:1];
// __block_7
end
// __block_8
_d_sd_in_valid = in_end||(in_next&&((in_x[0+:3])==3'b111));
_d_done = in_sd_done||(in_next&&((in_x[0+:3])!=3'b111));
_d_sd_addr = in_end ? _q_sd_addr:_w_addr;
// __block_9
// _always_post
end

always @(posedge clock) begin
_q_sd_addr <= (reset) ? 0 : _d_sd_addr;
_q_sd_rw <= (reset) ? 0 : _d_sd_rw;
_q_sd_data_in <= (reset) ? 0 : _d_sd_data_in;
_q_sd_in_valid <= (reset) ? 0 : _d_sd_in_valid;
_q_sd_wmask <= (reset) ? 0 : _d_sd_wmask;
_q_done <= _d_done;
end

endmodule

module M_flame_rasterizer__gpu_raster (
in_sd_data_out,
in_sd_done,
in_fbuffer,
in_v0_x,
in_v0_y,
in_v0_z,
in_v1_x,
in_v1_y,
in_v1_z,
in_v2_x,
in_v2_y,
in_v2_z,
in_ei0,
in_ei1,
in_ei2,
in_ystart,
in_ystop,
in_color,
in_triangle_in,
out_sd_addr,
out_sd_rw,
out_sd_data_in,
out_sd_in_valid,
out_sd_wmask,
out_drawing,
reset,
out_clock,
clock
);
input  [32-1:0] in_sd_data_out;
input  [1-1:0] in_sd_done;
input  [0:0] in_fbuffer;
input signed [15:0] in_v0_x;
input signed [15:0] in_v0_y;
input signed [15:0] in_v0_z;
input signed [15:0] in_v1_x;
input signed [15:0] in_v1_y;
input signed [15:0] in_v1_z;
input signed [15:0] in_v2_x;
input signed [15:0] in_v2_y;
input signed [15:0] in_v2_z;
input signed [23:0] in_ei0;
input signed [23:0] in_ei1;
input signed [23:0] in_ei2;
input  [9:0] in_ystart;
input  [9:0] in_ystop;
input  [7:0] in_color;
input  [0:0] in_triangle_in;
output  [14-1:0] out_sd_addr;
output  [1-1:0] out_sd_rw;
output  [32-1:0] out_sd_data_in;
output  [1-1:0] out_sd_in_valid;
output  [8-1:0] out_sd_wmask;
output  [0:0] out_drawing;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [9:0] _w_e0_xi;
wire  [0:0] _w_e0_intersects;
wire  [9:0] _w_e1_xi;
wire  [0:0] _w_e1_intersects;
wire  [9:0] _w_e2_xi;
wire  [0:0] _w_e2_intersects;
wire  [14-1:0] _w_writer_sd_addr;
wire  [1-1:0] _w_writer_sd_rw;
wire  [32-1:0] _w_writer_sd_data_in;
wire  [1-1:0] _w_writer_sd_in_valid;
wire  [8-1:0] _w_writer_sd_wmask;
wire  [0:0] _w_writer_done;
wire  [9:0] _w_y_p1;

reg  [23:0] _d_cycle;
reg  [23:0] _q_cycle;
reg  [9:0] _d_y;
reg  [9:0] _q_y;
reg signed [10:0] _d_span_x = -1;
reg signed [10:0] _q_span_x = -1;
reg  [9:0] _d_stop_x;
reg  [9:0] _q_stop_x;
reg  [1:0] _d_prepare = 0;
reg  [1:0] _q_prepare = 0;
reg  [0:0] _d_wait_done = 0;
reg  [0:0] _q_wait_done = 0;
reg  [0:0] _d_sent = 0;
reg  [0:0] _q_sent = 0;
reg  [0:0] _d_start;
reg  [0:0] _q_start;
reg  [0:0] _d_end;
reg  [0:0] _q_end;
reg  [0:0] _d_next;
reg  [0:0] _q_next;
reg  [9:0] _d___block_7_first;
reg  [9:0] _q___block_7_first;
reg  [9:0] _d___block_7_second;
reg  [9:0] _q___block_7_second;
reg  [0:0] _d___block_7_nop;
reg  [0:0] _q___block_7_nop;
reg  [0:0] _d_drawing;
reg  [0:0] _q_drawing;
assign out_sd_addr = _w_writer_sd_addr;
assign out_sd_rw = _w_writer_sd_rw;
assign out_sd_data_in = _w_writer_sd_data_in;
assign out_sd_in_valid = _w_writer_sd_in_valid;
assign out_sd_wmask = _w_writer_sd_wmask;
assign out_drawing = _q_drawing;
M_edge_walk__gpu_raster_e0 e0 (
.in_y(_q_y),
.in_x0(in_v0_x),
.in_y0(in_v0_y),
.in_x1(in_v1_x),
.in_y1(in_v1_y),
.in_interp(in_ei0),
.in_prepare(_q_prepare),
.out_xi(_w_e0_xi),
.out_intersects(_w_e0_intersects),
.reset(reset),
.clock(clock));
M_edge_walk__gpu_raster_e1 e1 (
.in_y(_q_y),
.in_x0(in_v1_x),
.in_y0(in_v1_y),
.in_x1(in_v2_x),
.in_y1(in_v2_y),
.in_interp(in_ei1),
.in_prepare(_q_prepare),
.out_xi(_w_e1_xi),
.out_intersects(_w_e1_intersects),
.reset(reset),
.clock(clock));
M_edge_walk__gpu_raster_e2 e2 (
.in_y(_q_y),
.in_x0(in_v0_x),
.in_y0(in_v0_y),
.in_x1(in_v2_x),
.in_y1(in_v2_y),
.in_interp(in_ei2),
.in_prepare(_q_prepare),
.out_xi(_w_e2_xi),
.out_intersects(_w_e2_intersects),
.reset(reset),
.clock(clock));
M_ram_writer_blaze__gpu_raster_writer writer (
.in_sd_data_out(in_sd_data_out),
.in_sd_done(in_sd_done),
.in_fbuffer(in_fbuffer),
.in_start(_q_start),
.in_end(_q_end),
.in_next(_q_next),
.in_color(in_color),
.in_x(_q_span_x),
.in_y(_q_y),
.out_sd_addr(_w_writer_sd_addr),
.out_sd_rw(_w_writer_sd_rw),
.out_sd_data_in(_w_writer_sd_data_in),
.out_sd_in_valid(_w_writer_sd_in_valid),
.out_sd_wmask(_w_writer_sd_wmask),
.out_done(_w_writer_done),
.reset(reset),
.clock(clock));


assign _w_y_p1 = _q_y+1;

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_cycle = _q_cycle;
_d_y = _q_y;
_d_span_x = _q_span_x;
_d_stop_x = _q_stop_x;
_d_prepare = _q_prepare;
_d_wait_done = _q_wait_done;
_d_sent = _q_sent;
_d_start = _q_start;
_d_end = _q_end;
_d_next = _q_next;
_d___block_7_first = _q___block_7_first;
_d___block_7_second = _q___block_7_second;
_d___block_7_nop = _q___block_7_nop;
_d_drawing = _q_drawing;
// _always_pre
_d_start = 0;
_d_end = 0;
_d_next = 0;
// __block_1
if (_q_drawing&~_q_wait_done) begin
// __block_2
// __block_4
if (_q_span_x[10+:1]) begin
// __block_5
// __block_7
// var inits
_d___block_7_nop = 0;
// --
  case (~{_w_e2_intersects,_w_e1_intersects,_w_e0_intersects})
  3'b001: begin
// __block_9_case
// __block_10
_d___block_7_first = _w_e1_xi;
_d___block_7_second = _w_e2_xi;
// __block_11
  end
  3'b010: begin
// __block_12_case
// __block_13
_d___block_7_first = _w_e0_xi;
_d___block_7_second = _w_e2_xi;
// __block_14
  end
  3'b100: begin
// __block_15_case
// __block_16
_d___block_7_first = _w_e0_xi;
_d___block_7_second = _w_e1_xi;
// __block_17
  end
  3'b000: begin
// __block_18_case
// __block_19
if (_w_e0_xi==_w_e1_xi) begin
// __block_20
// __block_22
_d___block_7_first = _w_e0_xi;
_d___block_7_second = _w_e2_xi;
// __block_23
end else begin
// __block_21
// __block_24
_d___block_7_first = _w_e0_xi;
_d___block_7_second = _w_e1_xi;
// __block_25
end
// __block_26
// __block_27
  end
  default: begin
// __block_28_case
// __block_29
_d___block_7_nop = 1;
// __block_30
  end
endcase
// __block_8
if (_d___block_7_first<_d___block_7_second) begin
// __block_31
// __block_33
_d_span_x = ~_d___block_7_nop ? _d___block_7_first:_q_span_x;
_d_stop_x = _d___block_7_second;
// __block_34
end else begin
// __block_32
// __block_35
_d_span_x = ~_d___block_7_nop ? _d___block_7_second:_q_span_x;
_d_stop_x = _d___block_7_first;
// __block_36
end
// __block_37
_d_start = ~_d___block_7_nop;
// __block_38
end else begin
// __block_6
// __block_39
if (~_q_sent) begin
// __block_40
// __block_42
_d_sent = 1;
_d_next = 1;
// __block_43
end else begin
// __block_41
// __block_44
if (_w_writer_done) begin
// __block_45
// __block_47
_d_sent = 0;
if (_q_span_x==_q_stop_x) begin
// __block_48
// __block_50
_d_drawing = (_w_y_p1==in_ystop) ? 0:1;
_d_y = _w_y_p1;
_d_span_x = -1;
_d_end = 1;
_d_wait_done = 1;
// __block_51
end else begin
// __block_49
// __block_52
_d_span_x = _q_span_x+1;
// __block_53
end
// __block_54
// __block_55
end else begin
// __block_46
end
// __block_56
// __block_57
end
// __block_58
// __block_59
end
// __block_60
// __block_61
end else begin
// __block_3
// __block_62
if (_q_prepare[0+:1]) begin
// __block_63
// __block_65
_d_prepare = {1'b0,_q_prepare[1+:1]};
_d_drawing = ~_d_prepare[0+:1];
// __block_66
end else begin
// __block_64
end
// __block_67
_d_wait_done = _q_wait_done&~in_sd_done;
// __block_68
end
// __block_69
if (in_triangle_in) begin
// __block_70
// __block_72
_d_prepare = 2'b11;
_d_drawing = 0;
_d_y = in_ystart;
// __block_73
end else begin
// __block_71
end
// __block_74
_d_cycle = _q_cycle+1;
// __block_75
// _always_post
end

always @(posedge clock) begin
_q_cycle <= (reset) ? 0 : _d_cycle;
_q_y <= _d_y;
_q_span_x <= _d_span_x;
_q_stop_x <= _d_stop_x;
_q_prepare <= _d_prepare;
_q_wait_done <= _d_wait_done;
_q_sent <= _d_sent;
_q_start <= _d_start;
_q_end <= _d_end;
_q_next <= _d_next;
_q___block_7_first <= _d___block_7_first;
_q___block_7_second <= _d___block_7_second;
_q___block_7_nop <= (reset) ? 0 : _d___block_7_nop;
_q_drawing <= (reset) ? 0 : _d_drawing;
end

endmodule


module M_flame_transform__gpu_trsf (
in_t_m00,
in_t_m12,
in_t_m01,
in_t_ty,
in_t_m11,
in_t_m02,
in_t_tx,
in_t_m10,
in_t_m20,
in_t_m21,
in_t_m22,
in_v_x,
in_v_y,
in_v_z,
out_tv_x,
out_tv_y,
out_tv_z,
reset,
out_clock,
clock
);
input signed [7:0] in_t_m00;
input signed [7:0] in_t_m12;
input signed [7:0] in_t_m01;
input signed [15:0] in_t_ty;
input signed [7:0] in_t_m11;
input signed [7:0] in_t_m02;
input signed [15:0] in_t_tx;
input signed [7:0] in_t_m10;
input signed [7:0] in_t_m20;
input signed [7:0] in_t_m21;
input signed [7:0] in_t_m22;
input signed [15:0] in_v_x;
input signed [15:0] in_v_y;
input signed [15:0] in_v_z;
output signed [15:0] out_tv_x;
output signed [15:0] out_tv_y;
output signed [15:0] out_tv_z;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
reg signed [23:0] _t_r;

reg  [2:0] _d_step = 3'b1;
reg  [2:0] _q_step = 3'b1;
reg signed [7:0] _d_a;
reg signed [7:0] _q_a;
reg signed [7:0] _d_b;
reg signed [7:0] _q_b;
reg signed [7:0] _d_c;
reg signed [7:0] _q_c;
reg signed [15:0] _d_d;
reg signed [15:0] _q_d;
reg signed [15:0] _d_tv_x;
reg signed [15:0] _q_tv_x;
reg signed [15:0] _d_tv_y;
reg signed [15:0] _q_tv_y;
reg signed [15:0] _d_tv_z;
reg signed [15:0] _q_tv_z;
assign out_tv_x = _q_tv_x;
assign out_tv_y = _q_tv_y;
assign out_tv_z = _q_tv_z;



`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_step = _q_step;
_d_a = _q_a;
_d_b = _q_b;
_d_c = _q_c;
_d_d = _q_d;
_d_tv_x = _q_tv_x;
_d_tv_y = _q_tv_y;
_d_tv_z = _q_tv_z;
// _always_pre
// __block_1
_t_r = ((_q_a*in_v_x+_q_b*in_v_y+_q_c*in_v_z)>>>7)+_q_d;
  case (_q_step)
  3'b001: begin
// __block_3_case
// __block_4
_d_a = in_t_m00;
_d_b = in_t_m01;
_d_c = in_t_m02;
_d_d = in_t_tx;
_d_tv_z = _t_r;
// __block_5
  end
  3'b010: begin
// __block_6_case
// __block_7
_d_a = in_t_m10;
_d_b = in_t_m11;
_d_c = in_t_m12;
_d_d = in_t_ty;
_d_tv_x = _t_r;
// __block_8
  end
  3'b100: begin
// __block_9_case
// __block_10
_d_a = in_t_m20;
_d_b = in_t_m21;
_d_c = in_t_m22;
_d_d = 32767;
_d_tv_y = _t_r;
// __block_11
  end
  default: begin
// __block_12_case
// __block_13
// __block_14
  end
endcase
// __block_2
_d_step = {_q_step[0+:2],_q_step[2+:1]};
// __block_15
// _always_post
end

always @(posedge clock) begin
_q_step <= _d_step;
_q_a <= _d_a;
_q_b <= _d_b;
_q_c <= _d_c;
_q_d <= _d_d;
_q_tv_x <= _d_tv_x;
_q_tv_y <= _d_tv_y;
_q_tv_z <= _d_tv_z;
end

endmodule


// SL 2019, MIT license
module M_bram_segment_spram_32bits__bram_ram_mem_mem(
input      [13-1:0]                in_mem_addr0,
output reg  [32-1:0]     out_mem_rdata0,
output reg  [32-1:0]     out_mem_rdata1,
input      [(32)/8-1:0]         in_mem_wenable1,
input      [32-1:0]                 in_mem_wdata1,
input      [13-1:0]                in_mem_addr1,
input      clock0,
input      clock1
);
reg  [32-1:0] buffer[8192-1:0];
always @(posedge clock0) begin
  out_mem_rdata0 <= buffer[in_mem_addr0];
end
integer i;
always @(posedge clock1) begin
  for (i = 0; i < (32)/8; i = i + 1) begin
    if (in_mem_wenable1[i]) begin
      buffer[in_mem_addr1][i*8+:8] <= in_mem_wdata1[i*8+:8];
    end
  end
end
initial begin
 buffer[0] = 32'h00000117;
 buffer[1] = 32'h40C10113;
 buffer[2] = 32'h4040006F;
 buffer[3] = 32'h00000000;
 buffer[4] = 32'h00000000;
 buffer[5] = 32'h00000000;
 buffer[6] = 32'h00000000;
 buffer[7] = 32'h00000000;
 buffer[8] = 32'h00000000;
 buffer[9] = 32'h00000000;
 buffer[10] = 32'h00000000;
 buffer[11] = 32'h00000000;
 buffer[12] = 32'h00000000;
 buffer[13] = 32'h00000000;
 buffer[14] = 32'h00000000;
 buffer[15] = 32'h00000000;
 buffer[16] = 32'h00000000;
 buffer[17] = 32'h00000000;
 buffer[18] = 32'h00000000;
 buffer[19] = 32'h00000000;
 buffer[20] = 32'h00000000;
 buffer[21] = 32'h00000000;
 buffer[22] = 32'h00000000;
 buffer[23] = 32'h00000000;
 buffer[24] = 32'h00000000;
 buffer[25] = 32'h00000000;
 buffer[26] = 32'h00000000;
 buffer[27] = 32'h00000000;
 buffer[28] = 32'h00000000;
 buffer[29] = 32'h00000000;
 buffer[30] = 32'h00000000;
 buffer[31] = 32'h00000000;
 buffer[32] = 32'h00000000;
 buffer[33] = 32'h00000000;
 buffer[34] = 32'h00000000;
 buffer[35] = 32'h00000000;
 buffer[36] = 32'h00000000;
 buffer[37] = 32'h00000000;
 buffer[38] = 32'h00000000;
 buffer[39] = 32'h00000000;
 buffer[40] = 32'h00000000;
 buffer[41] = 32'h00000000;
 buffer[42] = 32'h00000000;
 buffer[43] = 32'h00000000;
 buffer[44] = 32'h00000000;
 buffer[45] = 32'h00000000;
 buffer[46] = 32'h00000000;
 buffer[47] = 32'h00000000;
 buffer[48] = 32'h00000000;
 buffer[49] = 32'h00000000;
 buffer[50] = 32'h00000000;
 buffer[51] = 32'h00000000;
 buffer[52] = 32'h00000000;
 buffer[53] = 32'h00000000;
 buffer[54] = 32'h00000000;
 buffer[55] = 32'h00000000;
 buffer[56] = 32'h00000000;
 buffer[57] = 32'h00000000;
 buffer[58] = 32'h00000000;
 buffer[59] = 32'h00000000;
 buffer[60] = 32'h00000000;
 buffer[61] = 32'h00000000;
 buffer[62] = 32'h00000000;
 buffer[63] = 32'h00000000;
 buffer[64] = 32'h00000000;
 buffer[65] = 32'h00000000;
 buffer[66] = 32'h00000000;
 buffer[67] = 32'h00000000;
 buffer[68] = 32'h00000000;
 buffer[69] = 32'h00000000;
 buffer[70] = 32'h00000000;
 buffer[71] = 32'h00000000;
 buffer[72] = 32'h00000000;
 buffer[73] = 32'h00000000;
 buffer[74] = 32'h00000000;
 buffer[75] = 32'h00000000;
 buffer[76] = 32'h00000000;
 buffer[77] = 32'h00000000;
 buffer[78] = 32'h00000000;
 buffer[79] = 32'h00000000;
 buffer[80] = 32'h00000000;
 buffer[81] = 32'h00000000;
 buffer[82] = 32'h00000000;
 buffer[83] = 32'h00000000;
 buffer[84] = 32'h00000000;
 buffer[85] = 32'h00000000;
 buffer[86] = 32'h00000000;
 buffer[87] = 32'h00000000;
 buffer[88] = 32'h00000000;
 buffer[89] = 32'h00000000;
 buffer[90] = 32'h00000000;
 buffer[91] = 32'h00000000;
 buffer[92] = 32'h00000000;
 buffer[93] = 32'h00000000;
 buffer[94] = 32'h00000000;
 buffer[95] = 32'h00000000;
 buffer[96] = 32'h00000000;
 buffer[97] = 32'h00000000;
 buffer[98] = 32'h00000000;
 buffer[99] = 32'h00000000;
 buffer[100] = 32'h00000000;
 buffer[101] = 32'h00000000;
 buffer[102] = 32'h00000000;
 buffer[103] = 32'h00000000;
 buffer[104] = 32'h00000000;
 buffer[105] = 32'h00000000;
 buffer[106] = 32'h00000000;
 buffer[107] = 32'h00000000;
 buffer[108] = 32'h00000000;
 buffer[109] = 32'h00000000;
 buffer[110] = 32'h00000000;
 buffer[111] = 32'h00000000;
 buffer[112] = 32'h00000000;
 buffer[113] = 32'h00000000;
 buffer[114] = 32'h00000000;
 buffer[115] = 32'h00000000;
 buffer[116] = 32'h00000000;
 buffer[117] = 32'h00000000;
 buffer[118] = 32'h00000000;
 buffer[119] = 32'h00000000;
 buffer[120] = 32'h00000000;
 buffer[121] = 32'h00000000;
 buffer[122] = 32'h00000000;
 buffer[123] = 32'h00000000;
 buffer[124] = 32'h00000000;
 buffer[125] = 32'h00000000;
 buffer[126] = 32'h00000000;
 buffer[127] = 32'h00000000;
 buffer[128] = 32'h00000000;
 buffer[129] = 32'h00000000;
 buffer[130] = 32'h00000000;
 buffer[131] = 32'h00000000;
 buffer[132] = 32'h00000000;
 buffer[133] = 32'h00000000;
 buffer[134] = 32'h00000000;
 buffer[135] = 32'h00000000;
 buffer[136] = 32'h00000000;
 buffer[137] = 32'h00000000;
 buffer[138] = 32'h00000000;
 buffer[139] = 32'h00000000;
 buffer[140] = 32'h00000000;
 buffer[141] = 32'h00000000;
 buffer[142] = 32'h00000000;
 buffer[143] = 32'h00000000;
 buffer[144] = 32'h00000000;
 buffer[145] = 32'h00000000;
 buffer[146] = 32'h00000000;
 buffer[147] = 32'h00000000;
 buffer[148] = 32'h00000000;
 buffer[149] = 32'h00000000;
 buffer[150] = 32'h00000000;
 buffer[151] = 32'h00000000;
 buffer[152] = 32'h00000000;
 buffer[153] = 32'h00000000;
 buffer[154] = 32'h00000000;
 buffer[155] = 32'h00000000;
 buffer[156] = 32'h00000000;
 buffer[157] = 32'h00000000;
 buffer[158] = 32'h00000000;
 buffer[159] = 32'h00000000;
 buffer[160] = 32'h00000000;
 buffer[161] = 32'h00000000;
 buffer[162] = 32'h00000000;
 buffer[163] = 32'h00000000;
 buffer[164] = 32'h00000000;
 buffer[165] = 32'h00000000;
 buffer[166] = 32'h00000000;
 buffer[167] = 32'h00000000;
 buffer[168] = 32'h00000000;
 buffer[169] = 32'h00000000;
 buffer[170] = 32'h00000000;
 buffer[171] = 32'h00000000;
 buffer[172] = 32'h00000000;
 buffer[173] = 32'h00000000;
 buffer[174] = 32'h00000000;
 buffer[175] = 32'h00000000;
 buffer[176] = 32'h00000000;
 buffer[177] = 32'h00000000;
 buffer[178] = 32'h00000000;
 buffer[179] = 32'h00000000;
 buffer[180] = 32'h00000000;
 buffer[181] = 32'h00000000;
 buffer[182] = 32'h00000000;
 buffer[183] = 32'h00000000;
 buffer[184] = 32'h00000000;
 buffer[185] = 32'h00000000;
 buffer[186] = 32'h00000000;
 buffer[187] = 32'h00000000;
 buffer[188] = 32'h00000000;
 buffer[189] = 32'h00000000;
 buffer[190] = 32'h00000000;
 buffer[191] = 32'h00000000;
 buffer[192] = 32'h00000000;
 buffer[193] = 32'h00000000;
 buffer[194] = 32'h00000000;
 buffer[195] = 32'h00000000;
 buffer[196] = 32'h00000000;
 buffer[197] = 32'h00000000;
 buffer[198] = 32'h00000000;
 buffer[199] = 32'h00000000;
 buffer[200] = 32'h00000000;
 buffer[201] = 32'h00000000;
 buffer[202] = 32'h00000000;
 buffer[203] = 32'h00000000;
 buffer[204] = 32'h00000000;
 buffer[205] = 32'h00000000;
 buffer[206] = 32'h00000000;
 buffer[207] = 32'h00000000;
 buffer[208] = 32'h00000000;
 buffer[209] = 32'h00000000;
 buffer[210] = 32'h00000000;
 buffer[211] = 32'h00000000;
 buffer[212] = 32'h00000000;
 buffer[213] = 32'h00000000;
 buffer[214] = 32'h00000000;
 buffer[215] = 32'h00000000;
 buffer[216] = 32'h00000000;
 buffer[217] = 32'h00000000;
 buffer[218] = 32'h00000000;
 buffer[219] = 32'h00000000;
 buffer[220] = 32'h00000000;
 buffer[221] = 32'h00000000;
 buffer[222] = 32'h00000000;
 buffer[223] = 32'h00000000;
 buffer[224] = 32'h00000000;
 buffer[225] = 32'h00000000;
 buffer[226] = 32'h00000000;
 buffer[227] = 32'h00000000;
 buffer[228] = 32'h00000000;
 buffer[229] = 32'h00000000;
 buffer[230] = 32'h00000000;
 buffer[231] = 32'h00000000;
 buffer[232] = 32'h00000000;
 buffer[233] = 32'h00000000;
 buffer[234] = 32'h00000000;
 buffer[235] = 32'h00000000;
 buffer[236] = 32'h00000000;
 buffer[237] = 32'h00000000;
 buffer[238] = 32'h00000000;
 buffer[239] = 32'h00000000;
 buffer[240] = 32'h00000000;
 buffer[241] = 32'h00000000;
 buffer[242] = 32'h00000000;
 buffer[243] = 32'h00000000;
 buffer[244] = 32'h00000000;
 buffer[245] = 32'h00000000;
 buffer[246] = 32'h00000000;
 buffer[247] = 32'h00000000;
 buffer[248] = 32'h00000000;
 buffer[249] = 32'h00000000;
 buffer[250] = 32'h00000000;
 buffer[251] = 32'h00000000;
 buffer[252] = 32'h00000000;
 buffer[253] = 32'h00000000;
 buffer[254] = 32'h00000000;
 buffer[255] = 32'h00000000;
 buffer[256] = 32'h00000000;
 buffer[257] = 32'h00000000;
 buffer[258] = 32'h00000000;
 buffer[259] = 32'h00000097;
 buffer[260] = 32'h244080E7;
 buffer[261] = 32'h00000000;
 buffer[262] = 32'h06054063;
 buffer[263] = 32'h0605C663;
 buffer[264] = 32'h00058613;
 buffer[265] = 32'h00050593;
 buffer[266] = 32'hFFF00513;
 buffer[267] = 32'h02060C63;
 buffer[268] = 32'h00100693;
 buffer[269] = 32'h00B67A63;
 buffer[270] = 32'h00C05863;
 buffer[271] = 32'h00161613;
 buffer[272] = 32'h00169693;
 buffer[273] = 32'hFEB66AE3;
 buffer[274] = 32'h00000513;
 buffer[275] = 32'h00C5E663;
 buffer[276] = 32'h40C585B3;
 buffer[277] = 32'h00D56533;
 buffer[278] = 32'h0016D693;
 buffer[279] = 32'h00165613;
 buffer[280] = 32'hFE0696E3;
 buffer[281] = 32'h00008067;
 buffer[282] = 32'h00008293;
 buffer[283] = 32'hFB5FF0EF;
 buffer[284] = 32'h00058513;
 buffer[285] = 32'h00028067;
 buffer[286] = 32'h40A00533;
 buffer[287] = 32'h0005D863;
 buffer[288] = 32'h40B005B3;
 buffer[289] = 32'hF95FF06F;
 buffer[290] = 32'h40B005B3;
 buffer[291] = 32'h00008293;
 buffer[292] = 32'hF89FF0EF;
 buffer[293] = 32'h40A00533;
 buffer[294] = 32'h00028067;
 buffer[295] = 32'h00008293;
 buffer[296] = 32'h0005CA63;
 buffer[297] = 32'h00054C63;
 buffer[298] = 32'hF79FF0EF;
 buffer[299] = 32'h00058513;
 buffer[300] = 32'h00028067;
 buffer[301] = 32'h40B005B3;
 buffer[302] = 32'hFE0558E3;
 buffer[303] = 32'h40A00533;
 buffer[304] = 32'hF61FF0EF;
 buffer[305] = 32'h40B00533;
 buffer[306] = 32'h00028067;
 buffer[307] = 32'h000217B7;
 buffer[308] = 32'h00259693;
 buffer[309] = 32'h4C878793;
 buffer[310] = 32'hFD010113;
 buffer[311] = 32'h00D78633;
 buffer[312] = 32'h01812423;
 buffer[313] = 32'h00058713;
 buffer[314] = 32'h00062C03;
 buffer[315] = 32'h01612823;
 buffer[316] = 32'h00052583;
 buffer[317] = 32'h00170B13;
 buffer[318] = 32'h00270713;
 buffer[319] = 32'h01412C23;
 buffer[320] = 32'h01512A23;
 buffer[321] = 32'h002B1B13;
 buffer[322] = 32'h00271A93;
 buffer[323] = 32'h00022A37;
 buffer[324] = 32'h02812423;
 buffer[325] = 32'h01678733;
 buffer[326] = 32'h00050413;
 buffer[327] = 32'h015787B3;
 buffer[328] = 32'h928A0A13;
 buffer[329] = 32'h000C0513;
 buffer[330] = 32'h02112623;
 buffer[331] = 32'h02912223;
 buffer[332] = 32'h03212023;
 buffer[333] = 32'h01312E23;
 buffer[334] = 32'h01712623;
 buffer[335] = 32'h00072983;
 buffer[336] = 32'h00DA0BB3;
 buffer[337] = 32'h0007A903;
 buffer[338] = 32'h00001097;
 buffer[339] = 32'hC60080E7;
 buffer[340] = 32'h00442583;
 buffer[341] = 32'h00050493;
 buffer[342] = 32'h00098513;
 buffer[343] = 32'h00001097;
 buffer[344] = 32'hC4C080E7;
 buffer[345] = 32'h00842583;
 buffer[346] = 32'h00050793;
 buffer[347] = 32'h00090513;
 buffer[348] = 32'h00F484B3;
 buffer[349] = 32'h00001097;
 buffer[350] = 32'hC34080E7;
 buffer[351] = 32'h00A484B3;
 buffer[352] = 32'h4024D493;
 buffer[353] = 32'h009BA023;
 buffer[354] = 32'h00C42583;
 buffer[355] = 32'h000C0513;
 buffer[356] = 32'h016A0B33;
 buffer[357] = 32'h00001097;
 buffer[358] = 32'hC14080E7;
 buffer[359] = 32'h01042583;
 buffer[360] = 32'h00050493;
 buffer[361] = 32'h00098513;
 buffer[362] = 32'h00001097;
 buffer[363] = 32'hC00080E7;
 buffer[364] = 32'h01442583;
 buffer[365] = 32'h00050793;
 buffer[366] = 32'h00090513;
 buffer[367] = 32'h00F484B3;
 buffer[368] = 32'h00001097;
 buffer[369] = 32'hBE8080E7;
 buffer[370] = 32'h00A484B3;
 buffer[371] = 32'h4024D493;
 buffer[372] = 32'h009B2023;
 buffer[373] = 32'h01842583;
 buffer[374] = 32'h000C0513;
 buffer[375] = 32'h015A0A33;
 buffer[376] = 32'h00001097;
 buffer[377] = 32'hBC8080E7;
 buffer[378] = 32'h01C42583;
 buffer[379] = 32'h00050493;
 buffer[380] = 32'h00098513;
 buffer[381] = 32'h00001097;
 buffer[382] = 32'hBB4080E7;
 buffer[383] = 32'h02042583;
 buffer[384] = 32'h00050793;
 buffer[385] = 32'h00090513;
 buffer[386] = 32'h00F48433;
 buffer[387] = 32'h00001097;
 buffer[388] = 32'hB9C080E7;
 buffer[389] = 32'h00A40433;
 buffer[390] = 32'h40245413;
 buffer[391] = 32'h008A2023;
 buffer[392] = 32'h02C12083;
 buffer[393] = 32'h02812403;
 buffer[394] = 32'h02412483;
 buffer[395] = 32'h02012903;
 buffer[396] = 32'h01C12983;
 buffer[397] = 32'h01812A03;
 buffer[398] = 32'h01412A83;
 buffer[399] = 32'h01012B03;
 buffer[400] = 32'h00C12B83;
 buffer[401] = 32'h00812C03;
 buffer[402] = 32'h03010113;
 buffer[403] = 32'h00008067;
 buffer[404] = 32'h000217B7;
 buffer[405] = 32'h4347A783;
 buffer[406] = 32'hEF010113;
 buffer[407] = 32'h0FA12023;
 buffer[408] = 32'h00021D37;
 buffer[409] = 32'h10812423;
 buffer[410] = 32'h0F512A23;
 buffer[411] = 32'h00F12623;
 buffer[412] = 32'h00022437;
 buffer[413] = 32'h528D0793;
 buffer[414] = 32'h00021AB7;
 buffer[415] = 32'h11212023;
 buffer[416] = 32'h0F312E23;
 buffer[417] = 32'h0F612823;
 buffer[418] = 32'h10112623;
 buffer[419] = 32'h10912223;
 buffer[420] = 32'h0F412C23;
 buffer[421] = 32'h0F712623;
 buffer[422] = 32'h0F812423;
 buffer[423] = 32'h0F912223;
 buffer[424] = 32'h0DB12E23;
 buffer[425] = 32'h00012223;
 buffer[426] = 32'h00012023;
 buffer[427] = 32'h00F12423;
 buffer[428] = 32'h92840413;
 buffer[429] = 32'h438A8A93;
 buffer[430] = 32'h01800B13;
 buffer[431] = 32'h00500993;
 buffer[432] = 32'h00B00913;
 buffer[433] = 32'h0C800713;
 buffer[434] = 32'h14000693;
 buffer[435] = 32'h00000613;
 buffer[436] = 32'h00000593;
 buffer[437] = 32'h00F00513;
 buffer[438] = 32'h00001097;
 buffer[439] = 32'h91C080E7;
 buffer[440] = 32'h00012483;
 buffer[441] = 32'h01C10513;
 buffer[442] = 32'h04248593;
 buffer[443] = 32'h0FF5F593;
 buffer[444] = 32'h00000097;
 buffer[445] = 32'h230080E7;
 buffer[446] = 32'h00812783;
 buffer[447] = 32'h0FF4FA13;
 buffer[448] = 32'h002A1A13;
 buffer[449] = 32'h01478A33;
 buffer[450] = 32'h000A2583;
 buffer[451] = 32'h04010513;
 buffer[452] = 32'h00000493;
 buffer[453] = 32'h4015D593;
 buffer[454] = 32'h01F58593;
 buffer[455] = 32'h00000097;
 buffer[456] = 32'h268080E7;
 buffer[457] = 32'h000A2583;
 buffer[458] = 32'h06410513;
 buffer[459] = 32'h4035D593;
 buffer[460] = 32'h00000097;
 buffer[461] = 32'h18C080E7;
 buffer[462] = 32'h01C10613;
 buffer[463] = 32'h04010593;
 buffer[464] = 32'h08810513;
 buffer[465] = 32'h00000097;
 buffer[466] = 32'h2A4080E7;
 buffer[467] = 32'h06410613;
 buffer[468] = 32'h08810593;
 buffer[469] = 32'h0AC10513;
 buffer[470] = 32'h00000097;
 buffer[471] = 32'h290080E7;
 buffer[472] = 32'h00048593;
 buffer[473] = 32'h0AC10513;
 buffer[474] = 32'h00348493;
 buffer[475] = 32'h00000097;
 buffer[476] = 32'hD60080E7;
 buffer[477] = 32'hFF6496E3;
 buffer[478] = 32'h00412783;
 buffer[479] = 32'h50000D93;
 buffer[480] = 32'h00479D13;
 buffer[481] = 32'h000027B7;
 buffer[482] = 32'h6C078A13;
 buffer[483] = 32'h78000C93;
 buffer[484] = 32'h02400493;
 buffer[485] = 32'h000A8B93;
 buffer[486] = 32'h00000C13;
 buffer[487] = 32'h04000513;
 buffer[488] = 32'h000BA603;
 buffer[489] = 32'h004BA803;
 buffer[490] = 32'h008BA583;
 buffer[491] = 32'h00160713;
 buffer[492] = 32'h00180793;
 buffer[493] = 32'h00158693;
 buffer[494] = 32'h00269693;
 buffer[495] = 32'h00279793;
 buffer[496] = 32'h00271713;
 buffer[497] = 32'h00D406B3;
 buffer[498] = 32'h00281813;
 buffer[499] = 32'h00E40733;
 buffer[500] = 32'h00259593;
 buffer[501] = 32'h00F407B3;
 buffer[502] = 32'h00261613;
 buffer[503] = 32'h0006A883;
 buffer[504] = 32'h0007A783;
 buffer[505] = 32'h00072683;
 buffer[506] = 32'h00B405B3;
 buffer[507] = 32'h01040733;
 buffer[508] = 32'h00C40633;
 buffer[509] = 32'h0005A803;
 buffer[510] = 32'h00072703;
 buffer[511] = 32'h00062603;
 buffer[512] = 32'h011D88B3;
 buffer[513] = 32'h00FD87B3;
 buffer[514] = 32'h00DD86B3;
 buffer[515] = 32'h41A888B3;
 buffer[516] = 32'h010C8833;
 buffer[517] = 32'h41A787B3;
 buffer[518] = 32'h00EC8733;
 buffer[519] = 32'h41A686B3;
 buffer[520] = 32'h00CC8633;
 buffer[521] = 32'h01100593;
 buffer[522] = 32'h003C0C13;
 buffer[523] = 32'h00000097;
 buffer[524] = 32'h484080E7;
 buffer[525] = 32'h01892533;
 buffer[526] = 32'h00154513;
 buffer[527] = 32'h029C0063;
 buffer[528] = 32'h0189D863;
 buffer[529] = 32'h00751513;
 buffer[530] = 32'h00CB8B93;
 buffer[531] = 32'hF55FF06F;
 buffer[532] = 32'h04000513;
 buffer[533] = 32'h00CB8B93;
 buffer[534] = 32'hF49FF06F;
 buffer[535] = 32'h640C8C93;
 buffer[536] = 32'hF34C9AE3;
 buffer[537] = 32'h000027B7;
 buffer[538] = 32'h780D8D93;
 buffer[539] = 32'hB8078793;
 buffer[540] = 32'hF0FD9EE3;
 buffer[541] = 32'h00012783;
 buffer[542] = 32'h00178793;
 buffer[543] = 32'h00F12023;
 buffer[544] = 32'h00001097;
 buffer[545] = 32'h920080E7;
 buffer[546] = 32'h00157513;
 buffer[547] = 32'hFE051AE3;
 buffer[548] = 32'h00001097;
 buffer[549] = 32'h910080E7;
 buffer[550] = 32'h00257793;
 buffer[551] = 32'hFE078AE3;
 buffer[552] = 32'h00C12703;
 buffer[553] = 32'h00100793;
 buffer[554] = 32'h00F70223;
 buffer[555] = 32'h00412703;
 buffer[556] = 32'h40E787B3;
 buffer[557] = 32'h00F12223;
 buffer[558] = 32'hE0DFF06F;
 buffer[559] = 32'h0FF5F713;
 buffer[560] = 32'h000217B7;
 buffer[561] = 32'h52878793;
 buffer[562] = 32'h08000693;
 buffer[563] = 32'h00271713;
 buffer[564] = 32'h00D52023;
 buffer[565] = 32'h00052223;
 buffer[566] = 32'h00052423;
 buffer[567] = 32'h00052623;
 buffer[568] = 32'h00E78733;
 buffer[569] = 32'h00072683;
 buffer[570] = 32'h04058593;
 buffer[571] = 32'h0FF5F593;
 buffer[572] = 32'h00259593;
 buffer[573] = 32'h00D52823;
 buffer[574] = 32'h00B785B3;
 buffer[575] = 32'h0005A783;
 buffer[576] = 32'h00052C23;
 buffer[577] = 32'h00F52A23;
 buffer[578] = 32'h0005A783;
 buffer[579] = 32'h40F007B3;
 buffer[580] = 32'h00F52E23;
 buffer[581] = 32'h00072783;
 buffer[582] = 32'h02F52023;
 buffer[583] = 32'h00008067;
 buffer[584] = 32'h0FF5F713;
 buffer[585] = 32'h000217B7;
 buffer[586] = 32'h52878793;
 buffer[587] = 32'h00271713;
 buffer[588] = 32'h00E78733;
 buffer[589] = 32'h00072683;
 buffer[590] = 32'h04058593;
 buffer[591] = 32'h0FF5F593;
 buffer[592] = 32'h00259593;
 buffer[593] = 32'h00D52023;
 buffer[594] = 32'h00052223;
 buffer[595] = 32'h00B785B3;
 buffer[596] = 32'h0005A783;
 buffer[597] = 32'h00052623;
 buffer[598] = 32'h00052A23;
 buffer[599] = 32'h40F007B3;
 buffer[600] = 32'h00F52423;
 buffer[601] = 32'h08000793;
 buffer[602] = 32'h00F52823;
 buffer[603] = 32'h0005A783;
 buffer[604] = 32'h00052E23;
 buffer[605] = 32'h00F52C23;
 buffer[606] = 32'h00072783;
 buffer[607] = 32'h02F52023;
 buffer[608] = 32'h00008067;
 buffer[609] = 32'h0FF5F713;
 buffer[610] = 32'h000217B7;
 buffer[611] = 32'h52878793;
 buffer[612] = 32'h00271713;
 buffer[613] = 32'h00E78733;
 buffer[614] = 32'h00072683;
 buffer[615] = 32'h04058593;
 buffer[616] = 32'h0FF5F593;
 buffer[617] = 32'h00259593;
 buffer[618] = 32'h00D52023;
 buffer[619] = 32'h00B785B3;
 buffer[620] = 32'h0005A783;
 buffer[621] = 32'h00052423;
 buffer[622] = 32'h00F52223;
 buffer[623] = 32'h0005A783;
 buffer[624] = 32'h40F007B3;
 buffer[625] = 32'h00F52623;
 buffer[626] = 32'h00072783;
 buffer[627] = 32'h00052A23;
 buffer[628] = 32'h00052C23;
 buffer[629] = 32'h00F52823;
 buffer[630] = 32'h08000793;
 buffer[631] = 32'h00052E23;
 buffer[632] = 32'h02F52023;
 buffer[633] = 32'h00008067;
 buffer[634] = 32'hFE010113;
 buffer[635] = 32'h00812C23;
 buffer[636] = 32'h00058413;
 buffer[637] = 32'h01212823;
 buffer[638] = 32'h00062583;
 buffer[639] = 32'h00050913;
 buffer[640] = 32'h00042503;
 buffer[641] = 32'h00112E23;
 buffer[642] = 32'h00912A23;
 buffer[643] = 32'h01312623;
 buffer[644] = 32'h00060493;
 buffer[645] = 32'h00000097;
 buffer[646] = 32'h794080E7;
 buffer[647] = 32'h00C4A583;
 buffer[648] = 32'h00050993;
 buffer[649] = 32'h00442503;
 buffer[650] = 32'h00000097;
 buffer[651] = 32'h780080E7;
 buffer[652] = 32'h0184A583;
 buffer[653] = 32'h00050793;
 buffer[654] = 32'h00842503;
 buffer[655] = 32'h00F989B3;
 buffer[656] = 32'h00000097;
 buffer[657] = 32'h768080E7;
 buffer[658] = 32'h00A989B3;
 buffer[659] = 32'h4079D993;
 buffer[660] = 32'h01392023;
 buffer[661] = 32'h0044A583;
 buffer[662] = 32'h00042503;
 buffer[663] = 32'h00000097;
 buffer[664] = 32'h74C080E7;
 buffer[665] = 32'h0104A583;
 buffer[666] = 32'h00050993;
 buffer[667] = 32'h00442503;
 buffer[668] = 32'h00000097;
 buffer[669] = 32'h738080E7;
 buffer[670] = 32'h01C4A583;
 buffer[671] = 32'h00050793;
 buffer[672] = 32'h00842503;
 buffer[673] = 32'h00F989B3;
 buffer[674] = 32'h00000097;
 buffer[675] = 32'h720080E7;
 buffer[676] = 32'h00A989B3;
 buffer[677] = 32'h4079D993;
 buffer[678] = 32'h01392223;
 buffer[679] = 32'h0084A583;
 buffer[680] = 32'h00042503;
 buffer[681] = 32'h00000097;
 buffer[682] = 32'h704080E7;
 buffer[683] = 32'h0144A583;
 buffer[684] = 32'h00050993;
 buffer[685] = 32'h00442503;
 buffer[686] = 32'h00000097;
 buffer[687] = 32'h6F0080E7;
 buffer[688] = 32'h00050793;
 buffer[689] = 32'h0204A583;
 buffer[690] = 32'h00842503;
 buffer[691] = 32'h00F989B3;
 buffer[692] = 32'h00000097;
 buffer[693] = 32'h6D8080E7;
 buffer[694] = 32'h00A989B3;
 buffer[695] = 32'h4079D993;
 buffer[696] = 32'h01392423;
 buffer[697] = 32'h0004A583;
 buffer[698] = 32'h00C42503;
 buffer[699] = 32'h00000097;
 buffer[700] = 32'h6BC080E7;
 buffer[701] = 32'h00C4A583;
 buffer[702] = 32'h00050993;
 buffer[703] = 32'h01042503;
 buffer[704] = 32'h00000097;
 buffer[705] = 32'h6A8080E7;
 buffer[706] = 32'h0184A583;
 buffer[707] = 32'h00050793;
 buffer[708] = 32'h01442503;
 buffer[709] = 32'h00F989B3;
 buffer[710] = 32'h00000097;
 buffer[711] = 32'h690080E7;
 buffer[712] = 32'h00A989B3;
 buffer[713] = 32'h4079D993;
 buffer[714] = 32'h01392623;
 buffer[715] = 32'h0044A583;
 buffer[716] = 32'h00C42503;
 buffer[717] = 32'h00000097;
 buffer[718] = 32'h674080E7;
 buffer[719] = 32'h0104A583;
 buffer[720] = 32'h00050993;
 buffer[721] = 32'h01042503;
 buffer[722] = 32'h00000097;
 buffer[723] = 32'h660080E7;
 buffer[724] = 32'h01C4A583;
 buffer[725] = 32'h00050793;
 buffer[726] = 32'h01442503;
 buffer[727] = 32'h00F989B3;
 buffer[728] = 32'h00000097;
 buffer[729] = 32'h648080E7;
 buffer[730] = 32'h00A989B3;
 buffer[731] = 32'h4079D993;
 buffer[732] = 32'h01392823;
 buffer[733] = 32'h0084A583;
 buffer[734] = 32'h00C42503;
 buffer[735] = 32'h00000097;
 buffer[736] = 32'h62C080E7;
 buffer[737] = 32'h0144A583;
 buffer[738] = 32'h00050993;
 buffer[739] = 32'h01042503;
 buffer[740] = 32'h00000097;
 buffer[741] = 32'h618080E7;
 buffer[742] = 32'h0204A583;
 buffer[743] = 32'h00050793;
 buffer[744] = 32'h01442503;
 buffer[745] = 32'h00F989B3;
 buffer[746] = 32'h00000097;
 buffer[747] = 32'h600080E7;
 buffer[748] = 32'h00A989B3;
 buffer[749] = 32'h4079D993;
 buffer[750] = 32'h01392A23;
 buffer[751] = 32'h0004A583;
 buffer[752] = 32'h01842503;
 buffer[753] = 32'h00000097;
 buffer[754] = 32'h5E4080E7;
 buffer[755] = 32'h00C4A583;
 buffer[756] = 32'h00050993;
 buffer[757] = 32'h01C42503;
 buffer[758] = 32'h00000097;
 buffer[759] = 32'h5D0080E7;
 buffer[760] = 32'h00050793;
 buffer[761] = 32'h0184A583;
 buffer[762] = 32'h02042503;
 buffer[763] = 32'h00F989B3;
 buffer[764] = 32'h00000097;
 buffer[765] = 32'h5B8080E7;
 buffer[766] = 32'h00A989B3;
 buffer[767] = 32'h4079D993;
 buffer[768] = 32'h01392C23;
 buffer[769] = 32'h0044A583;
 buffer[770] = 32'h01842503;
 buffer[771] = 32'h00000097;
 buffer[772] = 32'h59C080E7;
 buffer[773] = 32'h0104A583;
 buffer[774] = 32'h00050993;
 buffer[775] = 32'h01C42503;
 buffer[776] = 32'h00000097;
 buffer[777] = 32'h588080E7;
 buffer[778] = 32'h01C4A583;
 buffer[779] = 32'h00050793;
 buffer[780] = 32'h02042503;
 buffer[781] = 32'h00F989B3;
 buffer[782] = 32'h00000097;
 buffer[783] = 32'h570080E7;
 buffer[784] = 32'h00A989B3;
 buffer[785] = 32'h4079D993;
 buffer[786] = 32'h01392E23;
 buffer[787] = 32'h0084A583;
 buffer[788] = 32'h01842503;
 buffer[789] = 32'h00000097;
 buffer[790] = 32'h554080E7;
 buffer[791] = 32'h0144A583;
 buffer[792] = 32'h00050993;
 buffer[793] = 32'h01C42503;
 buffer[794] = 32'h00000097;
 buffer[795] = 32'h540080E7;
 buffer[796] = 32'h0204A583;
 buffer[797] = 32'h00050793;
 buffer[798] = 32'h02042503;
 buffer[799] = 32'h00F98433;
 buffer[800] = 32'h00000097;
 buffer[801] = 32'h528080E7;
 buffer[802] = 32'h00A40433;
 buffer[803] = 32'h40745413;
 buffer[804] = 32'h02892023;
 buffer[805] = 32'h01C12083;
 buffer[806] = 32'h01812403;
 buffer[807] = 32'h01412483;
 buffer[808] = 32'h01012903;
 buffer[809] = 32'h00C12983;
 buffer[810] = 32'h02010113;
 buffer[811] = 32'h00008067;
 buffer[812] = 32'hFD010113;
 buffer[813] = 32'h01512A23;
 buffer[814] = 32'h01812423;
 buffer[815] = 32'h00050A93;
 buffer[816] = 32'h00058C13;
 buffer[817] = 32'h40C70533;
 buffer[818] = 32'h40D885B3;
 buffer[819] = 32'h02112623;
 buffer[820] = 32'h02812423;
 buffer[821] = 32'h02912223;
 buffer[822] = 32'h00068413;
 buffer[823] = 32'h00078493;
 buffer[824] = 32'h03212023;
 buffer[825] = 32'h01312E23;
 buffer[826] = 32'h01412C23;
 buffer[827] = 32'h01612823;
 buffer[828] = 32'h00060A13;
 buffer[829] = 32'h01712623;
 buffer[830] = 32'h00070B13;
 buffer[831] = 32'h00080B93;
 buffer[832] = 32'h00088913;
 buffer[833] = 32'h01912223;
 buffer[834] = 32'h00000097;
 buffer[835] = 32'h4A0080E7;
 buffer[836] = 32'h00050993;
 buffer[837] = 32'h414B85B3;
 buffer[838] = 32'h40848533;
 buffer[839] = 32'h00000097;
 buffer[840] = 32'h48C080E7;
 buffer[841] = 32'h40A987B3;
 buffer[842] = 32'h14F05A63;
 buffer[843] = 32'h000C0863;
 buffer[844] = 32'h4187D7B3;
 buffer[845] = 32'h00FA8533;
 buffer[846] = 32'h0FF57A93;
 buffer[847] = 32'h40545413;
 buffer[848] = 32'h4054D493;
 buffer[849] = 32'h405A5A13;
 buffer[850] = 32'h405B5B13;
 buffer[851] = 32'h405BDB93;
 buffer[852] = 32'h40595913;
 buffer[853] = 32'h0084DE63;
 buffer[854] = 32'h00040713;
 buffer[855] = 32'h000A0793;
 buffer[856] = 32'h00048413;
 buffer[857] = 32'h000B0A13;
 buffer[858] = 32'h00070493;
 buffer[859] = 32'h00078B13;
 buffer[860] = 32'h14895063;
 buffer[861] = 32'h1C945263;
 buffer[862] = 32'h000B0793;
 buffer[863] = 32'h000A0B13;
 buffer[864] = 32'h000B8A13;
 buffer[865] = 32'h00048713;
 buffer[866] = 32'h414B0533;
 buffer[867] = 32'h00040493;
 buffer[868] = 32'h00090413;
 buffer[869] = 32'h408485B3;
 buffer[870] = 32'h00A51513;
 buffer[871] = 32'h00070913;
 buffer[872] = 32'h00078B93;
 buffer[873] = 32'hFFFFF097;
 buffer[874] = 32'h674080E7;
 buffer[875] = 32'h00050993;
 buffer[876] = 32'h1C990063;
 buffer[877] = 32'h416B8533;
 buffer[878] = 32'h409905B3;
 buffer[879] = 32'h00A51513;
 buffer[880] = 32'hFFFFF097;
 buffer[881] = 32'h658080E7;
 buffer[882] = 32'h00050C13;
 buffer[883] = 32'h00050C93;
 buffer[884] = 32'h1E890663;
 buffer[885] = 32'h414B8533;
 buffer[886] = 32'h408905B3;
 buffer[887] = 32'h00A51513;
 buffer[888] = 32'hFFFFF097;
 buffer[889] = 32'h638080E7;
 buffer[890] = 32'h00100737;
 buffer[891] = 32'hFFF70713;
 buffer[892] = 32'h00050793;
 buffer[893] = 32'h10E98863;
 buffer[894] = 32'h1AEC0063;
 buffer[895] = 32'h010005B7;
 buffer[896] = 32'hFFF58593;
 buffer[897] = 32'h00BC7333;
 buffer[898] = 32'h00B575B3;
 buffer[899] = 32'hC01027F3;
 buffer[900] = 32'h0017F793;
 buffer[901] = 32'h10079A63;
 buffer[902] = 32'h001008B7;
 buffer[903] = 32'hC0088893;
 buffer[904] = 32'h00A41413;
 buffer[905] = 32'h01147433;
 buffer[906] = 32'h3FFA7A13;
 buffer[907] = 32'h00A49493;
 buffer[908] = 32'h880006B7;
 buffer[909] = 32'h01446A33;
 buffer[910] = 32'h0114F4B3;
 buffer[911] = 32'h3FFB7B13;
 buffer[912] = 32'h00A91913;
 buffer[913] = 32'h0146A023;
 buffer[914] = 32'h00899513;
 buffer[915] = 32'h0164EB33;
 buffer[916] = 32'h01197933;
 buffer[917] = 32'h3FFBFB93;
 buffer[918] = 32'h0166A223;
 buffer[919] = 32'h00855713;
 buffer[920] = 32'h01796933;
 buffer[921] = 32'h018A9513;
 buffer[922] = 32'h0126A423;
 buffer[923] = 32'h00A76533;
 buffer[924] = 32'h00A6A623;
 buffer[925] = 32'h0066A823;
 buffer[926] = 32'h00B6AA23;
 buffer[927] = 32'h02C12083;
 buffer[928] = 32'h02812403;
 buffer[929] = 32'h02412483;
 buffer[930] = 32'h02012903;
 buffer[931] = 32'h01C12983;
 buffer[932] = 32'h01812A03;
 buffer[933] = 32'h01412A83;
 buffer[934] = 32'h01012B03;
 buffer[935] = 32'h00C12B83;
 buffer[936] = 32'h00812C03;
 buffer[937] = 32'h00412C83;
 buffer[938] = 32'h03010113;
 buffer[939] = 32'h00008067;
 buffer[940] = 32'h0A995063;
 buffer[941] = 32'h13241263;
 buffer[942] = 32'h417B0533;
 buffer[943] = 32'h40848933;
 buffer[944] = 32'h00090593;
 buffer[945] = 32'h00A51513;
 buffer[946] = 32'hFFFFF097;
 buffer[947] = 32'h550080E7;
 buffer[948] = 32'h00050C93;
 buffer[949] = 32'hFA9404E3;
 buffer[950] = 32'h414B0533;
 buffer[951] = 32'h00090593;
 buffer[952] = 32'h00A51513;
 buffer[953] = 32'hFFFFF097;
 buffer[954] = 32'h534080E7;
 buffer[955] = 32'h000B8713;
 buffer[956] = 32'h00048913;
 buffer[957] = 32'h000B0B93;
 buffer[958] = 32'h00050793;
 buffer[959] = 32'h00040493;
 buffer[960] = 32'h00070B13;
 buffer[961] = 32'h00100537;
 buffer[962] = 32'hFFF50513;
 buffer[963] = 32'hF6AC88E3;
 buffer[964] = 32'hF6A786E3;
 buffer[965] = 32'h010005B7;
 buffer[966] = 32'hFFF58593;
 buffer[967] = 32'h00BCF333;
 buffer[968] = 32'h00050993;
 buffer[969] = 32'h00B7F5B3;
 buffer[970] = 32'hC01027F3;
 buffer[971] = 32'h0017F793;
 buffer[972] = 32'hFE079CE3;
 buffer[973] = 32'hEE5FF06F;
 buffer[974] = 32'h00040713;
 buffer[975] = 32'h000A0793;
 buffer[976] = 32'h00090413;
 buffer[977] = 32'h000B8A13;
 buffer[978] = 32'h00070913;
 buffer[979] = 32'h00078B93;
 buffer[980] = 32'h06848063;
 buffer[981] = 32'h414B0533;
 buffer[982] = 32'h408485B3;
 buffer[983] = 32'h00A51513;
 buffer[984] = 32'hFFFFF097;
 buffer[985] = 32'h4B8080E7;
 buffer[986] = 32'h00050993;
 buffer[987] = 32'hE49914E3;
 buffer[988] = 32'hF08906E3;
 buffer[989] = 32'h414B8533;
 buffer[990] = 32'h408905B3;
 buffer[991] = 32'h00A51513;
 buffer[992] = 32'hFFFFF097;
 buffer[993] = 32'h498080E7;
 buffer[994] = 32'h00100737;
 buffer[995] = 32'hFFF70713;
 buffer[996] = 32'h00050793;
 buffer[997] = 32'hEEE984E3;
 buffer[998] = 32'h00100337;
 buffer[999] = 32'hFFF30313;
 buffer[1000] = 32'hEC678EE3;
 buffer[1001] = 32'h00879593;
 buffer[1002] = 32'h0085D593;
 buffer[1003] = 32'hF7DFF06F;
 buffer[1004] = 32'h00100537;
 buffer[1005] = 32'hFFF50993;
 buffer[1006] = 32'hDF9FF06F;
 buffer[1007] = 32'h001005B7;
 buffer[1008] = 32'hFFF58593;
 buffer[1009] = 32'hEAB98CE3;
 buffer[1010] = 32'hEAB50AE3;
 buffer[1011] = 32'h00851313;
 buffer[1012] = 32'h00835313;
 buffer[1013] = 32'hF55FF06F;
 buffer[1014] = 32'h00048713;
 buffer[1015] = 32'h000B0793;
 buffer[1016] = 32'h00090493;
 buffer[1017] = 32'h000B8B13;
 buffer[1018] = 32'h00070913;
 buffer[1019] = 32'h00078B93;
 buffer[1020] = 32'hF65FF06F;
 buffer[1021] = 32'hFD010113;
 buffer[1022] = 32'h01312E23;
 buffer[1023] = 32'h01412C23;
 buffer[1024] = 32'h01512A23;
 buffer[1025] = 32'h01612823;
 buffer[1026] = 32'h00559A93;
 buffer[1027] = 32'h00561993;
 buffer[1028] = 32'h00569A13;
 buffer[1029] = 32'h00571B13;
 buffer[1030] = 32'h03212023;
 buffer[1031] = 32'h413B05B3;
 buffer[1032] = 32'h00050913;
 buffer[1033] = 32'h415A0533;
 buffer[1034] = 32'h02112623;
 buffer[1035] = 32'h02812423;
 buffer[1036] = 32'h02912223;
 buffer[1037] = 32'h01712623;
 buffer[1038] = 32'h01812423;
 buffer[1039] = 32'h00000097;
 buffer[1040] = 32'h16C080E7;
 buffer[1041] = 32'h0CA05263;
 buffer[1042] = 32'h4059D413;
 buffer[1043] = 32'h405B5493;
 buffer[1044] = 32'h405ADB93;
 buffer[1045] = 32'h405A5C13;
 buffer[1046] = 32'h1084C263;
 buffer[1047] = 32'h0A940663;
 buffer[1048] = 32'h417C0533;
 buffer[1049] = 32'h408485B3;
 buffer[1050] = 32'h00A51513;
 buffer[1051] = 32'hFFFFF097;
 buffer[1052] = 32'h3AC080E7;
 buffer[1053] = 32'h001007B7;
 buffer[1054] = 32'hFFF78793;
 buffer[1055] = 32'h08F50663;
 buffer[1056] = 32'h00851693;
 buffer[1057] = 32'h00048713;
 buffer[1058] = 32'h000B8513;
 buffer[1059] = 32'h0086D693;
 buffer[1060] = 32'h000C0B93;
 buffer[1061] = 32'h00040493;
 buffer[1062] = 32'h00078593;
 buffer[1063] = 32'h00000613;
 buffer[1064] = 32'hC01027F3;
 buffer[1065] = 32'h0017F793;
 buffer[1066] = 32'hFE079CE3;
 buffer[1067] = 32'h00100E37;
 buffer[1068] = 32'hC00E0E13;
 buffer[1069] = 32'h00A49493;
 buffer[1070] = 32'h01C4F4B3;
 buffer[1071] = 32'h3FF57793;
 buffer[1072] = 32'h00A41413;
 buffer[1073] = 32'h88000337;
 buffer[1074] = 32'h00F4E4B3;
 buffer[1075] = 32'h01C47433;
 buffer[1076] = 32'h3FFC7C13;
 buffer[1077] = 32'h00A71793;
 buffer[1078] = 32'h00932023;
 buffer[1079] = 32'h01C7F7B3;
 buffer[1080] = 32'h01846433;
 buffer[1081] = 32'h3FFBFB93;
 buffer[1082] = 32'h00832223;
 buffer[1083] = 32'h0177E7B3;
 buffer[1084] = 32'h01891E13;
 buffer[1085] = 32'h00F32423;
 buffer[1086] = 32'h00BE67B3;
 buffer[1087] = 32'h00F32623;
 buffer[1088] = 32'h00C32823;
 buffer[1089] = 32'h00D32A23;
 buffer[1090] = 32'h02812403;
 buffer[1091] = 32'h02C12083;
 buffer[1092] = 32'h02412483;
 buffer[1093] = 32'h00C12B83;
 buffer[1094] = 32'h00812C03;
 buffer[1095] = 32'h000B0893;
 buffer[1096] = 32'h000A8813;
 buffer[1097] = 32'h000B0793;
 buffer[1098] = 32'h000A0713;
 buffer[1099] = 32'h01012B03;
 buffer[1100] = 32'h01812A03;
 buffer[1101] = 32'h00098693;
 buffer[1102] = 32'h000A8613;
 buffer[1103] = 32'h01C12983;
 buffer[1104] = 32'h01412A83;
 buffer[1105] = 32'h00090513;
 buffer[1106] = 32'h02012903;
 buffer[1107] = 32'h00000593;
 buffer[1108] = 32'h03010113;
 buffer[1109] = 32'h00000317;
 buffer[1110] = 32'hB5C30067;
 buffer[1111] = 32'h418B8533;
 buffer[1112] = 32'h409405B3;
 buffer[1113] = 32'h00A51513;
 buffer[1114] = 32'hFFFFF097;
 buffer[1115] = 32'h2B0080E7;
 buffer[1116] = 32'h00100637;
 buffer[1117] = 32'hFFF60613;
 buffer[1118] = 32'hF8C508E3;
 buffer[1119] = 32'h00851693;
 buffer[1120] = 32'h0086D693;
 buffer[1121] = 32'h000C0513;
 buffer[1122] = 32'h00040713;
 buffer[1123] = 32'h00000593;
 buffer[1124] = 32'hC01027F3;
 buffer[1125] = 32'h0017F793;
 buffer[1126] = 32'hF00794E3;
 buffer[1127] = 32'hF11FF06F;
 buffer[1128] = 32'hC0102573;
 buffer[1129] = 32'h00008067;
 buffer[1130] = 32'h00050793;
 buffer[1131] = 32'h00157513;
 buffer[1132] = 32'h00050463;
 buffer[1133] = 32'h00058513;
 buffer[1134] = 32'h0017D713;
 buffer[1135] = 32'h00177713;
 buffer[1136] = 32'h00070663;
 buffer[1137] = 32'h00159713;
 buffer[1138] = 32'h00E50533;
 buffer[1139] = 32'h0027D713;
 buffer[1140] = 32'h00177713;
 buffer[1141] = 32'h00070663;
 buffer[1142] = 32'h00259713;
 buffer[1143] = 32'h00E50533;
 buffer[1144] = 32'h0037D713;
 buffer[1145] = 32'h00177713;
 buffer[1146] = 32'h00070663;
 buffer[1147] = 32'h00359713;
 buffer[1148] = 32'h00E50533;
 buffer[1149] = 32'h0047D713;
 buffer[1150] = 32'h00177713;
 buffer[1151] = 32'h00070663;
 buffer[1152] = 32'h00459713;
 buffer[1153] = 32'h00E50533;
 buffer[1154] = 32'h0057D713;
 buffer[1155] = 32'h00177713;
 buffer[1156] = 32'h00070663;
 buffer[1157] = 32'h00559713;
 buffer[1158] = 32'h00E50533;
 buffer[1159] = 32'h0067D713;
 buffer[1160] = 32'h00177713;
 buffer[1161] = 32'h00070663;
 buffer[1162] = 32'h00659713;
 buffer[1163] = 32'h00E50533;
 buffer[1164] = 32'h0077D713;
 buffer[1165] = 32'h00177713;
 buffer[1166] = 32'h00070663;
 buffer[1167] = 32'h00759713;
 buffer[1168] = 32'h00E50533;
 buffer[1169] = 32'h0087D713;
 buffer[1170] = 32'h00177713;
 buffer[1171] = 32'h00070663;
 buffer[1172] = 32'h00859713;
 buffer[1173] = 32'h00E50533;
 buffer[1174] = 32'h0097D713;
 buffer[1175] = 32'h00177713;
 buffer[1176] = 32'h00070663;
 buffer[1177] = 32'h00959713;
 buffer[1178] = 32'h00E50533;
 buffer[1179] = 32'h00A7D713;
 buffer[1180] = 32'h1C070063;
 buffer[1181] = 32'h00177713;
 buffer[1182] = 32'h00070663;
 buffer[1183] = 32'h00A59713;
 buffer[1184] = 32'h00E50533;
 buffer[1185] = 32'h00B7D713;
 buffer[1186] = 32'h00177713;
 buffer[1187] = 32'h00070663;
 buffer[1188] = 32'h00B59713;
 buffer[1189] = 32'h00E50533;
 buffer[1190] = 32'h00C7D713;
 buffer[1191] = 32'h00177713;
 buffer[1192] = 32'h00070663;
 buffer[1193] = 32'h00C59713;
 buffer[1194] = 32'h00E50533;
 buffer[1195] = 32'h00D7D713;
 buffer[1196] = 32'h00177713;
 buffer[1197] = 32'h00070663;
 buffer[1198] = 32'h00D59713;
 buffer[1199] = 32'h00E50533;
 buffer[1200] = 32'h00E7D713;
 buffer[1201] = 32'h16070663;
 buffer[1202] = 32'h00177713;
 buffer[1203] = 32'h00070663;
 buffer[1204] = 32'h00E59713;
 buffer[1205] = 32'h00E50533;
 buffer[1206] = 32'h00F7D713;
 buffer[1207] = 32'h00177713;
 buffer[1208] = 32'h00070663;
 buffer[1209] = 32'h00F59713;
 buffer[1210] = 32'h00E50533;
 buffer[1211] = 32'h0107D713;
 buffer[1212] = 32'h00177713;
 buffer[1213] = 32'h00070663;
 buffer[1214] = 32'h01059713;
 buffer[1215] = 32'h00E50533;
 buffer[1216] = 32'h0117D713;
 buffer[1217] = 32'h00177713;
 buffer[1218] = 32'h00070663;
 buffer[1219] = 32'h01159713;
 buffer[1220] = 32'h00E50533;
 buffer[1221] = 32'h0127D713;
 buffer[1222] = 32'h10070C63;
 buffer[1223] = 32'h00177713;
 buffer[1224] = 32'h00070663;
 buffer[1225] = 32'h01259713;
 buffer[1226] = 32'h00E50533;
 buffer[1227] = 32'h0137D713;
 buffer[1228] = 32'h00177713;
 buffer[1229] = 32'h00070663;
 buffer[1230] = 32'h01359713;
 buffer[1231] = 32'h00E50533;
 buffer[1232] = 32'h0147D713;
 buffer[1233] = 32'h00177713;
 buffer[1234] = 32'h00070663;
 buffer[1235] = 32'h01459713;
 buffer[1236] = 32'h00E50533;
 buffer[1237] = 32'h0157D713;
 buffer[1238] = 32'h00177713;
 buffer[1239] = 32'h00070663;
 buffer[1240] = 32'h01559713;
 buffer[1241] = 32'h00E50533;
 buffer[1242] = 32'h0167D713;
 buffer[1243] = 32'h0C070263;
 buffer[1244] = 32'h00177713;
 buffer[1245] = 32'h00070663;
 buffer[1246] = 32'h01659713;
 buffer[1247] = 32'h00E50533;
 buffer[1248] = 32'h0177D713;
 buffer[1249] = 32'h00177713;
 buffer[1250] = 32'h00070663;
 buffer[1251] = 32'h01759713;
 buffer[1252] = 32'h00E50533;
 buffer[1253] = 32'h0187D713;
 buffer[1254] = 32'h00177713;
 buffer[1255] = 32'h00070663;
 buffer[1256] = 32'h01859713;
 buffer[1257] = 32'h00E50533;
 buffer[1258] = 32'h0197D713;
 buffer[1259] = 32'h00177713;
 buffer[1260] = 32'h00070663;
 buffer[1261] = 32'h01959713;
 buffer[1262] = 32'h00E50533;
 buffer[1263] = 32'h01A7D713;
 buffer[1264] = 32'h06070863;
 buffer[1265] = 32'h00177713;
 buffer[1266] = 32'h00070663;
 buffer[1267] = 32'h01A59713;
 buffer[1268] = 32'h00E50533;
 buffer[1269] = 32'h01B7D713;
 buffer[1270] = 32'h00177713;
 buffer[1271] = 32'h00070663;
 buffer[1272] = 32'h01B59713;
 buffer[1273] = 32'h00E50533;
 buffer[1274] = 32'h01C7D713;
 buffer[1275] = 32'h00177713;
 buffer[1276] = 32'h00070663;
 buffer[1277] = 32'h01C59713;
 buffer[1278] = 32'h00E50533;
 buffer[1279] = 32'h01D7D713;
 buffer[1280] = 32'h00177713;
 buffer[1281] = 32'h00070663;
 buffer[1282] = 32'h01D59713;
 buffer[1283] = 32'h00E50533;
 buffer[1284] = 32'h01E7D713;
 buffer[1285] = 32'h00177713;
 buffer[1286] = 32'h00070663;
 buffer[1287] = 32'h01E59713;
 buffer[1288] = 32'h00E50533;
 buffer[1289] = 32'h0007D663;
 buffer[1290] = 32'h01F59593;
 buffer[1291] = 32'h00B50533;
 buffer[1292] = 32'h00008067;
 buffer[1293] = 32'h90000000;
 buffer[1294] = 32'h00000000;
 buffer[1295] = 32'h00000006;
 buffer[1296] = 32'h00000003;
 buffer[1297] = 32'h00000000;
 buffer[1298] = 32'h00000009;
 buffer[1299] = 32'h00000006;
 buffer[1300] = 32'h0000000C;
 buffer[1301] = 32'h0000000F;
 buffer[1302] = 32'h00000012;
 buffer[1303] = 32'h0000000C;
 buffer[1304] = 32'h00000012;
 buffer[1305] = 32'h00000015;
 buffer[1306] = 32'h00000000;
 buffer[1307] = 32'h00000003;
 buffer[1308] = 32'h0000000F;
 buffer[1309] = 32'h00000000;
 buffer[1310] = 32'h0000000F;
 buffer[1311] = 32'h0000000C;
 buffer[1312] = 32'h00000003;
 buffer[1313] = 32'h00000006;
 buffer[1314] = 32'h0000000F;
 buffer[1315] = 32'h00000006;
 buffer[1316] = 32'h00000012;
 buffer[1317] = 32'h0000000F;
 buffer[1318] = 32'h00000009;
 buffer[1319] = 32'h00000012;
 buffer[1320] = 32'h00000006;
 buffer[1321] = 32'h00000009;
 buffer[1322] = 32'h00000015;
 buffer[1323] = 32'h00000012;
 buffer[1324] = 32'h00000000;
 buffer[1325] = 32'h0000000C;
 buffer[1326] = 32'h00000009;
 buffer[1327] = 32'h0000000C;
 buffer[1328] = 32'h00000015;
 buffer[1329] = 32'h00000009;
 buffer[1330] = 32'hFFFFFFEC;
 buffer[1331] = 32'hFFFFFFEC;
 buffer[1332] = 32'hFFFFFFEC;
 buffer[1333] = 32'h00000014;
 buffer[1334] = 32'hFFFFFFEC;
 buffer[1335] = 32'hFFFFFFEC;
 buffer[1336] = 32'h00000014;
 buffer[1337] = 32'h00000014;
 buffer[1338] = 32'hFFFFFFEC;
 buffer[1339] = 32'hFFFFFFEC;
 buffer[1340] = 32'h00000014;
 buffer[1341] = 32'hFFFFFFEC;
 buffer[1342] = 32'hFFFFFFEC;
 buffer[1343] = 32'hFFFFFFEC;
 buffer[1344] = 32'h00000014;
 buffer[1345] = 32'h00000014;
 buffer[1346] = 32'hFFFFFFEC;
 buffer[1347] = 32'h00000014;
 buffer[1348] = 32'h00000014;
 buffer[1349] = 32'h00000014;
 buffer[1350] = 32'h00000014;
 buffer[1351] = 32'hFFFFFFEC;
 buffer[1352] = 32'h00000014;
 buffer[1353] = 32'h00000014;
 buffer[1354] = 32'h0000007F;
 buffer[1355] = 32'h0000007F;
 buffer[1356] = 32'h0000007F;
 buffer[1357] = 32'h0000007F;
 buffer[1358] = 32'h0000007E;
 buffer[1359] = 32'h0000007E;
 buffer[1360] = 32'h0000007E;
 buffer[1361] = 32'h0000007D;
 buffer[1362] = 32'h0000007D;
 buffer[1363] = 32'h0000007C;
 buffer[1364] = 32'h0000007B;
 buffer[1365] = 32'h0000007A;
 buffer[1366] = 32'h0000007A;
 buffer[1367] = 32'h00000079;
 buffer[1368] = 32'h00000078;
 buffer[1369] = 32'h00000076;
 buffer[1370] = 32'h00000075;
 buffer[1371] = 32'h00000074;
 buffer[1372] = 32'h00000073;
 buffer[1373] = 32'h00000071;
 buffer[1374] = 32'h00000070;
 buffer[1375] = 32'h0000006F;
 buffer[1376] = 32'h0000006D;
 buffer[1377] = 32'h0000006B;
 buffer[1378] = 32'h0000006A;
 buffer[1379] = 32'h00000068;
 buffer[1380] = 32'h00000066;
 buffer[1381] = 32'h00000064;
 buffer[1382] = 32'h00000062;
 buffer[1383] = 32'h00000060;
 buffer[1384] = 32'h0000005E;
 buffer[1385] = 32'h0000005C;
 buffer[1386] = 32'h0000005A;
 buffer[1387] = 32'h00000058;
 buffer[1388] = 32'h00000055;
 buffer[1389] = 32'h00000053;
 buffer[1390] = 32'h00000051;
 buffer[1391] = 32'h0000004E;
 buffer[1392] = 32'h0000004C;
 buffer[1393] = 32'h00000049;
 buffer[1394] = 32'h00000047;
 buffer[1395] = 32'h00000044;
 buffer[1396] = 32'h00000041;
 buffer[1397] = 32'h0000003F;
 buffer[1398] = 32'h0000003C;
 buffer[1399] = 32'h00000039;
 buffer[1400] = 32'h00000036;
 buffer[1401] = 32'h00000033;
 buffer[1402] = 32'h00000031;
 buffer[1403] = 32'h0000002E;
 buffer[1404] = 32'h0000002B;
 buffer[1405] = 32'h00000028;
 buffer[1406] = 32'h00000025;
 buffer[1407] = 32'h00000022;
 buffer[1408] = 32'h0000001F;
 buffer[1409] = 32'h0000001C;
 buffer[1410] = 32'h00000019;
 buffer[1411] = 32'h00000016;
 buffer[1412] = 32'h00000013;
 buffer[1413] = 32'h00000010;
 buffer[1414] = 32'h0000000C;
 buffer[1415] = 32'h00000009;
 buffer[1416] = 32'h00000006;
 buffer[1417] = 32'h00000003;
 buffer[1418] = 32'h00000000;
 buffer[1419] = 32'hFFFFFFFD;
 buffer[1420] = 32'hFFFFFFFA;
 buffer[1421] = 32'hFFFFFFF7;
 buffer[1422] = 32'hFFFFFFF4;
 buffer[1423] = 32'hFFFFFFF0;
 buffer[1424] = 32'hFFFFFFED;
 buffer[1425] = 32'hFFFFFFEA;
 buffer[1426] = 32'hFFFFFFE7;
 buffer[1427] = 32'hFFFFFFE4;
 buffer[1428] = 32'hFFFFFFE1;
 buffer[1429] = 32'hFFFFFFDE;
 buffer[1430] = 32'hFFFFFFDB;
 buffer[1431] = 32'hFFFFFFD8;
 buffer[1432] = 32'hFFFFFFD5;
 buffer[1433] = 32'hFFFFFFD2;
 buffer[1434] = 32'hFFFFFFCF;
 buffer[1435] = 32'hFFFFFFCD;
 buffer[1436] = 32'hFFFFFFCA;
 buffer[1437] = 32'hFFFFFFC7;
 buffer[1438] = 32'hFFFFFFC4;
 buffer[1439] = 32'hFFFFFFC1;
 buffer[1440] = 32'hFFFFFFBF;
 buffer[1441] = 32'hFFFFFFBC;
 buffer[1442] = 32'hFFFFFFB9;
 buffer[1443] = 32'hFFFFFFB7;
 buffer[1444] = 32'hFFFFFFB4;
 buffer[1445] = 32'hFFFFFFB2;
 buffer[1446] = 32'hFFFFFFAF;
 buffer[1447] = 32'hFFFFFFAD;
 buffer[1448] = 32'hFFFFFFAB;
 buffer[1449] = 32'hFFFFFFA8;
 buffer[1450] = 32'hFFFFFFA6;
 buffer[1451] = 32'hFFFFFFA4;
 buffer[1452] = 32'hFFFFFFA2;
 buffer[1453] = 32'hFFFFFFA0;
 buffer[1454] = 32'hFFFFFF9E;
 buffer[1455] = 32'hFFFFFF9C;
 buffer[1456] = 32'hFFFFFF9A;
 buffer[1457] = 32'hFFFFFF98;
 buffer[1458] = 32'hFFFFFF96;
 buffer[1459] = 32'hFFFFFF95;
 buffer[1460] = 32'hFFFFFF93;
 buffer[1461] = 32'hFFFFFF91;
 buffer[1462] = 32'hFFFFFF90;
 buffer[1463] = 32'hFFFFFF8F;
 buffer[1464] = 32'hFFFFFF8D;
 buffer[1465] = 32'hFFFFFF8C;
 buffer[1466] = 32'hFFFFFF8B;
 buffer[1467] = 32'hFFFFFF8A;
 buffer[1468] = 32'hFFFFFF88;
 buffer[1469] = 32'hFFFFFF87;
 buffer[1470] = 32'hFFFFFF86;
 buffer[1471] = 32'hFFFFFF86;
 buffer[1472] = 32'hFFFFFF85;
 buffer[1473] = 32'hFFFFFF84;
 buffer[1474] = 32'hFFFFFF83;
 buffer[1475] = 32'hFFFFFF83;
 buffer[1476] = 32'hFFFFFF82;
 buffer[1477] = 32'hFFFFFF82;
 buffer[1478] = 32'hFFFFFF82;
 buffer[1479] = 32'hFFFFFF81;
 buffer[1480] = 32'hFFFFFF81;
 buffer[1481] = 32'hFFFFFF81;
 buffer[1482] = 32'hFFFFFF81;
 buffer[1483] = 32'hFFFFFF81;
 buffer[1484] = 32'hFFFFFF81;
 buffer[1485] = 32'hFFFFFF81;
 buffer[1486] = 32'hFFFFFF82;
 buffer[1487] = 32'hFFFFFF82;
 buffer[1488] = 32'hFFFFFF82;
 buffer[1489] = 32'hFFFFFF83;
 buffer[1490] = 32'hFFFFFF83;
 buffer[1491] = 32'hFFFFFF84;
 buffer[1492] = 32'hFFFFFF85;
 buffer[1493] = 32'hFFFFFF86;
 buffer[1494] = 32'hFFFFFF86;
 buffer[1495] = 32'hFFFFFF87;
 buffer[1496] = 32'hFFFFFF88;
 buffer[1497] = 32'hFFFFFF8A;
 buffer[1498] = 32'hFFFFFF8B;
 buffer[1499] = 32'hFFFFFF8C;
 buffer[1500] = 32'hFFFFFF8D;
 buffer[1501] = 32'hFFFFFF8F;
 buffer[1502] = 32'hFFFFFF90;
 buffer[1503] = 32'hFFFFFF91;
 buffer[1504] = 32'hFFFFFF93;
 buffer[1505] = 32'hFFFFFF95;
 buffer[1506] = 32'hFFFFFF96;
 buffer[1507] = 32'hFFFFFF98;
 buffer[1508] = 32'hFFFFFF9A;
 buffer[1509] = 32'hFFFFFF9C;
 buffer[1510] = 32'hFFFFFF9E;
 buffer[1511] = 32'hFFFFFFA0;
 buffer[1512] = 32'hFFFFFFA2;
 buffer[1513] = 32'hFFFFFFA4;
 buffer[1514] = 32'hFFFFFFA6;
 buffer[1515] = 32'hFFFFFFA8;
 buffer[1516] = 32'hFFFFFFAB;
 buffer[1517] = 32'hFFFFFFAD;
 buffer[1518] = 32'hFFFFFFAF;
 buffer[1519] = 32'hFFFFFFB2;
 buffer[1520] = 32'hFFFFFFB4;
 buffer[1521] = 32'hFFFFFFB7;
 buffer[1522] = 32'hFFFFFFB9;
 buffer[1523] = 32'hFFFFFFBC;
 buffer[1524] = 32'hFFFFFFBF;
 buffer[1525] = 32'hFFFFFFC1;
 buffer[1526] = 32'hFFFFFFC4;
 buffer[1527] = 32'hFFFFFFC7;
 buffer[1528] = 32'hFFFFFFCA;
 buffer[1529] = 32'hFFFFFFCD;
 buffer[1530] = 32'hFFFFFFCF;
 buffer[1531] = 32'hFFFFFFD2;
 buffer[1532] = 32'hFFFFFFD5;
 buffer[1533] = 32'hFFFFFFD8;
 buffer[1534] = 32'hFFFFFFDB;
 buffer[1535] = 32'hFFFFFFDE;
 buffer[1536] = 32'hFFFFFFE1;
 buffer[1537] = 32'hFFFFFFE4;
 buffer[1538] = 32'hFFFFFFE7;
 buffer[1539] = 32'hFFFFFFEA;
 buffer[1540] = 32'hFFFFFFED;
 buffer[1541] = 32'hFFFFFFF0;
 buffer[1542] = 32'hFFFFFFF4;
 buffer[1543] = 32'hFFFFFFF7;
 buffer[1544] = 32'hFFFFFFFA;
 buffer[1545] = 32'hFFFFFFFD;
 buffer[1546] = 32'h00000000;
 buffer[1547] = 32'h00000003;
 buffer[1548] = 32'h00000006;
 buffer[1549] = 32'h00000009;
 buffer[1550] = 32'h0000000C;
 buffer[1551] = 32'h00000010;
 buffer[1552] = 32'h00000013;
 buffer[1553] = 32'h00000016;
 buffer[1554] = 32'h00000019;
 buffer[1555] = 32'h0000001C;
 buffer[1556] = 32'h0000001F;
 buffer[1557] = 32'h00000022;
 buffer[1558] = 32'h00000025;
 buffer[1559] = 32'h00000028;
 buffer[1560] = 32'h0000002B;
 buffer[1561] = 32'h0000002E;
 buffer[1562] = 32'h00000031;
 buffer[1563] = 32'h00000033;
 buffer[1564] = 32'h00000036;
 buffer[1565] = 32'h00000039;
 buffer[1566] = 32'h0000003C;
 buffer[1567] = 32'h0000003F;
 buffer[1568] = 32'h00000041;
 buffer[1569] = 32'h00000044;
 buffer[1570] = 32'h00000047;
 buffer[1571] = 32'h00000049;
 buffer[1572] = 32'h0000004C;
 buffer[1573] = 32'h0000004E;
 buffer[1574] = 32'h00000051;
 buffer[1575] = 32'h00000053;
 buffer[1576] = 32'h00000055;
 buffer[1577] = 32'h00000058;
 buffer[1578] = 32'h0000005A;
 buffer[1579] = 32'h0000005C;
 buffer[1580] = 32'h0000005E;
 buffer[1581] = 32'h00000060;
 buffer[1582] = 32'h00000062;
 buffer[1583] = 32'h00000064;
 buffer[1584] = 32'h00000066;
 buffer[1585] = 32'h00000068;
 buffer[1586] = 32'h0000006A;
 buffer[1587] = 32'h0000006B;
 buffer[1588] = 32'h0000006D;
 buffer[1589] = 32'h0000006F;
 buffer[1590] = 32'h00000070;
 buffer[1591] = 32'h00000071;
 buffer[1592] = 32'h00000073;
 buffer[1593] = 32'h00000074;
 buffer[1594] = 32'h00000075;
 buffer[1595] = 32'h00000076;
 buffer[1596] = 32'h00000078;
 buffer[1597] = 32'h00000079;
 buffer[1598] = 32'h0000007A;
 buffer[1599] = 32'h0000007A;
 buffer[1600] = 32'h0000007B;
 buffer[1601] = 32'h0000007C;
 buffer[1602] = 32'h0000007D;
 buffer[1603] = 32'h0000007D;
 buffer[1604] = 32'h0000007E;
 buffer[1605] = 32'h0000007E;
 buffer[1606] = 32'h0000007E;
 buffer[1607] = 32'h0000007F;
 buffer[1608] = 32'h0000007F;
 buffer[1609] = 32'h0000007F;
end

endmodule


// SL 2019, MIT license
module M_simulation_spram__bram_ram_spram0_mem_mem(
input      [14-1:0]                in_mem_addr0,
output reg  [16-1:0]     out_mem_rdata0,
output reg  [16-1:0]     out_mem_rdata1,
input      [(16)/4-1:0]         in_mem_wenable1,
input      [16-1:0]                 in_mem_wdata1,
input      [14-1:0]                in_mem_addr1,
input      clock0,
input      clock1
);
reg  [16-1:0] buffer[16384-1:0];
always @(posedge clock0) begin
  out_mem_rdata0 <= buffer[in_mem_addr0];
end
integer i;
always @(posedge clock1) begin
  for (i = 0; i < (16)/4; i = i + 1) begin
    if (in_mem_wenable1[i]) begin
      buffer[in_mem_addr1][i*4+:4] <= in_mem_wdata1[i*4+:4];
    end
  end
end

endmodule

module M_simulation_spram__bram_ram_spram0 (
in_addr,
in_data_in,
in_wmask,
in_wenable,
out_data_out,
out_clock,
clock
);
input  [13:0] in_addr;
input  [15:0] in_data_in;
input  [3:0] in_wmask;
input  [0:0] in_wenable;
output  [15:0] out_data_out;
output out_clock;
input clock;
assign out_clock = clock;
wire  [15:0] _w_mem_mem_rdata0;
reg  [13:0] _t_mem_addr0;
reg  [15:0] _t_mem_wenable1;
reg  [15:0] _t_mem_wdata1;
reg  [13:0] _t_mem_addr1;
reg  [15:0] _t_data_out;

assign out_data_out = _t_data_out;

M_simulation_spram__bram_ram_spram0_mem_mem __mem__mem(
.clock0(clock),
.clock1(clock),
.in_mem_addr0(_t_mem_addr0),
.in_mem_wenable1(_t_mem_wenable1),
.in_mem_wdata1(_t_mem_wdata1),
.in_mem_addr1(_t_mem_addr1),
.out_mem_rdata0(_w_mem_mem_rdata0)
);


`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_mem_addr0 = in_addr;
_t_mem_addr1 = in_addr;
_t_mem_wenable1 = {4{in_wenable}}&in_wmask;
_t_mem_wdata1 = in_data_in;
_t_data_out = _w_mem_mem_rdata0;
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


// SL 2019, MIT license
module M_simulation_spram__bram_ram_spram1_mem_mem(
input      [14-1:0]                in_mem_addr0,
output reg  [16-1:0]     out_mem_rdata0,
output reg  [16-1:0]     out_mem_rdata1,
input      [(16)/4-1:0]         in_mem_wenable1,
input      [16-1:0]                 in_mem_wdata1,
input      [14-1:0]                in_mem_addr1,
input      clock0,
input      clock1
);
reg  [16-1:0] buffer[16384-1:0];
always @(posedge clock0) begin
  out_mem_rdata0 <= buffer[in_mem_addr0];
end
integer i;
always @(posedge clock1) begin
  for (i = 0; i < (16)/4; i = i + 1) begin
    if (in_mem_wenable1[i]) begin
      buffer[in_mem_addr1][i*4+:4] <= in_mem_wdata1[i*4+:4];
    end
  end
end

endmodule

module M_simulation_spram__bram_ram_spram1 (
in_addr,
in_data_in,
in_wmask,
in_wenable,
out_data_out,
out_clock,
clock
);
input  [13:0] in_addr;
input  [15:0] in_data_in;
input  [3:0] in_wmask;
input  [0:0] in_wenable;
output  [15:0] out_data_out;
output out_clock;
input clock;
assign out_clock = clock;
wire  [15:0] _w_mem_mem_rdata0;
reg  [13:0] _t_mem_addr0;
reg  [15:0] _t_mem_wenable1;
reg  [15:0] _t_mem_wdata1;
reg  [13:0] _t_mem_addr1;
reg  [15:0] _t_data_out;

assign out_data_out = _t_data_out;

M_simulation_spram__bram_ram_spram1_mem_mem __mem__mem(
.clock0(clock),
.clock1(clock),
.in_mem_addr0(_t_mem_addr0),
.in_mem_wenable1(_t_mem_wenable1),
.in_mem_wdata1(_t_mem_wdata1),
.in_mem_addr1(_t_mem_addr1),
.out_mem_rdata0(_w_mem_mem_rdata0)
);


`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_mem_addr0 = in_addr;
_t_mem_addr1 = in_addr;
_t_mem_wenable1 = {4{in_wenable}}&in_wmask;
_t_mem_wdata1 = in_data_in;
_t_data_out = _w_mem_mem_rdata0;
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule

module M_bram_segment_spram_32bits__bram_ram (
in_pram_addr,
in_pram_rw,
in_pram_wmask,
in_pram_data_in,
in_pram_in_valid,
in_predicted_addr,
in_predicted_correct,
in_bram_override_we,
in_bram_override_addr,
in_bram_override_data,
out_pram_data_out,
out_pram_done,
reset,
out_clock,
clock
);
input  [32-1:0] in_pram_addr;
input  [1-1:0] in_pram_rw;
input  [4-1:0] in_pram_wmask;
input  [32-1:0] in_pram_data_in;
input  [1-1:0] in_pram_in_valid;
input  [25:0] in_predicted_addr;
input  [0:0] in_predicted_correct;
input  [0:0] in_bram_override_we;
input  [12:0] in_bram_override_addr;
input  [31:0] in_bram_override_data;
output  [32-1:0] out_pram_data_out;
output  [1-1:0] out_pram_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [15:0] _w_spram0_data_out;
wire  [15:0] _w_spram1_data_out;
wire  [31:0] _w_mem_mem_rdata0;
reg  [12:0] _t_mem_addr0;
reg  [31:0] _t_mem_wenable1;
reg  [31:0] _t_mem_wdata1;
reg  [12:0] _t_mem_addr1;
reg  [13:0] _t_sp0_addr;
reg  [15:0] _t_sp0_data_in;
reg  [0:0] _t_sp0_wenable;
reg  [3:0] _t_sp0_wmask;
reg  [13:0] _t_sp1_addr;
reg  [15:0] _t_sp1_data_in;
reg  [0:0] _t_sp1_wenable;
reg  [3:0] _t_sp1_wmask;
wire  [0:0] _w_in_bram;
wire  [0:0] _w_not_mapped;
wire  [13:0] _w_predicted;
wire  [13:0] _w_addr;

reg  [0:0] _d_wait_one = 0;
reg  [0:0] _q_wait_one = 0;
reg  [32-1:0] _d_pram_data_out;
reg  [32-1:0] _q_pram_data_out;
reg  [1-1:0] _d_pram_done;
reg  [1-1:0] _q_pram_done;
assign out_pram_data_out = _q_pram_data_out;
assign out_pram_done = _q_pram_done;
M_simulation_spram__bram_ram_spram0 spram0 (
.in_addr(_t_sp0_addr),
.in_data_in(_t_sp0_data_in),
.in_wmask(_t_sp0_wmask),
.in_wenable(_t_sp0_wenable),
.out_data_out(_w_spram0_data_out),
.clock(clock));
M_simulation_spram__bram_ram_spram1 spram1 (
.in_addr(_t_sp1_addr),
.in_data_in(_t_sp1_data_in),
.in_wmask(_t_sp1_wmask),
.in_wenable(_t_sp1_wenable),
.out_data_out(_w_spram1_data_out),
.clock(clock));

M_bram_segment_spram_32bits__bram_ram_mem_mem __mem__mem(
.clock0(clock),
.clock1(clock),
.in_mem_addr0(_t_mem_addr0),
.in_mem_wenable1(_t_mem_wenable1),
.in_mem_wdata1(_t_mem_wdata1),
.in_mem_addr1(_t_mem_addr1),
.out_mem_rdata0(_w_mem_mem_rdata0)
);

assign _w_in_bram = in_pram_addr[17+:1];
assign _w_not_mapped = ~in_pram_addr[31+:1];
assign _w_predicted = in_predicted_addr[2+:14];
assign _w_addr = (in_pram_in_valid&(~in_predicted_correct|in_pram_rw)) ? in_pram_addr[2+:14]:_w_predicted;

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_wait_one = _q_wait_one;
_d_pram_data_out = _q_pram_data_out;
_d_pram_done = _q_pram_done;
// _always_pre
// __block_1
_d_pram_data_out = _w_in_bram ? (_w_mem_mem_rdata0>>{in_pram_addr[0+:2],3'b000}):({_w_spram1_data_out,_w_spram0_data_out}>>{in_pram_addr[0+:2],3'b000});
_d_pram_done = (in_predicted_correct&in_pram_in_valid)|(in_pram_rw&in_pram_in_valid)|_q_wait_one;
_t_mem_addr0 = _w_addr;
_t_mem_addr1 = in_bram_override_we ? in_bram_override_addr:in_pram_addr[2+:13];
_t_mem_wenable1 = (in_pram_wmask&{4{in_pram_rw&in_pram_in_valid&_w_not_mapped&_w_in_bram}})|{4{in_bram_override_we}};
_t_mem_wdata1 = in_bram_override_we ? in_bram_override_data:in_pram_data_in;
_t_sp0_addr = _w_addr;
_t_sp1_addr = _w_addr;
_t_sp0_data_in = in_pram_data_in[0+:16];
_t_sp1_data_in = in_pram_data_in[16+:16];
_t_sp0_wenable = in_pram_rw&in_pram_in_valid&~_w_in_bram&_w_not_mapped;
_t_sp1_wenable = in_pram_rw&in_pram_in_valid&~_w_in_bram&_w_not_mapped;
_t_sp0_wmask = {in_pram_wmask[1+:1],in_pram_wmask[1+:1],in_pram_wmask[0+:1],in_pram_wmask[0+:1]};
_t_sp1_wmask = {in_pram_wmask[3+:1],in_pram_wmask[3+:1],in_pram_wmask[2+:1],in_pram_wmask[2+:1]};
_d_wait_one = in_pram_in_valid&((~in_predicted_correct&~in_pram_rw)|~_w_not_mapped);
// __block_2
// _always_post
end

always @(posedge clock) begin
_q_wait_one <= _d_wait_one;
_q_pram_data_out <= (reset) ? 0 : _d_pram_data_out;
_q_pram_done <= (reset) ? 0 : _d_pram_done;
end

endmodule


// SL 2019, MIT license
module M_rv32i_cpu__cpu_mem_xregsA(
input      [5-1:0]                in_xregsA_addr0,
output reg signed [32-1:0]     out_xregsA_rdata0,
output reg signed [32-1:0]     out_xregsA_rdata1,
input      [32-1:0]             in_xregsA_wenable1,
input      [32-1:0]                 in_xregsA_wdata1,
input      [5-1:0]                in_xregsA_addr1,
input      clock0,
input      clock1
);
reg signed [32-1:0] buffer[32-1:0];
always @(posedge clock0) begin
  out_xregsA_rdata0 <= buffer[in_xregsA_addr0];
end
always @(posedge clock1) begin
  if (in_xregsA_wenable1) begin
    buffer[in_xregsA_addr1] <= in_xregsA_wdata1;
  end
end
initial begin
 buffer[0] = 0;
end

endmodule

// SL 2019, MIT license
module M_rv32i_cpu__cpu_mem_xregsB(
input      [5-1:0]                in_xregsB_addr0,
output reg signed [32-1:0]     out_xregsB_rdata0,
output reg signed [32-1:0]     out_xregsB_rdata1,
input      [32-1:0]             in_xregsB_wenable1,
input      [32-1:0]                 in_xregsB_wdata1,
input      [5-1:0]                in_xregsB_addr1,
input      clock0,
input      clock1
);
reg signed [32-1:0] buffer[32-1:0];
always @(posedge clock0) begin
  out_xregsB_rdata0 <= buffer[in_xregsB_addr0];
end
always @(posedge clock1) begin
  if (in_xregsB_wenable1) begin
    buffer[in_xregsB_addr1] <= in_xregsB_wdata1;
  end
end
initial begin
 buffer[0] = 0;
end

endmodule


module M_decode__cpu_dec (
in_instr,
in_pc,
in_regA,
in_regB,
out_write_rd,
out_jump,
out_branch,
out_load_store,
out_store,
out_loadStoreOp,
out_aluOp,
out_sub,
out_signedShift,
out_pcOrReg,
out_regOrImm,
out_csr,
out_rd_enable,
out_aluA,
out_aluB,
out_imm,
out_clock,
clock
);
input  [31:0] in_instr;
input  [25:0] in_pc;
input signed [31:0] in_regA;
input signed [31:0] in_regB;
output  [4:0] out_write_rd;
output  [0:0] out_jump;
output  [0:0] out_branch;
output  [0:0] out_load_store;
output  [0:0] out_store;
output  [2:0] out_loadStoreOp;
output  [2:0] out_aluOp;
output  [0:0] out_sub;
output  [0:0] out_signedShift;
output  [0:0] out_pcOrReg;
output  [0:0] out_regOrImm;
output  [2:0] out_csr;
output  [0:0] out_rd_enable;
output signed [31:0] out_aluA;
output signed [31:0] out_aluB;
output signed [31:0] out_imm;
output out_clock;
input clock;
assign out_clock = clock;
wire signed [31:0] _w_imm_u;
wire signed [31:0] _w_imm_j;
wire signed [31:0] _w_imm_i;
wire signed [31:0] _w_imm_b;
wire signed [31:0] _w_imm_s;
wire  [4:0] _w_opcode;
wire  [0:0] _w_AUIPC;
wire  [0:0] _w_LUI;
wire  [0:0] _w_JAL;
wire  [0:0] _w_JALR;
wire  [0:0] _w_Branch;
wire  [0:0] _w_Load;
wire  [0:0] _w_Store;
wire  [0:0] _w_IntImm;
wire  [0:0] _w_IntReg;
wire  [0:0] _w_CSR;
wire  [0:0] _w_no_rd;

reg  [4:0] _d_write_rd;
reg  [4:0] _q_write_rd;
reg  [0:0] _d_jump;
reg  [0:0] _q_jump;
reg  [0:0] _d_branch;
reg  [0:0] _q_branch;
reg  [0:0] _d_load_store;
reg  [0:0] _q_load_store;
reg  [0:0] _d_store;
reg  [0:0] _q_store;
reg  [2:0] _d_loadStoreOp;
reg  [2:0] _q_loadStoreOp;
reg  [2:0] _d_aluOp;
reg  [2:0] _q_aluOp;
reg  [0:0] _d_sub;
reg  [0:0] _q_sub;
reg  [0:0] _d_signedShift;
reg  [0:0] _q_signedShift;
reg  [0:0] _d_pcOrReg;
reg  [0:0] _q_pcOrReg;
reg  [0:0] _d_regOrImm;
reg  [0:0] _q_regOrImm;
reg  [2:0] _d_csr;
reg  [2:0] _q_csr;
reg  [0:0] _d_rd_enable;
reg  [0:0] _q_rd_enable;
reg signed [31:0] _d_aluA;
reg signed [31:0] _q_aluA;
reg signed [31:0] _d_aluB;
reg signed [31:0] _q_aluB;
reg signed [31:0] _d_imm;
reg signed [31:0] _q_imm;
assign out_write_rd = _q_write_rd;
assign out_jump = _q_jump;
assign out_branch = _q_branch;
assign out_load_store = _q_load_store;
assign out_store = _q_store;
assign out_loadStoreOp = _q_loadStoreOp;
assign out_aluOp = _q_aluOp;
assign out_sub = _q_sub;
assign out_signedShift = _q_signedShift;
assign out_pcOrReg = _q_pcOrReg;
assign out_regOrImm = _q_regOrImm;
assign out_csr = _q_csr;
assign out_rd_enable = _q_rd_enable;
assign out_aluA = _q_aluA;
assign out_aluB = _q_aluB;
assign out_imm = _q_imm;


assign _w_imm_u = {in_instr[12+:20],12'b0};
assign _w_imm_j = {{12{in_instr[31+:1]}},in_instr[12+:8],in_instr[20+:1],in_instr[21+:10],1'b0};
assign _w_imm_i = {{20{in_instr[31+:1]}},in_instr[20+:12]};
assign _w_imm_b = {{20{in_instr[31+:1]}},in_instr[7+:1],in_instr[25+:6],in_instr[8+:4],1'b0};
assign _w_imm_s = {{20{in_instr[31+:1]}},in_instr[25+:7],in_instr[7+:5]};
assign _w_opcode = in_instr[2+:5];
assign _w_AUIPC = _w_opcode==5'b00101;
assign _w_LUI = _w_opcode==5'b01101;
assign _w_JAL = _w_opcode==5'b11011;
assign _w_JALR = _w_opcode==5'b11001;
assign _w_Branch = _w_opcode==5'b11000;
assign _w_Load = _w_opcode==5'b00000;
assign _w_Store = _w_opcode==5'b01000;
assign _w_IntImm = _w_opcode==5'b00100;
assign _w_IntReg = _w_opcode==5'b01100;
assign _w_CSR = _w_opcode==5'b11100;
assign _w_no_rd = (_w_Branch|_w_Store);

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_write_rd = _q_write_rd;
_d_jump = _q_jump;
_d_branch = _q_branch;
_d_load_store = _q_load_store;
_d_store = _q_store;
_d_loadStoreOp = _q_loadStoreOp;
_d_aluOp = _q_aluOp;
_d_sub = _q_sub;
_d_signedShift = _q_signedShift;
_d_pcOrReg = _q_pcOrReg;
_d_regOrImm = _q_regOrImm;
_d_csr = _q_csr;
_d_rd_enable = _q_rd_enable;
_d_aluA = _q_aluA;
_d_aluB = _q_aluB;
_d_imm = _q_imm;
// _always_pre
_d_jump = (_w_JAL|_w_JALR);
_d_branch = (_w_Branch);
_d_store = (_w_Store);
_d_load_store = (_w_Load|_w_Store);
_d_regOrImm = (_w_IntReg);
_d_aluOp = (_w_IntImm|_w_IntReg) ? {in_instr[12+:3]}:3'b000;
_d_sub = (_w_IntReg&in_instr[30+:1]);
_d_signedShift = _w_IntImm&in_instr[30+:1];
_d_loadStoreOp = in_instr[12+:3];
_d_csr = {_w_CSR,in_instr[20+:2]};
_d_write_rd = in_instr[7+:5];
_d_rd_enable = (_d_write_rd!=0)&~_w_no_rd;
_d_pcOrReg = (_w_AUIPC|_w_JAL|_w_Branch);
_d_aluA = (_w_LUI) ? 0:in_regA;
_d_aluB = in_regB;
// __block_1
  case (_w_opcode)
  5'b00101: begin
// __block_3_case
// __block_4
_d_imm = _w_imm_u;
// __block_5
  end
  5'b01101: begin
// __block_6_case
// __block_7
_d_imm = _w_imm_u;
// __block_8
  end
  5'b11011: begin
// __block_9_case
// __block_10
_d_imm = _w_imm_j;
// __block_11
  end
  5'b11000: begin
// __block_12_case
// __block_13
_d_imm = _w_imm_b;
// __block_14
  end
  5'b11001: begin
// __block_15_case
// __block_16
_d_imm = _w_imm_i;
// __block_17
  end
  5'b00000: begin
// __block_18_case
// __block_19
_d_imm = _w_imm_i;
// __block_20
  end
  5'b00100: begin
// __block_21_case
// __block_22
_d_imm = _w_imm_i;
// __block_23
  end
  5'b01000: begin
// __block_24_case
// __block_25
_d_imm = _w_imm_s;
// __block_26
  end
  default: begin
// __block_27_case
// __block_28
_d_imm = {32{1'bx}};
// __block_29
  end
endcase
// __block_2
// __block_30
// _always_post
end

always @(posedge clock) begin
_q_write_rd <= _d_write_rd;
_q_jump <= _d_jump;
_q_branch <= _d_branch;
_q_load_store <= _d_load_store;
_q_store <= _d_store;
_q_loadStoreOp <= _d_loadStoreOp;
_q_aluOp <= _d_aluOp;
_q_sub <= _d_sub;
_q_signedShift <= _d_signedShift;
_q_pcOrReg <= _d_pcOrReg;
_q_regOrImm <= _d_regOrImm;
_q_csr <= _d_csr;
_q_rd_enable <= _d_rd_enable;
_q_aluA <= _d_aluA;
_q_aluB <= _d_aluB;
_q_imm <= _d_imm;
end

endmodule


module M_intops__cpu_alu (
in_pc,
in_xa,
in_xb,
in_imm,
in_aluOp,
in_sub,
in_pcOrReg,
in_regOrImm,
in_signedShift,
in_csr,
in_cycle,
in_instret,
in_user_data,
in_ra,
in_rb,
in_funct3,
in_branch,
in_jump,
out_r,
out_j,
out_w,
out_clock,
clock
);
input  [25:0] in_pc;
input signed [31:0] in_xa;
input signed [31:0] in_xb;
input signed [31:0] in_imm;
input  [2:0] in_aluOp;
input  [0:0] in_sub;
input  [0:0] in_pcOrReg;
input  [0:0] in_regOrImm;
input  [0:0] in_signedShift;
input  [2:0] in_csr;
input  [31:0] in_cycle;
input  [31:0] in_instret;
input  [31:0] in_user_data;
input signed [31:0] in_ra;
input signed [31:0] in_rb;
input  [2:0] in_funct3;
input  [0:0] in_branch;
input  [0:0] in_jump;
output signed [31:0] out_r;
output  [0:0] out_j;
output signed [31:0] out_w;
output out_clock;
input clock;
assign out_clock = clock;
wire signed [31:0] _w_a;
wire signed [31:0] _w_b;

reg signed [31:0] _d_r;
reg signed [31:0] _q_r;
reg  [0:0] _d_j;
reg  [0:0] _q_j;
reg signed [31:0] _d_w;
reg signed [31:0] _q_w;
assign out_r = _q_r;
assign out_j = _q_j;
assign out_w = _q_w;


assign _w_a = in_pcOrReg ? $signed({6'b0,in_pc[0+:26]}):in_xa;
assign _w_b = in_regOrImm ? (in_xb):in_imm;

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_r = _q_r;
_d_j = _q_j;
_d_w = _q_w;
// _always_pre
// __block_1
  case ({in_aluOp})
  3'b000: begin
// __block_3_case
// __block_4
_d_r = in_sub ? (_w_a-_w_b):(_w_a+_w_b);
// __block_5
  end
  3'b010: begin
// __block_6_case
// __block_7
if ($signed(in_xa)<$signed(_w_b)) begin
// __block_8
// __block_10
_d_r = 32'b1;
// __block_11
end else begin
// __block_9
// __block_12
_d_r = 32'b0;
// __block_13
end
// __block_14
// __block_15
  end
  3'b011: begin
// __block_16_case
// __block_17
if ($unsigned(in_xa)<$unsigned(_w_b)) begin
// __block_18
// __block_20
_d_r = 32'b1;
// __block_21
end else begin
// __block_19
// __block_22
_d_r = 32'b0;
// __block_23
end
// __block_24
// __block_25
  end
  3'b100: begin
// __block_26_case
// __block_27
_d_r = in_xa^_w_b;
// __block_28
  end
  3'b110: begin
// __block_29_case
// __block_30
_d_r = in_xa|_w_b;
// __block_31
  end
  3'b111: begin
// __block_32_case
// __block_33
_d_r = in_xa&_w_b;
// __block_34
  end
  3'b001: begin
// __block_35_case
// __block_36
_d_r = (in_xa<<<_w_b[0+:5]);
// __block_37
  end
  3'b101: begin
// __block_38_case
// __block_39
_d_r = in_signedShift ? (in_xa>>>_w_b[0+:5]):(in_xa>>_w_b[0+:5]);
// __block_40
  end
  default: begin
// __block_41_case
// __block_42
_d_r = {32{1'bx}};
// __block_43
  end
endcase
// __block_2
if (in_csr[2+:1]) begin
// __block_44
// __block_46
  case (in_csr[0+:2])
  2'b00: begin
// __block_48_case
// __block_49
_d_r = in_cycle;
// __block_50
  end
  2'b01: begin
// __block_51_case
// __block_52
_d_r = in_user_data;
// __block_53
  end
  2'b10: begin
// __block_54_case
// __block_55
_d_r = in_instret;
// __block_56
  end
  default: begin
// __block_57_case
// __block_58
_d_r = {32{1'bx}};
// __block_59
  end
endcase
// __block_47
// __block_60
end else begin
// __block_45
end
// __block_61
  case (in_funct3)
  3'b000: begin
// __block_63_case
// __block_64
_d_j = in_jump|(in_branch&(in_ra==in_rb));
// __block_65
  end
  3'b001: begin
// __block_66_case
// __block_67
_d_j = in_jump|(in_branch&(in_ra!=in_rb));
// __block_68
  end
  3'b100: begin
// __block_69_case
// __block_70
_d_j = in_jump|(in_branch&($signed(in_ra)<$signed(in_rb)));
// __block_71
  end
  3'b110: begin
// __block_72_case
// __block_73
_d_j = in_jump|(in_branch&($unsigned(in_ra)<$unsigned(in_rb)));
// __block_74
  end
  3'b101: begin
// __block_75_case
// __block_76
_d_j = in_jump|(in_branch&($signed(in_ra)>=$signed(in_rb)));
// __block_77
  end
  3'b111: begin
// __block_78_case
// __block_79
_d_j = in_jump|(in_branch&($unsigned(in_ra)>=$unsigned(in_rb)));
// __block_80
  end
  default: begin
// __block_81_case
// __block_82
_d_j = in_jump;
// __block_83
  end
endcase
// __block_62
// __block_84
// _always_post
end

always @(posedge clock) begin
_q_r <= _d_r;
_q_j <= _d_j;
_q_w <= _d_w;
end

endmodule

module M_rv32i_cpu__cpu (
in_boot_at,
in_user_data,
in_ram_data_out,
in_ram_done,
out_ram_addr,
out_ram_rw,
out_ram_wmask,
out_ram_data_in,
out_ram_in_valid,
out_predicted_addr,
out_predicted_correct,
reset,
out_clock,
clock
);
input  [25:0] in_boot_at;
input  [31:0] in_user_data;
input  [32-1:0] in_ram_data_out;
input  [1-1:0] in_ram_done;
output  [32-1:0] out_ram_addr;
output  [1-1:0] out_ram_rw;
output  [4-1:0] out_ram_wmask;
output  [32-1:0] out_ram_data_in;
output  [1-1:0] out_ram_in_valid;
output  [25:0] out_predicted_addr;
output  [0:0] out_predicted_correct;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [4:0] _w_dec_write_rd;
wire  [0:0] _w_dec_jump;
wire  [0:0] _w_dec_branch;
wire  [0:0] _w_dec_load_store;
wire  [0:0] _w_dec_store;
wire  [2:0] _w_dec_loadStoreOp;
wire  [2:0] _w_dec_aluOp;
wire  [0:0] _w_dec_sub;
wire  [0:0] _w_dec_signedShift;
wire  [0:0] _w_dec_pcOrReg;
wire  [0:0] _w_dec_regOrImm;
wire  [2:0] _w_dec_csr;
wire  [0:0] _w_dec_rd_enable;
wire signed [31:0] _w_dec_aluA;
wire signed [31:0] _w_dec_aluB;
wire signed [31:0] _w_dec_imm;
wire signed [31:0] _w_alu_r;
wire  [0:0] _w_alu_j;
wire signed [31:0] _w_alu_w;
wire signed [31:0] _w_mem_xregsA_rdata0;
wire signed [31:0] _w_mem_xregsB_rdata0;
wire  [0:0] _c_dry_resume;
assign _c_dry_resume = 0;
reg  [3:0] _t_state;
wire  [25:0] _w_next_pc_p4;
wire  [25:0] _w_next_pc_p8;
wire  [2:0] _w_funct3;
wire  [0:0] _w___block_1_alu_wait;

reg  [4:0] _d_xregsA_addr0 = 0;
reg  [4:0] _q_xregsA_addr0 = 0;
reg  [31:0] _d_xregsA_wenable1 = 0;
reg  [31:0] _q_xregsA_wenable1 = 0;
reg signed [31:0] _d_xregsA_wdata1 = 0;
reg signed [31:0] _q_xregsA_wdata1 = 0;
reg  [4:0] _d_xregsA_addr1 = 0;
reg  [4:0] _q_xregsA_addr1 = 0;
reg  [4:0] _d_xregsB_addr0 = 0;
reg  [4:0] _q_xregsB_addr0 = 0;
reg  [31:0] _d_xregsB_wenable1 = 0;
reg  [31:0] _q_xregsB_wenable1 = 0;
reg signed [31:0] _d_xregsB_wdata1 = 0;
reg signed [31:0] _q_xregsB_wdata1 = 0;
reg  [4:0] _d_xregsB_addr1 = 0;
reg  [4:0] _q_xregsB_addr1 = 0;
reg  [0:0] _d_instr_ready = 0;
reg  [0:0] _q_instr_ready = 0;
reg  [0:0] _d_halt = 0;
reg  [0:0] _q_halt = 0;
reg  [31:0] _d_instr = 0;
reg  [31:0] _q_instr = 0;
reg  [25:0] _d_pc = 0;
reg  [25:0] _q_pc = 0;
reg  [31:0] _d_next_instr = 0;
reg  [31:0] _q_next_instr = 0;
reg  [25:0] _d_next_pc = 0;
reg  [25:0] _q_next_pc = 0;
reg  [0:0] _d_saved_store;
reg  [0:0] _q_saved_store;
reg  [2:0] _d_saved_loadStoreOp;
reg  [2:0] _q_saved_loadStoreOp;
reg  [0:0] _d_saved_rd_enable;
reg  [0:0] _q_saved_rd_enable;
reg  [31:0] _d_refetch_addr;
reg  [31:0] _q_refetch_addr;
reg  [0:0] _d_refetch_rw = 0;
reg  [0:0] _q_refetch_rw = 0;
reg signed [31:0] _d_regA;
reg signed [31:0] _q_regA;
reg signed [31:0] _d_regB;
reg signed [31:0] _q_regB;
reg  [31:0] _d_cycle = 0;
reg  [31:0] _q_cycle = 0;
reg  [31:0] _d_instret = 0;
reg  [31:0] _q_instret = 0;
reg  [0:0] _d_refetch;
reg  [0:0] _q_refetch;
reg  [0:0] _d_wait_next_instr;
reg  [0:0] _q_wait_next_instr;
reg  [0:0] _d_commit_decode;
reg  [0:0] _q_commit_decode;
reg  [0:0] _d_do_load_store;
reg  [0:0] _q_do_load_store;
reg  [0:0] _d_start;
reg  [0:0] _q_start;
reg  [31:0] _d___block_20_tmp;
reg  [31:0] _q___block_20_tmp;
reg  [32-1:0] _d_ram_addr;
reg  [32-1:0] _q_ram_addr;
reg  [1-1:0] _d_ram_rw;
reg  [1-1:0] _q_ram_rw;
reg  [4-1:0] _d_ram_wmask;
reg  [4-1:0] _q_ram_wmask;
reg  [32-1:0] _d_ram_data_in;
reg  [32-1:0] _q_ram_data_in;
reg  [1-1:0] _d_ram_in_valid;
reg  [1-1:0] _q_ram_in_valid;
reg  [25:0] _d_predicted_addr;
reg  [25:0] _q_predicted_addr;
reg  [0:0] _d_predicted_correct;
reg  [0:0] _q_predicted_correct;
assign out_ram_addr = _q_ram_addr;
assign out_ram_rw = _q_ram_rw;
assign out_ram_wmask = _q_ram_wmask;
assign out_ram_data_in = _q_ram_data_in;
assign out_ram_in_valid = _q_ram_in_valid;
assign out_predicted_addr = _q_predicted_addr;
assign out_predicted_correct = _q_predicted_correct;
M_decode__cpu_dec dec (
.in_instr(_d_instr),
.in_pc(_d_pc),
.in_regA(_d_regA),
.in_regB(_d_regB),
.out_write_rd(_w_dec_write_rd),
.out_jump(_w_dec_jump),
.out_branch(_w_dec_branch),
.out_load_store(_w_dec_load_store),
.out_store(_w_dec_store),
.out_loadStoreOp(_w_dec_loadStoreOp),
.out_aluOp(_w_dec_aluOp),
.out_sub(_w_dec_sub),
.out_signedShift(_w_dec_signedShift),
.out_pcOrReg(_w_dec_pcOrReg),
.out_regOrImm(_w_dec_regOrImm),
.out_csr(_w_dec_csr),
.out_rd_enable(_w_dec_rd_enable),
.out_aluA(_w_dec_aluA),
.out_aluB(_w_dec_aluB),
.out_imm(_w_dec_imm),
.clock(clock));
M_intops__cpu_alu alu (
.in_pc(_q_pc),
.in_xa(_w_dec_aluA),
.in_xb(_w_dec_aluB),
.in_imm(_w_dec_imm),
.in_aluOp(_w_dec_aluOp),
.in_sub(_w_dec_sub),
.in_pcOrReg(_w_dec_pcOrReg),
.in_regOrImm(_w_dec_regOrImm),
.in_signedShift(_w_dec_signedShift),
.in_csr(_w_dec_csr),
.in_cycle(_q_cycle),
.in_instret(_q_instret),
.in_user_data(in_user_data),
.in_ra(_q_regA),
.in_rb(_q_regB),
.in_funct3(_w_funct3),
.in_branch(_w_dec_branch),
.in_jump(_w_dec_jump),
.out_r(_w_alu_r),
.out_j(_w_alu_j),
.out_w(_w_alu_w),
.clock(clock));

M_rv32i_cpu__cpu_mem_xregsA __mem__xregsA(
.clock0(clock),
.clock1(clock),
.in_xregsA_addr0(_d_xregsA_addr0),
.in_xregsA_wenable1(_d_xregsA_wenable1),
.in_xregsA_wdata1(_d_xregsA_wdata1),
.in_xregsA_addr1(_d_xregsA_addr1),
.out_xregsA_rdata0(_w_mem_xregsA_rdata0)
);
M_rv32i_cpu__cpu_mem_xregsB __mem__xregsB(
.clock0(clock),
.clock1(clock),
.in_xregsB_addr0(_d_xregsB_addr0),
.in_xregsB_wenable1(_d_xregsB_wenable1),
.in_xregsB_wdata1(_d_xregsB_wdata1),
.in_xregsB_addr1(_d_xregsB_addr1),
.out_xregsB_rdata0(_w_mem_xregsB_rdata0)
);

assign _w_next_pc_p4 = _q_next_pc+4;
assign _w_next_pc_p8 = _q_next_pc+8;
assign _w_funct3 = _q_instr[12+:3];
assign _w___block_1_alu_wait = 0;

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_xregsA_addr0 = _q_xregsA_addr0;
_d_xregsA_wenable1 = _q_xregsA_wenable1;
_d_xregsA_wdata1 = _q_xregsA_wdata1;
_d_xregsA_addr1 = _q_xregsA_addr1;
_d_xregsB_addr0 = _q_xregsB_addr0;
_d_xregsB_wenable1 = _q_xregsB_wenable1;
_d_xregsB_wdata1 = _q_xregsB_wdata1;
_d_xregsB_addr1 = _q_xregsB_addr1;
_d_instr_ready = _q_instr_ready;
_d_halt = _q_halt;
_d_instr = _q_instr;
_d_pc = _q_pc;
_d_next_instr = _q_next_instr;
_d_next_pc = _q_next_pc;
_d_saved_store = _q_saved_store;
_d_saved_loadStoreOp = _q_saved_loadStoreOp;
_d_saved_rd_enable = _q_saved_rd_enable;
_d_refetch_addr = _q_refetch_addr;
_d_refetch_rw = _q_refetch_rw;
_d_regA = _q_regA;
_d_regB = _q_regB;
_d_cycle = _q_cycle;
_d_instret = _q_instret;
_d_refetch = _q_refetch;
_d_wait_next_instr = _q_wait_next_instr;
_d_commit_decode = _q_commit_decode;
_d_do_load_store = _q_do_load_store;
_d_start = _q_start;
_d___block_20_tmp = _q___block_20_tmp;
_d_ram_addr = _q_ram_addr;
_d_ram_rw = _q_ram_rw;
_d_ram_wmask = _q_ram_wmask;
_d_ram_data_in = _q_ram_data_in;
_d_ram_in_valid = _q_ram_in_valid;
_d_predicted_addr = _q_predicted_addr;
_d_predicted_correct = _q_predicted_correct;
// _always_pre
_d_ram_in_valid = 0;
// __block_1
_t_state = {_q_refetch&(in_ram_done|_q_start),~_q_refetch&_q_do_load_store&in_ram_done,(_q_wait_next_instr)&(in_ram_done|_c_dry_resume),_q_commit_decode&~_w___block_1_alu_wait};
if (_q_halt) begin
// __block_2
// __block_4
_t_state = 0;
// __block_5
end else begin
// __block_3
end
// __block_6
  case (_t_state)
  8: begin
// __block_8_case
// __block_9
_d_refetch = 0;
_d_next_instr = in_ram_data_out;
_d_xregsA_addr0 = _d_next_instr[15+:5];
_d_xregsB_addr0 = _d_next_instr[20+:5];
_d_predicted_correct = _q_instr_ready;
_d_predicted_addr = _w_next_pc_p4;
_d_ram_addr = _q_start ? in_boot_at:_q_refetch_addr;
_d_next_pc = _q_start ? in_boot_at:_q_next_pc;
if (_q_start&~reset) begin
// __block_10
// __block_12
$display("CPU RESET %d (@%h) start:%b",_t_state,_d_next_pc,_q_start);
// __block_13
end else begin
// __block_11
end
// __block_14
_d_start = reset;
_d_ram_rw = _q_refetch_rw;
_d_ram_in_valid = ~reset;
_d_instr_ready = _q_do_load_store;
_d_wait_next_instr = ~_q_do_load_store;
// __block_15
  end
  4: begin
// __block_16_case
// __block_17
_d_do_load_store = 0;
if (~_q_saved_store) begin
// __block_18
// __block_20
  case (_q_saved_loadStoreOp[0+:2])
  2'b00: begin
// __block_22_case
// __block_23
_d___block_20_tmp = {{24{(~_q_saved_loadStoreOp[2+:1])&in_ram_data_out[7+:1]}},in_ram_data_out[0+:8]};
// __block_24
  end
  2'b01: begin
// __block_25_case
// __block_26
_d___block_20_tmp = {{16{(~_q_saved_loadStoreOp[2+:1])&in_ram_data_out[15+:1]}},in_ram_data_out[0+:16]};
// __block_27
  end
  2'b10: begin
// __block_28_case
// __block_29
_d___block_20_tmp = in_ram_data_out;
// __block_30
  end
  default: begin
// __block_31_case
// __block_32
_d___block_20_tmp = 0;
// __block_33
  end
endcase
// __block_21
_d_xregsA_wenable1 = _q_saved_rd_enable;
_d_xregsB_wenable1 = _q_saved_rd_enable;
_d_xregsA_wdata1 = _d___block_20_tmp;
_d_xregsB_wdata1 = _d___block_20_tmp;
// __block_34
end else begin
// __block_19
end
// __block_35
_d_ram_addr = _w_next_pc_p4;
if ((_q_next_instr[15+:5]==_q_xregsA_addr1||_q_next_instr[20+:5]==_q_xregsB_addr1||_q_instr[15+:5]==_q_xregsA_addr1||_q_instr[20+:5]==_q_xregsB_addr1)&_q_saved_rd_enable) begin
// __block_36
// __block_38
_d_refetch = 1;
_d_refetch_addr = _q_pc;
_d_next_pc = _q_pc;
_d_instr_ready = 0;
// __block_39
end else begin
// __block_37
// __block_40
_d_commit_decode = 1;
// __block_41
end
// __block_42
_d_ram_in_valid = 1;
_d_ram_rw = 0;
_d_predicted_addr = _w_next_pc_p8;
_d_predicted_correct = 1;
// __block_43
  end
  2: begin
// __block_44_case
// __block_45
_d_wait_next_instr = 0;
_d_next_instr = in_ram_data_out;
_d_xregsA_addr0 = _d_next_instr[15+:5];
_d_xregsB_addr0 = _d_next_instr[20+:5];
_d_commit_decode = 1;
_d_predicted_correct = 1;
_d_ram_addr = _w_next_pc_p4;
_d_ram_in_valid = 1;
_d_ram_rw = 0;
// __block_46
  end
  1: begin
// __block_47_case
// __block_48
_d_commit_decode = 0;
_d_halt = _q_instr_ready&(_q_instr==0);
if (_d_halt) begin
// __block_49
// __block_51
$display("HALT on zero-instruction");
// __block_52
end else begin
// __block_50
end
// __block_53
_d_do_load_store = _q_instr_ready&_w_dec_load_store;
_d_saved_store = _w_dec_store;
_d_saved_loadStoreOp = _w_dec_loadStoreOp;
_d_saved_rd_enable = _w_dec_rd_enable;
_d_refetch = _q_instr_ready&(_w_alu_j|_w_dec_load_store);
_d_refetch_addr = _w_alu_r;
_d_refetch_rw = _w_dec_load_store&_w_dec_store;
_d_predicted_addr = _d_refetch ? _w_alu_r[0+:26]:_w_next_pc_p8;
_d_predicted_correct = 1;
_d_wait_next_instr = (~_d_refetch&~_d_do_load_store)|~_q_instr_ready;
  case (_w_dec_loadStoreOp)
  3'b000: begin
// __block_55_case
// __block_56
  case (_w_alu_r[0+:2])
  2'b00: begin
// __block_58_case
// __block_59
_d_ram_data_in[0+:8] = _q_regB[0+:8];
_d_ram_wmask = 4'b0001;
// __block_60
  end
  2'b01: begin
// __block_61_case
// __block_62
_d_ram_data_in[8+:8] = _q_regB[0+:8];
_d_ram_wmask = 4'b0010;
// __block_63
  end
  2'b10: begin
// __block_64_case
// __block_65
_d_ram_data_in[16+:8] = _q_regB[0+:8];
_d_ram_wmask = 4'b0100;
// __block_66
  end
  2'b11: begin
// __block_67_case
// __block_68
_d_ram_data_in[24+:8] = _q_regB[0+:8];
_d_ram_wmask = 4'b1000;
// __block_69
  end
endcase
// __block_57
// __block_70
  end
  3'b001: begin
// __block_71_case
// __block_72
  case (_w_alu_r[1+:1])
  1'b0: begin
// __block_74_case
// __block_75
_d_ram_data_in[0+:16] = _q_regB[0+:16];
_d_ram_wmask = 4'b0011;
// __block_76
  end
  1'b1: begin
// __block_77_case
// __block_78
_d_ram_data_in[16+:16] = _q_regB[0+:16];
_d_ram_wmask = 4'b1100;
// __block_79
  end
endcase
// __block_73
// __block_80
  end
  3'b010: begin
// __block_81_case
// __block_82
_d_ram_data_in = _q_regB;
_d_ram_wmask = 4'b1111;
// __block_83
  end
  default: begin
// __block_84_case
// __block_85
_d_ram_data_in = 0;
// __block_86
  end
endcase
// __block_54
_d_xregsA_wdata1 = _w_alu_j ? _q_next_pc:_w_alu_r;
_d_xregsB_wdata1 = _w_alu_j ? _q_next_pc:_w_alu_r;
_d_xregsA_addr1 = _w_dec_write_rd;
_d_xregsB_addr1 = _w_dec_write_rd;
_d_xregsA_wenable1 = _q_instr_ready&(~_d_refetch|_w_dec_jump)&_w_dec_rd_enable;
_d_xregsB_wenable1 = _q_instr_ready&(~_d_refetch|_w_dec_jump)&_w_dec_rd_enable;
_d_instr = _q_next_instr;
_d_pc = _q_next_pc;
_d_next_pc = (_w_alu_j&_q_instr_ready) ? _d_refetch_addr:_w_next_pc_p4;
_d_regA = ((_q_xregsA_addr0==_d_xregsA_addr1)&_d_xregsA_wenable1) ? _d_xregsA_wdata1:_w_mem_xregsA_rdata0;
_d_regB = ((_q_xregsB_addr0==_d_xregsB_addr1)&_d_xregsB_wenable1) ? _d_xregsB_wdata1:_w_mem_xregsB_rdata0;
if (_q_instr_ready) begin
// __block_87
// __block_89
_d_instret = _q_instret+1;
// __block_90
end else begin
// __block_88
end
// __block_91
_d_instr_ready = 1;
// __block_92
  end
endcase
// __block_7
_d_cycle = _q_cycle+1;
// __block_93
// _always_post
end

always @(posedge clock) begin
_q_xregsA_addr0 <= _d_xregsA_addr0;
_q_xregsA_wenable1 <= _d_xregsA_wenable1;
_q_xregsA_wdata1 <= _d_xregsA_wdata1;
_q_xregsA_addr1 <= _d_xregsA_addr1;
_q_xregsB_addr0 <= _d_xregsB_addr0;
_q_xregsB_wenable1 <= _d_xregsB_wenable1;
_q_xregsB_wdata1 <= _d_xregsB_wdata1;
_q_xregsB_addr1 <= _d_xregsB_addr1;
_q_instr_ready <= _d_instr_ready;
_q_halt <= _d_halt;
_q_instr <= _d_instr;
_q_pc <= _d_pc;
_q_next_instr <= _d_next_instr;
_q_next_pc <= _d_next_pc;
_q_saved_store <= _d_saved_store;
_q_saved_loadStoreOp <= _d_saved_loadStoreOp;
_q_saved_rd_enable <= _d_saved_rd_enable;
_q_refetch_addr <= _d_refetch_addr;
_q_refetch_rw <= _d_refetch_rw;
_q_regA <= _d_regA;
_q_regB <= _d_regB;
_q_cycle <= _d_cycle;
_q_instret <= _d_instret;
_q_refetch <= (reset) ? 1 : _d_refetch;
_q_wait_next_instr <= (reset) ? 0 : _d_wait_next_instr;
_q_commit_decode <= (reset) ? 0 : _d_commit_decode;
_q_do_load_store <= (reset) ? 0 : _d_do_load_store;
_q_start <= (reset) ? 1 : _d_start;
_q___block_20_tmp <= _d___block_20_tmp;
_q_ram_addr <= (reset) ? 0 : _d_ram_addr;
_q_ram_rw <= (reset) ? 0 : _d_ram_rw;
_q_ram_wmask <= (reset) ? 0 : _d_ram_wmask;
_q_ram_data_in <= (reset) ? 0 : _d_ram_data_in;
_q_ram_in_valid <= (reset) ? 0 : _d_ram_in_valid;
_q_predicted_addr <= _d_predicted_addr;
_q_predicted_correct <= _d_predicted_correct;
end

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
assign _w_active_v = (_q_ycount>=45&&_q_ycount<445);

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


// SL 2019, MIT license
module M_simulation_spram__frame0_mem_mem(
input      [14-1:0]                in_mem_addr0,
output reg  [16-1:0]     out_mem_rdata0,
output reg  [16-1:0]     out_mem_rdata1,
input      [(16)/4-1:0]         in_mem_wenable1,
input      [16-1:0]                 in_mem_wdata1,
input      [14-1:0]                in_mem_addr1,
input      clock0,
input      clock1
);
reg  [16-1:0] buffer[16384-1:0];
always @(posedge clock0) begin
  out_mem_rdata0 <= buffer[in_mem_addr0];
end
integer i;
always @(posedge clock1) begin
  for (i = 0; i < (16)/4; i = i + 1) begin
    if (in_mem_wenable1[i]) begin
      buffer[in_mem_addr1][i*4+:4] <= in_mem_wdata1[i*4+:4];
    end
  end
end

endmodule

module M_simulation_spram__frame0 (
in_addr,
in_data_in,
in_wmask,
in_wenable,
out_data_out,
out_clock,
clock
);
input  [13:0] in_addr;
input  [15:0] in_data_in;
input  [3:0] in_wmask;
input  [0:0] in_wenable;
output  [15:0] out_data_out;
output out_clock;
input clock;
assign out_clock = clock;
wire  [15:0] _w_mem_mem_rdata0;
reg  [13:0] _t_mem_addr0;
reg  [15:0] _t_mem_wenable1;
reg  [15:0] _t_mem_wdata1;
reg  [13:0] _t_mem_addr1;
reg  [15:0] _t_data_out;

assign out_data_out = _t_data_out;

M_simulation_spram__frame0_mem_mem __mem__mem(
.clock0(clock),
.clock1(clock),
.in_mem_addr0(_t_mem_addr0),
.in_mem_wenable1(_t_mem_wenable1),
.in_mem_wdata1(_t_mem_wdata1),
.in_mem_addr1(_t_mem_addr1),
.out_mem_rdata0(_w_mem_mem_rdata0)
);


`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_mem_addr0 = in_addr;
_t_mem_addr1 = in_addr;
_t_mem_wenable1 = {4{in_wenable}}&in_wmask;
_t_mem_wdata1 = in_data_in;
_t_data_out = _w_mem_mem_rdata0;
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


// SL 2019, MIT license
module M_simulation_spram__frame1_mem_mem(
input      [14-1:0]                in_mem_addr0,
output reg  [16-1:0]     out_mem_rdata0,
output reg  [16-1:0]     out_mem_rdata1,
input      [(16)/4-1:0]         in_mem_wenable1,
input      [16-1:0]                 in_mem_wdata1,
input      [14-1:0]                in_mem_addr1,
input      clock0,
input      clock1
);
reg  [16-1:0] buffer[16384-1:0];
always @(posedge clock0) begin
  out_mem_rdata0 <= buffer[in_mem_addr0];
end
integer i;
always @(posedge clock1) begin
  for (i = 0; i < (16)/4; i = i + 1) begin
    if (in_mem_wenable1[i]) begin
      buffer[in_mem_addr1][i*4+:4] <= in_mem_wdata1[i*4+:4];
    end
  end
end

endmodule

module M_simulation_spram__frame1 (
in_addr,
in_data_in,
in_wmask,
in_wenable,
out_data_out,
out_clock,
clock
);
input  [13:0] in_addr;
input  [15:0] in_data_in;
input  [3:0] in_wmask;
input  [0:0] in_wenable;
output  [15:0] out_data_out;
output out_clock;
input clock;
assign out_clock = clock;
wire  [15:0] _w_mem_mem_rdata0;
reg  [13:0] _t_mem_addr0;
reg  [15:0] _t_mem_wenable1;
reg  [15:0] _t_mem_wdata1;
reg  [13:0] _t_mem_addr1;
reg  [15:0] _t_data_out;

assign out_data_out = _t_data_out;

M_simulation_spram__frame1_mem_mem __mem__mem(
.clock0(clock),
.clock1(clock),
.in_mem_addr0(_t_mem_addr0),
.in_mem_wenable1(_t_mem_wenable1),
.in_mem_wdata1(_t_mem_wdata1),
.in_mem_addr1(_t_mem_addr1),
.out_mem_rdata0(_w_mem_mem_rdata0)
);


`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
// _always_pre
// __block_1
_t_mem_addr0 = in_addr;
_t_mem_addr1 = in_addr;
_t_mem_wenable1 = {4{in_wenable}}&in_wmask;
_t_mem_wdata1 = in_data_in;
_t_data_out = _w_mem_mem_rdata0;
// __block_2
// _always_post
end

always @(posedge clock) begin
end

endmodule


module M_div24__div0 (
in_inum,
in_iden,
out_ret,
in_run,
out_done,
reset,
out_clock,
clock
);
input signed [23:0] in_inum;
input signed [23:0] in_iden;
output signed [23:0] out_ret;
input in_run;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [24:0] _w_diff;
wire  [0:0] _w_inum_neg;
wire  [0:0] _w_iden_neg;
wire  [23:0] _w_num;
wire  [23:0] _w_den;

reg  [24:0] _d_ac;
reg  [24:0] _q_ac;
reg  [5:0] _d_i;
reg  [5:0] _q_i;
reg signed [23:0] _d_ret;
reg signed [23:0] _q_ret;
reg  [1:0] _d_index,_q_index = 3;
assign out_ret = _q_ret;
assign out_done = (_q_index == 3);


assign _w_diff = _q_ac-_w_den;
assign _w_inum_neg = in_inum[23+:1];
assign _w_iden_neg = in_iden[23+:1];
assign _w_num = _w_inum_neg ? -in_inum:in_inum;
assign _w_den = _w_iden_neg ? -in_iden:in_iden;

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
_d_ac = {{23{1'b0}},_w_num[23+:1]};
_d_ret = {_w_num[0+:23],1'b0};
_d_index = 1;
end
1: begin
// __while__block_1
if (_q_i!=24) begin
// __block_2
// __block_4
if (_w_diff[24+:1]==0) begin
// __block_5
// __block_7
_d_ac = {_w_diff[0+:23],_q_ret[23+:1]};
_d_ret = {_q_ret[0+:23],1'b1};
// __block_8
end else begin
// __block_6
// __block_9
_d_ac = {_q_ac[0+:23],_q_ret[23+:1]};
_d_ret = {_q_ret[0+:23],1'b0};
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
_d_ret = ((_w_inum_neg)^(_w_iden_neg)) ? -_q_ret:_q_ret;
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


module M_div24__div1 (
in_inum,
in_iden,
out_ret,
in_run,
out_done,
reset,
out_clock,
clock
);
input signed [23:0] in_inum;
input signed [23:0] in_iden;
output signed [23:0] out_ret;
input in_run;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [24:0] _w_diff;
wire  [0:0] _w_inum_neg;
wire  [0:0] _w_iden_neg;
wire  [23:0] _w_num;
wire  [23:0] _w_den;

reg  [24:0] _d_ac;
reg  [24:0] _q_ac;
reg  [5:0] _d_i;
reg  [5:0] _q_i;
reg signed [23:0] _d_ret;
reg signed [23:0] _q_ret;
reg  [1:0] _d_index,_q_index = 3;
assign out_ret = _q_ret;
assign out_done = (_q_index == 3);


assign _w_diff = _q_ac-_w_den;
assign _w_inum_neg = in_inum[23+:1];
assign _w_iden_neg = in_iden[23+:1];
assign _w_num = _w_inum_neg ? -in_inum:in_inum;
assign _w_den = _w_iden_neg ? -in_iden:in_iden;

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
_d_ac = {{23{1'b0}},_w_num[23+:1]};
_d_ret = {_w_num[0+:23],1'b0};
_d_index = 1;
end
1: begin
// __while__block_1
if (_q_i!=24) begin
// __block_2
// __block_4
if (_w_diff[24+:1]==0) begin
// __block_5
// __block_7
_d_ac = {_w_diff[0+:23],_q_ret[23+:1]};
_d_ret = {_q_ret[0+:23],1'b1};
// __block_8
end else begin
// __block_6
// __block_9
_d_ac = {_q_ac[0+:23],_q_ret[23+:1]};
_d_ret = {_q_ret[0+:23],1'b0};
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
_d_ret = ((_w_inum_neg)^(_w_iden_neg)) ? -_q_ret:_q_ret;
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


module M_div24__div2 (
in_inum,
in_iden,
out_ret,
in_run,
out_done,
reset,
out_clock,
clock
);
input signed [23:0] in_inum;
input signed [23:0] in_iden;
output signed [23:0] out_ret;
input in_run;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [24:0] _w_diff;
wire  [0:0] _w_inum_neg;
wire  [0:0] _w_iden_neg;
wire  [23:0] _w_num;
wire  [23:0] _w_den;

reg  [24:0] _d_ac;
reg  [24:0] _q_ac;
reg  [5:0] _d_i;
reg  [5:0] _q_i;
reg signed [23:0] _d_ret;
reg signed [23:0] _q_ret;
reg  [1:0] _d_index,_q_index = 3;
assign out_ret = _q_ret;
assign out_done = (_q_index == 3);


assign _w_diff = _q_ac-_w_den;
assign _w_inum_neg = in_inum[23+:1];
assign _w_iden_neg = in_iden[23+:1];
assign _w_num = _w_inum_neg ? -in_inum:in_inum;
assign _w_den = _w_iden_neg ? -in_iden:in_iden;

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
_d_ac = {{23{1'b0}},_w_num[23+:1]};
_d_ret = {_w_num[0+:23],1'b0};
_d_index = 1;
end
1: begin
// __while__block_1
if (_q_i!=24) begin
// __block_2
// __block_4
if (_w_diff[24+:1]==0) begin
// __block_5
// __block_7
_d_ac = {_w_diff[0+:23],_q_ret[23+:1]};
_d_ret = {_q_ret[0+:23],1'b1};
// __block_8
end else begin
// __block_6
// __block_9
_d_ac = {_q_ac[0+:23],_q_ret[23+:1]};
_d_ret = {_q_ret[0+:23],1'b0};
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
_d_ret = ((_w_inum_neg)^(_w_iden_neg)) ? -_q_ret:_q_ret;
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
wire  [13:0] _w_gpu_raster_sd_addr;
wire  [0:0] _w_gpu_raster_sd_rw;
wire  [31:0] _w_gpu_raster_sd_data_in;
wire  [0:0] _w_gpu_raster_sd_in_valid;
wire  [7:0] _w_gpu_raster_sd_wmask;
wire  [0:0] _w_gpu_raster_drawing;
wire signed [15:0] _w_gpu_trsf_tv_x;
wire signed [15:0] _w_gpu_trsf_tv_y;
wire signed [15:0] _w_gpu_trsf_tv_z;
wire  [31:0] _w_bram_ram_pram_data_out;
wire  [0:0] _w_bram_ram_pram_done;
wire  [31:0] _w_cpu_ram_addr;
wire  [0:0] _w_cpu_ram_rw;
wire  [3:0] _w_cpu_ram_wmask;
wire  [31:0] _w_cpu_ram_data_in;
wire  [0:0] _w_cpu_ram_in_valid;
wire  [25:0] _w_cpu_predicted_addr;
wire  [0:0] _w_cpu_predicted_correct;
wire  [0:0] _w_vga_driver_vga_hs;
wire  [0:0] _w_vga_driver_vga_vs;
wire  [0:0] _w_vga_driver_active;
wire  [0:0] _w_vga_driver_vblank;
wire  [9:0] _w_vga_driver_vga_x;
wire  [9:0] _w_vga_driver_vga_y;
wire  [15:0] _w_frame0_data_out;
wire  [15:0] _w_frame1_data_out;
wire signed [23:0] _w_div0_ret;
wire _w_div0_done;
wire signed [23:0] _w_div1_ret;
wire _w_div1_done;
wire signed [23:0] _w_div2_ret;
wire _w_div2_done;
wire  [0:0] _w_psclk_outv;
wire  [23:0] _w_mem_palette_rdata;
wire  [31:0] _c_sd_data_out;
wire signed [15:0] _c_v0_z;
wire signed [15:0] _c_v1_z;
wire signed [15:0] _c_v2_z;
wire  [25:0] _c_cpu_start_addr;
assign _c_cpu_start_addr = 26'h0020000;
wire  [0:0] _c_reg_miso;
assign _c_reg_miso = 0;
wire  [31:0] _c_iter;
assign _c_iter = 0;
reg  [0:0] _t_sd_done;
reg  [13:0] _t_fb0_addr;
reg  [15:0] _t_fb0_data_in;
reg  [0:0] _t_fb0_wenable;
reg  [7:0] _t_fb0_wmask;
reg  [13:0] _t_fb1_addr;
reg  [15:0] _t_fb1_data_in;
reg  [0:0] _t_fb1_wenable;
reg  [7:0] _t_fb1_wmask;
reg  [0:0] _t_palette_wenable;
reg  [23:0] _t_palette_wdata;
reg  [3:0] _t_palette_addr;
reg  [5:0] _t_video_r;
reg  [5:0] _t_video_g;
reg  [5:0] _t_video_b;
wire  [13:0] _w_pix_fetch;
wire  [0:0] _w_pix_wok;

reg signed [15:0] _d_v0_x;
reg signed [15:0] _q_v0_x;
reg signed [15:0] _d_v0_y;
reg signed [15:0] _q_v0_y;
reg signed [15:0] _d_v1_x;
reg signed [15:0] _q_v1_x;
reg signed [15:0] _d_v1_y;
reg signed [15:0] _q_v1_y;
reg signed [15:0] _d_v2_x;
reg signed [15:0] _q_v2_x;
reg signed [15:0] _d_v2_y;
reg signed [15:0] _q_v2_y;
reg signed [23:0] _d_ei0;
reg signed [23:0] _q_ei0;
reg signed [23:0] _d_ei1;
reg signed [23:0] _q_ei1;
reg signed [23:0] _d_ei2;
reg signed [23:0] _q_ei2;
reg  [9:0] _d_ystart;
reg  [9:0] _q_ystart;
reg  [9:0] _d_ystop;
reg  [9:0] _q_ystop;
reg  [7:0] _d_color;
reg  [7:0] _q_color;
reg  [0:0] _d_triangle_in = 0;
reg  [0:0] _q_triangle_in = 0;
reg  [0:0] _d_fbuffer = 0;
reg  [0:0] _q_fbuffer = 0;
reg signed [7:0] _d_mx_m00;
reg signed [7:0] _q_mx_m00;
reg signed [7:0] _d_mx_m01;
reg signed [7:0] _q_mx_m01;
reg signed [7:0] _d_mx_m02;
reg signed [7:0] _q_mx_m02;
reg signed [7:0] _d_mx_m10;
reg signed [7:0] _q_mx_m10;
reg signed [7:0] _d_mx_m11;
reg signed [7:0] _q_mx_m11;
reg signed [7:0] _d_mx_m12;
reg signed [7:0] _q_mx_m12;
reg signed [7:0] _d_mx_m20;
reg signed [7:0] _q_mx_m20;
reg signed [7:0] _d_mx_m21;
reg signed [7:0] _q_mx_m21;
reg signed [7:0] _d_mx_m22;
reg signed [7:0] _q_mx_m22;
reg signed [15:0] _d_mx_tx;
reg signed [15:0] _q_mx_tx;
reg signed [15:0] _d_mx_ty;
reg signed [15:0] _q_mx_ty;
reg signed [15:0] _d_v_x;
reg signed [15:0] _q_v_x;
reg signed [15:0] _d_v_y;
reg signed [15:0] _q_v_y;
reg signed [15:0] _d_v_z;
reg signed [15:0] _q_v_z;
reg  [3:0] _d_do_transform = 0;
reg  [3:0] _q_do_transform = 0;
reg  [31:0] _d_user_data = 0;
reg  [31:0] _q_user_data = 0;
reg  [0:0] _d_bram_override_we = 0;
reg  [0:0] _q_bram_override_we = 0;
reg  [12:0] _d_bram_override_addr = 0;
reg  [12:0] _q_bram_override_addr = 0;
reg  [31:0] _d_bram_override_data;
reg  [31:0] _q_bram_override_data;
reg  [0:0] _d_cpu_reset;
reg  [0:0] _q_cpu_reset;
reg  [13:0] _d_pix_waddr = 0;
reg  [13:0] _q_pix_waddr = 0;
reg  [31:0] _d_pix_data = 0;
reg  [31:0] _q_pix_data = 0;
reg  [0:0] _d_pix_write = 0;
reg  [0:0] _q_pix_write = 0;
reg  [7:0] _d_pix_mask = 0;
reg  [7:0] _q_pix_mask = 0;
reg  [15:0] _d_frame_fetch_sync = 16'b1;
reg  [15:0] _q_frame_fetch_sync = 16'b1;
reg  [1:0] _d_next_pixel = 2'b1;
reg  [1:0] _q_next_pixel = 2'b1;
reg  [31:0] _d_eight_pixs = 0;
reg  [31:0] _q_eight_pixs = 0;
reg signed [23:0] _d_div0_n = 0;
reg signed [23:0] _q_div0_n = 0;
reg signed [23:0] _d_div0_d = 0;
reg signed [23:0] _q_div0_d = 0;
reg signed [23:0] _d_div1_n = 0;
reg signed [23:0] _q_div1_n = 0;
reg signed [23:0] _d_div1_d = 0;
reg signed [23:0] _q_div1_d = 0;
reg signed [23:0] _d_div2_n = 0;
reg signed [23:0] _q_div2_n = 0;
reg signed [23:0] _d_div2_d = 0;
reg signed [23:0] _q_div2_d = 0;
reg  [0:0] _d_do_div0 = 0;
reg  [0:0] _q_do_div0 = 0;
reg  [0:0] _d_do_div1 = 0;
reg  [0:0] _q_do_div1 = 0;
reg  [0:0] _d_do_div2 = 0;
reg  [0:0] _q_do_div2 = 0;
reg  [7:0] _d_leds;
reg  [7:0] _q_leds;
reg  [1:0] _d_index,_q_index = 3;
reg  _autorun = 0;
reg  _div0_run = 0;
reg  _div1_run = 0;
reg  _div2_run = 0;
assign out_leds = _q_leds;
assign out_video_r = _t_video_r;
assign out_video_g = _t_video_g;
assign out_video_b = _t_video_b;
assign out_video_hs = _w_vga_driver_vga_hs;
assign out_video_vs = _w_vga_driver_vga_vs;
assign out_video_clock = _w_psclk_outv;
assign out_done = (_q_index == 3) & _autorun;
M_flame_rasterizer__gpu_raster gpu_raster (
.in_sd_data_out(_c_sd_data_out),
.in_sd_done(_t_sd_done),
.in_fbuffer(_q_fbuffer),
.in_v0_x(_q_v0_x),
.in_v0_y(_q_v0_y),
.in_v0_z(_c_v0_z),
.in_v1_x(_q_v1_x),
.in_v1_y(_q_v1_y),
.in_v1_z(_c_v1_z),
.in_v2_x(_q_v2_x),
.in_v2_y(_q_v2_y),
.in_v2_z(_c_v2_z),
.in_ei0(_q_ei0),
.in_ei1(_q_ei1),
.in_ei2(_q_ei2),
.in_ystart(_q_ystart),
.in_ystop(_q_ystop),
.in_color(_q_color),
.in_triangle_in(_q_triangle_in),
.out_sd_addr(_w_gpu_raster_sd_addr),
.out_sd_rw(_w_gpu_raster_sd_rw),
.out_sd_data_in(_w_gpu_raster_sd_data_in),
.out_sd_in_valid(_w_gpu_raster_sd_in_valid),
.out_sd_wmask(_w_gpu_raster_sd_wmask),
.out_drawing(_w_gpu_raster_drawing),
.reset(reset),
.clock(clock));
M_flame_transform__gpu_trsf gpu_trsf (
.in_t_m00(_q_mx_m00),
.in_t_m12(_q_mx_m12),
.in_t_m01(_q_mx_m01),
.in_t_ty(_q_mx_ty),
.in_t_m11(_q_mx_m11),
.in_t_m02(_q_mx_m02),
.in_t_tx(_q_mx_tx),
.in_t_m10(_q_mx_m10),
.in_t_m20(_q_mx_m20),
.in_t_m21(_q_mx_m21),
.in_t_m22(_q_mx_m22),
.in_v_x(_q_v_x),
.in_v_y(_q_v_y),
.in_v_z(_q_v_z),
.out_tv_x(_w_gpu_trsf_tv_x),
.out_tv_y(_w_gpu_trsf_tv_y),
.out_tv_z(_w_gpu_trsf_tv_z),
.reset(reset),
.clock(clock));
M_bram_segment_spram_32bits__bram_ram bram_ram (
.in_pram_addr(_w_cpu_ram_addr),
.in_pram_rw(_w_cpu_ram_rw),
.in_pram_wmask(_w_cpu_ram_wmask),
.in_pram_data_in(_w_cpu_ram_data_in),
.in_pram_in_valid(_w_cpu_ram_in_valid),
.in_predicted_addr(_w_cpu_predicted_addr),
.in_predicted_correct(_w_cpu_predicted_correct),
.in_bram_override_we(_d_bram_override_we),
.in_bram_override_addr(_d_bram_override_addr),
.in_bram_override_data(_d_bram_override_data),
.out_pram_data_out(_w_bram_ram_pram_data_out),
.out_pram_done(_w_bram_ram_pram_done),
.reset(reset),
.clock(clock));
M_rv32i_cpu__cpu cpu (
.in_boot_at(_c_cpu_start_addr),
.in_user_data(_d_user_data),
.in_ram_data_out(_w_bram_ram_pram_data_out),
.in_ram_done(_w_bram_ram_pram_done),
.out_ram_addr(_w_cpu_ram_addr),
.out_ram_rw(_w_cpu_ram_rw),
.out_ram_wmask(_w_cpu_ram_wmask),
.out_ram_data_in(_w_cpu_ram_data_in),
.out_ram_in_valid(_w_cpu_ram_in_valid),
.out_predicted_addr(_w_cpu_predicted_addr),
.out_predicted_correct(_w_cpu_predicted_correct),
.reset(_q_cpu_reset),
.clock(clock));
M_vga__vga_driver vga_driver (
.out_vga_hs(_w_vga_driver_vga_hs),
.out_vga_vs(_w_vga_driver_vga_vs),
.out_active(_w_vga_driver_active),
.out_vblank(_w_vga_driver_vblank),
.out_vga_x(_w_vga_driver_vga_x),
.out_vga_y(_w_vga_driver_vga_y),
.reset(reset),
.clock(clock));
M_simulation_spram__frame0 frame0 (
.in_addr(_t_fb0_addr),
.in_data_in(_t_fb0_data_in),
.in_wmask(_t_fb0_wmask),
.in_wenable(_t_fb0_wenable),
.out_data_out(_w_frame0_data_out),
.clock(clock));
M_simulation_spram__frame1 frame1 (
.in_addr(_t_fb1_addr),
.in_data_in(_t_fb1_data_in),
.in_wmask(_t_fb1_wmask),
.in_wenable(_t_fb1_wenable),
.out_data_out(_w_frame1_data_out),
.clock(clock));
M_div24__div0 div0 (
.in_inum(_q_div0_n),
.in_iden(_q_div0_d),
.out_ret(_w_div0_ret),
.out_done(_w_div0_done),
.in_run(_div0_run),
.reset(reset),
.clock(clock));
M_div24__div1 div1 (
.in_inum(_q_div1_n),
.in_iden(_q_div1_d),
.out_ret(_w_div1_ret),
.out_done(_w_div1_done),
.in_run(_div1_run),
.reset(reset),
.clock(clock));
M_div24__div2 div2 (
.in_inum(_q_div2_n),
.in_iden(_q_div2_d),
.out_ret(_w_div2_ret),
.out_done(_w_div2_done),
.in_run(_div2_run),
.reset(reset),
.clock(clock));
passthrough psclk (
.inv(clock),
.outv(_w_psclk_outv));

M_main__mem_palette __mem__palette(
.clock(clock),
.in_palette_wenable(_t_palette_wenable),
.in_palette_wdata(_t_palette_wdata),
.in_palette_addr(_t_palette_addr),
.out_palette_rdata(_w_mem_palette_rdata)
);

assign _w_pix_fetch = (_w_vga_driver_vga_y[1+:9]<<5)+(_w_vga_driver_vga_y[1+:9]<<3)+_w_vga_driver_vga_x[4+:6]+(_q_fbuffer ? 0:8000);
assign _w_pix_wok = (~_q_frame_fetch_sync[1+:1]&_q_pix_write);

`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (out_done));
`endif
always @* begin
_d_v0_x = _q_v0_x;
_d_v0_y = _q_v0_y;
_d_v1_x = _q_v1_x;
_d_v1_y = _q_v1_y;
_d_v2_x = _q_v2_x;
_d_v2_y = _q_v2_y;
_d_ei0 = _q_ei0;
_d_ei1 = _q_ei1;
_d_ei2 = _q_ei2;
_d_ystart = _q_ystart;
_d_ystop = _q_ystop;
_d_color = _q_color;
_d_triangle_in = _q_triangle_in;
_d_fbuffer = _q_fbuffer;
_d_mx_m00 = _q_mx_m00;
_d_mx_m01 = _q_mx_m01;
_d_mx_m02 = _q_mx_m02;
_d_mx_m10 = _q_mx_m10;
_d_mx_m11 = _q_mx_m11;
_d_mx_m12 = _q_mx_m12;
_d_mx_m20 = _q_mx_m20;
_d_mx_m21 = _q_mx_m21;
_d_mx_m22 = _q_mx_m22;
_d_mx_tx = _q_mx_tx;
_d_mx_ty = _q_mx_ty;
_d_v_x = _q_v_x;
_d_v_y = _q_v_y;
_d_v_z = _q_v_z;
_d_do_transform = _q_do_transform;
_d_user_data = _q_user_data;
_d_bram_override_we = _q_bram_override_we;
_d_bram_override_addr = _q_bram_override_addr;
_d_bram_override_data = _q_bram_override_data;
_d_cpu_reset = _q_cpu_reset;
_d_pix_waddr = _q_pix_waddr;
_d_pix_data = _q_pix_data;
_d_pix_write = _q_pix_write;
_d_pix_mask = _q_pix_mask;
_d_frame_fetch_sync = _q_frame_fetch_sync;
_d_next_pixel = _q_next_pixel;
_d_eight_pixs = _q_eight_pixs;
_d_div0_n = _q_div0_n;
_d_div0_d = _q_div0_d;
_d_div1_n = _q_div1_n;
_d_div1_d = _q_div1_d;
_d_div2_n = _q_div2_n;
_d_div2_d = _q_div2_d;
_d_do_div0 = _q_do_div0;
_d_do_div1 = _q_do_div1;
_d_do_div2 = _q_do_div2;
_d_leds = _q_leds;
_d_index = _q_index;
_div0_run = 1;
_div1_run = 1;
_div2_run = 1;
_t_palette_wenable = 0;
_t_palette_wdata = 0;
// _always_pre
_t_video_r = (_w_vga_driver_active) ? _w_mem_palette_rdata[2+:6]:0;
_t_video_g = (_w_vga_driver_active) ? _w_mem_palette_rdata[10+:6]:0;
_t_video_b = (_w_vga_driver_active) ? _w_mem_palette_rdata[18+:6]:0;
_t_palette_addr = _q_eight_pixs[0+:4];
_t_fb0_addr = ~_w_pix_wok ? _w_pix_fetch:_q_pix_waddr;
_t_fb0_data_in = _q_pix_data[0+:16];
_t_fb0_wenable = _w_pix_wok;
_t_fb0_wmask = {_q_pix_mask[3+:1],_q_pix_mask[2+:1],_q_pix_mask[1+:1],_q_pix_mask[0+:1]};
_t_fb1_addr = ~_w_pix_wok ? _w_pix_fetch:_q_pix_waddr;
_t_fb1_data_in = _q_pix_data[16+:16];
_t_fb1_wenable = _w_pix_wok;
_t_fb1_wmask = {_q_pix_mask[7+:1],_q_pix_mask[6+:1],_q_pix_mask[5+:1],_q_pix_mask[4+:1]};
_t_sd_done = _w_pix_wok;
_d_pix_write = _w_pix_wok ? 0:_q_pix_write;
_d_triangle_in = 0;
// __block_1
_d_eight_pixs = _q_frame_fetch_sync[0+:1] ? {_w_frame1_data_out,_w_frame0_data_out}:(_q_next_pixel[0+:1] ? (_q_eight_pixs>>4):_q_eight_pixs);
// __block_2
(* full_case *)
case (_q_index)
0: begin
// _top
_d_index = 1;
end
1: begin
// __while__block_5
if (1) begin
// __block_6
// __block_8
_d_cpu_reset = 0;
_d_user_data[0+:5] = {_q_do_div0|_q_do_div1|_q_do_div2,_c_reg_miso,_d_pix_write,_w_vga_driver_vblank,_w_gpu_raster_drawing};
if (_w_gpu_raster_sd_in_valid) begin
// __block_9
// __block_11
_d_pix_waddr = _w_gpu_raster_sd_addr;
_d_pix_mask = _w_gpu_raster_sd_wmask;
_d_pix_data = _w_gpu_raster_sd_data_in;
_d_pix_write = 1;
// __block_12
end else begin
// __block_10
end
// __block_13
if (_q_do_transform[0+:1]) begin
// __block_14
// __block_16
$display("transform done, write back %d,%d,%d at @%h  (%h)",_w_gpu_trsf_tv_x,_w_gpu_trsf_tv_y,_w_gpu_trsf_tv_z,_q_bram_override_addr,{2'b00,_w_gpu_trsf_tv_z,_w_gpu_trsf_tv_y,_w_gpu_trsf_tv_x});
_d_bram_override_we = 1;
_d_bram_override_data = {2'b00,_w_gpu_trsf_tv_z[6+:10],_w_gpu_trsf_tv_y[6+:10],_w_gpu_trsf_tv_x[6+:10]};
_d_do_transform = 0;
// __block_17
end else begin
// __block_15
// __block_18
_d_bram_override_we = 0;
_d_do_transform = _q_do_transform>>1;
// __block_19
end
// __block_20
if (_q_do_div0&(_w_div0_done)) begin
// __block_21
// __block_23
_d_bram_override_we = 1;
_d_bram_override_data = {{8{_w_div0_ret[23+:1]}},_w_div0_ret};
$display("(cycle %d) div0 done %d / %d = %d",_c_iter,_q_div0_n,_q_div0_d,_w_div0_ret);
_d_do_div0 = 0;
// __block_24
end else begin
// __block_22
end
// __block_25
if (_q_do_div1&(_w_div1_done)) begin
// __block_26
// __block_28
_d_bram_override_we = 1;
_d_bram_override_data = {{8{_w_div1_ret[23+:1]}},_w_div1_ret};
$display("(cycle %d) div1 done %d / %d = %d",_c_iter,_q_div1_n,_q_div1_d,_w_div1_ret);
_d_do_div1 = 0;
// __block_29
end else begin
// __block_27
end
// __block_30
if (_q_do_div2&(_w_div2_done)) begin
// __block_31
// __block_33
_d_bram_override_we = 1;
_d_bram_override_data = {{8{_w_div2_ret[23+:1]}},_w_div2_ret};
$display("(cycle %d) div2 done %d / %d = %d",_c_iter,_q_div2_n,_q_div2_d,_w_div2_ret);
_d_do_div2 = 0;
// __block_34
end else begin
// __block_32
end
// __block_35
if (_d_bram_override_we) begin
// __block_36
// __block_38
_d_bram_override_addr = _q_bram_override_addr+1;
// __block_39
end else begin
// __block_37
end
// __block_40
if (_w_cpu_ram_in_valid&_w_cpu_ram_rw) begin
// __block_41
// __block_43
  case (_w_cpu_ram_addr[27+:4])
  4'b1000: begin
// __block_45_case
// __block_46
// __block_47
  end
  4'b0010: begin
// __block_48_case
// __block_49
  case (_w_cpu_ram_addr[2+:2])
  2'b00: begin
// __block_51_case
// __block_52
$display("LEDs = %h",_w_cpu_ram_data_in[0+:8]);
_d_leds = _w_cpu_ram_data_in[0+:8];
// __block_53
  end
  2'b01: begin
// __block_54_case
// __block_55
$display("swap buffers");
_d_fbuffer = ~_q_fbuffer;
// __block_56
  end
  2'b10: begin
// __block_57_case
// __block_58
$display("(cycle %d) SPIFLASH %b",_c_iter,_w_cpu_ram_data_in[0+:3]);
// __block_59
  end
  2'b11: begin
// __block_60_case
// __block_61
_d_pix_waddr = _w_cpu_ram_addr[4+:14];
_d_pix_mask = _w_cpu_ram_addr[18+:8];
_d_pix_data = _w_cpu_ram_data_in;
_d_pix_write = 1;
// __block_62
  end
  default: begin
// __block_63_case
// __block_64
// __block_65
  end
endcase
// __block_50
// __block_66
  end
  4'b0001: begin
// __block_67_case
// __block_68
  case (_w_cpu_ram_addr[2+:4])
  0: begin
// __block_70_case
// __block_71
_d_v0_x = _w_cpu_ram_data_in[0+:10];
_d_v0_y = _w_cpu_ram_data_in[10+:10];
// __block_72
  end
  1: begin
// __block_73_case
// __block_74
_d_v1_x = _w_cpu_ram_data_in[0+:10];
_d_v1_y = _w_cpu_ram_data_in[10+:10];
// __block_75
  end
  2: begin
// __block_76_case
// __block_77
_d_v2_x = _w_cpu_ram_data_in[0+:10];
_d_v2_y = _w_cpu_ram_data_in[10+:10];
// __block_78
  end
  3: begin
// __block_79_case
// __block_80
_d_ei0 = _w_cpu_ram_data_in;
_d_color = _w_cpu_ram_data_in[24+:8];
// __block_81
  end
  4: begin
// __block_82_case
// __block_83
_d_ei1 = _w_cpu_ram_data_in;
// __block_84
  end
  5: begin
// __block_85_case
// __block_86
_d_ei2 = _w_cpu_ram_data_in;
_d_ystart = _q_v0_y;
_d_ystop = _q_v2_y;
_d_triangle_in = 1;
$display("(cycle %d) new triangle, color %d, (%d,%d) (%d,%d) (%d,%d)",_c_iter,_q_color,_q_v0_x,_q_v0_y,_q_v1_x,_q_v1_y,_q_v2_x,_q_v2_y);
// __block_87
  end
  7: begin
// __block_88_case
// __block_89
_d_mx_m00 = _w_cpu_ram_data_in[0+:8];
_d_mx_m01 = _w_cpu_ram_data_in[8+:8];
_d_mx_m02 = _w_cpu_ram_data_in[16+:8];
// __block_90
  end
  8: begin
// __block_91_case
// __block_92
_d_mx_m10 = _w_cpu_ram_data_in[0+:8];
_d_mx_m11 = _w_cpu_ram_data_in[8+:8];
_d_mx_m12 = _w_cpu_ram_data_in[16+:8];
// __block_93
  end
  9: begin
// __block_94_case
// __block_95
_d_mx_m20 = _w_cpu_ram_data_in[0+:8];
_d_mx_m21 = _w_cpu_ram_data_in[8+:8];
_d_mx_m22 = _w_cpu_ram_data_in[16+:8];
// __block_96
  end
  10: begin
// __block_97_case
// __block_98
_d_mx_tx = _w_cpu_ram_data_in[0+:16];
_d_mx_ty = _w_cpu_ram_data_in[16+:16];
// __block_99
  end
  11: begin
// __block_100_case
// __block_101
_d_bram_override_addr = _w_cpu_ram_data_in;
// __block_102
  end
  12: begin
// __block_103_case
// __block_104
_d_v_x = _w_cpu_ram_data_in[0+:16];
_d_v_y = _w_cpu_ram_data_in[16+:16];
// __block_105
  end
  13: begin
// __block_106_case
// __block_107
_d_v_z = _w_cpu_ram_data_in[0+:16];
_d_do_transform = 4'b1000;
$display("(cycle %d) transform %d,%d,%d",_c_iter,_q_v_x,_q_v_y,_d_v_z);
$display("mx %d,%d,%d",_q_mx_m00,_q_mx_m01,_q_mx_m02);
$display("mx %d,%d,%d",_q_mx_m10,_q_mx_m11,_q_mx_m12);
$display("mx %d,%d,%d",_q_mx_m20,_q_mx_m21,_q_mx_m22);
// __block_108
  end
  14: begin
// __block_109_case
// __block_110
_d_div0_n = _w_cpu_ram_data_in[0+:16]<<<10;
_d_div0_d = {{16{_w_cpu_ram_data_in[31+:1]}},_w_cpu_ram_data_in[16+:16]};
$display("(cycle %d) div0 %d / %d",_c_iter,_d_div0_n,_d_div0_d);
_d_do_div0 = 1;
_div0_run = 0;
// __block_111
  end
  15: begin
// __block_112_case
// __block_113
_d_div1_n = _w_cpu_ram_data_in[0+:16]<<<10;
_d_div1_d = {{16{_w_cpu_ram_data_in[31+:1]}},_w_cpu_ram_data_in[16+:16]};
$display("(cycle %d) div1 %d / %d",_c_iter,_d_div1_n,_d_div1_d);
_d_do_div1 = 1;
_div1_run = 0;
// __block_114
  end
  6: begin
// __block_115_case
// __block_116
_d_div2_n = _w_cpu_ram_data_in[0+:16]<<<10;
_d_div2_d = {{16{_w_cpu_ram_data_in[31+:1]}},_w_cpu_ram_data_in[16+:16]};
$display("(cycle %d) div2 %d / %d",_c_iter,_d_div2_n,_d_div2_d);
_d_do_div2 = 1;
_div2_run = 0;
// __block_117
  end
  default: begin
// __block_118_case
// __block_119
// __block_120
  end
endcase
// __block_69
// __block_121
  end
  default: begin
// __block_122_case
// __block_123
// __block_124
  end
endcase
// __block_44
// __block_125
end else begin
// __block_42
end
// __block_126
// __block_127
_d_index = 1;
end else begin
_d_index = 2;
end
end
2: begin
// __block_7
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
// __block_3
_d_frame_fetch_sync = {_q_frame_fetch_sync[0+:1],_q_frame_fetch_sync[1+:15]};
_d_next_pixel = {_q_next_pixel[0+:1],_q_next_pixel[1+:1]};
// __block_4
end

always @(posedge clock) begin
_q_v0_x <= _d_v0_x;
_q_v0_y <= _d_v0_y;
_q_v1_x <= _d_v1_x;
_q_v1_y <= _d_v1_y;
_q_v2_x <= _d_v2_x;
_q_v2_y <= _d_v2_y;
_q_ei0 <= _d_ei0;
_q_ei1 <= _d_ei1;
_q_ei2 <= _d_ei2;
_q_ystart <= _d_ystart;
_q_ystop <= _d_ystop;
_q_color <= _d_color;
_q_triangle_in <= _d_triangle_in;
_q_fbuffer <= _d_fbuffer;
_q_mx_m00 <= (reset) ? 127 : _d_mx_m00;
_q_mx_m01 <= (reset) ? 0 : _d_mx_m01;
_q_mx_m02 <= (reset) ? 0 : _d_mx_m02;
_q_mx_m10 <= (reset) ? 0 : _d_mx_m10;
_q_mx_m11 <= (reset) ? 127 : _d_mx_m11;
_q_mx_m12 <= (reset) ? 0 : _d_mx_m12;
_q_mx_m20 <= (reset) ? 0 : _d_mx_m20;
_q_mx_m21 <= (reset) ? 0 : _d_mx_m21;
_q_mx_m22 <= (reset) ? 127 : _d_mx_m22;
_q_mx_tx <= (reset) ? 0 : _d_mx_tx;
_q_mx_ty <= (reset) ? 0 : _d_mx_ty;
_q_v_x <= _d_v_x;
_q_v_y <= _d_v_y;
_q_v_z <= _d_v_z;
_q_do_transform <= _d_do_transform;
_q_user_data <= _d_user_data;
_q_bram_override_we <= _d_bram_override_we;
_q_bram_override_addr <= _d_bram_override_addr;
_q_bram_override_data <= _d_bram_override_data;
_q_cpu_reset <= (reset) ? 1 : _d_cpu_reset;
_q_pix_waddr <= _d_pix_waddr;
_q_pix_data <= _d_pix_data;
_q_pix_write <= _d_pix_write;
_q_pix_mask <= _d_pix_mask;
_q_frame_fetch_sync <= _d_frame_fetch_sync;
_q_next_pixel <= _d_next_pixel;
_q_eight_pixs <= _d_eight_pixs;
_q_div0_n <= _d_div0_n;
_q_div0_d <= _d_div0_d;
_q_div1_n <= _d_div1_n;
_q_div1_d <= _d_div1_d;
_q_div2_n <= _d_div2_n;
_q_div2_d <= _d_div2_d;
_q_do_div0 <= _d_do_div0;
_q_do_div1 <= _d_do_div1;
_q_do_div2 <= _d_do_div2;
_q_leds <= _d_leds;
_q_index <= reset ? 3 : ( ~_autorun ? 0 : _d_index);
_autorun <= reset ? 0 : 1;
end

endmodule

