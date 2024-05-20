// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341192621088047698 */

`default_nettype none

module user_module_341192621088047698(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4;
  wire net5 = 1'b0;
  wire net6 = 1'b1;
  wire net7 = 1'b1;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;

  assign io_out[0] = net4;

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
  not_cell gate9 (
    .in (net3),
    .out (net8)
  );
  not_cell gate10 (
    .in (net8),
    .out (net9)
  );
  not_cell gate7 (
    .in (net1),
    .out (net10)
  );
  not_cell gate8 (
    .in (net2),
    .out (net11)
  );
  not_cell gate11 (
    .in (net10),
    .out (net12)
  );
  not_cell gate12 (
    .in (net11),
    .out (net13)
  );
  and_cell gate13 (
    .a (net12),
    .b (net9),
    .out (net14)
  );
  and_cell gate14 (
    .a (net13),
    .b (net8),
    .out (net15)
  );
  or_cell gate15 (
    .a (net14),
    .b (net15),
    .out (net16)
  );
  not_cell gate16 (
    .in (net16),
    .out (net4)
  );
endmodule
