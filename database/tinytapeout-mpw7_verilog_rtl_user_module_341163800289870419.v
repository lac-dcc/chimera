// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341163800289870419 */

`default_nettype none

module user_module_341163800289870419(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3;
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = 1'b0;
  wire net12 = 1'b1;
  wire net13 = 1'b1;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;

  assign io_out[0] = net3;
  assign io_out[1] = net4;
  assign io_out[2] = net5;
  assign io_out[3] = net6;
  assign io_out[4] = net7;
  assign io_out[5] = net8;
  assign io_out[6] = net9;
  assign io_out[7] = net10;

  and_cell gate8 (
    .a (net14),
    .b (net15),
    .out (net9)
  );
  dff_cell flipflop2 (
    .d (net2),
    .clk (net1),
    .q (net14),
    .notq (net16)
  );
  dff_cell flipflop3 (
    .d (net14),
    .clk (net1),
    .q (net17),
    .notq (net15)
  );
  and_cell gate7 (
    .a (net16),
    .b (net17),
    .out (net10)
  );
  dff_cell flipflop1 (
    .d (net18),
    .clk (net1),
    .q (net3)
  );
  dff_cell flipflop4 (
    .d (net3),
    .clk (net1),
    .q (net4)
  );
  dff_cell flipflop5 (
    .d (net4),
    .clk (net1),
    .q (net5)
  );
  dff_cell flipflop6 (
    .d (net5),
    .clk (net1),
    .q (net6)
  );
  dff_cell flipflop7 (
    .d (net6),
    .clk (net1),
    .q (net7)
  );
  dff_cell flipflop8 (
    .d (net7),
    .clk (net1),
    .q (net8),
    .notq (net18)
  );
endmodule
