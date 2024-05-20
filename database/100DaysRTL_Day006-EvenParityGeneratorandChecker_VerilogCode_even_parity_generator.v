// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module even_parity_generator (
  input wire [7:0] data_in,
  output wire parity
);

assign parity = ^data_in;

endmodule