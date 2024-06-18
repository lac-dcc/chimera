// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

// Generates a RGB blinking pattern. Uses the internal oscilator.
module main (
    // [0]=red, [1]=green, [2]=blue. See pin definitions in main.pcf
    output [2:0] leds_out
);

  wire clk;

  oscilator oscilator (.clk(clk));

  // Frequency divider to generate the RGB patterns.
  reg  [25:0] divider;
  wire        red_en = divider[25] & divider[24];
  wire        green_en = divider[25] & ~divider[24];
  wire        blue_en = ~divider[25] & divider[24];

  leds leds (
      .clk(clk),
      .red_en(red_en),
      .green_en(green_en),
      .blue_en(blue_en),
      .leds_out(leds_out)
  );

  // Behavior.
  always @(posedge clk) begin
    divider <= divider + 1'b1;
  end

endmodule
