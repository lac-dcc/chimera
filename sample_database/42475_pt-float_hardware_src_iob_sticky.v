// This program was cloned from: https://github.com/esda-inesc-id/pt-float
// License: MIT License

`timescale 1ns / 1ps

module iob_sticky
  #(
    parameter DATA_W  = 32,
    parameter SHIFT_W = DATA_W
    )
   (
    input [DATA_W-1:0]  man_i,
    input [SHIFT_W-1:0] shift_i,

    output              sticky_o
    );

   wire [DATA_W-1:0]    shift_int;
   assign shift_int = {{(DATA_W - SHIFT_W){1'b0}}, shift_i};

   wire [DATA_W-1:0]    mask;
   iob_mask
     #(
       .DATA_W (DATA_W)
       )
   mask0
     (
      .maskl_i (shift_int),
      .mask_o  (mask)
      );

   assign sticky_o = |(man_i & mask);

endmodule
