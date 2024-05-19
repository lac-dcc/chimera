// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

// Generates a RGB blinking pattern. Uses the internal oscilator.
module main (
  input clk,
  input reset,
  input count_en,
  output [3:0] digit_1,
  output [3:0] digit_10,
  output carry
);

wire carry_1;

bcd_counter count_1 (
    .clk(clk),
    .reset(reset),
    .count_en(count_en),
    .data_out(digit_1),
    .carry(carry_1)
);

bcd_counter count_10 (
    .clk(clk),
    .reset(reset),
    .count_en(carry_1),
    .data_out(digit_10),
    .carry(carry)
);

endmodule
