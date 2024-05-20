// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341296149788885588 */

`default_nettype none

module user_module_341296149788885588(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[4];
  wire net5 = io_in[5];
  wire net6 = io_in[6];
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
  wire net92;
  wire net93;
  wire net94;
  wire net95;
  wire net96;
  wire net97 = 1'b1;
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
  xor_cell gate120 (

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
  and_cell gate7 (
    .a (net19),
    .b (net20),
    .out (net21)
  );
  and_cell gate8 (
    .a (net22),
    .b (net23),
    .out (net24)
  );
  and_cell gate12 (
    .a (net24),
    .b (net21),
    .out (net25)
  );
  and_cell gate14 (
    .a (net26),
    .b (net27),
    .out (net28)
  );
  and_cell gate15 (
    .a (net29),
    .b (net30),
    .out (net31)
  );
  and_cell gate16 (
    .a (net28),
    .b (net31),
    .out (net32)
  );
  or_cell gate3 (

  );
  not_cell gate17 (
    .in (net33),
    .out (net34)
  );
  not_cell gate9 (
    .in (net35),
    .out (net22)
  );
  not_cell gate10 (
    .in (net27),
    .out (net23)
  );
  not_cell gate11 (
    .in (net36),
    .out (net19)
  );
  not_cell gate18 (
    .in (net35),
    .out (net26)
  );
  not_cell gate19 (
    .in (net36),
    .out (net29)
  );
  not_cell gate20 (
    .in (net20),
    .out (net30)
  );
  or_cell gate13 (
    .a (net25),
    .b (net32),
    .out (net33)
  );
  not_cell gate21 (
    .in (net35),
    .out (net37)
  );
  and_cell gate22 (
    .a (net37),
    .b (net27),
    .out (net38)
  );
  and_cell gate23 (
    .a (net39),
    .b (net20),
    .out (net40)
  );
  not_cell gate24 (
    .in (net36),
    .out (net39)
  );
  not_cell gate25 (
    .in (net35),
    .out (net41)
  );
  not_cell gate26 (
    .in (net20),
    .out (net42)
  );
  and_cell gate27 (
    .a (net41),
    .b (net27),
    .out (net43)
  );
  and_cell gate28 (
    .a (net36),
    .b (net42),
    .out (net44)
  );
  and_cell gate29 (
    .a (net38),
    .b (net40),
    .out (net45)
  );
  and_cell gate30 (
    .a (net43),
    .b (net44),
    .out (net46)
  );
  or_cell gate31 (
    .a (net45),
    .b (net46),
    .out (net47)
  );
  not_cell gate32 (
    .in (net47),
    .out (net48)
  );
  not_cell gate33 (
    .in (net27),
    .out (net49)
  );
  not_cell gate34 (
    .in (net35),
    .out (net50)
  );
  not_cell gate35 (
    .in (net20),
    .out (net51)
  );
  and_cell gate36 (
    .a (net50),
    .b (net49),
    .out (net52)
  );
  and_cell gate37 (
    .a (net36),
    .b (net51),
    .out (net53)
  );
  and_cell gate38 (
    .a (net52),
    .b (net53),
    .out (net54)
  );
  not_cell gate39 (
    .in (net54),
    .out (net55)
  );
  and_cell gate40 (
    .a (net56),
    .b (net27),
    .out (net57)
  );
  and_cell gate41 (
    .a (net36),
    .b (net20),
    .out (net58)
  );
  and_cell gate46 (
    .a (net59),
    .b (net60),
    .out (net61)
  );
  and_cell gate47 (
    .a (net62),
    .b (net63),
    .out (net64)
  );
  and_cell gate48 (
    .a (net65),
    .b (net66),
    .out (net67)
  );
  and_cell gate49 (
    .a (net68),
    .b (net69),
    .out (net70)
  );
  and_cell gate50 (
    .a (net71),
    .b (net72),
    .out (net73)
  );
  and_cell gate51 (
    .a (net74),
    .b (net75),
    .out (net76)
  );
  and_cell gate52 (
    .a (net57),
    .b (net58),
    .out (net77)
  );
  and_cell gate55 (
    .a (net61),
    .b (net64),
    .out (net78)
  );
  and_cell gate56 (
    .a (net67),
    .b (net70),
    .out (net79)
  );
  and_cell gate57 (
    .a (net73),
    .b (net76),
    .out (net80)
  );
  or_cell gate58 (
    .a (net77),
    .b (net33),
    .out (net81)
  );
  or_cell gate59 (
    .a (net82),
    .b (net78),
    .out (net83)
  );
  not_cell gate61 (
    .in (net81),
    .out (net84)
  );
  not_cell gate62 (
    .in (net75),
    .out (net63)
  );
  not_cell gate63 (
    .in (net85),
    .out (net66)
  );
  not_cell gate64 (
    .in (net35),
    .out (net56)
  );
  not_cell gate65 (
    .in (net74),
    .out (net68)
  );
  not_cell gate66 (
    .in (net85),
    .out (net60)
  );
  not_cell gate67 (
    .in (net74),
    .out (net62)
  );
  not_cell gate68 (
    .in (net65),
    .out (net59)
  );
  or_cell gate53 (
    .a (net78),
    .b (net79),
    .out (net86)
  );
  or_cell gate54 (
    .a (net54),
    .b (net46),
    .out (net87)
  );
  or_cell gate60 (
    .a (net86),
    .b (net87),
    .out (net88)
  );
  not_cell gate69 (
    .in (net75),
    .out (net69)
  );
  buffer_cell gate70 (
    .in (net20),
    .out (net75)
  );
  buffer_cell gate71 (
    .in (net36),
    .out (net74)
  );
  buffer_cell gate72 (
    .in (net27),
    .out (net85)
  );
  buffer_cell gate73 (
    .in (net35),
    .out (net65)
  );
  or_cell gate74 (
    .a (net80),
    .b (net25),
    .out (net89)
  );
  or_cell gate75 (
    .a (net54),
    .b (net77),
    .out (net90)
  );
  or_cell gate76 (
    .a (net89),
    .b (net90),
    .out (net91)
  );
  not_cell gate77 (
    .in (net91),
    .out (net92)
  );
  not_cell gate78 (
    .in (net85),
    .out (net72)
  );
  not_cell gate79 (
    .in (net65),
    .out (net71)
  );
  or_cell gate80 (
    .a (net25),
    .b (net77),
    .out (net93)
  );
  or_cell gate81 (
    .a (net83),
    .b (net93),
    .out (net94)
  );
  not_cell gate82 (
    .in (net94),
    .out (net95)
  );
  and_cell gate42 (
    .a (net65),
    .b (net85),
    .out (net96)
  );
  and_cell gate43 (
    .a (net97),
    .b (net65),
    .out (net98)
  );
  and_cell gate44 (
    .a (net99),
    .b (net74),
    .out (net100)
  );
  not_cell gate45 (
    .in (net85),
    .out (net99)
  );
  or_cell gate83 (
    .a (net96),
    .b (net101),
    .out (net15)
  );
  and_cell gate84 (
    .a (net98),
    .b (net100),
    .out (net101)
  );
  not_cell gate85 (
    .in (net15),
    .out (net102)
  );
  and_cell gate86 (
    .a (net92),
    .b (net102),
    .out (net13)
  );
  and_cell gate87 (
    .a (net84),
    .b (net102),
    .out (net11)
  );
  and_cell gate88 (
    .a (net95),
    .b (net102),
    .out (net14)
  );
  and_cell gate89 (
    .a (net88),
    .b (net102),
    .out (net12)
  );
  and_cell gate90 (
    .a (net55),
    .b (net102),
    .out (net10)
  );
  and_cell gate91 (
    .a (net48),
    .b (net102),
    .out (net9)
  );
  and_cell gate92 (
    .a (net34),
    .b (net102),
    .out (net8)
  );
  buffer_cell gate93 (
    .in (net103),
    .out (net35)
  );
  buffer_cell gate94 (
    .in (net104),
    .out (net27)
  );
  buffer_cell gate95 (
    .in (net105),
    .out (net36)
  );
  buffer_cell gate96 (
    .in (net106),
    .out (net20)
  );
  mux_cell mux2 (
    .a (net4),
    .b (net107),
    .sel (net2),
    .out (net103)
  );
  mux_cell mux3 (
    .a (net5),
    .b (net108),
    .sel (net2),
    .out (net104)
  );
  mux_cell mux4 (
    .a (net6),
    .b (net109),
    .sel (net2),
    .out (net105)
  );
  mux_cell mux5 (
    .a (net7),
    .b (net110),
    .sel (net2),
    .out (net106)
  );
  dff_cell flipflop2 (
    .d (net111),
    .clk (net1),
    .q (net112),
    .notq (net111)
  );
  dff_cell flipflop3 (
    .d (net113),
    .clk (net112),
    .q (net114),
    .notq (net113)
  );
  dff_cell flipflop4 (
    .d (net115),
    .clk (net114),
    .q (net116),
    .notq (net115)
  );
  dff_cell flipflop5 (
    .d (net117),
    .clk (net116),
    .q (net118),
    .notq (net117)
  );
  dff_cell flipflop6 (
    .d (net119),
    .clk (net118),
    .q (net120),
    .notq (net119)
  );
  dff_cell flipflop7 (
    .d (net121),
    .clk (net122),
    .q (net123),
    .notq (net121)
  );
  dff_cell flipflop8 (
    .d (net124),
    .clk (net120),
    .q (net125),
    .notq (net124)
  );
  dff_cell flipflop9 (
    .d (net126),
    .clk (net125),
    .q (net127),
    .notq (net126)
  );
  dff_cell flipflop10 (
    .d (net128),
    .clk (net127),
    .q (net122),
    .notq (net128)
  );
  dff_cell flipflop11 (
    .d (net129),
    .clk (net123),
    .q (net130),
    .notq (net129)
  );
  dff_cell flipflop12 (
    .d (net131),
    .clk (net130),
    .q (net132),
    .notq (net131)
  );
  dff_cell flipflop13 (
    .d (net133),
    .clk (net132),
    .q (net134),
    .notq (net133)
  );
  dff_cell flipflop14 (
    .d (net135),
    .clk (net136),
    .q (net107),
    .notq (net137)
  );
  dff_cell flipflop15 (
    .d (net138),
    .clk (net136),
    .q (net108),
    .notq (net139)
  );
  dff_cell flipflop16 (
    .d (net140),
    .clk (net136),
    .q (net109),
    .notq (net141)
  );
  dff_cell flipflop17 (
    .d (net142),
    .clk (net136),
    .q (net110),
    .notq (net142)
  );
  and_cell gate97 (
    .a (net108),
    .b (net142),
    .out (net143)
  );
  and_cell gate98 (
    .a (net108),
    .b (net141),
    .out (net144)
  );
  and_cell gate99 (
    .a (net139),
    .b (net145),
    .out (net146)
  );
  xor_cell gate103 (
    .a (net109),
    .b (net110),
    .out (net140)
  );
  or_cell gate100 (
    .a (net143),
    .b (net144),
    .out (net147)
  );
  or_cell gate101 (
    .a (net147),
    .b (net146),
    .out (net138)
  );
  and_cell gate102 (
    .a (net109),
    .b (net110),
    .out (net145)
  );
  and_cell gate104 (
    .a (net107),
    .b (net142),
    .out (net148)
  );
  and_cell gate105 (
    .a (net107),
    .b (net141),
    .out (net149)
  );
  and_cell gate106 (
    .a (net107),
    .b (net139),
    .out (net150)
  );
  and_cell gate107 (
    .a (net151),
    .b (net152),
    .out (net153)
  );
  and_cell gate108 (
    .a (net110),
    .b (net109),
    .out (net151)
  );
  and_cell gate109 (
    .a (net108),
    .b (net137),
    .out (net152)
  );
  or_cell gate110 (
    .a (net148),
    .b (net149),
    .out (net154)
  );
  or_cell gate111 (
    .a (net154),
    .b (net155),
    .out (net135)
  );
  or_cell gate112 (
    .a (net150),
    .b (net153),
    .out (net155)
  );
  mux_cell mux6 (
    .a (net1),
    .b (net134),
    .sel (net3),
    .out (net136)
  );
endmodule
