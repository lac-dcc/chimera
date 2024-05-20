// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341573751072096850 */

`default_nettype none

module user_module_341573751072096850(
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
  wire net10 = 1'b1;
  wire net11 = 1'b1;
  wire net12;
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
  wire net23 = 1'b0;
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
  wire net34 = 1'b0;
  wire net35 = 1'b0;
  wire net36 = 1'b0;
  wire net37 = 1'b0;
  wire net38 = 1'b0;
  wire net39 = 1'b0;
  wire net40 = 1'b0;
  wire net41 = 1'b0;
  wire net42 = 1'b0;
  wire net43;
  wire net44 = 1'b0;
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
  wire net59;
  wire net60;
  wire net61;
  wire net62;
  wire net63;
  wire net64;
  wire net65;
  wire net66;
  wire net67;
  wire net68;
  wire net69;
  wire net70;
  wire net71;
  wire net72;
  wire net73;
  wire net74;
  wire net75;
  wire net76;
  wire net77;

  assign io_out[0] = net3;
  assign io_out[1] = net4;
  assign io_out[2] = net5;
  assign io_out[3] = net6;
  assign io_out[4] = net7;
  assign io_out[5] = net8;
  assign io_out[6] = net9;

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
  dff_cell flipflop1 (
    .d (net12),
    .clk (net1),
    .q (net13),
    .notq (net14)
  );
  dff_cell flipflop2 (
    .d (net15),
    .clk (net16),
    .q (net17),
    .notq (net18)
  );
  dff_cell flipflop3 (
    .d (net19),
    .clk (net20),
    .q (net21),
    .notq (net22)
  );
  mux_cell mux2 (
    .a (net13),
    .b (net1),
    .sel (net24),
    .out (net16)
  );
  mux_cell mux3 (
    .a (net17),
    .b (net1),
    .sel (net24),
    .out (net20)
  );
  or_cell gate8 (
    .a (net14),
    .b (net24),
    .out (net12)
  );
  or_cell gate9 (
    .a (net18),
    .b (net24),
    .out (net15)
  );
  or_cell gate10 (
    .a (net22),
    .b (net24),
    .out (net19)
  );
  dff_cell flipflop5 (
    .d (net25),
    .clk (net26),
    .notq (net27)
  );
  mux_cell mux4 (
    .a (net21),
    .b (net1),
    .sel (net24),
    .out (net26)
  );
  or_cell gate7 (
    .a (net27),
    .b (net24),
    .out (net25)
  );
  and_cell gate1 (
    .a (net28),
    .b (net29),
    .out (net30)
  );
  and_cell gate11 (
    .a (net31),
    .b (net27),
    .out (net32)
  );
  not_cell gate13 (
    .in (net18),
    .out (net29)
  );
  and_cell gate15 (
    .a (net30),
    .b (net32),
    .out (net33)
  );
  not_cell gate14 (
    .in (net22),
    .out (net31)
  );
  dff_cell flipflop6 (
    .d (net43),
    .clk (net1),
    .q (net24)
  );
  or_cell gate12 (
    .a (net33),
    .b (net2),
    .out (net43)
  );
  not_cell gate16 (
    .in (net14),
    .out (net28)
  );
  not_cell gate17 (
    .in (net14),
    .out (net45)
  );
  buffer_cell gate18 (
    .in (net14),
    .out (net46)
  );
  not_cell gate19 (
    .in (net18),
    .out (net47)
  );
  buffer_cell gate20 (
    .in (net18),
    .out (net48)
  );
  not_cell gate21 (
    .in (net22),
    .out (net49)
  );
  buffer_cell gate22 (
    .in (net22),
    .out (net50)
  );
  not_cell gate23 (
    .in (net27)
  );
  buffer_cell gate24 (
    .in (net27),
    .out (net51)
  );
  and_cell gate25 (
    .a (net49),
    .b (net45),
    .out (net52)
  );
  and_cell gate26 (
    .a (net48),
    .b (net45),
    .out (net53)
  );
  or_cell gate27 (
    .a (net52),
    .b (net53),
    .out (net7)
  );
  or_cell gate28 (
    .a (net52),
    .b (net48),
    .out (net54)
  );
  or_cell gate29 (
    .a (net51),
    .b (net55),
    .out (net56)
  );
  or_cell gate30 (
    .a (net54),
    .b (net56),
    .out (net3)
  );
  and_cell gate31 (
    .a (net50),
    .b (net46),
    .out (net55)
  );
  or_cell gate32 (
    .a (net57),
    .b (net58),
    .out (net4)
  );
  or_cell gate33 (
    .a (net49),
    .b (net59),
    .out (net58)
  );
  and_cell gate34 (
    .a (net48),
    .b (net46),
    .out (net59)
  );
  and_cell gate35 (
    .a (net47),
    .b (net45),
    .out (net57)
  );
  or_cell gate36 (
    .a (net47),
    .b (net60),
    .out (net5)
  );
  or_cell gate37 (
    .a (net50),
    .b (net46),
    .out (net60)
  );
  or_cell gate38 (
    .a (net52),
    .b (net61),
    .out (net62)
  );
  and_cell gate39 (
    .a (net49),
    .b (net48),
    .out (net61)
  );
  or_cell gate40 (
    .a (net51),
    .b (net63),
    .out (net64)
  );
  or_cell gate41 (
    .a (net65),
    .b (net66),
    .out (net63)
  );
  or_cell gate42 (
    .a (net62),
    .b (net64),
    .out (net6)
  );
  and_cell gate43 (
    .a (net50),
    .b (net67),
    .out (net66)
  );
  and_cell gate44 (
    .a (net48),
    .b (net45),
    .out (net65)
  );
  and_cell gate45 (
    .a (net47),
    .b (net46),
    .out (net67)
  );
  or_cell gate46 (
    .a (net68),
    .b (net69),
    .out (net8)
  );
  or_cell gate47 (
    .a (net70),
    .b (net71),
    .out (net68)
  );
  or_cell gate48 (
    .a (net51),
    .b (net72),
    .out (net69)
  );
  and_cell gate49 (
    .a (net47),
    .b (net45),
    .out (net70)
  );
  and_cell gate50 (
    .a (net50),
    .b (net47),
    .out (net71)
  );
  and_cell gate51 (
    .a (net50),
    .b (net45),
    .out (net72)
  );
  or_cell gate52 (
    .a (net73),
    .b (net74),
    .out (net9)
  );
  or_cell gate53 (
    .a (net75),
    .b (net76),
    .out (net73)
  );
  or_cell gate54 (
    .a (net51),
    .b (net77),
    .out (net74)
  );
  and_cell gate55 (
    .a (net49),
    .b (net48),
    .out (net75)
  );
  and_cell gate56 (
    .a (net50),
    .b (net47),
    .out (net76)
  );
  and_cell gate57 (
    .a (net50),
    .b (net45),
    .out (net77)
  );
endmodule
