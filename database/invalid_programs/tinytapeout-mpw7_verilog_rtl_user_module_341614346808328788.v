// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341614346808328788 */

`default_nettype none

module user_module_341614346808328788(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[1];
  wire net2 = io_in[2];
  wire net3 = io_in[3];
  wire net4 = io_in[4];
  wire net5 = io_in[5];
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11 = 1'b0;
  wire net12 = 1'b1;
  wire net13;
  wire net14;
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
  wire net29 = 1'b0;
  wire net30;
  wire net31;
  wire net32;

  assign io_out[0] = net6;
  assign io_out[1] = net7;
  assign io_out[2] = net7;
  assign io_out[3] = net6;
  assign io_out[4] = net8;
  assign io_out[5] = net8;
  assign io_out[6] = net9;
  assign io_out[7] = net10;

  or_cell gate2 (
    .a (net13),
    .b (net3),
    .out (net14)
  );
  not_cell gate7 (
    .in (net1),
    .out (net13)
  );
  or_cell gate8 (
    .a (net14),
    .b (net4),
    .out (net15)
  );
  not_cell gate9 (
    .in (net15),
    .out (net8)
  );
  and_cell gate10 (
    .a (net13),
    .b (net16),
    .out (net17)
  );
  not_cell gate11 (
    .in (net3),
    .out (net16)
  );
  or_cell gate12 (
    .a (net17),
    .b (net18),
    .out (net19)
  );
  or_cell gate13 (
    .a (net20),
    .b (net21),
    .out (net22)
  );
  or_cell gate14 (
    .a (net19),
    .b (net22),
    .out (net23)
  );
  and_cell gate15 (
    .a (net1),
    .b (net3),
    .out (net18)
  );
  not_cell gate16 (
    .in (net2),
    .out (net24)
  );
  and_cell gate17 (
    .a (net24),
    .b (net25),
    .out (net20)
  );
  not_cell gate18 (
    .in (net4),
    .out (net25)
  );
  and_cell gate19 (
    .a (net1),
    .b (net2),
    .out (net21)
  );
  not_cell gate20 (
    .in (net23),
    .out (net7)
  );
  nand_cell gate21 (
    .a (net15),
    .b (net23),
    .out (net6)
  );
  and_cell gate22 (
    .a (net1),
    .b (net2),
    .out (net26)
  );
  and_cell gate23 (
    .a (net3),
    .b (net4),
    .out (net27)
  );
  and_cell gate24 (
    .a (net26),
    .b (net27),
    .out (net28)
  );
  and_cell gate3 (
    .a (net1),
    .b (net30),
    .out (net31)
  );
  and_cell gate1 (
    .a (net5),
    .b (net32),
    .out (net9)
  );
  and_cell gate4 (
    .a (net3),
    .b (net4),
    .out (net30)
  );
  or_cell gate5 (
    .a (net28),
    .b (net9),
    .out (net10)
  );
  and_cell gate6 (
    .a (net31),
    .b (net24),
    .out (net32)
  );
endmodule
