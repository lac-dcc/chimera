// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341164228775772755 */

`default_nettype none

module user_module_341164228775772755(
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
  wire net12 = 1'b1;
  wire net13 = 1'b0;
  wire net14 = 1'b0;
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
  wire net35;
  wire net36;
  wire net37;
  wire net38;
  wire net39;
  wire net40;
  wire net41;

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net10;
  assign io_out[3] = net11;
  assign io_out[4] = net12;
  assign io_out[5] = net9;
  assign io_out[6] = net12;
  assign io_out[7] = net13;

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
  dff_cell flipflop2 (
    .d (net8),
    .clk (net1),
    .q (net17)
  );
  dff_cell flipflop3 (
    .d (net17),
    .clk (net1),
    .q (net18)
  );
  dff_cell flipflop4 (
    .d (net18),
    .clk (net1),
    .q (net19)
  );
  dff_cell flipflop5 (
    .d (net19),
    .clk (net1),
    .q (net20)
  );
  and_cell gate8 (
    .a (net17),
    .b (net18),
    .out (net21)
  );
  and_cell gate7 (
    .a (net19),
    .b (net20),
    .out (net22)
  );
  and_cell gate9 (
    .a (net21),
    .b (net22),
    .out (net23)
  );
  dff_cell flipflop6 (
    .d (net24),
    .clk (net25),
    .q (net10)
  );
  dff_cell flipflop7 (
    .d (net26),
    .clk (net25),
    .q (net27)
  );
  xor_cell gate10 (
    .a (net10),
    .b (net27),
    .out (net28)
  );
  not_cell gate11 (
    .in (net28),
    .out (net9)
  );
  not_cell gate12 (
    .in (net27),
    .out (net11)
  );
  xor_cell gate13 (
    .a (net2),
    .b (net9),
    .out (net29)
  );
  xor_cell gate14 (
    .a (net3),
    .b (net10),
    .out (net30)
  );
  xor_cell gate15 (
    .a (net4),
    .b (net11),
    .out (net31)
  );
  xor_cell gate16 (
    .a (net5),
    .b (net9),
    .out (net32)
  );
  xor_cell gate17 (
    .a (net6),
    .b (net10),
    .out (net33)
  );
  xor_cell gate18 (
    .a (net7),
    .b (net11),
    .out (net34)
  );
  not_cell gate19 (
    .in (net30),
    .out (net35)
  );
  nand_cell gate21 (
    .a (net29),
    .b (net35),
    .out (net36)
  );
  and_cell gate20 (
    .a (net36),
    .b (net31),
    .out (net37)
  );
  or_cell gate22 (
    .a (net32),
    .b (net33),
    .out (net38)
  );
  or_cell gate23 (
    .a (net38),
    .b (net34),
    .out (net39)
  );
  and_cell gate24 (
    .a (net37),
    .b (net39),
    .out (net40)
  );
  or_cell gate25 (
    .a (net37),
    .b (net39),
    .out (net41)
  );
  xor_cell gate26 (
    .a (net10),
    .b (net40),
    .out (net26)
  );
  xor_cell gate27 (
    .a (net27),
    .b (net41),
    .out (net24)
  );
  buffer_cell gate28 (
    .in (net23),
    .out (net25)
  );
endmodule
