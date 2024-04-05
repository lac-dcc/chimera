`include "../../network_params.h"
module np_matrix_mult(
  input clock,
  input reset,
 
   
  input [`FFN_IN_BITWIDTH:0] feature_pixel,
  input [`FFN_IN_BITWIDTH:0] weight,
  input [`FFN_OUT_BITWIDTH:0] bias,
  input en,
//  input [`NUM_MM_BUFFER-1:0] frame_rdy, assume frame is ready
  //output reg [`NUM_MM_BUFFER-1:0] reading_frame, // a vector of boolean signals. one signal per frame/feature buffer

  output [`FFN_OUT_BITWIDTH:0] sum_b
//  output reg d_val,

//  output [`FM_ADDR_BITWIDTH:0] buf_addr
);

// parameter declaration

// wire declaration
wire [`FFN_OUT_BITWIDTH:0] sum_prelatch;
//wire overflow_wire;
wire [`FFN_IN_BITWIDTH:0] fp;
wire [`FFN_IN_BITWIDTH:0] w;
wire [`FFN_OUT_BITWIDTH:0] s;
wire [`FFN_OUT_BITWIDTH:0] product;

// reg declaration
reg [`FFN_OUT_BITWIDTH:0] sum;

// assign statments
// assign buf_addr = count;
assign fp = en ? feature_pixel : `FFN_IN_WIDTH'd0;
assign w = en ? weight : `FFN_IN_WIDTH'd0;
assign s = en ? sum : `FFN_OUT_WIDTH'd0;
assign sum_b = sum + bias;

// instantiate multiplyer
// there should be no registers in mult module
mult_np_mm mult_inst(
  .clock(clock),
  .reset(reset),
  .operand_a(fp),
  .operand_b(w),
  .product(product)
);

// instantiate adder with feedback
// there should be no registers in adder
add_np_mm add_inst(
  .clock(clock), 
  .reset(reset),
  .operand_a(product),
  .operand_b(s),
  .sum(sum_prelatch)
  //.overflow(overflow_wire)
);


always@(posedge clock or negedge reset) begin
  if( reset == 1'b0) begin
    sum <= `FFN_OUT_WIDTH'd0;
  end else begin 
    sum <= sum_prelatch; // output current sum
  end
end // always


/*
// counter and data valid logic
always@(posedge clock or negedge reset) begin
  if( reset == 1'b0) begin
//    d_val <= 1'd0;
//    count <= `NP_COUNT_WIDTH'd0;
    sum <= `FFN_OUT_WIDTH'd0;
  end else if( count == `NP_COUNT_WIDTH'd`NP_MAX_COUNT) begin
//    d_val <= 1'd1;
//    count <= `NP_COUNT_WIDTH'd0;
    sum <= `FFN_OUT_WIDTH'd0; 
  end else begin 
//    d_val <= 1'd0;
//    count <= count + `NP_COUNT_WIDTH'd1;
    sum <= sum_prelatch; // output current sum
  end
end // always
*/

/*
// buffer select logic
always@(posedge clock or negedge reset) begin
  if(reset == 1'b0) begin
    reading_frame <= `NUM_MM_BUFFER'd1; // always start reading first frame buffer
  end else if( count == `NP_COUNT_WIDTH'd`NP_MAX_COUNT) begin
    reading_frame <= { reading_frame[`NUM_MM_BUFFER-2:0], reading_frame[`NUM_MM_BUFFER-1] };
  end 
end // always
*/

endmodule
