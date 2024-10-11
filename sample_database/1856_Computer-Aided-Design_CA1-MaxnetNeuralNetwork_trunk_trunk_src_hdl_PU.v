// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module PU (
    clk, rst, a1, a2, a3, a4, result_signal, w1, w2, w3, w4, result);

  input clk, rst, result_signal;
  input [31:0] a1, a2, a3, a4, w1, w2, w3, w4;
  wire [31:0] mult1, mult2, mult3, mult4;
  wire [31:0] sum1, sum2, sum3, sum_result;
  output [31:0] result;


  ieee754_multiplier M1 (
               .a  (a1),
               .b  (w1),
               .result(mult1)
             );

  ieee754_multiplier M2 (
               .a  (a2),
               .b  (w2),
               .result(mult2)
             );

  ieee754_multiplier M3 (
               .a  (a3),
               .b  (w3),
               .result(mult3)
             );

  ieee754_multiplier M4 (
               .a  (a4),
               .b  (w4),
               .result(mult4)
             );

  Adder32 A1 (
          .a  (mult1),
          .b  (mult2),
          .result(sum1)
        );

  Adder32 A2 (
          .a  (mult3),
          .b  (mult4),
          .result(sum2)
        );

  Adder32 A3 (
          .a  (sum1),
          .b  (sum2),
          .result(sum3)
        );

  Register result_reg (
             .clk(clk),
             .rst(rst),
             .ld (result_signal),
             .din (sum3),
             .dout(sum_result)
           );

  assign result = (sum_result[31] == 1'b1) ? 32'd0 : sum_result;

endmodule
