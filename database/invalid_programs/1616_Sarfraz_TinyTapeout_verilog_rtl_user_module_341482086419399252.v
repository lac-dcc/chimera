// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341482086419399252 */

`default_nettype none

module user_module_341482086419399252(
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
  wire net13 = 1'b0;
  wire net14 = 1'b1;
  wire net15 = 1'b1;
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;

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
  dff_cell flipflop1 (

  );
  mux_cell mux2 (

  );
  dff_cell flipflop2 (
    .d (net3),
    .clk (net16),
    .q (net17)
  );
  nand_cell gate7 (
    .a (net18),
    .b (net19),
    .out (net16)
  );
  dff_cell flipflop3 (
    .d (net3),
    .clk (net20),
    .q (net21)
  );
  dff_cell flipflop4 (
    .d (net3),
    .clk (net22),
    .q (net23)
  );
  dff_cell flipflop5 (
    .d (net3),
    .clk (net24),
    .q (net25)
  );
  dff_cell flipflop6 (
    .d (net4),
    .clk (net16),
    .q (net26)
  );
  dff_cell flipflop7 (
    .d (net4),
    .clk (net20),
    .q (net27)
  );
  dff_cell flipflop8 (
    .d (net4),
    .clk (net22),
    .q (net28)
  );
  dff_cell flipflop9 (
    .d (net4),
    .clk (net24),
    .q (net29)
  );
  dff_cell flipflop10 (
    .d (net5),
    .clk (net16),
    .q (net30)
  );
  dff_cell flipflop11 (
    .d (net5),
    .clk (net20),
    .q (net31)
  );
  dff_cell flipflop12 (
    .d (net5),
    .clk (net22),
    .q (net32)
  );
  dff_cell flipflop13 (
    .d (net5),
    .clk (net24),
    .q (net33)
  );
  dff_cell flipflop14 (
    .d (net6),
    .clk (net16),
    .q (net34)
  );
  dff_cell flipflop15 (
    .d (net6),
    .clk (net20),
    .q (net35)
  );
  dff_cell flipflop16 (
    .d (net6),
    .clk (net22),
    .q (net36)
  );
  dff_cell flipflop17 (
    .d (net6),
    .clk (net24),
    .q (net37)
  );
  nand_cell gate8 (
    .a (net19),
    .b (net1),
    .out (net20)
  );
  nand_cell gate9 (
    .a (net18),
    .b (net2),
    .out (net22)
  );
  nand_cell gate10 (
    .a (net2),
    .b (net1),
    .out (net24)
  );
  not_cell gate11 (
    .in (net1),
    .out (net18)
  );
  not_cell gate12 (
    .in (net2),
    .out (net19)
  );
  mux_cell mux1 (
    .a (net17),
    .b (net26),
    .sel (net38),
    .out (net39)
  );
  mux_cell mux3 (
    .a (net30),
    .b (net34),
    .sel (net38),
    .out (net40)
  );
  mux_cell mux4 (
    .a (net39),
    .b (net40),
    .sel (net7),
    .out (net9)
  );
  mux_cell mux5 (
    .a (net21),
    .b (net27),
    .sel (net41),
    .out (net42)
  );
  mux_cell mux6 (
    .a (net31),
    .b (net35),
    .sel (net41),
    .out (net43)
  );
  mux_cell mux7 (
    .a (net42),
    .b (net43),
    .sel (net7),
    .out (net10)
  );
  mux_cell mux8 (
    .a (net23),
    .b (net28),
    .sel (net8),
    .out (net44)
  );
  mux_cell mux9 (
    .a (net32),
    .b (net36),
    .sel (net8),
    .out (net45)
  );
  mux_cell mux10 (
    .a (net44),
    .b (net45),
    .sel (net7),
    .out (net11)
  );
  mux_cell mux11 (
    .a (net25),
    .b (net29),
    .sel (net46),
    .out (net47)
  );
  mux_cell mux12 (
    .a (net33),
    .b (net37),
    .sel (net46),
    .out (net48)
  );
  mux_cell mux13 (
    .a (net47),
    .b (net48),
    .sel (net7),
    .out (net12)
  );
endmodule
