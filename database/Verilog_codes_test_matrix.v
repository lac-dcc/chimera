// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module MatrixMultiplier(
  input [7:0] a_real, // Real part of matrix A
  input [7:0] a_imag, // Imaginary part of matrix A
  input [7:0] b_real, // Real part of matrix B
  input [7:0] b_imag, // Imaginary part of matrix B
  output [15:0] result_real, // Real part of the result
  output [15:0] result_imag // Imaginary part of the result
);

  assign result_real = (a_real * b_real) - (a_imag * b_imag);
  assign result_imag = (a_real * b_imag) + (a_imag * b_real);

endmodule
