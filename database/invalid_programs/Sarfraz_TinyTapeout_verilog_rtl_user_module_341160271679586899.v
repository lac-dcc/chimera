// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341160271679586899 */

`default_nettype none

module user_module_341160271679586899(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3;
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = 1'b1;
  wire net12 = 1'b1;
  wire net13 = 1'b0;
  wire net14 = 1'b0;
  wire net15 = 1'b0;
  wire net16 = 1'b0;
  wire net17 = 1'b0;
  wire net18 = 1'b0;
  wire net19 = 1'b0;
  wire net20 = 1'b0;
  wire net21;
  wire net22;
  wire net23;

  assign io_out[0] = net3;
  assign io_out[1] = net4;
  assign io_out[2] = net5;
  assign io_out[3] = net6;
  assign io_out[4] = net7;
  assign io_out[5] = net8;
  assign io_out[6] = net9;
  assign io_out[7] = net10;

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
  xor_cell gate7 (
    .a (net10),
    .b (net2),
    .out (net21)
  );
  dff_cell flipflop2 (
    .d (net21),
    .clk (net1),
    .q (net3)
  );
  dff_cell flipflop3 (
    .d (net3),
    .clk (net1),
    .q (net4)
  );
  dff_cell flipflop4 (
    .d (net4),
    .clk (net1),
    .q (net5)
  );
  dff_cell flipflop5 (
    .d (net5),
    .clk (net1),
    .q (net6)
  );
  xor_cell gate8 (
    .a (net21),
    .b (net6),
    .out (net22)
  );
  dff_cell flipflop6 (
    .d (net22),
    .clk (net1),
    .q (net7)
  );
  xor_cell gate9 (
    .a (net21),
    .b (net7),
    .out (net23)
  );
  dff_cell flipflop7 (
    .d (net23),
    .clk (net1),
    .q (net8)
  );
  dff_cell flipflop8 (
    .d (net8),
    .clk (net1),
    .q (net9)
  );
  dff_cell flipflop9 (
    .d (net9),
    .clk (net1),
    .q (net10)
  );
endmodule
