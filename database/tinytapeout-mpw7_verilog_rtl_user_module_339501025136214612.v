// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/339501025136214612 */

`default_nettype none

module user_module_339501025136214612(
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
  wire net9 = 1'b0;
  wire net10 = 1'b1;
  wire net11 = 1'b1;

  assign io_out[0] = net1;
  assign io_out[1] = net2;
  assign io_out[2] = net3;
  assign io_out[3] = net4;
  assign io_out[4] = net5;
  assign io_out[5] = net6;
  assign io_out[6] = net7;
  assign io_out[7] = net8;

endmodule
