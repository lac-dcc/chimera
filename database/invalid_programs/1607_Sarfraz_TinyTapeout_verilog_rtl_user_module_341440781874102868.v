// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341440781874102868 */

`default_nettype none

module user_module_341440781874102868(
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
  wire net25 = 1'b0;

  assign io_out[0] = net4;
  assign io_out[1] = net5;
  assign io_out[2] = net6;
  assign io_out[3] = net7;
  assign io_out[4] = net8;
  assign io_out[5] = net9;
  assign io_out[6] = net10;
  assign io_out[7] = net11;

  and_cell gate1 (

  );
  or_cell gate2 (

  );
  xor_cell gate3 (

  );
  not_cell gate5 (
    .in (net2),
    .out (net14)
  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (

  );
  not_cell gate8 (
    .in (net3),
    .out (net15)
  );
  not_cell gate9 (
    .in (net1),
    .out (net16)
  );
  and_cell gate4 (
    .a (net17),
    .b (net15),
    .out (net4)
  );
  and_cell gate7 (
    .a (net18),
    .b (net3),
    .out (net5)
  );
  and_cell gate10 (
    .a (net19),
    .b (net15),
    .out (net6)
  );
  and_cell gate11 (
    .a (net20),
    .b (net3),
    .out (net7)
  );
  and_cell gate12 (
    .a (net21),
    .b (net15),
    .out (net8)
  );
  and_cell gate13 (
    .a (net22),
    .b (net3),
    .out (net9)
  );
  and_cell gate14 (
    .a (net23),
    .b (net15),
    .out (net10)
  );
  and_cell gate15 (
    .a (net16),
    .b (net14),
    .out (net17)
  );
  and_cell gate16 (
    .a (net16),
    .b (net14),
    .out (net18)
  );
  and_cell gate17 (
    .a (net16),
    .b (net2),
    .out (net19)
  );
  and_cell gate18 (
    .a (net16),
    .b (net2),
    .out (net20)
  );
  and_cell gate19 (
    .a (net1),
    .b (net14),
    .out (net21)
  );
  and_cell gate20 (
    .a (net1),
    .b (net14),
    .out (net22)
  );
  and_cell gate21 (
    .a (net1),
    .b (net2),
    .out (net23)
  );
  and_cell gate22 (
    .a (net1),
    .b (net2),
    .out (net24)
  );
  and_cell gate23 (
    .a (net24),
    .b (net3),
    .out (net11)
  );
endmodule
