// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module vector4 (
  input [7:0] in,
  output [31:0] out

);

  assign out = { {24{in[7]}}, in };

endmodule



