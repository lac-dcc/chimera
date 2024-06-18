// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module be(
  input a, b, c, d,
  output z
);
  assign z = a & c | b & d;   // z = ab + cd
endmodule