// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module ece241_2013_q2 (
  input a,
  input b,
  input c,
  input d,
  output out_sop,
  output out_pos

);

  wire pos0, pos1;
  assign out_sop = c&d | ~a&~b&c;
  assign pos0 = c & (~b|d)&(~a|b);
  assign pos1 = c & (~b|d)&(~a|d);

  assign out_pos = (pos0 == pos1) ? pos0 : 1'bx;
endmodule



