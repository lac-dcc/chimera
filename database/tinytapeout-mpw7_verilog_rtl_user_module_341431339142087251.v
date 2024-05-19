// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341431339142087251 */

`default_nettype none

module user_module_341431339142087251(
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
  wire net30;
  wire net31;
  wire net32;
  wire net33;
  wire net34;
  wire net35 = 1'b0;

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;

  and_cell gate1 (

  );
  or_cell gate2 (

  );
  xor_cell gate3 (

  );
  nand_cell gate4 (

  );
  not_cell gate5 (
    .in (net3),
    .out (net17)
  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (

  );
  dff_cell flipflop2 (
    .d (net18),
    .clk (net19),
    .q (net20),
    .notq (net21)
  );
  buffer_cell gate7 (
    .in (net2),
    .out (net18)
  );
  buffer_cell gate8 (
    .in (net1),
    .out (net19)
  );
  not_cell gate9 (
    .in (net4),
    .out (net22)
  );
  not_cell gate10 (
    .in (net5),
    .out (net23)
  );
  and_cell gate11 (
    .a (net17),
    .b (net23),
    .out (net24)
  );
  not_cell gate12 (
    .in (net22),
    .out (net25)
  );
  not_cell gate13 (
    .in (net23),
    .out (net26)
  );
  and_cell gate14 (
    .a (net25),
    .b (net26),
    .out (net27)
  );
  or_cell gate15 (
    .a (net24),
    .b (net27),
    .out (net11)
  );
  not_cell gate16 (
    .in (net11),
    .out (net12)
  );
  not_cell gate17 (
    .in (net6),
    .out (net28)
  );
  not_cell gate18 (
    .in (net7),
    .out (net29)
  );
  not_cell gate19 (
    .in (net8),
    .out (net30)
  );
  and_cell gate20 (
    .a (net28),
    .b (net30),
    .out (net31)
  );
  not_cell gate21 (
    .in (net29),
    .out (net32)
  );
  not_cell gate22 (
    .in (net30),
    .out (net33)
  );
  and_cell gate23 (
    .a (net32),
    .b (net33),
    .out (net34)
  );
  or_cell gate24 (
    .a (net31),
    .b (net34),
    .out (net13)
  );
  not_cell gate25 (
    .in (net13),
    .out (net14)
  );
  buffer_cell gate26 (
    .in (net20),
    .out (net9)
  );
  buffer_cell gate27 (
    .in (net21),
    .out (net10)
  );
endmodule
