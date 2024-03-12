`include "../network_params.h"
module pipeline_tb();
reg clock;
reg reset;

reg [`SCREEN_X_BITWIDTH:0] screen_x;
reg [`SCREEN_Y_BITWIDTH:0] screen_y;

wire [`CAMERA_PIXEL_BITWIDTH:0] pixel;

wire [`RECT_OUT_BITWIDTH:0] rect1;
wire [`RECT_OUT_BITWIDTH:0] rect2;
wire [`RECT_OUT_BITWIDTH:0] rect3;
wire [`RECT_OUT_BITWIDTH:0] rect4;
wire [`RECT_OUT_BITWIDTH:0] rect5;
wire [`RECT_OUT_BITWIDTH:0] rect6;
wire [`RECT_OUT_BITWIDTH:0] rect7;
wire [`RECT_OUT_BITWIDTH:0] rect0;

parameter X_RES_MAX = 600;
parameter Y_RES_MAX = 800;

// DUT
top top_inst(
  .clock(clock),
  .reset(reset),
  .screen_x_pos(screen_x),
  .screen_y_pos(screen_y),
  .test_pixel(pixel),
  .rect1(rect1),
  .rect2(rect2),
  .rect3(rect3),
  .rect4(rect4),
  .rect5(rect5),
  .rect6(rect6),
  .rect7(rect7),
  .rect0(rect0)
);

always begin
  #5 clock <= ~clock;
end

initial begin
  clock = 1'b0;
  reset = 1'b1;
  //pixel = 9'b001000000; // 0.25
  
  #1000000 $stop;
end

assign pixel = screen_x;

always@(posedge clock) begin
  if(screen_x < X_RES_MAX) begin
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
