// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../network_params.h"
module pixel_normalization(
  input norm_type,
  input gray_scale,
  input unsigned [`CAMERA_PIXEL_BITWIDTH:0] pixel_in,
  output reg [`CAMERA_PIXEL_BITWIDTH:0] pixel_out,
  output reg [`CAMERA_PIXEL_BITWIDTH:0] screen_pixel
);

//assign screen_pixel = pixel_out + 9'b100000000;
// assign pixel_out = pixel_in + {1'b1, `CAMERA_PIXEL_BITWIDTH'd0};
always@(*) begin
  if(norm_type)
    //   pixel_out = pixel_in + {1'b1, `CAMERA_PIXEL_BITWIDTH'd0};
    pixel_out = (pixel_in <= 9'b011111111) ? 9'b011111111 : 9'b100000000;
  else
    pixel_out = (pixel_in > 9'b011111111) ? 9'b011111111 : 9'b100000000;
end

always@(*) begin
  if(gray_scale)
    screen_pixel = pixel_in;
  else if(norm_type)
    //   pixel_out = pixel_in + {1'b1, `CAMERA_PIXEL_BITWIDTH'd0};
    screen_pixel = (pixel_in <= 9'b011111111) ? 9'b111111111 : 9'b000000000;
  else
    screen_pixel = (pixel_in > 9'b011111111) ? 9'b111111111 : 9'b000000000;
end
endmodule
 