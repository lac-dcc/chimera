// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module MatrixMultiplier_Testbench;
  reg [7:0] a_real, a_imag, b_real, b_imag;
  wire [15:0] result_real, result_imag;

  MatrixMultiplier uut(
    .a_real(a_real),
    .a_imag(a_imag),
    .b_real(b_real),
    .b_imag(b_imag),
    .result_real(result_real),
    .result_imag(result_imag)
  );

  initial begin
    // Test case 1: a = 2 + 3i, b = 4 + 5i
    a_real = 2;
    a_imag = 3;
    b_real = 4;
    b_imag = 5;
    #10;

    $display("Test case 1:");
    $display("a = %d + %di", a_real, a_imag);
    $display("b = %d + %di", b_real, b_imag);
    $display("Result = %d + %di", result_real, result_imag);
    $display("");

    // Test case 2: a = 1 + 1i, b = 1 + 1i
    a_real = 1;
    a_imag = 1;
    b_real = 1;
    b_imag = 1;
    #10;

    $display("Test case 2:");
    $display("a = %d + %di", a_real, a_imag);
    $display("b = %d + %di", b_real, b_imag);
    $display("Result = %d + %di", result_real, result_imag);
    $display("");

    a_real = 1;
    a_imag = 2;
    b_real = 1;
    b_imag = 2;
    #10;

    $display("Test case 2:");
    $display("a = %d + %di", a_real, a_imag);
    $display("b = %d + %di", b_real, b_imag);
    $display("Result = %d + %di", result_real, result_imag);
    $display("");
    $finish;
  end
endmodule
