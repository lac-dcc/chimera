`include "../../network_params.h"
module add2(
  input clock,
  input reset,

  input [`FFN_OUT_BITWIDTH:0] operand_a,
  input [`FFN_OUT_BITWIDTH:0] operand_b,
  output reg[`FFN_OUT_BITWIDTH:0] sum
);

always@(posedge clock or negedge reset) begin
  if(reset == 1'b0) 
    sum <= `FFN_OUT_WIDTH'd0;
  else 
    sum <= operand_a + operand_b;
end // always

endmodule
