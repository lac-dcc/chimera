// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341410909669818963 */

`default_nettype none

module user_module_341410909669818963(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9 = 1'b0;
  wire net10 = 1'b1;
  wire net11 = 1'b1;
  wire net12 = 1'b0;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
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

  assign io_out[0] = net4;
  assign io_out[1] = net5;
  assign io_out[2] = net6;
  assign io_out[3] = net7;
  assign io_out[4] = net5;
  assign io_out[5] = net8;

  not_cell NOT0 (
    .in (net13),
    .out (net14)
  );
  not_cell NOT1 (
    .in (net2),
    .out (net15)
  );
  not_cell NOT2 (
    .in (net16),
    .out (net17)
  );
  not_cell NOT3 (
    .in (net18),
    .out (net19)
  );
  not_cell NOT4 (
    .in (net20),
    .out (net21)
  );
  not_cell NOT5 (
    .in (net22),
    .out (net23)
  );
  not_cell NOT6 (
    .in (net24),
    .out (net25)
  );
  not_cell NOT7 (
    .in (net1),
    .out (net26)
  );
  not_cell NOT8 (
    .in (net3),
    .out (net27)
  );
  and_cell AND0 (
    .a (net23),
    .b (net25),
    .out (net28)
  );
  or_cell OR0 (
    .a (net22),
    .b (net24),
    .out (net29)
  );
  and_cell AND1 (
    .a (net20),
    .b (net28),
    .out (net30)
  );
  or_cell OR1 (
    .a (net21),
    .b (net29),
    .out (net31)
  );
  mux_cell MUX0 (
    .a (net14),
    .b (net32),
    .sel (net31),
    .out (net33)
  );
  or_cell OR2 (
    .a (net2),
    .b (net3),
    .out (net34)
  );
  not_cell NOT9 (
    .in (net34),
    .out (net35)
  );
  and_cell AND2 (
    .a (net33),
    .b (net35),
    .out (net36)
  );
  nand_cell NAND0 (
    .a (net15),
    .b (net31),
    .out (net37)
  );
  not_cell NOT10 (
    .in (net37),
    .out (net38)
  );
  or_cell OR3 (
    .a (net24),
    .b (net37),
    .out (net39)
  );
  not_cell NOT11 (
    .in (net39),
    .out (net40)
  );
  nand_cell NAND1 (
    .a (net22),
    .b (net24),
    .out (net41)
  );
  and_cell AND3 (
    .a (net15),
    .b (net29),
    .out (net42)
  );
  and_cell AND4 (
    .a (net41),
    .b (net42),
    .out (net43)
  );
  xor_cell XOR0 (
    .a (net21),
    .b (net41),
    .out (net44)
  );
  and_cell AND5 (
    .a (net38),
    .b (net44),
    .out (net45)
  );
  nand_cell NAND2 (
    .a (net16),
    .b (net31),
    .out (net46)
  );
  or_cell OR4 (
    .a (net32),
    .b (net31),
    .out (net47)
  );
  and_cell AND6 (
    .a (net27),
    .b (net47),
    .out (net48)
  );
  nand_cell NAND3 (
    .a (net46),
    .b (net48),
    .out (net49)
  );
  and_cell AND7 (
    .a (net15),
    .b (net49),
    .out (net50)
  );
  mux_cell MUX1 (
    .a (net16),
    .b (net51),
    .sel (net31),
    .out (net52)
  );
  or_cell OR5 (
    .a (net3),
    .b (net52),
    .out (net53)
  );
  and_cell AND8 (
    .a (net15),
    .b (net53),
    .out (net54)
  );
  and_cell AND9 (
    .a (net51),
    .b (net30),
    .out (net55)
  );
  and_cell AND10 (
    .a (net18),
    .b (net31),
    .out (net56)
  );
  or_cell OR6 (
    .a (net3),
    .b (net56),
    .out (net57)
  );
  or_cell OR7 (
    .a (net55),
    .b (net57),
    .out (net58)
  );
  and_cell AND11 (
    .a (net15),
    .b (net58),
    .out (net59)
  );
  mux_cell MUX2 (
    .a (net18),
    .b (net60),
    .sel (net31),
    .out (net61)
  );
  or_cell OR8 (
    .a (net3),
    .b (net61),
    .out (net62)
  );
  and_cell AND12 (
    .a (net15),
    .b (net62),
    .out (net63)
  );
  mux_cell MUX3 (
    .a (net60),
    .b (net13),
    .sel (net31),
    .out (net64)
  );
  or_cell OR9 (
    .a (net3),
    .b (net64),
    .out (net65)
  );
  and_cell AND13 (
    .a (net15),
    .b (net65),
    .out (net66)
  );
  and_cell AND14 (
    .a (net32),
    .b (net17),
    .out (net67)
  );
  or_cell OR10 (
    .a (net13),
    .b (net60),
    .out (net68)
  );
  not_cell NOT12 (
    .in (net68),
    .out (net69)
  );
  and_cell AND15 (
    .a (net51),
    .b (net69),
    .out (net70)
  );
  and_cell AND16 (
    .a (net19),
    .b (net67),
    .out (net71)
  );
  nand_cell NAND4 (
    .a (net70),
    .b (net71),
    .out (net72)
  );
  or_cell OR11 (
    .a (net51),
    .b (net18),
    .out (net73)
  );
  not_cell NOT13 (
    .in (net73),
    .out (net74)
  );
  or_cell OR12 (
    .a (net68),
    .b (net73),
    .out (net75)
  );
  or_cell OR13 (
    .a (net32),
    .b (net16),
    .out (net76)
  );
  or_cell OR14 (
    .a (net75),
    .b (net76),
    .out (net77)
  );
  nand_cell NAND5 (
    .a (net32),
    .b (net16),
    .out (net78)
  );
  or_cell OR15 (
    .a (net75),
    .b (net78),
    .out (net79)
  );
  and_cell AND17 (
    .a (net77),
    .b (net79),
    .out (net80)
  );
  nand_cell NAND6 (
    .a (net72),
    .b (net80),
    .out (net4)
  );
  or_cell OR16 (
    .a (net51),
    .b (net68),
    .out (net81)
  );
  nand_cell NAND7 (
    .a (net18),
    .b (net67),
    .out (net82)
  );
  or_cell OR17 (
    .a (net81),
    .b (net82),
    .out (net83)
  );
  and_cell AND18 (
    .a (net67),
    .b (net74),
    .out (net84)
  );
  nand_cell NAND8 (
    .a (net13),
    .b (net84),
    .out (net85)
  );
  or_cell OR18 (
    .a (net60),
    .b (net85),
    .out (net86)
  );
  and_cell AND19 (
    .a (net14),
    .b (net60),
    .out (net87)
  );
  nand_cell NAND9 (
    .a (net84),
    .b (net87),
    .out (net88)
  );
  and_cell AND20 (
    .a (net83),
    .b (net88),
    .out (net89)
  );
  nand_cell NAND10 (
    .a (net86),
    .b (net89),
    .out (net7)
  );
  or_cell OR19 (
    .a (net26),
    .b (net4),
    .out (net90)
  );
  or_cell OR20 (
    .a (net7),
    .b (net90),
    .out (net91)
  );
  and_cell AND21 (
    .a (net72),
    .b (net86),
    .out (net92)
  );
  nand_cell NAND11 (
    .a (net91),
    .b (net92),
    .out (net5)
  );
  or_cell OR21 (
    .a (net26),
    .b (net88),
    .out (net93)
  );
  nand_cell NAND12 (
    .a (net83),
    .b (net93),
    .out (net6)
  );
  or_cell OR22 (
    .a (net26),
    .b (net79),
    .out (net94)
  );
  nand_cell NAND13 (
    .a (net77),
    .b (net94),
    .out (net8)
  );
  dff_cell FF0 (
    .d (net40),
    .clk (net1),
    .q (net24)
  );
  dff_cell FF1 (
    .d (net43),
    .clk (net1),
    .q (net22)
  );
  dff_cell FF2 (
    .d (net45),
    .clk (net1),
    .q (net20)
  );
  dff_cell FF3 (
    .d (net50),
    .clk (net1),
    .q (net16)
  );
  dff_cell FF4 (
    .d (net54),
    .clk (net1),
    .q (net51)
  );
  dff_cell FF5 (
    .d (net59),
    .clk (net1),
    .q (net18)
  );
  dff_cell FF6 (
    .d (net63),
    .clk (net1),
    .q (net60)
  );
  dff_cell FF7 (
    .d (net66),
    .clk (net1),
    .q (net13)
  );
  dff_cell FF8 (
    .d (net36),
    .clk (net1),
    .q (net32)
  );
endmodule
