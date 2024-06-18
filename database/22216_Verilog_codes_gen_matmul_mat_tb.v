// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module MatrixMultiplier_Testbench;
  reg signed [7:0] a_real, a_imag, b_real, b_imag;
  wire signed [15:0] result_real, result_imag;

  // Define the size of the matrices
  parameter N = 4;

  MatrixMultiplier #(N) uut (
    .a_real(a_real),
    .a_imag(a_imag),
    .b_real(b_real),
    .b_imag(b_imag),
    .result_real(result_real),
    .result_imag(result_imag)
  );

  initial begin
    // Test case: a = [2, 3, 4, 5], b = [1, 2, 3, 4]
    // Multiply the matrices:
    // [ 2 + 3i, 3 + 4i, 4 + 5i, 5 + 6i ]
    // [ 1 + 2i, 2 + 3i, 3 + 4i, 4 + 5i ]
    // [ 2 + 3i, 3 + 4i, 4 + 5i, 5 + 6i ]
    // [ 1 + 2i, 2 + 3i, 3 + 4i, 4 + 5i ]

    // Set the values of matrix elements a and b
    a_real = 2;  a_imag = 3;
    b_real = 1;  b_imag = 2;
    #10;

    $display("Test case:");
    $display("Matrix A:");
    for (int i = 0; i < N; i = i + 1) begin
      for (int j = 0; j < N; j = j + 1) begin
        $display("%d + %di", a_real, a_imag);
        a_real = a_real + 1;  a_imag = a_imag + 1;
      end
    end

    $display("Matrix B:");
    for (int i = 0; i < N; i = i + 1) begin
      for (int j = 0; j < N; j = j + 1) begin
        $display("%d + %di", b_real, b_imag);
        b_real = b_real + 1;  b_imag = b_imag + 1;
      end
    end

    #10;

    $display("Result:");
    for (int i = 0; i < N; i = i + 1) begin
      for (int j = 0; j < N; j = j + 1) begin
        $display("%d + %di", result_real, result_imag);
        result_real = result_real + 1;  result_imag = result_imag + 1;
      end
    end

    $finish;
  end
endmodule
