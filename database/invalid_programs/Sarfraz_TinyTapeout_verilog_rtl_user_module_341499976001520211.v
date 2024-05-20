// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341499976001520211 */

`default_nettype none

module user_module_341499976001520211(
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
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15 = 1'b0;
  wire net16 = 1'b1;
  wire net17 = 1'b1;
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

  assign io_out[0] = net8;
  assign io_out[2] = net9;
  assign io_out[3] = net10;
  assign io_out[4] = net11;
  assign io_out[5] = net12;
  assign io_out[6] = net13;
  assign io_out[7] = net14;

  and_cell gate1 (
    .a (net11),
    .b (net2),
    .out (net18)
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
    .a (net18),
    .b (net19),
    .sel (net4),
    .out (net8)
  );
  dff_cell flipflop1 (

  );
  dff_cell flipflop2 (
    .d (net12),
    .clk (net1),
    .q (net13)
  );
  dff_cell flipflop3 (
    .d (net20),
    .clk (net1),
    .q (net21)
  );
  dff_cell flipflop4 (
    .d (net22),
    .clk (net1),
    .q (net23)
  );
  and_cell gate7 (
    .a (net13),
    .b (net12),
    .out (net20)
  );
  mux_cell mux3 (
    .a (net3),
    .b (net24),
    .sel (net5),
    .out (net12)
  );
  not_cell gate8 (
    .in (net18),
    .out (net19)
  );
  not_cell gate9 (
    .in (net3),
    .out (net24)
  );
  and_cell gate10 (
    .a (net21),
    .b (net12),
    .out (net22)
  );
  mux_cell mux4 (
    .a (net12),
    .b (net14),
    .sel (net6),
    .out (net25)
  );
  and_cell gate11 (

  );
  and_cell gate12 (
    .a (net23),
    .b (net12),
    .out (net14)
  );
  dff_cell flipflop5 (
    .d (net10),
    .clk (net1),
    .q (net26)
  );
  or_cell gate14 (
    .a (net9),
    .b (net25),
    .out (net10)
  );
  and_cell gate15 (
    .a (net26),
    .b (net2),
    .out (net9)
  );
  not_cell gate13 (
    .in (net27),
    .out (net11)
  );
  mux_cell mux2 (
    .a (net26),
    .b (net10),
    .sel (net7),
    .out (net27)
  );
endmodule
