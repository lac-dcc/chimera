// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341194143598379604 */

`default_nettype none

module user_module_341194143598379604(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12 = 1'b1;
  wire net13 = 1'b1;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19;
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
  wire net31 = 1'b0;
  wire net32 = 1'b0;
  wire net33 = 1'b0;
  wire net34 = 1'b0;
  wire net35 = 1'b0;
  wire net36 = 1'b0;
  wire net37 = 1'b0;
  wire net38;
  wire net39;
  wire net40;
  wire net41;
  wire net42;
  wire net43;
  wire net44 = 1'b0;
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
  wire net55 = 1'b0;
  wire net56 = 1'b0;
  wire net57 = 1'b0;
  wire net58 = 1'b0;
  wire net59 = 1'b0;
  wire net60 = 1'b0;
  wire net61 = 1'b0;
  wire net62;
  wire net63;
  wire net64;
  wire net65;
  wire net66 = 1'b0;
  wire net67;
  wire net68;
  wire net69;
  wire net70;
  wire net71;
  wire net72;
  wire net73;
  wire net74;
  wire net75;
  wire net76 = 1'b0;
  wire net77 = 1'b0;
  wire net78 = 1'b0;
  wire net79 = 1'b0;
  wire net80 = 1'b0;
  wire net81 = 1'b0;
  wire net82 = 1'b0;
  wire net83;
  wire net84;
  wire net85;
  wire net86;
  wire net87;
  wire net88;
  wire net89;
  wire net90;
  wire net91;
  wire net92 = 1'b0;
  wire net93;
  wire net94;
  wire net95;
  wire net96 = 1'b0;
  wire net97 = 1'b0;
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
  wire net118 = 1'b0;
  wire net119 = 1'b0;
  wire net120 = 1'b0;
  wire net121 = 1'b0;
  wire net122 = 1'b0;
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
  wire net160 = 1'b0;
  wire net161;
  wire net162;
  wire net163;
  wire net164;
  wire net165 = 1'b0;
  wire net166;
  wire net167;

  assign io_out[0] = net5;
  assign io_out[1] = net6;
  assign io_out[2] = net7;
  assign io_out[3] = net8;
  assign io_out[4] = net9;
  assign io_out[5] = net10;
  assign io_out[6] = net11;

  and_cell gate1 (
    .a (net14),
    .b (net15),
    .out (net16)
  );
  or_cell gate2 (
    .a (net17),
    .b (net18),
    .out (net19)
  );
  xor_cell gate3 (

  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (
    .d (net2),
    .clk (net1),
    .q (net20)
  );
  dff_cell flipflop2 (
    .d (net20),
    .clk (net1),
    .q (net22)
  );
  dff_cell flipflop3 (
    .d (net22),
    .clk (net1),
    .q (net14)
  );
  dff_cell flipflop4 (
    .d (net14),
    .clk (net1),
    .q (net15)
  );
  dff_cell flipflop5 (
    .d (net15),
    .clk (net1),
    .q (net23)
  );
  dff_cell flipflop6 (
    .d (net23),
    .clk (net1),
    .q (net24)
  );
  dff_cell flipflop7 (
    .d (net24),
    .clk (net1),
    .q (net25)
  );
  and_cell gate7 (
    .a (net16),
    .b (net23),
    .out (net26)
  );
  and_cell gate8 (
    .a (net26),
    .b (net24),
    .out (net27)
  );
  and_cell gate9 (
    .a (net27),
    .b (net25),
    .out (net28)
  );
  dff_cell flipflop8 (
    .d (net28),
    .clk (net1),
    .q (net29),
    .notq (net30)
  );
  not_cell gate11 (
    .in (net38),
    .out (net39)
  );
  and_cell gate5 (
    .a (net40),
    .b (net41),
    .out (net42)
  );
  dff_cell flipflop9 (
    .d (net3),
    .clk (net1),
    .q (net43)
  );
  dff_cell flipflop10 (
    .d (net43),
    .clk (net1),
    .q (net45)
  );
  dff_cell flipflop11 (
    .d (net45),
    .clk (net1),
    .q (net40)
  );
  dff_cell flipflop12 (
    .d (net40),
    .clk (net1),
    .q (net41)
  );
  dff_cell flipflop13 (
    .d (net41),
    .clk (net1),
    .q (net46)
  );
  dff_cell flipflop14 (
    .d (net46),
    .clk (net1),
    .q (net47)
  );
  dff_cell flipflop15 (
    .d (net47),
    .clk (net1),
    .q (net48)
  );
  and_cell gate12 (
    .a (net42),
    .b (net46),
    .out (net49)
  );
  and_cell gate13 (
    .a (net49),
    .b (net47),
    .out (net50)
  );
  and_cell gate14 (
    .a (net50),
    .b (net48),
    .out (net51)
  );
  dff_cell flipflop16 (
    .d (net51),
    .clk (net1),
    .q (net52),
    .notq (net53)
  );
  and_cell gate15 (
    .a (net51),
    .b (net53),
    .out (net54)
  );
  and_cell gate16 (
    .a (net62),
    .b (net63),
    .out (net64)
  );
  dff_cell flipflop17 (
    .d (net4),
    .clk (net1),
    .q (net65)
  );
  dff_cell flipflop18 (
    .d (net65),
    .clk (net1),
    .q (net67)
  );
  dff_cell flipflop19 (
    .d (net67),
    .clk (net1),
    .q (net62)
  );
  dff_cell flipflop20 (
    .d (net62),
    .clk (net1),
    .q (net63)
  );
  dff_cell flipflop21 (
    .d (net63),
    .clk (net1),
    .q (net68)
  );
  dff_cell flipflop22 (
    .d (net68),
    .clk (net1),
    .q (net69)
  );
  dff_cell flipflop23 (
    .d (net69),
    .clk (net1),
    .q (net70)
  );
  and_cell gate17 (
    .a (net64),
    .b (net68),
    .out (net71)
  );
  and_cell gate18 (
    .a (net71),
    .b (net69),
    .out (net72)
  );
  and_cell gate19 (
    .a (net72),
    .b (net70),
    .out (net73)
  );
  dff_cell flipflop24 (
    .d (net73),
    .clk (net1),
    .q (net74),
    .notq (net75)
  );
  and_cell gate20 (
    .a (net73),
    .b (net75),
    .out (net38)
  );
  and_cell gate21 (
    .a (net19),
    .b (net83),
    .out (net84)
  );
  or_cell gate22 (
    .a (net85),
    .b (net84),
    .out (net86)
  );
  xor_cell gate23 (
    .a (net19),
    .b (net83),
    .out (net87)
  );
  dff_cell flipflop25 (
    .d (net88),
    .clk (net1),
    .q (net83)
  );
  xor_cell gate24 (
    .a (net87),
    .b (net89),
    .out (net90)
  );
  and_cell gate25 (
    .a (net87),
    .b (net89),
    .out (net85)
  );
  and_cell gate26 (
    .a (net91),
    .b (net90),
    .out (net88)
  );
  nand_cell gate10 (
    .a (net28),
    .b (net30),
    .out (net91)
  );
  and_cell gate4 (
    .a (net54),
    .b (net39),
    .out (net93)
  );
  not_cell gate27 (
    .in (net54),
    .out (net94)
  );
  and_cell gate28 (
    .a (net94),
    .b (net38),
    .out (net95)
  );
  and_cell gate29 (
    .a (net18),
    .b (net98),
    .out (net99)
  );
  or_cell gate30 (
    .a (net100),
    .b (net99),
    .out (net101)
  );
  xor_cell gate31 (
    .a (net18),
    .b (net98),
    .out (net102)
  );
  dff_cell flipflop26 (
    .d (net103),
    .clk (net1),
    .q (net98)
  );
  xor_cell gate32 (
    .a (net102),
    .b (net86),
    .out (net104)
  );
  and_cell gate33 (
    .a (net102),
    .b (net86),
    .out (net100)
  );
  and_cell gate34 (
    .a (net91),
    .b (net104),
    .out (net103)
  );
  and_cell gate35 (
    .a (net18),
    .b (net105),
    .out (net106)
  );
  or_cell gate36 (
    .a (net107),
    .b (net106),
    .out (net108)
  );
  xor_cell gate37 (
    .a (net18),
    .b (net105),
    .out (net109)
  );
  dff_cell flipflop27 (
    .d (net110),
    .clk (net1),
    .q (net105)
  );
  xor_cell gate38 (
    .a (net109),
    .b (net101),
    .out (net111)
  );
  and_cell gate39 (
    .a (net109),
    .b (net101),
    .out (net107)
  );
  and_cell gate40 (
    .a (net91),
    .b (net111),
    .out (net110)
  );
  and_cell gate41 (
    .a (net18),
    .b (net112),
    .out (net113)
  );
  or_cell gate42 (
    .a (net114),
    .b (net113)
  );
  xor_cell gate43 (
    .a (net18),
    .b (net112),
    .out (net115)
  );
  dff_cell flipflop28 (
    .d (net116),
    .clk (net1),
    .q (net112)
  );
  xor_cell gate44 (
    .a (net115),
    .b (net108),
    .out (net117)
  );
  and_cell gate45 (
    .a (net115),
    .b (net108),
    .out (net114)
  );
  and_cell gate46 (
    .a (net91),
    .b (net117),
    .out (net116)
  );
  not_cell gate47 (
    .in (net83),
    .out (net123)
  );
  buffer_cell gate48 (
    .in (net83),
    .out (net124)
  );
  not_cell gate49 (
    .in (net98),
    .out (net125)
  );
  buffer_cell gate50 (
    .in (net98),
    .out (net126)
  );
  not_cell gate51 (
    .in (net105),
    .out (net127)
  );
  buffer_cell gate52 (
    .in (net105),
    .out (net128)
  );
  not_cell gate53 (
    .in (net112)
  );
  buffer_cell gate54 (
    .in (net112),
    .out (net129)
  );
  and_cell gate55 (
    .a (net127),
    .b (net123),
    .out (net130)
  );
  and_cell gate56 (
    .a (net126),
    .b (net123),
    .out (net131)
  );
  or_cell gate57 (
    .a (net130),
    .b (net131),
    .out (net9)
  );
  or_cell gate58 (
    .a (net130),
    .b (net126),
    .out (net132)
  );
  or_cell gate59 (
    .a (net129),
    .b (net133),
    .out (net134)
  );
  or_cell gate60 (
    .a (net132),
    .b (net134),
    .out (net5)
  );
  and_cell gate61 (
    .a (net128),
    .b (net124),
    .out (net133)
  );
  or_cell gate62 (
    .a (net135),
    .b (net136),
    .out (net6)
  );
  or_cell gate63 (
    .a (net127),
    .b (net137),
    .out (net136)
  );
  and_cell gate64 (
    .a (net126),
    .b (net124),
    .out (net137)
  );
  and_cell gate65 (
    .a (net125),
    .b (net123),
    .out (net135)
  );
  or_cell gate66 (
    .a (net125),
    .b (net138),
    .out (net7)
  );
  or_cell gate67 (
    .a (net128),
    .b (net124),
    .out (net138)
  );
  or_cell gate68 (
    .a (net130),
    .b (net139),
    .out (net140)
  );
  and_cell gate69 (
    .a (net127),
    .b (net126),
    .out (net139)
  );
  or_cell gate70 (
    .a (net129),
    .b (net141),
    .out (net142)
  );
  or_cell gate71 (
    .a (net143),
    .b (net144),
    .out (net141)
  );
  or_cell gate72 (
    .a (net140),
    .b (net142),
    .out (net8)
  );
  and_cell gate73 (
    .a (net128),
    .b (net145),
    .out (net144)
  );
  and_cell gate74 (
    .a (net126),
    .b (net123),
    .out (net143)
  );
  and_cell gate75 (
    .a (net125),
    .b (net124),
    .out (net145)
  );
  or_cell gate76 (
    .a (net146),
    .b (net147),
    .out (net10)
  );
  or_cell gate77 (
    .a (net148),
    .b (net149),
    .out (net146)
  );
  or_cell gate78 (
    .a (net129),
    .b (net150),
    .out (net147)
  );
  and_cell gate79 (
    .a (net125),
    .b (net123),
    .out (net148)
  );
  and_cell gate80 (
    .a (net128),
    .b (net125),
    .out (net149)
  );
  and_cell gate81 (
    .a (net128),
    .b (net123),
    .out (net150)
  );
  or_cell gate82 (
    .a (net151),
    .b (net152),
    .out (net11)
  );
  or_cell gate83 (
    .a (net153),
    .b (net154),
    .out (net151)
  );
  or_cell gate84 (
    .a (net129),
    .b (net155),
    .out (net152)
  );
  and_cell gate85 (
    .a (net127),
    .b (net126),
    .out (net153)
  );
  and_cell gate86 (
    .a (net128),
    .b (net125),
    .out (net154)
  );
  and_cell gate87 (
    .a (net128),
    .b (net123),
    .out (net155)
  );
  and_cell gate88 (
    .a (net83),
    .b (net156),
    .out (net157)
  );
  not_cell gate89 (
    .in (net98),
    .out (net156)
  );
  and_cell gate90 (
    .a (net158),
    .b (net112),
    .out (net159)
  );
  not_cell gate91 (
    .in (net105),
    .out (net158)
  );
  and_cell gate93 (
    .a (net161),
    .b (net156),
    .out (net162)
  );
  and_cell gate94 (
    .a (net158),
    .b (net163),
    .out (net164)
  );
  not_cell gate96 (
    .in (net83),
    .out (net161)
  );
  not_cell gate97 (
    .in (net112),
    .out (net163)
  );
  nand_cell gate98 (
    .a (net157),
    .b (net159),
    .out (net166)
  );
  nand_cell gate92 (
    .a (net162),
    .b (net164),
    .out (net167)
  );
  and_cell gate95 (
    .a (net95),
    .b (net167),
    .out (net18)
  );
  and_cell gate99 (
    .a (net93),
    .b (net166),
    .out (net17)
  );
endmodule
