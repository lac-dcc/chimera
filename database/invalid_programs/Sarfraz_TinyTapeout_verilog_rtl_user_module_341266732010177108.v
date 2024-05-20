// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341266732010177108 */

`default_nettype none

module user_module_341266732010177108(
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

  assign io_out[2] = net9;
  assign io_out[3] = net10;

  or_cell gate2 (
    .a (net13),
    .b (net14),
    .out (net15)
  );
  xor_cell gate3 (
    .a (net1),
    .b (net2),
    .out (net16)
  );
  mux_cell gate6 (
    .a (net15),
    .b (net17),
    .sel (net4),
    .out (net18)
  );
  xor_cell gate8 (
    .a (net16),
    .b (net3),
    .out (net19)
  );
  and_cell gate1 (
    .a (net16),
    .b (net3),
    .out (net14)
  );
  and_cell gate7 (
    .a (net1),
    .b (net2),
    .out (net13)
  );
  xor_cell gate9 (
    .a (net19),
    .b (net4),
    .out (net20)
  );
  xor_cell gate10 (
    .a (net19),
    .b (net15),
    .out (net17)
  );
  and_cell gate11 (
    .a (net19),
    .b (net15),
    .out (net21)
  );
  and_cell gate12 (
    .a (net21),
    .b (net4),
    .out (net22)
  );
  xor_cell gate4 (
    .a (net20),
    .b (net5),
    .out (net23)
  );
  mux_cell gate5 (
    .a (net18),
    .b (net24),
    .sel (net5),
    .out (net25)
  );
  xor_cell gate13 (
    .a (net20),
    .b (net18),
    .out (net24)
  );
  or_cell gate14 (
    .a (net26),
    .b (net22),
    .out (net27)
  );
  and_cell gate15 (
    .a (net20),
    .b (net18),
    .out (net28)
  );
  and_cell gate16 (
    .a (net28),
    .b (net5),
    .out (net26)
  );
  xor_cell gate17 (
    .a (net23),
    .b (net6),
    .out (net29)
  );
  xor_cell gate18 (
    .a (net23),
    .b (net25),
    .out (net30)
  );
  mux_cell gate19 (
    .a (net25),
    .b (net30),
    .sel (net6),
    .out (net31)
  );
  and_cell gate20 (
    .a (net23),
    .b (net25),
    .out (net32)
  );
  and_cell gate21 (
    .a (net32),
    .b (net6),
    .out (net33)
  );
  or_cell gate22 (
    .a (net33),
    .b (net27),
    .out (net34)
  );
  xor_cell gate23 (
    .a (net29),
    .b (net7),
    .out (net35)
  );
  mux_cell gate24 (
    .a (net31),
    .b (net36),
    .sel (net7),
    .out (net37)
  );
  xor_cell gate25 (
    .a (net29),
    .b (net31),
    .out (net36)
  );
  or_cell gate26 (
    .a (net38),
    .b (net34),
    .out (net39)
  );
  and_cell gate27 (
    .a (net29),
    .b (net31),
    .out (net40)
  );
  and_cell gate28 (
    .a (net40),
    .b (net7),
    .out (net38)
  );
  xor_cell gate29 (
    .a (net35),
    .b (net8),
    .out (net41)
  );
  mux_cell gate30 (
    .a (net37),
    .b (net42),
    .sel (net8),
    .out (net43)
  );
  xor_cell gate31 (
    .a (net35),
    .b (net37),
    .out (net42)
  );
  or_cell gate32 (
    .a (net44),
    .b (net39),
    .out (net45)
  );
  and_cell gate33 (
    .a (net35),
    .b (net37),
    .out (net46)
  );
  and_cell gate34 (
    .a (net46),
    .b (net8),
    .out (net44)
  );
  not_cell gate35 (
    .in (net45),
    .out (net47)
  );
  and_cell gate36 (
    .a (net43),
    .b (net47),
    .out (net9)
  );
  and_cell gate37 (
    .a (net41),
    .b (net9),
    .out (net10)
  );
endmodule
