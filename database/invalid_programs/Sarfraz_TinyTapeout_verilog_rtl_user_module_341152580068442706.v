// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341152580068442706 */

`default_nettype none

module user_module_341152580068442706(
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
  wire net38;
  wire net39;
  wire net40;
  wire net41;

  assign io_out[0] = net5;
  assign io_out[1] = net6;
  assign io_out[2] = net7;
  assign io_out[3] = net8;
  assign io_out[4] = net9;
  assign io_out[5] = net10;
  assign io_out[6] = net11;

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
  buffer_cell gate7 (
    .in (net4),
    .out (net15)
  );
  buffer_cell gate8 (
    .in (net3),
    .out (net16)
  );
  buffer_cell gate9 (
    .in (net2),
    .out (net17)
  );
  buffer_cell gate10 (
    .in (net1),
    .out (net18)
  );
  not_cell gate11 (
    .in (net4)
  );
  not_cell gate12 (
    .in (net3),
    .out (net19)
  );
  not_cell gate13 (
    .in (net2),
    .out (net20)
  );
  not_cell gate14 (
    .in (net1),
    .out (net21)
  );
  and_cell gate15 (
    .a (net16),
    .b (net18),
    .out (net22)
  );
  and_cell gate16 (
    .a (net19),
    .b (net21),
    .out (net23)
  );
  and_cell gate17 (
    .a (net17),
    .b (net18),
    .out (net24)
  );
  and_cell gate18 (
    .a (net20),
    .b (net21),
    .out (net25)
  );
  and_cell gate19 (
    .a (net17),
    .b (net21),
    .out (net26)
  );
  and_cell gate20 (
    .a (net19),
    .b (net17),
    .out (net27)
  );
  and_cell gate21 (
    .a (net18),
    .b (net28),
    .out (net29)
  );
  and_cell gate22 (
    .a (net16),
    .b (net20),
    .out (net28)
  );
  and_cell gate23 (
    .a (net16),
    .b (net21),
    .out (net30)
  );
  or_cell gate24 (
    .a (net22),
    .b (net23),
    .out (net31)
  );
  or_cell gate25 (
    .a (net15),
    .b (net17),
    .out (net32)
  );
  or_cell gate26 (
    .a (net31),
    .b (net32),
    .out (net5)
  );
  or_cell gate27 (
    .a (net24),
    .b (net25),
    .out (net33)
  );
  or_cell gate28 (
    .a (net33),
    .b (net19),
    .out (net6)
  );
  or_cell gate29 (
    .a (net16),
    .b (net20),
    .out (net34)
  );
  or_cell gate30 (
    .a (net34),
    .b (net18),
    .out (net7)
  );
  or_cell gate31 (
    .a (net15),
    .b (net23),
    .out (net35)
  );
  or_cell gate32 (
    .a (net26),
    .b (net27),
    .out (net36)
  );
  or_cell gate33 (
    .a (net35),
    .b (net36),
    .out (net37)
  );
  or_cell gate34 (
    .a (net37),
    .b (net29),
    .out (net8)
  );
  or_cell gate35 (
    .a (net23),
    .b (net26),
    .out (net9)
  );
  or_cell gate36 (
    .a (net28),
    .b (net30),
    .out (net38)
  );
  or_cell gate37 (
    .a (net25),
    .b (net15),
    .out (net39)
  );
  or_cell gate38 (
    .a (net38),
    .b (net39),
    .out (net10)
  );
  or_cell gate39 (
    .a (net26),
    .b (net27),
    .out (net40)
  );
  or_cell gate40 (
    .a (net28),
    .b (net15),
    .out (net41)
  );
  or_cell gate41 (
    .a (net40),
    .b (net41),
    .out (net11)
  );
endmodule
