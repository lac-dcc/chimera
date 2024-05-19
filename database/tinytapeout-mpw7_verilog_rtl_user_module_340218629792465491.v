// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/340218629792465491 */

`default_nettype none

module user_module_340218629792465491(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2;
  wire net3;
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8 = 1'b0;
  wire net9 = 1'b1;
  wire net10 = 1'b1;
  wire net11;

  assign io_out[0] = net2;
  assign io_out[1] = net3;
  assign io_out[2] = net4;
  assign io_out[3] = net5;
  assign io_out[4] = net6;
  assign io_out[5] = net7;

  and_cell gate1 (

  );
  or_cell gate2 (

  );
  xor_cell gate3 (

  );
  nand_cell gate4 (

  );
  not_cell gate5 (

  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (

  );
  dff_cell flipflop2 (
    .d (net11),
    .clk (net1),
    .q (net2)
  );
  dff_cell flipflop3 (
    .d (net2),
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
    .q (net7),
    .notq (net11)
  );
endmodule
