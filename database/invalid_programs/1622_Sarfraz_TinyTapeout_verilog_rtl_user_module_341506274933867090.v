// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341506274933867090 */

`default_nettype none

module user_module_341506274933867090(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12 = 1'b0;
  wire net13 = 1'b1;
  wire net14 = 1'b1;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19;
  wire net20;
  wire net21;
  wire net22;
  wire net23;

  assign io_out[0] = net4;
  assign io_out[1] = net5;
  assign io_out[2] = net6;
  assign io_out[3] = net7;
  assign io_out[4] = net8;
  assign io_out[5] = net9;
  assign io_out[6] = net10;
  assign io_out[7] = net11;

  and_cell gate1 (
    .a (net2),
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
    .in (net3),
    .out (net15)
  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (
    .d (net16),
    .clk (net1),
    .q (net4)
  );
  dff_cell flipflop2 (
    .d (net17),
    .clk (net1),
    .q (net7)
  );
  dff_cell flipflop3 (
    .d (net18),
    .clk (net1),
    .q (net6)
  );
  dff_cell flipflop10 (
    .d (net19),
    .clk (net1),
    .q (net5)
  );
  dff_cell flipflop4 (
    .d (net20),
    .clk (net1),
    .q (net8)
  );
  dff_cell flipflop5 (
    .d (net21),
    .clk (net1),
    .q (net9)
  );
  dff_cell flipflop6 (
    .d (net22),
    .clk (net1),
    .q (net10)
  );
  dff_cell flipflop7 (
    .d (net23),
    .clk (net1),
    .q (net11)
  );
  and_cell gate7 (
    .a (net4),
    .b (net15),
    .out (net19)
  );
  and_cell gate8 (
    .a (net5),
    .b (net15),
    .out (net18)
  );
  and_cell gate9 (
    .a (net6),
    .b (net15),
    .out (net17)
  );
  and_cell gate10 (
    .a (net7),
    .b (net15),
    .out (net20)
  );
  and_cell gate11 (
    .a (net8),
    .b (net15),
    .out (net21)
  );
  and_cell gate12 (
    .a (net9),
    .b (net15),
    .out (net22)
  );
  and_cell gate13 (
    .a (net10),
    .b (net15),
    .out (net23)
  );
endmodule
