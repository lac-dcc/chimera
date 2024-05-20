// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341188777753969234 */

`default_nettype none

module user_module_341188777753969234(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[5];
  wire net4 = io_in[6];
  wire net5 = io_in[7];
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14 = 1'b0;
  wire net15 = 1'b1;
  wire net16 = 1'b1;
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
  wire net34 = 1'b0;
  wire net35 = 1'b1;
  wire net36;
  wire net37;
  wire net38;
  wire net39;
  wire net40;
  wire net41;
  wire net42;
  wire net43;
  wire net44;
  wire net45 = 1'b0;
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
  wire net63 = 1'b0;
  wire net64 = 1'b1;
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
  wire net91 = 1'b0;
  wire net92 = 1'b1;
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
  wire net119 = 1'b0;
  wire net120 = 1'b1;
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
  wire net147 = 1'b0;
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
  wire net174;
  wire net175 = 1'b0;
  wire net176 = 1'b1;
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
  wire net203 = 1'b0;
  wire net204 = 1'b1;
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
  wire net228;
  wire net229;
  wire net230;
  wire net231 = 1'b0;
  wire net232 = 1'b1;
  wire net233;
  wire net234;
  wire net235;
  wire net236;
  wire net237;
  wire net238;
  wire net239;
  wire net240;
  wire net241;

  assign io_out[0] = net6;
  assign io_out[1] = net7;
  assign io_out[2] = net8;
  assign io_out[3] = net9;
  assign io_out[4] = net10;
  assign io_out[5] = net11;
  assign io_out[6] = net12;
  assign io_out[7] = net13;

  buffer_cell gate6 (
    .in (net1),
    .out (net17)
  );
  dff_cell flipflop2 (
    .d (net2),
    .clk (net17),
    .q (net18),
    .notq (net19)
  );
  dff_cell flipflop3 (
    .d (net18),
    .clk (net17),
    .q (net20),
    .notq (net21)
  );
  dff_cell flipflop4 (
    .d (net20),
    .clk (net17),
    .q (net22),
    .notq (net23)
  );
  dff_cell flipflop5 (
    .d (net22),
    .clk (net17),
    .q (net24),
    .notq (net25)
  );
  dff_cell flipflop6 (
    .d (net24),
    .clk (net17),
    .q (net26),
    .notq (net27)
  );
  dff_cell flipflop7 (
    .d (net26),
    .clk (net17),
    .q (net28),
    .notq (net29)
  );
  dff_cell flipflop8 (
    .d (net28),
    .clk (net17),
    .q (net30),
    .notq (net31)
  );
  dff_cell flipflop9 (
    .d (net30),
    .clk (net17),
    .q (net32),
    .notq (net33)
  );
  mux_cell mux2 (
    .a (net18),
    .b (net20),
    .sel (net36),
    .out (net37)
  );
  mux_cell mux3 (
    .a (net22),
    .b (net24),
    .sel (net36),
    .out (net38)
  );
  mux_cell mux4 (
    .a (net26),
    .b (net28),
    .sel (net36),
    .out (net39)
  );
  mux_cell mux5 (
    .a (net30),
    .b (net32),
    .sel (net36),
    .out (net40)
  );
  mux_cell mux6 (
    .a (net37),
    .b (net38),
    .sel (net41),
    .out (net42)
  );
  mux_cell mux7 (
    .a (net39),
    .b (net40),
    .sel (net41),
    .out (net43)
  );
  mux_cell mux8 (
    .a (net42),
    .b (net43),
    .sel (net44),
    .out (net6)
  );
  buffer_cell gate7 (
    .in (net3),
    .out (net36)
  );
  buffer_cell gate8 (
    .in (net4),
    .out (net41)
  );
  buffer_cell gate9 (
    .in (net5),
    .out (net44)
  );
  buffer_cell gate10 (
    .in (net1),
    .out (net46)
  );
  dff_cell flipflop10 (
    .d (net32),
    .clk (net46),
    .q (net47),
    .notq (net48)
  );
  dff_cell flipflop11 (
    .d (net47),
    .clk (net46),
    .q (net49),
    .notq (net50)
  );
  dff_cell flipflop12 (
    .d (net49),
    .clk (net46),
    .q (net51),
    .notq (net52)
  );
  dff_cell flipflop13 (
    .d (net51),
    .clk (net46),
    .q (net53),
    .notq (net54)
  );
  dff_cell flipflop14 (
    .d (net53),
    .clk (net46),
    .q (net55),
    .notq (net56)
  );
  dff_cell flipflop15 (
    .d (net55),
    .clk (net46),
    .q (net57),
    .notq (net58)
  );
  dff_cell flipflop16 (
    .d (net57),
    .clk (net46),
    .q (net59),
    .notq (net60)
  );
  dff_cell flipflop17 (
    .d (net59),
    .clk (net46),
    .q (net61),
    .notq (net62)
  );
  mux_cell mux9 (
    .a (net47),
    .b (net49),
    .sel (net65),
    .out (net66)
  );
  mux_cell mux10 (
    .a (net51),
    .b (net53),
    .sel (net65),
    .out (net67)
  );
  mux_cell mux11 (
    .a (net55),
    .b (net57),
    .sel (net65),
    .out (net68)
  );
  mux_cell mux12 (
    .a (net59),
    .b (net61),
    .sel (net65),
    .out (net69)
  );
  mux_cell mux13 (
    .a (net66),
    .b (net67),
    .sel (net70),
    .out (net71)
  );
  mux_cell mux14 (
    .a (net68),
    .b (net69),
    .sel (net70),
    .out (net72)
  );
  mux_cell mux15 (
    .a (net71),
    .b (net72),
    .sel (net73),
    .out (net7)
  );
  buffer_cell gate11 (
    .in (net3),
    .out (net65)
  );
  buffer_cell gate12 (
    .in (net4),
    .out (net70)
  );
  buffer_cell gate13 (
    .in (net5),
    .out (net73)
  );
  buffer_cell gate14 (
    .in (net1),
    .out (net74)
  );
  dff_cell flipflop18 (
    .d (net61),
    .clk (net74),
    .q (net75),
    .notq (net76)
  );
  dff_cell flipflop19 (
    .d (net75),
    .clk (net74),
    .q (net77),
    .notq (net78)
  );
  dff_cell flipflop20 (
    .d (net77),
    .clk (net74),
    .q (net79),
    .notq (net80)
  );
  dff_cell flipflop21 (
    .d (net79),
    .clk (net74),
    .q (net81),
    .notq (net82)
  );
  dff_cell flipflop22 (
    .d (net81),
    .clk (net74),
    .q (net83),
    .notq (net84)
  );
  dff_cell flipflop23 (
    .d (net83),
    .clk (net74),
    .q (net85),
    .notq (net86)
  );
  dff_cell flipflop24 (
    .d (net85),
    .clk (net74),
    .q (net87),
    .notq (net88)
  );
  dff_cell flipflop25 (
    .d (net87),
    .clk (net74),
    .q (net89),
    .notq (net90)
  );
  mux_cell mux16 (
    .a (net75),
    .b (net77),
    .sel (net93),
    .out (net94)
  );
  mux_cell mux17 (
    .a (net79),
    .b (net81),
    .sel (net93),
    .out (net95)
  );
  mux_cell mux18 (
    .a (net83),
    .b (net85),
    .sel (net93),
    .out (net96)
  );
  mux_cell mux19 (
    .a (net87),
    .b (net89),
    .sel (net93),
    .out (net97)
  );
  mux_cell mux20 (
    .a (net94),
    .b (net95),
    .sel (net98),
    .out (net99)
  );
  mux_cell mux21 (
    .a (net96),
    .b (net97),
    .sel (net98),
    .out (net100)
  );
  mux_cell mux22 (
    .a (net99),
    .b (net100),
    .sel (net101),
    .out (net8)
  );
  buffer_cell gate15 (
    .in (net3),
    .out (net93)
  );
  buffer_cell gate16 (
    .in (net4),
    .out (net98)
  );
  buffer_cell gate17 (
    .in (net5),
    .out (net101)
  );
  buffer_cell gate18 (
    .in (net1),
    .out (net102)
  );
  dff_cell flipflop26 (
    .d (net89),
    .clk (net102),
    .q (net103),
    .notq (net104)
  );
  dff_cell flipflop27 (
    .d (net103),
    .clk (net102),
    .q (net105),
    .notq (net106)
  );
  dff_cell flipflop28 (
    .d (net105),
    .clk (net102),
    .q (net107),
    .notq (net108)
  );
  dff_cell flipflop29 (
    .d (net107),
    .clk (net102),
    .q (net109),
    .notq (net110)
  );
  dff_cell flipflop30 (
    .d (net109),
    .clk (net102),
    .q (net111),
    .notq (net112)
  );
  dff_cell flipflop31 (
    .d (net111),
    .clk (net102),
    .q (net113),
    .notq (net114)
  );
  dff_cell flipflop32 (
    .d (net113),
    .clk (net102),
    .q (net115),
    .notq (net116)
  );
  dff_cell flipflop33 (
    .d (net115),
    .clk (net102),
    .q (net117),
    .notq (net118)
  );
  mux_cell mux23 (
    .a (net103),
    .b (net105),
    .sel (net121),
    .out (net122)
  );
  mux_cell mux24 (
    .a (net107),
    .b (net109),
    .sel (net121),
    .out (net123)
  );
  mux_cell mux25 (
    .a (net111),
    .b (net113),
    .sel (net121),
    .out (net124)
  );
  mux_cell mux26 (
    .a (net115),
    .b (net117),
    .sel (net121),
    .out (net125)
  );
  mux_cell mux27 (
    .a (net122),
    .b (net123),
    .sel (net126),
    .out (net127)
  );
  mux_cell mux28 (
    .a (net124),
    .b (net125),
    .sel (net126),
    .out (net128)
  );
  mux_cell mux29 (
    .a (net127),
    .b (net128),
    .sel (net129),
    .out (net9)
  );
  buffer_cell gate19 (
    .in (net3),
    .out (net121)
  );
  buffer_cell gate20 (
    .in (net4),
    .out (net126)
  );
  buffer_cell gate21 (
    .in (net5),
    .out (net129)
  );
  buffer_cell gate22 (
    .in (net1),
    .out (net130)
  );
  dff_cell flipflop34 (
    .d (net117),
    .clk (net130),
    .q (net131),
    .notq (net132)
  );
  dff_cell flipflop35 (
    .d (net131),
    .clk (net130),
    .q (net133),
    .notq (net134)
  );
  dff_cell flipflop36 (
    .d (net133),
    .clk (net130),
    .q (net135),
    .notq (net136)
  );
  dff_cell flipflop37 (
    .d (net135),
    .clk (net130),
    .q (net137),
    .notq (net138)
  );
  dff_cell flipflop38 (
    .d (net137),
    .clk (net130),
    .q (net139),
    .notq (net140)
  );
  dff_cell flipflop39 (
    .d (net139),
    .clk (net130),
    .q (net141),
    .notq (net142)
  );
  dff_cell flipflop40 (
    .d (net141),
    .clk (net130),
    .q (net143),
    .notq (net144)
  );
  dff_cell flipflop41 (
    .d (net143),
    .clk (net130),
    .q (net145),
    .notq (net146)
  );
  mux_cell mux30 (
    .a (net131),
    .b (net133),
    .sel (net149),
    .out (net150)
  );
  mux_cell mux31 (
    .a (net135),
    .b (net137),
    .sel (net149),
    .out (net151)
  );
  mux_cell mux32 (
    .a (net139),
    .b (net141),
    .sel (net149),
    .out (net152)
  );
  mux_cell mux33 (
    .a (net143),
    .b (net145),
    .sel (net149),
    .out (net153)
  );
  mux_cell mux34 (
    .a (net150),
    .b (net151),
    .sel (net154),
    .out (net155)
  );
  mux_cell mux35 (
    .a (net152),
    .b (net153),
    .sel (net154),
    .out (net156)
  );
  mux_cell mux36 (
    .a (net155),
    .b (net156),
    .sel (net157),
    .out (net10)
  );
  buffer_cell gate23 (
    .in (net3),
    .out (net149)
  );
  buffer_cell gate24 (
    .in (net4),
    .out (net154)
  );
  buffer_cell gate25 (
    .in (net5),
    .out (net157)
  );
  buffer_cell gate26 (
    .in (net1),
    .out (net158)
  );
  dff_cell flipflop42 (
    .d (net145),
    .clk (net158),
    .q (net159),
    .notq (net160)
  );
  dff_cell flipflop43 (
    .d (net159),
    .clk (net158),
    .q (net161),
    .notq (net162)
  );
  dff_cell flipflop44 (
    .d (net161),
    .clk (net158),
    .q (net163),
    .notq (net164)
  );
  dff_cell flipflop45 (
    .d (net163),
    .clk (net158),
    .q (net165),
    .notq (net166)
  );
  dff_cell flipflop46 (
    .d (net165),
    .clk (net158),
    .q (net167),
    .notq (net168)
  );
  dff_cell flipflop47 (
    .d (net167),
    .clk (net158),
    .q (net169),
    .notq (net170)
  );
  dff_cell flipflop48 (
    .d (net169),
    .clk (net158),
    .q (net171),
    .notq (net172)
  );
  dff_cell flipflop49 (
    .d (net171),
    .clk (net158),
    .q (net173),
    .notq (net174)
  );
  mux_cell mux37 (
    .a (net159),
    .b (net161),
    .sel (net177),
    .out (net178)
  );
  mux_cell mux38 (
    .a (net163),
    .b (net165),
    .sel (net177),
    .out (net179)
  );
  mux_cell mux39 (
    .a (net167),
    .b (net169),
    .sel (net177),
    .out (net180)
  );
  mux_cell mux40 (
    .a (net171),
    .b (net173),
    .sel (net177),
    .out (net181)
  );
  mux_cell mux41 (
    .a (net178),
    .b (net179),
    .sel (net182),
    .out (net183)
  );
  mux_cell mux42 (
    .a (net180),
    .b (net181),
    .sel (net182),
    .out (net184)
  );
  mux_cell mux43 (
    .a (net183),
    .b (net184),
    .sel (net185),
    .out (net11)
  );
  buffer_cell gate27 (
    .in (net3),
    .out (net177)
  );
  buffer_cell gate28 (
    .in (net4),
    .out (net182)
  );
  buffer_cell gate29 (
    .in (net5),
    .out (net185)
  );
  buffer_cell gate30 (
    .in (net1),
    .out (net186)
  );
  dff_cell flipflop50 (
    .d (net173),
    .clk (net186),
    .q (net187),
    .notq (net188)
  );
  dff_cell flipflop51 (
    .d (net187),
    .clk (net186),
    .q (net189),
    .notq (net190)
  );
  dff_cell flipflop52 (
    .d (net189),
    .clk (net186),
    .q (net191),
    .notq (net192)
  );
  dff_cell flipflop53 (
    .d (net191),
    .clk (net186),
    .q (net193),
    .notq (net194)
  );
  dff_cell flipflop54 (
    .d (net193),
    .clk (net186),
    .q (net195),
    .notq (net196)
  );
  dff_cell flipflop55 (
    .d (net195),
    .clk (net186),
    .q (net197),
    .notq (net198)
  );
  dff_cell flipflop56 (
    .d (net197),
    .clk (net186),
    .q (net199),
    .notq (net200)
  );
  dff_cell flipflop57 (
    .d (net199),
    .clk (net186),
    .q (net201),
    .notq (net202)
  );
  mux_cell mux44 (
    .a (net187),
    .b (net189),
    .sel (net205),
    .out (net206)
  );
  mux_cell mux45 (
    .a (net191),
    .b (net193),
    .sel (net205),
    .out (net207)
  );
  mux_cell mux46 (
    .a (net195),
    .b (net197),
    .sel (net205),
    .out (net208)
  );
  mux_cell mux47 (
    .a (net199),
    .b (net201),
    .sel (net205),
    .out (net209)
  );
  mux_cell mux48 (
    .a (net206),
    .b (net207),
    .sel (net210),
    .out (net211)
  );
  mux_cell mux49 (
    .a (net208),
    .b (net209),
    .sel (net210),
    .out (net212)
  );
  mux_cell mux50 (
    .a (net211),
    .b (net212),
    .sel (net213),
    .out (net12)
  );
  buffer_cell gate31 (
    .in (net3),
    .out (net205)
  );
  buffer_cell gate32 (
    .in (net4),
    .out (net210)
  );
  buffer_cell gate33 (
    .in (net5),
    .out (net213)
  );
  buffer_cell gate34 (
    .in (net1),
    .out (net214)
  );
  dff_cell flipflop58 (
    .d (net201),
    .clk (net214),
    .q (net215),
    .notq (net216)
  );
  dff_cell flipflop59 (
    .d (net215),
    .clk (net214),
    .q (net217),
    .notq (net218)
  );
  dff_cell flipflop60 (
    .d (net217),
    .clk (net214),
    .q (net219),
    .notq (net220)
  );
  dff_cell flipflop61 (
    .d (net219),
    .clk (net214),
    .q (net221),
    .notq (net222)
  );
  dff_cell flipflop62 (
    .d (net221),
    .clk (net214),
    .q (net223),
    .notq (net224)
  );
  dff_cell flipflop63 (
    .d (net223),
    .clk (net214),
    .q (net225),
    .notq (net226)
  );
  dff_cell flipflop64 (
    .d (net225),
    .clk (net214),
    .q (net227),
    .notq (net228)
  );
  dff_cell flipflop65 (
    .d (net227),
    .clk (net214),
    .q (net229),
    .notq (net230)
  );
  mux_cell mux51 (
    .a (net215),
    .b (net217),
    .sel (net233),
    .out (net234)
  );
  mux_cell mux52 (
    .a (net219),
    .b (net221),
    .sel (net233),
    .out (net235)
  );
  mux_cell mux53 (
    .a (net223),
    .b (net225),
    .sel (net233),
    .out (net236)
  );
  mux_cell mux54 (
    .a (net227),
    .b (net229),
    .sel (net233),
    .out (net237)
  );
  mux_cell mux55 (
    .a (net234),
    .b (net235),
    .sel (net238),
    .out (net239)
  );
  mux_cell mux56 (
    .a (net236),
    .b (net237),
    .sel (net238),
    .out (net240)
  );
  mux_cell mux57 (
    .a (net239),
    .b (net240),
    .sel (net241),
    .out (net13)
  );
  buffer_cell gate35 (
    .in (net3),
    .out (net233)
  );
  buffer_cell gate36 (
    .in (net4),
    .out (net238)
  );
  buffer_cell gate37 (
    .in (net5),
    .out (net241)
  );
endmodule
