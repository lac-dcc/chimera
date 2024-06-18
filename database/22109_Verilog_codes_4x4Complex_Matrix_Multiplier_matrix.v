// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module ComplexMatrixMultiplier(
  input [15:0] matrix_A_real ,
  input [15:0] matrix_A_imag ,
  input [15:0] matrix_B_real ,
  input [15:0] matrix_B_imag ,
  output [31:0] matrix_C_real ,
  output [31:0] matrix_C_imag 
);
  reg [31:0] temp_real ;
  reg [31:0] temp_imag ;
  integer i, j, k;

  always @* begin
    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1) begin
        temp_real[i * 4 + j] = 0;
        temp_imag[i * 4 + j] = 0;
        for (k = 0; k < 4; k = k + 1) begin
          temp_real[i * 4 + j] = temp_real[i * 4 + j] +
          (matrix_A_real[i * 4 + k] * matrix_B_real[k * 4 + j]) -
          (matrix_A_imag[i * 4 + k] * matrix_B_imag[k * 4 + j]);

          temp_imag[i * 4 + j] = temp_imag[i * 4 + j] +
          (matrix_A_real[i * 4 + k] * matrix_B_imag[k * 4 + j]) +
          (matrix_A_imag[i * 4 + k] * matrix_B_real[k * 4 + j]);

        end
      end
    end
  end

  assign matrix_C_real = temp_real;
  assign matrix_C_imag = temp_imag;
endmodule
