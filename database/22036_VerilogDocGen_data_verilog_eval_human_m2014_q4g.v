// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module m2014_q4g (
  input in1,
  input in2,
  input in3,
  output logic out

);

  assign out = (~(in1 ^ in2)) ^ in3;
endmodule



