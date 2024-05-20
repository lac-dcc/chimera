// This program was cloned from: https://github.com/ccattuto/tt07-serial-charmatrix
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Ciro Cattuto
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_ccattuto_charmatrix (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);


// -------------- I/O PINS ---------------------------

// All output pins must be assigned. If not used, assign to 0.
assign uio_out = 0;
assign uio_oe  = 0;
assign uo_out[3:2] = 0;
assign uo_out[6:5] = 0;

// UART RX
wire uart_rx;
assign uart_rx = ui_in[3];

// UART TX
wire uart_tx;
assign uo_out[4] = uart_tx;

// UART RX valid
assign uo_out[7] = uart_rx_valid;

// LED strip signal
assign uo_out[0] = ledstrip;

// LED strip latch signal
assign uo_out[1] = ledstrip_latch;

// number of characters selector
wire [1:0] config_sel;
assign config_sel = ui_in[1:0];

// UART loopback config
assign uart_tx_en = ui_in[2];

// LED dimmer selector
wire [1:0] dimmer_sel;
assign dimmer_sel = ui_in[5:4];

// internal/external refresh selector
wire ext_refresh;
assign ext_refresh = ui_in[6];

// random/fixed color selector
wire color_sel;
assign color_sel = ui_in[7];

// reset
wire boot_reset;
assign boot_reset = ~rst_n;


// -------------- CONFIG ROM -----------------------------

wire [2:0] num_chars;
wire [8:0] num_leds;

config_rom config_rom_inst (
    .sel(config_sel),
    .num_chars(num_chars),
    .num_leds(num_leds)
);


// -------------- UART RECEIVER ---------------------------

wire uart_rx_en, uart_tx_en;
assign uart_rx_en = 1;

// UART RX
wire [7:0]  uart_rx_data;
wire        uart_rx_valid;
wire        uart_rx_error;
wire        uart_rx_overrun;
reg         uart_rx_ready;

UARTReceiver #(
    .CLOCK_RATE(20000000),
    .BAUD_RATE(9600)
) UARTReceiver_inst (
    .clk(clk),
    .reset(boot_reset),       // reset
    .enable(uart_rx_en),      // RX enable
    .in(uart_rx),             // RX signal
    .ready(uart_rx_ready),    // ready to consume RX data
    .out(uart_rx_data),       // RX byte
    .valid(uart_rx_valid),    // RX byte is valid
    .error(uart_rx_error),    // RX error
    .overrun(uart_rx_overrun) // RX overrun
);


// -------------- UART TRANSMITTER ---------------------------

reg         uart_tx_valid;
wire        uart_tx_ready;

UARTTransmitter #(
    .CLOCK_RATE(20000000),
    .BAUD_RATE(9600)
) UARTTransmitter_inst (
    .clk(clk),
    .reset(boot_reset),       // reset
    .enable(uart_tx_en),      // TX enable
    .valid(uart_tx_valid),    // start of TX
    .in(uart_rx_data),        // data to transmit - LOOPBACK
    .out(uart_tx),            // TX signal
    .ready(uart_tx_ready)     // read for TX data
);

// -------------- CHARACTER ROM ---------------------------

reg [7:0] char_index;
wire [34:0] char_data;

char_rom #(.DATA_WIDTH(35), .ADDR_WIDTH(8)) char_rom_inst (
    .address(char_index),
    .data(char_data)
);

// -------------- COLOR ROM ---------------------------

reg [3:0] color_index;
wire [23:0] color_data;

color_rom #(.DATA_WIDTH(24), .ADDR_WIDTH(4)) color_rom_inst (
    .address(color_index),
    .dimmer(dimmer_sel),
    .data(color_data)
);


// -------------- RNG ---------------------------

wire rng;

lfsr_rng lfsr_rng_inst (
  .clk(clk),
  .reset(boot_reset),
  .random_bit(rng)
);

// 4-bit shift register, used as index in color ROM (16 different colors)
reg [3:0] rnd_color;
always @(posedge clk) begin
  rnd_color <= {rnd_color[2:0], rng};
end


// -------------- WS2812B LED STRIP ---------------------------

wire [23:0] ledstrip_data;
reg ledstrip_valid;
wire ledstrip_latch;
wire ledstrip_ready;
wire ledstrip;

ws2812b ws2812b_inst (
  .clk20(clk),      // 20 MHz input clock
  .reset(boot_reset),
  .data_in(ledstrip_data),
  .valid(ledstrip_valid),
  .latch(ledstrip_latch),
  .ready(ledstrip_ready),
  .led(ledstrip)           // output signal to the LED strip
);


// -------------- STATE MACHINE ---------------------------

localparam MAX_CHARS = 8;
localparam CHAR_LEDS = 5 * 7; // 5x7 char matrix

// state machine
localparam IDLE = 0, LATCH_CHAR = 1, DELAY = 2, WAIT_START = 3;
reg [1:0] state;

// character and color buffers
reg [7:0] textbuf[0:MAX_CHARS-1];
reg [3:0] colorbuf[0:MAX_CHARS-1];

// character generation logic
assign ledstrip_data = (char_data[char_led_index]) ? color_data : 24'b0;
assign ledstrip_latch = (led_index == num_leds) ? 1 : 0;

reg [$clog2(MAX_CHARS)-1:0] textbuf_index;
reg [8:0] led_index;
reg [5:0] char_led_index;

reg [17:0] counter;

always @(posedge clk) begin
  if (boot_reset) begin
    char_index <= 0;
    color_index <= 0;
    led_index <= 0;
    char_led_index <= 0;
    textbuf_index <= 0;
    state <= IDLE;
    ledstrip_valid <= 0;
    counter <= 0;
  end else begin
    counter <= counter + 1;

    case (state)
      IDLE: begin
        led_index <= 0;
        char_led_index <= 0;
        ledstrip_valid <= 0;
        if ((~ext_refresh & &counter) || (ext_refresh & trig_refresh)) begin // trigger refresh
          textbuf_index <= textbuf_base;
          state <= LATCH_CHAR;
        end
      end

      LATCH_CHAR: begin
        if (ledstrip_ready) begin         // wait for driver to become ready
          if (char_led_index == 0) begin  // only latch at 1st pixel of character
            char_index <= textbuf[textbuf_index];
            color_index <= colorbuf[textbuf_index];
          end
          state <= DELAY;
        end
      end

      DELAY: begin
        // trigger LED strip driver and delay so that ledstrip_data settles
        ledstrip_valid <= 1;
        state <= WAIT_START;
      end

      WAIT_START: begin
        if (!ledstrip_ready) begin  // wait for driver to start sending 
          ledstrip_valid <= 0;

          if (char_led_index < CHAR_LEDS-1) begin
            char_led_index <= char_led_index + 1;
          end else begin
            char_led_index <= 0;
            if (textbuf_index < num_chars) begin
              textbuf_index <= textbuf_index + 1;
            end else begin
              textbuf_index <= 0;
            end
          end

          led_index <= led_index + 1;
          if (led_index < num_leds) begin
            state <= LATCH_CHAR;
          end else begin
            state <= IDLE;
          end
        end
      end

      default: begin
        state <= IDLE;
      end

    endcase
  end
end


// -------------- UART RX ---------------------------

integer i;
reg [$clog2(MAX_CHARS)-1:0] textbuf_base;
reg trig_refresh;
reg [3:0] fixed_color;

always @(posedge clk) begin
  if (boot_reset) begin
    uart_rx_ready <= 0;
    uart_tx_valid <= 0;
    textbuf_base <= 0;
    for (i=0; i < MAX_CHARS; i=i+1) begin
      textbuf[i] <= 8'b0;
      colorbuf[i] <= 4'b0;
    end
    trig_refresh <= 0;
    fixed_color <= 0;
  end else begin
    if (!(uart_rx_valid & uart_rx_ready)) begin
      uart_rx_ready <= 1;
      if (uart_tx_valid & uart_tx_ready) begin
        uart_tx_valid <= 0;
      end
      if (ledstrip_ready) begin
        trig_refresh <= 0;
      end
    end else begin // VALID & READY => process RX byte
      uart_rx_ready <= 0;
      uart_tx_valid <= 1; // start TX

      // LF -> refresh
      if (ext_refresh && ((uart_rx_data == 13) || (uart_rx_data == 10))) begin
        trig_refresh <= 1;
      end else if (uart_rx_data[7]) begin
        fixed_color <= uart_rx_data[3:0];
      end else begin

        textbuf[textbuf_base] <= uart_rx_data;
        colorbuf[textbuf_base] <= (color_sel) ? fixed_color : rnd_color;

        if (textbuf_base < num_chars) begin
          textbuf_base <= textbuf_base + 1;
        end else begin
          textbuf_base <= 0;
        end

      end
    end
  end
end

endmodule
