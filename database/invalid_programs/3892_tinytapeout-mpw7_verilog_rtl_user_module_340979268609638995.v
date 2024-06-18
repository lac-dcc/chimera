// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/340979268609638995 */

`default_nettype none

module user_module_340979268609638995(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[4];
  wire net5 = io_in[5];
  wire net6 = io_in[6];
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15 = 1'b1;
  wire net16;
  wire net17;
  wire net18 = 1'b0;
  wire net19;
  wire net20;
  wire net21 = 1'b0;
  wire net22;
  wire net23 = 1'b0;
  wire net24;
  wire net25 = 1'b0;
  wire net26 = 1'b0;
  wire net27;
  wire net28;
  wire net29;
  wire net30 = 1'b0;
  wire net31;
  wire net32 = 1'b0;
  wire net33;
  wire net34 = 1'b0;
  wire net35;
  wire net36;
  wire net37 = 1'b0;
  wire net38;
  wire net39;
  wire net40;
  wire net41;
  wire net42;

  assign io_out[0] = net7;
  assign io_out[1] = net8;
  assign io_out[2] = net9;
  assign io_out[3] = net10;
  assign io_out[4] = net11;
  assign io_out[5] = net12;
  assign io_out[6] = net13;
  assign io_out[7] = net14;

  and_cell gate1 (

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

  );
  dffsr_cell flipflop2 (
    .d (net16),
    .clk (net17),
    .s (net18),
    .r (net19),
    .q (net8),
    .notq (net16)
  );
  mux_cell mux2 (

  );
  dffsr_cell flipflop3 (
    .d (net20),
    .clk (net16),
    .s (net21),
    .r (net19),
    .q (net9),
    .notq (net20)
  );
  dffsr_cell flipflop4 (
    .d (net22),
    .clk (net20),
    .s (net23),
    .r (net19),
    .q (net10),
    .notq (net22)
  );
  dffsr_cell flipflop5 (
    .d (net17),
    .clk (net24),
    .s (net25),
    .r (net19),
    .q (net7),
    .notq (net17)
  );
  or_cell gate2 (
    .a (net3),
    .b (net27),
    .out (net19)
  );
  and_cell gate7 (
    .a (net10),
    .b (net8),
    .out (net27)
  );
  and_cell gate8 (
    .a (net1),
    .b (net2),
    .out (net24)
  );
  dffsr_cell flipflop6 (
    .d (net28),
    .clk (net29),
    .s (net30),
    .r (net6),
    .q (net12)
  );
  dffsr_cell flipflop7 (
    .d (net31),
    .clk (net29),
    .s (net32),
    .r (net6),
    .q (net13)
  );
  dffsr_cell flipflop8 (
    .d (net33),
    .clk (net29),
    .s (net34),
    .r (net6),
    .q (net14),
    .notq (net35)
  );
  dffsr_cell flipflop9 (
    .d (net36),
    .clk (net29),
    .s (net37),
    .r (net6),
    .q (net11),
    .notq (net36)
  );
  xor_cell gate9 (
    .a (net12),
    .b (net11),
    .out (net38)
  );
  and_cell gate10 (
    .a (net38),
    .b (net35),
    .out (net28)
  );
  xor_cell gate11 (
    .a (net13),
    .b (net39),
    .out (net31)
  );
  and_cell gate12 (
    .a (net12),
    .b (net11),
    .out (net39)
  );
  and_cell gate13 (
    .a (net40),
    .b (net41),
    .out (net33)
  );
  xor_cell gate14 (
    .a (net14),
    .b (net42),
    .out (net40)
  );
  and_cell gate15 (
    .a (net13),
    .b (net39),
    .out (net42)
  );
  or_cell gate16 (
    .a (net36),
    .b (net35),
    .out (net41)
  );
  and_cell gate17 (
    .a (net4),
    .b (net5),
    .out (net29)
  );
endmodule
