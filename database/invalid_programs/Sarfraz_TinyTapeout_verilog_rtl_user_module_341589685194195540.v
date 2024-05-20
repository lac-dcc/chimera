// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341589685194195540 */

`default_nettype none

module user_module_341589685194195540(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[4];
  wire net2 = io_in[5];
  wire net3 = io_in[6];
  wire net4 = io_in[7];
  wire net5;
  wire net6 = 1'b0;
  wire net7 = 1'b1;
  wire net8 = 1'b1;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;

  assign io_out[7] = net5;

  and_cell gate1 (
    .a (net1),
    .b (net9),
    .out (net10)
  );
  or_cell gate2 (

  );
  xor_cell gate3 (
    .a (net11),
    .b (net12),
    .out (net5)
  );
  nand_cell gate4 (

  );
  not_cell gate5 (
    .in (net13),
    .out (net14)
  );
  buffer_cell gate6 (
    .in (net15),
    .out (net9)
  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (

  );
  not_cell gate7 (

  );
  and_cell gate8 (
    .a (net14),
    .b (net3),
    .out (net16)
  );
  xor_cell gate9 (
    .a (net10),
    .b (net16),
    .out (net11)
  );
  buffer_cell gate10 (
    .in (net2),
    .out (net15)
  );
  buffer_cell gate11 (
    .in (net2),
    .out (net13)
  );
  buffer_cell gate12 (
    .in (net17),
    .out (net18)
  );
  buffer_cell gate13 (
    .in (net18),
    .out (net12)
  );
  buffer_cell gate14 (
    .in (net4),
    .out (net17)
  );
endmodule
