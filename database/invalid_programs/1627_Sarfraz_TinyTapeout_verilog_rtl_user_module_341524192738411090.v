// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341524192738411090 */

`default_nettype none

module user_module_341524192738411090(
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
  wire net16 = 1'b0;
  wire net17 = 1'b1;
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;
  assign io_out[4] = net13;
  assign io_out[5] = net2;
  assign io_out[6] = net14;
  assign io_out[7] = net15;

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
  and_cell gate7 (
    .a (net3),
    .b (net5),
    .out (net19)
  );
  and_cell gate8 (
    .a (net3),
    .b (net6),
    .out (net20)
  );
  and_cell gate9 (
    .a (net4),
    .b (net5),
    .out (net21)
  );
  and_cell gate10 (
    .a (net4),
    .b (net6),
    .out (net22)
  );
  xor_cell gate11 (
    .a (net20),
    .b (net21),
    .out (net23)
  );
  and_cell gate12 (
    .a (net20),
    .b (net21),
    .out (net24)
  );
  xor_cell gate13 (
    .a (net24),
    .b (net22),
    .out (net25)
  );
  and_cell gate14 (
    .a (net24),
    .b (net22),
    .out (net26)
  );
  xor_cell gate15 (
    .a (net8),
    .b (net3),
    .out (net27)
  );
  xor_cell gate16 (
    .a (net27),
    .b (net28),
    .out (net29)
  );
  and_cell gate17 (
    .a (net8),
    .b (net3),
    .out (net30)
  );
  and_cell gate18 (
    .a (net27),
    .b (net28),
    .out (net31)
  );
  or_cell gate19 (
    .a (net31),
    .b (net30),
    .out (net32)
  );
  xor_cell gate20 (
    .a (net8),
    .b (net5),
    .out (net28)
  );
  xor_cell gate21 (
    .a (net32),
    .b (net4),
    .out (net33)
  );
  xor_cell gate22 (
    .a (net33),
    .b (net34),
    .out (net35)
  );
  and_cell gate23 (
    .a (net33),
    .b (net34),
    .out (net36)
  );
  and_cell gate24 (
    .a (net32),
    .b (net4),
    .out (net37)
  );
  or_cell gate25 (
    .a (net36),
    .b (net37),
    .out (net38)
  );
  xor_cell gate26 (
    .a (net8),
    .b (net6),
    .out (net34)
  );
  mux_cell mux2 (
    .a (net29),
    .b (net19),
    .sel (net7),
    .out (net39)
  );
  mux_cell mux3 (
    .a (net35),
    .b (net23),
    .sel (net7),
    .out (net40)
  );
  mux_cell mux4 (
    .a (net38),
    .b (net25),
    .sel (net7),
    .out (net41)
  );
  mux_cell mux5 (
    .a (net8),
    .b (net26),
    .sel (net7),
    .out (net42)
  );
  dff_cell flipflop2 (
    .d (net39),
    .clk (net43),
    .q (net9),
    .notq (net44)
  );
  dff_cell flipflop3 (
    .d (net40),
    .clk (net43),
    .q (net10),
    .notq (net45)
  );
  dff_cell flipflop4 (
    .d (net41),
    .clk (net43),
    .q (net11)
  );
  dff_cell flipflop5 (
    .d (net42),
    .clk (net43),
    .q (net12)
  );
  dff_cell flipflop6 (
    .d (net7),
    .clk (net43),
    .q (net15)
  );
  and_cell gate27 (
    .a (net1),
    .b (net2),
    .out (net43)
  );
  and_cell gate28 (
    .a (net11),
    .b (net12),
    .out (net14)
  );
  and_cell gate29 (
    .a (net44),
    .b (net45),
    .out (net46)
  );
  and_cell gate30 (
    .a (net12),
    .b (net46),
    .out (net13)
  );
endmodule
