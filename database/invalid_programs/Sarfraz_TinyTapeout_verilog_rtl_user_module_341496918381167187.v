// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341496918381167187 */

`default_nettype none

module user_module_341496918381167187(
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
  wire net16;
  wire net17 = 1'b0;
  wire net18 = 1'b1;
  wire net19 = 1'b1;
  wire net20;
  wire net21 = 1'b0;
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
  wire net58 = 1'b0;
  wire net59 = 1'b0;
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
  wire net74 = 1'b0;
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
  wire net118;
  wire net119;
  wire net120;
  wire net121;
  wire net122;
  wire net123;
  wire net124;
  wire net125;
  wire net126;
  wire net127;
  wire net128;
  wire net129;
  wire net130;
  wire net131;
  wire net132;
  wire net133;
  wire net134;
  wire net135;
  wire net136;
  wire net137;
  wire net138;
  wire net139 = 1'b0;

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;
  assign io_out[6] = net15;
  assign io_out[7] = net16;

  and_cell gate1 (

  );
  or_cell gate2 (

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
    .d (net2),
    .clk (net3),
    .q (net20)
  );
  dff_cell flipflop3 (
    .d (net20),
    .clk (net3),
    .q (net22)
  );
  dff_cell flipflop4 (
    .d (net22),
    .clk (net3),
    .q (net23)
  );
  dff_cell flipflop5 (
    .d (net23),
    .clk (net3),
    .q (net24)
  );
  dff_cell flipflop6 (
    .d (net20),
    .clk (net4),
    .q (net25)
  );
  dff_cell flipflop7 (
    .d (net22),
    .clk (net4),
    .q (net26)
  );
  dff_cell flipflop8 (
    .d (net23),
    .clk (net4),
    .q (net27)
  );
  dff_cell flipflop9 (
    .d (net24),
    .clk (net4),
    .q (net28)
  );
  dff_cell flipflop10 (
    .d (net24),
    .clk (net3),
    .q (net29)
  );
  dff_cell flipflop11 (
    .d (net29),
    .clk (net3),
    .q (net30)
  );
  dff_cell flipflop12 (
    .d (net30),
    .clk (net3),
    .q (net31)
  );
  dff_cell flipflop13 (
    .d (net31),
    .clk (net3),
    .q (net32)
  );
  dff_cell flipflop14 (
    .d (net29),
    .clk (net4),
    .q (net33)
  );
  dff_cell flipflop15 (
    .d (net30),
    .clk (net4),
    .q (net34)
  );
  dff_cell flipflop16 (
    .d (net31),
    .clk (net4),
    .q (net35)
  );
  dff_cell flipflop17 (
    .d (net32),
    .clk (net4),
    .q (net36)
  );
  mux_cell mux2 (
    .a (net37),
    .b (net38),
    .sel (net39),
    .out (net40)
  );
  mux_cell mux3 (
    .a (net41),
    .b (net42),
    .sel (net39),
    .out (net43)
  );
  mux_cell mux4 (
    .a (net44),
    .b (net45),
    .sel (net39),
    .out (net46)
  );
  mux_cell mux5 (
    .a (net47),
    .b (net48),
    .sel (net39),
    .out (net49)
  );
  mux_cell mux6 (
    .a (net20),
    .b (net25),
    .sel (net7),
    .out (net37)
  );
  mux_cell mux7 (
    .a (net22),
    .b (net26),
    .sel (net7),
    .out (net41)
  );
  mux_cell mux8 (
    .a (net23),
    .b (net27),
    .sel (net7),
    .out (net44)
  );
  mux_cell mux9 (
    .a (net24),
    .b (net28),
    .sel (net7),
    .out (net47)
  );
  mux_cell mux10 (
    .a (net29),
    .b (net33),
    .sel (net7),
    .out (net38)
  );
  mux_cell mux11 (
    .a (net30),
    .b (net34),
    .sel (net7),
    .out (net42)
  );
  mux_cell mux12 (
    .a (net31),
    .b (net35),
    .sel (net7),
    .out (net45)
  );
  mux_cell mux13 (
    .a (net32),
    .b (net36),
    .sel (net7),
    .out (net48)
  );
  mux_cell mux14 (
    .a (net40),
    .b (net49),
    .sel (net8),
    .out (net50)
  );
  mux_cell mux15 (
    .a (net43),
    .b (net46),
    .sel (net8),
    .out (net51)
  );
  mux_cell mux16 (
    .a (net46),
    .b (net43),
    .sel (net8),
    .out (net52)
  );
  mux_cell mux17 (
    .a (net49),
    .b (net40),
    .sel (net8),
    .out (net53)
  );
  not_cell gate3 (
    .in (net50),
    .out (net54)
  );
  not_cell gate7 (
    .in (net51),
    .out (net55)
  );
  not_cell gate8 (
    .in (net52),
    .out (net56)
  );
  not_cell gate9 (
    .in (net53),
    .out (net57)
  );
  or_cell gate11 (
    .a (net60),
    .b (net61),
    .out (net62)
  );
  or_cell gate19 (
    .a (net63),
    .b (net64),
    .out (net65)
  );
  or_cell gate20 (
    .a (net66),
    .b (net67),
    .out (net68)
  );
  or_cell gate23 (
    .a (net68),
    .b (net69),
    .out (net9)
  );
  or_cell gate24 (
    .a (net65),
    .b (net62),
    .out (net69)
  );
  mux_cell mux18 (
    .a (net70),
    .b (net6),
    .sel (net5),
    .out (net16)
  );
  nand_cell gate21 (
    .a (net16),
    .b (net8),
    .out (net71)
  );
  nand_cell gate22 (
    .a (net16),
    .b (net71),
    .out (net72)
  );
  nand_cell gate25 (
    .a (net71),
    .b (net8),
    .out (net73)
  );
  nand_cell gate26 (
    .a (net72),
    .b (net73),
    .out (net39)
  );
  and_cell gate27 (
    .a (net51),
    .b (net52),
    .out (net61)
  );
  and_cell gate10 (
    .a (net50),
    .b (net57),
    .out (net60)
  );
  and_cell gate12 (
    .a (net54),
    .b (net52),
    .out (net64)
  );
  and_cell gate13 (
    .a (net55),
    .b (net57),
    .out (net63)
  );
  and_cell gate14 (
    .a (net51),
    .b (net53),
    .out (net75)
  );
  and_cell gate15 (
    .a (net54),
    .b (net75),
    .out (net67)
  );
  and_cell gate16 (
    .a (net55),
    .b (net56),
    .out (net76)
  );
  and_cell gate17 (
    .a (net50),
    .b (net76),
    .out (net66)
  );
  and_cell gate18 (
    .a (net55),
    .b (net57),
    .out (net77)
  );
  and_cell gate28 (
    .a (net55),
    .b (net56),
    .out (net78)
  );
  and_cell gate29 (
    .a (net56),
    .b (net53),
    .out (net79)
  );
  and_cell gate30 (
    .a (net50),
    .b (net79),
    .out (net80)
  );
  and_cell gate31 (
    .a (net52),
    .b (net53),
    .out (net81)
  );
  and_cell gate32 (
    .a (net54),
    .b (net81),
    .out (net82)
  );
  and_cell gate33 (
    .a (net56),
    .b (net57),
    .out (net83)
  );
  and_cell gate34 (
    .a (net54),
    .b (net83),
    .out (net84)
  );
  or_cell gate35 (
    .a (net78),
    .b (net77),
    .out (net85)
  );
  or_cell gate36 (
    .a (net80),
    .b (net85),
    .out (net86)
  );
  or_cell gate37 (
    .a (net84),
    .b (net82),
    .out (net87)
  );
  or_cell gate38 (
    .a (net87),
    .b (net86),
    .out (net10)
  );
  and_cell gate39 (
    .a (net50),
    .b (net55),
    .out (net88)
  );
  and_cell gate40 (
    .a (net54),
    .b (net51),
    .out (net89)
  );
  and_cell gate41 (
    .a (net56),
    .b (net53),
    .out (net90)
  );
  and_cell gate42 (
    .a (net54),
    .b (net53),
    .out (net91)
  );
  and_cell gate43 (
    .a (net54),
    .b (net56),
    .out (net92)
  );
  or_cell gate44 (
    .a (net89),
    .b (net88),
    .out (net93)
  );
  or_cell gate45 (
    .a (net91),
    .b (net90),
    .out (net94)
  );
  or_cell gate46 (
    .a (net94),
    .b (net93),
    .out (net95)
  );
  or_cell gate47 (
    .a (net92),
    .b (net95),
    .out (net11)
  );
  and_cell gate48 (
    .a (net50),
    .b (net56),
    .out (net96)
  );
  and_cell gate49 (
    .a (net52),
    .b (net57),
    .out (net97)
  );
  and_cell gate50 (
    .a (net51),
    .b (net97),
    .out (net98)
  );
  and_cell gate51 (
    .a (net56),
    .b (net53),
    .out (net99)
  );
  and_cell gate52 (
    .a (net51),
    .b (net99),
    .out (net100)
  );
  and_cell gate53 (
    .a (net52),
    .b (net53),
    .out (net101)
  );
  and_cell gate54 (
    .a (net55),
    .b (net101),
    .out (net102)
  );
  and_cell gate55 (
    .a (net55),
    .b (net57),
    .out (net103)
  );
  and_cell gate56 (
    .a (net54),
    .b (net103),
    .out (net104)
  );
  or_cell gate57 (
    .a (net98),
    .b (net96),
    .out (net105)
  );
  or_cell gate58 (
    .a (net100),
    .b (net105),
    .out (net106)
  );
  or_cell gate59 (
    .a (net104),
    .b (net102),
    .out (net107)
  );
  or_cell gate60 (
    .a (net107),
    .b (net106),
    .out (net12)
  );
  and_cell gate61 (
    .a (net55),
    .b (net57),
    .out (net108)
  );
  and_cell gate62 (
    .a (net52),
    .b (net57),
    .out (net109)
  );
  and_cell gate63 (
    .a (net50),
    .b (net51),
    .out (net110)
  );
  and_cell gate64 (
    .a (net50),
    .b (net52),
    .out (net111)
  );
  or_cell gate65 (
    .a (net109),
    .b (net108),
    .out (net112)
  );
  or_cell gate66 (
    .a (net111),
    .b (net110),
    .out (net113)
  );
  or_cell gate67 (
    .a (net113),
    .b (net112),
    .out (net13)
  );
  and_cell gate68 (
    .a (net50),
    .b (net52),
    .out (net114)
  );
  and_cell gate69 (
    .a (net50),
    .b (net55),
    .out (net115)
  );
  and_cell gate70 (
    .a (net51),
    .b (net57),
    .out (net116)
  );
  and_cell gate71 (
    .a (net56),
    .b (net57),
    .out (net117)
  );
  and_cell gate73 (
    .a (net51),
    .b (net56),
    .out (net118)
  );
  and_cell gate74 (
    .a (net54),
    .b (net118),
    .out (net119)
  );
  or_cell gate72 (
    .a (net115),
    .b (net114),
    .out (net120)
  );
  or_cell gate75 (
    .a (net117),
    .b (net116),
    .out (net121)
  );
  or_cell gate76 (
    .a (net119),
    .b (net121),
    .out (net122)
  );
  or_cell gate77 (
    .a (net122),
    .b (net120),
    .out (net14)
  );
  and_cell gate78 (
    .a (net52),
    .b (net57),
    .out (net123)
  );
  and_cell gate79 (
    .a (net55),
    .b (net52),
    .out (net124)
  );
  and_cell gate80 (
    .a (net50),
    .b (net53),
    .out (net125)
  );
  and_cell gate81 (
    .a (net50),
    .b (net55),
    .out (net126)
  );
  and_cell gate82 (
    .a (net51),
    .b (net56),
    .out (net127)
  );
  and_cell gate83 (
    .a (net54),
    .b (net127),
    .out (net128)
  );
  or_cell gate84 (
    .a (net124),
    .b (net123),
    .out (net129)
  );
  or_cell gate85 (
    .a (net126),
    .b (net125),
    .out (net130)
  );
  or_cell gate86 (
    .a (net128),
    .b (net130),
    .out (net131)
  );
  or_cell gate87 (
    .a (net131),
    .b (net129),
    .out (net15)
  );
  dff_cell flipflop18 (
    .d (net132),
    .clk (net1),
    .q (net133),
    .notq (net132)
  );
  dff_cell flipflop19 (
    .d (net134),
    .clk (net133),
    .q (net135),
    .notq (net134)
  );
  dff_cell flipflop20 (
    .d (net136),
    .clk (net135),
    .q (net137),
    .notq (net136)
  );
  dff_cell flipflop21 (
    .d (net138),
    .clk (net137),
    .q (net70),
    .notq (net138)
  );
endmodule
