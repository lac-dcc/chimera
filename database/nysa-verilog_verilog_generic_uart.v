// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//UART Version 3
/*
Distributed under the MIT license.
Copyright (c) 2014 Cospan Design LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/




`include "project_defines.v"
`timescale 1 ns/1 ps

`define PRESCALER_COUNT 16
`define BIT_LENGTH 8

`define FULL_PERIOD (`PRESCALER_COUNT    )
`define HALF_PERIOD (`PRESCALER_COUNT / 2)


module uart #(
  parameter DEFAULT_BAUDRATE  = 115200,
  parameter STOP_BITS         = 1
)(
  input               clk,
  input               rst,

  output  reg         tx,
  input               transmit,
  input       [7:0]   tx_byte,
  output              is_transmitting,

  input               rx,
  output  reg         rx_error,
  output  reg [7:0]   rx_byte,
  output  reg         received,
  output              is_receiving,

  output      [31:0]  prescaler, //output this so the user can use it to calculate a baudrate

  input               set_clock_div,

  input       [31:0]  user_clock_div,
  output      [31:0]  default_clock_div
);

//Local Parameters

//Receive State Machine
localparam  RX_IDLE           = 0;
localparam  RX_CHECK_START    = 1;
localparam  RX_READING        = 2;
localparam  RX_CHECK_STOP     = 3;
localparam  RX_DELAY_RESTART  = 4;
localparam  RX_ERROR          = 5;
localparam  RX_RECEIVED       = 6;

//Transmit State Machine
localparam  TX_IDLE           = 0;
localparam  TX_SENDING        = 1;
localparam  TX_FINISHED       = 2;

//Registers/Wires

//Receive Register
reg         [2:0]             rx_state;
reg         [3:0]             rx_bit_count;
reg         [7:0]             rx_data;
reg         [31:0]            rx_clock_div;
reg         [31:0]            rx_clock_div_count;
reg         [31:0]            rx_prescaler_count;

//Transmit Register
reg         [2:0]             tx_state;
reg         [3:0]             tx_bit_count;
reg         [7:0]             tx_data;
reg         [31:0]            tx_clock_div;
reg         [31:0]            tx_prescaler_count;
reg         [31:0]            tx_clock_div_count;

//Submodules
//Asynchronous Logic

assign      prescaler         = `CLOCK_RATE / (`PRESCALER_COUNT);
assign      default_clock_div = `CLOCK_RATE / (`PRESCALER_COUNT * DEFAULT_BAUDRATE);
assign      is_receiving      = (rx_state != RX_IDLE);
assign      is_transmitting   = (tx_state != TX_IDLE);
//Synchronous Logic
always @ (posedge clk) begin
  if (rst || set_clock_div) begin
    rx_state                  <=  RX_IDLE;

    rx_bit_count              <=  0;

    rx_clock_div_count        <=  0;
    rx_clock_div              <=  `FULL_PERIOD;

    rx_data                   <=  0;
    rx_byte                   <=  0;
    rx_error                  <=  0;
    if (set_clock_div) begin
      rx_clock_div            <=  user_clock_div;
    end
    else begin
      rx_clock_div            <=  default_clock_div;
    end
  end
  else begin
    //Strobed
    received                  <=  0;
    rx_error                  <=  0;

    //have we passed the clock divider count
    rx_clock_div_count        <=  rx_clock_div_count + 1;
    if (rx_clock_div_count >= rx_clock_div) begin
       rx_prescaler_count     <=  rx_prescaler_count + 1;
      rx_clock_div_count      <=  0;
    end

    //Receive State Machine
    case (rx_state)
      RX_IDLE: begin
        //--*__ __|XX XX|XX XX|XX XX|XX XX|XX XX|XX XX|XX XX|XX XX|-- --
        rx_prescaler_count    <=  0;
        rx_data               <=  0;
        rx_bit_count          <=  0;
        if (!rx) begin
          rx_state            <=  RX_CHECK_START;
        end
        else begin
          rx_clock_div_count  <=  0;
        end
      end
      RX_CHECK_START: begin
        //--|__*__|XX XX|XX XX|XX XX|XX XX|XX XX|XX XX|XX XX|XX XX|-- --
        if (rx_prescaler_count >= (`HALF_PERIOD)) begin
          rx_prescaler_count  <=  0;
          if (!rx) begin
            rx_state          <=  RX_READING;
          end
          else begin
            rx_state          <=  RX_IDLE;
          end
        end
      end
      RX_READING: begin
        //--|__ __|XX*XX|XX*XX|XX*XX|XX*XX|XX*XX|XX*XX|XX*XX|XX*XX|-- --
        if (rx_prescaler_count >= (`FULL_PERIOD)) begin
          rx_data             <=  {rx, rx_data[7:1]};
          rx_prescaler_count  <=  0;
          if (rx_bit_count    >=  7) begin
            //Finished
            rx_state          <=  RX_CHECK_STOP;
          end
          else begin
            rx_bit_count      <=  rx_bit_count + 1;
          end
        end
      end
      RX_CHECK_STOP: begin
        //--|__ __|XX XX|XX XX|XX XX|XX XX|XX XX|XX XX|XX XX|XX XX|--*--
        if (rx_prescaler_count >= (`FULL_PERIOD)) begin
          if (rx) begin
            rx_byte           <=  rx_data;
            //$display ("FOUND DATA!!!: %h", rx_data);
            received          <=  1;
            rx_state          <=  RX_IDLE;
          end
          else begin
            rx_error          <=  1;
            rx_state          <=  RX_IDLE;
          end
        end
      end
      default: begin
        rx_state              <=  RX_IDLE;
      end
    endcase
  end
end

always @ (posedge clk) begin
  if (rst || set_clock_div) begin
    tx                        <=  1;
    tx_state                  <=  TX_IDLE;
    tx_data                   <=  0;
    tx_bit_count              <=  0;
    tx_clock_div_count        <=  0;
    tx_prescaler_count        <=  0;

    if (set_clock_div) begin
      tx_clock_div            <=  user_clock_div;
    end
    else begin
      tx_clock_div            <=  default_clock_div;
    end
  end
  else begin

    //have we passed the clock divider count
    tx_clock_div_count        <=  tx_clock_div_count + 1;
    if (tx_clock_div_count >= tx_clock_div) begin
      tx_prescaler_count      <=  tx_prescaler_count + 1;
      tx_clock_div_count      <=  0;
    end

    case (tx_state)
      TX_IDLE: begin
        tx                    <=  1;
        tx_clock_div_count    <=  1;
        tx_prescaler_count    <=  0;
        if (transmit) begin
          tx                  <=  0;
          tx_data             <=  tx_byte;
          tx_bit_count        <=  0;
          tx_state            <=  TX_SENDING;
        end
      end
      TX_SENDING: begin
        if (tx_prescaler_count >= (`FULL_PERIOD)) begin
          tx_prescaler_count  <=  0;
          if (tx_bit_count < 8) begin
            tx                <=  tx_data[0];
            tx_data           <=  {1'b0, tx_data[7:1]};
            tx_bit_count      <=  tx_bit_count + 1;
          end
          else begin
            tx                <=  1;
            tx_state          <=  TX_FINISHED;
          end
        end
      end
      TX_FINISHED: begin
        if (tx_prescaler_count >= (STOP_BITS * `FULL_PERIOD)) begin
          tx_state            <=  TX_IDLE;
        end
      end
      default: begin
        tx_state              <=  TX_IDLE;
      end
    endcase
  end

end


endmodule
