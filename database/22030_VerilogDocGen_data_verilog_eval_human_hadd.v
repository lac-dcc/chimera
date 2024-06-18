// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module hadd (
  input a,
  input b,
  output sum,
  output cout

);

  assign {cout, sum} = a+b;

endmodule



