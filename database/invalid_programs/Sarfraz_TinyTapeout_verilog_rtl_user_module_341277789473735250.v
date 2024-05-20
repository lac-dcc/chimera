// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341277789473735250 */

`default_nettype none

module user_module_341277789473735250(
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;
  assign io_out[6] = net15;
  assign io_out[7] = net16;

  or_cell gate7 (
    .a (net19),
    .b (net20),
    .out (net15)
  );
  or_cell gate9 (
    .a (net21),
    .b (net22),
    .out (net14)
  );
  or_cell gate10 (
    .a (net23),
    .b (net24),
    .out (net13)
  );
  or_cell gate11 (
    .a (net25),
    .b (net26),
    .out (net11)
  );
  or_cell gate12 (
    .a (net27),
    .b (net28),
    .out (net12)
  );
  or_cell gate13 (
    .a (net29),
    .b (net30),
    .out (net10)
  );
  or_cell gate14 (
    .a (net31),
    .b (net32),
    .out (net9)
  );
  or_cell gate17 (
    .a (net22),
    .b (net20),
    .out (net28)
  );
  or_cell gate18 (
    .a (net20),
    .b (net22),
    .out (net24)
  );
  or_cell gate19 (
    .a (net20),
    .b (net33),
    .out (net30)
  );
  or_cell gate20 (
    .a (net34),
    .b (net22),
    .out (net26)
  );
  or_cell gate21 (
    .a (net20),
    .b (net22),
    .out (net32)
  );
  or_cell gate22 (
    .a (net34),
    .b (net22),
    .out (net33)
  );
  or_cell gate8 (
    .a (net35),
    .b (net36),
    .out (net27)
  );
  or_cell gate23 (
    .a (net37),
    .b (net38),
    .out (net21)
  );
  or_cell gate24 (
    .a (net37),
    .b (net38),
    .out (net23)
  );
  or_cell gate25 (
    .a (net37),
    .b (net38),
    .out (net25)
  );
  or_cell gate26 (
    .a (net39),
    .b (net40),
    .out (net19)
  );
  or_cell gate27 (
    .a (net37),
    .b (net38),
    .out (net29)
  );
  or_cell gate28 (
    .a (net41),
    .b (net42),
    .out (net31)
  );
  or_cell gate15 (
    .a (net37),
    .b (net43),
    .out (net36)
  );
  or_cell gate16 (
    .a (net43),
    .b (net44),
    .out (net39)
  );
  or_cell gate29 (
    .a (net37),
    .b (net38),
    .out (net44)
  );
  or_cell gate30 (
    .a (net37),
    .b (net38),
    .out (net41)
  );
  or_cell gate31 (
    .a (net45),
    .b (net46),
    .out (net22)
  );
  or_cell gate32 (
    .a (net47),
    .b (net48),
    .out (net34)
  );
  or_cell gate33 (
    .a (net49),
    .b (net50),
    .out (net20)
  );
  or_cell gate34 (
    .a (net51),
    .b (net52),
    .out (net40)
  );
  or_cell gate35 (
    .a (net53),
    .b (net54),
    .out (net35)
  );
  or_cell gate39 (
    .a (net55),
    .b (net56),
    .out (net42)
  );
  and_cell gate40 (
    .a (net2),
    .b (net57),
    .out (net58)
  );
  and_cell gate41 (
    .a (net2),
    .b (net59),
    .out (net60)
  );
  and_cell gate42 (
    .a (net2),
    .b (net61),
    .out (net62)
  );
  and_cell gate43 (
    .a (net2),
    .b (net63),
    .out (net64)
  );
  and_cell gate44 (
    .a (net3),
    .b (net4),
    .out (net57)
  );
  and_cell gate45 (
    .a (net65),
    .b (net4),
    .out (net59)
  );
  not_cell gate46 (
    .in (net3),
    .out (net65)
  );
  and_cell gate47 (
    .a (net3),
    .b (net66),
    .out (net61)
  );
  not_cell gate48 (
    .in (net4),
    .out (net66)
  );
  xor_cell gate50 (
    .a (net7),
    .b (net8),
    .out (net67)
  );
  and_cell gate51 (
    .a (net7),
    .b (net68),
    .out (net69)
  );
  not_cell gate52 (
    .in (net8),
    .out (net68)
  );
  and_cell gate53 (
    .a (net58),
    .b (net70),
    .out (net71)
  );
  and_cell gate54 (
    .a (net58),
    .b (net72),
    .out (net73)
  );
  and_cell gate55 (
    .a (net58),
    .b (net74),
    .out (net46)
  );
  and_cell gate56 (
    .a (net58),
    .b (net75),
    .out (net48)
  );
  and_cell gate57 (
    .a (net58),
    .b (net76),
    .out (net50)
  );
  or_cell gate58 (
    .a (net77),
    .b (net71),
    .out (net54)
  );
  or_cell gate59 (
    .a (net78),
    .b (net73),
    .out (net52)
  );
  and_cell gate61 (
    .a (net79),
    .b (net69),
    .out (net70)
  );
  and_cell gate62 (
    .a (net1),
    .b (net67),
    .out (net79)
  );
  and_cell gate63 (
    .a (net80),
    .b (net67),
    .out (net81)
  );
  and_cell gate64 (
    .a (net81),
    .b (net69),
    .out (net76)
  );
  and_cell gate65 (
    .a (net80),
    .b (net67),
    .out (net82)
  );
  and_cell gate66 (
    .a (net1),
    .b (net67),
    .out (net83)
  );
  or_cell gate67 (
    .a (net83),
    .b (net70),
    .out (net72)
  );
  and_cell gate68 (
    .a (net84),
    .b (net85),
    .out (net74)
  );
  not_cell gate69 (
    .in (net69),
    .out (net85)
  );
  and_cell gate70 (
    .a (net80),
    .b (net86),
    .out (net84)
  );
  not_cell gate71 (
    .in (net67),
    .out (net86)
  );
  and_cell gate72 (
    .a (net82),
    .b (net87),
    .out (net75)
  );
  not_cell gate73 (
    .in (net69),
    .out (net87)
  );
  xor_cell gate74 (
    .a (net6),
    .b (net8),
    .out (net88)
  );
  xor_cell gate75 (
    .a (net5),
    .b (net7),
    .out (net89)
  );
  not_cell gate76 (
    .in (net89),
    .out (net90)
  );
  not_cell gate77 (
    .in (net88),
    .out (net91)
  );
  and_cell gate78 (
    .a (net90),
    .b (net91),
    .out (net92)
  );
  or_cell gate79 (
    .a (net93),
    .b (net94),
    .out (net95)
  );
  and_cell gate80 (
    .a (net96),
    .b (net6),
    .out (net93)
  );
  not_cell gate81 (
    .in (net8),
    .out (net97)
  );
  and_cell gate82 (
    .a (net98),
    .b (net5),
    .out (net99)
  );
  not_cell gate83 (
    .in (net7),
    .out (net98)
  );
  or_cell gate84 (
    .a (net100),
    .b (net101),
    .out (net102)
  );
  and_cell gate85 (
    .a (net103),
    .b (net104),
    .out (net101)
  );
  not_cell gate86 (
    .in (net6),
    .out (net103)
  );
  and_cell gate87 (
    .a (net7),
    .b (net8),
    .out (net104)
  );
  not_cell gate88 (
    .in (net5),
    .out (net105)
  );
  not_cell gate89 (
    .in (net62),
    .out (net106)
  );
  and_cell gate90 (
    .a (net106),
    .b (net8),
    .out (net107)
  );
  and_cell gate91 (
    .a (net62),
    .b (net6),
    .out (net108)
  );
  and_cell gate92 (
    .a (net106),
    .b (net7),
    .out (net109)
  );
  and_cell gate93 (
    .a (net62),
    .b (net5),
    .out (net110)
  );
  or_cell gate94 (
    .a (net110),
    .b (net109),
    .out (net111)
  );
  or_cell gate95 (
    .a (net108),
    .b (net107),
    .out (net112)
  );
  xor_cell gate96 (
    .a (net111),
    .b (net112),
    .out (net113)
  );
  and_cell gate97 (
    .a (net111),
    .b (net112),
    .out (net114)
  );
  and_cell gate99 (
    .a (net115),
    .b (net116),
    .out (net77)
  );
  and_cell gate100 (
    .a (net115),
    .b (net117),
    .out (net78)
  );
  and_cell gate101 (
    .a (net115),
    .b (net118),
    .out (net56)
  );
  and_cell gate102 (
    .a (net115),
    .b (net119),
    .out (net45)
  );
  and_cell gate103 (
    .a (net115),
    .b (net120),
    .out (net47)
  );
  and_cell gate104 (
    .a (net115),
    .b (net121),
    .out (net49)
  );
  and_cell gate105 (
    .a (net1),
    .b (net113),
    .out (net117)
  );
  and_cell gate106 (
    .a (net1),
    .b (net122),
    .out (net116)
  );
  and_cell gate107 (
    .a (net80),
    .b (net122),
    .out (net119)
  );
  and_cell gate108 (
    .a (net80),
    .b (net113),
    .out (net120)
  );
  and_cell gate109 (
    .a (net80),
    .b (net114),
    .out (net121)
  );
  and_cell gate110 (
    .a (net1),
    .b (net114),
    .out (net118)
  );
  or_cell gate111 (
    .a (net62),
    .b (net60),
    .out (net115)
  );
  and_cell gate112 (
    .a (net64),
    .b (net123),
    .out (net53)
  );
  and_cell gate113 (
    .a (net64),
    .b (net124),
    .out (net51)
  );
  and_cell gate114 (
    .a (net64),
    .b (net125),
    .out (net55)
  );
  and_cell gate115 (
    .a (net64),
    .b (net126),
    .out (net37)
  );
  and_cell gate116 (
    .a (net64),
    .b (net127),
    .out (net43)
  );
  and_cell gate117 (
    .a (net64),
    .b (net128),
    .out (net38)
  );
  and_cell gate118 (
    .a (net1),
    .b (net95),
    .out (net123)
  );
  and_cell gate119 (
    .a (net1),
    .b (net92),
    .out (net124)
  );
  and_cell gate120 (
    .a (net1),
    .b (net102),
    .out (net125)
  );
  and_cell gate121 (
    .a (net80),
    .b (net95),
    .out (net126)
  );
  and_cell gate122 (
    .a (net80),
    .b (net92),
    .out (net127)
  );
  and_cell gate123 (
    .a (net80),
    .b (net102),
    .out (net128)
  );
  not_cell gate1 (
    .in (net1),
    .out (net80)
  );
  and_cell gate2 (
    .a (net2),
    .b (net1),
    .out (net16)
  );
  or_cell gate3 (
    .a (net3),
    .b (net4),
    .out (net129)
  );
  not_cell gate4 (
    .in (net129),
    .out (net63)
  );
  or_cell gate5 (
    .a (net111),
    .b (net112),
    .out (net130)
  );
  not_cell gate6 (
    .in (net130),
    .out (net122)
  );
  and_cell gate36 (
    .a (net97),
    .b (net131),
    .out (net132)
  );
  or_cell gate37 (
    .a (net99),
    .b (net132),
    .out (net94)
  );
  and_cell gate38 (
    .a (net5),
    .b (net6),
    .out (net131)
  );
  and_cell gate49 (
    .a (net97),
    .b (net98),
    .out (net96)
  );
  or_cell gate60 (
    .a (net133),
    .b (net134),
    .out (net100)
  );
  and_cell gate98 (
    .a (net105),
    .b (net135),
    .out (net133)
  );
  and_cell gate124 (
    .a (net105),
    .b (net7),
    .out (net134)
  );
  and_cell gate125 (
    .a (net103),
    .b (net8),
    .out (net135)
  );
endmodule
