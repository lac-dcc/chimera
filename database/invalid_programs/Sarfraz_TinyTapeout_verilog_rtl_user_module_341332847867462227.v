// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341332847867462227 */

`default_nettype none

module user_module_341332847867462227(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
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

  assign io_out[0] = net5;
  assign io_out[1] = net6;
  assign io_out[2] = net7;
  assign io_out[3] = net8;
  assign io_out[4] = net9;
  assign io_out[5] = net10;
  assign io_out[6] = net11;

  and_cell gate1 (
    .a (net4),
    .b (net2),
    .out (net15)
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
  not_cell gate7 (
    .in (net1)
  );
  not_cell gate8 (
    .in (net2),
    .out (net16)
  );
  not_cell gate9 (
    .in (net3),
    .out (net17)
  );
  not_cell gate10 (
    .in (net4),
    .out (net18)
  );
  and_cell gate11 (
    .a (net18),
    .b (net16),
    .out (net19)
  );
  and_cell gate12 (
    .a (net18),
    .b (net17),
    .out (net20)
  );
  and_cell gate13 (
    .a (net18),
    .b (net3),
    .out (net21)
  );
  and_cell gate14 (
    .a (net3),
    .b (net16),
    .out (net22)
  );
  and_cell gate15 (
    .a (net17),
    .b (net2),
    .out (net23)
  );
  and_cell gate16 (
    .a (net4),
    .b (net3),
    .out (net24)
  );
  and_cell gate17 (
    .a (net18),
    .b (net2),
    .out (net25)
  );
  or_cell gate18 (
    .a (net15),
    .b (net19),
    .out (net26)
  );
  or_cell gate19 (
    .a (net26),
    .b (net1),
    .out (net27)
  );
  or_cell gate20 (
    .a (net27),
    .b (net3),
    .out (net5)
  );
  or_cell gate21 (
    .a (net16),
    .b (net20),
    .out (net28)
  );
  or_cell gate22 (
    .a (net28),
    .b (net24),
    .out (net6)
  );
  or_cell gate23 (
    .a (net2),
    .b (net17),
    .out (net29)
  );
  or_cell gate24 (
    .a (net29),
    .b (net4),
    .out (net7)
  );
  or_cell gate25 (
    .a (net19),
    .b (net21),
    .out (net30)
  );
  or_cell gate26 (
    .a (net30),
    .b (net22),
    .out (net31)
  );
  or_cell gate27 (
    .a (net31),
    .b (net1),
    .out (net32)
  );
  and_cell gate28 (
    .a (net23),
    .b (net4),
    .out (net33)
  );
  or_cell gate29 (
    .a (net32),
    .b (net33),
    .out (net8)
  );
  or_cell gate30 (
    .a (net19),
    .b (net21),
    .out (net9)
  );
  or_cell gate31 (
    .a (net1),
    .b (net20),
    .out (net34)
  );
  or_cell gate32 (
    .a (net34),
    .b (net23),
    .out (net35)
  );
  or_cell gate33 (
    .a (net35),
    .b (net25),
    .out (net10)
  );
  or_cell gate34 (
    .a (net22),
    .b (net21),
    .out (net36)
  );
  or_cell gate35 (
    .a (net36),
    .b (net23),
    .out (net37)
  );
  or_cell gate36 (
    .a (net37),
    .b (net1),
    .out (net11)
  );
endmodule
