// This program was cloned from: https://github.com/conneroisu/single-cycle-mips-verilog
// License: MIT License

`timescale 1ns / 1ps
module ProgramCounter (
    input i_Clk,
    input [31:0] i_Next,  // the input address
    output reg [31:0] o_Out  // the output address
);
  initial begin
    o_Out = -4;
  end
  always @(posedge i_Clk) begin
    o_Out = i_Next;
  end
endmodule
