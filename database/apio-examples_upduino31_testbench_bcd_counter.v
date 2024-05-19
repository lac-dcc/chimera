// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

// A 4 bit BCD counter with synchronous clock and carry out. 
// It Counts up on positive edge of clk, when count_en is high.

module bcd_counter (
    input clk,
    input reset,
    input count_en,
    output reg [3:0] data_out,
    output carry
);

  // Behavior.
  always @(posedge clk) begin
    if (reset || data_out > 9) begin
      // Case 1: Reset or invalid state.;
      data_out <= 0;
    end else if (count_en) begin
      // Case 1: Increment, with optional overflow from 9 to 0.
      data_out <= (data_out == 9) ? 0 : data_out + 1;
    end
  end

  assign carry = !reset && count_en && (data_out == 9);

endmodule
