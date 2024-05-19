// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../network_params.h"
// A module to shift in pixels from the video stream and output a ready signal
module window_ctrl ( 
  input clock,
  input reset,

  // x/y coordinates of the buffer, will be constants to start but may
  // eventually change to look at different parts of the image
  input [`SCREEN_X_BITWIDTH:0] buffer_x_pos,
  input [`SCREEN_Y_BITWIDTH:0] buffer_y_pos,

  // video stream in
  input [`SCREEN_X_BITWIDTH:0] screen_x, // the x coordinate of the current pixel input
  input [`SCREEN_Y_BITWIDTH:0] screen_y, // the y coordinate of the current pixel input
  // input [`CAMERA_PIXEL_BITWIDTH:0] pixel_in,

  // window/ buffer control signals
  output reg shift_up,
  output reg shift_left,

  // mult_adder tree ready signal to indicate valid data
  // will strobe once when data is ready
  output reg buffer_rdy

);

// wire declarations

// reg declarations


// shift left control
always@(posedge clock or negedge reset) begin
  if(reset == 1'b0) begin
    shift_left <= 1'd0;
  end else if( screen_x >= buffer_x_pos &&
               screen_x < buffer_x_pos + `SCREEN_X_WIDTH'd`BUFFER_W &&
					screen_y >= buffer_y_pos &&
               screen_y < buffer_y_pos + `SCREEN_Y_WIDTH'd`BUFFER_H
					)
    shift_left <= 1'd1;
  else 
    shift_left <= 1'd0;  
end // always

// shift up control
always@(posedge clock or negedge reset) begin
  if(reset == 1'b0) begin
    shift_up <= 1'd0;
  end else if (screen_x == buffer_x_pos + `SCREEN_X_WIDTH'd`BUFFER_W &&
					screen_y >= buffer_y_pos &&
               screen_y < buffer_y_pos + `SCREEN_Y_WIDTH'd`BUFFER_H - 1
					)
    shift_up <= 1'd1;
  else 
    shift_up <= 1'd0;
end // always

// buffer ready control
always@(posedge clock or negedge reset) begin
  if (reset == 1'b0) begin
    buffer_rdy <= 1'b0;
  end else if( screen_x == buffer_x_pos + `SCREEN_X_WIDTH'd`BUFFER_W &&
           screen_y == buffer_y_pos + `SCREEN_Y_WIDTH'd`BUFFER_H)
    // the buffer is full 
    buffer_rdy <= 1'b1;
  else
    buffer_rdy <= 1'b0;
end // always

endmodule
