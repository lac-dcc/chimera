// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341557831870186068 */

`default_nettype none

module user_module_341557831870186068(
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
  wire net13 = 1'b0;
  wire net14 = 1'b1;
  wire net15 = 1'b1;
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
  wire net68;
  wire net69;
  wire net70;
  wire net71;
  wire net72;
  wire net73;
  wire net74;

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net6;
  assign io_out[5] = net7;
  assign io_out[6] = net1;
  assign io_out[7] = net8;

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
    .in (net2),
    .out (net16)
  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (
    .d (net17),
    .clk (net1),
    .q (net18)
  );
  dff_cell flipflop2 (
    .d (net19),
    .clk (net1),
    .q (net20)
  );
  dff_cell flipflop3 (
    .d (net21),
    .clk (net1),
    .q (net22)
  );
  dff_cell flipflop4 (
    .d (net23),
    .clk (net1),
    .q (net24)
  );
  mux_cell mux2 (
    .a (net25),
    .b (net26),
    .sel (net6),
    .out (net27)
  );
  mux_cell mux3 (
    .a (net28),
    .b (net24),
    .sel (net6),
    .out (net29)
  );
  dff_cell flipflop5 (
    .d (net30),
    .clk (net1),
    .q (net31)
  );
  dff_cell flipflop6 (
    .d (net32),
    .clk (net1),
    .q (net33)
  );
  dff_cell flipflop7 (
    .d (net34),
    .clk (net1),
    .q (net35)
  );
  dff_cell flipflop8 (
    .d (net36),
    .clk (net1),
    .q (net25)
  );
  dff_cell flipflop9 (
    .d (net37),
    .clk (net1),
    .q (net38)
  );
  dff_cell flipflop10 (
    .d (net39),
    .clk (net1),
    .q (net40)
  );
  dff_cell flipflop11 (
    .d (net41),
    .clk (net1),
    .q (net42)
  );
  dff_cell flipflop12 (
    .d (net43),
    .clk (net1),
    .q (net26)
  );
  dff_cell flipflop13 (
    .d (net44),
    .clk (net1),
    .q (net45)
  );
  dff_cell flipflop14 (
    .d (net46),
    .clk (net1),
    .q (net47)
  );
  dff_cell flipflop15 (
    .d (net48),
    .clk (net1),
    .q (net49)
  );
  dff_cell flipflop16 (
    .d (net50),
    .clk (net1),
    .q (net28)
  );
  mux_cell mux4 (
    .a (net29),
    .b (net27),
    .sel (net7),
    .out (net9)
  );
  mux_cell mux5 (
    .a (net49),
    .b (net22),
    .sel (net6),
    .out (net51)
  );
  mux_cell mux6 (
    .a (net35),
    .b (net42),
    .sel (net6),
    .out (net52)
  );
  mux_cell mux7 (
    .a (net51),
    .b (net52),
    .sel (net7),
    .out (net10)
  );
  mux_cell mux8 (
    .a (net53),
    .b (net54),
    .sel (net7),
    .out (net11)
  );
  mux_cell mux9 (
    .a (net33),
    .b (net40),
    .sel (net6),
    .out (net54)
  );
  mux_cell mux10 (
    .a (net47),
    .b (net20),
    .sel (net6),
    .out (net53)
  );
  mux_cell mux11 (
    .a (net55),
    .b (net56),
    .sel (net7),
    .out (net12)
  );
  mux_cell mux12 (
    .a (net31),
    .b (net38),
    .sel (net6),
    .out (net56)
  );
  mux_cell mux13 (
    .a (net45),
    .b (net18),
    .sel (net6),
    .out (net55)
  );
  and_cell gate7 (
    .a (net57),
    .b (net58),
    .out (net59)
  );
  buffer_cell gate8 (
    .in (net3),
    .out (net60)
  );
  buffer_cell gate9 (
    .in (net4),
    .out (net61)
  );
  buffer_cell gate10 (
    .in (net5),
    .out (net62)
  );
  buffer_cell gate11 (
    .in (net7),
    .out (net63)
  );
  buffer_cell gate12 (
    .in (net6),
    .out (net64)
  );
  not_cell gate13 (
    .in (net64),
    .out (net57)
  );
  not_cell gate14 (
    .in (net63),
    .out (net58)
  );
  and_cell gate15 (
    .a (net64),
    .b (net65),
    .out (net66)
  );
  not_cell gate16 (
    .in (net63),
    .out (net65)
  );
  and_cell gate17 (
    .a (net67),
    .b (net63),
    .out (net68)
  );
  and_cell gate18 (
    .a (net64),
    .b (net63),
    .out (net69)
  );
  not_cell gate19 (
    .in (net64),
    .out (net67)
  );
  buffer_cell gate20 (
    .in (net8),
    .out (net70)
  );
  and_cell gate21 (
    .a (net59),
    .b (net70),
    .out (net71)
  );
  and_cell gate22 (
    .a (net66),
    .b (net70),
    .out (net72)
  );
  and_cell gate23 (
    .a (net68),
    .b (net70),
    .out (net73)
  );
  and_cell gate24 (
    .a (net69),
    .b (net70),
    .out (net74)
  );
  mux_cell mux14 (
    .a (net28),
    .b (net16),
    .sel (net71),
    .out (net50)
  );
  mux_cell mux15 (
    .a (net49),
    .b (net60),
    .sel (net72),
    .out (net48)
  );
  mux_cell mux16 (
    .a (net47),
    .b (net61),
    .sel (net73),
    .out (net46)
  );
  mux_cell mux17 (
    .a (net45),
    .b (net62),
    .sel (net74),
    .out (net44)
  );
  mux_cell mux18 (
    .a (net24),
    .b (net16),
    .sel (net71),
    .out (net23)
  );
  mux_cell mux19 (
    .a (net22),
    .b (net60),
    .sel (net72),
    .out (net21)
  );
  mux_cell mux20 (
    .a (net20),
    .b (net61),
    .sel (net73),
    .out (net19)
  );
  mux_cell mux21 (
    .a (net18),
    .b (net62),
    .sel (net74),
    .out (net17)
  );
  mux_cell mux22 (
    .a (net25),
    .b (net16),
    .sel (net71),
    .out (net36)
  );
  mux_cell mux23 (
    .a (net35),
    .b (net60),
    .sel (net72),
    .out (net34)
  );
  mux_cell mux24 (
    .a (net33),
    .b (net61),
    .sel (net73),
    .out (net32)
  );
  mux_cell mux25 (
    .a (net31),
    .b (net62),
    .sel (net74),
    .out (net30)
  );
  mux_cell mux26 (
    .a (net26),
    .b (net16),
    .sel (net71),
    .out (net43)
  );
  mux_cell mux27 (
    .a (net42),
    .b (net60),
    .sel (net72),
    .out (net41)
  );
  mux_cell mux28 (
    .a (net40),
    .b (net61),
    .sel (net73),
    .out (net39)
  );
  mux_cell mux29 (
    .a (net38),
    .b (net62),
    .sel (net74),
    .out (net37)
  );
endmodule
