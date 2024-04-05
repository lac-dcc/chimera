`include "../network_params.h"
module mult_adder(
      input     clock, 
		  input     reset, 
		  input [`MULT_ADDER_IN_BITWIDTH:0]  in,
		  input [`MULT_ADDER_IN_BITWIDTH:0]  kernal,
		  input [`CONV_ADD_BITWIDTH:0] bias,
		  output [`CONV_ADD_BITWIDTH:0] out	
		  );

// wire declarations
wire [`CONV_PRODUCT_BITWIDTH:0] in_add_vector_wire [`MA_TREE_SIZE-1:0];
wire [`CONV_ADD_BITWIDTH:0] adder_tree_wire [((`MA_TREE_SIZE*2)-1)-1:0];
wire [(`MA_TREE_SIZE*2)-1-1:0]carry_wire ;  

// assign statments
assign out = adder_tree_wire[0] + bias;
assign carry_wire [(`MA_TREE_SIZE*2)-1-1:`MA_TREE_SIZE-1] = `MA_TREE_SIZE'd0;

// connect input vector to multipliers
genvar i;
generate
//for(i = 0; i < `KERNEL_SIZE_SQ; i=i+1) begin : connect_mul
for(i = 0; i < `MA_TREE_SIZE; i=i+1) begin : connect_mul
   mult_adder_mult ma_mult_inst(
    .clock(clock),
    .reset(reset),
    .operand_a(in[`CONV_MULT_WIDTH*(i+1)-1:i*`CONV_MULT_WIDTH]),
    .operand_b(kernal[`CONV_MULT_WIDTH*(i+1)-1:i*`CONV_MULT_WIDTH]),
    .out(in_add_vector_wire[i])
			     ); 
  end
endgenerate

// map products to adder tree wire
//genvar i;
genvar pad_count;
generate
//for(i = 0; i < `KERNEL_SIZE_SQ; i=i+1) begin : connect_in_vector
for(i = 0; i < `MA_TREE_SIZE; i=i+1) begin : connect_in_vector
    // assign the lsbs here
    // assign adder_tree_wire[i+`MA_TREE_SIZE-1][`CONV_PRODUCT_BITWIDTH:0] = in[(`CONV_PRODUCT_WIDTH*i)+`CONV_PRODUCT_BITWIDTH:`CONV_PRODUCT_WIDTH*i];
	 assign adder_tree_wire[i+`MA_TREE_SIZE-1][`CONV_PRODUCT_BITWIDTH:0] = in_add_vector_wire[i];
    // loop over msb and assign sign bit here
    for(pad_count=0; pad_count<`MULT_PAD_WIDTH; pad_count=pad_count+1) begin : sign_bit_extention_loop
      //assign adder_tree_wire[i+`MA_TREE_SIZE-1][`CONV_PRODUCT_WIDTH+pad_count] = in[(`CONV_PRODUCT_WIDTH*i)+`CONV_PRODUCT_BITWIDTH];
		assign adder_tree_wire[i+`MA_TREE_SIZE-1][`CONV_PRODUCT_WIDTH+pad_count] = in_add_vector_wire[i][`CONV_PRODUCT_BITWIDTH];
    end // pad count 
  end
endgenerate

// connect adder tree
genvar j;
generate
//for(j= (`KERNIL_SIZE_SQ*2)-2 ; j >=1 ; j=j-2) begin : sum_products
for(j= (`MA_TREE_SIZE*2)-2 ; j >=1 ; j=j-2) begin : sum_products
  mult_adder_add ma_add_inst(
    .clock(clock),
    .reset(reset),
    .operand_a(adder_tree_wire[j-1]),
    .operand_b(adder_tree_wire[j]),
    .c_a(carry_wire[j-1]),
    .c_b(carry_wire[j]),
    .out(adder_tree_wire[(j/2)-1]),
    .carry(carry_wire[(j/2)-1])
  );  

end // for
endgenerate
   
endmodule // mult_adder

module mult_adder_mult(
  input clock,
  input reset,
  input signed [`CONV_MULT_BITWIDTH:0] operand_a,
  input signed [`CONV_MULT_BITWIDTH:0] operand_b,
  output [`CONV_PRODUCT_BITWIDTH:0] out 
);
   reg signed[`CONV_PRODUCT_BITWIDTH:0]    product;
   
   assign out = product[`CONV_PRODUCT_BITWIDTH:0];

   always@(posedge clock or negedge reset) begin
      if(reset == 1'b0) 
	      product <= `CONV_PRODUCT_WIDTH'd0;
      else  
	      product <= operand_a * operand_b;
   end // always
endmodule

module mult_adder_add(
  input clock,
  input reset,
  input [`CONV_ADD_BITWIDTH:0] operand_a,
  input [`CONV_ADD_BITWIDTH:0] operand_b,
  input c_a, // overflow or carry indicators
  input c_b,
  output [`CONV_ADD_BITWIDTH:0] out,
  output carry
);
   reg [`CONV_ADD_BITWIDTH+1:0]    sum;

   assign out = sum[`CONV_ADD_BITWIDTH:0];
   assign carry = sum[`CONV_ADD_BITWIDTH + 1] | c_a | c_b;
   
   always@(posedge clock or negedge reset) begin
      if(reset == 1'b0) 
	      sum <= {1'b0,`CONV_ADD_WIDTH'd0};
      else  
	      sum <= operand_a + operand_b;
   end // always
   endmodule
