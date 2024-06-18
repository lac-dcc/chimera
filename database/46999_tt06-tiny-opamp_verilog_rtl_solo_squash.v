// This program was cloned from: https://github.com/argunda/tt06-tiny-opamp
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2023 Anton Maurovic <anton@maurovic.com>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0


`default_nettype none
// `timescale 1ns / 1ps

`define BG_PRETTY
`define BG_ANIMATED
//NOTE: Ideally RESET_AL and CARAVEL_IO_OEB are defined only when needed, and specifically via the build process:
// `define RESET_AL        // If defined, reset is active low. I'll probably only use this for CPLD/FPGA implementations, not ASIC.
// `define CARAVEL_IO_OEB  // Drive some of Caravel's io_oeb lines. //NOTE: Probably won't be used anymore; handled by solo_squash_caravel adapter instead.

module solo_squash #(
  parameter HRES        = 640,
  parameter HF          = 16,
  parameter HS          = 96,
  parameter HB          = 48,
  parameter VRES        = 480,
  parameter VF          = 10,
  parameter VS          = 2,
  parameter VB          = 33,
  parameter paddleSize  = 64, // Height in pixels.
  parameter ballSize    = 8,  // Width and height in double-pixels.
  parameter wallWidth   = 32
)(
`ifdef USE_POWER_PINS
  inout vccd1,	      // User area 1 1.8V supply
  inout vssd1,	      // User area 1 digital ground
`endif

  input   wire  clk,          // 25MHz clock.

`ifdef RESET_AL
  input   wire  reset_n,      // Reset; active LOW (for external button).
`else
  input   wire  reset,        // Reset: active HIGH (for Caravel Wishbone compat.)
`endif

`ifdef CARAVEL_IO_OEB
  output  wire  oeb[5:0],    // These map to io_oeb[17:12].
`endif

  input   wire  pause_n,
  input   wire  new_game_n,   // Just does a minimal play state reset.
  input   wire  down_key_n,
  input   wire  up_key_n,
  output  wire  hsync,
  output  wire  vsync,
  output  wire  speaker,
  output  wire  red,
  output  wire  green,
  output  wire  blue,

  // Debug signals:
  output  wire  col0,
  output  wire  row0,
  output  wire [9:0] h_out,
  output  wire [9:0] v_out,
  output  wire [4:0] offset_out,
  output  wire  visible_out


);
  localparam HFULL        = HRES+HF+HS+HB;
  localparam VFULL        = VRES+VF+VS+VB;
  localparam BALLX_RESET  = (wallWidth+32)>>1;  // Double-pixels.
  localparam BALLY_RESET  = (wallWidth+32)>>1;  // Double-pixels.
  localparam PADDLE_RESET = wallWidth+32;
  localparam PADDLE_MIN   = wallWidth;
  localparam PADDLE_MAX   = VRES-wallWidth-paddleSize;
  localparam wallL_LIMIT  =       wallWidth;
  localparam wallR_LIMIT  = HRES -wallWidth;
  localparam wallT_LIMIT  =       wallWidth;
  localparam wallB_LIMIT  = VRES -wallWidth;

  assign h_out = h;
  assign v_out = v;
  assign offset_out = offset;
  assign visible_out = visible;

`ifdef CARAVEL_IO_OEB //NOTE: Probably won't be used anymore; handled by solo_squash_caravel adapter instead.
`ifdef RESET_AL
  assign oeb = {6{~reset}}; // AL Reset; when low, oeb must be high (to disable output).
`else //RESET_AL
  assign oeb = {6{reset}};  // AH Reset; when high, oeb is high (to disable output).
`endif //RESET_AL
`endif //CARAVEL_IO_OEB

  reg [9:0]   h         /* verilator public */; // 0..799
  reg [9:0]   v         /* verilator public */; // 0..524
  reg         inPaddle  /* verilator public */;
  reg         inBallX   /* verilator public */;
  reg         inBallY   /* verilator public */;
  reg         ballDirX  /* verilator public */;
  reg         ballDirY  /* verilator public */;
  reg         hit       /* verilator public */;
  reg [8:0]   paddle    /* verilator public */; // Typically 31..385
  reg [8:0]   ballX     /* verilator public */; // Typically 0..297 in double-sized pixels
  reg [7:0]   ballY     /* verilator public */; // Typically 15..217 in double-sized pixels
  //SMELL: Is double-sized pixels still necessary/wise?

  wire hmax     = h == (HFULL-1);       //NOTE: Because we don't care about values ABOVE hmax, we can also look for &{h[9:8], h[5:0]} i.e. 10'b11xx111111 (and in fact, can we compare exactly with this?)
  wire vmax     = v == (VFULL-1);       //NOTE: Because we don't care about values ABOVE vmax, we can also look for &{v[9],   v[3:2]} i.e. 10'b1xxxxx11xx (and in fact, can we compare exactly with this?)

  assign col0 = ~|h;
  assign row0 = ~|v;

  wire wallT    = v <  wallT_LIMIT;
  wire wallB    = v >= wallB_LIMIT;
  wire wallL    = h <  wallL_LIMIT; // This is the REGION where the left wall would be, but we don't have a left wall: It just instead is the intersection with the paddle.
  wire wallR    = h >= wallR_LIMIT; //NOTE: We don't care how wide the right wall actually is, so long as it's at least wallWidth (if this happens to help with comparison).

  //SMELL: Would it be better to use equality and set a reg to detect when we enter/leave visible regions, instead of using full comparators?
  wire visible  = h < HRES && v < VRES;

  wire up       = ~up_key_n;
  wire down     = ~down_key_n;

  always @(posedge clk) begin

`ifdef RESET_AL
    if (0==reset_n)
`else
    if (reset)
`endif
    begin
      // These parameters are a good start for a fair game:
      hit       <= 0;
      paddle    <= PADDLE_RESET;
      ballX     <= BALLX_RESET; 
      ballY     <= BALLY_RESET;
      // NOTE: ballX and ballY are double-pixel values.
      h         <= 0;
      v         <= 0;
      inPaddle  <= 0;
      inBallX   <= 0;
      inBallY   <= 0;
      ballDirX  <= 1;
      ballDirY  <= 1;
`ifdef BG_ANIMATED
      //NOTE: Resetting offset is not strictly needed,
      // but without it the blue signal is unpredictable for testing purposes.
      offset    <= 0;
`endif
    end else begin

      if (0==new_game_n) begin
        // Don't do a full reset; just reset the game state.
        // Note also that for a new game we don't reset the ball direction;
        // we don't care if this is random or not after reset.
        // These parameters are a good start for a fair game:
        hit       <= 0;
        paddle    <= PADDLE_RESET;
        ballX     <= BALLX_RESET; 
        ballY     <= BALLY_RESET;
        // NOTE: ballX and ballY are double-pixel values.
        // This code is duplicated because we want it to happen AS WELL AS the code below.
      end

      // Increment pixel counter:
      h <= hmax ? 10'b0 : h+1'b1; // Roll over horizontal scan when we've hit hmax.

      // Check whether the current pixel is entering or leaving the ball:
      inBallX <= (inBallX ? h[9:1]!=ballX+ballSize : h[9:1]==ballX) & (ballX[8:3]<=6'b100101); //(ballX<=296);
      //SMELL: Make this easier to read!

      // If the current pixel is simultaneously inside the ball and the paddle, it counts as a hit:
      if (inBallX && inBallY & inPaddle && wallL) begin
        // Ensure the ball is moving right now...
        ballDirX <= 1;
        // ...and flag the hit for our tone generator.
        //SMELL: Instead of sequencing "hit", we could probably do it with combinatorial logic that
        // checks at the START of the frame for an overlap between the current position of the ball and
        // the current position of the paddle.
        //SMELL: In fact, couldn't a lot of this be done this way instead of the inBall stuff?
        hit <= 1;
      end
      // If the ball collided with the right wall, it must now start moving left:
      else if (inBallX && wallR) ballDirX <= 0;

      // Check for collision between ball and top/bottom walls:
            if (inBallY && wallB) ballDirY <= 0;  // Make sure ball is travelling up.
      else  if (inBallY && wallT) ballDirY <= 1;  // Make sure ball is travelling down.
      //NOTE: Could we change this to something like:
      //  ballDirY <= ballDirY ? ~(inBallY & wallB) ? (inBallY & wallT);
      //...or even:
      //  if (inBallY) ballDirY <= ballDirY ? ~wallB : wallT;

      if (hmax) begin
        // Increment line counter:
        v <= vmax ? 10'b0 : v+1'b1;

        // Check whether the current line is entering or leaving the paddle:
        if (v[8:0]==paddle) begin // Only need to compare 9 bits because paddle can't exceed 511 (in fact, can't exceed PADDLE_MAX=VRES-wallWidth-paddleSize, which is nominally 384).
          //SMELL: ^ Review and simplify this.
          inPaddle <= 1;
          // If a tone was playing, stop it now. By clearing it here,
          // we got to extend the tone duration to approximately 1 frame.
          //SMELL: While this sounds good enough, I'm not sure this works exactly how I thought it would...
          //SMELL: This possibly competes with h<=1 above; I've noticed the speaker waveform is irregular during a ball-paddle collision.
          //SMELL: One thing in particular is that the tone will only start playing from the scanline of the paddle,
          // so the lower it is on screen, the shorter the tone will be.
          hit <= 0;
        end
        else if (v==paddle+paddleSize) inPaddle <= 0; //SMELL: Different bit width compared to our original IF()...?

        // Check whether the current line is entering or leaving the ball:
        inBallY <= inBallY ? v[9:1]!=ballY+ballSize : v[8:1]==ballY; //SMELL: v[9:1] is 9 bits, but ballY is 8. Does that cause any problems? Verilator doesn't like it.
        //SMELL: Review and simplify this. Or maybe it's fine as-is. 1-base offset is because the ball works on a 2x scale.

        if (vmax && 1==pause_n) begin
          // End of frame; animation can happen here...
`ifdef BG_ANIMATED
          offset <= offset + 1;
`endif

          //NOTE: Given we only increment ball and paddle positions by a multiple of 2,
          // does that mean we could drop the last bit of the paddle, ballX, and ballY registers?
          // Or does synthesis do this implicitly?
          // Maybe we could even redefine them as (say): reg [8:1] paddle -- instead of reg [8:0].

          // Update paddle position:
                if (down  && paddle <  PADDLE_MAX) paddle <= paddle+9'd2; // paddle<VRES-32-paddleSize ? //SMELL: is 9'd2 necessary? Couldn't 2'd2 mean less adder logic?
          else  if (up    && paddle >= PADDLE_MIN) paddle <= paddle-9'd2; // paddle>32 ?
          //SMELL: Because the paddle moves by a minimum of 2, we could halve its resolution (i.e. drop 1 bit).
          // However, this wouldn't be so good if we later want fine-grained rotary encoder control over the position.

          // Update ball position:
          ballX <= ballDirX ? ballX+9'd3 : ballX-9'd3; // Because ballX and ballY now represent double-sized pixels...
          ballY <= ballDirY ? ballY+8'd3 : ballY-8'd3; // ...moving by +1 here actually means moving by +2 pixels on screen.
          //SMELL: What about trying something like ballX <= ballX + (ballDirX ? 2 : -2)

        end // if (vmax)
      end //if (hmax)
    end // else (i.e. not in reset)
  end

  assign hsync = ~((HRES+HF) <= h && h < (HRES+HF+HS));
  assign vsync = ~((VRES+VF) <= v && v < (VRES+VF+VS));

  assign speaker =
    (v[5] & hit) |
    (v[6] & (
      {1'b0,ballX}>=((wallR_LIMIT>>1)-ballSize) |
      {1'b0,ballY}<(wallL_LIMIT>>1) |
      {1'b0,ballY}>=(wallB_LIMIT>>1)-ballSize)
    );

  //NOTE: The design of this is such that we'll continue to get a tone even if the ball is outside the wall.

  assign green = visible & (
    wallT | wallB | wallR |     // Wall has a green base
    (inBallX & inBallY)         // Ball is green
  );
	
  // These are used to offset the green wall "mortar" lines.
  //SMELL: Would probably be better to do away with this and just increase wallWidth a little.
	wire [4:0] v1 = v[4:0]-2;
	wire [4:0] h1 = h[4:0]-2;
	
  assign red = visible & (
    ((wallT | wallB | wallR) & (&v1[4:2] | &h1[4:2])) |     // Green wall has yellow "mortar"
    (wallL & inPaddle)          // Paddle is red
  );


`ifdef BG_ANIMATED
  reg [4:0] offset; // To slow things down, we only use the upper 4 bits of this.
  wire [9:0] oh = h - {6'b0,offset[4:1]};
  wire [9:0] ov = v - {6'b0,offset[4:1]};
`else
  //SMELL: Does this make the design needlessly more complicated, or does this get automatically optimised out?
  wire [9:0] oh = h;
  wire [9:0] ov = v;
`endif

  assign blue = visible & ~green & ~red & (
`ifdef BG_PRETTY
    // More complex pattern:
    (^(oh[4:2] ^ ov[4:2])) & ((oh[4] ^ ov[4]) ? (oh[0] & ov[0]) : (oh[0] ^ ov[0]))
`else
    // Cross-hatched checkerboard pattern:
    (oh[4] ^ ov[4]) ? (oh[0] & ov[0]) : (oh[0] ^ ov[0])
`endif
  );


endmodule
