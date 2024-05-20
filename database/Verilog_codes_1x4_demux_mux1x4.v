// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module demux_1x4 (
  input wire in,
  input wire sel0,
  input wire sel1,
  output wire out0,
  output wire out1,
  output wire out2,
  output wire out3
);

  assign out0 = (~sel1 & ~sel0 & in);
  assign out1 = (~sel1 & sel0 & in);
  assign out2 = (sel1 & ~sel0 & in);
  assign out3 = (sel1 & sel0 & in);

endmodule