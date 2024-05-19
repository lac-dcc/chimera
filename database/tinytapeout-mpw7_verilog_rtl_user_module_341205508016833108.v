// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341205508016833108 */

`default_nettype none

module user_module_341205508016833108(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[1];
  wire net2 = io_in[3];
  wire net3 = io_in[4];
  wire net4 = io_in[5];
  wire net5 = io_in[6];
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
  wire net16 = 1'b1;
  wire net17;
  wire net18 = 1'b1;
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
  wire net29;
  wire net30;
  wire net31;
  wire net32;
  wire net33;
  wire net34;
  wire net35;
  wire net36;
  wire net37;
  wire net38;
  wire net39;

  assign io_out[1] = net6;
  assign io_out[2] = net7;
  assign io_out[3] = net8;
  assign io_out[5] = net9;

  and_cell gate1 (
    .a (net13),
    .b (net14),
    .out (net6)
  );
  or_cell gate2 (

  );
  xor_cell gate3 (

  );
  not_cell gate5 (
    .in (net15),
    .out (net14)
  );
  buffer_cell gate6 (

  );
  dff_cell flipflop1 (
    .d (net16),
    .clk (net1),
    .q (net13)
  );
  and_cell gate7 (
    .a (net17),
    .b (net14),
    .out (net7)
  );
  dff_cell flipflop2 (
    .d (net18),
    .clk (net19),
    .q (net17)
  );
  and_cell gate4 (
    .a (net7),
    .b (net6),
    .out (net15)
  );
  dff_cell flipflop3 (
    .d (net20),
    .clk (net5),
    .q (net21),
    .notq (net20)
  );
  dff_cell flipflop4 (
    .d (net22),
    .clk (net21),
    .q (net23),
    .notq (net22)
  );
  dff_cell flipflop5 (
    .d (net24),
    .clk (net23),
    .q (net25),
    .notq (net24)
  );
  dff_cell flipflop6 (
    .d (net26),
    .clk (net25),
    .q (net27),
    .notq (net26)
  );
  dff_cell flipflop7 (
    .d (net28),
    .clk (net27),
    .q (net29),
    .notq (net28)
  );
  dff_cell flipflop8 (
    .d (net30),
    .clk (net29),
    .q (net31),
    .notq (net30)
  );
  dff_cell flipflop9 (
    .d (net32),
    .clk (net31),
    .q (net33),
    .notq (net32)
  );
  mux_cell mux2 (
    .a (net21),
    .b (net5),
    .sel (net2),
    .out (net34)
  );
  mux_cell mux3 (
    .a (net25),
    .b (net23),
    .sel (net2),
    .out (net35)
  );
  mux_cell mux4 (
    .a (net29),
    .b (net27),
    .sel (net2),
    .out (net36)
  );
  mux_cell mux5 (
    .a (net33),
    .b (net31),
    .sel (net2),
    .out (net37)
  );
  mux_cell mux1 (
    .a (net37),
    .b (net36),
    .sel (net3),
    .out (net38)
  );
  mux_cell mux6 (
    .a (net35),
    .b (net34),
    .sel (net3),
    .out (net39)
  );
  mux_cell mux7 (
    .a (net38),
    .b (net39),
    .sel (net4),
    .out (net19)
  );
  buffer_cell gate8 (
    .in (net14),
    .out (net8)
  );
  buffer_cell gate9 (
    .in (net19),
    .out (net9)
  );
endmodule
