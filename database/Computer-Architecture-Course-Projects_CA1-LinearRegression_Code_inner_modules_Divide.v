// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module Divide (
    dividend,
    divisor,
    result
);

  parameter word_len = 8;

  input [word_len - 1 : 0] dividend, divisor;
  output [word_len - 1 : 0] result;
  assign result = dividend / divisor;

endmodule
