// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module Adder (
    a,
    b,
    result
);
  parameter word_len = 32;

  input [word_len - 1 : 0] a, b;

  output [word_len - 1 : 0] result;

  assign result = a + b;
endmodule
