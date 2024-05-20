// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module subOne(
  input wire [3:0] i,
  output wire [3:0] o
);
  assign o = i - 1;
endmodule