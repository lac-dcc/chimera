// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341629415144292948 */

`default_nettype none

module user_module_341629415144292948(
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
  wire net75;
  wire net76;
  wire net77;
  wire net78;
  wire net79;
  wire net80;
  wire net81;
  wire net82;
  wire net83;
  wire net84;

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;

  and_cell gate1 (

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
  dff_cell flipflop2 (
    .d (net18),
    .clk (net2),
    .q (net19)
  );
  dff_cell flipflop3 (
    .d (net20),
    .clk (net2),
    .q (net21)
  );
  dff_cell flipflop4 (
    .d (net22),
    .clk (net2),
    .q (net23)
  );
  dff_cell flipflop5 (
    .d (net24),
    .clk (net2),
    .q (net25)
  );
  dff_cell flipflop6 (
    .d (net26),
    .clk (net2),
    .q (net27)
  );
  dff_cell flipflop7 (
    .d (net28),
    .clk (net2),
    .q (net29)
  );
  dff_cell flipflop8 (
    .d (net30),
    .clk (net1),
    .q (net31),
    .notq (net32)
  );
  or_cell gate7 (
    .a (net31),
    .b (net2),
    .out (net30)
  );
  dff_cell flipflop9 (
    .d (net33),
    .clk (net1),
    .q (net34)
  );
  dff_cell flipflop10 (
    .d (net35),
    .clk (net1),
    .q (net36)
  );
  dff_cell flipflop11 (
    .d (net37),
    .clk (net1),
    .q (net38)
  );
  not_cell gate8 (
    .in (net34),
    .out (net33)
  );
  xor_cell gate9 (
    .a (net34),
    .b (net36),
    .out (net35)
  );
  and_cell gate10 (
    .a (net34),
    .b (net36),
    .out (net39)
  );
  xor_cell gate11 (
    .a (net39),
    .b (net38),
    .out (net37)
  );
  or_cell gate14 (

  );
  mux_cell mux2 (
    .a (net27),
    .b (net21),
    .sel (net34),
    .out (net40)
  );
  mux_cell mux3 (
    .a (net23),
    .b (net19),
    .sel (net34),
    .out (net41)
  );
  mux_cell mux4 (
    .a (net25),
    .b (net29),
    .sel (net34),
    .out (net42)
  );
  mux_cell mux5 (
    .a (net40),
    .b (net41),
    .sel (net36),
    .out (net43)
  );
  mux_cell mux6 (
    .a (net43),
    .b (net42),
    .sel (net38),
    .out (net44)
  );
  mux_cell mux7 (
    .a (net21),
    .b (net23),
    .sel (net34),
    .out (net45)
  );
  mux_cell mux8 (
    .a (net19),
    .b (net25),
    .sel (net34),
    .out (net46)
  );
  mux_cell mux9 (
    .a (net29),
    .b (net27),
    .sel (net34),
    .out (net47)
  );
  mux_cell mux10 (
    .a (net45),
    .b (net46),
    .sel (net36),
    .out (net48)
  );
  mux_cell mux11 (
    .a (net48),
    .b (net47),
    .sel (net38),
    .out (net49)
  );
  mux_cell mux12 (
    .a (net29),
    .b (net27),
    .sel (net34),
    .out (net50)
  );
  mux_cell mux13 (
    .a (net21),
    .b (net23),
    .sel (net34),
    .out (net51)
  );
  mux_cell mux14 (
    .a (net19),
    .b (net25),
    .sel (net34),
    .out (net52)
  );
  mux_cell mux15 (
    .a (net50),
    .b (net51),
    .sel (net36),
    .out (net53)
  );
  mux_cell mux16 (
    .a (net53),
    .b (net52),
    .sel (net38),
    .out (net54)
  );
  buffer_cell gate18 (
    .in (net54),
    .out (net55)
  );
  buffer_cell gate19 (
    .in (net44),
    .out (net56)
  );
  buffer_cell gate20 (
    .in (net49),
    .out (net57)
  );
  or_cell gate21 (
    .a (net56),
    .b (net57),
    .out (net58)
  );
  and_cell gate22 (
    .a (net59),
    .b (net58),
    .out (net60)
  );
  not_cell gate23 (
    .in (net56),
    .out (net61)
  );
  and_cell gate24 (
    .a (net55),
    .b (net62),
    .out (net63)
  );
  and_cell gate25 (
    .a (net61),
    .b (net64),
    .out (net62)
  );
  or_cell gate26 (
    .a (net63),
    .b (net60),
    .out (net65)
  );
  not_cell gate27 (
    .in (net57),
    .out (net64)
  );
  not_cell gate28 (
    .in (net55),
    .out (net59)
  );
  mux_cell mux22 (
    .a (net66),
    .b (net67),
    .sel (net68),
    .out (net65)
  );
  mux_cell mux23 (
    .a (net69),
    .b (net70),
    .sel (net71),
    .out (net66)
  );
  mux_cell mux24 (
    .a (net72),
    .b (net73),
    .sel (net74),
    .out (net69)
  );
  mux_cell mux25 (
    .a (net75),
    .b (net76),
    .sel (net74),
    .out (net70)
  );
  mux_cell mux26 (
    .a (net77),
    .b (net78),
    .sel (net74),
    .out (net67)
  );
  buffer_cell gate29 (
    .in (net34),
    .out (net74)
  );
  buffer_cell gate30 (
    .in (net38),
    .out (net68)
  );
  buffer_cell gate31 (
    .in (net36),
    .out (net71)
  );
  dff_cell flipflop12 (
    .d (net75),
    .clk (net2),
    .q (net12)
  );
  dff_cell flipflop13 (
    .d (net77),
    .clk (net2),
    .q (net10)
  );
  dff_cell flipflop14 (
    .d (net76),
    .clk (net2),
    .q (net11)
  );
  dff_cell flipflop15 (
    .d (net73),
    .clk (net2),
    .q (net13)
  );
  dff_cell flipflop16 (
    .d (net78),
    .clk (net2),
    .q (net9)
  );
  dff_cell flipflop17 (
    .d (net72),
    .clk (net2),
    .q (net14)
  );
  and_cell gate32 (
    .a (net32),
    .b (net4),
    .out (net79)
  );
  or_cell gate33 (
    .a (net79),
    .b (net10),
    .out (net20)
  );
  and_cell gate34 (
    .a (net32),
    .b (net5),
    .out (net80)
  );
  or_cell gate35 (
    .a (net80),
    .b (net11),
    .out (net22)
  );
  and_cell gate36 (
    .a (net32),
    .b (net6),
    .out (net81)
  );
  or_cell gate37 (
    .a (net81),
    .b (net12),
    .out (net18)
  );
  and_cell gate38 (
    .a (net32),
    .b (net7),
    .out (net82)
  );
  or_cell gate39 (
    .a (net82),
    .b (net13),
    .out (net24)
  );
  and_cell gate40 (
    .a (net32),
    .b (net8),
    .out (net83)
  );
  or_cell gate41 (
    .a (net83),
    .b (net14),
    .out (net28)
  );
  and_cell gate42 (
    .a (net32),
    .b (net3),
    .out (net84)
  );
  or_cell gate43 (
    .a (net84),
    .b (net9),
    .out (net26)
  );
endmodule
