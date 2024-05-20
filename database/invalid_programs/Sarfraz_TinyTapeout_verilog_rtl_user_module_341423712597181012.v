// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341423712597181012 */

`default_nettype none

module user_module_341423712597181012(
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
  wire net24 = 1'b0;
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;

  not_cell gate7 (
    .in (net4),
    .out (net16)
  );
  dff_cell flipflop3 (
    .d (net17),
    .clk (net1),
    .q (net12),
    .notq (net18)
  );
  xor_cell gate8 (
    .a (net2),
    .b (net12),
    .out (net19)
  );
  mux_cell mux2 (
    .a (net19),
    .b (net8),
    .sel (net3),
    .out (net17)
  );
  and_cell gate12 (
    .a (net2),
    .b (net20),
    .out (net21)
  );
  or_cell gate10 (
    .a (net22),
    .b (net23),
    .out (net20)
  );
  and_cell gate11 (
    .a (net16),
    .b (net12),
    .out (net22)
  );
  and_cell gate13 (
    .a (net4),
    .b (net18),
    .out (net23)
  );
  dff_cell flipflop2 (
    .d (net25),
    .clk (net1),
    .q (net11),
    .notq (net26)
  );
  xor_cell gate15 (
    .a (net21),
    .b (net11),
    .out (net27)
  );
  mux_cell mux3 (
    .a (net27),
    .b (net7),
    .sel (net3),
    .out (net25)
  );
  and_cell gate16 (
    .a (net21),
    .b (net28),
    .out (net29)
  );
  or_cell gate17 (
    .a (net30),
    .b (net31),
    .out (net28)
  );
  and_cell gate18 (
    .a (net22),
    .b (net11),
    .out (net30)
  );
  and_cell gate19 (
    .a (net23),
    .b (net26),
    .out (net31)
  );
  dff_cell flipflop4 (
    .d (net32),
    .clk (net1),
    .q (net10),
    .notq (net33)
  );
  xor_cell gate14 (
    .a (net29),
    .b (net10),
    .out (net34)
  );
  mux_cell mux4 (
    .a (net34),
    .b (net6),
    .sel (net3),
    .out (net32)
  );
  and_cell gate20 (
    .a (net29),
    .b (net35),
    .out (net36)
  );
  or_cell gate21 (
    .a (net37),
    .b (net38),
    .out (net35)
  );
  and_cell gate22 (
    .a (net30),
    .b (net10),
    .out (net37)
  );
  and_cell gate23 (
    .a (net31),
    .b (net33),
    .out (net38)
  );
  dff_cell flipflop5 (
    .d (net39),
    .clk (net1),
    .q (net9)
  );
  xor_cell gate24 (
    .a (net36),
    .b (net9),
    .out (net40)
  );
  mux_cell mux5 (
    .a (net40),
    .b (net5),
    .sel (net3),
    .out (net39)
  );
endmodule
