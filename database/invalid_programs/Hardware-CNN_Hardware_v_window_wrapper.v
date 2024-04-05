`include "../network_params.h"
module window_wrapper(
  input clock,
  input reset,
  // buffer inputs
  input [`CAMERA_PIXEL_BITWIDTH:0] pixel_in,
  input shift_left,
  input shift_up,
  // window inputs
  input [`X_COORD_BITWIDTH:0] kernel_x, // the bottom right corner of the kernel position
  input [`Y_COORD_BITWIDTH:0] kernel_y, // the bottom right corner of the kernel position

  // the kernel sized view of the buffer to be fed into the multipliers
  output [`WINDOW_VECTOR_BITWIDTH:0] window_out 
);

// wire declarations
wire [`BUFFER_OUT_VECTOR_BITWIDTH:0] buffer_vector;
wire [`CAMERA_PIXEL_BITWIDTH:0] window_wire [`KERNEL_SIZE-1:0][`KERNEL_SIZE-1:0];

// reg declarations


// instantiate shifting window
shifting_window shifting_window_inst(
  .clock(clock),
  .reset(reset),
  .shift_up(shift_up), // shift all rows up
  .shift_left(shift_left), // to load new pixel into bottom row
  .pixel_in(pixel_in),
  .buffer_out(buffer_vector) 
);

// generate window selectors
genvar i;
genvar j;
generate
for (j=0; j<`KERNEL_SIZE; j=j+1) begin : selector_height_loop
  for (i=0; i<`KERNEL_SIZE; i=i+1) begin : selector_width_loop
    window_selector selector_inst(
      .clock(clock),
      .reset(reset),
      .buffer_vector(buffer_vector),
      .x(kernel_x+i),
      .y(kernel_y+j),
      .value_out(window_wire[i][j])
    );
  end // for i
end // for j
endgenerate

genvar n;
genvar m;
generate
for (n=0; n<`KERNEL_SIZE; n=n+1) begin : kernel_h_loop
  for (m=0; m<`KERNEL_SIZE; m=m+1) begin : kernel_w_loop
    assign window_out[
    (`CAMERA_PIXEL_WIDTH*m)+(`KERNEL_SIZE*`CAMERA_PIXEL_WIDTH*n)+`CAMERA_PIXEL_BITWIDTH:
    (`CAMERA_PIXEL_WIDTH*m)+(`KERNEL_SIZE*`CAMERA_PIXEL_WIDTH*n)
    ] = window_wire[m][n];
  end // for m
end // for n
endgenerate


endmodule
  
