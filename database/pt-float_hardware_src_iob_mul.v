// This program was cloned from: https://github.com/esda-inesc-id/pt-float
// License: MIT License

`timescale 1ns / 1ps

module iob_mul
  #(
    parameter DATA_W = 32
    )
   (
    input signed [DATA_W-1:0]    op_a,
    input signed [DATA_W-1:0]    op_b,

    output signed [2*DATA_W-1:0] res
    );

   assign res = op_a * op_b;

endmodule
