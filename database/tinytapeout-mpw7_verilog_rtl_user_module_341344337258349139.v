// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341344337258349139 */

`default_nettype none

module user_module_341344337258349139(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12 = 1'b0;
  wire net13 = 1'b1;
  wire net14 = 1'b1;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19 = 1'b0;
  wire net20;
  wire net21;
  wire net22;
  wire net23;
  wire net24;
  wire net25;
  wire net26;
  wire net27;
  wire net28;

  assign io_out[0] = net4;
  assign io_out[1] = net5;
  assign io_out[2] = net6;
  assign io_out[3] = net7;
  assign io_out[4] = net8;
  assign io_out[5] = net9;
  assign io_out[6] = net10;
  assign io_out[7] = net11;

  or_cell gate2 (
    .a (net11),
    .b (net2),
    .out (net15)
  );
  xor_cell gate3 (
    .a (net16),
    .b (net17),
    .out (net18)
  );
  mux_cell mux1 (
    .a (net19),
    .b (net15),
    .sel (net3),
    .out (net16)
  );
  dff_cell flipflop1 (
    .d (net16),
    .clk (net1),
    .q (net20)
  );
  dff_cell flipflop2 (
    .d (net20),
    .clk (net1),
    .q (net17)
  );
  dff_cell flipflop3 (
    .d (net18),
    .clk (net1),
    .q (net21)
  );
  dff_cell flipflop4 (
    .d (net22),
    .clk (net1),
    .q (net23)
  );
  xor_cell gate7 (
    .a (net16),
    .b (net21),
    .out (net22)
  );
  dff_cell flipflop5 (
    .d (net23),
    .clk (net1),
    .q (net24)
  );
  xor_cell gate8 (
    .a (net16),
    .b (net24),
    .out (net25)
  );
  dff_cell flipflop6 (
    .d (net25),
    .clk (net1),
    .q (net26)
  );
  dff_cell flipflop7 (
    .d (net26),
    .clk (net1),
    .q (net27)
  );
  dff_cell flipflop8 (
    .d (net27),
    .clk (net1),
    .q (net28)
  );
  dff_cell flipflop9 (
    .d (net28),
    .clk (net1),
    .q (net4)
  );
  dff_cell flipflop10 (
    .d (net4),
    .clk (net1),
    .q (net5)
  );
  dff_cell flipflop11 (
    .d (net5),
    .clk (net1),
    .q (net6)
  );
  dff_cell flipflop12 (
    .d (net6),
    .clk (net1),
    .q (net7)
  );
  dff_cell flipflop13 (
    .d (net7),
    .clk (net1),
    .q (net8)
  );
  dff_cell flipflop14 (
    .d (net8),
    .clk (net1),
    .q (net9)
  );
  dff_cell flipflop15 (
    .d (net9),
    .clk (net1),
    .q (net10)
  );
  dff_cell flipflop16 (
    .d (net10),
    .clk (net1),
    .q (net11)
  );
endmodule
