// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

//  A shifting buffer to buffer the input image.  The buffer should be 28x28
//  registers to hold the entire image and the buffer should be the size of
//  the kernel (9x9) to input part of the image into the mult-adder tree.

// buffer wire[0][0] is in the bottom right corner of image so that the video
// stream can be fed directly into buffer.  buffer_wire[max][max] is the top
// left corner.
 
`include "../network_params.h"
module shifting_window(
  input clock,
  input reset,
  input shift_up, // shift all rows up
  input shift_left, // to load new pixel into bottom row
  input [`CAMERA_PIXEL_BITWIDTH:0] pixel_in,
  output [`BUFFER_OUT_VECTOR_BITWIDTH:0] buffer_out 
);

// paremeters


// wire declarations
wire [`CAMERA_PIXEL_BITWIDTH:0] buffer_wire [`BUFFER_BW:0][`BUFFER_BH:0];

// reg declarations


  genvar i;
  genvar j;
  generate
    for(j=1;j < `BUFFER_H; j=j+1) begin : core_buffer_h_loop
      for(i=0; i < `BUFFER_W; i=i+1) begin : core_buffer_w_loop
        buffer_unit unit_inst(
          .clock(clock),
          .reset(reset),
          .shift(shift_up),
          .in(buffer_wire[i][j-1]), // bottom to top (height) 
          .out(buffer_wire[i][j])
        );
      end
    end
  endgenerate

  // loop over first row of width and height
  genvar k;
  generate 
  for (k = 1; k < `BUFFER_W; k=k+1) begin : width_row0_loop
    buffer_unit w_row0_unit_inst(
      .clock(clock),
      .reset(reset),
      .shift(shift_left),
      .in(buffer_wire[k-1][0]), // right to left (width)
      .out(buffer_wire[k][0])
    );
  end // for

  endgenerate

  // instantiate origin window unit
  buffer_unit origin_unit_inst(
      .clock(clock),
      .reset(reset),
      .shift(shift_left),
      .in(pixel_in), // right to left (width)
      .out(buffer_wire[0][0])
    );
 



  // loop to connect buffer out vector to buffer_wire
  genvar n;
  genvar m;
  generate
    for (n=0; n < `BUFFER_H; n=n+1) begin : buffer_height_loop
      for (m=0; m < `BUFFER_W; m=m+1) begin : buffer_width_loop
        /*
        assign buffer_wire[m][n] = buffer_out[
        (`CAMERA_PIXEL_WIDTH*m)+(`BUFFER_W*`CAMERA_PIXEL_WIDTH*n) +`CAMERA_PIXEL_BITWIDTH:
          (`CAMERA_PIXEL_WIDTH*m)+(`BUFFER_W*`CAMERA_PIXEL_WIDTH*n)
          ];
        */
       assign buffer_out[
        (`CAMERA_PIXEL_WIDTH*m)+(`BUFFER_W*`CAMERA_PIXEL_WIDTH*n) +`CAMERA_PIXEL_BITWIDTH:
          (`CAMERA_PIXEL_WIDTH*m)+(`BUFFER_W*`CAMERA_PIXEL_WIDTH*n)
          ] = buffer_wire[m][n];
      end // for m
    end // for n
  endgenerate

endmodule
  
  
module buffer_unit(
  input clock,
  input reset,
  input shift,
  input [`CAMERA_PIXEL_BITWIDTH:0] in,
  output reg [`CAMERA_PIXEL_BITWIDTH:0] out
);
  always@(posedge clock or negedge reset) begin
    if(reset == 1'b0)
      out <= `CAMERA_PIXEL_WIDTH'd0;
    else if(shift) 
        out <= in;
      else
        out <= out;
  end // always
endmodule
