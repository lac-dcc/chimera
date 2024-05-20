// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module MatrixMultiplier #(parameter N = 4)(
  input signed [7:0] a_real, a_imag, b_real, b_imag,
  output signed [15:0] result_real, result_imag
);

  wire signed [15:0] temp_real [N-1:0][N-1:0];
  wire signed [15:0] temp_imag [N-1:0][N-1:0];

  genvar i, j, k;
  generate
    for (i = 0; i < N; i = i + 1) begin : gen_rows
      for (j = 0; j < N; j = j + 1) begin : gen_columns
        assign temp_real[i][j] = (a_real[i] * b_real[j]) - (a_imag[i] * b_imag[j]);
        assign temp_imag[i][j] = (a_real[i] * b_imag[j]) + (a_imag[i] * b_real[j]);
      end
    end
  endgenerate

  assign result_real = temp_real[0][0];
  assign result_imag = temp_imag[0][0];
  for (i = 0; i < N; i = i + 1) begin : sum_rows
    for (j = 0; j < N; j = j + 1) begin : sum_columns
      if (i != 0 || j != 0) begin
        assign result_real = result_real + temp_real[i][j];
        assign result_imag = result_imag + temp_imag[i][j];
      end
    end
  end

endmodule
