// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module shl2 (
    in,
    out
);

  parameter word_len = 32;

  input [word_len - 1 : 0] in;

  output [word_len - 1 : 0] out;

  assign out = in << 2;

endmodule
