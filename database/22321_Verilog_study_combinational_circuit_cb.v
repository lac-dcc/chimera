// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module cb(
  input [3:0] a, b, c, d,
  output [3:0] Arithmetic, Shift, Relational, Equality, Bitwise, Reduction, Logical, Concatenation, Conditional
);

  assign Arithmetic = b + c;
  assign Shift = b >> c;    // shift right b by c bits
  assign Relational = a > b;
  assign Equality = a == b;
  assign Bitwise = b & c;   // bitwise AND for all bits in b and c
  assign Reduction = &b;  // bitwise OR between all bits in b
  assign Logical = (a > b) || (a > d);
  assign Concatenation = {c[1:0], d[3:2]};
  assign Conditional = (a > b) ? a : b;

endmodule