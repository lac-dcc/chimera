// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module mt2015_eq2(
  input [1:0] A,
  input [1:0] B,
  output z
);

  assign z = A[1:0]==B[1:0];

endmodule



