// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "network_params.h"
module normalize(
  input clock,
  input reset,
  input [(`NN_WIDTH*`NUM_CLASSES)-1:0] in_vector,
  output [(`NORM_OUT_WIDTH*`NUM_CLASSES)-1:0] out_vector
);

//parameter declarations
//parameter `NUM_NORM_LAYERS = `LOG2(`NUM_CLASSES);
//parameter `FFN_OUT_WIDTH = `FFN_WIDTH * 2 + `LOG2(`NUM_INPUT_N);

// wire declarations
wire [`NORM_IN_BITWIDTH:0] in_vector_wire [`NUM_CLASSES];
wire [`NORM_OUT_BITWIDTH:0] adder_tree_wire [((`NUM_CLASSES)*2)-1];

// reg declarations
reg [`NORM_OUT_BITWIDTH:0] out_vector_wire [`NUM_CLASSES];


// connect input vector to wire array
genvar i;
generate
for(i = 0; i < `NUM_CLASSES; i=i+1) begin : connect_in_vector
    assign in_vector_wire[i] = in_vector[(`NN_WIDTH*i)+`NN_BITWIDTH:`NN_WIDTH*i];
    assign adder_tree_wire[i+`NUM_CLASSES-1] = { `ADDER_TREE_PAD'd0, in_vector[(`NN_WIDTH*i)+`NN_BITWIDTH:`NN_WIDTH*i] };
  end
endgenerate

// sum inputs
genvar j;
generate
for(j= (`NUM_CLASSES*2)-2 ; j >=1 ; j=j-2) begin : sum_inputs
  norm_add2 add2_inst(
    .clock(clock),
    .reset(reset),
    .operand_a(adder_tree_wire[j-1]),
    .operand_b(adder_tree_wire[j]),
    .sum(adder_tree_wire[(j/2)-1])
  );  
//assign adder_tree_wire[(j/2)-1] = adder_tree_wire[j] + adder_tree_wire[j-1];
end // for
endgenerate

// normalize inputs
genvar k;
generate
for (k=0; k < `NUM_CLASSES; k=k+1) begin : divide_by_sum
/*
  always@(posedge clock or negedge reset) begin
    if(reset == 1'b0) begin
      out_vector_wire[k] <= `NORM_OUT_BITWIDTH'd0;
    end else begin 
      out_vector_wire[k] <= in_vector_wire[k] / adder_tree_wire[0];
    end
  end // always
*/
  always@(posedge clock) begin
    out_vector_wire[k] <= in_vector_wire[k] / adder_tree_wire[0];
    end
end // for
endgenerate

// wire up output vector
genvar m;
generate
for(m=0; m < `NUM_CLASSES; m=m+1) begin : connect_out_vector
  assign out_vector[ (`NORM_OUT_WIDTH*m) + `NORM_OUT_BITWIDTH : `NORM_OUT_WIDTH * m ] = out_vector_wire[m];
end
endgenerate


endmodule

module norm_add2(
  input clock,
  input reset,

  input [`NORM_OUT_BITWIDTH:0] operand_a,
  input [`NORM_OUT_BITWIDTH:0] operand_b,
  output reg[`NORM_OUT_BITWIDTH:0] sum 
);

`ifdef NORM_RESET
always@(posedge clock or negedge reset) begin
  if(reset == 1'b0) 
    sum <= `NORM_OUT_WIDTH'd0;
  else 
    sum <= operand_a + operand_b;
end // always
`else
always@(posedge clock) begin
  sum <= operand_a + operand_b;
end // always
`endif
endmodule
