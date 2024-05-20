// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/340661930553246290 */

`default_nettype none

module user_module_340661930553246290(
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;
  assign io_out[6] = net15;
  assign io_out[7] = net16;

  and_cell gate25 (
    .a (net19),
    .b (net3),
    .out (net20)
  );
  xor_cell gate42 (
    .a (net21),
    .b (net2),
    .out (net22)
  );
  or_cell gate56 (
    .a (net23),
    .b (net24),
    .out (net25)
  );
  or_cell gate57 (
    .a (net26),
    .b (net27),
    .out (net28)
  );
  or_cell gate58 (
    .a (net21),
    .b (net2),
    .out (net19)
  );
  buffer_cell gate93 (
    .in (net29),
    .out (net24)
  );
  buffer_cell gate94 (
    .in (net1),
    .out (net21)
  );
  not_cell gate112 (
    .in (net1),
    .out (net30)
  );
  not_cell gate113 (
    .in (net22),
    .out (net31)
  );
  xor_cell gate114 (
    .a (net19),
    .b (net3),
    .out (net32)
  );
  xor_cell gate115 (
    .a (net20),
    .b (net4),
    .out (net33)
  );
  and_cell gate116 (
    .a (net20),
    .b (net4),
    .out (net34)
  );
  xor_cell gate117 (
    .a (net34),
    .b (net5),
    .out (net35)
  );
  not_cell gate118 (
    .in (net35),
    .out (net36)
  );
  or_cell gate119 (
    .a (net34),
    .b (net5),
    .out (net37)
  );
  xor_cell gate120 (
    .a (net37),
    .b (net6),
    .out (net38)
  );
  and_cell gate121 (
    .a (net37),
    .b (net6),
    .out (net39)
  );
  xor_cell gate122 (
    .a (net39),
    .b (net7),
    .out (net40)
  );
  and_cell gate123 (
    .a (net39),
    .b (net7),
    .out (net41)
  );
  xor_cell gate124 (
    .a (net41),
    .b (net8),
    .out (net42)
  );
  not_cell gate125 (
    .in (net42),
    .out (net43)
  );
  xor_cell gate126 (
    .a (net30),
    .b (net43),
    .out (net44)
  );
  xor_cell gate127 (
    .a (net31),
    .b (net43),
    .out (net45)
  );
  xor_cell gate128 (
    .a (net32),
    .b (net43),
    .out (net46)
  );
  xor_cell gate129 (
    .a (net33),
    .b (net43),
    .out (net47)
  );
  xor_cell gate130 (
    .a (net36),
    .b (net43),
    .out (net48)
  );
  xor_cell gate131 (
    .a (net38),
    .b (net43),
    .out (net49)
  );
  xor_cell gate132 (
    .a (net40),
    .b (net43),
    .out (net29)
  );
  and_cell gate133 (
    .a (net49),
    .b (net50),
    .out (net23)
  );
  not_cell gate134 (
    .in (net24),
    .out (net50)
  );
  and_cell gate135 (
    .a (net48),
    .b (net51),
    .out (net52)
  );
  and_cell gate136 (
    .a (net47),
    .b (net53),
    .out (net27)
  );
  and_cell gate137 (
    .a (net46),
    .b (net54),
    .out (net55)
  );
  and_cell gate138 (
    .a (net45),
    .b (net56),
    .out (net57)
  );
  and_cell gate139 (
    .a (net44),
    .b (net58),
    .out (net26)
  );
  not_cell gate140 (
    .in (net25),
    .out (net51)
  );
  not_cell gate141 (
    .in (net59),
    .out (net54)
  );
  not_cell gate142 (
    .in (net60),
    .out (net53)
  );
  not_cell gate143 (
    .in (net61),
    .out (net56)
  );
  not_cell gate144 (
    .in (net62),
    .out (net58)
  );
  not_cell gate145 (
    .in (net63),
    .out (net64)
  );
  not_cell gate147 (
    .in (net28),
    .out (net9)
  );
  or_cell gate148 (
    .a (net52),
    .b (net23),
    .out (net65)
  );
  not_cell gate149 (
    .in (net65),
    .out (net10)
  );
  not_cell gate150 (
    .in (net57),
    .out (net11)
  );
  or_cell gate151 (
    .a (net26),
    .b (net27),
    .out (net66)
  );
  or_cell gate152 (
    .a (net66),
    .b (net24),
    .out (net67)
  );
  not_cell gate153 (
    .in (net67),
    .out (net12)
  );
  or_cell gate154 (
    .a (net64),
    .b (net57),
    .out (net68)
  );
  or_cell gate155 (
    .a (net68),
    .b (net23),
    .out (net13)
  );
  or_cell gate156 (
    .a (net64),
    .b (net27),
    .out (net69)
  );
  or_cell gate157 (
    .a (net52),
    .b (net23),
    .out (net70)
  );
  or_cell gate158 (
    .a (net69),
    .b (net70),
    .out (net14)
  );
  or_cell gate159 (
    .a (net64),
    .b (net26),
    .out (net71)
  );
  or_cell gate160 (
    .a (net71),
    .b (net24),
    .out (net72)
  );
  not_cell gate161 (
    .in (net72),
    .out (net15)
  );
  buffer_cell gate162 (
    .in (net64),
    .out (net16)
  );
  or_cell gate41 (
    .a (net52),
    .b (net25),
    .out (net60)
  );
  or_cell gate146 (
    .a (net27),
    .b (net60),
    .out (net59)
  );
  or_cell gate163 (
    .a (net55),
    .b (net59),
    .out (net61)
  );
  or_cell gate164 (
    .a (net57),
    .b (net61),
    .out (net62)
  );
  or_cell gate165 (
    .a (net26),
    .b (net62),
    .out (net63)
  );
endmodule
