// This program was cloned from: https://github.com/esda-inesc-id/pt-float
// License: MIT License

`timescale 1ns / 1ps

module iob_addsub
  #(
    parameter DATA_W = 32
    )
   (
    input [DATA_W-1:0]  op_a,
    input [DATA_W-1:0]  op_b,

    input               op,

    output [DATA_W-1:0] res,
    output              carry,
    output              overflow
    );

   wire [DATA_W:0]      res_int;
   assign res_int = {op_a[DATA_W-1], op_a} + ({(DATA_W+1){op}} ^ {op_b[DATA_W-1], op_b}) + {{(DATA_W){1'b0}}, op};

   assign res = res_int[DATA_W-1:0];
   assign carry = res_int[DATA_W];
   assign overflow = res_int[DATA_W] ^ res_int[DATA_W-1];

endmodule
