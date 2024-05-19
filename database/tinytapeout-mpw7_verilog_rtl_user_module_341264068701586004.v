// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341264068701586004 */

`default_nettype none

module user_module_341264068701586004(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
  wire net5;
  wire net6;
  wire net7 = 1'b1;
  wire net8 = 1'b1;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19 = 1'b0;
  wire net20;
  wire net21;
  wire net22;
  wire net23;
  wire net24;
  wire net25;
  wire net26;
  wire net27;
  wire net28;
  wire net29 = 1'b0;
  wire net30 = 1'b0;
  wire net31 = 1'b0;
  wire net32 = 1'b0;
  wire net33 = 1'b0;
  wire net34 = 1'b0;
  wire net35 = 1'b0;
  wire net36;
  wire net37;
  wire net38;
  wire net39;
  wire net40;
  wire net41;
  wire net42 = 1'b0;
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
  wire net53 = 1'b0;
  wire net54 = 1'b0;
  wire net55 = 1'b0;
  wire net56 = 1'b0;
  wire net57 = 1'b0;
  wire net58 = 1'b0;
  wire net59 = 1'b0;
  wire net60;
  wire net61;
  wire net62;
  wire net63;
  wire net64 = 1'b0;
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
  wire net75 = 1'b0;
  wire net76 = 1'b0;
  wire net77 = 1'b0;
  wire net78 = 1'b0;
  wire net79 = 1'b0;
  wire net80 = 1'b0;
  wire net81;
  wire net82;
  wire net83;
  wire net84;
  wire net85;
  wire net86;
  wire net87;
  wire net88;
  wire net89 = 1'b0;
  wire net90;
  wire net91;
  wire net92;
  wire net93 = 1'b0;
  wire net94 = 1'b0;
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
  wire net115 = 1'b0;
  wire net116 = 1'b0;
  wire net117 = 1'b0;
  wire net118 = 1'b0;
  wire net119 = 1'b0;
  wire net120;
  wire net121;
  wire net122;
  wire net123;
  wire net124 = 1'b0;
  wire net125;
  wire net126;
  wire net127;
  wire net128;
  wire net129 = 1'b0;
  wire net130;
  wire net131;
  wire net132 = 1'b1;
  wire net133;
  wire net134;
  wire net135;
  wire net136;
  wire net137;
  wire net138 = 1'b0;
  wire net139 = 1'b0;
  wire net140;
  wire net141;
  wire net142;
  wire net143;
  wire net144;
  wire net145;
  wire net146 = 1'b0;
  wire net147;
  wire net148;
  wire net149;
  wire net150;
  wire net151;
  wire net152;
  wire net153 = 1'b0;
  wire net154;
  wire net155;
  wire net156;
  wire net157;
  wire net158 = 1'b0;
  wire net159 = 1'b0;
  wire net160 = 1'b0;
  wire net161 = 1'b0;
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
  wire net176 = 1'b0;
  wire net177;
  wire net178;
  wire net179;

  assign io_out[0] = net5;
  assign io_out[1] = net5;
  assign io_out[2] = net5;
  assign io_out[3] = net5;
  assign io_out[4] = net5;
  assign io_out[5] = net5;
  assign io_out[6] = net5;
  assign io_out[7] = net6;

  and_cell gate1 (
    .a (net9),
    .b (net10),
    .out (net11)
  );
  or_cell gate2 (
    .a (net12),
    .b (net13),
    .out (net14)
  );
  xor_cell gate3 (
    .a (net15),
    .b (net16),
    .out (net17)
  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (
    .d (net2),
    .clk (net1),
    .q (net18)
  );
  dff_cell flipflop2 (
    .d (net18),
    .clk (net1),
    .q (net20)
  );
  dff_cell flipflop3 (
    .d (net20),
    .clk (net1),
    .q (net9)
  );
  dff_cell flipflop4 (
    .d (net9),
    .clk (net1),
    .q (net10)
  );
  dff_cell flipflop5 (
    .d (net10),
    .clk (net1),
    .q (net21)
  );
  dff_cell flipflop6 (
    .d (net21),
    .clk (net1),
    .q (net22)
  );
  dff_cell flipflop7 (
    .d (net22),
    .clk (net1),
    .q (net23)
  );
  and_cell gate7 (
    .a (net11),
    .b (net21),
    .out (net24)
  );
  and_cell gate8 (
    .a (net24),
    .b (net22),
    .out (net25)
  );
  and_cell gate9 (
    .a (net25),
    .b (net23),
    .out (net26)
  );
  dff_cell flipflop8 (
    .d (net26),
    .clk (net1),
    .q (net27),
    .notq (net28)
  );
  not_cell gate11 (
    .in (net36),
    .out (net37)
  );
  and_cell gate5 (
    .a (net38),
    .b (net39),
    .out (net40)
  );
  dff_cell flipflop9 (
    .d (net3),
    .clk (net1),
    .q (net41)
  );
  dff_cell flipflop10 (
    .d (net41),
    .clk (net1),
    .q (net43)
  );
  dff_cell flipflop11 (
    .d (net43),
    .clk (net1),
    .q (net38)
  );
  dff_cell flipflop12 (
    .d (net38),
    .clk (net1),
    .q (net39)
  );
  dff_cell flipflop13 (
    .d (net39),
    .clk (net1),
    .q (net44)
  );
  dff_cell flipflop14 (
    .d (net44),
    .clk (net1),
    .q (net45)
  );
  dff_cell flipflop15 (
    .d (net45),
    .clk (net1),
    .q (net46)
  );
  and_cell gate12 (
    .a (net40),
    .b (net44),
    .out (net47)
  );
  and_cell gate13 (
    .a (net47),
    .b (net45),
    .out (net48)
  );
  and_cell gate14 (
    .a (net48),
    .b (net46),
    .out (net49)
  );
  dff_cell flipflop16 (
    .d (net49),
    .clk (net1),
    .q (net50),
    .notq (net51)
  );
  and_cell gate15 (
    .a (net49),
    .b (net51),
    .out (net52)
  );
  and_cell gate16 (
    .a (net60),
    .b (net61),
    .out (net62)
  );
  dff_cell flipflop17 (
    .d (net4),
    .clk (net1),
    .q (net63)
  );
  dff_cell flipflop18 (
    .d (net63),
    .clk (net1),
    .q (net65)
  );
  dff_cell flipflop19 (
    .d (net65),
    .clk (net1),
    .q (net60)
  );
  dff_cell flipflop20 (
    .d (net60),
    .clk (net1),
    .q (net61)
  );
  dff_cell flipflop21 (
    .d (net61),
    .clk (net1),
    .q (net66)
  );
  dff_cell flipflop22 (
    .d (net66),
    .clk (net1),
    .q (net67)
  );
  dff_cell flipflop23 (
    .d (net67),
    .clk (net1),
    .q (net68)
  );
  and_cell gate17 (
    .a (net62),
    .b (net66),
    .out (net69)
  );
  and_cell gate18 (
    .a (net69),
    .b (net67),
    .out (net70)
  );
  and_cell gate19 (
    .a (net70),
    .b (net68),
    .out (net71)
  );
  dff_cell flipflop24 (
    .d (net71),
    .clk (net1),
    .q (net72),
    .notq (net73)
  );
  and_cell gate20 (
    .a (net71),
    .b (net73),
    .out (net36)
  );
  and_cell gate21 (
    .a (net14),
    .b (net16),
    .out (net81)
  );
  or_cell gate22 (
    .a (net82),
    .b (net81),
    .out (net83)
  );
  xor_cell gate23 (
    .a (net14),
    .b (net16),
    .out (net84)
  );
  dff_cell flipflop25 (
    .d (net85),
    .clk (net1),
    .q (net16)
  );
  xor_cell gate24 (
    .a (net84),
    .b (net86),
    .out (net87)
  );
  and_cell gate25 (
    .a (net84),
    .b (net86),
    .out (net82)
  );
  and_cell gate26 (
    .a (net88),
    .b (net87),
    .out (net85)
  );
  nand_cell gate10 (
    .a (net26),
    .b (net28),
    .out (net88)
  );
  and_cell gate4 (
    .a (net52),
    .b (net37),
    .out (net90)
  );
  not_cell gate27 (
    .in (net52),
    .out (net91)
  );
  and_cell gate28 (
    .a (net91),
    .b (net36),
    .out (net92)
  );
  and_cell gate29 (
    .a (net13),
    .b (net95),
    .out (net96)
  );
  or_cell gate30 (
    .a (net97),
    .b (net96),
    .out (net98)
  );
  xor_cell gate31 (
    .a (net13),
    .b (net95),
    .out (net99)
  );
  dff_cell flipflop26 (
    .d (net100),
    .clk (net1),
    .q (net95)
  );
  xor_cell gate32 (
    .a (net99),
    .b (net83),
    .out (net101)
  );
  and_cell gate33 (
    .a (net99),
    .b (net83),
    .out (net97)
  );
  and_cell gate34 (
    .a (net88),
    .b (net101),
    .out (net100)
  );
  and_cell gate35 (
    .a (net13),
    .b (net102),
    .out (net103)
  );
  or_cell gate36 (
    .a (net104),
    .b (net103),
    .out (net105)
  );
  xor_cell gate37 (
    .a (net13),
    .b (net102),
    .out (net106)
  );
  dff_cell flipflop27 (
    .d (net107),
    .clk (net1),
    .q (net102)
  );
  xor_cell gate38 (
    .a (net106),
    .b (net98),
    .out (net108)
  );
  and_cell gate39 (
    .a (net106),
    .b (net98),
    .out (net104)
  );
  and_cell gate40 (
    .a (net88),
    .b (net108),
    .out (net107)
  );
  and_cell gate41 (
    .a (net13),
    .b (net109),
    .out (net110)
  );
  or_cell gate42 (
    .a (net111),
    .b (net110)
  );
  xor_cell gate43 (
    .a (net13),
    .b (net109),
    .out (net112)
  );
  dff_cell flipflop28 (
    .d (net113),
    .clk (net1),
    .q (net109)
  );
  xor_cell gate44 (
    .a (net112),
    .b (net105),
    .out (net114)
  );
  and_cell gate45 (
    .a (net112),
    .b (net105),
    .out (net111)
  );
  and_cell gate46 (
    .a (net88),
    .b (net114),
    .out (net113)
  );
  and_cell gate88 (
    .a (net16),
    .b (net95),
    .out (net120)
  );
  not_cell gate89 (
    .in (net95),
    .out (net121)
  );
  and_cell gate90 (
    .a (net102),
    .b (net109),
    .out (net122)
  );
  not_cell gate91 (
    .in (net102),
    .out (net123)
  );
  and_cell gate93 (
    .a (net125),
    .b (net121),
    .out (net126)
  );
  and_cell gate94 (
    .a (net123),
    .b (net127),
    .out (net128)
  );
  not_cell gate96 (
    .in (net16),
    .out (net125)
  );
  not_cell gate97 (
    .in (net109),
    .out (net127)
  );
  nand_cell gate98 (
    .a (net120),
    .b (net122),
    .out (net130)
  );
  nand_cell gate92 (
    .a (net126),
    .b (net128),
    .out (net131)
  );
  and_cell gate95 (
    .a (net92),
    .b (net131),
    .out (net13)
  );
  and_cell gate99 (
    .a (net90),
    .b (net130),
    .out (net12)
  );
  and_cell gate47 (
    .a (net132),
    .b (net15),
    .out (net133)
  );
  or_cell gate48 (
    .a (net134),
    .b (net133),
    .out (net135)
  );
  xor_cell gate49 (
    .a (net132),
    .b (net15),
    .out (net136)
  );
  dff_cell flipflop29 (
    .d (net137),
    .clk (net1),
    .q (net15)
  );
  xor_cell gate50 (
    .a (net136),
    .b (net138),
    .out (net137)
  );
  and_cell gate51 (
    .a (net136),
    .b (net138),
    .out (net134)
  );
  and_cell gate53 (
    .a (net139),
    .b (net140),
    .out (net141)
  );
  or_cell gate54 (
    .a (net142),
    .b (net141),
    .out (net143)
  );
  xor_cell gate55 (
    .a (net139),
    .b (net140),
    .out (net144)
  );
  dff_cell flipflop30 (
    .d (net145),
    .clk (net1),
    .q (net140)
  );
  xor_cell gate56 (
    .a (net144),
    .b (net135),
    .out (net145)
  );
  and_cell gate57 (
    .a (net144),
    .b (net135),
    .out (net142)
  );
  and_cell gate59 (
    .a (net146),
    .b (net147),
    .out (net148)
  );
  or_cell gate60 (
    .a (net149),
    .b (net148),
    .out (net150)
  );
  xor_cell gate61 (
    .a (net146),
    .b (net147),
    .out (net151)
  );
  dff_cell flipflop31 (
    .d (net152),
    .clk (net1),
    .q (net147)
  );
  xor_cell gate62 (
    .a (net151),
    .b (net143),
    .out (net152)
  );
  and_cell gate63 (
    .a (net151),
    .b (net143),
    .out (net149)
  );
  and_cell gate65 (
    .a (net153),
    .b (net6),
    .out (net154)
  );
  or_cell gate66 (
    .a (net155),
    .b (net154)
  );
  xor_cell gate67 (
    .a (net153),
    .b (net6),
    .out (net156)
  );
  dff_cell flipflop32 (
    .d (net157),
    .clk (net1),
    .q (net6)
  );
  xor_cell gate68 (
    .a (net156),
    .b (net150),
    .out (net157)
  );
  and_cell gate69 (
    .a (net156),
    .b (net150),
    .out (net155)
  );
  and_cell gate52 (
    .a (net15),
    .b (net140),
    .out (net162)
  );
  and_cell gate58 (
    .a (net147),
    .b (net6),
    .out (net163)
  );
  and_cell gate64 (
    .a (net162),
    .b (net163),
    .out (net164)
  );
  xor_cell gate70 (
    .a (net140),
    .b (net95),
    .out (net165)
  );
  not_cell gate71 (
    .in (net17),
    .out (net166)
  );
  not_cell gate72 (
    .in (net165),
    .out (net167)
  );
  xor_cell gate73 (
    .a (net147),
    .b (net102),
    .out (net168)
  );
  not_cell gate74 (
    .in (net168),
    .out (net169)
  );
  xor_cell gate75 (
    .a (net6),
    .b (net109),
    .out (net170)
  );
  not_cell gate76 (
    .in (net170),
    .out (net171)
  );
  and_cell gate77 (
    .a (net166),
    .b (net167),
    .out (net172)
  );
  and_cell gate78 (
    .a (net169),
    .b (net171),
    .out (net173)
  );
  and_cell gate79 (
    .a (net172),
    .b (net173),
    .out (net174)
  );
  dff_cell flipflop33 (
    .d (net177),
    .clk (net1),
    .q (net5)
  );
  or_cell gate80 (
    .a (net178),
    .b (net174),
    .out (net177)
  );
  and_cell gate81 (
    .a (net5),
    .b (net179),
    .out (net178)
  );
  not_cell gate82 (
    .in (net164),
    .out (net179)
  );
endmodule
