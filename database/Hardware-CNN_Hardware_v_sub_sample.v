// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../network_params.h"
module sub_sample( // Mean pooling
  input clock,
  input reset,
  input [`NH_VECTOR_BITWIDTH:0] nh_vector, // ` indicates a difined macro
  output [`POOL_OUT_BITWIDTH:0] pool_out
);

// parameter declarations

// wire declarations
wire [`POOL_OUT_BITWIDTH:0] adder_tree_wire [(`NEIGHBORHOOD_SIZE*2)-1-1:0]; // use n-1:0 notation to appease modelsim

// reg declarations

// assign statments
assign pool_out = adder_tree_wire[0] / `NEIGHBORHOOD_SIZE; 

genvar i;
generate
for(i=(`NEIGHBORHOOD_SIZE*2)-2; i >=1; i=i-2) begin : adder_tree
  pool_add2 pool_add2_inst(
    .clock(clock),
    .reset(reset),
    .operand_a(adder_tree_wire[i-1]),
    .operand_b(adder_tree_wire[i]),
    .sum(adder_tree_wire[(i/2)-1])
  );
end // for
endgenerate

genvar j;
generate
for(j=0; j < `NEIGHBORHOOD_SIZE; j=j+1) begin : connect_input_to_adder_tree
  assign adder_tree_wire[j+`NEIGHBORHOOD_SIZE-1] = {`POOL_TREE_PAD'd0, nh_vector[(`NN_WIDTH*j)+`NN_BITWIDTH:`NN_WIDTH*j] };
end // for
endgenerate

endmodule





module pool_add2(
  input clock,
  input reset,

  input [`POOL_OUT_BITWIDTH:0] operand_a,
  input [`POOL_OUT_BITWIDTH:0] operand_b,
  output reg[`POOL_OUT_BITWIDTH:0] sum 
);

`ifdef POOL_RESET
  always@(posedge clock or negedge reset) begin
    if(reset == 1'b0) 
      sum <= `POOL_OUT_BITWIDTH'd0;
    else  
      sum <= operand_a + operand_b;
  end // always
`else
  always@(posedge clock) begin
    sum <= operand_a + operand_b;
  end // always
`endif
endmodule
