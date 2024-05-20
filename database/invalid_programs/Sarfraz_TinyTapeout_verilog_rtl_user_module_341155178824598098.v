// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341155178824598098 */

`default_nettype none

module user_module_341155178824598098(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
  wire net5 = io_in[4];
  wire net6 = io_in[5];
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
  wire net27;
  wire net28;
  wire net29;
  wire net30;
  wire net31;

  assign io_out[0] = net7;
  assign io_out[1] = net8;
  assign io_out[2] = net9;

  xor_cell gate3 (
    .a (net13),
    .b (net14),
    .out (net15)
  );
  and_cell gate100 (
    .a (net16),
    .b (net17),
    .out (net18)
  );
  mux_cell mux1 (
    .a (net15),
    .b (net2),
    .sel (net3),
    .out (net19)
  );
  dff_cell flipflop1 (
    .d (net19),
    .clk (net1),
    .q (net20)
  );
  xor_cell gate7 (
    .a (net16),
    .b (net17),
    .out (net21)
  );
  or_cell gate9 (
    .a (net22),
    .b (net18),
    .out (net23)
  );
  dff_cell flipflop2 (
    .d (net20),
    .clk (net1),
    .q (net24)
  );
  dff_cell flipflop3 (
    .d (net24),
    .clk (net1),
    .q (net13)
  );
  dff_cell flipflop4 (
    .d (net13),
    .clk (net1),
    .q (net25)
  );
  dff_cell flipflop5 (
    .d (net25),
    .clk (net1),
    .q (net26)
  );
  dff_cell flipflop6 (
    .d (net26),
    .clk (net1),
    .q (net27)
  );
  dff_cell flipflop7 (
    .d (net27),
    .clk (net1),
    .q (net28)
  );
  dff_cell flipflop8 (
    .d (net28),
    .clk (net1),
    .q (net7)
  );
  xor_cell gate10 (
    .a (net26),
    .b (net29),
    .out (net14)
  );
  xor_cell gate11 (
    .a (net27),
    .b (net7),
    .out (net29)
  );
  dff_cell flipflop9 (
    .d (net4),
    .clk (net1),
    .q (net16)
  );
  dff_cell flipflop10 (
    .d (net5),
    .clk (net1),
    .q (net17)
  );
  dff_cell flipflop11 (
    .d (net6),
    .clk (net1),
    .q (net30)
  );
  dff_cell flipflop12 (
    .d (net23),
    .clk (net1),
    .q (net9)
  );
  dff_cell flipflop13 (
    .d (net31),
    .clk (net1),
    .q (net8)
  );
  xor_cell gate1 (
    .a (net21),
    .b (net30),
    .out (net31)
  );
  and_cell gate2 (
    .a (net21),
    .b (net30),
    .out (net22)
  );
endmodule
