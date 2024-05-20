// This program was cloned from: https://github.com/ccattuto/tt07-serial-charmatrix
// License: Apache License 2.0

//
// Simple Verilog implementation of an UART receiver
//
//  - 8N1 only (8-bit data word, 1 start bit, 1 stop bit)
//  - "valid" goes high after successful RX and stays high for at least 1 clock cycle
//  - "valid" is cleared as soon as a high "ready" is detected
//  - internal baud rate generation
//  - 16x baud rate oversampling, majority voting over 3 samples for bit sensing
//  - buffered read: a new RX can start before the last byte has been read
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

module UARTReceiver #(
    parameter CLOCK_RATE = 50000000,
    parameter BAUD_RATE = 115200
)(
    input  wire       clk,      // clock
    input  wire       reset,    // reset
    input  wire       enable,   // enable
    input  wire       in,       // RX line
    input  wire       ready,    // OK to transmit
    output reg  [7:0] out,      // received data
    output reg        valid,    // RX completed
    output reg        error,    // frame error
    output reg        overrun   // overrun
);
    localparam RX_PERIOD_COUNT = $rtoi(CLOCK_RATE / (BAUD_RATE * 16) + 0.5); // 16x oversample
    localparam RX_COUNT_WIDTH = $clog2(RX_PERIOD_COUNT);
    reg [RX_COUNT_WIDTH-1:0] rxCounter;

    // state machine
    localparam RESET = 0, IDLE = 1, DATA_BITS = 2, STOP_BIT = 3;
    reg [1:0] state;

    reg [2:0] bitIndex;     // bit index
    reg [2:0] inputReg;     // shift reg for input signal
    reg [3:0] sampleCount;  // clock count for 16x oversample
    reg [7:0] data;         // input data buffer
    reg out_latched;        // out register is valid

    always @(posedge clk) begin
        if (reset || !enable) begin
            out <= 8'b0;
            error <= 0;
            overrun <= 0;
            valid <= 0;
            inputReg <= 3'b111;
            bitIndex <= 3'b0;
            sampleCount <= 4'b0;
            data <= 8'b0;
            out_latched <= 0;
            state <= RESET;
            rxCounter <= 0;
        end else if (rxCounter < (RX_PERIOD_COUNT - 1)) begin
            // RX baud generation
            rxCounter <= rxCounter + 1;
            if (out_latched) begin
                out_latched <= 0;
                valid <= 1;
            end else if (ready) begin
                valid <= 0;
            end
        end else begin
            rxCounter <= 0;

            inputReg <= { inputReg[1], inputReg[0], in };

            case (state)
                RESET: begin
                    out <= 8'b0;
                    error <= 0;
                    overrun <= 0;
                    valid <= 0;
                    inputReg <= 3'b111;
                    bitIndex <= 3'b0;
                    sampleCount <= 4'b0;
                    data <= 8'b0;
                    out_latched <= 0;
                    if (enable) begin
                        state <= IDLE;
                    end
                end

                IDLE: begin
                    if (sampleCount >= 4'h5) begin
                        state <= DATA_BITS;
                        bitIndex <= 3'b0;
                        sampleCount <= 4'b0;
                        data <= 8'b0;
                        out_latched <= 0;
                        error <= 0;
                        overrun <= 0;
                    end else if (!(|inputReg) || (|sampleCount)) begin
                        // Check bit to make sure it's still low
                        if (|inputReg) begin
                            error <= 1;
                            state <= RESET;
                        end
                        sampleCount <= sampleCount + 1;
                    end
                end

                // receive 8 bits of data
                DATA_BITS: begin
                    if (&sampleCount) begin
                        sampleCount <= 4'b0;
                        data[bitIndex] <= (inputReg[0] & inputReg[1]) | (inputReg[0] & inputReg[2]) | (inputReg[1] & inputReg[2]);
                        if (&bitIndex) begin
                            bitIndex <= 3'b0;
                            state <= STOP_BIT;
                        end else begin
                            bitIndex <= bitIndex + 1;
                        end
                    end else begin
                        sampleCount <= sampleCount + 1;
                    end
                end

                STOP_BIT: begin
                    if (&sampleCount) begin
                        if (&inputReg) begin
                            if (!valid) begin
                                out <= data;
                                out_latched <= 1;
                            end else begin
                                overrun <= 1;
                            end
                            state <= IDLE;
                        end else begin
                            error <= 1;
                            state <= RESET;
                        end
                    end
                    sampleCount <= sampleCount + 1;
                end

                default: begin
                    state <= RESET;
                end
            endcase
        end
    end

endmodule
