// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341490465660469844 */

`default_nettype none

module user_module_341490465660469844(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[5];
  wire net3 = io_in[6];
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12 = 1'b0;
  wire net13 = 1'b1;
  wire net14 = 1'b1;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19 = 1'b1;
  wire net20;
  wire net21 = 1'b1;
  wire net22 = 1'b1;
  wire net23 = 1'b1;
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
  wire net84 = 1'b1;

  assign io_out[0] = net4;
  assign io_out[1] = net5;
  assign io_out[2] = net6;
  assign io_out[3] = net7;
  assign io_out[4] = net8;
  assign io_out[5] = net9;
  assign io_out[6] = net10;
  assign io_out[7] = net11;

  mux_cell mux3 (
    .a (net15),
    .b (net16),
    .sel (net17),
    .out (net18)
  );
  mux_cell mux4 (
    .b (net19),
    .sel (net20),
    .out (net15)
  );
  mux_cell mux5 (
    .a (net21),
    .b (net22),
    .sel (net20),
    .out (net16)
  );
  mux_cell mux9 (
    .a (net23),
    .sel (net17),
    .out (net24)
  );
  mux_cell mux12 (
    .a (net18),
    .b (net24),
    .sel (net25),
    .out (net8)
  );
  mux_cell mux13 (
    .a (net26),
    .b (net27),
    .sel (net17),
    .out (net28)
  );
  mux_cell mux14 (
    .a (net14),
    .sel (net20),
    .out (net26)
  );
  mux_cell mux15 (
    .sel (net20),
    .out (net27)
  );
  mux_cell mux16 (
    .a (net23),
    .sel (net17),
    .out (net29)
  );
  mux_cell mux19 (
    .a (net28),
    .b (net29),
    .sel (net25),
    .out (net7)
  );
  mux_cell mux20 (
    .a (net30),
    .b (net31),
    .sel (net17),
    .out (net32)
  );
  mux_cell mux21 (
    .sel (net20),
    .out (net30)
  );
  mux_cell mux22 (
    .a (net21),
    .sel (net20),
    .out (net31)
  );
  mux_cell mux23 (
    .sel (net17),
    .out (net33)
  );
  mux_cell mux26 (
    .a (net32),
    .b (net33),
    .sel (net25),
    .out (net10)
  );
  mux_cell mux27 (
    .a (net34),
    .b (net35),
    .sel (net17),
    .out (net36)
  );
  mux_cell mux28 (
    .a (net14),
    .b (net19),
    .sel (net20),
    .out (net34)
  );
  mux_cell mux29 (
    .a (net21),
    .sel (net20),
    .out (net35)
  );
  mux_cell mux30 (
    .sel (net17),
    .out (net37)
  );
  mux_cell mux33 (
    .a (net36),
    .b (net37),
    .sel (net25),
    .out (net6)
  );
  mux_cell mux34 (
    .a (net38),
    .b (net39),
    .sel (net17),
    .out (net40)
  );
  mux_cell mux35 (
    .a (net14),
    .b (net19),
    .sel (net20),
    .out (net38)
  );
  mux_cell mux36 (
    .a (net21),
    .sel (net20),
    .out (net39)
  );
  mux_cell mux37 (
    .sel (net17),
    .out (net41)
  );
  mux_cell mux40 (
    .a (net40),
    .b (net41),
    .sel (net25),
    .out (net5)
  );
  mux_cell mux41 (
    .a (net42),
    .b (net43),
    .sel (net17),
    .out (net44)
  );
  mux_cell mux42 (
    .b (net19),
    .sel (net20),
    .out (net42)
  );
  mux_cell mux43 (
    .a (net21),
    .b (net22),
    .sel (net20),
    .out (net43)
  );
  mux_cell mux44 (
    .a (net23),
    .sel (net17),
    .out (net45)
  );
  mux_cell mux47 (
    .a (net44),
    .b (net45),
    .sel (net25),
    .out (net9)
  );
  mux_cell mux48 (
    .a (net46),
    .b (net47),
    .sel (net17),
    .out (net48)
  );
  mux_cell mux49 (
    .b (net19),
    .sel (net20),
    .out (net46)
  );
  mux_cell mux50 (
    .a (net21),
    .sel (net20),
    .out (net47)
  );
  mux_cell mux51 (
    .a (net23),
    .sel (net17),
    .out (net49)
  );
  mux_cell mux54 (
    .a (net48),
    .b (net49),
    .sel (net25),
    .out (net4)
  );
  dff_cell flipflop2 (
    .d (net50),
    .clk (net51),
    .q (net17),
    .notq (net50)
  );
  dff_cell flipflop3 (
    .d (net52),
    .clk (net53),
    .q (net20),
    .notq (net52)
  );
  dff_cell flipflop4 (
    .d (net53),
    .clk (net50),
    .q (net25),
    .notq (net53)
  );
  dff_cell flipflop5 (
    .d (net54),
    .clk (net20),
    .q (net11),
    .notq (net54)
  );
  dff_cell flipflop6 (
    .d (net55),
    .clk (net56),
    .notq (net55)
  );
  dff_cell flipflop7 (
    .d (net57),
    .clk (net11),
    .q (net56),
    .notq (net57)
  );
  dff_cell flipflop8 (
    .d (net58),
    .clk (net1),
    .q (net59),
    .notq (net58)
  );
  dff_cell flipflop9 (
    .d (net60),
    .clk (net61),
    .q (net62),
    .notq (net60)
  );
  dff_cell flipflop10 (
    .d (net63),
    .clk (net59),
    .q (net61),
    .notq (net63)
  );
  dff_cell flipflop11 (
    .d (net64),
    .clk (net62),
    .q (net65),
    .notq (net64)
  );
  dff_cell flipflop12 (
    .d (net66),
    .clk (net67),
    .q (net68),
    .notq (net66)
  );
  dff_cell flipflop13 (
    .d (net69),
    .clk (net65),
    .q (net67),
    .notq (net69)
  );
  dff_cell flipflop14 (
    .d (net70),
    .clk (net68),
    .q (net71),
    .notq (net70)
  );
  dff_cell flipflop15 (
    .d (net72),
    .clk (net73),
    .q (net74),
    .notq (net72)
  );
  dff_cell flipflop16 (
    .d (net75),
    .clk (net71),
    .q (net73),
    .notq (net75)
  );
  dff_cell flipflop17 (
    .d (net76),
    .clk (net74),
    .q (net77),
    .notq (net76)
  );
  dff_cell flipflop18 (
    .d (net78),
    .clk (net79),
    .q (net80),
    .notq (net78)
  );
  dff_cell flipflop19 (
    .d (net81),
    .clk (net77),
    .q (net79),
    .notq (net81)
  );
  mux_cell mux2 (
    .a (net82),
    .b (net83),
    .sel (net3),
    .out (net51)
  );
  mux_cell mux6 (
    .a (net68),
    .b (net77),
    .sel (net2),
    .out (net82)
  );
  mux_cell mux7 (
    .a (net79),
    .b (net80),
    .sel (net2),
    .out (net83)
  );
endmodule
