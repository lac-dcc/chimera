// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341613097060926036 */

`default_nettype none

module user_module_341613097060926036(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2;
  wire net3 = 1'b1;
  wire net4;
  wire net5;
  wire net6 = 1'b0;
  wire net7 = 1'b1;
  wire net8 = 1'b1;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;

  assign io_out[0] = net2;
  assign io_out[1] = net3;
  assign io_out[2] = net3;
  assign io_out[3] = net4;
  assign io_out[4] = net5;
  assign io_out[5] = net2;
  assign io_out[6] = net5;

  and_cell gate1 (
    .a (net9),
    .b (net10),
    .out (net11)
  );
  or_cell gate2 (

  );
  xor_cell gate3 (

  );
  nand_cell gate4 (
    .a (net10),
    .b (net12),
    .out (net5)
  );
  not_cell gate5 (

  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (
    .d (net13),
    .clk (net1),
    .q (net12),
    .notq (net9)
  );
  dff_cell flipflop2 (
    .d (net11),
    .clk (net1),
    .q (net13),
    .notq (net10)
  );
  and_cell gate7 (
    .a (net10),
    .b (net9),
    .out (net2)
  );
  and_cell gate8 (
    .a (net13),
    .b (net9),
    .out (net4)
  );
endmodule
