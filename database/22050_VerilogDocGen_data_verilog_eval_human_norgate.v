// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module norgate(
  input a,
  input b,
  output out

);

  assign out = ~(a | b);

endmodule



