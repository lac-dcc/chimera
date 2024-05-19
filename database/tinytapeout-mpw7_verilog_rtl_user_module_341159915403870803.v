// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341159915403870803 */

`default_nettype none

module user_module_341159915403870803(
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
  wire net23 = 1'b0;
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

  assign io_out[0] = net4;
  assign io_out[1] = net5;
  assign io_out[2] = net6;
  assign io_out[3] = net7;
  assign io_out[4] = net8;
  assign io_out[5] = net9;
  assign io_out[6] = net10;
  assign io_out[7] = net11;

  dff_cell flipflop1 (
    .d (net2),
    .clk (net14),
    .q (net15)
  );
  dff_cell flipflop2 (
    .d (net15),
    .clk (net14),
    .q (net16)
  );
  dff_cell flipflop3 (
    .d (net16),
    .clk (net14),
    .q (net17)
  );
  dff_cell flipflop5 (
    .d (net17),
    .clk (net14),
    .q (net18)
  );
  dff_cell flipflop6 (
    .d (net18),
    .clk (net14),
    .q (net19)
  );
  dff_cell flipflop7 (
    .d (net19),
    .clk (net14),
    .q (net20)
  );
  dff_cell flipflop8 (
    .d (net20),
    .clk (net14),
    .q (net21)
  );
  dff_cell flipflop9 (
    .d (net21),
    .clk (net14),
    .q (net22)
  );
  mux_cell mux2 (
    .a (net15),
    .b (net24),
    .sel (net3),
    .out (net4)
  );
  mux_cell mux3 (
    .a (net16),
    .b (net25),
    .sel (net3),
    .out (net5)
  );
  mux_cell mux4 (
    .a (net17),
    .b (net26),
    .sel (net3),
    .out (net6)
  );
  mux_cell mux5 (
    .a (net18),
    .b (net27),
    .sel (net3),
    .out (net7)
  );
  mux_cell mux7 (
    .a (net20),
    .b (net28),
    .sel (net3),
    .out (net9)
  );
  mux_cell mux8 (
    .a (net21),
    .b (net29),
    .sel (net3),
    .out (net10)
  );
  mux_cell mux9 (
    .a (net22),
    .b (net30),
    .sel (net3),
    .out (net11)
  );
  dff_cell flipflop10 (
    .d (net2),
    .clk (net31),
    .q (net24)
  );
  dff_cell flipflop11 (
    .d (net24),
    .clk (net31),
    .q (net25)
  );
  dff_cell flipflop12 (
    .d (net25),
    .clk (net31),
    .q (net26)
  );
  dff_cell flipflop13 (
    .d (net26),
    .clk (net31),
    .q (net27)
  );
  dff_cell flipflop14 (
    .d (net27),
    .clk (net31),
    .q (net32)
  );
  dff_cell flipflop15 (
    .d (net32),
    .clk (net31),
    .q (net28)
  );
  dff_cell flipflop16 (
    .d (net28),
    .clk (net31),
    .q (net29)
  );
  dff_cell flipflop17 (
    .d (net29),
    .clk (net31),
    .q (net30)
  );
  mux_cell mux6 (
    .a (net19),
    .b (net32),
    .sel (net3),
    .out (net8)
  );
  and_cell gate7 (
    .a (net3),
    .b (net1),
    .out (net14)
  );
  and_cell gate8 (
    .a (net1),
    .b (net33),
    .out (net31)
  );
  not_cell gate9 (
    .in (net3),
    .out (net33)
  );
endmodule
