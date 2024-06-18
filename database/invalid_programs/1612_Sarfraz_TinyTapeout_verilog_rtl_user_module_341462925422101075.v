// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341462925422101075 */

`default_nettype none

module user_module_341462925422101075(
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
  wire net12;
  wire net13 = 1'b1;
  wire net14 = 1'b1;
  wire net15;
  wire net16 = 1'b0;
  wire net17;
  wire net18;
  wire net19 = 1'b0;
  wire net20 = 1'b0;
  wire net21 = 1'b0;
  wire net22 = 1'b0;
  wire net23 = 1'b0;
  wire net24 = 1'b0;
  wire net25 = 1'b0;
  wire net26;
  wire net27;
  wire net28;
  wire net29 = 1'b0;
  wire net30 = 1'b0;
  wire net31;
  wire net32;
  wire net33 = 1'b0;
  wire net34;
  wire net35;
  wire net36;
  wire net37;
  wire net38 = 1'b1;
  wire net39;
  wire net40;
  wire net41;
  wire net42;
  wire net43 = 1'b0;
  wire net44;
  wire net45;
  wire net46 = 1'b1;
  wire net47;
  wire net48;
  wire net49;
  wire net50;
  wire net51 = 1'b0;
  wire net52;
  wire net53;
  wire net54;
  wire net55;
  wire net56 = 1'b1;
  wire net57;
  wire net58;
  wire net59;
  wire net60;
  wire net61 = 1'b0;
  wire net62;
  wire net63;
  wire net64 = 1'b1;
  wire net65;
  wire net66;
  wire net67;
  wire net68;
  wire net69 = 1'b0;
  wire net70;
  wire net71;
  wire net72;
  wire net73;
  wire net74 = 1'b1;
  wire net75;
  wire net76;
  wire net77;
  wire net78;
  wire net79 = 1'b0;
  wire net80;
  wire net81;
  wire net82 = 1'b1;
  wire net83;
  wire net84;
  wire net85;
  wire net86;
  wire net87 = 1'b0;
  wire net88;
  wire net89;
  wire net90;
  wire net91;
  wire net92 = 1'b1;
  wire net93;
  wire net94;
  wire net95;
  wire net96;
  wire net97 = 1'b0;
  wire net98;
  wire net99;
  wire net100 = 1'b1;
  wire net101;
  wire net102;
  wire net103;
  wire net104;
  wire net105 = 1'b0;
  wire net106;
  wire net107;
  wire net108;
  wire net109;
  wire net110 = 1'b1;
  wire net111;
  wire net112;
  wire net113;
  wire net114;
  wire net115 = 1'b0;
  wire net116;
  wire net117;
  wire net118;
  wire net119;
  wire net120;
  wire net121;
  wire net122;
  wire net123;
  wire net124;
  wire net125 = 1'b0;
  wire net126 = 1'b0;
  wire net127 = 1'b0;
  wire net128 = 1'b0;
  wire net129;
  wire net130;
  wire net131 = 1'b0;
  wire net132;
  wire net133;
  wire net134 = 1'b0;
  wire net135;
  wire net136;
  wire net137 = 1'b1;
  wire net138;
  wire net139;
  wire net140 = 1'b0;
  wire net141;
  wire net142;
  wire net143 = 1'b1;
  wire net144;
  wire net145;
  wire net146 = 1'b1;
  wire net147;
  wire net148;
  wire net149 = 1'b1;
  wire net150;
  wire net151;
  wire net152 = 1'b1;
  wire net153;
  wire net154;
  wire net155 = 1'b1;
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
  wire net168 = 1'b0;

  assign io_out[0] = net5;
  assign io_out[1] = net6;
  assign io_out[2] = net7;
  assign io_out[3] = net8;
  assign io_out[4] = net9;
  assign io_out[5] = net10;
  assign io_out[6] = net11;
  assign io_out[7] = net12;

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
    .a (net15),
    .b (net16),
    .sel (net17),
    .out (net18)
  );
  dff_cell flipflop1 (

  );
  nand_cell gate7 (

  );
  nand_cell gate8 (

  );
  buffer_cell gate164 (
    .in (net19),
    .out (net6)
  );
  buffer_cell gate165 (
    .in (net20),
    .out (net7)
  );
  buffer_cell gate166 (
    .in (net21),
    .out (net8)
  );
  buffer_cell gate167 (
    .in (net22),
    .out (net9)
  );
  buffer_cell gate168 (
    .in (net23),
    .out (net10)
  );
  buffer_cell gate169 (
    .in (net24),
    .out (net11)
  );
  buffer_cell gate170 (
    .in (net25),
    .out (net12)
  );
  buffer_cell gate183 (
    .in (net1),
    .out (net26)
  );
  buffer_cell gate195 (
    .in (net27),
    .out (net28)
  );
  and_cell gate184 (
    .a (net26),
    .b (net4),
    .out (net27)
  );
  dff_cell flipflop2 (
    .d (net18),
    .clk (net31),
    .q (net32),
    .notq (net15)
  );
  mux_cell mux2 (

  );
  mux_cell mux5 (
    .a (net28),
    .b (net34),
    .sel (net17),
    .out (net31)
  );
  buffer_cell gate9 (
    .in (net35),
    .out (net17)
  );
  buffer_cell gate10 (
    .in (net36),
    .out (net34)
  );
  mux_cell mux3 (
    .a (net37),
    .b (net38),
    .sel (net39),
    .out (net40)
  );
  dff_cell flipflop4 (
    .d (net40),
    .clk (net41),
    .q (net42),
    .notq (net37)
  );
  mux_cell mux4 (
    .a (net15),
    .b (net44),
    .sel (net39),
    .out (net41)
  );
  buffer_cell gate12 (
    .in (net35),
    .out (net39)
  );
  buffer_cell gate13 (
    .in (net36),
    .out (net44)
  );
  mux_cell mux6 (
    .a (net45),
    .b (net46),
    .sel (net47),
    .out (net48)
  );
  dff_cell flipflop6 (
    .d (net48),
    .clk (net49),
    .q (net50),
    .notq (net45)
  );
  mux_cell mux7 (
    .a (net37),
    .b (net52),
    .sel (net47),
    .out (net49)
  );
  buffer_cell gate15 (
    .in (net53),
    .out (net47)
  );
  buffer_cell gate16 (
    .in (net54),
    .out (net52)
  );
  mux_cell mux8 (
    .a (net55),
    .b (net56),
    .sel (net57),
    .out (net58)
  );
  dff_cell flipflop8 (
    .d (net58),
    .clk (net59),
    .q (net60),
    .notq (net55)
  );
  mux_cell mux9 (
    .a (net45),
    .b (net62),
    .sel (net57),
    .out (net59)
  );
  buffer_cell gate18 (
    .in (net53),
    .out (net57)
  );
  buffer_cell gate19 (
    .in (net54),
    .out (net62)
  );
  mux_cell mux10 (
    .a (net63),
    .b (net64),
    .sel (net65),
    .out (net66)
  );
  dff_cell flipflop10 (
    .d (net66),
    .clk (net67),
    .q (net68),
    .notq (net63)
  );
  mux_cell mux11 (
    .a (net55),
    .b (net70),
    .sel (net65),
    .out (net67)
  );
  buffer_cell gate21 (
    .in (net71),
    .out (net65)
  );
  buffer_cell gate23 (
    .in (net72),
    .out (net70)
  );
  mux_cell mux12 (
    .a (net73),
    .b (net74),
    .sel (net75),
    .out (net76)
  );
  dff_cell flipflop12 (
    .d (net76),
    .clk (net77),
    .q (net78),
    .notq (net73)
  );
  mux_cell mux13 (
    .a (net63),
    .b (net80),
    .sel (net75),
    .out (net77)
  );
  buffer_cell gate25 (
    .in (net71),
    .out (net75)
  );
  buffer_cell gate26 (
    .in (net72),
    .out (net80)
  );
  mux_cell mux14 (
    .a (net81),
    .b (net82),
    .sel (net83),
    .out (net84)
  );
  dff_cell flipflop14 (
    .d (net84),
    .clk (net85),
    .q (net86),
    .notq (net81)
  );
  mux_cell mux15 (
    .a (net73),
    .b (net88),
    .sel (net83),
    .out (net85)
  );
  buffer_cell gate28 (
    .in (net89),
    .out (net83)
  );
  buffer_cell gate29 (
    .in (net90),
    .out (net88)
  );
  mux_cell mux16 (
    .a (net91),
    .b (net92),
    .sel (net93),
    .out (net94)
  );
  dff_cell flipflop16 (
    .d (net94),
    .clk (net95),
    .q (net96),
    .notq (net91)
  );
  mux_cell mux17 (
    .a (net81),
    .b (net98),
    .sel (net93),
    .out (net95)
  );
  buffer_cell gate31 (
    .in (net89),
    .out (net93)
  );
  buffer_cell gate32 (
    .in (net90),
    .out (net98)
  );
  mux_cell mux18 (
    .a (net99),
    .b (net100),
    .sel (net101),
    .out (net102)
  );
  dff_cell flipflop18 (
    .d (net102),
    .clk (net103),
    .q (net104),
    .notq (net99)
  );
  mux_cell mux19 (
    .a (net91),
    .b (net106),
    .sel (net101),
    .out (net103)
  );
  buffer_cell gate34 (
    .in (net107),
    .out (net101)
  );
  buffer_cell gate35 (
    .in (net108),
    .out (net106)
  );
  mux_cell mux20 (
    .a (net109),
    .b (net110),
    .sel (net111),
    .out (net112)
  );
  dff_cell flipflop20 (
    .d (net112),
    .clk (net113),
    .q (net114),
    .notq (net109)
  );
  mux_cell mux21 (
    .a (net99),
    .b (net116),
    .sel (net111),
    .out (net113)
  );
  buffer_cell gate37 (
    .in (net107),
    .out (net111)
  );
  buffer_cell gate38 (
    .in (net108),
    .out (net116)
  );
  buffer_cell gate11 (
    .in (net117),
    .out (net36)
  );
  buffer_cell gate14 (
    .in (net117),
    .out (net54)
  );
  buffer_cell gate17 (
    .in (net118),
    .out (net72)
  );
  buffer_cell gate20 (
    .in (net118),
    .out (net90)
  );
  buffer_cell gate30 (
    .in (net119),
    .out (net117)
  );
  buffer_cell gate33 (
    .in (net119),
    .out (net118)
  );
  buffer_cell gate36 (
    .in (net119),
    .out (net120)
  );
  buffer_cell gate24 (
    .in (net120),
    .out (net108)
  );
  buffer_cell gate27 (
    .in (net121),
    .out (net35)
  );
  buffer_cell gate39 (
    .in (net121),
    .out (net53)
  );
  buffer_cell gate40 (
    .in (net122),
    .out (net71)
  );
  buffer_cell gate41 (
    .in (net122),
    .out (net89)
  );
  buffer_cell gate42 (
    .in (net123),
    .out (net121)
  );
  buffer_cell gate43 (
    .in (net123),
    .out (net122)
  );
  buffer_cell gate44 (
    .in (net123),
    .out (net124)
  );
  buffer_cell gate45 (
    .in (net124),
    .out (net107)
  );
  xor_cell gate46 (
    .a (net32),
    .b (net128),
    .out (net129)
  );
  not_cell gate47 (
    .in (net129),
    .out (net130)
  );
  xor_cell gate48 (
    .a (net42),
    .b (net131),
    .out (net132)
  );
  not_cell gate49 (
    .in (net132),
    .out (net133)
  );
  xor_cell gate50 (
    .a (net50),
    .b (net134),
    .out (net135)
  );
  not_cell gate51 (
    .in (net135),
    .out (net136)
  );
  xor_cell gate52 (
    .a (net60),
    .b (net137),
    .out (net138)
  );
  not_cell gate53 (
    .in (net138),
    .out (net139)
  );
  xor_cell gate54 (
    .a (net68),
    .b (net140),
    .out (net141)
  );
  not_cell gate55 (
    .in (net141),
    .out (net142)
  );
  xor_cell gate56 (
    .a (net78),
    .b (net143),
    .out (net144)
  );
  not_cell gate57 (
    .in (net144),
    .out (net145)
  );
  xor_cell gate58 (
    .a (net86),
    .b (net146),
    .out (net147)
  );
  not_cell gate59 (
    .in (net147),
    .out (net148)
  );
  xor_cell gate60 (
    .a (net96),
    .b (net149),
    .out (net150)
  );
  not_cell gate61 (
    .in (net150),
    .out (net151)
  );
  xor_cell gate62 (
    .a (net104),
    .b (net152),
    .out (net153)
  );
  not_cell gate63 (
    .in (net153),
    .out (net154)
  );
  xor_cell gate64 (
    .a (net114),
    .b (net155),
    .out (net156)
  );
  not_cell gate65 (
    .in (net156),
    .out (net157)
  );
  and_cell gate66 (
    .a (net130),
    .b (net133),
    .out (net158)
  );
  and_cell gate67 (
    .a (net158),
    .b (net159),
    .out (net160)
  );
  and_cell gate68 (
    .a (net136),
    .b (net139),
    .out (net159)
  );
  and_cell gate70 (
    .a (net142),
    .b (net145),
    .out (net161)
  );
  and_cell gate71 (
    .a (net161),
    .b (net162),
    .out (net163)
  );
  and_cell gate72 (
    .a (net148),
    .b (net151),
    .out (net162)
  );
  and_cell gate74 (
    .a (net154),
    .b (net157),
    .out (net164)
  );
  and_cell gate76 (
    .a (net160),
    .b (net163),
    .out (net165)
  );
  and_cell gate79 (
    .a (net165),
    .b (net164),
    .out (net166)
  );
  buffer_cell gate69 (
    .in (net166),
    .out (net167)
  );
  buffer_cell gate73 (
    .in (net166),
    .out (net5)
  );
  or_cell gate75 (
    .a (net167),
    .b (net3),
    .out (net123)
  );
  or_cell gate77 (
    .a (net28),
    .b (net2),
    .out (net119)
  );
endmodule
