// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module MatrixMultiplier_Testbench;

  reg signed [7:0] a_real, a_imag, b_real, b_imag;
  wire signed [15:0] result_real, result_imag;

  // Instantiate the MatrixMultiplier module for fixed-point calculation
  MatrixMultiplier #(0) uut_fixed (
    .a_real(a_real),
    .a_imag(a_imag),
    .b_real(b_real),
    .b_imag(b_imag),
    .result_real(result_real),
    .result_imag(result_imag)
  );

  // Instantiate the MatrixMultiplier module for floating-point calculation
  MatrixMultiplier #(1) uut_float (
    .a_real(a_real),
    .a_imag(a_imag),
    .b_real(b_real),
    .b_imag(b_imag),
    .result_real(result_real),
    .result_imag(result_imag)
  );

  initial begin
    // Test case 1: a = 3.3 + 3.3i, b = 6.6 + 6.6i
    a_real = 3.3;
    a_imag = 3.3;
    b_real = 6.6;
    b_imag = 6.6;
    #10;

    $display("Test case 1 (Floating-point):");
    $display("a = %0.1f + %0.1fi", a_real, a_imag);
    $display("b = %0.1f + %0.1fi", b_real, b_imag);
    $display("Result = %0.2f + %0.2fi", $itor(result_real), $itor(result_imag));
    $display("");

    // Test case 2: a = 3 + 4i, b = 2 + 2i
    a_real = 3;
    a_imag = 4;
    b_real = 2;
    b_imag = 2;
    #10;

    $display("Test case 2 (Fixed-point):");
    $display("a = %d + %di", a_real, a_imag);
    $display("b = %d + %di", b_real, b_imag);
    $display("Result = %d + %di", result_real, result_imag);
    $display("");

    // Add more test cases as needed

    $finish;
  end

endmodule
