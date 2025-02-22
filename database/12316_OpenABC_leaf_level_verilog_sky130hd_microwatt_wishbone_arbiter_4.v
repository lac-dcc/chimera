// This program was cloned from: https://github.com/NYU-MLDA/OpenABC
// License: BSD 3-Clause "New" or "Revised" License

module wishbone_arbiter_4(clk, rst, wb_masters_in, \wb_slave_in.dat , \wb_slave_in.ack , \wb_slave_in.stall , wb_masters_out, \wb_slave_out.adr , \wb_slave_out.dat , \wb_slave_out.sel , \wb_slave_out.cyc , \wb_slave_out.stb , \wb_slave_out.we );
  wire [103:0] _00_;
  wire [103:0] _01_;
  wire [103:0] _02_;
  wire [103:0] _03_;
  wire [1:0] _04_;
  wire _05_;
  wire [1:0] _06_;
  wire [1:0] _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire [1:0] _24_;
  wire [1:0] _25_;
  wire [1:0] _26_;
  wire [1:0] _27_;
  wire _28_;
  wire [1:0] _29_;
  wire [1:0] _30_;
  reg [1:0] _31_;
  wire [103:0] _32_;
  wire [103:0] _33_;
  wire busy;
  wire [1:0] candidate;
  input clk;
  wire clk;
  input rst;
  wire rst;
  wire [1:0] selected;
  input [415:0] wb_masters_in;
  wire [415:0] wb_masters_in;
  output [263:0] wb_masters_out;
  wire [263:0] wb_masters_out;
  input \wb_slave_in.ack ;
  wire \wb_slave_in.ack ;
  input [63:0] \wb_slave_in.dat ;
  wire [63:0] \wb_slave_in.dat ;
  input \wb_slave_in.stall ;
  wire \wb_slave_in.stall ;
  output [28:0] \wb_slave_out.adr ;
  wire [28:0] \wb_slave_out.adr ;
  output \wb_slave_out.cyc ;
  wire \wb_slave_out.cyc ;
  output [63:0] \wb_slave_out.dat ;
  wire [63:0] \wb_slave_out.dat ;
  output [7:0] \wb_slave_out.sel ;
  wire [7:0] \wb_slave_out.sel ;
  output \wb_slave_out.stb ;
  wire \wb_slave_out.stb ;
  output \wb_slave_out.we ;
  wire \wb_slave_out.we ;
  assign _00_ = _04_[0] ? wb_masters_in[207:104] : wb_masters_in[103:0];
  assign _01_ = _07_[0] ? wb_masters_in[207:104] : wb_masters_in[103:0];
  assign _02_ = _04_[0] ? wb_masters_in[415:312] : wb_masters_in[311:208];
  assign _03_ = _07_[0] ? wb_masters_in[415:312] : wb_masters_in[311:208];
  assign _32_ = _04_[1] ? _02_ : _00_;
  assign _33_ = _07_[1] ? _03_ : _01_;
  assign _04_ = 2'h3 - selected;
  assign _05_ = ~ busy;
  assign _06_ = _05_ ? candidate : selected;
  assign _07_ = 2'h3 - _06_;
  assign _08_ = { 30'h00000000, _06_ } == 32'd0;
  assign _09_ = _08_ ? \wb_slave_in.ack  : 1'h0;
  assign _10_ = { 30'h00000000, _06_ } == 32'd0;
  assign _11_ = _10_ ? \wb_slave_in.stall  : 1'h1;
  assign _12_ = { 30'h00000000, _06_ } == 32'd1;
  assign _13_ = _12_ ? \wb_slave_in.ack  : 1'h0;
  assign _14_ = { 30'h00000000, _06_ } == 32'd1;
  assign _15_ = _14_ ? \wb_slave_in.stall  : 1'h1;
  assign _16_ = { 30'h00000000, _06_ } == 32'd2;
  assign _17_ = _16_ ? \wb_slave_in.ack  : 1'h0;
  assign _18_ = { 30'h00000000, _06_ } == 32'd2;
  assign _19_ = _18_ ? \wb_slave_in.stall  : 1'h1;
  assign _20_ = { 30'h00000000, _06_ } == 32'd3;
  assign _21_ = _20_ ? \wb_slave_in.ack  : 1'h0;
  assign _22_ = { 30'h00000000, _06_ } == 32'd3;
  assign _23_ = _22_ ? \wb_slave_in.stall  : 1'h1;
  assign _24_ = wb_masters_in[101] ? 2'h3 : selected;
  assign _25_ = wb_masters_in[205] ? 2'h2 : _24_;
  assign _26_ = wb_masters_in[309] ? 2'h1 : _25_;
  assign _27_ = wb_masters_in[413] ? 2'h0 : _26_;
  assign _28_ = ~ busy;
  assign _29_ = _28_ ? candidate : selected;
  assign _30_ = rst ? 2'h0 : _29_;
  always @(posedge clk)
    _31_ <= _30_;
  assign candidate = _27_;
  assign selected = _31_;
  assign busy = _32_[101];
  assign wb_masters_out = { _11_, _09_, \wb_slave_in.dat , _15_, _13_, \wb_slave_in.dat , _19_, _17_, \wb_slave_in.dat , _23_, _21_, \wb_slave_in.dat  };
  assign \wb_slave_out.adr  = _33_[28:0];
  assign \wb_slave_out.dat  = _33_[92:29];
  assign \wb_slave_out.sel  = _33_[100:93];
  assign \wb_slave_out.cyc  = _33_[101];
  assign \wb_slave_out.stb  = _33_[102];
  assign \wb_slave_out.we  = _33_[103];
endmodule