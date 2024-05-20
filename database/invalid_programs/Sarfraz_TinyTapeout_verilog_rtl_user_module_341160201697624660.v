// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341160201697624660 */

`default_nettype none

module user_module_341160201697624660(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
  wire net5 = io_in[4];
  wire net6 = io_in[5];
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
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
  wire net35 = 1'b0;
  wire net36 = 1'b0;

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
    .clk (net18),
    .q (net19),
    .notq (net17)
  );
  dff_cell flipflop3 (
    .d (net20),
    .clk (net19),
    .q (net21),
    .notq (net20)
  );
  dff_cell flipflop4 (
    .d (net22),
    .clk (net21),
    .q (net23),
    .notq (net22)
  );
  dff_cell flipflop5 (
    .d (net24),
    .clk (net23),
    .q (net25),
    .notq (net24)
  );
  mux_cell mux2 (
    .a (net1),
    .b (net2),
    .sel (net5),
    .out (net18)
  );
  mux_cell mux3 (
    .a (net3),
    .b (net4),
    .sel (net6),
    .out (net26)
  );
  dff_cell flipflop6 (
    .d (net27),
    .clk (net26),
    .q (net28),
    .notq (net27)
  );
  dff_cell flipflop7 (
    .d (net29),
    .clk (net28),
    .q (net30),
    .notq (net29)
  );
  dff_cell flipflop8 (
    .d (net31),
    .clk (net30),
    .q (net32),
    .notq (net31)
  );
  dff_cell flipflop9 (
    .d (net33),
    .clk (net32),
    .q (net34),
    .notq (net33)
  );
  buffer_cell gate7 (
    .in (net19),
    .out (net7)
  );
  buffer_cell gate9 (
    .in (net21),
    .out (net8)
  );
  buffer_cell gate10 (
    .in (net23),
    .out (net9)
  );
  buffer_cell gate11 (
    .in (net25),
    .out (net10)
  );
  buffer_cell gate12 (
    .in (net28),
    .out (net11)
  );
  buffer_cell gate13 (
    .in (net30),
    .out (net12)
  );
  buffer_cell gate14 (
    .in (net32),
    .out (net13)
  );
  buffer_cell gate15 (
    .in (net34),
    .out (net14)
  );
endmodule
