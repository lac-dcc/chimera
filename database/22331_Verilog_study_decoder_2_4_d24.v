// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module d24(
  input [1:0] a,
  input e,
  output [3:0] y
);

  assign y[3] = e & a[1] & a[0];
  assign y[2] = e & a[1] & (~a[0]);
  assign y[1] = e & (~a[1]) & a[0];
  assign y[0] = e & (~a[1]) & (~a[0]);

endmodule