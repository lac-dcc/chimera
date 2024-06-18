// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341279123277087315 */

`default_nettype none

module user_module_341279123277087315(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
  wire net5 = io_in[4];
  wire net6 = io_in[6];
  wire net7 = io_in[7];
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
  wire net85;
  wire net86;
  wire net87;
  wire net88;
  wire net89;
  wire net90;
  wire net91;
  wire net92;
  wire net93;
  wire net94;
  wire net95;
  wire net96;
  wire net97;
  wire net98;
  wire net99;
  wire net100;
  wire net101;
  wire net102;
  wire net103;
  wire net104;
  wire net105;
  wire net106;
  wire net107;
  wire net108;
  wire net109;
  wire net110;
  wire net111;
  wire net112;
  wire net113;
  wire net114;
  wire net115;
  wire net116;
  wire net117;

  assign io_out[0] = net8;
  assign io_out[1] = net9;
  assign io_out[2] = net10;
  assign io_out[3] = net11;
  assign io_out[4] = net12;
  assign io_out[5] = net13;
  assign io_out[6] = net14;

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
  dff_cell flipflop2 (
    .d (net18),
    .clk (net1),
    .q (net19),
    .notq (net18)
  );
  dff_cell flipflop3 (
    .d (net20),
    .clk (net19),
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
  and_cell gate52 (
    .a (net28),
    .b (net29),
    .out (net30)
  );
  and_cell gate53 (
    .a (net31),
    .b (net32),
    .out (net33)
  );
  and_cell gate54 (
    .a (net30),
    .b (net33),
    .out (net14)
  );
  and_cell gate55 (
    .a (net34),
    .b (net35),
    .out (net36)
  );
  and_cell gate56 (
    .a (net31),
    .b (net37),
    .out (net38)
  );
  and_cell gate57 (
    .a (net36),
    .b (net38),
    .out (net39)
  );
  and_cell gate58 (
    .a (net39),
    .b (net29),
    .out (net13)
  );
  and_cell gate59 (
    .a (net40),
    .b (net41),
    .out (net42)
  );
  and_cell gate60 (
    .a (net31),
    .b (net43),
    .out (net44)
  );
  and_cell gate61 (
    .a (net42),
    .b (net44),
    .out (net45)
  );
  and_cell gate62 (
    .a (net29),
    .b (net35),
    .out (net46)
  );
  and_cell gate63 (
    .a (net46),
    .b (net45),
    .out (net12)
  );
  and_cell gate64 (
    .a (net29),
    .b (net40),
    .out (net47)
  );
  and_cell gate65 (
    .a (net31),
    .b (net48),
    .out (net49)
  );
  and_cell gate66 (
    .a (net47),
    .b (net49),
    .out (net50)
  );
  and_cell gate67 (
    .a (net50),
    .b (net51),
    .out (net11)
  );
  and_cell gate68 (
    .a (net34),
    .b (net32),
    .out (net52)
  );
  and_cell gate69 (
    .a (net53),
    .b (net51),
    .out (net54)
  );
  and_cell gate70 (
    .a (net52),
    .b (net54),
    .out (net10)
  );
  and_cell gate71 (
    .a (net41),
    .b (net32),
    .out (net55)
  );
  and_cell gate72 (
    .a (net53),
    .b (net51),
    .out (net56)
  );
  and_cell gate73 (
    .a (net55),
    .b (net56),
    .out (net57)
  );
  and_cell gate74 (
    .a (net58),
    .b (net59),
    .out (net60)
  );
  and_cell gate75 (
    .a (net60),
    .b (net57),
    .out (net9)
  );
  and_cell gate76 (
    .a (net29),
    .b (net40),
    .out (net61)
  );
  and_cell gate77 (
    .a (net58),
    .b (net37),
    .out (net62)
  );
  and_cell gate78 (
    .a (net61),
    .b (net62),
    .out (net8)
  );
  not_cell gate79 (
    .in (net63),
    .out (net64)
  );
  not_cell gate80 (
    .in (net65),
    .out (net66)
  );
  not_cell gate7 (
    .in (net67),
    .out (net68)
  );
  not_cell gate8 (
    .in (net69),
    .out (net70)
  );
  and_cell gate9 (
    .a (net64),
    .b (net66),
    .out (net71)
  );
  and_cell gate10 (
    .a (net68),
    .b (net70),
    .out (net72)
  );
  nand_cell gate11 (
    .a (net71),
    .b (net72),
    .out (net28)
  );
  and_cell gate12 (
    .a (net63),
    .b (net66),
    .out (net73)
  );
  and_cell gate13 (
    .a (net68),
    .b (net70),
    .out (net74)
  );
  nand_cell gate14 (
    .a (net73),
    .b (net74),
    .out (net29)
  );
  and_cell gate15 (
    .a (net64),
    .b (net65),
    .out (net75)
  );
  and_cell gate16 (
    .a (net68),
    .b (net70),
    .out (net76)
  );
  nand_cell gate17 (
    .a (net75),
    .b (net76),
    .out (net34)
  );
  and_cell gate18 (
    .a (net63),
    .b (net65),
    .out (net77)
  );
  and_cell gate19 (
    .a (net68),
    .b (net70),
    .out (net78)
  );
  nand_cell gate20 (
    .a (net77),
    .b (net78),
    .out (net35)
  );
  and_cell gate21 (
    .a (net64),
    .b (net66),
    .out (net79)
  );
  and_cell gate22 (
    .a (net67),
    .b (net70),
    .out (net80)
  );
  nand_cell gate23 (
    .a (net79),
    .b (net80),
    .out (net40)
  );
  and_cell gate24 (
    .a (net63),
    .b (net66),
    .out (net81)
  );
  and_cell gate25 (
    .a (net67),
    .b (net70),
    .out (net82)
  );
  nand_cell gate26 (
    .a (net81),
    .b (net82),
    .out (net41)
  );
  and_cell gate27 (
    .a (net64),
    .b (net65),
    .out (net83)
  );
  and_cell gate28 (
    .a (net67),
    .b (net70),
    .out (net84)
  );
  nand_cell gate29 (
    .a (net83),
    .b (net84),
    .out (net59)
  );
  and_cell gate30 (
    .a (net63),
    .b (net65),
    .out (net85)
  );
  and_cell gate31 (
    .a (net67),
    .b (net70),
    .out (net86)
  );
  nand_cell gate32 (
    .a (net85),
    .b (net86),
    .out (net31)
  );
  and_cell gate33 (
    .a (net63),
    .b (net66),
    .out (net87)
  );
  and_cell gate34 (
    .a (net68),
    .b (net69),
    .out (net88)
  );
  nand_cell gate35 (
    .a (net87),
    .b (net88),
    .out (net43)
  );
  and_cell gate36 (
    .a (net64),
    .b (net65),
    .out (net89)
  );
  and_cell gate37 (
    .a (net68),
    .b (net69),
    .out (net90)
  );
  nand_cell gate38 (
    .a (net89),
    .b (net90),
    .out (net48)
  );
  and_cell gate39 (
    .a (net63),
    .b (net65),
    .out (net91)
  );
  and_cell gate40 (
    .a (net68),
    .b (net69),
    .out (net92)
  );
  nand_cell gate41 (
    .a (net91),
    .b (net92),
    .out (net58)
  );
  and_cell gate42 (
    .a (net64),
    .b (net66),
    .out (net93)
  );
  and_cell gate43 (
    .a (net67),
    .b (net69),
    .out (net94)
  );
  nand_cell gate44 (
    .a (net93),
    .b (net94),
    .out (net32)
  );
  and_cell gate45 (
    .a (net63),
    .b (net66),
    .out (net95)
  );
  and_cell gate46 (
    .a (net67),
    .b (net69),
    .out (net96)
  );
  nand_cell gate47 (
    .a (net95),
    .b (net96),
    .out (net37)
  );
  and_cell gate48 (
    .a (net64),
    .b (net65),
    .out (net97)
  );
  and_cell gate49 (
    .a (net67),
    .b (net69),
    .out (net98)
  );
  nand_cell gate50 (
    .a (net97),
    .b (net98),
    .out (net53)
  );
  and_cell gate51 (
    .a (net63),
    .b (net65),
    .out (net99)
  );
  and_cell gate81 (
    .a (net67),
    .b (net69),
    .out (net100)
  );
  nand_cell gate82 (
    .a (net99),
    .b (net100),
    .out (net51)
  );
  dff_cell flipflop16 (
    .d (net101),
    .clk (net102),
    .q (net103),
    .notq (net101)
  );
  dff_cell flipflop17 (
    .d (net104),
    .clk (net101),
    .q (net105),
    .notq (net104)
  );
  dff_cell flipflop18 (
    .d (net106),
    .clk (net104),
    .q (net107),
    .notq (net106)
  );
  dff_cell flipflop19 (
    .d (net108),
    .clk (net106),
    .q (net109),
    .notq (net108)
  );
  mux_cell mux2 (
    .a (net2),
    .b (net103),
    .sel (net7),
    .out (net63)
  );
  mux_cell mux3 (
    .a (net3),
    .b (net105),
    .sel (net7),
    .out (net65)
  );
  mux_cell mux4 (
    .a (net4),
    .b (net107),
    .sel (net7),
    .out (net67)
  );
  mux_cell mux5 (
    .a (net5),
    .b (net109),
    .sel (net7),
    .out (net69)
  );
  mux_cell mux6 (
    .a (net110),
    .b (net1),
    .sel (net6),
    .out (net102)
  );
  dff_cell flipflop7 (
    .d (net111),
    .clk (net27),
    .q (net112),
    .notq (net111)
  );
  dff_cell flipflop8 (
    .d (net113),
    .clk (net112),
    .q (net114),
    .notq (net113)
  );
  dff_cell flipflop9 (
    .d (net115),
    .clk (net114),
    .q (net116),
    .notq (net115)
  );
  dff_cell flipflop10 (
    .d (net117),
    .clk (net116),
    .q (net110),
    .notq (net117)
  );
endmodule
