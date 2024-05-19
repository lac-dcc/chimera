// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341389786199622227 */

`default_nettype none

module user_module_341389786199622227(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3;
  wire net4;
  wire net5;
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = 1'b0;
  wire net12 = 1'b1;
  wire net13 = 1'b1;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19;
  wire net20;
  wire net21;
  wire net22 = 1'b1;
  wire net23 = 1'b1;
  wire net24 = 1'b1;
  wire net25;
  wire net26;
  wire net27;
  wire net28 = 1'b1;
  wire net29;
  wire net30;
  wire net31;
  wire net32;
  wire net33;
  wire net34;
  wire net35;
  wire net36;
  wire net37 = 1'b1;
  wire net38 = 1'b1;
  wire net39;
  wire net40;
  wire net41;
  wire net42;
  wire net43;
  wire net44;
  wire net45;
  wire net46;
  wire net47;
  wire net48 = 1'b1;
  wire net49 = 1'b1;
  wire net50 = 1'b1;
  wire net51 = 1'b1;
  wire net52 = 1'b1;
  wire net53 = 1'b1;

  assign io_out[0] = net3;
  assign io_out[1] = net4;
  assign io_out[2] = net5;
  assign io_out[3] = net6;
  assign io_out[4] = net7;
  assign io_out[5] = net8;
  assign io_out[6] = net9;
  assign io_out[7] = net10;

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
  dff_cell flipflop9 (

  );
  dff_cell flipflop10 (
    .d (net14),
    .clk (net1),
    .q (net15),
    .notq (net16)
  );
  dff_cell flipflop11 (
    .d (net17),
    .clk (net1),
    .q (net18),
    .notq (net19)
  );
  dff_cell flipflop12 (
    .d (net20),
    .clk (net1),
    .q (net10),
    .notq (net21)
  );
  xor_cell gate7 (
    .a (net15),
    .b (net2),
    .out (net14)
  );
  xor_cell gate8 (
    .a (net18),
    .b (net25),
    .out (net17)
  );
  xor_cell gate9 (
    .a (net10),
    .b (net26),
    .out (net20)
  );
  and_cell gate10 (
    .a (net15),
    .b (net2),
    .out (net25)
  );
  and_cell gate11 (
    .a (net18),
    .b (net25),
    .out (net26)
  );
  and_cell gate16 (

  );
  and_cell gate1 (
    .a (net16),
    .b (net19),
    .out (net27)
  );
  and_cell gate14 (
    .a (net21),
    .b (net28),
    .out (net29)
  );
  and_cell gate15 (
    .a (net27),
    .b (net29),
    .out (net3)
  );
  and_cell gate17 (
    .a (net15),
    .b (net19),
    .out (net30)
  );
  and_cell gate18 (
    .a (net10),
    .b (net28),
    .out (net31)
  );
  and_cell gate19 (
    .a (net30),
    .b (net31),
    .out (net5)
  );
  and_cell gate20 (
    .a (net16),
    .b (net18),
    .out (net32)
  );
  and_cell gate21 (
    .a (net10),
    .b (net28),
    .out (net33)
  );
  and_cell gate22 (
    .a (net32),
    .b (net33),
    .out (net34)
  );
  and_cell gate23 (
    .a (net15),
    .b (net18),
    .out (net35)
  );
  and_cell gate24 (
    .a (net10),
    .b (net28),
    .out (net36)
  );
  and_cell gate25 (
    .a (net35),
    .b (net36),
    .out (net8)
  );
  and_cell gate26 (
    .a (net15),
    .b (net19),
    .out (net39)
  );
  and_cell gate27 (
    .a (net21),
    .b (net28),
    .out (net40)
  );
  and_cell gate28 (
    .a (net39),
    .b (net40),
    .out (net4)
  );
  and_cell gate29 (
    .a (net16),
    .b (net18),
    .out (net41)
  );
  and_cell gate30 (
    .a (net21),
    .b (net28),
    .out (net42)
  );
  and_cell gate31 (
    .a (net41),
    .b (net42),
    .out (net43)
  );
  and_cell gate32 (
    .a (net15),
    .b (net18),
    .out (net44)
  );
  and_cell gate33 (
    .a (net21),
    .b (net28),
    .out (net45)
  );
  and_cell gate34 (
    .a (net44),
    .b (net45),
    .out (net7)
  );
  and_cell gate35 (
    .a (net16),
    .b (net19),
    .out (net46)
  );
  and_cell gate36 (
    .a (net10),
    .b (net28),
    .out (net47)
  );
  and_cell gate37 (
    .a (net46),
    .b (net47),
    .out (net6)
  );
  or_cell gate12 (
    .a (net43),
    .b (net34),
    .out (net9)
  );
endmodule
