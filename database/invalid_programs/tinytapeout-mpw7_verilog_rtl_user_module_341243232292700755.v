// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341243232292700755 */

`default_nettype none

module user_module_341243232292700755(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2;
  wire net3;
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9 = 1'b0;
  wire net10 = 1'b1;
  wire net11 = 1'b1;
  wire net12;
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
  wire net23 = 1'b0;
  wire net24;
  wire net25;
  wire net26;
  wire net27 = 1'b1;
  wire net28;
  wire net29;
  wire net30;
  wire net31;
  wire net32;
  wire net33;
  wire net34 = 1'b0;
  wire net35;
  wire net36;
  wire net37;
  wire net38 = 1'b1;
  wire net39;
  wire net40;
  wire net41;
  wire net42 = 1'b0;
  wire net43;
  wire net44;
  wire net45;
  wire net46 = 1'b1;
  wire net47;
  wire net48;
  wire net49;
  wire net50 = 1'b0;
  wire net51;
  wire net52;
  wire net53;
  wire net54 = 1'b1;
  wire net55;
  wire net56;
  wire net57;
  wire net58 = 1'b0;
  wire net59;
  wire net60;
  wire net61;
  wire net62 = 1'b1;
  wire net63;
  wire net64;
  wire net65;
  wire net66 = 1'b0;
  wire net67 = 1'b1;
  wire net68;
  wire net69;
  wire net70;
  wire net71;
  wire net72;
  wire net73;
  wire net74 = 1'b1;
  wire net75 = 1'b0;
  wire net76;
  wire net77;
  wire net78;
  wire net79;
  wire net80;
  wire net81;

  assign io_out[0] = net2;
  assign io_out[1] = net3;
  assign io_out[2] = net4;
  assign io_out[3] = net5;
  assign io_out[4] = net6;
  assign io_out[5] = net7;
  assign io_out[6] = net8;
  assign io_out[7] = net1;

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

  );
  dff_cell flipflop1 (

  );
  dff_cell flipflop2 (
    .d (net12),
    .clk (net1),
    .q (net2)
  );
  dff_cell flipflop3 (
    .d (net13),
    .clk (net1),
    .q (net3)
  );
  dff_cell flipflop4 (
    .d (net14),
    .clk (net1),
    .q (net4)
  );
  dff_cell flipflop5 (
    .d (net15),
    .clk (net1),
    .q (net5)
  );
  dff_cell flipflop6 (
    .d (net16),
    .clk (net1),
    .q (net6)
  );
  dff_cell flipflop7 (
    .d (net17),
    .clk (net1),
    .q (net7)
  );
  dff_cell flipflop8 (
    .d (net18),
    .clk (net1),
    .q (net8)
  );
  dff_cell flipflop9 (
    .d (net19),
    .clk (net1),
    .q (net20)
  );
  dff_cell flipflop10 (
    .d (net21),
    .clk (net1),
    .q (net22)
  );
  mux_cell mux2 (
    .a (net23),
    .b (net23),
    .sel (net20),
    .out (net24)
  );
  mux_cell mux3 (
    .a (net25),
    .b (net24),
    .sel (net22),
    .out (net26)
  );
  mux_cell mux4 (
    .a (net23),
    .b (net23),
    .sel (net20),
    .out (net25)
  );
  xor_cell gate11 (
    .a (net20),
    .b (net22),
    .out (net21)
  );
  not_cell gate7 (
    .in (net20),
    .out (net19)
  );
  dff_cell flipflop11 (
    .d (net28),
    .clk (net1),
    .q (net29)
  );
  and_cell gate8 (
    .a (net20),
    .b (net22),
    .out (net30)
  );
  xor_cell gate9 (
    .a (net29),
    .b (net30),
    .out (net28)
  );
  mux_cell mux5 (
    .a (net23),
    .b (net23),
    .sel (net20),
    .out (net31)
  );
  mux_cell mux6 (
    .a (net27),
    .b (net23),
    .sel (net20),
    .out (net32)
  );
  mux_cell mux7 (
    .a (net32),
    .b (net31),
    .sel (net22),
    .out (net33)
  );
  mux_cell mux8 (
    .a (net33),
    .b (net26),
    .sel (net29),
    .out (net12)
  );
  mux_cell mux9 (
    .a (net34),
    .b (net34),
    .sel (net20),
    .out (net35)
  );
  mux_cell mux10 (
    .a (net36),
    .b (net35),
    .sel (net22),
    .out (net37)
  );
  mux_cell mux11 (
    .a (net34),
    .b (net34),
    .sel (net20),
    .out (net36)
  );
  mux_cell mux12 (
    .a (net34),
    .b (net34),
    .sel (net20),
    .out (net39)
  );
  mux_cell mux13 (
    .a (net34),
    .b (net38),
    .sel (net20),
    .out (net40)
  );
  mux_cell mux14 (
    .a (net40),
    .b (net39),
    .sel (net22),
    .out (net41)
  );
  mux_cell mux15 (
    .a (net41),
    .b (net37),
    .sel (net29),
    .out (net13)
  );
  mux_cell mux16 (
    .a (net42),
    .b (net42),
    .sel (net20),
    .out (net43)
  );
  mux_cell mux17 (
    .a (net44),
    .b (net43),
    .sel (net22),
    .out (net45)
  );
  mux_cell mux18 (
    .a (net42),
    .b (net46),
    .sel (net20),
    .out (net44)
  );
  mux_cell mux19 (
    .a (net42),
    .b (net42),
    .sel (net20),
    .out (net47)
  );
  mux_cell mux20 (
    .a (net42),
    .b (net42),
    .sel (net20),
    .out (net48)
  );
  mux_cell mux21 (
    .a (net48),
    .b (net47),
    .sel (net22),
    .out (net49)
  );
  mux_cell mux22 (
    .a (net49),
    .b (net45),
    .sel (net29),
    .out (net14)
  );
  mux_cell mux23 (
    .a (net50),
    .b (net50),
    .sel (net20),
    .out (net51)
  );
  mux_cell mux24 (
    .a (net52),
    .b (net51),
    .sel (net22),
    .out (net53)
  );
  mux_cell mux25 (
    .a (net54),
    .b (net50),
    .sel (net20),
    .out (net52)
  );
  mux_cell mux26 (
    .a (net50),
    .b (net50),
    .sel (net20),
    .out (net55)
  );
  mux_cell mux27 (
    .a (net50),
    .b (net50),
    .sel (net20),
    .out (net56)
  );
  mux_cell mux28 (
    .a (net56),
    .b (net55),
    .sel (net22),
    .out (net57)
  );
  mux_cell mux29 (
    .a (net57),
    .b (net53),
    .sel (net29),
    .out (net15)
  );
  mux_cell mux30 (
    .a (net58),
    .b (net58),
    .sel (net20),
    .out (net59)
  );
  mux_cell mux31 (
    .a (net60),
    .b (net59),
    .sel (net22),
    .out (net61)
  );
  mux_cell mux32 (
    .a (net58),
    .b (net58),
    .sel (net20),
    .out (net60)
  );
  mux_cell mux33 (
    .a (net58),
    .b (net62),
    .sel (net20),
    .out (net63)
  );
  mux_cell mux34 (
    .a (net58),
    .b (net58),
    .sel (net20),
    .out (net64)
  );
  mux_cell mux35 (
    .a (net64),
    .b (net63),
    .sel (net22),
    .out (net65)
  );
  mux_cell mux36 (
    .a (net65),
    .b (net61),
    .sel (net29),
    .out (net16)
  );
  mux_cell mux37 (
    .a (net66),
    .b (net67),
    .sel (net20),
    .out (net68)
  );
  mux_cell mux38 (
    .a (net69),
    .b (net68),
    .sel (net22),
    .out (net70)
  );
  mux_cell mux39 (
    .a (net66),
    .b (net66),
    .sel (net20),
    .out (net69)
  );
  mux_cell mux40 (
    .a (net66),
    .b (net66),
    .sel (net20),
    .out (net71)
  );
  mux_cell mux41 (
    .a (net66),
    .b (net66),
    .sel (net20),
    .out (net72)
  );
  mux_cell mux42 (
    .a (net72),
    .b (net71),
    .sel (net22),
    .out (net73)
  );
  mux_cell mux43 (
    .a (net73),
    .b (net70),
    .sel (net29),
    .out (net17)
  );
  mux_cell mux44 (
    .a (net74),
    .b (net75),
    .sel (net20),
    .out (net76)
  );
  mux_cell mux45 (
    .a (net77),
    .b (net76),
    .sel (net22),
    .out (net78)
  );
  mux_cell mux46 (
    .a (net75),
    .b (net75),
    .sel (net20),
    .out (net77)
  );
  mux_cell mux47 (
    .a (net74),
    .b (net75),
    .sel (net20),
    .out (net79)
  );
  mux_cell mux48 (
    .a (net75),
    .b (net75),
    .sel (net20),
    .out (net80)
  );
  mux_cell mux49 (
    .a (net80),
    .b (net79),
    .sel (net22),
    .out (net81)
  );
  mux_cell mux50 (
    .a (net81),
    .b (net78),
    .sel (net29),
    .out (net18)
  );
endmodule
