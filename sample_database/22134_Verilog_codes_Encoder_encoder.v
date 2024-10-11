// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module encoder_4to2 (
  input wire in0,
  input wire in1,
  input wire in2,
  input wire in3,
  output wire out0,
  output wire out1
);

  assign out0 = (in3 | in2);
  assign out1 = (in3 | in1);

endmodule