// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../../network_params.h"
module mult_np_mm( // Multiply 2 fixed point numbers
  input clock,
  input reset,

  input signed [`FFN_IN_BITWIDTH:0] operand_a,
  input signed [`FFN_IN_BITWIDTH:0] operand_b,

  output signed [`FFN_OUT_BITWIDTH:0] product
);

//assign product = {`CLOG(`NUM_INPUT_N)'d0, operand_a * operand_b} ;
assign product =  operand_a * operand_b ;

endmodule
