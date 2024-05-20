// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341558189536313940 */

`default_nettype none

module user_module_341558189536313940(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[5];
  wire net4 = io_in[6];
  wire net5 = io_in[7];
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14 = 1'b0;
  wire net15 = 1'b1;
  wire net16 = 1'b1;
  wire net17;
  wire net18;
  wire net19;
  wire net20;
  wire net21;
  wire net22;
  wire net23;
  wire net24;
  wire net25 = 1'b1;
  wire net26;
  wire net27;
  wire net28;
  wire net29 = 1'b0;
  wire net30 = 1'b0;
  wire net31 = 1'b0;
  wire net32 = 1'b0;
  wire net33;
  wire net34 = 1'b0;
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
  wire net52 = 1'b0;
  wire net53 = 1'b0;
  wire net54 = 1'b0;
  wire net55 = 1'b0;
  wire net56 = 1'b0;
  wire net57 = 1'b0;
  wire net58 = 1'b0;

  assign io_out[0] = net6;
  assign io_out[1] = net7;
  assign io_out[2] = net8;
  assign io_out[3] = net9;
  assign io_out[4] = net10;
  assign io_out[5] = net11;
  assign io_out[6] = net12;
  assign io_out[7] = net13;

  or_cell gate2 (
    .a (net17),
    .b (net18),
    .out (net19)
  );
  not_cell gate5 (
    .in (net20),
    .out (net21)
  );
  buffer_cell gate6 (
    .in (net5),
    .out (net20)
  );
  dff_cell flipflop5 (
    .d (net8),
    .clk (net22),
    .q (net23),
    .notq (net24)
  );
  dff_cell flipflop6 (
    .d (net9),
    .clk (net23),
    .q (net26),
    .notq (net24)
  );
  dff_cell flipflop7 (
    .d (net10),
    .clk (net26),
    .q (net27),
    .notq (net24)
  );
  dff_cell flipflop8 (
    .d (net11),
    .clk (net27),
    .q (net28),
    .notq (net24)
  );
  not_cell gate7 (
    .in (net23),
    .out (net8)
  );
  not_cell gate8 (
    .in (net26),
    .out (net9)
  );
  not_cell gate9 (
    .in (net27),
    .out (net10)
  );
  not_cell gate10 (
    .in (net28),
    .out (net11)
  );
  dff_cell flipflop9 (
    .d (net12),
    .clk (net28),
    .q (net33)
  );
  not_cell gate11 (
    .in (net33),
    .out (net12)
  );
  and_cell gate12 (
    .a (net8),
    .b (net21),
    .out (net17)
  );
  and_cell gate13 (
    .a (net20),
    .b (net35),
    .out (net18)
  );
  dff_cell flipflop4 (
    .d (net19),
    .clk (net20),
    .q (net36)
  );
  or_cell gate14 (
    .a (net37),
    .b (net38),
    .out (net39)
  );
  and_cell gate15 (
    .a (net9),
    .b (net21),
    .out (net37)
  );
  and_cell gate16 (
    .a (net20),
    .b (net36),
    .out (net38)
  );
  dff_cell flipflop10 (
    .d (net39),
    .clk (net20),
    .q (net40)
  );
  or_cell gate17 (
    .a (net41),
    .b (net42),
    .out (net43)
  );
  and_cell gate18 (
    .a (net10),
    .b (net21),
    .out (net41)
  );
  and_cell gate19 (
    .a (net20),
    .b (net40),
    .out (net42)
  );
  dff_cell flipflop11 (
    .d (net43),
    .clk (net20),
    .q (net44)
  );
  or_cell gate20 (
    .a (net45),
    .b (net46),
    .out (net47)
  );
  and_cell gate21 (
    .a (net11),
    .b (net21),
    .out (net45)
  );
  and_cell gate22 (
    .a (net20),
    .b (net44),
    .out (net46)
  );
  dff_cell flipflop12 (
    .d (net47),
    .clk (net20),
    .q (net13)
  );
  or_cell gate23 (
    .a (net48),
    .b (net49),
    .out (net50)
  );
  and_cell gate24 (
    .a (net2),
    .b (net3),
    .out (net48)
  );
  and_cell gate25 (
    .a (net3),
    .b (net4),
    .out (net49)
  );
  dff_cell flipflop13 (
    .d (net50),
    .clk (net7),
    .q (net6)
  );
  dff_cell flipflop14 (
    .d (net51),
    .clk (net20),
    .q (net35)
  );
  and_cell gate26 (
    .a (net21),
    .b (net7),
    .out (net51)
  );
  dff_cell flipflop1 (
    .d (net7),
    .clk (net1),
    .q (net22),
    .notq (net24)
  );
  not_cell gate27 (
    .in (net22),
    .out (net7)
  );
endmodule
