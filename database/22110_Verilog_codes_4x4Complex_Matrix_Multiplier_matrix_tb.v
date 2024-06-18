// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module ComplexMatrixMultiplier_TB;
  reg [15:0] matrix_A_real ;
  reg [15:0] matrix_A_imag ;
  reg [15:0] matrix_B_real ;
  reg [15:0] matrix_B_imag ;
  wire [31:0] matrix_C_real ;
  wire [31:0] matrix_C_imag ;

  integer i, j;
  
  ComplexMatrixMultiplier dut (
    .matrix_A_real(matrix_A_real),
    .matrix_A_imag(matrix_A_imag),
    .matrix_B_real(matrix_B_real),
    .matrix_B_imag(matrix_B_imag),
    .matrix_C_real(matrix_C_real),
    .matrix_C_imag(matrix_C_imag)
  );

  initial begin
    // Initialize input matrices with random data
    for (i = 0; i < 16; i = i + 1) begin
      matrix_A_real[i] = $random;
      matrix_A_imag[i] = $random;
      matrix_B_real[i] = $random;
      matrix_B_imag[i] = $random;
    end

    #10; // Allow some time for the calculations to complete

    // Display the input and output matrices
    $display("Matrix A:");
    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1)
        $write("(%d + j%d) ", matrix_A_real[i * 4 + j], matrix_A_imag[i * 4 + j]);
      $display("");
    end

    $display("\nMatrix B:");
    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1)
        $write("(%d + j%d) ", matrix_B_real[i * 4 + j], matrix_B_imag[i * 4 + j]);
      $display("");
    end

    $display("\nMatrix C:");
    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1)
        $write("(%d + j%d) ", matrix_C_real[i * 4 + j], matrix_C_imag[i * 4 + j]);
      $display("");
    end
    
    $finish;
  end
endmodule