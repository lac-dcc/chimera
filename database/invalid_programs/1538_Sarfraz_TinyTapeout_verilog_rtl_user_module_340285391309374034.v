// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/340285391309374034 */

`default_nettype none

module user_module_340285391309374034(
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
  wire net16 = 1'b0;
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
  wire net30 = 1'b0;
  wire net31;
  wire net32;
  wire net33 = 1'b0;
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
  wire net55 = 1'b0;
  wire net56;
  wire net57;
  wire net58;
  wire net59;
  wire net60;
  wire net61 = 1'b0;
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;
  assign io_out[6] = net15;

  and_cell gate7 (
    .a (net3),
    .b (net2),
    .out (net18)
  );
  and_cell gate9 (
    .a (net19),
    .b (net1),
    .out (net20)
  );
  or_cell gate11 (
    .a (net18),
    .b (net20),
    .out (net21)
  );
  xor_cell gate8 (
    .a (net2),
    .b (net3),
    .out (net19)
  );
  xor_cell gate10 (
    .a (net19),
    .b (net1),
    .out (net22)
  );
  and_cell gate12 (
    .a (net4),
    .b (net5),
    .out (net23)
  );
  and_cell gate13 (
    .a (net24),
    .b (net6),
    .out (net25)
  );
  or_cell gate14 (
    .a (net23),
    .b (net25),
    .out (net26)
  );
  xor_cell gate15 (
    .a (net4),
    .b (net5),
    .out (net24)
  );
  xor_cell gate16 (
    .a (net24),
    .b (net6),
    .out (net27)
  );
  and_cell gate17 (
    .a (net7),
    .b (net8),
    .out (net28)
  );
  and_cell gate18 (
    .a (net29),
    .b (net30),
    .out (net31)
  );
  or_cell gate19 (
    .a (net28),
    .b (net31),
    .out (net32)
  );
  xor_cell gate20 (
    .a (net7),
    .b (net8),
    .out (net29)
  );
  xor_cell gate21 (
    .a (net29),
    .b (net33),
    .out (net34)
  );
  and_cell gate22 (
    .a (net22),
    .b (net27),
    .out (net35)
  );
  and_cell gate23 (
    .a (net36),
    .out (net37)
  );
  or_cell gate24 (
    .a (net35),
    .b (net37),
    .out (net38)
  );
  xor_cell gate25 (
    .a (net22),
    .b (net27),
    .out (net36)
  );
  xor_cell gate26 (
    .a (net36),
    .out (net39)
  );
  and_cell gate27 (
    .a (net21),
    .b (net26),
    .out (net40)
  );
  and_cell gate28 (
    .a (net41),
    .b (net38),
    .out (net42)
  );
  or_cell gate29 (
    .a (net40),
    .b (net42),
    .out (net43)
  );
  xor_cell gate30 (
    .a (net21),
    .b (net26),
    .out (net41)
  );
  xor_cell gate31 (
    .a (net41),
    .b (net38),
    .out (net44)
  );
  and_cell gate32 (
    .a (net39),
    .b (net34),
    .out (net45)
  );
  and_cell gate33 (
    .a (net46),
    .out (net47)
  );
  or_cell gate34 (
    .a (net45),
    .b (net47),
    .out (net48)
  );
  xor_cell gate35 (
    .a (net39),
    .b (net34),
    .out (net46)
  );
  xor_cell gate36 (
    .a (net46),
    .out (net49)
  );
  and_cell gate37 (
    .a (net44),
    .b (net32),
    .out (net50)
  );
  and_cell gate38 (
    .a (net51),
    .b (net48),
    .out (net52)
  );
  or_cell gate39 (
    .a (net50),
    .b (net52),
    .out (net53)
  );
  xor_cell gate40 (
    .a (net44),
    .b (net32),
    .out (net51)
  );
  xor_cell gate41 (
    .a (net51),
    .b (net48),
    .out (net54)
  );
  and_cell gate42 (
    .a (net43),
    .b (net55),
    .out (net56)
  );
  and_cell gate43 (
    .a (net57),
    .b (net53),
    .out (net58)
  );
  or_cell gate44 (
    .a (net56),
    .b (net58),
    .out (net59)
  );
  xor_cell gate45 (
    .a (net43),
    .b (net55),
    .out (net57)
  );
  xor_cell gate46 (
    .a (net57),
    .b (net53),
    .out (net60)
  );
  not_cell gate107 (
    .in (net49),
    .out (net62)
  );
  buffer_cell gate108 (
    .in (net49),
    .out (net63)
  );
  not_cell gate109 (
    .in (net54),
    .out (net64)
  );
  buffer_cell gate1010 (
    .in (net54),
    .out (net65)
  );
  not_cell gate1011 (
    .in (net60),
    .out (net66)
  );
  buffer_cell gate1012 (
    .in (net60),
    .out (net67)
  );
  not_cell gate1013 (
    .in (net59)
  );
  buffer_cell gate1014 (
    .in (net59),
    .out (net68)
  );
  and_cell gate1015 (
    .a (net66),
    .b (net62),
    .out (net69)
  );
  and_cell gate1016 (
    .a (net65),
    .b (net62),
    .out (net70)
  );
  or_cell gate1017 (
    .a (net69),
    .b (net70),
    .out (net13)
  );
  or_cell gate1018 (
    .a (net69),
    .b (net65),
    .out (net71)
  );
  or_cell gate1019 (
    .a (net68),
    .b (net72),
    .out (net73)
  );
  or_cell gate1020 (
    .a (net71),
    .b (net73),
    .out (net9)
  );
  and_cell gate1021 (
    .a (net67),
    .b (net63),
    .out (net72)
  );
  or_cell gate1022 (
    .a (net74),
    .b (net75),
    .out (net10)
  );
  or_cell gate1023 (
    .a (net66),
    .b (net76),
    .out (net75)
  );
  and_cell gate1024 (
    .a (net65),
    .b (net63),
    .out (net76)
  );
  and_cell gate1025 (
    .a (net64),
    .b (net62),
    .out (net74)
  );
  or_cell gate1026 (
    .a (net64),
    .b (net77),
    .out (net11)
  );
  or_cell gate1027 (
    .a (net67),
    .b (net63),
    .out (net77)
  );
  or_cell gate1028 (
    .a (net69),
    .b (net78),
    .out (net79)
  );
  and_cell gate1029 (
    .a (net66),
    .b (net65),
    .out (net78)
  );
  or_cell gate1030 (
    .a (net68),
    .b (net80),
    .out (net81)
  );
  or_cell gate1031 (
    .a (net82),
    .b (net83),
    .out (net80)
  );
  or_cell gate1032 (
    .a (net79),
    .b (net81),
    .out (net12)
  );
  and_cell gate1033 (
    .a (net67),
    .b (net84),
    .out (net83)
  );
  and_cell gate1034 (
    .a (net65),
    .b (net62),
    .out (net82)
  );
  and_cell gate1035 (
    .a (net64),
    .b (net63),
    .out (net84)
  );
  or_cell gate1036 (
    .a (net85),
    .b (net86),
    .out (net14)
  );
  or_cell gate1037 (
    .a (net87),
    .b (net88),
    .out (net85)
  );
  or_cell gate1038 (
    .a (net68),
    .b (net89),
    .out (net86)
  );
  and_cell gate1039 (
    .a (net64),
    .b (net62),
    .out (net87)
  );
  and_cell gate1040 (
    .a (net67),
    .b (net64),
    .out (net88)
  );
  and_cell gate1041 (
    .a (net67),
    .b (net62),
    .out (net89)
  );
  or_cell gate1042 (
    .a (net90),
    .b (net91),
    .out (net15)
  );
  or_cell gate1043 (
    .a (net92),
    .b (net93),
    .out (net90)
  );
  or_cell gate1044 (
    .a (net68),
    .b (net94),
    .out (net91)
  );
  and_cell gate1045 (
    .a (net66),
    .b (net65),
    .out (net92)
  );
  and_cell gate1046 (
    .a (net67),
    .b (net64),
    .out (net93)
  );
  and_cell gate1047 (
    .a (net67),
    .b (net62),
    .out (net94)
  );
endmodule
