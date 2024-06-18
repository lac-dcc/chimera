// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module always_if (
  input a,
  input b,
  input sel_b1,
  input sel_b2,
  output out_assign,
  output reg out_always

);

  assign out_assign = (sel_b1 & sel_b2) ? b : a;
  always @(*) out_always = (sel_b1 & sel_b2) ? b : a;

endmodule



