// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/339688086163161683 */

`default_nettype none

module user_module_339688086163161683(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
  wire net5;
  wire net6 = 1'b0;
  wire net7 = 1'b1;
  wire net8 = 1'b1;
  wire net9;
  wire net10;
  wire net11;
  wire net12;

  assign io_out[0] = net5;
  assign io_out[1] = net5;
  assign io_out[2] = net5;
  assign io_out[3] = net5;
  assign io_out[6] = net5;

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
  not_cell gate7 (
    .in (net9),
    .out (net5)
  );
  not_cell gate8 (
    .in (net10),
    .out (net9)
  );
  and_cell gate9 (
    .a (net1),
    .b (net2),
    .out (net11)
  );
  and_cell gate10 (
    .a (net3),
    .b (net4),
    .out (net12)
  );
  and_cell gate11 (
    .a (net11),
    .b (net12),
    .out (net10)
  );
endmodule
