// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341608574336631379 */

`default_nettype none

module user_module_341608574336631379(
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
  wire net11 = 1'b0;
  wire net12 = 1'b1;
  wire net13 = 1'b1;
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
  wire net35;
  wire net36;
  wire net37;
  wire net38;
  wire net39;

  assign io_out[0] = net9;
  assign io_out[1] = net10;

  and_cell gate1 (
    .a (net14),
    .b (net8),
    .out (net15)
  );
  or_cell gate2 (

  );
  xor_cell gate3 (
    .a (net16),
    .b (net15),
    .out (net10)
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
  not_cell gate7 (
    .in (net2),
    .out (net17)
  );
  and_cell gate8 (
    .a (net17),
    .b (net18),
    .out (net19)
  );
  and_cell gate9 (
    .a (net20),
    .b (net3),
    .out (net21)
  );
  and_cell gate10 (
    .a (net4),
    .b (net22),
    .out (net23)
  );
  xor_cell gate11 (
    .a (net24),
    .b (net19),
    .out (net25)
  );
  xor_cell gate12 (
    .a (net21),
    .b (net23),
    .out (net26)
  );
  xor_cell gate13 (
    .a (net27),
    .b (net26),
    .out (net9)
  );
  xor_cell gate14 (
    .a (net28),
    .b (net29),
    .out (net30)
  );
  and_cell gate15 (
    .a (net31),
    .b (net32),
    .out (net29)
  );
  not_cell gate16 (
    .in (net5),
    .out (net32)
  );
  and_cell gate17 (
    .a (net3),
    .b (net7),
    .out (net33)
  );
  xor_cell gate18 (
    .a (net30),
    .b (net34),
    .out (net16)
  );
  buffer_cell gate19 (
    .in (net4),
    .out (net18)
  );
  buffer_cell gate20 (
    .in (net25),
    .out (net27)
  );
  buffer_cell gate21 (
    .in (net2),
    .out (net35)
  );
  buffer_cell gate22 (
    .in (net35),
    .out (net20)
  );
  buffer_cell gate23 (
    .in (net36),
    .out (net22)
  );
  buffer_cell gate24 (
    .in (net5),
    .out (net36)
  );
  buffer_cell gate25 (
    .in (net22),
    .out (net14)
  );
  buffer_cell gate26 (
    .in (net3),
    .out (net31)
  );
  buffer_cell gate27 (
    .in (net37),
    .out (net34)
  );
  buffer_cell gate28 (
    .in (net33),
    .out (net37)
  );
  buffer_cell gate29 (
    .in (net6),
    .out (net38)
  );
  buffer_cell gate30 (
    .in (net38),
    .out (net28)
  );
  buffer_cell gate31 (
    .in (net39),
    .out (net24)
  );
  buffer_cell gate32 (
    .in (net1),
    .out (net39)
  );
endmodule
