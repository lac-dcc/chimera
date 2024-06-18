// This program was cloned from: https://github.com/ccattuto/tt07-conway-term
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Ciro Cattuto <ciro.cattuto@gmail.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_ccattuto_conway (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;
  assign uo_out[3:0] = 0;
  assign uo_out[7:5] = 0;

  // UART signals
  wire uart_rx, uart_tx;
  assign uart_rx = ui_in[3];
  assign uart_tx = uo_out[4];

  // clock
  wire clk48;
  assign clk48 = clk;

  // reset
  wire boot_reset;
  assign boot_reset = ~rst_n;


// RNG

wire rng;

lfsr_rng lfsr(
  .clk(clk48),
  .reset(boot_reset),
  .random_bit(rng)
);

wire uart_tx_en, uart_rx_en;
assign uart_tx_en = 1;
assign uart_rx_en = 1;

// UART TX
reg [7:0]   uart_tx_data;
reg         uart_tx_valid;
wire        uart_tx_ready;

// UART RX
wire [7:0]  uart_rx_data;
wire        uart_rx_valid;
wire        uart_rx_error;
wire        uart_rx_overrun;
reg         uart_rx_ready;

UARTTransmitter #(
    .CLOCK_RATE(24000000),
    .BAUD_RATE(115200)
) uart_tx_inst (
    .clk(clk48),
    .reset(boot_reset),       // reset
    .enable(uart_tx_en),      // TX enable
    .valid(uart_tx_valid),    // start of TX
    .in(uart_tx_data),        // data to transmit
    .out(uart_tx),            // TX signal
    .ready(uart_tx_ready)     // read for TX data
);

UARTReceiver #(
    .CLOCK_RATE(24000000),
    .BAUD_RATE(115200)
) uart_rx_inst (
    .clk(clk48),
    .reset(boot_reset),       // reset
    .enable(uart_rx_en),      // RX enable
    .in(uart_rx),             // RX signal
    .ready(uart_rx_ready),    // ready to consume RX data
    .out(uart_rx_data),       // RX wires
    .valid(uart_rx_valid),    // RX completed
    .error(uart_rx_error),    // RX error
    .overrun(uart_rx_overrun) // RX overrun
);

/// board control

parameter logWIDTH = 5, logHEIGHT = 4;
parameter WIDTH = 2 ** logWIDTH;
parameter HEIGHT = 2 ** logHEIGHT;
parameter BOARD_SIZE = WIDTH * HEIGHT;
reg board_state [0:BOARD_SIZE-1];
reg board_state_next [0:BOARD_SIZE-1];

parameter ACTION_IDLE = 0, ACTION_INIT = 1, ACTION_UPDATE = 2, ACTION_COPY = 3, ACTION_DISPLAY = 4, ACTION_WAIT = 5;
reg [2:0] action;
reg action_init_complete, action_update_complete, action_copy_complete, action_display_complete;

reg running;
reg tick;
reg [31:0] timer;
parameter UPDATE_INTERVAL = 24000000 / 5;

always @(posedge clk48) begin
  if (boot_reset) begin
    action <= ACTION_WAIT;
    running <= 0;
    timer <= 0;
    tick <= 0;
    uart_rx_ready <= 0;
  end else begin
    case (action)
      ACTION_WAIT: begin
        if (!(uart_rx_valid & uart_rx_ready)) begin
          uart_rx_ready <= 1;
        end else begin
          action <= ACTION_INIT;
          uart_rx_ready <= 0;
        end
      end

      ACTION_IDLE: begin
        if (uart_rx_valid & uart_rx_ready) begin
          uart_rx_ready <= 0;
          
          case (uart_rx_data)
            48: begin
              action <= ACTION_INIT;
            end

            49: begin
              if (~running) begin
                action <= ACTION_UPDATE;
              end else begin
                running <= 0;
                timer <= 0;
                tick <= 0;
              end
            end

            32: begin
              running <= ~running;
              timer <= 0;
              tick <= 0;
            end

            default: begin
              action <= ACTION_IDLE;
            end
          endcase
        end else if (uart_rx_valid) begin
          uart_rx_ready <= 1;
        end else if (running) begin
          if (timer < UPDATE_INTERVAL) begin
            timer <= timer + 1;
          end else begin
            tick <= ~tick;
            timer <= 0;
            uart_rx_ready <= 0;
            action <= ACTION_UPDATE;
          end
        end
      end

      ACTION_DISPLAY: begin
        if (action_display_complete) begin
          action <= ACTION_IDLE;
        end
      end

      ACTION_INIT: begin
        if (action_init_complete)
          action <= ACTION_DISPLAY;
      end

      ACTION_UPDATE: begin
        if (action_update_complete)
          action <= ACTION_COPY;
      end

      ACTION_COPY: begin
        if (action_copy_complete)
          action <= ACTION_DISPLAY;
      end

      default: begin
        action <= ACTION_IDLE;
      end
    endcase
  end
end


reg [logWIDTH+logHEIGHT-1:0] index2;

always @(posedge clk48) begin
  if (boot_reset) begin
    action_init_complete <= 0;
    index2 <= 0;
  end else if (action == ACTION_INIT) begin
    board_state[index2] <= rng;
    if (index2 < BOARD_SIZE - 1) begin
      index2 <= index2 + 1;
    end else  begin
      index2 <= 0;
      action_init_complete <= 1;
    end
  end else begin
    action_init_complete <= 0;
  end
end

reg [logWIDTH+logHEIGHT-1:0] index3;
reg [3:0] neigh_index;
reg [3:0] num_neighbors;

wire [logWIDTH-1:0] cell_x;
wire [logHEIGHT-1:0] cell_y;
assign cell_x = index3[logWIDTH-1:0];
assign cell_y = index3[logWIDTH+logHEIGHT-1:logWIDTH];
parameter WIDTH_MASK = {logWIDTH{1'b1}};

always @(posedge clk48) begin
  if (boot_reset) begin
    action_update_complete <= 0;
    index3 <= 0;
    neigh_index <= 0;
    num_neighbors <= 0;
  end else if (action == ACTION_UPDATE) begin
    neigh_index <= neigh_index + 1;
    case (neigh_index)
      0: begin // (-1, +1)
        num_neighbors <= num_neighbors + board_state[(cell_y + 1) << logWIDTH | ((cell_x - 1) & WIDTH_MASK)];
      end

      1: begin // (0, +1)
        num_neighbors <= num_neighbors + board_state[(cell_y + 1) << logWIDTH | ((cell_x + 0) & WIDTH_MASK)];
      end

      2: begin // (+1, +1)
        num_neighbors <= num_neighbors + board_state[(cell_y + 1) << logWIDTH | ((cell_x + 1) & WIDTH_MASK)];
      end

      3: begin // (-1, 0)
        num_neighbors <= num_neighbors + board_state[(cell_y + 0) << logWIDTH | ((cell_x - 1) & WIDTH_MASK)];
      end

      4: begin // (+1, 0)
        num_neighbors <= num_neighbors + board_state[(cell_y + 0) << logWIDTH | ((cell_x + 1) & WIDTH_MASK)];
      end

      5: begin // (-1, -1)
        num_neighbors <= num_neighbors + board_state[(cell_y - 1) << logWIDTH | ((cell_x - 1) & WIDTH_MASK)];
      end

      6: begin // (0, -1)
        num_neighbors <= num_neighbors + board_state[(cell_y - 1) << logWIDTH | ((cell_x + 0) & WIDTH_MASK)];
      end

      7: begin // (+1, -1)
        num_neighbors <= num_neighbors + board_state[(cell_y - 1) << logWIDTH | ((cell_x + 1) & WIDTH_MASK)];
        //num_neighbors <= 3;
      end

      8: begin
        board_state_next[index3] <= (board_state[index3] && (num_neighbors == 2)) | (num_neighbors == 3);
        //board_state_next[index3] <= ~board_state[index3];

        neigh_index <= 0;
        num_neighbors <= 0;

        if (index3 < BOARD_SIZE - 1) begin
          index3 <= index3 + 1;
        end else begin
          index3 <= 0;
          action_update_complete <= 1;
        end
      end

      default: begin
      end
    endcase
  end else begin
    action_update_complete <= 0;
  end 
end


reg [logWIDTH+logHEIGHT-1:0] index4;

always @(posedge clk48) begin
  if (boot_reset) begin
    action_copy_complete <= 0;
    index4 <= 0;
  end else if (action == ACTION_COPY) begin
    board_state[index4] <= board_state_next[index4];
    if (index4 < BOARD_SIZE - 1) begin
      index4 <= index4 + 1;
    end else begin
      index4 <= 0;
      action_copy_complete <= 1;
    end
  end else begin
    action_copy_complete <= 0;
  end
end


/// UART printout

parameter STRING_INIT_LEN = 57;
reg [7:0] string_init [0:STRING_INIT_LEN-1];
initial begin
  $readmemh("string_init.hex", string_init);
end

parameter TX_IDLE = 0, TX_SEND = 1, TX_WAIT = 2, TX_SEND_CRLF = 3, TX_WAIT_CRLF = 4, TX_SEND_HOME = 5, TX_WAIT_HOME = 6, TX_INIT = 7, TX_WAIT_INIT = 8;
reg [3:0] txstate;
reg [logWIDTH+logHEIGHT-1:0] index;
reg [6:0] txindex;
reg [7:0] colindex;

always @(posedge clk48) begin
  if (boot_reset) begin
    uart_tx_valid <= 0;
    index <= 0;
    txindex <= 0;
    colindex <= 0;
    action_display_complete <= 0;
    txstate <= TX_INIT;
  end else if (action == ACTION_DISPLAY) begin
        case (txstate)
          TX_IDLE: begin
            uart_tx_valid <= 0;
            index <= 0;
            txindex <= 0;
            colindex <= 0;
            if (action_display_complete == 0) begin
              txstate <= TX_SEND_HOME;
            end
          end

          TX_SEND: begin
            if (colindex < WIDTH) begin
              uart_tx_data <= board_state[index] ? 79 : 32; // "O" vs " "
              index <= index + 1;
              colindex <= colindex + 1;
              txstate <= TX_WAIT;
            end else begin
              colindex <= 0;
              txstate <= TX_SEND_CRLF;
            end
          end

          TX_WAIT: begin
            if (uart_tx_ready && !uart_tx_valid ) begin
              uart_tx_valid <= 1;
            end else if (uart_tx_valid && !uart_tx_ready) begin
              uart_tx_valid <= 0;
              if (index != 0) begin
                txstate <= TX_SEND;
              end else begin
                txstate <= TX_IDLE;      
                action_display_complete <= 1;
              end
            end
          end        

          TX_SEND_CRLF: begin
            if (txindex < 2) begin
              uart_tx_data <= (txindex == 0) ? 13 : 10;
              txindex <= txindex + 1;
              txstate <= TX_WAIT_CRLF;
            end else begin
              txindex <= 0;
              txstate <= TX_SEND;              
            end
          end

          TX_WAIT_CRLF: begin
            if (uart_tx_ready && !uart_tx_valid ) begin
              uart_tx_valid <= 1;
            end else if (uart_tx_valid && !uart_tx_ready) begin
              uart_tx_valid <= 0;
              txstate <= TX_SEND_CRLF;
            end
          end        

          TX_SEND_HOME: begin
            if (txindex < 4) begin
              case (txindex)
                0: begin
                  uart_tx_data <= 27;
                end
                1: begin
                  uart_tx_data <= 91;
                end
                2: begin
                  uart_tx_data <= 59;
                end
                3: begin
                  uart_tx_data <= 72;
                end
                default:
                  uart_tx_data <= 0;
              endcase
              txindex <= txindex + 1;
              txstate <= TX_WAIT_HOME;
            end else begin
              txindex <= 0;
              txstate <= TX_SEND;
            end
          end

          TX_WAIT_HOME: begin
            if (uart_tx_ready && !uart_tx_valid ) begin
              uart_tx_valid <= 1;
            end else if (uart_tx_valid && !uart_tx_ready) begin
              uart_tx_valid <= 0;
              txstate <= TX_SEND_HOME;
            end
          end     

          TX_INIT: begin
            if (txindex < STRING_INIT_LEN) begin
              uart_tx_data <= string_init[txindex];
              txindex <= txindex + 1;
              txstate <= TX_WAIT_INIT;    
            end else begin
              txstate <= TX_IDLE;
              action_display_complete <= 1;    
            end
          end

          TX_WAIT_INIT: begin
            if (uart_tx_ready && !uart_tx_valid ) begin
              uart_tx_valid <= 1;
            end else if (uart_tx_valid && !uart_tx_ready) begin
              uart_tx_valid <= 0;
              txstate <= TX_INIT;
            end
          end

          default: begin
            txstate <= TX_IDLE;
          end
        endcase
  end else begin
    action_display_complete <= 0;
  end
end

endmodule
