// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`define _add 2'd0
`define _sub 2'd1
`define _and 2'd2
`define _or 2'd3

module ALU (
    in1,
    in2,
    op_code,
    result,
    zer_flag,
    neg_flag
);
  parameter word_len = 32;
  input [word_len - 1 : 0] in1, in2;
  input [1:0] op_code;

  output [word_len - 1 : 0] result;
  output zer_flag, neg_flag;

  assign neg_flag = result[31];
  assign zer_flag = (result == 32'b0);

  assign result = (op_code == `_add) ? in1 + in2 :
    (op_code == `_sub) ? in1 - in2 :
    (op_code == `_and) ? in1 & in2 :
    (op_code == `_or) ? in1 | in2 :
    'bx;
endmodule
