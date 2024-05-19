// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341382703379120723 */

`default_nettype none

module user_module_341382703379120723(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
  wire net5 = io_in[4];
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
  wire net34 = 1'b1;
  wire net35 = 1'b1;
  wire net36 = 1'b1;
  wire net37 = 1'b1;
  wire net38 = 1'b1;
  wire net39 = 1'b1;
  wire net40 = 1'b1;
  wire net41 = 1'b1;
  wire net42;
  wire net43;
  wire net44;
  wire net45;
  wire net46;
  wire net47;
  wire net48;
  wire net49;
  wire net50;
  wire net51 = 1'b1;
  wire net52 = 1'b1;
  wire net53 = 1'b1;
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
  wire net117 = 1'b1;
  wire net118;

  assign io_out[0] = net6;
  assign io_out[1] = net7;
  assign io_out[2] = net8;
  assign io_out[3] = net9;
  assign io_out[4] = net10;
  assign io_out[5] = net11;
  assign io_out[6] = net12;
  assign io_out[7] = net13;

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
    .d (net17),
    .clk (net18),
    .q (net6),
    .notq (net19)
  );
  dff_cell flipflop2 (
    .d (net20),
    .clk (net18),
    .q (net7),
    .notq (net21)
  );
  dff_cell flipflop3 (
    .d (net22),
    .clk (net18),
    .q (net8),
    .notq (net23)
  );
  dff_cell flipflop4 (
    .d (net24),
    .clk (net18),
    .q (net9),
    .notq (net25)
  );
  dff_cell flipflop5 (
    .d (net26),
    .clk (net18),
    .q (net10),
    .notq (net27)
  );
  dff_cell flipflop6 (
    .d (net28),
    .clk (net18),
    .q (net11),
    .notq (net29)
  );
  dff_cell flipflop7 (
    .d (net30),
    .clk (net18),
    .q (net12),
    .notq (net31)
  );
  dff_cell flipflop8 (
    .d (net32),
    .clk (net18),
    .q (net13),
    .notq (net33)
  );
  dff_cell flipflop9 (

  );
  dff_cell flipflop10 (
    .d (net42),
    .clk (net1),
    .q (net43),
    .notq (net44)
  );
  dff_cell flipflop11 (
    .d (net45),
    .clk (net1),
    .q (net46),
    .notq (net47)
  );
  dff_cell flipflop12 (
    .d (net48),
    .clk (net1),
    .q (net49),
    .notq (net50)
  );
  xor_cell gate7 (
    .a (net43),
    .b (net2),
    .out (net54)
  );
  xor_cell gate8 (
    .a (net46),
    .b (net55),
    .out (net56)
  );
  xor_cell gate9 (
    .a (net49),
    .b (net57),
    .out (net58)
  );
  and_cell gate10 (
    .a (net43),
    .b (net2),
    .out (net55)
  );
  and_cell gate11 (
    .a (net46),
    .b (net55),
    .out (net57)
  );
  and_cell gate16 (

  );
  dff_cell flipflop14 (
    .d (net59),
    .clk (net1),
    .q (net60)
  );
  dff_cell flipflop15 (
    .d (net60),
    .clk (net1),
    .q (net61)
  );
  dff_cell flipflop16 (
    .d (net61),
    .clk (net1),
    .q (net62)
  );
  dff_cell flipflop17 (
    .d (net62),
    .clk (net1),
    .q (net63)
  );
  dff_cell flipflop18 (
    .d (net63),
    .clk (net1),
    .q (net64)
  );
  dff_cell flipflop19 (
    .d (net64),
    .clk (net1),
    .q (net65)
  );
  dff_cell flipflop20 (
    .d (net65),
    .clk (net1),
    .q (net66)
  );
  dff_cell flipflop21 (
    .d (net66),
    .clk (net1),
    .q (net67)
  );
  dff_cell flipflop22 (
    .d (net67),
    .clk (net1),
    .q (net68)
  );
  dff_cell flipflop23 (
    .d (net68),
    .clk (net1),
    .q (net69)
  );
  dff_cell flipflop24 (
    .d (net69),
    .clk (net1),
    .q (net70)
  );
  dff_cell flipflop25 (
    .d (net70),
    .clk (net1),
    .q (net71)
  );
  dff_cell flipflop26 (
    .d (net71),
    .clk (net1),
    .q (net72)
  );
  dff_cell flipflop27 (
    .d (net72),
    .clk (net1),
    .q (net73)
  );
  dff_cell flipflop28 (
    .d (net73),
    .clk (net1),
    .q (net74)
  );
  dff_cell flipflop29 (
    .d (net74),
    .clk (net1),
    .q (net75)
  );
  dff_cell flipflop30 (
    .d (net75),
    .clk (net1),
    .q (net76)
  );
  dff_cell flipflop31 (
    .d (net76),
    .clk (net1),
    .q (net77)
  );
  dff_cell flipflop32 (
    .d (net77),
    .clk (net1),
    .q (net78)
  );
  dff_cell flipflop33 (
    .d (net78),
    .clk (net1),
    .q (net79)
  );
  dff_cell flipflop34 (
    .d (net79),
    .clk (net1),
    .q (net80)
  );
  dff_cell flipflop35 (
    .d (net80),
    .clk (net1),
    .q (net81)
  );
  dff_cell flipflop36 (
    .d (net81),
    .clk (net1),
    .q (net82)
  );
  dff_cell flipflop37 (
    .d (net82),
    .clk (net1),
    .q (net83)
  );
  dff_cell flipflop38 (
    .d (net83),
    .clk (net1),
    .q (net84)
  );
  dff_cell flipflop39 (
    .d (net84),
    .clk (net1),
    .q (net85)
  );
  dff_cell flipflop40 (
    .d (net85),
    .clk (net1),
    .q (net86)
  );
  dff_cell flipflop41 (
    .d (net86),
    .clk (net1),
    .q (net87)
  );
  dff_cell flipflop42 (
    .d (net87),
    .clk (net1),
    .q (net88)
  );
  dff_cell flipflop43 (
    .d (net88),
    .clk (net1),
    .q (net89)
  );
  dff_cell flipflop44 (
    .d (net89),
    .clk (net1),
    .q (net90)
  );
  dff_cell flipflop45 (
    .d (net90),
    .clk (net1),
    .q (net91)
  );
  dff_cell flipflop46 (
    .d (net91),
    .clk (net1),
    .q (net92)
  );
  dff_cell flipflop47 (
    .d (net92),
    .clk (net1),
    .q (net93)
  );
  dff_cell flipflop48 (
    .d (net93),
    .clk (net1),
    .q (net94)
  );
  dff_cell flipflop49 (
    .d (net94),
    .clk (net1),
    .q (net95)
  );
  dff_cell flipflop50 (
    .d (net95),
    .clk (net1),
    .q (net96)
  );
  dff_cell flipflop51 (
    .d (net96),
    .clk (net1),
    .q (net97)
  );
  dff_cell flipflop52 (
    .d (net97),
    .clk (net1),
    .q (net98)
  );
  dff_cell flipflop53 (
    .d (net98),
    .clk (net1),
    .q (net99)
  );
  dff_cell flipflop54 (
    .d (net99),
    .clk (net1),
    .q (net100)
  );
  dff_cell flipflop55 (
    .d (net100),
    .clk (net1),
    .q (net101)
  );
  dff_cell flipflop56 (
    .d (net101),
    .clk (net1),
    .q (net102)
  );
  dff_cell flipflop57 (
    .d (net102),
    .clk (net1),
    .q (net103)
  );
  dff_cell flipflop58 (
    .d (net103),
    .clk (net1),
    .q (net104)
  );
  dff_cell flipflop59 (
    .d (net104),
    .clk (net1),
    .q (net105)
  );
  dff_cell flipflop60 (
    .d (net105),
    .clk (net1),
    .q (net106)
  );
  dff_cell flipflop61 (
    .d (net106),
    .clk (net1),
    .q (net107)
  );
  dff_cell flipflop62 (
    .d (net107),
    .clk (net1),
    .q (net108)
  );
  dff_cell flipflop63 (
    .d (net108),
    .clk (net1),
    .q (net109)
  );
  dff_cell flipflop64 (
    .d (net109),
    .clk (net1),
    .q (net110)
  );
  dff_cell flipflop65 (
    .d (net110),
    .clk (net1),
    .q (net111)
  );
  dff_cell flipflop66 (
    .d (net111),
    .clk (net1),
    .q (net112)
  );
  dff_cell flipflop67 (
    .d (net112),
    .clk (net1),
    .q (net113)
  );
  dff_cell flipflop68 (
    .d (net113),
    .clk (net1),
    .q (net114)
  );
  dff_cell flipflop69 (
    .d (net114),
    .clk (net1),
    .q (net115)
  );
  dff_cell flipflop70 (
    .d (net115),
    .clk (net1),
    .q (net17)
  );
  dff_cell flipflop71 (
    .d (net17),
    .clk (net1),
    .q (net20)
  );
  dff_cell flipflop72 (
    .d (net20),
    .clk (net1),
    .q (net22)
  );
  dff_cell flipflop73 (
    .d (net22),
    .clk (net1),
    .q (net24)
  );
  dff_cell flipflop74 (
    .d (net24),
    .clk (net1),
    .q (net26)
  );
  dff_cell flipflop75 (
    .d (net26),
    .clk (net1),
    .q (net28)
  );
  dff_cell flipflop76 (
    .d (net28),
    .clk (net1),
    .q (net30)
  );
  dff_cell flipflop77 (
    .d (net30),
    .clk (net1),
    .q (net32)
  );
  and_cell gate1 (
    .a (net44),
    .b (net47),
    .out (net116)
  );
  and_cell gate14 (
    .a (net50),
    .b (net117),
    .out (net118)
  );
  and_cell gate15 (
    .a (net116),
    .b (net118),
    .out (net18)
  );
  mux_cell mux2 (
    .a (net3),
    .b (net32),
    .sel (net4),
    .out (net59)
  );
  and_cell gate12 (
    .a (net54),
    .b (net5),
    .out (net42)
  );
  and_cell gate13 (
    .a (net56),
    .b (net5),
    .out (net45)
  );
  and_cell gate17 (
    .a (net58),
    .b (net5),
    .out (net48)
  );
endmodule
