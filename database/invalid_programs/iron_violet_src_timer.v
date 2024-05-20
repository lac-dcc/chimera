// This program was cloned from: https://github.com/johnbentcope/iron_violet
// License: Apache License 2.0

/*
 * Copyright (c) 2023 Iron Violet LLC
 * SPDX-License-Identifier: Apache-2.0
 */

//============================================================================//
// Timer
//============================================================================//

`default_nettype none

module timer (
  input  wire        CLK,
  input  wire        RST_N,
  input  wire        CLR,
  input  wire [24:0] TIMER_VAL,
  input  wire        START_TMR,
  output reg         PULSE
);
  `include "constants.vh"
  
  // internal signals
  reg [1:0]  state;
  reg        pulse_i;
  reg [24:0] counter;
  reg [24:0] compare;

  assign PULSE = pulse_i;

  always @(posedge CLK or negedge RST_N) begin
    if (!RST_N) begin
      state   <= 0;
      pulse_i <= 0;
      counter <= 0;
      compare <= 0;
    end else if (CLR) begin
      state   <= 0;
      pulse_i <= 0;
      counter <= 0;
      compare <= 0;
    end else begin
      // Pulsed signal default values
      pulse_i <= 0;

      case (state)
        TIMR_IDLE_S: begin
          if (START_TMR) begin
            compare <= TIMER_VAL;
            state   <= TIMR_COUNT_S;
            counter <= counter + 1;
          end
        end

        TIMR_COUNT_S: begin
          counter   <= counter + 1;
          if (counter == compare) begin
            counter <= 0;
            pulse_i <= 1;
            state   <= TIMR_IDLE_S;
          end
        end

        default : begin
          state     <= TIMR_IDLE_S;
        end
      endcase
    end
  end

endmodule : timer
