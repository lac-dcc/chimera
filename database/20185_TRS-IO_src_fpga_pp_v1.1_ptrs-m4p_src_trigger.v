// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module trigger(
  input clk,
  input cond,
  output one,
  output reg two,
  output reg three);

assign one = cond;

always @(posedge clk) begin
  two <= one;
  three <= two;
end

endmodule
