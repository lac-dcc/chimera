// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341620484740219475 */

`default_nettype none

module user_module_341620484740219475(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
  wire net5 = io_in[4];
  wire net6 = io_in[5];
  wire net7 = io_in[7];
  wire net8;
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
  wire net21 = 1'b1;
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
  wire net58 = 1'b1;
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
  wire net85 = 1'b1;
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
  wire net112 = 1'b1;
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
  wire net139 = 1'b1;
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
  wire net166 = 1'b1;
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
  wire net193 = 1'b1;
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
  wire net220 = 1'b1;
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
  wire net231;
  wire net232;
  wire net233;
  wire net234;
  wire net235;
  wire net236;
  wire net237;
  wire net238;
  wire net239;
  wire net240;
  wire net241;
  wire net242 = 1'b0;
  wire net243 = 1'b1;
  wire net244;
  wire net245;

  assign io_out[0] = net8;
  assign io_out[1] = net9;
  assign io_out[2] = net10;
  assign io_out[3] = net11;
  assign io_out[4] = net12;
  assign io_out[5] = net13;
  assign io_out[6] = net14;
  assign io_out[7] = net15;

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
    .d (net19),
    .clk (net7),
    .q (net20),
    .notq (net19)
  );
  dff_cell flipflop2 (
    .d (net2),
    .clk (net22),
    .q (net23),
    .notq (net24)
  );
  dff_cell flipflop6 (
    .d (net25),
    .clk (net22),
    .q (net26),
    .notq (net27)
  );
  dff_cell flipflop7 (
    .d (net28),
    .clk (net22),
    .q (net29),
    .notq (net30)
  );
  dff_cell flipflop8 (
    .d (net31),
    .clk (net22),
    .q (net32),
    .notq (net33)
  );
  dff_cell flipflop9 (
    .d (net34),
    .clk (net22),
    .q (net35),
    .notq (net36)
  );
  dff_cell flipflop10 (
    .d (net37),
    .clk (net22),
    .q (net38),
    .notq (net39)
  );
  dff_cell flipflop11 (
    .d (net40),
    .clk (net22),
    .q (net41),
    .notq (net42)
  );
  dff_cell flipflop12 (
    .d (net43),
    .clk (net22),
    .q (net44),
    .notq (net45)
  );
  mux_cell mux2 (
    .a (net23),
    .b (net26),
    .sel (net46),
    .out (net47)
  );
  mux_cell mux3 (
    .a (net29),
    .b (net32),
    .sel (net46),
    .out (net48)
  );
  mux_cell mux4 (
    .a (net35),
    .b (net38),
    .sel (net46),
    .out (net49)
  );
  mux_cell mux5 (
    .a (net41),
    .b (net44),
    .sel (net46),
    .out (net50)
  );
  mux_cell mux6 (
    .a (net47),
    .b (net48),
    .sel (net51),
    .out (net52)
  );
  mux_cell mux7 (
    .a (net49),
    .b (net50),
    .sel (net51),
    .out (net53)
  );
  mux_cell mux8 (
    .a (net52),
    .b (net53),
    .sel (net54),
    .out (net8)
  );
  buffer_cell gate7 (
    .in (net55),
    .out (net46)
  );
  buffer_cell gate8 (
    .in (net56),
    .out (net51)
  );
  buffer_cell gate9 (
    .in (net57),
    .out (net54)
  );
  buffer_cell gate10 (
    .in (net1),
    .out (net22)
  );
  dff_cell flipflop3 (
    .d (net23),
    .clk (net59),
    .q (net60),
    .notq (net61)
  );
  dff_cell flipflop4 (
    .d (net26),
    .clk (net59),
    .q (net62),
    .notq (net63)
  );
  dff_cell flipflop5 (
    .d (net29),
    .clk (net59),
    .q (net64),
    .notq (net65)
  );
  dff_cell flipflop13 (
    .d (net32),
    .clk (net59),
    .q (net66),
    .notq (net67)
  );
  dff_cell flipflop14 (
    .d (net35),
    .clk (net59),
    .q (net68),
    .notq (net69)
  );
  dff_cell flipflop15 (
    .d (net38),
    .clk (net59),
    .q (net70),
    .notq (net71)
  );
  dff_cell flipflop16 (
    .d (net41),
    .clk (net59),
    .q (net72),
    .notq (net73)
  );
  dff_cell flipflop17 (
    .d (net44),
    .clk (net59),
    .q (net74),
    .notq (net75)
  );
  mux_cell mux9 (
    .a (net60),
    .b (net62),
    .sel (net76),
    .out (net77)
  );
  mux_cell mux10 (
    .a (net64),
    .b (net66),
    .sel (net76),
    .out (net78)
  );
  mux_cell mux11 (
    .a (net68),
    .b (net70),
    .sel (net76),
    .out (net79)
  );
  mux_cell mux12 (
    .a (net72),
    .b (net74),
    .sel (net76),
    .out (net80)
  );
  mux_cell mux13 (
    .a (net77),
    .b (net78),
    .sel (net81),
    .out (net82)
  );
  mux_cell mux14 (
    .a (net79),
    .b (net80),
    .sel (net81),
    .out (net83)
  );
  mux_cell mux15 (
    .a (net82),
    .b (net83),
    .sel (net84),
    .out (net9)
  );
  buffer_cell gate11 (
    .in (net55),
    .out (net76)
  );
  buffer_cell gate12 (
    .in (net56),
    .out (net81)
  );
  buffer_cell gate13 (
    .in (net57),
    .out (net84)
  );
  buffer_cell gate14 (
    .in (net1),
    .out (net59)
  );
  dff_cell flipflop18 (
    .d (net60),
    .clk (net86),
    .q (net87),
    .notq (net88)
  );
  dff_cell flipflop19 (
    .d (net62),
    .clk (net86),
    .q (net89),
    .notq (net90)
  );
  dff_cell flipflop20 (
    .d (net64),
    .clk (net86),
    .q (net91),
    .notq (net92)
  );
  dff_cell flipflop21 (
    .d (net66),
    .clk (net86),
    .q (net93),
    .notq (net94)
  );
  dff_cell flipflop22 (
    .d (net68),
    .clk (net86),
    .q (net95),
    .notq (net96)
  );
  dff_cell flipflop23 (
    .d (net70),
    .clk (net86),
    .q (net97),
    .notq (net98)
  );
  dff_cell flipflop24 (
    .d (net72),
    .clk (net86),
    .q (net99),
    .notq (net100)
  );
  dff_cell flipflop25 (
    .d (net74),
    .clk (net86),
    .q (net101),
    .notq (net102)
  );
  mux_cell mux16 (
    .a (net87),
    .b (net89),
    .sel (net103),
    .out (net104)
  );
  mux_cell mux17 (
    .a (net91),
    .b (net93),
    .sel (net103),
    .out (net105)
  );
  mux_cell mux18 (
    .a (net95),
    .b (net97),
    .sel (net103),
    .out (net106)
  );
  mux_cell mux19 (
    .a (net99),
    .b (net101),
    .sel (net103),
    .out (net107)
  );
  mux_cell mux20 (
    .a (net104),
    .b (net105),
    .sel (net108),
    .out (net109)
  );
  mux_cell mux21 (
    .a (net106),
    .b (net107),
    .sel (net108),
    .out (net110)
  );
  mux_cell mux22 (
    .a (net109),
    .b (net110),
    .sel (net111),
    .out (net10)
  );
  buffer_cell gate15 (
    .in (net55),
    .out (net103)
  );
  buffer_cell gate16 (
    .in (net56),
    .out (net108)
  );
  buffer_cell gate17 (
    .in (net57),
    .out (net111)
  );
  buffer_cell gate18 (
    .in (net1),
    .out (net86)
  );
  dff_cell flipflop26 (
    .d (net87),
    .clk (net113),
    .q (net114),
    .notq (net115)
  );
  dff_cell flipflop27 (
    .d (net89),
    .clk (net113),
    .q (net116),
    .notq (net117)
  );
  dff_cell flipflop28 (
    .d (net91),
    .clk (net113),
    .q (net118),
    .notq (net119)
  );
  dff_cell flipflop29 (
    .d (net93),
    .clk (net113),
    .q (net120),
    .notq (net121)
  );
  dff_cell flipflop30 (
    .d (net95),
    .clk (net113),
    .q (net122),
    .notq (net123)
  );
  dff_cell flipflop31 (
    .d (net97),
    .clk (net113),
    .q (net124),
    .notq (net125)
  );
  dff_cell flipflop32 (
    .d (net99),
    .clk (net113),
    .q (net126),
    .notq (net127)
  );
  dff_cell flipflop33 (
    .d (net101),
    .clk (net113),
    .q (net128),
    .notq (net129)
  );
  mux_cell mux23 (
    .a (net114),
    .b (net116),
    .sel (net130),
    .out (net131)
  );
  mux_cell mux24 (
    .a (net118),
    .b (net120),
    .sel (net130),
    .out (net132)
  );
  mux_cell mux25 (
    .a (net122),
    .b (net124),
    .sel (net130),
    .out (net133)
  );
  mux_cell mux26 (
    .a (net126),
    .b (net128),
    .sel (net130),
    .out (net134)
  );
  mux_cell mux27 (
    .a (net131),
    .b (net132),
    .sel (net135),
    .out (net136)
  );
  mux_cell mux28 (
    .a (net133),
    .b (net134),
    .sel (net135),
    .out (net137)
  );
  mux_cell mux29 (
    .a (net136),
    .b (net137),
    .sel (net138),
    .out (net11)
  );
  buffer_cell gate19 (
    .in (net55),
    .out (net130)
  );
  buffer_cell gate20 (
    .in (net56),
    .out (net135)
  );
  buffer_cell gate21 (
    .in (net57),
    .out (net138)
  );
  buffer_cell gate22 (
    .in (net1),
    .out (net113)
  );
  dff_cell flipflop34 (
    .d (net114),
    .clk (net140),
    .q (net141),
    .notq (net142)
  );
  dff_cell flipflop35 (
    .d (net116),
    .clk (net140),
    .q (net143),
    .notq (net144)
  );
  dff_cell flipflop36 (
    .d (net118),
    .clk (net140),
    .q (net145),
    .notq (net146)
  );
  dff_cell flipflop37 (
    .d (net120),
    .clk (net140),
    .q (net147),
    .notq (net148)
  );
  dff_cell flipflop38 (
    .d (net122),
    .clk (net140),
    .q (net149),
    .notq (net150)
  );
  dff_cell flipflop39 (
    .d (net124),
    .clk (net140),
    .q (net151),
    .notq (net152)
  );
  dff_cell flipflop40 (
    .d (net126),
    .clk (net140),
    .q (net153),
    .notq (net154)
  );
  dff_cell flipflop41 (
    .d (net128),
    .clk (net140),
    .q (net155),
    .notq (net156)
  );
  mux_cell mux30 (
    .a (net141),
    .b (net143),
    .sel (net157),
    .out (net158)
  );
  mux_cell mux31 (
    .a (net145),
    .b (net147),
    .sel (net157),
    .out (net159)
  );
  mux_cell mux32 (
    .a (net149),
    .b (net151),
    .sel (net157),
    .out (net160)
  );
  mux_cell mux33 (
    .a (net153),
    .b (net155),
    .sel (net157),
    .out (net161)
  );
  mux_cell mux34 (
    .a (net158),
    .b (net159),
    .sel (net162),
    .out (net163)
  );
  mux_cell mux35 (
    .a (net160),
    .b (net161),
    .sel (net162),
    .out (net164)
  );
  mux_cell mux36 (
    .a (net163),
    .b (net164),
    .sel (net165),
    .out (net12)
  );
  buffer_cell gate23 (
    .in (net55),
    .out (net157)
  );
  buffer_cell gate24 (
    .in (net56),
    .out (net162)
  );
  buffer_cell gate25 (
    .in (net57),
    .out (net165)
  );
  buffer_cell gate26 (
    .in (net1),
    .out (net140)
  );
  dff_cell flipflop42 (
    .d (net141),
    .clk (net167),
    .q (net168),
    .notq (net169)
  );
  dff_cell flipflop43 (
    .d (net143),
    .clk (net167),
    .q (net170),
    .notq (net171)
  );
  dff_cell flipflop44 (
    .d (net145),
    .clk (net167),
    .q (net172),
    .notq (net173)
  );
  dff_cell flipflop45 (
    .d (net147),
    .clk (net167),
    .q (net174),
    .notq (net175)
  );
  dff_cell flipflop46 (
    .d (net149),
    .clk (net167),
    .q (net176),
    .notq (net177)
  );
  dff_cell flipflop47 (
    .d (net151),
    .clk (net167),
    .q (net178),
    .notq (net179)
  );
  dff_cell flipflop48 (
    .d (net153),
    .clk (net167),
    .q (net180),
    .notq (net181)
  );
  dff_cell flipflop49 (
    .d (net155),
    .clk (net167),
    .q (net182),
    .notq (net183)
  );
  mux_cell mux37 (
    .a (net168),
    .b (net170),
    .sel (net184),
    .out (net185)
  );
  mux_cell mux38 (
    .a (net172),
    .b (net174),
    .sel (net184),
    .out (net186)
  );
  mux_cell mux39 (
    .a (net176),
    .b (net178),
    .sel (net184),
    .out (net187)
  );
  mux_cell mux40 (
    .a (net180),
    .b (net182),
    .sel (net184),
    .out (net188)
  );
  mux_cell mux41 (
    .a (net185),
    .b (net186),
    .sel (net189),
    .out (net190)
  );
  mux_cell mux42 (
    .a (net187),
    .b (net188),
    .sel (net189),
    .out (net191)
  );
  mux_cell mux43 (
    .a (net190),
    .b (net191),
    .sel (net192),
    .out (net13)
  );
  buffer_cell gate27 (
    .in (net55),
    .out (net184)
  );
  buffer_cell gate28 (
    .in (net56),
    .out (net189)
  );
  buffer_cell gate29 (
    .in (net57),
    .out (net192)
  );
  buffer_cell gate30 (
    .in (net1),
    .out (net167)
  );
  dff_cell flipflop50 (
    .d (net168),
    .clk (net194),
    .q (net195),
    .notq (net196)
  );
  dff_cell flipflop51 (
    .d (net170),
    .clk (net194),
    .q (net197),
    .notq (net198)
  );
  dff_cell flipflop52 (
    .d (net172),
    .clk (net194),
    .q (net199),
    .notq (net200)
  );
  dff_cell flipflop53 (
    .d (net174),
    .clk (net194),
    .q (net201),
    .notq (net202)
  );
  dff_cell flipflop54 (
    .d (net176),
    .clk (net194),
    .q (net203),
    .notq (net204)
  );
  dff_cell flipflop55 (
    .d (net178),
    .clk (net194),
    .q (net205),
    .notq (net206)
  );
  dff_cell flipflop56 (
    .d (net180),
    .clk (net194),
    .q (net207),
    .notq (net208)
  );
  dff_cell flipflop57 (
    .d (net182),
    .clk (net194),
    .q (net209),
    .notq (net210)
  );
  mux_cell mux44 (
    .a (net195),
    .b (net197),
    .sel (net211),
    .out (net212)
  );
  mux_cell mux45 (
    .a (net199),
    .b (net201),
    .sel (net211),
    .out (net213)
  );
  mux_cell mux46 (
    .a (net203),
    .b (net205),
    .sel (net211),
    .out (net214)
  );
  mux_cell mux47 (
    .a (net207),
    .b (net209),
    .sel (net211),
    .out (net215)
  );
  mux_cell mux48 (
    .a (net212),
    .b (net213),
    .sel (net216),
    .out (net217)
  );
  mux_cell mux49 (
    .a (net214),
    .b (net215),
    .sel (net216),
    .out (net218)
  );
  mux_cell mux50 (
    .a (net217),
    .b (net218),
    .sel (net219),
    .out (net14)
  );
  buffer_cell gate31 (
    .in (net55),
    .out (net211)
  );
  buffer_cell gate32 (
    .in (net56),
    .out (net216)
  );
  buffer_cell gate33 (
    .in (net57),
    .out (net219)
  );
  buffer_cell gate34 (
    .in (net1),
    .out (net194)
  );
  dff_cell flipflop58 (
    .d (net195),
    .clk (net221),
    .q (net25),
    .notq (net222)
  );
  dff_cell flipflop59 (
    .d (net197),
    .clk (net221),
    .q (net28),
    .notq (net223)
  );
  dff_cell flipflop60 (
    .d (net199),
    .clk (net221),
    .q (net31),
    .notq (net224)
  );
  dff_cell flipflop61 (
    .d (net201),
    .clk (net221),
    .q (net34),
    .notq (net225)
  );
  dff_cell flipflop62 (
    .d (net203),
    .clk (net221),
    .q (net37),
    .notq (net226)
  );
  dff_cell flipflop63 (
    .d (net205),
    .clk (net221),
    .q (net40),
    .notq (net227)
  );
  dff_cell flipflop64 (
    .d (net207),
    .clk (net221),
    .q (net43),
    .notq (net228)
  );
  dff_cell flipflop65 (
    .d (net209),
    .clk (net221),
    .q (net229),
    .notq (net230)
  );
  mux_cell mux51 (
    .a (net25),
    .b (net28),
    .sel (net231),
    .out (net232)
  );
  mux_cell mux52 (
    .a (net31),
    .b (net34),
    .sel (net231),
    .out (net233)
  );
  mux_cell mux53 (
    .a (net37),
    .b (net40),
    .sel (net231),
    .out (net234)
  );
  mux_cell mux54 (
    .a (net43),
    .b (net229),
    .sel (net231),
    .out (net235)
  );
  mux_cell mux55 (
    .a (net232),
    .b (net233),
    .sel (net236),
    .out (net237)
  );
  mux_cell mux56 (
    .a (net234),
    .b (net235),
    .sel (net236),
    .out (net238)
  );
  mux_cell mux57 (
    .a (net237),
    .b (net238),
    .sel (net239),
    .out (net15)
  );
  buffer_cell gate35 (
    .in (net55),
    .out (net231)
  );
  buffer_cell gate36 (
    .in (net56),
    .out (net236)
  );
  buffer_cell gate37 (
    .in (net57),
    .out (net239)
  );
  buffer_cell gate38 (
    .in (net1),
    .out (net221)
  );
  dff_cell flipflop67 (

  );
  dff_cell flipflop66 (
    .d (net240),
    .clk (net20),
    .q (net241),
    .notq (net240)
  );
  dff_cell flipflop68 (
    .d (net244),
    .clk (net241),
    .notq (net244)
  );
  mux_cell mux58 (
    .a (net3),
    .b (net19),
    .sel (net245),
    .out (net55)
  );
  mux_cell mux59 (
    .a (net4),
    .b (net240),
    .sel (net245),
    .out (net56)
  );
  mux_cell mux60 (
    .a (net5),
    .b (net244),
    .sel (net245),
    .out (net57)
  );
  buffer_cell gate39 (
    .in (net6),
    .out (net245)
  );
endmodule
