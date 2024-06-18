// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341546888233747026 */

`default_nettype none

module user_module_341546888233747026(
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
  wire net17 = 1'b1;
  wire net18 = 1'b1;
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;
  assign io_out[6] = net15;
  assign io_out[7] = net16;

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
  mux_cell mux4 (

  );
  not_cell gate17 (
    .in (net20),
    .out (net21)
  );
  buffer_cell gate18 (
    .in (net20),
    .out (net22)
  );
  not_cell gate19 (
    .in (net23),
    .out (net24)
  );
  buffer_cell gate20 (
    .in (net23),
    .out (net25)
  );
  not_cell gate21 (
    .in (net26),
    .out (net27)
  );
  buffer_cell gate22 (
    .in (net26),
    .out (net28)
  );
  not_cell gate23 (
    .in (net29)
  );
  buffer_cell gate24 (
    .in (net29),
    .out (net30)
  );
  and_cell gate25 (
    .a (net27),
    .b (net21),
    .out (net31)
  );
  and_cell gate26 (
    .a (net25),
    .b (net21),
    .out (net32)
  );
  or_cell gate27 (
    .a (net31),
    .b (net32),
    .out (net13)
  );
  or_cell gate28 (
    .a (net31),
    .b (net25),
    .out (net33)
  );
  or_cell gate29 (
    .a (net30),
    .b (net34),
    .out (net35)
  );
  or_cell gate30 (
    .a (net33),
    .b (net35),
    .out (net9)
  );
  and_cell gate31 (
    .a (net28),
    .b (net22),
    .out (net34)
  );
  or_cell gate32 (
    .a (net36),
    .b (net37),
    .out (net10)
  );
  or_cell gate33 (
    .a (net27),
    .b (net38),
    .out (net37)
  );
  and_cell gate34 (
    .a (net25),
    .b (net22),
    .out (net38)
  );
  and_cell gate35 (
    .a (net24),
    .b (net21),
    .out (net36)
  );
  or_cell gate36 (
    .a (net24),
    .b (net39),
    .out (net11)
  );
  or_cell gate37 (
    .a (net28),
    .b (net22),
    .out (net39)
  );
  or_cell gate38 (
    .a (net31),
    .b (net40),
    .out (net41)
  );
  and_cell gate39 (
    .a (net27),
    .b (net25),
    .out (net40)
  );
  or_cell gate40 (
    .a (net30),
    .b (net42),
    .out (net43)
  );
  or_cell gate41 (
    .a (net44),
    .b (net45),
    .out (net42)
  );
  or_cell gate42 (
    .a (net41),
    .b (net43),
    .out (net12)
  );
  and_cell gate43 (
    .a (net28),
    .b (net46),
    .out (net45)
  );
  and_cell gate44 (
    .a (net25),
    .b (net21),
    .out (net44)
  );
  and_cell gate45 (
    .a (net24),
    .b (net22),
    .out (net46)
  );
  or_cell gate46 (
    .a (net47),
    .b (net48),
    .out (net14)
  );
  or_cell gate47 (
    .a (net49),
    .b (net50),
    .out (net47)
  );
  or_cell gate48 (
    .a (net30),
    .b (net51),
    .out (net48)
  );
  and_cell gate49 (
    .a (net24),
    .b (net21),
    .out (net49)
  );
  and_cell gate50 (
    .a (net28),
    .b (net24),
    .out (net50)
  );
  and_cell gate51 (
    .a (net28),
    .b (net21),
    .out (net51)
  );
  or_cell gate52 (
    .a (net52),
    .b (net53),
    .out (net15)
  );
  or_cell gate53 (
    .a (net54),
    .b (net55),
    .out (net52)
  );
  or_cell gate54 (
    .a (net30),
    .b (net56),
    .out (net53)
  );
  and_cell gate55 (
    .a (net27),
    .b (net25),
    .out (net54)
  );
  and_cell gate56 (
    .a (net28),
    .b (net24),
    .out (net55)
  );
  and_cell gate57 (
    .a (net28),
    .b (net21),
    .out (net56)
  );
  and_cell gate58 (

  );
  xor_cell gate1 (
    .a (net57),
    .b (net58),
    .out (net59)
  );
  xor_cell gate7 (
    .a (net59),
    .b (net60),
    .out (net20)
  );
  or_cell gate10 (
    .a (net61),
    .b (net62),
    .out (net63)
  );
  and_cell gate11 (
    .a (net60),
    .b (net59),
    .out (net61)
  );
  and_cell gate12 (
    .a (net58),
    .b (net57),
    .out (net62)
  );
  buffer_cell gate8 (
    .in (net1),
    .out (net57)
  );
  buffer_cell gate9 (
    .in (net64),
    .out (net60)
  );
  buffer_cell gate13 (
    .in (net5),
    .out (net58)
  );
  xor_cell gate14 (
    .a (net65),
    .b (net66),
    .out (net67)
  );
  xor_cell gate15 (
    .a (net67),
    .b (net68),
    .out (net23)
  );
  or_cell gate16 (
    .a (net69),
    .b (net70),
    .out (net71)
  );
  and_cell gate59 (
    .a (net68),
    .b (net67),
    .out (net69)
  );
  and_cell gate60 (
    .a (net66),
    .b (net65),
    .out (net70)
  );
  buffer_cell gate61 (
    .in (net2),
    .out (net65)
  );
  buffer_cell gate62 (
    .in (net63),
    .out (net68)
  );
  buffer_cell gate63 (
    .in (net6),
    .out (net66)
  );
  xor_cell gate64 (
    .a (net72),
    .b (net73),
    .out (net74)
  );
  xor_cell gate65 (
    .a (net74),
    .b (net75),
    .out (net26)
  );
  or_cell gate66 (
    .a (net76),
    .b (net77),
    .out (net78)
  );
  and_cell gate67 (
    .a (net75),
    .b (net74),
    .out (net76)
  );
  and_cell gate68 (
    .a (net73),
    .b (net72),
    .out (net77)
  );
  buffer_cell gate69 (
    .in (net3),
    .out (net72)
  );
  buffer_cell gate70 (
    .in (net71),
    .out (net75)
  );
  buffer_cell gate71 (
    .in (net7),
    .out (net73)
  );
  xor_cell gate72 (
    .a (net79),
    .b (net80),
    .out (net81)
  );
  xor_cell gate73 (
    .a (net81),
    .b (net82),
    .out (net29)
  );
  or_cell gate74 (
    .a (net83),
    .b (net84),
    .out (net16)
  );
  and_cell gate75 (
    .a (net82),
    .b (net81),
    .out (net83)
  );
  and_cell gate76 (
    .a (net80),
    .b (net79),
    .out (net84)
  );
  buffer_cell gate77 (
    .in (net4),
    .out (net79)
  );
  buffer_cell gate78 (
    .in (net78),
    .out (net82)
  );
  buffer_cell gate79 (
    .in (net8),
    .out (net80)
  );
endmodule
