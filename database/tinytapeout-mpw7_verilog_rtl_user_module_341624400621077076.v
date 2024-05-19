// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341624400621077076 */

`default_nettype none

module user_module_341624400621077076(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = 1'b0;
  wire net2;
  wire net3;
  wire net4;
  wire net5 = 1'b1;
  wire net6;
  wire net7 = 1'b1;
  wire net8;
  wire net9;

  assign io_out[0] = net1;
  assign io_out[1] = net2;
  assign io_out[2] = net3;
  assign io_out[3] = net4;
  assign io_out[4] = net3;
  assign io_out[5] = net5;
  assign io_out[6] = net5;
  assign io_out[7] = net6;

  and_cell gate1 (
    .a (net4),
    .b (net2),
    .out (net8)
  );
  dff_cell flipflop1 (
    .d (net6),
    .clk (net9),
    .q (net3),
    .notq (net4)
  );
  dff_cell flipflop2 (
    .d (net8),
    .clk (net9),
    .q (net6),
    .notq (net2)
  );
endmodule
