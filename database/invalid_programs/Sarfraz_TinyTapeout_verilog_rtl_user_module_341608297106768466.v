// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341608297106768466 */

`default_nettype none

module user_module_341608297106768466(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4;
  wire net5 = 1'b0;
  wire net6 = 1'b1;
  wire net7 = 1'b1;
  wire net8;

  assign io_out[0] = net4;

  and_cell gate1 (
    .a (net1),
    .b (net2),
    .out (net8)
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
  and_cell gate7 (
    .a (net8),
    .b (net3),
    .out (net4)
  );
endmodule
