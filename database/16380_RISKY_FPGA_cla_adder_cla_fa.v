// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module cla_fa (
  input a,
  input b,
  input cin,
  output s,
  output p,
  output g
);

 assign s = a^b^cin;
 assign p = a^b;
 assign g = a&b;

endmodule
