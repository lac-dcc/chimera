// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341224613878956628 */

`default_nettype none

module user_module_341224613878956628(
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
  wire net14 = 1'b0;
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;

  and_cell gate1 (
    .a (net1),
    .b (net5),
    .out (net17)
  );
  or_cell gate2 (

  );
  xor_cell gate3 (
    .a (net2),
    .b (net6),
    .out (net18)
  );
  nand_cell gate4 (

  );
  not_cell gate5 (

  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (
    .a (net19),
    .b (net20),
    .sel (net17),
    .out (net21)
  );
  dff_cell flipflop1 (

  );
  xor_cell gate7 (
    .a (net1),
    .b (net5),
    .out (net9)
  );
  xor_cell gate8 (
    .a (net17),
    .b (net18),
    .out (net10)
  );
  xor_cell gate9 (

  );
  and_cell gate10 (

  );
  mux_cell mux2 (

  );
  and_cell gate11 (
    .a (net2),
    .b (net6),
    .out (net19)
  );
  or_cell gate12 (

  );
  or_cell gate13 (
    .a (net2),
    .b (net6),
    .out (net20)
  );
  xor_cell gate14 (
    .a (net3),
    .b (net7),
    .out (net22)
  );
  mux_cell mux3 (
    .a (net23),
    .b (net24),
    .sel (net21),
    .out (net25)
  );
  xor_cell gate15 (
    .a (net21),
    .b (net22),
    .out (net11)
  );
  and_cell gate16 (
    .a (net3),
    .b (net7),
    .out (net23)
  );
  or_cell gate17 (

  );
  or_cell gate18 (
    .a (net3),
    .b (net7),
    .out (net24)
  );
  xor_cell gate19 (
    .a (net4),
    .b (net8),
    .out (net26)
  );
  mux_cell mux4 (
    .a (net27),
    .b (net28),
    .sel (net25),
    .out (net13)
  );
  xor_cell gate20 (
    .a (net25),
    .b (net26),
    .out (net12)
  );
  and_cell gate21 (
    .a (net4),
    .b (net8),
    .out (net27)
  );
  or_cell gate22 (
    .a (net4),
    .b (net8),
    .out (net28)
  );
endmodule
