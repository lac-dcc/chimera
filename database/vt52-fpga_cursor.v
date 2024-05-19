// This program was cloned from: https://github.com/AndresNavarro82/vt52-fpga
// License: GNU General Public License v3.0

/**
 * Cursor (position and blinking)
 */
module cursor
  #(parameter ROW_BITS = 5,
    parameter COL_BITS = 7)
   (input clk,
    input reset,
    input tick,
    output wire [COL_BITS-1:0] x,
    output wire [ROW_BITS-1:0] y,
    output wire blink_on,
    input [COL_BITS-1:0] new_x,
    input [ROW_BITS-1:0] new_y,
    input wen
    );

   cursor_blinker cursor_blinker(.clk(clk),
                                 .reset(reset),
                                 .tick(tick),
                                 .reset_count(wen),
                                 .blink_on(blink_on)
                                 );

   simple_register #(.SIZE(COL_BITS))
      cursor_x_reg(.clk(clk),
                   .reset(reset),
                   .idata(new_x),
                   .wen(wen),
                   .odata(x)
                   );

   simple_register #(.SIZE(ROW_BITS))
      cursor_y_reg(.clk(clk),
                   .reset(reset),
                   .idata(new_y),
                   .wen(wen),
                   .odata(y)
                   );
endmodule
