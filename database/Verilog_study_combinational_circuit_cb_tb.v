// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns / 1ps
module cb_tb;
  reg [3:0] a, b, c, d;
  wire [3:0] Arithmetic, Shift, Relational, Equality, Bitwise, Reduction, Logical, Concatenation, Conditional;

  cb uut(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .Arithmetic(Arithmetic),
    .Shift(Shift),
    .Relational(Relational),
    .Equality(Equality),
    .Bitwise(Bitwise),
    .Reduction(Reduction),
    .Logical(Logical),
    .Concatenation(Concatenation),
    .Conditional(Conditional)
  );

  initial begin

    a = 4'b1100;
    b = 4'b0110;
    c = 4'b0010;
    d = 4'b1100;

    #10;
    $display("\nA: %4b", a, " | B: %4b", b, " | C: %4b", c, " | D: %4b", d, "\n");
    $display("Arithmetic: %4b", Arithmetic);
    $display("Shift: %4b", Shift);
    $display("Relational: %4b", Relational);
    $display("Equality: %4b", Equality);
    $display("Bitwise: %4b", Bitwise);
    $display("Reduction: %4b", Reduction);
    $display("Logical: %4b", Logical);
    $display("Concatenation: %4b", Concatenation);
    $display("Conditional: %4b", Conditional);
  end
endmodule