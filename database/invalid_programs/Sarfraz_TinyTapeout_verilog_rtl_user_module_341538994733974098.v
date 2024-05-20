// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341538994733974098 */

`default_nettype none

module user_module_341538994733974098(
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
  wire net139;
  wire net140;
  wire net141;
  wire net142;
  wire net143;
  wire net144;
  wire net145;
  wire net146;
  wire net147;
  wire net148;
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
  wire net174;
  wire net175;
  wire net176;
  wire net177;
  wire net178;
  wire net179;
  wire net180;
  wire net181;
  wire net182;
  wire net183;
  wire net184;
  wire net185;
  wire net186;
  wire net187;
  wire net188;
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
  wire net205;
  wire net206;
  wire net207;
  wire net208;
  wire net209;
  wire net210;
  wire net211;
  wire net212;
  wire net213;
  wire net214;
  wire net215;
  wire net216;
  wire net217;
  wire net218;
  wire net219;
  wire net220;
  wire net221;
  wire net222;
  wire net223;
  wire net224;
  wire net225;
  wire net226;
  wire net227;

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
    .d (net20),
    .clk (net1),
    .q (net21),
    .notq (net22)
  );
  dff_cell flipflop3 (
    .d (net23),
    .clk (net1),
    .q (net24),
    .notq (net25)
  );
  dff_cell flipflop4 (
    .d (net26),
    .clk (net1),
    .q (net27),
    .notq (net28)
  );
  dff_cell flipflop5 (
    .d (net29),
    .clk (net1),
    .q (net30),
    .notq (net31)
  );
  and_cell gate7 (
    .a (net25),
    .b (net31),
    .out (net32)
  );
  and_cell gate8 (
    .a (net24),
    .b (net27),
    .out (net33)
  );
  and_cell gate9 (
    .a (net22),
    .b (net27),
    .out (net34)
  );
  and_cell gate10 (
    .a (net21),
    .b (net25),
    .out (net35)
  );
  and_cell gate11 (
    .a (net35),
    .b (net28),
    .out (net36)
  );
  and_cell gate12 (
    .a (net21),
    .b (net28),
    .out (net37)
  );
  and_cell gate13 (
    .a (net37),
    .b (net31),
    .out (net38)
  );
  and_cell gate14 (
    .a (net22),
    .b (net24),
    .out (net39)
  );
  and_cell gate15 (
    .a (net39),
    .b (net30),
    .out (net40)
  );
  or_cell gate16 (
    .a (net32),
    .b (net33),
    .out (net41)
  );
  or_cell gate17 (
    .a (net38),
    .b (net40),
    .out (net42)
  );
  or_cell gate18 (
    .a (net34),
    .b (net36),
    .out (net43)
  );
  or_cell gate19 (
    .a (net41),
    .b (net43),
    .out (net44)
  );
  or_cell gate20 (
    .a (net44),
    .b (net42),
    .out (net9)
  );
  and_cell gate21 (
    .a (net22),
    .b (net25),
    .out (net45)
  );
  and_cell gate22 (
    .a (net25),
    .b (net31),
    .out (net46)
  );
  and_cell gate23 (
    .a (net21),
    .b (net28),
    .out (net47)
  );
  and_cell gate24 (
    .a (net47),
    .b (net30),
    .out (net48)
  );
  and_cell gate25 (
    .a (net22),
    .b (net27),
    .out (net49)
  );
  and_cell gate26 (
    .a (net49),
    .b (net30),
    .out (net50)
  );
  and_cell gate27 (
    .a (net22),
    .b (net28),
    .out (net51)
  );
  and_cell gate28 (
    .a (net51),
    .b (net31),
    .out (net52)
  );
  or_cell gate29 (
    .a (net45),
    .b (net46),
    .out (net53)
  );
  or_cell gate30 (
    .a (net50),
    .b (net52),
    .out (net54)
  );
  or_cell gate31 (
    .a (net53),
    .b (net48),
    .out (net55)
  );
  or_cell gate32 (
    .a (net55),
    .b (net54),
    .out (net10)
  );
  and_cell gate33 (
    .a (net22),
    .b (net24),
    .out (net56)
  );
  and_cell gate34 (
    .a (net21),
    .b (net25),
    .out (net57)
  );
  and_cell gate35 (
    .a (net28),
    .b (net30),
    .out (net58)
  );
  and_cell gate36 (
    .a (net22),
    .b (net25),
    .out (net59)
  );
  and_cell gate37 (
    .a (net59),
    .b (net28),
    .out (net60)
  );
  and_cell gate38 (
    .a (net22),
    .b (net25),
    .out (net61)
  );
  and_cell gate39 (
    .a (net61),
    .b (net30),
    .out (net62)
  );
  or_cell gate40 (
    .a (net56),
    .b (net57),
    .out (net63)
  );
  or_cell gate41 (
    .a (net63),
    .b (net58),
    .out (net64)
  );
  or_cell gate42 (
    .a (net60),
    .b (net62),
    .out (net65)
  );
  or_cell gate43 (
    .a (net64),
    .b (net65),
    .out (net11)
  );
  and_cell gate44 (
    .a (net21),
    .b (net28),
    .out (net66)
  );
  and_cell gate45 (
    .a (net66),
    .b (net31),
    .out (net67)
  );
  and_cell gate46 (
    .a (net24),
    .b (net28),
    .out (net68)
  );
  and_cell gate47 (
    .a (net68),
    .b (net30),
    .out (net69)
  );
  and_cell gate48 (
    .a (net24),
    .b (net27),
    .out (net70)
  );
  and_cell gate49 (
    .a (net70),
    .b (net31),
    .out (net71)
  );
  and_cell gate50 (
    .a (net22),
    .b (net25),
    .out (net72)
  );
  and_cell gate51 (
    .a (net72),
    .b (net27),
    .out (net73)
  );
  and_cell gate52 (
    .a (net25),
    .b (net27),
    .out (net74)
  );
  and_cell gate53 (
    .a (net74),
    .b (net30),
    .out (net75)
  );
  and_cell gate54 (
    .a (net25),
    .b (net28),
    .out (net76)
  );
  and_cell gate55 (
    .a (net76),
    .b (net31),
    .out (net77)
  );
  or_cell gate56 (
    .a (net67),
    .b (net69),
    .out (net78)
  );
  or_cell gate57 (
    .a (net71),
    .b (net73),
    .out (net79)
  );
  or_cell gate59 (
    .a (net78),
    .b (net79),
    .out (net80)
  );
  or_cell gate60 (
    .a (net75),
    .b (net77),
    .out (net81)
  );
  or_cell gate61 (
    .a (net80),
    .b (net81),
    .out (net12)
  );
  and_cell gate58 (
    .a (net21),
    .b (net24),
    .out (net82)
  );
  and_cell gate62 (
    .a (net27),
    .b (net31),
    .out (net83)
  );
  and_cell gate63 (
    .a (net25),
    .b (net31),
    .out (net84)
  );
  and_cell gate64 (
    .a (net21),
    .b (net25),
    .out (net85)
  );
  and_cell gate65 (
    .a (net85),
    .b (net27),
    .out (net86)
  );
  or_cell gate66 (
    .a (net82),
    .b (net83),
    .out (net87)
  );
  or_cell gate67 (
    .a (net84),
    .b (net86),
    .out (net88)
  );
  or_cell gate68 (
    .a (net87),
    .b (net88),
    .out (net13)
  );
  and_cell gate69 (
    .a (net28),
    .b (net31),
    .out (net89)
  );
  and_cell gate70 (
    .a (net21),
    .b (net25),
    .out (net90)
  );
  and_cell gate71 (
    .a (net21),
    .b (net27),
    .out (net91)
  );
  and_cell gate72 (
    .a (net24),
    .b (net27),
    .out (net92)
  );
  and_cell gate73 (
    .a (net92),
    .b (net31),
    .out (net93)
  );
  and_cell gate74 (
    .a (net22),
    .b (net24),
    .out (net94)
  );
  and_cell gate75 (
    .a (net94),
    .b (net28),
    .out (net95)
  );
  or_cell gate76 (
    .a (net89),
    .b (net90),
    .out (net96)
  );
  or_cell gate77 (
    .a (net93),
    .b (net95),
    .out (net97)
  );
  or_cell gate78 (
    .a (net96),
    .b (net91),
    .out (net98)
  );
  or_cell gate79 (
    .a (net98),
    .b (net97),
    .out (net14)
  );
  and_cell gate80 (
    .a (net21),
    .b (net25),
    .out (net99)
  );
  and_cell gate81 (
    .a (net27),
    .b (net31),
    .out (net100)
  );
  and_cell gate82 (
    .a (net21),
    .b (net30),
    .out (net101)
  );
  and_cell gate83 (
    .a (net22),
    .b (net24),
    .out (net102)
  );
  and_cell gate84 (
    .a (net102),
    .b (net28),
    .out (net103)
  );
  and_cell gate85 (
    .a (net22),
    .b (net25),
    .out (net104)
  );
  and_cell gate86 (
    .a (net104),
    .b (net27),
    .out (net105)
  );
  or_cell gate87 (
    .a (net99),
    .b (net100),
    .out (net106)
  );
  or_cell gate88 (
    .a (net103),
    .b (net105),
    .out (net107)
  );
  or_cell gate89 (
    .a (net106),
    .b (net101),
    .out (net108)
  );
  or_cell gate90 (
    .a (net108),
    .b (net107),
    .out (net15)
  );
  and_cell gate91 (
    .a (net109),
    .b (net110),
    .out (net111)
  );
  and_cell gate92 (
    .a (net111),
    .b (net112),
    .out (net113)
  );
  and_cell gate93 (
    .a (net109),
    .b (net110),
    .out (net114)
  );
  and_cell gate94 (
    .a (net114),
    .b (net115),
    .out (net116)
  );
  and_cell gate95 (
    .a (net109),
    .b (net117),
    .out (net118)
  );
  and_cell gate96 (
    .a (net118),
    .b (net112),
    .out (net119)
  );
  and_cell gate97 (
    .a (net109),
    .b (net117),
    .out (net120)
  );
  and_cell gate98 (
    .a (net120),
    .b (net115),
    .out (net121)
  );
  and_cell gate99 (
    .a (net122),
    .b (net110),
    .out (net123)
  );
  and_cell gate100 (
    .a (net123),
    .b (net112),
    .out (net124)
  );
  and_cell gate101 (
    .a (net122),
    .b (net110),
    .out (net125)
  );
  and_cell gate102 (
    .a (net125),
    .b (net115),
    .out (net126)
  );
  and_cell gate103 (
    .a (net122),
    .b (net117),
    .out (net127)
  );
  and_cell gate104 (
    .a (net127),
    .b (net112),
    .out (net128)
  );
  and_cell gate105 (
    .a (net122),
    .b (net117),
    .out (net129)
  );
  and_cell gate106 (
    .a (net129),
    .b (net115),
    .out (net130)
  );
  not_cell gate107 (
    .in (net3),
    .out (net110)
  );
  buffer_cell gate108 (
    .in (net3),
    .out (net117)
  );
  not_cell gate109 (
    .in (net4),
    .out (net112)
  );
  buffer_cell gate110 (
    .in (net4),
    .out (net115)
  );
  not_cell gate111 (
    .in (net2),
    .out (net122)
  );
  buffer_cell gate112 (
    .in (net2),
    .out (net109)
  );
  and_cell gate113 (
    .a (net124),
    .b (net131),
    .out (net132)
  );
  and_cell gate114 (
    .a (net124),
    .b (net133),
    .out (net134)
  );
  and_cell gate115 (
    .a (net124),
    .b (net135),
    .out (net136)
  );
  and_cell gate116 (
    .a (net124),
    .b (net137),
    .out (net138)
  );
  buffer_cell gate117 (
    .in (net5),
    .out (net131)
  );
  buffer_cell gate118 (
    .in (net6),
    .out (net133)
  );
  buffer_cell gate119 (
    .in (net7),
    .out (net135)
  );
  buffer_cell gate120 (
    .in (net8),
    .out (net137)
  );
  or_cell gate121 (
    .a (net134),
    .b (net139),
    .out (net23)
  );
  or_cell gate122 (
    .a (net132),
    .b (net140),
    .out (net20)
  );
  or_cell gate123 (
    .a (net138),
    .b (net141),
    .out (net29)
  );
  or_cell gate124 (
    .a (net136),
    .b (net142),
    .out (net26)
  );
  and_cell gate125 (
    .a (net126),
    .b (net143),
    .out (net144)
  );
  and_cell gate126 (
    .a (net126),
    .b (net145),
    .out (net146)
  );
  and_cell gate127 (
    .a (net126),
    .b (net147),
    .out (net148)
  );
  and_cell gate128 (
    .a (net126),
    .b (net149),
    .out (net150)
  );
  not_cell gate129 (
    .in (net131),
    .out (net143)
  );
  not_cell gate130 (
    .in (net133),
    .out (net145)
  );
  not_cell gate131 (
    .in (net135),
    .out (net147)
  );
  not_cell gate132 (
    .in (net137),
    .out (net149)
  );
  or_cell gate133 (
    .a (net151),
    .b (net144),
    .out (net140)
  );
  or_cell gate134 (
    .a (net152),
    .b (net146),
    .out (net139)
  );
  or_cell gate135 (
    .a (net153),
    .b (net148),
    .out (net142)
  );
  or_cell gate136 (
    .a (net154),
    .b (net150),
    .out (net141)
  );
  and_cell gate137 (
    .a (net128),
    .b (net155),
    .out (net156)
  );
  and_cell gate138 (
    .a (net128),
    .b (net157),
    .out (net158)
  );
  and_cell gate139 (
    .a (net128),
    .b (net159),
    .out (net160)
  );
  and_cell gate140 (
    .a (net128),
    .b (net161),
    .out (net162)
  );
  or_cell gate141 (
    .a (net163),
    .b (net156),
    .out (net151)
  );
  or_cell gate142 (
    .a (net164),
    .b (net158),
    .out (net152)
  );
  or_cell gate143 (
    .a (net165),
    .b (net160),
    .out (net153)
  );
  or_cell gate144 (
    .a (net166),
    .b (net162),
    .out (net154)
  );
  and_cell gate145 (
    .a (net131),
    .b (net167),
    .out (net155)
  );
  and_cell gate146 (
    .a (net133),
    .b (net168),
    .out (net157)
  );
  and_cell gate147 (
    .a (net135),
    .b (net169),
    .out (net159)
  );
  and_cell gate148 (
    .a (net137),
    .b (net170),
    .out (net161)
  );
  buffer_cell gate149 (
    .in (net21),
    .out (net167)
  );
  buffer_cell gate150 (
    .in (net24),
    .out (net168)
  );
  buffer_cell gate151 (
    .in (net27),
    .out (net169)
  );
  buffer_cell gate152 (
    .in (net30),
    .out (net170)
  );
  and_cell gate153 (
    .a (net130),
    .b (net171),
    .out (net172)
  );
  and_cell gate154 (
    .a (net130),
    .b (net173),
    .out (net174)
  );
  and_cell gate155 (
    .a (net130),
    .b (net175),
    .out (net176)
  );
  and_cell gate156 (
    .a (net130),
    .b (net177),
    .out (net178)
  );
  or_cell gate157 (
    .a (net179),
    .b (net172),
    .out (net163)
  );
  or_cell gate158 (
    .a (net180),
    .b (net174),
    .out (net164)
  );
  or_cell gate159 (
    .a (net181),
    .b (net176),
    .out (net165)
  );
  or_cell gate160 (
    .a (net182),
    .b (net178),
    .out (net166)
  );
  or_cell gate161 (
    .a (net131),
    .b (net167),
    .out (net171)
  );
  or_cell gate162 (
    .a (net133),
    .b (net168),
    .out (net173)
  );
  or_cell gate163 (
    .a (net135),
    .b (net169),
    .out (net175)
  );
  or_cell gate164 (
    .a (net137),
    .b (net170),
    .out (net177)
  );
  and_cell gate165 (
    .a (net113),
    .b (net183),
    .out (net184)
  );
  and_cell gate166 (
    .a (net113),
    .b (net185),
    .out (net186)
  );
  and_cell gate167 (
    .a (net113),
    .b (net187),
    .out (net188)
  );
  and_cell gate168 (
    .a (net113),
    .b (net189),
    .out (net190)
  );
  or_cell gate169 (
    .a (net191),
    .b (net184),
    .out (net179)
  );
  or_cell gate170 (
    .a (net192),
    .b (net186),
    .out (net180)
  );
  or_cell gate171 (
    .a (net193),
    .b (net188),
    .out (net181)
  );
  or_cell gate172 (
    .a (net194),
    .b (net190),
    .out (net182)
  );
  xor_cell gate173 (
    .a (net131),
    .b (net167),
    .out (net183)
  );
  xor_cell gate174 (
    .a (net133),
    .b (net168),
    .out (net185)
  );
  xor_cell gate175 (
    .a (net135),
    .b (net169),
    .out (net187)
  );
  xor_cell gate176 (
    .a (net137),
    .b (net170),
    .out (net189)
  );
  and_cell gate177 (
    .a (net195),
    .b (net196),
    .out (net191)
  );
  and_cell gate178 (
    .a (net195),
    .b (net197),
    .out (net192)
  );
  and_cell gate179 (
    .a (net195),
    .b (net198),
    .out (net193)
  );
  and_cell gate180 (
    .a (net195),
    .b (net199),
    .out (net194)
  );
  xor_cell gate185 (
    .a (net200),
    .b (net201),
    .out (net202)
  );
  xor_cell gate186 (
    .a (net203),
    .b (net202),
    .out (net199)
  );
  and_cell gate187 (
    .a (net200),
    .b (net201),
    .out (net204)
  );
  and_cell gate188 (
    .a (net203),
    .b (net202),
    .out (net205)
  );
  or_cell gate189 (
    .a (net204),
    .b (net205),
    .out (net206)
  );
  xor_cell gate190 (
    .a (net207),
    .b (net208),
    .out (net209)
  );
  xor_cell gate191 (
    .a (net206),
    .b (net209),
    .out (net198)
  );
  and_cell gate192 (
    .a (net207),
    .b (net208),
    .out (net210)
  );
  and_cell gate193 (
    .a (net206),
    .b (net209),
    .out (net211)
  );
  or_cell gate194 (
    .a (net210),
    .b (net211),
    .out (net212)
  );
  xor_cell gate195 (
    .a (net213),
    .b (net214),
    .out (net215)
  );
  xor_cell gate196 (
    .a (net212),
    .b (net215),
    .out (net197)
  );
  and_cell gate197 (
    .a (net213),
    .b (net214),
    .out (net216)
  );
  and_cell gate198 (
    .a (net212),
    .b (net215),
    .out (net217)
  );
  or_cell gate199 (
    .a (net216),
    .b (net217),
    .out (net218)
  );
  xor_cell gate200 (
    .a (net219),
    .b (net220),
    .out (net221)
  );
  xor_cell gate201 (
    .a (net218),
    .b (net221),
    .out (net196)
  );
  and_cell gate202 (
    .a (net219),
    .b (net220),
    .out (net222)
  );
  and_cell gate203 (
    .a (net218),
    .b (net221),
    .out (net223)
  );
  or_cell gate204 (
    .a (net222),
    .b (net223),
    .out (net16)
  );
  xor_cell gate205 (
    .a (net137),
    .b (net203),
    .out (net201)
  );
  xor_cell gate206 (
    .a (net135),
    .b (net203),
    .out (net208)
  );
  xor_cell gate207 (
    .a (net133),
    .b (net203),
    .out (net214)
  );
  xor_cell gate208 (
    .a (net131),
    .b (net203),
    .out (net220)
  );
  or_cell gate181 (
    .a (net116),
    .b (net203),
    .out (net195)
  );
  or_cell gate184 (
    .a (net119),
    .b (net121),
    .out (net203)
  );
  and_cell gate182 (
    .a (net170),
    .b (net224),
    .out (net200)
  );
  not_cell gate183 (
    .in (net119),
    .out (net224)
  );
  and_cell gate209 (
    .a (net169),
    .b (net225),
    .out (net207)
  );
  not_cell gate210 (
    .in (net119),
    .out (net225)
  );
  and_cell gate211 (
    .a (net168),
    .b (net226),
    .out (net213)
  );
  not_cell gate212 (
    .in (net119),
    .out (net226)
  );
  and_cell gate213 (
    .a (net167),
    .b (net227),
    .out (net219)
  );
  not_cell gate214 (
    .in (net119),
    .out (net227)
  );
endmodule
