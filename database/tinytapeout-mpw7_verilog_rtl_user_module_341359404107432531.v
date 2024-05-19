// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341359404107432531 */

`default_nettype none

module user_module_341359404107432531(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = 1'b0;
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
  wire net19 = 1'b0;
  wire net20;
  wire net21;
  wire net22 = 1'b0;
  wire net23 = 1'b1;
  wire net24;
  wire net25;
  wire net26 = 1'b0;
  wire net27 = 1'b1;
  wire net28;
  wire net29;
  wire net30;
  wire net31;
  wire net32;
  wire net33 = 1'b0;
  wire net34;
  wire net35;
  wire net36;
  wire net37 = 1'b1;
  wire net38;
  wire net39;
  wire net40;
  wire net41;
  wire net42 = 1'b1;

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
    .d (net13),
    .clk (net1),
    .q (net14),
    .notq (net13)
  );
  dff_cell flipflop2 (
    .d (net15),
    .clk (net13),
    .q (net16),
    .notq (net15)
  );
  dff_cell flipflop3 (
    .d (net17),
    .clk (net15),
    .q (net18),
    .notq (net17)
  );
  mux_cell mux2 (
    .a (net19),
    .b (net20),
    .sel (net18),
    .out (net9)
  );
  not_cell gate7 (
    .in (net14),
    .out (net20)
  );
  mux_cell mux3 (
    .a (net21),
    .b (net20),
    .sel (net18),
    .out (net8)
  );
  mux_cell mux4 (
    .a (net22),
    .b (net23),
    .sel (net14),
    .out (net24)
  );
  mux_cell mux5 (
    .a (net23),
    .b (net22),
    .sel (net14),
    .out (net25)
  );
  mux_cell mux6 (
    .a (net25),
    .b (net24),
    .sel (net16),
    .out (net21)
  );
  mux_cell mux7 (
    .a (net26),
    .b (net27),
    .sel (net14),
    .out (net28)
  );
  mux_cell mux8 (
    .a (net27),
    .b (net26),
    .sel (net14),
    .out (net29)
  );
  mux_cell mux9 (
    .a (net28),
    .b (net29),
    .sel (net16),
    .out (net30)
  );
  mux_cell mux10 (
    .a (net23),
    .b (net22),
    .sel (net16),
    .out (net31)
  );
  mux_cell mux11 (
    .a (net30),
    .b (net31),
    .sel (net18),
    .out (net7)
  );
  mux_cell mux12 (
    .a (net32),
    .sel (net18),
    .out (net6)
  );
  mux_cell mux13 (
    .a (net33),
    .b (net34),
    .sel (net16),
    .out (net32)
  );
  mux_cell mux14 (
    .a (net27),
    .b (net33),
    .sel (net14),
    .out (net34)
  );
  mux_cell mux15 (
    .a (net35),
    .b (net36),
    .sel (net18),
    .out (net5)
  );
  mux_cell mux16 (
    .a (net37),
    .b (net38),
    .sel (net16),
    .out (net35)
  );
  mux_cell mux17 (
    .a (net33),
    .b (net39),
    .sel (net16),
    .out (net36)
  );
  mux_cell mux18 (
    .a (net33),
    .b (net37),
    .sel (net14),
    .out (net38)
  );
  mux_cell mux19 (
    .a (net37),
    .b (net33),
    .sel (net14),
    .out (net39)
  );
  mux_cell mux20 (
    .a (net33),
    .b (net37),
    .sel (net14),
    .out (net40)
  );
  mux_cell mux22 (
    .a (net33),
    .b (net40),
    .sel (net16),
    .out (net4)
  );
  mux_cell mux21 (
    .a (net37),
    .b (net41),
    .sel (net16),
    .out (net3)
  );
  mux_cell mux23 (
    .a (net42),
    .b (net2),
    .sel (net14),
    .out (net41)
  );
endmodule
