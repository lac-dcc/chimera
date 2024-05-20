// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341440114308678227 */

`default_nettype none

module user_module_341440114308678227(
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
  wire net10 = 1'b0;
  wire net11 = 1'b1;
  wire net12 = 1'b1;
  wire net13;
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
  mux_cell mux1 (

  );
  dff_cell flipflop1 (

  );
  dff_cell flipflop2 (
    .d (net13),
    .clk (net1),
    .q (net14),
    .notq (net13)
  );
  dff_cell flipflop3 (
    .d (net15),
    .clk (net13),
    .q (net16),
    .notq (net15)
  );
  dff_cell flipflop4 (
    .d (net17),
    .clk (net15),
    .q (net18),
    .notq (net17)
  );
  and_cell gate7 (
    .a (net13),
    .b (net15),
    .out (net19)
  );
  and_cell gate8 (
    .a (net19),
    .b (net17),
    .out (net2)
  );
  and_cell gate9 (
    .a (net14),
    .b (net15),
    .out (net20)
  );
  and_cell gate10 (
    .a (net20),
    .b (net17),
    .out (net3)
  );
  and_cell gate11 (
    .a (net13),
    .b (net16),
    .out (net21)
  );
  and_cell gate12 (
    .a (net21),
    .b (net17),
    .out (net4)
  );
  and_cell gate13 (
    .a (net14),
    .b (net16),
    .out (net22)
  );
  and_cell gate14 (
    .a (net22),
    .b (net17),
    .out (net5)
  );
  and_cell gate15 (
    .a (net13),
    .b (net15),
    .out (net23)
  );
  and_cell gate16 (
    .a (net23),
    .b (net18),
    .out (net6)
  );
  and_cell gate17 (
    .a (net14),
    .b (net15),
    .out (net24)
  );
  and_cell gate18 (
    .a (net24),
    .b (net18),
    .out (net7)
  );
  and_cell gate19 (
    .a (net13),
    .b (net16),
    .out (net25)
  );
  and_cell gate20 (
    .a (net25),
    .b (net18),
    .out (net8)
  );
  and_cell gate21 (
    .a (net14),
    .b (net16),
    .out (net26)
  );
  and_cell gate22 (
    .a (net26),
    .b (net18),
    .out (net9)
  );
endmodule
