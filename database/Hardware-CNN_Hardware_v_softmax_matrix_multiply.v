// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "network_params.h"
module matrix_multiply( // a matrix multiply implementaion of a single layer feed forward network
  input clock,
  input reset,

  input [(`FFN_WIDTH*`NUM_INPUT_N)-1:0] input_neurons,
  input [(`FFN_WIDTH*`NUM_INPUT_N*`NUM_OUTPUT_N)-1:0] weight_matrix,
  output [(`FFN_WIDTH*2*`NUM_OUTPUT_N)-1:0] output_neurons

);

// parameter declarations

// wire declarations
wire [`FFN_BITWIDTH:0] input_n_wire [`NUM_INPUT_N];
wire [`FFN_OUT_BITWIDTH:0] output_n_wire [`NUM_OUTPUT_N];
wire [`FFN_OUT_BITWIDTH:0] product_wire [`NUM_INPUT_N][`NUM_OUTPUT_N]; // Connects to the output of the multiplieres
wire [`FFN_OUT_BITWIDTH:0] weight_matrix_wire [`NUM_INPUT_N][`NUM_OUTPUT_N];
wire [`FFN_OUT_BITWIDTH:0] sum_wire [`SUM_WIRE_LEN][`NUM_OUTPUT_N]; 

// reg declarations

genvar i;
genvar j;
generate 
  for(i=0; i < `NUM_INPUT_N; i=i+1) begin : loop_a // rename to virticlle /horizontal after weitgh matrex wire is created
    for(j=0; j < `NUM_OUTPUT_N; j=j+1) begin : loop_b
      mult2 mult2_inst(
        .clock(clock),
        .reset(reset),
        .operand_a(input_n_wire[i]),
        .operand_b(weight_matrix_wire[i][j]),
        .product(product_wire[i][j])
      );
    end // for j (output dim)
  end // for i (input dim)
endgenerate

genvar x;
generate
  for(x=0; x < `NUM_INPUT_N; x=x+1) begin : connect_input_neurons
    assign input_n_wire[x] = input_neurons[(`FFN_WIDTH*x)+`FFN_BITWIDTH:`FFN_WIDTH*x];
  end
endgenerate

genvar y;
generate
  for(y=0; y < `NUM_OUTPUT_N; y=y+1) begin : connect_sums_to_outputs
    // connect the top of the adder tree to the output 
    assign sum_wire[1][y] = output_neurons[(`FFN_WIDTH*y)+`FFN_BITWIDTH:`FFN_WIDTH*y];
  end
endgenerate

genvar z;
genvar w;
generate
  for(z=`SUM_WIRE_LEN-2 ; z <= 2; z=z-2) begin : loop_c
    for(w=0; w < `NUM_OUTPUT_N; w=w+1) begin :loop_d
      sum2 sum2_inst(
        .clock(clock),
        .reset(reset),
        .opperand_a(sum_wire[z][w]),
        .opperand_b(sum_wire[z+1][w]),
        .sum(sum_wire[z/2][w])
      );
    end
  end
endgenerate

endmodule
