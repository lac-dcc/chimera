// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../../network_params.h"
module add_np_mm(
  input clock,
  input reset,

  input [`FFN_OUT_BITWIDTH:0] operand_a,
  input [`FFN_OUT_BITWIDTH:0] operand_b,
  output [`FFN_OUT_BITWIDTH:0] sum
);

//wire [`FFN_OUT_BITWIDTH+1:0] sum_c; // sum with carry
//assign sum_c = operand_a + operand_b;
//assign overflow = sum_c[`FFN_OUT_BITWIDTH+1];
assign sum = operand_a + operand_b;
//assign sum = sum_c[`FFN_OUT_BITWIDTH:0];
endmodule
