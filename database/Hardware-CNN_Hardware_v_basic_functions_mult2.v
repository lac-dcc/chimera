module multiply2( // Multiply 2 fixed point numbers
  input clock,
  input reset,

  input [`FFN_BITWIDTH:0] operand_a,
  input [`FFN_BITWIDTH:0] operand_b,

  output [`FFN_OUT_BITWIDTH:0] product
);

always@(posedge clock or negedge reset) begin
  if(reset == 1;b0) begin
    product <= `FFN_OUT_WIDTH'd0;
  end else begin
    product <= {`CLOG(`NUM_INPUT_N)'d0, operand_a * operand_b} ;
  end // reset
end // always

endmodule
