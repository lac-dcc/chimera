// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341631511790879314 */

`default_nettype none

module user_module_341631511790879314(
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
  wire net19 = 1'b1;
  wire net20;
  wire net21;
  wire net22 = 1'b1;
  wire net23;
  wire net24;
  wire net25 = 1'b1;
  wire net26;
  wire net27;
  wire net28 = 1'b0;
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
  wire net41 = 1'b0;
  wire net42;
  wire net43 = 1'b1;
  wire net44;
  wire net45;
  wire net46 = 1'b0;
  wire net47;
  wire net48;
  wire net49 = 1'b1;
  wire net50;
  wire net51 = 1'b1;
  wire net52 = 1'b1;
  wire net53 = 1'b1;
  wire net54 = 1'b1;
  wire net55 = 1'b1;
  wire net56 = 1'b0;
  wire net57 = 1'b0;
  wire net58 = 1'b0;
  wire net59 = 1'b0;
  wire net60 = 1'b0;
  wire net61 = 1'b0;
  wire net62 = 1'b0;
  wire net63 = 1'b0;
  wire net64 = 1'b0;
  wire net65 = 1'b0;
  wire net66 = 1'b0;
  wire net67 = 1'b0;
  wire net68 = 1'b0;
  wire net69 = 1'b0;
  wire net70 = 1'b0;
  wire net71 = 1'b0;
  wire net72 = 1'b0;

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;
  assign io_out[6] = net15;
  assign io_out[7] = net16;

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
  dff_cell flipflop2 (
    .d (net20),
    .clk (net1),
    .q (net9),
    .notq (net11)
  );
  mux_cell mux3 (
    .a (net21),
    .b (net22),
    .sel (net7),
    .out (net20)
  );
  dff_cell flipflop3 (
    .d (net23),
    .clk (net1),
    .q (net21)
  );
  mux_cell mux4 (
    .a (net24),
    .b (net25),
    .sel (net7),
    .out (net23)
  );
  dff_cell flipflop4 (
    .d (net26),
    .clk (net1),
    .q (net24)
  );
  mux_cell mux5 (
    .a (net27),
    .b (net28),
    .sel (net7),
    .out (net26)
  );
  dff_cell flipflop5 (
    .d (net29),
    .clk (net1),
    .q (net27)
  );
  mux_cell mux6 (
    .a (net30),
    .b (net2),
    .sel (net7),
    .out (net29)
  );
  dff_cell flipflop6 (
    .d (net31),
    .clk (net1),
    .q (net30)
  );
  mux_cell mux7 (
    .a (net32),
    .b (net3),
    .sel (net7),
    .out (net31)
  );
  dff_cell flipflop1 (
    .d (net33),
    .clk (net1),
    .q (net32)
  );
  mux_cell mux2 (
    .a (net34),
    .b (net4),
    .sel (net7),
    .out (net33)
  );
  dff_cell flipflop7 (
    .d (net35),
    .clk (net1),
    .q (net34)
  );
  mux_cell mux8 (
    .a (net36),
    .b (net5),
    .sel (net7),
    .out (net35)
  );
  dff_cell flipflop8 (
    .d (net37),
    .clk (net1),
    .q (net36)
  );
  mux_cell mux9 (
    .a (net38),
    .b (net6),
    .sel (net7),
    .out (net37)
  );
  dff_cell flipflop9 (
    .d (net39),
    .clk (net1),
    .q (net38)
  );
  mux_cell mux10 (
    .a (net40),
    .b (net41),
    .sel (net7),
    .out (net39)
  );
  dff_cell flipflop10 (
    .d (net42),
    .clk (net1),
    .q (net40)
  );
  mux_cell mux11 (
    .a (net13),
    .b (net43),
    .sel (net7),
    .out (net42)
  );
  dff_cell flipflop11 (
    .d (net44),
    .clk (net1),
    .q (net13),
    .notq (net14)
  );
  mux_cell mux12 (
    .a (net45),
    .b (net46),
    .sel (net7),
    .out (net44)
  );
  dff_cell flipflop12 (
    .d (net47),
    .clk (net1),
    .q (net45)
  );
  mux_cell mux13 (
    .a (net48),
    .b (net49),
    .sel (net7),
    .out (net47)
  );
  dff_cell flipflop13 (
    .d (net50),
    .clk (net1),
    .q (net48)
  );
  mux_cell mux14 (
    .a (net9),
    .b (net51),
    .sel (net7),
    .out (net50)
  );
  mux_cell mux15 (
    .a (net52),
    .b (net9),
    .sel (net8),
    .out (net10)
  );
  mux_cell mux16 (
    .a (net53),
    .b (net11),
    .sel (net8),
    .out (net12)
  );
  mux_cell mux17 (
    .a (net54),
    .b (net11),
    .sel (net8),
    .out (net15)
  );
  mux_cell mux18 (
    .a (net55),
    .b (net12),
    .sel (net8),
    .out (net16)
  );
endmodule
