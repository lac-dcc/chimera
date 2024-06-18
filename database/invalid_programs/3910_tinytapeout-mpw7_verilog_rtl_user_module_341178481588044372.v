// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341178481588044372 */

`default_nettype none

module user_module_341178481588044372(
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
    .b (net20),
    .out (net21)
  );
  or_cell gate2 (
    .a (net21),
    .b (net22),
    .out (net23)
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
    .d (net24),
    .clk (net1),
    .q (net25),
    .notq (net24)
  );
  dff_cell flipflop2 (
    .d (net26),
    .clk (net25),
    .q (net27),
    .notq (net26)
  );
  dff_cell flipflop3 (
    .d (net28),
    .clk (net27),
    .q (net29),
    .notq (net28)
  );
  dff_cell flipflop4 (
    .d (net30),
    .clk (net29),
    .q (net31),
    .notq (net30)
  );
  dff_cell flipflop5 (
    .d (net32),
    .clk (net31),
    .q (net33),
    .notq (net32)
  );
  dff_cell flipflop6 (
    .d (net34),
    .clk (net33),
    .q (net35),
    .notq (net34)
  );
  dff_cell flipflop7 (
    .d (net36),
    .clk (net35),
    .q (net20),
    .notq (net36)
  );
  dff_cell flipflop8 (
    .d (net37),
    .clk (net20),
    .q (net38),
    .notq (net37)
  );
  dff_cell flipflop9 (
    .d (net39),
    .clk (net38),
    .q (net40),
    .notq (net39)
  );
  dff_cell flipflop10 (
    .d (net41),
    .clk (net40),
    .q (net42),
    .notq (net41)
  );
  dff_cell flipflop11 (
    .d (net43),
    .clk (net42),
    .q (net44),
    .notq (net43)
  );
  dff_cell flipflop12 (
    .d (net45),
    .clk (net44),
    .q (net46),
    .notq (net45)
  );
  dff_cell flipflop13 (
    .d (net47),
    .clk (net46),
    .q (net16),
    .notq (net47)
  );
  dff_cell flipflop14 (
    .d (net8),
    .clk (net16),
    .q (net9)
  );
  dff_cell flipflop15 (
    .d (net9),
    .clk (net16),
    .q (net10)
  );
  dff_cell flipflop16 (
    .d (net10),
    .clk (net16),
    .q (net11)
  );
  dff_cell flipflop17 (
    .d (net11),
    .clk (net16),
    .q (net12)
  );
  dff_cell flipflop18 (
    .d (net12),
    .clk (net16),
    .q (net13)
  );
  dff_cell flipflop19 (
    .d (net13),
    .clk (net16),
    .q (net14)
  );
  and_cell gate7 (
    .a (net3),
    .b (net38),
    .out (net22)
  );
  and_cell gate8 (
    .a (net4),
    .b (net40),
    .out (net48)
  );
  and_cell gate9 (
    .a (net5),
    .b (net42),
    .out (net49)
  );
  and_cell gate10 (
    .a (net6),
    .b (net44),
    .out (net50)
  );
  and_cell gate11 (
    .a (net7),
    .b (net46),
    .out (net51)
  );
  or_cell gate12 (
    .a (net48),
    .b (net49),
    .out (net52)
  );
  or_cell gate15 (
    .a (net50),
    .b (net51),
    .out (net53)
  );
  or_cell gate16 (
    .a (net23),
    .b (net54),
    .out (net15)
  );
  or_cell gate17 (
    .a (net52),
    .b (net53),
    .out (net54)
  );
endmodule
