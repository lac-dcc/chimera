// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module MUX (
  input  [7:0] A,        // 4-bit input operand A
  input  [7:0] B,        // 4-bit input operand B
  input  MUX_Sel,       // Operation selector
  output [7:0] MUX_Reg   // 4-bit result
);

assign MUX_Reg = MUX_Sel ? B : A;  // Explicit assignment for clarity

endmodule
