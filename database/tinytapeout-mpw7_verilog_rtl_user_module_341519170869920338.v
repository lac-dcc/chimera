// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341519170869920338 */

`default_nettype none

module user_module_341519170869920338(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[7];
  wire net2;
  wire net3;
  wire net4;
  wire net5;
  wire net6 = 1'b1;
  wire net7 = 1'b1;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19;
  wire net20;
  wire net21;
  wire net22;
  wire net23;
  wire net24 = 1'b0;

  assign io_out[0] = net2;
  assign io_out[1] = net3;
  assign io_out[2] = net4;
  assign io_out[3] = net5;

  not_cell not2 (

  );
  not_cell not3 (

  );
  not_cell not4 (

  );
  and_cell gate1 (

  );
  or_cell gate2 (

  );
  xor_cell gate3 (

  );
  nand_cell gate4 (

  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (
    .d (net8),
    .clk (net1),
    .q (net5),
    .notq (net8)
  );
  dff_cell flipflop2 (
    .d (net9),
    .clk (net1),
    .q (net4),
    .notq (net10)
  );
  dff_cell flipflop3 (
    .d (net11),
    .clk (net1),
    .q (net3),
    .notq (net12)
  );
  dff_cell flipflop4 (
    .d (net13),
    .clk (net1),
    .q (net2),
    .notq (net14)
  );
  and_cell gate7 (
    .a (net4),
    .b (net8),
    .out (net15)
  );
  and_cell gate8 (
    .a (net14),
    .b (net10),
    .out (net16)
  );
  and_cell gate9 (
    .a (net16),
    .b (net5),
    .out (net17)
  );
  or_cell gate10 (
    .a (net17),
    .b (net15),
    .out (net9)
  );
  or_cell gate11 (
    .a (net8),
    .b (net10),
    .out (net18)
  );
  and_cell gate12 (
    .a (net3),
    .b (net18),
    .out (net19)
  );
  or_cell gate13 (
    .a (net19),
    .b (net20),
    .out (net11)
  );
  and_cell gate14 (
    .a (net5),
    .b (net4),
    .out (net21)
  );
  and_cell gate15 (
    .a (net21),
    .b (net12),
    .out (net20)
  );
  and_cell gate16 (
    .a (net8),
    .b (net2),
    .out (net22)
  );
  or_cell gate17 (
    .a (net22),
    .b (net23),
    .out (net13)
  );
  and_cell gate18 (
    .a (net21),
    .b (net3),
    .out (net23)
  );
endmodule
