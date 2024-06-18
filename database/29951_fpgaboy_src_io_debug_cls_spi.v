// This program was cloned from: https://github.com/trun/fpgaboy
// License: MIT License

`default_nettype none
`timescale 1ns / 1ps

module cls_spi(
  input wire        clock,
  input wire        reset,
  
  input wire [15:0] A,
  input wire  [7:0] Di,
  input wire  [7:0] Do,
  input wire [15:0] PC,
  input wire [15:0] SP,
  input wire [15:0] AF,
  input wire [15:0] BC,
  input wire [15:0] DE,
  input wire [15:0] HL,
  input wire [15:0] joypad_state,
  input wire  [1:0] mode,
  
  output wire       ss,
  output reg        mosi,
  input  wire       miso,
  output wire       sclk
);

  parameter WAIT = 1;
  parameter SEND = 2;
  parameter SEND_2 = 3;
  parameter SEND_3 = 4;
  parameter SEND_4 = 5;
  parameter SEND_5 = 6;
  parameter SENDHEX = 7;
  parameter SENDJOYPAD = 8;
  
  parameter STARTUP_1  = 10;
  parameter STARTUP_2  = 11;
  parameter STARTUP_3  = 12;
  parameter STARTUP_4  = 13;
  
  parameter LOOP_1  = 20;
  parameter LOOP_2  = 21;
  parameter LOOP_3  = 22;
  parameter LOOP_4  = 23;
  parameter LOOP_5  = 24;
  parameter LOOP_6  = 25;
  parameter LOOP_7  = 26;
  parameter LOOP_8  = 27;
  parameter LOOP_9  = 28;
  parameter LOOP_10  = 29;
  parameter LOOP_11  = 30;
  parameter LOOP_7b = 31;
  parameter LOOP_8b = 32;
  
  reg [63:0] send_buf; // send buffer (8 bytes)
  reg  [2:0] send_idx; // current bit   (0h-7h)
  reg  [2:0] send_ctr; // current byte  (0h-7h)
  reg  [2:0] send_max; // total bytes   (0h-7h)
  
  reg [31:0] wait_ctr; // current cycle
  reg [31:0] wait_max; // total cycles
  
  reg  [2:0] hex_idx;  // current word
  reg  [3:0] btn_idx;  // current joypad button
  reg  [1:0] mode_latch; // 0-PCSP, 1-AFBC, 2-DEHL
  
  // TODO probably don't need 7 bits for state
  reg [7:0] state;
  reg [7:0] next_state;
  reg [7:0] next_state_hex;
  reg [7:0] next_state_btn;
  
  reg ss_enable;
  reg sclk_enable;
  
  reg [7:0] glyph_rom [15:0];
  reg [31:0] data;
  reg [1:0] data_idx;
  
  initial begin
    $readmemh("data/hexascii.hex", glyph_rom, 0, 15);
  end
  
  always @(posedge clock) begin
    // RESET
    if (reset) begin
      send_buf <= 64'b0;
      send_idx <= 3'b0;
      send_ctr <= 3'b0;
      send_max <= 3'b0;
      wait_ctr <= 32'b0;
      wait_max <= 32'b0;
      state <= STARTUP_1;
      next_state <= 8'b0;
      next_state_hex <= 8'b0;
      next_state_btn <= 8'b0;
      mode_latch <= 2'b0;
      
      hex_idx <= 3'b0;
      btn_idx <= 4'b0;
      data <= 32'b0;
      data_idx <= 2'b0;
      
      ss_enable <= 0;
      sclk_enable <= 0;
      
      mosi <= 1'b0;
    end
    
    // STATES
    else begin
      // SEND - send up to eight serial bytes
      if (state == SEND) begin
        ss_enable <= 1;
        state <= SEND_2;
      end
      
      else if (state == SEND_2) begin
        state <= SEND_3;
      end
      
      else if (state == SEND_3) begin
        mosi <= send_buf[(7 - send_idx) + (8 * send_ctr)];
        if (send_idx == 7) begin
          send_idx <= 0;
          state <= SEND_4;
        end else begin
          sclk_enable <= 1;
          send_idx <= send_idx + 1;
        end
      end
      
      else if (state == SEND_4) begin
        mosi <= 0;
        state <= SEND_5;
      end
      
      else if (state == SEND_5) begin
        sclk_enable <= 0;
        ss_enable <= 0;
        if (send_ctr == send_max) begin
          send_ctr <= 0;
          send_max <= 0;
          state <= next_state;
        end else begin
          send_ctr <= send_ctr + 1;
          state <= SEND;
        end
      end
      
      // SENDHEX - send a glyph corresponding to a hex value
      else if (state == SENDHEX) begin
        send_buf <= glyph_rom[(data >> ({hex_idx, 2'b00})) & 4'hF];
        send_max <= 0;
        if (hex_idx == 0) begin
          next_state <= next_state_hex;
        end else begin
          next_state <= SENDHEX;
          hex_idx <= hex_idx - 1;
        end
        state <= SEND;
      end
      
      // SENDJOYPAD - send a glyph corresponding to a joypad button
      else if (state == SENDJOYPAD) begin
        case (btn_idx)
            0: send_buf <= joypad_state[btn_idx] ? 8'h20 : 8'h42; // B
            1: send_buf <= joypad_state[btn_idx] ? 8'h20 : 8'h59; // Y
            2: send_buf <= joypad_state[btn_idx] ? 8'h20 : 8'h73; // Select
            3: send_buf <= joypad_state[btn_idx] ? 8'h20 : 8'h53; // Start
            4: send_buf <= joypad_state[btn_idx] ? 8'h20 : 8'h5E; // Up
            5: send_buf <= joypad_state[btn_idx] ? 8'h20 : 8'h64; // Down
            6: send_buf <= joypad_state[btn_idx] ? 8'h20 : 8'h3C; // Left
            7: send_buf <= joypad_state[btn_idx] ? 8'h20 : 8'h3E; // Right
            8: send_buf <= joypad_state[btn_idx] ? 8'h20 : 8'h41; // A
            9: send_buf <= joypad_state[btn_idx] ? 8'h20 : 8'h58; // X
            10: send_buf <= joypad_state[btn_idx] ? 8'h20 : 8'h4C; // L
            11: send_buf <= joypad_state[btn_idx] ? 8'h20 : 8'h52; // R
            default: send_buf <= 8'h20;
        endcase
        send_max <= 0;
        if (btn_idx == 15) begin
          btn_idx <= 4'b0;
          next_state <= next_state_btn;
        end else begin
          next_state <= SENDJOYPAD;
          btn_idx <= btn_idx + 1;
        end
        state <= SEND;
      end
      
      // WAIT - wait for # of cycles
      else if (state == WAIT) begin
        if (wait_ctr == wait_max) begin
          wait_ctr <= 0;
          state <= next_state;
        end else begin
          wait_ctr <= wait_ctr + 1;
        end
      end
      
      // STARTUP_1 -- send display on, backlight on cmd
      else if (state == STARTUP_1) begin
        send_buf <= 32'h65335B1B; // ESC  BRACKET '3' 'e'
        send_max <= 3;
        state <= SEND;
        next_state <= STARTUP_2;
      end
      
      // STARTUP_2 -- clear the display
      else if (state == STARTUP_2) begin
        send_buf <= 32'h6A305B1B; // ESC  BRACKET '0' 'j'
        send_max <= 3;
        state <= SEND;
        next_state <= STARTUP_3;
      end
      
      // STARTUP_3 -- set the cursor mode
      else if (state == STARTUP_3) begin
        send_buf <= 32'h63305B1B; // ESC  BRACKET '0' 'c'
        send_max <= 3;
        state <= SEND;
        next_state <= STARTUP_4;
      end
      
      // STARTUP_4 -- set the display mode
      else if (state == STARTUP_4) begin
        send_buf <= 32'h68305B1B; // ESC  BRACKET '0' 'h'
        send_max <= 3;
        state <= SEND;
        next_state <= LOOP_1;
      end
      
      // LOOP_1 -- set cursor to 0,0
      else if (state == LOOP_1) begin
        send_buf <= 48'h48303B305B1B; // ESC  BRACKET '0' ';' '0' 'H'
        send_max <= 5;
        state <= SEND;
        next_state <= LOOP_2;
        mode_latch <= mode;
      end
      
      else if (state == LOOP_2) begin
        send_buf <= 24'h3A4120; //  A:
        send_max <= 2;
        state <= SEND;
        next_state <= LOOP_3;
      end
      
      else if (state == LOOP_3) begin
        data <= A;
        hex_idx <= 3;
        state <= SENDHEX;
        next_state_hex <= LOOP_4;
      end
      
      else if (state == LOOP_4) begin
        send_buf <= 32'h3A4f4920; //  IO:
        send_max <= 3;
        state <= SEND;
        next_state <= LOOP_5;
      end
      
      else if (state == LOOP_5) begin
        data <= { Di, Do };
        hex_idx <= 3;
        state <= SENDHEX;
        next_state_hex <= LOOP_6;
      end
      
      else if (state == LOOP_6) begin
        send_buf <= 48'h48303B315B1B; // ESC  BRACKET '1' ';' '0' 'H'
        send_max <= 5;
        state <= SEND;
        next_state <= mode_latch == 2'b11 ? LOOP_7b : LOOP_7;
      end
      
      else if (state == LOOP_7) begin
        case (mode_latch)
          2'b00: send_buf <= 24'h3A4350; // PC:
          2'b01: send_buf <= 24'h3A4641; // AF:
          2'b10: send_buf <= 24'h3A4544; // DE:
        endcase
        send_max <= 2;
        state <= SEND;
        next_state <= LOOP_8;
      end
      
      else if (state == LOOP_8) begin
        case (mode_latch)
          2'b00: data <= PC;
          2'b01: data <= AF;
          2'b10: data <= DE;
        endcase
        hex_idx <= 3;
        state <= SENDHEX;
        next_state_hex <= LOOP_9;
      end
      
      else if (state == LOOP_9) begin
        case (mode_latch)
          2'b00: send_buf <= 32'h3A505320; //  SP:
          2'b01: send_buf <= 32'h3A434220; //  BC:
          2'b10: send_buf <= 32'h3A4C4820; //  HL:
        endcase
        send_max <= 3;
        state <= SEND;
        next_state <= LOOP_10;
      end
      
      else if (state == LOOP_10) begin
        case (mode_latch)
          2'b00: data <= SP;
          2'b01: data <= BC;
          2'b10: data <= HL;
        endcase
        hex_idx <= 3;
        state <= SENDHEX;
        next_state_hex <= LOOP_11;
      end
      
      else if (state == LOOP_7b) begin
        send_buf <= 16'h2020;
        send_max <= 1;
        state <= SEND;
        next_state <= LOOP_8b;
      end
      
      else if (state == LOOP_8b) begin
        state <= SENDJOYPAD;
        next_state_btn <= LOOP_11;
      end
      
      else if (state == LOOP_11) begin
        wait_max <= 10;
        state <= WAIT;
        next_state <= LOOP_1;
      end
    end
  end
  
  assign ss = (ss_enable) ? 1'b0 : 1'b1;
  assign sclk = (sclk_enable) ? !clock : 1'b1;

endmodule
