// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341192113929585235 */

`default_nettype none

module user_module_341192113929585235(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3;
  wire net4 = 1'b0;
  wire net5 = 1'b1;
  wire net6 = 1'b1;
  wire net7;

  assign io_out[0] = net3;

  and_cell gate1 (

  );
  or_cell gate2 (
    .a (net1),
    .b (net2),
    .out (net7)
  );
  xor_cell gate3 (

  );
  nand_cell gate4 (

  );
  not_cell gate5 (
    .in (net7),
    .out (net3)
  );
  buffer_cell gate6 (

  );
  mux_cell mux1 (

  );
  dff_cell flipflop1 (

  );
endmodule
