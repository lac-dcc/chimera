// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341162950004834900 */

`default_nettype none

module user_module_341162950004834900(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[4];
  wire net4 = io_in[5];
  wire net5 = io_in[6];
  wire net6 = io_in[7];
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15 = 1'b0;
  wire net16 = 1'b1;
  wire net17 = 1'b1;
  wire net18;
  wire net19 = 1'b0;
  wire net20;
  wire net21 = 1'b1;
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
  wire net33 = 1'b1;
  wire net34;
  wire net35;
  wire net36;
  wire net37;
  wire net38;
  wire net39;
  wire net40 = 1'b1;
  wire net41;
  wire net42;
  wire net43;
  wire net44;
  wire net45;
  wire net46;
  wire net47;
  wire net48 = 1'b1;
  wire net49;
  wire net50;
  wire net51;
  wire net52;
  wire net53;
  wire net54 = 1'b1;
  wire net55;
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
  wire net68 = 1'b0;
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

  assign io_out[0] = net7;
  assign io_out[1] = net8;
  assign io_out[2] = net9;
  assign io_out[3] = net10;
  assign io_out[4] = net11;
  assign io_out[5] = net12;
  assign io_out[6] = net13;
  assign io_out[7] = net14;

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
    .a (net18),
    .b (net19),
    .sel (net5),
    .out (net20)
  );
  dff_cell flipflop1 (

  );
  mux_cell mux2 (
    .a (net21),
    .b (net18),
    .sel (net5),
    .out (net22)
  );
  mux_cell mux3 (
    .a (net21),
    .sel (net5),
    .out (net23)
  );
  mux_cell mux4 (
    .sel (net5),
    .out (net24)
  );
  mux_cell mux5 (
    .a (net20),
    .b (net22),
    .sel (net4),
    .out (net25)
  );
  mux_cell mux6 (
    .a (net23),
    .b (net24),
    .sel (net4),
    .out (net26)
  );
  mux_cell mux7 (
    .a (net25),
    .b (net26),
    .sel (net3),
    .out (net12)
  );
  mux_cell mux8 (
    .a (net18),
    .b (net18),
    .sel (net5),
    .out (net27)
  );
  mux_cell mux10 (
    .a (net18),
    .sel (net5),
    .out (net28)
  );
  mux_cell mux11 (
    .sel (net5),
    .out (net29)
  );
  mux_cell mux12 (
    .a (net27),
    .b (net30),
    .sel (net4),
    .out (net31)
  );
  mux_cell mux13 (
    .a (net28),
    .b (net29),
    .sel (net4),
    .out (net32)
  );
  mux_cell mux14 (
    .a (net31),
    .b (net32),
    .sel (net3),
    .out (net11)
  );
  mux_cell mux15 (
    .a (net18),
    .b (net33),
    .sel (net5),
    .out (net34)
  );
  mux_cell mux16 (
    .a (net6),
    .b (net18),
    .sel (net5),
    .out (net35)
  );
  mux_cell mux17 (
    .a (net33),
    .sel (net5),
    .out (net36)
  );
  mux_cell mux18 (
    .sel (net5),
    .out (net37)
  );
  mux_cell mux19 (
    .a (net34),
    .b (net35),
    .sel (net4),
    .out (net38)
  );
  mux_cell mux20 (
    .a (net36),
    .b (net37),
    .sel (net4),
    .out (net39)
  );
  mux_cell mux21 (
    .a (net38),
    .b (net39),
    .sel (net3),
    .out (net10)
  );
  mux_cell mux22 (
    .a (net40),
    .b (net6),
    .sel (net5),
    .out (net41)
  );
  mux_cell mux24 (
    .a (net40),
    .sel (net5),
    .out (net42)
  );
  mux_cell mux25 (
    .sel (net5),
    .out (net43)
  );
  mux_cell mux26 (
    .a (net41),
    .b (net44),
    .sel (net4),
    .out (net45)
  );
  mux_cell mux27 (
    .a (net42),
    .b (net43),
    .sel (net4),
    .out (net46)
  );
  mux_cell mux28 (
    .a (net45),
    .b (net46),
    .sel (net3),
    .out (net9)
  );
  mux_cell mux30 (
    .a (net18),
    .b (net6),
    .sel (net5),
    .out (net47)
  );
  mux_cell mux31 (
    .a (net48),
    .sel (net5),
    .out (net49)
  );
  mux_cell mux33 (
    .a (net50),
    .b (net47),
    .sel (net4),
    .out (net51)
  );
  mux_cell mux34 (
    .a (net49),
    .b (net52),
    .sel (net4),
    .out (net53)
  );
  mux_cell mux35 (
    .a (net51),
    .b (net53),
    .sel (net3),
    .out (net8)
  );
  mux_cell mux36 (
    .a (net18),
    .b (net54),
    .sel (net5),
    .out (net55)
  );
  mux_cell mux37 (
    .a (net6),
    .b (net54),
    .sel (net5),
    .out (net56)
  );
  mux_cell mux38 (
    .a (net54),
    .sel (net5),
    .out (net57)
  );
  mux_cell mux39 (
    .sel (net5),
    .out (net58)
  );
  mux_cell mux40 (
    .a (net55),
    .b (net56),
    .sel (net4),
    .out (net59)
  );
  mux_cell mux41 (
    .a (net57),
    .b (net58),
    .sel (net4),
    .out (net60)
  );
  mux_cell mux42 (
    .a (net59),
    .b (net60),
    .sel (net3),
    .out (net7)
  );
  mux_cell mux43 (
    .a (net61),
    .b (net54),
    .sel (net5),
    .out (net62)
  );
  mux_cell mux44 (
    .a (net54),
    .b (net18),
    .sel (net5),
    .out (net63)
  );
  mux_cell mux45 (
    .a (net54),
    .sel (net5),
    .out (net64)
  );
  mux_cell mux46 (
    .sel (net5),
    .out (net65)
  );
  mux_cell mux47 (
    .a (net62),
    .b (net63),
    .sel (net4),
    .out (net66)
  );
  mux_cell mux48 (
    .a (net64),
    .b (net65),
    .sel (net4),
    .out (net67)
  );
  mux_cell mux49 (
    .a (net66),
    .b (net67),
    .sel (net3),
    .out (net13)
  );
  mux_cell mux29 (
    .a (net48),
    .b (net48),
    .sel (net5),
    .out (net50)
  );
  mux_cell mux23 (
    .a (net40),
    .b (net40),
    .sel (net5),
    .out (net44)
  );
  mux_cell mux9 (
    .a (net68),
    .b (net18),
    .sel (net5),
    .out (net30)
  );
  mux_cell mux32 (
    .sel (net5),
    .out (net52)
  );
  not_cell gate8 (
    .in (net6),
    .out (net18)
  );
  dff_cell flipflop2 (
    .d (net69),
    .clk (net1),
    .q (net70),
    .notq (net69)
  );
  dff_cell flipflop3 (
    .d (net71),
    .clk (net70),
    .q (net72),
    .notq (net71)
  );
  dff_cell flipflop4 (
    .d (net73),
    .clk (net72),
    .q (net74),
    .notq (net73)
  );
  dff_cell flipflop5 (
    .d (net75),
    .clk (net74),
    .q (net76),
    .notq (net75)
  );
  dff_cell flipflop6 (
    .d (net77),
    .clk (net76),
    .q (net78),
    .notq (net77)
  );
  dff_cell flipflop7 (
    .d (net79),
    .clk (net78),
    .q (net80),
    .notq (net79)
  );
  dff_cell flipflop8 (
    .d (net81),
    .clk (net80),
    .q (net82),
    .notq (net81)
  );
  dff_cell flipflop9 (
    .d (net83),
    .clk (net82),
    .q (net84),
    .notq (net83)
  );
  dff_cell flipflop10 (
    .d (net85),
    .clk (net84),
    .q (net86),
    .notq (net85)
  );
  dff_cell flipflop11 (
    .d (net87),
    .clk (net86),
    .q (net88),
    .notq (net87)
  );
  dff_cell flipflop12 (
    .d (net89),
    .clk (net88),
    .q (net90),
    .notq (net89)
  );
  mux_cell mux50 (
    .a (net91),
    .b (net1),
    .sel (net2),
    .out (net14)
  );
  dff_cell flipflop13 (
    .d (net92),
    .clk (net90),
    .q (net93),
    .notq (net92)
  );
  dff_cell flipflop14 (
    .d (net94),
    .clk (net93),
    .q (net91),
    .notq (net94)
  );
endmodule
