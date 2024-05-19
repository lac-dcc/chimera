// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341473139924927058 */

`default_nettype none

module user_module_341473139924927058(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1;
  wire net2;
  wire net3;
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8 = io_in[0];
  wire net9 = io_in[1];
  wire net10 = io_in[2];
  wire net11 = io_in[3];
  wire net12 = 1'b0;
  wire net13 = 1'b1;
  wire net14 = 1'b1;
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
  wire net40;

  assign io_out[0] = net1;
  assign io_out[1] = net2;
  assign io_out[2] = net3;
  assign io_out[3] = net4;
  assign io_out[4] = net5;
  assign io_out[5] = net6;
  assign io_out[6] = net7;

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
  not_cell gate7 (
    .in (net9),
    .out (net15)
  );
  not_cell gate9 (
    .in (net10),
    .out (net16)
  );
  not_cell gate10 (
    .in (net11),
    .out (net17)
  );
  and_cell gate11 (
    .a (net9),
    .b (net16),
    .out (net18)
  );
  and_cell gate12 (
    .a (net9),
    .b (net11),
    .out (net19)
  );
  and_cell gate13 (
    .a (net15),
    .b (net17),
    .out (net20)
  );
  and_cell gate14 (
    .a (net10),
    .b (net11),
    .out (net21)
  );
  and_cell gate15 (
    .a (net16),
    .b (net17),
    .out (net22)
  );
  and_cell gate16 (
    .a (net10),
    .b (net17),
    .out (net23)
  );
  and_cell gate17 (
    .a (net15),
    .b (net10),
    .out (net24)
  );
  and_cell gate18 (
    .a (net11),
    .b (net18),
    .out (net25)
  );
  or_cell gate19 (
    .a (net8),
    .b (net10),
    .out (net26)
  );
  or_cell gate20 (
    .a (net19),
    .b (net20),
    .out (net27)
  );
  or_cell gate21 (
    .a (net26),
    .b (net27),
    .out (net1)
  );
  or_cell gate22 (
    .a (net21),
    .b (net21),
    .out (net28)
  );
  or_cell gate23 (
    .a (net22),
    .b (net15),
    .out (net29)
  );
  or_cell gate24 (
    .a (net28),
    .b (net29),
    .out (net2)
  );
  or_cell gate25 (
    .a (net8),
    .b (net20),
    .out (net30)
  );
  or_cell gate26 (
    .a (net23),
    .b (net24),
    .out (net31)
  );
  or_cell gate27 (
    .a (net30),
    .b (net31),
    .out (net32)
  );
  or_cell gate28 (
    .a (net25),
    .b (net18),
    .out (net33)
  );
  or_cell gate29 (
    .a (net34),
    .b (net8),
    .out (net35)
  );
  or_cell gate30 (
    .a (net33),
    .b (net35),
    .out (net6)
  );
  and_cell gate32 (
    .a (net9),
    .b (net17),
    .out (net34)
  );
  or_cell gate33 (
    .a (net9),
    .b (net11),
    .out (net36)
  );
  or_cell gate34 (
    .a (net16),
    .b (net16),
    .out (net37)
  );
  or_cell gate35 (
    .a (net36),
    .b (net37),
    .out (net3)
  );
  or_cell gate31 (
    .a (net25),
    .b (net25),
    .out (net38)
  );
  or_cell gate36 (
    .a (net32),
    .b (net38),
    .out (net4)
  );
  or_cell gate37 (
    .a (net23),
    .b (net20),
    .out (net5)
  );
  or_cell gate38 (
    .a (net23),
    .b (net8),
    .out (net39)
  );
  or_cell gate39 (
    .a (net24),
    .b (net18),
    .out (net40)
  );
  or_cell gate40 (
    .a (net39),
    .b (net40),
    .out (net7)
  );
endmodule
