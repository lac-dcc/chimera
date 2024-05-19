// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341432030163108435 */

`default_nettype none

module user_module_341432030163108435(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
  wire net5 = io_in[4];
  wire net6 = io_in[5];
  wire net7 = io_in[6];
  wire net8 = io_in[7];
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15 = 1'b1;
  wire net16 = 1'b1;
  wire net17;
  wire net18;
  wire net19;
  wire net20;
  wire net21;
  wire net22;
  wire net23;
  wire net24;
  wire net25;
  wire net26;
  wire net27;
  wire net28;
  wire net29;
  wire net30 = 1'b0;
  wire net31;
  wire net32;
  wire net33;
  wire net34;
  wire net35;
  wire net36;
  wire net37;

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;

  and_cell gate1 (
    .a (net17),
    .b (net18),
    .out (net19)
  );
  or_cell gate2 (

  );
  xor_cell gate3 (

  );
  nand_cell gate4 (

  );
  not_cell gate5 (
    .in (net3),
    .out (net20)
  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (

  );
  dff_cell flipflop2 (
    .d (net21),
    .clk (net22),
    .q (net23),
    .notq (net24)
  );
  buffer_cell gate7 (
    .in (net2),
    .out (net21)
  );
  buffer_cell gate8 (
    .in (net1),
    .out (net22)
  );
  not_cell gate9 (
    .in (net4),
    .out (net25)
  );
  not_cell gate10 (
    .in (net5),
    .out (net26)
  );
  not_cell gate16 (
    .in (net11),
    .out (net12)
  );
  not_cell gate17 (
    .in (net6),
    .out (net27)
  );
  not_cell gate18 (
    .in (net7),
    .out (net28)
  );
  not_cell gate19 (
    .in (net8),
    .out (net29)
  );
  not_cell gate25 (
    .in (net13),
    .out (net14)
  );
  buffer_cell gate26 (
    .in (net23),
    .out (net9)
  );
  buffer_cell gate27 (
    .in (net24),
    .out (net10)
  );
  not_cell gate11 (
    .in (net20),
    .out (net17)
  );
  not_cell gate12 (
    .in (net25),
    .out (net31)
  );
  not_cell gate13 (
    .in (net26),
    .out (net18)
  );
  and_cell gate14 (
    .a (net31),
    .b (net26),
    .out (net32)
  );
  or_cell gate15 (
    .a (net19),
    .b (net32),
    .out (net11)
  );
  and_cell gate20 (
    .a (net33),
    .b (net34),
    .out (net35)
  );
  not_cell gate21 (
    .in (net27),
    .out (net33)
  );
  not_cell gate22 (
    .in (net28),
    .out (net36)
  );
  not_cell gate23 (
    .in (net29),
    .out (net34)
  );
  and_cell gate24 (
    .a (net36),
    .b (net29),
    .out (net37)
  );
  or_cell gate28 (
    .a (net35),
    .b (net37),
    .out (net13)
  );
endmodule
