// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module reduction (
  input [7:0] in,
  output parity

);

  assign parity = ^in;

endmodule



