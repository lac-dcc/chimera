// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341569483755749970 */

`default_nettype none

module user_module_341569483755749970(
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
  wire net30 = 1'b0;
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

  assign io_out[0] = net9;
  assign io_out[3] = net10;
  assign io_out[6] = net11;
  assign io_out[7] = net12;

  xor_cell gate3 (
    .a (net16),
    .b (net17),
    .out (net18)
  );
  mux_cell mux1 (
    .a (net9),
    .b (net3),
    .sel (net2),
    .out (net19)
  );
  dff_cell flipflop1 (
    .d (net20),
    .clk (net1),
    .q (net9)
  );
  dff_cell flipflop2 (
    .d (net21),
    .clk (net1),
    .q (net11)
  );
  dff_cell flipflop3 (
    .d (net22),
    .clk (net1),
    .q (net10)
  );
  xor_cell gate9 (
    .a (net18),
    .b (net23),
    .out (net20)
  );
  or_cell gate10 (
    .a (net24),
    .b (net25),
    .out (net26)
  );
  and_cell gate11 (
    .a (net16),
    .b (net17),
    .out (net25)
  );
  and_cell gate8 (
    .a (net18),
    .b (net23),
    .out (net24)
  );
  dff_cell flipflop4 (
    .d (net27),
    .clk (net1),
    .q (net12)
  );
  mux_cell mux2 (
    .a (net11),
    .b (net4),
    .sel (net2),
    .out (net28)
  );
  mux_cell mux3 (
    .a (net10),
    .b (net5),
    .sel (net2),
    .out (net29)
  );
  buffer_cell gate22 (
    .in (net19),
    .out (net16)
  );
  buffer_cell gate23 (
    .in (net6),
    .out (net17)
  );
  buffer_cell gate24 (
    .in (net30),
    .out (net23)
  );
  xor_cell gate12 (
    .a (net31),
    .b (net32),
    .out (net33)
  );
  xor_cell gate13 (
    .a (net33),
    .b (net34),
    .out (net21)
  );
  or_cell gate14 (
    .a (net35),
    .b (net36),
    .out (net37)
  );
  and_cell gate15 (
    .a (net31),
    .b (net32),
    .out (net36)
  );
  and_cell gate16 (
    .a (net33),
    .b (net34),
    .out (net35)
  );
  buffer_cell gate17 (
    .in (net28),
    .out (net31)
  );
  buffer_cell gate18 (
    .in (net7),
    .out (net32)
  );
  buffer_cell gate19 (
    .in (net26),
    .out (net34)
  );
  xor_cell gate20 (
    .a (net38),
    .b (net39),
    .out (net40)
  );
  xor_cell gate21 (
    .a (net40),
    .b (net41),
    .out (net22)
  );
  or_cell gate25 (
    .a (net42),
    .b (net43),
    .out (net27)
  );
  and_cell gate26 (
    .a (net38),
    .b (net39),
    .out (net43)
  );
  and_cell gate27 (
    .a (net40),
    .b (net41),
    .out (net42)
  );
  buffer_cell gate28 (
    .in (net29),
    .out (net38)
  );
  buffer_cell gate29 (
    .in (net8),
    .out (net39)
  );
  buffer_cell gate30 (
    .in (net37),
    .out (net41)
  );
endmodule
