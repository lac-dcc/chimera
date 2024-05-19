// This program was cloned from: https://github.com/neelkshah/MIPS-Processor
// License: GNU General Public License v3.0

module JumpConcat(out, Jump, PC);
  input [31:0] Jump, PC;
  output [31:0] out;
  assign {out} = {{PC[31:28]}, {Jump[27:0]}};
endmodule