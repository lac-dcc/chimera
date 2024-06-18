// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module popcount3 (
  input [2:0] in,
  output [1:0] out

);

  assign out = in[0]+in[1]+in[2];

endmodule



