// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341353928049295956 */

`default_nettype none

module user_module_341353928049295956(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2;
  wire net3;
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18 = 1'b0;
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

  assign io_out[0] = net2;
  assign io_out[1] = net3;
  assign io_out[2] = net4;
  assign io_out[3] = net5;
  assign io_out[4] = net6;
  assign io_out[5] = net7;
  assign io_out[6] = net8;
  assign io_out[7] = net9;

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
  dff_cell flipflop1 (
    .d (net10),
    .clk (net11),
    .q (net12),
    .notq (net10)
  );
  dff_cell flipflop2 (
    .d (net13),
    .clk (net12),
    .q (net14),
    .notq (net13)
  );
  dff_cell flipflop3 (
    .d (net15),
    .clk (net16),
    .q (net17),
    .notq (net15)
  );
  dff_cell flipflop4 (
    .d (net19),
    .clk (net20),
    .q (net21),
    .notq (net19)
  );
  dff_cell flipflop5 (
    .d (net22),
    .clk (net23),
    .q (net16),
    .notq (net22)
  );
  dff_cell flipflop6 (
    .d (net24),
    .clk (net25),
    .q (net23),
    .notq (net24)
  );
  dff_cell flipflop7 (
    .d (net26),
    .clk (net27),
    .q (net25),
    .notq (net26)
  );
  dff_cell flipflop8 (
    .d (net28),
    .clk (net14),
    .q (net29),
    .notq (net28)
  );
  dff_cell flipflop9 (
    .d (net30),
    .clk (net29),
    .q (net27),
    .notq (net30)
  );
  dff_cell flipflop10 (
    .d (net31),
    .clk (net21),
    .q (net32),
    .notq (net31)
  );
  dff_cell flipflop11 (
    .d (net33),
    .clk (net17),
    .q (net34),
    .notq (net33)
  );
  dff_cell flipflop12 (
    .d (net35),
    .clk (net34),
    .q (net36),
    .notq (net35)
  );
  dff_cell flipflop13 (
    .d (net37),
    .clk (net38),
    .q (net20),
    .notq (net37)
  );
  dff_cell flipflop14 (
    .d (net39),
    .clk (net36),
    .q (net40),
    .notq (net39)
  );
  dff_cell flipflop15 (
    .d (net41),
    .clk (net40),
    .q (net38),
    .notq (net41)
  );
  buffer_cell gate10 (
    .in (net1),
    .out (net11)
  );
  buffer_cell gate11 (
    .in (net32),
    .out (net9)
  );
  buffer_cell gate12 (
    .in (net23),
    .out (net6)
  );
  buffer_cell gate13 (
    .in (net29),
    .out (net3)
  );
  buffer_cell gate14 (
    .in (net14),
    .out (net2)
  );
  buffer_cell gate15 (
    .in (net27),
    .out (net4)
  );
  buffer_cell gate16 (
    .in (net25),
    .out (net5)
  );
  buffer_cell gate7 (
    .in (net16),
    .out (net7)
  );
  buffer_cell gate8 (
    .in (net17),
    .out (net8)
  );
endmodule
