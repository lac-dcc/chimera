// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341500800901579348 */

`default_nettype none

module user_module_341500800901579348(
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[5] = net11;
  assign io_out[6] = net12;
  assign io_out[7] = net13;

  and_cell gate1 (
    .a (net15),
    .b (net4),
    .out (net16)
  );
  not_cell gate5 (
    .in (net1),
    .out (net17)
  );
  not_cell gate7 (
    .in (net2),
    .out (net18)
  );
  not_cell gate8 (
    .in (net3),
    .out (net15)
  );
  not_cell gate9 (
    .in (net4),
    .out (net19)
  );
  not_cell gate10 (
    .in (net5),
    .out (net20)
  );
  not_cell gate11 (
    .in (net6),
    .out (net21)
  );
  and_cell gate12 (
    .a (net3),
    .b (net19),
    .out (net22)
  );
  and_cell gate13 (
    .a (net1),
    .b (net18),
    .out (net23)
  );
  and_cell gate14 (
    .a (net17),
    .b (net2),
    .out (net24)
  );
  and_cell gate15 (
    .a (net20),
    .b (net6),
    .out (net25)
  );
  and_cell gate16 (
    .a (net5),
    .b (net21),
    .out (net26)
  );
  and_cell gate17 (
    .a (net27),
    .b (net8),
    .out (net28)
  );
  and_cell gate18 (
    .a (net7),
    .b (net29),
    .out (net30)
  );
  not_cell gate19 (
    .in (net7),
    .out (net27)
  );
  not_cell gate20 (
    .in (net8),
    .out (net29)
  );
  or_cell gate21 (
    .a (net28),
    .b (net30),
    .out (net31)
  );
  or_cell gate22 (
    .a (net25),
    .b (net26),
    .out (net32)
  );
  or_cell gate23 (
    .a (net16),
    .b (net22),
    .out (net33)
  );
  or_cell gate24 (
    .a (net24),
    .b (net23),
    .out (net34)
  );
  not_cell gate25 (
    .in (net34),
    .out (net35)
  );
  not_cell gate26 (
    .in (net33),
    .out (net36)
  );
  not_cell gate27 (
    .in (net32),
    .out (net37)
  );
  not_cell gate28 (
    .in (net31),
    .out (net38)
  );
  and_cell gate29 (
    .a (net35),
    .b (net22),
    .out (net39)
  );
  and_cell gate30 (
    .a (net40),
    .b (net37),
    .out (net41)
  );
  and_cell gate31 (
    .a (net35),
    .b (net16),
    .out (net42)
  );
  and_cell gate32 (
    .a (net35),
    .b (net36),
    .out (net40)
  );
  and_cell gate33 (
    .a (net40),
    .b (net25),
    .out (net43)
  );
  and_cell gate34 (
    .a (net40),
    .b (net26),
    .out (net44)
  );
  and_cell gate35 (
    .a (net41),
    .b (net28),
    .out (net45)
  );
  and_cell gate36 (
    .a (net41),
    .b (net38),
    .out (net13)
  );
  and_cell gate37 (
    .a (net41),
    .b (net30),
    .out (net46)
  );
  or_cell gate38 (
    .a (net23),
    .b (net39),
    .out (net47)
  );
  or_cell gate40 (
    .a (net44),
    .b (net46),
    .out (net48)
  );
  or_cell gate41 (
    .a (net47),
    .b (net48),
    .out (net12)
  );
  or_cell gate42 (
    .a (net24),
    .b (net42),
    .out (net49)
  );
  or_cell gate43 (
    .a (net43),
    .b (net45),
    .out (net50)
  );
  or_cell gate44 (
    .a (net49),
    .b (net50),
    .out (net11)
  );
  not_cell gate45 (
    .in (net17),
    .out (net51)
  );
  not_cell gate46 (
    .in (net51),
    .out (net9)
  );
  not_cell gate2 (
    .in (net2),
    .out (net52)
  );
  not_cell gate3 (
    .in (net52),
    .out (net53)
  );
  not_cell gate4 (
    .in (net53),
    .out (net54)
  );
  not_cell gate6 (
    .in (net54),
    .out (net55)
  );
  not_cell gate39 (
    .in (net55),
    .out (net10)
  );
endmodule
