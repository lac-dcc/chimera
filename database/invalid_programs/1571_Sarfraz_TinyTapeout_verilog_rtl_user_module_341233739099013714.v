// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341233739099013714 */

`default_nettype none

module user_module_341233739099013714(
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net14;
  assign io_out[6] = net15;
  assign io_out[7] = net16;

  and_cell gate1 (
    .a (net20),
    .b (net21),
    .out (net22)
  );
  nand_cell gate4 (
    .a (net10),
    .b (net11),
    .out (net23)
  );
  mux_cell mux1 (
    .a (net3),
    .b (net13),
    .sel (net7),
    .out (net24)
  );
  dff_cell flipflop1 (
    .d (net2),
    .clk (net1),
    .q (net9)
  );
  dff_cell flipflop2 (
    .d (net25),
    .clk (net1),
    .q (net10)
  );
  dff_cell flipflop3 (
    .d (net26),
    .clk (net1),
    .q (net11)
  );
  dff_cell flipflop4 (
    .d (net27),
    .clk (net1),
    .q (net12)
  );
  mux_cell mux2 (
    .a (net24),
    .b (net4),
    .sel (net8),
    .out (net25)
  );
  mux_cell mux3 (
    .a (net24),
    .b (net5),
    .sel (net8),
    .out (net26)
  );
  mux_cell mux4 (
    .a (net24),
    .b (net6),
    .sel (net8),
    .out (net27)
  );
  nand_cell gate7 (
    .a (net11),
    .b (net12),
    .out (net20)
  );
  nand_cell gate8 (
    .a (net10),
    .b (net12),
    .out (net21)
  );
  and_cell gate9 (
    .a (net23),
    .b (net20),
    .out (net28)
  );
  nand_cell gate10 (
    .a (net28),
    .b (net22),
    .out (net13)
  );
  and_cell gate11 (
    .a (net29),
    .b (net30),
    .out (net31)
  );
  nand_cell gate12 (
    .a (net32),
    .b (net33),
    .out (net34)
  );
  mux_cell mux5 (
    .a (net6),
    .b (net16),
    .sel (net7),
    .out (net35)
  );
  dff_cell flipflop5 (
    .d (net35),
    .clk (net1),
    .q (net32)
  );
  dff_cell flipflop6 (
    .d (net35),
    .clk (net1),
    .q (net33)
  );
  dff_cell flipflop7 (
    .d (net35),
    .clk (net1),
    .q (net36)
  );
  nand_cell gate13 (
    .a (net33),
    .b (net36),
    .out (net29)
  );
  nand_cell gate14 (
    .a (net32),
    .b (net36),
    .out (net30)
  );
  and_cell gate15 (
    .a (net34),
    .b (net29),
    .out (net37)
  );
  nand_cell gate16 (
    .a (net37),
    .b (net31),
    .out (net16)
  );
  and_cell gate17 (
    .a (net38),
    .b (net39),
    .out (net40)
  );
  nand_cell gate18 (
    .a (net41),
    .b (net42),
    .out (net43)
  );
  mux_cell mux6 (
    .a (net5),
    .b (net15),
    .sel (net7),
    .out (net44)
  );
  dff_cell flipflop8 (
    .d (net44),
    .clk (net1),
    .q (net41)
  );
  dff_cell flipflop9 (
    .d (net44),
    .clk (net1),
    .q (net42)
  );
  dff_cell flipflop10 (
    .d (net44),
    .clk (net1),
    .q (net45)
  );
  nand_cell gate19 (
    .a (net42),
    .b (net45),
    .out (net38)
  );
  nand_cell gate20 (
    .a (net41),
    .b (net45),
    .out (net39)
  );
  and_cell gate21 (
    .a (net43),
    .b (net38),
    .out (net46)
  );
  nand_cell gate22 (
    .a (net46),
    .b (net40),
    .out (net15)
  );
  and_cell gate23 (
    .a (net47),
    .b (net48),
    .out (net49)
  );
  nand_cell gate24 (
    .a (net50),
    .b (net51),
    .out (net52)
  );
  mux_cell mux7 (
    .a (net4),
    .b (net14),
    .sel (net7),
    .out (net53)
  );
  dff_cell flipflop11 (
    .d (net53),
    .clk (net1),
    .q (net50)
  );
  dff_cell flipflop12 (
    .d (net53),
    .clk (net1),
    .q (net51)
  );
  dff_cell flipflop13 (
    .d (net53),
    .clk (net1),
    .q (net54)
  );
  nand_cell gate25 (
    .a (net51),
    .b (net54),
    .out (net47)
  );
  nand_cell gate26 (
    .a (net50),
    .b (net54),
    .out (net48)
  );
  and_cell gate27 (
    .a (net52),
    .b (net47),
    .out (net55)
  );
  nand_cell gate28 (
    .a (net55),
    .b (net49),
    .out (net14)
  );
endmodule
