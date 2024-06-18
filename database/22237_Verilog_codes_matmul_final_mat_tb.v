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
    // Test case 1: a = 2.5 + 3.5i, b = 4.2 + 5.2i
    a_real = 2.5;
    a_imag = 3.5;
    b_real = 4.2;
    b_imag = 5.2;
    #10;

    $display("Test case 1 (Floating-point):");
    $display("a = %0d.%0d + %0d.%0di", a_real, a_imag, a_real, a_imag);
    $display("b = %0d.%0d + %0d.%0di", b_real, b_imag, b_real, b_imag);
    $display("Result = %0d.%0d + %0d.%0di", result_real, result_imag, result_real, result_imag);
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
