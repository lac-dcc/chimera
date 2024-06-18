// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341609034095264340 */

`default_nettype none

module user_module_341609034095264340(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[7];
  wire net4 = io_in[4];
  wire net5 = io_in[5];
  wire net6 = io_in[6];
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
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
  wire net25 = 1'b0;
  wire net26;
  wire net27;
  wire net28;
  wire net29;
  wire net30;
  wire net31;
  wire net32;
  wire net33;
  wire net34;
  wire net35 = 1'b0;
  wire net36;
  wire net37 = 1'b0;
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
  wire net59;
  wire net60;
  wire net61;
  wire net62;
  wire net63;
  wire net64;
  wire net65 = 1'b0;

  assign io_out[0] = net7;
  assign io_out[1] = net8;
  assign io_out[2] = net9;
  assign io_out[3] = net10;
  assign io_out[4] = net11;
  assign io_out[5] = net12;
  assign io_out[6] = net13;
  assign io_out[7] = net3;

  or_cell gate2 (

  );
  xor_cell gate3 (

  );
  nand_cell gate4 (

  );
  not_cell gate5 (

  );
  buffer_cell gate6 (
    .in (net4),
    .out (net16)
  );
  dff_cell flipflop1 (
    .d (net17),
    .clk (net1),
    .q (net18),
    .notq (net3)
  );
  dff_cell flipflop2 (
    .d (net19),
    .clk (net20),
    .q (net21),
    .notq (net6)
  );
  dff_cell flipflop3 (
    .d (net22),
    .clk (net23),
    .q (net24),
    .notq (net5)
  );
  mux_cell mux2 (
    .a (net18),
    .b (net1),
    .sel (net26),
    .out (net20)
  );
  mux_cell mux3 (
    .a (net21),
    .b (net1),
    .sel (net26),
    .out (net23)
  );
  or_cell gate8 (
    .a (net3),
    .b (net26),
    .out (net17)
  );
  or_cell gate9 (
    .a (net6),
    .b (net26),
    .out (net19)
  );
  or_cell gate10 (
    .a (net5),
    .b (net26),
    .out (net22)
  );
  dff_cell flipflop5 (
    .d (net27),
    .clk (net28),
    .notq (net4)
  );
  mux_cell mux4 (
    .a (net24),
    .b (net1),
    .sel (net26),
    .out (net28)
  );
  or_cell gate7 (
    .a (net4),
    .b (net26),
    .out (net27)
  );
  and_cell gate1 (
    .a (net29),
    .b (net30),
    .out (net31)
  );
  and_cell gate11 (
    .a (net32),
    .b (net4),
    .out (net33)
  );
  not_cell gate13 (
    .in (net6),
    .out (net30)
  );
  and_cell gate15 (
    .a (net31),
    .b (net33),
    .out (net34)
  );
  not_cell gate14 (
    .in (net5),
    .out (net32)
  );
  dff_cell flipflop6 (
    .d (net36),
    .clk (net1),
    .q (net26)
  );
  or_cell gate12 (
    .a (net34),
    .b (net2),
    .out (net36)
  );
  not_cell gate16 (
    .in (net3),
    .out (net29)
  );
  and_cell gate17 (

  );
  buffer_cell gate18 (

  );
  not_cell gate19 (
    .in (net4),
    .out (net38)
  );
  not_cell gate20 (
    .in (net5),
    .out (net39)
  );
  buffer_cell gate21 (
    .in (net5),
    .out (net40)
  );
  not_cell gate22 (
    .in (net6),
    .out (net41)
  );
  not_cell gate23 (
    .in (net3),
    .out (net42)
  );
  buffer_cell gate24 (
    .in (net6),
    .out (net43)
  );
  buffer_cell gate25 (
    .in (net3),
    .out (net44)
  );
  and_cell gate26 (
    .a (net38),
    .b (net41),
    .out (net45)
  );
  and_cell gate27 (
    .a (net45),
    .b (net44),
    .out (net7)
  );
  and_cell gate28 (
    .a (net38),
    .b (net39),
    .out (net46)
  );
  and_cell gate29 (
    .a (net41),
    .b (net42),
    .out (net47)
  );
  and_cell gate30 (
    .a (net46),
    .b (net47),
    .out (net48)
  );
  or_cell gate31 (
    .a (net48),
    .b (net49),
    .out (net50)
  );
  or_cell gate32 (
    .a (net50),
    .b (net51),
    .out (net8)
  );
  and_cell gate33 (
    .a (net16),
    .b (net44),
    .out (net51)
  );
  and_cell gate34 (
    .a (net40),
    .b (net41),
    .out (net52)
  );
  and_cell gate35 (
    .a (net52),
    .b (net44),
    .out (net49)
  );
  and_cell gate36 (
    .a (net40),
    .b (net42),
    .out (net53)
  );
  or_cell gate37 (
    .a (net53),
    .b (net51),
    .out (net54)
  );
  and_cell gate38 (
    .a (net45),
    .b (net42),
    .out (net55)
  );
  or_cell gate39 (
    .a (net55),
    .b (net52),
    .out (net56)
  );
  or_cell gate40 (
    .a (net56),
    .b (net54),
    .out (net9)
  );
  or_cell gate41 (
    .a (net16),
    .b (net52),
    .out (net57)
  );
  and_cell gate42 (
    .a (net43),
    .b (net42),
    .out (net58)
  );
  and_cell gate43 (
    .a (net39),
    .b (net44),
    .out (net59)
  );
  or_cell gate44 (
    .a (net59),
    .b (net58),
    .out (net60)
  );
  or_cell gate45 (
    .a (net57),
    .b (net60),
    .out (net10)
  );
  or_cell gate46 (
    .a (net39),
    .b (net43),
    .out (net61)
  );
  or_cell gate47 (
    .a (net61),
    .b (net42),
    .out (net11)
  );
  and_cell gate48 (
    .a (net39),
    .b (net42),
    .out (net62)
  );
  or_cell gate49 (
    .a (net46),
    .b (net62),
    .out (net12)
  );
  and_cell gate50 (
    .a (net41),
    .b (net44),
    .out (net63)
  );
  or_cell gate51 (
    .a (net45),
    .b (net63),
    .out (net64)
  );
  or_cell gate52 (
    .a (net40),
    .b (net64),
    .out (net13)
  );
endmodule
