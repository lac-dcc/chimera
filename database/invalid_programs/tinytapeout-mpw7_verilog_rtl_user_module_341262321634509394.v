// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341262321634509394 */

`default_nettype none

module user_module_341262321634509394(
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
  wire net38 = 1'b1;
  wire net39 = 1'b0;
  wire net40;
  wire net41 = 1'b0;

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;
  assign io_out[6] = net15;
  assign io_out[7] = net16;

  and_cell gate1 (
    .a (net20),
    .b (net7),
    .out (net14)
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
    .d (net21),
    .clk (net22),
    .q (net23),
    .notq (net21)
  );
  dff_cell flipflop3 (
    .d (net24),
    .clk (net1),
    .q (net22),
    .notq (net24)
  );
  and_cell gate7 (
    .a (net25),
    .b (net3),
    .out (net10)
  );
  and_cell gate8 (
    .a (net26),
    .b (net4),
    .out (net11)
  );
  and_cell gate9 (
    .a (net27),
    .b (net5),
    .out (net12)
  );
  and_cell gate10 (
    .a (net28),
    .b (net6),
    .out (net13)
  );
  and_cell gate11 (
    .a (net29),
    .b (net2),
    .out (net9)
  );
  and_cell gate12 (
    .a (net30),
    .b (net8),
    .out (net15)
  );
  dff_cell flipflop4 (
    .d (net31),
    .clk (net23),
    .q (net32),
    .notq (net31)
  );
  dff_cell flipflop5 (
    .d (net33),
    .clk (net32),
    .q (net16),
    .notq (net33)
  );
  dff_cell flipflop6 (
    .d (net34),
    .clk (net32),
    .q (net29)
  );
  dff_cell flipflop7 (
    .d (net29),
    .clk (net32),
    .q (net25)
  );
  dff_cell flipflop8 (
    .d (net25),
    .clk (net32),
    .q (net35)
  );
  dff_cell flipflop9 (
    .d (net35),
    .clk (net32),
    .q (net28)
  );
  dff_cell flipflop10 (
    .d (net28),
    .clk (net32),
    .q (net27)
  );
  dff_cell flipflop11 (
    .d (net27),
    .clk (net32),
    .q (net26)
  );
  dff_cell flipflop12 (
    .d (net26),
    .clk (net32),
    .q (net36)
  );
  dff_cell flipflop13 (
    .d (net36),
    .clk (net32),
    .q (net20)
  );
  or_cell gate14 (
    .a (net35),
    .b (net36),
    .out (net30)
  );
  or_cell gate13 (
    .a (net37),
    .b (net20),
    .out (net34)
  );
  dff_cell flipflop15 (
    .d (net38),
    .clk (net32),
    .q (net40)
  );
  dff_cell flipflop14 (
    .d (net40),
    .clk (net32),
    .notq (net37)
  );
endmodule
