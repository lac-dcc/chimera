// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

// Keep I/O fixed for TinyTapeout
module user_module_341457494561784402(
    input  wire [7:0] io_in,
    output wire [7:0] io_out
);
    ChiselWrapper chiselwrapper(
        .io_in(io_in),
        .io_out(io_out),
    );

endmodule


module DisplayDriver(
  input  [3:0] io_in,
  input        io_dot,
  output [7:0] io_out
);
  wire [6:0] _display_T_1 = 4'h0 == io_in ? 7'h3f : 7'h0; // @[Mux.scala 81:58]
  wire [6:0] _display_T_3 = 4'h1 == io_in ? 7'h6 : _display_T_1; // @[Mux.scala 81:58]
  wire [6:0] _display_T_5 = 4'h2 == io_in ? 7'h5b : _display_T_3; // @[Mux.scala 81:58]
  wire [6:0] _display_T_7 = 4'h3 == io_in ? 7'h4f : _display_T_5; // @[Mux.scala 81:58]
  wire [6:0] _display_T_9 = 4'h4 == io_in ? 7'h6e : _display_T_7; // @[Mux.scala 81:58]
  wire [6:0] _display_T_11 = 4'h5 == io_in ? 7'h6d : _display_T_9; // @[Mux.scala 81:58]
  wire [6:0] _display_T_13 = 4'h6 == io_in ? 7'h7d : _display_T_11; // @[Mux.scala 81:58]
  wire [6:0] _display_T_15 = 4'h7 == io_in ? 7'h7 : _display_T_13; // @[Mux.scala 81:58]
  wire [6:0] _display_T_17 = 4'h8 == io_in ? 7'h7f : _display_T_15; // @[Mux.scala 81:58]
  wire [6:0] display = 4'h9 == io_in ? 7'h6f : _display_T_17; // @[Mux.scala 81:58]
  assign io_out = {io_dot,display}; // @[Cat.scala 31:58]
endmodule
module GCD(
  input        clock,
  input  [3:0] io_value1,
  input  [3:0] io_value2,
  input        io_loadingValues,
  output [3:0] io_outputGCD,
  output       io_outputValid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] x; // @[GCD.scala 21:15]
  reg [3:0] y; // @[GCD.scala 22:15]
  wire [3:0] _x_T_1 = x - y; // @[GCD.scala 24:24]
  wire [3:0] _y_T_1 = y - x; // @[GCD.scala 25:25]
  assign io_outputGCD = x; // @[GCD.scala 32:16]
  assign io_outputValid = y == 4'h0; // @[GCD.scala 33:23]
  always @(posedge clock) begin
    if (io_loadingValues) begin // @[GCD.scala 27:26]
      x <= io_value1; // @[GCD.scala 28:7]
    end else if (x > y) begin // @[GCD.scala 24:15]
      x <= _x_T_1; // @[GCD.scala 24:19]
    end
    if (io_loadingValues) begin // @[GCD.scala 27:26]
      y <= io_value2; // @[GCD.scala 29:7]
    end else if (!(x > y)) begin // @[GCD.scala 24:15]
      y <= _y_T_1; // @[GCD.scala 25:20]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  x = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  y = _RAND_1[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ChiselWrapper(
  input  [7:0] io_in,
  output [7:0] io_out
);
  wire [3:0] display_io_in; // @[ChiselWrapper.scala 15:23]
  wire  display_io_dot; // @[ChiselWrapper.scala 15:23]
  wire [7:0] display_io_out; // @[ChiselWrapper.scala 15:23]
  wire  gcd_clock; // @[ChiselWrapper.scala 19:55]
  wire [3:0] gcd_io_value1; // @[ChiselWrapper.scala 19:55]
  wire [3:0] gcd_io_value2; // @[ChiselWrapper.scala 19:55]
  wire  gcd_io_loadingValues; // @[ChiselWrapper.scala 19:55]
  wire [3:0] gcd_io_outputGCD; // @[ChiselWrapper.scala 19:55]
  wire  gcd_io_outputValid; // @[ChiselWrapper.scala 19:55]
  DisplayDriver display ( // @[ChiselWrapper.scala 15:23]
    .io_in(display_io_in),
    .io_dot(display_io_dot),
    .io_out(display_io_out)
  );
  GCD gcd ( // @[ChiselWrapper.scala 19:55]
    .clock(gcd_clock),
    .io_value1(gcd_io_value1),
    .io_value2(gcd_io_value2),
    .io_loadingValues(gcd_io_loadingValues),
    .io_outputGCD(gcd_io_outputGCD),
    .io_outputValid(gcd_io_outputValid)
  );
  assign io_out = display_io_out; // @[ChiselWrapper.scala 16:10]
  assign display_io_in = gcd_io_outputGCD; // @[ChiselWrapper.scala 23:17]
  assign display_io_dot = gcd_io_outputValid; // @[ChiselWrapper.scala 24:18]
  assign gcd_clock = io_in[0]; // @[ChiselWrapper.scala 19:35]
  assign gcd_io_value1 = {1'h1,io_in[4:2]}; // @[Cat.scala 31:58]
  assign gcd_io_value2 = {1'h0,io_in[7:5]}; // @[Cat.scala 31:58]
  assign gcd_io_loadingValues = io_in[1]; // @[ChiselWrapper.scala 22:32]
endmodule
