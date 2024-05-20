// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341581732833657427 */

`default_nettype none

module user_module_341581732833657427(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[6];
  wire net3 = io_in[7];
  wire net4;
  wire net5;
  wire net6;
  wire net7 = 1'b0;
  wire net8 = 1'b1;
  wire net9 = 1'b1;
  wire net10;
  wire net11;
  wire net12 = 1'b1;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19;
  wire net20 = 1'b0;
  wire net21 = 1'b0;
  wire net22;
  wire net23;
  wire net24;

  assign io_out[0] = net4;
  assign io_out[3] = net5;
  assign io_out[6] = net6;

  and_cell gate1 (

  );
  or_cell gate2 (
    .a (net2),
    .b (net3),
    .out (net10)
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
    .d (net10),
    .clk (net1),
    .q (net11)
  );
  xor_cell gate7 (
    .a (net5),
    .b (net12),
    .out (net13)
  );
  and_cell gate8 (
    .a (net5),
    .b (net12),
    .out (net14)
  );
  dff_cell flipflop3 (
    .d (net11),
    .clk (net1),
    .q (net15)
  );
  not_cell gate9 (
    .in (net15),
    .out (net16)
  );
  and_cell gate10 (
    .a (net16),
    .b (net11),
    .out (net17)
  );
  dff_cell flipflop4 (
    .d (net13),
    .clk (net17),
    .q (net5)
  );
  dff_cell flipflop5 (
    .d (net18),
    .clk (net17),
    .q (net6)
  );
  xor_cell gate11 (
    .a (net14),
    .b (net19),
    .out (net18)
  );
  xor_cell gate12 (
    .a (net6),
    .b (net20),
    .out (net19)
  );
  and_cell gate13 (
    .a (net6),
    .b (net21),
    .out (net22)
  );
  and_cell gate14 (
    .a (net19),
    .b (net14),
    .out (net23)
  );
  or_cell gate15 (
    .a (net22),
    .b (net23),
    .out (net24)
  );
  dff_cell flipflop6 (
    .d (net24),
    .clk (net17),
    .q (net4)
  );
endmodule
