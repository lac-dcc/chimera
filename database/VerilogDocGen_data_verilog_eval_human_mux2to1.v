// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module mux2to1 (
  input a,
  input b,
  input sel,
  output out

);

  assign out = sel ? b : a;

endmodule



