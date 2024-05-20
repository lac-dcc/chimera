// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module m2014_q4e (
  input in1,
  input in2,
  output logic out

);

  assign out = ~(in1 | in2);
endmodule



