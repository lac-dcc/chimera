// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module alu (
    input [15:0] a,
    input [15:0] b,
    input        multiply,

    output [15:0] result,
    output        overflow
);

  wire [16:0] result_add = a + b;
  wire [31:0] result_mul = a * b;

  assign result   = multiply ?  result_mul[15: 0] : result_add[15:0];
  assign overflow = multiply ? |result_mul[31:16] : result_add[16];

endmodule
