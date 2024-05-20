// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module vector2 (
  input [31:0] in,
  output [31:0] out

);

  assign out = {in[7:0], in[15:8], in[23:16], in[31:24]};

endmodule



