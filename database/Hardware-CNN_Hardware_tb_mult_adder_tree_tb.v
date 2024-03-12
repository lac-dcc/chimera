`include "../network_params.h"
module mult_adder_tree_tb();

reg clock;
reg reset;

// convolution operands
reg [`BUFFER_OUT_VECTOR_BITWIDTH:0] window;
reg [`BUFFER_OUT_VECTOR_BITWIDTH:0] weights;



always begin
  #5 clock <= ~clock;
end

initial begin
  clock = 1'b0;
  reset = <1'b1;
end

genvar i;
generate
for (i=0; i<`BUFFER_SIZE; i=i+1) begin : init_operands
  initial begin
    window[(`CAMERA_PIXEL_WIDTH*i)+`CAMERA_PIXEL_BITWIDTH:(`CAMERA_PIXEL_WIDTH*i)] = $random;
    weights[(`CAMERA_PIXEL_WIDTH*i)+`CAMERA_PIXEL_BITWIDTH:(`CAMERA_PIXEL_WIDTH*i)] = $random;
  end // initial
end // for

// element wise multiplication

// sum vector
