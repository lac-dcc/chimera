// This program was cloned from: https://github.com/urish/tt07-simon-game
// License: Apache License 2.0

// SPDX-FileCopyrightText: © 2023-2024 Uri Shaked <uri@wokwi.com>
// SPDX-License-Identifier: MIT

/*
 * Simon Says game in Verilog. Wokwi Simulation project:
 * https://wokwi.com/projects/397436605640509441
 */

`default_nettype none

module wokwi (
    input  CLK,
    input  RST,
    input  BTN0,
    input  BTN1,
    input  BTN2,
    input  BTN3,
    output LED0,
    output LED1,
    output LED2,
    output LED3,
    output SND,
    output SEG_A,
    output SEG_B,
    output SEG_C,
    output SEG_D,
    output SEG_E,
    output SEG_F,
    output SEG_G,
    output DIG1,
    output DIG2
);

  simon simon1 (
      .clk      (CLK),
      .rst      (RST),
      .ticks_per_milli (16'd50),
      .btn      ({BTN3, BTN2, BTN1, BTN0}),
      .led      ({LED3, LED2, LED1, LED0}),
      .segments_invert(1'b1), // For common anode 7-segment display
      .segments({SEG_G, SEG_F, SEG_E, SEG_D, SEG_C, SEG_B, SEG_A}),
      .segment_digits({DIG2, DIG1}),
      .sound    (SND)
  );

endmodule


module score (
    input wire clk,
    input wire rst,
    input wire ena,
    input wire invert,
    input wire inc,
    output reg [6:0] segments,
    output reg [1:0] digits
);
  reg active_digit;
  reg [3:0] ones;
  reg [3:0] tens;
  wire [3:0] digit_value = active_digit ? tens : ones;

  always @(posedge clk) begin
    active_digit <= ~active_digit;

    if (rst) begin
      ones <= 0;
      tens <= 0;
      active_digit <= 0;
    end else if (inc) begin
      ones <= ones + 1;
      if (ones == 9) begin
        ones <= 0;
        tens <= tens + 1;
        if (tens == 9) begin
          tens <= 0;
        end
      end
    end

    case(active_digit)
      1'b0: digits <= invert ? 2'b10 : 2'b01;
      1'b1: digits <= invert ? 2'b01 : 2'b10;
    endcase

    case (ena ? digit_value : 4'd15)
      4'd0: segments <= invert ? 7'b1000000 : 7'b0111111;
      4'd1: segments <= invert ? 7'b1111001 : 7'b0000110;
      4'd2: segments <= invert ? 7'b0100100 : 7'b1011011;
      4'd3: segments <= invert ? 7'b0110000 : 7'b1001111;
      4'd4: segments <= invert ? 7'b0011001 : 7'b1100110;
      4'd5: segments <= invert ? 7'b0010010 : 7'b1101101;
      4'd6: segments <= invert ? 7'b0000010 : 7'b1111101;
      4'd7: segments <= invert ? 7'b1111000 : 7'b0000111;
      4'd8: segments <= invert ? 7'b0000000 : 7'b1111111;
      4'd9: segments <= invert ? 7'b0010000 : 7'b1101111;
      default: segments <= invert ? 7'b1111111 : 7'b0000000;
    endcase
  end

endmodule


module play (
    input wire clk,
    input wire rst,
    input wire [15:0] ticks_per_milli,
    input wire [9:0] freq,
    output reg sound
);
  reg [31:0] tick_counter;
  wire [31:0] ticks_per_second = ticks_per_milli * 1000;
  wire [31:0] freq32 = {22'b0, freq};

  always @(posedge clk) begin
    if (rst) begin
      tick_counter <= 0;
      sound <= 0;
    end else if (freq == 0) begin
      sound <= 0;
    end else begin
      tick_counter <= tick_counter + freq32;
      if (tick_counter >= (ticks_per_second >> 1)) begin
        sound <= !sound;
        tick_counter <= tick_counter + freq32 - (ticks_per_second >> 1);
      end
    end
  end

endmodule

module simon (
    input wire clk,
    input wire rst,
    input wire [15:0] ticks_per_milli,
    input wire [3:0] btn,
    input wire segments_invert,
    output reg [3:0] led,
    output wire sound,
    output wire [6:0] segments,
    output wire [1:0] segment_digits
);

  localparam MAX_GAME_LEN = 32;

  wire [9:0] GAME_TONES[3:0];
  assign GAME_TONES[0] = 196;  // G3
  assign GAME_TONES[1] = 262;  // C4
  assign GAME_TONES[2] = 330;  // E4
  assign GAME_TONES[3] = 784;  // G5

  wire [9:0] SUCCESS_TONES[6:0];
  assign SUCCESS_TONES[0] = 330;  // E4
  assign SUCCESS_TONES[1] = 392;  // G4
  assign SUCCESS_TONES[2] = 659;  // E5
  assign SUCCESS_TONES[3] = 523;  // C5
  assign SUCCESS_TONES[4] = 587;  // D5
  assign SUCCESS_TONES[5] = 784;  // G5
  assign SUCCESS_TONES[6] = 0;  // silence

  wire [9:0] GAMEOVER_TONES[3:0];
  assign GAMEOVER_TONES[0] = 622;  // D#5
  assign GAMEOVER_TONES[1] = 587;  // D5
  assign GAMEOVER_TONES[2] = 554;  // C#5
  assign GAMEOVER_TONES[3] = 523;  // C5

  localparam StatePowerOn = 0;
  localparam StateInit = 1;
  localparam StatePlay = 2;
  localparam StatePlayWait = 3;
  localparam StateUserWait = 4;
  localparam StateWaitButtonRelease = 5;
  localparam StateUserInput = 6;
  localparam StateNextLevel = 7;
  localparam StateGameOver = 8;

  reg [4:0] seq_counter;
  reg [4:0] seq_length;
  reg [1:0] seq[MAX_GAME_LEN-1:0];
  reg [3:0] state;

  reg [15:0] tick_counter;
  reg [9:0] millis_counter;
  reg [2:0] tone_sequence_counter;
  reg [9:0] sound_freq;

  reg [1:0] next_random;
  reg [1:0] user_input;
  reg [3:0] prev_btn;
  reg button_released;
  reg score_inc;
  reg score_rst;
  reg score_ena;

  play play1 (
      .clk(clk),
      .rst(rst),
      .ticks_per_milli(ticks_per_milli),
      .freq(sound_freq),
      .sound(sound)
  );

  score score1 (
      .clk(clk),
      .rst(rst | score_rst),
      .ena(score_ena),
      .inc(score_inc),
      .invert(segments_invert),
      .segments(segments),
      .digits(segment_digits)
  );

  always @(posedge clk) begin
    if (rst) begin
      seq_length <= 0;
      seq_counter <= 0;
      tick_counter <= 0;
      millis_counter <= 0;
      sound_freq <= 0;
      next_random <= 0;
      state <= StatePowerOn;
      seq[0] <= 0;
      led <= 4'b0000;
      user_input <= 0;
      prev_btn <= 0;
      button_released <= 0;
      score_inc <= 0;
      score_rst <= 0;
      score_ena <= 0;
    end else begin
      tick_counter <= tick_counter + 1;
      next_random  <= next_random + 1;
      score_inc <= 0;
      score_rst <= 0;

      if (tick_counter == ticks_per_milli - 1) begin
        tick_counter   <= 0;
        millis_counter <= millis_counter + 1;
      end

      case (state)
        StatePowerOn: begin
          led <= 4'b1111;
          led[millis_counter[9:8]] <= 1'b0;
          // Wait until the user presses some button - the delay will seed the random sequence
          if (btn != 0) begin
            state <= StateInit;
            led <= 4'b0000;
            millis_counter <= 0;
            score_ena <= 1;
            seq[0] <= next_random;
          end
        end
        StateInit: begin
          seq_length <= 1;
          seq_counter <= 0;
          tone_sequence_counter <= 0;
          if (millis_counter == 500) begin
            score_rst <= 1;
            state <= StatePlay;
          end
        end
        StatePlay: begin
          led <= 0;
          led[seq[seq_counter]] <= 1'b1;
          sound_freq <= GAME_TONES[seq[seq_counter]];
          millis_counter <= 0;
          state <= StatePlayWait;
        end
        StatePlayWait: begin
          if (millis_counter == 300) begin
            led <= 0;
            sound_freq <= 0;
          end
          if (millis_counter == 400) begin
            if (seq_counter + 1 == seq_length) begin
              state <= StateUserWait;
              millis_counter <= 0;
              seq_counter <= 0;
            end else begin
              seq_counter <= seq_counter + 1;
              state <= StatePlay;
            end
          end
        end
        StateUserWait: begin
          led <= 0;
          millis_counter <= 0;
          if (btn != 0) begin
            state <= StateUserInput;
            prev_btn <= btn;
            button_released <= 0;
            seq[seq_length] <= next_random;
            case (btn)
              4'b0001: user_input <= 0;
              4'b0010: user_input <= 1;
              4'b0100: user_input <= 2;
              4'b1000: user_input <= 3;
              default: state <= StateUserWait;
            endcase
          end
        end
        StateUserInput: begin
          led <= 0;
          led[user_input] <= 1'b1;
          sound_freq <= GAME_TONES[user_input];
          if (millis_counter > 50 && btn != prev_btn) begin
            button_released <= 1;
          end
          if (millis_counter == 300) begin
            sound_freq <= 0;
            if (user_input == seq[seq_counter]) begin
              if (seq_counter + 1 == seq_length) begin
                millis_counter <= 0;
                seq_length <= seq_length + 1;
                state <= StateNextLevel;
                score_inc <= 1;
              end else begin
                seq_counter <= seq_counter + 1;
                state <= ~button_released && btn == 0 ? StateUserWait : StateWaitButtonRelease;
              end
            end else begin
              millis_counter <= 0;
              state <= StateGameOver;
            end
          end
        end
        StateWaitButtonRelease: begin
          millis_counter <= 0;
          if (btn != prev_btn) begin
            millis_counter <= millis_counter + 1;  // debounce
            if (millis_counter == 10) begin
              state <= StateUserWait;
            end
          end
        end
        StateNextLevel: begin
          led <= 0;
          if (millis_counter == 150) begin
            if (tone_sequence_counter < 7) begin
              sound_freq <= SUCCESS_TONES[tone_sequence_counter];
            end else begin
              sound_freq <= 0;
              tone_sequence_counter <= 0;
              seq_counter <= 0;
              state <= StatePlay;
            end
            tone_sequence_counter <= tone_sequence_counter + 1;
            millis_counter <= 0;
          end
        end
        StateGameOver: begin
          led <= millis_counter[7] ? 4'b1111 : 4'b0000;

          if (tone_sequence_counter == 4) begin
            // trembling sound
            sound_freq <= GAMEOVER_TONES[3] - 16 + {5'b0, millis_counter[4:0]};
            if (millis_counter == 1000) begin
              tone_sequence_counter <= 7;
              sound_freq <= 0;
            end
          end else if (millis_counter == 300) begin
            if (tone_sequence_counter < 4) begin
              sound_freq <= GAMEOVER_TONES[tone_sequence_counter[1:0]];
              tone_sequence_counter <= tone_sequence_counter + 1;
            end
            millis_counter <= 0;
          end

          if ((btn != 0) && (tone_sequence_counter == 7)) begin
            led <= 4'b0000;
            sound_freq <= 0;
            millis_counter <= 0;
            seq[0] <= next_random;
            state <= StateInit;
          end
        end
      endcase
    end
  end

endmodule
