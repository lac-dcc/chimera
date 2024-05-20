// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341567111632519764 */

`default_nettype none

module user_module_341567111632519764(
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
  wire net40;
  wire net41;
  wire net42;
  wire net43;
  wire net44;
  wire net45;
  wire net46;
  wire net47;
  wire net48;
  wire net49;
  wire net50;
  wire net51;
  wire net52;
  wire net53;
  wire net54;
  wire net55;
  wire net56;
  wire net57;
  wire net58;
  wire net59;
  wire net60;
  wire net61;
  wire net62;

  assign io_out[0] = net7;
  assign io_out[1] = net8;
  assign io_out[2] = net9;
  assign io_out[3] = net10;
  assign io_out[4] = net11;
  assign io_out[5] = net12;
  assign io_out[6] = net13;
  assign io_out[7] = net14;

  and_cell gate1 (

  );
  or_cell gate2 (

  );
  xor_cell gate3 (

  );
  nand_cell gate4 (

  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (
    .a (net18),
    .b (net19),
    .sel (net2),
    .out (net20)
  );
  dff_cell flipflop1 (
    .d (net21),
    .clk (net22),
    .notq (net21)
  );
  dff_cell flipflop2 (
    .d (net23),
    .clk (net21),
    .notq (net23)
  );
  dff_cell flipflop3 (
    .d (net24),
    .clk (net23),
    .notq (net24)
  );
  dff_cell flipflop4 (
    .d (net18),
    .clk (net24),
    .notq (net18)
  );
  dff_cell flipflop5 (
    .d (net25),
    .clk (net26),
    .notq (net25)
  );
  dff_cell flipflop6 (
    .d (net27),
    .clk (net25),
    .notq (net27)
  );
  dff_cell flipflop7 (
    .d (net28),
    .clk (net27),
    .notq (net28)
  );
  dff_cell flipflop8 (
    .d (net19),
    .clk (net28),
    .notq (net19)
  );
  dff_cell flipflop9 (
    .d (net29),
    .clk (net20),
    .notq (net29)
  );
  dff_cell flipflop10 (
    .d (net30),
    .clk (net29),
    .notq (net30)
  );
  dff_cell flipflop11 (
    .d (net31),
    .clk (net30),
    .notq (net31)
  );
  dff_cell flipflop12 (
    .d (net7),
    .clk (net31),
    .notq (net7)
  );
  dff_cell flipflop13 (
    .d (net32),
    .clk (net33),
    .notq (net32)
  );
  dff_cell flipflop14 (
    .d (net34),
    .clk (net32),
    .notq (net34)
  );
  dff_cell flipflop15 (
    .d (net35),
    .clk (net34),
    .notq (net35)
  );
  dff_cell flipflop16 (
    .d (net8),
    .clk (net35),
    .notq (net8)
  );
  dff_cell flipflop21 (
    .d (net36),
    .clk (net8),
    .notq (net36)
  );
  dff_cell flipflop22 (
    .d (net37),
    .clk (net36),
    .notq (net37)
  );
  dff_cell flipflop23 (
    .d (net38),
    .clk (net37),
    .notq (net38)
  );
  dff_cell flipflop24 (
    .d (net9),
    .clk (net38),
    .notq (net9)
  );
  mux_cell mux2 (
    .a (net7),
    .b (net20),
    .sel (net3),
    .out (net33)
  );
  dff_cell flipflop17 (
    .d (net4),
    .clk (net5),
    .q (net39),
    .notq (net40)
  );
  dff_cell flipflop18 (
    .d (net39),
    .clk (net5),
    .q (net41)
  );
  dff_cell flipflop19 (
    .d (net41),
    .clk (net5),
    .q (net42)
  );
  dff_cell flipflop20 (
    .d (net42),
    .clk (net5),
    .q (net43)
  );
  dff_cell flipflop25 (
    .d (net43),
    .clk (net5),
    .q (net14)
  );
  xor_cell gate13 (
    .a (net40),
    .b (net22),
    .out (net44)
  );
  xor_cell gate14 (
    .a (net41),
    .b (net44),
    .out (net45)
  );
  xor_cell gate15 (
    .a (net42),
    .b (net45),
    .out (net22)
  );
  xor_cell gate5 (
    .a (net40),
    .b (net46),
    .out (net47)
  );
  xor_cell gate7 (
    .a (net41),
    .b (net47),
    .out (net48)
  );
  xor_cell gate8 (
    .a (net42),
    .b (net48),
    .out (net49)
  );
  xor_cell gate9 (
    .a (net43),
    .b (net49),
    .out (net50)
  );
  xor_cell gate10 (
    .a (net14),
    .b (net50),
    .out (net46)
  );
  dff_cell flipflop26 (
    .d (net51),
    .clk (net9),
    .notq (net51)
  );
  dff_cell flipflop27 (
    .d (net52),
    .clk (net51),
    .notq (net52)
  );
  dff_cell flipflop28 (
    .d (net53),
    .clk (net52),
    .notq (net53)
  );
  dff_cell flipflop29 (
    .d (net10),
    .clk (net53),
    .notq (net10)
  );
  dff_cell flipflop30 (
    .d (net54),
    .clk (net10),
    .notq (net54)
  );
  dff_cell flipflop31 (
    .d (net55),
    .clk (net54),
    .notq (net55)
  );
  dff_cell flipflop32 (
    .d (net56),
    .clk (net55),
    .notq (net56)
  );
  dff_cell flipflop33 (
    .d (net11),
    .clk (net56),
    .notq (net11)
  );
  dff_cell flipflop34 (
    .d (net57),
    .clk (net11),
    .notq (net57)
  );
  dff_cell flipflop35 (
    .d (net58),
    .clk (net57),
    .notq (net58)
  );
  dff_cell flipflop36 (
    .d (net59),
    .clk (net58),
    .notq (net59)
  );
  dff_cell flipflop37 (
    .d (net12),
    .clk (net59),
    .notq (net12)
  );
  dff_cell flipflop38 (
    .d (net60),
    .clk (net12),
    .notq (net60)
  );
  dff_cell flipflop39 (
    .d (net61),
    .clk (net60),
    .notq (net61)
  );
  dff_cell flipflop40 (
    .d (net62),
    .clk (net61),
    .notq (net62)
  );
  dff_cell flipflop41 (
    .d (net13),
    .clk (net62),
    .notq (net13)
  );
  mux_cell mux3 (
    .a (net46),
    .b (net1),
    .sel (net6),
    .out (net26)
  );
endmodule
