// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

module SPIMaster_341450853309219412(
  input       clock,
  input       reset,
  
  output      tx_ready,
  input       tx_valid,
  input [7:0] tx_byte,

  // whether or not to reset CS after sending data
  input       tx_clear_cs,

  output      sclk,
  output      mosi,
  output      n_cs
);

  localparam STATE_IDLE = 2'd0,
    STATE_CS_ASSERT = 2'd1,
    STATE_TX = 2'd2,
    STATE_CS_DEASSERT = 2'd3;

  localparam TX_COUNTER_MAX = 3'h7;

  // number of cycles-1 to wait after asserting / before deasserting CS 
  localparam CS_COUNTER_MAX = 4'd10;

  reg [1:0] state;
  reg [7:0] tx_byte_reg;
  reg sclk_mask;
  reg mosi_mask;
  reg tx_ready_reg;
  reg [2:0] tx_counter_reg;
  reg n_cs_reg;
  reg tx_clear_cs_reg;
  reg [3:0] cs_delay_counter;

  assign tx_ready = tx_ready_reg;
  assign sclk = ~clock & sclk_mask;
  assign mosi = tx_byte_reg[7] & mosi_mask;
  assign n_cs = n_cs_reg;

  always @(posedge clock) begin
    if (reset) begin

      state <= STATE_IDLE;
      tx_byte_reg <= 8'h0;
      sclk_mask <= 1'b0;
      mosi_mask <= 1'b0;
      tx_ready_reg <= 1'b0;
      tx_counter_reg <= 3'd0;
      n_cs_reg <= 1'b1;
      tx_clear_cs_reg <= 1'b1;
      cs_delay_counter <= 4'd0;

    end else begin

      if (state == STATE_IDLE) begin

        tx_ready_reg <= 1'b1;

        if (tx_valid == 1'b1) begin
          tx_byte_reg <= tx_byte;
          tx_clear_cs_reg <= tx_clear_cs;
          tx_ready_reg <= 1'b0;
          n_cs_reg <= 1'b0;

          if (n_cs_reg == 1'b1) begin
            // CS is not asserted: assert it first
            state <= STATE_CS_ASSERT;
          end else begin
            // CS is already asserted: transition to TX
            state <= STATE_TX;
            sclk_mask <= 1'b1;
            mosi_mask <= 1'b1;
          end
        end

      end else if (state == STATE_CS_ASSERT) begin

        // assert CS before transitioning to TX
        if (cs_delay_counter == CS_COUNTER_MAX) begin

          cs_delay_counter <= 4'd0;
          state <= STATE_TX;
          sclk_mask <= 1'b1;
          mosi_mask <= 1'b1;

        end else begin
          cs_delay_counter <= cs_delay_counter + 4'd1;
        end

      end else if (state == STATE_TX) begin

        tx_byte_reg <= {tx_byte_reg[6:0], 1'b0};

        if (tx_counter_reg == TX_COUNTER_MAX) begin
          tx_counter_reg <= 3'd0;
          sclk_mask <= 1'b0;
          mosi_mask <= 1'b0;

          // check if CS needs to be reset
          if (tx_clear_cs_reg == 1'b1) begin
            state <= STATE_CS_DEASSERT;
          end else begin
            state <= STATE_IDLE;
          end
        end else begin
          tx_counter_reg <= tx_counter_reg + 3'd1;
        end

      end else if (state == STATE_CS_DEASSERT) begin

        // wait before deasserting CS and transitioning to idle

        if (cs_delay_counter == CS_COUNTER_MAX) begin

          if (n_cs_reg == 1'b0) begin

            cs_delay_counter <= 4'd0;
            n_cs_reg <= 1'b1;

          end else begin

            cs_delay_counter <= 4'd0;
            state <= STATE_IDLE;

          end

        end else begin
          cs_delay_counter <= cs_delay_counter + 4'd1;
        end

      end
    end
  end

endmodule

// Combinational logic to compute current color given row/column indices
module LEDColor_341450853309219412(
  input [2:0]   row_idx,
  input [2:0]   col_idx,
  input [5:0]   pixel_offset,

  output [7:0]  pixel
);

  wire [2:0] red;
  wire [2:0] green;
  wire [1:0] blue;
  wire is_diagonal;

  wire [5:0] green_sum;
  wire [5:0] blue_sum;

  assign green_sum = {3'd0, col_idx} + pixel_offset;
  assign blue_sum = {3'd0, row_idx} + pixel_offset;

  // generate moving diagonal
  assign is_diagonal = ((row_idx + col_idx) == pixel_offset[2:0]) ? 1'b1 : 1'b0;

  // generate white when on diagonal, otherwise moving blend of green/blue
  assign red = (is_diagonal == 1'b1) ? 3'd7 : 3'd0;
  assign green = (is_diagonal == 1'b1) ? 3'd7 : green_sum[2:0];
  assign blue = (is_diagonal == 1'b1) ? 2'd3 : blue_sum[1:0];

  assign pixel = {red, 5'd0} | {3'd0, green, 2'd0} | {6'd0, blue};

endmodule

// Matrix driver
module LEDMatrix_341450853309219412(
  input         clock,
  input         reset,
  
  output        sclk,
  output        mosi,
  output        n_cs
);

  localparam STATE_RESET_FRAME_INDEX = 1'd0,
    STATE_SEND_PIXELS = 1'd1;

  // command to reset frame index
  localparam CMD_RESET_FRAME_INDEX = 8'h26;

  localparam PIXEL_MAX = 6'h3f;

  reg [0:0] state;
  reg [1:0] state_rfi;
  reg [1:0] state_sp;

  reg [5:0] pixel_counter;

  reg [5:0] pixel_offset;

  reg tx_valid;
  reg tx_clear_cs;

  wire tx_ready;
  wire [7:0] tx_byte;

  wire [2:0] row_idx;
  wire [2:0] col_idx;
  wire [7:0] pixel;

  assign tx_byte = (state == STATE_RESET_FRAME_INDEX) ? CMD_RESET_FRAME_INDEX : pixel;

  assign row_idx = pixel_counter[5:3];
  assign col_idx = pixel_counter[2:0];

  SPIMaster_341450853309219412 spi_master_inst(
    .clock(clock),
    .reset(reset),

    .tx_ready(tx_ready),
    .tx_valid(tx_valid),
    .tx_byte(tx_byte),
    .tx_clear_cs(tx_clear_cs),

    .sclk(sclk),
    .mosi(mosi),
    .n_cs(n_cs)
  );

  LEDColor_341450853309219412 led_color_inst(
    .row_idx(row_idx),
    .col_idx(col_idx),
    .pixel_offset(pixel_offset),

    .pixel(pixel)
  );

  always @(posedge clock) begin
    if (reset) begin
      state <= STATE_RESET_FRAME_INDEX;

      pixel_counter <= 6'h0;
      pixel_offset <= 6'h0;

      tx_valid <= 1'b0;
      tx_clear_cs <= 1'b0;
    end else begin

      if (state == STATE_RESET_FRAME_INDEX) begin

        if (tx_ready == 1'b1) begin

          // send command to reset frame index

          tx_valid <= 1'b1;
          tx_clear_cs <= 1'b1;
        end else if (tx_valid == 1'b1) begin
          
          // TX accepted, transition to next state

          state <= STATE_SEND_PIXELS;
          tx_valid <= 1'b0;
        end

      end else if (state == STATE_SEND_PIXELS) begin

        if (tx_ready == 1'b1) begin

          // send pixel data

          tx_valid <= 1'b1;

          if (pixel_counter == PIXEL_MAX) begin
            // sending last pixel, so clear CS after
            tx_clear_cs <= 1'b1;
          end else begin
            tx_clear_cs <= 1'b0;
          end

        end else if (tx_valid == 1'b1) begin

          // TX accepted, transition to next state

          tx_valid <= 1'b0;

          if (pixel_counter == PIXEL_MAX) begin
            // sending last pixel
            state <= STATE_RESET_FRAME_INDEX;
            pixel_counter <= 6'h0;
            pixel_offset <= pixel_offset + 6'h1;
          end else begin
            pixel_counter <= pixel_counter + 6'h1;
          end

        end
      end
    end
  end

endmodule

// simple animation on 7-seg display
module SevenSeg_341450853309219412(
  input         clock,
  input         reset,

  output        up,
  output        right,
  output        down,
  output        left
);

  localparam COUNTER_MAX = 8'hff;

  // counter to increment upon every clock
  reg [7:0] counter;

  // state to increment upon every counter wrap
  reg [1:0] state;

  // set outputs using combinational logic based on state
  assign up = (state == 2'd0) ? 1'b1 : 1'b0;
  assign right = (state == 2'd1) ? 1'b1 : 1'b0;
  assign down = (state == 2'd2) ? 1'b1 : 1'b0;
  assign left = (state == 2'd3) ? 1'b1 : 1'b0;

  always @(posedge clock) begin
    if (reset) begin

      counter <= 8'h0;
      state <= 2'h0;
      
    end else begin

      // increment counter upon clock cycle
      counter <= counter + 8'd1;

      // increment state upon counter wrap
      if (counter == COUNTER_MAX) begin
        state <= state + 2'd1;
      end

    end
  end

endmodule

// Reset synchroniser
module AsyncReset_341450853309219412(
  input   clock,
  input   reset_async,

  output  reset_sync
);

  reg [2:0] reset_fifo;

  assign reset_sync = reset_fifo[0];

  always @(posedge clock or posedge reset_async) begin
    if (reset_async == 1'b1) begin
      reset_fifo <= 3'h7;
    end else begin
      reset_fifo <= {1'b0, reset_fifo[2:1]};
    end
  end

endmodule

module user_module_341450853309219412(
  input [7:0] io_in,
  output [7:0] io_out
);

  wire clock;
  wire reset_async;
  wire reset_sync;

  // LED matrix wires
  wire sclk;
  wire mosi;
  wire n_cs;

  // 7-seg wires
  wire up;
  wire right;
  wire down;
  wire left;

  assign clock = io_in[0];
  assign reset_async = io_in[1];

  // drive LED matrix
  assign io_out[0] = sclk;
  assign io_out[1] = mosi;
  assign io_out[5] = n_cs;

  // use lower 7-seg LEDs for animation
  assign io_out[6] = up;
  assign io_out[2] = right;
  assign io_out[3] = down;
  assign io_out[4] = left;

  assign io_out[7] = 1'b1;

  AsyncReset_341450853309219412 async_reset_inst(
    .clock(clock),
    .reset_async(reset_async),
    .reset_sync(reset_sync)
  );

  LEDMatrix_341450853309219412 ledmatrix_inst(
    .clock(clock),
    .reset(reset_sync),

    .sclk(sclk),
    .mosi(mosi),
    .n_cs(n_cs)
  );

  SevenSeg_341450853309219412 sevenseg_inst(
    .clock(clock),
    .reset(reset_sync),

    .up(up),
    .right(right),
    .down(down),
    .left(left)
  );

endmodule
