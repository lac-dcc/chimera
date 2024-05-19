// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

// This exapmple demonstrates the use of the PLL to generate 30Mhz clock 
// from the external 12Mhz clock. Make sure to short the OSC jumper 
// to connect the external clock to the FPGA.
//
// Expected results:
// * 30Mhz output at pin 26 (pll_clk)
// * Green led blinks at 1Hz.

// IMPORTANT: This example requires to short the OSC solder jumper
// to feed the external 12Mhz clock to the FPGA.

module main (
    input  ext_clk,  // 12Mhz in
    output pll_clk,  // 30Mhz out
    output pll_locked,
    output [2:0] leds_out
);

  reg [24:0] counter;
  reg led_on;

  // Generate the 1Hz blink
  always @(posedge pll_clk) begin
    if (counter >= 30000000 - 1) counter <= 0;
    else counter <= counter + 1;
    led_on <= counter <= 10000000;
  end

  pll pll (
      .clock_in(ext_clk),
      .clock_out(pll_clk),
      .locked(pll_locked)
  );

   leds leds (
      .clk(pll_clk),
      .red_en(1'b0),
      .green_en(led_on),
      .blue_en(1'b0),
      .leds_out(leds_out)
  );

endmodule

