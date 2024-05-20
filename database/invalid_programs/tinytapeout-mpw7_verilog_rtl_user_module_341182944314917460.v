// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341182944314917460 */

`default_nettype none

module user_module_341182944314917460(
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
  wire net15;
  wire net16;
  wire net17 = 1'b0;
  wire net18 = 1'b1;
  wire net19 = 1'b1;
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
  wire net50;
  wire net51;
  wire net52;
  wire net53;
  wire net54;

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;
  assign io_out[6] = net15;
  assign io_out[7] = net16;

  and_cell gate1 (
    .a (net2),
    .b (net9),
    .out (net20)
  );
  or_cell gate2 (
    .a (net21),
    .b (net20),
    .out (net22)
  );
  xor_cell gate3 (
    .a (net2),
    .b (net9),
    .out (net23)
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
    .d (net24),
    .clk (net1),
    .q (net9)
  );
  xor_cell gate7 (
    .a (net23),
    .b (net25),
    .out (net24)
  );
  and_cell gate8 (
    .a (net23),
    .b (net25),
    .out (net21)
  );
  and_cell gate9 (
    .a (net3),
    .b (net10),
    .out (net26)
  );
  or_cell gate10 (
    .a (net27),
    .b (net26),
    .out (net28)
  );
  xor_cell gate11 (
    .a (net3),
    .b (net10),
    .out (net29)
  );
  xor_cell gate12 (
    .a (net29),
    .b (net22),
    .out (net30)
  );
  and_cell gate13 (
    .a (net29),
    .b (net22),
    .out (net27)
  );
  and_cell gate14 (
    .a (net4),
    .b (net11),
    .out (net31)
  );
  or_cell gate15 (
    .a (net32),
    .b (net31),
    .out (net33)
  );
  xor_cell gate16 (
    .a (net4),
    .b (net11),
    .out (net34)
  );
  xor_cell gate17 (
    .a (net34),
    .b (net28),
    .out (net35)
  );
  and_cell gate18 (
    .a (net34),
    .b (net28),
    .out (net32)
  );
  and_cell gate19 (
    .a (net5),
    .b (net12),
    .out (net36)
  );
  or_cell gate20 (
    .a (net37),
    .b (net36),
    .out (net38)
  );
  xor_cell gate21 (
    .a (net5),
    .b (net12),
    .out (net39)
  );
  xor_cell gate22 (
    .a (net39),
    .b (net33),
    .out (net40)
  );
  and_cell gate23 (
    .a (net39),
    .b (net33),
    .out (net37)
  );
  dff_cell flipflop2 (
    .d (net30),
    .clk (net1),
    .q (net10)
  );
  dff_cell flipflop3 (
    .d (net35),
    .clk (net1),
    .q (net11)
  );
  dff_cell flipflop4 (
    .d (net40),
    .clk (net1),
    .q (net12)
  );
  and_cell gate24 (
    .a (net6),
    .b (net13),
    .out (net41)
  );
  or_cell gate25 (
    .a (net42),
    .b (net41),
    .out (net43)
  );
  xor_cell gate26 (
    .a (net6),
    .b (net13),
    .out (net44)
  );
  xor_cell gate27 (
    .a (net44),
    .b (net38),
    .out (net45)
  );
  and_cell gate28 (
    .a (net44),
    .b (net38),
    .out (net42)
  );
  dff_cell flipflop5 (
    .d (net45),
    .clk (net1),
    .q (net13)
  );
  and_cell gate29 (
    .a (net7),
    .b (net14),
    .out (net46)
  );
  or_cell gate30 (
    .a (net47),
    .b (net46),
    .out (net48)
  );
  xor_cell gate31 (
    .a (net7),
    .b (net14),
    .out (net49)
  );
  xor_cell gate32 (
    .a (net49),
    .b (net43),
    .out (net50)
  );
  and_cell gate33 (
    .a (net49),
    .b (net43),
    .out (net47)
  );
  dff_cell flipflop6 (
    .d (net50),
    .clk (net1),
    .q (net14)
  );
  and_cell gate34 (
    .a (net8),
    .b (net15),
    .out (net51)
  );
  or_cell gate35 (
    .a (net52),
    .b (net51),
    .out (net16)
  );
  xor_cell gate36 (
    .a (net8),
    .b (net15),
    .out (net53)
  );
  xor_cell gate37 (
    .a (net53),
    .b (net48),
    .out (net54)
  );
  and_cell gate38 (
    .a (net53),
    .b (net48),
    .out (net52)
  );
  dff_cell flipflop7 (
    .d (net54),
    .clk (net1),
    .q (net15)
  );
endmodule
