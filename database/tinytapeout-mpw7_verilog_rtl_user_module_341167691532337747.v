// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341167691532337747 */

`default_nettype none

module user_module_341167691532337747(
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

  assign io_out[0] = net9;
  assign io_out[1] = net10;
  assign io_out[2] = net11;
  assign io_out[3] = net12;

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
    .a (net1),
    .b (net2),
    .sel (net6),
    .out (net16)
  );
  dff_cell flipflop1 (

  );
  mux_cell mux2 (
    .a (net3),
    .b (net4),
    .sel (net6),
    .out (net17)
  );
  mux_cell mux3 (
    .a (net16),
    .b (net17),
    .sel (net7),
    .out (net9)
  );
  mux_cell mux4 (
    .a (net2),
    .b (net3),
    .sel (net6),
    .out (net18)
  );
  mux_cell mux5 (
    .a (net4),
    .b (net19),
    .sel (net6),
    .out (net20)
  );
  mux_cell mux6 (
    .a (net18),
    .b (net20),
    .sel (net7),
    .out (net10)
  );
  mux_cell mux7 (
    .a (net3),
    .b (net4),
    .sel (net6),
    .out (net21)
  );
  mux_cell mux8 (
    .a (net22),
    .b (net23),
    .sel (net6),
    .out (net24)
  );
  mux_cell mux9 (
    .a (net21),
    .b (net24),
    .sel (net7),
    .out (net11)
  );
  mux_cell mux10 (
    .a (net4),
    .b (net25),
    .sel (net6),
    .out (net26)
  );
  mux_cell mux11 (
    .a (net27),
    .b (net28),
    .sel (net6),
    .out (net29)
  );
  mux_cell mux12 (
    .a (net26),
    .b (net29),
    .sel (net7),
    .out (net12)
  );
  mux_cell mux13 (
    .a (net8),
    .b (net1),
    .sel (net5),
    .out (net19)
  );
  mux_cell mux14 (
    .a (net8),
    .b (net1),
    .sel (net5),
    .out (net22)
  );
  mux_cell mux15 (
    .a (net8),
    .b (net2),
    .sel (net5),
    .out (net23)
  );
  mux_cell mux16 (
    .a (net8),
    .b (net1),
    .sel (net5),
    .out (net25)
  );
  mux_cell mux17 (
    .a (net8),
    .b (net2),
    .sel (net5),
    .out (net27)
  );
  mux_cell mux18 (
    .a (net8),
    .b (net3),
    .sel (net5),
    .out (net28)
  );
endmodule
