// This program was cloned from: https://github.com/johnbentcope/iron_violet
// License: Apache License 2.0

/*
 * Copyright (c) 2023 Iron Violet LLC
 * SPDX-License-Identifier: Apache-2.0
 */

//============================================================================//
// Controller
//============================================================================//

`define default_netname none

module controller (
  input             CLK,
  input             RST_N,

  input  wire [1:0] IN,
  input  wire       IN_VALID,
  output reg  [1:0] OUT,
  output reg        OUT_ENA,

  input  wire [1:0] RAND,

  input  wire       START_GAME
);
  `include "constants.vh"

  // internal signals
  localparam [4:0] MAX = 5'b1_1111;

  // General game utilities
  reg [4:0] state;        // FSM state
  reg [4:0] i;            // Current sequence item to display
  reg [4:0] cnt;          // Current turn count
  reg [4:0] high_score;   // High score across all games since reset
  reg [1:0] stack [0:31]; // Color sequence memory

  // Helpers for press-and-hold
  reg good_hold;          // Track, during button hold, if it's a good button
  reg last_color;         // Track, during button hold, if it's the last color in a sequence

  // Timer handles
  reg clr_turn;           // Timer reset handle
  reg go_turn;            // Timer start handle
  wire timeout_turn;      // Timer timeout handle
  reg [24:0] timer_count; // Timer programmable count value handle

  // Programmable timer for lamp displays and end-game timeouts
  timer turn_timer_u1 (
    .CLK        (CLK),
    .RST_N      (RST_N),
    .CLR        (clr_turn),
    .TIMER_VAL  (timer_count),
    .START_TMR  (go_turn),
    .PULSE      (timeout_turn)
  );

  always @(posedge CLK or negedge RST_N) begin
    if (!RST_N) begin
      state       <= 0;
      i           <= 0;
      cnt         <= 0;
      high_score  <= 0;
      OUT         <= 3;
      OUT_ENA     <= 0;
      good_hold   <= 0;
      last_color  <= 0;
      clr_turn    <= 1;
      go_turn     <= 0;
      timer_count <= 0;
    end else begin
      // Pulsed signal default values
      go_turn     <= 0;
      clr_turn    <= 0;

      // Idle after reset/end-game
      case (state)
        CTRL_IDLE_S : begin
          i   <= 0;
          cnt <= 0;
          clr_turn <= 1;
          go_turn  <= 0;
          if (START_GAME) state <= CTRL_START_S; // NOISE (start sound)
        end

        CTRL_START_S : begin
          if (!START_GAME) state <= CTRL_ADD_COLOR_S; // End NOISE (start sound)
        end

        CTRL_ADD_COLOR_S : begin
          last_color <= 0;

          // If it's time to add a color and there's no room left, end-game
          if (cnt == MAX-1) begin
            state <= CTRL_WIN1_S;
          end else begin
            stack[cnt] <= RAND;
            state      <= CTRL_DISPLAY_S;
          end
        end

        CTRL_DISPLAY_S : begin
          OUT_ENA     <= 1;
          OUT         <= stack[i];

          go_turn     <= 1; // Start display timer
          timer_count <= HALF_SECOND;

          state       <= CTRL_DISPLAY2_S;
        end

        CTRL_DISPLAY2_S : begin
          if (timeout_turn) begin
            OUT_ENA     <= 0;

            // Set up input state with end-game timeout
            if (i == cnt) begin
              i           <= 0;
              cnt         <= cnt + 1;

              clr_turn    <= 0;
              go_turn     <= 1;
              timer_count <= FIVE_SECOND;

              state       <= CTRL_INPUT_S;
            end

            // Set up mid-lamp delay
            else begin
              i           <= i + 1;

              clr_turn    <= 0;
              timer_count <= EGTH_SECOND;
              go_turn     <= 1;

              state       <= CTRL_DISPLAY3_S;
            end

          end
        end

        // Wait a beat between displaying colors
        CTRL_DISPLAY3_S : begin
          if (timeout_turn) begin
              state     <= CTRL_DISPLAY_S;
          end
        end

        CTRL_INPUT_S : begin
          if (timeout_turn) begin // took too long to answer
            state    <= CTRL_ENDGAME_S;
            clr_turn <= 1;
          end

          else if (IN_VALID) begin
            OUT_ENA     <= 1;
            OUT         <= stack[i];

            // Check if button pressed is correct
            if (IN == stack[i]) begin
              i                          <= i + 1;

              clr_turn                   <= 1;
              good_hold                  <= 1;

              if (i == cnt-1) last_color <= 1;
            end

            // Transition to button hold state
            state <= CTRL_INPUT_HOLD_S;

          end
        end

        CTRL_INPUT_HOLD_S : begin
          if (!IN_VALID) begin // Don't transition until released

            OUT_ENA     <= 0;
            if (good_hold) begin

              good_hold <= 0;

              // Releasing correct button at end of a sequence
              if (last_color) begin
                i     <= 0;

                state <= CTRL_ADD_COLOR_S;

              // Releasing correct button before the end of a sequence
              end else begin
                clr_turn    <= 0;
                timer_count <= FIVE_SECOND;
                go_turn     <= 1;

                state <= CTRL_INPUT_S;
              end

            // Releasing wrong button
            end else begin
              state <= CTRL_ENDGAME_S;
            end
          end
        end

        CTRL_ENDGAME_S : begin
          state <= CTRL_LOSE1_S;
          if (cnt > high_score) begin
            high_score <= cnt - 1;
            state <= CTRL_WIN1_S;
          end
        end

        CTRL_WIN1_S : begin
          OUT_ENA     <= 1;
          OUT         <= 2'b00;
          go_turn     <= 1; // Start display timer
          timer_count <= QRTR_SECOND;
          clr_turn    <= 0;
          if (timeout_turn) begin
            state <= CTRL_WIN2_S;
          end
        end

        CTRL_WIN2_S : begin
          OUT_ENA     <= 1;
          OUT         <= 2'b01;
          go_turn     <= 1;
          timer_count <= QRTR_SECOND;
          clr_turn    <= 0;
          if (timeout_turn) begin
            state <= CTRL_WIN3_S;
          end
        end

        CTRL_WIN3_S : begin
          OUT_ENA     <= 1;
          OUT         <= 2'b10;
          go_turn     <= 1; // Start display timer
          timer_count <= QRTR_SECOND;
          clr_turn    <= 0;
          if (timeout_turn) begin
            state <= CTRL_WIN4_S;
          end
        end

        CTRL_WIN4_S : begin
          OUT_ENA     <= 1;
          OUT         <= 2'b11;
          go_turn     <= 1; // Start display timer
          timer_count <= QRTR_SECOND;
          clr_turn    <= 0;
          if (timeout_turn) begin
            OUT_ENA     <= 0;
            state <= CTRL_IDLE_S;
          end
        end

        CTRL_LOSE1_S : begin
          OUT_ENA     <= 1;
          OUT         <= 2'b11;
          go_turn     <= 1; // Start display timer
          timer_count <= QRTR_SECOND;
          clr_turn    <= 0;
          if (timeout_turn) begin
            state <= CTRL_LOSE2_S;
          end
        end

        CTRL_LOSE2_S : begin
          OUT_ENA     <= 1;
          OUT         <= 2'b10;
          go_turn     <= 1; // Start display timer
          timer_count <= QRTR_SECOND;
          clr_turn    <= 0;
          if (timeout_turn) begin
            state <= CTRL_LOSE3_S;
          end
        end

        CTRL_LOSE3_S : begin
          OUT_ENA     <= 1;
          OUT         <= 2'b01;
          go_turn     <= 1; // Start display timer
          timer_count <= QRTR_SECOND;
          clr_turn    <= 0;
          if (timeout_turn) begin
            state <= CTRL_LOSE4_S;
          end
        end

        CTRL_LOSE4_S : begin
          OUT_ENA     <= 1;
          OUT         <= 2'b00;
          go_turn     <= 1; // Start display timer
          timer_count <= QRTR_SECOND;
          clr_turn    <= 0;
          if (timeout_turn) begin
            OUT_ENA     <= 0;
            state <= CTRL_IDLE_S;
          end
        end

        default : begin
          state <= CTRL_IDLE_S;
        end

      endcase
    end
  end

endmodule : controller
