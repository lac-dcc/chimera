// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341631644820570706 */

`default_nettype none

module user_module_341631644820570706(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2;
  wire net3;
  wire net4;
  wire net5 = 1'b1;
  wire net6 = 1'b0;
  wire net7 = 1'b1;
  wire net8 = 1'b1;
  wire net9;
  wire net10;
  wire net11;

  assign io_out[0] = net2;
  assign io_out[1] = net3;
  assign io_out[2] = net3;
  assign io_out[3] = net4;
  assign io_out[4] = net5;
  assign io_out[5] = net5;
  assign io_out[6] = net2;

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

  );
  dff_cell flipflop1 (

  );
  dff_cell flipflop2 (
    .d (net9),
    .clk (net1),
    .q (net2),
    .notq (net10)
  );
  dff_cell flipflop3 (
    .d (net2),
    .clk (net1),
    .q (net11),
    .notq (net9)
  );
  xor_cell gate7 (
    .a (net11),
    .b (net10),
    .out (net4)
  );
  or_cell gate8 (
    .a (net2),
    .b (net11),
    .out (net3)
  );
endmodule
