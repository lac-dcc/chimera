// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341516949939814994 */

`default_nettype none

module user_module_341516949939814994(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3;
  wire net4 = 1'b0;
  wire net5 = 1'b1;
  wire net6 = 1'b1;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = 1'b1;
  wire net12;
  wire net13;
  wire net14 = 1'b1;
  wire net15;
  wire net16 = 1'b0;
  wire net17;
  wire net18;
  wire net19;
  wire net20 = 1'b1;
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
  wire net34 = 1'b1;
  wire net35;
  wire net36 = 1'b0;
  wire net37;
  wire net38 = 1'b0;
  wire net39;
  wire net40 = 1'b1;
  wire net41;
  wire net42 = 1'b0;
  wire net43;
  wire net44 = 1'b1;
  wire net45;
  wire net46 = 1'b1;
  wire net47;
  wire net48 = 1'b1;
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
  wire net74 = 1'b0;
  wire net75;
  wire net76 = 1'b0;
  wire net77;
  wire net78 = 1'b0;
  wire net79;
  wire net80 = 1'b1;
  wire net81;
  wire net82 = 1'b0;
  wire net83;
  wire net84 = 1'b1;
  wire net85;
  wire net86 = 1'b0;
  wire net87;
  wire net88 = 1'b1;
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
  wire net110 = 1'b1;
  wire net111;
  wire net112;
  wire net113 = 1'b1;
  wire net114;
  wire net115 = 1'b0;
  wire net116;
  wire net117;
  wire net118;
  wire net119 = 1'b1;
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
  wire net134 = 1'b1;
  wire net135;
  wire net136 = 1'b0;
  wire net137;
  wire net138 = 1'b0;
  wire net139;
  wire net140 = 1'b1;
  wire net141;
  wire net142 = 1'b0;
  wire net143;
  wire net144 = 1'b1;
  wire net145;
  wire net146 = 1'b0;
  wire net147;
  wire net148 = 1'b1;
  wire net149;
  wire net150;
  wire net151;
  wire net152;
  wire net153;
  wire net154;
  wire net155;
  wire net156;
  wire net157;
  wire net158;
  wire net159;
  wire net160;
  wire net161;
  wire net162;
  wire net163;
  wire net164;
  wire net165;
  wire net166;
  wire net167;
  wire net168;
  wire net169;
  wire net170;
  wire net171;
  wire net172;
  wire net173;
  wire net174 = 1'b1;
  wire net175;
  wire net176 = 1'b1;
  wire net177;
  wire net178 = 1'b0;
  wire net179;
  wire net180 = 1'b0;
  wire net181;
  wire net182 = 1'b0;
  wire net183;
  wire net184 = 1'b0;
  wire net185;
  wire net186 = 1'b0;
  wire net187;
  wire net188 = 1'b1;
  wire net189;
  wire net190;
  wire net191;
  wire net192;
  wire net193;
  wire net194;
  wire net195;
  wire net196;
  wire net197;
  wire net198;
  wire net199;
  wire net200;
  wire net201;
  wire net202;
  wire net203;
  wire net204;

  assign io_out[0] = net3;

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
    .d (net2),
    .clk (net1),
    .q (net7)
  );
  dff_cell flipflop3 (
    .d (net7),
    .clk (net1),
    .q (net8)
  );
  dff_cell flipflop4 (
    .d (net8),
    .clk (net1),
    .q (net9)
  );
  dff_cell flipflop5 (
    .d (net9),
    .clk (net1),
    .q (net10)
  );
  xor_cell gate7 (
    .a (net11),
    .b (net7),
    .out (net12)
  );
  not_cell gate8 (
    .in (net12),
    .out (net13)
  );
  xor_cell gate9 (
    .a (net14),
    .b (net8),
    .out (net15)
  );
  xor_cell gate10 (
    .a (net16),
    .b (net9),
    .out (net17)
  );
  not_cell gate11 (
    .in (net15),
    .out (net18)
  );
  not_cell gate12 (
    .in (net17),
    .out (net19)
  );
  xor_cell gate13 (
    .a (net20),
    .b (net10),
    .out (net21)
  );
  not_cell gate14 (
    .in (net21),
    .out (net22)
  );
  and_cell gate15 (
    .a (net13),
    .b (net18),
    .out (net23)
  );
  and_cell gate16 (
    .a (net23),
    .b (net19),
    .out (net24)
  );
  and_cell gate17 (
    .a (net24),
    .b (net22),
    .out (net25)
  );
  dff_cell flipflop6 (
    .d (net10),
    .clk (net1),
    .q (net26)
  );
  dff_cell flipflop7 (
    .d (net26),
    .clk (net1),
    .q (net27)
  );
  dff_cell flipflop8 (
    .d (net27),
    .clk (net1),
    .q (net28)
  );
  dff_cell flipflop9 (
    .d (net28),
    .clk (net1),
    .q (net29)
  );
  dff_cell flipflop10 (
    .d (net29),
    .clk (net1),
    .q (net30)
  );
  dff_cell flipflop11 (
    .d (net30),
    .clk (net1),
    .q (net31)
  );
  dff_cell flipflop12 (
    .d (net31),
    .clk (net1),
    .q (net32)
  );
  dff_cell flipflop13 (
    .d (net32),
    .clk (net1),
    .q (net33)
  );
  xor_cell gate18 (
    .a (net34),
    .b (net26),
    .out (net35)
  );
  xor_cell gate19 (
    .a (net36),
    .b (net27),
    .out (net37)
  );
  xor_cell gate20 (
    .a (net38),
    .b (net28),
    .out (net39)
  );
  xor_cell gate21 (
    .a (net40),
    .b (net29),
    .out (net41)
  );
  xor_cell gate22 (
    .a (net42),
    .b (net30),
    .out (net43)
  );
  xor_cell gate23 (
    .a (net44),
    .b (net31),
    .out (net45)
  );
  xor_cell gate24 (
    .a (net46),
    .b (net32),
    .out (net47)
  );
  xor_cell gate25 (
    .a (net48),
    .b (net33),
    .out (net49)
  );
  not_cell gate26 (
    .in (net35),
    .out (net50)
  );
  not_cell gate27 (
    .in (net37),
    .out (net51)
  );
  not_cell gate28 (
    .in (net39),
    .out (net52)
  );
  not_cell gate29 (
    .in (net41),
    .out (net53)
  );
  not_cell gate30 (
    .in (net43),
    .out (net54)
  );
  not_cell gate31 (
    .in (net45),
    .out (net55)
  );
  not_cell gate32 (
    .in (net47),
    .out (net56)
  );
  not_cell gate33 (
    .in (net49),
    .out (net57)
  );
  and_cell gate34 (
    .a (net25),
    .b (net50),
    .out (net58)
  );
  and_cell gate35 (
    .a (net58),
    .b (net51),
    .out (net59)
  );
  and_cell gate36 (
    .a (net59),
    .b (net52),
    .out (net60)
  );
  and_cell gate37 (
    .a (net60),
    .b (net53),
    .out (net61)
  );
  and_cell gate38 (
    .a (net61),
    .b (net54),
    .out (net62)
  );
  and_cell gate39 (
    .a (net62),
    .b (net55),
    .out (net63)
  );
  and_cell gate40 (
    .a (net63),
    .b (net56),
    .out (net64)
  );
  and_cell gate41 (
    .a (net64),
    .b (net57),
    .out (net65)
  );
  dff_cell flipflop14 (
    .d (net33),
    .clk (net1),
    .q (net66)
  );
  dff_cell flipflop15 (
    .d (net66),
    .clk (net1),
    .q (net67)
  );
  dff_cell flipflop16 (
    .d (net67),
    .clk (net1),
    .q (net68)
  );
  dff_cell flipflop17 (
    .d (net68),
    .clk (net1),
    .q (net69)
  );
  dff_cell flipflop18 (
    .d (net69),
    .clk (net1),
    .q (net70)
  );
  dff_cell flipflop19 (
    .d (net70),
    .clk (net1),
    .q (net71)
  );
  dff_cell flipflop20 (
    .d (net71),
    .clk (net1),
    .q (net72)
  );
  dff_cell flipflop21 (
    .d (net72),
    .clk (net1),
    .q (net73)
  );
  xor_cell gate42 (
    .a (net74),
    .b (net66),
    .out (net75)
  );
  xor_cell gate43 (
    .a (net76),
    .b (net67),
    .out (net77)
  );
  xor_cell gate44 (
    .a (net78),
    .b (net68),
    .out (net79)
  );
  xor_cell gate45 (
    .a (net80),
    .b (net69),
    .out (net81)
  );
  xor_cell gate46 (
    .a (net82),
    .b (net70),
    .out (net83)
  );
  xor_cell gate47 (
    .a (net84),
    .b (net71),
    .out (net85)
  );
  xor_cell gate48 (
    .a (net86),
    .b (net72),
    .out (net87)
  );
  xor_cell gate49 (
    .a (net88),
    .b (net73),
    .out (net89)
  );
  not_cell gate50 (
    .in (net75),
    .out (net90)
  );
  not_cell gate51 (
    .in (net77),
    .out (net91)
  );
  not_cell gate52 (
    .in (net79),
    .out (net92)
  );
  not_cell gate53 (
    .in (net81),
    .out (net93)
  );
  not_cell gate54 (
    .in (net83),
    .out (net94)
  );
  not_cell gate55 (
    .in (net85),
    .out (net95)
  );
  not_cell gate56 (
    .in (net87),
    .out (net96)
  );
  not_cell gate57 (
    .in (net89),
    .out (net97)
  );
  and_cell gate58 (
    .a (net65),
    .b (net90),
    .out (net98)
  );
  and_cell gate59 (
    .a (net98),
    .b (net91),
    .out (net99)
  );
  and_cell gate60 (
    .a (net99),
    .b (net92),
    .out (net100)
  );
  and_cell gate61 (
    .a (net100),
    .b (net93),
    .out (net101)
  );
  and_cell gate62 (
    .a (net101),
    .b (net94),
    .out (net102)
  );
  and_cell gate63 (
    .a (net102),
    .b (net95),
    .out (net103)
  );
  and_cell gate64 (
    .a (net103),
    .b (net96),
    .out (net104)
  );
  and_cell gate65 (
    .a (net104),
    .b (net97),
    .out (net105)
  );
  dff_cell flipflop22 (
    .d (net73),
    .clk (net1),
    .q (net106)
  );
  dff_cell flipflop23 (
    .d (net106),
    .clk (net1),
    .q (net107)
  );
  dff_cell flipflop24 (
    .d (net107),
    .clk (net1),
    .q (net108)
  );
  dff_cell flipflop25 (
    .d (net108),
    .clk (net1),
    .q (net109)
  );
  xor_cell gate66 (
    .a (net110),
    .b (net106),
    .out (net111)
  );
  not_cell gate67 (
    .in (net111),
    .out (net112)
  );
  xor_cell gate68 (
    .a (net113),
    .b (net107),
    .out (net114)
  );
  xor_cell gate69 (
    .a (net115),
    .b (net108),
    .out (net116)
  );
  not_cell gate70 (
    .in (net114),
    .out (net117)
  );
  not_cell gate71 (
    .in (net116),
    .out (net118)
  );
  xor_cell gate72 (
    .a (net119),
    .b (net109),
    .out (net120)
  );
  not_cell gate73 (
    .in (net120),
    .out (net121)
  );
  and_cell gate74 (
    .a (net122),
    .b (net117),
    .out (net123)
  );
  and_cell gate75 (
    .a (net123),
    .b (net118),
    .out (net124)
  );
  and_cell gate76 (
    .a (net124),
    .b (net121),
    .out (net125)
  );
  dff_cell flipflop26 (
    .d (net109),
    .clk (net1),
    .q (net126)
  );
  dff_cell flipflop27 (
    .d (net126),
    .clk (net1),
    .q (net127)
  );
  dff_cell flipflop28 (
    .d (net127),
    .clk (net1),
    .q (net128)
  );
  dff_cell flipflop29 (
    .d (net128),
    .clk (net1),
    .q (net129)
  );
  dff_cell flipflop30 (
    .d (net129),
    .clk (net1),
    .q (net130)
  );
  dff_cell flipflop31 (
    .d (net130),
    .clk (net1),
    .q (net131)
  );
  dff_cell flipflop32 (
    .d (net131),
    .clk (net1),
    .q (net132)
  );
  dff_cell flipflop33 (
    .d (net132),
    .clk (net1),
    .q (net133)
  );
  xor_cell gate77 (
    .a (net134),
    .b (net126),
    .out (net135)
  );
  xor_cell gate78 (
    .a (net136),
    .b (net127),
    .out (net137)
  );
  xor_cell gate79 (
    .a (net138),
    .b (net128),
    .out (net139)
  );
  xor_cell gate80 (
    .a (net140),
    .b (net129),
    .out (net141)
  );
  xor_cell gate81 (
    .a (net142),
    .b (net130),
    .out (net143)
  );
  xor_cell gate82 (
    .a (net144),
    .b (net131),
    .out (net145)
  );
  xor_cell gate83 (
    .a (net146),
    .b (net132),
    .out (net147)
  );
  xor_cell gate84 (
    .a (net148),
    .b (net133),
    .out (net149)
  );
  not_cell gate85 (
    .in (net135),
    .out (net150)
  );
  not_cell gate86 (
    .in (net137),
    .out (net151)
  );
  not_cell gate87 (
    .in (net139),
    .out (net152)
  );
  not_cell gate88 (
    .in (net141),
    .out (net153)
  );
  not_cell gate89 (
    .in (net143),
    .out (net154)
  );
  not_cell gate90 (
    .in (net145),
    .out (net155)
  );
  not_cell gate91 (
    .in (net147),
    .out (net156)
  );
  not_cell gate92 (
    .in (net149),
    .out (net157)
  );
  and_cell gate93 (
    .a (net125),
    .b (net150),
    .out (net158)
  );
  and_cell gate94 (
    .a (net158),
    .b (net151),
    .out (net159)
  );
  and_cell gate95 (
    .a (net159),
    .b (net152),
    .out (net160)
  );
  and_cell gate96 (
    .a (net160),
    .b (net153),
    .out (net161)
  );
  and_cell gate97 (
    .a (net161),
    .b (net154),
    .out (net162)
  );
  and_cell gate98 (
    .a (net162),
    .b (net155),
    .out (net163)
  );
  and_cell gate99 (
    .a (net163),
    .b (net156),
    .out (net164)
  );
  and_cell gate100 (
    .a (net164),
    .b (net157),
    .out (net165)
  );
  dff_cell flipflop34 (
    .d (net133),
    .clk (net1),
    .q (net166)
  );
  dff_cell flipflop35 (
    .d (net166),
    .clk (net1),
    .q (net167)
  );
  dff_cell flipflop36 (
    .d (net167),
    .clk (net1),
    .q (net168)
  );
  dff_cell flipflop37 (
    .d (net168),
    .clk (net1),
    .q (net169)
  );
  dff_cell flipflop38 (
    .d (net169),
    .clk (net1),
    .q (net170)
  );
  dff_cell flipflop39 (
    .d (net170),
    .clk (net1),
    .q (net171)
  );
  dff_cell flipflop40 (
    .d (net171),
    .clk (net1),
    .q (net172)
  );
  dff_cell flipflop41 (
    .d (net172),
    .clk (net1),
    .q (net173)
  );
  xor_cell gate101 (
    .a (net174),
    .b (net166),
    .out (net175)
  );
  xor_cell gate102 (
    .a (net176),
    .b (net167),
    .out (net177)
  );
  xor_cell gate103 (
    .a (net178),
    .b (net168),
    .out (net179)
  );
  xor_cell gate104 (
    .a (net180),
    .b (net169),
    .out (net181)
  );
  xor_cell gate105 (
    .a (net182),
    .b (net170),
    .out (net183)
  );
  xor_cell gate106 (
    .a (net184),
    .b (net171),
    .out (net185)
  );
  xor_cell gate107 (
    .a (net186),
    .b (net172),
    .out (net187)
  );
  xor_cell gate108 (
    .a (net188),
    .b (net173),
    .out (net189)
  );
  not_cell gate109 (
    .in (net175),
    .out (net190)
  );
  not_cell gate110 (
    .in (net177),
    .out (net191)
  );
  not_cell gate111 (
    .in (net179),
    .out (net192)
  );
  not_cell gate112 (
    .in (net181),
    .out (net193)
  );
  not_cell gate113 (
    .in (net183),
    .out (net194)
  );
  not_cell gate114 (
    .in (net185),
    .out (net195)
  );
  not_cell gate115 (
    .in (net187),
    .out (net196)
  );
  not_cell gate116 (
    .in (net189),
    .out (net197)
  );
  and_cell gate117 (
    .a (net165),
    .b (net190),
    .out (net198)
  );
  and_cell gate118 (
    .a (net198),
    .b (net191),
    .out (net199)
  );
  and_cell gate119 (
    .a (net199),
    .b (net192),
    .out (net200)
  );
  and_cell gate120 (
    .a (net200),
    .b (net193),
    .out (net201)
  );
  and_cell gate121 (
    .a (net201),
    .b (net194),
    .out (net202)
  );
  and_cell gate122 (
    .a (net202),
    .b (net195),
    .out (net203)
  );
  and_cell gate123 (
    .a (net203),
    .b (net196),
    .out (net204)
  );
  and_cell gate124 (
    .a (net204),
    .b (net197),
    .out (net3)
  );
  and_cell gate125 (
    .a (net105),
    .b (net112),
    .out (net122)
  );
endmodule
