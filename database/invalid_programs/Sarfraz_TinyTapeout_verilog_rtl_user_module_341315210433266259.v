// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341315210433266259 */

`default_nettype none

module user_module_341315210433266259(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3;
  wire net4;
  wire net5;
  wire net6;
  wire net7 = 1'b1;
  wire net8 = 1'b1;
  wire net9;
  wire net10;
  wire net11 = 1'b1;
  wire net12;
  wire net13;

  assign io_out[0] = net3;
  assign io_out[1] = net4;
  assign io_out[2] = net5;
  assign io_out[3] = net6;

  and_cell gate1 (
    .a (net9),
    .b (net10),
    .out (net4)
  );
  dff_cell flipflop2 (
    .d (net3),
    .clk (net12),
    .q (net10)
  );
  dff_cell flipflop3 (
    .d (net10),
    .clk (net12),
    .q (net5),
    .notq (net13)
  );
  dff_cell flipflop4 (
    .d (net5),
    .clk (net12),
    .q (net9),
    .notq (net3)
  );
  nand_cell gate7 (
    .a (net10),
    .b (net13),
    .out (net6)
  );
  and_cell gate9 (
    .a (net1),
    .b (net2),
    .out (net12)
  );
endmodule
