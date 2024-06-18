// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341178154799333971 */

`default_nettype none

module user_module_341178154799333971(
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

  assign io_out[0] = net4;
  assign io_out[1] = net5;
  assign io_out[2] = net6;
  assign io_out[3] = net7;
  assign io_out[4] = net8;
  assign io_out[5] = net9;
  assign io_out[6] = net10;
  assign io_out[7] = net11;

  xor_cell gate3 (
    .a (net15),
    .b (net6),
    .out (net16)
  );
  mux_cell mux1 (
    .a (net17),
    .b (net2),
    .sel (net3),
    .out (net18)
  );
  dff_cell flipflop2 (
    .d (net18),
    .clk (net1),
    .q (net19),
    .notq (net20)
  );
  dff_cell flipflop3 (
    .d (net19),
    .clk (net1),
    .q (net21),
    .notq (net22)
  );
  dff_cell flipflop4 (
    .d (net21),
    .clk (net1),
    .q (net23),
    .notq (net24)
  );
  dff_cell flipflop5 (
    .d (net23),
    .clk (net1),
    .q (net25),
    .notq (net26)
  );
  dff_cell flipflop6 (
    .d (net27),
    .clk (net1),
    .q (net28),
    .notq (net29)
  );
  dff_cell flipflop7 (
    .d (net25),
    .clk (net1),
    .q (net27),
    .notq (net30)
  );
  dff_cell flipflop8 (
    .d (net28),
    .clk (net1),
    .q (net31),
    .notq (net32)
  );
  dff_cell flipflop9 (
    .d (net31),
    .clk (net1),
    .q (net33),
    .notq (net34)
  );
  dff_cell flipflop10 (
    .d (net33),
    .clk (net1),
    .q (net4),
    .notq (net35)
  );
  dff_cell flipflop11 (
    .d (net4),
    .clk (net1),
    .q (net5),
    .notq (net36)
  );
  dff_cell flipflop12 (
    .d (net5),
    .clk (net1),
    .q (net6),
    .notq (net37)
  );
  dff_cell flipflop13 (
    .d (net6),
    .clk (net1),
    .q (net7),
    .notq (net38)
  );
  dff_cell flipflop14 (
    .d (net7),
    .clk (net1),
    .q (net8),
    .notq (net39)
  );
  dff_cell flipflop15 (
    .d (net8),
    .clk (net1),
    .q (net9),
    .notq (net40)
  );
  dff_cell flipflop16 (
    .d (net9),
    .clk (net1),
    .q (net10),
    .notq (net41)
  );
  xor_cell gate7 (
    .a (net42),
    .b (net8),
    .out (net15)
  );
  xor_cell gate8 (
    .a (net11),
    .b (net9),
    .out (net42)
  );
  dff_cell flipflop1 (
    .d (net10),
    .clk (net1),
    .q (net11),
    .notq (net43)
  );
  or_cell gate1 (
    .a (net44),
    .b (net16),
    .out (net17)
  );
  and_cell gate2 (
    .a (net45),
    .b (net46),
    .out (net47)
  );
  and_cell gate4 (
    .a (net22),
    .b (net20),
    .out (net46)
  );
  and_cell gate5 (
    .a (net26),
    .b (net24),
    .out (net45)
  );
  and_cell gate6 (
    .a (net29),
    .b (net30),
    .out (net48)
  );
  and_cell gate9 (
    .a (net34),
    .b (net32),
    .out (net49)
  );
  and_cell gate10 (
    .a (net36),
    .b (net35),
    .out (net50)
  );
  and_cell gate11 (
    .a (net38),
    .b (net37),
    .out (net51)
  );
  and_cell gate12 (
    .a (net40),
    .b (net39),
    .out (net52)
  );
  and_cell gate13 (
    .a (net43),
    .b (net41),
    .out (net53)
  );
  and_cell gate14 (
    .a (net49),
    .b (net48),
    .out (net54)
  );
  and_cell gate15 (
    .a (net51),
    .b (net50),
    .out (net55)
  );
  and_cell gate16 (
    .a (net53),
    .b (net52),
    .out (net56)
  );
  and_cell gate17 (
    .a (net54),
    .b (net47),
    .out (net57)
  );
  and_cell gate19 (
    .a (net56),
    .b (net55),
    .out (net58)
  );
  and_cell gate20 (
    .a (net58),
    .b (net57),
    .out (net44)
  );
endmodule
