// This program was cloned from: https://github.com/AndresNavarro82/vt52-fpga
// License: GNU General Public License v3.0

/**
 * Cursor blinker (uses vblank as tick, blinks about once a second)
 */
module cursor_blinker
  (input clk,
   input reset,
   input tick,
   input reset_count,
   output wire blink_on
   );
   localparam BITS = 6;
   reg has_incremented;
   reg [BITS-1:0] counter;
   always @(posedge clk) begin
      if (reset) begin
         counter <= 0;
         has_incremented <= 0;
      end
      else if (reset_count) begin
         counter <= 0;
         has_incremented <= tick;
      end
      else if (tick && !has_incremented) begin
         counter <= counter + 1;
         has_incremented <= 1;
      end
      else if (!tick && has_incremented) begin
         has_incremented <= 0;
      end
   end
   assign blink_on = ~counter[BITS-1];
endmodule
