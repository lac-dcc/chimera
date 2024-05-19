// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341399568412312147 */

`default_nettype none

module user_module_341399568412312147(
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
  wire net16 = 1'b1;
  wire net17;
  wire net18 = 1'b0;
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;
  assign io_out[6] = net15;

  xor_cell gate3 (
    .a (net2),
    .b (net3),
    .out (net17)
  );
  xor_cell gate5 (
    .a (net1),
    .b (net2),
    .out (net19)
  );
  xor_cell gate7 (
    .a (net19),
    .b (net4),
    .out (net20)
  );
  xor_cell gate8 (
    .a (net1),
    .b (net3),
    .out (net21)
  );
  xor_cell gate9 (
    .a (net21),
    .b (net4),
    .out (net22)
  );
  xor_cell gate11 (
    .a (net17),
    .b (net4),
    .out (net23)
  );
  xor_cell gate14 (
    .a (net1),
    .b (net24),
    .out (net25)
  );
  not_cell gate4 (
    .in (net5),
    .out (net26)
  );
  not_cell gate10 (
    .in (net6),
    .out (net27)
  );
  not_cell gate12 (
    .in (net7),
    .out (net28)
  );
  and_cell gate13 (
    .a (net26),
    .b (net27),
    .out (net29)
  );
  and_cell gate15 (
    .a (net29),
    .b (net7),
    .out (net24)
  );
  and_cell gate16 (
    .a (net26),
    .b (net6),
    .out (net30)
  );
  and_cell gate17 (
    .a (net30),
    .b (net28),
    .out (net31)
  );
  xor_cell gate18 (
    .a (net2),
    .b (net31),
    .out (net32)
  );
  and_cell gate19 (
    .a (net26),
    .b (net6),
    .out (net33)
  );
  and_cell gate20 (
    .a (net33),
    .b (net7),
    .out (net34)
  );
  xor_cell gate21 (
    .a (net3),
    .b (net34),
    .out (net35)
  );
  and_cell gate22 (
    .a (net5),
    .b (net27),
    .out (net36)
  );
  and_cell gate23 (
    .a (net36),
    .b (net28),
    .out (net37)
  );
  xor_cell gate24 (
    .a (net4),
    .b (net37),
    .out (net38)
  );
  and_cell gate25 (
    .a (net5),
    .b (net27),
    .out (net39)
  );
  and_cell gate26 (
    .a (net39),
    .b (net7),
    .out (net40)
  );
  xor_cell gate27 (
    .a (net20),
    .b (net40),
    .out (net41)
  );
  xor_cell gate28 (
    .a (net22),
    .b (net42),
    .out (net43)
  );
  xor_cell gate29 (
    .a (net23),
    .b (net44),
    .out (net45)
  );
  and_cell gate30 (
    .a (net5),
    .b (net6),
    .out (net46)
  );
  and_cell gate31 (
    .a (net46),
    .b (net28),
    .out (net42)
  );
  and_cell gate32 (
    .a (net5),
    .b (net6),
    .out (net47)
  );
  and_cell gate33 (
    .a (net47),
    .b (net7),
    .out (net44)
  );
  xor_cell gate34 (
    .a (net32),
    .b (net35),
    .out (net48)
  );
  xor_cell gate35 (
    .a (net25),
    .b (net32),
    .out (net49)
  );
  xor_cell gate36 (
    .a (net49),
    .b (net38),
    .out (net50)
  );
  xor_cell gate37 (
    .a (net25),
    .b (net35),
    .out (net51)
  );
  xor_cell gate38 (
    .a (net51),
    .b (net38),
    .out (net52)
  );
  xor_cell gate39 (
    .a (net48),
    .b (net38),
    .out (net53)
  );
  xor_cell gate40 (
    .a (net50),
    .b (net41),
    .out (net54)
  );
  xor_cell gate41 (
    .a (net52),
    .b (net43),
    .out (net55)
  );
  xor_cell gate42 (
    .a (net53),
    .b (net45),
    .out (net56)
  );
  and_cell gate47 (
    .a (net54),
    .b (net55),
    .out (net57)
  );
  and_cell gate48 (
    .a (net57),
    .b (net58),
    .out (net59)
  );
  and_cell gate49 (
    .a (net54),
    .b (net60),
    .out (net61)
  );
  and_cell gate50 (
    .a (net61),
    .b (net56),
    .out (net62)
  );
  and_cell gate52 (
    .a (net63),
    .b (net55),
    .out (net64)
  );
  and_cell gate53 (
    .a (net64),
    .b (net56),
    .out (net65)
  );
  and_cell gate55 (
    .a (net54),
    .b (net55),
    .out (net66)
  );
  and_cell gate56 (
    .a (net66),
    .b (net56),
    .out (net67)
  );
  and_cell gate58 (
    .a (net54),
    .b (net60),
    .out (net68)
  );
  and_cell gate59 (
    .a (net68),
    .b (net58),
    .out (net69)
  );
  and_cell gate63 (
    .a (net63),
    .b (net55),
    .out (net70)
  );
  and_cell gate64 (
    .a (net70),
    .b (net58),
    .out (net71)
  );
  and_cell gate65 (
    .a (net63),
    .b (net60),
    .out (net72)
  );
  and_cell gate66 (
    .a (net72),
    .b (net56),
    .out (net73)
  );
  not_cell gate43 (
    .in (net54),
    .out (net63)
  );
  not_cell gate44 (
    .in (net55),
    .out (net60)
  );
  not_cell gate45 (
    .in (net56),
    .out (net58)
  );
  and_cell gate46 (
    .a (net59),
    .b (net8),
    .out (net74)
  );
  and_cell gate51 (
    .a (net62),
    .b (net8),
    .out (net75)
  );
  and_cell gate54 (
    .a (net65),
    .b (net8),
    .out (net76)
  );
  and_cell gate57 (
    .a (net67),
    .b (net8),
    .out (net77)
  );
  and_cell gate60 (
    .a (net69),
    .b (net8),
    .out (net78)
  );
  and_cell gate61 (
    .a (net71),
    .b (net8),
    .out (net79)
  );
  and_cell gate62 (
    .a (net73),
    .b (net8),
    .out (net80)
  );
  xor_cell gate67 (
    .a (net74),
    .b (net25),
    .out (net9)
  );
  xor_cell gate68 (
    .a (net75),
    .b (net32),
    .out (net10)
  );
  xor_cell gate69 (
    .a (net76),
    .b (net35),
    .out (net11)
  );
  xor_cell gate70 (
    .a (net77),
    .b (net38),
    .out (net12)
  );
  xor_cell gate71 (
    .a (net78),
    .b (net41),
    .out (net13)
  );
  xor_cell gate72 (
    .a (net79),
    .b (net43),
    .out (net14)
  );
  xor_cell gate73 (
    .a (net80),
    .b (net45),
    .out (net15)
  );
endmodule
