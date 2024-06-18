// This program was cloned from: https://github.com/ccattuto/tt07-conway-term
// License: Apache License 2.0

//
// Simple Verilog implementation of an UART transmitter
//
//  - 8N1 only (8-bit data word, 1 start bit, 1 stop bit)
//  - "ready" is high when ready for TX
//  - user drives "valid" high for 1 clock cycle to start TX
//  - internal baud rate generation
//  - tested on an FPGA at 115200 baud driven by a 48 MHz clock
//
//
// MIT License
//
// Copyright (c) 2024 Ciro Cattuto <ciro.cattuto@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// Originally based on Dmitry Pchelkin's verilog-uart (https://github.com/hell03end/verilog-uart)
//

 // states of state machine
`define IDLE        3'b010
`define START_BIT   3'b011
`define DATA_BITS   3'b100
`define WAIT_STOP   3'b101
`define STOP_BIT    3'b110

module UARTTransmitter #(
    parameter CLOCK_RATE = 50000000,
    parameter BAUD_RATE = 115200
)(
    input  wire       clk,      // clock
    input  wire       reset,    // reset
    input  wire       enable,   // TX enable
    input  wire       valid,    // start transaction
    input  wire [7:0] in,       // data to transmit
    output reg        out,      // TX line
    output reg        ready     // ready for TX
);
    parameter MAX_RATE_TX = $rtoi(CLOCK_RATE / BAUD_RATE + 0.5);
    parameter TX_CNT_WIDTH = $clog2(MAX_RATE_TX);
    reg [TX_CNT_WIDTH - 1:0] txCounter = 0;
    
    reg [2:0] state;        // FSM state
    reg [7:0] data;         // input byte
    reg [2:0] bitIndex;     // bit index

    always @(posedge clk) begin
        if (reset) begin
            ready <= 0;
            out <= 1; 
            bitIndex <= 3'b0;
            data <= 8'b0;
            state <= `IDLE;
            txCounter <= 0;
        end else if (enable & ready & valid) begin
            data    <= in; // latch input data
            ready   <= 1'b0;
            state   <= `START_BIT;
        end else if (txCounter < MAX_RATE_TX - 1) begin
            // TX baud generation
            txCounter <= txCounter + 1;
        end else begin
            txCounter <= 0;
            case (state)
                default: begin
                    state <= `IDLE;
                end
                
                `IDLE: begin
                    out <= 1; // drive line high
                    ready <= 1;
                    bitIndex <= 3'b0;
                    data <= 8'b0;
                end

                `START_BIT: begin
                    out <= 0; // send start bit (low)
                    state <= `DATA_BITS;
                end

                `DATA_BITS: begin // send data bits
                    out <= data[bitIndex];
                    if (&bitIndex) begin
                        bitIndex <= 3'b0;
                        state <= `STOP_BIT;
                    end else begin
                        bitIndex <= bitIndex + 1;
                    end
                end

                `STOP_BIT: begin // send stop bit (high)
                    out <= 1;
                    state <= `IDLE;
                end
            endcase
        end
    end

endmodule
