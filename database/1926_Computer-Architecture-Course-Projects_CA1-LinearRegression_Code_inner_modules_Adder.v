// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module Adder (
    in1,
    in2,
    cin,
    result,
    cout
);
  parameter word_len = 8;
  input [word_len - 1 : 0] in1, in2;
  input cin;
  output [word_len - 1 : 0] result;
  output cout;
  assign {cout, result} = in1 + in2 + cin;
endmodule
