// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

// Keep I/O fixed for TinyTapeout
module user_module_340579111348994642(
  input [7:0] io_in, 
  output [7:0] io_out
);

clock clock_top (
    .i_clk(io_in[0]),
    .i_rst(io_in[1]),
    .i_min_up(io_in[2]),
    .i_hour_up(io_in[3]),
    .i_freq(io_in[4]),
    .o_clk(io_out[0]),
    .o_latch(io_out[1]),
    .o_bit(io_out[2])
);

endmodule