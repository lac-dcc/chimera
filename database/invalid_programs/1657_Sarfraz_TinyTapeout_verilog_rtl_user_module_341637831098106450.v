// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341637831098106450 */

`default_nettype none

module user_module_341637831098106450(
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
  wire net8 = 1'b0;
  wire net9 = 1'b1;
  wire net10 = 1'b1;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19;
  wire net20;
  wire net21 = 1'b1;
  wire net22;
  wire net23;

  assign io_out[0] = net3;
  assign io_out[1] = net4;
  assign io_out[2] = net4;
  assign io_out[3] = net5;
  assign io_out[4] = net6;
  assign io_out[5] = net6;
  assign io_out[6] = net7;

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
    .d (net11),
    .clk (net12),
    .q (net13)
  );
  and_cell gate7 (
    .a (net14),
    .b (net15),
    .out (net11)
  );
  dff_cell flipflop6 (
    .d (net13),
    .clk (net12),
    .q (net16)
  );
  dff_cell flipflop2 (
    .d (net16),
    .clk (net12),
    .q (net17)
  );
  dff_cell flipflop3 (
    .d (net17),
    .clk (net12),
    .q (net18)
  );
  dff_cell flipflop4 (
    .d (net19),
    .clk (net12),
    .q (net14)
  );
  or_cell gate17 (
    .a (net16),
    .b (net17),
    .out (net20)
  );
  or_cell gate18 (
    .a (net18),
    .b (net13),
    .out (net3)
  );
  or_cell gate22 (
    .a (net13),
    .b (net14),
    .out (net7)
  );
  not_cell gate24 (
    .in (net2),
    .out (net15)
  );
  mux_cell mux2 (
    .a (net21),
    .b (net22),
    .sel (net15),
    .out (net19)
  );
  buffer_cell gate11 (
    .in (net1),
    .out (net12)
  );
  dff_cell flipflop5 (
    .d (net18),
    .clk (net12),
    .q (net22)
  );
  or_cell gate13 (
    .a (net14),
    .b (net18),
    .out (net4)
  );
  not_cell gate14 (
    .in (net22),
    .out (net6)
  );
  or_cell gate15 (
    .a (net23),
    .b (net18),
    .out (net5)
  );
  or_cell gate16 (
    .a (net13),
    .b (net20),
    .out (net23)
  );
endmodule
