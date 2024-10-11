// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

// More info about the primitve led control block SB_RGBA_DRV:
// https://github.com/tinyvision-ai-inc/UPduino-v3.0/blob/master/RTL/blink_led/rgb_blink.v
// https://blog.idorobots.org/entries/upduino-fpga-tutorial.html

module leds (
    input clk,
    input red_en,
    input green_en,
    input blue_en,
    output wire [2:0] leds_out  // [0]=red, [1]=green, [2]=blue
);

  // Intensity multiplier for all three channels.
  localparam integer IntensityAll = 2;

  // Intensity controls in the range [0, 512].
  localparam integer IntensityRed = 4 * IntensityAll;
  localparam integer IntensityGreen = 2 * IntensityAll;
  localparam integer IntensityBlue = 24 * IntensityAll;

  // Frequency divider generate the PWM counter.
  reg  [15:0] divider;

  // 9 bits PWM counter.
  wire [ 8:0] pwm_counter = divider[15:7];

  wire        pwm_red = pwm_counter < IntensityRed;
  wire        pwm_green = pwm_counter < IntensityGreen;
  wire        pwm_blue = pwm_counter < IntensityBlue;

  // Behavior.
  always @(posedge clk) begin
    divider <= divider + 1'b1;
  end

  // Instantiate the RGB current source primitive.
  SB_RGBA_DRV #(
      .CURRENT_MODE("0b1"),  // "0b0" -> full current, "0b1" -> half current.
      .RGB0_CURRENT("0b000001"),
      .RGB1_CURRENT("0b000001"),
      .RGB2_CURRENT("0b000001")
  ) RGB_DRIVER (
      .RGBLEDEN(1'b1),
      .RGB0PWM (green_en && pwm_green),  // Green led input.
      .RGB1PWM (blue_en & pwm_blue),     // Blue led input.
      .RGB2PWM (red_en & pwm_red),       // Red led input.
      .CURREN  (1'b1),
      .RGB0    (leds_out[1]),            // Current regulated output to green led.
      .RGB1    (leds_out[2]),            // Current regulated output to blue led.
      .RGB2    (leds_out[0])             // Current regulated output to red led.
  );

endmodule
