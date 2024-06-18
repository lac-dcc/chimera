// This program was cloned from: https://github.com/esda-inesc-id/pt-float
// License: MIT License

`timescale 1ns / 1ps

module iob_norm
  #(
    parameter EXP_W  = 8,
    parameter DATA_W = 32
    )
   (
    input [EXP_W-1:0]   exp_i,
    input [DATA_W-1:0]  man_i,

    output [EXP_W-1:0]  exp_o,
    output [DATA_W-1:0] man_o
    );

   wire [$clog2(DATA_W+1)-1:0] lds;
   iob_cls
     #(DATA_W)
   cls
   (
    .data_i  (man_i),
    .count_o (lds)
    );

   assign exp_o = exp_i - lds;
   assign man_o = man_i << lds;

endmodule
