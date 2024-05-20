// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module Equal (
    a,
    b,
    is_equal
);

  parameter word_len = 32;

  input [word_len - 1:0] a, b;
  output is_equal;

  assign is_equal = a == b;
endmodule
