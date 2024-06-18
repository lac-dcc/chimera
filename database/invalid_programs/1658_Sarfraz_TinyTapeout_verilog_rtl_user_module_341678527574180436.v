// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341678527574180436 */

`default_nettype none

module user_module_341678527574180436(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3;
  wire net4 = 1'b0;
  wire net5 = 1'b1;
  wire net6 = 1'b1;

  assign io_out[0] = net3;

  and_cell gate1 (
    .a (net1),
    .b (net2),
    .out (net3)
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
endmodule
