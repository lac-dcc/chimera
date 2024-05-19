// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341259651269001812 */

`default_nettype none

module user_module_341259651269001812(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = 1'b0;
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
  wire net63;
  wire net64;
  wire net65;
  wire net66;
  wire net67;

  assign io_out[0] = net5;
  assign io_out[1] = net6;
  assign io_out[2] = net7;
  assign io_out[3] = net8;
  assign io_out[4] = net9;
  assign io_out[5] = net10;

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
  dff_cell flipflop4 (
    .d (net14),
    .clk (net15),
    .q (net5)
  );
  dff_cell flipflop2 (
    .d (net16),
    .clk (net15),
    .q (net6)
  );
  dff_cell flipflop3 (
    .d (net17),
    .clk (net15),
    .q (net7)
  );
  dff_cell flipflop5 (
    .d (net18),
    .clk (net15),
    .q (net8)
  );
  dff_cell flipflop6 (
    .d (net19),
    .clk (net15),
    .q (net9)
  );
  dff_cell flipflop7 (
    .d (net20),
    .clk (net15),
    .q (net10)
  );
  dff_cell flipflop11 (
    .d (net21),
    .clk (net1),
    .q (net22),
    .notq (net21)
  );
  dff_cell flipflop12 (
    .d (net23),
    .clk (net22),
    .q (net24),
    .notq (net23)
  );
  dff_cell flipflop13 (
    .d (net25),
    .clk (net24),
    .q (net26),
    .notq (net25)
  );
  mux_cell mux2 (
    .a (net27),
    .b (net28),
    .sel (net3),
    .out (net29)
  );
  dff_cell flipflop8 (
    .d (net30),
    .clk (net26),
    .q (net31),
    .notq (net30)
  );
  dff_cell flipflop9 (
    .d (net32),
    .clk (net31),
    .q (net33),
    .notq (net32)
  );
  dff_cell flipflop10 (
    .d (net34),
    .clk (net33),
    .q (net35),
    .notq (net34)
  );
  dff_cell flipflop14 (
    .d (net36),
    .clk (net35),
    .q (net37),
    .notq (net36)
  );
  dff_cell flipflop15 (
    .d (net38),
    .clk (net37),
    .q (net39),
    .notq (net38)
  );
  dff_cell flipflop16 (
    .d (net40),
    .clk (net39),
    .q (net41),
    .notq (net40)
  );
  dff_cell flipflop17 (
    .d (net42),
    .clk (net41),
    .q (net43),
    .notq (net42)
  );
  dff_cell flipflop18 (
    .d (net44),
    .clk (net43),
    .q (net45),
    .notq (net44)
  );
  dff_cell flipflop19 (
    .d (net46),
    .clk (net45),
    .q (net47),
    .notq (net46)
  );
  dff_cell flipflop20 (
    .d (net48),
    .clk (net47),
    .q (net49),
    .notq (net48)
  );
  dff_cell flipflop21 (
    .d (net50),
    .clk (net49),
    .q (net51),
    .notq (net50)
  );
  dff_cell flipflop22 (
    .d (net52),
    .clk (net51),
    .q (net53),
    .notq (net52)
  );
  dff_cell flipflop23 (
    .d (net54),
    .clk (net53),
    .q (net55),
    .notq (net54)
  );
  mux_cell mux3 (
    .a (net47),
    .b (net55),
    .sel (net2),
    .out (net28)
  );
  mux_cell mux4 (
    .a (net31),
    .b (net39),
    .sel (net2),
    .out (net27)
  );
  mux_cell mux5 (
    .a (net29),
    .b (net1),
    .sel (net4),
    .out (net15)
  );
  and_cell gate12 (
    .a (net9),
    .b (net10),
    .out (net56)
  );
  and_cell gate19 (
    .a (net7),
    .b (net8),
    .out (net57)
  );
  and_cell gate20 (
    .a (net5),
    .b (net6),
    .out (net58)
  );
  and_cell gate21 (
    .a (net58),
    .b (net57),
    .out (net59)
  );
  nand_cell gate18 (
    .a (net59),
    .b (net56),
    .out (net60)
  );
  and_cell gate13 (
    .a (net60),
    .b (net10),
    .out (net61)
  );
  and_cell gate7 (
    .a (net60),
    .b (net5),
    .out (net16)
  );
  and_cell gate8 (
    .a (net60),
    .b (net6),
    .out (net17)
  );
  and_cell gate14 (
    .a (net60),
    .b (net7),
    .out (net18)
  );
  and_cell gate9 (
    .a (net60),
    .b (net8),
    .out (net19)
  );
  and_cell gate10 (
    .a (net60),
    .b (net9),
    .out (net20)
  );
  or_cell gate11 (
    .a (net10),
    .b (net9),
    .out (net62)
  );
  or_cell gate15 (
    .a (net8),
    .b (net7),
    .out (net63)
  );
  or_cell gate16 (
    .a (net6),
    .b (net5),
    .out (net64)
  );
  or_cell gate17 (
    .a (net62),
    .b (net63),
    .out (net65)
  );
  or_cell gate22 (
    .a (net65),
    .b (net64),
    .out (net66)
  );
  not_cell gate23 (
    .in (net66),
    .out (net67)
  );
  or_cell gate24 (
    .a (net67),
    .b (net61),
    .out (net14)
  );
endmodule
