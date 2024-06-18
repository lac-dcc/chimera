// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341614536664547922 */

`default_nettype none

module user_module_341614536664547922(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[6];
  wire net3 = io_in[7];
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = 1'b0;
  wire net12 = 1'b1;
  wire net13 = 1'b1;
  wire net14;
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

  assign io_out[0] = net4;
  assign io_out[1] = net5;
  assign io_out[2] = net6;
  assign io_out[3] = net7;
  assign io_out[4] = net8;
  assign io_out[5] = net9;
  assign io_out[6] = net10;
  assign io_out[7] = net3;

  and_cell gate1 (
    .a (net14),
    .b (net15),
    .out (net16)
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
    .d (net17),
    .clk (net1),
    .q (net18),
    .notq (net4)
  );
  dff_cell flipflop3 (
    .d (net18),
    .clk (net1),
    .q (net19),
    .notq (net5)
  );
  dff_cell flipflop4 (
    .d (net20),
    .clk (net1),
    .q (net21),
    .notq (net8)
  );
  dff_cell flipflop5 (
    .d (net19),
    .clk (net1),
    .q (net20),
    .notq (net22)
  );
  dff_cell flipflop6 (
    .d (net21),
    .clk (net1),
    .q (net23),
    .notq (net7)
  );
  dff_cell flipflop7 (
    .d (net23),
    .clk (net1),
    .q (net24),
    .notq (net6)
  );
  dff_cell flipflop8 (
    .d (net24),
    .clk (net1),
    .q (net25),
    .notq (net26)
  );
  or_cell gate7 (
    .a (net16),
    .b (net27),
    .out (net17)
  );
  and_cell gate8 (
    .a (net3),
    .b (net2),
    .out (net27)
  );
  not_cell gate9 (
    .in (net3),
    .out (net15)
  );
  dff_cell flipflop9 (
    .d (net25),
    .clk (net1),
    .q (net14),
    .notq (net9)
  );
  or_cell gate10 (
    .a (net22),
    .b (net26),
    .out (net28)
  );
  and_cell gate11 (

  );
  and_cell gate12 (
    .a (net26),
    .b (net22),
    .out (net29)
  );
  and_cell gate13 (
    .a (net4),
    .b (net29),
    .out (net30)
  );
  and_cell gate14 (
    .a (net31),
    .b (net28),
    .out (net32)
  );
  not_cell gate15 (
    .in (net4),
    .out (net31)
  );
  or_cell gate16 (
    .a (net32),
    .b (net30),
    .out (net10)
  );
endmodule
