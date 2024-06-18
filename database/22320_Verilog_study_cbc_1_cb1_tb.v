// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns/1ps

module cb1_tb;
  reg d1, x1, a1;
  wire l1;

  cb1 uut(
    .d(d1),
    .x(x1),
    .a(a1),
    .l(l1)
  );

  initial begin
    d1 = 0;
    x1 = 0;
    a1 = 0;

    #10 d1 = 0; x1 = 0; a1 = 1;
    #10 d1 = 0; x1 = 1; a1 = 0;
    #10 d1 = 0; x1 = 1; a1 = 1;
    #10 d1 = 1; x1 = 0; a1 = 0;
    #10 d1 = 1; x1 = 0; a1 = 1;
    #10 d1 = 1; x1 = 1; a1 = 0;
    #10 d1 = 1; x1 = 1; a1 = 1;
    #10;
    $display("+---------------+");
  end

  initial begin
    $display("+---------------+");
    $display("| D | X | A | L |");
    $display("+---+---+---+---+");
    $monitor("| %b | %b | %b | %b |", d1, x1, a1, l1);
  end
endmodule