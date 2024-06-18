// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module vector1 (
  input [15:0] in,
  output [7:0] out_hi,
  output [7:0] out_lo

);

  assign {out_hi, out_lo} = in;

endmodule



