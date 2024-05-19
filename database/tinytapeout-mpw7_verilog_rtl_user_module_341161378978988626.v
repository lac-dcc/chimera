// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341161378978988626 */

`default_nettype none

module user_module_341161378978988626(
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
  wire net12;
  wire net13 = 1'b0;
  wire net14 = 1'b1;
  wire net15 = 1'b1;
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
  wire net42;
  wire net43;
  wire net44;
  wire net45;
  wire net46;
  wire net47;

  assign io_out[0] = net5;
  assign io_out[1] = net6;
  assign io_out[2] = net7;
  assign io_out[3] = net8;
  assign io_out[4] = net9;
  assign io_out[5] = net10;
  assign io_out[6] = net11;
  assign io_out[7] = net12;

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
  nand_cell gate7 (
    .a (net16),
    .b (net17),
    .out (net18)
  );
  nand_cell gate8 (
    .a (net19),
    .b (net17),
    .out (net20)
  );
  nand_cell gate9 (
    .a (net21),
    .b (net17),
    .out (net22)
  );
  nand_cell gate10 (
    .a (net23),
    .b (net17),
    .out (net24)
  );
  nand_cell gate11 (
    .a (net16),
    .b (net25),
    .out (net26)
  );
  nand_cell gate12 (
    .a (net19),
    .b (net25),
    .out (net27)
  );
  nand_cell gate13 (
    .a (net21),
    .b (net25),
    .out (net28)
  );
  nand_cell gate14 (
    .a (net23),
    .b (net25),
    .out (net29)
  );
  nand_cell gate15 (
    .a (net16),
    .b (net30),
    .out (net31)
  );
  nand_cell gate16 (
    .a (net19),
    .b (net30),
    .out (net32)
  );
  not_cell gate17 (
    .in (net33),
    .out (net16)
  );
  or_cell gate18 (
    .a (net34),
    .b (net35),
    .out (net33)
  );
  not_cell gate19 (
    .in (net36),
    .out (net19)
  );
  or_cell gate20 (
    .a (net37),
    .b (net35),
    .out (net36)
  );
  not_cell gate21 (
    .in (net38),
    .out (net21)
  );
  or_cell gate22 (
    .a (net39),
    .b (net34),
    .out (net38)
  );
  not_cell gate23 (
    .in (net40),
    .out (net23)
  );
  or_cell gate24 (
    .a (net37),
    .b (net39),
    .out (net40)
  );
  not_cell gate25 (
    .in (net41),
    .out (net17)
  );
  or_cell gate26 (
    .a (net42),
    .b (net43),
    .out (net41)
  );
  not_cell gate27 (
    .in (net44),
    .out (net25)
  );
  or_cell gate28 (
    .a (net45),
    .b (net43),
    .out (net44)
  );
  not_cell gate29 (
    .in (net46),
    .out (net30)
  );
  or_cell gate30 (
    .a (net47),
    .b (net42),
    .out (net46)
  );
  not_cell gate31 (
    .in (net37),
    .out (net34)
  );
  not_cell gate32 (
    .in (net1),
    .out (net37)
  );
  not_cell gate33 (
    .in (net39),
    .out (net35)
  );
  not_cell gate34 (
    .in (net2),
    .out (net39)
  );
  not_cell gate35 (
    .in (net45),
    .out (net42)
  );
  not_cell gate36 (
    .in (net3),
    .out (net45)
  );
  not_cell gate37 (
    .in (net47),
    .out (net43)
  );
  not_cell gate38 (
    .in (net4),
    .out (net47)
  );
  not_cell gate39 (
    .in (net18),
    .out (net5)
  );
  not_cell gate40 (
    .in (net20),
    .out (net6)
  );
  not_cell gate41 (
    .in (net22),
    .out (net7)
  );
  not_cell gate42 (
    .in (net24),
    .out (net8)
  );
  not_cell gate43 (
    .in (net26),
    .out (net9)
  );
  not_cell gate44 (
    .in (net27),
    .out (net10)
  );
  not_cell gate45 (
    .in (net29),
    .out (net12)
  );
  not_cell gate46 (
    .in (net28),
    .out (net11)
  );
  not_cell gate47 (
    .in (net31)
  );
  not_cell gate48 (
    .in (net32)
  );
endmodule
