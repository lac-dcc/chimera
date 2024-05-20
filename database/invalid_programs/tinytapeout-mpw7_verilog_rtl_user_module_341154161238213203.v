// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341154161238213203 */

`default_nettype none

module user_module_341154161238213203(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
  wire net5 = io_in[4];
  wire net6 = io_in[5];
  wire net7 = io_in[6];
  wire net8 = io_in[7];
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
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
  wire net24 = 1'b0;
  wire net25;
  wire net26;
  wire net27;

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;

  and_cell gate1 (

  );
  or_cell gate2 (

  );
  xor_cell gate3 (

  );
  not_cell gate5 (

  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (

  );
  xor_cell gate8 (
    .a (net1),
    .b (net5),
    .out (net9)
  );
  and_cell gate10 (
    .a (net1),
    .b (net5),
    .out (net15)
  );
  and_cell gate11 (
    .a (net15),
    .b (net16),
    .out (net17)
  );
  or_cell gate12 (
    .a (net17),
    .b (net18),
    .out (net19)
  );
  xor_cell gate13 (
    .a (net2),
    .b (net6),
    .out (net16)
  );
  xor_cell gate14 (
    .a (net15),
    .b (net16),
    .out (net10)
  );
  and_cell gate15 (
    .a (net2),
    .b (net6),
    .out (net18)
  );
  and_cell gate16 (
    .a (net19),
    .b (net20),
    .out (net21)
  );
  or_cell gate17 (
    .a (net21),
    .b (net22),
    .out (net23)
  );
  xor_cell gate18 (
    .a (net3),
    .b (net7),
    .out (net20)
  );
  xor_cell gate19 (
    .a (net19),
    .b (net20),
    .out (net11)
  );
  and_cell gate20 (
    .a (net3),
    .b (net7),
    .out (net22)
  );
  and_cell gate4 (
    .a (net23),
    .b (net25),
    .out (net26)
  );
  or_cell gate7 (
    .a (net26),
    .b (net27),
    .out (net13)
  );
  xor_cell gate9 (
    .a (net4),
    .b (net8),
    .out (net25)
  );
  xor_cell gate21 (
    .a (net23),
    .b (net25),
    .out (net12)
  );
  and_cell gate22 (
    .a (net4),
    .b (net8),
    .out (net27)
  );
endmodule
