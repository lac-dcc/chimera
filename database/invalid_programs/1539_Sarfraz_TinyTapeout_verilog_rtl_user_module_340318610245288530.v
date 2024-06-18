// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/340318610245288530 */

`default_nettype none

module user_module_340318610245288530(
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
  wire net10 = 1'b1;
  wire net11;
  wire net12;
  wire net13;
  wire net14 = 1'b0;
  wire net15;
  wire net16 = 1'b0;
  wire net17 = 1'b1;
  wire net18 = 1'b1;
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
  wire net42;
  wire net43;
  wire net44;
  wire net45;
  wire net46 = 1'b1;
  wire net47;
  wire net48;

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net10;
  assign io_out[3] = net11;
  assign io_out[4] = net12;
  assign io_out[5] = net13;
  assign io_out[6] = net14;
  assign io_out[7] = net15;

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
  and_cell gate7 (
    .a (net5),
    .b (net6),
    .out (net19)
  );
  and_cell gate8 (
    .a (net3),
    .b (net4),
    .out (net20)
  );
  xor_cell gate9 (
    .a (net2),
    .b (net20),
    .out (net21)
  );
  and_cell gate10 (
    .a (net21),
    .b (net19),
    .out (net22)
  );
  or_cell gate11 (
    .a (net21),
    .b (net19),
    .out (net23)
  );
  not_cell gate12 (
    .in (net19),
    .out (net24)
  );
  and_cell gate13 (
    .a (net22),
    .b (net25),
    .out (net26)
  );
  and_cell gate14 (
    .a (net23),
    .b (net27),
    .out (net28)
  );
  and_cell gate15 (
    .a (net24),
    .b (net29),
    .out (net30)
  );
  or_cell gate16 (
    .a (net26),
    .b (net28),
    .out (net31)
  );
  or_cell gate17 (
    .a (net31),
    .b (net32),
    .out (net33)
  );
  or_cell gate18 (
    .a (net30),
    .b (net34),
    .out (net32)
  );
  not_cell gate19 (
    .in (net7),
    .out (net35)
  );
  not_cell gate20 (
    .in (net8),
    .out (net36)
  );
  not_cell gate21 (
    .in (net7),
    .out (net37)
  );
  not_cell gate22 (
    .in (net8),
    .out (net38)
  );
  and_cell gate23 (
    .a (net35),
    .b (net36),
    .out (net25)
  );
  and_cell gate24 (
    .a (net37),
    .b (net8),
    .out (net27)
  );
  and_cell gate25 (
    .a (net7),
    .b (net38),
    .out (net29)
  );
  and_cell gate26 (
    .a (net7),
    .b (net8),
    .out (net39)
  );
  xor_cell gate27 (
    .a (net19),
    .b (net21),
    .out (net40)
  );
  xor_cell gate28 (
    .a (net1),
    .b (net40),
    .out (net41)
  );
  and_cell gate29 (
    .a (net41),
    .b (net39),
    .out (net34)
  );
  and_cell gate30 (
    .a (net42),
    .b (net43),
    .out (net44)
  );
  or_cell gate32 (
    .a (net44),
    .b (net45),
    .out (net15)
  );
  and_cell gate33 (
    .a (net1),
    .b (net40),
    .out (net42)
  );
  and_cell gate34 (
    .a (net39),
    .b (net46),
    .out (net43)
  );
  and_cell gate31 (
    .a (net47),
    .b (net48),
    .out (net45)
  );
  and_cell gate35 (
    .a (net19),
    .b (net21),
    .out (net47)
  );
  and_cell gate36 (
    .a (net39),
    .b (net46),
    .out (net48)
  );
  not_cell gate37 (
    .in (net33),
    .out (net9)
  );
  not_cell gate38 (
    .in (net33),
    .out (net11)
  );
  not_cell gate39 (
    .in (net33),
    .out (net12)
  );
  not_cell gate40 (
    .in (net33),
    .out (net13)
  );
endmodule
