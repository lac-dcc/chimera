// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341339883600609876 */

`default_nettype none

module user_module_341339883600609876(
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
  wire net14;
  wire net15;
  wire net16 = 1'b0;
  wire net17 = 1'b1;
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;
  assign io_out[7] = net15;

  or_cell gate2 (
    .a (net19),
    .b (net20),
    .out (net15)
  );
  xor_cell gate3 (

  );
  nand_cell gate4 (

  );
  not_cell gate5 (
    .in (net9),
    .out (net21)
  );
  buffer_cell gate6 (
    .in (net22),
    .out (net23)
  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (
    .d (net24),
    .clk (net1),
    .q (net25),
    .notq (net24)
  );
  dff_cell flipflop2 (
    .d (net26),
    .clk (net25),
    .q (net27),
    .notq (net26)
  );
  dff_cell flipflop3 (
    .d (net28),
    .clk (net27),
    .q (net29),
    .notq (net28)
  );
  dff_cell flipflop4 (
    .d (net30),
    .clk (net29),
    .q (net31),
    .notq (net30)
  );
  dff_cell flipflop5 (
    .d (net32),
    .clk (net31),
    .q (net33),
    .notq (net32)
  );
  dff_cell flipflop6 (
    .d (net34),
    .clk (net33),
    .q (net35),
    .notq (net34)
  );
  dff_cell flipflop7 (
    .d (net36),
    .clk (net35),
    .q (net37),
    .notq (net36)
  );
  dff_cell flipflop8 (
    .d (net38),
    .clk (net37),
    .q (net39),
    .notq (net38)
  );
  dff_cell flipflop9 (
    .d (net40),
    .clk (net39),
    .q (net41),
    .notq (net40)
  );
  dff_cell flipflop10 (
    .d (net42),
    .clk (net41),
    .q (net43),
    .notq (net42)
  );
  dff_cell flipflop11 (
    .d (net44),
    .clk (net43),
    .q (net45),
    .notq (net44)
  );
  dff_cell flipflop12 (
    .d (net46),
    .clk (net45),
    .q (net47),
    .notq (net46)
  );
  dff_cell flipflop13 (
    .d (net48),
    .clk (net47),
    .q (net49),
    .notq (net48)
  );
  dff_cell flipflop14 (
    .d (net50),
    .clk (net49),
    .q (net51),
    .notq (net50)
  );
  dff_cell flipflop15 (
    .d (net52),
    .clk (net51),
    .q (net53),
    .notq (net52)
  );
  dff_cell flipflop16 (
    .d (net54),
    .clk (net53),
    .q (net55),
    .notq (net54)
  );
  dff_cell flipflop17 (
    .d (net56),
    .clk (net55),
    .q (net57),
    .notq (net56)
  );
  and_cell gate13 (
    .a (net2),
    .b (net45),
    .out (net58)
  );
  and_cell gate14 (
    .a (net3),
    .b (net47),
    .out (net59)
  );
  and_cell gate15 (
    .a (net4),
    .b (net49),
    .out (net60)
  );
  and_cell gate16 (
    .a (net5),
    .b (net51),
    .out (net61)
  );
  and_cell gate17 (
    .a (net6),
    .b (net53),
    .out (net62)
  );
  and_cell gate18 (
    .a (net7),
    .b (net55),
    .out (net63)
  );
  and_cell gate19 (
    .a (net8),
    .b (net57),
    .out (net22)
  );
  dff_cell flipflop18 (
    .d (net21),
    .clk (net15),
    .q (net14)
  );
  dff_cell flipflop19 (
    .d (net14),
    .clk (net15),
    .q (net13)
  );
  dff_cell flipflop20 (
    .d (net13),
    .clk (net15),
    .q (net12)
  );
  dff_cell flipflop21 (
    .d (net12),
    .clk (net15),
    .q (net11)
  );
  dff_cell flipflop22 (
    .d (net11),
    .clk (net15),
    .q (net10)
  );
  dff_cell flipflop23 (
    .d (net10),
    .clk (net15),
    .q (net9)
  );
  or_cell gate1 (
    .a (net64),
    .b (net65),
    .out (net19)
  );
  or_cell gate7 (
    .a (net66),
    .b (net23),
    .out (net20)
  );
  or_cell gate8 (
    .a (net58),
    .b (net59),
    .out (net64)
  );
  or_cell gate9 (
    .a (net60),
    .b (net61),
    .out (net65)
  );
  or_cell gate10 (
    .a (net62),
    .b (net63),
    .out (net66)
  );
endmodule
