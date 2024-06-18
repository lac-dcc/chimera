// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module decoder_2to4(
  input wire en,
  input wire in0,
  input wire in1,
  output wire out0,
  output wire out1,
  output wire out2,
  output wire out3
);

  assign out0 = (~in1 & ~in0) & en;
  assign out1 = (~in1 & in0) & en;
  assign out2 = (in1 & ~in0) & en;
  assign out3 = (in1 & in0) & en;

endmodule