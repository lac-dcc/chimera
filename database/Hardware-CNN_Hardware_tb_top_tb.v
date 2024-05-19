// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../network_params.h"
module top_tb();
reg clock;
reg reset;

reg [`SCREEN_X_BITWIDTH:0] screen_x;
reg [`SCREEN_Y_BITWIDTH:0] screen_y;

wire [`CAMERA_PIXEL_BITWIDTH:0] pixel;

wire [`FFN_OUT_BITWIDTH:0] n0;
wire [`FFN_OUT_BITWIDTH:0] n1;

wire prdy;
parameter X_RES_MAX = 600;
parameter Y_RES_MAX = 800;

// DUT
top top_inst(
  .clock(clock),
  .reset(reset),
  .screen_x_pos(screen_x),
  .screen_y_pos(screen_y),
  .test_pixel(pixel),
  .n0(n0),
  .n1(n1),
  .product_rdy(prdy)
);

always begin
  #5 clock <= ~clock;
end

//always begin
//  #10
//  pixel = 9'b100000000;
//  #10
//  pixel = 9'b011111111;
//end
assign pixel = screen_x;

initial begin
  clock = 1'b0;
  reset = 1'b1;
  #10 reset = 1'b0;
  #10 reset = 1'b1;
  //pixel = 9'b001000000; // 0.25
  
  #300000 $stop;
end


always@(posedge clock or negedge reset) begin
  if (reset == 1'b0) begin
    screen_x <= 0;
	 screen_y <= 0;
  end else if(screen_x < X_RES_MAX) begin
    screen_x <= screen_x + 1;
  end else begin
    screen_x <= 0;
    if (screen_y < Y_RES_MAX)
      screen_y <= screen_y+1;
    else 
      screen_y <= 0;
  end // reset
end // always

endmodule
