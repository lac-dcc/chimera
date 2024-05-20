// This program was cloned from: https://github.com/spiff42/tt06-exp-led-pwm
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Mikkel Holm Olsen (spiff42)
 * SPDX-License-Identifier: Apache-2.0
 * Description: This module generates a ramp signal rising
 *   from 0 to 255, but where the first 16 steps take only
 *   1 clock each, the next 16 take 6 clocks. The last 16 steps
 *   (240-255) each take 724 clocks, for a total of 65535 clocks.
 *   The values are chosen to approximately match an X^3-curve,
 *   so fading looks "natural" to the huma eye.
 */

module ramp_generator (input clk, input rst_n, output [7:0] ramp);
  reg [9:0] ramp_low;
  reg [7:0] ramp_high;
  
  reg [9:0] low_limit;

  assign ramp = ramp_high;

  always @(ramp_high[7:4])
    begin
      case(ramp_high[7:4])
        4'd00 : low_limit = 1 - 1;
        4'd01 : low_limit = 6 - 1;
        4'd02 : low_limit = 19 - 1;
        4'd03 : low_limit = 36 - 1;
        4'd04 : low_limit = 60 - 1;
        4'd05 : low_limit = 90 - 1;
        4'd06 : low_limit = 126 - 1;
        4'd07 : low_limit = 168 - 1;
        4'd08 : low_limit = 216 - 1;
        4'd09 : low_limit = 271 - 1;
        4'd10 : low_limit = 313 - 1;
        4'd11 : low_limit = 397 - 1;
        4'd12 : low_limit = 473 - 1;
        4'd13 : low_limit = 545 - 1;
        4'd14 : low_limit = 633 - 1;
        4'd15 : low_limit = 724 - 1;
      endcase
    end

  always @(posedge clk or negedge rst_n)
    begin
      if (!rst_n) begin
        ramp_low <= 0;
        ramp_high <= 0;
      end else begin
        if (ramp_low != low_limit)
          ramp_low <= ramp_low + 1;
        else begin
          ramp_high <= ramp_high + 1;
          ramp_low <= 0;
        end
      end
    end
endmodule

