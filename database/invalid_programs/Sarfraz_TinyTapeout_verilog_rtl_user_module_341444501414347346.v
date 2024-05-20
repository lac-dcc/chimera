// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341444501414347346 */

`default_nettype none

module user_module_341444501414347346(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[1];
  wire net2 = io_in[2];
  wire net3 = io_in[3];
  wire net4 = io_in[6];
  wire net5 = io_in[7];
  wire net6;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12 = 1'b1;
  wire net13 = 1'b1;
  wire net14 = 1'b0;
  wire net15;
  wire net16;

  assign io_out[0] = net6;
  assign io_out[1] = net7;
  assign io_out[4] = net8;
  assign io_out[5] = net9;
  assign io_out[6] = net10;
  assign io_out[7] = net11;

  or_cell gate7 (
    .a (net1),
    .b (net3),
    .out (net6)
  );
  or_cell gate8 (
    .a (net2),
    .b (net3),
    .out (net7)
  );
  not_cell gate9 (
    .in (net4),
    .out (net15)
  );
  not_cell gate10 (
    .in (net5),
    .out (net16)
  );
  and_cell gate11 (
    .a (net15),
    .b (net16),
    .out (net8)
  );
  and_cell gate12 (
    .a (net4),
    .b (net16),
    .out (net10)
  );
  and_cell gate13 (
    .a (net5),
    .b (net15),
    .out (net9)
  );
  and_cell gate14 (
    .a (net4),
    .b (net5),
    .out (net11)
  );
endmodule
