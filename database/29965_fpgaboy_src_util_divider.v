// This program was cloned from: https://github.com/trun/fpgaboy
// License: MIT License

`default_nettype none
`timescale 1ns / 1ps

module divider #(parameter DELAY=50000000) (
  input wire reset,
  input wire clock,
  output wire enable);
  
  reg  [31:0] count;
  wire [31:0] next_count;

  always @(posedge clock)
  begin
    if (reset)
      count <= 32'b0;
    else
      count <= next_count;
  end
  
  assign enable = (count == DELAY - 1) ? 1'b1 : 1'b0;
  assign next_count = (count == DELAY - 1) ? 32'b0 : count + 1;

endmodule
