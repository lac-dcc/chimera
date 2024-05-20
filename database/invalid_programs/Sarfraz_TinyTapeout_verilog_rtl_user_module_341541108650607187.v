// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341541108650607187 */

`default_nettype none

module user_module_341541108650607187(
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
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15 = 1'b0;
  wire net16 = 1'b1;
  wire net17 = 1'b1;
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
  wire net42;
  wire net43;
  wire net44;
  wire net45;
  wire net46;
  wire net47;
  wire net48;
  wire net49;

  assign io_out[0] = net8;
  assign io_out[1] = net9;
  assign io_out[2] = net10;
  assign io_out[3] = net8;
  assign io_out[4] = net11;
  assign io_out[5] = net12;
  assign io_out[6] = net13;
  assign io_out[7] = net14;

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
  not_cell gate7 (
    .in (net18),
    .out (net19)
  );
  or_cell gate8 (
    .a (net20),
    .b (net21),
    .out (net22)
  );
  or_cell gate9 (
    .a (net23),
    .b (net24),
    .out (net21)
  );
  buffer_cell gate10 (
    .in (net18),
    .out (net20)
  );
  buffer_cell gate11 (
    .in (net25),
    .out (net13)
  );
  buffer_cell gate13 (
    .in (net26),
    .out (net10)
  );
  buffer_cell gate14 (
    .in (net27),
    .out (net8)
  );
  buffer_cell gate15 (
    .in (net19),
    .out (net9)
  );
  buffer_cell gate16 (
    .in (net28),
    .out (net12)
  );
  not_cell gate17 (
    .in (net22),
    .out (net28)
  );
  nand_cell gate18 (
    .a (net29),
    .b (net30),
    .out (net31)
  );
  nand_cell gate21 (
    .a (net32),
    .b (net33),
    .out (net34)
  );
  nand_cell gate24 (
    .a (net34),
    .b (net31),
    .out (net35)
  );
  dff_cell flipflop2 (
    .d (net35),
    .clk (net1),
    .q (net23),
    .notq (net36)
  );
  dff_cell flipflop3 (
    .d (net37),
    .clk (net1),
    .q (net24),
    .notq (net38)
  );
  and_cell gate25 (
    .a (net19),
    .b (net23),
    .out (net25)
  );
  and_cell gate26 (
    .a (net19),
    .b (net38),
    .out (net39)
  );
  and_cell gate27 (
    .a (net19),
    .b (net40),
    .out (net26)
  );
  and_cell gate28 (
    .a (net19),
    .b (net41),
    .out (net27)
  );
  nand_cell gate29 (
    .a (net23),
    .b (net38),
    .out (net40)
  );
  nand_cell gate30 (
    .a (net24),
    .b (net36),
    .out (net41)
  );
  or_cell gate32 (
    .a (net18),
    .b (net24),
    .out (net42)
  );
  not_cell gate33 (
    .in (net42),
    .out (net37)
  );
  nand_cell gate35 (
    .a (net19),
    .b (net19),
    .out (net43)
  );
  nand_cell gate36 (
    .a (net24),
    .b (net24),
    .out (net44)
  );
  nand_cell gate37 (
    .a (net45),
    .b (net45),
    .out (net30)
  );
  nand_cell gate38 (
    .a (net38),
    .b (net23),
    .out (net45)
  );
  nand_cell gate40 (
    .a (net43),
    .b (net43),
    .out (net29)
  );
  nand_cell gate42 (
    .a (net19),
    .b (net36),
    .out (net46)
  );
  nand_cell gate19 (
    .a (net46),
    .b (net46),
    .out (net33)
  );
  buffer_cell gate12 (
    .in (net39),
    .out (net11)
  );
  nand_cell gate20 (
    .a (net44),
    .b (net44),
    .out (net32)
  );
  buffer_cell gate22 (
    .in (net3)
  );
  buffer_cell gate23 (
    .in (net4),
    .out (net14)
  );
  buffer_cell gate31 (
    .in (net5),
    .out (net47)
  );
  buffer_cell gate34 (
    .in (net6),
    .out (net48)
  );
  buffer_cell gate39 (
    .in (net7),
    .out (net49)
  );
  and_cell gate41 (
    .a (net3),
    .b (net2),
    .out (net18)
  );
  and_cell gate43 (
    .a (net47),
    .b (net48),
    .out (net14)
  );
  dff_cell flipflop4 (
    .d (net49),
    .clk (net1),
    .q (net14)
  );
endmodule
