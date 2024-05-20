// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module fadd (
  input a,
  input b,
  input cin,
  output cout,
  output sum

);

  assign {cout, sum} = a+b+cin;

endmodule



